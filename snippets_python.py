# Start of training loop



def _run_epoch(train_mode, batch_gen, data_set_key, epoch, callbacks, model, optimizer, loss_fnc, metrics):
    if train_mode:
        model.train()
    else:
        model.eval()

    batch_idx = 0

    for x, y in tqdm.tqdm(batch_gen, total=len(batch_gen), desc='{} epoch {}'.format(data_set_key, epoch)):
        batch_logs = {
            "size": len(x)
        }

        if train_mode:
            for callback in callbacks:
                callback.on_batch_begin(batch_idx, logs=batch_logs)
            optimizer.zero_grad()

        output = model.forward(x)
        loss = loss_fnc(output, y)

        for m in metrics:
            batch_logs[m.__name__] = float(m(output, y))

        if train_mode:
            for callback in callbacks:
                callback.on_backward_end(batch_idx)
            optimizer.step()

        batch_logs['batch_info'] = {
            'loss': loss
        }

        for callback in callbacks:
            callback.on_batch_end(batch_idx, logs=batch_logs)

        batch_idx += 1


def run(model, config: dict, save_path: str):
    for epoch in range(starting_epoch, n_epochs):
        old_lr = lr
        lr = get_lr(optimizer)
        if lr != old_lr:
            logger.info("Learning Rate set to: {}".format(lr))

        for callback in callbacks:
            callback.on_epoch_begin(epoch, logs={})

        # run training epoch
        metrics, train_hist = run_epoch(True, train_batch_gen, 'train', epoch, callbacks, batches_per_epoch,
                                        model, optimizer, loss_fnc,
                                        include_histogram=True)
        display_metrics('Epoch {:3d}. train:'.format(epoch), 'train', metrics)

        pd.DataFrame(train_hist).to_csv(os.path.join(hist_save_dir, 'train_hist_{}.csv'.format(epoch)), index=False)

        # add current learning rate to logs
        metrics['lr'] = lr

        # run validation epoch for all validation sets
        for valid_key, valid_batch_gen, valid_batches_per_epoch in valid_batch_gens:
            valid_metrics, valid_hist = run_epoch(False, valid_batch_gen, valid_key, epoch, callbacks,
                                                  valid_batches_per_epoch, model, optimizer, loss_fnc,
                                                  include_histogram=True)

            if valid_key in ('random', 'valid'):
                display_metrics(valid_key, valid_key, valid_metrics)
                pd.DataFrame(valid_hist).to_csv(os.path.join(hist_save_dir, '{}_hist_{}.csv'.format(valid_key, epoch)),
                                                index=False)

            metrics = {**metrics, **valid_metrics}

            # monitor single validation step for early stopping
            if valid_key == monitor_set:

                valid_monitor_metric = metrics[monitor_full_metric]

                if (monitor_metric == 'loss' and valid_monitor_metric >= best_val_monitor_metric) or \
                        (monitor_metric != 'loss' and valid_monitor_metric <= best_val_monitor_metric):
                    no_progress_epochs += 1
                else:
                    no_progress_epochs = 0
                    best_val_monitor_metric = valid_monitor_metric

                # adjust learning rate based on monitor metric value
                # smaller loss = better. For other metrics it is usually greater = better
                adjusted_metric_value = valid_monitor_metric if 'loss' in monitor_metric else -valid_monitor_metric
                if isinstance(lr_scheduler, ReduceLROnPlateau):
                    lr_scheduler.step(metrics=adjusted_metric_value)

        for callback in callbacks:
            callback.on_epoch_end(epoch, logs=metrics)

        if epoch >= min_epochs and no_progress_epochs > early_stopping:
            logger.info("Early stopping based on {} after epoch {}".format(monitor_full_metric, epoch))
            break

    for callback in callbacks:
        callback.on_train_end(logs={})
