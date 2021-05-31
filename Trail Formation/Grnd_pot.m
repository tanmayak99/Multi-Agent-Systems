function [G0,G1]=Grnd_pot(r,t,G0i,G1i,direction,n)
global Lx Ly stepsize;
T = 10000; %lifetime of the pheromone
q0=500; %Amount of pheromone deposited
b0 = 0.08;%Deposition decay parameters
Go = 0;
dG11 = sparse(zeros(Lx,Ly)); dG10 = sparse(zeros(Lx,Ly)); dG00=0; dG01=0;
for ii=1:n
    x = r(ii,1); y= r(ii,2);
    if r(ii,3)==0
        t0 = r(ii,4);
        if t-t0 == 1
            dG10(round(x),round(y)) = q0*exp(-b0*(t-t0));
        elseif t-t0>1
            for i = 1:stepsize
                dG10(round(x),round(y)) = q0*exp(-b0*(t-t0));
                x = r(ii,1)-i*direction(ii,1);
                y = r(ii,2)-i*direction(ii,2);
            end
        end
        dG00=1/T*(Go-G0i);
    elseif r(ii,3)==1
        t0 = r(ii,5);
        if t-t0 == 1
            dG11(round(x),round(y)) = q0*exp(-b0*(t-t0));
        elseif t-t0>1
        for i = 1:stepsize
            dG11(round(x),round(y)) = q0*exp(-b0*(t-t0));
            x = r(ii,1)-i*direction(ii,1);
            y = r(ii,2)-i*direction(ii,2);
        end
        end
    dG01=1/T*(Go-G1i);
    end
end
G0=sparse(G0i+dG00+dG10);
G1=sparse(G1i+dG01+dG11);
