#ifndef animated_cat_sprite_functions_h
#define animated_cat_sprite_functions_h

#include <gb/gb.h>
#include <stdio.h>
#include "sprites/cat.h"

// Function prototypes
void setup_cat(void);

void setup_cat(void)
{

    set_sprite_data(0, cat_size, cat);

    for (int i = 0; i < cat_size; i++)
    {
        set_sprite_tile(i, cat_tilemap[i]);
    }

    int start_x = 32;
    int start_y = 80;
    int tile_width = 8;
    int tile_height = 8;
    int sprite_index = 0;

    for (int row = 0; row < 4; row++)
    {
        for (int col = 0; col < 4; col++)
        {
            move_sprite(sprite_index, start_x + col * tile_width, start_y + row * tile_height);
            sprite_index++;
            if (sprite_index > 15)
                break; 
        }
    }

    SHOW_SPRITES; // Show the sprites on the screen
}

#endif