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
	.globl _puts
	.globl _printf
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _selected_pet
	.globl _CatSprite
	.globl _PoodleSprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_main_time_counter_20003_376:
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
;main.c:334: static UBYTE time_counter = 0;
	xor	a, a
	ld	hl, #_main_time_counter_20003_376
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
;main.c:9: void show_selection_menu()
;	---------------------------------
; Function show_selection_menu
; ---------------------------------
_show_selection_menu::
;main.c:14: set_sprite_data(0, 6, PoodleSprite);
	ld	de, #_PoodleSprite
	push	de
	ld	hl, #0x600
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
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x30
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x38
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x30
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x38
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x30
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x38
;main.c:31: set_sprite_data(6, 9, CatSprite);
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
;main.c:53: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:55: cls();
	call	_cls
;main.c:61: printf("Press A or B\n to select!\n");
	ld	de, #___str_15
;main.c:62: }
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
;main.c:64: void setup_pet_sprite()
;	---------------------------------
; Function setup_pet_sprite
; ---------------------------------
_setup_pet_sprite::
;main.c:67: for (UBYTE i = 0; i < 15; i++)
	ld	c, #0x00
00137$:
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
;main.c:67: for (UBYTE i = 0; i < 15; i++)
	inc	c
	jr	00137$
00101$:
;main.c:72: if (selected_pet == 0)
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
;main.c:75: set_sprite_data(0, 6, PoodleSprite);
	ld	de, #_PoodleSprite
	push	de
	ld	hl, #0x600
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
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x48
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x50
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x48
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x50
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x48
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x50
;main.c:91: move_sprite(5, 80, 56); // unten rechts
	ret
00103$:
;main.c:96: set_sprite_data(0, 9, CatSprite);
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
;main.c:118: move_sprite(8, 84, 52); // unten rechts
;main.c:120: }
	ret
;main.c:122: const char *get_pet_name()
;	---------------------------------
; Function get_pet_name
; ---------------------------------
_get_pet_name::
;main.c:124: return (selected_pet == 0) ? "POODLE" : "KITTY";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_16+0
	ret
00103$:
	ld	bc, #___str_17+0
;main.c:125: }
	ret
___str_16:
	.ascii "POODLE"
	.db 0x00
___str_17:
	.ascii "KITTY"
	.db 0x00
;main.c:127: const char *get_feed_message()
;	---------------------------------
; Function get_feed_message
; ---------------------------------
_get_feed_message::
;main.c:129: return (selected_pet == 0) ? "*munch munch* Woof!" : "*purr purr* Meow!";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_18+0
	ret
00103$:
	ld	bc, #___str_19+0
;main.c:130: }
	ret
___str_18:
	.ascii "*munch munch* Woof!"
	.db 0x00
___str_19:
	.ascii "*purr purr* Meow!"
	.db 0x00
;main.c:132: const char *get_play_message()
;	---------------------------------
; Function get_play_message
; ---------------------------------
_get_play_message::
;main.c:134: return (selected_pet == 0) ? "*woof woof* Fun!" : "*meow* Playful!";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_20+0
	ret
00103$:
	ld	bc, #___str_21+0
;main.c:135: }
	ret
___str_20:
	.ascii "*woof woof* Fun!"
	.db 0x00
___str_21:
	.ascii "*meow* Playful!"
	.db 0x00
;main.c:137: const char *get_up_message()
;	---------------------------------
; Function get_up_message
; ---------------------------------
_get_up_message::
;main.c:139: return (selected_pet == 0) ? "*looks up curiously*" : "*ears perk up*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_22+0
	ret
00103$:
	ld	bc, #___str_23+0
;main.c:140: }
	ret
___str_22:
	.ascii "*looks up curiously*"
	.db 0x00
___str_23:
	.ascii "*ears perk up*"
	.db 0x00
;main.c:142: const char *get_down_message()
;	---------------------------------
; Function get_down_message
; ---------------------------------
_get_down_message::
;main.c:144: return (selected_pet == 0) ? "*sniffs the ground*" : "*sniffs around*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_24+0
	ret
00103$:
	ld	bc, #___str_25+0
;main.c:145: }
	ret
___str_24:
	.ascii "*sniffs the ground*"
	.db 0x00
___str_25:
	.ascii "*sniffs around*"
	.db 0x00
;main.c:147: const char *get_left_message()
;	---------------------------------
; Function get_left_message
; ---------------------------------
_get_left_message::
;main.c:149: return (selected_pet == 0) ? "*turns left*" : "*stretches left*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_26+0
	ret
00103$:
	ld	bc, #___str_27+0
;main.c:150: }
	ret
___str_26:
	.ascii "*turns left*"
	.db 0x00
___str_27:
	.ascii "*stretches left*"
	.db 0x00
;main.c:152: const char *get_right_message()
;	---------------------------------
; Function get_right_message
; ---------------------------------
_get_right_message::
;main.c:154: return (selected_pet == 0) ? "*turns right*" : "*stretches right*";
	ld	a, (#_selected_pet)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #___str_28+0
	ret
00103$:
	ld	bc, #___str_29+0
;main.c:155: }
	ret
___str_28:
	.ascii "*turns right*"
	.db 0x00
___str_29:
	.ascii "*stretches right*"
	.db 0x00
;main.c:157: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-5
;main.c:159: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:162: show_selection_menu();
	call	_show_selection_menu
;main.c:167: while (1)
00106$:
;main.c:169: mButtons = joypad();
	call	_joypad
;main.c:171: if (mButtons & J_A)
	bit	4, a
	jr	Z, 00102$
;main.c:173: selected_pet = 0; // Pudel
	xor	a, a
	ld	(#_selected_pet),a
;main.c:174: break;
	jr	00108$
00102$:
;main.c:177: if (mButtons & J_B)
	bit	5, a
	jr	Z, 00104$
;main.c:179: selected_pet = 1; // Katze
	ld	hl, #_selected_pet
	ld	(hl), #0x01
;main.c:180: break;
	jr	00108$
00104$:
;main.c:183: wait_vbl_done();
	call	_wait_vbl_done
	jr	00106$
;main.c:187: while (joypad())
00108$:
	call	_joypad
	or	a, a
	jr	NZ, 00108$
;main.c:191: setup_pet_sprite();
	call	_setup_pet_sprite
;main.c:192: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:195: cls();
	call	_cls
;main.c:198: UBYTE happiness = 50;
	ldhl	sp,	#2
;main.c:199: UBYTE hunger = 30;
	ld	a, #0x32
	ld	(hl+), a
;main.c:200: UBYTE energy = 70;
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x46
;main.c:204: printf("=== TAMAGOTCHI ===\n");
	ld	de, #___str_79
	call	_puts
;main.c:205: printf("Your %s is ready!\n", get_pet_name());
	call	_get_pet_name
	push	bc
	ld	de, #___str_34
	push	de
	call	_printf
	add	sp, #4
;main.c:206: printf("\n\n\n\n\n\n");
	ld	de, #___str_36
	call	_puts
;main.c:207: printf("Happiness: %d\n", happiness);
	ld	de, #0x0032
	push	de
	ld	de, #___str_37
	push	de
	call	_printf
	add	sp, #4
;main.c:208: printf("Hunger: %d\n", hunger);
	ld	de, #0x001e
	push	de
	ld	de, #___str_38
	push	de
	call	_printf
	add	sp, #4
;main.c:209: printf("Energy: %d\n", energy);
	ld	de, #0x0046
	push	de
	ld	de, #___str_39
	push	de
	call	_printf
	add	sp, #4
;main.c:211: while (1)
00191$:
;main.c:213: mButtons = joypad();
	call	_joypad
	ldhl	sp,	#1
	ld	(hl), a
;main.c:215: if (mButtons & J_A)
	push	hl
	bit	4, (hl)
	pop	hl
	jr	Z, 00119$
;main.c:218: if (hunger > 0)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;main.c:220: hunger -= 15;
	ld	a, (hl)
	add	a, #0xf1
;main.c:223: happiness += 5;
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
;main.c:224: if (happiness > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00114$
;main.c:225: happiness = 100;
	ld	(hl), #0x64
00114$:
;main.c:227: printf("%s\n", get_feed_message());
	call	_get_feed_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
;main.c:228: printf("Hunger: %d Happiness: %d\n", hunger, happiness);
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
;main.c:232: printf("Not hungry right now!\n");
	ld	de, #___str_43
	call	_puts
00119$:
;main.c:236: if (mButtons & J_B)
	push	hl
	ldhl	sp,	#3
	bit	5, (hl)
	pop	hl
	jr	Z, 00128$
;main.c:239: if (energy > 10)
	ld	a, #0x0a
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NC, 00125$
;main.c:241: happiness += 10;
	dec	hl
	dec	hl
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;main.c:242: if (happiness > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00121$
;main.c:243: happiness = 100;
	ld	(hl), #0x64
00121$:
;main.c:244: energy -= 10;
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xf6
;main.c:245: hunger += 5;
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
;main.c:246: if (hunger > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00123$
;main.c:247: hunger = 100;
	ld	(hl), #0x64
00123$:
;main.c:249: printf("%s\n", get_play_message());
	call	_get_play_message
	ld	de, #___str_40+0
	push	bc
	push	de
	call	_printf
	add	sp, #4
;main.c:250: printf("Energy: %d Happiness: %d\n", energy, happiness);
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
;main.c:254: printf("Too tired to play...\n");
	ld	de, #___str_46
	call	_puts
00128$:
;main.c:258: if (mButtons & J_SELECT)
	push	hl
	ldhl	sp,	#3
	bit	6, (hl)
	pop	hl
	jr	Z, 00134$
;main.c:261: energy += 20;
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x14
	ld	(hl), a
;main.c:262: if (energy > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00130$
;main.c:263: energy = 100;
	ld	(hl), #0x64
00130$:
;main.c:264: hunger += 3;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;main.c:265: if (hunger > 100)
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00132$
;main.c:266: hunger = 100;
	ld	(hl), #0x64
00132$:
;main.c:268: printf("*zzz* Good rest!\n");
	ld	de, #___str_48
	call	_puts
;main.c:269: printf("Energy: %d\n", energy);
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
;main.c:272: if (mButtons & J_START)
	push	hl
	ldhl	sp,	#3
	bit	7, (hl)
	pop	hl
	jp	Z, 00166$
;main.c:275: printf("\n=== %s STATUS ===\n", get_pet_name());
	call	_get_pet_name
	push	bc
	ld	de, #___str_49
	push	de
	call	_printf
	add	sp, #4
;main.c:276: printf("Happiness: %d/100\n", happiness);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_50
	push	de
	call	_printf
	add	sp, #4
;main.c:277: printf("Hunger: %d/100\n", hunger);
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_51
	push	de
	call	_printf
	add	sp, #4
;main.c:278: printf("Energy: %d/100\n", energy);
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_52
	push	de
	call	_printf
	add	sp, #4
;main.c:281: if (happiness > 80)
	ld	a, #0x50
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00145$
;main.c:282: printf("Mood: Very Happy! :D\n");
	ld	de, #___str_54
	call	_puts
	jr	00146$
00145$:
;main.c:283: else if (happiness > 60)
	ld	a, #0x3c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00142$
;main.c:284: printf("Mood: Happy :)\n");
	ld	de, #___str_56
	call	_puts
	jr	00146$
00142$:
;main.c:285: else if (happiness > 40)
	ld	a, #0x28
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00139$
;main.c:286: printf("Mood: Okay :/\n");
	ld	de, #___str_58
	call	_puts
	jr	00146$
00139$:
;main.c:287: else if (happiness > 20)
	ld	a, #0x14
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00136$
;main.c:288: printf("Mood: Sad :(\n");
	ld	de, #___str_60
	call	_puts
	jr	00146$
00136$:
;main.c:290: printf("Mood: Very Sad T_T\n");
	ld	de, #___str_62
	call	_puts
00146$:
;main.c:293: if (hunger > 80)
	ld	a, #0x50
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00154$
;main.c:294: printf("Status: Very Hungry!\n");
	ld	de, #___str_64
	call	_puts
	jr	00155$
00154$:
;main.c:295: else if (hunger > 50)
	ld	a, #0x32
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00151$
;main.c:296: printf("Status: Hungry\n");
	ld	de, #___str_66
	call	_puts
	jr	00155$
00151$:
;main.c:297: else if (hunger > 20)
	ld	a, #0x14
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00148$
;main.c:298: printf("Status: A bit hungry\n");
	ld	de, #___str_68
	call	_puts
	jr	00155$
00148$:
;main.c:300: printf("Status: Well fed\n");
	ld	de, #___str_70
	call	_puts
00155$:
;main.c:303: if (energy < 20)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00163$
;main.c:304: printf("Energy: Exhausted\n");
	ld	de, #___str_72
	call	_puts
	jr	00166$
00163$:
;main.c:305: else if (energy < 50)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00160$
;main.c:306: printf("Energy: Tired\n");
	ld	de, #___str_74
	call	_puts
	jr	00166$
00160$:
;main.c:307: else if (energy < 80)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x50
	jr	NC, 00157$
;main.c:308: printf("Energy: Normal\n");
	ld	de, #___str_76
	call	_puts
	jr	00166$
00157$:
;main.c:310: printf("Energy: Full of energy!\n");
	ld	de, #___str_78
	call	_puts
00166$:
;main.c:313: if (mButtons & J_UP)
	push	hl
	ldhl	sp,	#3
	bit	2, (hl)
	pop	hl
	jr	Z, 00168$
;main.c:315: printf("%s\n", get_up_message());
	call	_get_up_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00168$:
;main.c:318: if (mButtons & J_DOWN)
	push	hl
	ldhl	sp,	#3
	bit	3, (hl)
	pop	hl
	jr	Z, 00170$
;main.c:320: printf("%s\n", get_down_message());
	call	_get_down_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00170$:
;main.c:323: if (mButtons & J_LEFT)
	push	hl
	ldhl	sp,	#3
	bit	1, (hl)
	pop	hl
	jr	Z, 00172$
;main.c:325: printf("%s\n", get_left_message());
	call	_get_left_message
	push	bc
	ld	de, #___str_40
	push	de
	call	_printf
	add	sp, #4
00172$:
;main.c:328: if (mButtons & J_RIGHT)
	push	hl
	ldhl	sp,	#3
	bit	0, (hl)
	pop	hl
	jr	Z, 00174$
;main.c:330: printf("%s\n", get_right_message());
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
;main.c:335: time_counter++;
	ld	hl, #_main_time_counter_20003_376
	inc	(hl)
;main.c:336: if (time_counter > 200)
	ld	a, #0xc8
	sub	a, (hl)
	jr	NC, 00187$
;main.c:338: time_counter = 0;
	ld	(hl), #0x00
;main.c:341: if (hunger < 100)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00176$
;main.c:342: hunger++;
	inc	(hl)
00176$:
;main.c:343: if (energy > 0 && happiness > 30)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00178$
	dec	hl
	dec	hl
	ld	a, #0x1e
	sub	a, (hl)
	jr	NC, 00178$
;main.c:344: energy--;
	inc	hl
	inc	hl
	dec	(hl)
00178$:
;main.c:347: if (hunger > 90 || energy < 10)
	ld	a, #0x5a
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00182$
	inc	hl
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00187$
00182$:
;main.c:349: if (happiness > 0)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00187$
;main.c:350: happiness--;
	dec	(hl)
;main.c:355: while (mButtons = joypad())
00187$:
	call	_joypad
	or	a, a
	jr	NZ, 00187$
;main.c:357: wait_vbl_done();
	call	_wait_vbl_done
	jp	00191$
;main.c:359: }
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
