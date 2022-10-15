// TODO: remove middle section from cutout cylinders (create two inline cylinders)

$fn=120;

difference(){
polyhedron(
  points=[
    [170,-7.7,0],
    [170,7.7,0],
    [16,15.4,0], 
    [16,-15.4,0],
    [16,-15.4,15.4],
    [16,15.4,15.4],
    [0,15.4,15.4],
    [0,-15.4,15.4],
    [0,-15.4,0],
    [0,15.4,0]
  ], faces=[
    [0,3,4],
    [3,8,7,4],
    [8,9,6,7],
    [9,2,5,6],
    [6,5,4,7],
    [2,1,5],
    [1,0,4,5],
    [8,3,2,9],
    [3,0,1,2]
]);

for (i=[2:2:150]){
  translate([170-i,0,0.1*i+0.06]) rotate([90,0,0]) cylinder(h=40,r=0.1,center=true);
}
for (i=[1:1:15]){
  translate([170-10*i,0,i]) rotate([90,0,0]) cylinder(h=40,r=0.12,center=true);
}
for (i=[1:1:7]){
  for (j=[-((i-1)%5+1):2:((i-1)%5)]){
    translate([169.2-20*i,j+1,2*i+0.2]) sphere(0.42);
  }
}
translate([169.2-10,-6,1.2]) sphere(0.32);
translate([169.2-10,6,1.2]) sphere(0.32);

translate([169.2-30,-7,3.2]) sphere(0.32);
translate([169.2-30,7,3.2]) sphere(0.32);

translate([169.2-50,-8.7,5.1]) sphere(0.48);
translate([169.2-50,-7.3,5.1]) sphere(0.48);
translate([169.2-50,7.3,5.1]) sphere(0.48);
translate([169.2-50,8.7,5.1]) sphere(0.48);

translate([169.2-70,-9,7.2]) sphere(0.32);
translate([169.2-70,9,7.2]) sphere(0.32);

translate([169.2-90,-10,9.2]) sphere(0.32);
translate([169.2-90,10,9.2]) sphere(0.32);

translate([169.2-110,-11,11.2]) sphere(0.32);
translate([169.2-110,11,11.2]) sphere(0.32);

translate([169.2-130,-12,13.2]) sphere(0.32);
translate([169.2-130,12,13.2]) sphere(0.32);

translate([169.2-150,-13.7,15.1]) sphere(0.48);
translate([169.2-150,-12.3,15.1]) sphere(0.48);
translate([169.2-150,-10.9,15.1]) sphere(0.48);
translate([169.2-150,10.9,15.1]) sphere(0.48);
translate([169.2-150,12.3,15.1]) sphere(0.48);
translate([169.2-150,13.7,15.1]) sphere(0.48);

}