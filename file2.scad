minkowski(){
difference(){
    
union(){
    difference() {
        cylinder(h=8,r=5,center=true,$fn=600);
        cylinder(h=10,r=3,center=true,$fn=600);
    }
    for (i = [1:3]) {
        rotate([0,0,i*120]) translate([3,0,0]) cylinder(h=8,d=1,center=true,$fn=600);
    }
}

for (m=[0:10:100]) {
    translate([0,0,2+m*0.02]) cylinder(h=10,d1=5,d2=4.5+m/50,center=true,$fn=600);
}
}
sphere(r=0.1,$fn=2);
}