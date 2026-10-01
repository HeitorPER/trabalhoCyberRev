
inputs/png2:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	sub    rsp,0x8
    1004:	mov    rax,QWORD PTR [rip+0x3fc5]        # 4fd0 <__cxa_finalize@plt+0x3ef0>
    100b:	test   rax,rax
    100e:	je     1012 <compress@plt-0x1e>
    1010:	call   rax
    1012:	add    rsp,0x8
    1016:	ret    

Disassembly of section .plt:

0000000000001020 <compress@plt-0x10>:
    1020:	push   QWORD PTR [rip+0x3fca]        # 4ff0 <__cxa_finalize@plt+0x3f10>
    1026:	jmp    QWORD PTR [rip+0x3fcc]        # 4ff8 <__cxa_finalize@plt+0x3f18>
    102c:	nop    DWORD PTR [rax+0x0]

0000000000001030 <compress@plt>:
    1030:	jmp    QWORD PTR [rip+0x3fca]        # 5000 <__cxa_finalize@plt+0x3f20>
    1036:	push   0x0
    103b:	jmp    1020 <compress@plt-0x10>

0000000000001040 <__isoc99_fscanf@plt>:
    1040:	jmp    QWORD PTR [rip+0x3fc2]        # 5008 <__cxa_finalize@plt+0x3f28>
    1046:	push   0x1
    104b:	jmp    1020 <compress@plt-0x10>

0000000000001050 <puts@plt>:
    1050:	jmp    QWORD PTR [rip+0x3fba]        # 5010 <__cxa_finalize@plt+0x3f30>
    1056:	push   0x2
    105b:	jmp    1020 <compress@plt-0x10>

0000000000001060 <pow@plt>:
    1060:	jmp    QWORD PTR [rip+0x3fb2]        # 5018 <__cxa_finalize@plt+0x3f38>
    1066:	push   0x3
    106b:	jmp    1020 <compress@plt-0x10>

0000000000001070 <fclose@plt>:
    1070:	jmp    QWORD PTR [rip+0x3faa]        # 5020 <__cxa_finalize@plt+0x3f40>
    1076:	push   0x4
    107b:	jmp    1020 <compress@plt-0x10>

0000000000001080 <printf@plt>:
    1080:	jmp    QWORD PTR [rip+0x3fa2]        # 5028 <__cxa_finalize@plt+0x3f48>
    1086:	push   0x5
    108b:	jmp    1020 <compress@plt-0x10>

0000000000001090 <strcmp@plt>:
    1090:	jmp    QWORD PTR [rip+0x3f9a]        # 5030 <__cxa_finalize@plt+0x3f50>
    1096:	push   0x6
    109b:	jmp    1020 <compress@plt-0x10>

00000000000010a0 <malloc@plt>:
    10a0:	jmp    QWORD PTR [rip+0x3f92]        # 5038 <__cxa_finalize@plt+0x3f58>
    10a6:	push   0x7
    10ab:	jmp    1020 <compress@plt-0x10>

00000000000010b0 <compressBound@plt>:
    10b0:	jmp    QWORD PTR [rip+0x3f8a]        # 5040 <__cxa_finalize@plt+0x3f60>
    10b6:	push   0x8
    10bb:	jmp    1020 <compress@plt-0x10>

00000000000010c0 <fopen@plt>:
    10c0:	jmp    QWORD PTR [rip+0x3f82]        # 5048 <__cxa_finalize@plt+0x3f68>
    10c6:	push   0x9
    10cb:	jmp    1020 <compress@plt-0x10>

00000000000010d0 <fwrite@plt>:
    10d0:	jmp    QWORD PTR [rip+0x3f7a]        # 5050 <__cxa_finalize@plt+0x3f70>
    10d6:	push   0xa
    10db:	jmp    1020 <compress@plt-0x10>

Disassembly of section .plt.got:

00000000000010e0 <__cxa_finalize@plt>:
    10e0:	jmp    QWORD PTR [rip+0x3efa]        # 4fe0 <__cxa_finalize@plt+0x3f00>
    10e6:	xchg   ax,ax

Disassembly of section .text:

00000000000010f0 <.text>:
    10f0:	push   r13
    10f2:	push   r12
    10f4:	push   rbp
    10f5:	push   rbx
    10f6:	mov    rbx,rsi
    10f9:	sub    rsp,0x8
    10fd:	cmp    edi,0x4
    1100:	jne    1160 <__cxa_finalize@plt+0x80>
    1102:	mov    rdi,QWORD PTR [rsi+0x10]
    1106:	lea    rsi,[rip+0x1f2d]        # 303a <__cxa_finalize@plt+0x1f5a>
    110d:	call   10c0 <fopen@plt>
    1112:	mov    r12,rax
    1115:	test   rax,rax
    1118:	je     11a1 <__cxa_finalize@plt+0xc1>
    111e:	mov    rdi,QWORD PTR [rbx+0x18]
    1122:	lea    rsi,[rip+0x1f27]        # 3050 <__cxa_finalize@plt+0x1f70>
    1129:	call   10c0 <fopen@plt>
    112e:	mov    rbp,rax
    1131:	test   rax,rax
    1134:	je     11b5 <__cxa_finalize@plt+0xd5>
    1136:	mov    r13,QWORD PTR [rbx+0x8]
    113a:	lea    rsi,[rip+0x1f12]        # 3053 <__cxa_finalize@plt+0x1f73>
    1141:	mov    rdi,r13
    1144:	call   1090 <strcmp@plt>
    1149:	test   eax,eax
    114b:	je     118f <__cxa_finalize@plt+0xaf>
    114d:	lea    rsi,[rip+0x1f06]        # 305a <__cxa_finalize@plt+0x1f7a>
    1154:	mov    rdi,r13
    1157:	call   1090 <strcmp@plt>
    115c:	test   eax,eax
    115e:	je     1181 <__cxa_finalize@plt+0xa1>
    1160:	mov    rsi,QWORD PTR [rbx]
    1163:	lea    rdi,[rip+0x1fc6]        # 3130 <__cxa_finalize@plt+0x2050>
    116a:	xor    eax,eax
    116c:	call   1080 <printf@plt>
    1171:	add    rsp,0x8
    1175:	mov    eax,0x1
    117a:	pop    rbx
    117b:	pop    rbp
    117c:	pop    r12
    117e:	pop    r13
    1180:	ret    
    1181:	lea    rdi,[rip+0x1fd8]        # 3160 <__cxa_finalize@plt+0x2080>
    1188:	call   1050 <puts@plt>
    118d:	jmp    1171 <__cxa_finalize@plt+0x91>
    118f:	pop    rax
    1190:	mov    rsi,rbp
    1193:	pop    rbx
    1194:	mov    rdi,r12
    1197:	pop    rbp
    1198:	pop    r12
    119a:	pop    r13
    119c:	jmp    1c00 <__cxa_finalize@plt+0xb20>
    11a1:	mov    rsi,QWORD PTR [rbx+0x10]
    11a5:	lea    rdi,[rip+0x1e91]        # 303d <__cxa_finalize@plt+0x1f5d>
    11ac:	xor    eax,eax
    11ae:	call   1080 <printf@plt>
    11b3:	jmp    1171 <__cxa_finalize@plt+0x91>
    11b5:	mov    rsi,QWORD PTR [rbx+0x18]
    11b9:	lea    rdi,[rip+0x1e7d]        # 303d <__cxa_finalize@plt+0x1f5d>
    11c0:	xor    eax,eax
    11c2:	call   1080 <printf@plt>
    11c7:	jmp    1171 <__cxa_finalize@plt+0x91>
    11c9:	nop    DWORD PTR [rax+0x0]
    11d0:	xor    ebp,ebp
    11d2:	mov    r9,rdx
    11d5:	pop    rsi
    11d6:	mov    rdx,rsp
    11d9:	and    rsp,0xfffffffffffffff0
    11dd:	push   rax
    11de:	push   rsp
    11df:	xor    r8d,r8d
    11e2:	xor    ecx,ecx
    11e4:	lea    rdi,[rip+0xffffffffffffff05]        # 10f0 <__cxa_finalize@plt+0x10>
    11eb:	call   QWORD PTR [rip+0x3dcf]        # 4fc0 <__cxa_finalize@plt+0x3ee0>
    11f1:	hlt    
    11f2:	cs nop WORD PTR [rax+rax*1+0x0]
    11fc:	nop    DWORD PTR [rax+0x0]
    1200:	lea    rdi,[rip+0x3ed1]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    1207:	lea    rax,[rip+0x3eca]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    120e:	cmp    rax,rdi
    1211:	je     1228 <__cxa_finalize@plt+0x148>
    1213:	mov    rax,QWORD PTR [rip+0x3dae]        # 4fc8 <__cxa_finalize@plt+0x3ee8>
    121a:	test   rax,rax
    121d:	je     1228 <__cxa_finalize@plt+0x148>
    121f:	jmp    rax
    1221:	nop    DWORD PTR [rax+0x0]
    1228:	ret    
    1229:	nop    DWORD PTR [rax+0x0]
    1230:	lea    rdi,[rip+0x3ea1]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    1237:	lea    rsi,[rip+0x3e9a]        # 50d8 <__cxa_finalize@plt+0x3ff8>
    123e:	sub    rsi,rdi
    1241:	mov    rax,rsi
    1244:	shr    rsi,0x3f
    1248:	sar    rax,0x3
    124c:	add    rsi,rax
    124f:	sar    rsi,1
    1252:	je     1268 <__cxa_finalize@plt+0x188>
    1254:	mov    rax,QWORD PTR [rip+0x3d7d]        # 4fd8 <__cxa_finalize@plt+0x3ef8>
    125b:	test   rax,rax
    125e:	je     1268 <__cxa_finalize@plt+0x188>
    1260:	jmp    rax
    1262:	nop    WORD PTR [rax+rax*1+0x0]
    1268:	ret    
    1269:	nop    DWORD PTR [rax+0x0]
    1270:	endbr64 
    1274:	cmp    BYTE PTR [rip+0x3e65],0x0        # 50e0 <__cxa_finalize@plt+0x4000>
    127b:	jne    12a8 <__cxa_finalize@plt+0x1c8>
    127d:	push   rbp
    127e:	cmp    QWORD PTR [rip+0x3d5a],0x0        # 4fe0 <__cxa_finalize@plt+0x3f00>
    1286:	mov    rbp,rsp
    1289:	je     1297 <__cxa_finalize@plt+0x1b7>
    128b:	mov    rdi,QWORD PTR [rip+0x3dd6]        # 5068 <__cxa_finalize@plt+0x3f88>
    1292:	call   10e0 <__cxa_finalize@plt>
    1297:	call   1200 <__cxa_finalize@plt+0x120>
    129c:	mov    BYTE PTR [rip+0x3e3d],0x1        # 50e0 <__cxa_finalize@plt+0x4000>
    12a3:	pop    rbp
    12a4:	ret    
    12a5:	nop    DWORD PTR [rax]
    12a8:	ret    
    12a9:	nop    DWORD PTR [rax+0x0]
    12b0:	endbr64 
    12b4:	jmp    1230 <__cxa_finalize@plt+0x150>
    12b9:	nop    DWORD PTR [rax+0x0]
    12c0:	mov    eax,edi
    12c2:	ret    
    12c3:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12ce:	xchg   ax,ax
    12d0:	mov    eax,edi
    12d2:	sub    eax,esi
    12d4:	ret    
    12d5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12e0:	mov    eax,edi
    12e2:	sub    eax,edx
    12e4:	ret    
    12e5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12f0:	mov    eax,esi
    12f2:	xor    eax,edi
    12f4:	ret    
    12f5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1300:	mov    eax,edx
    1302:	xor    eax,edi
    1304:	ret    
    1305:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1310:	xor    ecx,esi
    1312:	xor    ecx,edx
    1314:	mov    eax,ecx
    1316:	xor    eax,edi
    1318:	ret    
    1319:	nop    DWORD PTR [rax+0x0]
    1320:	mov    eax,edi
    1322:	sub    eax,r8d
    1325:	ret    
    1326:	cs nop WORD PTR [rax+rax*1+0x0]
    1330:	mov    eax,edi
    1332:	sub    eax,r9d
    1335:	ret    
    1336:	cs nop WORD PTR [rax+rax*1+0x0]
    1340:	mov    eax,r8d
    1343:	xor    eax,edi
    1345:	ret    
    1346:	cs nop WORD PTR [rax+rax*1+0x0]
    1350:	mov    eax,r9d
    1353:	xor    eax,edi
    1355:	ret    
    1356:	cs nop WORD PTR [rax+rax*1+0x0]
    1360:	xor    r9d,r8d
    1363:	xor    r9d,esi
    1366:	mov    eax,r9d
    1369:	xor    eax,edi
    136b:	ret    
    136c:	nop    DWORD PTR [rax+0x0]
    1370:	xor    eax,eax
    1372:	lea    rdi,[rip+0x3da7]        # 5120 <__cxa_finalize@plt+0x4040>
    1379:	mov    esi,0xedb88320
    137e:	xchg   ax,ax
    1380:	mov    rdx,rax
    1383:	shr    rdx,1
    1386:	test   al,0x1
    1388:	je     138d <__cxa_finalize@plt+0x2ad>
    138a:	xor    rdx,rsi
    138d:	mov    rcx,rdx
    1390:	shr    rcx,1
    1393:	and    edx,0x1
    1396:	je     139b <__cxa_finalize@plt+0x2bb>
    1398:	xor    rcx,rsi
    139b:	mov    rdx,rcx
    139e:	shr    rdx,1
    13a1:	and    ecx,0x1
    13a4:	je     13a9 <__cxa_finalize@plt+0x2c9>
    13a6:	xor    rdx,rsi
    13a9:	mov    rcx,rdx
    13ac:	shr    rcx,1
    13af:	and    edx,0x1
    13b2:	je     13b7 <__cxa_finalize@plt+0x2d7>
    13b4:	xor    rcx,rsi
    13b7:	mov    rdx,rcx
    13ba:	shr    rdx,1
    13bd:	and    ecx,0x1
    13c0:	je     13c5 <__cxa_finalize@plt+0x2e5>
    13c2:	xor    rdx,rsi
    13c5:	mov    rcx,rdx
    13c8:	shr    rcx,1
    13cb:	and    edx,0x1
    13ce:	je     13d3 <__cxa_finalize@plt+0x2f3>
    13d0:	xor    rcx,rsi
    13d3:	mov    rdx,rcx
    13d6:	shr    rdx,1
    13d9:	and    ecx,0x1
    13dc:	je     13e1 <__cxa_finalize@plt+0x301>
    13de:	xor    rdx,rsi
    13e1:	mov    rcx,rdx
    13e4:	shr    rcx,1
    13e7:	and    edx,0x1
    13ea:	je     13ef <__cxa_finalize@plt+0x30f>
    13ec:	xor    rcx,rsi
    13ef:	mov    QWORD PTR [rdi+rax*8],rcx
    13f3:	add    rax,0x1
    13f7:	cmp    rax,0x100
    13fd:	jne    1380 <__cxa_finalize@plt+0x2a0>
    13ff:	mov    DWORD PTR [rip+0x3cf7],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    1409:	ret    
    140a:	nop    WORD PTR [rax+rax*1+0x0]
    1410:	mov    ecx,DWORD PTR [rip+0x3cea]        # 5100 <__cxa_finalize@plt+0x4020>
    1416:	mov    rax,rdi
    1419:	mov    r10,rsi
    141c:	test   ecx,ecx
    141e:	jne    14c7 <__cxa_finalize@plt+0x3e7>
    1424:	xor    ecx,ecx
    1426:	lea    r9,[rip+0x3cf3]        # 5120 <__cxa_finalize@plt+0x4040>
    142d:	mov    r8d,0xedb88320
    1433:	nop    DWORD PTR [rax+rax*1+0x0]
    1438:	mov    rsi,rcx
    143b:	shr    rsi,1
    143e:	test   cl,0x1
    1441:	je     1446 <__cxa_finalize@plt+0x366>
    1443:	xor    rsi,r8
    1446:	mov    rdi,rsi
    1449:	shr    rdi,1
    144c:	and    esi,0x1
    144f:	je     1454 <__cxa_finalize@plt+0x374>
    1451:	xor    rdi,r8
    1454:	mov    rsi,rdi
    1457:	shr    rsi,1
    145a:	and    edi,0x1
    145d:	je     1462 <__cxa_finalize@plt+0x382>
    145f:	xor    rsi,r8
    1462:	mov    rdi,rsi
    1465:	shr    rdi,1
    1468:	and    esi,0x1
    146b:	je     1470 <__cxa_finalize@plt+0x390>
    146d:	xor    rdi,r8
    1470:	mov    rsi,rdi
    1473:	shr    rsi,1
    1476:	and    edi,0x1
    1479:	je     147e <__cxa_finalize@plt+0x39e>
    147b:	xor    rsi,r8
    147e:	mov    rdi,rsi
    1481:	shr    rdi,1
    1484:	and    esi,0x1
    1487:	je     148c <__cxa_finalize@plt+0x3ac>
    1489:	xor    rdi,r8
    148c:	mov    rsi,rdi
    148f:	shr    rsi,1
    1492:	and    edi,0x1
    1495:	je     149a <__cxa_finalize@plt+0x3ba>
    1497:	xor    rsi,r8
    149a:	mov    rdi,rsi
    149d:	shr    rdi,1
    14a0:	and    esi,0x1
    14a3:	je     14a8 <__cxa_finalize@plt+0x3c8>
    14a5:	xor    rdi,r8
    14a8:	mov    QWORD PTR [r9+rcx*8],rdi
    14ac:	add    rcx,0x1
    14b0:	cmp    rcx,0x100
    14b7:	jne    1438 <__cxa_finalize@plt+0x358>
    14bd:	mov    DWORD PTR [rip+0x3c39],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    14c7:	test   edx,edx
    14c9:	jle    14f9 <__cxa_finalize@plt+0x419>
    14cb:	movsxd rdx,edx
    14ce:	mov    rcx,r10
    14d1:	lea    r9,[rip+0x3c48]        # 5120 <__cxa_finalize@plt+0x4040>
    14d8:	lea    rsi,[r10+rdx*1]
    14dc:	nop    DWORD PTR [rax+0x0]
    14e0:	movzx  edx,BYTE PTR [rcx]
    14e3:	add    rcx,0x1
    14e7:	xor    edx,eax
    14e9:	shr    rax,0x8
    14ed:	movzx  edx,dl
    14f0:	xor    rax,QWORD PTR [r9+rdx*8]
    14f4:	cmp    rcx,rsi
    14f7:	jne    14e0 <__cxa_finalize@plt+0x400>
    14f9:	ret    
    14fa:	nop    WORD PTR [rax+rax*1+0x0]
    1500:	mov    eax,DWORD PTR [rip+0x3bfa]        # 5100 <__cxa_finalize@plt+0x4020>
    1506:	test   eax,eax
    1508:	jne    15a9 <__cxa_finalize@plt+0x4c9>
    150e:	xor    eax,eax
    1510:	lea    r9,[rip+0x3c09]        # 5120 <__cxa_finalize@plt+0x4040>
    1517:	mov    r8d,0xedb88320
    151d:	nop    DWORD PTR [rax]
    1520:	mov    rdx,rax
    1523:	shr    rdx,1
    1526:	test   al,0x1
    1528:	je     152d <__cxa_finalize@plt+0x44d>
    152a:	xor    rdx,r8
    152d:	mov    rcx,rdx
    1530:	shr    rcx,1
    1533:	and    edx,0x1
    1536:	je     153b <__cxa_finalize@plt+0x45b>
    1538:	xor    rcx,r8
    153b:	mov    rdx,rcx
    153e:	shr    rdx,1
    1541:	and    ecx,0x1
    1544:	je     1549 <__cxa_finalize@plt+0x469>
    1546:	xor    rdx,r8
    1549:	mov    rcx,rdx
    154c:	shr    rcx,1
    154f:	and    edx,0x1
    1552:	je     1557 <__cxa_finalize@plt+0x477>
    1554:	xor    rcx,r8
    1557:	mov    rdx,rcx
    155a:	shr    rdx,1
    155d:	and    ecx,0x1
    1560:	je     1565 <__cxa_finalize@plt+0x485>
    1562:	xor    rdx,r8
    1565:	mov    rcx,rdx
    1568:	shr    rcx,1
    156b:	and    edx,0x1
    156e:	je     1573 <__cxa_finalize@plt+0x493>
    1570:	xor    rcx,r8
    1573:	mov    rdx,rcx
    1576:	shr    rdx,1
    1579:	and    ecx,0x1
    157c:	je     1581 <__cxa_finalize@plt+0x4a1>
    157e:	xor    rdx,r8
    1581:	mov    rcx,rdx
    1584:	shr    rcx,1
    1587:	and    edx,0x1
    158a:	je     158f <__cxa_finalize@plt+0x4af>
    158c:	xor    rcx,r8
    158f:	mov    QWORD PTR [r9+rax*8],rcx
    1593:	add    rax,0x1
    1597:	cmp    rax,0x100
    159d:	jne    1520 <__cxa_finalize@plt+0x440>
    159f:	mov    DWORD PTR [rip+0x3b57],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    15a9:	test   esi,esi
    15ab:	jle    15ea <__cxa_finalize@plt+0x50a>
    15ad:	movsxd rsi,esi
    15b0:	mov    rdx,rdi
    15b3:	mov    eax,0xffffffff
    15b8:	add    rsi,rdi
    15bb:	lea    r9,[rip+0x3b5e]        # 5120 <__cxa_finalize@plt+0x4040>
    15c2:	nop    WORD PTR [rax+rax*1+0x0]
    15c8:	movzx  ecx,BYTE PTR [rdx]
    15cb:	add    rdx,0x1
    15cf:	xor    ecx,eax
    15d1:	shr    rax,0x8
    15d5:	movzx  ecx,cl
    15d8:	xor    rax,QWORD PTR [r9+rcx*8]
    15dc:	cmp    rdx,rsi
    15df:	jne    15c8 <__cxa_finalize@plt+0x4e8>
    15e1:	mov    edx,0xffffffff
    15e6:	xor    rax,rdx
    15e9:	ret    
    15ea:	xor    eax,eax
    15ec:	ret    
    15ed:	nop    DWORD PTR [rax]
    15f0:	mov    BYTE PTR [rcx],0x0
    15f3:	mov    r9,rcx
    15f6:	mov    r8,rdx
    15f9:	mov    r10d,edi
    15fc:	mov    BYTE PTR [rdx],0x0
    15ff:	mov    ecx,0x1
    1604:	cmp    dil,0x1
    1608:	ja     163b <__cxa_finalize@plt+0x55b>
    160a:	jmp    1670 <__cxa_finalize@plt+0x590>
    160c:	nop    DWORD PTR [rax+0x0]
    1610:	test   ax,ax
    1613:	jne    1658 <__cxa_finalize@plt+0x578>
    1615:	movzx  edx,BYTE PTR [r9]
    1619:	xor    dl,BYTE PTR [r8]
    161c:	mov    BYTE PTR [r8],dl
    161f:	xor    dl,BYTE PTR [r9]
    1622:	mov    BYTE PTR [r9],dl
    1625:	xor    BYTE PTR [r8],dl
    1628:	test   ax,ax
    162b:	je     1630 <__cxa_finalize@plt+0x550>
    162d:	add    BYTE PTR [r8],cl
    1630:	add    ecx,ecx
    1632:	shr    si,0x2
    1636:	cmp    cl,r10b
    1639:	jae    1670 <__cxa_finalize@plt+0x590>
    163b:	mov    eax,esi
    163d:	shr    ax,1
    1640:	and    eax,0x1
    1643:	mov    edx,eax
    1645:	xor    edx,esi
    1647:	and    edx,0x1
    164a:	je     1610 <__cxa_finalize@plt+0x530>
    164c:	add    BYTE PTR [r9],cl
    164f:	jmp    1628 <__cxa_finalize@plt+0x548>
    1651:	nop    DWORD PTR [rax+0x0]
    1658:	mov    edx,ecx
    165a:	sub    dl,BYTE PTR [r8]
    165d:	sub    edx,0x1
    1660:	mov    BYTE PTR [r8],dl
    1663:	mov    edx,ecx
    1665:	sub    dl,BYTE PTR [r9]
    1668:	sub    edx,0x1
    166b:	mov    BYTE PTR [r9],dl
    166e:	jmp    1619 <__cxa_finalize@plt+0x539>
    1670:	ret    
    1671:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    167c:	nop    DWORD PTR [rax+0x0]
    1680:	push   r13
    1682:	mov    rcx,rdx
    1685:	mov    eax,esi
    1687:	push   r12
    1689:	mov    r12d,esi
    168c:	mov    esi,0x4
    1691:	bswap  eax
    1693:	push   rbp
    1694:	mov    rbp,rdx
    1697:	mov    edx,0x1
    169c:	push   rbx
    169d:	mov    rbx,rdi
    16a0:	sub    rsp,0x18
    16a4:	lea    rdi,[rsp+0x8]
    16a9:	mov    DWORD PTR [rsp+0x8],eax
    16ad:	call   10d0 <fwrite@plt>
    16b2:	lea    edx,[r12+0x4]
    16b7:	mov    rcx,rbp
    16ba:	mov    rdi,rbx
    16bd:	mov    esi,0x1
    16c2:	mov    r13,rdx
    16c5:	call   10d0 <fwrite@plt>
    16ca:	mov    eax,DWORD PTR [rip+0x3a30]        # 5100 <__cxa_finalize@plt+0x4020>
    16d0:	test   eax,eax
    16d2:	jne    1779 <__cxa_finalize@plt+0x699>
    16d8:	xor    eax,eax
    16da:	lea    rdi,[rip+0x3a3f]        # 5120 <__cxa_finalize@plt+0x4040>
    16e1:	mov    esi,0xedb88320
    16e6:	cs nop WORD PTR [rax+rax*1+0x0]
    16f0:	mov    rdx,rax
    16f3:	shr    rdx,1
    16f6:	test   al,0x1
    16f8:	je     16fd <__cxa_finalize@plt+0x61d>
    16fa:	xor    rdx,rsi
    16fd:	mov    rcx,rdx
    1700:	shr    rcx,1
    1703:	and    edx,0x1
    1706:	je     170b <__cxa_finalize@plt+0x62b>
    1708:	xor    rcx,rsi
    170b:	mov    rdx,rcx
    170e:	shr    rdx,1
    1711:	and    ecx,0x1
    1714:	je     1719 <__cxa_finalize@plt+0x639>
    1716:	xor    rdx,rsi
    1719:	mov    rcx,rdx
    171c:	shr    rcx,1
    171f:	and    edx,0x1
    1722:	je     1727 <__cxa_finalize@plt+0x647>
    1724:	xor    rcx,rsi
    1727:	mov    rdx,rcx
    172a:	shr    rdx,1
    172d:	and    ecx,0x1
    1730:	je     1735 <__cxa_finalize@plt+0x655>
    1732:	xor    rdx,rsi
    1735:	mov    rcx,rdx
    1738:	shr    rcx,1
    173b:	and    edx,0x1
    173e:	je     1743 <__cxa_finalize@plt+0x663>
    1740:	xor    rcx,rsi
    1743:	mov    rdx,rcx
    1746:	shr    rdx,1
    1749:	and    ecx,0x1
    174c:	je     1751 <__cxa_finalize@plt+0x671>
    174e:	xor    rdx,rsi
    1751:	mov    rcx,rdx
    1754:	shr    rcx,1
    1757:	and    edx,0x1
    175a:	je     175f <__cxa_finalize@plt+0x67f>
    175c:	xor    rcx,rsi
    175f:	mov    QWORD PTR [rdi+rax*8],rcx
    1763:	add    rax,0x1
    1767:	cmp    rax,0x100
    176d:	jne    16f0 <__cxa_finalize@plt+0x610>
    176f:	mov    DWORD PTR [rip+0x3987],0x1        # 5100 <__cxa_finalize@plt+0x4020>
    1779:	test   r13d,r13d
    177c:	jle    17e1 <__cxa_finalize@plt+0x701>
    177e:	lea    eax,[r12+0x3]
    1783:	lea    rdi,[rip+0x3996]        # 5120 <__cxa_finalize@plt+0x4040>
    178a:	lea    rcx,[rbx+rax*1+0x1]
    178f:	mov    eax,0xffffffff
    1794:	nop    DWORD PTR [rax+0x0]
    1798:	movzx  edx,BYTE PTR [rbx]
    179b:	add    rbx,0x1
    179f:	xor    edx,eax
    17a1:	shr    rax,0x8
    17a5:	movzx  edx,dl
    17a8:	xor    rax,QWORD PTR [rdi+rdx*8]
    17ac:	cmp    rcx,rbx
    17af:	jne    1798 <__cxa_finalize@plt+0x6b8>
    17b1:	mov    edx,0xffffffff
    17b6:	xor    rax,rdx
    17b9:	bswap  eax
    17bb:	lea    rdi,[rsp+0xc]
    17c0:	mov    rcx,rbp
    17c3:	mov    edx,0x1
    17c8:	mov    esi,0x4
    17cd:	mov    DWORD PTR [rsp+0xc],eax
    17d1:	call   10d0 <fwrite@plt>
    17d6:	add    rsp,0x18
    17da:	pop    rbx
    17db:	pop    rbp
    17dc:	pop    r12
    17de:	pop    r13
    17e0:	ret    
    17e1:	xor    eax,eax
    17e3:	jmp    17bb <__cxa_finalize@plt+0x6db>
    17e5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    17f0:	push   r15
    17f2:	push   r14
    17f4:	push   r13
    17f6:	push   r12
    17f8:	push   rbp
    17f9:	push   rbx
    17fa:	sub    rsp,0x48
    17fe:	mov    QWORD PTR [rsp+0x10],r8
    1803:	test   sil,sil
    1806:	je     19be <__cxa_finalize@plt+0x8de>
    180c:	lea    rax,[rdi+0x1]
    1810:	movzx  edi,sil
    1814:	mov    r9,rcx
    1817:	mov    rsi,rdx
    181a:	mov    QWORD PTR [rsp+0x38],rdi
    181f:	xor    ecx,ecx
    1821:	xor    r15d,r15d
    1824:	mov    rdx,rax
    1827:	nop    WORD PTR [rax+rax*1+0x0]
    1830:	mov    eax,DWORD PTR [rsi+rcx*4]
    1833:	mov    DWORD PTR [rsp+0x8],eax
    1837:	test   rcx,rcx
    183a:	je     1950 <__cxa_finalize@plt+0x870>
    1840:	mov    r13d,DWORD PTR [rsi+rcx*4-0x4]
    1845:	test   r9,r9
    1848:	je     1978 <__cxa_finalize@plt+0x898>
    184e:	mov    eax,DWORD PTR [r9+rcx*4-0x4]
    1853:	mov    r14d,DWORD PTR [r9+rcx*4]
    1857:	mov    DWORD PTR [rsp+0x4],eax
    185b:	cmp    rcx,0x1
    185f:	je     198d <__cxa_finalize@plt+0x8ad>
    1865:	mov    eax,DWORD PTR [rsi+rcx*4-0x8]
    1869:	xor    r12d,r12d
    186c:	mov    DWORD PTR [rsp+0xc],eax
    1870:	cmp    rcx,0x2
    1874:	je     187b <__cxa_finalize@plt+0x79b>
    1876:	mov    r12d,DWORD PTR [rsi+rcx*4-0xc]
    187b:	mov    QWORD PTR [rsp+0x18],rdx
    1880:	mov    rbp,rdx
    1883:	mov    ebx,0x10
    1888:	mov    QWORD PTR [rsp+0x20],rcx
    188d:	mov    QWORD PTR [rsp+0x28],rsi
    1892:	mov    QWORD PTR [rsp+0x30],r9
    1897:	mov    eax,DWORD PTR [rsp+0x4]
    189b:	mov    ecx,ebx
    189d:	mov    r8d,DWORD PTR [rsp+0xc]
    18a2:	mov    r9d,r12d
    18a5:	mov    edi,DWORD PTR [rsp+0x8]
    18a9:	mov    edx,r14d
    18ac:	mov    esi,r13d
    18af:	shr    r9d,cl
    18b2:	shr    eax,cl
    18b4:	shr    r8d,cl
    18b7:	movzx  r9d,r9b
    18bb:	shr    edx,cl
    18bd:	movzx  eax,al
    18c0:	shr    esi,cl
    18c2:	movzx  r8d,r8b
    18c6:	shr    edi,cl
    18c8:	movzx  edx,dl
    18cb:	mov    ecx,eax
    18cd:	movzx  esi,sil
    18d1:	mov    rax,QWORD PTR [rsp+0x10]
    18d6:	movzx  edi,dil
    18da:	call   rax
    18dc:	movzx  edx,al
    18df:	mov    BYTE PTR [rbp+0x0],al
    18e2:	cmp    edx,0x7f
    18e5:	jg     1938 <__cxa_finalize@plt+0x858>
    18e7:	movzx  eax,al
    18ea:	add    r15,rax
    18ed:	sub    ebx,0x8
    18f0:	add    rbp,0x1
    18f4:	cmp    ebx,0xfffffff8
    18f7:	jne    1897 <__cxa_finalize@plt+0x7b7>
    18f9:	mov    rdx,QWORD PTR [rsp+0x18]
    18fe:	mov    rcx,QWORD PTR [rsp+0x20]
    1903:	mov    rsi,QWORD PTR [rsp+0x28]
    1908:	mov    r9,QWORD PTR [rsp+0x30]
    190d:	add    rdx,0x3
    1911:	add    rcx,0x1
    1915:	cmp    QWORD PTR [rsp+0x38],rcx
    191a:	jne    1830 <__cxa_finalize@plt+0x750>
    1920:	add    rsp,0x48
    1924:	mov    rax,r15
    1927:	pop    rbx
    1928:	pop    rbp
    1929:	pop    r12
    192b:	pop    r13
    192d:	pop    r14
    192f:	pop    r15
    1931:	ret    
    1932:	nop    WORD PTR [rax+rax*1+0x0]
    1938:	mov    eax,0x100
    193d:	sub    eax,edx
    193f:	cdqe   
    1941:	add    r15,rax
    1944:	jmp    18ed <__cxa_finalize@plt+0x80d>
    1946:	cs nop WORD PTR [rax+rax*1+0x0]
    1950:	test   r9,r9
    1953:	je     19a0 <__cxa_finalize@plt+0x8c0>
    1955:	mov    DWORD PTR [rsp+0xc],0x0
    195d:	mov    r14d,DWORD PTR [r9]
    1960:	xor    r13d,r13d
    1963:	xor    r12d,r12d
    1966:	mov    DWORD PTR [rsp+0x4],0x0
    196e:	jmp    187b <__cxa_finalize@plt+0x79b>
    1973:	nop    DWORD PTR [rax+rax*1+0x0]
    1978:	mov    DWORD PTR [rsp+0x4],0x0
    1980:	xor    r14d,r14d
    1983:	cmp    rcx,0x1
    1987:	jne    1865 <__cxa_finalize@plt+0x785>
    198d:	mov    DWORD PTR [rsp+0xc],0x0
    1995:	xor    r12d,r12d
    1998:	jmp    187b <__cxa_finalize@plt+0x79b>
    199d:	nop    DWORD PTR [rax]
    19a0:	mov    DWORD PTR [rsp+0xc],0x0
    19a8:	xor    r13d,r13d
    19ab:	xor    r14d,r14d
    19ae:	xor    r12d,r12d
    19b1:	mov    DWORD PTR [rsp+0x4],0x0
    19b9:	jmp    187b <__cxa_finalize@plt+0x79b>
    19be:	xor    r15d,r15d
    19c1:	jmp    1920 <__cxa_finalize@plt+0x840>
    19c6:	cs nop WORD PTR [rax+rax*1+0x0]
    19d0:	push   r15
    19d2:	push   r14
    19d4:	push   r13
    19d6:	lea    r13,[rip+0x3f43]        # 5920 <__cxa_finalize@plt+0x4840>
    19dd:	push   r12
    19df:	mov    r12,0xffffffffffffffff
    19e6:	push   rbp
    19e7:	push   rbx
    19e8:	sub    rsp,0x28
    19ec:	mov    rax,QWORD PTR [rip+0x3f35]        # 5928 <__cxa_finalize@plt+0x4848>
    19f3:	mov    rbx,QWORD PTR [rip+0x3f26]        # 5920 <__cxa_finalize@plt+0x4840>
    19fa:	mov    DWORD PTR [rsp+0x1c],esi
    19fe:	movzx  esi,sil
    1a02:	cmp    rbx,rax
    1a05:	mov    DWORD PTR [rsp+0x18],esi
    1a09:	cmova  rbx,rax
    1a0d:	mov    rax,QWORD PTR [rip+0x3f1c]        # 5930 <__cxa_finalize@plt+0x4850>
    1a14:	mov    QWORD PTR [rsp],rdi
    1a18:	mov    QWORD PTR [rsp+0x8],rdx
    1a1d:	cmp    rbx,rax
    1a20:	cmova  rbx,rax
    1a24:	mov    rax,QWORD PTR [rip+0x3f0d]        # 5938 <__cxa_finalize@plt+0x4858>
    1a2b:	cmp    rbx,rax
    1a2e:	cmova  rbx,rax
    1a32:	mov    rax,QWORD PTR [rip+0x3f07]        # 5940 <__cxa_finalize@plt+0x4860>
    1a39:	cmp    rbx,rax
    1a3c:	cmova  rbx,rax
    1a40:	mov    rax,QWORD PTR [rip+0x3f01]        # 5948 <__cxa_finalize@plt+0x4868>
    1a47:	cmp    rbx,rax
    1a4a:	cmova  rbx,rax
    1a4e:	mov    rax,QWORD PTR [rip+0x3efb]        # 5950 <__cxa_finalize@plt+0x4870>
    1a55:	cmp    rbx,rax
    1a58:	cmova  rbx,rax
    1a5c:	mov    rax,QWORD PTR [rip+0x3ef5]        # 5958 <__cxa_finalize@plt+0x4878>
    1a63:	cmp    rbx,rax
    1a66:	cmova  rbx,rax
    1a6a:	mov    rax,QWORD PTR [rip+0x3eef]        # 5960 <__cxa_finalize@plt+0x4880>
    1a71:	cmp    rbx,rax
    1a74:	cmova  rbx,rax
    1a78:	mov    rax,QWORD PTR [rip+0x3ee9]        # 5968 <__cxa_finalize@plt+0x4888>
    1a7f:	cmp    rbx,rax
    1a82:	cmova  rbx,rax
    1a86:	mov    rax,QWORD PTR [rip+0x3ee3]        # 5970 <__cxa_finalize@plt+0x4890>
    1a8d:	cmp    rbx,rax
    1a90:	cmova  rbx,rax
    1a94:	xor    r15d,r15d
    1a97:	xor    r8d,r8d
    1a9a:	mov    rbp,r15
    1a9d:	mov    QWORD PTR [rsp+0x10],r8
    1aa2:	mov    r15,rcx
    1aa5:	jmp    1ad0 <__cxa_finalize@plt+0x9f0>
    1aa7:	nop    WORD PTR [rax+rax*1+0x0]
    1ab0:	cvttsd2si rax,xmm0
    1ab5:	cmp    rax,r12
    1ab8:	jae    1ac2 <__cxa_finalize@plt+0x9e2>
    1aba:	mov    QWORD PTR [rsp+0x10],rbp
    1abf:	mov    r12,rax
    1ac2:	add    rbp,0x1
    1ac6:	cmp    rbp,0xb
    1aca:	je     1ba0 <__cxa_finalize@plt+0xac0>
    1ad0:	lea    rax,[rip+0x35a9]        # 5080 <__cxa_finalize@plt+0x3fa0>
    1ad7:	mov    rdx,QWORD PTR [rsp+0x8]
    1adc:	mov    esi,DWORD PTR [rsp+0x18]
    1ae0:	mov    rcx,r15
    1ae3:	mov    r8,QWORD PTR [rax+rbp*8]
    1ae7:	mov    rdi,QWORD PTR [rsp]
    1aeb:	call   17f0 <__cxa_finalize@plt+0x710>
    1af0:	mov    rdx,QWORD PTR [r13+rbp*8+0x0]
    1af5:	mov    r14,rax
    1af8:	sub    rdx,rbx
    1afb:	js     1b80 <__cxa_finalize@plt+0xaa0>
    1b01:	pxor   xmm1,xmm1
    1b05:	cvtsi2sd xmm1,rdx
    1b0a:	mov    rax,QWORD PTR [rip+0x1687]        # 3198 <__cxa_finalize@plt+0x20b8>
    1b11:	movq   xmm0,rax
    1b16:	call   1060 <pow@plt>
    1b1b:	movapd xmm1,xmm0
    1b1f:	test   r14,r14
    1b22:	js     1b60 <__cxa_finalize@plt+0xa80>
    1b24:	pxor   xmm0,xmm0
    1b28:	cvtsi2sd xmm0,r14
    1b2d:	mulsd  xmm0,xmm1
    1b31:	comisd xmm0,QWORD PTR [rip+0x1667]        # 31a0 <__cxa_finalize@plt+0x20c0>
    1b39:	jb     1ab0 <__cxa_finalize@plt+0x9d0>
    1b3f:	subsd  xmm0,QWORD PTR [rip+0x1659]        # 31a0 <__cxa_finalize@plt+0x20c0>
    1b47:	movabs rdi,0x8000000000000000
    1b51:	cvttsd2si rax,xmm0
    1b56:	xor    rax,rdi
    1b59:	jmp    1ab5 <__cxa_finalize@plt+0x9d5>
    1b5e:	xchg   ax,ax
    1b60:	mov    rdx,r14
    1b63:	mov    rax,r14
    1b66:	pxor   xmm0,xmm0
    1b6a:	shr    rdx,1
    1b6d:	and    eax,0x1
    1b70:	or     rdx,rax
    1b73:	cvtsi2sd xmm0,rdx
    1b78:	addsd  xmm0,xmm0
    1b7c:	jmp    1b2d <__cxa_finalize@plt+0xa4d>
    1b7e:	xchg   ax,ax
    1b80:	mov    rcx,rdx
    1b83:	and    edx,0x1
    1b86:	pxor   xmm1,xmm1
    1b8a:	shr    rcx,1
    1b8d:	or     rcx,rdx
    1b90:	cvtsi2sd xmm1,rcx
    1b95:	addsd  xmm1,xmm1
    1b99:	jmp    1b0a <__cxa_finalize@plt+0xa2a>
    1b9e:	xchg   ax,ax
    1ba0:	mov    r8,QWORD PTR [rsp+0x10]
    1ba5:	lea    rax,[rip+0x34c4]        # 5070 <__cxa_finalize@plt+0x3f90>
    1bac:	mov    rbp,QWORD PTR [rsp]
    1bb0:	mov    rcx,r15
    1bb3:	mov    esi,DWORD PTR [rsp+0x18]
    1bb7:	mov    rdx,QWORD PTR [rsp+0x8]
    1bbc:	movzx  eax,BYTE PTR [rax+r8*1]
    1bc1:	add    QWORD PTR [r13+r8*8+0x0],0x1
    1bc7:	mov    rdi,rbp
    1bca:	mov    BYTE PTR [rbp+0x0],al
    1bcd:	lea    rax,[rip+0x34ac]        # 5080 <__cxa_finalize@plt+0x3fa0>
    1bd4:	mov    r8,QWORD PTR [rax+r8*8]
    1bd8:	call   17f0 <__cxa_finalize@plt+0x710>
    1bdd:	movzx  eax,BYTE PTR [rsp+0x1c]
    1be2:	add    rsp,0x28
    1be6:	pop    rbx
    1be7:	lea    rax,[rax+rax*2+0x1]
    1bec:	add    rax,rbp
    1bef:	pop    rbp
    1bf0:	pop    r12
    1bf2:	pop    r13
    1bf4:	pop    r14
    1bf6:	pop    r15
    1bf8:	ret    
    1bf9:	nop    DWORD PTR [rax+0x0]
    1c00:	push   r15
    1c02:	xor    eax,eax
    1c04:	push   r14
    1c06:	push   r13
    1c08:	push   r12
    1c0a:	mov    r12,rsi
    1c0d:	lea    rsi,[rip+0x13f0]        # 3004 <__cxa_finalize@plt+0x1f24>
    1c14:	push   rbp
    1c15:	push   rbx
    1c16:	mov    rbx,rdi
    1c19:	sub    rsp,0xb8
    1c20:	mov    QWORD PTR [rsp+0x7c],0x0
    1c29:	lea    rdx,[rsp+0x7c]
    1c2e:	call   1040 <__isoc99_fscanf@plt>
    1c33:	cmp    BYTE PTR [rsp+0x7c],0x50
    1c38:	je     1c60 <__cxa_finalize@plt+0xb80>
    1c3a:	lea    rdi,[rip+0x1427]        # 3068 <__cxa_finalize@plt+0x1f88>
    1c41:	call   1050 <puts@plt>
    1c46:	mov    ebp,0x1
    1c4b:	add    rsp,0xb8
    1c52:	mov    eax,ebp
    1c54:	pop    rbx
    1c55:	pop    rbp
    1c56:	pop    r12
    1c58:	pop    r13
    1c5a:	pop    r14
    1c5c:	pop    r15
    1c5e:	ret    
    1c5f:	nop
    1c60:	movzx  ebp,BYTE PTR [rsp+0x7d]
    1c65:	sub    ebp,0x33
    1c68:	jne    1c3a <__cxa_finalize@plt+0xb5a>
    1c6a:	lea    rcx,[rsp+0x68]
    1c6f:	lea    rdx,[rsp+0x60]
    1c74:	mov    rdi,rbx
    1c77:	xor    eax,eax
    1c79:	lea    rsi,[rip+0x1388]        # 3008 <__cxa_finalize@plt+0x1f28>
    1c80:	call   1040 <__isoc99_fscanf@plt>
    1c85:	mov    r13,QWORD PTR [rsp+0x60]
    1c8a:	cmp    QWORD PTR [rsp+0x68],r13
    1c8f:	jne    1ce8 <__cxa_finalize@plt+0xc08>
    1c91:	test   r13,r13
    1c94:	je     1ce8 <__cxa_finalize@plt+0xc08>
    1c96:	lea    r8,[r13-0x1]
    1c9a:	and    r8,r13
    1c9d:	jne    1ce8 <__cxa_finalize@plt+0xc08>
    1c9f:	cmp    r13,0x80
    1ca6:	ja     1d00 <__cxa_finalize@plt+0xc20>
    1ca8:	xor    eax,eax
    1caa:	lea    rdx,[rsp+0x5c]
    1caf:	mov    rdi,rbx
    1cb2:	mov    QWORD PTR [rsp],r8
    1cb6:	lea    rsi,[rip+0x1375]        # 3032 <__cxa_finalize@plt+0x1f52>
    1cbd:	call   1040 <__isoc99_fscanf@plt>
    1cc2:	cmp    DWORD PTR [rsp+0x5c],0xff
    1cca:	mov    r8,QWORD PTR [rsp]
    1cce:	je     1d18 <__cxa_finalize@plt+0xc38>
    1cd0:	lea    rdi,[rip+0x1339]        # 3010 <__cxa_finalize@plt+0x1f30>
    1cd7:	call   1050 <puts@plt>
    1cdc:	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1ce1:	nop    DWORD PTR [rax+0x0]
    1ce8:	lea    rdi,[rip+0x13c9]        # 30b8 <__cxa_finalize@plt+0x1fd8>
    1cef:	call   1050 <puts@plt>
    1cf4:	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1cf9:	nop    DWORD PTR [rax+0x0]
    1d00:	lea    rdi,[rip+0x13f1]        # 30f8 <__cxa_finalize@plt+0x2018>
    1d07:	call   1050 <puts@plt>
    1d0c:	jmp    1c46 <__cxa_finalize@plt+0xb66>
    1d11:	nop    DWORD PTR [rax+0x0]
    1d18:	mov    rax,r13
    1d1b:	mov    r14d,r13d
    1d1e:	mov    QWORD PTR [rsp+0x28],r8
    1d23:	xor    r15d,r15d
    1d26:	imul   rax,r13
    1d2a:	imul   r14d,r13d
    1d2e:	mov    QWORD PTR [rsp+0x40],rax
    1d33:	shl    rax,0x2
    1d37:	mov    rdi,rax
    1d3a:	mov    QWORD PTR [rsp+0x8],rax
    1d3f:	movsxd r14,r14d
    1d42:	call   10a0 <malloc@plt>
    1d47:	lea    rcx,[rsp+0x84]
    1d4f:	mov    DWORD PTR [rsp+0x4c],r13d
    1d54:	mov    rsi,rax
    1d57:	mov    QWORD PTR [rsp],rcx
    1d5b:	lea    rax,[rsp+0x90]
    1d63:	lea    rcx,[rsp+0x70]
    1d68:	mov    QWORD PTR [rsp+0x10],rax
    1d6d:	mov    QWORD PTR [rsp+0x18],rcx
    1d72:	mov    QWORD PTR [rsp+0x20],r13
    1d77:	mov    r13,rsi
    1d7a:	mov    DWORD PTR [rsp+0x48],ebp
    1d7e:	mov    rbp,r15
    1d81:	mov    r15,rcx
    1d84:	mov    QWORD PTR [rsp+0x30],r12
    1d89:	mov    r12,rax
    1d8c:	nop    DWORD PTR [rax+0x0]
    1d90:	mov    rcx,QWORD PTR [rsp]
    1d94:	mov    rdx,r15
    1d97:	mov    r8,r12
    1d9a:	mov    rdi,rbx
    1d9d:	lea    rsi,[rip+0x1288]        # 302c <__cxa_finalize@plt+0x1f4c>
    1da4:	xor    eax,eax
    1da6:	call   1040 <__isoc99_fscanf@plt>
    1dab:	mov    eax,DWORD PTR [rsp+0x70]
    1daf:	mov    edx,DWORD PTR [rsp+0x84]
    1db6:	mov    r10,rbp
    1db9:	shl    eax,0x10
    1dbc:	shl    edx,0x8
    1dbf:	or     eax,edx
    1dc1:	or     eax,DWORD PTR [rsp+0x90]
    1dc8:	mov    DWORD PTR [r13+rbp*4+0x0],eax
    1dcd:	lea    rbp,[rbp+0x1]
    1dd1:	cmp    r14,rbp
    1dd4:	jne    1d90 <__cxa_finalize@plt+0xcb0>
    1dd6:	mov    rdi,QWORD PTR [rsp+0x8]
    1ddb:	mov    ebp,DWORD PTR [rsp+0x48]
    1ddf:	mov    QWORD PTR [rsp+0x38],r13
    1de4:	mov    r13,QWORD PTR [rsp+0x20]
    1de9:	mov    r12,QWORD PTR [rsp+0x30]
    1dee:	mov    QWORD PTR [rsp+0x20],r10
    1df3:	call   10a0 <malloc@plt>
    1df8:	mov    rsi,QWORD PTR [rsp+0x38]
    1dfd:	mov    r8,QWORD PTR [rsp+0x28]
    1e02:	mov    QWORD PTR [rsp+0x8],rbx
    1e07:	bsr    rdx,r13
    1e0b:	mov    r14,rax
    1e0e:	mov    eax,0x3f
    1e13:	mov    r11d,r13d
    1e16:	xor    rdx,0x3f
    1e1a:	mov    r10,QWORD PTR [rsp+0x20]
    1e1f:	sub    eax,edx
    1e21:	movzx  eax,al
    1e24:	mov    DWORD PTR [rsp+0x48],eax
    1e28:	mov    ebx,eax
    1e2a:	nop    WORD PTR [rax+rax*1+0x0]
    1e30:	mov    ecx,r8d
    1e33:	cmp    r11b,0x1
    1e37:	je     1ed8 <__cxa_finalize@plt+0xdf8>
    1e3d:	xor    r9d,r9d
    1e40:	xor    edi,edi
    1e42:	mov    edx,0x1
    1e47:	jmp    1e68 <__cxa_finalize@plt+0xd88>
    1e49:	nop    DWORD PTR [rax+0x0]
    1e50:	test   ax,ax
    1e53:	jne    1ec0 <__cxa_finalize@plt+0xde0>
    1e55:	mov    eax,r9d
    1e58:	mov    r9d,edi
    1e5b:	mov    edi,eax
    1e5d:	add    edx,edx
    1e5f:	shr    cx,0x2
    1e63:	cmp    dl,r11b
    1e66:	jae    1e91 <__cxa_finalize@plt+0xdb1>
    1e68:	mov    eax,ecx
    1e6a:	shr    ax,1
    1e6d:	and    eax,0x1
    1e70:	mov    r15d,eax
    1e73:	xor    r15d,ecx
    1e76:	and    r15d,0x1
    1e7a:	je     1e50 <__cxa_finalize@plt+0xd70>
    1e7c:	add    edi,edx
    1e7e:	test   ax,ax
    1e81:	je     1e5d <__cxa_finalize@plt+0xd7d>
    1e83:	add    r9d,edx
    1e86:	add    edx,edx
    1e88:	shr    cx,0x2
    1e8c:	cmp    dl,r11b
    1e8f:	jb     1e68 <__cxa_finalize@plt+0xd88>
    1e91:	movzx  edi,dil
    1e95:	mov    ecx,ebx
    1e97:	movzx  r9d,r9b
    1e9b:	shl    edi,cl
    1e9d:	or     edi,r9d
    1ea0:	movsxd rdi,edi
    1ea3:	lea    rax,[rsi+rdi*4]
    1ea7:	mov    eax,DWORD PTR [rax]
    1ea9:	mov    DWORD PTR [r14+r8*4],eax
    1ead:	lea    rax,[r8+0x1]
    1eb1:	cmp    r10,r8
    1eb4:	je     1ee0 <__cxa_finalize@plt+0xe00>
    1eb6:	mov    r8,rax
    1eb9:	jmp    1e30 <__cxa_finalize@plt+0xd50>
    1ebe:	xchg   ax,ax
    1ec0:	lea    eax,[rdx-0x1]
    1ec3:	mov    r15d,eax
    1ec6:	sub    eax,edi
    1ec8:	sub    r15d,r9d
    1ecb:	mov    r9d,eax
    1ece:	mov    edi,r15d
    1ed1:	jmp    1e83 <__cxa_finalize@plt+0xda3>
    1ed3:	nop    DWORD PTR [rax+rax*1+0x0]
    1ed8:	mov    rax,rsi
    1edb:	jmp    1ea7 <__cxa_finalize@plt+0xdc7>
    1edd:	nop    DWORD PTR [rax]
    1ee0:	mov    rax,QWORD PTR [rsp+0x40]
    1ee5:	mov    rbx,QWORD PTR [rsp+0x8]
    1eea:	xor    r15d,r15d
    1eed:	lea    rax,[rax+rax*2]
    1ef1:	add    rax,r13
    1ef4:	mov    rdi,rax
    1ef7:	mov    QWORD PTR [rsp+0x8],rax
    1efc:	call   10a0 <malloc@plt>
    1f01:	mov    QWORD PTR [rsp+0x30],rbx
    1f06:	mov    ebx,DWORD PTR [rsp+0x4c]
    1f0a:	mov    QWORD PTR [rsp+0x20],rax
    1f0f:	mov    rdi,rax
    1f12:	mov    QWORD PTR [rsp+0x38],r12
    1f17:	mov    r12d,DWORD PTR [rsp+0x48]
    1f1c:	mov    DWORD PTR [rsp+0x28],ebp
    1f20:	mov    ebp,r15d
    1f23:	mov    r15d,r13d
    1f26:	cs nop WORD PTR [rax+rax*1+0x0]
    1f30:	test   ebp,ebp
    1f32:	je     2070 <__cxa_finalize@plt+0xf90>
    1f38:	mov    ecx,r12d
    1f3b:	lea    eax,[rbp-0x1]
    1f3e:	shl    eax,cl
    1f40:	cdqe   
    1f42:	lea    rsi,[r14+rax*4]
    1f46:	mov    eax,ebp
    1f48:	add    ebp,0x1
    1f4b:	shl    eax,cl
    1f4d:	mov    rcx,rsi
    1f50:	mov    esi,ebx
    1f52:	cdqe   
    1f54:	lea    rdx,[r14+rax*4]
    1f58:	call   19d0 <__cxa_finalize@plt+0x8f0>
    1f5d:	mov    rdi,rax
    1f60:	cmp    bp,r15w
    1f64:	jb     1f30 <__cxa_finalize@plt+0xe50>
    1f66:	mov    rdi,QWORD PTR [rsp]
    1f6a:	mov    r12,QWORD PTR [rsp+0x38]
    1f6f:	mov    edx,0x1
    1f74:	bswap  r13d
    1f77:	mov    esi,0x8
    1f7c:	mov    rbx,QWORD PTR [rsp+0x30]
    1f81:	mov    ebp,DWORD PTR [rsp+0x28]
    1f85:	movabs rax,0xa1a0a0d474e5089
    1f8f:	mov    rcx,r12
    1f92:	mov    QWORD PTR [rsp+0x84],rax
    1f9a:	mov    BYTE PTR [rsp+0x8c],0x0
    1fa2:	call   10d0 <fwrite@plt>
    1fa7:	movd   xmm1,r13d
    1fac:	mov    rdi,QWORD PTR [rsp+0x10]
    1fb1:	mov    rdx,r12
    1fb4:	pshufd xmm0,xmm1,0xe0
    1fb9:	mov    esi,0xd
    1fbe:	mov    QWORD PTR [rsp+0x9d],0x0
    1fca:	mov    QWORD PTR [rsp+0x90],0x52444849
    1fd6:	mov    DWORD PTR [rsp+0x9c],0xc0000208
    1fe1:	movq   QWORD PTR [rsp+0x94],xmm0
    1fea:	mov    BYTE PTR [rsp+0xa0],0xde
    1ff2:	call   1680 <__cxa_finalize@plt+0x5a0>
    1ff7:	mov    r14,QWORD PTR [rsp+0x8]
    1ffc:	mov    rdi,r14
    1fff:	call   10b0 <compressBound@plt>
    2004:	lea    rdi,[rax+0x4]
    2008:	mov    QWORD PTR [rsp+0x70],rax
    200d:	call   10a0 <malloc@plt>
    2012:	mov    rdx,QWORD PTR [rsp+0x20]
    2017:	mov    rsi,QWORD PTR [rsp+0x18]
    201c:	mov    rcx,r14
    201f:	mov    DWORD PTR [rax],0x54414449
    2025:	lea    rdi,[rax+0x4]
    2029:	mov    r13,rax
    202c:	call   1030 <compress@plt>
    2031:	mov    esi,DWORD PTR [rsp+0x70]
    2035:	mov    rdx,r12
    2038:	mov    rdi,r13
    203b:	call   1680 <__cxa_finalize@plt+0x5a0>
    2040:	mov    rdx,r12
    2043:	xor    esi,esi
    2045:	lea    rdi,[rip+0xfe9]        # 3035 <__cxa_finalize@plt+0x1f55>
    204c:	call   1680 <__cxa_finalize@plt+0x5a0>
    2051:	mov    rdi,rbx
    2054:	call   1070 <fclose@plt>
    2059:	mov    rdi,r12
    205c:	call   1070 <fclose@plt>
    2061:	jmp    1c4b <__cxa_finalize@plt+0xb6b>
    2066:	cs nop WORD PTR [rax+rax*1+0x0]
    2070:	xor    ecx,ecx
    2072:	mov    rdx,r14
    2075:	mov    esi,ebx
    2077:	call   19d0 <__cxa_finalize@plt+0x8f0>
    207c:	mov    rdi,rax
    207f:	cmp    r15w,0x1
    2084:	je     1f66 <__cxa_finalize@plt+0xe86>
    208a:	mov    ebp,0x1
    208f:	jmp    1f38 <__cxa_finalize@plt+0xe58>
    2094:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    209f:	nop
    20a0:	mov    rsi,rdi
    20a3:	xor    eax,eax
    20a5:	lea    rdi,[rip+0x1084]        # 3130 <__cxa_finalize@plt+0x2050>
    20ac:	jmp    1080 <printf@plt>

Disassembly of section .fini:

00000000000020b4 <.fini>:
    20b4:	sub    rsp,0x8
    20b8:	add    rsp,0x8
    20bc:	ret    
