R = 0.2871;
m = 5;
VL = 10;
%Defined Temperatures
Th = 373; %K
Tc = 273; %K
Tm = (Th + Tc)/2;

%Defined Volume Delta
V1 = 200;
V2 = 150;

Tv1 = linspace(Tc, Tm, VL); % Temp low -> Adiabatic transformation
Tv2 = linspace(Tm, Th, VL); % Temp high -> Adiabatic transformation
Vv1 = linspace(V2, V1, VL);

Thigh = zeros(1, 10) + Th;
Tlow = zeros(1, 10) + Tc;

%Ideal gases law
p = @(T,V) m*R*T./V;

%P-v Diagram
figure('DefaultAxesFontSize',12)
set(0,'DefaultTextFontSize',12)
plot(Vv1, p(Tv1,Vv1), '-k', 'LineWidth',2) %adiabatic
hold on
plot(Vv1, p(Thigh, Vv1), '-r', 'LineWidth',2); %isotherm
plot(Vv1, p(Tv2,Vv1), '-k', 'LineWidth',2) %adiabatic
plot(Vv1, p(Tlow, Vv1), '-r', 'LineWidth',2);%isotherm

%adiabatic
plot(Vv1(1)*[1 1], p([Tv1(1) Tv1(end)],[1 1]*Vv1(1)), '-k', 'LineWidth',2)
plot(Vv1(end)*[1 1], p([Tv2(1) Tv2(end)],[1 1]*Vv1(end)), '-k', 'LineWidth',2)

%isotherm
plot(Vv1(1)*[1 1], [p(Tc, Vv1(1)), p(Th, Vv1(1))], '-r', 'LineWidth',2)
text(mean(Vv1), p(Tc, mean(Vv1))+0.05, 'T cold');
plot(Vv1(end)*[1 1], [p(Tc, Vv1(end)), p(Th, Vv1(end))], '-r', 'LineWidth',2)
text(mean(Vv1), p(Th, mean(Vv1))+0.05, 'T hot');


%adiabatic
plot(V1, min(p(Tv1,Vv1)), 'k.', 'MarkerSize', 23) %POINT 1
text(V1+2, min(p(Tv1,Vv1)), '1');
plot(V2, max(p(Tv1,Vv1)), 'k.', 'MarkerSize', 23) %POINT 2
text(V2-3, max(p(Tv1,Vv1)), '2');
plot(V2, max(p(Tv2,Vv1)), 'k.', 'MarkerSize', 23) %POINT 3
text(V2-3, max(p(Tv2,Vv1)), '3');
plot(V1, min(p(Tv2,Vv1)), 'k.', 'MarkerSize', 23) %POINT 4
text(V1+2, min(p(Tv2,Vv1)), '4', 'FontSize',12);

%isotherm
plot(V1, min(p(Tlow,Vv1)), 'r.', 'MarkerSize', 23) %POINT 1
text(V1+2, min(p(Tlow,Vv1)), '1');
plot(V2, max(p(Tlow,Vv1)), 'r.', 'MarkerSize', 23) %POINT 2
text(V2-3, max(p(Tlow,Vv1)), '2');
plot(V2, max(p(Thigh,Vv1)), 'r.', 'MarkerSize', 23) %POINT 3
text(V2-3, max(p(Thigh,Vv1)), '3');
plot(V1, min(p(Thigh,Vv1)), 'r.', 'MarkerSize', 23) %POINT 4
text(V1+2, min(p(Thigh,Vv1)), '4');

set(gca,'XTick',[], 'YTick', []) 
hold off
grid
xlabel('V')
ylabel('p')
axis([135  215    1.7  3.8])
legend('adiabatic', 'isotherm')
