
#ifndef HOME_C
#define HOME_C

void setup_home_background_cat(void);
void setup_home_background_dog(void);
void display_pet_name(void);


void setup_home_background_cat()
{
    set_bkg_data(0, 216, background_cat);
    set_bkg_tiles(0, 0, 20, 18, background_cat_tilemap);
    SCY_REG = 0;
    display_pet_name();
    SHOW_BKG;
    DISPLAY_ON;
    
}
void setup_home_background_dog()
{
    // Lade Hintergrund-Tiles ab Index 0
    set_bkg_data(0, 216, background_dog);
    set_bkg_tiles(0, 0, 20, 18, background_dog_tilemap);

    SHOW_BKG;
    DISPLAY_ON;
    display_pet_name();
}

void display_pet_name()
{

    vwf_load_font(0, font_ru, BANK(font_ru));
    vwf_activate_font(0);
    vwf_set_destination(VWF_RENDER_BKG);
    vwf_draw_text(5, 0, 217, get_pet_name());
}

#endif