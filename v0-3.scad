
// Variables
height = 5;
outer = 6;
rows = 1;

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

sq = (rows%2 == 0) ? rows/2 : (rows-1)/2;

for (i=[1,rows]) {
    for (j=[1:rows]) {
        x= (i%2 == 0) ? (i-1)*2*outer : (i-1)*3*outer;
        y= (j%2 == 0) ? (j-1)*2*outer : (j-1)*3*outer;
        translate([x,y,0])
        make_nut(height, outer);    
    }
}

// for (i=[-sq:sq]) {
//    for (j=[-sq:sq]) {
//        x= (i%2 == 1) ? i*2*outer : i*2*outer;
//        y= (j%2 == 1) ? j*2*outer : j*2*outer;
//        translate([x,y,0])
//        make_nut(height, outer);
//    }
// }