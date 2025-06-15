#ifndef CHOOSE_NAME_H
#define CHOOSE_NAME_H

#include <gb/gb.h>
#include <stdio.h>
#include <string.h>

// Konstanten
#define MAX_NAME_LENGTH 7
#define KEYBOARD_WIDTH 6
#define KEYBOARD_HEIGHT 5
#define KEYBOARD_SIZE 30

// Globale Variablen
extern char pet_name[MAX_NAME_LENGTH + 1];
extern char keyboard_chars[KEYBOARD_SIZE + 1];
extern UINT8 cursor_x, cursor_y;
extern UINT8 name_length;
extern UINT8 name_entry_done;

// Funktionsdeklarationen

/**
 * Initialisiert die Namenseingabe
 * Setzt alle Variablen zurück und bereitet die Anzeige vor
 */
void init_name_entry(void);

/**
 * Zeichnet die virtuelle Tastatur auf den Bildschirm
 * Zeigt alle verfügbaren Zeichen in einem 6x5 Grid an
 */
void draw_keyboard(void);

/**
 * Zeichnet den aktuell eingegebenen Namen
 * Position: oberer Bildschirmbereich
 */
void draw_current_name(void);

/**
 * Zeichnet den Cursor um das aktuell ausgewählte Zeichen
 */
void draw_cursor(void);

/**
 * Löscht den Cursor von der vorherigen Position
 */
void clear_cursor(void);

/**
 * Verarbeitet die Eingaben des D-Pads für die Navigation
 * @param joypad: Aktueller Zustand der Tasten
 */
void handle_navigation(UINT8 joypad);

/**
 * Verarbeitet die A-Taste (Zeichen auswählen)
 * Fügt das ausgewählte Zeichen zum Namen hinzu
 */
void handle_select_char(void);

/**
 * Verarbeitet die B-Taste (Zeichen löschen)
 * Entfernt das letzte Zeichen aus dem Namen
 */
void handle_delete_char(void);

/**
 * Verarbeitet die Start-Taste (Name bestätigen)
 * Beendet die Namenseingabe wenn mindestens ein Zeichen eingegeben wurde
 */
void handle_confirm_name(void);

/**
 * Hauptfunktion für die Namenseingabe
 * Läuft in einer Schleife bis ein Name bestätigt wurde
 * @return: 1 wenn Name eingegeben wurde, 0 bei Abbruch
 */
UINT8 choose_name(void);

/**
 * Hilfsfunktion: Wandelt Cursor-Position in Zeichen-Index um
 * @return: Index des ausgewählten Zeichens im keyboard_chars Array
 */
UINT8 get_selected_char_index(void);

/**
 * Hilfsfunktion: Überprüft ob ein Name gültig ist
 * @return: 1 wenn gültig, 0 wenn ungültig
 */
UINT8 is_name_valid(void);

/**
 * Zeigt eine Bestätigungsmeldung an
 * @param message: Anzuzeigende Nachricht
 */
void show_message(char* message);

/**
 * Löscht den gesamten Bildschirm
 */
void clear_screen(void);

/**
 * Wartet auf eine Tasteneingabe
 * @return: Gedrückte Taste(n)
 */
UINT8 wait_for_input(void);

// Implementierung der Funktionen (normalerweise in .c Datei)

// Globale Variablen Definition
char pet_name[MAX_NAME_LENGTH + 1] = {0};
char keyboard_chars[KEYBOARD_SIZE + 1] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123";
UINT8 cursor_x = 0;
UINT8 cursor_y = 0;
UINT8 name_length = 0;
UINT8 name_entry_done = 0;

void init_name_entry(void) {
    // Name zurücksetzen
    memset(pet_name, 0, MAX_NAME_LENGTH + 1);
    name_length = 0;
    
    // Cursor-Position zurücksetzen
    cursor_x = 0;
    cursor_y = 0;
    
    // Status zurücksetzen
    name_entry_done = 0;
    
    // Bildschirm vorbereiten
    clear_screen();
    draw_keyboard();
    draw_current_name();
    draw_cursor();
}

void draw_keyboard(void) {
    UINT8 i, x, y;
    
    // Titel anzeigen
    move_bkg(0, 0);
    set_bkg_tiles(6, 2, 11, 1, "ENTER NAME:");
    
    // Tastatur zeichnen (ab Zeile 8)
    for (i = 0; i < KEYBOARD_SIZE; i++) {
        x = (i % KEYBOARD_WIDTH) * 3 + 2;
        y = (i / KEYBOARD_WIDTH) + 8;
        
        set_bkg_tiles(x, y, 1, 1, &keyboard_chars[i]);
    }
    
    // Spezielle Optionen
    set_bkg_tiles(2, 14, 14, 1, "SELECT: Choose");
    set_bkg_tiles(2, 15, 9, 1, "B: Delete");
    set_bkg_tiles(2, 16, 13, 1, "START: Confirm");
}

void draw_current_name(void) {
    UINT8 i;
    char display_name[MAX_NAME_LENGTH + 2]; // +1 für Cursor, +1 für null terminator
    
    // Display-String vorbereiten
    for (i = 0; i < MAX_NAME_LENGTH + 1; i++) {
        display_name[i] = ' ';
    }
    display_name[MAX_NAME_LENGTH + 1] = '\0';
    
    // Namen kopieren
    for (i = 0; i < name_length; i++) {
        display_name[i] = pet_name[i];
    }
    
    // Cursor am Ende anzeigen
    if (name_length < MAX_NAME_LENGTH) {
        display_name[name_length] = '_';
    }
    
    // Position für Name (Zeile 4)
    set_bkg_tiles(8, 4, MAX_NAME_LENGTH + 1, 1, display_name);
}

void draw_cursor(void) {
    UINT8 screen_x = (cursor_x * 3) + 1;
    UINT8 screen_y = cursor_y + 8;
    char cursor_char[3] = {'[', keyboard_chars[get_selected_char_index()], ']'};
    
    // Rahmen um ausgewähltes Zeichen zeichnen
    set_bkg_tiles(screen_x, screen_y, 3, 1, cursor_char);
}

void clear_cursor(void) {
    UINT8 screen_x = (cursor_x * 3) + 2;
    UINT8 screen_y = cursor_y + 8;
    char normal_char = keyboard_chars[get_selected_char_index()];
    
    // Zeichen ohne Rahmen anzeigen (mit Leerzeichen drumherum)
    set_bkg_tiles(screen_x - 1, screen_y, 1, 1, " ");
    set_bkg_tiles(screen_x, screen_y, 1, 1, &normal_char);
    set_bkg_tiles(screen_x + 1, screen_y, 1, 1, " ");
}

void handle_navigation(UINT8 joypad) {
    UINT8 old_x = cursor_x;
    UINT8 old_y = cursor_y;
    
    if (joypad & J_LEFT && cursor_x > 0) {
        cursor_x--;
    }
    else if (joypad & J_RIGHT && cursor_x < KEYBOARD_WIDTH - 1) {
        cursor_x++;
    }
    else if (joypad & J_UP && cursor_y > 0) {
        cursor_y--;
    }
    else if (joypad & J_DOWN && cursor_y < KEYBOARD_HEIGHT - 1) {
        cursor_y++;
    }
    
    // Cursor nur neu zeichnen wenn sich Position geändert hat
    if (old_x != cursor_x || old_y != cursor_y) {
        // Alte Position löschen
        UINT8 temp_x = cursor_x;
        UINT8 temp_y = cursor_y;
        cursor_x = old_x;
        cursor_y = old_y;
        clear_cursor();
        
        // Neue Position zeichnen
        cursor_x = temp_x;
        cursor_y = temp_y;
        draw_cursor();
    }
}

void handle_select_char(void) {
    if (name_length < MAX_NAME_LENGTH) {
        UINT8 char_index = get_selected_char_index();
        if (char_index < KEYBOARD_SIZE) {
            pet_name[name_length] = keyboard_chars[char_index];
            name_length++;
            draw_current_name();
        }
    }
}

void handle_delete_char(void) {
    if (name_length > 0) {
        name_length--;
        pet_name[name_length] = 0;
        draw_current_name();
    }
}

void handle_confirm_name(void) {
    if (is_name_valid()) {
        name_entry_done = 1;
        show_message("NAME SAVED!");
    } else {
        show_message("ENTER AT LEAST 1 CHAR!");
        // Kurz warten (ca. 1 Sekunde)
        for (UINT8 i = 0; i < 60; i++) {
            wait_vbl_done();
        }
        draw_keyboard();
        draw_current_name();
        draw_cursor();
    }
}

UINT8 choose_name(void) {
    UINT8 joypad_;
    UINT8 previous_joypad = 0;
    
    init_name_entry();
    
    while (!name_entry_done) {
        joypad_ = joypad();
        
        // Nur reagieren wenn Taste neu gedrückt wurde
        if (joypad && !previous_joypad) {
            if (joypad_ & (J_LEFT | J_RIGHT | J_UP | J_DOWN)) {
                handle_navigation(joypad);
            }
            else if (joypad_ & J_A) {
                handle_select_char();
            }
            else if (joypad_ & J_B) {
                handle_delete_char();
            }
            else if (joypad_ & J_START) {
                handle_confirm_name();
            }
        }
        
        previous_joypad = joypad_;
        
        // V-Blank warten für flüssige Animation
        wait_vbl_done();
    }
    
    return 1; // Name wurde erfolgreich eingegeben
}

UINT8 get_selected_char_index(void) {
    UINT8 index = cursor_y * KEYBOARD_WIDTH + cursor_x;
    return (index < KEYBOARD_SIZE) ? index : 0;
}

UINT8 is_name_valid(void) {
    return (name_length > 0);
}

void show_message(char* message) {
    clear_screen();
    UINT8 msg_len = strlen(message);
    UINT8 start_x = (20 - msg_len) / 2; // Zentrieren auf 20-Zeichen Bildschirm
    set_bkg_tiles(start_x, 9, msg_len, 1, message);
}

void clear_screen(void) {
    // Hintergrund mit Leerzeichen füllen
    UINT8 blank_line[20];
    UINT8 i, j;
    
    for (i = 0; i < 20; i++) {
        blank_line[i] = ' ';
    }
    
    for (j = 0; j < 18; j++) {
        set_bkg_tiles(0, j, 20, 1, blank_line);
    }
}

UINT8 wait_for_input(void) {
    UINT8 joypad_state;
    
    // Warten bis keine Taste gedrückt ist
    while (joypad()) {
        wait_vbl_done();
    }
    
    // Warten bis eine Taste gedrückt wird
    do {
        joypad_state = joypad();
        wait_vbl_done();
    } while (!joypad_state);
    
    return joypad_state;
}

#endif // CHOOSE_NAME_H