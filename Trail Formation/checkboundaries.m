function checkboundaries = checkboundaries(r,direction,world)
global Lx Ly stepsize;
r_new = round(r + stepsize*direction);
position = world(r_new(1,1),r_new(1,2)); %finds if r_new is inside the world or not
checkboundaries = 1;
if position==1
    checkboundaries=0;
end
