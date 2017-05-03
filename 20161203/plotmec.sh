#!/bin/bash

#gmtset BASEMAP_TYPE fancy

gmtset ANOT_FONT_SIZE 8p

gmtset LABEL_FONT_SIZE 8p

PS=mec.ps

R=104/109/35/42
col=red

#grdcut ~/gmtdir/grdfile/china.grd -Gtmp.grd -R$R -V

grd2cpt  tmp.grd -Cglobe -S0/4000/100 -Z > china.cpt

grdimage tmp.grd -R$R  -JM3i -Cchina.cpt  -B1WSen -K   > $PS

gawk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' normal.txt  | psmeca   -R -J -Sa0.5 -Gred   -Ewhite  -O -K -W1 -L1  -C1.2/red >> $PS
gawk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' slip.txt    | psmeca   -R -J -Sa0.6 -Gblue  -Ewhite  -O -K -W1 -L1  -C1.2/red >> $PS
gawk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' inv.txt     | psmeca   -R -J -Sa0.6 -Ggreen -Ewhite  -O -K -W1 -L1  -C1.2/red >> $PS
gawk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' slipdip.txt | psmeca   -R -J -Sa0.6 -Gblack -Ewhite  -O -K -W1 -L1  -C1.2/red >> $PS

echo 105.74 38.85 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS
echo 106.39 38.99 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS
echo 106.25 38.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS
echo 106.19 38.00 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS
echo 105.21 37.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS
echo 105.66 36.57 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS

echo 104.2 41.85 2.0 30  45 -90   2.0 104.2 41.85 | psmeca -R -J -Sa0.8 -Ggreen -Ewhite  -O -K -W1 -L1  -C >> $PS
echo 104.2 41.63 2.0 235 45  90   2.0 104.2 41.63 | psmeca -R -J -Sa0.8 -Gred   -Ewhite  -O -K -W1 -L1  -C >> $PS
echo 104.2 41.41 2.0 45  90  0    2.0 104.2 41.41 | psmeca -R -J -Sa0.8 -Gblue  -Ewhite  -O -K -W1 -L1  -C >> $PS
echo 104.2 41.19 2.0 180 90 -180  2.0 104.2 41.19 | psmeca -R -J -Sa0.8 -Gblack -Ewhite  -O -W1 -L1  -C >> $PS

ps2raster $PS -A -P -Tg



