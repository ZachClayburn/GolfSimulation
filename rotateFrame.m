function R = rotateFrame(R,ang)
[~, columns] = size(R);

if columns == 1
   R = rotateTo(R,ang);
else
    R = rotateBack(R, ang);
end
    

function R = rotateTo(R,ang)
rotate = [cos(ang) 0 sin(ang); 0 1 0; -sin(ang) 0 cos(ang)];

R((1):(3),1) = rotate * R((1):(3),1);

function R = rotateBack(R,ang)
rotate = [cos(ang) 0 -sin(ang); 0 1 0; sin(ang) 0 cos(ang)];

for x = 0:3
   R(:,(1+x*3):(3+x*3)) =  R(:,(1+x*3):(3+x*3))*rotate;
end

