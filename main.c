#include <gb/gb.h>
#include <stdio.h>
#include "backgrounds/background_final.h"
#include "home.h"
#include "backgrounds/SelectMenu_tileset.h"
#include "SelectMenu.h"
#include "sprites/cat.h"
#include "cat_animated.h"
#include "sprites/jester.h"
#include "jester.h"
#include "keyboard.h"

void clear_background(void);
void clear_sprites(void);

UBYTE selected_pet = 0;

void main()
{
    DISPLAY_ON;

    setup_select_menu_background();

    setup_cat(32, 80);     // Set up the cat sprite at position (32, 80)
    setup_jester(110, 80); // Set up the jester sprite at position (110, 80)

    selected_pet = choose_pet();
    clear_background();
    clear_sprites();

    // Initialize keyboard and name selection
    choose_name();
    keyboard_input_loop(); // This replaces the while loop from the original code

    if (pet_has_name)
    {
        scroll_bkg(4, 0);
        clear_background();
        clear_sprites();
    }

    if (selected_pet == 0)
    {
        setup_home_background();
        setup_cat_home();
    }
    else if (selected_pet == 1)
    {
        setup_home_background();
        setup_jester_home();
    }
}

void clear_background()
{
    set_bkg_tiles(0, 0, 20, 18, background_final_map);
    SHOW_BKG;
}

void clear_sprites()
{
    for (UBYTE i = 1; i < 32; i++)
    {
        move_sprite(i, 0, 0);
        set_sprite_tile(i, 0);
    }
    HIDE_SPRITES;
}