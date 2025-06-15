// functions

#ifndef HOME_C
#define HOME_C

#include <gb/gb.h>
#include <stdio.h>
#include "backgrounds/background_final.h"

void setup_home_background(void);

void setup_home_background()
{
    // Lade Hintergrund-Tiles ab Index 0
    set_bkg_data(0, 216, background_final_tiles);
    set_bkg_tiles(0, 0, 20, 18, background_final_map);

    SHOW_BKG;
    DISPLAY_ON;
}

#endif