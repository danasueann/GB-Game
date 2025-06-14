;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _get_right_message
	.globl _get_left_message
	.globl _get_down_message
	.globl _get_up_message
	.globl _get_play_message
	.globl _get_feed_message
	.globl _get_pet_name
	.globl _setup_pet_sprite
	.globl _show_selection_menu
	.globl _setup_dog_sprite_main
	.globl _setup_dog_sprite_selection
	.globl _puts
	.globl _printf
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _selected_pet
	.globl _CatSprite
	.globl _PoodleSprite
	.globl _setup_cat_sprite_selection
	.globl _setup_cat_sprite_main
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_main_time_counter_20003_369:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_PoodleSprite::
	.ds 96
_CatSprite::
	.ds 144
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
;main.c:254: static UBYTE time_counter = 0;
	xor	a, a
	ld	hl, #_main_time_counter_20003_369
	ld	(hl), a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;cat_sprite.h:12: void setup_cat_sprite_selection(void)
;	---------------------------------
; Function setup_cat_sprite_selection
; ---------------------------------
_setup_cat_sprite_selection::
;cat_sprite.h:15: set_sprite_data(6, 9, CatSprite);
	ld	de, #_CatSprite
	push	de
	ld	hl, #0x906
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0d
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x60
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x68
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x70
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x60
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x68
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x70
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x60
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x68
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x70
;cat_sprite.h:34: move_sprite(14, 112, 52); // down right
;cat_sprite.h:35: }
	ret
;cat_sprite.h:37: void setup_cat_sprite_main(void)
;	---------------------------------
; Function setup_cat_sprite_main
; ---------------------------------
_setup_cat_sprite_main::
;cat_sprite.h:40: set_sprite_data(0, 9, CatSprite);
	ld	de, #_CatSprite
	push	de
	ld	hl, #0x900
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x44
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x4c
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x54
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x44
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x4c
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x54
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x44
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x4c
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x54
;cat_sprite.h:62: move_sprite(8, 84, 52);
;cat_sprite.h:63: }
	ret
;dog_sprite2.h:3: void setup_dog_sprite_selection(void) {
;	---------------------------------
; Function setup_dog_sprite_selection
; ---------------------------------
_setup_dog_sprite_selection::
;dog_sprite2.h:7: set_sprite_data(0, 19, Poodle2_tiles); // 304 bytes / 16 bytes per tile = 19 tiles
	ld	de, #_Poodle2_tiles
	push	de
	ld	hl, #0x1300
	push	hl
	call	_set_sprite_data
	add	sp, #4
;dog_sprite2.h:10: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x01
	ld	(hl-), a
	dec	hl
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x50
;dog_sprite2.h:14: move_sprite(0, 80, 80); // Position auf dem Bildschirm
;dog_sprite2.h:15: }
	ret
;dog_sprite2.h:17: void setup_dog_sprite_main(void) {
;	---------------------------------
; Function setup_dog_sprite_main
; ---------------------------------
_setup_dog_sprite_main::
	add	sp, #-9
;dog_sprite2.h:21: uint8_t sprite_index = 0;
	ld	c, #0x00
;dog_sprite2.h:25: set_sprite_data(0, 19, Poodle2_tiles);
	ld	de, #_Poodle2_tiles
	push	de
	ld	hl, #0x1300
	push	hl
	call	_set_sprite_data
	add	sp, #4
;dog_sprite2.h:29: for (uint8_t row = 0; row < 5; row++) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00113$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x05
	jp	NC, 00106$
;dog_sprite2.h:30: for (uint8_t col = 0; col < 5; col++) {
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00123$
;dog_sprite2.h:31: uint8_t tile_id = Poodle2_map[row * 5 + col];
	dec	hl
	dec	hl
	ld	a, (hl+)
	inc	hl
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, (hl)
	add	a, b
	ld	l, a
	ld	h, #0x00
	ld	de, #_Poodle2_map
	add	hl, de
	ld	b, (hl)
;dog_sprite2.h:32: uint8_t sprite_x = dog_x + (col * 8); // 8 Pixel pro Tile
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x50
	ldhl	sp,	#2
;dog_sprite2.h:33: uint8_t sprite_y = dog_y + (row * 8);
	ld	(hl+), a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x48
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#7
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;dog_sprite2.h:39: sprite_index++;
	ldhl	sp,	#7
	inc	(hl)
;dog_sprite2.h:42: if (sprite_index >= 40) break; // Game Boy hat maximal 40 Sprites
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00123$
;dog_sprite2.h:30: for (uint8_t col = 0; col < 5; col++) {
	inc	hl
	inc	(hl)
	jr	00110$
00123$:
	ldhl	sp,	#7
	ld	c, (hl)
;dog_sprite2.h:44: if (sprite_index >= 40) break;
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00106$
;dog_sprite2.h:29: for (uint8_t row = 0; row < 5; row++) {
	dec	hl
	inc	(hl)
	jp	00113$
00106$:
;dog_sprite2.h:48: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;dog_sprite2.h:49: }
	add	sp, #9
	ret
;main.c:11: void show_selection_menu()
;	---------------------------------
; Function show_selection_menu
; ---------------------------------
_show_selection_menu::
;main.c:16: setup_dog2_sprite_selection();
	call	_setup_dog2_sprite_selection
;main.c:19: setup_cat_sprite_selection();
	call	_setup_cat_sprite_selection
;main.c:22: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:24: cls();
	call	_cls
;main.c:30: printf("Press A or B\n to select!\n");
	ld	de, #___str_15
;main.c:31: }
	jp	_puts
___str_15:
	.db 0x0a
	.ascii "== PET SELECTION =="
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "   POODLE      CAT"
	.db 0x0a
	.db 0x0a
	.ascii "Press A or B"
	.db 0x0a
	.ascii " to select!"
	.db 0x00
;main.c:33: void setup_pet_sprite()
;	---------------------------------
; Function setup_pet_sprite
; ---------------------------------
_setup_pet_sprite::
;main.c:36: for (UBYTE i = 0; i < 15; i++)
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00101$
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:36: for (UBYTE i = 0; i < 15; i++)
	inc	c
	jr	00107$
00101$:
;main.c:41: if (selected_pet == 0)
	ld	hl, #_selected_pet
	ld	a, (hl)
	or	a, a
	jp	NZ, _setup_cat_sprite_main
;main.c:44: setup_dog2_sprite_main();
;main.c:50: setup_cat_sprite_main();
;main.c:52: }
	jp	_setup_dog2_sprite_main
;main.c:54: const char *get_pet_name()
;	---------------------------------
; Function get_pet_name
; ---------------------------------
_get_pet_name::
;main.c:56: return (selected_pet == 0) ? "POODLE" : "KITTY";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_16+0
	ret
00103$:
	ld	bc, #___str_17+0
;main.c:57: }
	ret
___str_16:
	.ascii "POODLE"
	.db 0x00
___str_17:
	.ascii "KITTY"
	.db 0x00
;main.c:59: const char *get_feed_message()
;	---------------------------------
; Function get_feed_message
; ---------------------------------
_get_feed_message::
;main.c:61: return (selected_pet == 0) ? "*munch munch* Woof!" : "*purr purr* Meow!";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_18+0
	ret
00103$:
	ld	bc, #___str_19+0
;main.c:62: }
	ret
___str_18:
	.ascii "*munch munch* Woof!"
	.db 0x00
___str_19:
	.ascii "*purr purr* Meow!"
	.db 0x00
;main.c:64: const char *get_play_message()
;	---------------------------------
; Function get_play_message
; ---------------------------------
_get_play_message::
;main.c:66: return (selected_pet == 0) ? "*woof woof* Fun!" : "*meow* Playful!";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_20+0
	ret
00103$:
	ld	bc, #___str_21+0
;main.c:67: }
	ret
___str_20:
	.ascii "*woof woof* Fun!"
	.db 0x00
___str_21:
	.ascii "*meow* Playful!"
	.db 0x00
;main.c:69: const char *get_up_message()
;	---------------------------------
; Function get_up_message
; ---------------------------------
_get_up_message::
;main.c:71: return (selected_pet == 0) ? "*looks up curiously*" : "*ears perk up*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_22+0
	ret
00103$:
	ld	bc, #___str_23+0
;main.c:72: }
	ret
___str_22:
	.ascii "*looks up curiously*"
	.db 0x00
___str_23:
	.ascii "*ears perk up*"
	.db 0x00
;main.c:74: const char *get_down_message()
;	---------------------------------
; Function get_down_message
; ---------------------------------
_get_down_message::
;main.c:76: return (selected_pet == 0) ? "*sniffs the ground*" : "*sniffs around*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_24+0
	ret
00103$:
	ld	bc, #___str_25+0
;main.c:77: }
	ret
___str_24:
	.ascii "*sniffs the ground*"
	.db 0x00
___str_25:
	.ascii "*sniffs around*"
	.db 0x00
;main.c:79: const char *get_left_message()
;	---------------------------------
; Function get_left_message
; ---------------------------------
_get_left_message::
;main.c:81: return (selected_pet == 0) ? "*turns left*" : "*stretches left*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_26+0
	ret
00103$:
	ld	bc, #___str_27+0
;main.c:82: }
	ret
___str_26:
	.ascii "*turns left*"
	.db 0x00
___str_27:
	.ascii "*stretches left*"
	.db 0x00
;main.c:84: const char *get_right_message()
;	---------------------------------
; Function get_right_message
; ---------------------------------
_get_right_message::
;main.c:86: return (selected_pet == 0) ? "*turns right*" : "*stretches right*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_28+0
	ret
00103$:
	ld	bc, #___str_29+0
;main.c:87: }
	ret
___str_28:
	.ascii "*turns right*"
	.db 0x00
___str_29:
	.ascii "*stretches right*"
	.db 0x00
;main.c:89: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-5
;main.c:91: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:93: show_selection_menu();
	call	_show_selection_menu
;main.c:97: while (1)
00106$:
;main.c:99: mButtons = joypad();
	call	_joypad
;main.c:101: if (mButtons & J_A)
	bit	4, a
	jr	Z, 00102$
;main.c:103: selected_pet = 0; // Dog
	xor	a, a
	ld	(#_selected_pet),a
;main.c:104: break;
	jr	00108$
00102$:
;main.c:107: if (mButtons & J_B)
	bit	5, a
	jr	Z, 00104$
;main.c:109: selected_pet = 1; // Cat
	ld	hl, #_selected_pet
	ld	(hl), #0x01
;main.c:110: break;
	jr	00108$
00104$:
;main.c:113: wait_vbl_done();
	call	_wait_vbl_done
	jr	00106$
;main.c:117: while (joypad())
00108$:
	call	_joypad
	or	a, a
	jr	NZ, 00108$
;main.c:120: setup_pet_sprite();
	call	_setup_pet_sprite
;main.c:121: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:124: cls();
	call	_cls
;main.c:126: UBYTE happiness = 50;
	ldhl	sp,	#2
;main.c:127: UBYTE hunger = 30;
	ld	a, #0x32
	ld	(hl+), a
;main.c:128: UBYTE energy = 70;
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x46
;main.c:131: printf("=== TAMAGOTCHI ===\n");
	ld	de, #___str_79
	call	_puts
;main.c:132: printf("Your %s is ready!\n", get_pet_name());
	call	_get_pet_name
	push	bc
	ld	de, #___str_34
	push	de
	call	_printf
	add	sp, #4
;main.c:133: printf("\n\n\n\n\n\n");
	ld	de, #___str_36
	call	_puts
;main.c:134: printf("Happiness: %d\n", happiness);
	ld	de, #0x0032
	push	de
	ld	de, #___str_37
	push	de
	call	_printf
	add	sp, #4
;main.c:135: printf("Hunger: %d\n", hunger);
	ld	de, #0x001e
	push	de
	ld	de, #___str_38
	push	de
	call	_printf
	add	sp, #4
;main.c:136: printf("Energy: %d\n", energy);
	ld	de, #0x0046
	push	de
	ld	de, #___str_39
	push	de
	call	_printf
	add	sp, #4
;main.c:138: while (1)
00191$:
;main.c:140: mButtons = joypad();
	call	_joypad
	ldhl	sp,	#1
	ld	(hl), a
;main.c:142: if (mButtons & J_A)
	push	hl
	bit	4, (hl)
	pop	hl
	jr	Z, 00119$
;main.c:144: if (hunger > 0)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;main.c:146: hunger -= 15;
	ld	a, (hl)
	add	a, #0xf1
;main.c:149: happiness += 5;
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
;main.c:150: if (happiness > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00114$
;main.c:151: happiness = 100;
	ld	(hl), #0x64
00114$:
;main.c:152: printf("%s\n", get_feed_message());
	call	_get_feed_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
;main.c:153: printf("Hunger: %d Happiness: %d\n", hunger, happiness);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, #0x00
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #___str_41
	push	de
	push	bc
	push	hl
	call	_printf
	add	sp, #6
	jr	00119$
00116$:
;main.c:157: printf("Not hungry right now!\n");
	ld	de, #___str_43
	call	_puts
00119$:
;main.c:161: if (mButtons & J_B)
	push	hl
	ldhl	sp,	#3
	bit	5, (hl)
	pop	hl
	jr	Z, 00128$
;main.c:164: if (energy > 10)
	ld	a, #0x0a
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NC, 00125$
;main.c:166: happiness += 10;
	dec	hl
	dec	hl
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;main.c:167: if (happiness > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00121$
;main.c:168: happiness = 100;
	ld	(hl), #0x64
00121$:
;main.c:169: energy -= 10;
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xf6
;main.c:170: hunger += 5;
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
;main.c:171: if (hunger > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00123$
;main.c:172: hunger = 100;
	ld	(hl), #0x64
00123$:
;main.c:174: printf("%s\n", get_play_message());
	call	_get_play_message
	ld	de, #___str_40+0
	push	bc
	push	de
	call	_printf
	add	sp, #4
;main.c:175: printf("Energy: %d Happiness: %d\n", energy, happiness);
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	e, a
	ld	d, #0x00
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	ld	de, #___str_44
	push	de
	call	_printf
	add	sp, #6
	jr	00128$
00125$:
;main.c:179: printf("Too tired to play...\n");
	ld	de, #___str_46
	call	_puts
00128$:
;main.c:183: if (mButtons & J_SELECT)
	push	hl
	ldhl	sp,	#3
	bit	6, (hl)
	pop	hl
	jr	Z, 00134$
;main.c:186: energy += 20;
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x14
	ld	(hl), a
;main.c:187: if (energy > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00130$
;main.c:188: energy = 100;
	ld	(hl), #0x64
00130$:
;main.c:189: hunger += 3;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;main.c:190: if (hunger > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00132$
;main.c:191: hunger = 100;
	ld	(hl), #0x64
00132$:
;main.c:193: printf("*zzz* Good rest!\n");
	ld	de, #___str_48
	call	_puts
;main.c:194: printf("Energy: %d\n", energy);
	ldhl	sp,	#4
	ld	c, (hl)
	xor	a, a
	ld	b, a
	push	bc
	ld	de, #___str_39
	push	de
	call	_printf
	add	sp, #4
00134$:
;main.c:197: if (mButtons & J_START)
	push	hl
	ldhl	sp,	#3
	bit	7, (hl)
	pop	hl
	jp	Z, 00166$
;main.c:199: printf("\n=== %s STATUS ===\n", get_pet_name());
	call	_get_pet_name
	push	bc
	ld	de, #___str_49
	push	de
	call	_printf
	add	sp, #4
;main.c:200: printf("Happiness: %d/100\n", happiness);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_50
	push	de
	call	_printf
	add	sp, #4
;main.c:201: printf("Hunger: %d/100\n", hunger);
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_51
	push	de
	call	_printf
	add	sp, #4
;main.c:202: printf("Energy: %d/100\n", energy);
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_52
	push	de
	call	_printf
	add	sp, #4
;main.c:204: if (happiness > 80)
	ld	a, #0x50
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00145$
;main.c:205: printf("Mood: Very Happy! :D\n");
	ld	de, #___str_54
	call	_puts
	jr	00146$
00145$:
;main.c:206: else if (happiness > 60)
	ld	a, #0x3c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00142$
;main.c:207: printf("Mood: Happy :)\n");
	ld	de, #___str_56
	call	_puts
	jr	00146$
00142$:
;main.c:208: else if (happiness > 40)
	ld	a, #0x28
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00139$
;main.c:209: printf("Mood: Okay :/\n");
	ld	de, #___str_58
	call	_puts
	jr	00146$
00139$:
;main.c:210: else if (happiness > 20)
	ld	a, #0x14
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00136$
;main.c:211: printf("Mood: Sad :(\n");
	ld	de, #___str_60
	call	_puts
	jr	00146$
00136$:
;main.c:213: printf("Mood: Very Sad T_T\n");
	ld	de, #___str_62
	call	_puts
00146$:
;main.c:215: if (hunger > 80)
	ld	a, #0x50
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00154$
;main.c:216: printf("Status: Very Hungry!\n");
	ld	de, #___str_64
	call	_puts
	jr	00155$
00154$:
;main.c:217: else if (hunger > 50)
	ld	a, #0x32
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00151$
;main.c:218: printf("Status: Hungry\n");
	ld	de, #___str_66
	call	_puts
	jr	00155$
00151$:
;main.c:219: else if (hunger > 20)
	ld	a, #0x14
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00148$
;main.c:220: printf("Status: A bit hungry\n");
	ld	de, #___str_68
	call	_puts
	jr	00155$
00148$:
;main.c:222: printf("Status: Well fed\n");
	ld	de, #___str_70
	call	_puts
00155$:
;main.c:224: if (energy < 20)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00163$
;main.c:225: printf("Energy: Exhausted\n");
	ld	de, #___str_72
	call	_puts
	jr	00166$
00163$:
;main.c:226: else if (energy < 50)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00160$
;main.c:227: printf("Energy: Tired\n");
	ld	de, #___str_74
	call	_puts
	jr	00166$
00160$:
;main.c:228: else if (energy < 80)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x50
	jr	NC, 00157$
;main.c:229: printf("Energy: Normal\n");
	ld	de, #___str_76
	call	_puts
	jr	00166$
00157$:
;main.c:231: printf("Energy: Full of energy!\n");
	ld	de, #___str_78
	call	_puts
00166$:
;main.c:234: if (mButtons & J_UP)
	push	hl
	ldhl	sp,	#3
	bit	2, (hl)
	pop	hl
	jr	Z, 00168$
;main.c:236: printf("%s\n", get_up_message());
	call	_get_up_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00168$:
;main.c:239: if (mButtons & J_DOWN)
	push	hl
	ldhl	sp,	#3
	bit	3, (hl)
	pop	hl
	jr	Z, 00170$
;main.c:241: printf("%s\n", get_down_message());
	call	_get_down_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00170$:
;main.c:244: if (mButtons & J_LEFT)
	push	hl
	ldhl	sp,	#3
	bit	1, (hl)
	pop	hl
	jr	Z, 00172$
;main.c:246: printf("%s\n", get_left_message());
	call	_get_left_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00172$:
;main.c:249: if (mButtons & J_RIGHT)
	push	hl
	ldhl	sp,	#3
	bit	0, (hl)
	pop	hl
	jr	Z, 00174$
;main.c:251: printf("%s\n", get_right_message());
	call	_get_right_message
	pop	hl
	ld	e, c
	ld	d, b
	push	de
	push	de
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00174$:
;main.c:255: time_counter++;
	ld	hl, #_main_time_counter_20003_369
	inc	(hl)
;main.c:256: if (time_counter > 200)
	ld	a, #0xc8
	sub	a, (hl)
	jr	NC, 00187$
;main.c:258: time_counter = 0;
	ld	(hl), #0x00
;main.c:260: if (hunger < 100)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00176$
;main.c:261: hunger++;
	inc	(hl)
00176$:
;main.c:262: if (energy > 0 && happiness > 30)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00178$
	dec	hl
	dec	hl
	ld	a, #0x1e
	sub	a, (hl)
	jr	NC, 00178$
;main.c:263: energy--;
	inc	hl
	inc	hl
	dec	(hl)
00178$:
;main.c:265: if (hunger > 90 || energy < 10)
	ld	a, #0x5a
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00182$
	inc	hl
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00187$
00182$:
;main.c:267: if (happiness > 0)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00187$
;main.c:268: happiness--;
	dec	(hl)
;main.c:272: while (mButtons = joypad())
00187$:
	call	_joypad
	or	a, a
	jr	NZ, 00187$
;main.c:274: wait_vbl_done();
	call	_wait_vbl_done
	jp	00191$
;main.c:276: }
	add	sp, #5
	ret
___str_34:
	.ascii "Your %s is ready!"
	.db 0x0a
	.db 0x00
___str_36:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_37:
	.ascii "Happiness: %d"
	.db 0x0a
	.db 0x00
___str_38:
	.ascii "Hunger: %d"
	.db 0x0a
	.db 0x00
___str_39:
	.ascii "Energy: %d"
	.db 0x0a
	.db 0x00
___str_40:
	.ascii "%s"
	.db 0x0a
	.db 0x00
___str_41:
	.ascii "Hunger: %d Happiness: %d"
	.db 0x0a
	.db 0x00
___str_43:
	.ascii "Not hungry right now!"
	.db 0x00
___str_44:
	.ascii "Energy: %d Happiness: %d"
	.db 0x0a
	.db 0x00
___str_46:
	.ascii "Too tired to play..."
	.db 0x00
___str_48:
	.ascii "*zzz* Good rest!"
	.db 0x00
___str_49:
	.db 0x0a
	.ascii "=== %s STATUS ==="
	.db 0x0a
	.db 0x00
___str_50:
	.ascii "Happiness: %d/100"
	.db 0x0a
	.db 0x00
___str_51:
	.ascii "Hunger: %d/100"
	.db 0x0a
	.db 0x00
___str_52:
	.ascii "Energy: %d/100"
	.db 0x0a
	.db 0x00
___str_54:
	.ascii "Mood: Very Happy! :D"
	.db 0x00
___str_56:
	.ascii "Mood: Happy :)"
	.db 0x00
___str_58:
	.ascii "Mood: Okay :/"
	.db 0x00
___str_60:
	.ascii "Mood: Sad :("
	.db 0x00
___str_62:
	.ascii "Mood: Very Sad T_T"
	.db 0x00
___str_64:
	.ascii "Status: Very Hungry!"
	.db 0x00
___str_66:
	.ascii "Status: Hungry"
	.db 0x00
___str_68:
	.ascii "Status: A bit hungry"
	.db 0x00
___str_70:
	.ascii "Status: Well fed"
	.db 0x00
___str_72:
	.ascii "Energy: Exhausted"
	.db 0x00
___str_74:
	.ascii "Energy: Tired"
	.db 0x00
___str_76:
	.ascii "Energy: Normal"
	.db 0x00
___str_78:
	.ascii "Energy: Full of energy!"
	.db 0x00
___str_79:
	.db 0x0a
	.ascii "=== TAMAGOTCHI ==="
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__PoodleSprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x3c	; 60
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0x54	; 84	'T'
	.db #0xf7	; 247
	.db #0x9c	; 156
	.db #0xf7	; 247
	.db #0x98	; 152
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0xde	; 222
	.db #0x2a	; 42
	.db #0xef	; 239
	.db #0x39	; 57	'9'
	.db #0xef	; 239
	.db #0x19	; 25
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0x2f	; 47
	.db #0x35	; 53	'5'
	.db #0x17	; 23
	.db #0x1a	; 26
	.db #0x2b	; 43
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x33	; 51	'3'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0xf4	; 244
	.db #0xac	; 172
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xd4	; 212
	.db #0x2c	; 44
	.db #0x34	; 52	'4'
	.db #0xcc	; 204
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0x86	; 134
	.db #0xf5	; 245
	.db #0x8f	; 143
	.db #0xf9	; 249
	.db #0x8f	; 143
	.db #0x72	; 114	'r'
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__CatSprite:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x4b	; 75	'K'
	.db #0x7b	; 123
	.db #0x54	; 84	'T'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x6f	; 111	'o'
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x46	; 70	'F'
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0xfb	; 251
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0xbe	; 190
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xec	; 236
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xe6	; 230
	.db #0xff	; 255
	.db #0x59	; 89	'Y'
	.db #0x66	; 102	'f'
	.db #0xe3	; 227
	.db #0xfc	; 252
	.db #0x43	; 67	'C'
	.db #0x7c	; 124
	.db #0x21	; 33
	.db #0x3e	; 62
	.db #0x4f	; 79	'O'
	.db #0x7e	; 126
	.db #0x5f	; 95
	.db #0x71	; 113	'q'
	.db #0x5f	; 95
	.db #0x71	; 113	'q'
	.db #0xec	; 236
	.db #0x1f	; 31
	.db #0xf3	; 243
	.db #0xec	; 236
	.db #0xf8	; 248
	.db #0x47	; 71	'G'
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xfe	; 254
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xfe	; 254
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x8f	; 143
	.db #0xfe	; 254
	.db #0x5f	; 95
	.db #0x71	; 113	'q'
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x0f	; 15
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x26	; 38
	.db #0xe6	; 230
	.db #0x2f	; 47
	.db #0xe9	; 233
	.db #0x2e	; 46
	.db #0xea	; 234
	.db #0x34	; 52	'4'
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0xc8	; 200
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__selected_pet:
	.db #0x00	; 0
	.area _CABS (ABS)
