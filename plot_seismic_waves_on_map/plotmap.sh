#!/bin/zsh
#gmtset BASEMAP_TYPE fancy
gmtset ANOT_FONT_SIZE 6p
gmtset LABEL_FONT_SIZE 6p
gmtset BASEMAP_TYPE plain

PS=map.ps
R=130/132/31.5/34
PH=/home/aice/GMTDIR/GRD
J=M8c
I=0.01
stn=OIT009


psxy -R$R -J$J -T -K > $PS
psbasemap -J$J -R$R -B0.5WSen -K -O >> $PS
grdimage PGAH.grd -J -R  -CpgaH.cpt -K -O >> $PS
pscoast -R$R -J$J -B  -Df -W.01p -I1p -N1/1p -Slightblue -A5000 -K -O >> $PS
echo  130.754 32.791 7.0 224 66 -152 1.95 130.754 33 | psmeca -J$J -R$R -Sa1/8p/1c -Gred -Ewhite  -W2/red -L1  -C2/black  -O -K >> $PS

psxy -J$J -R$R -W0.5p,blue,-- -K -O -L >> $PS << EOF # rectangular
131.1216 32.9858
130.7071 32.6477
130.6382 32.7080
131.0527 33.0461
EOF

gawk '{print $3,$2,$4*0.0002}' PGAH.txt | psxy -R$R -J$J -Sti -W0.2/black   -O  -K >> $PS

echo 130.1 33.8 10 0 4 1 PGAH | pstext -J$J -R$R  -O -K -Gred >> $PS

saclst stlo stla kstnm f ${stn}.sac | awk '{print $2-0.2,$3,6,0,4,1,$4}' | pstext -R -J  -O -K -Wwhite -Gred >> $PS

shift=$(saclst stlo stla f ${stn}.sac | awk '{print $2,$3,$1}' | mapproject -J$J -R$R)
dx=`echo $shift | awk -F ' ' '{print $1}'`
dy=`echo $shift | awk -F ' ' '{print $2*0.93}'`
echo $dx $dy
pssac -JX1.5c/1.2c  -R15/60/0/2  -M0.4 -Ent  -Xa${dx}c -Ya${dy}c -K -O ${stn}.sac >> $PS
psscale  -CpgaH.cpt -D6.8c/1.5c/3/0.3 -B200/:"PGA(gal)": -O -K >> $PS

psxy -J$J -R$R -T -O >> $PS
ps2raster $PS -A -P -Tf
ps2raster $PS -A -P -Tg


