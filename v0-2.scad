height = 5;
sma = 4.7;

union() {
    difference() {
        union() {
            for (i=[1:36]) {
                rotate(i*10)
                cylinder(h=height,r=sma+1.3,$fn=3);
            }
        }
        translate([0,0,-0.1])
            cylinder(h=height+1,r=sma,$fn=6);
    }
 }