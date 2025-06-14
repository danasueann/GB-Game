#include "sprites/Poodle2.c"

void setup_dog2_sprite_selection(void) {

}

void setup_dog2_sprite_main(void) {
    // Position für den Hund-Sprite
    uint8_t dog_x = 60;
    uint8_t dog_y = 60;
    uint8_t sprite_index = 30; // WICHTIG: Anderen Sprite-Slot verwenden!
    uint8_t tile_offset = 40;  // WICHTIG: Anderen Tile-Bereich verwenden!
    
    // Tiles in einen anderen VRAM-Bereich laden
    set_sprite_data(tile_offset, 19, Poodle2_tiles);
    
    // Alte Sprites in diesem Bereich löschen (optional)
    for (uint8_t i = sprite_index; i < sprite_index + 25; i++) {
        move_sprite(i, 0, 0);
        set_sprite_tile(i, 0);
    }
    
    // Sprites positionieren
    for (uint8_t row = 0; row < 5; row++) {
        for (uint8_t col = 0; col < 5; col++) {
            uint8_t tile_id = Poodle2_map[row * 5 + col];
            
            if (tile_id != 0) {
                uint8_t sprite_x = dog_x + (col * 8);
                uint8_t sprite_y = dog_y + (row * 8);
                
                // Tile-ID um offset verschieben
                set_sprite_tile(sprite_index, tile_id + tile_offset);
                move_sprite(sprite_index, sprite_x, sprite_y);
                
                sprite_index++;
                
                if (sprite_index >= 40) break;
            }
        }
        if (sprite_index >= 40) break;
    }
    
    SHOW_SPRITES;
}

// Funktion zum Löschen aller Sprites (nützlich beim Wechseln zwischen Screens)
void clear_all_sprites(void) {
    for (uint8_t i = 0; i < 40; i++) {
        move_sprite(i, 0, 0); // Sprites außerhalb des sichtbaren Bereichs bewegen
        set_sprite_tile(i, 0); // Sprite-Tile auf 0 setzen
    }
}

// Sprite-Manager Struktur für bessere Organisation
typedef struct {
    uint8_t sprite_start_index;
    uint8_t tile_data_offset;
    uint8_t num_sprites_used;
    uint8_t is_active;
} sprite_group_t;

static sprite_group_t poodle_selection = {10, 20, 0, 0};
static sprite_group_t poodle_main = {30, 40, 0, 0};

void setup_dog2_sprite_selection_managed(void) {
    // Vorherige Sprites dieser Gruppe deaktivieren
    if (poodle_selection.is_active) {
        for (uint8_t i = poodle_selection.sprite_start_index; 
             i < poodle_selection.sprite_start_index + poodle_selection.num_sprites_used; i++) {
            move_sprite(i, 0, 0);
            set_sprite_tile(i, 0);
        }
    }
    
    uint8_t dog_x = 25;
    uint8_t dog_y = 25;
    uint8_t sprite_index = poodle_selection.sprite_start_index;
    
    // Tiles laden
    set_sprite_data(poodle_selection.tile_data_offset, 19, Poodle2_tiles);
    
    // Sprites setzen
    for (uint8_t row = 0; row < 5; row++) {
        for (uint8_t col = 0; col < 5; col++) {
            uint8_t tile_id = Poodle2_map[row * 5 + col];
            
            if (tile_id != 0) {
                uint8_t sprite_x = dog_x + (col * 8);
                uint8_t sprite_y = dog_y + (row * 8);
                
                set_sprite_tile(sprite_index, tile_id + poodle_selection.tile_data_offset);
                move_sprite(sprite_index, sprite_x, sprite_y);
                
                sprite_index++;
                
                if (sprite_index >= 40) break;
            }
        }
        if (sprite_index >= 40) break;
    }
    
    poodle_selection.num_sprites_used = sprite_index - poodle_selection.sprite_start_index;
    poodle_selection.is_active = 1;
    
    SHOW_SPRITES;
}