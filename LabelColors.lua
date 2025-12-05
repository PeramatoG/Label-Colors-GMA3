-- grandMA3 Label colors by Peramato
-- Reads Preset Pool 4 via GetPresetData, finds nearest color name, and runs: Label Preset 4.X "<Name>"

------------------------------------------------------------
-- LEE & ROSCO color tables
------------------------------------------------------------

local LEE_COLORS = {
    {n="L002 Rose Pink", r=217,g=0,b=145},
    {n="L003 Lavender Tint", r=219,g=177,b=255},
    {n="L004 Medium Bastard Amber", r=255,g=125,b=63},
    {n="L007 Pale Yellow", r=255,g=255,b=157},
    {n="L008 Dark Salmon", r=255,g=39,b=28},
    {n="L009 Pale Amber Gold", r=255,g=160,b=64},
    {n="L010 Medium Yellow", r=255,g=220,b=0},
    {n="L013 Straw Tint", r=255,g=181,b=98},
    {n="L015 Deep Straw", r=253,g=130,b=0},
    {n="L019 Fire", r=252,g=1,b=7},
    {n="L020 Medium Amber", r=255,g=155,b=106},
    {n="L021 Gold Amber", r=253,g=92,b=15},
    {n="L022 Dark Amber", r=223,g=32,b=32},
    {n="L024 Scarlet", r=223,g=0,b=0},
    {n="L026 Bright Red", r=202,g=0,b=0},
    {n="L027 Medium Red", r=66,g=0,b=8},
    {n="L035 Light Pink", r=255,g=92,b=130},
    {n="L036 Mesium Pink", r=255,g=98,b=133},
    {n="L046 Dark Magenta", r=96,g=0,b=0},
    {n="L048 Rose Purple", r=96,g=0,b=92},
    {n="L052 Light Lavender", r=99,g=0,b=173},
    {n="L053 Paler Lavender", r=162,g=192,b=255},
    {n="L058 Lavender", r=64,g=0,b=128},
    {n="L061 Mist Blue", r=89,g=219,b=251},
    {n="L063 Pale Blue", r=0,g=160,b=223},
    {n="L068 Sky Blue", r=0,g=0,b=147},
    {n="L079 Just Blue", r=11,g=11,b=153},
    {n="L085 Deeper Blue", r=0,g=0,b=66},
    {n="L089 Moss Green", r=0,g=159,b=0},
    {n="L090 Dark Yellow Green", r=4,g=61,b=0},
    {n="L101 Yellow", r=255,g=191,b=0},
    {n="L102 Light Amber", r=251,g=210,b=17},
    {n="L103 Straw", r=255,g=222,b=181},
    {n="L104 Deep Amber", r=249,g=163,b=34},
    {n="L105 Orange", r=253,g=121,b=2},
    {n="L106 Primary Red", r=128,g=0,b=0},
    {n="L107 Light Rose", r=255,g=79,b=109},
    {n="L109 Light Salman", r=241,g=103,b=103},
    {n="L110 Middle Rose", r=255,g=104,b=168},
    {n="L111 Dark Pink", r=236,g=55,b=150},
    {n="L113 Magenta", r=176,g=0,b=0},
    {n="L115 Peacock Blue", r=21,g=155,b=141},
    {n="L116 Medium Blue-Green", r=0,g=79,b=32},
    {n="L117 Steel Blue", r=0,g=223,b=255},
    {n="L118 Light Blue", r=17,g=118,b=255},
    {n="L119 Dark Blue", r=0,g=16,b=128},
    {n="L120 Deep Blue", r=35,g=29,b=118},
    {n="L121 Lee Green", r=0,g=191,b=0},
    {n="L122 Fern Green", r=0,g=232,b=0},
    {n="L124 Dark Green", r=0,g=164,b=0},
    {n="L126 Mauve", r=96,g=0,b=112},
    {n="L127 Smokey Pink", r=112,g=48,b=64},
    {n="L128 Bright Pink", r=204,g=19,b=116},
    {n="L129 Heavy Frost", r=255,g=255,b=255},
    {n="L130 Clear", r=255,g=255,b=255},
    {n="L132 Medium Blue", r=0,g=0,b=192},
    {n="L134 Golden Amber", r=254,g=116,b=69},
    {n="L135 Deep Golden Amber", r=159,g=34,b=34},
    {n="L136 Pale Lavender", r=175,g=128,b=223},
    {n="L137 Special Lavender", r=83,g=41,b=207},
    {n="L138 Pale Green", r=128,g=255,b=32},
    {n="L139 Primary Green", r=0,g=80,b=0},
    {n="L141 Bright Blue", r=0,g=48,b=208},
    {n="L142 Pale Violet", r=48,g=0,b=176},
    {n="L143 Pale Navy Blue", r=1,g=135,b=150},
    {n="L144 No Colour Blue", r=0,g=112,b=223},
    {n="L147 Apricot", r=255,g=118,b=72},
    {n="L148 Bright Rose", r=221,g=2,b=96},
    {n="L151 Gold Tint", r=255,g=185,b=168},
    {n="L152 Pale Gold", r=255,g=201,b=174},
    {n="L153 Pale Salmon", r=255,g=166,b=184},
    {n="L154 Pale Rose", r=255,g=204,b=191},
    {n="L156 Chocolate", r=120,g=92,b=92},
    {n="L157 Pink", r=224,g=0,b=80},
    {n="L158 Deep Orange", r=253,g=94,b=40},
    {n="L159 No Color Straw", r=255,g=255,b=202},
    {n="L161 Slate Blue", r=16,g=48,b=144},
    {n="L162 Bastard Amber", r=255,g=160,b=128},
    {n="L164 Flame Red", r=227,g=0,b=0},
    {n="L165 Daylight Blue", r=0,g=64,b=255},
    {n="L166 Pale Red", r=235,g=3,b=102},
    {n="L170 Deep Lavender", r=181,g=0,b=219},
    {n="L174 Dark Steel Blue", r=0,g=69,b=253},
    {n="L176 Loving Amber", r=239,g=112,b=96},
    {n="L179 Chrome Orange", r=255,g=125,b=47},
    {n="L180 Dark Lavender", r=111,g=0,b=223},
    {n="L181 Congo Blue", r=13,g=4,b=113},
    {n="L182 Light Red", r=144,g=0,b=0},
    {n="L183 Moonlight Blue", r=32,g=96,b=255},
    {n="L184 Cosmetic Peach", r=255,g=239,b=223},
    {n="L185 Cosmetic Burgundy", r=192,g=159,b=160},
    {n="L186 Cosmetic Silver Rose", r=255,g=160,b=207},
    {n="L187 Cosmetic Rouge", r=255,g=155,b=134},
    {n="L188 Cosmetic Highlight", r=255,g=210,b=200},
    {n="L189 Cosmetic Silver Moss", r=213,g=255,b=181},
    {n="L190 Cosmetic Emerald", r=255,g=244,b=215},
    {n="L191 Cosmetic Aqua Blue", r=96,g=255,b=223},
    {n="L192 Flesh Pink", r=223,g=32,b=96},
    {n="L193 Rosy Gold", r=255,g=81,b=103},
    {n="L194 Surprise Pink", r=96,g=64,b=191},
    {n="L195 Zenith Blue", r=0,g=16,b=96},
    {n="L196 True Blue", r=0,g=64,b=255},
    {n="L197 Alice Blue", r=32,g=64,b=191},
    {n="L200 Double C.T. Blue", r=36,g=1,b=201},
    {n="L201 Full C.T. Blue", r=0,g=128,b=255},
    {n="L202 1/2 C.T. Blue", r=0,g=128,b=191},
    {n="L203 1/4 C.T. Blue", r=215,g=243,b=255},
    {n="L204 Full C.T. Orange", r=254,g=153,b=86},
    {n="L205 1/2 C.T. Orange", r=255,g=171,b=87},
    {n="L206 1/4 C.T. Orange", r=255,g=194,b=134},
    {n="L207 C.T. Orange +.3 ND", r=144,g=112,b=96},
    {n="L208 C.T. Orange +.6 ND", r=112,g=80,b=80},
    {n="L209 .3 ND", r=192,g=192,b=192},
    {n="L210 .6 ND", r=112,g=112,b=112},
    {n="L211 .9 ND", r=32,g=32,b=32},
    {n="L212 L.C.T. Yellow", r=255,g=255,b=157},
    {n="L213 White Flame Green", r=192,g=255,b=128},
    {n="L218 1/8 C.T. Blue", r=223,g=223,b=223},
    {n="L219 Lee Fluorescent Green", r=0,g=136,b=113},
    {n="L223 1/8 C.T. Orange", r=255,g=216,b=176},
    {n="L226 Lee U.V.", r=255,g=255,b=255},
    {n="L230 Super Correction L.C.T. Yellow", r=166,g=131,b=83},
    {n="L232 Super White Flame", r=198,g=135,b=149},
    {n="L236 H.M.I. To Tungsten", r=255,g=96,b=0},
    {n="L237 C.I.D. To Tungsten", r=253,g=92,b=15},
    {n="L238 C.S.I. To Tungsten", r=201,g=67,b=56},
    {n="L241 Lee Fluorescent 5700K", r=13,g=152,b=155},
    {n="L242 Lee Fluorescent 4300K", r=50,g=181,b=135},
    {n="L243 Lee Fluorescent 3600K", r=0,g=206,b=114},
    {n="L244 Lee Plus Green", r=112,g=223,b=64},
    {n="L245 Half Plus Green", r=192,g=255,b=128},
    {n="L246 Quarter Plus Green", r=203,g=255,b=151},
    {n="L247 Lee Minus Green", r=255,g=0,b=128},
    {n="L248 Half Minus Green", r=255,g=0,b=255},
    {n="L249 Quarter Minus Green", r=255,g=128,b=192},
    {n="L278 Eighth Plus Green", r=220,g=255,b=151},
    {n="L279 Eighth Minus Green", r=255,g=128,b=255},
    {n="L281 3/4 C.T. Blue", r=0,g=24,b=136},
    {n="L285 3/4 C.T. Orange", r=215,g=32,b=0},
    {n="L298 .15 ND", r=224,g=224,b=224},
    {n="L299 1.2 ND", r=16,g=16,b=16},
    {n="L328 Follies Pink", r=204,g=0,b=43},
    {n="L332 Special Rose Pink", r=195,g=0,b=75},
    {n="L343 Special Medium Lavender", r=32,g=0,b=128},
    {n="L344 Violet", r=32,g=32,b=191},
    {n="L353 Lighter Blue", r=27,g=136,b=219},
    {n="L354 Special Steel Blue", r=0,g=223,b=223},
    {n="L363 Special Medium Blue", r=0,g=0,b=96},
    {n="L441 Full C.T. Straw", r=255,g=96,b=0},
    {n="L442 Half C.T. Straw", r=254,g=198,b=114},
    {n="L443 Quarter C.T. Straw", r=239,g=207,b=143},
    {n="L444 Eighth C.T. Straw", r=254,g=232,b=186},
}

local ROSCO_COLORS = {
    {n="R00 Clear", r=255,g=255,b=255},
    {n="R01 Light Bastard Amber", r=255,g=96,b=96},
    {n="R02 Bastard Amber", r=255,g=192,b=160},
    {n="R03 Dark Bastard Amber", r=255,g=159,b=120},
    {n="R04 Medium Bastard Amber", r=253,g=157,b=125},
    {n="R05 Rose Tint", r=254,g=190,b=209},
    {n="R06 No Color Straw", r=253,g=255,b=215},
    {n="R07 Pale Yellow", r=255,g=255,b=176},
    {n="R08 Pale Gold", r=239,g=207,b=143},
    {n="R09 Pale Amber Gold", r=253,g=183,b=79},
    {n="R10 Medium Yellow", r=255,g=255,b=32},
    {n="R11 Light Straw", r=253,g=204,b=36},
    {n="R12 Straw", r=239,g=255,b=0},
    {n="R13 Straw Tint", r=254,g=198,b=114},
    {n="R14 Medium Straw", r=254,g=171,b=48},
    {n="R15 Deep Straw", r=248,g=149,b=1},
    {n="R16 Light Amber", r=255,g=96,b=0},
    {n="R17 Light Flame", r=239,g=63,b=32},
    {n="R18 Flame", r=240,g=16,b=0},
    {n="R19 Fire", r=255,g=4,b=4},
    {n="R20 Medium Amber", r=253,g=140,b=66},
    {n="R21 Golden Amber", r=236,g=96,b=2},
    {n="R22 Deep Amber", r=253,g=64,b=49},
    {n="R23 Orange", r=253,g=108,b=66},
    {n="R24 Scarlet", r=191,g=0,b=0},
    {n="R25 Orange Red", r=255,g=0,b=0},
    {n="R26 Light Red", r=159,g=0,b=0},
    {n="R27 Medium Red", r=96,g=0,b=0},
    {n="R30 Light Salmon Pink", r=254,g=101,b=88},
    {n="R31 Salmon Pink", r=254,g=99,b=134},
    {n="R32 Medium Salmon Pink", r=252,g=1,b=57},
    {n="R33 No Color Pink", r=255,g=128,b=160},
    {n="R34 Flesh Pink", r=255,g=32,b=64},
    {n="R35 Light Pink", r=255,g=164,b=175},
    {n="R36 Medium Pink", r=232,g=91,b=137},
    {n="R37 Pale Rose Pink", r=255,g=128,b=175},
    {n="R38 Light Rose", r=255,g=96,b=175},
    {n="R40 Light Salmon", r=255,g=0,b=0},
    {n="R41 Salmon", r=239,g=0,b=16},
    {n="R42 Deep Salmon", r=144,g=0,b=0},
    {n="R43 Deep Pink", r=255,g=0,b=112},
    {n="R44 Middle Rose", r=223,g=0,b=112},
    {n="R45 Rose", r=144,g=0,b=32},
    {n="R46 Magenta", r=96,g=0,b=0},
    {n="R47 Light Rose Purple", r=64,g=0,b=64},
    {n="R48 Rose Purple", r=183,g=2,b=183},
    {n="R49 Medium Purple", r=112,g=0,b=80},
    {n="R50 Mauve", r=112,g=0,b=0},
    {n="R51 Surprise Pink", r=255,g=128,b=255},
    {n="R52 Light Lavender", r=175,g=16,b=239},
    {n="R53 Pale Lavender", r=191,g=192,b=255},
    {n="R54 Special Lavender", r=192,g=160,b=255},
    {n="R55 Lilac", r=109,g=79,b=255},
    {n="R56 Gypsy Lavender", r=64,g=0,b=128},
    {n="R57 Lavender", r=64,g=0,b=128},
    {n="R58 Deep Lavender", r=64,g=0,b=128},
    {n="R59 Indigo", r=48,g=0,b=80},
    {n="R60 No Color Blue", r=128,g=192,b=255},
    {n="R61 Mist Blue", r=80,g=192,b=208},
    {n="R62 Booster Blue", r=80,g=144,b=191},
    {n="R63 Pale Blue", r=16,g=144,b=191},
    {n="R64 Light Steel Blue", r=0,g=80,b=240},
    {n="R65 Daylight Blue", r=0,g=64,b=255},
    {n="R66 Cool Blue", r=0,g=192,b=192},
    {n="R67 Light Sky Blue", r=0,g=96,b=255},
    {n="R68 Sky Blue", r=0,g=0,b=208},
    {n="R69 Brilliant Blue", r=0,g=64,b=223},
    {n="R70 Nile Blue", r=16,g=160,b=176},
    {n="R71 Sea Blue", r=0,g=128,b=144},
    {n="R72 Azure Blue", r=0,g=160,b=207},
    {n="R73 Peacock Blue", r=16,g=144,b=144},
    {n="R74 Night Blue", r=0,g=0,b=176},
    {n="R76 Light Green Blue", r=0,g=128,b=144},
    {n="R77 Green Blue", r=0,g=128,b=223},
    {n="R78 Trudy Blue", r=32,g=16,b=176},
    {n="R79 Bright Blue", r=0,g=0,b=208},
    {n="R80 Primary Blue", r=0,g=0,b=128},
    {n="R81 Urban Blue", r=36,g=1,b=201},
    {n="R82 Surprise Blue", r=16,g=0,b=112},
    {n="R83 Medium Blue", r=0,g=0,b=96},
    {n="R84 Zephyr Blue", r=30,g=1,b=163},
    {n="R85 Deep Blue", r=0,g=0,b=96},
    {n="R86 Pea Green", r=0,g=143,b=0},
    {n="R87 Pale Yellow Green", r=192,g=255,b=128},
    {n="R88 Light Green", r=128,g=255,b=80},
    {n="R89 Moss Green", r=0,g=122,b=0},
    {n="R90 Dark Yellow Green", r=16,g=95,b=0},
    {n="R91 Primary Green", r=0,g=64,b=0},
    {n="R92 Turquoise", r=0,g=191,b=127},
    {n="R93 Blue Green", r=0,g=176,b=96},
    {n="R94 Kelly Green", r=46,g=135,b=104},
    {n="R95 Medium Blue Green", r=0,g=96,b=80},
    {n="R96 Lime", r=191,g=255,b=0},
    {n="R97 Light Grey", r=192,g=192,b=192},
    {n="R98 Medium Grey", r=112,g=112,b=112},
    {n="R99 Chocolate", r=144,g=112,b=96},
    {n="R120 Red Diffusion", r=142,g=0,b=0},
    {n="R121 Blue Diffusion", r=0,g=0,b=205},
    {n="R122 Green Diffusion", r=0,g=72,b=0},
    {n="R123 Amber Diffusion", r=255,g=45,b=45},
    {n="R124 Red Cyc Silk", r=151,g=0,b=0},
    {n="R125 Blue Cyc Silk", r=0,g=0,b=198},
    {n="R126 Green Cyc Silk", r=0,g=62,b=0},
    {n="R127 Amber Cyc Silk", r=255,g=26,b=26},
    {n="R128 Magenta Silk", r=81,g=0,b=61},
    {n="R129 Sky Blue Silk", r=0,g=0,b=251},
    {n="R130 Medium Blue Green Silk", r=0,g=89,b=74},
    {n="R131 Medium Amber Silk", r=253,g=126,b=0},
    {n="R150 Hamburg Rose", r=254,g=203,b=218},
    {n="R151 Hamburg Lavender", r=197,g=56,b=250},
    {n="R152 Hamburg Steel Blue", r=0,g=0,b=191},
    {n="R304 Pale Apricot", r=255,g=160,b=128},
    {n="R305 Rose Gold", r=255,g=128,b=96},
    {n="R312 Canary", r=252,g=223,b=90},
    {n="R317 Apricot", r=239,g=16,b=0},
    {n="R321 Soft Golden Amber", r=223,g=32,b=0},
    {n="R337 True Pink", r=255,g=138,b=197},
    {n="R339 Broadway Pink", r=255,g=0,b=144},
    {n="R342 Rose Pink", r=207,g=0,b=80},
    {n="R344 Follies Pink", r=224,g=0,b=128},
    {n="R355 Pale Violet", r=64,g=32,b=160},
    {n="R356 Middle Lavender", r=174,g=53,b=255},
    {n="R357 Royal Lavender", r=48,g=0,b=112},
    {n="R358 Rose Indigo", r=32,g=0,b=80},
    {n="R359 Medium Violet", r=16,g=0,b=96},
    {n="R378 Alice Blue", r=80,g=0,b=208},
    {n="R383 Sapphire Blue", r=26,g=0,b=130},
    {n="R385 Royal Blue", r=0,g=0,b=79},
    {n="R388 Gaslight Green", r=0,g=224,b=0},
    {n="R389 Chroma Green", r=0,g=127,b=0},
    {n="R397 Pale Grey", r=224,g=224,b=224},
    {n="R3102 Tough MT2", r=255,g=96,b=0},
    {n="R3106 Tough MTY", r=239,g=63,b=32},
    {n="R3107 Tough Y-1", r=253,g=255,b=215},
    {n="R3114 Tough UV Filter", r=255,g=255,b=255},
    {n="R3134 Tough MT", r=239,g=207,b=143},
    {n="R3202 Full Blue (CTB)", r=96,g=0,b=223},
    {n="R3203 Three-Quarter Blue (3/4 CTB)", r=0,g=24,b=136},
    {n="R3204 Half Blue (1/2 CTB)", r=128,g=96,b=255},
    {n="R3206 Third Blue (1/3 CTB)", r=176,g=176,b=240},
    {n="R3208 Quarter Blue (1/4 CTB)", r=191,g=223,b=255},
    {n="R3216 Eighth Blue (1/8 CTB)", r=223,g=223,b=223},
    {n="R3220 Double Blue (2x CTB)", r=36,g=1,b=201},
    {n="R3304 Tough Plusgreen / WindowGreen", r=112,g=223,b=64},
    {n="R3308 Tough Minusgreen", r=255,g=0,b=128},
    {n="R3310 Fluorofilter", r=255,g=39,b=28},
    {n="R3313 Tough 1/2 Minusgreen", r=255,g=0,b=255},
    {n="R3314 Tough 1/4 Minusgreen", r=255,g=128,b=192},
    {n="R3315 Tough 1/2 Plusgreen", r=192,g=255,b=128},
    {n="R3316 Tough 1/4 Plusgreen", r=203,g=255,b=151},
    {n="R3317 Tough 1/8 Plusgreen", r=220,g=255,b=185},
    {n="R3318 Tough 1/8 Minusgreen", r=255,g=128,b=255},
    {n="R3401 RoscoSun", r=239,g=80,b=0},
    {n="R3402 Rosco N.3", r=192,g=192,b=192},
    {n="R3403 Rosco N.6", r=112,g=112,b=112},
    {n="R3404 Rosco N.9", r=32,g=32,b=32},
    {n="R3405 RoscoSun 85N.3", r=144,g=112,b=96},
    {n="R3406 RoscoSun 85N.6", r=112,g=80,b=80},
    {n="R3407 RoscoSun (CTO)", r=191,g=64,b=0},
    {n="R3408 RoscoSun (1/2 CTO)", r=255,g=128,b=0},
    {n="R3409 RoscoSun (1/4 CTO)", r=255,g=191,b=143},
    {n="R3410 RoscoSun (1/8 CTO)", r=255,g=224,b=192},
    {n="R3411 RoscoSun (3/4 CTO)", r=215,g=32,b=0},
    {n="R3415 Rosco N.15", r=224,g=224,b=224},
    {n="R3441 Full Straw (CTS)", r=255,g=96,b=0},
    {n="R3442 Half Straw (1/2 CTS)", r=254,g=198,b=114},
    {n="R3443 Quarter Straw (1/4 CTS)", r=239,g=207,b=143},
    {n="R3444 Eighth Straw (1/8 CTS)", r=254,g=232,b=186},
    {n="R3761 Roscolex", r=255,g=96,b=32},
}

------------------------------------------------------------
-- Named color tables (HTML + Basic, from original script)
------------------------------------------------------------

local HTML_COLORS = {
 {n="AliceBlue",r=240,g=248,b=255},{n="AntiqueWhite",r=250,g=235,b=215},
 {n="Aquamarine",r=127,g=255,b=212},{n="Azure",r=240,g=255,b=255},{n="Beige",r=245,g=245,b=220},
 {n="Bisque",r=255,g=228,b=196},{n="Black",r=0,g=0,b=0},{n="BlanchedAlmond",r=255,g=235,b=205},
 {n="Blue",r=0,g=0,b=255},{n="BlueViolet",r=138,g=43,b=226},{n="Brown",r=165,g=42,b=42},
 {n="BurlyWood",r=222,g=184,b=135},{n="CadetBlue",r=95,g=158,b=160},{n="Chartreuse",r=127,g=255,b=0},
 {n="Chocolate",r=210,g=105,b=30},{n="Coral",r=255,g=127,b=80},{n="CornflowerBlue",r=100,g=149,b=237},
 {n="Cornsilk",r=255,g=248,b=220},{n="Crimson",r=220,g=20,b=60},{n="Cyan",r=0,g=255,b=255},
 {n="DarkBlue",r=0,g=0,b=139},{n="DarkCyan",r=0,g=139,b=139},{n="DarkGoldenRod",r=184,g=134,b=11},
 {n="DarkGrey",r=169,g=169,b=169},{n="DarkGreen",r=0,g=100,b=0},
 {n="DarkKhaki",r=189,g=183,b=107},{n="DarkMagenta",r=139,g=0,b=139},{n="DarkOliveGreen",r=85,g=107,b=47},
 {n="DarkOrange",r=255,g=140,b=0},{n="DarkOrchid",r=153,g=50,b=204},{n="DarkRed",r=139,g=0,b=0},
 {n="DarkSalmon",r=233,g=150,b=122},{n="DarkSeaGreen",r=143,g=188,b=143},{n="DarkSlateBlue",r=72,g=61,b=139},
 {n="DarkSlateGrey",r=47,g=79,b=79},{n="DarkTurquoise",r=0,g=206,b=209},
 {n="DarkViolet",r=148,g=0,b=211},{n="DeepPink",r=255,g=20,b=147},{n="DeepSkyBlue",r=0,g=191,b=255},
 {n="DimGrey",r=105,g=105,b=105},{n="DodgerBlue",r=30,g=144,b=255},
 {n="FireBrick",r=178,g=34,b=34},{n="FloralWhite",r=255,g=250,b=240},{n="ForestGreen",r=34,g=139,b=34},
 {n="Magenta",r=255,g=0,b=255},{n="Gainsboro",r=220,g=220,b=220},{n="GhostWhite",r=248,g=248,b=255},
 {n="Gold",r=255,g=215,b=0},{n="GoldenRod",r=218,g=165,b=32},
 {n="Grey",r=128,g=128,b=128},{n="Green",r=0,g=128,b=0},{n="GreenYellow",r=173,g=255,b=47},
 {n="HoneyDew",r=240,g=255,b=240},{n="HotPink",r=255,g=105,b=180},{n="IndianRed",r=205,g=92,b=92},
 {n="Indigo",r=75,g=0,b=130},{n="Ivory",r=255,g=255,b=240},{n="Khaki",r=240,g=230,b=140},
 {n="Lavender",r=230,g=230,b=250},{n="LavenderBlush",r=255,g=240,b=245},{n="LawnGreen",r=124,g=252,b=0},
 {n="LemonChiffon",r=255,g=250,b=205},{n="LightBlue",r=173,g=216,b=230},{n="LightCoral",r=240,g=128,b=128},
 {n="LightCyan",r=224,g=255,b=255},{n="LightGoldenRodYellow",r=250,g=250,b=210},
 {n="LightGrey",r=211,g=211,b=211},{n="LightGreen",r=144,g=238,b=144},{n="LightPink",r=255,g=182,b=193},
 {n="LightSalmon",r=255,g=160,b=122},{n="LightSeaGreen",r=32,g=178,b=170},{n="LightSkyBlue",r=135,g=206,b=250},
 {n="LightSlateGrey",r=119,g=136,b=153},{n="LightSteelBlue",r=176,g=196,b=222},
 {n="LightYellow",r=255,g=255,b=224},{n="Lime",r=0,g=255,b=0},{n="LimeGreen",r=50,g=205,b=50},
 {n="Linen",r=250,g=240,b=230},{n="Maroon",r=128,g=0,b=0},
 {n="MediumAquaMarine",r=102,g=205,b=170},{n="MediumBlue",r=0,g=0,b=205},{n="MediumOrchid",r=186,g=85,b=211},
 {n="MediumPurple",r=147,g=112,b=219},{n="MediumSeaGreen",r=60,g=179,b=113},{n="MediumSlateBlue",r=123,g=104,b=238},
 {n="MediumSpringGreen",r=0,g=250,b=154},{n="MediumTurquoise",r=72,g=209,b=204},{n="MediumVioletRed",r=199,g=21,b=133},
 {n="MidnightBlue",r=25,g=25,b=112},{n="MintCream",r=245,g=255,b=250},{n="MistyRose",r=255,g=228,b=225},
 {n="Moccasin",r=255,g=228,b=181},{n="NavajoWhite",r=255,g=222,b=173},{n="Navy",r=0,g=0,b=128},
 {n="OldLace",r=253,g=245,b=230},{n="Olive",r=128,g=128,b=0},{n="OliveDrab",r=107,g=142,b=35},
 {n="Orange",r=255,g=165,b=0},{n="OrangeRed",r=255,g=69,b=0},{n="Orchid",r=218,g=112,b=214},
 {n="PaleGoldenRod",r=238,g=232,b=170},{n="PaleGreen",r=152,g=251,b=152},{n="PaleTurquoise",r=175,g=238,b=238},
 {n="PaleVioletRed",r=219,g=112,b=147},{n="PapayaWhip",r=255,g=239,b=213},{n="PeachPuff",r=255,g=218,b=185},
 {n="Peru",r=205,g=133,b=63},{n="Pink",r=255,g=192,b=203},{n="Plum",r=221,g=160,b=221},
 {n="PowderBlue",r=176,g=224,b=230},{n="Purple",r=128,g=0,b=128},{n="RebeccaPurple",r=102,g=51,b=153},
 {n="Red",r=255,g=0,b=0},{n="RosyBrown",r=188,g=143,b=143},{n="RoyalBlue",r=65,g=105,b=225},
 {n="SaddleBrown",r=139,g=69,b=19},{n="Salmon",r=250,g=128,b=114},{n="SandyBrown",r=244,g=164,b=96},
 {n="SeaGreen",r=46,g=139,b=87},{n="SeaShell",r=255,g=245,b=238},{n="Sienna",r=160,g=82,b=45},
 {n="Silver",r=192,g=192,b=192},{n="SkyBlue",r=135,g=206,b=235},{n="SlateBlue",r=106,g=90,b=205},
 {n="SlateGrey",r=112,g=128,b=144},{n="Snow",r=255,g=250,b=250},
 {n="SpringGreen",r=0,g=255,b=127},{n="SteelBlue",r=70,g=130,b=180},{n="Tan",r=210,g=180,b=140},
 {n="Teal",r=0,g=128,b=128},{n="Thistle",r=216,g=191,b=216},{n="Tomato",r=255,g=99,b=71},
 {n="Turquoise",r=64,g=224,b=208},{n="Violet",r=238,g=130,b=238},{n="Wheat",r=245,g=222,b=179},
 {n="White",r=255,g=255,b=255},{n="WhiteSmoke",r=245,g=245,b=245},{n="Yellow",r=255,g=255,b=0},
 {n="YellowGreen",r=154,g=205,b=50}
}

local BASIC_COLORS = {
 {n="White",r=255,g=255,b=255},
 {n="Red",r=255,g=0,b=0},{n="Orange",r=255,g=127,b=0},{n="Yellow",r=255,g=255,b=0},
 {n="Fern Green",r=127,g=255,b=0},{n="Green",r=0,g=255,b=0},{n="Sea Green",r=0,g=255,b=127},
 {n="Cyan",r=0,g=255,b=255},{n="Lavender",r=0,g=127,b=255},{n="Blue",r=0,g=0,b=255},
 {n="Violet",r=127,g=0,b=255},{n="Magenta",r=255,g=0,b=255},{n="Pink",r=255,g=0,b=127},
 {n="Light Red",r=255,g=127,b=127},{n="Light Orange",r=255,g=191,b=127},{n="Light Yellow",r=255,g=255,b=127},
 {n="Light Fern Green",r=191,g=255,b=127},{n="Light Green",r=127,g=255,b=127},{n="Light Sea Green",r=127,g=255,b=191},
 {n="Light Cyan",r=127,g=255,b=255},{n="Light Lavender",r=127,g=191,b=255},{n="Light Blue",r=127,g=127,b=255},
 {n="Light Violet",r=191,g=127,b=255},{n="Light Magenta",r=255,g=127,b=255},{n="Light Pink",r=255,g=127,b=191}
}

------------------------------------------------------------
-- Utilities
------------------------------------------------------------

local function norm255_from100(x)
    return math.floor((x or 0) * 2.55 + 0.5)
end

local function srgb_to_linear(c)
    if c <= 0.04045 then
        return c / 12.92
    else
        return ((c + 0.055) / 1.055) ^ 2.4
    end
end

local function nearest_name_from_table(tbl, r255, g255, b255)
    if type(tbl) ~= "table" or #tbl == 0 then
        return "Unnamed"
    end

    -- Clamp input just in case
    local rl = srgb_to_linear(math.max(0, math.min(255, r255)) / 255)
    local gl = srgb_to_linear(math.max(0, math.min(255, g255)) / 255)
    local bl = srgb_to_linear(math.max(0, math.min(255, b255)) / 255)

    local best_name = tbl[1].n or "Unnamed"
    local best_d = nil

    for i = 1, #tbl do
        local c = tbl[i]
        local cr = srgb_to_linear((c.r or 0) / 255)
        local cg = srgb_to_linear((c.g or 0) / 255)
        local cb = srgb_to_linear((c.b or 0) / 255)

        local dr = rl - cr
        local dg = gl - cg
        local db = bl - cb
        local d  = dr * dr + dg * dg + db * db  -- symmetric distance

        if not best_d or d < best_d then
            best_d = d
            best_name = c.n
        end
    end

    return best_name
end

-- Find absolute values for ColorRGB_R/G/B (0..100) inside the nested preset table
local function extract_rgb_table(t, path, rgb)
    if type(t) ~= "table" then return end
    path = path or ""
    rgb = rgb or {r=nil,g=nil,b=nil}
    for k,v in pairs(t) do
        local kp = (path=="" and tostring(k)) or (path.."/"..tostring(k))
        if type(v)=="table" then
            extract_rgb_table(v, kp, rgb)
        elseif k=="absolute" and type(v)=="number" then
            local lkp = kp:lower()
            if lkp:find("/colorrgb_r/") then rgb.r = v end
            if lkp:find("/colorrgb_g/") then rgb.g = v end
            if lkp:find("/colorrgb_b/") then rgb.b = v end
        end
    end
    return rgb
end

------------------------------------------------------------
-- Table selector
--   1 = LEE filters
--   2 = ROSCO filters
--   3 = HTML colors
--   4 = Basic colors
------------------------------------------------------------

local function name_for_rgb(table_choice, r255, g255, b255)
    local tbl
    if table_choice == 1 then
        tbl = LEE_COLORS
    elseif table_choice == 2 then
        tbl = ROSCO_COLORS
    elseif table_choice == 3 then
        tbl = HTML_COLORS
    else
        tbl = BASIC_COLORS
    end

    -- Fallback in case selected table is empty
    if not tbl or #tbl == 0 then
        tbl = HTML_COLORS
    end

    return nearest_name_from_table(tbl, r255, g255, b255)
end

------------------------------------------------------------
-- Per-preset processing
------------------------------------------------------------

local function process_preset(idx, table_choice)
    local h = DataPool().PresetPools[4][idx]
    if not h then
        Printf("Preset 4."..tostring(idx)..": empty.")
        return
    end

    local ok, content = pcall(function() return GetPresetData(h) end)
    if not ok or type(content) ~= "table" then
        Printf("Preset 4."..tostring(idx)..": GetPresetData failed.")
        return
    end

    local rgb = extract_rgb_table(content)
    if rgb and rgb.r and rgb.g and rgb.b then
        local r = norm255_from100(rgb.r)
        local g = norm255_from100(rgb.g)
        local b = norm255_from100(rgb.b)

        local name = name_for_rgb(table_choice, r, g, b)

        Printf("Preset 4."..tostring(idx).." => RGB("..r..","..g..","..b..") ≈ "..name)
        Cmd('Label Preset 4.'..tostring(idx)..' "'..name..'"')
    else
        Printf("Preset 4."..tostring(idx)..": RGB not found.")
    end
end

------------------------------------------------------------
-- UI + main
------------------------------------------------------------

local function main()
    local inputs = {
        {name = "First Preset", value = "1",  whiteFilter = "0123456789"},
        {name = "Last Preset",  value = "50", whiteFilter = "0123456789"}
    }

    local selectors = {
        {
            name = "Color table",
            selectedValue = 1, -- default: LEE
            values = {
                ["LEE filters"]   = 1,
                ["Rosco filters"] = 2,
                ["HTML colors"]   = 3,
                ["Basic colors"]  = 4
            },
            type = 1
        }
    }

    local resultTable = MessageBox({
        title = "Label colors",
        message = "Select first and last color preset to rename. Don´t use preset prefix (4.).",
        message_align_h = Enums.AlignmentH.Left,
        message_align_v = Enums.AlignmentV.Top,
        commands = {{value = 1, name = "Ok"}, {value = 0, name = "Cancel"}},
        inputs = inputs,
        selectors = selectors,
        backColor = "Global.Default",
        icon = "logo_small",
			messageTextColor = "Global.Text",
        autoCloseOnInput = true
    })

    if not resultTable or resultTable.result ~= 1 then
        Printf("Canceled.")
        return
    end

    local first = tonumber(resultTable.inputs["First Preset"]) or 1
    local last  = tonumber(resultTable.inputs["Last Preset"]) or first
    if last < first then
        Printf("Invalid range.")
        return
    end

    local table_choice = 1
    if resultTable.selectors and resultTable.selectors["Color table"] then
        table_choice = tonumber(resultTable.selectors["Color table"]) or 1
    end

    for i = first, last do
        process_preset(i, table_choice)
    end
end

return main
