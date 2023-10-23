function [v_krogu, izven_kroga] = mcc_pi(n)

v_krogu=[];
izven_kroga=[];

x = rand(1, n)*2-1;
y = rand(1, n)*2-1;

for i=1:n
    if sqrt(x(i)^2 + y(i)^2) < 1
        v_krogu(1, end+1) = x(i);
        v_krogu(2, end) = y(i);
    else
        izven_kroga(1, end+1) = x(i);
        izven_kroga(2, end) = y(i);
    end
end