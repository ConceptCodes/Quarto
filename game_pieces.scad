base_height = 3; 
inch = 26.5;
tall = false;
height = tall ? base_height * inch : (base_height / 2) * inch;

module solid_rounded() {
  cylinder(h=height, d=inch*1.3, $fn=100);
}

module solid_flat() {
  linear_extrude(height) {
    square(inch, center=true);
  }
}

module hollow_rounded() {
  difference() {
    solid_rounded();
    cylinder(h=height/2, d=inch*.9, center=true, $fn=100);
  }
}
    
module hollow_flat() {
  difference() {
    solid_flat();
    cube([inch*.7, inch*.7, height/2], center=true);
  }
}

solid_rounded();
translate([inch*2, 0, 0]) solid_flat();
translate([inch*4, 0, height]) rotate([0, 180, 0]) hollow_rounded();
translate([inch*6, 0, height]) rotate([0, 180, 0]) hollow_flat();
