;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module keyboard
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _joypad
	.globl _name_character_index
	.globl _pet_has_name
	.globl _keydown
	.globl _cursor
	.globl _pet_name
	.globl _maxcursor_y
	.globl _mincursor_y
	.globl _maxcursor_x
	.globl _mincursor_x
	.globl _choose_name
	.globl _keyboard_input_loop
	.globl _handle_keyboard_input
	.globl _move_cursor_up
	.globl _move_cursor_down
	.globl _move_cursor_left
	.globl _move_cursor_right
	.globl _is_within_keyboard
	.globl _add_character_to_name
	.globl _update_pet_name
	.globl _draw_pet_name
	.globl _remove_from_pet_name
	.globl _performantdelay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pet_name::
	.ds 18
_cursor::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_keydown::
	.ds 1
_pet_has_name::
	.ds 1
_name_character_index::
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
;keyboard.c:19: void choose_name(void)
;	---------------------------------
; Function choose_name
; ---------------------------------
_choose_name::
;keyboard.c:21: cursor.x = KEYBOARD_START_X;
	ld	hl, #_cursor
	ld	(hl), #0x0c
;keyboard.c:22: cursor.y = KEYBOARD_START_Y;
	ld	bc, #_cursor + 1
;keyboard.c:23: cursor.col = 0;
	inc	hl
	inc	hl
	ld	a, #0x50
	ld	(bc), a
	ld	(hl), #0x00
;keyboard.c:24: cursor.row = 0;
	ld	hl, #_cursor + 3
	ld	(hl), #0x00
;keyboard.c:26: set_sprite_data(0, 1, cursor_sprite);
	ld	de, #_cursor_sprite
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;keyboard.c:29: move_sprite(0, cursor.x, cursor.y);
	ld	a, (bc)
	ld	c, a
	ld	hl, #_cursor
	ld	b, (hl)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;keyboard.c:30: set_bkg_data(0, 45, keyboarddata);
	ld	de, #_keyboarddata
	push	de
	ld	hl, #0x2d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;keyboard.c:31: set_bkg_tiles(0, 0, 20, 18, keyboardmap);
	ld	de, #_keyboardmap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;c:\gbdk\include\gb\gb.h:1475: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xfc
	ldh	(_SCX_REG + 0), a
;keyboard.c:34: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;keyboard.c:35: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;keyboard.c:36: }
	ret
_mincursor_x:
	.db #0x0c	; 12
_maxcursor_x:
	.db #0x9c	; 156
_mincursor_y:
	.db #0x50	; 80	'P'
_maxcursor_y:
	.db #0x80	; 128
;keyboard.c:38: void keyboard_input_loop(void)
;	---------------------------------
; Function keyboard_input_loop
; ---------------------------------
_keyboard_input_loop::
;keyboard.c:41: while (pet_has_name == 0)
00105$:
	ld	a, (#_pet_has_name)
	or	a, a
	ret	NZ
;keyboard.c:43: if (keydown)
	ld	a, (#_keydown)
	or	a, a
	jr	Z, 00102$
;keyboard.c:45: waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A | J_B);
	ld	a, #0x3f
	call	_waitpad
;keyboard.c:46: keydown = 0;
	xor	a, a
	ld	(#_keydown),a
00102$:
;keyboard.c:49: UBYTE joy = joypad();
	call	_joypad
;keyboard.c:50: if (joy)
;keyboard.c:52: handle_keyboard_input(joy);
	or	a,a
	jr	Z, 00104$
	call	_handle_keyboard_input
00104$:
;keyboard.c:55: performantdelay(10);
	ld	a, #0x0a
	call	_performantdelay
;keyboard.c:57: }
	jr	00105$
;keyboard.c:59: void handle_keyboard_input(UBYTE joy)
;	---------------------------------
; Function handle_keyboard_input
; ---------------------------------
_handle_keyboard_input::
;keyboard.c:61: switch (joy)
	cp	a, #0x01
	jp	Z, _move_cursor_right
	cp	a, #0x02
	jp	Z, _move_cursor_left
	cp	a, #0x04
	jp	Z, _move_cursor_up
	cp	a, #0x08
	jp	Z, _move_cursor_down
	sub	a, #0x10
	jr	Z, 00105$
;keyboard.c:63: case J_UP:
;keyboard.c:64: move_cursor_up();
	ret
;keyboard.c:65: break;
;keyboard.c:66: case J_DOWN:
;keyboard.c:67: move_cursor_down();
	ret
;keyboard.c:68: break;
;keyboard.c:69: case J_LEFT:
;keyboard.c:70: move_cursor_left();
	ret
;keyboard.c:71: break;
;keyboard.c:72: case J_RIGHT:
;keyboard.c:73: move_cursor_right();
	ret
;keyboard.c:74: break;
	ret
;keyboard.c:75: case J_A:
00105$:
;keyboard.c:76: update_pet_name(&cursor);
	ld	de, #_cursor
	call	_update_pet_name
;keyboard.c:77: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;keyboard.c:82: }
;keyboard.c:83: }
	ret
;keyboard.c:85: void move_cursor_up(void)
;	---------------------------------
; Function move_cursor_up
; ---------------------------------
_move_cursor_up::
;keyboard.c:87: if (is_within_keyboard(cursor.x, cursor.y - 16))
	ld	hl, #_cursor + 1
	ld	a, (hl)
	add	a, #0xf0
	ld	e, a
	ld	bc, #_cursor
	ld	a, (bc)
	push	hl
	push	bc
	call	_is_within_keyboard
	pop	bc
	pop	hl
	or	a, a
	ret	Z
;keyboard.c:89: cursor.row--;
	ld	de, #_cursor + 3
	ld	a, (de)
	dec	a
	ld	(de), a
;keyboard.c:90: cursor.y -= 16;
	ld	a, (hl)
	add	a, #0xf0
	ld	(hl), a
;keyboard.c:91: move_sprite(0, cursor.x, cursor.y);
	ld	e, (hl)
	ld	a, (bc)
	ld	c, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), c
;keyboard.c:92: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;keyboard.c:94: }
	ret
;keyboard.c:96: void move_cursor_down(void)
;	---------------------------------
; Function move_cursor_down
; ---------------------------------
_move_cursor_down::
;keyboard.c:98: if (is_within_keyboard(cursor.x, cursor.y + 16))
	ld	hl, #_cursor + 1
	ld	a, (hl)
	add	a, #0x10
	ld	e, a
	ld	bc, #_cursor
	ld	a, (bc)
	push	hl
	push	bc
	call	_is_within_keyboard
	pop	bc
	pop	hl
	or	a, a
	ret	Z
;keyboard.c:100: cursor.row++;
	ld	de, #_cursor + 3
	ld	a, (de)
	inc	a
	ld	(de), a
;keyboard.c:101: cursor.y += 16;
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
;keyboard.c:102: move_sprite(0, cursor.x, cursor.y);
	ld	e, (hl)
	ld	a, (bc)
	ld	c, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), c
;keyboard.c:103: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;keyboard.c:105: }
	ret
;keyboard.c:107: void move_cursor_left(void)
;	---------------------------------
; Function move_cursor_left
; ---------------------------------
_move_cursor_left::
;keyboard.c:109: if (is_within_keyboard(cursor.x - 16, cursor.y))
	ld	hl, #_cursor + 1
	ld	e, (hl)
	ld	bc, #_cursor
	ld	a, (bc)
	add	a, #0xf0
	push	hl
	push	bc
	call	_is_within_keyboard
	pop	bc
	pop	hl
	or	a, a
	ret	Z
;keyboard.c:111: cursor.col--;
	ld	de, #_cursor + 2
	ld	a, (de)
	dec	a
	ld	(de), a
;keyboard.c:112: cursor.x -= 16;
	ld	a, (bc)
	add	a, #0xf0
	ld	(bc), a
;keyboard.c:113: move_sprite(0, cursor.x, cursor.y);
	ld	e, (hl)
	ld	a, (bc)
	ld	c, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), c
;keyboard.c:114: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;keyboard.c:116: }
	ret
;keyboard.c:118: void move_cursor_right(void)
;	---------------------------------
; Function move_cursor_right
; ---------------------------------
_move_cursor_right::
;keyboard.c:120: if (is_within_keyboard(cursor.x + 16, cursor.y))
	ld	hl, #_cursor + 1
	ld	e, (hl)
	ld	bc, #_cursor
	ld	a, (bc)
	add	a, #0x10
	push	hl
	push	bc
	call	_is_within_keyboard
	pop	bc
	pop	hl
	or	a, a
	ret	Z
;keyboard.c:122: cursor.col++;
	ld	de, #_cursor + 2
	ld	a, (de)
	inc	a
	ld	(de), a
;keyboard.c:123: cursor.x += 16;
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;keyboard.c:124: move_sprite(0, cursor.x, cursor.y);
	ld	e, (hl)
	ld	a, (bc)
	ld	c, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), c
;keyboard.c:125: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;keyboard.c:127: }
	ret
;keyboard.c:129: UBYTE is_within_keyboard(UINT8 x, UINT8 y)
;	---------------------------------
; Function is_within_keyboard
; ---------------------------------
_is_within_keyboard::
	ld	c, a
;keyboard.c:132: if ((x == 140 && y == 144) || (x == 156 && y == 144))
	ld	a, e
	sub	a, #0x90
	ld	a, #0x01
	jr	Z, 00151$
	xor	a, a
00151$:
	ld	b, a
	ld	a, c
	sub	a, #0x8c
	jr	NZ, 00105$
	or	a, b
	jr	NZ, 00101$
00105$:
	ld	a, c
	sub	a, #0x9c
	jr	NZ, 00102$
	or	a, b
	jr	Z, 00102$
00101$:
;keyboard.c:134: return 1;
	ld	a, #0x01
	ret
00102$:
;keyboard.c:136: return (x >= mincursor_x && x <= maxcursor_x && y >= mincursor_y && y <= maxcursor_y);
	ld	a, c
	sub	a, #0x0c
	jr	C, 00108$
	ld	a, #0x9c
	sub	a, c
	jr	C, 00108$
	ld	a, e
	sub	a, #0x50
	jr	C, 00108$
	ld	a, #0x80
	sub	a, e
	jr	NC, 00109$
00108$:
	xor	a, a
	ret
00109$:
	ld	a, #0x01
;keyboard.c:137: }
	ret
;keyboard.c:139: void add_character_to_name(struct Cursor *cursor)
;	---------------------------------
; Function add_character_to_name
; ---------------------------------
_add_character_to_name::
	ld	c, e
	ld	b, d
;keyboard.c:141: UINT8 character_index = cursor->row * 10 + cursor->col + 1;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, l
	ld	c, a
	inc	c
;keyboard.c:143: if (name_character_index == 18)
	ld	a, (#_name_character_index)
	sub	a, #0x12
	ret	Z
;keyboard.c:144: return; // Maximum length reached
;keyboard.c:146: pet_name[name_character_index] = character_index;
	ld	a, #<(_pet_name)
	ld	hl, #_name_character_index
	add	a, (hl)
	ld	e, a
	ld	a, #>(_pet_name)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	ld	(de), a
;keyboard.c:147: name_character_index++;
	inc	(hl)
;keyboard.c:148: }
	ret
;keyboard.c:150: void update_pet_name(struct Cursor *cursor)
;	---------------------------------
; Function update_pet_name
; ---------------------------------
_update_pet_name::
;keyboard.c:152: if (cursor->col == 8 && cursor->row == 4)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00106$
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00106$
;keyboard.c:154: remove_from_pet_name();
	call	_remove_from_pet_name
;keyboard.c:155: draw_pet_name();
	jp	_draw_pet_name
00106$:
;keyboard.c:157: else if (cursor->col == 9 && cursor->row == 4)
	ld	a, c
	sub	a, #0x09
	jr	NZ, 00102$
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00102$
;keyboard.c:159: pet_has_name = 1; // Indicate that the player has chosen a name
	ld	hl, #_pet_has_name
;keyboard.c:160: draw_pet_name();
	ld	(hl), #0x01
	jp	_draw_pet_name
00102$:
;keyboard.c:164: add_character_to_name(cursor);
	call	_add_character_to_name
;keyboard.c:165: draw_pet_name();
;keyboard.c:167: }
	jp	_draw_pet_name
;keyboard.c:169: void draw_pet_name(void)
;	---------------------------------
; Function draw_pet_name
; ---------------------------------
_draw_pet_name::
;keyboard.c:171: set_bkg_tiles(1, 4, 18, 1, pet_name);
	ld	de, #_pet_name
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x401
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;keyboard.c:172: }
	ret
;keyboard.c:174: void remove_from_pet_name(void)
;	---------------------------------
; Function remove_from_pet_name
; ---------------------------------
_remove_from_pet_name::
;keyboard.c:176: if (name_character_index > 0)
	ld	hl, #_name_character_index
	ld	a, (hl)
	or	a, a
	ret	Z
;keyboard.c:178: name_character_index--;
	dec	(hl)
;keyboard.c:179: pet_name[name_character_index] = 0; // Clear the last character
	ld	a, #<(_pet_name)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_pet_name)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;keyboard.c:181: }
	ret
;keyboard.c:184: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;keyboard.c:187: for (i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;keyboard.c:189: wait_vbl_done();
	call	_wait_vbl_done
;keyboard.c:187: for (i = 0; i < numloops; i++)
	inc	b
;keyboard.c:191: }
	jr	00103$
	.area _CODE
	.area _INITIALIZER
__xinit__keydown:
	.db #0x00	; 0
__xinit__pet_has_name:
	.db #0x00	; 0
__xinit__name_character_index:
	.db #0x00	; 0
	.area _CABS (ABS)
