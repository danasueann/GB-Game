// functions.h
#ifndef dog_sprite_functions_h
#define dog_sprite_functions_h

#include <gb/gb.h>
#include <stdio.h>
#include "sprites/Jester.c"

#define SPRITE_WIDTH 8
#define GRID_SIZE 5

void init_big_sprite(UINT8 start_sprite_id, UINT8 x, UINT8 y) {
    UINT8 sprite_id = start_sprite_id;
    UINT8 tile_id = 0;
    
    for (UINT8 row = 0; row < GRID_SIZE; row++)
    {
        for (UINT8 col = 0; col < GRID_SIZE; col++)
        {
            set_sprite_tile(sprite_id, tile_id);
            move_sprite(sprite_id, x + col * SPRITE_WIDTH, y + row * SPRITE_WIDTH);
            // WICHTIG: Sprite sichtbar machen!
            set_sprite_prop(sprite_id, 0x00); // Keine besonderen Properties, normal anzeigen
            sprite_id++;
            tile_id++;
        }
    }
}

void setup_dog_sprite_selection() {
    // Sprites aktivieren
    SPRITES_8x8;
    
    // dog sprite data - 25 tiles (0x00 to 0x18, da 25 tiles = 0x00 bis 0x18)
    set_sprite_data(0, 25, Jester);
    
    init_big_sprite(0, 40, 40);
    
    // Sprites anzeigen aktivieren
    SHOW_SPRITES;
}


void setup_dog_sprite_main()
{
    // dog sprite data
    set_sprite_data(0, 6, Jester);

    // Set each sprite to use the correct tile
    set_sprite_tile(0, 0); // Sprite 0 uses tile 0
    set_sprite_tile(1, 1); // Sprite 1 uses tile 1
    set_sprite_tile(2, 2); // Sprite 2 uses tile 2
    set_sprite_tile(3, 3); // Sprite 3 uses tile 3
    set_sprite_tile(4, 4); // Sprite 4 uses tile 4
    set_sprite_tile(5, 5); // Sprite 5 uses tile 5

    // Position sprites to form 3x2 grid (6 tiles total)
    move_sprite(0, 48, 40); // top left
    move_sprite(1, 56, 40); // top right
    move_sprite(2, 48, 48); // middle left
    move_sprite(3, 56, 48); // middle right
    move_sprite(4, 48, 56); // bottom left
    move_sprite(5, 56, 56); // bottom right
}

#endif