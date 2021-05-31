function Trl_pot=Trl_pot(r,Grnd_pot,v)
global Lx Ly;
smelldist = 30; %smalldist is the  distance upto which ants can maximally detect the pheromone
Trl_pot = 0;
%so we are adding the ground potential to get the trail potential
for i = -smelldist:smelldist 
    for j = -smelldist:smelldist
    xy = r+[i,j];
    x = xy(1); y=xy(2);
    Trl_pot = Trl_pot+Grnd_pot(round(x),round(y));
    end
end
