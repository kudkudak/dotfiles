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

## Change tick size

ax = plt.gca()
ax.tick_params(labelsize=labelfontsize)

## Remove from legend
ax.plot(H['acc'], label='_nolegend_', color=color)

## Rare ticks
`

## Save to file professionally
def _save_fig(path):
    plt.savefig(path,bbox_inches='tight', 
       transparent=True,
       pad_inches=0 )


## Just dont do subsetting using matplotlib.
