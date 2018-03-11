
// Variables
height = 5;
outer = 6;
rows = 10;
cols = 5;

module make_nut(height,outer) {
    // Constant
    sma = 4.7;
    // Make nut
    union() {
        difference() {
            union() {
                for (i=[1:36]) {
                    rotate(i*10)
                    cylinder(h=height,r=outer,$fn=3);
                }
            }
            translate([0,0,-0.1])
                cylinder(h=height+1,r=sma,$fn=6);
        }
     }
     
}

color([0,0,0]) translate([0,0,-2.1]) cube([220,220,1]);

for (i=[1:rows]) {
    r = (i%2 == 0) ? cols-1 : cols;
    for (j=[1:r]) {
        x = (i*1.9)*outer;
        y = (i%2 == 0) ? ((j*2)*(outer+2/3))+outer : ((j*2)*(outer+2/3));
        translate([x,y,0])
        make_nut(height, outer);    
    }
}