## Iterm

pip install itermplot
export MPLBACKEND="module://itermplot"

## Some useful styling
import matplotlib.style
import matplotlib as mpl
from matplotlib import pyplot as plt
import seaborn as sns
sns.set_style("ticks")

mpl.style.use('seaborn-colorblind')
mpl.rcParams.update({'font.size': 14, 'lines.linewidth': 2, 'figure.figsize': (6, 6/1.61)})
mpl.rcParams['grid.color'] = 'k'
mpl.rcParams['grid.linestyle'] = ':'
mpl.rcParams['grid.linewidth'] = 0.5
mpl.rcParams['lines.markersize'] = 6
mpl.rcParams['lines.marker'] = None
mpl.rcParams['axes.grid'] = True
COLORS = plt.rcParams["axes.prop_cycle"].by_key()["color"]

DEFAULT_FONTSIZE = 13
mpl.rcParams.update({'font.size': DEFAULT_FONTSIZE, 'lines.linewidth': 2, 
                     'legend.fontsize': DEFAULT_FONTSIZE, 'axes.labelsize': DEFAULT_FONTSIZE, 
                     'xtick.labelsize': DEFAULT_FONTSIZE, 'ytick.labelsize': DEFAULT_FONTSIZE, 'figure.figsize': (7, 7.0/1.4)})

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
ax.plot(D['lanczos_top_K'], D['F'], label="__nolabel__") 
ax.plot(H['acc'], label='_nolegend_', color=color)

## Rare ticks
import matplotlib.ticker as ticker
        if space_x != -1:
            ax.xaxis.set_major_locator(ticker.MultipleLocator(space_x))

## Save to file professionally
def _save_fig(path):
    plt.savefig(path,bbox_inches='tight', 
       transparent=True,
       pad_inches=0 )

## Good defaults
plt.rcParams['figure.figsize'] = (7,7)



