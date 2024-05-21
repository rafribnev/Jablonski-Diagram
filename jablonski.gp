set terminal png
set output "jablonski.png"



#EDIT HERE#
set title "Diagrama de Jablonski"
set ylabel "E(kJ/mol)"
#CHANGE conv= TO THE CONVERTION FACTOR IF UNIT IS ALTERED#
set yrange [-5:210]
#change yrange in the way you like, make sure it the energy info is showing (in the negative y axis) 
###################################################


set xrange [0:19]
set format y "%.1f"
set ytics nomirror
unset xtics
unset key
set border 2


#EDIT HERE#
#CONVERSION FACTOR: hartree=1 kcal/mol=627.509 kJ/mol=2625.5 eV=0.03675 cm-1=4.556e-6
conv=2625.5
s1c=0.07019
s1t=0.04599
t1=0.04416
deltae=0.024171
##########################################

set style line 1 lc rgb 'red' lt 1 lw 1.8 pt 6 pi -1 ps 0.5
set style line 2 lc rgb 'coral' lt 1 lw 1.8 pt 6 pi -1 ps 0.5
set style line 3 lc rgb 'orange' lt 1 lw 1.8 pt 6 pi -1 ps 0.5
set style line 4 lc rgb 'green' lt 1 lw 1.8 pt 6 pi -1 ps 0.5
set style line 5 lc rgb 'cyan' lt 1 lw 1.8 pt 6 pi -1 ps 0.5
set style line 6 lc rgb 'blue' lt 1 lw 1.8 pt 6 pi -1 ps 0.5


set label 1 "S_{0E}" at 1,(0+0.0001*conv)
set label 2 "S_{1E}" at 1,(s1t*conv+0.0001*conv)
set label 3 "T_1" at 6,(t1*conv-0.003*conv)
set label 4 "S_{0Z}" at 12.2,(deltae*conv-0.0001*conv)
set label 5 "S_{1Z}" at 12.2,(s1c*conv-0.0001*conv)
set label "S_{nE}" at 1,(s1t*conv+0.01*conv)
set label "k_{ISC}" at 6.2,((s1t+t1)/2*conv+0.003*conv) right rotate by 0
set label "k_{ISC}'" at 8.75,((t1+deltae)/2*conv+0.003*conv) right rotate by 0
set label sprintf("E_{Trans->Cis} = %.3f", (deltae*conv)) at 14,(0.050*conv)
set label sprintf("E_{S_0->S_1 trans} = %.3f", (s1t*conv)) at 14,(0.045*conv)
set label sprintf("E_{S_0->S_1 cis} = %.3f", (s1c*conv)) at 14,(0.040*conv)
set label sprintf("E_{T_1} = %.3f", (t1*conv)) at 14,(0.035*conv)




set arrow 1 lw 1.8 from 3,0 to 3,(s1t*conv+0.0098*conv)
set arrow 2 lw 1.8 from 3.2,(s1t*conv+0.0098*conv) to 3.2,(s1t*conv)
set arrow 3 ls 1 from 4.01,(s1t*conv-0.0001*conv) to 5.99,(t1*conv-0.0001*conv)
#set arrow 4 ls 1 from 7,(s1t*conv-0.0001*conv) to 7,(t1*conv-0.0002*conv)
set arrow 5 ls 6 from 8.01,(t1*conv-0.0002*conv) to 9.99,(deltae*conv-0.0002*conv)
#set arrow 6 ls 6 from 11.0,(t1*conv-2) to 11.0,(s1c*conv)
#set arrow 7 ls 6 from 11.5,(t1*conv-2) to 11.5,(deltae*conv)

plot "jablonski.dat" u 2:1 w lines lw 1.8 lc black,\
"" u 4:($3*conv) w lines lw 1.8 lc black,\
"" u 4:($3*conv+0.01*conv) w lines lw 1.8 lc black,\
"" u 6:($5*conv) w lines lw 1.8 lc black,\
"" u 8:($7*conv) w lines lw 1.8 lc black,\
"" u 10:($9*conv) w lines lw 1.8 lc black



