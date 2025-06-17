// functions

#ifndef HOME_C
#define HOME_C

void setup_home_background_cat(void);
void setup_home_background_dog(void);


void setup_home_background_cat()
{
    set_bkg_data(0, 216, background_cat);
    set_bkg_tiles(0, 0, 20, 18, background_cat_tilemap);
    // display_pet_name();
    SHOW_BKG;
    DISPLAY_ON;
}
void setup_home_background_dog()
{
    // Lade Hintergrund-Tiles ab Index 0
    set_bkg_data(0, 216, background_dog);
    set_bkg_tiles(0, 0, 20, 18, background_dog_tilemap);
    // display_pet_name();

    SHOW_BKG;
    DISPLAY_ON;
}

// void display_pet_name(void)
// {

//     vwf_load_font(0, vwf_font, BANK(vwf_font));
//     vwf_load_font(1, vwf_font_bold, BANK(vwf_font_bold));
//     vwf_load_font(2, font_ru, BANK(font_ru));
//     // Render our variable width font on the background layer
//     vwf_set_destination(VWF_RENDER_BKG);
//      vwf_draw_text(0, 0, 1, "This will be drawn on the screen.");
// }

#endif