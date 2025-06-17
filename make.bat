

c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\main.o main.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\background_cat.o backgrounds\background_cat.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\background_dog.o backgrounds\background_dog.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\SelectMenu_tileset.o backgrounds\SelectMenu_tileset.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\cat.o sprites\cat.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\jester.o sprites\jester.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\keyboarddata.o keyboard\keyboarddata.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\keyboardmap.o keyboard\keyboardmap.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\cursor.o sprites\cursor.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o build\keyboard.o keyboard.c

c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o build\game.gb ^
    build\main.o ^
    build\background_cat.o ^
    build\background_dog.o ^
    build\SelectMenu_tileset.o ^
    build\cat.o ^
    build\jester.o ^
    build\cursor.o ^
    build\keyboarddata.o ^
    build\keyboardmap.o ^
    build\keyboard.o



