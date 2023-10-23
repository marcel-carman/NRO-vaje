
n=10;
r=[];
for i=1:5
    [v_krog, izven] = mcc_pi(n);
    [pi, napaka]=area_pi(v_krog, n);
    r(1, end+1) = pi;
    r(2,end) = napaka;
    n=n*10;
end
r

kroznica = @(z) deal(sin(z), cos(z));
[a,b] = kroznica(0:pi/50:2*pi);

plot(a,b,'black','LineWidth',5)
hold on
plot(v_krog(1,:),v_krog(2,:), 'y.', izven(1,:),izven(2,:), 'b.')
axis equal


function [pi_aproks, napaka] = area_pi(znotraj_kroga, n)
pi_aproks = 4 * size(znotraj_kroga, 2) / n;
napaka = abs(pi - pi_aproks);
end
