#include <gb/gb.h>
#include <stdio.h>
#include "sprites/background_final.h"
#include "backgrounds/SelectMenu_tileset.h"
#include "SelectMenu.h"
#include "sprites/cat.h"
#include "cat_animated.h"
#include "sprites/jester.h"
#include "jester.h"

void main()
{
    DISPLAY_ON;

    setup_select_menu_background();

    setup_cat();
    setup_jester();

    // set_bkg_data(0, 216, background_final_tiles); // ANZAHL = Anzahl Tiles aus deiner Datei
    // set_bkg_tiles(0, 0, 20, 18, background_final_map);
    // SHOW_BKG;

}