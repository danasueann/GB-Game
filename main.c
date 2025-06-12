#include <gb/gb.h>
#include <stdio.h>
#include "Test.c"


void main()
{
    // Initialize the Game
    
    printf("TEST3\n");
    set_bkg_data(0, 1, Test); // Clear background data


    //Fill the background with the Test data
    init_bkg(0);

    //Show the background
    SHOW_BKG;
    DISPLAY_ON;

}