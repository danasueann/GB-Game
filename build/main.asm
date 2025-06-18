;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _keyboard_input_loop
	.globl _choose_name
	.globl _vwf_draw_text
	.globl _vwf_activate_font
	.globl _vwf_load_font
	.globl _vwf_set_destination
	.globl _set_sprite_data
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _selected_pet
	.globl _setup_home_background_cat
	.globl _setup_home_background_dog
	.globl _display_pet_name
	.globl _setup_select_menu_background
	.globl _choose_pet
	.globl _setup_cat
	.globl _setup_cat_home
	.globl _setup_jester
	.globl _setup_jester_home
	.globl _clear_background
	.globl _clear_sprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_selected_pet::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;home.h:10: void setup_home_background_cat()
;	---------------------------------
; Function setup_home_background_cat
; ---------------------------------
_setup_home_background_cat::
;home.h:12: set_bkg_data(0, 216, background_cat);
	ld	de, #_background_cat
	push	de
	ld	hl, #0xd800
	push	hl
	call	_set_bkg_data
	add	sp, #4
;home.h:13: set_bkg_tiles(0, 0, 20, 18, background_cat_tilemap);
	ld	de, #_background_cat_tilemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;home.h:14: SCY_REG = 0;
	xor	a, a
	ldh	(_SCY_REG + 0), a
;home.h:15: display_pet_name();
	call	_display_pet_name
;home.h:16: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;home.h:17: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;home.h:19: }
	ret
;home.h:20: void setup_home_background_dog()
;	---------------------------------
; Function setup_home_background_dog
; ---------------------------------
_setup_home_background_dog::
;home.h:23: set_bkg_data(0, 216, background_dog);
	ld	de, #_background_dog
	push	de
	ld	hl, #0xd800
	push	hl
	call	_set_bkg_data
	add	sp, #4
;home.h:24: set_bkg_tiles(0, 0, 20, 18, background_dog_tilemap);
	ld	de, #_background_dog_tilemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;home.h:26: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;home.h:27: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;home.h:28: display_pet_name();
;home.h:29: }
	jp	_display_pet_name
;home.h:31: void display_pet_name()
;	---------------------------------
; Function display_pet_name
; ---------------------------------
_display_pet_name::
;home.h:34: vwf_load_font(0, font_ru, BANK(font_ru));
	ld	b, #<(___bank_font_ru)
	push	bc
	inc	sp
	ld	de, #_font_ru
	xor	a, a
	call	_vwf_load_font
;home.h:35: vwf_activate_font(0);
	xor	a, a
	call	_vwf_activate_font
;home.h:36: vwf_set_destination(VWF_RENDER_BKG);
	xor	a, a
	call	_vwf_set_destination
;home.h:37: vwf_draw_text(5, 0, 217, get_pet_name());
	call	_get_pet_name
	push	bc
	ld	a, #0xd9
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x05
	call	_vwf_draw_text
;home.h:38: }
	ret
;SelectMenu.h:13: void setup_select_menu_background()
;	---------------------------------
; Function setup_select_menu_background
; ---------------------------------
_setup_select_menu_background::
;SelectMenu.h:16: set_bkg_data(0, 216, SelectMenu_tileset);
	ld	de, #_SelectMenu_tileset
	push	de
	ld	hl, #0xd800
	push	hl
	call	_set_bkg_data
	add	sp, #4
;SelectMenu.h:17: set_bkg_tiles(0, 0, 20, 18, SelectMenu_tilemap);
	ld	de, #_SelectMenu_tilemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;SelectMenu.h:19: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;SelectMenu.h:20: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;SelectMenu.h:21: }
	ret
;SelectMenu.h:23: UBYTE choose_pet(void)
;	---------------------------------
; Function choose_pet
; ---------------------------------
_choose_pet::
;SelectMenu.h:25: while (1)
00107$:
;SelectMenu.h:27: UBYTE mButtons = joypad();
	call	_joypad
;SelectMenu.h:29: if (mButtons & J_A)
	bit	4, a
	jr	Z, 00104$
;SelectMenu.h:31: return 0; // CAT selected
	xor	a, a
	ret
00104$:
;SelectMenu.h:33: else if (mButtons & J_B)
	bit	5, a
	jr	Z, 00105$
;SelectMenu.h:35: return 1; // JESTER selected
	ld	a, #0x01
	ret
00105$:
;SelectMenu.h:37: wait_vbl_done();
	call	_wait_vbl_done
;SelectMenu.h:39: }
	jr	00107$
;cat_animated.h:12: void setup_cat(int start_x, int start_y)
;	---------------------------------
; Function setup_cat
; ---------------------------------
_setup_cat::
	add	sp, #-8
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;cat_animated.h:15: set_sprite_data(0, cat_size, cat);
	ld	de, #_cat
	push	de
	ld	hl, #0x1100
	push	hl
	call	_set_sprite_data
	add	sp, #4
;cat_animated.h:17: for (int i = 0; i < cat_size; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00109$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x11
	jr	NC, 00101$
;cat_animated.h:19: set_sprite_tile(i, cat_tilemap[i]);
	ld	de, #_cat_tilemap
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#7
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;cat_animated.h:17: for (int i = 0; i < cat_size; i++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00109$
00101$:
;cat_animated.h:24: int sprite_index = 0;
	ld	bc, #0x0000
;cat_animated.h:26: for (int row = 0; row < 4; row++)
	ldhl	sp,	#6
	ld	(hl), #0x00
00115$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00105$
;cat_animated.h:28: for (int col = 0; col < 4; col++)
	inc	hl
	ld	(hl), #0x00
00112$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00127$
;cat_animated.h:30: move_sprite(sprite_index, start_x + col * tile_width, start_y + row * tile_height);
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	ld	(hl), a
	ld	e, c
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;cat_animated.h:31: sprite_index++;
	inc	bc
;cat_animated.h:32: if (sprite_index > 15)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x0f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	C, 00127$
;cat_animated.h:28: for (int col = 0; col < 4; col++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00112$
00127$:
;cat_animated.h:26: for (int row = 0; row < 4; row++)
	ldhl	sp,	#6
	inc	(hl)
	jr	00115$
00105$:
;cat_animated.h:37: SHOW_SPRITES; // Show the sprites on the screen
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;cat_animated.h:38: }
	add	sp, #8
	ret
;cat_animated.h:40: void setup_cat_home()
;	---------------------------------
; Function setup_cat_home
; ---------------------------------
_setup_cat_home::
;cat_animated.h:42: setup_cat(100, 100);
	ld	bc, #0x0064
	ld	d, b
	ld	e, c
;cat_animated.h:43: }
	jp	_setup_cat
;jester.h:8: void setup_jester(int start_x, int start_y)
;	---------------------------------
; Function setup_jester
; ---------------------------------
_setup_jester::
	add	sp, #-8
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;jester.h:11: set_sprite_data(32, jester_size, jester);
	ld	de, #_jester
	push	de
	ld	hl, #0x1020
	push	hl
	call	_set_sprite_data
	add	sp, #4
;jester.h:13: for (int i = 0; i < jester_size; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00109$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00101$
;jester.h:15: set_sprite_tile(i+16, jester_tilemap[i] + 32);
	ld	de, #_jester_tilemap
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	add	a, #0x20
	ld	c, a
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x10
	ld	e, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;jester.h:13: for (int i = 0; i < jester_size; i++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00109$
00101$:
;jester.h:20: int sprite_index = 16;
	ld	bc, #0x0010
;jester.h:22: for (int row = 0; row < 4; row++)
	ldhl	sp,	#6
	ld	(hl), #0x00
00115$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00105$
;jester.h:24: for (int col = 0; col < 4; col++)
	inc	hl
	ld	(hl), #0x00
00112$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00127$
;jester.h:26: move_sprite(sprite_index, start_x + col * tile_width, start_y + row * tile_height);
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	ld	(hl), a
	ld	e, c
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;jester.h:27: sprite_index++;
	inc	bc
;jester.h:28: if (sprite_index > 31) // Adjusted to 31 since we have 16 sprites and start from 16
	ld	e, b
	ld	d, #0x00
	ld	a, #0x1f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	C, 00127$
;jester.h:24: for (int col = 0; col < 4; col++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00112$
00127$:
;jester.h:22: for (int row = 0; row < 4; row++)
	ldhl	sp,	#6
	inc	(hl)
	jr	00115$
00105$:
;jester.h:33: SHOW_SPRITES; // Show the sprites on the screen
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;jester.h:34: }
	add	sp, #8
	ret
;jester.h:36: void setup_jester_home()
;	---------------------------------
; Function setup_jester_home
; ---------------------------------
_setup_jester_home::
;jester.h:38: setup_jester(100, 100);
	ld	bc, #0x0064
	ld	d, b
	ld	e, c
;jester.h:39: }
	jp	_setup_jester
;main.c:28: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:30: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:32: setup_select_menu_background();
	call	_setup_select_menu_background
;main.c:34: setup_cat(32, 80);     // Set up the cat sprite at position (32, 80)
	ld	bc, #0x0050
	ld	de, #0x0020
	call	_setup_cat
;main.c:35: setup_jester(110, 80); // Set up the jester sprite at position (110, 80)
	ld	bc, #0x0050
	ld	de, #0x006e
	call	_setup_jester
;main.c:37: selected_pet = choose_pet();
	call	_choose_pet
	ld	(#_selected_pet),a
;main.c:38: clear_background();
	call	_clear_background
;main.c:39: clear_sprites();
	call	_clear_sprites
;main.c:42: choose_name();
	call	_choose_name
;main.c:43: keyboard_input_loop(); // This replaces the while loop from the original code
	call	_keyboard_input_loop
;main.c:45: if (pet_has_name)
	ld	a, (#_pet_has_name)
	or	a, a
	jr	Z, 00102$
;c:\gbdk\include\gb\gb.h:1475: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x04
	ldh	(_SCX_REG + 0), a
;main.c:48: clear_background();
	call	_clear_background
;main.c:49: clear_sprites();
	call	_clear_sprites
00102$:
;main.c:52: if (selected_pet == 0)
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00106$
;main.c:54: clear_background();
	call	_clear_background
;main.c:55: clear_sprites();
	call	_clear_sprites
;main.c:56: setup_home_background_cat();
	call	_setup_home_background_cat
;main.c:57: setup_cat_home();
	jp	_setup_cat_home
00106$:
;main.c:59: else if (selected_pet == 1)
	ld	a, (#_selected_pet)
	dec	a
	ret	NZ
;main.c:61: clear_background();
	call	_clear_background
;main.c:62: clear_sprites();
	call	_clear_sprites
;main.c:63: setup_home_background_dog();
	call	_setup_home_background_dog
;main.c:65: setup_jester_home();
;main.c:67: }
	jp	_setup_jester_home
;main.c:69: void clear_background()
;	---------------------------------
; Function clear_background
; ---------------------------------
_clear_background::
;main.c:71: for (UBYTE x = 0; x < 20; x++) {
	ld	d, #0x00
00107$:
	ld	a, d
	sub	a, #0x14
	jr	NC, 00102$
;main.c:72: for (UBYTE y = 0; y < 18; y++) {
	ld	e, #0x00
00104$:
	ld	a, e
	sub	a, #0x12
	jr	NC, 00108$
;main.c:73: set_bkg_tile_xy(x, y, 0);
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a, d
	call	_set_bkg_tile_xy
	pop	de
;main.c:72: for (UBYTE y = 0; y < 18; y++) {
	inc	e
	jr	00104$
00108$:
;main.c:71: for (UBYTE x = 0; x < 20; x++) {
	inc	d
	jr	00107$
00102$:
;main.c:76: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:77: }
	ret
;main.c:79: void clear_sprites()
;	---------------------------------
; Function clear_sprites
; ---------------------------------
_clear_sprites::
;main.c:81: for (UBYTE i = 1; i < 32; i++)
	ld	c, #0x01
00105$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00101$
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x00
;main.c:81: for (UBYTE i = 1; i < 32; i++)
	inc	c
	jr	00105$
00101$:
;main.c:86: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:87: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__selected_pet:
	.db #0x00	; 0
	.area _CABS (ABS)
