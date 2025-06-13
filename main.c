#include <gb/gb.h>
#include <stdio.h>
#include "sprites/PoodleSprite.c"
#include "sprites/CatSprite.c"

// Globale Variable für Tierauswahl
UBYTE selected_pet = 0; // 0 = Pudel, 1 = Katze

void show_selection_menu()
{
    // Beide Sprites für die Auswahl laden und anzeigen

    // Pudel Sprite links anzeigen (Sprites 0-5)
    set_sprite_data(0, 6, PoodleSprite);
    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    set_sprite_tile(4, 4);
    set_sprite_tile(5, 5);

    // Pudel Position (links)
    move_sprite(0, 48, 40); // oben links
    move_sprite(1, 56, 40); // oben rechts
    move_sprite(2, 48, 48); // mitte links
    move_sprite(3, 56, 48); // mitte rechts
    move_sprite(4, 48, 56); // unten links
    move_sprite(5, 56, 56); // unten rechts

    // Katzen Sprite rechts anzeigen (Sprites 6-14)
    set_sprite_data(6, 9, CatSprite);
    set_sprite_tile(6, 6);
    set_sprite_tile(7, 7);
    set_sprite_tile(8, 8);
    set_sprite_tile(9, 9);
    set_sprite_tile(10, 10);
    set_sprite_tile(11, 11);
    set_sprite_tile(12, 12);
    set_sprite_tile(13, 13);
    set_sprite_tile(14, 14);

    // Katzen Position (rechts)
    move_sprite(6, 96, 36);   // oben links
    move_sprite(7, 104, 36);  // oben mitte
    move_sprite(8, 112, 36);  // oben rechts
    move_sprite(9, 96, 44);   // mitte links
    move_sprite(10, 104, 44); // mitte mitte
    move_sprite(11, 112, 44); // mitte rechts
    move_sprite(12, 96, 52);  // unten links
    move_sprite(13, 104, 52); // unten mitte
    move_sprite(14, 112, 52); // unten rechts

    SHOW_SPRITES;

    cls();
    printf("\n");
    printf("== PET SELECTION ==\n");
    printf("\n\n\n\n\n\n\n");
    printf("   POODLE      CAT\n");
    printf("\n");
    printf("Press A or B\n to select!\n");
}

void setup_pet_sprite()
{
    // Alle Sprites verstecken/zurücksetzen
    for (UBYTE i = 0; i < 15; i++)
    {
        move_sprite(i, 0, 0);
    }

    if (selected_pet == 0)
    {
        // Pudel Sprite laden (6 Tiles für 2x3 Layout)
        set_sprite_data(0, 6, PoodleSprite);

        // Pudel: 2x3 Tiles Layout
        set_sprite_tile(0, 0);
        set_sprite_tile(1, 1);
        set_sprite_tile(2, 2);
        set_sprite_tile(3, 3);
        set_sprite_tile(4, 4);
        set_sprite_tile(5, 5);

        // Pudel Sprites positionieren (2x3)
        move_sprite(0, 72, 40); // oben links
        move_sprite(1, 80, 40); // oben rechts
        move_sprite(2, 72, 48); // mitte links
        move_sprite(3, 80, 48); // mitte rechts
        move_sprite(4, 72, 56); // unten links
        move_sprite(5, 80, 56); // unten rechts
    }
    else
    {
        // Katzen Sprite laden (9 Tiles für 3x3 Layout)
        set_sprite_data(0, 9, CatSprite);

        // Katze: 3x3 Tiles Layout
        set_sprite_tile(0, 0);
        set_sprite_tile(1, 1);
        set_sprite_tile(2, 2);
        set_sprite_tile(3, 3);
        set_sprite_tile(4, 4);
        set_sprite_tile(5, 5);
        set_sprite_tile(6, 6);
        set_sprite_tile(7, 7);
        set_sprite_tile(8, 8);

        // Katzen Sprites positionieren (3x3)
        move_sprite(0, 68, 36); // oben links
        move_sprite(1, 76, 36); // oben mitte
        move_sprite(2, 84, 36); // oben rechts
        move_sprite(3, 68, 44); // mitte links
        move_sprite(4, 76, 44); // mitte mitte
        move_sprite(5, 84, 44); // mitte rechts
        move_sprite(6, 68, 52); // unten links
        move_sprite(7, 76, 52); // unten mitte
        move_sprite(8, 84, 52); // unten rechts
    }
}

const char *get_pet_name()
{
    return (selected_pet == 0) ? "POODLE" : "KITTY";
}

const char *get_feed_message()
{
    return (selected_pet == 0) ? "*munch munch* Woof!" : "*purr purr* Meow!";
}

const char *get_play_message()
{
    return (selected_pet == 0) ? "*woof woof* Fun!" : "*meow* Playful!";
}

const char *get_up_message()
{
    return (selected_pet == 0) ? "*looks up curiously*" : "*ears perk up*";
}

const char *get_down_message()
{
    return (selected_pet == 0) ? "*sniffs the ground*" : "*sniffs around*";
}

const char *get_left_message()
{
    return (selected_pet == 0) ? "*turns left*" : "*stretches left*";
}

const char *get_right_message()
{
    return (selected_pet == 0) ? "*turns right*" : "*stretches right*";
}

void main()
{
    DISPLAY_ON;

    // Auswahlmenü anzeigen
    show_selection_menu();

    UBYTE mButtons;

    // Warten auf Tierauswahl
    while (1)
    {
        mButtons = joypad();

        if (mButtons & J_A)
        {
            selected_pet = 0; // Pudel
            break;
        }

        if (mButtons & J_B)
        {
            selected_pet = 1; // Katze
            break;
        }

        wait_vbl_done();
    }

    // Warten bis Taste losgelassen
    while (joypad())
        ;

    // Pet Sprite einrichten
    setup_pet_sprite();
    SHOW_SPRITES;

    // Hauptspiel starten
    cls();

    // Tamagotchi-Variablen
    UBYTE happiness = 50;
    UBYTE hunger = 30;
    UBYTE energy = 70;

    // Willkommensnachricht
    printf("\n");
    printf("=== TAMAGOTCHI ===\n");
    printf("Your %s is ready!\n", get_pet_name());
    printf("\n\n\n\n\n\n");
    printf("Happiness: %d\n", happiness);
    printf("Hunger: %d\n", hunger);
    printf("Energy: %d\n", energy);

    while (1)
    {
        mButtons = joypad();

        if (mButtons & J_A)
        {
            // Füttern
            if (hunger > 0)
            {
                hunger -= 15;
                if (hunger < 0)
                    hunger = 0;
                happiness += 5;
                if (happiness > 100)
                    happiness = 100;

                printf("%s\n", get_feed_message());
                printf("Hunger: %d Happiness: %d\n", hunger, happiness);
            }
            else
            {
                printf("Not hungry right now!\n");
            }
        }

        if (mButtons & J_B)
        {
            // Spielen
            if (energy > 10)
            {
                happiness += 10;
                if (happiness > 100)
                    happiness = 100;
                energy -= 10;
                hunger += 5;
                if (hunger > 100)
                    hunger = 100;

                printf("%s\n", get_play_message());
                printf("Energy: %d Happiness: %d\n", energy, happiness);
            }
            else
            {
                printf("Too tired to play...\n");
            }
        }

        if (mButtons & J_SELECT)
        {
            // Schlafen
            energy += 20;
            if (energy > 100)
                energy = 100;
            hunger += 3;
            if (hunger > 100)
                hunger = 100;

            printf("*zzz* Good rest!\n");
            printf("Energy: %d\n", energy);
        }

        if (mButtons & J_START)
        {
            // Status anzeigen
            printf("\n=== %s STATUS ===\n", get_pet_name());
            printf("Happiness: %d/100\n", happiness);
            printf("Hunger: %d/100\n", hunger);
            printf("Energy: %d/100\n", energy);

            // Stimmung anzeigen
            if (happiness > 80)
                printf("Mood: Very Happy! :D\n");
            else if (happiness > 60)
                printf("Mood: Happy :)\n");
            else if (happiness > 40)
                printf("Mood: Okay :/\n");
            else if (happiness > 20)
                printf("Mood: Sad :(\n");
            else
                printf("Mood: Very Sad T_T\n");

            // Hunger-Status
            if (hunger > 80)
                printf("Status: Very Hungry!\n");
            else if (hunger > 50)
                printf("Status: Hungry\n");
            else if (hunger > 20)
                printf("Status: A bit hungry\n");
            else
                printf("Status: Well fed\n");

            // Energie-Status
            if (energy < 20)
                printf("Energy: Exhausted\n");
            else if (energy < 50)
                printf("Energy: Tired\n");
            else if (energy < 80)
                printf("Energy: Normal\n");
            else
                printf("Energy: Full of energy!\n");
        }

        if (mButtons & J_UP)
        {
            printf("%s\n", get_up_message());
        }

        if (mButtons & J_DOWN)
        {
            printf("%s\n", get_down_message());
        }

        if (mButtons & J_LEFT)
        {
            printf("%s\n", get_left_message());
        }

        if (mButtons & J_RIGHT)
        {
            printf("%s\n", get_right_message());
        }

        // Automatische Veränderungen über Zeit (sehr langsam)
        static UBYTE time_counter = 0;
        time_counter++;
        if (time_counter > 200)
        { // Alle paar Sekunden
            time_counter = 0;

            // Langsam hungriger und müder werden
            if (hunger < 100)
                hunger++;
            if (energy > 0 && happiness > 30)
                energy--;

            // Wenn sehr hungrig oder müde -> unglücklicher
            if (hunger > 90 || energy < 10)
            {
                if (happiness > 0)
                    happiness--;
            }
        }

        // Warten bis Taste losgelassen
        while (mButtons = joypad())
            ;
        wait_vbl_done();
    }
}