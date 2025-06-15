;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _setup_select_menu_background
	.globl _setup_cat
	.globl _setup_jester
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
;SelectMenu.h:12: void setup_select_menu_background()
;	---------------------------------
; Function setup_select_menu_background
; ---------------------------------
_setup_select_menu_background::
;SelectMenu.h:15: set_bkg_data(0, 216, SelectMenu_tileset);
	ld	de, #_SelectMenu_tileset
	push	de
	ld	hl, #0xd800
	push	hl
	call	_set_bkg_data
	add	sp, #4
;SelectMenu.h:16: set_bkg_tiles(0, 0, 20, 18, SelectMenu_tilemap);
	ld	de, #_SelectMenu_tilemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;SelectMenu.h:18: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;SelectMenu.h:19: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;SelectMenu.h:20: }
	ret
;cat_animated.h:11: void setup_cat(void)
;	---------------------------------
; Function setup_cat
; ---------------------------------
_setup_cat::
	add	sp, #-4
;cat_animated.h:14: set_sprite_data(0, cat_size, cat);
	ld	de, #_cat
	push	de
	ld	hl, #0x1100
	push	hl
	call	_set_sprite_data
	add	sp, #4
;cat_animated.h:16: for (int i = 0; i < cat_size; i++)
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x11
	jr	NC, 00101$
;cat_animated.h:18: set_sprite_tile(i, cat_tilemap[i]);
	ld	hl, #_cat_tilemap
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), b
;cat_animated.h:16: for (int i = 0; i < cat_size; i++)
	inc	c
	jr	00109$
00101$:
;cat_animated.h:25: int sprite_index = 0;
	ld	bc, #0x0000
;cat_animated.h:27: for (int row = 0; row < 4; row++)
	ldhl	sp,	#2
	ld	(hl), #0x00
00115$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00105$
;cat_animated.h:29: for (int col = 0; col < 4; col++)
	inc	hl
	ld	(hl), #0x00
00112$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00127$
;cat_animated.h:31: move_sprite(sprite_index, start_x + col * tile_width, start_y + row * tile_height);
	dec	hl
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x50
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x20
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
;cat_animated.h:32: sprite_index++;
	inc	bc
;cat_animated.h:33: if (sprite_index > 15)
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
;cat_animated.h:29: for (int col = 0; col < 4; col++)
	ldhl	sp,	#3
	inc	(hl)
	jr	00112$
00127$:
;cat_animated.h:27: for (int row = 0; row < 4; row++)
	ldhl	sp,	#2
	inc	(hl)
	jr	00115$
00105$:
;cat_animated.h:38: SHOW_SPRITES; // Show the sprites on the screen
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;cat_animated.h:39: }
	add	sp, #4
	ret
;jester.h:11: void setup_jester(void)
;	---------------------------------
; Function setup_jester
; ---------------------------------
_setup_jester::
	add	sp, #-4
;jester.h:14: set_sprite_data(32, jester_size, jester);
	ld	de, #_jester
	push	de
	ld	hl, #0x1020
	push	hl
	call	_set_sprite_data
	add	sp, #4
;jester.h:16: for (int i = 0; i < jester_size; i++)
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00101$
;jester.h:18: set_sprite_tile(i+16, jester_tilemap[i] + 32);
	ld	hl, #_jester_tilemap
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, #0x20
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, c
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
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;jester.h:16: for (int i = 0; i < jester_size; i++)
	inc	c
	jr	00109$
00101$:
;jester.h:25: int sprite_index = 16;
	ld	bc, #0x0010
;jester.h:27: for (int row = 0; row < 4; row++)
	ldhl	sp,	#2
	ld	(hl), #0x00
00115$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00105$
;jester.h:29: for (int col = 0; col < 4; col++)
	inc	hl
	ld	(hl), #0x00
00112$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00127$
;jester.h:31: move_sprite(sprite_index, start_x + col * tile_width, start_y + row * tile_height);
	dec	hl
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x50
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x6e
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
;jester.h:32: sprite_index++;
	inc	bc
;jester.h:33: if (sprite_index > 31) // Adjusted to 31 since we have 16 sprites and start from 16
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
;jester.h:29: for (int col = 0; col < 4; col++)
	ldhl	sp,	#3
	inc	(hl)
	jr	00112$
00127$:
;jester.h:27: for (int row = 0; row < 4; row++)
	ldhl	sp,	#2
	inc	(hl)
	jr	00115$
00105$:
;jester.h:38: SHOW_SPRITES; // Show the sprites on the screen
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;jester.h:39: }
	add	sp, #4
	ret
;main.c:11: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:13: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:15: setup_select_menu_background();
	call	_setup_select_menu_background
;main.c:17: setup_cat();
	call	_setup_cat
;main.c:18: setup_jester();
;main.c:24: }
	jp	_setup_jester
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
