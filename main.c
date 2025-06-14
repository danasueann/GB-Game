#include <gb/gb.h>
#include <stdio.h>
#include "sprites/PoodleSprite.c"
#include "sprites/CatSprite.c"
// #include "dog_sprite.h"
#include "cat_sprite.h"
#include "dog_sprite2.h"

UBYTE selected_pet = 0;

void show_selection_menu()

{

    // dog sprite data
    setup_dog2_sprite_selection();

    // Cat sprite data
    setup_cat_sprite_selection();


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
    // hide sprites
    for (UBYTE i = 0; i < 15; i++)
    {
        move_sprite(i, 0, 0);
    }

    if (selected_pet == 0)
    {
        // load dog sprite
        setup_dog2_sprite_main();
    }
    else
    {
        // load cat sprite
        
        setup_cat_sprite_main();
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

    show_selection_menu();

    UBYTE mButtons;

    while (1)
    {
        mButtons = joypad();

        if (mButtons & J_A)
        {
            selected_pet = 0; // Dog
            break;
        }

        if (mButtons & J_B)
        {
            selected_pet = 1; // Cat
            break;
        }

        wait_vbl_done();
    }

    // wait until button is released
    while (joypad())
        ;

    setup_pet_sprite();
    SHOW_SPRITES;

    // start main game loop
    cls();

    UBYTE happiness = 50;
    UBYTE hunger = 30;
    UBYTE energy = 70;

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
            printf("\n=== %s STATUS ===\n", get_pet_name());
            printf("Happiness: %d/100\n", happiness);
            printf("Hunger: %d/100\n", hunger);
            printf("Energy: %d/100\n", energy);

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

            if (hunger > 80)
                printf("Status: Very Hungry!\n");
            else if (hunger > 50)
                printf("Status: Hungry\n");
            else if (hunger > 20)
                printf("Status: A bit hungry\n");
            else
                printf("Status: Well fed\n");

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

        static UBYTE time_counter = 0;
        time_counter++;
        if (time_counter > 200)
        {
            time_counter = 0;

            if (hunger < 100)
                hunger++;
            if (energy > 0 && happiness > 30)
                energy--;

            if (hunger > 90 || energy < 10)
            {
                if (happiness > 0)
                    happiness--;
            }
        }

        while (mButtons = joypad())
            ;
        wait_vbl_done();
    }
}