% This function find the euclidean distance between the two points in the
% 2-D coordinate system : (x1,y1) , (x2,y2)
function f = distance(x1,y1,x2,y2)
    f = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
end
