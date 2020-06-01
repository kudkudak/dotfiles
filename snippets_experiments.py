    ## Pick best hps based on pandas of loaded values

    D_tuned = []
    for group_name, D_group in D.groupby("group"):
        D_group_mean_val = D_group.groupby("C_hash").aggregate(['mean', 'std'])
        best_C_hash = D_group_mean_val['val_score']['mean'].idxmax()
        best_C_hash_test = D_group_mean_val.loc[best_C_hash]['test_score']['mean']
        best_C_hash_test_std = D_group_mean_val.loc[best_C_hash]['test_score']['std']
        name = D[D['C_hash'] == best_C_hash]['name'].iloc[0]
        best_C_hash_val = D_group_mean_val.loc[best_C_hash]['val_score']['mean']
        best_C_sweep_value = D_group_mean_val.loc[best_C_hash]['sweep_value']['mean']
        mean_val_score = np.mean(D_group_mean_val['val_score']['mean'])
        D_tuned.append({"group": group_name, "name": name, "C_hash": best_C_hash, "sweep_value": best_C_sweep_value,
                        "test_score": best_C_hash_test, "test_score_std": best_C_hash_test_std, "val_score": best_C_hash_val, "mean_val_score": mean_val_score})
    D_tuned = pd.DataFrame(D_tuned)
    print(D_tuned)
