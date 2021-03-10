outer_points = [[0, 0], [107, 0], [101.6, 38.5], [-3.34, 23.77]];
translate([0, 340, 0])
rotate([90 , 0, 0])
difference() {

    body();

    cavity();
    
    cable_hole();
    
    rim();
}

module body() {
    /*
        minkowski() {
        linear_extrude(339) 
            polygon(outer_points);
        sphere(r = 1, $fn = 90);
    } */
    minkowski() {
        linear_extrude(339)
            difference() {
                rotate([0, 0, 8])
                    translate([0, -82])
                        square(size = 106);
                translate([0, -150])
                    square(size = 150);
            }
        sphere(r = 1, $fn = 90);
    }
} 

module cavity() { 
    translate([0, 0, 5])
        linear_extrude(329) 
            intersection() {
                rotate([0, 0, 8])
                    translate([5.5, -20]) 
                        square(size = [95, 60]);
                translate([0, 3])
                    square(size = [107, 60]);
            };
}

module cable_hole() {
    hull() {
        translate([101.6, 38.5, 169.5])
            rotate([0, 90, 0])
                cylinder(h = 20, r = 4, center = true);

        translate([105, 10, 169.5])
            rotate([0, 90, 0])
                cylinder(h = 20, r = 4, center = true);
    }
}

module rim() {
    translate([0, 0, 3])
        linear_extrude(333)
            rotate([0, 0, 8])
                translate([3, 15])
                    square(size = [100, 18]);
}

