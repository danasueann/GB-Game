;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module jester
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _jester_tilemap
	.globl _jester
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
	.area _CODE
_jester:
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0x5e	; 94
	.db #0x63	; 99	'c'
	.db #0x9c	; 156
	.db #0xe3	; 227
	.db #0xff	; 255
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
	.db #0x82	; 130
	.db #0x7d	; 125
	.db #0xc7	; 199
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xe4	; 228
	.db #0x9c	; 156
	.db #0xb9	; 185
	.db #0xc7	; 199
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xc2	; 194
	.db #0xab	; 171
	.db #0xd6	; 214
	.db #0xbf	; 191
	.db #0xc2	; 194
	.db #0x9b	; 155
	.db #0xe6	; 230
	.db #0x43	; 67	'C'
	.db #0x7e	; 126
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xf2	; 242
	.db #0x8e	; 142
	.db #0xf2	; 242
	.db #0x8e	; 142
	.db #0xea	; 234
	.db #0x16	; 22
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x72	; 114	'r'
	.db #0x8e	; 142
	.db #0x25	; 37
	.db #0xdf	; 223
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x49	; 73	'I'
	.db #0x77	; 119	'w'
	.db #0x3d	; 61
	.db #0x33	; 51	'3'
	.db #0x1b	; 27
	.db #0x15	; 21
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x5f	; 95
	.db #0xa0	; 160
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0x72	; 114	'r'
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x7d	; 125
	.db #0x93	; 147
	.db #0x79	; 121	'y'
	.db #0x97	; 151
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x30	; 48	'0'
	.db #0x9f	; 159
	.db #0x70	; 112	'p'
	.db #0x17	; 23
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xfb	; 251
	.db #0x7e	; 126
	.db #0xc1	; 193
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0x7f	; 127
	.db #0xa1	; 161
	.db #0x7f	; 127
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0x1c	; 28
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
_jester_tilemap:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.area _INITIALIZER
	.area _CABS (ABS)
