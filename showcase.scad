base_height = 3; 
inch = 26.5;
size = true;
height = size ? base_height * inch : (base_height / 2) * inch;

module solid_rounded(tall=true) {
  if(tall) {
    cylinder(h=height, d=inch*1.3, $fn=100);
  } else {
    cylinder(h=height/2, d=inch*1.3, $fn=100);
  }
}

module solid_flat(tall=true) {
  if(tall){
    linear_extrude(height) {
      square(inch, center=true);
    }
  } else {
      linear_extrude(height/2) {
      square(inch, center=true);
    }
  }
}

module hollow_rounded(tall=true) {
  if(tall) {
    difference() {
      solid_rounded(tall=tall);
      cylinder(h=height/2, d=inch*.9, center=true, $fn=100);
    }
  } else {
      difference() {
        solid_rounded(tall=tall);
        cylinder(h=height/2, d=inch*.9, center=true, $fn=100);
    }
  }
}
    
module hollow_flat(tall=true) {
  if(tall) {
    difference() {
      solid_flat(tall=tall);
      cube([inch*.7, inch*.7, height/2], center=true);
    }
  } else {
    difference() {
      solid_flat(tall=tall);
      cube([inch*.7, inch*.7, height/2], center=true);
    }
  }
}

solid_rounded(tall=false);
translate([inch*2, 0, 0]) solid_flat(tall=false);
translate([inch*4, 0, height/2]) rotate([0, 180, 0]) hollow_rounded(tall=false);
translate([inch*6, 0, height/2]) rotate([0, 180, 0]) hollow_flat(tall=false);

translate([0, height, 0]) solid_rounded();
translate([inch*2, height, 0]) solid_flat();
translate([inch*4, height, height]) rotate([0, 180, 0]) hollow_rounded();
translate([inch*6, height, height]) rotate([0, 180, 0]) hollow_flat();