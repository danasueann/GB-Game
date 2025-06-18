#include <gb/gb.h>
#include <stdio.h>
#include "include/vwf.h"
#include "include/vwf_font.h"
#include "include/vwf_font_bold.h"
#include "include/vwf_font_ru.h"

#include "backgrounds/background_cat.h"
#include "backgrounds/background_dog.h"
#include "home.h"
#include "backgrounds/SelectMenu_tileset.h"
#include "SelectMenu.h"
#include "sprites/cat.h"
#include "cat_animated.h"
#include "sprites/jester.h"
#include "jester.h"
#include "keyboard.h"
#include "foregrounds/hud.h"




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
        clear_background();
        clear_sprites();
        setup_home_background_cat();
        setup_cat_home();
    }
    else if (selected_pet == 1)
    {
        clear_background();
        clear_sprites();
        setup_home_background_dog();
        
        setup_jester_home();
    }
}

void clear_background()
{
    for (UBYTE x = 0; x < 20; x++) {
        for (UBYTE y = 0; y < 18; y++) {
            set_bkg_tile_xy(x, y, 0);
        }
    }
    HIDE_BKG;
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