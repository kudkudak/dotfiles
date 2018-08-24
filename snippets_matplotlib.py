## Colorer

def _construct_colorer(sorted_vals, cmap="coolwarm"):
    cm = plt.get_cmap(cmap, len(sorted_vals))
    
    N =float(len(sorted_vals))
    
    def _get_cm(val):
        return cm(sorted_vals.index(val)/N)
    
    return _get_cm

def _construct_colorer_lin_scale(vmin, vmax, ticks=20, cmap="coolwarm"):
    assert vmax > vmin
    
    cm = plt.get_cmap(cmap, ticks)
    
    def _get_cm(val):
#         assert val <= vmax
#         assert val >= vmin
        alpha= (val - vmin)/float((vmax - vmin))
        tick = int(alpha * ticks)
        tick = min(tick, ticks - 1)
        return cm(tick)
    
    return _get_cm

## Tricks for plots

ax.set_xticks(np.arange(0,1,1,0.1))
for xtick in ax.xaxis.get_ticklines()[1::2]: ### Hiding ticks each 2 steps.
    xtick.set_visible(False)     
ax.set_xticklabels(np.arange(0,1,1,0.2),fontsize = 14)

## Automatically change markers

import itertools
ax = plt.gca()
for l, ms in zip(ax.lines, itertools.cycle('>^+*')):
    l.set_marker(ms)
    
## Plot on OS

import matplotlib
matplotlib.use('TkAgg') 
import matplotlib.pylab as plt

## Plot from cmdline

matplotlib.use('Agg')
import matplotlib.pylab as plt

## Change tick size

ax = plt.gca()
ax.tick_params(labelsize=labelfontsize)

## Remove from legend
ax.plot(H['acc'], label='_nolegend_', color=color)

## Rare ticks
# TODO

## Save to file professionally
def _save_fig(path):
    plt.savefig(path,bbox_inches='tight', 
       transparent=True,
       pad_inches=0 )



