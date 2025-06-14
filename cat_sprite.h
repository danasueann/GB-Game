#ifndef cat_sprite_functions_h
#define cat_sprite_functions_h

#include <gb/gb.h>
#include <stdio.h>
#include "sprites/CatSprite.h"

// Function prototypes
void setup_cat_sprite_selection(void);
void setup_cat_sprite_main(void);

void setup_cat_sprite_selection(void)
{

    set_sprite_data(6, 9, CatSprite);
    set_sprite_tile(6, 6);
    set_sprite_tile(7, 7);
    set_sprite_tile(8, 8);
    set_sprite_tile(9, 9);
    set_sprite_tile(10, 10);
    set_sprite_tile(11, 11);
    set_sprite_tile(12, 12);
    set_sprite_tile(13, 13);
    set_sprite_tile(14, 14);

    move_sprite(6, 96, 36);   // up left
    move_sprite(7, 104, 36);  // up middle
    move_sprite(8, 112, 36);  // up right
    move_sprite(9, 96, 44);   // middle left
    move_sprite(10, 104, 44); // middle middle
    move_sprite(11, 112, 44); // middle right
    move_sprite(12, 96, 52);  // down left
    move_sprite(13, 104, 52); // down middle
    move_sprite(14, 112, 52); // down right
}

void setup_cat_sprite_main(void)
{
    // load cat sprite
    set_sprite_data(0, 9, CatSprite);

    // cat 3x3 Tiles Layout
    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    set_sprite_tile(4, 4);
    set_sprite_tile(5, 5);
    set_sprite_tile(6, 6);
    set_sprite_tile(7, 7);
    set_sprite_tile(8, 8);

    // cat positioning
    move_sprite(0, 68, 36);
    move_sprite(1, 76, 36);
    move_sprite(2, 84, 36);
    move_sprite(3, 68, 44);
    move_sprite(4, 76, 44);
    move_sprite(5, 84, 44);
    move_sprite(6, 68, 52);
    move_sprite(7, 76, 52);
    move_sprite(8, 84, 52);
}

#endif