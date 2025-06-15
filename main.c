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

UBYTE selected_pet = 0;

void main()
{
    DISPLAY_ON;

    setup_select_menu_background();

    // x und y Position für die Katze
    setup_cat(32, 80); // Set up the cat sprite at position (32, 80)

    // x und y Position für Jester
    setup_jester(110, 80); // Set up the jester sprite at position (110, 80)
    selected_pet = choose_pet();

    if (selected_pet == 0)
    {
        clear_background();
        clear_sprites();
        setup_home_background();
        setup_cat_home();
    }
    else if (selected_pet == 1)
    {
        clear_background();
        clear_sprites();
        setup_home_background();
        setup_jester_home();
    }
}

clear_background()
{
    set_bkg_tiles(0, 0, 20, 18, background_final_map);
    SHOW_BKG;
}

clear_sprites()
{

    for (UBYTE i = 0; i < 32; i++)
    {
        set_sprite_tile(i, 0);
    }
    HIDE_SPRITES;
}
