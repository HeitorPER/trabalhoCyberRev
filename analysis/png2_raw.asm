
inputs/png2:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	48 83 ec 08          	sub    rsp,0x8
    1004:	48 8b 05 c5 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fc5]        # 4fd0 <__cxa_finalize@plt+0x3ef0>
    100b:	48 85 c0             	test   rax,rax
    100e:	74 02                	je     1012 <compress@plt-0x1e>
    1010:	ff d0                	call   rax
    1012:	48 83 c4 08          	add    rsp,0x8
    1016:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <compress@plt-0x10>:
    1020:	ff 35 ca 3f 00 00    	push   QWORD PTR [rip+0x3fca]        # 4ff0 <__cxa_finalize@plt+0x3f10>
    1026:	ff 25 cc 3f 00 00    	jmp    QWORD PTR [rip+0x3fcc]        # 4ff8 <__cxa_finalize@plt+0x3f18>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <compress@plt>:
    1030:	ff 25 ca 3f 00 00    	jmp    QWORD PTR [rip+0x3fca]        # 5000 <__cxa_finalize@plt+0x3f20>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001040 <__isoc99_fscanf@plt>:
    1040:	ff 25 c2 3f 00 00    	jmp    QWORD PTR [rip+0x3fc2]        # 5008 <__cxa_finalize@plt+0x3f28>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001050 <puts@plt>:
    1050:	ff 25 ba 3f 00 00    	jmp    QWORD PTR [rip+0x3fba]        # 5010 <__cxa_finalize@plt+0x3f30>
    1056:	68 02 00 00 00       	push   0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001060 <pow@plt>:
    1060:	ff 25 b2 3f 00 00    	jmp    QWORD PTR [rip+0x3fb2]        # 5018 <__cxa_finalize@plt+0x3f38>
    1066:	68 03 00 00 00       	push   0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001070 <fclose@plt>:
    1070:	ff 25 aa 3f 00 00    	jmp    QWORD PTR [rip+0x3faa]        # 5020 <__cxa_finalize@plt+0x3f40>
    1076:	68 04 00 00 00       	push   0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001080 <printf@plt>:
    1080:	ff 25 a2 3f 00 00    	jmp    QWORD PTR [rip+0x3fa2]        # 5028 <__cxa_finalize@plt+0x3f48>
    1086:	68 05 00 00 00       	push   0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <compress@plt-0x10>

0000000000001090 <strcmp@plt>:
    1090:	ff 25 9a 3f 00 00    	jmp    QWORD PTR [rip+0x3f9a]        # 5030 <__cxa_finalize@plt+0x3f50>
    1096:	68 06 00 00 00       	push   0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <compress@plt-0x10>

00000000000010a0 <malloc@plt>:
    10a0:	ff 25 92 3f 00 00    	jmp    QWORD PTR [rip+0x3f92]        # 5038 <__cxa_finalize@plt+0x3f58>
    10a6:	68 07 00 00 00       	push   0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <compress@plt-0x10>

00000000000010b0 <compressBound@plt>:
    10b0:	ff 25 8a 3f 00 00    	jmp    QWORD PTR [rip+0x3f8a]        # 5040 <__cxa_finalize@plt+0x3f60>
    10b6:	68 08 00 00 00       	push   0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <compress@plt-0x10>

00000000000010c0 <fopen@plt>:
    10c0:	ff 25 82 3f 00 00    	jmp    QWORD PTR [rip+0x3f82]        # 5048 <__cxa_finalize@plt+0x3f68>
    10c6:	68 09 00 00 00       	push   0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <compress@plt-0x10>

00000000000010d0 <fwrite@plt>:
    10d0:	ff 25 7a 3f 00 00    	jmp    QWORD PTR [rip+0x3f7a]        # 5050 <__cxa_finalize@plt+0x3f70>
    10d6:	68 0a 00 00 00       	push   0xa
    10db:	e9 40 ff ff ff       	jmp    1020 <compress@plt-0x10>

Disassembly of section .plt.got:

00000000000010e0 <__cxa_finalize@plt>:
    10e0:	ff 25 fa 3e 00 00    	jmp    QWORD PTR [rip+0x3efa]        # 4fe0 <__cxa_finalize@plt+0x3f00>
    10e6:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000000000010f0 <.text>:
    10f0:	41 55                	push   r13
    10f2:	41 54                	push   r12
    10f4:	55                   	push   rbp
    10f5:	53                   	push   rbx
    10f6:	48 89 f3             	mov    rbx,rsi
    10f9:	48 83 ec 08          	sub    rsp,0x8
    10fd:	83 ff 04             	cmp    edi,0x4
    1100:	75 5e                	jne    1160 <__cxa_finalize@plt+0x80>
    1102:	48 8b 7e 10          	mov    rdi,QWORD PTR [rsi+0x10]
    1106:	48 8d 35 2d 1f 00 00 	lea    rsi,[rip+0x1f2d]        # 303a <__cxa_finalize@plt+0x1f5a>
    110d:	e8 ae ff ff ff       	call   10c0 <fopen@plt>
    1112:	49 89 c4             	mov    r12,rax
    1115:	48 85 c0             	test   rax,rax
    1118:	0f 84 83 00 00 00    	je     11a1 <__cxa_finalize@plt+0xc1>
    111e:	48 8b 7b 18          	mov    rdi,QWORD PTR [rbx+0x18]
    1122:	48 8d 35 27 1f 00 00 	lea    rsi,[rip+0x1f27]        # 3050 <__cxa_finalize@plt+0x1f70>
    1129:	e8 92 ff ff ff       	call   10c0 <fopen@plt>
    112e:	48 89 c5             	mov    rbp,rax
    1131:	48 85 c0             	test   rax,rax
    1134:	74 7f                	je     11b5 <__cxa_finalize@plt+0xd5>
    1136:	4c 8b 6b 08          	mov    r13,QWORD PTR [rbx+0x8]
    113a:	48 8d 35 12 1f 00 00 	lea    rsi,[rip+0x1f12]        # 3053 <__cxa_finalize@plt+0x1f73>
    1141:	4c 89 ef             	mov    rdi,r13
    1144:	e8 47 ff ff ff       	call   1090 <strcmp@plt>
    1149:	85 c0                	test   eax,eax
    114b:	74 42                	je     118f <__cxa_finalize@plt+0xaf>
    114d:	48 8d 35 06 1f 00 00 	lea    rsi,[rip+0x1f06]        # 305a <__cxa_finalize@plt+0x1f7a>
    1154:	4c 89 ef             	mov    rdi,r13
    1157:	e8 34 ff ff ff       	call   1090 <strcmp@plt>
    115c:	85 c0                	test   eax,eax
    115e:	74 21                	je     1181 <__cxa_finalize@plt+0xa1>
    1160:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
    1163:	48 8d 3d c6 1f 00 00 	lea    rdi,[rip+0x1fc6]        # 3130 <__cxa_finalize@plt+0x2050>
    116a:	31 c0                	xor    eax,eax
    116c:	e8 0f ff ff ff       	call   1080 <printf@plt>
    1171:	48 83 c4 08          	add    rsp,0x8
    1175:	b8 01 00 00 00       	mov    eax,0x1
    117a:	5b                   	pop    rbx
    117b:	5d                   	pop    rbp
    117c:	41 5c                	pop    r12
    117e:	41 5d                	pop    r13
    1180:	c3                   	ret    
    1181:	48 8d 3d d8 1f 00 00 	lea    rdi,[rip+0x1fd8]        # 3160 <__cxa_finalize@plt+0x2080>
    1188:	e8 c3 fe ff ff       	call   1050 <puts@plt>
    118d:	eb e2                	jmp    1171 <__cxa_finalize@plt+0x91>
    118f:	58                   	pop    rax
    1190:	48 89 ee             	mov    rsi,rbp
    1193:	5b                   	pop    rbx
    1194:	4c 89 e7             	mov    rdi,r12
    1197:	5d                   	pop    rbp
    1198:	41 5c                	pop    r12
    119a:	41 5d                	pop    r13
    119c:	e9 5f 0a 00 00       	jmp    1c00 <__cxa_finalize@plt+0xb20>
    11a1:	48 8b 73 10          	mov    rsi,QWORD PTR [rbx+0x10]
    11a5:	48 8d 3d 91 1e 00 00 	lea    rdi,[rip+0x1e91]        # 303d <__cxa_finalize@plt+0x1f5d>
    11ac:	31 c0                	xor    eax,eax
    11ae:	e8 cd fe ff ff       	call   1080 <printf@plt>
    11b3:	eb bc                	jmp    1171 <__cxa_finalize@plt+0x91>
    11b5:	48 8b 73 18          	mov    rsi,QWORD PTR [rbx+0x18]
    11b9:	48 8d 3d 7d 1e 00 00 	lea    rdi,[rip+0x1e7d]        # 303d <__cxa_finalize@plt+0x1f5d>
    11c0:	31 c0                	xor    eax,eax
    11c2:	e8 b9 fe ff ff       	call   1080 <printf@plt>
    11c7:	eb a8                	jmp    1171 <__cxa_finalize@plt+0x91>
    11c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    11d0:	31 ed                	xor    ebp,ebp
    11d2:	49 89 d1             	mov    r9,rdx
    11d5:	5e                   	pop    rsi
    11d6:	48 89 e2             	mov    rdx,rsp
    11d9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    11dd:	50                   	push   rax
    11de:	54                   	push   rsp
    11df:	45 31 c0             	xor    r8d,r8d
    11e2:	31 c9                	xor    ecx,ecx
    11e4:	48 8d 3d 05 ff ff ff 	lea    rdi,[rip+0xffffffffffffff05]        # 10f0 <__cxa_finalize@plt+0x10>
    11eb:	ff 15 cf 3d 00 00    	call   QWORD PTR [rip+0x3dcf]        # 4fc0 <__cxa_finalize@plt+0x3ee0>
    11f1:	f4                   	hlt    
    11f2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    11f9:	00 00 00 
    11fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1200:	48 8d 3d d1 3e 00 00 	lea    rdi,[rip+0x3ed1]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    1207:	48 8d 05 ca 3e 00 00 	lea    rax,[rip+0x3eca]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    120e:	48 39 f8             	cmp    rax,rdi
    1211:	74 15                	je     1228 <__cxa_finalize@plt+0x148>
    1213:	48 8b 05 ae 3d 00 00 	mov    rax,QWORD PTR [rip+0x3dae]        # 4fc8 <__cxa_finalize@plt+0x3ee8>
    121a:	48 85 c0             	test   rax,rax
    121d:	74 09                	je     1228 <__cxa_finalize@plt+0x148>
    121f:	ff e0                	jmp    rax
    1221:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1228:	c3                   	ret    
    1229:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1230:	48 8d 3d a1 3e 00 00 	lea    rdi,[rip+0x3ea1]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    1237:	48 8d 35 9a 3e 00 00 	lea    rsi,[rip+0x3e9a]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    123e:	48 29 fe             	sub    rsi,rdi
    1241:	48 89 f0             	mov    rax,rsi
    1244:	48 c1 ee 3f          	shr    rsi,0x3f
    1248:	48 c1 f8 03          	sar    rax,0x3
    124c:	48 01 c6             	add    rsi,rax
    124f:	48 d1 fe             	sar    rsi,1
    1252:	74 14                	je     1268 <__cxa_finalize@plt+0x188>
    1254:	48 8b 05 7d 3d 00 00 	mov    rax,QWORD PTR [rip+0x3d7d]        # 4fd8 <__cxa_finalize@plt+0x3ef8>
    125b:	48 85 c0             	test   rax,rax
    125e:	74 08                	je     1268 <__cxa_finalize@plt+0x188>
    1260:	ff e0                	jmp    rax
    1262:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1268:	c3                   	ret    
    1269:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1270:	f3 0f 1e fa          	endbr64 
    1274:	80 3d 65 3e 00 00 00 	cmp    BYTE PTR [rip+0x3e65],0x0        # 50e0 <__cxa_finalize@plt+0x4000>
    127b:	75 2b                	jne    12a8 <__cxa_finalize@plt+0x1c8>
    127d:	55                   	push   rbp
    127e:	48 83 3d 5a 3d 00 00 	cmp    QWORD PTR [rip+0x3d5a],0x0        # 4fe0 <__cxa_finalize@plt+0x3f00>
    1285:	00 
    1286:	48 89 e5             	mov    rbp,rsp
    1289:	74 0c                	je     1297 <__cxa_finalize@plt+0x1b7>
    128b:	48 8b 3d d6 3d 00 00 	mov    rdi,QWORD PTR [rip+0x3dd6]        # 5068 <__cxa_finalize@plt+0x3f88>
    1292:	e8 49 fe ff ff       	call   10e0 <__cxa_finalize@plt>
    1297:	e8 64 ff ff ff       	call   1200 <__cxa_finalize@plt+0x120>
    129c:	c6 05 3d 3e 00 00 01 	mov    BYTE PTR [rip+0x3e3d],0x1        # 50e0 <__cxa_finalize@plt+0x4000>
    12a3:	5d                   	pop    rbp
    12a4:	c3                   	ret    
    12a5:	0f 1f 00             	nop    DWORD PTR [rax]
    12a8:	c3                   	ret    
    12a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	e9 77 ff ff ff       	jmp    1230 <__cxa_finalize@plt+0x150>
    12b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    12c0:	89 f8                	mov    eax,edi
    12c2:	c3                   	ret    
    12c3:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12ca:	00 00 00 00 
    12ce:	66 90                	xchg   ax,ax
    12d0:	89 f8                	mov    eax,edi
    12d2:	29 f0                	sub    eax,esi
    12d4:	c3                   	ret    
    12d5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12dc:	00 00 00 00 
    12e0:	89 f8                	mov    eax,edi
    12e2:	29 d0                	sub    eax,edx
    12e4:	c3                   	ret    
    12e5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12ec:	00 00 00 00 
    12f0:	89 f0                	mov    eax,esi
    12f2:	31 f8                	xor    eax,edi
    12f4:	c3                   	ret    
    12f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12fc:	00 00 00 00 
    1300:	89 d0                	mov    eax,edx
    1302:	31 f8                	xor    eax,edi
    1304:	c3                   	ret    
    1305:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    130c:	00 00 00 00 
    1310:	31 f1                	xor    ecx,esi
    1312:	31 d1                	xor    ecx,edx
    1314:	89 c8                	mov    eax,ecx
    1316:	31 f8                	xor    eax,edi
    1318:	c3                   	ret    
    1319:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1320:	89 f8                	mov    eax,edi
    1322:	44 29 c0             	sub    eax,r8d
    1325:	c3                   	ret    
    1326:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    132d:	00 00 00 
    1330:	89 f8                	mov    eax,edi
    1332:	44 29 c8             	sub    eax,r9d
    1335:	c3                   	ret    
    1336:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    133d:	00 00 00 
    1340:	44 89 c0             	mov    eax,r8d
    1343:	31 f8                	xor    eax,edi
    1345:	c3                   	ret    
    1346:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    134d:	00 00 00 
    1350:	44 89 c8             	mov    eax,r9d
    1353:	31 f8                	xor    eax,edi
    1355:	c3                   	ret    
    1356:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    135d:	00 00 00 
    1360:	45 31 c1             	xor    r9d,r8d
    1363:	41 31 f1             	xor    r9d,esi
    1366:	44 89 c8             	mov    eax,r9d
    1369:	31 f8                	xor    eax,edi
    136b:	c3                   	ret    
    136c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1370:	31 c0                	xor    eax,eax
    1372:	48 8d 3d a7 3d 00 00 	lea    rdi,[rip+0x3da7]        # 5120 <__cxa_finalize@plt+0x4040>
    1379:	be 20 83 b8 ed       	mov    esi,0xedb88320
    137e:	66 90                	xchg   ax,ax
    1380:	48 89 c2             	mov    rdx,rax
    1383:	48 d1 ea             	shr    rdx,1
    1386:	a8 01                	test   al,0x1
    1388:	74 03                	je     138d <__cxa_finalize@plt+0x2ad>
    138a:	48 31 f2             	xor    rdx,rsi
    138d:	48 89 d1             	mov    rcx,rdx
    1390:	48 d1 e9             	shr    rcx,1
    1393:	83 e2 01             	and    edx,0x1
    1396:	74 03                	je     139b <__cxa_finalize@plt+0x2bb>
    1398:	48 31 f1             	xor    rcx,rsi
    139b:	48 89 ca             	mov    rdx,rcx
    139e:	48 d1 ea             	shr    rdx,1
    13a1:	83 e1 01             	and    ecx,0x1
    13a4:	74 03                	je     13a9 <__cxa_finalize@plt+0x2c9>
    13a6:	48 31 f2             	xor    rdx,rsi
    13a9:	48 89 d1             	mov    rcx,rdx
    13ac:	48 d1 e9             	shr    rcx,1
    13af:	83 e2 01             	and    edx,0x1
    13b2:	74 03                	je     13b7 <__cxa_finalize@plt+0x2d7>
    13b4:	48 31 f1             	xor    rcx,rsi
    13b7:	48 89 ca             	mov    rdx,rcx
    13ba:	48 d1 ea             	shr    rdx,1
    13bd:	83 e1 01             	and    ecx,0x1
    13c0:	74 03                	je     13c5 <__cxa_finalize@plt+0x2e5>
    13c2:	48 31 f2             	xor    rdx,rsi
    13c5:	48 89 d1             	mov    rcx,rdx
    13c8:	48 d1 e9             	shr    rcx,1
    13cb:	83 e2 01             	and    edx,0x1
    13ce:	74 03                	je     13d3 <__cxa_finalize@plt+0x2f3>
    13d0:	48 31 f1             	xor    rcx,rsi
    13d3:	48 89 ca             	mov    rdx,rcx
    13d6:	48 d1 ea             	shr    rdx,1
    13d9:	83 e1 01             	and    ecx,0x1
    13dc:	74 03                	je     13e1 <__cxa_finalize@plt+0x301>
    13de:	48 31 f2             	xor    rdx,rsi
    13e1:	48 89 d1             	mov    rcx,rdx
    13e4:	48 d1 e9             	shr    rcx,1
    13e7:	83 e2 01             	and    edx,0x1
    13ea:	74 03                	je     13ef <__cxa_finalize@plt+0x30f>
    13ec:	48 31 f1             	xor    rcx,rsi
    13ef:	48 89 0c c7          	mov    QWORD PTR [rdi+rax*8],rcx
    13f3:	48 83 c0 01          	add    rax,0x1
    13f7:	48 3d 00 01 00 00    	cmp    rax,0x100
    13fd:	75 81                	jne    1380 <__cxa_finalize@plt+0x2a0>
    13ff:	c7 05 f7 3c 00 00 01 	mov    DWORD PTR [rip+0x3cf7],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    1406:	00 00 00 
    1409:	c3                   	ret    
    140a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1410:	8b 0d ea 3c 00 00    	mov    ecx,DWORD PTR [rip+0x3cea]        # 5100 <__cxa_finalize@plt+0x4020>
    1416:	48 89 f8             	mov    rax,rdi
    1419:	49 89 f2             	mov    r10,rsi
    141c:	85 c9                	test   ecx,ecx
    141e:	0f 85 a3 00 00 00    	jne    14c7 <__cxa_finalize@plt+0x3e7>
    1424:	31 c9                	xor    ecx,ecx
    1426:	4c 8d 0d f3 3c 00 00 	lea    r9,[rip+0x3cf3]        # 5120 <__cxa_finalize@plt+0x4040>
    142d:	41 b8 20 83 b8 ed    	mov    r8d,0xedb88320
    1433:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1438:	48 89 ce             	mov    rsi,rcx
    143b:	48 d1 ee             	shr    rsi,1
    143e:	f6 c1 01             	test   cl,0x1
    1441:	74 03                	je     1446 <__cxa_finalize@plt+0x366>
    1443:	4c 31 c6             	xor    rsi,r8
    1446:	48 89 f7             	mov    rdi,rsi
    1449:	48 d1 ef             	shr    rdi,1
    144c:	83 e6 01             	and    esi,0x1
    144f:	74 03                	je     1454 <__cxa_finalize@plt+0x374>
    1451:	4c 31 c7             	xor    rdi,r8
    1454:	48 89 fe             	mov    rsi,rdi
    1457:	48 d1 ee             	shr    rsi,1
    145a:	83 e7 01             	and    edi,0x1
    145d:	74 03                	je     1462 <__cxa_finalize@plt+0x382>
    145f:	4c 31 c6             	xor    rsi,r8
    1462:	48 89 f7             	mov    rdi,rsi
    1465:	48 d1 ef             	shr    rdi,1
    1468:	83 e6 01             	and    esi,0x1
    146b:	74 03                	je     1470 <__cxa_finalize@plt+0x390>
    146d:	4c 31 c7             	xor    rdi,r8
    1470:	48 89 fe             	mov    rsi,rdi
    1473:	48 d1 ee             	shr    rsi,1
    1476:	83 e7 01             	and    edi,0x1
    1479:	74 03                	je     147e <__cxa_finalize@plt+0x39e>
    147b:	4c 31 c6             	xor    rsi,r8
    147e:	48 89 f7             	mov    rdi,rsi
    1481:	48 d1 ef             	shr    rdi,1
    1484:	83 e6 01             	and    esi,0x1
    1487:	74 03                	je     148c <__cxa_finalize@plt+0x3ac>
    1489:	4c 31 c7             	xor    rdi,r8
    148c:	48 89 fe             	mov    rsi,rdi
    148f:	48 d1 ee             	shr    rsi,1
    1492:	83 e7 01             	and    edi,0x1
    1495:	74 03                	je     149a <__cxa_finalize@plt+0x3ba>
    1497:	4c 31 c6             	xor    rsi,r8
    149a:	48 89 f7             	mov    rdi,rsi
    149d:	48 d1 ef             	shr    rdi,1
    14a0:	83 e6 01             	and    esi,0x1
    14a3:	74 03                	je     14a8 <__cxa_finalize@plt+0x3c8>
    14a5:	4c 31 c7             	xor    rdi,r8
    14a8:	49 89 3c c9          	mov    QWORD PTR [r9+rcx*8],rdi
    14ac:	48 83 c1 01          	add    rcx,0x1
    14b0:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
    14b7:	0f 85 7b ff ff ff    	jne    1438 <__cxa_finalize@plt+0x358>
    14bd:	c7 05 39 3c 00 00 01 	mov    DWORD PTR [rip+0x3c39],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    14c4:	00 00 00 
    14c7:	85 d2                	test   edx,edx
    14c9:	7e 2e                	jle    14f9 <__cxa_finalize@plt+0x419>
    14cb:	48 63 d2             	movsxd rdx,edx
    14ce:	4c 89 d1             	mov    rcx,r10
    14d1:	4c 8d 0d 48 3c 00 00 	lea    r9,[rip+0x3c48]        # 5120 <__cxa_finalize@plt+0x4040>
    14d8:	49 8d 34 12          	lea    rsi,[r10+rdx*1]
    14dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    14e0:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
    14e3:	48 83 c1 01          	add    rcx,0x1
    14e7:	31 c2                	xor    edx,eax
    14e9:	48 c1 e8 08          	shr    rax,0x8
    14ed:	0f b6 d2             	movzx  edx,dl
    14f0:	49 33 04 d1          	xor    rax,QWORD PTR [r9+rdx*8]
    14f4:	48 39 f1             	cmp    rcx,rsi
    14f7:	75 e7                	jne    14e0 <__cxa_finalize@plt+0x400>
    14f9:	c3                   	ret    
    14fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1500:	8b 05 fa 3b 00 00    	mov    eax,DWORD PTR [rip+0x3bfa]        # 5100 <__cxa_finalize@plt+0x4020>
    1506:	85 c0                	test   eax,eax
    1508:	0f 85 9b 00 00 00    	jne    15a9 <__cxa_finalize@plt+0x4c9>
    150e:	31 c0                	xor    eax,eax
    1510:	4c 8d 0d 09 3c 00 00 	lea    r9,[rip+0x3c09]        # 5120 <__cxa_finalize@plt+0x4040>
    1517:	41 b8 20 83 b8 ed    	mov    r8d,0xedb88320
    151d:	0f 1f 00             	nop    DWORD PTR [rax]
    1520:	48 89 c2             	mov    rdx,rax
    1523:	48 d1 ea             	shr    rdx,1
    1526:	a8 01                	test   al,0x1
    1528:	74 03                	je     152d <__cxa_finalize@plt+0x44d>
    152a:	4c 31 c2             	xor    rdx,r8
    152d:	48 89 d1             	mov    rcx,rdx
    1530:	48 d1 e9             	shr    rcx,1
    1533:	83 e2 01             	and    edx,0x1
    1536:	74 03                	je     153b <__cxa_finalize@plt+0x45b>
    1538:	4c 31 c1             	xor    rcx,r8
    153b:	48 89 ca             	mov    rdx,rcx
    153e:	48 d1 ea             	shr    rdx,1
    1541:	83 e1 01             	and    ecx,0x1
    1544:	74 03                	je     1549 <__cxa_finalize@plt+0x469>
    1546:	4c 31 c2             	xor    rdx,r8
    1549:	48 89 d1             	mov    rcx,rdx
    154c:	48 d1 e9             	shr    rcx,1
    154f:	83 e2 01             	and    edx,0x1
    1552:	74 03                	je     1557 <__cxa_finalize@plt+0x477>
    1554:	4c 31 c1             	xor    rcx,r8
    1557:	48 89 ca             	mov    rdx,rcx
    155a:	48 d1 ea             	shr    rdx,1
    155d:	83 e1 01             	and    ecx,0x1
    1560:	74 03                	je     1565 <__cxa_finalize@plt+0x485>
    1562:	4c 31 c2             	xor    rdx,r8
    1565:	48 89 d1             	mov    rcx,rdx
    1568:	48 d1 e9             	shr    rcx,1
    156b:	83 e2 01             	and    edx,0x1
    156e:	74 03                	je     1573 <__cxa_finalize@plt+0x493>
    1570:	4c 31 c1             	xor    rcx,r8
    1573:	48 89 ca             	mov    rdx,rcx
    1576:	48 d1 ea             	shr    rdx,1
    1579:	83 e1 01             	and    ecx,0x1
    157c:	74 03                	je     1581 <__cxa_finalize@plt+0x4a1>
    157e:	4c 31 c2             	xor    rdx,r8
    1581:	48 89 d1             	mov    rcx,rdx
    1584:	48 d1 e9             	shr    rcx,1
    1587:	83 e2 01             	and    edx,0x1
    158a:	74 03                	je     158f <__cxa_finalize@plt+0x4af>
    158c:	4c 31 c1             	xor    rcx,r8
    158f:	49 89 0c c1          	mov    QWORD PTR [r9+rax*8],rcx
    1593:	48 83 c0 01          	add    rax,0x1
    1597:	48 3d 00 01 00 00    	cmp    rax,0x100
    159d:	75 81                	jne    1520 <__cxa_finalize@plt+0x440>
    159f:	c7 05 57 3b 00 00 01 	mov    DWORD PTR [rip+0x3b57],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    15a6:	00 00 00 
    15a9:	85 f6                	test   esi,esi
    15ab:	7e 3d                	jle    15ea <__cxa_finalize@plt+0x50a>
    15ad:	48 63 f6             	movsxd rsi,esi
    15b0:	48 89 fa             	mov    rdx,rdi
    15b3:	b8 ff ff ff ff       	mov    eax,0xffffffff
    15b8:	48 01 fe             	add    rsi,rdi
    15bb:	4c 8d 0d 5e 3b 00 00 	lea    r9,[rip+0x3b5e]        # 5120 <__cxa_finalize@plt+0x4040>
    15c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    15c8:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
    15cb:	48 83 c2 01          	add    rdx,0x1
    15cf:	31 c1                	xor    ecx,eax
    15d1:	48 c1 e8 08          	shr    rax,0x8
    15d5:	0f b6 c9             	movzx  ecx,cl
    15d8:	49 33 04 c9          	xor    rax,QWORD PTR [r9+rcx*8]
    15dc:	48 39 f2             	cmp    rdx,rsi
    15df:	75 e7                	jne    15c8 <__cxa_finalize@plt+0x4e8>
    15e1:	ba ff ff ff ff       	mov    edx,0xffffffff
    15e6:	48 31 d0             	xor    rax,rdx
    15e9:	c3                   	ret    
    15ea:	31 c0                	xor    eax,eax
    15ec:	c3                   	ret    
    15ed:	0f 1f 00             	nop    DWORD PTR [rax]
    15f0:	c6 01 00             	mov    BYTE PTR [rcx],0x0
    15f3:	49 89 c9             	mov    r9,rcx
    15f6:	49 89 d0             	mov    r8,rdx
    15f9:	41 89 fa             	mov    r10d,edi
    15fc:	c6 02 00             	mov    BYTE PTR [rdx],0x0
    15ff:	b9 01 00 00 00       	mov    ecx,0x1
    1604:	40 80 ff 01          	cmp    dil,0x1
    1608:	77 31                	ja     163b <__cxa_finalize@plt+0x55b>
    160a:	eb 64                	jmp    1670 <__cxa_finalize@plt+0x590>
    160c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1610:	66 85 c0             	test   ax,ax
    1613:	75 43                	jne    1658 <__cxa_finalize@plt+0x578>
    1615:	41 0f b6 11          	movzx  edx,BYTE PTR [r9]
    1619:	41 32 10             	xor    dl,BYTE PTR [r8]
    161c:	41 88 10             	mov    BYTE PTR [r8],dl
    161f:	41 32 11             	xor    dl,BYTE PTR [r9]
    1622:	41 88 11             	mov    BYTE PTR [r9],dl
    1625:	41 30 10             	xor    BYTE PTR [r8],dl
    1628:	66 85 c0             	test   ax,ax
    162b:	74 03                	je     1630 <__cxa_finalize@plt+0x550>
    162d:	41 00 08             	add    BYTE PTR [r8],cl
    1630:	01 c9                	add    ecx,ecx
    1632:	66 c1 ee 02          	shr    si,0x2
    1636:	44 38 d1             	cmp    cl,r10b
    1639:	73 35                	jae    1670 <__cxa_finalize@plt+0x590>
    163b:	89 f0                	mov    eax,esi
    163d:	66 d1 e8             	shr    ax,1
    1640:	83 e0 01             	and    eax,0x1
    1643:	89 c2                	mov    edx,eax
    1645:	31 f2                	xor    edx,esi
    1647:	83 e2 01             	and    edx,0x1
    164a:	74 c4                	je     1610 <__cxa_finalize@plt+0x530>
    164c:	41 00 09             	add    BYTE PTR [r9],cl
    164f:	eb d7                	jmp    1628 <__cxa_finalize@plt+0x548>
    1651:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1658:	89 ca                	mov    edx,ecx
    165a:	41 2a 10             	sub    dl,BYTE PTR [r8]
    165d:	83 ea 01             	sub    edx,0x1
    1660:	41 88 10             	mov    BYTE PTR [r8],dl
    1663:	89 ca                	mov    edx,ecx
    1665:	41 2a 11             	sub    dl,BYTE PTR [r9]
    1668:	83 ea 01             	sub    edx,0x1
    166b:	41 88 11             	mov    BYTE PTR [r9],dl
    166e:	eb a9                	jmp    1619 <__cxa_finalize@plt+0x539>
    1670:	c3                   	ret    
    1671:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1678:	00 00 00 00 
    167c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1680:	41 55                	push   r13
    1682:	48 89 d1             	mov    rcx,rdx
    1685:	89 f0                	mov    eax,esi
    1687:	41 54                	push   r12
    1689:	41 89 f4             	mov    r12d,esi
    168c:	be 04 00 00 00       	mov    esi,0x4
    1691:	0f c8                	bswap  eax
    1693:	55                   	push   rbp
    1694:	48 89 d5             	mov    rbp,rdx
    1697:	ba 01 00 00 00       	mov    edx,0x1
    169c:	53                   	push   rbx
    169d:	48 89 fb             	mov    rbx,rdi
    16a0:	48 83 ec 18          	sub    rsp,0x18
    16a4:	48 8d 7c 24 08       	lea    rdi,[rsp+0x8]
    16a9:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    16ad:	e8 1e fa ff ff       	call   10d0 <fwrite@plt>
    16b2:	41 8d 54 24 04       	lea    edx,[r12+0x4]
    16b7:	48 89 e9             	mov    rcx,rbp
    16ba:	48 89 df             	mov    rdi,rbx
    16bd:	be 01 00 00 00       	mov    esi,0x1
    16c2:	49 89 d5             	mov    r13,rdx
    16c5:	e8 06 fa ff ff       	call   10d0 <fwrite@plt>
    16ca:	8b 05 30 3a 00 00    	mov    eax,DWORD PTR [rip+0x3a30]        # 5100 <__cxa_finalize@plt+0x4020>
    16d0:	85 c0                	test   eax,eax
    16d2:	0f 85 a1 00 00 00    	jne    1779 <__cxa_finalize@plt+0x699>
    16d8:	31 c0                	xor    eax,eax
    16da:	48 8d 3d 3f 3a 00 00 	lea    rdi,[rip+0x3a3f]        # 5120 <__cxa_finalize@plt+0x4040>
    16e1:	be 20 83 b8 ed       	mov    esi,0xedb88320
    16e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    16ed:	00 00 00 
    16f0:	48 89 c2             	mov    rdx,rax
    16f3:	48 d1 ea             	shr    rdx,1
    16f6:	a8 01                	test   al,0x1
    16f8:	74 03                	je     16fd <__cxa_finalize@plt+0x61d>
    16fa:	48 31 f2             	xor    rdx,rsi
    16fd:	48 89 d1             	mov    rcx,rdx
    1700:	48 d1 e9             	shr    rcx,1
    1703:	83 e2 01             	and    edx,0x1
    1706:	74 03                	je     170b <__cxa_finalize@plt+0x62b>
    1708:	48 31 f1             	xor    rcx,rsi
    170b:	48 89 ca             	mov    rdx,rcx
    170e:	48 d1 ea             	shr    rdx,1
    1711:	83 e1 01             	and    ecx,0x1
    1714:	74 03                	je     1719 <__cxa_finalize@plt+0x639>
    1716:	48 31 f2             	xor    rdx,rsi
    1719:	48 89 d1             	mov    rcx,rdx
    171c:	48 d1 e9             	shr    rcx,1
    171f:	83 e2 01             	and    edx,0x1
    1722:	74 03                	je     1727 <__cxa_finalize@plt+0x647>
    1724:	48 31 f1             	xor    rcx,rsi
    1727:	48 89 ca             	mov    rdx,rcx
    172a:	48 d1 ea             	shr    rdx,1
    172d:	83 e1 01             	and    ecx,0x1
    1730:	74 03                	je     1735 <__cxa_finalize@plt+0x655>
    1732:	48 31 f2             	xor    rdx,rsi
    1735:	48 89 d1             	mov    rcx,rdx
    1738:	48 d1 e9             	shr    rcx,1
    173b:	83 e2 01             	and    edx,0x1
    173e:	74 03                	je     1743 <__cxa_finalize@plt+0x663>
    1740:	48 31 f1             	xor    rcx,rsi
    1743:	48 89 ca             	mov    rdx,rcx
    1746:	48 d1 ea             	shr    rdx,1
    1749:	83 e1 01             	and    ecx,0x1
    174c:	74 03                	je     1751 <__cxa_finalize@plt+0x671>
    174e:	48 31 f2             	xor    rdx,rsi
    1751:	48 89 d1             	mov    rcx,rdx
    1754:	48 d1 e9             	shr    rcx,1
    1757:	83 e2 01             	and    edx,0x1
    175a:	74 03                	je     175f <__cxa_finalize@plt+0x67f>
    175c:	48 31 f1             	xor    rcx,rsi
    175f:	48 89 0c c7          	mov    QWORD PTR [rdi+rax*8],rcx
    1763:	48 83 c0 01          	add    rax,0x1
    1767:	48 3d 00 01 00 00    	cmp    rax,0x100
    176d:	75 81                	jne    16f0 <__cxa_finalize@plt+0x610>
    176f:	c7 05 87 39 00 00 01 	mov    DWORD PTR [rip+0x3987],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    1776:	00 00 00 
    1779:	45 85 ed             	test   r13d,r13d
    177c:	7e 63                	jle    17e1 <__cxa_finalize@plt+0x701>
    177e:	41 8d 44 24 03       	lea    eax,[r12+0x3]
    1783:	48 8d 3d 96 39 00 00 	lea    rdi,[rip+0x3996]        # 5120 <__cxa_finalize@plt+0x4040>
    178a:	48 8d 4c 03 01       	lea    rcx,[rbx+rax*1+0x1]
    178f:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1794:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1798:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    179b:	48 83 c3 01          	add    rbx,0x1
    179f:	31 c2                	xor    edx,eax
    17a1:	48 c1 e8 08          	shr    rax,0x8
    17a5:	0f b6 d2             	movzx  edx,dl
    17a8:	48 33 04 d7          	xor    rax,QWORD PTR [rdi+rdx*8]
    17ac:	48 39 d9             	cmp    rcx,rbx
    17af:	75 e7                	jne    1798 <__cxa_finalize@plt+0x6b8>
    17b1:	ba ff ff ff ff       	mov    edx,0xffffffff
    17b6:	48 31 d0             	xor    rax,rdx
    17b9:	0f c8                	bswap  eax
    17bb:	48 8d 7c 24 0c       	lea    rdi,[rsp+0xc]
    17c0:	48 89 e9             	mov    rcx,rbp
    17c3:	ba 01 00 00 00       	mov    edx,0x1
    17c8:	be 04 00 00 00       	mov    esi,0x4
    17cd:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
    17d1:	e8 fa f8 ff ff       	call   10d0 <fwrite@plt>
    17d6:	48 83 c4 18          	add    rsp,0x18
    17da:	5b                   	pop    rbx
    17db:	5d                   	pop    rbp
    17dc:	41 5c                	pop    r12
    17de:	41 5d                	pop    r13
    17e0:	c3                   	ret    
    17e1:	31 c0                	xor    eax,eax
    17e3:	eb d6                	jmp    17bb <__cxa_finalize@plt+0x6db>
    17e5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    17ec:	00 00 00 00 
    17f0:	41 57                	push   r15
    17f2:	41 56                	push   r14
    17f4:	41 55                	push   r13
    17f6:	41 54                	push   r12
    17f8:	55                   	push   rbp
    17f9:	53                   	push   rbx
    17fa:	48 83 ec 48          	sub    rsp,0x48
    17fe:	4c 89 44 24 10       	mov    QWORD PTR [rsp+0x10],r8
    1803:	40 84 f6             	test   sil,sil
    1806:	0f 84 b2 01 00 00    	je     19be <__cxa_finalize@plt+0x8de>
    180c:	48 8d 47 01          	lea    rax,[rdi+0x1]
    1810:	40 0f b6 fe          	movzx  edi,sil
    1814:	49 89 c9             	mov    r9,rcx
    1817:	48 89 d6             	mov    rsi,rdx
    181a:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
    181f:	31 c9                	xor    ecx,ecx
    1821:	45 31 ff             	xor    r15d,r15d
    1824:	48 89 c2             	mov    rdx,rax
    1827:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    182e:	00 00 
    1830:	8b 04 8e             	mov    eax,DWORD PTR [rsi+rcx*4]
    1833:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    1837:	48 85 c9             	test   rcx,rcx
    183a:	0f 84 10 01 00 00    	je     1950 <__cxa_finalize@plt+0x870>
    1840:	44 8b 6c 8e fc       	mov    r13d,DWORD PTR [rsi+rcx*4-0x4]
    1845:	4d 85 c9             	test   r9,r9
    1848:	0f 84 2a 01 00 00    	je     1978 <__cxa_finalize@plt+0x898>
    184e:	41 8b 44 89 fc       	mov    eax,DWORD PTR [r9+rcx*4-0x4]
    1853:	45 8b 34 89          	mov    r14d,DWORD PTR [r9+rcx*4]
    1857:	89 44 24 04          	mov    DWORD PTR [rsp+0x4],eax
    185b:	48 83 f9 01          	cmp    rcx,0x1
    185f:	0f 84 28 01 00 00    	je     198d <__cxa_finalize@plt+0x8ad>
    1865:	8b 44 8e f8          	mov    eax,DWORD PTR [rsi+rcx*4-0x8]
    1869:	45 31 e4             	xor    r12d,r12d
    186c:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
    1870:	48 83 f9 02          	cmp    rcx,0x2
    1874:	74 05                	je     187b <__cxa_finalize@plt+0x79b>
    1876:	44 8b 64 8e f4       	mov    r12d,DWORD PTR [rsi+rcx*4-0xc]
    187b:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
    1880:	48 89 d5             	mov    rbp,rdx
    1883:	bb 10 00 00 00       	mov    ebx,0x10
    1888:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
    188d:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
    1892:	4c 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],r9
    1897:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
    189b:	89 d9                	mov    ecx,ebx
    189d:	44 8b 44 24 0c       	mov    r8d,DWORD PTR [rsp+0xc]
    18a2:	45 89 e1             	mov    r9d,r12d
    18a5:	8b 7c 24 08          	mov    edi,DWORD PTR [rsp+0x8]
    18a9:	44 89 f2             	mov    edx,r14d
    18ac:	44 89 ee             	mov    esi,r13d
    18af:	41 d3 e9             	shr    r9d,cl
    18b2:	d3 e8                	shr    eax,cl
    18b4:	41 d3 e8             	shr    r8d,cl
    18b7:	45 0f b6 c9          	movzx  r9d,r9b
    18bb:	d3 ea                	shr    edx,cl
    18bd:	0f b6 c0             	movzx  eax,al
    18c0:	d3 ee                	shr    esi,cl
    18c2:	45 0f b6 c0          	movzx  r8d,r8b
    18c6:	d3 ef                	shr    edi,cl
    18c8:	0f b6 d2             	movzx  edx,dl
    18cb:	89 c1                	mov    ecx,eax
    18cd:	40 0f b6 f6          	movzx  esi,sil
    18d1:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    18d6:	40 0f b6 ff          	movzx  edi,dil
    18da:	ff d0                	call   rax
    18dc:	0f b6 d0             	movzx  edx,al
    18df:	88 45 00             	mov    BYTE PTR [rbp+0x0],al
    18e2:	83 fa 7f             	cmp    edx,0x7f
    18e5:	7f 51                	jg     1938 <__cxa_finalize@plt+0x858>
    18e7:	0f b6 c0             	movzx  eax,al
    18ea:	49 01 c7             	add    r15,rax
    18ed:	83 eb 08             	sub    ebx,0x8
    18f0:	48 83 c5 01          	add    rbp,0x1
    18f4:	83 fb f8             	cmp    ebx,0xfffffff8
    18f7:	75 9e                	jne    1897 <__cxa_finalize@plt+0x7b7>
    18f9:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    18fe:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
    1903:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
    1908:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
    190d:	48 83 c2 03          	add    rdx,0x3
    1911:	48 83 c1 01          	add    rcx,0x1
    1915:	48 39 4c 24 38       	cmp    QWORD PTR [rsp+0x38],rcx
    191a:	0f 85 10 ff ff ff    	jne    1830 <__cxa_finalize@plt+0x750>
    1920:	48 83 c4 48          	add    rsp,0x48
    1924:	4c 89 f8             	mov    rax,r15
    1927:	5b                   	pop    rbx
    1928:	5d                   	pop    rbp
    1929:	41 5c                	pop    r12
    192b:	41 5d                	pop    r13
    192d:	41 5e                	pop    r14
    192f:	41 5f                	pop    r15
    1931:	c3                   	ret    
    1932:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1938:	b8 00 01 00 00       	mov    eax,0x100
    193d:	29 d0                	sub    eax,edx
    193f:	48 98                	cdqe   
    1941:	49 01 c7             	add    r15,rax
    1944:	eb a7                	jmp    18ed <__cxa_finalize@plt+0x80d>
    1946:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    194d:	00 00 00 
    1950:	4d 85 c9             	test   r9,r9
    1953:	74 4b                	je     19a0 <__cxa_finalize@plt+0x8c0>
    1955:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
    195c:	00 
    195d:	45 8b 31             	mov    r14d,DWORD PTR [r9]
    1960:	45 31 ed             	xor    r13d,r13d
    1963:	45 31 e4             	xor    r12d,r12d
    1966:	c7 44 24 04 00 00 00 	mov    DWORD PTR [rsp+0x4],0x0
    196d:	00 
    196e:	e9 08 ff ff ff       	jmp    187b <__cxa_finalize@plt+0x79b>
    1973:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1978:	c7 44 24 04 00 00 00 	mov    DWORD PTR [rsp+0x4],0x0
    197f:	00 
    1980:	45 31 f6             	xor    r14d,r14d
    1983:	48 83 f9 01          	cmp    rcx,0x1
    1987:	0f 85 d8 fe ff ff    	jne    1865 <__cxa_finalize@plt+0x785>
    198d:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
    1994:	00 
    1995:	45 31 e4             	xor    r12d,r12d
    1998:	e9 de fe ff ff       	jmp    187b <__cxa_finalize@plt+0x79b>
    199d:	0f 1f 00             	nop    DWORD PTR [rax]
    19a0:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
    19a7:	00 
    19a8:	45 31 ed             	xor    r13d,r13d
    19ab:	45 31 f6             	xor    r14d,r14d
    19ae:	45 31 e4             	xor    r12d,r12d
    19b1:	c7 44 24 04 00 00 00 	mov    DWORD PTR [rsp+0x4],0x0
    19b8:	00 
    19b9:	e9 bd fe ff ff       	jmp    187b <__cxa_finalize@plt+0x79b>
    19be:	45 31 ff             	xor    r15d,r15d
    19c1:	e9 5a ff ff ff       	jmp    1920 <__cxa_finalize@plt+0x840>
    19c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    19cd:	00 00 00 
    19d0:	41 57                	push   r15
    19d2:	41 56                	push   r14
    19d4:	41 55                	push   r13
    19d6:	4c 8d 2d 43 3f 00 00 	lea    r13,[rip+0x3f43]        # 5920 <__cxa_finalize@plt+0x4840>
    19dd:	41 54                	push   r12
    19df:	49 c7 c4 ff ff ff ff 	mov    r12,0xffffffffffffffff
    19e6:	55                   	push   rbp
    19e7:	53                   	push   rbx
    19e8:	48 83 ec 28          	sub    rsp,0x28
    19ec:	48 8b 05 35 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f35]        # 5928 <__cxa_finalize@plt+0x4848>
    19f3:	48 8b 1d 26 3f 00 00 	mov    rbx,QWORD PTR [rip+0x3f26]        # 5920 <__cxa_finalize@plt+0x4840>
    19fa:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
    19fe:	40 0f b6 f6          	movzx  esi,sil
    1a02:	48 39 c3             	cmp    rbx,rax
    1a05:	89 74 24 18          	mov    DWORD PTR [rsp+0x18],esi
    1a09:	48 0f 47 d8          	cmova  rbx,rax
    1a0d:	48 8b 05 1c 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f1c]        # 5930 <__cxa_finalize@plt+0x4850>
    1a14:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
    1a18:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
    1a1d:	48 39 c3             	cmp    rbx,rax
    1a20:	48 0f 47 d8          	cmova  rbx,rax
    1a24:	48 8b 05 0d 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f0d]        # 5938 <__cxa_finalize@plt+0x4858>
    1a2b:	48 39 c3             	cmp    rbx,rax
    1a2e:	48 0f 47 d8          	cmova  rbx,rax
    1a32:	48 8b 05 07 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f07]        # 5940 <__cxa_finalize@plt+0x4860>
    1a39:	48 39 c3             	cmp    rbx,rax
    1a3c:	48 0f 47 d8          	cmova  rbx,rax
    1a40:	48 8b 05 01 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f01]        # 5948 <__cxa_finalize@plt+0x4868>
    1a47:	48 39 c3             	cmp    rbx,rax
    1a4a:	48 0f 47 d8          	cmova  rbx,rax
    1a4e:	48 8b 05 fb 3e 00 00 	mov    rax,QWORD PTR [rip+0x3efb]        # 5950 <__cxa_finalize@plt+0x4870>
    1a55:	48 39 c3             	cmp    rbx,rax
    1a58:	48 0f 47 d8          	cmova  rbx,rax
    1a5c:	48 8b 05 f5 3e 00 00 	mov    rax,QWORD PTR [rip+0x3ef5]        # 5958 <__cxa_finalize@plt+0x4878>
    1a63:	48 39 c3             	cmp    rbx,rax
    1a66:	48 0f 47 d8          	cmova  rbx,rax
    1a6a:	48 8b 05 ef 3e 00 00 	mov    rax,QWORD PTR [rip+0x3eef]        # 5960 <__cxa_finalize@plt+0x4880>
    1a71:	48 39 c3             	cmp    rbx,rax
    1a74:	48 0f 47 d8          	cmova  rbx,rax
    1a78:	48 8b 05 e9 3e 00 00 	mov    rax,QWORD PTR [rip+0x3ee9]        # 5968 <__cxa_finalize@plt+0x4888>
    1a7f:	48 39 c3             	cmp    rbx,rax
    1a82:	48 0f 47 d8          	cmova  rbx,rax
    1a86:	48 8b 05 e3 3e 00 00 	mov    rax,QWORD PTR [rip+0x3ee3]        # 5970 <__cxa_finalize@plt+0x4890>
    1a8d:	48 39 c3             	cmp    rbx,rax
    1a90:	48 0f 47 d8          	cmova  rbx,rax
    1a94:	45 31 ff             	xor    r15d,r15d
    1a97:	45 31 c0             	xor    r8d,r8d
    1a9a:	4c 89 fd             	mov    rbp,r15
    1a9d:	4c 89 44 24 10       	mov    QWORD PTR [rsp+0x10],r8
    1aa2:	49 89 cf             	mov    r15,rcx
    1aa5:	eb 29                	jmp    1ad0 <__cxa_finalize@plt+0x9f0>
    1aa7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    1aae:	00 00 
    1ab0:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    1ab5:	4c 39 e0             	cmp    rax,r12
    1ab8:	73 08                	jae    1ac2 <__cxa_finalize@plt+0x9e2>
    1aba:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
    1abf:	49 89 c4             	mov    r12,rax
    1ac2:	48 83 c5 01          	add    rbp,0x1
    1ac6:	48 83 fd 0b          	cmp    rbp,0xb
    1aca:	0f 84 d0 00 00 00    	je     1ba0 <__cxa_finalize@plt+0xac0>
    1ad0:	48 8d 05 a9 35 00 00 	lea    rax,[rip+0x35a9]        # 5080 <__cxa_finalize@plt+0x3fa0>
    1ad7:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
    1adc:	8b 74 24 18          	mov    esi,DWORD PTR [rsp+0x18]
    1ae0:	4c 89 f9             	mov    rcx,r15
    1ae3:	4c 8b 04 e8          	mov    r8,QWORD PTR [rax+rbp*8]
    1ae7:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
    1aeb:	e8 00 fd ff ff       	call   17f0 <__cxa_finalize@plt+0x710>
    1af0:	49 8b 54 ed 00       	mov    rdx,QWORD PTR [r13+rbp*8+0x0]
    1af5:	49 89 c6             	mov    r14,rax
    1af8:	48 29 da             	sub    rdx,rbx
    1afb:	0f 88 7f 00 00 00    	js     1b80 <__cxa_finalize@plt+0xaa0>
    1b01:	66 0f ef c9          	pxor   xmm1,xmm1
    1b05:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
    1b0a:	48 8b 05 87 16 00 00 	mov    rax,QWORD PTR [rip+0x1687]        # 3198 <__cxa_finalize@plt+0x20b8>
    1b11:	66 48 0f 6e c0       	movq   xmm0,rax
    1b16:	e8 45 f5 ff ff       	call   1060 <pow@plt>
    1b1b:	66 0f 28 c8          	movapd xmm1,xmm0
    1b1f:	4d 85 f6             	test   r14,r14
    1b22:	78 3c                	js     1b60 <__cxa_finalize@plt+0xa80>
    1b24:	66 0f ef c0          	pxor   xmm0,xmm0
    1b28:	f2 49 0f 2a c6       	cvtsi2sd xmm0,r14
    1b2d:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    1b31:	66 0f 2f 05 67 16 00 	comisd xmm0,QWORD PTR [rip+0x1667]        # 31a0 <__cxa_finalize@plt+0x20c0>
    1b38:	00 
    1b39:	0f 82 71 ff ff ff    	jb     1ab0 <__cxa_finalize@plt+0x9d0>
    1b3f:	f2 0f 5c 05 59 16 00 	subsd  xmm0,QWORD PTR [rip+0x1659]        # 31a0 <__cxa_finalize@plt+0x20c0>
    1b46:	00 
    1b47:	48 bf 00 00 00 00 00 	movabs rdi,0x8000000000000000
    1b4e:	00 00 80 
    1b51:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    1b56:	48 31 f8             	xor    rax,rdi
    1b59:	e9 57 ff ff ff       	jmp    1ab5 <__cxa_finalize@plt+0x9d5>
    1b5e:	66 90                	xchg   ax,ax
    1b60:	4c 89 f2             	mov    rdx,r14
    1b63:	4c 89 f0             	mov    rax,r14
    1b66:	66 0f ef c0          	pxor   xmm0,xmm0
    1b6a:	48 d1 ea             	shr    rdx,1
    1b6d:	83 e0 01             	and    eax,0x1
    1b70:	48 09 c2             	or     rdx,rax
    1b73:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
    1b78:	f2 0f 58 c0          	addsd  xmm0,xmm0
    1b7c:	eb af                	jmp    1b2d <__cxa_finalize@plt+0xa4d>
    1b7e:	66 90                	xchg   ax,ax
    1b80:	48 89 d1             	mov    rcx,rdx
    1b83:	83 e2 01             	and    edx,0x1
    1b86:	66 0f ef c9          	pxor   xmm1,xmm1
    1b8a:	48 d1 e9             	shr    rcx,1
    1b8d:	48 09 d1             	or     rcx,rdx
    1b90:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
    1b95:	f2 0f 58 c9          	addsd  xmm1,xmm1
    1b99:	e9 6c ff ff ff       	jmp    1b0a <__cxa_finalize@plt+0xa2a>
    1b9e:	66 90                	xchg   ax,ax
    1ba0:	4c 8b 44 24 10       	mov    r8,QWORD PTR [rsp+0x10]
    1ba5:	48 8d 05 c4 34 00 00 	lea    rax,[rip+0x34c4]        # 5070 <__cxa_finalize@plt+0x3f90>
    1bac:	48 8b 2c 24          	mov    rbp,QWORD PTR [rsp]
    1bb0:	4c 89 f9             	mov    rcx,r15
    1bb3:	8b 74 24 18          	mov    esi,DWORD PTR [rsp+0x18]
    1bb7:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
    1bbc:	42 0f b6 04 00       	movzx  eax,BYTE PTR [rax+r8*1]
    1bc1:	4b 83 44 c5 00 01    	add    QWORD PTR [r13+r8*8+0x0],0x1
    1bc7:	48 89 ef             	mov    rdi,rbp
    1bca:	88 45 00             	mov    BYTE PTR [rbp+0x0],al
    1bcd:	48 8d 05 ac 34 00 00 	lea    rax,[rip+0x34ac]        # 5080 <__cxa_finalize@plt+0x3fa0>
    1bd4:	4e 8b 04 c0          	mov    r8,QWORD PTR [rax+r8*8]
    1bd8:	e8 13 fc ff ff       	call   17f0 <__cxa_finalize@plt+0x710>
    1bdd:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [rsp+0x1c]
    1be2:	48 83 c4 28          	add    rsp,0x28
    1be6:	5b                   	pop    rbx
    1be7:	48 8d 44 40 01       	lea    rax,[rax+rax*2+0x1]
    1bec:	48 01 e8             	add    rax,rbp
    1bef:	5d                   	pop    rbp
    1bf0:	41 5c                	pop    r12
    1bf2:	41 5d                	pop    r13
    1bf4:	41 5e                	pop    r14
    1bf6:	41 5f                	pop    r15
    1bf8:	c3                   	ret    
    1bf9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1c00:	41 57                	push   r15
    1c02:	31 c0                	xor    eax,eax
    1c04:	41 56                	push   r14
    1c06:	41 55                	push   r13
    1c08:	41 54                	push   r12
    1c0a:	49 89 f4             	mov    r12,rsi
    1c0d:	48 8d 35 f0 13 00 00 	lea    rsi,[rip+0x13f0]        # 3004 <__cxa_finalize@plt+0x1f24>
    1c14:	55                   	push   rbp
    1c15:	53                   	push   rbx
    1c16:	48 89 fb             	mov    rbx,rdi
    1c19:	48 81 ec b8 00 00 00 	sub    rsp,0xb8
    1c20:	48 c7 44 24 7c 00 00 	mov    QWORD PTR [rsp+0x7c],0x0
    1c27:	00 00 
    1c29:	48 8d 54 24 7c       	lea    rdx,[rsp+0x7c]
    1c2e:	e8 0d f4 ff ff       	call   1040 <__isoc99_fscanf@plt>
    1c33:	80 7c 24 7c 50       	cmp    BYTE PTR [rsp+0x7c],0x50
    1c38:	74 26                	je     1c60 <__cxa_finalize@plt+0xb80>
    1c3a:	48 8d 3d 27 14 00 00 	lea    rdi,[rip+0x1427]        # 3068 <__cxa_finalize@plt+0x1f88>
    1c41:	e8 0a f4 ff ff       	call   1050 <puts@plt>
    1c46:	bd 01 00 00 00       	mov    ebp,0x1
    1c4b:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
    1c52:	89 e8                	mov    eax,ebp
    1c54:	5b                   	pop    rbx
    1c55:	5d                   	pop    rbp
    1c56:	41 5c                	pop    r12
    1c58:	41 5d                	pop    r13
    1c5a:	41 5e                	pop    r14
    1c5c:	41 5f                	pop    r15
    1c5e:	c3                   	ret    
    1c5f:	90                   	nop
    1c60:	0f b6 6c 24 7d       	movzx  ebp,BYTE PTR [rsp+0x7d]
    1c65:	83 ed 33             	sub    ebp,0x33
    1c68:	75 d0                	jne    1c3a <__cxa_finalize@plt+0xb5a>
    1c6a:	48 8d 4c 24 68       	lea    rcx,[rsp+0x68]
    1c6f:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
    1c74:	48 89 df             	mov    rdi,rbx
    1c77:	31 c0                	xor    eax,eax
    1c79:	48 8d 35 88 13 00 00 	lea    rsi,[rip+0x1388]        # 3008 <__cxa_finalize@plt+0x1f28>
    1c80:	e8 bb f3 ff ff       	call   1040 <__isoc99_fscanf@plt>
    1c85:	4c 8b 6c 24 60       	mov    r13,QWORD PTR [rsp+0x60]
    1c8a:	4c 39 6c 24 68       	cmp    QWORD PTR [rsp+0x68],r13
    1c8f:	75 57                	jne    1ce8 <__cxa_finalize@plt+0xc08>
    1c91:	4d 85 ed             	test   r13,r13
    1c94:	74 52                	je     1ce8 <__cxa_finalize@plt+0xc08>
    1c96:	4d 8d 45 ff          	lea    r8,[r13-0x1]
    1c9a:	4d 21 e8             	and    r8,r13
    1c9d:	75 49                	jne    1ce8 <__cxa_finalize@plt+0xc08>
    1c9f:	49 81 fd 80 00 00 00 	cmp    r13,0x80
    1ca6:	77 58                	ja     1d00 <__cxa_finalize@plt+0xc20>
    1ca8:	31 c0                	xor    eax,eax
    1caa:	48 8d 54 24 5c       	lea    rdx,[rsp+0x5c]
    1caf:	48 89 df             	mov    rdi,rbx
    1cb2:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
    1cb6:	48 8d 35 75 13 00 00 	lea    rsi,[rip+0x1375]        # 3032 <__cxa_finalize@plt+0x1f52>
    1cbd:	e8 7e f3 ff ff       	call   1040 <__isoc99_fscanf@plt>
    1cc2:	81 7c 24 5c ff 00 00 	cmp    DWORD PTR [rsp+0x5c],0xff
    1cc9:	00 
    1cca:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
    1cce:	74 48                	je     1d18 <__cxa_finalize@plt+0xc38>
    1cd0:	48 8d 3d 39 13 00 00 	lea    rdi,[rip+0x1339]        # 3010 <__cxa_finalize@plt+0x1f30>
    1cd7:	e8 74 f3 ff ff       	call   1050 <puts@plt>
    1cdc:	e9 65 ff ff ff       	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1ce1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1ce8:	48 8d 3d c9 13 00 00 	lea    rdi,[rip+0x13c9]        # 30b8 <__cxa_finalize@plt+0x1fd8>
    1cef:	e8 5c f3 ff ff       	call   1050 <puts@plt>
    1cf4:	e9 4d ff ff ff       	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1cf9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1d00:	48 8d 3d f1 13 00 00 	lea    rdi,[rip+0x13f1]        # 30f8 <__cxa_finalize@plt+0x2018>
    1d07:	e8 44 f3 ff ff       	call   1050 <puts@plt>
    1d0c:	e9 35 ff ff ff       	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1d11:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1d18:	4c 89 e8             	mov    rax,r13
    1d1b:	45 89 ee             	mov    r14d,r13d
    1d1e:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
    1d23:	45 31 ff             	xor    r15d,r15d
    1d26:	49 0f af c5          	imul   rax,r13
    1d2a:	45 0f af f5          	imul   r14d,r13d
    1d2e:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
    1d33:	48 c1 e0 02          	shl    rax,0x2
    1d37:	48 89 c7             	mov    rdi,rax
    1d3a:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    1d3f:	4d 63 f6             	movsxd r14,r14d
    1d42:	e8 59 f3 ff ff       	call   10a0 <malloc@plt>
    1d47:	48 8d 8c 24 84 00 00 	lea    rcx,[rsp+0x84]
    1d4e:	00 
    1d4f:	44 89 6c 24 4c       	mov    DWORD PTR [rsp+0x4c],r13d
    1d54:	48 89 c6             	mov    rsi,rax
    1d57:	48 89 0c 24          	mov    QWORD PTR [rsp],rcx
    1d5b:	48 8d 84 24 90 00 00 	lea    rax,[rsp+0x90]
    1d62:	00 
    1d63:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
    1d68:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    1d6d:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
    1d72:	4c 89 6c 24 20       	mov    QWORD PTR [rsp+0x20],r13
    1d77:	49 89 f5             	mov    r13,rsi
    1d7a:	89 6c 24 48          	mov    DWORD PTR [rsp+0x48],ebp
    1d7e:	4c 89 fd             	mov    rbp,r15
    1d81:	49 89 cf             	mov    r15,rcx
    1d84:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
    1d89:	49 89 c4             	mov    r12,rax
    1d8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1d90:	48 8b 0c 24          	mov    rcx,QWORD PTR [rsp]
    1d94:	4c 89 fa             	mov    rdx,r15
    1d97:	4d 89 e0             	mov    r8,r12
    1d9a:	48 89 df             	mov    rdi,rbx
    1d9d:	48 8d 35 88 12 00 00 	lea    rsi,[rip+0x1288]        # 302c <__cxa_finalize@plt+0x1f4c>
    1da4:	31 c0                	xor    eax,eax
    1da6:	e8 95 f2 ff ff       	call   1040 <__isoc99_fscanf@plt>
    1dab:	8b 44 24 70          	mov    eax,DWORD PTR [rsp+0x70]
    1daf:	8b 94 24 84 00 00 00 	mov    edx,DWORD PTR [rsp+0x84]
    1db6:	49 89 ea             	mov    r10,rbp
    1db9:	c1 e0 10             	shl    eax,0x10
    1dbc:	c1 e2 08             	shl    edx,0x8
    1dbf:	09 d0                	or     eax,edx
    1dc1:	0b 84 24 90 00 00 00 	or     eax,DWORD PTR [rsp+0x90]
    1dc8:	41 89 44 ad 00       	mov    DWORD PTR [r13+rbp*4+0x0],eax
    1dcd:	48 8d 6d 01          	lea    rbp,[rbp+0x1]
    1dd1:	49 39 ee             	cmp    r14,rbp
    1dd4:	75 ba                	jne    1d90 <__cxa_finalize@plt+0xcb0>
    1dd6:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    1ddb:	8b 6c 24 48          	mov    ebp,DWORD PTR [rsp+0x48]
    1ddf:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
    1de4:	4c 8b 6c 24 20       	mov    r13,QWORD PTR [rsp+0x20]
    1de9:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
    1dee:	4c 89 54 24 20       	mov    QWORD PTR [rsp+0x20],r10
    1df3:	e8 a8 f2 ff ff       	call   10a0 <malloc@plt>
    1df8:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
    1dfd:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
    1e02:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
    1e07:	49 0f bd d5          	bsr    rdx,r13
    1e0b:	49 89 c6             	mov    r14,rax
    1e0e:	b8 3f 00 00 00       	mov    eax,0x3f
    1e13:	45 89 eb             	mov    r11d,r13d
    1e16:	48 83 f2 3f          	xor    rdx,0x3f
    1e1a:	4c 8b 54 24 20       	mov    r10,QWORD PTR [rsp+0x20]
    1e1f:	29 d0                	sub    eax,edx
    1e21:	0f b6 c0             	movzx  eax,al
    1e24:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
    1e28:	89 c3                	mov    ebx,eax
    1e2a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1e30:	44 89 c1             	mov    ecx,r8d
    1e33:	41 80 fb 01          	cmp    r11b,0x1
    1e37:	0f 84 9b 00 00 00    	je     1ed8 <__cxa_finalize@plt+0xdf8>
    1e3d:	45 31 c9             	xor    r9d,r9d
    1e40:	31 ff                	xor    edi,edi
    1e42:	ba 01 00 00 00       	mov    edx,0x1
    1e47:	eb 1f                	jmp    1e68 <__cxa_finalize@plt+0xd88>
    1e49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1e50:	66 85 c0             	test   ax,ax
    1e53:	75 6b                	jne    1ec0 <__cxa_finalize@plt+0xde0>
    1e55:	44 89 c8             	mov    eax,r9d
    1e58:	41 89 f9             	mov    r9d,edi
    1e5b:	89 c7                	mov    edi,eax
    1e5d:	01 d2                	add    edx,edx
    1e5f:	66 c1 e9 02          	shr    cx,0x2
    1e63:	44 38 da             	cmp    dl,r11b
    1e66:	73 29                	jae    1e91 <__cxa_finalize@plt+0xdb1>
    1e68:	89 c8                	mov    eax,ecx
    1e6a:	66 d1 e8             	shr    ax,1
    1e6d:	83 e0 01             	and    eax,0x1
    1e70:	41 89 c7             	mov    r15d,eax
    1e73:	41 31 cf             	xor    r15d,ecx
    1e76:	41 83 e7 01          	and    r15d,0x1
    1e7a:	74 d4                	je     1e50 <__cxa_finalize@plt+0xd70>
    1e7c:	01 d7                	add    edi,edx
    1e7e:	66 85 c0             	test   ax,ax
    1e81:	74 da                	je     1e5d <__cxa_finalize@plt+0xd7d>
    1e83:	41 01 d1             	add    r9d,edx
    1e86:	01 d2                	add    edx,edx
    1e88:	66 c1 e9 02          	shr    cx,0x2
    1e8c:	44 38 da             	cmp    dl,r11b
    1e8f:	72 d7                	jb     1e68 <__cxa_finalize@plt+0xd88>
    1e91:	40 0f b6 ff          	movzx  edi,dil
    1e95:	89 d9                	mov    ecx,ebx
    1e97:	45 0f b6 c9          	movzx  r9d,r9b
    1e9b:	d3 e7                	shl    edi,cl
    1e9d:	44 09 cf             	or     edi,r9d
    1ea0:	48 63 ff             	movsxd rdi,edi
    1ea3:	48 8d 04 be          	lea    rax,[rsi+rdi*4]
    1ea7:	8b 00                	mov    eax,DWORD PTR [rax]
    1ea9:	43 89 04 86          	mov    DWORD PTR [r14+r8*4],eax
    1ead:	49 8d 40 01          	lea    rax,[r8+0x1]
    1eb1:	4d 39 c2             	cmp    r10,r8
    1eb4:	74 2a                	je     1ee0 <__cxa_finalize@plt+0xe00>
    1eb6:	49 89 c0             	mov    r8,rax
    1eb9:	e9 72 ff ff ff       	jmp    1e30 <__cxa_finalize@plt+0xd50>
    1ebe:	66 90                	xchg   ax,ax
    1ec0:	8d 42 ff             	lea    eax,[rdx-0x1]
    1ec3:	41 89 c7             	mov    r15d,eax
    1ec6:	29 f8                	sub    eax,edi
    1ec8:	45 29 cf             	sub    r15d,r9d
    1ecb:	41 89 c1             	mov    r9d,eax
    1ece:	44 89 ff             	mov    edi,r15d
    1ed1:	eb b0                	jmp    1e83 <__cxa_finalize@plt+0xda3>
    1ed3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1ed8:	48 89 f0             	mov    rax,rsi
    1edb:	eb ca                	jmp    1ea7 <__cxa_finalize@plt+0xdc7>
    1edd:	0f 1f 00             	nop    DWORD PTR [rax]
    1ee0:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
    1ee5:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
    1eea:	45 31 ff             	xor    r15d,r15d
    1eed:	48 8d 04 40          	lea    rax,[rax+rax*2]
    1ef1:	4c 01 e8             	add    rax,r13
    1ef4:	48 89 c7             	mov    rdi,rax
    1ef7:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    1efc:	e8 9f f1 ff ff       	call   10a0 <malloc@plt>
    1f01:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
    1f06:	8b 5c 24 4c          	mov    ebx,DWORD PTR [rsp+0x4c]
    1f0a:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
    1f0f:	48 89 c7             	mov    rdi,rax
    1f12:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    1f17:	44 8b 64 24 48       	mov    r12d,DWORD PTR [rsp+0x48]
    1f1c:	89 6c 24 28          	mov    DWORD PTR [rsp+0x28],ebp
    1f20:	44 89 fd             	mov    ebp,r15d
    1f23:	45 89 ef             	mov    r15d,r13d
    1f26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1f2d:	00 00 00 
    1f30:	85 ed                	test   ebp,ebp
    1f32:	0f 84 38 01 00 00    	je     2070 <__cxa_finalize@plt+0xf90>
    1f38:	44 89 e1             	mov    ecx,r12d
    1f3b:	8d 45 ff             	lea    eax,[rbp-0x1]
    1f3e:	d3 e0                	shl    eax,cl
    1f40:	48 98                	cdqe   
    1f42:	49 8d 34 86          	lea    rsi,[r14+rax*4]
    1f46:	89 e8                	mov    eax,ebp
    1f48:	83 c5 01             	add    ebp,0x1
    1f4b:	d3 e0                	shl    eax,cl
    1f4d:	48 89 f1             	mov    rcx,rsi
    1f50:	89 de                	mov    esi,ebx
    1f52:	48 98                	cdqe   
    1f54:	49 8d 14 86          	lea    rdx,[r14+rax*4]
    1f58:	e8 73 fa ff ff       	call   19d0 <__cxa_finalize@plt+0x8f0>
    1f5d:	48 89 c7             	mov    rdi,rax
    1f60:	66 44 39 fd          	cmp    bp,r15w
    1f64:	72 ca                	jb     1f30 <__cxa_finalize@plt+0xe50>
    1f66:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
    1f6a:	4c 8b 64 24 38       	mov    r12,QWORD PTR [rsp+0x38]
    1f6f:	ba 01 00 00 00       	mov    edx,0x1
    1f74:	41 0f cd             	bswap  r13d
    1f77:	be 08 00 00 00       	mov    esi,0x8
    1f7c:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
    1f81:	8b 6c 24 28          	mov    ebp,DWORD PTR [rsp+0x28]
    1f85:	48 b8 89 50 4e 47 0d 	movabs rax,0xa1a0a0d474e5089
    1f8c:	0a 1a 0a 
    1f8f:	4c 89 e1             	mov    rcx,r12
    1f92:	48 89 84 24 84 00 00 	mov    QWORD PTR [rsp+0x84],rax
    1f99:	00 
    1f9a:	c6 84 24 8c 00 00 00 	mov    BYTE PTR [rsp+0x8c],0x0
    1fa1:	00 
    1fa2:	e8 29 f1 ff ff       	call   10d0 <fwrite@plt>
    1fa7:	66 41 0f 6e cd       	movd   xmm1,r13d
    1fac:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
    1fb1:	4c 89 e2             	mov    rdx,r12
    1fb4:	66 0f 70 c1 e0       	pshufd xmm0,xmm1,0xe0
    1fb9:	be 0d 00 00 00       	mov    esi,0xd
    1fbe:	48 c7 84 24 9d 00 00 	mov    QWORD PTR [rsp+0x9d],0x0
    1fc5:	00 00 00 00 00 
    1fca:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x52444849
    1fd1:	00 49 48 44 52 
    1fd6:	c7 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],0xc0000208
    1fdd:	08 02 00 c0 
    1fe1:	66 0f d6 84 24 94 00 	movq   QWORD PTR [rsp+0x94],xmm0
    1fe8:	00 00 
    1fea:	c6 84 24 a0 00 00 00 	mov    BYTE PTR [rsp+0xa0],0xde
    1ff1:	de 
    1ff2:	e8 89 f6 ff ff       	call   1680 <__cxa_finalize@plt+0x5a0>
    1ff7:	4c 8b 74 24 08       	mov    r14,QWORD PTR [rsp+0x8]
    1ffc:	4c 89 f7             	mov    rdi,r14
    1fff:	e8 ac f0 ff ff       	call   10b0 <compressBound@plt>
    2004:	48 8d 78 04          	lea    rdi,[rax+0x4]
    2008:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
    200d:	e8 8e f0 ff ff       	call   10a0 <malloc@plt>
    2012:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
    2017:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
    201c:	4c 89 f1             	mov    rcx,r14
    201f:	c7 00 49 44 41 54    	mov    DWORD PTR [rax],0x54414449
    2025:	48 8d 78 04          	lea    rdi,[rax+0x4]
    2029:	49 89 c5             	mov    r13,rax
    202c:	e8 ff ef ff ff       	call   1030 <compress@plt>
    2031:	8b 74 24 70          	mov    esi,DWORD PTR [rsp+0x70]
    2035:	4c 89 e2             	mov    rdx,r12
    2038:	4c 89 ef             	mov    rdi,r13
    203b:	e8 40 f6 ff ff       	call   1680 <__cxa_finalize@plt+0x5a0>
    2040:	4c 89 e2             	mov    rdx,r12
    2043:	31 f6                	xor    esi,esi
    2045:	48 8d 3d e9 0f 00 00 	lea    rdi,[rip+0xfe9]        # 3035 <__cxa_finalize@plt+0x1f55>
    204c:	e8 2f f6 ff ff       	call   1680 <__cxa_finalize@plt+0x5a0>
    2051:	48 89 df             	mov    rdi,rbx
    2054:	e8 17 f0 ff ff       	call   1070 <fclose@plt>
    2059:	4c 89 e7             	mov    rdi,r12
    205c:	e8 0f f0 ff ff       	call   1070 <fclose@plt>
    2061:	e9 e5 fb ff ff       	jmp    1c4b <__cxa_finalize@plt+0xb6b>
    2066:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    206d:	00 00 00 
    2070:	31 c9                	xor    ecx,ecx
    2072:	4c 89 f2             	mov    rdx,r14
    2075:	89 de                	mov    esi,ebx
    2077:	e8 54 f9 ff ff       	call   19d0 <__cxa_finalize@plt+0x8f0>
    207c:	48 89 c7             	mov    rdi,rax
    207f:	66 41 83 ff 01       	cmp    r15w,0x1
    2084:	0f 84 dc fe ff ff    	je     1f66 <__cxa_finalize@plt+0xe86>
    208a:	bd 01 00 00 00       	mov    ebp,0x1
    208f:	e9 a4 fe ff ff       	jmp    1f38 <__cxa_finalize@plt+0xe58>
    2094:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    209b:	00 00 00 00 
    209f:	90                   	nop
    20a0:	48 89 fe             	mov    rsi,rdi
    20a3:	31 c0                	xor    eax,eax
    20a5:	48 8d 3d 84 10 00 00 	lea    rdi,[rip+0x1084]        # 3130 <__cxa_finalize@plt+0x2050>
    20ac:	e9 cf ef ff ff       	jmp    1080 <printf@plt>

Disassembly of section .fini:

00000000000020b4 <.fini>:
    20b4:	48 83 ec 08          	sub    rsp,0x8
    20b8:	48 83 c4 08          	add    rsp,0x8
    20bc:	c3                   	ret    
