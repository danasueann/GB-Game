#include "keyboard.h"
#include "keyboard/keyboarddata.h"
#include "keyboard/keyboardmap.h"
#include "sprites/cursor.h"

// Constants for cursor movement boundaries
const UINT8 mincursor_x = 12;
const UINT8 maxcursor_x = 156;
const UINT8 mincursor_y = 80;
const UINT8 maxcursor_y = 128;

// Global variables
UBYTE keydown = 0;
UBYTE pet_has_name = 0;
UINT8 name_character_index = 0;
UINT8 pet_name[6]; // Array to hold the pet name, max 6 characters
struct Cursor cursor;

void choose_name(void)
{
    cursor.x = KEYBOARD_START_X;
    cursor.y = KEYBOARD_START_Y;
    cursor.col = 0;
    cursor.row = 0;

    set_sprite_data(0, 1, cursor_sprite);
    set_sprite_tile(0, 0);

    move_sprite(0, cursor.x, cursor.y);
    set_bkg_data(0, 45, keyboarddata);
    set_bkg_tiles(0, 0, 20, 18, keyboardmap);
    scroll_bkg(-4, 0);

    SHOW_BKG;
    SHOW_SPRITES;
}

void keyboard_input_loop(void)
{
    // Main keyboard navigation loop
    while (pet_has_name == 0)
    {
        if (keydown)
        {
            waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A | J_B);
            keydown = 0;
        }

        UBYTE joy = joypad();
        if (joy)
        {
            handle_keyboard_input(joy);
        }

        performantdelay(10);
    }
}

void handle_keyboard_input(UBYTE joy)
{
    switch (joy)
    {
    case J_UP:
        move_cursor_up();
        break;
    case J_DOWN:
        move_cursor_down();
        break;
    case J_LEFT:
        move_cursor_left();
        break;
    case J_RIGHT:
        move_cursor_right();
        break;
    case J_A:
        update_pet_name(&cursor);
        keydown = 1;
        break;
    case J_B:
        draw_pet_name();
        remove_from_pet_name();
        keydown = 1;
        break;
    case J_START:
        if (name_character_index > 0)
        { 
            pet_has_name = 1;
            draw_pet_name();
        }
        keydown = 1;
        break;
    }
}

void move_cursor_up(void)
{
    if (is_within_keyboard(cursor.x, cursor.y - 16))
    {
        cursor.row--;
        cursor.y -= 16;
        move_sprite(0, cursor.x, cursor.y);
        keydown = 1;
    }
}

void move_cursor_down(void)
{
    if (is_within_keyboard(cursor.x, cursor.y + 16))
    {
        cursor.row++;
        cursor.y += 16;
        move_sprite(0, cursor.x, cursor.y);
        keydown = 1;
    }
}

void move_cursor_left(void)
{
    if (is_within_keyboard(cursor.x - 16, cursor.y))
    {
        cursor.col--;
        cursor.x -= 16;
        move_sprite(0, cursor.x, cursor.y);
        keydown = 1;
    }
}

void move_cursor_right(void)
{
    if (is_within_keyboard(cursor.x + 16, cursor.y))
    {
        cursor.col++;
        cursor.x += 16;
        move_sprite(0, cursor.x, cursor.y);
        keydown = 1;
    }
}

UBYTE is_within_keyboard(UINT8 x, UINT8 y)
{
    // Häckchen und Abbrechen (checkmark and cancel buttons)
    if ((x == 140 && y == 144) || (x == 156 && y == 144))
    {
        return 1;
    }
    return (x >= mincursor_x && x <= maxcursor_x && y >= mincursor_y && y <= maxcursor_y);
}

void add_character_to_name(struct Cursor *cursor)
{
    UINT8 character_index = cursor->row * 10 + cursor->col + 1;

    if (name_character_index == 6)
        return; // Maximum length reached

    pet_name[name_character_index] = character_index;
    name_character_index++;
}

void update_pet_name(struct Cursor *cursor)
{
    if (cursor->col == 8 && cursor->row == 4)
    {
        remove_from_pet_name();
        draw_pet_name();
    }
    else if (cursor->col == 9 && cursor->row == 4)
    {
        pet_has_name = 1; // Indicate that the player has chosen a name
        draw_pet_name();
    }
    else
    {
        add_character_to_name(cursor);
        draw_pet_name();
    }
}

void draw_pet_name(void)
{
    set_bkg_tiles(1, 4, 6, 1, pet_name);
}

void remove_from_pet_name(void)
{
    if (name_character_index > 0)
    {
        name_character_index--;
        pet_name[name_character_index] = 0; // Clear the last character
    }
}

// Prevent cursor from being too fast
void performantdelay(UINT8 numloops)
{
    UINT8 i;
    for (i = 0; i < numloops; i++)
    {
        wait_vbl_done();
    }
}
