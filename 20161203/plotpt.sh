#!/bin/bash

#gmtset BASEMAP_TYPE fancy

gmtset ANOT_FONT_SIZE 8p

gmtset LABEL_FONT_SIZE 8p

PS1=areaP.ps
PS2=areaT.ps
R=104/109/35/42
col=red

grdimage tmp.grd -R$R -JM3i -Cchina.cpt  -B1WSen -K   > $PS1

gawk '{print $1,$2,0.0,2,$3}' axispt.txt | psvelo -A0.03/0.0/0.01 -Sx0.25 -W/54/54/54  -J  -R  -V  -O -K >> $PS1

echo 105.74 38.85 0 2.0 52  | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS1
echo 106.25 38.50 0 2.0 6   | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS1
echo 106.19 38.00 0 2.0 8   | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS1
echo 105.66 36.57 0 2.0 23  | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS1

echo 105.74 38.85 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1
echo 106.39 38.99 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1
echo 106.25 38.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1
echo 106.19 38.00 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1
echo 105.21 37.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1
echo 105.66 36.57 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS1

pslegend -D108.5/42/1.5/2.4/TR -J -R -O  << EOF >>$PS1
S 0.1i - 0.1i 54/54/54 0.5p 0.2i 
S 0.1i - 0.1i black  1.8p 0.2i 
EOF

ps2raster $PS1 -A -P -Tg

##################################

grdimage tmp.grd -R$R -JM3i -Cchina.cpt  -B1WSen -K   > $PS2

gawk '{print $1,$2,0.0,2,$5}' axispt.txt | psvelo -A0.03/0.0/0.01 -Sx0.25 -W/54/54/54  -J  -R  -V  -O -K >> $PS2

echo 105.74 38.85 0 2.0 10 | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS2
echo 106.25 38.50 0 2.0 17 | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS2
echo 106.19 38.00 0 2.0  3 | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS2
echo 105.66 36.57 0 2.0  3 | psvelo -A0.08/0.0/0.01 -Sx0.25 -W/black -J  -R  -V  -O -K >> $PS2

echo 105.74 38.85 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2
echo 106.39 38.99 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2
echo 106.25 38.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2
echo 106.19 38.00 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2
echo 105.21 37.50 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2
echo 105.66 36.57 | psxy -R -J -Sc0.15 -W0.1/$col -G$col  -O -K   >> $PS2

pslegend -D108.5/42/1.5/2.4/TR -J -R -O  << EOF >>$PS2
S 0.1i - 0.1i 54/54/54 0.5p 0.2i 
S 0.1i - 0.1i black  1.8p 0.2i 
EOF

ps2raster $PS2 -A -P -Tg
