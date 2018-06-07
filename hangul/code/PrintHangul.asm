vHangulCounter EQU $8F40
vHangulDest EQU $8E42
vHangulSrc EQU $8E44
vUploadedTile EQU $8E50
FontInfoTile EQU 8
MaxFontLimit EQU $32
;LegacyFont : Location of Legacy Font
PrintHangul::
	
	;hl(TileMap) bc(Script Bytes), return a : FontBank���?��<{��Ҿ�(���i��w�W�nl	������"��Ɠ*JI�i{��DM���H�l��� gL0�'��>@�Æ\��M.b�gkh*a���l�N{��"�y��+&�gz�5(���e�)�\�)߲��'Zn��'�p3z�I��hp�	6�	Lg�=����b]�Vl"p�y�u<e��u�s���6/�(8�q1eص5�D���%jH��G&dS?���0$����y_킓�����}�p�L�Z�� IN�'ѣ�w\DC����6?�ѕY��v�t���Pd>��Y��&5����*�����yyC����u�>���Z�-$!3�=b��g�Ԭ����$�ȃ4���x�C�S��|��Ӊ������=�h�ɀ�Ș��+��ua�]ak��qIČ\�~X`:�QY��R<�>U�DZ���J11�ǫ96+���i�z.,��L�3��#�C���c.�|�����T�!�����a�7�p���&�f-�a-ZF���*"��Q,�G|��1h*�#y
-ٰ/�ai{�E�Ύ��G�e�_y7{���iJs6����rߢ��\�b��b��5R=�:���%��%6;$��Xja-N���a~�o�נ�l WriteVRAM
		inc hl
		ld a,c
		call WriteVRAM
		pop hl
	
	pop bc
	push hl
	call IncreaseCounter
	ld a,b
	and a,$0C
	rrca
	rrca
	add a,$30
	push af ; bank

	
	ld a,b
	and a,$03
	add a,$04
	ld b,a
	ld a,$04
.loop2
	sla c
	rl b
	dec a
	jr nz,.loop2
		push bc
		
			push hl
			ld hl,vHangulDest
			call ReadVRAM
			ld b,a
			inc hl
			call ReadVRAM
			ld c,a
			pop hl
				push bc
				pop hl ; hl : Dest
		
		pop de ;de : Src
	pop af ;bank
	
	ld b,a
	ld c,$2
	call HBlankCopyDouble
	pop hl
	ret
	
PrintEnglish::
	ld b,$00
	ld a,c
	call FindUpl��ޠ�F�xL��f��b�5���?}[#�}��UؗM�Е��+��G��Y�f�?E���Y(y�8W��+�6��O�~�ML�R��Pir�.7�lH,���'v�"�g3���dh��.�K7x�v]�|º*�'�9g7C�#�N�~��7o���1 ?�YV���ǆ��z����E�~�b���Hr���ˉ�5�4�w�c���B����'���ؤoQZ������x���!�A���)3�"�C�3��x!�0$O*��������_ү�i�b.k�E���ͺ��\����U�}5�A����$OWiӜ�t�h���d3,��07(/����[��aMP6#6�
�N����X�_�T`���}<N�=8�)���FT(�R-���F�,���P!���A�=�x/D̢���E �x �]u��:x�.��}v�u��õ��������o�pspq(5���Ū?2�~���x�(������[ި7�|\$,�S?+��?UX@��l�R@wOs����%:�2���L� �q.����?)]'ngE*���������(�j,s����k�*����T�}�o�rJ�*��8�*�مw�9Z�IE��x ��f���";���O���Fx��ö3�����_�ʣ�m�K�b�0��v�s�FK��ʛ��__cu��̾��>fY%L�GE��e1��qoV����e
	pop hl
	pop de
	ret
	;hl dest
	;de source
	;a bank	
FindUploadedTiles: ;VRAM : 8DC0~8DFF, bc : Hangul 2bytes, return a : TileNumber
	push de
	push hl
	ld hl,vUploadedTile
	ld e,$10*(FontInfoTile-1)
.loop
	call ReadVRAM
	cp a,b
	jr nz,.PrepareLoop
	inc hl
	call ReadVRAM
	cp a,c
	jr z,.Found
	dec hl
.PrepareLoop
	dec e
	dec e
	jr z,.NotFound
	inc hl
	inc hl
	jr .loop
.Found
	push bc
	ld bc,$FFFF-vUploadedTile+1
	add hl,bc
	pop bc
	ld a,l
	sra a
	
	pop hl
	pop de
	ret
.NotFound
	pop hl
	pop de
	ld a,$FF
	ret
	
FindUploadedEnglishTile ;a : 80~FF a : tile -$80
	push de
	push hl
	ld hl,vUploadedTile
	ld e,$10*(FontInfoTile-1)
	ld d,a
.loop
	call RI	o�5��m���z�F;U�UA	6>&�{(�	ni���cL�6Y�M��j�V��im����!�r�*�ёŁg'n�i��_���4�&�-��D�%YJ鵲^����C�ͽ��,O�������wMF^�J��t���F�s�a̎���Q'w*>�����3����V�f��G8U\(γ(*�K�'��̏y��U8�>8�c&���1.Rݴ���*i칯��ZR������5 u�
U�2D(%0@EY�BAv�{v�Z�4���n)<��n*s����ڣ���h��Clg�5
	b]��Ă����@ ��'��K���ڥY�� P�W��+8�S&$Ժ�KJ�#!�mkb�'k��9���9�T+e<0 ���d�K�-�v��܇j8�K����VO��)}���Im�񧑵I��1�n���/��VO;�B�W��y�Ok�U�����B��]�h���a��^��ark%�+��Su��'47"Ts/�����KV_h����EY�wZ�;�9�m� Y$��a h ���
P�0�Ga�߀^6��u�6/%E��_t�-���R��d&����N&6^ne
	pop af
	ret
	
FindAvailableEnglishTile: ; a : Tile return : Tile-$80
	push hl
	ld hl,vHangulCounter
	call ReadVRAM
	sla a
	pop hl
.p<J�6o9&���eGhx�Ѹ)�j�" �']�T����E8���R�s�A�$0���v.T�sX�5�@�����@�iA�ncu����j{�@��5�2���Q1���������h�a�0�ZQy#��.��v�r�k���8��#�] ����ޘ�%c�7�����0�@r !p����h��W����Y�'�G<8�ݬ��K�̙�?7	�K�ՏZ��vt>LW<2އ�S��z�T]0�4:�o�XP\l��E]H,Hz`������[��4����-O�qv�'�/��^̙9�q[UՇ�q�291U1�������3���'�)�'ݕ�7(��T@s�}x�A.��ݓ�52��ƦDΈj����ucMQ,���J2�Ţ~u	��$@�2�K��gy��X�S���.(�ݙ�#�Mi,D�kLj�<B�"��Y�qJ�i��	���X?�ѵ8�ۜ藝P�ޜ�Y�� .=�P�N��t��P�HPkڲD�#�1��b�x�hwCE!����0�6zk�;���e��w����.�z�s�7��8��v �֖����9�¡x�͏�)Y�ۑl���U�'�u���\7�Vs�������I�v��-�����%=�����%;�E"~m��9L|��8ȍ:�>���Q|W���ow�[�0K�Á�D��ؔ	�����_�Y�����>P��dz5��Tw��uk��L����>�� U�9칠��IL)<���8�w��]��2&��J�s����fҚp/У4:C�c^�0��6X���^�T���4�c}[��*m$6�^6�`�����"�vHHW�Ӏ�����I5��ܸ����"���b� %P�9_"���K�n�U�L^�S�6���Z���O�m����긎#�=hP�c[rSTAT]
	and a,%00000011
	cp a,$00
	jr nz,.ReRead
	pop af
	ret
.ReRead
	pop af
	jr .CheckHBlank
.Read��3R�7�UQ��V�ӡa��M<p1YR-�Km�{cs�k�8�)F;׷3&����V�g]���J��$��VF�7_Lk�z ��"
.���U���!�U3>L��kX�(��'@c�6��j�,䡑H��,R��!?I:erku�"��Ms��j�T�D�44�^X�|]��1O�r �������3m�ޖ$U ��m��!���>G���jwZ��I؟��+��
A�4�+[Qƙ�XG��9_��Еτ���f"E����������8}XwE��c�8�9�'��q@��S�f.Ъ�>脠��A��uM{��<Ї��P�உ�����:k�g.��ɨ�s��Q`{E�d��q���H���u�حd���a��{v��{�h1�K����R��Gy��OJ�U���i�K�U�j;jؓ��	��