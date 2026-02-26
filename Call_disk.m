clear all
close all

%%%The script generates stresses for a TPE inclusion 
%%% with a given potency (function of p and T changes)
%%% Input parameters are in S.I.
%%% Results are saved in "CaseTEST.mat"
%%% Massimo Nespoli March 2025

%%%%%%INPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H=10.1*10^9;               % Poroelastic parameter
alfa=3*10^(-5);          % Thermal expansion of solid
dp=10e6;                 % Pore pressure change inside the inclusion
dT=100;                  % Temperature change inside the inclusion
a=2550;                  % Disk radius
db=500;                  % Disk height 
mu=6*10^9;               % Shear modulus
lambda=4*10^9;           % Lamè constant
MedianPlane=1825;        % TPE inclusion, depth   of median plane  
limiteplot=8000;         % Limit in plot (max(x))
k=25;                     % Step for plot in x axis
Zmin=0;                  % Min z axis for computation
Zmax=4000;               % Max z axis for computation
Zstep=25;                 % Step for plot in z
eta=10^16;               % Viscosity for the visco-elastic computation
TV=4;                    % First normalized time t/tau, tau=eta/mu
TV2=2;                   % Second normalized time t/tau, tau=eta/mu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plotshow=1;
ni=lambda/(2*(lambda+mu));
Zetav=Zmin:Zstep:Zmax;

for i=1:length(Zetav)
    
    disp(i)
    zlm=Zetav(i);
[xA(i,:),e11A(i,:),e22A(i,:),e33A(i,:),u1A(i,:),u3A(i,:),e111veA(i,:),e221veA(i,:),e331veA(i,:),ux1veA(i,:),uz1veA(i,:),e112veA(i,:),e222veA(i,:),e332veA(i,:),ux2veA(i,:),uz2veA(i,:),tau11ve(i,:),tau22ve(i,:),tau33ve(i,:),tau111ve(i,:),tau221ve(i,:),tau331ve(i,:),tau112ve(i,:),tau222ve(i,:),tau332ve(i,:),e13A(i,:),e131veA(i,:),e132veA(i,:),tau13veA(i,:),tau131veA(i,:),tau132veA(i,:)]=TPE_SOLUTIONS_TOTAL_new2(H,alfa,dp,dT,a,db,ni,mu,lambda,MedianPlane,limiteplot,zlm,k,eta,TV,TV2);

x(i,:)=xA(i,:);
z(i,1:length(x(1,:)))=zlm;
end

figure()
plot(x(plotshow,:),-u3A(plotshow,:),x,u1A(plotshow,:));
hold on
plot(x(plotshow,:),-uz2veA(plotshow,:),x(plotshow,:),ux2veA(plotshow,:));
plot(x(plotshow,:),-uz1veA(plotshow,:),x(plotshow,:),ux1veA(plotshow,:));
legend('-uz','ux','-uzve (\tau =0.5)','uxve (\tau =0.5)','-uzve (\tau =2)','uxve (\tau =2)');
title('Displacement');
xlabel(' x (m)');
ylabel(' Displacement (m)');
xlim([0 8000]);
set(gca,'FontSize',12)
set(gca, 'FontName', 'Times');

figure()
plot(x(plotshow,:),e11A(plotshow,:),x(plotshow,:),e22A(plotshow,:),x(plotshow,:),e33A(plotshow,:),x(plotshow,:),e13A(plotshow,:));
hold on
plot(x(plotshow,:),e112veA(plotshow,:),x(plotshow,:),e222veA(plotshow,:),x(plotshow,:),e332veA(plotshow,:),x(plotshow,:),e132veA(plotshow,:));
plot(x(plotshow,:),e111veA(plotshow,:),x(plotshow,:),e221veA(plotshow,:),x(plotshow,:),e331veA(plotshow,:),x(plotshow,:),e131veA(plotshow,:));

legend('e11','e22','e33','e13','e11ve (\tau =0.5)','e22ve (\tau =0.5)','e33ve (\tau =0.5)','e13ve (\tau =0.5)','e11ve (\tau =2)','e22ve (\tau =2)','e33ve (\tau =2)','e13ve (\tau =2)');
title(' Deformation');
xlabel(' x (m)');
ylabel(' e_{ij}');
set(gca,'FontSize',12)


 set(gca, 'FontName', 'Times')


figure()
plot(x(plotshow,:),tau11ve(plotshow,:),x(plotshow,:),tau22ve(plotshow,:),x(plotshow,:),tau33ve(plotshow,:),x(plotshow,:),tau13veA(plotshow,:));
hold on
plot(x(plotshow,:),tau112ve(plotshow,:),x(plotshow,:),tau222ve(plotshow,:),x(plotshow,:),tau332ve(plotshow,:),x(plotshow,:),tau132veA(plotshow,:));
plot(x(plotshow,:),tau111ve(plotshow,:),x(plotshow,:),tau221ve(plotshow,:),x(plotshow,:),tau331ve(plotshow,:),x(plotshow,:),tau131veA(plotshow,:));

legend('\tau 11','\tau 22','\tau 33','\tau 13','\tau 11ve (\tau =0.5)','\tau 22ve (\tau =0.5)','\tau 33ve (\tau =0.5)','\tau 13ve (\tau =0.5)','\tau 11ve (\tau =2)','\tau 22ve (\tau =2)','\tau 33ve (\tau =2)','\tau 13ve (\tau =2)');
title(' Stress');
xlabel(' x (m)');
ylabel(' \Sigma_{ij}');
ylim([-3e7 2e7]);
xlim([0 8000]);
set(gca,'FontSize',12)


 set(gca, 'FontName', 'Times')


figure()
plot(x,(e11A+e22A+e33A),x,(e112veA+e222veA+e332veA),x,(e111veA+e221veA+e331veA));
legend('e _{kk} (\tau =0)','e_{kk} ve  (\tau =0.5)','e_{kk} ve (\tau =2)');
title(' Dilation (e_{kk})');
xlabel(' x (m)');
ylabel(' e_{kk}');
xlim([0 8000]);
set(gca,'FontSize',12)


 set(gca, 'FontName', 'Times')

figure()
 plot(x,tau11ve-1/3*(tau11ve+tau22ve+tau33ve),x,tau22ve-1/3*(tau11ve+tau22ve+tau33ve),x,tau33ve-1/3*(tau11ve+tau22ve+tau33ve),x,tau13veA);
 hold on
 plot(x,tau112ve-1/3*(tau112ve+tau222ve+tau332ve),x,tau222ve-1/3*(tau112ve+tau222ve+tau332ve),x,tau332ve-1/3*(tau112ve+tau222ve+tau332ve),x,tau132veA);
 plot(x,tau111ve-1/3*(tau111ve+tau221ve+tau331ve),x,tau221ve-1/3*(tau111ve+tau221ve+tau331ve),x,tau331ve-1/3*(tau111ve+tau221ve+tau331ve),x,tau131veA);
 legend('\tau 11','\tau 22','\tau 33','\tau 13','\tau 11ve (\tau =0.5)','\tau 22ve (\tau =0.5)','\tau 33ve (\tau =0.5)','\tau 13ve (\tau =0.5)','\tau 11ve (\tau =2)','\tau 22ve (\tau =2)','\tau 33ve (\tau =2)','\tau 13ve (\tau =2)');

title(' Deviatoric stress');
xlabel(' x (m)');
ylabel(' \Sigma_{ij}');
xlim([0 8000]);
set(gca,'FontSize',12)


save CaseTEST
