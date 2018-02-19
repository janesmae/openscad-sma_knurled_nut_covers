
// Variables
height = 5;
outer = 6;
sq = 2;

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

for (i=[-sq:sq]) {
    for (j=[-sq:sq]) {
        x = (i)*15;
        y = (j)*15;
        translate([x,y,0])
        make_nut(height, outer);
    }
}