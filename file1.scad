minkowski(){
union(){
linear_extrude(height=88,twist=240){
    intersection(){
    make_ring_of(radius = 38.16/2, count = 6)
        square([5,0.8],center=true);
    circle(d=38.96);
    }
}
linear_extrude(height=88,twist=-240){
    intersection(){
    rotate([0,0,30]){
    make_ring_of(radius = 38.16/2, count = 6)
        square([5,0.8],center=true);
    }
    circle(d=38.96);
    }
}
circle(d=38.96);
}
sphere(d=0.8);

}

module make_ring_of(radius, count) {
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}