#include "sprites/Poodle2.h"

void setup_dog_sprite_selection(void) {

    
    // Tiles in den VRAM laden (ab Tile 0)
    set_sprite_data(0, 19, Poodle2_tiles); // 304 bytes / 16 bytes per tile = 19 tiles
    
    // Sprites anzeigen aktivieren
    SHOW_SPRITES;
    
    // Test: Einen einfachen Sprite anzeigen
    set_sprite_tile(0, 1); // Sprite 0 verwendet Tile 1
    move_sprite(0, 80, 80); // Position auf dem Bildschirm
}

void setup_dog_sprite_main(void) {
    // Position für den Hund-Sprite (beispielhafte Koordinaten)
    uint8_t dog_x = 80;
    uint8_t dog_y = 72;
    uint8_t sprite_index = 0;
    
    
    // Tiles in den VRAM laden
    set_sprite_data(0, 19, Poodle2_tiles);
    
    // Sprites basierend auf der Map-Daten positionieren
    // Die Map ist 5x5 Tiles, also 5 Spalten und 5 Reihen
    for (uint8_t row = 0; row < 5; row++) {
        for (uint8_t col = 0; col < 5; col++) {
            uint8_t tile_id = Poodle2_map[row * 5 + col];
            uint8_t sprite_x = dog_x + (col * 8); // 8 Pixel pro Tile
            uint8_t sprite_y = dog_y + (row * 8);
            
            // Sprite setzen: sprite_index, x, y, tile_id
            set_sprite_tile(sprite_index, tile_id);
            move_sprite(sprite_index, sprite_x, sprite_y);
            
            sprite_index++;
            
            // Maximale Anzahl von Sprites pro Scanline beachten (10 Sprites)
            if (sprite_index >= 40) break; // Game Boy hat maximal 40 Sprites
        }
        if (sprite_index >= 40) break;
    }
    
    // Sprites anzeigen aktivieren
    SHOW_SPRITES;
}