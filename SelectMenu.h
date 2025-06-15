// functions

#ifndef SELECTMENU_C
#define SELECTMENU_C

#include <gb/gb.h>
#include <stdio.h>
#include "backgrounds/SelectMenu_tileset.h"

void setup_select_menu_background(void);

void setup_select_menu_background()
{
    // Lade Hintergrund-Tiles ab Index 0
    set_bkg_data(0, 216, SelectMenu_tileset);
    set_bkg_tiles(0, 0, 20, 18, SelectMenu_tilemap);

    SHOW_BKG;
    DISPLAY_ON;
}



#endif