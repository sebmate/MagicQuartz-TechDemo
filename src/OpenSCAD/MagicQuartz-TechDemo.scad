
//  ------------------------------------------------------------------------------
// | Copyright Sebastian Mate 2023.                                               |
// |                                                                              |
// | This source describes Open Hardware and is licensed under the CERN-OHL-S v2. |
// |                                                                              |
// | You may redistribute and modify this source and make products using it under |
// | the terms of the CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt).         |
// |                                                                              |
// | This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY,          |
// | INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A         |
// | PARTICULAR PURPOSE. Please see the CERN-OHL-S v2 for applicable conditions.  |
// |                                                                              |
// | Source location: https://github.com/sebmate/MagicQuartz-TechDemo             |
// |                                                                              |
// | As per CERN-OHL-S v2 section 4, should You produce hardware based on this    |
// | source, You must where practicable maintain the Source Location visible      |
// | on the external case of the device or other products you make using this     |
// | source.                                                                      |
//  ------------------------------------------------------------------------------

// Cangelog:
// ---------
// 2023-03-08, Version 1.02:  - First published version
// 2023-03-23, Version 1.10:  - Improved cover and other minor changes
//                            - Increased size of cable tie holes
//                            - Add dummy sockets (part 10)
//                            - Add optical sensor case (part 11)
// 2023-03-23, Version 1.20:  - Added second fuse holder to back

$fn=64;

render_components = false; // Set this to false to generate the 3D-printable model, then press F6 to render and finally export the STL.

transparancy_cover = 0; // 0 = hidden, 0.5 = transparent, 1 = solid

amplifier_type = 2; // Which amplifier to render (1 or 2)

generate = 2; // Which part to render (0-10, see list below)

//  0 = Whole unit (for rendering only!)
//  1 = Bottom plate
//  2 = Front lower part
//  3 = Front center part (transparent)
//  4 = Front upper part
//  5 = Cover
//  6 = Foot (print 4 times)
//  7 = Voltmeter cover
//  8 = Button assembly
//  9 = Back
// 10 = Dummy sockets
// 11 = Optical sensor case

material_saver = true; // The effect is only visible when generating the distinct parts
material_saver_grid_bar_step = 15; // Must touch all elements
material_saver_grid_bar_width = 0.8;
material_saver_grid_bar_height = 1.5;
material_saver_bottom_height = 0.4; // Should be at least two layers

sacrificial_layer_height = -0.01;

// All screws are of type "DIN 7981 C H", 2.9x9.5, except for the LCD, which uses "2.2x9.5"
screw_shaft_diameter = 2.9;
screw_shaft_diameter_lcd = 2.2; // 2.2 for the display screws
screw_shaft_length = 9.5;
screw_head_diameter_min = 5.3;
screw_head_diameter_typ = 5.4;
screw_head_diameter_max = 5.6;
screw_head_hight_min = 1.95;
screw_head_hight_max = 2.20;

// Tuneable parameters:
screw_holder_hight = screw_shaft_length + 1;
case_bottom_height = 3;

// Colors:
color_transformer = "SandyBrown";
color_screw = "AliceBlue";
color_cover = "SaddleBrown";
color_buttons = "Silver";
color_bottom = [0.3, 0.3, 0.3];

// Default color scheme (transparent front center part):
color_case = "White";
color_front_center = "CadetBlue";
transparency_front_center = 0.6;
transparency_voltmeter_window_window = 0.1;

// Alternative color scheme (opaque front center part):
//color_case = "Silver";
//color_front_center = "White";
//transparency_front_center = 1;
//transparency_voltmeter_window_window = 1;

pcb_mainboard_pos_x = 106.5;  // Dermined by the visual tests (see below). Should align with voltmeter.
pcb_mainboard_pos_y = 8; // Buttons pretrude 6 mm + 2 mm for button assembly

high_voltage_screw_terminal_holder_pos_x = 69;
high_voltage_screw_terminal_holder_pos_y = 150;

// Transformer:
transformer_height = 34;
transformer_pos_x = 130;
transformer_pos_y = 140;
transformer_diameter_outer = 78;
transformer_diameter_inner = 35;
transformer_corner = 6;

// Display (DISPLAYTECH 162) (rotated!):
display_frame_size_x = 74; 
display_frame_size_y = 25;
display_frame_size_z = 8.5;

// Case outer dimensions:
case_size_width = transformer_pos_x + (transformer_diameter_outer / 2) + 5;
case_size_depth = transformer_pos_y + (transformer_diameter_outer / 2) + 5;   
front_depth = display_frame_size_z + 1.5;
front_lower_height = 25;
front_center_height = display_frame_size_y + 2;
front_upper_height = 10;
front_width = case_size_width;

front_height = front_lower_height + front_center_height + front_upper_height;

back_depth = 10;
back_height = front_height;
back_width = case_size_width;

cover_screw_distance = 6;

cable_tie_thickness = 1.5;
cable_tie_width = 6;

cover_top_height = 1;
cover_edges_size = 3;
cover_rigidity_grid_height = 3;

// Feet:
foot_size_x = 25;
foot_size_z = 5;
felt_glider_size_x = 20;
felt_glider_size_z = 2;
feet_front_distance_x = 30;
feet_front_distance_y = 30;
feet_back_distance_x = case_size_width - transformer_pos_x;
feet_back_distance_y = case_size_depth - transformer_pos_y;

// Front:
voltmeter_windowpane_thickness = 0.4;
buttons_bending_part_thickness = 0.4;

// Calculate positions of LCD and voltmeter on front:
two_line_display_visible_width = 64.5;
two_line_display_visible_shift_x = 8;
voltmeter_visible_width = 37.7;
voltmeter_visible_shift_x = 1.35;
space_between_parts = ((front_width + 2) - two_line_display_visible_width - voltmeter_visible_width) / 3;
two_line_display_pos_x = space_between_parts - two_line_display_visible_shift_x - 1;
voltmeter_pos_x = (space_between_parts * 2) + two_line_display_visible_width - voltmeter_visible_shift_x - 1;

// Simple visual test to check that the spacing is correct:

//translate([-1, -15, 15]) cube([space_between_parts, 10, 25]);
//translate([-1 + space_between_parts + two_line_display_visible_width, -15, 15]) cube([space_between_parts, 10, 25]);
//translate([-1 + space_between_parts + two_line_display_visible_width + space_between_parts + voltmeter_visible_width, -15, 15]) cube([space_between_parts, 10, 25]);

// ========================== COMPONENT RENDERINGS ==========================

module Fuse_Holder(mode) { // for 5x20 fuses

   translate([0, 0, 4]) Screw(mode, 3, screw_shaft_diameter);
   if (mode == 3 || mode == 4) {

        color("LightGray") difference() {
            translate([0, 0, 4]) {
                hull() {
                translate([-17, 0, 0]) cylinder(d=4, h=0.3, center = true);
                translate([17, 0, 0]) cylinder(d=4, h=0.3, center = true);
                }
            }
            translate([0, 0, 5.9 / 2]) Screw(2, 3, screw_shaft_diameter);
        }       
        color("Moccasin") difference() {
            translate([0, 0, 5.9 / 2]) cube([22, 10.3, 5.9], center = true);
            translate([0, 0, 5.9 / 2]) Screw(2, 3, screw_shaft_diameter);
        }

        translate([0, 0, 10]) rotate([-90, 0, 0]) rotate([0, 90, 0]) {
            color("AliceBlue") translate([0, 0, 7.501]) cylinder(d = 5, h = 5, center = true);
            color("AliceBlue") translate([0, 0, -7.501]) cylinder(d = 5, h = 5, center = true);
            color("White", 0.5) cylinder(d = 4.5, h = 20, center = true);
            color("LightGray") translate([-2.6, 3, 7.7]) cube([0.5, 10, 5], center = true);
            color("LightGray") translate([-2.6, 3, -7.7]) cube([0.5, 10, 5], center = true);
            color("LightGray") translate([2.6, 3, 7.7]) cube([0.5, 10, 5], center = true);
            color("LightGray") translate([2.6, 3, -7.7]) cube([0.5, 10, 5], center = true);
        }
    }
}

module Power_Cord(mode) {
    cable_length = 30;
    if (mode == 3 || mode == 4) {
        color([0.3, 0.3, 0.3]) hull() {
            translate([1.15, 0, 0]) cylinder(d = 3.3, h = cable_length * 0.85, center = true);
            translate([-1.15, 0, 0]) cylinder(d = 3.3, h = cable_length * 0.85, center = true);
        }
        color("Peru") translate([1.15, 0, -cable_length / 50]) cylinder(d = 2, h = cable_length * 1.1, center = true);
        color("SkyBlue") translate([-1.15, 0, cable_length / 50]) cylinder(d = 2, h = cable_length * 1.1, center = true);
        color("SandyBrown") translate([1.15, 0, -cable_length / 50]) cylinder(d = 1, h = cable_length * 1.3, center = true);
        color("SandyBrown") translate([-1.15, 0, cable_length / 50]) cylinder(d = 1, h = cable_length * 1.3, center = true);
    }
    if (mode == 2 || mode == 4) {
        color(color_case) hull() {
            translate([1.15, 0, 0]) cylinder(d = 3.3 + 0.6, h = cable_length * 0.85, center = true);
            translate([-1.15, 0, 0]) cylinder(d = 3.3 + 0.6, h = cable_length * 0.85, center = true);
        }
    }
}

module Rocker_Switch(mode) { // Type: KCDI-101
    if (mode == 3 || mode == 4) {
        // Rocker:
        color("Red", 0.7) translate([0, 0, 0.7]) rotate([5, 0, 0]) cube([9, 15.5, 4], center = true);
        color([0.3, 0.3, 0.3]) {
            // Frame:
            hull() {
                translate([0, 0, 0.5]) cube([15, 21, 1], center = true);
                translate([0, 0, 1]) cube([11, 17, 1], center = true);
            }
            // Body:
            translate([0, 0, -11 / 2]) cube([11.5, 17, 11], center = true);
        }
        // Contacts:
        color("AliceBlue") translate([0, 0, -10]) cube([5, 0.7, 20], center = true);
        color("AliceBlue") translate([0, 6.5, -10]) cube([5, 0.7, 20], center = true);
    }
    if (mode == 2 || mode == 4) {
        color(color_case) { 
        translate([0, 0, -1.501]) cube([12.5, 18.5, 4], center = true);
        translate([0, 0, -11 / 2 - 3]) cube([16, 23, 11], center = true);
        }
    }
}

module DC_Power_Jack(mode) { // Type: 5.5 / 2.5 mm DC power jack
    if (mode == 3 || mode == 4) {
        color("AliceBlue") {
            difference() { 
                union() {
                    single_rand = rands(0, 90, 1)[0];
                    rotate([0, 0, single_rand]) hull() {
                        rotate([0, 0, 0]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                        rotate([0, 0, 60]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                        rotate([0, 0, 120]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                        rotate([0, 0, 180]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                        rotate([0, 0, 240]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                        rotate([0, 0, 300]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                    };                   
                    //cylinder(d = 11, h = 1.9);
                    translate([0, 0, -2]) cylinder(d = 8, h = 4.2);
                    translate([0, 0, -2 - 4]) cylinder(d = 10, h = 4);
                };
                cylinder(d = 5.5, h = 20, center = true);
            };
            translate([0, 0, -4]) cylinder(d = 2.5, h = 5);
            translate([0, 0, 1]) sphere(d = 2.5);
       }
        color([0.3, 0.3, 0.3]) translate([0, 0, -2 - 4 - 7]) cylinder(d = 9, h = 7);
        color("AliceBlue") {
            //translate([0, -4, -2 - 4 - 7 - 2.5]) cube([3, 0.5, 5], center = true);
            translate([0, +4, -2 - 4 - 7 - 2.5]) cube([3, 0.5, 5], center = true);
            translate([4, 0, -2 - 4 - 7 - 2.5]) cube([0.5, 3, 5], center = true);
            translate([-4, 0, -2 - 4 - 7 - 2.5]) cube([0.5, 3, 5], center = true);
        }
    }
    if (mode == 2 || mode == 4) {
        color(color_case) { 
        translate([0, 0, -2.01 + sacrificial_layer_height]) cylinder(d = 8.5, h = 4.2);
        translate([0, 0, -2 - 10]) cylinder(d = 14, h = 10);
        }
    }
}

module Headphone_Jack(mode) { // Type: 3.5 mm headphone jack

    if (mode == 3 || mode == 4) {
        
        single_rand = rands(0, 90, 1)[0];
        color("AliceBlue") difference() { 
            rotate([0, 0, single_rand]) hull() {
                rotate([0, 0, 0]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                rotate([0, 0, 60]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                rotate([0, 0, 120]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                rotate([0, 0, 180]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                rotate([0, 0, 240]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
                rotate([0, 0, 300]) translate([5.5, 0, 0]) cylinder(d = 0.01, h = 1.9);
            };                   
            //cylinder(d = 11, h = 1.9);
            translate([0, 0, -2]) cylinder(d = 8, h = 4.2);
        };
        
        color([0.3, 0.3, 0.3]) {
            difference() { 
                union() {
                    translate([0, 0, -16.5 + 2]) cylinder(d = 8, h = 16.5);
                    translate([0, 0, -4.7 + 1.5]) 
                    cylinder(d = 10, h = 1.5);
                }
                translate([0, 0, -10]) cylinder(d = 3.6, h = 20);
            };
        };
        color("Khaki") {
            translate([0, -2.5, -16.5 + 2 - 1.75]) cube([2, 0.3, 3.5], center = true);
            translate([0, +2.5, -16.5 + 2 - 1.75]) cube([2, 0.3, 3.5], center = true);
            translate([2.5, 0, -16.5 + 2 - 1.75]) cube([0.3, 2, 3.5], center = true);
            translate([-2.5, 0, -16.5 + 2 - 1.75]) cube([0.3, 2, 3.5], center = true);
        }
    };
 
    if (mode == 2 || mode == 4) {
        color(color_case) { 
        translate([0, 0, -4.7 + 3  + sacrificial_layer_height]) cylinder(d = 8.5, h = 4.7);
        translate([0, 0, -4.7 + 3 - 10]) cylinder(d = 14, h = 10);
        }
    }
}

fan_inner_diameter = 24;
fan_outer_diameter = 38;
fan_cover_width = 42;
fan_cover_height = 42;

module Fan(mode) { // Type: 40*40*10 mm fan
    
    if (mode == 3 || mode == 4)  {
        color(c = [0.3, 0.3, 0.3]) 
        difference() {
            hull() {
                translate([-16, -16, 0]) cylinder(d = 8, h = 10, center = true);
                translate([16, -16, 0]) cylinder(d = 8, h = 10, center = true);
                translate([-16, 16, 0]) cylinder(d = 8, h = 10, center = true);
                translate([16, 16, 0]) cylinder(d = 8, h = 10, center = true);
            };
            translate([-16, -16, 0]) cylinder(d = 3.5, h = 10.01, center = true);
            translate([16, -16, 0]) cylinder(d = 3.5, h = 10.01, center = true);
            translate([-16, 16, 0]) cylinder(d = 3.5, h = 10.01, center = true);
            translate([16, 16, 0]) cylinder(d = 3.5, h = 10.01, center = true);
            cylinder(d = fan_outer_diameter, h = 10.01, center = true);
        }
        color(c = [0.3, 0.3, 0.3]) cylinder(d = fan_inner_diameter, h = 10.01, center = true);
        color(c = [0.3, 0.3, 0.3, 0.3]) cylinder(d = 36, h = 7, center = true);
    }
    
    if (mode == 2)  {
        
         rotate([0, 90, 0]) { // Cut-outs for cable ties
            translate([-7.01, +16, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
            translate([-7.01, -16, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
            translate([+7.01, +16, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
            translate([+7.01, -16, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
        }
        
        color(color_case) {
            difference() {
                hull() {
                    translate([-16, -16, 0]) cylinder(d = 9, h = 10.01, center = true);
                    translate([16, -16, 0]) cylinder(d = 9, h = 10.01, center = true);
                    translate([-16, 16, 0]) cylinder(d = 9, h = 10.01, center = true);
                    translate([16, 16, 0]) cylinder(d = 9, h = 10.01, center = true);
                }
                translate([-16, -16, 0]) cylinder(d = 2.5, h = 10.02, center = true);
                translate([16, -16, 0]) cylinder(d = 2.5, h = 10.01, center = true);
                translate([-16, 16, 0]) cylinder(d = 2.5, h = 10.01, center = true);
                translate([16, 16, 0]) cylinder(d = 2.5, h = 10.01, center = true);
            }
            cylinder(d = fan_outer_diameter, h = 20, center = true);
        }
    }
    
    if (mode == 5)  {
         color(color_case) {
            /*
            translate([-16, -16, 0]) cylinder(d = 3, h = 10.01, center = true);
            translate([16, -16, 0]) cylinder(d = 3, h = 10.01, center = true);
            translate([-16, 16, 0]) cylinder(d = 3, h = 10.01, center = true);
            translate([16, 16, 0]) cylinder(d = 3, h = 10.01, center = true);
            */
            translate([0, 0, 6.5]) {
                cylinder(d = fan_inner_diameter, h = 1, center = true);
                for (i = [0 : 30: 150]) {
                    rotate([0, 0, i]) cube([2, 39, 1], center = true);
                }
                difference() {
                    /*hull() {
                        translate([-16, -16, 0]) cylinder(d = 8, h = 1, center = true);
                        translate([16, -16, 0]) cylinder(d = 8, h = 1, center = true);
                        translate([-16, 16, 0]) cylinder(d = 8, h = 1, center = true);
                        translate([16, 16, 0]) cylinder(d = 8, h = 1, center = true);
                    };*/
                    hull() {
                        translate([0, 0, -.5])cube([fan_cover_width, fan_cover_width, 0.001], center = true);
                        translate([0, 0, .5]) cube([fan_cover_width - 2, fan_cover_width - 2, 0.001], center = true);
                    }
                    cylinder(d = fan_outer_diameter - 0.01, h = 20, center = true);
                }
            }
        }
    }
}

module AC_Voltmeter(mode) {
    translate([0, 1.2, 0]) rotate([90, 0, 0]) {
        if (mode == 3 || mode == 4)  {
            color("SeaGreen") union() {
                cube([40.4, 21.5, 1.2]);
                translate([-1.9, 7.75, 0]) cube([44.2, 6, 1.2]);
            }
            translate([1.35, 1.25, 1.2]) color("Gray") cube([37.7, 19, 8]);
            translate([0, 0, 3.99]) color("Red") translate([2, 3, 6.21]) linear_extrude(0.01)
            text("220", font="Arial", size=16);
        }
        if (mode == 2 || mode == 4)  {
            color(color_front_center, transparency_front_center) union() {
                translate([-0.5, -0.5, 0]) cube([40.4 + 1, 21.5 + 1, 1.201]);
                translate([-1.9 - 0.5, 7.75 - 0.5, 0]) cube([44.2 + 1, 6 + 1, 1.202]);
                translate([1.35 - 0.5, 1.25 - 0.5, 1.2]) cube([37.7 + 1, 19 + 1, 20]);
            }
        }
    }
}

module AC_Voltmeter_Assembly() {
    difference() {
        AC_Voltmeter(1);
        AC_Voltmeter(2);
    }
    if (render_components == true) AC_Voltmeter(3);
}

module Voltmeter_Cover(mode) {
    
    inner_height = 21;
    inner_width = 40.4;
    inner_depth = 12;
    total_height = 36;
    total_width = inner_width + 4;
    
    screw_diameter = 2.2;
    screw_dist_x = 1.3 + (screw_diameter / 2);
    screw_dist_z = 1.3 + (screw_diameter / 2);

    translate([voltmeter_pos_x, 0, front_lower_height + ((front_center_height - 21.5) / 2)+ 0]) {
        if (mode == 1 || mode == 4)  {
            color(color_case) difference() {
                union() {
                    translate([-1, -0.01, -1]) cube([inner_width + 2, inner_depth + 2, inner_height + 2]);
                    translate([-(total_width - inner_width) / 2, 0, -(total_height - inner_height) / 2]) {
                        cube([total_width, 1.5, total_height]);
                    }
                };
                translate([0, -5, 0]) cube([inner_width, inner_depth + 5, inner_height]);
                //translate([inner_width / 2, inner_depth * 3/4, -5]) cylinder(d = 3, h = 10);
                translate([inner_width / 2, inner_depth * 1/2 + 2, inner_height * 1/2]) rotate([0, 90, 0]) translate([0, 0, -10]) cylinder(d = 3, h = 50, center = true);
            }
            
            color("LightGray")  {
                translate([inner_width - 2, inner_depth + 2, 6]) rotate([90, 0, 180]) linear_extrude(0.4)  text("⚡", font = "Symbola", size=14);
                translate([inner_width -13, inner_depth + 2, 14]) rotate([90, 0, 180]) linear_extrude(0.4) text("DANGER", font = "Arial", size=4);
                translate([inner_width -18, inner_depth + 2, 9]) rotate([90, 0, 180]) linear_extrude(0.4) text("HIGH", font = "Arial", size=4);
                translate([inner_width -12, inner_depth + 2, 4]) rotate([90, 0, 180]) linear_extrude(0.4) text("VOLTAGE", font = "Arial", size=4);
            }
        }
        
        translate([-(total_width - inner_width) / 2, 0, -(total_height - inner_height) / 2]) {
            translate([screw_dist_x, 1.51, screw_dist_z]) rotate([90, 0, 180]) Screw(mode, 1.52, screw_diameter);
            translate([total_width - screw_dist_x, 1.51, screw_dist_z]) rotate([90, 0, 180]) Screw(mode, 1.52, screw_diameter);
            translate([screw_dist_x, 1.51, total_height - screw_dist_z]) rotate([90, 0, 180]) Screw(mode, 1.52, screw_diameter);
            translate([total_width - screw_dist_x, 1.51, total_height - screw_dist_z]) rotate([90, 0, 180]) Screw(mode, 1.52, screw_diameter);
        }
    }
}

module Voltmeter_Cover_Assembly() {
    difference() {
        Voltmeter_Cover(1);
        Voltmeter_Cover(2);
    }
    if (render_components == true) Voltmeter_Cover(3);
}

module Two_Line_Display(mode) {
    pcb_size_x = 80;
    pcb_size_y = 36.2;
    pcb_size_z = 1.6;
        
    translate([0, 1.6, 0]) rotate([90, 0, 0]) {
       
        if (mode == 3 || mode == 4)  {
            //PCB:
            color("SeaGreen") cube([pcb_size_x, pcb_size_y, pcb_size_z]);
            color("White") translate([3, 5, pcb_size_z]) cube([display_frame_size_x, display_frame_size_y, display_frame_size_z]);
            color("GreenYellow") translate([8, 10, pcb_size_z + display_frame_size_z + 0.02]) cube([64.5, 15, 0.01]);
            color("DarkBlue") translate([8.5, 10 + 8, pcb_size_z + display_frame_size_z + 0.02]) linear_extrude(0.1) text("33 T 33.3333 RPM", font = "DejaVu Sans Mono:style=Bold", size=4.8);
            color("DarkBlue") translate([8.5, 10 + 2, pcb_size_z + display_frame_size_z + 0.02]) linear_extrude(0.1) text("M CQ 50.0000 Hz", font = "DejaVu Sans Mono:style=Bold", size=4.8);
        }
   
        if (mode == 2 || mode == 4)  {
            color(color_front_center, transparency_front_center) {
                // For LED backlight connection:
                translate([pcb_size_x - 5, 5 - 0.25 + 5, pcb_size_z + 0.01]) cube([5, display_frame_size_y + 0.5 - 10, 3]);
                // For the actual display:
                translate([3 - 0.25, 5 - 0.25, pcb_size_z]) cube([display_frame_size_x + 0.5, display_frame_size_y + 0.5, display_frame_size_z + 0.25]);
                translate([8, 10, 10]) {
                    hull() {
                        cube([64.5, 15, 0.1]);
                        translate([-5, -5, 10]) cube([64.5 + 10, 15 + 10, 0.1]);
                    }
                }
            }
            // For solder joints:
            color(color_case, transparency_front_center) translate([5, pcb_size_y - 5.21, pcb_size_z - 0.01]) cube([42, 5.2, 4]);      
        }
        
        screw_diameter = 2.2;
        screw_dist_x = 1.3 + (screw_diameter / 2);
        screw_dist_y = 1.3 + (screw_diameter / 2);
        
        translate([screw_dist_x, screw_dist_y, 0]) rotate([180, 0, 0]) Screw(mode, 1.6, screw_shaft_diameter_lcd);
        translate([pcb_size_x - screw_dist_x, screw_dist_y, 0]) rotate([180, 0, 0]) Screw(mode, 1.6, screw_shaft_diameter_lcd);
        translate([screw_dist_x, pcb_size_y - screw_dist_y, 0]) rotate([180, 0, 0]) Screw(mode, 1.6, screw_shaft_diameter_lcd);
        translate([pcb_size_x - screw_dist_x, pcb_size_y - screw_dist_y, 0]) rotate([180, 0, 0]) Screw(mode, 1.6, screw_shaft_diameter_lcd);
    }
}

module two_line_display_Assembly() {
    difference() {
        Two_Line_Display(1);
        Two_Line_Display(2);
    }
    if (render_components == true) Two_Line_Display(3);
}

module Push_Button(posX, posY, posZ) {
    translate([posX, posY, posZ]) {
        color("Silver") cube([7, 4, 7]);
        translate([7/2, -5.5/2, 7/2]) color(c = [0.2, 0.2, 0.2]) rotate([90, 0, 0]) cylinder(d=4, h=5.5, center=true);
    }
}

module Screw(mode, upper_shaft_length, shaft_diameter_override) {
 
    if(mode == 2) {
        color(color_case) union() {
            translate([0, 0, 0]) cylinder(h=screw_head_hight_max + 1, d=screw_head_diameter_typ + .5);
            translate([0, 0, -upper_shaft_length + 0.001 ]) cylinder(h=upper_shaft_length , d=shaft_diameter_override + 1);
            translate([0, 0, -screw_shaft_length - 0.5]) cylinder(h=screw_shaft_length + 0.5, d=shaft_diameter_override - 0.001);
        }
    }
    if(mode == 3 || mode == 4) {
        single_rand = rands(0, 90, 1)[0];
        color(color_screw)
        rotate([0, 0,single_rand]) difference() {
            hull() {
                cylinder(h=screw_head_hight_max, d=screw_head_diameter_typ / 2);
                cylinder(h=screw_head_hight_max / 2, d=screw_head_diameter_typ);
            }
            union() {
                translate([0, 0,screw_head_hight_max * 0.6]) cube([screw_head_diameter_typ * 0.7, screw_head_diameter_typ * 0.15, screw_head_hight_max * 1.01], center = true);
                translate([0, 0,screw_head_hight_max * 0.6]) cube([screw_head_diameter_typ * 0.15, screw_head_diameter_typ * 0.7, screw_head_hight_max * 1.01], center = true);
            }
        }
        translate([0, 0, -screw_shaft_length]) color(color_screw) cylinder(h=screw_shaft_length * 1/3, d2=shaft_diameter_override, d1=0);
        translate([0, 0, -screw_shaft_length * 2/3]) color(color_screw) cylinder(h=screw_shaft_length * 2/3, d=shaft_diameter_override);
    }
}

module DC_To_DC_Module(mode) {
    size_x = 43.55;
    size_y = 21.2;
    size_z = 1.6;
    hole_distance_x = 6.5;
    hole_distance_y = 2;
    hole_diameter = 3;
    translate([0, 0, screw_holder_hight]) {
        translate([size_x - hole_distance_x, 0 + hole_distance_y, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        translate([0 + hole_distance_x, size_y - hole_distance_y, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        //translate([0 + hole_distance_x, 0 + hole_distance_y, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        //translate([size_x - hole_distance_x, size_y - hole_distance_y, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        if(mode == 3 || mode == 4) {
            // PCBs:
            color("DarkBlue") cube([size_x, size_y, size_z]);
            // Components:
            translate([1 + 4, 7 + 4, size_z]) color("Silver") cylinder(h=10, d=8);
            translate([35 + 4, 7 + 4, size_z]) color("Silver") cylinder(h=10, d=8);
            translate([10, 10, size_z]) color(c = [0.2, 0.2, 0.2]) cube([10, 9, 5]);
            translate([21, 1, size_z]) color(c = [0.2, 0.2, 0.2]) cube([12, 12, 7]);
            translate([23, 15, size_z]) color("SteelBlue") cube([10, 5, 10]);
        }
    }
    translate([size_x - hole_distance_x, 0 + hole_distance_y, 0]) Screw_Holder(mode, 0, 0);
    translate([0 + hole_distance_x, size_y - hole_distance_y, 0]) Screw_Holder(mode, 0, 0);
    //translate([0 + hole_distance_x, 0 + hole_distance_y, 0]) Screw_Holder(mode, 0, 0);
    //translate([size_x - hole_distance_x, size_y - hole_distance_y, 0]) Screw_Holder(mode, 0, 0);
}

module Mainboard(mode) {
    
    size_x = 51;
    size_y = 83.5;
    size_z = 1.6;
    hole_distance = 3;
    hole_diameter = 3;
    
    translate([0, 0, screw_holder_hight]) {
        translate([0 + hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        translate([size_x - hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        translate([0 + hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        translate([size_x - hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
        if(mode == 3 || mode == 4) {
            // PCBs:
            color("Green") cube([size_x, size_y, size_z]);
            translate([10, 10, size_z]) color(c = [0.2, 0.2, 0.2]) cube([2.5, 54, 12]);
            translate([10, 10, size_z + 12]) color("DarkBlue") cube([38, 54, 1.8]);
            translate([10 + 38 - 2.5, 10, size_z]) color(c = [0.2, 0.2, 0.2]) cube([2.5, 54, 12]);
            // Components:
            translate([10 + 19, 10 + 18, size_z + 12 + 2]) rotate([0, 0, 45]) color(c = [0.2, 0.2, 0.2]) cube([14, 14, 1], center = true);
            translate([10 + 15, 10 + 35, size_z + 12 + 2]) color(c = [0.2, 0.2, 0.2]) cube([10, 4, 1], center = false);
            translate([10 + 6, 10 + 2, size_z + 12 + 2]) color("White") {
                hull() {
                    translate([2, 2, 0]) cylinder(d = 4, h = 4, center = false);
                    translate([2, 8, 0]) cylinder(d = 4, h = 4, center = false);
                }
            }
            translate([10 + 28, 10 + 26, size_z + 12 + 2]) color("White") {
                hull() {
                    translate([2, 2, 0]) cylinder(d = 4, h = 4, center = false);
                    translate([2, 8, 0]) cylinder(d = 4, h = 4, center = false);
                }
            }
            translate([10 + 21, 10 + 48, size_z + 12 + 2]) color("White") cube([8, 6, 2], center = false);
            // Buttons:
            Push_Button(6.5, 0, size_z);
            Push_Button(16.5, 0, size_z);
            Push_Button(26.5, 0, size_z);
            Push_Button(36.5, 0, size_z);
        }
    }
    translate([0 + hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([size_x - hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([0 + hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([size_x - hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
}

module TDA7498_Amplifier(mode) {
    
    // This module might be a bit confusing because it's rotated by 90 degree. Therefore, x and y are swapped.
    size_y = 79;
    size_x = 109;
    size_z = 3;
    hole_distance = 3;
    hole_diameter = 3;
    
    translate([0, 0, screw_holder_hight]) translate([79, 0, 0]) rotate([0, 0, 90])   {
    
        if(amplifier_type == 1) {
            translate([0 + hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([0 + hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter); 

            if(mode == 3 || mode == 4) {
                // Board:
                color("FireBrick") cube([size_x, size_y, size_z]);
                // Volume Pot:
                translate([0, 17, 3]) Volume_Potentiometer();
                // Heatsink:
                union() {
                    color("SandyBrown") difference() {
                        Heatsink(55, 55, 14, 16, 12, 3);
                        translate([16+55/2, 12+55/2, 6.5]) cylinder(d=40, h=12);
                    }
                    color("LightGray") translate([16+55/2, 12+55/2, 7.002]) cylinder(d=20, h=10);
                    color("LightGray", 0.3) translate([16+55/2, 12+55/2, 7.001]) cylinder(d=35, h=8);
                }
                // Caps:
                for (x = [0: 57/5 : 57]){
                    Capacitor(10, 17, 30+x, 6, 3);
                    Capacitor(10, 17, 30+x, 73, 3);
                }
                // Inductors:
                for (y = [0: 42/3 : 42]){
                    translate([73, 14+y, 3]) Inductor();
                }
                // Screw Terminals:
                color([.2, 0.2, 0.2]) translate([97, 9, 3]) cube([12, 60, 10]);
                // Other Stuff:
                color("Crimson") translate([1, 29, 3]) cube([13, 43, 13]);
            }
        }
    }
    
    translate([79, 0, 0]) rotate([0, 0, 90]) {
        translate([0 + hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([size_x - hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([0 + hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([size_x - hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
    }
}

module TPA3116D2_Amplifier(mode) {
    // This module might be a bit confusing because it's rotated by 90 degree. Therefore, x and y are swapped.
    size_y = 51;
    size_x = 63;
    size_z = 1.8;
    hole_distance = 3.3;
    hole_diameter = 3.3;

    translate([0, 0, screw_holder_hight]) translate([51, 0, 0]) rotate([0, 0, 90])   {
       
        if(amplifier_type == 2) {
        
            translate([0 + hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([0 + hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter); 
            
            if(mode == 3 || mode == 4) {
                    
                // Board:
                color("Teal") cube([size_x, size_y, size_z]);
                    
                // Caps:
                Capacitor(10, 20, 20, 7, 1.8);
                Capacitor(10, 20, 20, 44, 1.8);
                // Inductors:
                color([0.2, 0.2, 0.2]) translate([28.0, 2, 1.8]) cube([12, 12, 7]);
                color([0.2, 0.2, 0.2]) translate([41.5, 2, 1.8]) cube([12, 12, 7]);
                color([0.2, 0.2, 0.2]) translate([28.0, 36.8, 1.8]) cube([12, 12, 7]);
                color([0.2, 0.2, 0.2]) translate([41.5, 36.8, 1.8]) cube([12, 12, 7]);
                // Heatsink:
                color([0.9, 0.9, 0.9]) Heatsink(14, 22, 7, 17, 14.5, 1.8);
                // Four Caps:
                color([0.5, 0.5, 0.5]) translate([33, 20, 1.8]) cube([14, 11, 10]);
                // Screw Terminals:
                color("MediumBlue") translate([54, 10, 1.8]) cube([8, 30, 10]);
                color("MediumBlue") translate([0.2, 18, 1.8]) cube([8, 15, 10]);
                // Audio Input Connector:
                color([0.1, 0.1, 0.1]) translate([-1, 35.5, 1.8]) cube([14, 6, 4]);
                // Volume Pot:
                translate([0, 7, 1.8]) Volume_Potentiometer();
            }
        }
    }

    translate([51, 0, 0]) rotate([0, 0, 90]) {
        translate([0 + hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([size_x - hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([0 + hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
        translate([size_x - hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
    }
}

module Custom_Amplifier(mode) {
    
    size_x = 51;
    size_y = 83.5;
    size_z = 1.6;
    hole_distance = 3;
    hole_diameter = 3;
    
    translate([0, 0, screw_holder_hight]) {
        if(amplifier_type == 3) {
            translate([0 + hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, 0 + hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([0 + hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            translate([size_x - hole_distance, size_y - hole_distance, size_z]) Screw(mode, size_z, screw_shaft_diameter);
            if(mode == 3 || mode == 4) {
                // PCB:
                color("Chocolate") cube([size_x, size_y, size_z]);
            }
        }
    }
    translate([0 + hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([size_x - hole_distance, 0 + hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([0 + hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
    translate([size_x - hole_distance, size_y - hole_distance, 0]) Screw_Holder(mode, 0, 0);
}


module Rounded_Toroid(diameter_outer, diameter_inner, height, corner) {
    rotate_extrude() {
        hull() {
            translate([diameter_outer / 2 - corner / 2, corner / 2]) circle(d=corner);
            translate([diameter_outer / 2 - corner / 2, height - corner / 2]) circle(d=corner);
            translate([diameter_inner / 2 + corner / 2, corner / 2]) circle(d=corner);
            translate([diameter_inner / 2 + corner / 2, height - corner / 2]) circle(d=corner);
        }
    }
}

module Inductor() {
    inductor_diameter_outer = 20;
    inductor_diameter_inner = 8;
    inductor_height = 10;
    inductor_corner = 6;
    
    color("SandyBrown") translate([10, 5, 10]) 
    rotate([90, 0, 0]) {
        /*difference() {
            cylinder(d=20, h=7, center=true);
            cylinder(d=7, h=10, center=true);
        }
        */
        translate([0, 0, - inductor_diameter_inner / 2])  Rounded_Toroid(inductor_diameter_outer, inductor_diameter_inner, inductor_height, inductor_corner);
    }
}

module Volume_Potentiometer() {
    color([.7, 0.7, 0.7]) cube([2, 9.5, 12]);
    color("MediumSeaGreen") translate([2, 0, 0]) cube([14-2, 9.5, 12]);
    color([.7, 0.7, 0.7]) translate([-5, 9.5/2, 12/2]) rotate([0, 90, 0]) cylinder(d=7, h=5);
    color([.7, 0.7, 0.7]) translate([-15, 9.5/2, 12/2]) rotate([0, 90, 0]) cylinder(d=6, h=15);
}

module Capacitor(d, h, centerX, centerY, bottomZ) {
    translate([centerX, centerY, bottomZ])
        union () {
            color("DarkGreen") cylinder(d=d, h=h, center=false);
            color("LightGray") cylinder(d=d*0.6, h=h+.001, center=false);
        }
}

module Heatsink(sizeX, sizeY, sizeZ, posX, posY, posZ) {
    translate([posX, posY, posZ]) {
        union() {
            cube([sizeX, sizeY, sizeZ / 4]);
            for (i = [0: 3 : sizeX]){
                translate([i, 0, 0]) cube([1.5, sizeY, sizeZ]);
            }
        }
    }
}

// ========================== LOWER PART ==========================

module Screwing_Brackets(mode) {
    translate([2, 0, case_bottom_height]) {
            if(mode == 1 || mode == 4) color(color_bottom)  hull() {
                cube([10, 2, 10]);
                cube([10, 5, 1]);
            }
            translate([5, 2, 5]) rotate([-90, 0, 0]) Screw(mode, 2.01, screw_shaft_diameter);
    }
    translate([(case_size_width / 2), 0, case_bottom_height]) {
            if(mode == 1 || mode == 4) color(color_bottom) hull() {
                cube([10, 2, 10]);
                cube([10, 5, 1]);
            }
            translate([5, 2, 5]) rotate([-90, 0, 0]) Screw(mode, 2.01, screw_shaft_diameter);
    }   
    translate([case_size_width - 10 - 2, 0, case_bottom_height]) {
            if(mode == 1 || mode == 4) color(color_bottom) hull() {
                cube([10, 2, 10]);
                cube([10, 5, 1]);
            }
            translate([5, 2, 5]) rotate([-90, 0, 0]) Screw(mode, 2.01, screw_shaft_diameter);
    }
}

module Bottom_Plate(mode) {
    color(color_bottom)
    if(mode == 1 || mode == 4) {
        if(material_saver == false) {
            difference() {
                cube([case_size_width, case_size_depth, case_bottom_height]);
                Feet(2);
            }
        } else {
            difference() {
                union() {
                    cube([case_size_width, case_size_depth, material_saver_bottom_height]);
                    // Edges:
                    cube([case_size_width, 10, case_bottom_height]);
                    cube([10, case_size_depth, case_bottom_height]);
                    translate([0, case_size_depth - 10, 0]) cube([case_size_width, 10, case_bottom_height]);
                    translate([case_size_width - 10, 0, 0]) cube([10, case_size_depth, case_bottom_height]);
                    
                    for (x = [0 : material_saver_grid_bar_step: case_size_width]){
                        translate([x, 0, 0]) {
                             cube([material_saver_grid_bar_width, case_size_depth, material_saver_grid_bar_height]);
                        }
                    }
                    
                    for (y = [0 : material_saver_grid_bar_step: case_size_depth]){
                        translate([0, y, 0]) {
                             cube([case_size_width, material_saver_grid_bar_width, material_saver_grid_bar_height]);
                        }
                    }
                }
                Feet(2);
            }
        }
        // Add material for screws that hold the four feet:
        translate([feet_front_distance_x, feet_front_distance_y, 0]) {
            difference() {
                cylinder(h = screw_shaft_length, d1 = 12, d2 = 6);
                translate([0, 0, -0.001]) cylinder(h = screw_shaft_length - 1, d = screw_shaft_diameter);
            }
        }
        translate([case_size_width - feet_front_distance_x, feet_front_distance_y, 0]) {
            difference() {
                cylinder(h = screw_shaft_length, d1 = 12, d2 = 6);
                translate([0, 0, -0.001])cylinder(h = screw_shaft_length - 1, d = screw_shaft_diameter);
            }
        }
        translate([feet_back_distance_x, case_size_depth - feet_back_distance_y, 0])  {
             difference() {
                cylinder(h = screw_shaft_length, d1 = 12, d2 = 6);
                translate([0, 0, -0.001])cylinder(h = screw_shaft_length - 1, d = screw_shaft_diameter);
            }
        }
        translate([case_size_width - feet_back_distance_x, case_size_depth - feet_back_distance_y, 0]) {
             difference() {
                cylinder(h = screw_shaft_length, d1 = 12, d2 = 6);
                translate([0, 0, -0.001])cylinder(h = screw_shaft_length - 1, d = screw_shaft_diameter);
            }
        }
                
        // Add for extra rigidity:
        translate([95, 10, 0]) color(color_bottom) cube([2, 105, 10]);
       
        // Air guide:
        cube([92, 22, case_bottom_height]);
        translate([12, 0, 0]) cube([1, 15, screw_holder_hight + 2.5]);
        translate([86, 0, 0]) cube([1, 15, screw_holder_hight + 2.5]);
        translate([12, 15, 0]) color(color_bottom) {
            //hull() {
                cube([75, 1, screw_holder_hight + 2.5]);
                //translate([0, -10 , 0]) cube([79, 10, 1]);
            //}
        }
    }
    
    // Add the six backets that hold the front and the back parts:
    Screwing_Brackets(mode);
    translate([case_size_width, case_size_depth, 0]) rotate([0, 0, 180]) Screwing_Brackets(mode);
    
    color(color_bottom)
    if(mode == 2) {
        // Air inlet:
        for (i = [0 : 4: (case_size_width / 2) - 14 - 2]){
            translate([14 + i, -8.5, -2]) {
                 cube([3, 23, 15]);
            }
        }
        
        // Holes for cable ties:
        translate([94, 10, 7]) {
            for (i = [5 : 10: 105]) {
                translate([0, i, 0]) cube([4, 5, 2]);
            }
        }
    }
}

module Screw_Holder(mode, location_x, location_y) {
    color(color_bottom)
    translate([location_x,location_y, 0]) {
        if(mode == 1 || mode == 4) {
            hull() {
                cylinder(h=0.01, d=10);
                cylinder(h=screw_holder_hight, d=5);
            };
            
            //if(material_saver == true) {
            //    translate([-case_size_width, -material_saver_bar_width / 2, 0]) cube([case_size_width * 2, material_saver_bar_width, case_bottom_height]);
            //    translate([-material_saver_bar_width / 2, -case_size_depth, 0]) cube([material_saver_bar_width, case_size_depth * 2, case_bottom_height]);
            //}
            
        } if (mode == 2 || mode == 4) {
            translate([0, 0, 1]) cylinder(h=20, d=screw_shaft_diameter, center=false);
        };
    };
}

module Transformer(mode) {
    
    if(mode == 3 || mode == 4) {
        translate([transformer_pos_x, transformer_pos_y, case_bottom_height + 0.01]) {
            color(color_transformer) Rounded_Toroid(transformer_diameter_outer, transformer_diameter_inner, transformer_height, transformer_corner);
            /*color("LemonChiffon") difference() {
                translate([0, 0, transformer_corner / 2]) cylinder(h=transformer_height - transformer_corner, d=transformer_diameter_outer + .005);
                translate([0, 0, transformer_corner / 2 - 1]) cylinder(h=transformer_height, d=transformer_diameter_outer);
            }*/
        }
    }
        
    if(mode==2) {
        translate([transformer_pos_x, transformer_pos_y, 0]) {
            //cylinder(h=10, d=6, center = true);
            color(color_bottom) rotate([0, 0, 45]) {
                translate([-transformer_diameter_outer / 2 - 2, 0, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
                translate([-transformer_diameter_inner / 2 + 2, 0, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
                translate([+transformer_diameter_outer / 2 + 2, 0, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
                translate([+transformer_diameter_inner / 2 - 2, 0, 0]) cube([cable_tie_thickness, cable_tie_width, 50], center = true);
                translate([0, -transformer_diameter_outer / 2 - 2, 0]) cube([cable_tie_width, cable_tie_thickness, 50], center = true);
                translate([0, -transformer_diameter_inner / 2 + 2, 0]) cube([cable_tie_width, cable_tie_thickness, 50], center = true);
                translate([0, +transformer_diameter_outer / 2 + 2, 0]) cube([cable_tie_width, cable_tie_thickness, 50], center = true);
                translate([0, +transformer_diameter_inner / 2 - 2, 0]) cube([cable_tie_width, cable_tie_thickness, 50], center = true);
            }
        }
    }
    
    if((mode==1 || mode == 4) && material_saver == true) {
        translate([transformer_pos_x, transformer_pos_y, 0]) {
            color(color_bottom) rotate([0, 0, 45]) {
                support_radius1=5;
                difference() {
                    union() {
                        hull() {
                            translate([-transformer_diameter_outer / 2 - 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([-transformer_diameter_inner / 2 + 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([+transformer_diameter_outer / 2 + 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([+transformer_diameter_inner / 2 - 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                        }
                        hull() {
                            translate([0, -transformer_diameter_outer / 2 - 2, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([0, -transformer_diameter_inner / 2 + 2, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([0, +transformer_diameter_outer / 2 + 2, 0]) cylinder(h=case_bottom_height, r=support_radius1);
                            translate([0, +transformer_diameter_inner / 2 - 2, 0]) cylinder(h=case_bottom_height, 
                            r=support_radius1);
                        }
                    };
                    cylinder(h=200, r=support_radius1, center=true);
                }
                
                support_radius2=8;
                translate([-transformer_diameter_outer / 2 - 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([-transformer_diameter_inner / 2 + 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([+transformer_diameter_outer / 2 + 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([+transformer_diameter_inner / 2 - 2, 0, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([0, -transformer_diameter_outer / 2 - 2, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([0, -transformer_diameter_inner / 2 + 2, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([0, +transformer_diameter_outer / 2 + 2, 0]) cylinder(h=case_bottom_height, r=support_radius2);
                translate([0, +transformer_diameter_inner / 2 - 2, 0]) cylinder(h=case_bottom_height, r=support_radius2);
            }
        }
    }
}

module High_Voltage_Screw_Terminal_Holder(mode) {
    
    if(mode==3) {
        color("PaleTurquoise") translate([high_voltage_screw_terminal_holder_pos_x, high_voltage_screw_terminal_holder_pos_y, case_bottom_height + 4.5]) {
            cube([14, 17, 9], center = true);
            translate([+4, +4, 7]) cylinder(d=4, h=6, center = true);
            translate([-4, -4, 7]) cylinder(d=4, h=6, center = true);
            translate([+4, -4, 7]) cylinder(d=4, h=6, center = true);
            translate([-4, +4, 7]) cylinder(d=4, h=6, center = true);
        }
    }
    
    if(mode==1) {
        translate([high_voltage_screw_terminal_holder_pos_x, high_voltage_screw_terminal_holder_pos_y, 0]) {
            color("Black") {
                
                if(material_saver == true) {
                    translate([-9, -25, 0]) cube([31, 50, case_bottom_height]);
                    translate([-9, 12, 0]) cube([40, 20, case_bottom_height]);
                }
                
                translate([9, -8, case_bottom_height]) linear_extrude(.4) text("⚡", font = "Symbola", size=16);
                translate([5, 23, case_bottom_height]) linear_extrude(.4)  text("DANGER", font = "Arial", size=4);
                translate([10, 18, case_bottom_height]) linear_extrude(.4)  text("HIGH", font = "Arial", size=4);
                translate([4, 13, case_bottom_height]) linear_extrude(.4)  text("VOLTAGE", font = "Arial", size=4);
                
                /*
                if(material_saver == true) {
                    translate([9, -8, 0]) linear_extrude(case_bottom_height) text("⚡", font = "Symbola", size=16);
                    hull() {
                        translate([5, 23, 0]) linear_extrude(case_bottom_height)  text("DANGER", font = "Arial", size=4);
                        translate([10, 18, 0]) linear_extrude(case_bottom_height)  text("HIGH", font = "Arial", size=4);
                        translate([4, 13, 0]) linear_extrude(case_bottom_height)  text("VOLTAGE", font = "Arial", size=4);
                    }
                }
                */
            }
            color(color_bottom) translate([-1, 17/2-5, case_bottom_height]) cube([2, 10, 10]);
            color(color_bottom) translate([-1, -17/2-5, case_bottom_height]) cube([2, 10, 10]);
        }
                
        color(color_bottom) translate([high_voltage_screw_terminal_holder_pos_x, high_voltage_screw_terminal_holder_pos_y, 0]) {
            translate([-3.5, 20, 0]) cylinder(h = case_bottom_height, r = 5);
            translate([3.5, 20, 0]) cylinder(h = case_bottom_height, r = 5);
            translate([-3.5, -18, 0]) cylinder(h = case_bottom_height, r = 5);
            translate([3.5, -18, 0]) cylinder(h = case_bottom_height, r = 5);
        }
    }
    
    if(mode==2) {
         color(color_bottom) translate([high_voltage_screw_terminal_holder_pos_x, high_voltage_screw_terminal_holder_pos_y, 0]) {
            translate([-3.5, 20, 0]) cube([cable_tie_thickness, cable_tie_width, 20], center = true);
            translate([3.5, 20, 0]) cube([cable_tie_thickness, cable_tie_width, 20], center = true);
            translate([-3.5, -18, 0]) cube([cable_tie_thickness, cable_tie_width, 20], center = true);
            translate([3.5, -18, 0]) cube([cable_tie_thickness, cable_tie_width, 20], center = true);
        }
    }
}

module Bottom(mode) {

    Bottom_Plate(mode);

    // Position mainboard and amplifiers:
    translate([pcb_mainboard_pos_x, pcb_mainboard_pos_y, 0]) Mainboard(mode);
    translate([10, 18, 0]) TDA7498_Amplifier(mode);
    translate([10 - 0.3, 18 - 0.3, 0]) TPA3116D2_Amplifier(mode);
    translate([10, 18, 0]) Custom_Amplifier(mode);
    
    // Position fans:
    if(mode != 3 || (mode == 3 && amplifier_type >= 2)) {
        if(mode!=2 && material_saver == true) {
            color(color_bottom) translate([60, 25, 0]) cube([20, 8, case_bottom_height]);
            color(color_bottom) translate([60, 57, 0]) cube([20, 8, case_bottom_height]);
        }
        translate([70, 45, 20 + case_bottom_height + 0.5]) rotate([0, 90, 0]) Fan(mode);
    }

    //if(mode != 3 || (mode == 3 && amplifier_type == 3))
    //translate([37, 111, 20 + case_bottom_height + 0.5]) rotate([90, 90, 0]) Fan(mode);
    
    // Transformer:
    Transformer(mode);

    // DC to DC converters:
    pcb_dc2dc1_pos_x = 10;
    pcb_dc2dc1_pos_y = 132;
    pcb_dc2dc2_pos_x = 10;
    pcb_dc2dc2_pos_y = 157;
    translate([pcb_dc2dc1_pos_x, pcb_dc2dc1_pos_y, 0]) DC_To_DC_Module(mode);
    translate([pcb_dc2dc2_pos_x, pcb_dc2dc2_pos_y, 0]) DC_To_DC_Module(mode);
    
    // Screw terminal for AC output cable:
    High_Voltage_Screw_Terminal_Holder(mode);
};

module Bottom_Assembly() {
    color(color_bottom) difference() {
        intersection() { // Required for space-saver mode
            Bottom(1);
            cube([case_size_width, case_size_depth, 200]);
        };
        color(color_bottom) Bottom(2);
        color(color_bottom) Cover(2);
    }
    color(color_bottom) translate([13, 0, 0]) cube([73, 1, 1]); // Stop brim
    
    if (render_components == true) Bottom(3);
}

// ========================== FEET ==========================

module Foot(mode) {
    if(mode == 1 || mode == 4) {
        color("Gray")
        difference() {
            difference() {
                cylinder(d = foot_size_x, h = foot_size_z);
                union() {
                    translate([0, 0, foot_size_z - (felt_glider_size_z * 1/2)]) cylinder(d = felt_glider_size_x, h = felt_glider_size_z);
                    translate([0, 0, 1]) cylinder(d = screw_head_diameter_max + 1, h = foot_size_z);
                }
            };
            translate([0, 0, 1]) Screw(2, 1.01, screw_shaft_diameter);
        }
    }
    // Screw:
    translate([0, 0, 1]) Screw(mode, 1.01, screw_shaft_diameter);
    // Felt glider:
    if(mode == 3 || mode == 4) {
        color("Black", 0.4) translate([0, 0, foot_size_z - (felt_glider_size_z * 1/2)]) cylinder(d = felt_glider_size_x, h = felt_glider_size_z);
    }
}

module Foot_Assembly() {
    Foot(1);
}

module Feet(mode) {
    translate([feet_front_distance_x, feet_front_distance_y, 0]) rotate([180, 0, 0]) {
        Foot(mode);
    }
    translate([case_size_width - feet_front_distance_x, feet_front_distance_y, 0]) rotate([180, 0, 0]) {
        Foot(mode);
    }
    translate([feet_back_distance_x, case_size_depth - feet_back_distance_y, 0]) rotate([180, 0, 0]) {
        Foot(mode);
    }
    translate([case_size_width - feet_back_distance_x, case_size_depth - feet_back_distance_y, 0]) rotate([180, 0, 0]) {
        Foot(mode);
    }
}

module Feet_Assembly() {
    Feet(1);
    if (render_components == true) Feet(3);
}

// ========================== FRONT PART ==========================

module Front_Upper(mode) {
    
    if (mode == 1 || mode == 4) {
        translate([-1, -front_depth, front_lower_height + front_center_height]) {
            color(color_case) cube([front_width + 2, front_depth, front_upper_height]);
            
            // Add three backets to hold the front to the cover:
            translate([4, front_depth, 0]) color(color_case) cube([11, 2, front_upper_height - cover_edges_size - 0.9]);
            translate([4, front_depth + 1.9, 0]) color(color_case) cube([11, 1, front_upper_height - 1.3]);
            
            translate([98, front_depth, 0]) color(color_case) cube([11, 2, front_upper_height - cover_edges_size - 0.9]);
            translate([98, front_depth + 1.9, 0]) color(color_case) cube([11, 1, front_upper_height - 1.3]);
                
            translate([157, front_depth, 0]) color(color_case) cube([11, 2, front_upper_height - cover_edges_size - 0.9]);
            translate([157, front_depth + 1.9, 0]) color(color_case) cube([11, 1, front_upper_height - 1.3]);
            
            color("LightGray") translate([83, 2, front_upper_height ]) linear_extrude(0.4) text("PRECISION TRUE SINE", size=6);
        }
    }
}

module Front_Upper_Assembly(mode) {
    difference() {
        Front_Upper(1);
        Front_Upper(2);
        front_center(2);
        front_center(5);
    }
    color(color_case) translate([-1, -1, front_lower_height + front_center_height]) cube([73, 1, 1]); // Stop brim
}

module Front_Center_Cover() { // Special case: thin cover for the voltmeter that goes into the center part of the front

   translate([voltmeter_pos_x + 0.85, -front_depth + voltmeter_windowpane_thickness , front_lower_height + ((front_center_height - 21.5) / 2) + .75]) color(color_front_center, transparency_voltmeter_window_window) rotate([90, 0, 0]) cube([40.4 - (0.85 * 2), 21.5 - (.75 * 2), voltmeter_windowpane_thickness]);
}

module front_center(mode) {
    
    if (mode == 2 || mode == 4) {
        Voltmeter_Cover(mode);
    }
        
    if (mode == 5 || mode == 4) { // Things to remove from other front parts
            color(color_case, transparency_front_center) translate([-1, -front_depth - 0.001, front_lower_height]) {
            translate([4.5 , (front_depth / 2) - 1 - 0.5, front_center_height - 0.01]) cube([front_width + 2 - 10 + 1, 2 + 1, 6.5]);
            translate([4.5 , (front_depth / 2) - 1 - 0.5, - 5 - 0.499]) cube([front_width + 2 - 10 + 1, 2 + 1, 5 + 0.5]);            
        }
    }
    
    if (mode == 1 || mode == 4) {
        color(color_front_center, transparency_front_center) translate([-1, -front_depth - 0.001, front_lower_height])
        {
            cube([front_width + 2, front_depth, front_center_height]); 
            translate([5 , (front_depth / 2) - 1, front_center_height]) cube([front_width + 2 - 10, 2, 6]);
            translate([5 , (front_depth / 2) - 1, - 5]) cube([front_width + 2 - 10, 2, 5]);
        }
    }
    
    translate([two_line_display_pos_x,  0.01, front_lower_height - 5 + 1]) Two_Line_Display(mode);
    translate([voltmeter_pos_x, -1.2, front_lower_height + ((front_center_height - 21.5) / 2)+ 0]) AC_Voltmeter(mode);
    
}

module Front_Center_Assembly() {
   
    if (render_components == true) front_center(3); // Must be called first, otherwise the transparency fails.
    
    color(color_front_center, transparency_front_center) difference() {
        front_center(1);
        front_center(2);
    }
   
    // Also cover the voltmeter:
    Front_Center_Cover();
}

module Front_Back_Sub(mode, feet_distance_x, feet_distance_y) {
    color(color_case)
    if (mode == 1 || mode == 4) {
        translate([0, -front_depth, 0]) {
            //Additional edge to hold bottom plate:
            translate([0, 0, -1]) {
                //cube([front_width, front_depth + 2, 1]);
            }
        }
    }
}

module Front_Lower(mode) {
    color(color_case)
    
    if (mode == 1 || mode == 4) {
        
        translate([0, -front_depth, 0]) {
            // Main part:
            translate([-1, 0, -1]) cube([front_width + 2, front_depth, front_lower_height + 1]);
            

        }
        Front_Back_Sub(mode, feet_front_distance_x, feet_front_distance_y);
    } 
    
    if (mode == 2 || mode == 4) {
        color(color_case) Feet(2);
    }
}

module Front_Lower_Assembly() {
    color(color_case) difference() {
        Front_Lower(1);
        Front_Lower(2);
        front_center(2);
        front_center(5);
        Voltmeter_Cover(2);
        Bottom(2);
        Buttons(2);
        Buttons(5);
    }
    color(color_case) translate([13, -1, -1]) cube([73, 1, 1]); // Stop brim
    color("LightGray") Buttons(6);
}

// ========================== BACK PART ==========================

module Back(mode) {
    
    fan_pos_z = 34; // Dertermined by eye, must be above the licensing text and above the screws of the bottom plate.
    fan_dist_from_top = back_height - fan_pos_z - fan_cover_width / 2;
    fan_pos_x = back_width + 1 - fan_cover_width / 2 - fan_dist_from_top;
    
    connection_terminal_width = (back_width + 2) - fan_dist_from_top * 3 - fan_cover_width;
    connection_terminal_height = fan_cover_width;
    connection_terminal_pos_z = fan_pos_z - (fan_cover_width / 2) + 1;
    connection_terminal_pos_x = fan_dist_from_top;
    
    if (mode == 1 || mode == 4) {
        
        translate([0, -back_depth, 0]) {
            // Main part:
            translate([-1, 0, -1]) {
                color(color_case) difference() {
                    cube([back_width + 2, back_depth, back_height + 1]);
                    for (i = [0 : 5.9655: back_width]) {
                        translate([3 + i, -3, back_height]) cube([3, back_depth, 5]);
                        translate([3 + i, -0.01, back_height-4]) cube([3, 1, 20]);
                    }
                    translate([connection_terminal_pos_x, -0.01, connection_terminal_pos_z]) {
                        hull() {
                            cube([connection_terminal_width, 0.01, connection_terminal_height]);
                            translate([2.5, 0, 2.5])  cube([connection_terminal_width - 5 , 3, connection_terminal_height - 5]);
                        }
                    };
                };
                
                translate([2, 0, 7]) rotate([90, 0, 0]) color("LightGray") linear_extrude(0.4) text("This is open source hardware, licensed under the CERN-OHL-S v2.", font="Arial:style=Bold", size=4);
                translate([2, 0, 2]) rotate([90, 0, 0]) color("LightGray") linear_extrude(0.4) text("Source code: https://github.com/sebmate/MagicQuartz-TechDemo", font="Arial:style=Bold", size=4);
            }
        }
        Front_Back_Sub(mode, feet_back_distance_x, feet_back_distance_y);
        
    }
    translate([fan_pos_x, -4, fan_pos_z]) rotate([90, 0, 0]) Fan(mode);
    //translate([105 + 3, -4, 34]) rotate([90, 0, 0]) Fan(mode);  
 
    translate([98, 0, 38]) rotate([-90, 0, 0]) Fuse_Holder(mode);
    translate([98, 0, 50]) rotate([-90, 0, 0]) Fuse_Holder(mode);
    
    translate([0, -back_depth, 0]) translate([-1, 0, -1]) translate([connection_terminal_pos_x, -0.01, connection_terminal_pos_z]) translate([2.5, 3, 2.5])
        translate([2.5, 0, 2.5]) {
         
            start = 23;
            step = 14.9;
            text_ofs = 1.5;
            text_pos_z = 2;
            
            translate([7, 0, 22]) rotate([90, 0, 0]) Rocker_Switch(mode);
            translate([-1.2, 0, text_pos_z]) rotate([90, 0, 0]) color("LightGray") linear_extrude(0.4) text("Power", font="Arial:style=Bold", size=4);

            translate([start, 0, 26]) rotate([90, 0, 0]) Headphone_Jack(mode);
            translate([start + text_ofs - 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Signal", font="Arial:style=Bold", size=4);
            translate([start + text_ofs + 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Out", font="Arial:style=Bold", size=4);
            
            translate([start + step * 1, 0, 26]) rotate([90, 0, 0]) DC_Power_Jack(mode);
            translate([start + step * 1 + text_ofs - 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Phase", font="Arial:style=Bold", size=4);
            translate([start + step * 1 + text_ofs + 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text(" 1 Out", font="Arial:style=Bold", size=4);
            
            translate([start + step * 2, 0, 26]) rotate([90, 0, 0]) DC_Power_Jack(mode);
            translate([start + step * 2 + text_ofs - 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Phase", font="Arial:style=Bold", size=4);
            translate([start + step * 2 + text_ofs + 2.5, 0, text_pos_z]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text(" 2 Out", font="Arial:style=Bold", size=4);

            //translate([22, 0, 11]) rotate([90, 0, 0]) color("LightGray") linear_extrude(0.4) text("Amp Phase", font="Arial:style=Bold", size=4);
            //translate([30, 0, 5]) rotate([90, 0, 0]) color("LightGray") linear_extrude(0.4) text("1 + 2", font="Arial:style=Bold", size=4);
        
            translate([start + step * 3, 0, 6]) rotate([90, 0, 0]) Headphone_Jack(mode);
            translate([start + step * 3 + text_ofs - 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Optical", font="Arial:style=Bold", size=4);
            translate([start + step * 3 + text_ofs + 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("Sensor", font="Arial:style=Bold", size=4);

            translate([start + step * 4, 0, 6]) rotate([90, 0, 0]) DC_Power_Jack(mode);
            translate([start + step * 4 + text_ofs - 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("DC In", font="Arial:style=Bold", size=4);
            translate([start + step * 4 + text_ofs + 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("24V 2A", font="Arial:style=Bold", size=4);

            translate([start + step * 5, 5, 6]) rotate([90, 0, 0]) Power_Cord(mode);
            translate([start + step * 5 + text_ofs - 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("AC Out", font="Arial:style=Bold", size=4);
            translate([start + step * 5 + text_ofs + 2.5, 0, 13]) rotate([90, -90, 0]) color("LightGray") linear_extrude(0.4) text("220V", font="Arial:style=Bold", size=4);
            
         }
}

module Back_Assembly() {
    translate([back_width, case_size_depth, 0]) {
        rotate([0, 0, 180]) Back(5);
    }
    difference() {
        translate([back_width, case_size_depth, 0]) rotate([0, 0, 180]) {
            difference() {
                Back(1);
                Back(2);
            }
            if(render_components == true) Back(3);
        }
        color(color_case) Feet(2);
        Bottom(2);
    }
}

// ========================== COVER ==========================

module Cover(mode) {

    color(color_cover, transparancy_cover) // Make it transparent
    if (mode == 1 || mode == 4) {
        union() {
                        translate([cover_screw_distance, 10, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([-cover_screw_distance, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height- 10.002]);
            }
            translate([cover_screw_distance, case_size_depth / 2, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([-cover_screw_distance, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height - 10.002]);
            }
            translate([cover_screw_distance, case_size_depth - 10, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([-cover_screw_distance, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height - 10.002]);
            }
            translate([case_size_width - cover_screw_distance, 10, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([0, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height - 10.002]);
            }
            translate([case_size_width - cover_screw_distance, case_size_depth / 2, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([0, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height - 10.002]);
            }
            translate([case_size_width - cover_screw_distance, case_size_depth - 10, case_bottom_height]) {
                cylinder(d = screw_shaft_diameter + 3, h = front_height - case_bottom_height - 0.001);
                translate([0, -0.5, 10]) cube([cover_screw_distance, 1, front_height - case_bottom_height - 10.002]);
            }
            
            //union() {
                                
                // Edges:
                // Left side: (not required)
                //translate([0, 0, case_bottom_height]) cube([cover_edges_size, 1, front_height - case_bottom_height]);
                //translate([0, case_size_depth - 1, case_bottom_height]) cube([cover_edges_size, 1, front_height - case_bottom_height]);
                // Right side: (not required)
                //translate([case_size_width - cover_edges_size, 0, case_bottom_height]) cube([cover_edges_size, 1, front_height - cover_edges_size - case_bottom_height]);
                //translate([case_size_width - cover_edges_size, case_size_depth -1, case_bottom_height]) cube([cover_edges_size, 1, front_height - cover_edges_size - case_bottom_height]);
                
                // Add stiffness to top side:
                translate([-0.001, 0, front_height - cover_edges_size]) cube([case_size_width, 1, cover_edges_size]);
                translate([-0.001, case_size_depth - 1.001, front_height - cover_edges_size]) cube([case_size_width, 1, cover_edges_size]);
                // Add some more to the top to prevent flexing:
                //translate([0, 9.5, front_height - cover_top_height - 9.5]) cube([case_size_width, 1, 10]);
                //translate([0, case_size_depth - 10.5, front_height - cover_top_height - 10.5]) cube([case_size_width, 1, 10]);
 
                // Rigidity cross:
                hull() {
                    translate([-1, 0, front_height - cover_rigidity_grid_height - 0.001]) cube([1, 1, cover_rigidity_grid_height]);
                    translate([case_size_width, case_size_depth -1, front_height - cover_rigidity_grid_height - 0.001]) cube([1, 1, cover_rigidity_grid_height]);        
                }
                hull() {
                    translate([-1, case_size_depth - 1, front_height - cover_rigidity_grid_height - 0.001]) cube([1, 1, cover_rigidity_grid_height]);
                    translate([case_size_width, 0, front_height - cover_rigidity_grid_height - 0.001]) cube([1, 1, cover_rigidity_grid_height]);
                }
                
                //Top:
                if (material_saver == true && generate == 5) {
                    translate([0 - 0.001, 0, front_height - material_saver_grid_bar_height]) cube([case_size_width, 10, material_saver_grid_bar_height]);
                    translate([0 - 0.001, case_size_depth - 10, front_height - material_saver_grid_bar_height]) cube([case_size_width, 10, material_saver_grid_bar_height]);
                    
                    translate([0 - 0.001, 0, front_height - material_saver_grid_bar_height]) cube([5, case_size_depth, material_saver_grid_bar_height]);
                    translate([case_size_width - 5 - 0.001, 0 , front_height - material_saver_grid_bar_height]) cube([5, case_size_depth, material_saver_grid_bar_height]);
                    
                    translate([0 - 0.001 - 1, 0, front_height - material_saver_bottom_height ])  cube([case_size_width + 2, case_size_depth, material_saver_bottom_height]);
                 
                    translate([0 - 0.001, 0, front_height - material_saver_grid_bar_height]) {
                    
                        // The starting points 11.6 and 1.6 aim to center the grid.
                        for (x = [11.6 : material_saver_grid_bar_step: case_size_width]){
                            translate([x, 0, 0]) {
                                 cube([material_saver_grid_bar_width, case_size_depth, material_saver_grid_bar_height]);
                            }
                        }
                        for (y = [1.6 : material_saver_grid_bar_step: case_size_depth]){
                            translate([0, y, 0]) {
                                 cube([case_size_width, material_saver_grid_bar_width, material_saver_grid_bar_height]);
                            }
                        }
                    }

                } else {
                    translate([0 - 0.001, 0, front_height - cover_top_height]) cube([case_size_width, case_size_depth, cover_top_height]);
                }
                
                // Sides (difficult to save material here):
                translate([-1 - 0.001, 0, -1]) cube([1, case_size_depth, front_height + 1]);
                translate([case_size_width + 0.001, 0, -1]) cube([1, case_size_depth, front_height + 1]);
            }
    } 
    
    // Screws:
    
    translate([cover_screw_distance, 10, 1]) rotate([180, 0, 1]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);
    translate([cover_screw_distance, case_size_depth / 2, 1]) rotate([180, 0, 0]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);
    translate([cover_screw_distance, case_size_depth - 10, 1]) rotate([180, 0, 0]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);
       
    translate([case_size_width - cover_screw_distance, 10, 1]) rotate([180, 0, 0]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);
    translate([case_size_width - cover_screw_distance, case_size_depth / 2, 1]) rotate([180, 0, 0]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);
    translate([case_size_width - cover_screw_distance, case_size_depth - 10, 1]) rotate([180, 0, 0]) Screw(mode, case_bottom_height - 0.99, screw_shaft_diameter);

}

module Cover_Assembly() {
    if (render_components == true) Cover(3);
    difference() {
        Cover(1);
        Cover(2);
    }
}

// ========================== BUTTON ASSEMBLY ==========================

buttons_count = 4;
buttons_step_x = 10;
buttons_pos_x = pcb_mainboard_pos_x + 6.5 - (2.5 / 2);
buttons_pos_y = screw_holder_hight + 1.6;
buttons_width = 7 + 2.5;
buttons_height = 7;
buttons_width_total = buttons_width * 4 + 2.5;

// Simple visual test for buttons_width_total:
// translate([buttons_pos_x - 0.5, -15, 0]) cube([buttons_width_total, 10, 15]);

module Buttons(mode) {
    
    translate([buttons_pos_x, -front_depth - 1, buttons_pos_y]) {
        for (i = [0 : buttons_count - 1]) {
            translate([i * buttons_step_x, 0, 0]) {
                if (mode == 1) color(color_buttons) {
                    hull() {
                            cube([buttons_width, front_depth + 3.4, 7]);
                            translate([1, -1, 0.5]) cube([buttons_width - 2, front_depth + 3.4, 7 - 1]);
                        }
                    }
                /*
                color("DarkGray") {    
                    if (i == 0 && mode == 1) translate([1.8, 0, 1.1]) rotate([90, 0, 0]) linear_extrude(0.4) text("◀", font="Symbola", size=6);
                    if (i == 1 && mode == 1) translate([2, 0, 1.1]) rotate([90, 0, 0]) linear_extrude(0.4) text("▶", font="Symbola", size=6);
                    if (i == 2) {
                        if (mode == 1) translate([1.5, 0, 1.1]) rotate([90, 0, 0]) linear_extrude(0.4) text("▲", font="Symbola", size=6);
                        if (mode == 6) translate([1.5, 1, -7]) rotate([90, 0, 0]) linear_extrude(0.2) text("✘", font="Symbola", size=6);
                    }
                    if (i == 3) {
                        if (mode == 1) translate([1.5, 0, 1.1]) rotate([90, 0, 0]) linear_extrude(0.4) text("▼", font="Symbola", size=6);
                        if (mode == 6) translate([1.5, 1, -7]) rotate([90, 0, 0]) linear_extrude(0.2) text("✔", font="Symbola", size=6);
                    }
                }*/

                if (mode == 6) {
                    if (i == 0) translate([3, 1, -5]) rotate([90, 0, 0]) linear_extrude(0.4) text("◀", font="Symbola", size=4);
                    if (i == 1) translate([3, 1, -5]) rotate([90, 0, 0]) linear_extrude(0.4) text("▶", font="Symbola", size=4);
                    if (i == 2) {
                        translate([3, 1, -5]) rotate([90, 0, 0]) linear_extrude(0.4) text("▼", font="Symbola", size=4);
                        translate([3, 1, -9.5]) rotate([90, 0, 0]) linear_extrude(0.4) text("✘", font="Symbola", size=4);
                    }
                    if (i == 3) {
                        translate([3, 1, -5]) rotate([90, 0, 0]) linear_extrude(0.4) text("▲", font="Symbola", size=4);
                        translate([3, 1, -9.5]) rotate([90, 0, 0]) linear_extrude(0.4) text("✔", font="Symbola", size=4);
                    }
                }
            }

            if (mode == 1) color(color_buttons) {   
                translate([i * buttons_step_x, front_depth + 3.4 - buttons_bending_part_thickness, - (screw_holder_hight + 1.6 - case_bottom_height) + 0.5]) cube([buttons_width, buttons_bending_part_thickness, 7 + (screw_holder_hight + 1.6 - case_bottom_height -0.5)]);
                translate([-10, front_depth + 1, -buttons_pos_y + case_bottom_height + 0.5]) cube([20 + buttons_count * buttons_step_x - 0.5, 3.4 -1, 2]);
                translate([-10, front_depth + 1, -buttons_pos_y + case_bottom_height + 0.5]) cube([8, 3.4 - 1, 8]);
                translate([10 + buttons_count * buttons_step_x - 0.5 - 8, front_depth + 1, -buttons_pos_y + case_bottom_height + 0.5]) cube([8, 3.4 - 1, 8]);
            }
        }
        translate([-10 + 4, front_depth + 1 + (3.4 - 1), -buttons_pos_y + case_bottom_height + 4 + 0.5]) rotate([-90, 0, 0]) Screw(mode, 3.4 - 0.99, screw_shaft_diameter);
        translate([10 + buttons_count * buttons_step_x - 0.5 - 8 + 4, front_depth + 1 + (3.4 - 1), -buttons_pos_y + case_bottom_height + 4 + 0.5]) rotate([-90, 0, 0]) Screw(mode, 3.4 - 0.99, screw_shaft_diameter);
    }
        
    if (mode == 5) {
        translate([buttons_pos_x, -front_depth - 1, buttons_pos_y])
        for (i = [0 : buttons_count - 1]){
            translate([i * buttons_step_x - 0.5, 0, -0.5]) color(color_case, 1) cube([buttons_width + 1, front_depth + 3.4, 7 + 1]);
        };
    }
    
}

module Buttons_Assembly() {
    difference() {
        Buttons(1);
        Buttons(2);
    }
    if(render_components == true) Buttons(3);
}



// ========================== OTHER PARTS ==========================

module Dummy_Sockets() {
    step = 14.9;
    union() {
        
        hull() {
            translate([0, 0, -0.5])  cylinder(d=14, h=0.5);
            translate([step * 2, 0, -0.5])  cylinder(d=14, h=0.5);
        }

        translate([0, 0, 0]) cylinder(d=13, h=3);
        translate([step * 1, 0, 0]) cylinder(d=13, h=3);
        translate([step * 2, 0, 0]) cylinder(d=13, h=3);

        translate([0, 0, 0])  cylinder(d=7.5, h=7);
        translate([step * 1, 0, 0]) cylinder(d=7.5, h=7);
        translate([step * 2, 0, 0]) cylinder(d=7.5, h=7);
    }
}

module Optical_Sensor_Half() {
    difference() {
        cube([23, 20, 8.5/2]); // Case
        translate([2, -0.001, .5]) cube([7.5, 6, 7.5]); // CNY70
        translate([2, 2, .5]) cube([23-4, 20-4, 8.5/2]); // Inner space
        translate([23/2, 20, 8.5/2]) rotate([90,0,0]) cylinder(d=4.5, h=7, center = true); // Cable
    }
}

module Optical_Sensor() {
    Optical_Sensor_Half();
    translate([48, 0, 0]) mirror([1, 0, 0]) Optical_Sensor_Half();
}

// ========================== PARTS GENERATION ==========================

if (generate == 0) { // Whole unit

    Bottom_Assembly();
    Voltmeter_Cover_Assembly();
    Front_Upper_Assembly();
    Front_Lower_Assembly();
    Front_Center_Assembly();
    Back_Assembly();
    Feet_Assembly();
    Buttons_Assembly();
    if(transparancy_cover > 0) Cover_Assembly();
    
} else if (generate == 1) { // Bottom
    
    Bottom_Assembly();
    
} else if (generate == 2) { // Front lower part
    
    Front_Lower_Assembly();

 } else if (generate == 3) { // Front center part
    
     rotate([90, 0, 0]) {
        Front_Center_Assembly();
     }

} else if (generate == 4) { // Front upper part
    
    Front_Upper_Assembly();
    
} else if (generate == 5) { // Cover
    
    color(color_cover, 1) rotate([180, 0, 90]) Cover_Assembly();

} else if (generate == 6) { // Single foot
    
    Foot_Assembly();

} else if (generate == 7) { // Voltmeter Cover
    
    rotate([90, 0, 0]) Voltmeter_Cover_Assembly();

} else if (generate == 8) { // Buttons
    
    rotate([-90, 0, 0]) Buttons_Assembly();

} else if (generate == 9) { // Back
   
    translate([0, 0, -case_size_depth]) rotate([90, 0, 0]) Back_Assembly();

} else if (generate == 10) { // Dummy Sockets
   
   Dummy_Sockets();

} else if (generate == 11) { // Optical Sensor
   
   Optical_Sensor();

}

//Mainboard(3);
