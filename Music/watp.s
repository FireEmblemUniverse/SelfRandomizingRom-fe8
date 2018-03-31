	.include "MPlayDef.s"

	.equ	watp_grp, voicegroup000
	.equ	watp_pri, 0
	.equ	watp_rev, 0
	.equ	watp_mvl, 127
	.equ	watp_key, 0
	.equ	watp_tbs, 1
	.equ	watp_exg, 0
	.equ	watp_cmp, 1

	.section .rodata
	.global	watp
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

watp_1:
	.byte	KEYSH , watp_key+0
watp_1_B1:
@ 000   ----------------------------------------
	.byte	TEMPO , 132*watp_tbs/2
	.byte		VOICE , 94
	.byte		VOL   , 48*watp_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N10   , Gn2 , v108
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		N10   , Gn2 , v004
	.byte		N09   , Cn3 , v012
	.byte	W24
	.byte		N10   , Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v020
	.byte		N10   , Cn3 , v024
	.byte	W48
@ 001   ----------------------------------------
	.byte		        Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v020
	.byte		N10   , Cn3 , v024
	.byte	W24
	.byte		        Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v020
	.byte		N10   , Cn3 , v028
	.byte	W48
@ 002   ----------------------------------------
	.byte		N09   , An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		        An2 , v012
	.byte		N09   , Cn3 , v028
	.byte	W24
	.byte		        An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		        An2 , v012
	.byte		N09   , Cn3 , v028
	.byte	W48
@ 003   ----------------------------------------
	.byte		N10   , An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		N10   , An2 , v012
	.byte		N09   , Cn3 , v028
	.byte	W24
	.byte		N10   , An2 , v116
	.byte		N11   , Cn3 , v112
	.byte	W12
	.byte		N10   , An2 , v012
	.byte		N11   , Cn3 , v028
	.byte	W48
@ 004   ----------------------------------------
	.byte		N10   , Fn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Fn2 , v028
	.byte		N10   , Cn3 
	.byte	W24
	.byte		N08   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Fn2 , v028
	.byte		N08   , Cn3 
	.byte	W48
@ 005   ----------------------------------------
	.byte		N09   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		N09   , Fn2 , v024
	.byte		N08   , Cn3 , v028
	.byte	W24
	.byte		N09   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		N09   , Fn2 , v028
	.byte		N08   , Cn3 
	.byte	W36
	.byte		N05   , Cn3 , v112
	.byte	W12
@ 006   ----------------------------------------
	.byte		N08   , Gn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v020
	.byte		N08   , Cn3 , v028
	.byte	W24
	.byte		        Gn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v016
	.byte		N08   , Cn3 , v020
	.byte	W48
@ 007   ----------------------------------------
	.byte		N07   , Gn2 , v112
	.byte		N07   , Cn3 
	.byte	W12
	.byte		        Gn2 , v008
	.byte		N07   , Cn3 , v020
	.byte	W24
	.byte		N08   , Gn2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		N08   , Gn2 , v020
	.byte		N09   , Cn3 , v028
	.byte	W36
	.byte		N02   , Cn3 , v112
	.byte	W06
	.byte		N05   
	.byte	W06
@ 008   ----------------------------------------
	.byte		        Gn2 , v108
	.byte		N05   , Cn3 , v112
	.byte	W06
	.byte		        Cn3 , v028
	.byte	W06
	.byte		N10   , Gn2 , v024
	.byte		N09   , Cn3 , v032
	.byte	W24
	.byte		        Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		N09   , Gn2 , v040
	.byte		N10   , Cn3 , v044
	.byte	W48
@ 009   ----------------------------------------
	.byte		        Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v036
	.byte		N10   , Cn3 , v040
	.byte	W24
	.byte		        Gn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v036
	.byte		N10   , Cn3 , v044
	.byte	W48
@ 010   ----------------------------------------
	.byte		N09   , An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		        An2 , v032
	.byte		N09   , Cn3 , v044
	.byte	W24
	.byte		        An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		        An2 , v032
	.byte		N09   , Cn3 , v044
	.byte	W48
@ 011   ----------------------------------------
	.byte		N10   , An2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		N10   , An2 , v032
	.byte		N09   , Cn3 , v044
	.byte	W24
	.byte		N10   , An2 , v116
	.byte		N11   , Cn3 , v112
	.byte	W12
	.byte		N10   , An2 , v032
	.byte		N11   , Cn3 , v044
	.byte	W48
@ 012   ----------------------------------------
	.byte		N10   , Fn2 , v116
	.byte		N10   , Cn3 , v112
	.byte	W12
	.byte		        Fn2 , v044
	.byte		N10   , Cn3 
	.byte	W24
	.byte		N08   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Fn2 , v044
	.byte		N08   , Cn3 
	.byte	W48
@ 013   ----------------------------------------
	.byte		N09   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		N09   , Fn2 , v040
	.byte		N08   , Cn3 , v044
	.byte	W24
	.byte		N09   , Fn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		N09   , Fn2 , v044
	.byte		N08   , Cn3 
	.byte	W36
	.byte		N05   , Cn3 , v112
	.byte	W12
@ 014   ----------------------------------------
	.byte		N08   , Gn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v036
	.byte		N08   , Cn3 , v044
	.byte	W24
	.byte		        Gn2 , v116
	.byte		N08   , Cn3 , v112
	.byte	W12
	.byte		        Gn2 , v036
	.byte		N08   , Cn3 
	.byte	W48
@ 015   ----------------------------------------
	.byte		N07   , Gn2 , v112
	.byte		N07   , Cn3 
	.byte	W12
	.byte		        Gn2 , v028
	.byte		N07   , Cn3 , v040
	.byte	W24
	.byte		N08   , Gn2 , v116
	.byte		N09   , Cn3 , v112
	.byte	W12
	.byte		N08   , Gn2 , v036
	.byte		N09   , Cn3 , v044
	.byte	W48
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte		PAN   , c_v+8
	.byte		N07   , Gn2 , v112
	.byte		N06   , Ds3 , v104
	.byte	W12
	.byte		N04   , Gn2 , v032
	.byte		N03   , Ds3 , v024
	.byte	W24
	.byte		N07   , Gn2 , v112
	.byte		N06   , Ds3 , v116
	.byte	W12
	.byte		N05   , Gn2 , v032
	.byte		N03   , Ds3 , v036
	.byte	W48
@ 024   ----------------------------------------
	.byte		N06   , Fn2 , v116
	.byte		N07   , Cn3 , v112
	.byte	W12
	.byte		N06   , Fn2 , v040
	.byte		N07   , Cn3 , v032
	.byte	W24
	.byte		N06   , Fn2 , v116
	.byte		N07   , Cn3 , v112
	.byte	W12
	.byte		N03   , Fn2 , v044
	.byte		N05   , Cn3 , v032
	.byte	W48
@ 025   ----------------------------------------
	.byte	W24
	.byte		N15   , Cs2 , v112
	.byte		N14   , Cn3 , v116
	.byte	W18
	.byte		N05   , Cn3 , v032
	.byte	W06
	.byte		N15   , Cs2 , v112
	.byte		N15   , As2 , v116
	.byte	W18
	.byte		N05   , As2 , v044
	.byte	W06
	.byte		N13   , Cs2 , v116
	.byte		N11   , Gs2 , v108
	.byte	W18
	.byte		N05   , Gs2 , v024
	.byte	W06
@ 026   ----------------------------------------
	.byte		N06   , Cn2 , v116
	.byte		N07   , As2 
	.byte	W12
	.byte		N04   , Cn2 , v048
	.byte		N05   , As2 
	.byte	W24
	.byte		N08   , Gn2 , v116
	.byte		N06   , Ds3 
	.byte	W12
	.byte		N05   , Gn2 , v040
	.byte		N06   , Ds3 , v036
	.byte	W48
@ 027   ----------------------------------------
	.byte	W24
	.byte		N12   , Fn2 , v116
	.byte		N13   , Ds3 
	.byte	W18
	.byte		N05   , Ds3 , v036
	.byte	W06
	.byte		N11   , Fn2 , v112
	.byte		N13   , Cs3 , v116
	.byte	W18
	.byte		N05   , Cs3 , v032
	.byte	W06
	.byte		N10   , Fn2 , v116
	.byte		N13   , Cn3 
	.byte	W18
	.byte		N05   , Cn3 , v048
	.byte	W06
@ 028   ----------------------------------------
	.byte		N11   , Cs2 , v116
	.byte		N11   , Cn3 , v112
	.byte	W12
	.byte		        Cs2 , v048
	.byte		N11   , Cn3 , v044
	.byte	W24
	.byte		N08   , Cs2 , v116
	.byte		N09   , As2 
	.byte	W12
	.byte		N08   , Cs2 , v048
	.byte		N09   , As2 
	.byte	W48
@ 029   ----------------------------------------
	.byte		N06   , Cs2 , v116
	.byte		N06   , Cn3 
	.byte	W12
	.byte		        Cs2 , v044
	.byte		N06   , Cn3 
	.byte	W24
	.byte		N08   , Cs2 , v116
	.byte		N10   , As2 
	.byte	W12
	.byte		N08   , Cs2 , v048
	.byte		N10   , As2 
	.byte	W48
@ 030   ----------------------------------------
	.byte		N08   , Cs2 , v116
	.byte		N08   , Cn3 
	.byte	W12
	.byte		        Cs2 , v048
	.byte		N08   , Cn3 , v044
	.byte	W24
	.byte		        Cs2 , v116
	.byte		N09   , As2 
	.byte	W12
	.byte		N08   , Cs2 , v048
	.byte		N09   , As2 
	.byte	W24
	.byte		N11   , Cs2 , v104
	.byte		N11   , Cn3 
	.byte	W12
	.byte		N05   , Cs2 , v024
	.byte		N06   , Cn3 
	.byte	W12
@ 031   ----------------------------------------
	.byte		N04   , Cs2 , v116
	.byte		N08   , Cs3 , v108
	.byte	W12
	.byte		N56   , Fn2 , v116
	.byte		N56   , Ds3 , v108
	.byte	W60
	.byte		N08   , Fn2 , v048
	.byte		N09   , Ds3 
	.byte	W23
	.byte	GOTO
	 .word	watp_1_B1
watp_1_B2:
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

watp_2:
	.byte	KEYSH , watp_key+0
watp_2_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 34
	.byte		VOL   , 62*watp_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N28   , Cn2 , v112
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn1 
	.byte	W12
@ 001   ----------------------------------------
watp_2_001:
	.byte		N05   , Cn2 , v112
	.byte	W12
	.byte		N17   
	.byte	W24
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn1 
	.byte	W12
	.byte	PEND
@ 002   ----------------------------------------
	.byte		N24   , Cn2 
	.byte	W36
	.byte		N52   
	.byte	W60
@ 003   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N20   
	.byte	W24
	.byte		N22   
	.byte	W24
	.byte		N11   , Gn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
@ 004   ----------------------------------------
watp_2_004:
	.byte		N24   , Cn2 , v112
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn2 
	.byte	W12
	.byte	PEND
@ 005   ----------------------------------------
	.byte		N06   , Cn2 
	.byte	W12
	.byte		N19   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		        As1 
	.byte	W24
	.byte		N11   , Gs1 
	.byte	W12
@ 006   ----------------------------------------
	.byte		N24   , Cn2 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn1 
	.byte	W12
@ 007   ----------------------------------------
	.byte		N24   , Cn2 
	.byte	W36
	.byte		N21   
	.byte	W24
	.byte		N11   , Gn1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 008   ----------------------------------------
	.byte	PATT
	 .word	watp_2_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	watp_2_001
@ 010   ----------------------------------------
	.byte		N28   , Cn2 , v112
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N07   , Gn2 
	.byte	W12
@ 011   ----------------------------------------
	.byte		N06   , Cn2 
	.byte	W12
	.byte		N19   
	.byte	W24
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn2 
	.byte	W12
@ 012   ----------------------------------------
	.byte		N24   , Cn2 
	.byte	W36
	.byte		N24   
	.byte	W36
	.byte		N11   
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 013   ----------------------------------------
	.byte		N28   , Cn2 
	.byte	W36
	.byte		N23   
	.byte	W24
	.byte		N11   , Gn2 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		N36   , Cn2 
	.byte	W12
@ 014   ----------------------------------------
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gn1 
	.byte	W12
@ 015   ----------------------------------------
	.byte		N06   , Cn2 
	.byte	W12
	.byte		N19   
	.byte	W24
	.byte		N56   
	.byte	W60
@ 016   ----------------------------------------
	.byte		N24   , Cs2 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gs1 
	.byte	W12
@ 017   ----------------------------------------
	.byte		N24   , Cs2 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N10   , As1 
	.byte	W12
@ 018   ----------------------------------------
	.byte		N24   , Gs1 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Ds2 
	.byte	W12
@ 019   ----------------------------------------
	.byte		N06   , Gs1 
	.byte	W12
	.byte		N23   
	.byte	W24
	.byte		        Ds2 
	.byte	W24
	.byte		N11   , Gs2 
	.byte	W12
	.byte		N09   , Ds2 
	.byte	W12
	.byte		N11   , Gs1 
	.byte	W12
@ 020   ----------------------------------------
	.byte		N28   , Cs2 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N11   , Gs1 
	.byte	W12
@ 021   ----------------------------------------
	.byte		N28   , Cs2 
	.byte	W36
	.byte		N32   
	.byte	W36
	.byte		N09   , Cn2 
	.byte	W12
	.byte		N11   , As1 
	.byte	W12
@ 022   ----------------------------------------
	.byte		N30   , Gs1 
	.byte	W36
	.byte		N44   
	.byte	W48
	.byte		N10   , As1 
	.byte	W12
@ 023   ----------------------------------------
	.byte		N06   , Gs1 
	.byte	W12
	.byte		N19   
	.byte	W24
	.byte		N22   
	.byte	W24
	.byte		N11   , Gs2 
	.byte	W12
	.byte		N10   , Ds2 
	.byte	W12
	.byte		N11   , Cn2 
	.byte	W12
@ 024   ----------------------------------------
	.byte		N05   , Cs2 , v124
	.byte	W12
	.byte		N02   , Cs2 , v112
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		        Cs2 , v120
	.byte	W12
	.byte		        Cs2 , v112
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N04   , Cs2 , v124
	.byte	W12
	.byte		N03   , Cs2 , v112
	.byte	W12
@ 025   ----------------------------------------
	.byte		N04   , Cs2 , v120
	.byte	W12
	.byte		N02   , Cs2 , v116
	.byte	W12
	.byte		        Cs2 , v112
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		        Cs2 , v116
	.byte	W12
	.byte		        Cs2 , v112
	.byte	W12
	.byte		        Cs2 , v120
	.byte	W12
	.byte		        Cs2 , v112
	.byte	W12
@ 026   ----------------------------------------
	.byte		        Cn2 , v116
	.byte	W12
	.byte		        Cn2 , v112
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		        Cn2 , v124
	.byte	W12
	.byte		        Cn2 , v116
	.byte	W12
	.byte		        Cn2 , v120
	.byte	W12
	.byte		N04   , Cn2 , v127
	.byte	W12
	.byte		N04   
	.byte	W12
@ 027   ----------------------------------------
	.byte		        Fn2 
	.byte	W12
	.byte		N03   , Fn2 , v112
	.byte	W12
	.byte		        Fn2 , v116
	.byte	W12
	.byte		N02   , Fn2 , v112
	.byte	W12
	.byte		N04   , Fn2 , v116
	.byte	W12
	.byte		N03   , Fn2 , v112
	.byte	W12
	.byte		        Fn2 , v116
	.byte	W12
	.byte		        Fn2 , v112
	.byte	W12
@ 028   ----------------------------------------
	.byte		N04   , As1 , v120
	.byte	W12
	.byte		        As1 , v112
	.byte	W12
	.byte		        As1 , v116
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		        As1 , v112
	.byte	W12
	.byte		        As1 , v120
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N04   , As1 , v116
	.byte	W12
@ 029   ----------------------------------------
	.byte		N05   , As1 , v120
	.byte	W12
	.byte		N04   , As1 , v112
	.byte	W12
	.byte		        As1 , v120
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		        As1 , v116
	.byte	W12
	.byte		        As1 , v120
	.byte	W12
	.byte		        As1 , v116
	.byte	W12
	.byte		N04   
	.byte	W12
@ 030   ----------------------------------------
	.byte		N02   , Ds2 
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N03   , Ds2 , v112
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N03   , Ds2 , v116
	.byte	W12
	.byte		N02   , Ds2 , v112
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N03   , Ds2 , v116
	.byte	W12
@ 031   ----------------------------------------
	.byte		        Ds2 , v112
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		        Ds2 , v116
	.byte	W12
	.byte		        Ds2 , v112
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N21   
	.byte	W23
	.byte	GOTO
	 .word	watp_2_B1
watp_2_B2:
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

watp_3:
	.byte	KEYSH , watp_key+0
watp_3_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 122
	.byte		VOL   , 44*watp_mvl/mxv
	.byte		N44   , Cs2 , v092
	.byte	W48
	.byte		N10   , Dn1 , v108
	.byte	W36
	.byte		N05   , Ds4 , v120
	.byte	W06
	.byte		        Ds4 , v104
	.byte	W06
@ 001   ----------------------------------------
	.byte		N11   , Ds4 , v076
	.byte	W36
	.byte		        Ds4 , v120
	.byte	W12
	.byte		N10   , Dn1 , v108
	.byte	W36
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
@ 002   ----------------------------------------
	.byte		N32   , Cs2 
	.byte	W36
	.byte		N10   , Cn1 , v108
	.byte	W12
	.byte		        Dn1 
	.byte	W36
	.byte		N05   , Ds4 , v112
	.byte	W06
	.byte		        Ds4 , v108
	.byte	W06
@ 003   ----------------------------------------
	.byte		N19   , Ds4 , v072
	.byte	W36
	.byte		N11   , Ds4 , v124
	.byte	W12
	.byte		N10   , Dn1 , v108
	.byte	W36
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
@ 004   ----------------------------------------
	.byte		N16   , Dn1 , v104
	.byte	W36
	.byte		N11   
	.byte	W48
	.byte		N04   , Dn1 , v108
	.byte	W06
	.byte		N04   
	.byte	W06
@ 005   ----------------------------------------
	.byte		N11   
	.byte	W36
	.byte		N10   
	.byte	W60
@ 006   ----------------------------------------
	.byte		N14   , Dn1 , v080
	.byte	W36
	.byte		N11   , Dn1 , v092
	.byte	W60
@ 007   ----------------------------------------
	.byte	W36
	.byte		N05   
	.byte		N05   , Ds4 , v112
	.byte	W06
	.byte		        Ds4 , v100
	.byte	W06
	.byte		N11   , Ds4 , v068
	.byte	W12
	.byte		        Dn1 , v088
	.byte	W12
	.byte		        Dn1 , v100
	.byte	W12
	.byte		N11   
	.byte	W12
@ 008   ----------------------------------------
	.byte		N44   , Cs2 , v092
	.byte	W48
	.byte		N10   , Dn1 , v108
	.byte	W36
	.byte		N05   , Ds4 , v104
	.byte	W06
	.byte		        Ds4 , v092
	.byte	W06
@ 009   ----------------------------------------
	.byte		N20   , Ds4 , v084
	.byte	W24
	.byte		N11   , Fs1 , v068
	.byte	W12
	.byte		        Ds4 , v120
	.byte	W12
	.byte		N10   , Dn1 , v108
	.byte	W12
	.byte		        Fs1 , v044
	.byte	W12
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
@ 010   ----------------------------------------
	.byte		N16   , Dn1 , v104
	.byte	W24
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		        Dn1 , v108
	.byte	W12
	.byte		N16   , Fs1 , v060
	.byte	W24
	.byte		N11   , Fs1 , v072
	.byte	W12
	.byte		N05   , Ds4 , v096
	.byte	W06
	.byte		        Ds4 , v084
	.byte	W06
@ 011   ----------------------------------------
	.byte		N21   
	.byte	W24
	.byte		N11   , Fs1 , v068
	.byte	W12
	.byte		        Ds4 , v124
	.byte	W12
	.byte		N15   , Fs1 , v060
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N10   , Fs1 , v044
	.byte	W12
@ 012   ----------------------------------------
	.byte		N16   , Dn1 , v104
	.byte	W24
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		        Dn1 , v104
	.byte	W12
	.byte		        Fs1 , v060
	.byte	W12
	.byte		N10   , Fs1 , v044
	.byte	W12
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
@ 013   ----------------------------------------
	.byte		N16   , Dn1 , v104
	.byte	W24
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		N10   , Fs1 , v044
	.byte	W12
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		N10   , Fs1 , v044
	.byte	W24
	.byte		N05   , Fs1 , v060
	.byte	W06
	.byte		N05   
	.byte	W06
@ 014   ----------------------------------------
	.byte		N14   , Dn1 , v080
	.byte	W24
	.byte		N11   , Fs1 , v060
	.byte	W12
	.byte		        Dn1 , v092
	.byte	W12
	.byte		N15   , Fs1 , v060
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
@ 015   ----------------------------------------
	.byte		N16   , Dn1 , v104
	.byte	W24
	.byte		N11   , Fs1 , v060
	.byte	W36
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 016   ----------------------------------------
	.byte		N44   , Ds2 , v072
	.byte	W84
	.byte		N11   
	.byte	W12
@ 017   ----------------------------------------
	.byte		N36   
	.byte	W84
	.byte		N11   
	.byte	W12
@ 018   ----------------------------------------
	.byte		N36   
	.byte	W84
	.byte	W01
	.byte		N05   , Ds4 , v092
	.byte	W05
	.byte		N04   
	.byte	W05
	.byte		N19   , Ds4 , v084
	.byte	W01
@ 019   ----------------------------------------
	.byte	W84
	.byte		N11   , Ds2 , v072
	.byte	W12
@ 020   ----------------------------------------
watp_3_020:
	.byte		N40   , Ds2 , v080
	.byte	W84
	.byte		N11   , Ds2 , v072
	.byte	W12
	.byte	PEND
@ 021   ----------------------------------------
	.byte	PATT
	 .word	watp_3_020
@ 022   ----------------------------------------
	.byte		N36   , Ds2 , v072
	.byte	W84
	.byte		N05   , Ds4 , v092
	.byte	W05
	.byte		        Ds4 , v096
	.byte	W05
	.byte		N19   
	.byte	W02
@ 023   ----------------------------------------
	.byte		N32   , Cs2 , v104
	.byte	W36
	.byte		N15   , Dn1 , v100
	.byte	W24
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 024   ----------------------------------------
	.byte		N14   
	.byte	W36
	.byte		N15   
	.byte	W48
	.byte		N11   
	.byte	W12
@ 025   ----------------------------------------
	.byte		N11   
	.byte	W12
	.byte		N15   
	.byte	W48
	.byte		N11   
	.byte	W12
	.byte		N16   
	.byte	W24
@ 026   ----------------------------------------
	.byte		N15   
	.byte	W36
	.byte		N15   
	.byte	W48
	.byte		N05   , Dn1 , v080
	.byte	W06
	.byte		        Dn1 , v092
	.byte	W06
@ 027   ----------------------------------------
watp_3_027:
	.byte		N11   , Dn1 , v100
	.byte	W12
	.byte		N15   
	.byte	W24
	.byte		N16   
	.byte	W48
	.byte		N11   
	.byte	W12
	.byte	PEND
@ 028   ----------------------------------------
	.byte	PATT
	 .word	watp_3_027
@ 029   ----------------------------------------
	.byte		N11   , Dn1 , v100
	.byte	W12
	.byte		N15   
	.byte	W24
	.byte		N16   
	.byte	W48
	.byte		N05   , Dn1 , v080
	.byte	W06
	.byte		        Dn1 , v092
	.byte	W06
@ 030   ----------------------------------------
	.byte		N15   , Dn1 , v100
	.byte	W24
	.byte		N11   , Dn1 , v096
	.byte	W12
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N14   , Dn1 , v084
	.byte	W18
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N13   , Dn1 , v072
	.byte	W18
	.byte		N05   , Dn1 , v084
	.byte	W06
@ 031   ----------------------------------------
	.byte		N11   , Dn1 , v096
	.byte	W12
	.byte		N05   , Dn1 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Dn1 , v100
	.byte	W12
	.byte		N05   , Dn1 , v096
	.byte	W06
	.byte		        Dn1 , v100
	.byte	W06
	.byte		N11   , Dn1 , v080
	.byte	W12
	.byte		N05   , Dn1 , v100
	.byte	W06
	.byte		        Dn1 , v096
	.byte	W06
	.byte		N11   , Dn1 , v100
	.byte	W12
	.byte		N05   , Dn1 , v096
	.byte	W06
	.byte		        Dn1 , v100
	.byte	W05
	.byte	GOTO
	 .word	watp_3_B1
watp_3_B2:
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

watp_4:
	.byte	KEYSH , watp_key+0
watp_4_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 63
	.byte		VOL   , 48*watp_mvl/mxv
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+0
	.byte		N14   , En3 , v088
	.byte		N14   , Cn4 , v112
	.byte	W18
	.byte		N12   , En3 , v020
	.byte		N12   , Cn4 , v028
	.byte	W18
	.byte		N56   , En3 , v088
	.byte		N56   , Gn3 , v100
	.byte	W60
@ 001   ----------------------------------------
	.byte		N11   , Gn3 , v028
	.byte	W24
	.byte		N23   , En3 , v100
	.byte	W24
	.byte		        Gn3 
	.byte	W24
	.byte		N22   , Cn4 , v108
	.byte	W24
@ 002   ----------------------------------------
	.byte		N14   , Fs3 , v088
	.byte		N13   , Dn4 , v104
	.byte	W18
	.byte		N12   , Fs3 , v020
	.byte		N12   , Dn4 , v028
	.byte	W18
	.byte		N80   , Fs3 , v088
	.byte		N80   , An3 , v104
	.byte	W60
@ 003   ----------------------------------------
	.byte	W24
	.byte		N11   , An3 , v028
	.byte	W24
	.byte		N22   , An3 , v100
	.byte	W24
	.byte		N24   , Bn3 
	.byte	W24
@ 004   ----------------------------------------
watp_4_004:
	.byte		TIE   , Fn3 , v088
	.byte		N92   , Cn4 , v112
	.byte	W96
	.byte	PEND
@ 005   ----------------------------------------
watp_4_005:
	.byte		N44   , As3 , v104
	.byte	W48
	.byte		        Gs3 , v100
	.byte	W40
	.byte	W01
	.byte	PEND
	.byte		EOT   , Fn3 
	.byte	W07
@ 006   ----------------------------------------
	.byte		N92   , En3 , v088
	.byte		N92   , Gn3 , v100
	.byte	W96
@ 007   ----------------------------------------
	.byte		N12   , En3 , v020
	.byte		N12   , Gn3 , v028
	.byte	W24
	.byte		N11   , Cn3 , v100
	.byte	W12
	.byte		        En3 , v104
	.byte	W12
	.byte		        Gn3 , v092
	.byte	W12
	.byte		        Cn4 , v104
	.byte	W12
	.byte		        En4 , v088
	.byte	W12
	.byte		        Gn4 , v080
	.byte	W12
@ 008   ----------------------------------------
	.byte		        En3 , v088
	.byte		N12   , Cn4 , v112
	.byte	W18
	.byte		        En3 , v020
	.byte		N12   , Cn4 , v028
	.byte	W18
	.byte		N68   , En3 , v088
	.byte		N68   , Gn3 , v100
	.byte	W60
@ 009   ----------------------------------------
	.byte	W12
	.byte		N11   , En3 , v020
	.byte		N11   , Gn3 , v028
	.byte	W12
	.byte		N23   , En3 , v100
	.byte	W24
	.byte		        Gn3 
	.byte	W24
	.byte		N22   , Cn4 , v108
	.byte	W24
@ 010   ----------------------------------------
	.byte		N12   , Fs3 , v088
	.byte		N10   , Dn4 , v104
	.byte	W18
	.byte		N12   , Fs3 , v020
	.byte		N12   , Dn4 , v028
	.byte	W18
	.byte		TIE   , Fs3 , v088
	.byte		TIE   , An3 , v104
	.byte	W60
@ 011   ----------------------------------------
	.byte	W42
	.byte	W01
	.byte		EOT   
	.byte	W05
	.byte		N22   , An3 , v100
	.byte	W24
	.byte		N24   , Bn3 
	.byte	W17
	.byte		EOT   , Fs3 
	.byte	W07
@ 012   ----------------------------------------
	.byte	PATT
	 .word	watp_4_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	watp_4_005
	.byte		EOT   , Fn3 
	.byte	W07
@ 014   ----------------------------------------
	.byte		TIE   , En3 , v088
	.byte		TIE   , Gn3 , v100
	.byte	W96
@ 015   ----------------------------------------
	.byte	W23
	.byte		EOT   , En3 
	.byte		        Gn3 
	.byte	W01
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        En3 , v104
	.byte	W12
	.byte		        Gn3 , v092
	.byte	W12
	.byte		        Cn4 , v104
	.byte	W12
	.byte		        En4 , v088
	.byte	W12
	.byte		        Gn4 , v080
	.byte	W11
	.byte		VOL   , 48*watp_mvl/mxv
	.byte	W01
@ 016   ----------------------------------------
	.byte		VOICE , 47
	.byte		VOL   , 47*watp_mvl/mxv
	.byte		PAN   , c_v-2
	.byte		N11   , Cs2 , v100
	.byte	W12
	.byte		N23   , Gs2 
	.byte	W24
	.byte		N56   , Cn3 
	.byte	W60
@ 017   ----------------------------------------
	.byte		N11   , Cs2 
	.byte	W12
	.byte		N23   , Gs2 
	.byte	W24
	.byte		N32   , Cn3 
	.byte	W36
	.byte		N23   , Ds3 
	.byte	W24
@ 018   ----------------------------------------
watp_4_018:
	.byte		N11   , Gs1 , v100
	.byte	W12
	.byte		N23   , Ds2 
	.byte	W24
	.byte		        Gn2 
	.byte	W24
	.byte		N32   , Cn3 
	.byte	W36
	.byte	PEND
@ 019   ----------------------------------------
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		N23   , Cn3 
	.byte	W24
	.byte		        Ds3 
	.byte	W24
	.byte		N11   , Cn3 
	.byte	W12
@ 020   ----------------------------------------
	.byte		        Cs2 
	.byte	W12
	.byte		N23   , Gs2 
	.byte	W24
	.byte		        Cn3 
	.byte	W23
	.byte		VOL   , 47*watp_mvl/mxv
	.byte	W01
	.byte		        20*watp_mvl/mxv
	.byte		N23   , Fn3 
	.byte	W01
	.byte		VOL   , 23*watp_mvl/mxv
	.byte	W01
	.byte		        24*watp_mvl/mxv
	.byte	W01
	.byte		        26*watp_mvl/mxv
	.byte	W01
	.byte		        28*watp_mvl/mxv
	.byte	W01
	.byte		        30*watp_mvl/mxv
	.byte	W01
	.byte		        32*watp_mvl/mxv
	.byte	W01
	.byte		        34*watp_mvl/mxv
	.byte	W01
	.byte		        35*watp_mvl/mxv
	.byte	W01
	.byte		        37*watp_mvl/mxv
	.byte	W01
	.byte		        39*watp_mvl/mxv
	.byte	W01
	.byte		        41*watp_mvl/mxv
	.byte	W01
	.byte		        43*watp_mvl/mxv
	.byte	W01
	.byte		        45*watp_mvl/mxv
	.byte	W01
	.byte		        47*watp_mvl/mxv
	.byte	W10
	.byte		        47*watp_mvl/mxv
	.byte		N11   , Cn3 
	.byte	W12
@ 021   ----------------------------------------
	.byte		        Cs2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Cn3 
	.byte	W11
	.byte		VOL   , 47*watp_mvl/mxv
	.byte	W01
	.byte		        20*watp_mvl/mxv
	.byte		N32   , Gn3 
	.byte	W01
	.byte		VOL   , 22*watp_mvl/mxv
	.byte	W01
	.byte		        23*watp_mvl/mxv
	.byte	W01
	.byte		        25*watp_mvl/mxv
	.byte	W01
	.byte		        27*watp_mvl/mxv
	.byte	W01
	.byte		        28*watp_mvl/mxv
	.byte	W01
	.byte		        30*watp_mvl/mxv
	.byte	W01
	.byte		        32*watp_mvl/mxv
	.byte	W01
	.byte		        33*watp_mvl/mxv
	.byte	W01
	.byte		        35*watp_mvl/mxv
	.byte	W01
	.byte		        36*watp_mvl/mxv
	.byte	W01
	.byte		        38*watp_mvl/mxv
	.byte	W01
	.byte		        40*watp_mvl/mxv
	.byte	W01
	.byte		        41*watp_mvl/mxv
	.byte	W01
	.byte		        43*watp_mvl/mxv
	.byte	W01
	.byte		        44*watp_mvl/mxv
	.byte	W01
	.byte		        46*watp_mvl/mxv
	.byte	W01
	.byte		        47*watp_mvl/mxv
	.byte	W19
	.byte		        47*watp_mvl/mxv
	.byte		N23   , Cn3 
	.byte	W24
@ 022   ----------------------------------------
	.byte	PATT
	 .word	watp_4_018
@ 023   ----------------------------------------
	.byte		N11   , Gs1 , v100
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		N23   , Cn3 
	.byte	W24
	.byte		N32   , Ds3 
	.byte	W32
	.byte	W03
	.byte		VOL   , 47*watp_mvl/mxv
	.byte	W01
@ 024   ----------------------------------------
	.byte		VOICE , 92
	.byte		VOL   , 49*watp_mvl/mxv
	.byte		PAN   , c_v+6
	.byte	W24
	.byte		N23   , Cn5 , v088
	.byte	W24
	.byte		        Cs5 
	.byte	W24
	.byte		        Ds5 , v080
	.byte	W24
@ 025   ----------------------------------------
	.byte		N32   , Fn5 , v088
	.byte	W36
	.byte		N56   , Gs4 , v108
	.byte	W60
@ 026   ----------------------------------------
	.byte		N52   , Gn4 , v104
	.byte	W60
	.byte		N11   , Gn4 , v100
	.byte	W12
	.byte		        Gs4 , v096
	.byte	W12
	.byte		        As4 , v092
	.byte	W12
@ 027   ----------------------------------------
	.byte		N54   , Cn5 , v084
	.byte	W60
	.byte		N11   
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		N10   , Cn5 , v080
	.byte	W12
@ 028   ----------------------------------------
	.byte		N32   
	.byte	W36
	.byte		N54   , Fn4 , v088
	.byte	W60
@ 029   ----------------------------------------
	.byte		N32   , Gn4 , v092
	.byte	W36
	.byte		        Gs4 , v088
	.byte	W36
	.byte		N23   , As4 , v084
	.byte	W24
@ 030   ----------------------------------------
	.byte		N56   , Cn5 , v092
	.byte	W60
	.byte		N11   , As4 , v084
	.byte	W12
	.byte		        Cn5 , v092
	.byte	W12
	.byte		N44   , Cs5 , v088
	.byte	W12
@ 031   ----------------------------------------
	.byte	W36
	.byte		        Ds5 , v084
	.byte	W56
	.byte	W03
	.byte	GOTO
	 .word	watp_4_B1
watp_4_B2:
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

watp_5:
	.byte	KEYSH , watp_key+0
watp_5_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 62
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte		VOL   , 59*watp_mvl/mxv
	.byte		PAN   , c_v-9
	.byte	W48
	.byte		N11   , Cn3 , v116
	.byte	W12
	.byte		        Dn3 , v104
	.byte	W12
	.byte		N10   , En3 
	.byte	W12
	.byte		N11   , Fn3 , v116
	.byte	W12
@ 016   ----------------------------------------
	.byte		N80   , Gn3 
	.byte	W84
	.byte		N11   , Gs3 , v084
	.byte	W12
@ 017   ----------------------------------------
	.byte		N23   , Gn3 , v092
	.byte	W24
	.byte		N44   , Fn3 , v104
	.byte	W48
	.byte		N23   , Ds3 , v096
	.byte	W24
@ 018   ----------------------------------------
	.byte		        Dn3 , v112
	.byte	W24
	.byte		N11   , Ds3 , v092
	.byte	W12
	.byte		N72   , As3 , v104
	.byte	W60
@ 019   ----------------------------------------
	.byte	W24
	.byte		N23   , Cn4 , v108
	.byte	W24
	.byte		        As3 , v100
	.byte	W24
	.byte		        Gs3 , v096
	.byte	W24
@ 020   ----------------------------------------
	.byte		N68   , Gn3 
	.byte	W72
	.byte		N11   , Gs3 
	.byte	W12
	.byte		N32   , Gn3 , v088
	.byte	W12
@ 021   ----------------------------------------
	.byte	W24
	.byte		N23   , Fn3 , v096
	.byte	W24
	.byte		        Gs3 , v092
	.byte	W24
	.byte		        Cn4 , v096
	.byte	W24
@ 022   ----------------------------------------
	.byte		N11   , Dn4 , v092
	.byte	W12
	.byte		N21   , As3 
	.byte	W24
	.byte		N56   , Gn3 , v088
	.byte	W60
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte		VOL   , 44*watp_mvl/mxv
	.byte		PAN   , c_v+12
	.byte	W24
	.byte		N23   , Cn4 , v112
	.byte	W24
	.byte		        Cs4 , v108
	.byte	W24
	.byte		        Ds4 , v104
	.byte	W24
@ 025   ----------------------------------------
	.byte		N32   , Fn4 , v112
	.byte	W36
	.byte		N56   , Gs3 , v127
	.byte	W60
@ 026   ----------------------------------------
	.byte		N52   , Gn3 , v124
	.byte	W60
	.byte		N11   , Gn3 , v120
	.byte	W12
	.byte		        Gs3 , v116
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 027   ----------------------------------------
	.byte		N54   , Cn4 , v104
	.byte	W60
	.byte		N11   
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		N10   , Cn4 , v100
	.byte	W12
@ 028   ----------------------------------------
	.byte		N32   
	.byte	W36
	.byte		N54   , Fn3 , v108
	.byte	W60
@ 029   ----------------------------------------
	.byte		N32   , Gn3 , v112
	.byte	W36
	.byte		        Gs3 , v108
	.byte	W36
	.byte		N23   , As3 , v104
	.byte	W24
@ 030   ----------------------------------------
	.byte		N56   , Cn4 , v112
	.byte	W60
	.byte		N11   , As3 , v108
	.byte	W12
	.byte		        Cn4 , v112
	.byte	W12
	.byte		N44   , Cs4 
	.byte	W12
@ 031   ----------------------------------------
	.byte	W36
	.byte		        Ds4 , v104
	.byte	W56
	.byte	W03
	.byte	GOTO
	 .word	watp_5_B1
watp_5_B2:
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

watp_6:
	.byte	KEYSH , watp_key+0
watp_6_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 91
	.byte		MOD   , 1
	.byte		VOL   , 54*watp_mvl/mxv
	.byte		PAN   , c_v-6
	.byte		BEND  , c_v-1
	.byte	W72
	.byte		N05   , Cn3 , v080
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
@ 001   ----------------------------------------
	.byte		N78   , Gn3 
	.byte	W96
@ 002   ----------------------------------------
	.byte	W72
	.byte		N05   , Dn3 , v088
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
@ 003   ----------------------------------------
	.byte		N76   , An3 , v080
	.byte	W96
@ 004   ----------------------------------------
	.byte		MOD   , 0
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte		N11   , Cn3 , v092
	.byte	W12
	.byte		        En3 , v072
	.byte	W12
	.byte		        Gn3 , v064
	.byte	W12
	.byte		        Cn4 , v084
	.byte	W12
	.byte		        En4 , v100
	.byte	W12
	.byte		        Gn4 , v068
	.byte	W12
	.byte		        Cn5 , v084
	.byte	W12
	.byte		N13   , En5 
	.byte	W12
@ 008   ----------------------------------------
	.byte	W72
	.byte		N11   , En5 , v076
	.byte	W12
	.byte		N05   , Cn5 , v080
	.byte	W12
@ 009   ----------------------------------------
	.byte		N11   , Cn5 , v096
	.byte	W12
	.byte		N06   , Gn4 , v068
	.byte	W12
	.byte		N11   , Gn4 , v076
	.byte	W12
	.byte		N05   , En4 , v080
	.byte	W12
	.byte		N11   , En4 , v076
	.byte	W12
	.byte		N05   , Cn4 , v100
	.byte	W12
	.byte		N11   , Cn4 , v092
	.byte	W12
	.byte		N13   , Gn3 , v064
	.byte	W12
@ 010   ----------------------------------------
	.byte	W72
	.byte		N11   , Fs5 , v076
	.byte	W12
	.byte		N05   , Dn5 , v080
	.byte	W12
@ 011   ----------------------------------------
	.byte		N11   , Dn5 , v084
	.byte	W12
	.byte		N01   , An4 , v064
	.byte	W12
	.byte		N11   , An4 , v092
	.byte	W12
	.byte		N01   , Fs4 , v064
	.byte	W12
	.byte		N10   , Fs4 , v088
	.byte	W12
	.byte		N05   , Dn4 , v076
	.byte	W12
	.byte		N10   , Dn4 , v080
	.byte	W12
	.byte		N12   , An3 , v064
	.byte	W12
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W48
	.byte		N11   , Cn5 , v084
	.byte	W12
	.byte		N06   , Gn4 , v068
	.byte	W12
	.byte		N11   , Gn4 , v072
	.byte	W12
	.byte		N05   , En4 , v076
	.byte	W12
@ 015   ----------------------------------------
	.byte		N11   
	.byte	W12
	.byte		N05   , Cn4 , v096
	.byte	W12
	.byte		BEND  , c_v-1
	.byte		N08   , Cn4 , v072
	.byte	W12
	.byte		N10   , Gn3 , v068
	.byte	W12
	.byte		VOICE , 60
	.byte		VOL   , 57*watp_mvl/mxv
	.byte		PAN   , c_v-4
	.byte		N11   , Cn3 , v076
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Fn3 , v096
	.byte	W12
@ 016   ----------------------------------------
	.byte		N68   , Gn3 , v084
	.byte	W84
	.byte		N11   , Gs3 , v096
	.byte	W12
@ 017   ----------------------------------------
	.byte		N23   , Gn3 , v076
	.byte	W24
	.byte		N32   , Fn3 , v084
	.byte	W48
	.byte		N23   , Ds3 
	.byte	W24
@ 018   ----------------------------------------
	.byte		N05   , Gn3 , v092
	.byte	W06
	.byte		        Gs3 , v100
	.byte	W06
	.byte		        Gn3 , v064
	.byte	W06
	.byte		        Ds3 , v092
	.byte	W06
	.byte		TIE   , Cn3 
	.byte	W72
@ 019   ----------------------------------------
	.byte	W44
	.byte	W02
	.byte		EOT   
	.byte	W48
	.byte	W02
@ 020   ----------------------------------------
	.byte		N68   , Gn3 , v084
	.byte	W72
	.byte		N23   , Gs3 , v096
	.byte	W24
@ 021   ----------------------------------------
	.byte		N32   , Gn3 , v084
	.byte	W36
	.byte		N24   , Fn3 , v092
	.byte	W36
	.byte		N23   , Ds3 , v100
	.byte	W24
@ 022   ----------------------------------------
	.byte		N05   , Gn3 , v084
	.byte	W06
	.byte		        Gs3 , v092
	.byte	W06
	.byte		        Gn3 , v072
	.byte	W06
	.byte		        Ds3 , v096
	.byte	W06
	.byte		N72   , Cn3 , v100
	.byte	W72
@ 023   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 , v088
	.byte	W12
	.byte		        Cs3 , v084
	.byte	W12
	.byte		        Ds3 , v100
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Gn3 , v080
	.byte	W12
	.byte		        Gs3 , v088
	.byte	W12
	.byte		N10   , As3 , v092
	.byte	W12
@ 024   ----------------------------------------
	.byte		N68   , Cn4 , v112
	.byte	W72
	.byte		N11   , Cs4 , v092
	.byte	W12
	.byte		        Ds4 , v100
	.byte	W12
@ 025   ----------------------------------------
	.byte		N90   , Cn4 , v092
	.byte	W96
@ 026   ----------------------------------------
	.byte		        As3 , v088
	.byte	W96
@ 027   ----------------------------------------
	.byte	W24
	.byte		N23   , Cn4 , v112
	.byte	W24
	.byte		        Cs4 , v096
	.byte	W24
	.byte		N22   , Ds4 , v104
	.byte	W24
@ 028   ----------------------------------------
	.byte		N90   , Fn4 , v096
	.byte	W96
@ 029   ----------------------------------------
	.byte		N90   
	.byte	W96
@ 030   ----------------------------------------
	.byte		N32   , Fn4 , v088
	.byte	W36
	.byte		        Ds4 , v084
	.byte	W36
	.byte		N23   , Cs4 , v088
	.byte	W24
@ 031   ----------------------------------------
	.byte		N11   , Cn4 , v076
	.byte	W12
	.byte		N48   , As3 , v084
	.byte	W80
	.byte	W03
	.byte	GOTO
	 .word	watp_6_B1
watp_6_B2:
	.byte	FINE

@******************************************************@
	.align	2

watp:
	.byte	6	@ NumTrks
	.byte	0	@ NumBlks
	.byte	watp_pri	@ Priority
	.byte	watp_rev	@ Reverb.

	.word	watp_grp

	.word	watp_1
	.word	watp_2
	.word	watp_3
	.word	watp_4
	.word	watp_5
	.word	watp_6

	.end
