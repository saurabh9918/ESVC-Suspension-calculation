%suspension calculation
%front wheel
Wf=0.55*0.5*450*9.81;  %normal load on front wheel at static condition
Msf=0.55*0.5*380; %sprung mass front
fr=1.5; %front ride rate
Mrf=1.428; %front motion ratio
Ksf=4*pi*pi*fr*fr*Msf*Mrf*Mrf; %spring constant of spring
theta=9.77*pi/180; %inclination of lower control arm from vertical in radians
thetao=  ;  %inclination of damper fron vertical perpendicular to lower control arm in radians
B= ; %distance of lower control arm from lower ride point on chassis horizontal
D= ; %distance of wheel centre from lower ride point on chassis horizontal
C= ; %distance of attachement of lower control arm on upright to lower ride point on chassis horizontal
A=(B*D)/(Mrf*C) ; %distance of spring installation point on lower control arm from lower ride point on chassis horizontal
l1= ; %horizontal distance from point of lower control arm on upright to lower ride point on chassis
x=l1-A;
insag=[(Wf*cos(theta))/(Ksf*cos(thetao))]*(1+((0.8+x)/A)); %initial sag of spring 
Fvmax= ; %maximum vertical load on wheel during acceleration,braking,cornering
sag1= [(Fvmax*cos(theta))/(Ksf*cos(thetao))]*(1+((0.8+x)/A) %sag at maximum vertical load
Kwf=Ksf/(Mrf*Mrf); %front wheel Rate
z=140; %maximum wheel travel
zs=z/(Mrf); %spring travel at maximum wheel travel
sagmax=max(zs,sag1); %maximum sag of spring
freelength= sagmax+insag; %total travel of spring
tw=1778; %front track width in mm
nff=((Kwf/Mrf)^(0.5))*(1/(2*pi)); %front natural frequency
krf=(pi/360)*tw*tw*Kwf; %roll rate front in Nm/deg
krrf=(Ksf*Kwf)/(Ksf+Kwf); %ride rate front
%rear wheel
Wr=0.45*0.5*450*9.81;  %normal load on Rear wheel at static condition
Msr=0.45*0.5*380; %sprung mass rear
frr=1.65; %rear ride rate
Mrr=1.2; %rear motion ratio
Ksr=4*pi*pi*frr*frr*Msr*Mrr*Mrr; %spring constant of spring
thetar=9.77*pi/180; %inclination of lower control arm from vertical in radians
thetaor=    %inclination of damper fron vertical perpendicular to lower control arm in radians
Br= ; %distance of lower control arm from lower ride point on chassis horizontal
Dr= ; %distance of wheel centre from lower ride point on chassis horizontal
Cr= ; %distance of attachement of lower control arm on upright to lower ride point on chassis horizontal
Ar=(Br*Dr)/(Mrr*Cr) ; %distance of spring installation point on lower control arm from lower ride point on chassis horizontal
l1r= ; %horizontal distance from point of lower control arm on upright to lower ride point on chassis
xr=l1r-Ar;
insagr=[(Wr*cos(thetar))/(Ksr*cos(thetaor))]*(1+((0.8+xr)/Ar)); %initial sag of spring 
Fvmaxr= ; %maximum vertical load on wheel during acceleration,braking,cornering
sag1r= [(Fvmaxr*cos(thetar))/(Ksr*cos(thetaor))]*(1+((0.8+xr)/Ar) %sag at maximum vertical load
Kwr=Ksr/(Mrr*Mrr); %rear wheel Rate
zr=140; %maximum wheel travel
zsr=zr/(Mrr); %spring travel at maximum wheel travel
sagmaxr=max(zsr,sag1r); %maximum sag of spring
freelengthr= sagmaxr+insagr; %total travel of spring
nfr=((Kwr/Mrr)^(0.5))*(1/(2*pi)); %rear natural frequency
krr=(pi/360)*tw*tw*Kwr; %roll rate rear in Nm/deg
krrr=(Ksr*Kwr)/(Ksr+Kwr); %ride rate rear
%calculation common to both the wheel
Hr=195.96; %height of roll axis from ground at cg in mm
Hcg=582.93; %height of cg from ground in mm
H=Hcg-Hr; %distance of roll axis from cg in mm
W=450; %total weight of vehicle in kg
dg=(W*H)/(krf+krr); %roll rate of vehicle in deg/g
dgr= ; %required roll rate in deg/g
kdes=(W*H)/(dgr); %desired roll stifness of vehicle in Nm/deg
ktf=100000; %Front tire stifness in N/m
ktr=ktf; %rear tire stifness in N/m
karbf=[(pi/180)*((kdes*ktf*(tw*tw/2))/((pi/180)*ktf*(tw*tw/2)-kdes)]-((pi/180)*kwf*(tw*tw/2)); %required total stiffness of front anti roll bar
karbr=[(pi/180)*((kdes*ktr*(tw*tw/2))/((pi/180)*ktr*(tw*tw/2)-kdes)]-((pi/180)*kwr*(tw*tw/2)); %required total stiffness of Rear anti roll bar
%calculation releated to need of third spring
%front part of vehicle
klss=Kwf;
krss=Kwf;
Mrls=Mrf;
Mrrs=Mrf;
Mrr= ; %motion ratio of third spring if uses
krs=[4*pi*pi*fr*Msf-(klss/(Mrls*Mrls))-(krss/(Mrrs*Mrrs))]*Mrr*Mrr; %third spring rate front in N/m
%rear part of vehicle
klssr=Kwr;
krssr=Kwr;
Mrlsr=Mrr;
Mrrsr=Mrr;
Mrrr= ; %motion ratio of third spring if uses
krsr=[4*pi*pi*frr*Msr-(klssr/(Mrlsr*Mrlsr))-(krssr/(Mrrsr*Mrrsr))]*Mrrr*Mrrr; %third spring rate front in N/m
%other informations
hchf=191.008; %height of front roll centr from ground in mm
hchr=202.0062; %height of rear roll centre from ground in mm
%pitch calculation
Ax=1.5625; %maximum acceleration of vehicle 
ms=380; %total sprung mass of the vehicle
m=450; %total mass of the vehicle
hs= ; %height of cg of sprung mass of vehicle from ground in mm
Mtxs=ms*hs*Ax; %longitudnal load transfer during acceleration 
a=982.98; %distance of front axle from cg horizontal in mm
b=1201.42; %distance of rear axle from cg horizontal in mm
ktp=2*a*a*ktf+2*b*b*ktr; %pitch stifness of tire
ksp=2*a*a*Kwf+2*b*b*Kwr; %pitch stifness of suspension
thetau=Mtxs/ktp; %unsprung mass pitch angle
thetas=Mtxs/ksp; %pitch due to no anti effect
thetafull= thetau+thetas; %total pitch angle of body
