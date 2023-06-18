function [insec, check] = insection3D(line1Start, line1End, line2Start, line2End)

figure
plot3([line1Start(1), line1End(1)], [line1Start(2), line1End(2)], [line1Start(3), line1End(3)], 'r:','linewidth',2);
hold on
plot3([line2Start(1), line2End(1)], [line2Start(2), line2End(2)], [line2Start(3), line2End(3)], 'b','linewidth',2);
hold on
A = [line1End - line1Start, line2Start - line2End];
b = line2Start - line1Start;
x = A \ b;
d1 = line1End - line1Start;
d2 = line2End - line2Start;
normal = cross(d1, d2);

if dot(normal, (line2Start - line1Start)) == 0
    insec = line1Start + x(1) * (line1End - line1Start);
    check = true;
else
    insec = [];
    check = false;

end
plot3(insec(1), insec(2), insec(3), 'mo', 'markersize', 8, 'markerfacecolor', 'm');
axis equal
axis on
grid on
view(-50, 20);

end
