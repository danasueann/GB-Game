;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _show_selection_menu
	.globl _setup_dog2_sprite_selection_managed
	.globl _clear_all_sprites
	.globl _setup_dog2_sprite_main
	.globl _setup_dog2_sprite_selection
	.globl b___func_Poodle2
	.globl ___func_Poodle2
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _selected_pet
	.globl _CatSprite
	.globl _PoodleSprite
	.globl _Poodle2_map
	.globl _Poodle2_tiles
	.globl _Poodle2_palettes
	.globl _setup_cat_sprite_selection
	.globl _setup_cat_sprite_main
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
_PoodleSprite::
	.ds 96
_CatSprite::
	.ds 144
_poodle_selection:
	.ds 4
_poodle_main:
	.ds 4
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
;sprites/Poodle2.c:7: BANKREF(Poodle2)
;	---------------------------------
; Function __func_Poodle2
; ---------------------------------
	b___func_Poodle2	= 0
___func_Poodle2::
	.local b___func_Poodle2 
	___bank_Poodle2 = b___func_Poodle2 
	.globl ___bank_Poodle2 
;dog_sprite2.h:3: void setup_dog2_sprite_selection(void) {
;	---------------------------------
; Function setup_dog2_sprite_selection
; ---------------------------------
_setup_dog2_sprite_selection::
;dog_sprite2.h:5: }
	ret
_Poodle2_palettes:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0401
_Poodle2_tiles:
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x06	; 6
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xb9	; 185
	.db #0xc6	; 198
	.db #0x53	; 83	'S'
	.db #0xec	; 236
	.db #0xa7	; 167
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x5a	; 90	'Z'
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0x43	; 67	'C'
	.db #0xdb	; 219
	.db #0x26	; 38
	.db #0xe5	; 229
	.db #0x1e	; 30
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x33	; 51	'3'
	.db #0xdd	; 221
	.db #0x35	; 53	'5'
	.db #0xdf	; 223
	.db #0x37	; 55	'7'
	.db #0xdf	; 223
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0xdf	; 223
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0x18	; 24
	.db #0xf7	; 247
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x0c	; 12
	.db #0xeb	; 235
	.db #0x1a	; 26
	.db #0xb3	; 179
	.db #0x53	; 83	'S'
	.db #0x67	; 103	'g'
	.db #0xe4	; 228
	.db #0x8f	; 143
	.db #0x89	; 137
	.db #0x3e	; 62
	.db #0x33	; 51	'3'
	.db #0x4e	; 78	'N'
	.db #0x73	; 115	's'
	.db #0x46	; 70	'F'
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0xef	; 239
	.db #0x30	; 48	'0'
	.db #0xd7	; 215
	.db #0x58	; 88	'X'
	.db #0xcb	; 203
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0x27	; 39
	.db #0xf1	; 241
	.db #0x91	; 145
	.db #0x7c	; 124
	.db #0xcc	; 204
	.db #0x72	; 114	'r'
	.db #0xce	; 206
	.db #0x62	; 98	'b'
	.db #0xde	; 222
	.db #0x22	; 34
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0xbd	; 189
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xfc	; 252
	.db #0x79	; 121	'y'
	.db #0xf9	; 249
	.db #0xc3	; 195
	.db #0xc2	; 194
	.db #0xe7	; 231
	.db #0x66	; 102	'f'
	.db #0x5f	; 95
	.db #0xb8	; 184
	.db #0x9f	; 159
	.db #0x73	; 115	's'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_Poodle2_map:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
;dog_sprite2.h:7: void setup_dog2_sprite_main(void) {
;	---------------------------------
; Function setup_dog2_sprite_main
; ---------------------------------
_setup_dog2_sprite_main::
	add	sp, #-5
;dog_sprite2.h:11: uint8_t sprite_index = 30; // WICHTIG: Anderen Sprite-Slot verwenden!
	ld	b, #0x1e
;dog_sprite2.h:15: set_sprite_data(tile_offset, 19, Poodle2_tiles);
	ld	de, #_Poodle2_tiles
	push	de
	ld	hl, #0x1328
	push	hl
	call	_set_sprite_data
	add	sp, #4
;dog_sprite2.h:18: for (uint8_t i = sprite_index; i < sprite_index + 25; i++) {
	ld	c, #0x1e
00115$:
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0x37
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00101$
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
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
;dog_sprite2.h:18: for (uint8_t i = sprite_index; i < sprite_index + 25; i++) {
	inc	c
	jr	00115$
00101$:
;dog_sprite2.h:24: for (uint8_t row = 0; row < 5; row++) {
	ldhl	sp,	#3
	ld	(hl), #0x00
00121$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00109$
;dog_sprite2.h:25: for (uint8_t col = 0; col < 5; col++) {
	inc	hl
	ld	c, b
	ld	(hl), #0x00
00118$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00134$
;dog_sprite2.h:26: uint8_t tile_id = Poodle2_map[row * 5 + col];
	dec	hl
	ld	a, (hl-)
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	b, (hl)
	add	a, b
	ld	l, a
	ld	h, #0x00
	ld	de, #_Poodle2_map
	add	hl, de
	ld	a, (hl)
	ld	e, a
;dog_sprite2.h:28: if (tile_id != 0) {
	or	a, a
	jr	Z, 00119$
;dog_sprite2.h:29: uint8_t sprite_x = dog_x + (col * 8);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x3c
	ldhl	sp,	#0
;dog_sprite2.h:30: uint8_t sprite_y = dog_y + (row * 8);
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x3c
;dog_sprite2.h:33: set_sprite_tile(sprite_index, tile_id + tile_offset);
	ld	(hl+), a
	ld	a, e
	add	a, #0x28
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;dog_sprite2.h:36: sprite_index++;
	inc	c
;dog_sprite2.h:38: if (sprite_index >= 40) break;
	ld	a, c
	sub	a, #0x28
	jr	NC, 00134$
00119$:
;dog_sprite2.h:25: for (uint8_t col = 0; col < 5; col++) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00118$
00134$:
	ld	b, c
;dog_sprite2.h:41: if (sprite_index >= 40) break;
	ld	a, c
	sub	a, #0x28
	jr	NC, 00109$
;dog_sprite2.h:24: for (uint8_t row = 0; row < 5; row++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00121$
00109$:
;dog_sprite2.h:44: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;dog_sprite2.h:45: }
	add	sp, #5
	ret
;dog_sprite2.h:48: void clear_all_sprites(void) {
;	---------------------------------
; Function clear_all_sprites
; ---------------------------------
_clear_all_sprites::
;dog_sprite2.h:49: for (uint8_t i = 0; i < 40; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x28
	ret	NC
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
;dog_sprite2.h:49: for (uint8_t i = 0; i < 40; i++) {
	inc	c
;dog_sprite2.h:53: }
	jr	00105$
;dog_sprite2.h:66: void setup_dog2_sprite_selection_managed(void) {
;	---------------------------------
; Function setup_dog2_sprite_selection_managed
; ---------------------------------
_setup_dog2_sprite_selection_managed::
	add	sp, #-9
;dog_sprite2.h:68: if (poodle_selection.is_active) {
	ld	a, (#(_poodle_selection + 3) + 0)
	or	a, a
	jr	Z, 00103$
;dog_sprite2.h:69: for (uint8_t i = poodle_selection.sprite_start_index; 
	ld	a, (#_poodle_selection + 0)
	ldhl	sp,	#8
	ld	(hl), a
00117$:
;dog_sprite2.h:70: i < poodle_selection.sprite_start_index + poodle_selection.num_sprites_used; i++) {
	ld	hl, #_poodle_selection
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #(_poodle_selection + 2)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00103$
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #_shadow_OAM
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), #0x00
;dog_sprite2.h:70: i < poodle_selection.sprite_start_index + poodle_selection.num_sprites_used; i++) {
	ldhl	sp,	#8
	inc	(hl)
	jr	00117$
00103$:
;dog_sprite2.h:78: uint8_t sprite_index = poodle_selection.sprite_start_index;
	ld	hl, #_poodle_selection
	ld	c, (hl)
;dog_sprite2.h:81: set_sprite_data(poodle_selection.tile_data_offset, 19, Poodle2_tiles);
	ld	a, (#(_poodle_selection + 1) + 0)
	ld	de, #_Poodle2_tiles
	push	de
	ld	h, #0x13
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;dog_sprite2.h:84: for (uint8_t row = 0; row < 5; row++) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00123$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x05
	jp	NC, 00111$
;dog_sprite2.h:85: for (uint8_t col = 0; col < 5; col++) {
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
00120$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00137$
;dog_sprite2.h:86: uint8_t tile_id = Poodle2_map[row * 5 + col];
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
	ld	a, (hl)
	ld	b, a
;dog_sprite2.h:88: if (tile_id != 0) {
	or	a, a
	jr	Z, 00121$
;dog_sprite2.h:89: uint8_t sprite_x = dog_x + (col * 8);
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x19
	ldhl	sp,	#2
;dog_sprite2.h:90: uint8_t sprite_y = dog_y + (row * 8);
	ld	(hl+), a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x19
	ld	(hl), a
;dog_sprite2.h:92: set_sprite_tile(sprite_index, tile_id + poodle_selection.tile_data_offset);
	ld	a, (#(_poodle_selection + 1) + 0)
	add	a, b
	ld	c, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ldhl	sp,	#7
	ld	b, (hl)
	xor	a, a
	sla	b
	adc	a, a
	sla	b
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), b
	inc	hl
	ld	(hl), a
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, c
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
;dog_sprite2.h:95: sprite_index++;
	ldhl	sp,	#7
	inc	(hl)
;dog_sprite2.h:97: if (sprite_index >= 40) break;
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00137$
00121$:
;dog_sprite2.h:85: for (uint8_t col = 0; col < 5; col++) {
	ldhl	sp,	#8
	inc	(hl)
	jp	00120$
00137$:
	ldhl	sp,	#7
	ld	c, (hl)
;dog_sprite2.h:100: if (sprite_index >= 40) break;
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00111$
;dog_sprite2.h:84: for (uint8_t row = 0; row < 5; row++) {
	dec	hl
	inc	(hl)
	jp	00123$
00111$:
;dog_sprite2.h:103: poodle_selection.num_sprites_used = sprite_index - poodle_selection.sprite_start_index;
	ld	hl, #_poodle_selection
	ld	a, c
	sub	a, (hl)
	ld	hl, #(_poodle_selection + 2)
;dog_sprite2.h:104: poodle_selection.is_active = 1;
	ld	(hl+), a
	ld	(hl), #0x01
;dog_sprite2.h:106: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;dog_sprite2.h:107: }
	add	sp, #9
	ret
;main.c:12: void show_selection_menu()
;	---------------------------------
; Function show_selection_menu
; ---------------------------------
_show_selection_menu::
;main.c:16: set_bkg_data(0, 216, background_final_tiles);
	ld	de, #_background_final_tiles
	push	de
	ld	hl, #0xd800
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:17: set_bkg_tiles(0, 0, 20, 18, background_final_map);
	ld	de, #_background_final_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:19: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:20: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:38: }
	ret
;main.c:96: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:98: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:100: show_selection_menu();
;main.c:283: }
	jp	_show_selection_menu
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
__xinit__poodle_selection:
	.db #0x0a	; 10
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__poodle_main:
	.db #0x1e	; 30
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__selected_pet:
	.db #0x00	; 0
	.area _CABS (ABS)
