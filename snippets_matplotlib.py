## Iterm

pip install itermplot dropbox
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


## Ticks formatter
   fmt = {}
                strs = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh']
                for l, s in zip(CS2.levels, strs):
                    fmt[l] = str(int(l)) + "%"
                ax.clabel(CS2, inline=1, fmt=fmt) 


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

plt.plot([1,2,3,4,5])
labels = [item.get_text() + "LX" for item in ax.get_xticklabels()]
ax = plt.gca()
ax.set_xticklabels(labels)

## More beautiful errorbars
markers, caps, bars = plt.errorbar(D_plot['sweep_value_mean'], D_plot[metric]['mean'], capsize=2, yerr=D_plot[metric]['std'], label=sweep, marker='d')
[bar.set_alpha(0.5) for bar in bars]
[cap.set_alpha(0.5) for cap in caps]

## Automatically change markers

import itertools
ax = plt.gca()
for l, ms in zip(ax.lines, itertools.cycle('>^+*')):
    l.set_marker(ms)
    

## Save legend as a separate image
import pylab, numpy 
x = numpy.arange(10)
# create a figure for the data
figData = pylab.figure()
ax = pylab.gca()
for i in range(3):
    pylab.plot(x, x * (i+1), label='line %d' % i)
# create a second figure for the legend
n_items = 3
figLegend = pylab.figure()
pylab.figlegend(*ax.get_legend_handles_labels(), loc = 'upper left', ncol=n_items)
# # save the two figures to files
figData.Savefig("plot.png")
figLegend.savefig("legend.png")
### OR
# Plot legend using a dumm plot
for E, H, C in zip(Es, Hs, Cs):
    plt.plot([1],[1], label=E_to_label(E))
ax = plt.gca()
figLegend = plt.figure()  # figsize=(3 * len(Es), 2))
plt.figlegend(*ax.get_legend_handles_labels(), loc='upper left', ncol=len(Es))
# Save, do not pass tight - it cuts out part of the legend (not sure why)
save_fig(EXPERIMENT_DIR, f"{prefix}_legend.pdf")
plt.show()
plt.close()



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

## Norming img for plotting

def norm_img(x):
    x = x.copy()
    x -= x.min()
    x /= x.max()
    x *= 255
    x = x.squeeze()
    return x.astype("ubyte")

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


# How tto draw arrows

for i in np.argsort(val_accs)[::-1][0:3]:
    dx = np.random.uniform(0, 1)
    dy = np.random.uniform(0, 1)
    ax.annotate(val_accs[i], xy=(x_values[i], y_values[i]), xytext=(x_values[i]+dx, y_values[i]+dy),
                xycoords='data', textcoords='data',
                arrowprops=dict(facecolor='red', shrink=0.05),
                )


## Bar

import pylab as pl
import numpy as np

a = np.array([[0,scale_y*100]])
pl.figure(figsize=(1.0, 9.0))
img = pl.imshow(a, cmap="coolwarm")
pl.gca().set_visible(False)
cax = pl.axes([0.1, 0.2, 0.8, 0.6])
pl.colorbar(cax=cax, orientation='vertical')
ax = plt.gca()
plt.ylabel("malignancy probability (%)", fontsize=20)
ax.tick_params(labelsize=20)
plt.savefig("tsne_reader_study_viewsplit_colorbar.pdf".format(which),bbox_inches='tight', 
       transparent=True, pad_inches=0 )

