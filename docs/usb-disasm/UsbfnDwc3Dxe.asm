
UsbfnDwc3Dxe.efi:	file format coff-arm64

Disassembly of section .text:

0000000000001000 <.text>:
    1000:      	stp	x20, x19, [sp, #-0x20]!
    1004:      	stp	x29, x30, [sp, #0x10]
    1008:      	add	x29, sp, #0x10
    100c:      	mov	x20, x0
    1010:      	bl	0x144c <.text+0x44c>
    1014:      	mov	x19, x0
    1018:      	tbnz	x19, #0x3f, 0x102c <.text+0x2c>
    101c:      	adrp	x8, 0x13000
    1020:      	mov	x0, x20
    1024:      	ldr	x1, [x8, #0x470]
    1028:      	bl	0x13a8 <.text+0x3a8>
    102c:      	ldp	x29, x30, [sp, #0x10]
    1030:      	mov	x0, x19
    1034:      	ldp	x20, x19, [sp], #0x20
    1038:      	ret
    103c:      	stp	x22, x21, [sp, #-0x30]!
    1040:      	stp	x20, x19, [sp, #0x10]
    1044:      	stp	x29, x30, [sp, #0x20]
    1048:      	add	x29, sp, #0x20
    104c:      	sub	sp, sp, #0x10
    1050:      	adrp	x8, 0xd000 <.text+0xc000>
    1054:      	mov	x19, x1
    1058:      	mov	x20, x0
    105c:      	ldr	w8, [x8, #0xc70]
    1060:      	cbz	w8, 0x107c <.text+0x7c>
    1064:      	ldr	w9, [x19, #0x8]
    1068:      	cmp	w9, w8
    106c:      	b.hs	0x107c <.text+0x7c>
    1070:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    1074:      	movk	x21, #0x19
    1078:      	b	0x1118 <.text+0x118>
    107c:      	mov	x0, x20
    1080:      	mov	x1, x19
    1084:      	bl	0x1198 <.text+0x198>
    1088:      	adrp	x9, 0xd000 <.text+0xc000>
    108c:      	ldrb	w11, [x9, #0xc74]
    1090:      	cbz	w11, 0x10f8 <.text+0xf8>
    1094:      	adrp	x10, 0x13000
    1098:      	adrp	x1, 0x13000
    109c:      	add	x1, x1, #0x140
    10a0:      	ldr	x11, [x10, #0x478]
    10a4:      	add	x2, sp, #0x8
    10a8:      	mov	x0, x20
    10ac:      	ldr	x9, [x11, #0x98]
    10b0:      	blr	x9
    10b4:      	mov	x8, x0
    10b8:      	tbz	x8, #0x3f, 0x10e8 <.text+0xe8>
    10bc:      	adrp	x1, 0xd000 <.text+0xc000>
    10c0:      	add	x1, x1, #0xb94
    10c4:      	orr	w0, wzr, #0x80000000
    10c8:      	mov	x2, x8
    10cc:      	bl	0xac7c <.text+0x9c7c>
    10d0:      	adrp	x0, 0xd000 <.text+0xc000>
    10d4:      	adrp	x2, 0xd000 <.text+0xc000>
    10d8:      	add	x0, x0, #0xbb5
    10dc:      	add	x2, x2, #0xbc8
    10e0:      	orr	w1, wzr, #0x7e
    10e4:      	bl	0xb008 <.text+0xa008>
    10e8:      	ldr	x12, [sp, #0x8]
    10ec:      	adrp	x10, 0x1000 <.text>
    10f0:      	add	x10, x10, #0x0
    10f4:      	str	x10, [x12, #0x58]
    10f8:      	mov	x0, x20
    10fc:      	mov	x1, x19
    1100:      	bl	0x1448 <.text+0x448>
    1104:      	mov	x21, x0
    1108:      	tbz	x21, #0x3f, 0x1118 <.text+0x118>
    110c:      	mov	x0, x20
    1110:      	mov	x1, x19
    1114:      	bl	0x13a8 <.text+0x3a8>
    1118:      	mov	x0, x21
    111c:      	sub	sp, x29, #0x20
    1120:      	ldp	x29, x30, [sp, #0x20]
    1124:      	ldp	x20, x19, [sp, #0x10]
    1128:      	ldp	x22, x21, [sp], #0x30
    112c:      	ret
    1130:      	cmp	x0, #0x0
    1134:      	b.eq	0x115c <.text+0x15c>
    1138:      	stp	x3, x2, [sp, #-0x10]!
    113c:      	stp	x1, x0, [sp, #-0x10]!
    1140:      	stp	x9, x8, [sp, #-0x10]!
    1144:      	stp	x30, x29, [sp, #-0x10]!
    1148:      	bl	0x1160 <.text+0x160>
    114c:      	ldp	x30, x29, [sp], #0x10
    1150:      	ldp	x9, x8, [sp], #0x10
    1154:      	ldp	x1, x0, [sp], #0x10
    1158:      	ldp	x3, x2, [sp], #0x10
    115c:      	b	0x103c <.text+0x3c>
    1160:      	stp	x29, x30, [sp, #-0x10]!
    1164:      	mov	x29, sp
    1168:      	bl	0xcda4 <.text+0xbda4>
    116c:      	adrp	x8, 0x13000
    1170:      	str	x0, [x8]
    1174:      	ldp	x29, x30, [sp], #0x10
    1178:      	ret
    117c:      	sub	sp, sp, #0x10
    1180:      	orr	w8, wzr, #0x1
    1184:      	str	w8, [sp, #0xc]
    1188:      	ldr	w9, [sp, #0xc]
    118c:      	cbnz	w9, 0x1188 <.text+0x188>
    1190:      	add	sp, sp, #0x10
    1194:      	ret
    1198:      	stp	x20, x19, [sp, #-0x20]!
    119c:      	stp	x29, x30, [sp, #0x10]
    11a0:      	add	x29, sp, #0x10
    11a4:      	mov	x19, x1
    11a8:      	mov	x20, x0
    11ac:      	bl	0xbff4 <.text+0xaff4>
    11b0:      	mov	x8, x0
    11b4:      	tbz	x8, #0x3f, 0x11e4 <.text+0x1e4>
    11b8:      	adrp	x1, 0xd000 <.text+0xc000>
    11bc:      	add	x1, x1, #0xb94
    11c0:      	orr	w0, wzr, #0x80000000
    11c4:      	mov	x2, x8
    11c8:      	bl	0xac7c <.text+0x9c7c>
    11cc:      	adrp	x0, 0xd000 <.text+0xc000>
    11d0:      	adrp	x2, 0xd000 <.text+0xc000>
    11d4:      	add	x0, x0, #0xbe9
    11d8:      	mov	w1, #0x12a              // =298
    11dc:      	add	x2, x2, #0xbc8
    11e0:      	bl	0xb008 <.text+0xa008>
    11e4:      	mov	x0, x20
    11e8:      	mov	x1, x19
    11ec:      	bl	0xc034 <.text+0xb034>
    11f0:      	mov	x9, x0
    11f4:      	tbz	x9, #0x3f, 0x1224 <.text+0x224>
    11f8:      	adrp	x1, 0xd000 <.text+0xc000>
    11fc:      	add	x1, x1, #0xb94
    1200:      	orr	w0, wzr, #0x80000000
    1204:      	mov	x2, x9
    1208:      	bl	0xac7c <.text+0x9c7c>
    120c:      	adrp	x0, 0xd000 <.text+0xc000>
    1210:      	adrp	x2, 0xd000 <.text+0xc000>
    1214:      	add	x0, x0, #0xbe9
    1218:      	mov	w1, #0x12d              // =301
    121c:      	add	x2, x2, #0xbc8
    1220:      	bl	0xb008 <.text+0xa008>
    1224:      	mov	x0, x20
    1228:      	mov	x1, x19
    122c:      	bl	0xc1f8 <.text+0xb1f8>
    1230:      	mov	x10, x0
    1234:      	tbz	x10, #0x3f, 0x1264 <.text+0x264>
    1238:      	adrp	x1, 0xd000 <.text+0xc000>
    123c:      	add	x1, x1, #0xb94
    1240:      	orr	w0, wzr, #0x80000000
    1244:      	mov	x2, x10
    1248:      	bl	0xac7c <.text+0x9c7c>
    124c:      	adrp	x0, 0xd000 <.text+0xc000>
    1250:      	adrp	x2, 0xd000 <.text+0xc000>
    1254:      	add	x0, x0, #0xbe9
    1258:      	mov	w1, #0x130              // =304
    125c:      	add	x2, x2, #0xbc8
    1260:      	bl	0xb008 <.text+0xa008>
    1264:      	mov	x0, x20
    1268:      	mov	x1, x19
    126c:      	bl	0xc2dc <.text+0xb2dc>
    1270:      	mov	x11, x0
    1274:      	tbz	x11, #0x3f, 0x12a4 <.text+0x2a4>
    1278:      	adrp	x1, 0xd000 <.text+0xc000>
    127c:      	add	x1, x1, #0xb94
    1280:      	orr	w0, wzr, #0x80000000
    1284:      	mov	x2, x11
    1288:      	bl	0xac7c <.text+0x9c7c>
    128c:      	adrp	x0, 0xd000 <.text+0xc000>
    1290:      	adrp	x2, 0xd000 <.text+0xc000>
    1294:      	add	x0, x0, #0xbe9
    1298:      	mov	w1, #0x133              // =307
    129c:      	add	x2, x2, #0xbc8
    12a0:      	bl	0xb008 <.text+0xa008>
    12a4:      	mov	x0, x20
    12a8:      	mov	x1, x19
    12ac:      	bl	0xc4b8 <.text+0xb4b8>
    12b0:      	mov	x12, x0
    12b4:      	tbz	x12, #0x3f, 0x12e4 <.text+0x2e4>
    12b8:      	adrp	x1, 0xd000 <.text+0xc000>
    12bc:      	add	x1, x1, #0xb94
    12c0:      	orr	w0, wzr, #0x80000000
    12c4:      	mov	x2, x12
    12c8:      	bl	0xac7c <.text+0x9c7c>
    12cc:      	adrp	x0, 0xd000 <.text+0xc000>
    12d0:      	adrp	x2, 0xd000 <.text+0xc000>
    12d4:      	add	x0, x0, #0xbe9
    12d8:      	mov	w1, #0x136              // =310
    12dc:      	add	x2, x2, #0xbc8
    12e0:      	bl	0xb008 <.text+0xa008>
    12e4:      	bl	0xc76c <.text+0xb76c>
    12e8:      	mov	x13, x0
    12ec:      	tbz	x13, #0x3f, 0x131c <.text+0x31c>
    12f0:      	adrp	x1, 0xd000 <.text+0xc000>
    12f4:      	add	x1, x1, #0xb94
    12f8:      	orr	w0, wzr, #0x80000000
    12fc:      	mov	x2, x13
    1300:      	bl	0xac7c <.text+0x9c7c>
    1304:      	adrp	x0, 0xd000 <.text+0xc000>
    1308:      	adrp	x2, 0xd000 <.text+0xc000>
    130c:      	add	x0, x0, #0xbe9
    1310:      	mov	w1, #0x139              // =313
    1314:      	add	x2, x2, #0xbc8
    1318:      	bl	0xb008 <.text+0xa008>
    131c:      	mov	x0, x20
    1320:      	mov	x1, x19
    1324:      	bl	0xcbfc <.text+0xbbfc>
    1328:      	mov	x14, x0
    132c:      	tbz	x14, #0x3f, 0x135c <.text+0x35c>
    1330:      	adrp	x1, 0xd000 <.text+0xc000>
    1334:      	add	x1, x1, #0xb94
    1338:      	orr	w0, wzr, #0x80000000
    133c:      	mov	x2, x14
    1340:      	bl	0xac7c <.text+0x9c7c>
    1344:      	adrp	x0, 0xd000 <.text+0xc000>
    1348:      	adrp	x2, 0xd000 <.text+0xc000>
    134c:      	add	x0, x0, #0xbe9
    1350:      	mov	w1, #0x13c              // =316
    1354:      	add	x2, x2, #0xbc8
    1358:      	bl	0xb008 <.text+0xa008>
    135c:      	bl	0xcd00 <.text+0xbd00>
    1360:      	mov	x15, x0
    1364:      	tbnz	x15, #0x3f, 0x1374 <.text+0x374>
    1368:      	ldp	x29, x30, [sp, #0x10]
    136c:      	ldp	x20, x19, [sp], #0x20
    1370:      	ret
    1374:      	adrp	x1, 0xd000 <.text+0xc000>
    1378:      	add	x1, x1, #0xb94
    137c:      	orr	w0, wzr, #0x80000000
    1380:      	mov	x2, x15
    1384:      	bl	0xac7c <.text+0x9c7c>
    1388:      	ldp	x29, x30, [sp, #0x10]
    138c:      	adrp	x0, 0xd000 <.text+0xc000>
    1390:      	adrp	x2, 0xd000 <.text+0xc000>
    1394:      	add	x0, x0, #0xbe9
    1398:      	mov	w1, #0x13f              // =319
    139c:      	add	x2, x2, #0xbc8
    13a0:      	ldp	x20, x19, [sp], #0x20
    13a4:      	b	0xb008 <.text+0xa008>
    13a8:      	stp	x20, x19, [sp, #-0x20]!
    13ac:      	stp	x29, x30, [sp, #0x10]
    13b0:      	add	x29, sp, #0x10
    13b4:      	mov	x19, x1
    13b8:      	mov	x20, x0
    13bc:      	bl	0xcda8 <.text+0xbda8>
    13c0:      	mov	x8, x0
    13c4:      	tbz	x8, #0x3f, 0x13f4 <.text+0x3f4>
    13c8:      	adrp	x1, 0xd000 <.text+0xc000>
    13cc:      	add	x1, x1, #0xb94
    13d0:      	orr	w0, wzr, #0x80000000
    13d4:      	mov	x2, x8
    13d8:      	bl	0xac7c <.text+0x9c7c>
    13dc:      	adrp	x0, 0xd000 <.text+0xc000>
    13e0:      	adrp	x2, 0xd000 <.text+0xc000>
    13e4:      	add	x0, x0, #0xbe9
    13e8:      	mov	w1, #0x15d              // =349
    13ec:      	add	x2, x2, #0xbc8
    13f0:      	bl	0xb008 <.text+0xa008>
    13f4:      	mov	x0, x20
    13f8:      	mov	x1, x19
    13fc:      	bl	0xc644 <.text+0xb644>
    1400:      	mov	x9, x0
    1404:      	tbnz	x9, #0x3f, 0x1414 <.text+0x414>
    1408:      	ldp	x29, x30, [sp, #0x10]
    140c:      	ldp	x20, x19, [sp], #0x20
    1410:      	ret
    1414:      	adrp	x1, 0xd000 <.text+0xc000>
    1418:      	add	x1, x1, #0xb94
    141c:      	orr	w0, wzr, #0x80000000
    1420:      	mov	x2, x9
    1424:      	bl	0xac7c <.text+0x9c7c>
    1428:      	ldp	x29, x30, [sp, #0x10]
    142c:      	adrp	x0, 0xd000 <.text+0xc000>
    1430:      	adrp	x2, 0xd000 <.text+0xc000>
    1434:      	add	x0, x0, #0xbe9
    1438:      	mov	w1, #0x160              // =352
    143c:      	add	x2, x2, #0xbc8
    1440:      	ldp	x20, x19, [sp], #0x20
    1444:      	b	0xb008 <.text+0xa008>
    1448:      	b	0x1c8c <.text+0xc8c>
    144c:      	mov	x0, xzr
    1450:      	ret
    1454:      	stp	x22, x21, [sp, #-0x30]!
    1458:      	stp	x20, x19, [sp, #0x10]
    145c:      	stp	x29, x30, [sp, #0x20]
    1460:      	add	x29, sp, #0x20
    1464:      	sub	sp, sp, #0x10
    1468:      	adrp	x22, 0x13000
    146c:      	mov	x20, x0
    1470:      	mov	x19, x1
    1474:      	ldr	x8, [x22, #0x478]
    1478:      	adrp	x1, 0x13000
    147c:      	ldr	x3, [x20, #0x28]
    1480:      	add	x1, x1, #0xa0
    1484:      	add	x2, sp, #0x8
    1488:      	orr	w5, wzr, #0x10
    148c:      	ldr	x8, [x8, #0x118]
    1490:      	mov	x0, x19
    1494:      	mov	x4, x19
    1498:      	blr	x8
    149c:      	mov	x21, x0
    14a0:      	tbnz	x21, #0x3f, 0x14e0 <.text+0x4e0>
    14a4:      	ldr	x9, [sp, #0x8]
    14a8:      	adrp	x1, 0x13000
    14ac:      	ldr	x10, [x22, #0x478]
    14b0:      	add	x1, x1, #0xa0
    14b4:      	ldr	x2, [x20, #0x28]
    14b8:      	ldr	x9, [x9, #0x88]
    14bc:      	ldr	x10, [x10, #0x120]
    14c0:      	lsr	x11, x9, #32
    14c4:      	cmp	x11, #0x4
    14c8:      	ccmp	w9, #0x4, #0x2, eq
    14cc:      	mov	x0, x19
    14d0:      	mov	x3, x19
    14d4:      	mov	x12, #-0x7ffffffffffffffd // =-9223372036854775805
    14d8:      	csel	x21, xzr, x12, lo
    14dc:      	blr	x10
    14e0:      	mov	x0, x21
    14e4:      	sub	sp, x29, #0x20
    14e8:      	ldp	x29, x30, [sp, #0x20]
    14ec:      	ldp	x20, x19, [sp, #0x10]
    14f0:      	ldp	x22, x21, [sp], #0x30
    14f4:      	ret
    14f8:      	stp	x26, x25, [sp, #-0x50]!
    14fc:      	stp	x24, x23, [sp, #0x10]
    1500:      	stp	x22, x21, [sp, #0x20]
    1504:      	stp	x20, x19, [sp, #0x30]
    1508:      	stp	x29, x30, [sp, #0x40]
    150c:      	add	x29, sp, #0x40
    1510:      	mov	x19, x0
    1514:      	str	x1, [sp, #-0x30]!
    1518:      	mov	w0, #0xe18              // =3608
    151c:      	bl	0xbf8c <.text+0xaf8c>
    1520:      	mov	x20, x0
    1524:      	cbz	x20, 0x17a8 <.text+0x7a8>
    1528:      	mov	w11, #0x10000           // =65536
    152c:      	str	xzr, [x20, #0xa0]
    1530:      	movk	w11, #0x2
    1534:      	mov	w9, #0x66620000         // =1717698560
    1538:      	adrp	x10, 0x2000 <.text+0x1000>
    153c:      	str	w11, [x20, #0x8]
    1540:      	adrp	x11, 0x2000 <.text+0x1000>
    1544:      	adrp	x12, 0x2000 <.text+0x1000>
    1548:      	adrp	x13, 0x2000 <.text+0x1000>
    154c:      	movk	w9, #0x7375
    1550:      	add	x10, x10, #0x328
    1554:      	add	x11, x11, #0x428
    1558:      	add	x12, x12, #0x69c
    155c:      	str	x9, [x20]
    1560:      	add	x13, x13, #0x704
    1564:      	stp	x10, x11, [x20, #0x10]
    1568:      	adrp	x14, 0x2000 <.text+0x1000>
    156c:      	adrp	x15, 0x2000 <.text+0x1000>
    1570:      	stp	x12, x13, [x20, #0x20]
    1574:      	adrp	x16, 0x2000 <.text+0x1000>
    1578:      	adrp	x17, 0x2000 <.text+0x1000>
    157c:      	adrp	x5, 0x2000 <.text+0x1000>
    1580:      	adrp	x6, 0x3000 <.text+0x2000>
    1584:      	adrp	x7, 0x3000 <.text+0x2000>
    1588:      	adrp	x22, 0x3000 <.text+0x2000>
    158c:      	adrp	x0, 0x3000 <.text+0x2000>
    1590:      	adrp	x3, 0x3000 <.text+0x2000>
    1594:      	adrp	x4, 0x3000 <.text+0x2000>
    1598:      	adrp	x1, 0x3000 <.text+0x2000>
    159c:      	adrp	x2, 0x3000 <.text+0x2000>
    15a0:      	adrp	x12, 0x2000 <.text+0x1000>
    15a4:      	mov	x8, xzr
    15a8:      	add	x14, x14, #0xa88
    15ac:      	add	x15, x15, #0xb9c
    15b0:      	add	x16, x16, #0xc48
    15b4:      	add	x17, x17, #0xd88
    15b8:      	add	x5, x5, #0xe68
    15bc:      	stp	x14, x15, [x20, #0x30]
    15c0:      	add	x6, x6, #0x88
    15c4:      	add	x7, x7, #0x1c8
    15c8:      	stp	x16, x17, [x20, #0x40]
    15cc:      	add	x22, x22, #0x210
    15d0:      	add	x0, x0, #0x294
    15d4:      	stp	x5, x6, [x20, #0x50]
    15d8:      	add	x3, x3, #0x2d8
    15dc:      	add	x4, x4, #0x2e0
    15e0:      	stp	x7, x22, [x20, #0x60]
    15e4:      	add	x1, x1, #0x360
    15e8:      	add	x2, x2, #0x474
    15ec:      	stp	x0, x3, [x20, #0x70]
    15f0:      	add	x12, x12, #0x584
    15f4:      	orr	w13, wzr, #0x1
    15f8:      	stp	x4, x1, [x20, #0x80]
    15fc:      	add	x9, x20, #0xf8
    1600:      	add	x11, x20, #0xd2
    1604:      	stp	x2, x12, [x20, #0x90]
    1608:      	mov	w10, #0xfffff8          // =16777208
    160c:      	strb	w13, [x20, #0xd0]
    1610:      	b	0x1634 <.text+0x634>
    1614:      	add	x12, x9, #0x8
    1618:      	strb	wzr, [x11]
    161c:      	add	x8, x8, #0x1
    1620:      	sturb	wzr, [x11, #-0x1]
    1624:      	add	x11, x11, #0x2
    1628:      	str	w10, [x9]
    162c:      	stur	w10, [x9, #-0x4]
    1630:      	mov	x9, x12
    1634:      	cmp	x8, #0x10
    1638:      	b.ne	0x1614 <.text+0x614>
    163c:      	orr	w8, wzr, #0x8
    1640:      	str	xzr, [x20, #0x178]
    1644:      	orr	w9, wzr, #0x1
    1648:      	strh	wzr, [x20, #0x180]
    164c:      	add	x0, x20, #0x1b8
    1650:      	strb	wzr, [x20, #0x182]
    1654:      	str	wzr, [x20, #0x184]
    1658:      	strb	wzr, [x20, #0x189]
    165c:      	strb	wzr, [x20, #0x18a]
    1660:      	str	xzr, [x20, #0x190]
    1664:      	str	w8, [x20, #0x198]
    1668:      	strb	wzr, [x20, #0x19c]
    166c:      	str	wzr, [x20, #0xe0c]
    1670:      	strb	w9, [x20, #0x19d]
    1674:      	strb	wzr, [x20, #0x19e]
    1678:      	strb	wzr, [x20, #0x188]
    167c:      	bl	0xb864 <.text+0xa864>
    1680:      	add	x21, x20, #0x1c8
    1684:      	mov	x0, x21
    1688:      	bl	0xb864 <.text+0xa864>
    168c:      	mov	x22, xzr
    1690:      	b	0x16ac <.text+0x6ac>
    1694:      	orr	w0, wzr, #0x38
    1698:      	bl	0xbf8c <.text+0xaf8c>
    169c:      	mov	x1, x0
    16a0:      	mov	x0, x21
    16a4:      	bl	0xb898 <.text+0xa898>
    16a8:      	add	x22, x22, #0x1
    16ac:      	cmp	x22, #0x5
    16b0:      	b.ne	0x1694 <.text+0x694>
    16b4:      	adrp	x8, 0x13000
    16b8:      	adrp	x0, 0x13000
    16bc:      	mov	x1, xzr
    16c0:      	ldr	x9, [x8, #0x478]
    16c4:      	add	x0, x0, #0xb0
    16c8:      	add	x2, sp, #0x18
    16cc:      	ldr	x9, [x9, #0x140]
    16d0:      	blr	x9
    16d4:      	tbnz	x0, #0x3f, 0x17c4 <.text+0x7c4>
    16d8:      	ldr	x0, [sp, #0x18]
    16dc:      	add	x1, sp, #0x8
    16e0:      	ldr	x10, [x0, #0x8]
    16e4:      	blr	x10
    16e8:      	tbnz	x0, #0x3f, 0x17d0 <.text+0x7d0>
    16ec:      	ldr	w12, [sp, #0x14]
    16f0:      	orr	w0, wzr, #0x8
    16f4:      	str	w12, [x20, #0xb8]
    16f8:      	ldr	w14, [sp, #0x10]
    16fc:      	str	w14, [x20, #0xb4]
    1700:      	ldr	w15, [sp, #0xc]
    1704:      	str	w15, [x20, #0xb0]
    1708:      	ldr	w16, [sp, #0x8]
    170c:      	str	xzr, [x20, #0xdd0]
    1710:      	str	w16, [x20, #0xac]
    1714:      	bl	0xd1ec <.text+0xc1ec>
    1718:      	str	x0, [x20, #0xdd0]
    171c:      	cbz	x0, 0x17dc <.text+0x7dc>
    1720:      	add	x21, x20, #0x9b8
    1724:      	mov	x0, x21
    1728:      	bl	0xb864 <.text+0xa864>
    172c:      	orr	w24, wzr, #0xff
    1730:      	str	wzr, [x20, #0x9c8]
    1734:      	mov	w22, #0x460             // =1120
    1738:      	b	0x1754 <.text+0x754>
    173c:      	mov	x0, x21
    1740:      	mov	x1, x23
    1744:      	bl	0xb898 <.text+0xa898>
    1748:      	ldr	w8, [x20, #0x9c8]
    174c:      	add	w9, w8, #0x1
    1750:      	str	w9, [x20, #0x9c8]
    1754:      	add	w24, w24, #0x1
    1758:      	and	w8, w24, #0xff
    175c:      	cmp	w8, #0x20
    1760:      	b.hs	0x19bc <.text+0x9bc>
    1764:      	mov	x0, x22
    1768:      	bl	0xbf44 <.text+0xaf44>
    176c:      	mov	x23, x0
    1770:      	cbz	x23, 0x17dc <.text+0x7dc>
    1774:      	orr	w0, wzr, #0x40
    1778:      	bl	0xbf44 <.text+0xaf44>
    177c:      	str	x0, [x23, #0x450]
    1780:      	cbnz	x0, 0x173c <.text+0x73c>
    1784:      	adrp	x1, 0xe000 <.text+0xd000>
    1788:      	adrp	x2, 0xe000 <.text+0xd000>
    178c:      	add	x1, x1, #0x2ed
    1790:      	add	x2, x2, #0x45f
    1794:      	orr	w0, wzr, #0x80000000
    1798:      	bl	0xac7c <.text+0x9c7c>
    179c:      	mov	x0, x23
    17a0:      	bl	0xbf9c <.text+0xaf9c>
    17a4:      	b	0x17f4 <.text+0x7f4>
    17a8:      	adrp	x1, 0xe000 <.text+0xd000>
    17ac:      	adrp	x2, 0xe000 <.text+0xd000>
    17b0:      	add	x1, x1, #0x3a5
    17b4:      	add	x2, x2, #0x3ce
    17b8:      	orr	w0, wzr, #0x80000000
    17bc:      	bl	0xac7c <.text+0x9c7c>
    17c0:      	b	0x1818 <.text+0x818>
    17c4:      	adrp	x1, 0xe000 <.text+0xd000>
    17c8:      	add	x1, x1, #0x3e2
    17cc:      	b	0x1804 <.text+0x804>
    17d0:      	adrp	x1, 0xe000 <.text+0xd000>
    17d4:      	add	x1, x1, #0x412
    17d8:      	b	0x1804 <.text+0x804>
    17dc:      	adrp	x1, 0xe000 <.text+0xd000>
    17e0:      	adrp	x2, 0xe000 <.text+0xd000>
    17e4:      	add	x1, x1, #0x2ed
    17e8:      	add	x2, x2, #0x45f
    17ec:      	orr	w0, wzr, #0x80000000
    17f0:      	bl	0xac7c <.text+0x9c7c>
    17f4:      	mov	x0, x20
    17f8:      	bl	0x362c <.text+0x262c>
    17fc:      	adrp	x1, 0xe000 <.text+0xd000>
    1800:      	add	x1, x1, #0x432
    1804:      	adrp	x2, 0xe000 <.text+0xd000>
    1808:      	add	x2, x2, #0x3ce
    180c:      	orr	w0, wzr, #0x80000000
    1810:      	bl	0xac7c <.text+0x9c7c>
    1814:      	mov	x20, xzr
    1818:      	adrp	x23, 0x13000
    181c:      	str	x20, [x23, #0x450]
    1820:      	cbz	x20, 0x1954 <.text+0x954>
    1824:      	adrp	x21, 0x13000
    1828:      	ldr	x0, [sp]
    182c:      	ldr	x3, [x19, #0x28]
    1830:      	adrp	x1, 0x13000
    1834:      	add	x2, x20, #0xa0
    1838:      	ldr	x12, [x21, #0x478]
    183c:      	add	x1, x1, #0xa0
    1840:      	orr	w5, wzr, #0x10
    1844:      	mov	x4, x0
    1848:      	ldr	x17, [x12, #0x118]
    184c:      	blr	x17
    1850:      	mov	x19, x0
    1854:      	tbnz	x19, #0x3f, 0x1978 <.text+0x978>
    1858:      	ldr	x13, [x23, #0x450]
    185c:      	ldr	x0, [x13, #0xa0]
    1860:      	add	x1, x13, #0xa8
    1864:      	ldr	x19, [x0, #0x28]
    1868:      	blr	x19
    186c:      	mov	x19, x0
    1870:      	tbnz	x19, #0x3f, 0x1998 <.text+0x998>
    1874:      	ldr	x14, [x23, #0x450]
    1878:      	ldr	x0, [x14, #0xa0]
    187c:      	add	x2, x14, #0x1d8
    1880:      	ldr	w1, [x14, #0xa8]
    1884:      	ldr	x5, [x0, #0x8]
    1888:      	blr	x5
    188c:      	mov	x19, x0
    1890:      	tbnz	x19, #0x3f, 0x19a4 <.text+0x9a4>
    1894:      	ldr	x15, [x23, #0x450]
    1898:      	mov	w7, #0xf0000            // =983040
    189c:      	movk	w7, #0x8800
    18a0:      	orr	w1, wzr, #0x4
    18a4:      	ldr	x6, [x15, #0x1d8]
    18a8:      	add	x22, x6, x7
    18ac:      	stp	x6, x22, [x15, #0x1e0]
    18b0:      	ldr	x16, [x23, #0x450]
    18b4:      	ldr	x0, [x16, #0xa0]
    18b8:      	ldr	x3, [x0, #0x10]
    18bc:      	ldr	w2, [x0, #0x88]
    18c0:      	blr	x3
    18c4:      	mov	x19, x0
    18c8:      	tbnz	x19, #0x3f, 0x19b0 <.text+0x9b0>
    18cc:      	ldr	x17, [x21, #0x478]
    18d0:      	mov	x0, sp
    18d4:      	ldr	x1, [x23, #0x450]
    18d8:      	mov	x3, xzr
    18dc:      	ldr	x4, [x17, #0x148]
    18e0:      	add	x2, x1, #0x8
    18e4:      	adrp	x1, 0x13000
    18e8:      	add	x1, x1, #0xe0
    18ec:      	blr	x4
    18f0:      	mov	x19, x0
    18f4:      	tbnz	x19, #0x3f, 0x1a5c <.text+0xa5c>
    18f8:      	ldr	x2, [x21, #0x478]
    18fc:      	adrp	x4, 0x13000
    1900:      	ldr	x3, [x23, #0x450]
    1904:      	add	x4, x4, #0x30
    1908:      	orr	w0, wzr, #0x200
    190c:      	orr	w1, wzr, #0x8
    1910:      	ldr	x12, [x2, #0x170]
    1914:      	adrp	x2, 0x1000 <.text>
    1918:      	add	x5, x3, #0xc0
    191c:      	add	x2, x2, #0xb84
    1920:      	blr	x12
    1924:      	mov	x19, x0
    1928:      	tbz	x19, #0x3f, 0x1a74 <.text+0xa74>
    192c:      	adrp	x1, 0xd000 <.text+0xc000>
    1930:      	adrp	x2, 0xd000 <.text+0xc000>
    1934:      	add	x1, x1, #0xe9a
    1938:      	add	x2, x2, #0xd8a
    193c:      	orr	w0, wzr, #0x80000000
    1940:      	mov	x3, x19
    1944:      	bl	0xac7c <.text+0x9c7c>
    1948:      	ldr	x4, [x23, #0x450]
    194c:      	str	xzr, [x4, #0xc0]
    1950:      	b	0x1a74 <.text+0xa74>
    1954:      	adrp	x1, 0xd000 <.text+0xc000>
    1958:      	adrp	x2, 0xd000 <.text+0xc000>
    195c:      	add	x1, x1, #0xd6d
    1960:      	add	x2, x2, #0xd8a
    1964:      	orr	w0, wzr, #0x80000000
    1968:      	bl	0xac7c <.text+0x9c7c>
    196c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1970:      	movk	x19, #0x9
    1974:      	b	0x1a74 <.text+0xa74>
    1978:      	adrp	x1, 0xd000 <.text+0xc000>
    197c:      	adrp	x2, 0xd000 <.text+0xc000>
    1980:      	add	x1, x1, #0xda2
    1984:      	add	x2, x2, #0xd8a
    1988:      	orr	w0, wzr, #0x80000000
    198c:      	mov	x3, x19
    1990:      	bl	0xac7c <.text+0x9c7c>
    1994:      	b	0x1a74 <.text+0xa74>
    1998:      	adrp	x1, 0xd000 <.text+0xc000>
    199c:      	add	x1, x1, #0xdf0
    19a0:      	b	0x1a64 <.text+0xa64>
    19a4:      	adrp	x1, 0xd000 <.text+0xc000>
    19a8:      	add	x1, x1, #0xe1c
    19ac:      	b	0x1a64 <.text+0xa64>
    19b0:      	adrp	x1, 0xd000 <.text+0xc000>
    19b4:      	add	x1, x1, #0xe45
    19b8:      	b	0x1a64 <.text+0xa64>
    19bc:      	mov	x22, xzr
    19c0:      	add	x21, x20, #0x7b8
    19c4:      	b	0x19d0 <.text+0x9d0>
    19c8:      	add	x22, x22, #0x1
    19cc:      	mov	x21, x23
    19d0:      	cmp	x22, #0x10
    19d4:      	b.eq	0x1a0c <.text+0xa0c>
    19d8:      	mov	x24, xzr
    19dc:      	add	x23, x21, #0x20
    19e0:      	b	0x1a00 <.text+0xa00>
    19e4:      	mov	x0, x21
    19e8:      	add	x25, x21, #0x10
    19ec:      	bl	0xb864 <.text+0xa864>
    19f0:      	add	x0, x21, #0x418
    19f4:      	bl	0xb864 <.text+0xa864>
    19f8:      	add	x24, x24, #0x1
    19fc:      	mov	x21, x25
    1a00:      	cmp	x24, #0x2
    1a04:      	b.ne	0x19e4 <.text+0x9e4>
    1a08:      	b	0x19c8 <.text+0x9c8>
    1a0c:      	adrp	x10, 0x13000
    1a10:      	orr	w15, wzr, #0x1
    1a14:      	adrp	x0, 0xe000 <.text+0xd000>
    1a18:      	ldr	x11, [x10, #0x460]
    1a1c:      	adrp	x1, 0x13000
    1a20:      	str	x15, [sp, #0x20]
    1a24:      	add	x0, x0, #0x552
    1a28:      	add	x1, x1, #0x20
    1a2c:      	add	x3, sp, #0x20
    1a30:      	ldr	x16, [x11, #0x48]
    1a34:      	add	x4, sp, #0x2f
    1a38:      	mov	x2, xzr
    1a3c:      	blr	x16
    1a40:      	tbnz	x0, #0x3f, 0x1a94 <.text+0xa94>
    1a44:      	ldrb	w0, [sp, #0x2f]
    1a48:      	add	x10, x20, #0xdd8
    1a4c:      	cbz	w0, 0x1a9c <.text+0xa9c>
    1a50:      	orr	w3, wzr, #0x1
    1a54:      	strb	w3, [x10]
    1a58:      	b	0x1aa0 <.text+0xaa0>
    1a5c:      	adrp	x1, 0xd000 <.text+0xc000>
    1a60:      	add	x1, x1, #0xe73
    1a64:      	adrp	x2, 0xd000 <.text+0xc000>
    1a68:      	add	x2, x2, #0xd8a
    1a6c:      	orr	w0, wzr, #0x80000000
    1a70:      	bl	0xac7c <.text+0x9c7c>
    1a74:      	mov	x0, x19
    1a78:      	sub	sp, x29, #0x40
    1a7c:      	ldp	x29, x30, [sp, #0x40]
    1a80:      	ldp	x20, x19, [sp, #0x30]
    1a84:      	ldp	x22, x21, [sp, #0x20]
    1a88:      	ldp	x24, x23, [sp, #0x10]
    1a8c:      	ldp	x26, x25, [sp], #0x50
    1a90:      	ret
    1a94:      	add	x10, x20, #0xdd8
    1a98:      	strb	wzr, [sp, #0x2f]
    1a9c:      	strb	wzr, [x10]
    1aa0:      	orr	w0, wzr, #0x200
    1aa4:      	strb	wzr, [x20, #0xdd9]
    1aa8:      	strb	wzr, [x20, #0xdda]
    1aac:      	str	xzr, [x20, #0xde0]
    1ab0:      	str	xzr, [x20, #0xde8]
    1ab4:      	strb	wzr, [x20, #0xdf0]
    1ab8:      	strb	wzr, [x20, #0xdf1]
    1abc:      	bl	0xbf8c <.text+0xaf8c>
    1ac0:      	str	x0, [x20, #0xdf8]
    1ac4:      	orr	w0, wzr, #0x200
    1ac8:      	bl	0xbf8c <.text+0xaf8c>
    1acc:      	str	x0, [x20, #0xe00]
    1ad0:      	b	0x1818 <.text+0x818>
    1ad4:      	stp	x22, x21, [sp, #-0x30]!
    1ad8:      	stp	x20, x19, [sp, #0x10]
    1adc:      	stp	x29, x30, [sp, #0x20]
    1ae0:      	add	x29, sp, #0x20
    1ae4:      	sub	sp, sp, #0x10
    1ae8:      	adrp	x21, 0x13000
    1aec:      	mov	x20, x0
    1af0:      	mov	x19, x1
    1af4:      	ldr	x8, [x21, #0x478]
    1af8:      	adrp	x1, 0x13000
    1afc:      	ldr	x3, [x20, #0x28]
    1b00:      	add	x1, x1, #0xe0
    1b04:      	add	x2, sp, #0x8
    1b08:      	orr	w5, wzr, #0x2
    1b0c:      	ldr	x8, [x8, #0x118]
    1b10:      	mov	x0, x19
    1b14:      	mov	x4, x19
    1b18:      	blr	x8
    1b1c:      	tbnz	x0, #0x3f, 0x1b70 <.text+0xb70>
    1b20:      	ldr	x9, [x21, #0x478]
    1b24:      	adrp	x1, 0x13000
    1b28:      	ldr	x2, [sp, #0x8]
    1b2c:      	add	x1, x1, #0xe0
    1b30:      	mov	x0, x19
    1b34:      	ldr	x9, [x9, #0x90]
    1b38:      	blr	x9
    1b3c:      	adrp	x22, 0x13000
    1b40:      	ldr	x1, [x22, #0x450]
    1b44:      	bl	0x1b84 <.text+0xb84>
    1b48:      	ldr	x10, [x21, #0x478]
    1b4c:      	adrp	x1, 0x13000
    1b50:      	ldr	x2, [x20, #0x28]
    1b54:      	add	x1, x1, #0xa0
    1b58:      	mov	x0, x19
    1b5c:      	mov	x3, x19
    1b60:      	ldr	x10, [x10, #0x120]
    1b64:      	blr	x10
    1b68:      	mov	x0, xzr
    1b6c:      	str	xzr, [x22, #0x450]
    1b70:      	sub	sp, x29, #0x20
    1b74:      	ldp	x29, x30, [sp, #0x20]
    1b78:      	ldp	x20, x19, [sp, #0x10]
    1b7c:      	ldp	x22, x21, [sp], #0x30
    1b80:      	ret
    1b84:      	stp	x24, x23, [sp, #-0x40]!
    1b88:      	stp	x22, x21, [sp, #0x10]
    1b8c:      	stp	x20, x19, [sp, #0x20]
    1b90:      	stp	x29, x30, [sp, #0x30]
    1b94:      	add	x29, sp, #0x30
    1b98:      	mov	x19, x1
    1b9c:      	cbz	x19, 0x1c64 <.text+0xc64>
    1ba0:      	mov	x0, x19
    1ba4:      	bl	0x5ff8 <.text+0x4ff8>
    1ba8:      	mov	x0, x19
    1bac:      	bl	0x362c <.text+0x262c>
    1bb0:      	mov	x20, xzr
    1bb4:      	add	x21, x19, #0x638
    1bb8:      	b	0x1bc4 <.text+0xbc4>
    1bbc:      	add	x20, x20, #0x1
    1bc0:      	mov	x21, x22
    1bc4:      	cmp	x20, #0x10
    1bc8:      	b.eq	0x1bf8 <.text+0xbf8>
    1bcc:      	mov	x23, xzr
    1bd0:      	add	x22, x21, #0x10
    1bd4:      	b	0x1be0 <.text+0xbe0>
    1bd8:      	add	x23, x23, #0x1
    1bdc:      	add	x21, x21, #0x8
    1be0:      	cmp	x23, #0x2
    1be4:      	b.eq	0x1bbc <.text+0xbbc>
    1be8:      	ldr	x0, [x21]
    1bec:      	cbz	x0, 0x1bd8 <.text+0xbd8>
    1bf0:      	bl	0xd1b8 <.text+0xc1b8>
    1bf4:      	b	0x1bd8 <.text+0xbd8>
    1bf8:      	ldr	x0, [x19, #0x608]
    1bfc:      	cbz	x0, 0x1c04 <.text+0xc04>
    1c00:      	bl	0xd1b8 <.text+0xc1b8>
    1c04:      	ldrb	w8, [x19, #0xdd8]
    1c08:      	cbz	w8, 0x1c18 <.text+0xc18>
    1c0c:      	ldr	x0, [x19, #0x1b0]
    1c10:      	cbz	x0, 0x1c18 <.text+0xc18>
    1c14:      	bl	0x81f4 <.text+0x71f4>
    1c18:      	ldr	x0, [x19, #0xdf8]
    1c1c:      	cbz	x0, 0x1c24 <.text+0xc24>
    1c20:      	bl	0xbf9c <.text+0xaf9c>
    1c24:      	ldr	x0, [x19, #0xe00]
    1c28:      	cbz	x0, 0x1c30 <.text+0xc30>
    1c2c:      	bl	0xbf9c <.text+0xaf9c>
    1c30:      	ldr	x0, [x19, #0xc0]
    1c34:      	cbz	x0, 0x1c4c <.text+0xc4c>
    1c38:      	adrp	x8, 0x13000
    1c3c:      	ldr	x9, [x8, #0x478]
    1c40:      	ldr	x10, [x9, #0x70]
    1c44:      	blr	x10
    1c48:      	str	xzr, [x19, #0xc0]
    1c4c:      	mov	x0, x19
    1c50:      	ldp	x29, x30, [sp, #0x30]
    1c54:      	ldp	x20, x19, [sp, #0x20]
    1c58:      	ldp	x22, x21, [sp, #0x10]
    1c5c:      	ldp	x24, x23, [sp], #0x40
    1c60:      	b	0xbf9c <.text+0xaf9c>
    1c64:      	ldp	x29, x30, [sp, #0x30]
    1c68:      	adrp	x1, 0xf000 <.text+0xe000>
    1c6c:      	ldp	x20, x19, [sp, #0x20]
    1c70:      	adrp	x2, 0xd000 <.text+0xc000>
    1c74:      	ldp	x22, x21, [sp, #0x10]
    1c78:      	add	x1, x1, #0xce7
    1c7c:      	add	x2, x2, #0xd58
    1c80:      	orr	w0, wzr, #0x80000000
    1c84:      	ldp	x24, x23, [sp], #0x40
    1c88:      	b	0xac7c <.text+0x9c7c>
    1c8c:      	adrp	x2, 0x13000
    1c90:      	mov	x4, xzr
    1c94:      	mov	x5, xzr
    1c98:      	add	x2, x2, #0x160
    1c9c:      	mov	x3, x0
    1ca0:      	b	0xc0c4 <.text+0xb0c4>
    1ca4:      	stp	x22, x21, [sp, #-0x30]!
    1ca8:      	stp	x20, x19, [sp, #0x10]
    1cac:      	stp	x29, x30, [sp, #0x20]
    1cb0:      	add	x29, sp, #0x20
    1cb4:      	mov	x20, x1
    1cb8:      	mov	x19, x0
    1cbc:      	cbz	x19, 0x1d6c <.text+0xd6c>
    1cc0:      	cbz	x20, 0x1d6c <.text+0xd6c>
    1cc4:      	ldrb	w8, [x19, #0x19c]
    1cc8:      	cbnz	w8, 0x1ea8 <.text+0xea8>
    1ccc:      	ldr	w9, [x19, #0xe0c]
    1cd0:      	cbnz	w9, 0x1ce8 <.text+0xce8>
    1cd4:      	ldrb	w10, [x19, #0xdd8]
    1cd8:      	cbz	w10, 0x1e6c <.text+0xe6c>
    1cdc:      	ldr	w10, [x19, #0x184]
    1ce0:      	cmp	w10, #0x4
    1ce4:      	b.ne	0x1e6c <.text+0xe6c>
    1ce8:      	ldrb	w8, [x20, #0x1]
    1cec:      	cmp	w8, #0x6
    1cf0:      	b.ne	0x1d20 <.text+0xd20>
    1cf4:      	ldrb	w13, [x20, #0x3]
    1cf8:      	ldrb	w14, [x20, #0x2]
    1cfc:      	bfi	w14, w13, #8, #8
    1d00:      	lsr	w9, w14, #8
    1d04:      	sub	w11, w9, #0x1
    1d08:      	cmp	w11, #0x2
    1d0c:      	b.hs	0x1da8 <.text+0xda8>
    1d10:      	orr	w17, wzr, #0x1
    1d14:      	strb	w9, [x19, #0xdda]
    1d18:      	strb	w17, [x19, #0xdd9]
    1d1c:      	ldrb	w8, [x20, #0x1]
    1d20:      	cmp	w8, #0x3
    1d24:      	b.eq	0x1e10 <.text+0xe10>
    1d28:      	cmp	w8, #0x30
    1d2c:      	b.eq	0x1efc <.text+0xefc>
    1d30:      	cmp	w8, #0x31
    1d34:      	b.ne	0x1e6c <.text+0xe6c>
    1d38:      	ldr	x4, [x19, #0xe00]
    1d3c:      	mov	w1, wzr
    1d40:      	orr	w2, wzr, #0x1
    1d44:      	mov	x0, x19
    1d48:      	mov	w3, wzr
    1d4c:      	mov	x5, xzr
    1d50:      	orr	w21, wzr, #0x1
    1d54:      	bl	0x5bb0 <.text+0x4bb0>
    1d58:      	mov	x20, x0
    1d5c:      	tbz	x20, #0x3f, 0x1e64 <.text+0xe64>
    1d60:      	adrp	x1, 0xd000 <.text+0xc000>
    1d64:      	add	x1, x1, #0xfe6
    1d68:      	b	0x1f88 <.text+0xf88>
    1d6c:      	adrp	x1, 0xd000 <.text+0xc000>
    1d70:      	adrp	x2, 0xd000 <.text+0xc000>
    1d74:      	mov	w20, #0x2da             // =730
    1d78:      	add	x1, x1, #0xee0
    1d7c:      	add	x2, x2, #0xefe
    1d80:      	orr	w0, wzr, #0x80000000
    1d84:      	mov	w3, w20
    1d88:      	bl	0xac7c <.text+0x9c7c>
    1d8c:      	adrp	x0, 0xd000 <.text+0xc000>
    1d90:      	adrp	x2, 0x11000 <.text+0x10000>
    1d94:      	add	x0, x0, #0xf6a
    1d98:      	add	x2, x2, #0xe70
    1d9c:      	mov	x1, x20
    1da0:      	bl	0xb008 <.text+0xa008>
    1da4:      	b	0x1da4 <.text+0xda4>
    1da8:      	cmp	w9, #0xf
    1dac:      	b.ne	0x1e6c <.text+0xe6c>
    1db0:      	ldr	x9, [x19, #0x1b0]
    1db4:      	mov	w1, wzr
    1db8:      	orr	w2, wzr, #0x1
    1dbc:      	mov	x5, xzr
    1dc0:      	ldr	x4, [x9, #0x10]
    1dc4:      	ldrb	w0, [x4, #0x3]
    1dc8:      	ldrb	w3, [x4, #0x2]
    1dcc:      	bfi	w3, w0, #8, #8
    1dd0:      	mov	x0, x19
    1dd4:      	bl	0x5bb0 <.text+0x4bb0>
    1dd8:      	mov	x20, x0
    1ddc:      	tbnz	x20, #0x3f, 0x1f68 <.text+0xf68>
    1de0:      	ldr	x4, [x19, #0xe00]
    1de4:      	mov	w1, wzr
    1de8:      	mov	w2, wzr
    1dec:      	mov	w3, wzr
    1df0:      	mov	x0, x19
    1df4:      	mov	x5, xzr
    1df8:      	bl	0x5bb0 <.text+0x4bb0>
    1dfc:      	mov	x20, x0
    1e00:      	tbnz	x20, #0x3f, 0x1f80 <.text+0xf80>
    1e04:      	mov	w1, #0x101              // =257
    1e08:      	strh	w1, [x19, #0xdf0]
    1e0c:      	b	0x1eac <.text+0xeac>
    1e10:      	ldrb	w9, [x20, #0x3]
    1e14:      	ldrb	w8, [x20, #0x2]
    1e18:      	bfi	x8, x9, #8, #8
    1e1c:      	cmp	w8, #0x32
    1e20:      	b.hi	0x1e6c <.text+0xe6c>
    1e24:      	mov	x11, #0x7000000000000   // =1970324836974592
    1e28:      	orr	w10, wzr, #0x1
    1e2c:      	movk	x11, #0x4
    1e30:      	lsl	x8, x10, x8
    1e34:      	and	x12, x8, x11
    1e38:      	cbz	x12, 0x1e6c <.text+0xe6c>
    1e3c:      	ldr	x4, [x19, #0xe00]
    1e40:      	mov	w1, wzr
    1e44:      	orr	w2, wzr, #0x1
    1e48:      	mov	x0, x19
    1e4c:      	mov	w3, wzr
    1e50:      	mov	x5, xzr
    1e54:      	orr	w21, wzr, #0x1
    1e58:      	bl	0x5bb0 <.text+0x4bb0>
    1e5c:      	mov	x20, x0
    1e60:      	tbnz	x20, #0x3f, 0x1f5c <.text+0xf5c>
    1e64:      	strb	w21, [x19, #0xdf1]
    1e68:      	b	0x1eac <.text+0xeac>
    1e6c:      	add	x0, x19, #0x1c8
    1e70:      	bl	0xb8fc <.text+0xa8fc>
    1e74:      	mov	x21, x0
    1e78:      	cbz	x21, 0x1ec0 <.text+0xec0>
    1e7c:      	mov	x0, x21
    1e80:      	bl	0xb9a4 <.text+0xa9a4>
    1e84:      	orr	w3, wzr, #0x1
    1e88:      	add	x0, x21, #0x18
    1e8c:      	orr	w2, wzr, #0x8
    1e90:      	mov	x1, x20
    1e94:      	str	w3, [x21, #0x10]
    1e98:      	bl	0xb25c <.text+0xa25c>
    1e9c:      	add	x0, x19, #0x1b8
    1ea0:      	mov	x1, x21
    1ea4:      	bl	0xb898 <.text+0xa898>
    1ea8:      	mov	x20, xzr
    1eac:      	mov	x0, x20
    1eb0:      	ldp	x29, x30, [sp, #0x20]
    1eb4:      	ldp	x20, x19, [sp, #0x10]
    1eb8:      	ldp	x22, x21, [sp], #0x30
    1ebc:      	ret
    1ec0:      	adrp	x1, 0xe000 <.text+0xd000>
    1ec4:      	adrp	x2, 0xd000 <.text+0xc000>
    1ec8:      	mov	w20, #0x352             // =850
    1ecc:      	add	x1, x1, #0x98
    1ed0:      	add	x2, x2, #0xefe
    1ed4:      	orr	w0, wzr, #0x80000000
    1ed8:      	mov	w3, w20
    1edc:      	bl	0xac7c <.text+0x9c7c>
    1ee0:      	adrp	x0, 0xd000 <.text+0xc000>
    1ee4:      	adrp	x2, 0x11000 <.text+0x10000>
    1ee8:      	add	x0, x0, #0xf6a
    1eec:      	add	x2, x2, #0xe70
    1ef0:      	mov	x1, x20
    1ef4:      	bl	0xb008 <.text+0xa008>
    1ef8:      	b	0x1ef8 <.text+0xef8>
    1efc:      	ldr	x4, [x19, #0xdf8]
    1f00:      	mov	w1, wzr
    1f04:      	mov	w2, wzr
    1f08:      	orr	w3, wzr, #0x6
    1f0c:      	mov	x0, x19
    1f10:      	mov	x5, xzr
    1f14:      	bl	0x5bb0 <.text+0x4bb0>
    1f18:      	mov	x20, x0
    1f1c:      	tbnz	x20, #0x3f, 0x1f50 <.text+0xf50>
    1f20:      	ldr	x4, [x19, #0xe00]
    1f24:      	mov	w1, wzr
    1f28:      	orr	w2, wzr, #0x1
    1f2c:      	mov	x0, x19
    1f30:      	mov	w3, wzr
    1f34:      	mov	x5, xzr
    1f38:      	bl	0x5bb0 <.text+0x4bb0>
    1f3c:      	mov	x20, x0
    1f40:      	tbnz	x20, #0x3f, 0x1f74 <.text+0xf74>
    1f44:      	mov	w6, #0x101              // =257
    1f48:      	strh	w6, [x19, #0xdf0]
    1f4c:      	b	0x1eac <.text+0xeac>
    1f50:      	adrp	x1, 0xe000 <.text+0xd000>
    1f54:      	add	x1, x1, #0x18
    1f58:      	b	0x1f88 <.text+0xf88>
    1f5c:      	adrp	x1, 0xe000 <.text+0xd000>
    1f60:      	add	x1, x1, #0x6a
    1f64:      	b	0x1f88 <.text+0xf88>
    1f68:      	adrp	x1, 0xd000 <.text+0xc000>
    1f6c:      	add	x1, x1, #0xf76
    1f70:      	b	0x1f88 <.text+0xf88>
    1f74:      	adrp	x1, 0xe000 <.text+0xd000>
    1f78:      	add	x1, x1, #0x40
    1f7c:      	b	0x1f88 <.text+0xf88>
    1f80:      	adrp	x1, 0xd000 <.text+0xc000>
    1f84:      	add	x1, x1, #0xfb5
    1f88:      	adrp	x2, 0xd000 <.text+0xc000>
    1f8c:      	add	x2, x2, #0xfa5
    1f90:      	orr	w0, wzr, #0x80000000
    1f94:      	bl	0xac7c <.text+0x9c7c>
    1f98:      	b	0x1eac <.text+0xeac>
    1f9c:      	stp	x22, x21, [sp, #-0x30]!
    1fa0:      	stp	x20, x19, [sp, #0x10]
    1fa4:      	stp	x29, x30, [sp, #0x20]
    1fa8:      	add	x29, sp, #0x20
    1fac:      	mov	x20, x1
    1fb0:      	mov	x19, x0
    1fb4:      	cbz	x19, 0x2014 <.text+0x1014>
    1fb8:      	cbz	x20, 0x2014 <.text+0x1014>
    1fbc:      	ldrb	w8, [x19, #0x19c]
    1fc0:      	cbnz	w8, 0x2000 <.text+0x1000>
    1fc4:      	add	x0, x19, #0x1c8
    1fc8:      	bl	0xb8fc <.text+0xa8fc>
    1fcc:      	mov	x21, x0
    1fd0:      	cbz	x21, 0x2050 <.text+0x1050>
    1fd4:      	mov	x0, x21
    1fd8:      	bl	0xb9a4 <.text+0xa9a4>
    1fdc:      	orr	w9, wzr, #0x1
    1fe0:      	add	x0, x21, #0x18
    1fe4:      	orr	w2, wzr, #0x8
    1fe8:      	mov	x1, x20
    1fec:      	str	w9, [x21, #0x10]
    1ff0:      	bl	0xb25c <.text+0xa25c>
    1ff4:      	add	x0, x19, #0x1b8
    1ff8:      	mov	x1, x21
    1ffc:      	bl	0xb898 <.text+0xa898>
    2000:      	ldp	x29, x30, [sp, #0x20]
    2004:      	mov	x0, xzr
    2008:      	ldp	x20, x19, [sp, #0x10]
    200c:      	ldp	x22, x21, [sp], #0x30
    2010:      	ret
    2014:      	adrp	x1, 0xd000 <.text+0xc000>
    2018:      	adrp	x2, 0xd000 <.text+0xc000>
    201c:      	mov	w20, #0x36f             // =879
    2020:      	add	x1, x1, #0xee0
    2024:      	add	x2, x2, #0xefe
    2028:      	orr	w0, wzr, #0x80000000
    202c:      	mov	w3, w20
    2030:      	bl	0xac7c <.text+0x9c7c>
    2034:      	adrp	x0, 0xd000 <.text+0xc000>
    2038:      	adrp	x2, 0x11000 <.text+0x10000>
    203c:      	add	x0, x0, #0xf6a
    2040:      	add	x2, x2, #0xe70
    2044:      	mov	x1, x20
    2048:      	bl	0xb008 <.text+0xa008>
    204c:      	b	0x204c <.text+0x104c>
    2050:      	adrp	x1, 0xe000 <.text+0xd000>
    2054:      	adrp	x2, 0xd000 <.text+0xc000>
    2058:      	mov	w20, #0x37a             // =890
    205c:      	add	x1, x1, #0x98
    2060:      	add	x2, x2, #0xefe
    2064:      	orr	w0, wzr, #0x80000000
    2068:      	mov	w3, w20
    206c:      	bl	0xac7c <.text+0x9c7c>
    2070:      	adrp	x0, 0xd000 <.text+0xc000>
    2074:      	adrp	x2, 0x11000 <.text+0x10000>
    2078:      	add	x0, x0, #0xf6a
    207c:      	add	x2, x2, #0xe70
    2080:      	mov	x1, x20
    2084:      	bl	0xb008 <.text+0xa008>
    2088:      	b	0x2088 <.text+0x1088>
    208c:      	stp	x22, x21, [sp, #-0x30]!
    2090:      	stp	x20, x19, [sp, #0x10]
    2094:      	stp	x29, x30, [sp, #0x20]
    2098:      	add	x29, sp, #0x20
    209c:      	mov	w20, w1
    20a0:      	mov	x19, x0
    20a4:      	cbz	x19, 0x20e8 <.text+0x10e8>
    20a8:      	add	x0, x19, #0x1c8
    20ac:      	bl	0xb8fc <.text+0xa8fc>
    20b0:      	mov	x21, x0
    20b4:      	cbz	x21, 0x2124 <.text+0x1124>
    20b8:      	mov	x0, x21
    20bc:      	bl	0xb9a4 <.text+0xa9a4>
    20c0:      	tst	w20, #0xff
    20c4:      	orr	w9, wzr, #0x4
    20c8:      	cinc	w10, w9, ne
    20cc:      	add	x0, x19, #0x1b8
    20d0:      	mov	x1, x21
    20d4:      	str	w10, [x21, #0x10]
    20d8:      	ldp	x29, x30, [sp, #0x20]
    20dc:      	ldp	x20, x19, [sp, #0x10]
    20e0:      	ldp	x22, x21, [sp], #0x30
    20e4:      	b	0xb898 <.text+0xa898>
    20e8:      	adrp	x1, 0xe000 <.text+0xd000>
    20ec:      	adrp	x2, 0xd000 <.text+0xc000>
    20f0:      	mov	w19, #0x396             // =918
    20f4:      	add	x1, x1, #0xb1
    20f8:      	add	x2, x2, #0xefe
    20fc:      	orr	w0, wzr, #0x80000000
    2100:      	mov	w3, w19
    2104:      	bl	0xac7c <.text+0x9c7c>
    2108:      	adrp	x0, 0xd000 <.text+0xc000>
    210c:      	adrp	x2, 0x11000 <.text+0x10000>
    2110:      	add	x0, x0, #0xf6a
    2114:      	add	x2, x2, #0xe70
    2118:      	mov	x1, x19
    211c:      	bl	0xb008 <.text+0xa008>
    2120:      	b	0x2120 <.text+0x1120>
    2124:      	adrp	x1, 0xe000 <.text+0xd000>
    2128:      	adrp	x2, 0xd000 <.text+0xc000>
    212c:      	mov	w19, #0x39c             // =924
    2130:      	add	x1, x1, #0x98
    2134:      	add	x2, x2, #0xefe
    2138:      	orr	w0, wzr, #0x80000000
    213c:      	mov	w3, w19
    2140:      	bl	0xac7c <.text+0x9c7c>
    2144:      	adrp	x0, 0xd000 <.text+0xc000>
    2148:      	adrp	x2, 0x11000 <.text+0x10000>
    214c:      	add	x0, x0, #0xf6a
    2150:      	add	x2, x2, #0xe70
    2154:      	mov	x1, x19
    2158:      	bl	0xb008 <.text+0xa008>
    215c:      	b	0x215c <.text+0x115c>
    2160:      	stp	x22, x21, [sp, #-0x30]!
    2164:      	stp	x20, x19, [sp, #0x10]
    2168:      	stp	x29, x30, [sp, #0x20]
    216c:      	add	x29, sp, #0x20
    2170:      	mov	w19, w1
    2174:      	mov	x20, x0
    2178:      	cbz	x20, 0x2194 <.text+0x1194>
    217c:      	ldrb	w8, [x20, #0x19c]
    2180:      	cbz	w8, 0x21d0 <.text+0x11d0>
    2184:      	ldp	x29, x30, [sp, #0x20]
    2188:      	ldp	x20, x19, [sp, #0x10]
    218c:      	ldp	x22, x21, [sp], #0x30
    2190:      	ret
    2194:      	adrp	x1, 0xe000 <.text+0xd000>
    2198:      	adrp	x2, 0xd000 <.text+0xc000>
    219c:      	mov	w19, #0x3b7             // =951
    21a0:      	add	x1, x1, #0xb1
    21a4:      	add	x2, x2, #0xefe
    21a8:      	orr	w0, wzr, #0x80000000
    21ac:      	mov	w3, w19
    21b0:      	bl	0xac7c <.text+0x9c7c>
    21b4:      	adrp	x0, 0xd000 <.text+0xc000>
    21b8:      	adrp	x2, 0x11000 <.text+0x10000>
    21bc:      	add	x0, x0, #0xf6a
    21c0:      	add	x2, x2, #0xe70
    21c4:      	mov	x1, x19
    21c8:      	bl	0xb008 <.text+0xa008>
    21cc:      	b	0x21cc <.text+0x11cc>
    21d0:      	add	x0, x20, #0x1c8
    21d4:      	bl	0xb8fc <.text+0xa8fc>
    21d8:      	mov	x21, x0
    21dc:      	cbz	x21, 0x2204 <.text+0x1204>
    21e0:      	mov	x0, x21
    21e4:      	bl	0xb9a4 <.text+0xa9a4>
    21e8:      	str	w19, [x21, #0x10]
    21ec:      	add	x0, x20, #0x1b8
    21f0:      	ldp	x29, x30, [sp, #0x20]
    21f4:      	mov	x1, x21
    21f8:      	ldp	x20, x19, [sp, #0x10]
    21fc:      	ldp	x22, x21, [sp], #0x30
    2200:      	b	0xb898 <.text+0xa898>
    2204:      	adrp	x1, 0xe000 <.text+0xd000>
    2208:      	adrp	x2, 0xd000 <.text+0xc000>
    220c:      	mov	w19, #0x3c2             // =962
    2210:      	add	x1, x1, #0x98
    2214:      	add	x2, x2, #0xefe
    2218:      	orr	w0, wzr, #0x80000000
    221c:      	mov	w3, w19
    2220:      	bl	0xac7c <.text+0x9c7c>
    2224:      	adrp	x0, 0xd000 <.text+0xc000>
    2228:      	adrp	x2, 0x11000 <.text+0x10000>
    222c:      	add	x0, x0, #0xf6a
    2230:      	add	x2, x2, #0xe70
    2234:      	mov	x1, x19
    2238:      	bl	0xb008 <.text+0xa008>
    223c:      	b	0x223c <.text+0x123c>
    2240:      	stp	x22, x21, [sp, #-0x30]!
    2244:      	stp	x20, x19, [sp, #0x10]
    2248:      	stp	x29, x30, [sp, #0x20]
    224c:      	add	x29, sp, #0x20
    2250:      	mov	w20, w1
    2254:      	mov	x19, x0
    2258:      	cbz	x19, 0x2274 <.text+0x1274>
    225c:      	ldrb	w8, [x19, #0x19c]
    2260:      	cbz	w8, 0x22b0 <.text+0x12b0>
    2264:      	ldp	x29, x30, [sp, #0x20]
    2268:      	ldp	x20, x19, [sp, #0x10]
    226c:      	ldp	x22, x21, [sp], #0x30
    2270:      	ret
    2274:      	adrp	x1, 0xe000 <.text+0xd000>
    2278:      	adrp	x2, 0xd000 <.text+0xc000>
    227c:      	mov	w19, #0x3dd             // =989
    2280:      	add	x1, x1, #0xb1
    2284:      	add	x2, x2, #0xefe
    2288:      	orr	w0, wzr, #0x80000000
    228c:      	mov	w3, w19
    2290:      	bl	0xac7c <.text+0x9c7c>
    2294:      	adrp	x0, 0xd000 <.text+0xc000>
    2298:      	adrp	x2, 0x11000 <.text+0x10000>
    229c:      	add	x0, x0, #0xf6a
    22a0:      	add	x2, x2, #0xe70
    22a4:      	mov	x1, x19
    22a8:      	bl	0xb008 <.text+0xa008>
    22ac:      	b	0x22ac <.text+0x12ac>
    22b0:      	add	x0, x19, #0x1c8
    22b4:      	bl	0xb8fc <.text+0xa8fc>
    22b8:      	mov	x21, x0
    22bc:      	cbz	x21, 0x22ec <.text+0x12ec>
    22c0:      	mov	x0, x21
    22c4:      	bl	0xb9a4 <.text+0xa9a4>
    22c8:      	mov	w9, #0x9                // =9
    22cc:      	str	w20, [x21, #0x18]
    22d0:      	add	x0, x19, #0x1b8
    22d4:      	mov	x1, x21
    22d8:      	str	w9, [x21, #0x10]
    22dc:      	ldp	x29, x30, [sp, #0x20]
    22e0:      	ldp	x20, x19, [sp, #0x10]
    22e4:      	ldp	x22, x21, [sp], #0x30
    22e8:      	b	0xb898 <.text+0xa898>
    22ec:      	adrp	x1, 0xe000 <.text+0xd000>
    22f0:      	adrp	x2, 0xd000 <.text+0xc000>
    22f4:      	mov	w19, #0x3e8             // =1000
    22f8:      	add	x1, x1, #0x98
    22fc:      	add	x2, x2, #0xefe
    2300:      	orr	w0, wzr, #0x80000000
    2304:      	mov	w3, w19
    2308:      	bl	0xac7c <.text+0x9c7c>
    230c:      	adrp	x0, 0xd000 <.text+0xc000>
    2310:      	adrp	x2, 0x11000 <.text+0x10000>
    2314:      	add	x0, x0, #0xf6a
    2318:      	add	x2, x2, #0xe70
    231c:      	mov	x1, x19
    2320:      	bl	0xb008 <.text+0xa008>
    2324:      	b	0x2324 <.text+0x1324>
    2328:      	stp	x22, x21, [sp, #-0x30]!
    232c:      	stp	x20, x19, [sp, #0x10]
    2330:      	stp	x29, x30, [sp, #0x20]
    2334:      	add	x29, sp, #0x20
    2338:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    233c:      	mov	x19, x1
    2340:      	mov	x21, x0
    2344:      	movk	x20, #0x2
    2348:      	cbz	x21, 0x23b8 <.text+0x13b8>
    234c:      	cbz	x19, 0x23b8 <.text+0x13b8>
    2350:      	mov	x8, x21
    2354:      	mov	w9, #0x66620000         // =1717698560
    2358:      	movk	w9, #0x7375
    235c:      	ldr	x10, [x8, #-0x8]!
    2360:      	cmp	x10, x9
    2364:      	b.eq	0x2384 <.text+0x1384>
    2368:      	adrp	x0, 0xd000 <.text+0xc000>
    236c:      	adrp	x2, 0xe000 <.text+0xd000>
    2370:      	add	x0, x0, #0xf6a
    2374:      	mov	w1, #0x410              // =1040
    2378:      	add	x2, x2, #0xd6
    237c:      	bl	0xb008 <.text+0xa008>
    2380:      	mov	x8, x21
    2384:      	ldrb	w9, [x8, #0x181]
    2388:      	cbz	w9, 0x23d4 <.text+0x13d4>
    238c:      	ldr	w9, [x8, #0x198]
    2390:      	cmp	w9, #0x7
    2394:      	b.hi	0x23fc <.text+0x13fc>
    2398:      	adrp	x10, 0xd000 <.text+0xc000>
    239c:      	add	x10, x10, #0xc78
    23a0:      	ldr	x8, [x10, x9, lsl #3]
    23a4:      	br	x8
    23a8:      	orr	w10, wzr, #0x1
    23ac:      	mov	x20, xzr
    23b0:      	str	w10, [x19]
    23b4:      	b	0x2414 <.text+0x1414>
    23b8:      	adrp	x1, 0xf000 <.text+0xe000>
    23bc:      	adrp	x2, 0xe000 <.text+0xd000>
    23c0:      	add	x1, x1, #0xce7
    23c4:      	add	x2, x2, #0xc6
    23c8:      	orr	w0, wzr, #0x80000000
    23cc:      	bl	0xac7c <.text+0x9c7c>
    23d0:      	b	0x2414 <.text+0x1414>
    23d4:      	add	x20, x20, #0x4
    23d8:      	b	0x2400 <.text+0x1400>
    23dc:      	orr	w11, wzr, #0x2
    23e0:      	mov	x20, xzr
    23e4:      	str	w11, [x19]
    23e8:      	b	0x2414 <.text+0x1414>
    23ec:      	orr	w12, wzr, #0x3
    23f0:      	mov	x20, xzr
    23f4:      	str	w12, [x19]
    23f8:      	b	0x2414 <.text+0x1414>
    23fc:      	mov	x20, #-0x7ffffffffffffff9 // =-9223372036854775801
    2400:      	str	wzr, [x19]
    2404:      	b	0x2414 <.text+0x1414>
    2408:      	orr	w13, wzr, #0x4
    240c:      	mov	x20, xzr
    2410:      	str	w13, [x19]
    2414:      	mov	x0, x20
    2418:      	ldp	x29, x30, [sp, #0x20]
    241c:      	ldp	x20, x19, [sp, #0x10]
    2420:      	ldp	x22, x21, [sp], #0x30
    2424:      	ret
    2428:      	stp	x22, x21, [sp, #-0x30]!
    242c:      	stp	x20, x19, [sp, #0x10]
    2430:      	stp	x29, x30, [sp, #0x20]
    2434:      	add	x29, sp, #0x20
    2438:      	mov	x19, x1
    243c:      	mov	x21, x0
    2440:      	cbz	x21, 0x24c8 <.text+0x14c8>
    2444:      	cbz	x19, 0x24c8 <.text+0x14c8>
    2448:      	mov	x20, x21
    244c:      	mov	w8, #0x66620000         // =1717698560
    2450:      	movk	w8, #0x7375
    2454:      	ldr	x9, [x20, #-0x8]!
    2458:      	cmp	x9, x8
    245c:      	b.eq	0x247c <.text+0x147c>
    2460:      	adrp	x0, 0xd000 <.text+0xc000>
    2464:      	adrp	x2, 0xe000 <.text+0xd000>
    2468:      	add	x0, x0, #0xf6a
    246c:      	mov	w1, #0x448              // =1096
    2470:      	add	x2, x2, #0xd6
    2474:      	bl	0xb008 <.text+0xa008>
    2478:      	mov	x20, x21
    247c:      	cbz	x20, 0x24ec <.text+0x14ec>
    2480:      	mov	x0, x20
    2484:      	bl	0x5ff8 <.text+0x4ff8>
    2488:      	ldrb	w8, [x20, #0xdd8]
    248c:      	add	x21, x20, #0x1b0
    2490:      	str	x19, [x20, #0x1a8]
    2494:      	cbz	w8, 0x2528 <.text+0x1528>
    2498:      	ldr	x0, [x21]
    249c:      	cbz	x0, 0x24a8 <.text+0x14a8>
    24a0:      	bl	0x81f4 <.text+0x71f4>
    24a4:      	str	xzr, [x21]
    24a8:      	mov	x0, x20
    24ac:      	mov	x1, x19
    24b0:      	mov	x2, x21
    24b4:      	bl	0x7d34 <.text+0x6d34>
    24b8:      	mov	x19, x0
    24bc:      	tbnz	x19, #0x3f, 0x2558 <.text+0x1558>
    24c0:      	ldp	x19, x1, [x20, #0x1a8]
    24c4:      	b	0x2530 <.text+0x1530>
    24c8:      	adrp	x1, 0xf000 <.text+0xe000>
    24cc:      	adrp	x2, 0xe000 <.text+0xd000>
    24d0:      	add	x1, x1, #0xce7
    24d4:      	add	x2, x2, #0xeb
    24d8:      	orr	w0, wzr, #0x80000000
    24dc:      	bl	0xac7c <.text+0x9c7c>
    24e0:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    24e4:      	movk	x19, #0x2
    24e8:      	b	0x2570 <.text+0x1570>
    24ec:      	adrp	x1, 0xe000 <.text+0xd000>
    24f0:      	adrp	x2, 0xd000 <.text+0xc000>
    24f4:      	mov	w19, #0x44a             // =1098
    24f8:      	add	x1, x1, #0xb1
    24fc:      	add	x2, x2, #0xefe
    2500:      	orr	w0, wzr, #0x80000000
    2504:      	mov	w3, w19
    2508:      	bl	0xac7c <.text+0x9c7c>
    250c:      	adrp	x0, 0xd000 <.text+0xc000>
    2510:      	adrp	x2, 0x11000 <.text+0x10000>
    2514:      	add	x0, x0, #0xf6a
    2518:      	add	x2, x2, #0xe70
    251c:      	mov	x1, x19
    2520:      	bl	0xb008 <.text+0xa008>
    2524:      	b	0x2524 <.text+0x1524>
    2528:      	mov	x1, xzr
    252c:      	str	xzr, [x21]
    2530:      	mov	x0, x19
    2534:      	bl	0x8230 <.text+0x7230>
    2538:      	mov	x19, x0
    253c:      	tbnz	x19, #0x3f, 0x254c <.text+0x154c>
    2540:      	mov	x0, x20
    2544:      	bl	0x5fdc <.text+0x4fdc>
    2548:      	b	0x2570 <.text+0x1570>
    254c:      	adrp	x1, 0xe000 <.text+0xd000>
    2550:      	add	x1, x1, #0x136
    2554:      	b	0x2560 <.text+0x1560>
    2558:      	adrp	x1, 0xe000 <.text+0xd000>
    255c:      	add	x1, x1, #0x109
    2560:      	adrp	x2, 0xe000 <.text+0xd000>
    2564:      	add	x2, x2, #0xeb
    2568:      	orr	w0, wzr, #0x80000000
    256c:      	bl	0xac7c <.text+0x9c7c>
    2570:      	mov	x0, x19
    2574:      	ldp	x29, x30, [sp, #0x20]
    2578:      	ldp	x20, x19, [sp, #0x10]
    257c:      	ldp	x22, x21, [sp], #0x30
    2580:      	ret
    2584:      	stp	x22, x21, [sp, #-0x30]!
    2588:      	stp	x20, x19, [sp, #0x10]
    258c:      	stp	x29, x30, [sp, #0x20]
    2590:      	add	x29, sp, #0x20
    2594:      	mov	x19, x2
    2598:      	mov	x20, x1
    259c:      	mov	x22, x0
    25a0:      	cbz	x22, 0x2610 <.text+0x1610>
    25a4:      	cbz	x20, 0x2610 <.text+0x1610>
    25a8:      	cbz	x19, 0x2610 <.text+0x1610>
    25ac:      	mov	x21, x22
    25b0:      	mov	w8, #0x66620000         // =1717698560
    25b4:      	movk	w8, #0x7375
    25b8:      	ldr	x9, [x21, #-0x8]!
    25bc:      	cmp	x9, x8
    25c0:      	b.eq	0x25e0 <.text+0x15e0>
    25c4:      	adrp	x0, 0xd000 <.text+0xc000>
    25c8:      	adrp	x2, 0xe000 <.text+0xd000>
    25cc:      	add	x0, x0, #0xf6a
    25d0:      	mov	w1, #0x486              // =1158
    25d4:      	add	x2, x2, #0xd6
    25d8:      	bl	0xb008 <.text+0xa008>
    25dc:      	mov	x21, x22
    25e0:      	cbz	x21, 0x2634 <.text+0x1634>
    25e4:      	mov	x0, x21
    25e8:      	bl	0x5ff8 <.text+0x4ff8>
    25ec:      	mov	x0, x20
    25f0:      	stp	x20, x19, [x21, #0x1a8]
    25f4:      	mov	x1, x19
    25f8:      	bl	0x8230 <.text+0x7230>
    25fc:      	mov	x19, x0
    2600:      	tbnz	x19, #0x3f, 0x2670 <.text+0x1670>
    2604:      	mov	x0, x21
    2608:      	bl	0x5fdc <.text+0x4fdc>
    260c:      	b	0x2688 <.text+0x1688>
    2610:      	adrp	x1, 0xf000 <.text+0xe000>
    2614:      	adrp	x2, 0xe000 <.text+0xd000>
    2618:      	add	x1, x1, #0xce7
    261c:      	add	x2, x2, #0x14e
    2620:      	orr	w0, wzr, #0x80000000
    2624:      	bl	0xac7c <.text+0x9c7c>
    2628:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    262c:      	movk	x19, #0x2
    2630:      	b	0x2688 <.text+0x1688>
    2634:      	adrp	x1, 0xe000 <.text+0xd000>
    2638:      	adrp	x2, 0xd000 <.text+0xc000>
    263c:      	mov	w20, #0x487             // =1159
    2640:      	add	x1, x1, #0xb1
    2644:      	add	x2, x2, #0xefe
    2648:      	orr	w0, wzr, #0x80000000
    264c:      	mov	w3, w20
    2650:      	bl	0xac7c <.text+0x9c7c>
    2654:      	adrp	x0, 0xd000 <.text+0xc000>
    2658:      	adrp	x2, 0x11000 <.text+0x10000>
    265c:      	add	x0, x0, #0xf6a
    2660:      	add	x2, x2, #0xe70
    2664:      	mov	x1, x20
    2668:      	bl	0xb008 <.text+0xa008>
    266c:      	b	0x266c <.text+0x166c>
    2670:      	adrp	x1, 0xe000 <.text+0xd000>
    2674:      	adrp	x2, 0xe000 <.text+0xd000>
    2678:      	add	x1, x1, #0x136
    267c:      	add	x2, x2, #0x14e
    2680:      	orr	w0, wzr, #0x80000000
    2684:      	bl	0xac7c <.text+0x9c7c>
    2688:      	mov	x0, x19
    268c:      	ldp	x29, x30, [sp, #0x20]
    2690:      	ldp	x20, x19, [sp, #0x10]
    2694:      	ldp	x22, x21, [sp], #0x30
    2698:      	ret
    269c:      	cmp	w2, #0x4
    26a0:      	ccmp	w1, #0x3, #0x2, ls
    26a4:      	ccmp	x0, #0x0, #0x4, ls
    26a8:      	ccmp	x3, #0x0, #0x4, ne
    26ac:      	b.ne	0x26e0 <.text+0x16e0>
    26b0:      	stp	x29, x30, [sp, #-0x10]!
    26b4:      	mov	x29, sp
    26b8:      	adrp	x1, 0xf000 <.text+0xe000>
    26bc:      	adrp	x2, 0xe000 <.text+0xd000>
    26c0:      	add	x1, x1, #0xce7
    26c4:      	add	x2, x2, #0x16e
    26c8:      	orr	w0, wzr, #0x80000000
    26cc:      	bl	0xac7c <.text+0x9c7c>
    26d0:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    26d4:      	movk	x0, #0x2
    26d8:      	ldp	x29, x30, [sp], #0x10
    26dc:      	ret
    26e0:      	mov	w8, w1
    26e4:      	mov	w9, #0x28               // =40
    26e8:      	adrp	x10, 0xd000 <.text+0xc000>
    26ec:      	add	x10, x10, #0xcb8
    26f0:      	madd	x8, x8, x9, x10
    26f4:      	mov	x0, xzr
    26f8:      	ldr	x11, [x8, w2, uxtw #3]
    26fc:      	strh	w11, [x3]
    2700:      	ret
    2704:      	stp	x28, x27, [sp, #-0x60]!
    2708:      	stp	x26, x25, [sp, #0x10]
    270c:      	stp	x24, x23, [sp, #0x20]
    2710:      	stp	x22, x21, [sp, #0x30]
    2714:      	stp	x20, x19, [sp, #0x40]
    2718:      	stp	x29, x30, [sp, #0x50]
    271c:      	add	x29, sp, #0x50
    2720:      	sub	sp, sp, #0x270
    2724:      	adrp	x24, 0x13000
    2728:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    272c:      	mov	x20, x3
    2730:      	ldr	x24, [x24]
    2734:      	mov	x21, x2
    2738:      	movk	x19, #0x2
    273c:      	stur	x24, [x29, #-0x58]
    2740:      	cbz	x0, 0x279c <.text+0x179c>
    2744:      	cbz	x21, 0x279c <.text+0x179c>
    2748:      	cmp	w1, #0x3
    274c:      	b.eq	0x2814 <.text+0x1814>
    2750:      	cmp	w1, #0x2
    2754:      	b.eq	0x27e4 <.text+0x17e4>
    2758:      	cmp	w1, #0x1
    275c:      	b.ne	0x279c <.text+0x179c>
    2760:      	add	x0, sp, #0x30
    2764:      	stp	xzr, xzr, [sp, #0x20]
    2768:      	orr	w2, wzr, #0x100
    276c:      	str	xzr, [sp, #0x18]
    2770:      	mov	w1, wzr
    2774:      	str	wzr, [sp, #0x14]
    2778:      	bl	0xd364 <.text+0xc364>
    277c:      	cbnz	x20, 0x2844 <.text+0x1844>
    2780:      	ldr	x10, [x21]
    2784:      	cbz	x10, 0x2844 <.text+0x1844>
    2788:      	adrp	x1, 0xf000 <.text+0xe000>
    278c:      	adrp	x2, 0xe000 <.text+0xd000>
    2790:      	add	x1, x1, #0xce7
    2794:      	add	x2, x2, #0x473
    2798:      	b	0x27ac <.text+0x17ac>
    279c:      	adrp	x1, 0xf000 <.text+0xe000>
    27a0:      	adrp	x2, 0xe000 <.text+0xd000>
    27a4:      	add	x1, x1, #0xce7
    27a8:      	add	x2, x2, #0x18c
    27ac:      	orr	w0, wzr, #0x80000000
    27b0:      	bl	0xac7c <.text+0x9c7c>
    27b4:      	ldur	x22, [x29, #-0x58]
    27b8:      	sub	x2, x24, x22
    27bc:      	cbnz	x2, 0x2a84 <.text+0x1a84>
    27c0:      	mov	x0, x19
    27c4:      	sub	sp, x29, #0x50
    27c8:      	ldp	x29, x30, [sp, #0x50]
    27cc:      	ldp	x20, x19, [sp, #0x40]
    27d0:      	ldp	x22, x21, [sp, #0x30]
    27d4:      	ldp	x24, x23, [sp, #0x20]
    27d8:      	ldp	x26, x25, [sp, #0x10]
    27dc:      	ldp	x28, x27, [sp], #0x60
    27e0:      	ret
    27e4:      	adrp	x0, 0xd000 <.text+0xc000>
    27e8:      	add	x0, x0, #0xbf8
    27ec:      	bl	0xbc44 <.text+0xac44>
    27f0:      	ldr	x8, [x21]
    27f4:      	cbnz	x20, 0x27fc <.text+0x17fc>
    27f8:      	cbnz	x8, 0x27b4 <.text+0x17b4>
    27fc:      	sub	x22, x0, #0x2
    2800:      	cmp	x8, x22
    2804:      	b.lo	0x2838 <.text+0x1838>
    2808:      	adrp	x1, 0xd000 <.text+0xc000>
    280c:      	add	x1, x1, #0xbf8
    2810:      	b	0x299c <.text+0x199c>
    2814:      	adrp	x0, 0xd000 <.text+0xc000>
    2818:      	add	x0, x0, #0xc30
    281c:      	bl	0xbc44 <.text+0xac44>
    2820:      	ldr	x9, [x21]
    2824:      	cbnz	x20, 0x282c <.text+0x182c>
    2828:      	cbnz	x9, 0x27b4 <.text+0x17b4>
    282c:      	sub	x22, x0, #0x2
    2830:      	cmp	x9, x22
    2834:      	b.hs	0x2994 <.text+0x1994>
    2838:      	add	x19, x19, #0x3
    283c:      	str	x22, [x21]
    2840:      	b	0x27b4 <.text+0x17b4>
    2844:      	adrp	x25, 0x13000
    2848:      	adrp	x1, 0x13000
    284c:      	add	x1, x1, #0xd0
    2850:      	ldr	x10, [x25, #0x478]
    2854:      	orr	w0, wzr, #0x2
    2858:      	add	x3, sp, #0x18
    285c:      	add	x4, sp, #0x20
    2860:      	mov	x2, xzr
    2864:      	ldr	x11, [x10, #0x138]
    2868:      	blr	x11
    286c:      	mov	x22, x0
    2870:      	tbnz	x22, #0x3f, 0x29b4 <.text+0x19b4>
    2874:      	mov	w26, #0x20730000        // =544407552
    2878:      	adrp	x22, 0x13000
    287c:      	adrp	x23, 0x13000
    2880:      	mov	w8, wzr
    2884:      	movk	w26, #0x6675
    2888:      	add	x22, x22, #0xc0
    288c:      	add	x23, x23, #0xd0
    2890:      	b	0x2898 <.text+0x1898>
    2894:      	add	w8, w27, #0x1
    2898:      	ldr	x12, [sp, #0x18]
    289c:      	and	w27, w8, #0xff
    28a0:      	cmp	x27, x12
    28a4:      	b.hs	0x290c <.text+0x190c>
    28a8:      	ldr	x11, [x25, #0x478]
    28ac:      	add	x2, sp, #0x8
    28b0:      	ldr	x12, [sp, #0x20]
    28b4:      	mov	x1, x22
    28b8:      	ldr	x14, [x11, #0x98]
    28bc:      	ldr	x0, [x12, x27, lsl #3]
    28c0:      	blr	x14
    28c4:      	tbnz	x0, #0x3f, 0x2894 <.text+0x1894>
    28c8:      	ldr	x13, [sp, #0x8]
    28cc:      	ldr	x8, [x13, #0x8]
    28d0:      	ldrb	w11, [x8, #0x4]
    28d4:      	cbnz	w11, 0x2894 <.text+0x1894>
    28d8:      	ldr	w12, [x8]
    28dc:      	cmp	w12, w26
    28e0:      	b.ne	0x2894 <.text+0x1894>
    28e4:      	ldr	x14, [x25, #0x478]
    28e8:      	add	x2, sp, #0x28
    28ec:      	ldr	x15, [sp, #0x20]
    28f0:      	mov	x1, x23
    28f4:      	ldr	x16, [x14, #0x98]
    28f8:      	ldr	x0, [x15, x27, lsl #3]
    28fc:      	blr	x16
    2900:      	tbz	x0, #0x3f, 0x290c <.text+0x190c>
    2904:      	str	xzr, [sp, #0x28]
    2908:      	b	0x2894 <.text+0x1894>
    290c:      	ldr	x16, [x25, #0x478]
    2910:      	ldr	x0, [sp, #0x20]
    2914:      	ldr	x15, [x16, #0x48]
    2918:      	blr	x15
    291c:      	ldr	x0, [sp, #0x28]
    2920:      	cbz	x0, 0x29c0 <.text+0x19c0>
    2924:      	ldr	x17, [x0, #0x8]
    2928:      	add	x1, sp, #0x130
    292c:      	add	x23, sp, #0x130
    2930:      	blr	x17
    2934:      	mov	x22, x0
    2938:      	tbnz	x22, #0x3f, 0x29e0 <.text+0x19e0>
    293c:      	ldr	x17, [x25, #0x478]
    2940:      	add	x0, x23, #0xc
    2944:      	ldr	w1, [sp, #0x238]
    2948:      	add	x2, sp, #0x14
    294c:      	ldr	x3, [x17, #0x158]
    2950:      	blr	x3
    2954:      	mov	x23, x0
    2958:      	tbnz	x23, #0x3f, 0x2a04 <.text+0x1a04>
    295c:      	ldr	w3, [sp, #0x14]
    2960:      	adrp	x2, 0xe000 <.text+0xd000>
    2964:      	add	x2, x2, #0x530
    2968:      	add	x0, sp, #0x30
    296c:      	orr	w1, wzr, #0x100
    2970:      	bl	0xaa38 <.text+0x9a38>
    2974:      	cbz	x0, 0x2a28 <.text+0x1a28>
    2978:      	ldr	x4, [x21]
    297c:      	cmp	x4, x0, lsl #1
    2980:      	b.hs	0x2a4c <.text+0x1a4c>
    2984:      	lsl	x6, x0, #1
    2988:      	add	x19, x19, #0x3
    298c:      	str	x6, [x21]
    2990:      	b	0x27b4 <.text+0x17b4>
    2994:      	adrp	x1, 0xd000 <.text+0xc000>
    2998:      	add	x1, x1, #0xc30
    299c:      	mov	x0, x20
    29a0:      	mov	x2, x22
    29a4:      	bl	0xb25c <.text+0xa25c>
    29a8:      	mov	x19, xzr
    29ac:      	str	x22, [x21]
    29b0:      	b	0x27b4 <.text+0x17b4>
    29b4:      	adrp	x1, 0xe000 <.text+0xd000>
    29b8:      	add	x1, x1, #0x486
    29bc:      	b	0x29e8 <.text+0x19e8>
    29c0:      	adrp	x1, 0xe000 <.text+0xd000>
    29c4:      	adrp	x2, 0xe000 <.text+0xd000>
    29c8:      	add	x1, x1, #0x4c6
    29cc:      	add	x2, x2, #0x473
    29d0:      	orr	w0, wzr, #0x80000000
    29d4:      	bl	0xac7c <.text+0x9c7c>
    29d8:      	mov	x19, #-0x7ffffffffffffff9 // =-9223372036854775801
    29dc:      	b	0x27b4 <.text+0x17b4>
    29e0:      	adrp	x1, 0xe000 <.text+0xd000>
    29e4:      	add	x1, x1, #0x4f5
    29e8:      	adrp	x2, 0xe000 <.text+0xd000>
    29ec:      	add	x2, x2, #0x473
    29f0:      	orr	w0, wzr, #0x80000000
    29f4:      	mov	x3, x22
    29f8:      	bl	0xac7c <.text+0x9c7c>
    29fc:      	mov	x19, x22
    2a00:      	b	0x27b4 <.text+0x17b4>
    2a04:      	adrp	x1, 0xe000 <.text+0xd000>
    2a08:      	adrp	x2, 0xe000 <.text+0xd000>
    2a0c:      	add	x1, x1, #0x511
    2a10:      	add	x2, x2, #0x473
    2a14:      	orr	w0, wzr, #0x80000000
    2a18:      	mov	x3, x23
    2a1c:      	bl	0xac7c <.text+0x9c7c>
    2a20:      	mov	x19, x23
    2a24:      	b	0x27b4 <.text+0x17b4>
    2a28:      	adrp	x1, 0xe000 <.text+0xd000>
    2a2c:      	adrp	x2, 0xe000 <.text+0xd000>
    2a30:      	add	x1, x1, #0x533
    2a34:      	add	x2, x2, #0x473
    2a38:      	orr	w0, wzr, #0x80000000
    2a3c:      	mov	x3, xzr
    2a40:      	bl	0xac7c <.text+0x9c7c>
    2a44:      	mov	x19, #-0x7ffffffffffffff9 // =-9223372036854775801
    2a48:      	b	0x27b4 <.text+0x17b4>
    2a4c:      	mov	w9, wzr
    2a50:      	add	x8, sp, #0x30
    2a54:      	b	0x2a70 <.text+0x1a70>
    2a58:      	ldrb	w14, [x8, x9]
    2a5c:      	lsl	x23, x9, #1
    2a60:      	orr	w10, w23, #0x1
    2a64:      	add	w9, w9, #0x1
    2a68:      	strb	w14, [x20, x23]
    2a6c:      	strb	wzr, [x20, w10, uxtw]
    2a70:      	and	w9, w9, #0xff
    2a74:      	cmp	x9, x0
    2a78:      	b.lo	0x2a58 <.text+0x1a58>
    2a7c:      	mov	x19, xzr
    2a80:      	b	0x27b4 <.text+0x17b4>
    2a84:      	bl	0x117c <.text+0x17c>
    2a88:      	stp	x22, x21, [sp, #-0x30]!
    2a8c:      	stp	x20, x19, [sp, #0x10]
    2a90:      	stp	x29, x30, [sp, #0x20]
    2a94:      	add	x29, sp, #0x20
    2a98:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    2a9c:      	mov	x20, x2
    2aa0:      	mov	x21, x1
    2aa4:      	mov	x22, x0
    2aa8:      	movk	x19, #0x2
    2aac:      	cbz	x22, 0x2b2c <.text+0x1b2c>
    2ab0:      	cbz	x21, 0x2b2c <.text+0x1b2c>
    2ab4:      	cbz	x20, 0x2b2c <.text+0x1b2c>
    2ab8:      	mov	x8, x22
    2abc:      	mov	w9, #0x66620000         // =1717698560
    2ac0:      	movk	w9, #0x7375
    2ac4:      	ldr	x10, [x8, #-0x8]!
    2ac8:      	cmp	x10, x9
    2acc:      	b.eq	0x2aec <.text+0x1aec>
    2ad0:      	adrp	x0, 0xd000 <.text+0xc000>
    2ad4:      	adrp	x2, 0xe000 <.text+0xd000>
    2ad8:      	add	x0, x0, #0xf6a
    2adc:      	mov	w1, #0x603              // =1539
    2ae0:      	add	x2, x2, #0xd6
    2ae4:      	bl	0xb008 <.text+0xa008>
    2ae8:      	mov	x8, x22
    2aec:      	cbz	x8, 0x2b48 <.text+0x1b48>
    2af0:      	ldr	x10, [x8, #0x1a8]
    2af4:      	ldr	x9, [x10]
    2af8:      	cbz	x9, 0x2b84 <.text+0x1b84>
    2afc:      	ldrb	w10, [x9, #0x9]
    2b00:      	mov	x19, xzr
    2b04:      	ldrb	w9, [x9, #0x8]
    2b08:      	bfi	w9, w10, #8, #24
    2b0c:      	strh	w9, [x21]
    2b10:      	ldr	x11, [x8, #0x1a8]
    2b14:      	ldr	x12, [x11]
    2b18:      	ldrb	w8, [x12, #0xb]
    2b1c:      	ldrb	w11, [x12, #0xa]
    2b20:      	bfi	w11, w8, #8, #24
    2b24:      	strh	w11, [x20]
    2b28:      	b	0x2b88 <.text+0x1b88>
    2b2c:      	adrp	x1, 0xf000 <.text+0xe000>
    2b30:      	adrp	x2, 0xe000 <.text+0xd000>
    2b34:      	add	x1, x1, #0xce7
    2b38:      	add	x2, x2, #0x19f
    2b3c:      	orr	w0, wzr, #0x80000000
    2b40:      	bl	0xac7c <.text+0x9c7c>
    2b44:      	b	0x2b88 <.text+0x1b88>
    2b48:      	adrp	x1, 0xe000 <.text+0xd000>
    2b4c:      	adrp	x2, 0xd000 <.text+0xc000>
    2b50:      	mov	w19, #0x604             // =1540
    2b54:      	add	x1, x1, #0xb1
    2b58:      	add	x2, x2, #0xefe
    2b5c:      	orr	w0, wzr, #0x80000000
    2b60:      	mov	w3, w19
    2b64:      	bl	0xac7c <.text+0x9c7c>
    2b68:      	adrp	x0, 0xd000 <.text+0xc000>
    2b6c:      	adrp	x2, 0x11000 <.text+0x10000>
    2b70:      	add	x0, x0, #0xf6a
    2b74:      	add	x2, x2, #0xe70
    2b78:      	mov	x1, x19
    2b7c:      	bl	0xb008 <.text+0xa008>
    2b80:      	b	0x2b80 <.text+0x1b80>
    2b84:      	add	x19, x19, #0xc
    2b88:      	mov	x0, x19
    2b8c:      	ldp	x29, x30, [sp, #0x20]
    2b90:      	ldp	x20, x19, [sp, #0x10]
    2b94:      	ldp	x22, x21, [sp], #0x30
    2b98:      	ret
    2b9c:      	stp	x22, x21, [sp, #-0x30]!
    2ba0:      	stp	x20, x19, [sp, #0x10]
    2ba4:      	stp	x29, x30, [sp, #0x20]
    2ba8:      	add	x29, sp, #0x20
    2bac:      	mov	w19, w2
    2bb0:      	mov	w20, w1
    2bb4:      	mov	x21, x0
    2bb8:      	cbz	x21, 0x2bcc <.text+0x1bcc>
    2bbc:      	and	w8, w20, #0xff
    2bc0:      	cmp	w8, #0xf
    2bc4:      	ccmp	w19, #0x1, #0x2, ls
    2bc8:      	b.ls	0x2bfc <.text+0x1bfc>
    2bcc:      	adrp	x1, 0xf000 <.text+0xe000>
    2bd0:      	adrp	x2, 0xe000 <.text+0xd000>
    2bd4:      	add	x1, x1, #0xce7
    2bd8:      	add	x2, x2, #0x1b9
    2bdc:      	orr	w0, wzr, #0x80000000
    2be0:      	bl	0xac7c <.text+0x9c7c>
    2be4:      	ldp	x29, x30, [sp, #0x20]
    2be8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    2bec:      	ldp	x20, x19, [sp, #0x10]
    2bf0:      	movk	x0, #0x2
    2bf4:      	ldp	x22, x21, [sp], #0x30
    2bf8:      	ret
    2bfc:      	mov	x0, x21
    2c00:      	mov	w8, #0x66620000         // =1717698560
    2c04:      	movk	w8, #0x7375
    2c08:      	ldr	x9, [x0, #-0x8]!
    2c0c:      	cmp	x9, x8
    2c10:      	b.eq	0x2c30 <.text+0x1c30>
    2c14:      	adrp	x0, 0xd000 <.text+0xc000>
    2c18:      	adrp	x2, 0xe000 <.text+0xd000>
    2c1c:      	add	x0, x0, #0xf6a
    2c20:      	mov	w1, #0x62b              // =1579
    2c24:      	add	x2, x2, #0xd6
    2c28:      	bl	0xb008 <.text+0xa008>
    2c2c:      	mov	x0, x21
    2c30:      	mov	w1, w20
    2c34:      	mov	w2, w19
    2c38:      	ldp	x29, x30, [sp, #0x20]
    2c3c:      	ldp	x20, x19, [sp, #0x10]
    2c40:      	ldp	x22, x21, [sp], #0x30
    2c44:      	b	0x51e8 <.text+0x41e8>
    2c48:      	stp	x22, x21, [sp, #-0x30]!
    2c4c:      	stp	x20, x19, [sp, #0x10]
    2c50:      	stp	x29, x30, [sp, #0x20]
    2c54:      	add	x29, sp, #0x20
    2c58:      	sub	sp, sp, #0x10
    2c5c:      	mov	x19, x3
    2c60:      	mov	w20, w2
    2c64:      	mov	w21, w1
    2c68:      	mov	x22, x0
    2c6c:      	cbz	x22, 0x2cec <.text+0x1cec>
    2c70:      	cbz	x19, 0x2cec <.text+0x1cec>
    2c74:      	mov	x8, x22
    2c78:      	mov	w9, #0x66620000         // =1717698560
    2c7c:      	movk	w9, #0x7375
    2c80:      	ldr	x10, [x8, #-0x8]!
    2c84:      	cmp	x10, x9
    2c88:      	b.eq	0x2ca8 <.text+0x1ca8>
    2c8c:      	adrp	x0, 0xd000 <.text+0xc000>
    2c90:      	adrp	x2, 0xe000 <.text+0xd000>
    2c94:      	add	x0, x0, #0xf6a
    2c98:      	mov	w1, #0x650              // =1616
    2c9c:      	add	x2, x2, #0xd6
    2ca0:      	bl	0xb008 <.text+0xa008>
    2ca4:      	mov	x8, x22
    2ca8:      	cbz	x8, 0x2d10 <.text+0x1d10>
    2cac:      	add	x0, x8, #0x1f0
    2cb0:      	strb	wzr, [x19]
    2cb4:      	add	x3, sp, #0xc
    2cb8:      	mov	w1, w21
    2cbc:      	mov	w2, w20
    2cc0:      	bl	0x921c <.text+0x821c>
    2cc4:      	mov	w8, w0
    2cc8:      	tbnz	w8, #0x1f, 0x2d4c <.text+0x1d4c>
    2ccc:      	ldr	w8, [sp, #0xc]
    2cd0:      	cmp	w8, #0x5
    2cd4:      	ccmp	w8, #0x3, #0x4, ne
    2cd8:      	b.ne	0x2d70 <.text+0x1d70>
    2cdc:      	orr	w10, wzr, #0x1
    2ce0:      	mov	x0, xzr
    2ce4:      	strb	w10, [x19]
    2ce8:      	b	0x2d74 <.text+0x1d74>
    2cec:      	adrp	x1, 0xf000 <.text+0xe000>
    2cf0:      	adrp	x2, 0xe000 <.text+0xd000>
    2cf4:      	add	x1, x1, #0xce7
    2cf8:      	add	x2, x2, #0x1cc
    2cfc:      	orr	w0, wzr, #0x80000000
    2d00:      	bl	0xac7c <.text+0x9c7c>
    2d04:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    2d08:      	movk	x0, #0x2
    2d0c:      	b	0x2d74 <.text+0x1d74>
    2d10:      	adrp	x1, 0xe000 <.text+0xd000>
    2d14:      	adrp	x2, 0xd000 <.text+0xc000>
    2d18:      	mov	w19, #0x651             // =1617
    2d1c:      	add	x1, x1, #0xb1
    2d20:      	add	x2, x2, #0xefe
    2d24:      	orr	w0, wzr, #0x80000000
    2d28:      	mov	w3, w19
    2d2c:      	bl	0xac7c <.text+0x9c7c>
    2d30:      	adrp	x0, 0xd000 <.text+0xc000>
    2d34:      	adrp	x2, 0x11000 <.text+0x10000>
    2d38:      	add	x0, x0, #0xf6a
    2d3c:      	add	x2, x2, #0xe70
    2d40:      	mov	x1, x19
    2d44:      	bl	0xb008 <.text+0xa008>
    2d48:      	b	0x2d48 <.text+0x1d48>
    2d4c:      	adrp	x1, 0xe000 <.text+0xd000>
    2d50:      	adrp	x2, 0xe000 <.text+0xd000>
    2d54:      	add	x1, x1, #0x1e7
    2d58:      	add	x2, x2, #0x1cc
    2d5c:      	orr	w0, wzr, #0x80000000
    2d60:      	mov	w3, w8
    2d64:      	bl	0xac7c <.text+0x9c7c>
    2d68:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    2d6c:      	b	0x2d74 <.text+0x1d74>
    2d70:      	mov	x0, xzr
    2d74:      	sub	sp, x29, #0x20
    2d78:      	ldp	x29, x30, [sp, #0x20]
    2d7c:      	ldp	x20, x19, [sp, #0x10]
    2d80:      	ldp	x22, x21, [sp], #0x30
    2d84:      	ret
    2d88:      	stp	x22, x21, [sp, #-0x30]!
    2d8c:      	stp	x20, x19, [sp, #0x10]
    2d90:      	stp	x29, x30, [sp, #0x20]
    2d94:      	add	x29, sp, #0x20
    2d98:      	mov	w21, w3
    2d9c:      	mov	w19, w2
    2da0:      	mov	w20, w1
    2da4:      	mov	x22, x0
    2da8:      	cbz	x22, 0x2e34 <.text+0x1e34>
    2dac:      	mov	x0, x22
    2db0:      	mov	w8, #0x66620000         // =1717698560
    2db4:      	movk	w8, #0x7375
    2db8:      	ldr	x9, [x0, #-0x8]!
    2dbc:      	cmp	x9, x8
    2dc0:      	b.eq	0x2de0 <.text+0x1de0>
    2dc4:      	adrp	x0, 0xd000 <.text+0xc000>
    2dc8:      	adrp	x2, 0xe000 <.text+0xd000>
    2dcc:      	add	x0, x0, #0xf6a
    2dd0:      	mov	w1, #0x67a              // =1658
    2dd4:      	add	x2, x2, #0xd6
    2dd8:      	bl	0xb008 <.text+0xa008>
    2ddc:      	mov	x0, x22
    2de0:      	mov	w1, w20
    2de4:      	mov	w2, w19
    2de8:      	mov	w3, w21
    2dec:      	bl	0x5468 <.text+0x4468>
    2df0:      	mov	x22, x0
    2df4:      	tbz	x22, #0x3f, 0x2e54 <.text+0x1e54>
    2df8:      	adrp	x11, 0xe000 <.text+0xd000>
    2dfc:      	adrp	x12, 0xe000 <.text+0xd000>
    2e00:      	add	x11, x11, #0x252
    2e04:      	add	x12, x12, #0x254
    2e08:      	tst	w21, #0xff
    2e0c:      	adrp	x1, 0xe000 <.text+0xd000>
    2e10:      	adrp	x2, 0xe000 <.text+0xd000>
    2e14:      	csel	x3, x12, x11, ne
    2e18:      	and	w4, w20, #0xff
    2e1c:      	add	x1, x1, #0x232
    2e20:      	add	x2, x2, #0x217
    2e24:      	orr	w0, wzr, #0x80000000
    2e28:      	mov	w5, w19
    2e2c:      	bl	0xac7c <.text+0x9c7c>
    2e30:      	b	0x2e54 <.text+0x1e54>
    2e34:      	adrp	x1, 0xf000 <.text+0xe000>
    2e38:      	adrp	x2, 0xe000 <.text+0xd000>
    2e3c:      	add	x1, x1, #0xce7
    2e40:      	add	x2, x2, #0x217
    2e44:      	orr	w0, wzr, #0x80000000
    2e48:      	bl	0xac7c <.text+0x9c7c>
    2e4c:      	mov	x22, #-0x8000000000000000 // =-9223372036854775808
    2e50:      	movk	x22, #0x2
    2e54:      	ldp	x29, x30, [sp, #0x20]
    2e58:      	mov	x0, x22
    2e5c:      	ldp	x20, x19, [sp, #0x10]
    2e60:      	ldp	x22, x21, [sp], #0x30
    2e64:      	ret
    2e68:      	stp	x26, x25, [sp, #-0x50]!
    2e6c:      	stp	x24, x23, [sp, #0x10]
    2e70:      	stp	x22, x21, [sp, #0x20]
    2e74:      	stp	x20, x19, [sp, #0x30]
    2e78:      	stp	x29, x30, [sp, #0x40]
    2e7c:      	add	x29, sp, #0x40
    2e80:      	sub	sp, sp, #0x10
    2e84:      	mov	x22, #-0x8000000000000000 // =-9223372036854775808
    2e88:      	str	wzr, [sp, #0xc]
    2e8c:      	mov	x23, x3
    2e90:      	mov	x19, x2
    2e94:      	mov	x20, x1
    2e98:      	mov	x24, x0
    2e9c:      	movk	x22, #0x2
    2ea0:      	cbz	x24, 0x2f2c <.text+0x1f2c>
    2ea4:      	cbz	x20, 0x2f2c <.text+0x1f2c>
    2ea8:      	cbz	x19, 0x2f2c <.text+0x1f2c>
    2eac:      	cbz	x23, 0x2f2c <.text+0x1f2c>
    2eb0:      	ldr	x8, [x19]
    2eb4:      	cbz	x8, 0x2f2c <.text+0x1f2c>
    2eb8:      	mov	x21, x24
    2ebc:      	mov	w9, #0x66620000         // =1717698560
    2ec0:      	movk	w9, #0x7375
    2ec4:      	ldr	x10, [x21, #-0x8]!
    2ec8:      	cmp	x10, x9
    2ecc:      	b.eq	0x2eec <.text+0x1eec>
    2ed0:      	adrp	x0, 0xd000 <.text+0xc000>
    2ed4:      	adrp	x2, 0xe000 <.text+0xd000>
    2ed8:      	add	x0, x0, #0xf6a
    2edc:      	mov	w1, #0x6a2              // =1698
    2ee0:      	add	x2, x2, #0xd6
    2ee4:      	bl	0xb008 <.text+0xa008>
    2ee8:      	mov	x21, x24
    2eec:      	add	x24, x21, #0x1b8
    2ef0:      	mov	x0, x24
    2ef4:      	bl	0xb94c <.text+0xa94c>
    2ef8:      	and	w10, w0, #0xff
    2efc:      	cbz	w10, 0x2f48 <.text+0x1f48>
    2f00:      	mov	x24, xzr
    2f04:      	add	x25, sp, #0xc
    2f08:      	mov	x0, x21
    2f0c:      	bl	0x6334 <.text+0x5334>
    2f10:      	ldr	w13, [x25]
    2f14:      	mov	x23, xzr
    2f18:      	mov	x22, xzr
    2f1c:      	str	w13, [x20]
    2f20:      	str	xzr, [x19]
    2f24:      	cbnz	x24, 0x3050 <.text+0x2050>
    2f28:      	b	0x3068 <.text+0x2068>
    2f2c:      	adrp	x1, 0xf000 <.text+0xe000>
    2f30:      	adrp	x2, 0xe000 <.text+0xd000>
    2f34:      	add	x1, x1, #0xce7
    2f38:      	add	x2, x2, #0x25a
    2f3c:      	orr	w0, wzr, #0x80000000
    2f40:      	bl	0xac7c <.text+0x9c7c>
    2f44:      	b	0x3068 <.text+0x2068>
    2f48:      	mov	x0, x24
    2f4c:      	bl	0xb8fc <.text+0xa8fc>
    2f50:      	mov	x24, x0
    2f54:      	cbz	x24, 0x2f98 <.text+0x1f98>
    2f58:      	mov	x25, x24
    2f5c:      	ldr	w8, [x25, #0x10]!
    2f60:      	sub	w9, w8, #0x1
    2f64:      	cmp	w9, #0x9
    2f68:      	b.hs	0x2f7c <.text+0x1f7c>
    2f6c:      	and	w11, w9, #0xffff
    2f70:      	mov	w12, #0x107             // =263
    2f74:      	lsr	w11, w12, w11
    2f78:      	tbnz	w11, #0x0, 0x3010 <.text+0x2010>
    2f7c:      	cmp	w8, #0xa
    2f80:      	b.hs	0x2fd4 <.text+0x1fd4>
    2f84:      	cbz	w8, 0x2f08 <.text+0x1f08>
    2f88:      	mov	x2, xzr
    2f8c:      	mov	x1, xzr
    2f90:      	mov	x26, xzr
    2f94:      	b	0x3024 <.text+0x2024>
    2f98:      	adrp	x1, 0xe000 <.text+0xd000>
    2f9c:      	adrp	x2, 0xd000 <.text+0xc000>
    2fa0:      	mov	w23, #0x6a8             // =1704
    2fa4:      	add	x1, x1, #0x98
    2fa8:      	add	x2, x2, #0xefe
    2fac:      	orr	w0, wzr, #0x80000000
    2fb0:      	mov	w3, w23
    2fb4:      	bl	0xac7c <.text+0x9c7c>
    2fb8:      	adrp	x0, 0xd000 <.text+0xc000>
    2fbc:      	adrp	x2, 0x11000 <.text+0x10000>
    2fc0:      	add	x0, x0, #0xf6a
    2fc4:      	add	x2, x2, #0xe70
    2fc8:      	mov	x1, x23
    2fcc:      	bl	0xb008 <.text+0xa008>
    2fd0:      	b	0x2fd0 <.text+0x1fd0>
    2fd4:      	adrp	x1, 0xe000 <.text+0xd000>
    2fd8:      	adrp	x2, 0xd000 <.text+0xc000>
    2fdc:      	mov	w23, #0x6c2             // =1730
    2fe0:      	add	x1, x1, #0x26c
    2fe4:      	add	x2, x2, #0xefe
    2fe8:      	orr	w0, wzr, #0x80000000
    2fec:      	mov	w3, w23
    2ff0:      	bl	0xac7c <.text+0x9c7c>
    2ff4:      	adrp	x0, 0xd000 <.text+0xc000>
    2ff8:      	adrp	x2, 0x11000 <.text+0x10000>
    2ffc:      	add	x0, x0, #0xf6a
    3000:      	add	x2, x2, #0xe70
    3004:      	mov	x1, x23
    3008:      	bl	0xb008 <.text+0xa008>
    300c:      	b	0x300c <.text+0x200c>
    3010:      	adrp	x8, 0xe000 <.text+0xd000>
    3014:      	add	x8, x8, #0x580
    3018:      	add	x1, x24, #0x18
    301c:      	orr	w26, wzr, #0x20
    3020:      	ldr	x2, [x8, w9, sxtw #3]
    3024:      	ldr	x12, [x19]
    3028:      	cmp	x12, x2
    302c:      	b.hs	0x3038 <.text+0x2038>
    3030:      	add	x23, x22, #0x3
    3034:      	b	0x3044 <.text+0x2044>
    3038:      	mov	x0, x23
    303c:      	bl	0xb25c <.text+0xa25c>
    3040:      	mov	x23, xzr
    3044:      	ldr	w8, [x25]
    3048:      	str	w8, [x20]
    304c:      	str	x26, [x19]
    3050:      	mov	x0, x24
    3054:      	bl	0xb9a4 <.text+0xa9a4>
    3058:      	add	x0, x21, #0x1c8
    305c:      	mov	x1, x24
    3060:      	bl	0xb898 <.text+0xa898>
    3064:      	mov	x22, x23
    3068:      	mov	x0, x22
    306c:      	sub	sp, x29, #0x40
    3070:      	ldp	x29, x30, [sp, #0x40]
    3074:      	ldp	x20, x19, [sp, #0x30]
    3078:      	ldp	x22, x21, [sp, #0x20]
    307c:      	ldp	x24, x23, [sp, #0x10]
    3080:      	ldp	x26, x25, [sp], #0x50
    3084:      	ret
    3088:      	stp	x24, x23, [sp, #-0x40]!
    308c:      	stp	x22, x21, [sp, #0x10]
    3090:      	stp	x20, x19, [sp, #0x20]
    3094:      	stp	x29, x30, [sp, #0x30]
    3098:      	add	x29, sp, #0x30
    309c:      	mov	w19, w2
    30a0:      	mov	w20, w1
    30a4:      	cmp	w19, #0x1
    30a8:      	and	w9, w20, #0xff
    30ac:      	ccmp	w9, #0xf, #0x2, ls
    30b0:      	mov	x23, x0
    30b4:      	mov	x22, x3
    30b8:      	ccmp	x23, #0x0, #0x4, ls
    30bc:      	mov	x21, x4
    30c0:      	ccmp	x22, #0x0, #0x4, ne
    30c4:      	ccmp	x21, #0x0, #0x4, ne
    30c8:      	b.ne	0x3100 <.text+0x2100>
    30cc:      	adrp	x1, 0xf000 <.text+0xe000>
    30d0:      	adrp	x2, 0xe000 <.text+0xd000>
    30d4:      	add	x1, x1, #0xce7
    30d8:      	add	x2, x2, #0x2ab
    30dc:      	orr	w0, wzr, #0x80000000
    30e0:      	bl	0xac7c <.text+0x9c7c>
    30e4:      	ldp	x29, x30, [sp, #0x30]
    30e8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    30ec:      	ldp	x20, x19, [sp, #0x20]
    30f0:      	movk	x0, #0x2
    30f4:      	ldp	x22, x21, [sp, #0x10]
    30f8:      	ldp	x24, x23, [sp], #0x40
    30fc:      	ret
    3100:      	mov	x0, x23
    3104:      	mov	w8, #0x66620000         // =1717698560
    3108:      	movk	w8, #0x7375
    310c:      	ldr	x9, [x0, #-0x8]!
    3110:      	cmp	x9, x8
    3114:      	b.eq	0x3134 <.text+0x2134>
    3118:      	adrp	x0, 0xd000 <.text+0xc000>
    311c:      	adrp	x2, 0xe000 <.text+0xd000>
    3120:      	add	x0, x0, #0xf6a
    3124:      	mov	w1, #0x706              // =1798
    3128:      	add	x2, x2, #0xd6
    312c:      	bl	0xb008 <.text+0xa008>
    3130:      	mov	x0, x23
    3134:      	ldr	w8, [x0, #0xdd8]
    3138:      	ldr	x3, [x22]
    313c:      	and	w10, w8, #0xff
    3140:      	cbz	w10, 0x3174 <.text+0x2174>
    3144:      	and	w11, w8, #0xff00
    3148:      	cbz	w11, 0x3174 <.text+0x2174>
    314c:      	ubfx	w8, w8, #16, #8
    3150:      	cmp	w8, #0x2
    3154:      	b.eq	0x317c <.text+0x217c>
    3158:      	cmp	w8, #0x1
    315c:      	mov	x4, x21
    3160:      	b.ne	0x3198 <.text+0x2198>
    3164:      	ldr	x8, [x0, #0x1b0]
    3168:      	ldr	x4, [x8]
    316c:      	ldrb	w3, [x4]
    3170:      	b	0x3198 <.text+0x2198>
    3174:      	mov	x4, x21
    3178:      	b	0x31a8 <.text+0x21a8>
    317c:      	ldr	x9, [x0, #0x1b0]
    3180:      	ldr	x10, [x9, #0x8]
    3184:      	ldr	x11, [x10]
    3188:      	ldr	x4, [x11]
    318c:      	ldrb	w11, [x4, #0x3]
    3190:      	ldrb	w3, [x4, #0x2]
    3194:      	bfi	x3, x11, #8, #8
    3198:      	str	x21, [x0, #0xde0]
    319c:      	strb	wzr, [x0, #0xdda]
    31a0:      	ldr	x12, [x22]
    31a4:      	str	x12, [x0, #0xde8]
    31a8:      	mov	w1, w20
    31ac:      	mov	w2, w19
    31b0:      	mov	x5, x21
    31b4:      	ldp	x29, x30, [sp, #0x30]
    31b8:      	ldp	x20, x19, [sp, #0x20]
    31bc:      	ldp	x22, x21, [sp, #0x10]
    31c0:      	ldp	x24, x23, [sp], #0x40
    31c4:      	b	0x5bb0 <.text+0x4bb0>
    31c8:      	cbz	x0, 0x31e0 <.text+0x21e0>
    31cc:      	cbz	x1, 0x31e0 <.text+0x21e0>
    31d0:      	mov	w8, #0xfffff8           // =16777208
    31d4:      	mov	x0, xzr
    31d8:      	str	x8, [x1]
    31dc:      	ret
    31e0:      	stp	x29, x30, [sp, #-0x10]!
    31e4:      	mov	x29, sp
    31e8:      	adrp	x1, 0xf000 <.text+0xe000>
    31ec:      	adrp	x2, 0xe000 <.text+0xd000>
    31f0:      	add	x1, x1, #0xce7
    31f4:      	add	x2, x2, #0x2b9
    31f8:      	orr	w0, wzr, #0x80000000
    31fc:      	bl	0xac7c <.text+0x9c7c>
    3200:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    3204:      	movk	x0, #0x2
    3208:      	ldp	x29, x30, [sp], #0x10
    320c:      	ret
    3210:      	stp	x20, x19, [sp, #-0x20]!
    3214:      	stp	x29, x30, [sp, #0x10]
    3218:      	add	x29, sp, #0x10
    321c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    3220:      	mov	x20, x2
    3224:      	mov	x8, x1
    3228:      	movk	x19, #0x2
    322c:      	cbz	x20, 0x324c <.text+0x224c>
    3230:      	orr	w1, wzr, #0x400
    3234:      	mov	x0, x8
    3238:      	bl	0xd1a0 <.text+0xc1a0>
    323c:      	str	x0, [x20]
    3240:      	cbz	x0, 0x3268 <.text+0x2268>
    3244:      	mov	x19, xzr
    3248:      	b	0x3284 <.text+0x2284>
    324c:      	adrp	x1, 0xf000 <.text+0xe000>
    3250:      	adrp	x2, 0xe000 <.text+0xd000>
    3254:      	add	x1, x1, #0xce7
    3258:      	add	x2, x2, #0x2d1
    325c:      	orr	w0, wzr, #0x80000000
    3260:      	bl	0xac7c <.text+0x9c7c>
    3264:      	b	0x3284 <.text+0x2284>
    3268:      	adrp	x1, 0xe000 <.text+0xd000>
    326c:      	adrp	x2, 0xe000 <.text+0xd000>
    3270:      	add	x1, x1, #0x2ed
    3274:      	add	x2, x2, #0x2d1
    3278:      	orr	w0, wzr, #0x80000000
    327c:      	bl	0xac7c <.text+0x9c7c>
    3280:      	add	x19, x19, #0x7
    3284:      	ldp	x29, x30, [sp, #0x10]
    3288:      	mov	x0, x19
    328c:      	ldp	x20, x19, [sp], #0x20
    3290:      	ret
    3294:      	stp	x29, x30, [sp, #-0x10]!
    3298:      	mov	x29, sp
    329c:      	cbz	x1, 0x32b0 <.text+0x22b0>
    32a0:      	mov	x0, x1
    32a4:      	bl	0xd1b8 <.text+0xc1b8>
    32a8:      	mov	x0, xzr
    32ac:      	b	0x32d0 <.text+0x22d0>
    32b0:      	adrp	x1, 0xf000 <.text+0xe000>
    32b4:      	adrp	x2, 0xe000 <.text+0xd000>
    32b8:      	add	x1, x1, #0xce7
    32bc:      	add	x2, x2, #0x300
    32c0:      	orr	w0, wzr, #0x80000000
    32c4:      	bl	0xac7c <.text+0x9c7c>
    32c8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    32cc:      	movk	x0, #0x2
    32d0:      	ldp	x29, x30, [sp], #0x10
    32d4:      	ret
    32d8:      	mov	x0, xzr
    32dc:      	ret
    32e0:      	stp	x20, x19, [sp, #-0x20]!
    32e4:      	stp	x29, x30, [sp, #0x10]
    32e8:      	add	x29, sp, #0x10
    32ec:      	mov	x19, x0
    32f0:      	cbz	x19, 0x3334 <.text+0x2334>
    32f4:      	mov	x0, x19
    32f8:      	mov	w8, #0x66620000         // =1717698560
    32fc:      	movk	w8, #0x7375
    3300:      	ldr	x9, [x0, #-0x8]!
    3304:      	cmp	x9, x8
    3308:      	b.eq	0x3328 <.text+0x2328>
    330c:      	adrp	x0, 0xd000 <.text+0xc000>
    3310:      	adrp	x2, 0xe000 <.text+0xd000>
    3314:      	add	x0, x0, #0xf6a
    3318:      	mov	w1, #0x7a7              // =1959
    331c:      	add	x2, x2, #0xd6
    3320:      	bl	0xb008 <.text+0xa008>
    3324:      	mov	x0, x19
    3328:      	bl	0x5ff8 <.text+0x4ff8>
    332c:      	mov	x0, xzr
    3330:      	b	0x3354 <.text+0x2354>
    3334:      	adrp	x1, 0xf000 <.text+0xe000>
    3338:      	adrp	x2, 0xe000 <.text+0xd000>
    333c:      	add	x1, x1, #0xce7
    3340:      	add	x2, x2, #0x318
    3344:      	orr	w0, wzr, #0x80000000
    3348:      	bl	0xac7c <.text+0x9c7c>
    334c:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    3350:      	movk	x0, #0x2
    3354:      	ldp	x29, x30, [sp, #0x10]
    3358:      	ldp	x20, x19, [sp], #0x20
    335c:      	ret
    3360:      	stp	x24, x23, [sp, #-0x40]!
    3364:      	stp	x22, x21, [sp, #0x10]
    3368:      	stp	x20, x19, [sp, #0x20]
    336c:      	stp	x29, x30, [sp, #0x30]
    3370:      	add	x29, sp, #0x30
    3374:      	mov	x23, x0
    3378:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    337c:      	mov	x19, x5
    3380:      	mov	w22, w3
    3384:      	mov	w20, w2
    3388:      	mov	w21, w1
    338c:      	movk	x0, #0x2
    3390:      	cbz	x23, 0x3460 <.text+0x2460>
    3394:      	cbz	x19, 0x3460 <.text+0x2460>
    3398:      	and	w8, w21, #0xff
    339c:      	cmp	w8, #0xf
    33a0:      	ccmp	w20, #0x1, #0x2, ls
    33a4:      	b.hi	0x3460 <.text+0x2460>
    33a8:      	mov	x8, x23
    33ac:      	mov	w9, #0x66620000         // =1717698560
    33b0:      	movk	w9, #0x7375
    33b4:      	ldr	x10, [x8, #-0x8]!
    33b8:      	cmp	x10, x9
    33bc:      	b.eq	0x33dc <.text+0x23dc>
    33c0:      	adrp	x0, 0xd000 <.text+0xc000>
    33c4:      	adrp	x2, 0xe000 <.text+0xd000>
    33c8:      	add	x0, x0, #0xf6a
    33cc:      	mov	w1, #0x7d3              // =2003
    33d0:      	add	x2, x2, #0xd6
    33d4:      	bl	0xb008 <.text+0xa008>
    33d8:      	mov	x8, x23
    33dc:      	cbz	x8, 0x3408 <.text+0x2408>
    33e0:      	cmp	w22, #0x3
    33e4:      	b.ne	0x345c <.text+0x245c>
    33e8:      	cbz	w20, 0x3444 <.text+0x2444>
    33ec:      	and	w9, w21, #0xff
    33f0:      	ldrb	w10, [x19]
    33f4:      	mov	x0, xzr
    33f8:      	add	x8, x8, w9, uxtw #1
    33fc:      	add	x9, x8, w20, uxtw
    3400:      	strb	w10, [x9, #0xd1]
    3404:      	b	0x3460 <.text+0x2460>
    3408:      	adrp	x1, 0xe000 <.text+0xd000>
    340c:      	adrp	x2, 0xd000 <.text+0xc000>
    3410:      	mov	w19, #0x7d4             // =2004
    3414:      	add	x1, x1, #0xb1
    3418:      	add	x2, x2, #0xefe
    341c:      	orr	w0, wzr, #0x80000000
    3420:      	mov	w3, w19
    3424:      	bl	0xac7c <.text+0x9c7c>
    3428:      	adrp	x0, 0xd000 <.text+0xc000>
    342c:      	adrp	x2, 0x11000 <.text+0x10000>
    3430:      	add	x0, x0, #0xf6a
    3434:      	add	x2, x2, #0xe70
    3438:      	mov	x1, x19
    343c:      	bl	0xb008 <.text+0xa008>
    3440:      	b	0x3440 <.text+0x2440>
    3444:      	adrp	x1, 0xe000 <.text+0xd000>
    3448:      	adrp	x2, 0xe000 <.text+0xd000>
    344c:      	add	x1, x1, #0x32c
    3450:      	add	x2, x2, #0x361
    3454:      	orr	w0, wzr, #0x80000000
    3458:      	bl	0xac7c <.text+0x9c7c>
    345c:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    3460:      	ldp	x29, x30, [sp, #0x30]
    3464:      	ldp	x20, x19, [sp, #0x20]
    3468:      	ldp	x22, x21, [sp, #0x10]
    346c:      	ldp	x24, x23, [sp], #0x40
    3470:      	ret
    3474:      	stp	x26, x25, [sp, #-0x50]!
    3478:      	stp	x24, x23, [sp, #0x10]
    347c:      	stp	x22, x21, [sp, #0x20]
    3480:      	stp	x20, x19, [sp, #0x30]
    3484:      	stp	x29, x30, [sp, #0x40]
    3488:      	add	x29, sp, #0x40
    348c:      	mov	x25, #-0x8000000000000000 // =-9223372036854775808
    3490:      	movk	x25, #0x5
    3494:      	mov	x19, x5
    3498:      	mov	x21, x4
    349c:      	mov	w23, w3
    34a0:      	mov	w20, w2
    34a4:      	mov	w22, w1
    34a8:      	mov	x24, x0
    34ac:      	sub	x0, x25, #0x3
    34b0:      	cbz	x24, 0x3614 <.text+0x2614>
    34b4:      	cbz	x21, 0x3614 <.text+0x2614>
    34b8:      	cbz	x19, 0x3614 <.text+0x2614>
    34bc:      	and	w8, w22, #0xff
    34c0:      	cmp	w8, #0xf
    34c4:      	ccmp	w20, #0x1, #0x2, ls
    34c8:      	b.hi	0x3614 <.text+0x2614>
    34cc:      	mov	x8, x24
    34d0:      	mov	w9, #0x66620000         // =1717698560
    34d4:      	movk	w9, #0x7375
    34d8:      	ldr	x10, [x8, #-0x8]!
    34dc:      	cmp	x10, x9
    34e0:      	b.eq	0x3500 <.text+0x2500>
    34e4:      	adrp	x0, 0xd000 <.text+0xc000>
    34e8:      	adrp	x2, 0xe000 <.text+0xd000>
    34ec:      	add	x0, x0, #0xf6a
    34f0:      	mov	w1, #0x809              // =2057
    34f4:      	add	x2, x2, #0xd6
    34f8:      	bl	0xb008 <.text+0xa008>
    34fc:      	mov	x8, x24
    3500:      	cbz	x8, 0x354c <.text+0x254c>
    3504:      	cmp	w23, #0x3
    3508:      	b.eq	0x3588 <.text+0x2588>
    350c:      	cmp	w23, #0x2
    3510:      	b.eq	0x35b8 <.text+0x25b8>
    3514:      	cmp	w23, #0x1
    3518:      	b.ne	0x35dc <.text+0x25dc>
    351c:      	ldr	x9, [x21]
    3520:      	orr	w12, wzr, #0x4
    3524:      	str	x12, [x21]
    3528:      	cmp	x9, #0x3
    352c:      	b.ls	0x35ec <.text+0x25ec>
    3530:      	and	w9, w22, #0xff
    3534:      	mov	x0, xzr
    3538:      	add	x8, x8, w9, uxtw #3
    353c:      	add	x9, x8, w20, uxtw #2
    3540:      	ldr	w12, [x9, #0xf4]
    3544:      	str	w12, [x19]
    3548:      	b	0x3614 <.text+0x2614>
    354c:      	adrp	x1, 0xe000 <.text+0xd000>
    3550:      	adrp	x2, 0xd000 <.text+0xc000>
    3554:      	mov	w19, #0x80a             // =2058
    3558:      	add	x1, x1, #0xb1
    355c:      	add	x2, x2, #0xefe
    3560:      	orr	w0, wzr, #0x80000000
    3564:      	mov	w3, w19
    3568:      	bl	0xac7c <.text+0x9c7c>
    356c:      	adrp	x0, 0xd000 <.text+0xc000>
    3570:      	adrp	x2, 0x11000 <.text+0x10000>
    3574:      	add	x0, x0, #0xf6a
    3578:      	add	x2, x2, #0xe70
    357c:      	mov	x1, x19
    3580:      	bl	0xb008 <.text+0xa008>
    3584:      	b	0x3584 <.text+0x2584>
    3588:      	ldr	x16, [x21]
    358c:      	orr	w17, wzr, #0x1
    3590:      	str	x17, [x21]
    3594:      	cbz	x16, 0x35ec <.text+0x25ec>
    3598:      	cbz	w20, 0x360c <.text+0x260c>
    359c:      	and	w10, w22, #0xff
    35a0:      	mov	x0, xzr
    35a4:      	add	x10, x8, w10, uxtw #1
    35a8:      	add	x11, x10, w20, uxtw
    35ac:      	ldrb	w15, [x11, #0xd1]
    35b0:      	strb	w15, [x19]
    35b4:      	b	0x3614 <.text+0x2614>
    35b8:      	ldr	x8, [x21]
    35bc:      	cbz	x8, 0x35e4 <.text+0x25e4>
    35c0:      	cmp	w20, #0x1
    35c4:      	cset	w14, eq
    35c8:      	orr	w15, wzr, #0x1
    35cc:      	mov	x0, xzr
    35d0:      	strb	w14, [x19]
    35d4:      	str	x15, [x21]
    35d8:      	b	0x3614 <.text+0x2614>
    35dc:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    35e0:      	b	0x3614 <.text+0x2614>
    35e4:      	orr	w14, wzr, #0x1
    35e8:      	str	x14, [x21]
    35ec:      	adrp	x1, 0xe000 <.text+0xd000>
    35f0:      	adrp	x2, 0xe000 <.text+0xd000>
    35f4:      	add	x1, x1, #0x378
    35f8:      	add	x2, x2, #0x38e
    35fc:      	orr	w0, wzr, #0x80000000
    3600:      	bl	0xac7c <.text+0x9c7c>
    3604:      	mov	x0, x25
    3608:      	b	0x3614 <.text+0x2614>
    360c:      	mov	x0, xzr
    3610:      	strb	wzr, [x19]
    3614:      	ldp	x29, x30, [sp, #0x40]
    3618:      	ldp	x20, x19, [sp, #0x30]
    361c:      	ldp	x22, x21, [sp, #0x20]
    3620:      	ldp	x24, x23, [sp, #0x10]
    3624:      	ldp	x26, x25, [sp], #0x50
    3628:      	ret
    362c:      	stp	x20, x19, [sp, #-0x20]!
    3630:      	stp	x29, x30, [sp, #0x10]
    3634:      	add	x29, sp, #0x10
    3638:      	mov	x19, x0
    363c:      	cbz	x19, 0x3698 <.text+0x2698>
    3640:      	ldr	x0, [x19, #0xdd0]
    3644:      	cbz	x0, 0x368c <.text+0x268c>
    3648:      	bl	0xd1fc <.text+0xc1fc>
    364c:      	add	x19, x19, #0x9b8
    3650:      	b	0x365c <.text+0x265c>
    3654:      	mov	x0, x20
    3658:      	bl	0xbf9c <.text+0xaf9c>
    365c:      	mov	x0, x19
    3660:      	bl	0xb94c <.text+0xa94c>
    3664:      	and	w8, w0, #0xff
    3668:      	cbnz	w8, 0x368c <.text+0x268c>
    366c:      	mov	x0, x19
    3670:      	bl	0xb8fc <.text+0xa8fc>
    3674:      	mov	x20, x0
    3678:      	bl	0xb9a4 <.text+0xa9a4>
    367c:      	ldr	x0, [x20, #0x450]
    3680:      	cbz	x0, 0x3654 <.text+0x2654>
    3684:      	bl	0xbf9c <.text+0xaf9c>
    3688:      	b	0x3654 <.text+0x2654>
    368c:      	ldp	x29, x30, [sp, #0x10]
    3690:      	ldp	x20, x19, [sp], #0x20
    3694:      	ret
    3698:      	ldp	x29, x30, [sp, #0x10]
    369c:      	adrp	x1, 0xf000 <.text+0xe000>
    36a0:      	adrp	x2, 0xe000 <.text+0xd000>
    36a4:      	add	x1, x1, #0xce7
    36a8:      	add	x2, x2, #0x628
    36ac:      	orr	w0, wzr, #0x80000000
    36b0:      	ldp	x20, x19, [sp], #0x20
    36b4:      	b	0xac7c <.text+0x9c7c>
    36b8:      	stp	x28, x27, [sp, #-0x60]!
    36bc:      	stp	x26, x25, [sp, #0x10]
    36c0:      	stp	x24, x23, [sp, #0x20]
    36c4:      	stp	x22, x21, [sp, #0x30]
    36c8:      	stp	x20, x19, [sp, #0x40]
    36cc:      	stp	x29, x30, [sp, #0x50]
    36d0:      	add	x29, sp, #0x50
    36d4:      	sub	sp, sp, #0x60
    36d8:      	mov	x19, x0
    36dc:      	add	x20, x19, #0x1f0
    36e0:      	mov	x0, x20
    36e4:      	ldr	x28, [x19, #0x1e0]
    36e8:      	and	x1, x28, #0xffffffff
    36ec:      	bl	0x8730 <.text+0x7730>
    36f0:      	mov	w12, w0
    36f4:      	tbnz	w12, #0x1f, 0x3964 <.text+0x2964>
    36f8:      	mov	w15, #0xc704            // =50948
    36fc:      	add	w23, w28, w15
    3700:      	mov	x0, x23
    3704:      	mov	w24, #0x70000           // =458752
    3708:      	movk	w24, #0xa120
    370c:      	bl	0xcc88 <.text+0xbc88>
    3710:      	orr	w1, w0, #0x40000000
    3714:      	mov	x0, x23
    3718:      	bl	0xccc0 <.text+0xbcc0>
    371c:      	orr	w1, wzr, #0x40000000
    3720:      	mov	w0, w23
    3724:      	mov	w2, wzr
    3728:      	mov	w3, w24
    372c:      	bl	0xa6d4 <.text+0x96d4>
    3730:      	tbnz	w0, #0x1f, 0x3988 <.text+0x2988>
    3734:      	mov	x0, x23
    3738:      	bl	0xcc88 <.text+0xbc88>
    373c:      	orr	w1, w0, #0xf00000
    3740:      	mov	x0, x23
    3744:      	bl	0xccc0 <.text+0xbcc0>
    3748:      	mov	x0, x23
    374c:      	bl	0xcc88 <.text+0xbc88>
    3750:      	and	w8, w0, #0xe0ffffff
    3754:      	orr	w1, w8, #0x10000000
    3758:      	mov	x0, x23
    375c:      	bl	0xccc0 <.text+0xbcc0>
    3760:      	mov	w16, #0xc100            // =49408
    3764:      	add	w23, w28, w16
    3768:      	mov	x0, x23
    376c:      	bl	0xcc88 <.text+0xbc88>
    3770:      	orr	w1, w0, #0xe
    3774:      	mov	x0, x23
    3778:      	bl	0xccc0 <.text+0xbcc0>
    377c:      	mov	w17, #0xc104            // =49412
    3780:      	add	w22, w28, w17
    3784:      	mov	x0, x22
    3788:      	bl	0xcc88 <.text+0xbc88>
    378c:      	and	w9, w0, #0xfffff0ff
    3790:      	orr	w1, w9, #0xe00
    3794:      	mov	x0, x22
    3798:      	bl	0xccc0 <.text+0xbcc0>
    379c:      	mov	x0, x22
    37a0:      	bl	0xcc88 <.text+0xbc88>
    37a4:      	mov	w2, #0xc108             // =49416
    37a8:      	add	w0, w28, w2
    37ac:      	bl	0xcc88 <.text+0xbc88>
    37b0:      	mov	w3, #0xc10c             // =49420
    37b4:      	add	w0, w28, w3
    37b8:      	bl	0xcc88 <.text+0xbc88>
    37bc:      	mov	w5, #0xc120             // =49440
    37c0:      	add	w0, w28, w5
    37c4:      	bl	0xcc88 <.text+0xbc88>
    37c8:      	ldr	x8, [x19, #0x1e0]
    37cc:      	mov	w21, #0xc200            // =49664
    37d0:      	add	x23, x8, x21
    37d4:      	mov	x0, x23
    37d8:      	bl	0xcc88 <.text+0xbc88>
    37dc:      	and	w1, w0, #0xfffffeff
    37e0:      	mov	x0, x23
    37e4:      	bl	0xccc0 <.text+0xbcc0>
    37e8:      	ldr	x9, [x19, #0x1e0]
    37ec:      	add	x22, x9, x21
    37f0:      	mov	x0, x22
    37f4:      	bl	0xcc88 <.text+0xbc88>
    37f8:      	and	w1, w0, #0xffffffbf
    37fc:      	mov	x0, x22
    3800:      	bl	0xccc0 <.text+0xbcc0>
    3804:      	add	w0, w28, w21
    3808:      	bl	0xcc88 <.text+0xbc88>
    380c:      	mov	w6, #0xc2c0             // =49856
    3810:      	add	w23, w28, w6
    3814:      	mov	x0, x23
    3818:      	bl	0xcc88 <.text+0xbc88>
    381c:      	and	w1, w0, #0xfffffffe
    3820:      	mov	x0, x23
    3824:      	bl	0xccc0 <.text+0xbcc0>
    3828:      	mov	x0, x23
    382c:      	bl	0xcc88 <.text+0xbc88>
    3830:      	ldr	x10, [x19, #0x1b0]
    3834:      	cbz	x10, 0x38ac <.text+0x28ac>
    3838:      	ldr	x23, [x19, #0x1e0]
    383c:      	mov	w11, #0xc300            // =49920
    3840:      	add	x22, x23, x11
    3844:      	mov	x0, x22
    3848:      	bl	0xcc88 <.text+0xbc88>
    384c:      	mov	x0, x22
    3850:      	bl	0xcc88 <.text+0xbc88>
    3854:      	mov	w12, #0xc304            // =49924
    3858:      	and	w26, w0, #0xffff
    385c:      	add	x22, x23, x12
    3860:      	orr	w25, wzr, #0x1
    3864:      	mov	w21, #0x82              // =130
    3868:      	mov	w23, #0x184             // =388
    386c:      	b	0x38a4 <.text+0x28a4>
    3870:      	cmp	x25, #0x7
    3874:      	mov	x0, x22
    3878:      	csel	w24, w23, w21, lo
    387c:      	bl	0xcc88 <.text+0xbc88>
    3880:      	mov	w1, w24
    3884:      	mov	x0, x22
    3888:      	bfi	w1, w26, #16, #16
    388c:      	bl	0xccc0 <.text+0xbcc0>
    3890:      	mov	x0, x22
    3894:      	add	w26, w24, w26
    3898:      	bl	0xcc88 <.text+0xbc88>
    389c:      	add	x25, x25, #0x1
    38a0:      	add	x22, x22, #0x4
    38a4:      	cmp	x25, #0x10
    38a8:      	b.ne	0x3870 <.text+0x2870>
    38ac:      	mov	x8, xzr
    38b0:      	add	x9, x19, #0x616
    38b4:      	orr	w14, wzr, #0xff
    38b8:      	b	0x38d0 <.text+0x28d0>
    38bc:      	add	x11, x9, #0x2
    38c0:      	sturb	w14, [x9, #-0x1]
    38c4:      	add	x8, x8, #0x1
    38c8:      	strb	w14, [x9]
    38cc:      	mov	x9, x11
    38d0:      	cmp	x8, #0x10
    38d4:      	b.ne	0x38bc <.text+0x28bc>
    38d8:      	add	x10, x19, #0x617
    38dc:      	strb	wzr, [x19, #0x615]
    38e0:      	orr	w8, wzr, #0x1
    38e4:      	strb	wzr, [x19, #0x616]
    38e8:      	b	0x38f4 <.text+0x28f4>
    38ec:      	strb	wzr, [x10], #0x2
    38f0:      	add	x8, x8, #0x1
    38f4:      	cmp	x8, #0x10
    38f8:      	b.ne	0x38ec <.text+0x28ec>
    38fc:      	ldr	x17, [x19, #0x1b0]
    3900:      	cbz	x17, 0x3998 <.text+0x2998>
    3904:      	add	x24, x19, #0x618
    3908:      	orr	w22, wzr, #0x1
    390c:      	orr	w26, wzr, #0x1
    3910:      	b	0x391c <.text+0x291c>
    3914:      	add	x22, x22, #0x1
    3918:      	add	x24, x24, #0x2
    391c:      	cmp	x22, #0x10
    3920:      	b.eq	0x399c <.text+0x299c>
    3924:      	add	x2, sp, #0x58
    3928:      	add	x3, sp, #0x50
    392c:      	mov	x0, x19
    3930:      	mov	w1, w22
    3934:      	bl	0x5eb4 <.text+0x4eb4>
    3938:      	and	w10, w0, #0xff
    393c:      	cbz	w10, 0x3914 <.text+0x2914>
    3940:      	ldr	x9, [sp, #0x50]
    3944:      	cbz	x9, 0x3914 <.text+0x2914>
    3948:      	ldr	x10, [x9, #0x8]
    394c:      	ldrb	w7, [x10, #0x2]
    3950:      	cbz	w7, 0x3914 <.text+0x2914>
    3954:      	add	w8, w26, #0x1
    3958:      	strb	w26, [x24]
    395c:      	mov	w26, w8
    3960:      	b	0x3914 <.text+0x2914>
    3964:      	adrp	x1, 0xe000 <.text+0xd000>
    3968:      	adrp	x2, 0xe000 <.text+0xd000>
    396c:      	add	x1, x1, #0x63c
    3970:      	add	x2, x2, #0x65e
    3974:      	orr	w0, wzr, #0x80000000
    3978:      	mov	w3, w12
    397c:      	bl	0xac7c <.text+0x9c7c>
    3980:      	mov	x22, xzr
    3984:      	b	0x3c34 <.text+0x2c34>
    3988:      	adrp	x1, 0xe000 <.text+0xd000>
    398c:      	sxtw	x22, w0
    3990:      	add	x1, x1, #0x673
    3994:      	b	0x3c24 <.text+0x2c24>
    3998:      	orr	w26, wzr, #0x1
    399c:      	add	x27, x19, #0x618
    39a0:      	orr	w25, wzr, #0x1
    39a4:      	b	0x39b0 <.text+0x29b0>
    39a8:      	add	x25, x25, #0x1
    39ac:      	add	x27, x27, #0x2
    39b0:      	cmp	x25, #0x10
    39b4:      	b.eq	0x39f0 <.text+0x29f0>
    39b8:      	add	x2, sp, #0x58
    39bc:      	add	x3, sp, #0x50
    39c0:      	mov	x0, x19
    39c4:      	mov	w1, w25
    39c8:      	bl	0x5eb4 <.text+0x4eb4>
    39cc:      	and	w11, w0, #0xff
    39d0:      	cbz	w11, 0x39a8 <.text+0x29a8>
    39d4:      	ldrb	w12, [x27]
    39d8:      	cmp	w12, #0xff
    39dc:      	b.ne	0x39a8 <.text+0x29a8>
    39e0:      	add	w9, w26, #0x1
    39e4:      	strb	w26, [x27]
    39e8:      	mov	w26, w9
    39ec:      	b	0x39a8 <.text+0x29a8>
    39f0:      	mov	w6, #0xc300             // =49920
    39f4:      	mov	x23, xzr
    39f8:      	add	x22, x28, x6
    39fc:      	b	0x3a1c <.text+0x2a1c>
    3a00:      	and	x0, x22, #0xffffffff
    3a04:      	add	x24, x22, #0x4
    3a08:      	bl	0xcc88 <.text+0xbc88>
    3a0c:      	add	w0, w22, #0x80
    3a10:      	bl	0xcc88 <.text+0xbc88>
    3a14:      	add	x23, x23, #0x1
    3a18:      	mov	x22, x24
    3a1c:      	cmp	x23, #0x20
    3a20:      	b.ne	0x3a00 <.text+0x2a00>
    3a24:      	mov	w9, #0xc110             // =49424
    3a28:      	add	w23, w28, w9
    3a2c:      	mov	x0, x23
    3a30:      	bl	0xcc88 <.text+0xbc88>
    3a34:      	orr	w1, w0, #0x10000
    3a38:      	mov	x0, x23
    3a3c:      	bl	0xccc0 <.text+0xbcc0>
    3a40:      	mov	x0, x23
    3a44:      	bl	0xcc88 <.text+0xbc88>
    3a48:      	and	w13, w0, #0xffffcfff
    3a4c:      	orr	w1, w13, #0x2000
    3a50:      	mov	x0, x23
    3a54:      	bl	0xccc0 <.text+0xbcc0>
    3a58:      	mov	x0, x23
    3a5c:      	bl	0xcc88 <.text+0xbc88>
    3a60:      	orr	w1, wzr, #0x100000
    3a64:      	bfxil	w1, w0, #0, #19
    3a68:      	mov	x0, x23
    3a6c:      	bl	0xccc0 <.text+0xbcc0>
    3a70:      	mov	x0, x23
    3a74:      	bl	0xcc88 <.text+0xbc88>
    3a78:      	mov	w10, #0xc700            // =50944
    3a7c:      	add	w23, w28, w10
    3a80:      	mov	x0, x23
    3a84:      	bl	0xcc88 <.text+0xbc88>
    3a88:      	orr	w1, w0, #0x400000
    3a8c:      	mov	x0, x23
    3a90:      	bl	0xccc0 <.text+0xbcc0>
    3a94:      	adrp	x11, 0x13000
    3a98:      	orr	w5, wzr, #0x1
    3a9c:      	adrp	x0, 0xf000 <.text+0xe000>
    3aa0:      	ldr	x12, [x11, #0x460]
    3aa4:      	adrp	x1, 0x13000
    3aa8:      	str	x5, [sp, #0x30]
    3aac:      	add	x0, x0, #0x290
    3ab0:      	add	x1, x1, #0x20
    3ab4:      	add	x3, sp, #0x30
    3ab8:      	ldr	x22, [x12, #0x48]
    3abc:      	add	x4, sp, #0x3f
    3ac0:      	mov	x2, xzr
    3ac4:      	blr	x22
    3ac8:      	ldrb	w11, [sp, #0x3f]
    3acc:      	mov	x22, x0
    3ad0:      	cmp	x22, #0x0
    3ad4:      	ldr	x24, [x19, #0x1b0]
    3ad8:      	mov	x0, x23
    3adc:      	csel	w21, wzr, w11, lt
    3ae0:      	strb	w21, [x19, #0x188]
    3ae4:      	bl	0xcc88 <.text+0xbc88>
    3ae8:      	and	w1, w0, #0xfffffff8
    3aec:      	cbz	x24, 0x3b00 <.text+0x2b00>
    3af0:      	and	w10, w21, #0xff
    3af4:      	cmp	w10, #0x4
    3af8:      	b.ne	0x3b00 <.text+0x2b00>
    3afc:      	orr	w1, w1, #0x4
    3b00:      	mov	x0, x23
    3b04:      	bl	0xccc0 <.text+0xbcc0>
    3b08:      	mov	x0, x23
    3b0c:      	bl	0xcc88 <.text+0xbc88>
    3b10:      	mov	w13, #0xc708            // =50952
    3b14:      	add	w0, w28, w13
    3b18:      	mov	w1, #0x277              // =631
    3b1c:      	bl	0xccc0 <.text+0xbcc0>
    3b20:      	add	x0, sp, #0x40
    3b24:      	orr	w1, wzr, #0x10
    3b28:      	bl	0xb1bc <.text+0xa1bc>
    3b2c:      	ldr	w1, [sp, #0x4c]
    3b30:      	mov	w8, #-0x410             // =-1040
    3b34:      	mov	w4, #0x409              // =1033
    3b38:      	mov	w2, wzr
    3b3c:      	add	x3, sp, #0x40
    3b40:      	and	w0, w1, w8
    3b44:      	orr	w23, w0, w4
    3b48:      	mov	w1, wzr
    3b4c:      	mov	x0, x20
    3b50:      	str	w23, [sp, #0x4c]
    3b54:      	bl	0x8fcc <.text+0x7fcc>
    3b58:      	mov	w11, w0
    3b5c:      	tbnz	w11, #0x1f, 0x3bfc <.text+0x2bfc>
    3b60:      	mov	w21, #0xc80c            // =51212
    3b64:      	mov	w3, #0x70000            // =458752
    3b68:      	add	w0, w28, w21
    3b6c:      	orr	w1, wzr, #0x400
    3b70:      	mov	w2, wzr
    3b74:      	movk	w3, #0xa120
    3b78:      	bl	0xa6d4 <.text+0x96d4>
    3b7c:      	sxtw	x22, w0
    3b80:      	tbnz	w0, #0x1f, 0x3c1c <.text+0x2c1c>
    3b84:      	ldr	x1, [x19, #0x608]
    3b88:      	mov	x24, #-0x8000000000000000 // =-9223372036854775808
    3b8c:      	movk	x24, #0x9
    3b90:      	cbnz	x1, 0x3bb4 <.text+0x2bb4>
    3b94:      	orr	w0, wzr, #0x1000
    3b98:      	orr	w1, wzr, #0x1000
    3b9c:      	orr	w23, wzr, #0x1000
    3ba0:      	bl	0xd1a0 <.text+0xc1a0>
    3ba4:      	mov	x1, x0
    3ba8:      	str	x1, [x19, #0x608]
    3bac:      	cbz	x1, 0x3c78 <.text+0x2c78>
    3bb0:      	str	w23, [x19, #0x610]
    3bb4:      	add	x24, x19, #0x614
    3bb8:      	orr	w3, wzr, #0x1000
    3bbc:      	mov	x0, x20
    3bc0:      	mov	x2, x1
    3bc4:      	mov	w4, wzr
    3bc8:      	mov	x5, x24
    3bcc:      	bl	0x8a40 <.text+0x7a40>
    3bd0:      	mov	w13, w0
    3bd4:      	tbnz	w13, #0x1f, 0x3c58 <.text+0x2c58>
    3bd8:      	mov	x12, xzr
    3bdc:      	add	x14, x19, #0x9cc
    3be0:      	add	x23, x19, #0x638
    3be4:      	add	x16, x19, #0x738
    3be8:      	add	w9, w28, w21
    3bec:      	stp	x23, x14, [sp, #0x10]
    3bf0:      	str	x16, [sp, #0x28]
    3bf4:      	str	w9, [sp, #0xc]
    3bf8:      	b	0x3ca4 <.text+0x2ca4>
    3bfc:      	adrp	x1, 0xe000 <.text+0xd000>
    3c00:      	adrp	x2, 0xe000 <.text+0xd000>
    3c04:      	add	x1, x1, #0x698
    3c08:      	add	x2, x2, #0x65e
    3c0c:      	orr	w0, wzr, #0x80000000
    3c10:      	mov	w3, w11
    3c14:      	bl	0xac7c <.text+0x9c7c>
    3c18:      	b	0x3c34 <.text+0x2c34>
    3c1c:      	adrp	x1, 0xe000 <.text+0xd000>
    3c20:      	add	x1, x1, #0x6cc
    3c24:      	adrp	x2, 0xe000 <.text+0xd000>
    3c28:      	add	x2, x2, #0x65e
    3c2c:      	orr	w0, wzr, #0x80000000
    3c30:      	bl	0xac7c <.text+0x9c7c>
    3c34:      	mov	x0, x22
    3c38:      	sub	sp, x29, #0x50
    3c3c:      	ldp	x29, x30, [sp, #0x50]
    3c40:      	ldp	x20, x19, [sp, #0x40]
    3c44:      	ldp	x22, x21, [sp, #0x30]
    3c48:      	ldp	x24, x23, [sp, #0x20]
    3c4c:      	ldp	x26, x25, [sp, #0x10]
    3c50:      	ldp	x28, x27, [sp], #0x60
    3c54:      	ret
    3c58:      	adrp	x1, 0xe000 <.text+0xd000>
    3c5c:      	adrp	x2, 0xe000 <.text+0xd000>
    3c60:      	add	x1, x1, #0x6e3
    3c64:      	add	x2, x2, #0x65e
    3c68:      	orr	w0, wzr, #0x80000000
    3c6c:      	mov	w3, w13
    3c70:      	bl	0xac7c <.text+0x9c7c>
    3c74:      	b	0x3c34 <.text+0x2c34>
    3c78:      	adrp	x1, 0xe000 <.text+0xd000>
    3c7c:      	adrp	x2, 0xe000 <.text+0xd000>
    3c80:      	add	x1, x1, #0x2ed
    3c84:      	add	x2, x2, #0x65e
    3c88:      	orr	w0, wzr, #0x80000000
    3c8c:      	bl	0xac7c <.text+0x9c7c>
    3c90:      	mov	x22, x24
    3c94:      	b	0x3c34 <.text+0x2c34>
    3c98:      	ldp	x23, x14, [sp, #0x10]
    3c9c:      	orr	w12, wzr, #0x1
    3ca0:      	ldr	w9, [sp, #0xc]
    3ca4:      	cbnz	x12, 0x3f10 <.text+0x2f10>
    3ca8:      	mov	x25, xzr
    3cac:      	str	x12, [sp, #0x20]
    3cb0:      	add	w26, w9, w12, lsl #5
    3cb4:      	mov	x27, x14
    3cb8:      	lsl	w21, w12, #1
    3cbc:      	cmp	x25, #0x1
    3cc0:      	b.hi	0x3c98 <.text+0x2c98>
    3cc4:      	add	x0, sp, #0x40
    3cc8:      	orr	w1, wzr, #0x10
    3ccc:      	bl	0xb1bc <.text+0xa1bc>
    3cd0:      	add	x0, sp, #0x40
    3cd4:      	ldr	w2, [sp, #0x44]
    3cd8:      	orr	x12, x0, #0x4
    3cdc:      	ldr	w15, [sp, #0x4c]
    3ce0:      	mov	x16, #-0x3ff000000000000 // =-287948901175001088
    3ce4:      	ldrb	w10, [x24]
    3ce8:      	movk	x16, #0xc001, lsl #32
    3cec:      	ldr	w8, [x12, #0x4]
    3cf0:      	orr	w14, w25, w21
    3cf4:      	movk	x16, #0xc1ff, lsl #16
    3cf8:      	lsl	w9, w14, #25
    3cfc:      	movk	x16, #0xfae0
    3d00:      	and	x13, x9, #0x3e000000
    3d04:      	bfi	x2, x8, #32, #32
    3d08:      	and	x11, x2, x16
    3d0c:      	mov	w7, #-0x410             // =-1040
    3d10:      	mov	x4, #0x100000001000     // =17592186048512
    3d14:      	orr	x13, x13, x11
    3d18:      	and	w16, w15, w7
    3d1c:      	mov	w11, #0x401             // =1025
    3d20:      	movk	x4, #0x500
    3d24:      	orr	w17, w16, w11
    3d28:      	bfxil	x13, x10, #0, #5
    3d2c:      	orr	x14, x13, x4
    3d30:      	add	x1, sp, #0x40
    3d34:      	str	w17, [sp, #0x4c]
    3d38:      	orr	w2, wzr, #0x10
    3d3c:      	mov	x0, x27
    3d40:      	lsr	x15, x14, #32
    3d44:      	str	w15, [x12, #0x4]
    3d48:      	str	w14, [sp, #0x44]
    3d4c:      	bl	0xb25c <.text+0xa25c>
    3d50:      	mov	w1, wzr
    3d54:      	add	x3, sp, #0x40
    3d58:      	mov	x0, x20
    3d5c:      	mov	w2, w25
    3d60:      	bl	0x8fcc <.text+0x7fcc>
    3d64:      	mov	w10, w0
    3d68:      	tbnz	w10, #0x1f, 0x3e7c <.text+0x2e7c>
    3d6c:      	mov	w3, #0x70000            // =458752
    3d70:      	orr	w1, wzr, #0x400
    3d74:      	mov	w0, w26
    3d78:      	mov	w2, wzr
    3d7c:      	movk	w3, #0xa120
    3d80:      	bl	0xa6d4 <.text+0x96d4>
    3d84:      	mov	w22, w0
    3d88:      	tbnz	w22, #0x1f, 0x3ea4 <.text+0x2ea4>
    3d8c:      	add	x0, sp, #0x40
    3d90:      	orr	w1, wzr, #0x10
    3d94:      	bl	0xb1bc <.text+0xa1bc>
    3d98:      	ldr	w2, [sp, #0x4c]
    3d9c:      	mov	w6, #-0x410             // =-1040
    3da0:      	mov	w12, #0x402             // =1026
    3da4:      	orr	w10, wzr, #0x1
    3da8:      	mov	w1, wzr
    3dac:      	and	w3, w2, w6
    3db0:      	orr	w5, w3, w12
    3db4:      	strh	w10, [sp, #0x48]
    3db8:      	add	x3, sp, #0x40
    3dbc:      	mov	x0, x20
    3dc0:      	mov	w2, w25
    3dc4:      	str	w5, [sp, #0x4c]
    3dc8:      	bl	0x8fcc <.text+0x7fcc>
    3dcc:      	mov	w9, w0
    3dd0:      	tbnz	w9, #0x1f, 0x3eb4 <.text+0x2eb4>
    3dd4:      	mov	w3, #0x70000            // =458752
    3dd8:      	orr	w1, wzr, #0x400
    3ddc:      	mov	w0, w26
    3de0:      	mov	w2, wzr
    3de4:      	movk	w3, #0xa120
    3de8:      	bl	0xa6d4 <.text+0x96d4>
    3dec:      	sxtw	x22, w0
    3df0:      	tbnz	w0, #0x1f, 0x3ee0 <.text+0x2ee0>
    3df4:      	ldr	x5, [x23]
    3df8:      	cbnz	x5, 0x3e20 <.text+0x2e20>
    3dfc:      	orr	w0, wzr, #0x30
    3e00:      	orr	w1, wzr, #0x10
    3e04:      	bl	0xd1a0 <.text+0xc1a0>
    3e08:      	str	x0, [x23]
    3e0c:      	cbz	x0, 0x3eec <.text+0x2eec>
    3e10:      	ldr	x17, [sp, #0x28]
    3e14:      	orr	w13, wzr, #0x3
    3e18:      	str	w13, [x17, x25, lsl #2]
    3e1c:      	ldr	x5, [x23]
    3e20:      	ldrb	w4, [x24]
    3e24:      	mov	w1, wzr
    3e28:      	orr	w3, wzr, #0x200
    3e2c:      	orr	w7, wzr, #0x30
    3e30:      	mov	x0, x20
    3e34:      	mov	w2, w25
    3e38:      	mov	x6, x5
    3e3c:      	bl	0x8bac <.text+0x7bac>
    3e40:      	mov	w8, w0
    3e44:      	add	x25, x25, #0x1
    3e48:      	add	x27, x27, #0x10
    3e4c:      	add	x23, x23, #0x8
    3e50:      	add	w26, w26, #0x10
    3e54:      	tbz	w8, #0x1f, 0x3cbc <.text+0x2cbc>
    3e58:      	adrp	x1, 0xe000 <.text+0xd000>
    3e5c:      	adrp	x2, 0xe000 <.text+0xd000>
    3e60:      	sub	w3, w25, #0x1
    3e64:      	add	x1, x1, #0x7c6
    3e68:      	add	x2, x2, #0x65e
    3e6c:      	orr	w0, wzr, #0x80000000
    3e70:      	mov	w4, w8
    3e74:      	bl	0xac7c <.text+0x9c7c>
    3e78:      	b	0x3c34 <.text+0x2c34>
    3e7c:      	adrp	x1, 0xe000 <.text+0xd000>
    3e80:      	ldr	x3, [sp, #0x20]
    3e84:      	adrp	x2, 0xe000 <.text+0xd000>
    3e88:      	add	x1, x1, #0x70f
    3e8c:      	add	x2, x2, #0x65e
    3e90:      	orr	w0, wzr, #0x80000000
    3e94:      	mov	w4, w25
    3e98:      	mov	w5, w10
    3e9c:      	bl	0xac7c <.text+0x9c7c>
    3ea0:      	b	0x3c34 <.text+0x2c34>
    3ea4:      	adrp	x1, 0xe000 <.text+0xd000>
    3ea8:      	sxtw	x22, w22
    3eac:      	add	x1, x1, #0x73e
    3eb0:      	b	0x3c24 <.text+0x2c24>
    3eb4:      	adrp	x1, 0xe000 <.text+0xd000>
    3eb8:      	ldr	x3, [sp, #0x20]
    3ebc:      	adrp	x2, 0xe000 <.text+0xd000>
    3ec0:      	add	x1, x1, #0x75f
    3ec4:      	add	x2, x2, #0x65e
    3ec8:      	orr	w0, wzr, #0x80000000
    3ecc:      	mov	w4, w25
    3ed0:      	mov	w5, w9
    3ed4:      	sxtw	x22, w22
    3ed8:      	bl	0xac7c <.text+0x9c7c>
    3edc:      	b	0x3c34 <.text+0x2c34>
    3ee0:      	adrp	x1, 0xe000 <.text+0xd000>
    3ee4:      	add	x1, x1, #0x79b
    3ee8:      	b	0x3c24 <.text+0x2c24>
    3eec:      	adrp	x1, 0xe000 <.text+0xd000>
    3ef0:      	adrp	x2, 0xe000 <.text+0xd000>
    3ef4:      	add	x1, x1, #0x2ed
    3ef8:      	add	x2, x2, #0x65e
    3efc:      	orr	w0, wzr, #0x80000000
    3f00:      	bl	0xac7c <.text+0x9c7c>
    3f04:      	mov	x22, #-0x8000000000000000 // =-9223372036854775808
    3f08:      	movk	x22, #0x9
    3f0c:      	b	0x3c34 <.text+0x2c34>
    3f10:      	mov	w21, #0xc720            // =50976
    3f14:      	add	w0, w28, w21
    3f18:      	orr	w1, wzr, #0x3
    3f1c:      	bl	0xccc0 <.text+0xbcc0>
    3f20:      	mov	x0, x19
    3f24:      	bl	0x6a20 <.text+0x5a20>
    3f28:      	mov	x22, x0
    3f2c:      	tbnz	x22, #0x3f, 0x3f40 <.text+0x2f40>
    3f30:      	orr	w1, wzr, #0x1
    3f34:      	mov	x0, x19
    3f38:      	bl	0x208c <.text+0x108c>
    3f3c:      	b	0x3c34 <.text+0x2c34>
    3f40:      	adrp	x1, 0xe000 <.text+0xd000>
    3f44:      	add	x1, x1, #0x7f8
    3f48:      	b	0x3c24 <.text+0x2c24>
    3f4c:      	stp	x22, x21, [sp, #-0x30]!
    3f50:      	stp	x20, x19, [sp, #0x10]
    3f54:      	stp	x29, x30, [sp, #0x20]
    3f58:      	add	x29, sp, #0x20
    3f5c:      	sub	sp, sp, #0x10
    3f60:      	mov	x20, x0
    3f64:      	mov	w8, #0xc720             // =50976
    3f68:      	orr	w1, wzr, #0x3
    3f6c:      	ldr	x22, [x20, #0x1e0]
    3f70:      	add	x19, x20, #0x1f0
    3f74:      	add	x0, x22, x8
    3f78:      	bl	0xccc0 <.text+0xbcc0>
    3f7c:      	mov	x0, x20
    3f80:      	bl	0x410c <.text+0x310c>
    3f84:      	mov	x0, sp
    3f88:      	orr	w1, wzr, #0x10
    3f8c:      	mov	x21, sp
    3f90:      	bl	0xb1bc <.text+0xa1bc>
    3f94:      	add	x1, x20, #0x9dc
    3f98:      	mov	x0, sp
    3f9c:      	orr	w2, wzr, #0x10
    3fa0:      	bl	0xb25c <.text+0xa25c>
    3fa4:      	orr	x8, x21, #0x4
    3fa8:      	ldr	w9, [sp, #0x4]
    3fac:      	ldr	w10, [sp, #0xc]
    3fb0:      	mov	w11, #-0x410            // =-1040
    3fb4:      	mov	w14, #0x401             // =1025
    3fb8:      	ldr	w12, [x8, #0x4]
    3fbc:      	orr	w2, wzr, #0x1
    3fc0:      	mov	x3, sp
    3fc4:      	and	w13, w10, w11
    3fc8:      	orr	x10, xzr, #0x8000000000000000
    3fcc:      	bfi	x9, x12, #32, #32
    3fd0:      	orr	w15, w13, w14
    3fd4:      	bfxil	x10, x9, #0, #62
    3fd8:      	and	x9, x9, #0x3fffffffffffffff
    3fdc:      	mov	x0, x19
    3fe0:      	str	w15, [sp, #0xc]
    3fe4:      	mov	w1, wzr
    3fe8:      	lsr	x11, x10, #32
    3fec:      	str	w11, [x8, #0x4]
    3ff0:      	str	w9, [sp, #0x4]
    3ff4:      	bl	0x8fcc <.text+0x7fcc>
    3ff8:      	mov	w8, w0
    3ffc:      	tbnz	w8, #0x1f, 0x4098 <.text+0x3098>
    4000:      	mov	w21, #0x70000           // =458752
    4004:      	movk	w21, #0xa120
    4008:      	mov	w12, #0xc81c            // =51228
    400c:      	add	w0, w22, w12
    4010:      	orr	w1, wzr, #0x400
    4014:      	mov	w2, wzr
    4018:      	mov	w3, w21
    401c:      	bl	0xa6d4 <.text+0x96d4>
    4020:      	sxtw	x20, w0
    4024:      	tbnz	w0, #0x1f, 0x40bc <.text+0x30bc>
    4028:      	mov	x0, sp
    402c:      	orr	w1, wzr, #0x10
    4030:      	bl	0xb1bc <.text+0xa1bc>
    4034:      	ldr	w16, [sp, #0xc]
    4038:      	mov	w17, #0xfbf0            // =64496
    403c:      	mov	w2, #0x20000            // =131072
    4040:      	movk	w2, #0x409
    4044:      	mov	x0, x19
    4048:      	and	w1, w16, w17
    404c:      	orr	w3, w1, w2
    4050:      	mov	w1, wzr
    4054:      	mov	w2, wzr
    4058:      	str	w3, [sp, #0xc]
    405c:      	mov	x3, sp
    4060:      	bl	0x8fcc <.text+0x7fcc>
    4064:      	mov	w9, w0
    4068:      	tbnz	w9, #0x1f, 0x40d8 <.text+0x30d8>
    406c:      	mov	w4, #0xc80c             // =51212
    4070:      	add	w0, w22, w4
    4074:      	orr	w1, wzr, #0x400
    4078:      	mov	w2, wzr
    407c:      	mov	w3, w21
    4080:      	bl	0xa6d4 <.text+0x96d4>
    4084:      	sxtw	x20, w0
    4088:      	tbz	w0, #0x1f, 0x40f4 <.text+0x30f4>
    408c:      	adrp	x1, 0xe000 <.text+0xd000>
    4090:      	add	x1, x1, #0x8e6
    4094:      	b	0x40c4 <.text+0x30c4>
    4098:      	adrp	x1, 0xe000 <.text+0xd000>
    409c:      	adrp	x2, 0xe000 <.text+0xd000>
    40a0:      	add	x1, x1, #0x826
    40a4:      	add	x2, x2, #0x860
    40a8:      	orr	w0, wzr, #0x80000000
    40ac:      	mov	w3, w8
    40b0:      	bl	0xac7c <.text+0x9c7c>
    40b4:      	mov	x20, xzr
    40b8:      	b	0x40f4 <.text+0x30f4>
    40bc:      	adrp	x1, 0xe000 <.text+0xd000>
    40c0:      	add	x1, x1, #0x875
    40c4:      	adrp	x2, 0xe000 <.text+0xd000>
    40c8:      	add	x2, x2, #0x860
    40cc:      	orr	w0, wzr, #0x80000000
    40d0:      	bl	0xac7c <.text+0x9c7c>
    40d4:      	b	0x40f4 <.text+0x30f4>
    40d8:      	adrp	x1, 0xe000 <.text+0xd000>
    40dc:      	adrp	x2, 0xe000 <.text+0xd000>
    40e0:      	add	x1, x1, #0x8a9
    40e4:      	add	x2, x2, #0x860
    40e8:      	orr	w0, wzr, #0x80000000
    40ec:      	mov	w3, w9
    40f0:      	bl	0xac7c <.text+0x9c7c>
    40f4:      	mov	x0, x20
    40f8:      	sub	sp, x29, #0x20
    40fc:      	ldp	x29, x30, [sp, #0x20]
    4100:      	ldp	x20, x19, [sp, #0x10]
    4104:      	ldp	x22, x21, [sp], #0x30
    4108:      	ret
    410c:      	stp	x24, x23, [sp, #-0x40]!
    4110:      	stp	x22, x21, [sp, #0x10]
    4114:      	stp	x20, x19, [sp, #0x20]
    4118:      	stp	x29, x30, [sp, #0x30]
    411c:      	add	x29, sp, #0x30
    4120:      	mov	x19, x0
    4124:      	cbz	x19, 0x4184 <.text+0x3184>
    4128:      	add	x23, x19, #0x7d8
    412c:      	orr	w20, wzr, #0x1
    4130:      	b	0x413c <.text+0x313c>
    4134:      	add	x20, x20, #0x1
    4138:      	add	x23, x23, #0x20
    413c:      	cmp	x20, #0x10
    4140:      	b.eq	0x4184 <.text+0x3184>
    4144:      	mov	x21, xzr
    4148:      	mov	x22, x23
    414c:      	b	0x4158 <.text+0x3158>
    4150:      	add	x21, x21, #0x1
    4154:      	add	x22, x22, #0x10
    4158:      	cmp	x21, #0x2
    415c:      	b.eq	0x4134 <.text+0x3134>
    4160:      	mov	x0, x22
    4164:      	bl	0xb94c <.text+0xa94c>
    4168:      	and	w8, w0, #0xff
    416c:      	cbnz	w8, 0x4150 <.text+0x3150>
    4170:      	mov	x0, x19
    4174:      	mov	w1, w20
    4178:      	mov	w2, w21
    417c:      	bl	0x51e8 <.text+0x41e8>
    4180:      	b	0x4150 <.text+0x3150>
    4184:      	ldp	x29, x30, [sp, #0x30]
    4188:      	ldp	x20, x19, [sp, #0x20]
    418c:      	ldp	x22, x21, [sp, #0x10]
    4190:      	ldp	x24, x23, [sp], #0x40
    4194:      	ret
    4198:      	stp	x28, x27, [sp, #-0x60]!
    419c:      	stp	x26, x25, [sp, #0x10]
    41a0:      	stp	x24, x23, [sp, #0x20]
    41a4:      	stp	x22, x21, [sp, #0x30]
    41a8:      	stp	x20, x19, [sp, #0x40]
    41ac:      	stp	x29, x30, [sp, #0x50]
    41b0:      	add	x29, sp, #0x50
    41b4:      	sub	sp, sp, #0x30
    41b8:      	mov	x24, x0
    41bc:      	add	x0, x24, #0x1f0
    41c0:      	mov	w20, w1
    41c4:      	ldr	w11, [x24, #0x1e0]
    41c8:      	orr	w1, wzr, #0x10
    41cc:      	str	x0, [sp, #0x10]
    41d0:      	add	x0, sp, #0x20
    41d4:      	mov	w26, w3
    41d8:      	str	w20, [sp, #0x1c]
    41dc:      	mov	w21, w7
    41e0:      	mov	w27, w6
    41e4:      	str	w11, [sp, #0xc]
    41e8:      	mov	w28, w5
    41ec:      	mov	w22, w4
    41f0:      	mov	w23, w2
    41f4:      	and	w25, w26, #0xff
    41f8:      	add	x19, sp, #0x20
    41fc:      	bl	0xb1bc <.text+0xa1bc>
    4200:      	orr	x8, x19, #0x4
    4204:      	ldr	w10, [sp, #0x24]
    4208:      	ldr	w11, [sp, #0x2c]
    420c:      	and	w20, w20, #0xff
    4210:      	and	w19, w23, #0xff
    4214:      	ldr	w13, [x8, #0x4]
    4218:      	mov	w14, #-0x410            // =-1040
    421c:      	mov	w12, #0x401             // =1025
    4220:      	and	w14, w11, w14
    4224:      	orr	w15, w14, w12
    4228:      	bfi	x10, x13, #32, #32
    422c:      	orr	w13, w19, w20, lsl #1
    4230:      	lsl	w11, w13, #25
    4234:      	str	w15, [sp, #0x2c]
    4238:      	and	x9, x11, #0x3e000000
    423c:      	and	x10, x10, #0xffffffffc1ffffff
    4240:      	orr	x9, x10, x9
    4244:      	cmp	w25, #0x3
    4248:      	b.ne	0x4260 <.text+0x3260>
    424c:      	lsl	w10, w21, #16
    4250:      	add	w11, w10, #0xff0, lsl #12 // =0xff0000
    4254:      	and	x12, x11, #0xff0000
    4258:      	and	x13, x9, #0xffffffffff00ffff
    425c:      	orr	x9, x13, x12
    4260:      	mov	w12, #0x1000000         // =16777216
    4264:      	ldrb	w16, [x24, #0x614]
    4268:      	movk	w12, #0x2000
    426c:      	tst	w28, #0xff
    4270:      	orr	x14, x9, x12
    4274:      	csel	x15, x9, x14, eq
    4278:      	add	x9, x24, w20, uxtw #1
    427c:      	mov	x17, #0x3c01ffffffffffff // =4324018592229097471
    4280:      	add	x10, x9, w19, uxtw
    4284:      	movk	x17, #0xc001, lsl #32
    4288:      	mov	x4, #0x3c0000000000000  // =270215977642229760
    428c:      	movk	x17, #0xf8e0
    4290:      	ldrb	w7, [x10, #0x615]
    4294:      	movk	x4, #0x1f
    4298:      	and	x3, x15, x17
    429c:      	bfi	x16, x27, #54, #10
    42a0:      	and	x6, x16, x4
    42a4:      	ubfiz	x21, x26, #33, #2
    42a8:      	orr	x26, x3, x6
    42ac:      	add	x15, x24, x20, lsl #5
    42b0:      	bfi	x21, x22, #35, #11
    42b4:      	add	x11, x15, w19, uxtw #4
    42b8:      	bfi	x21, x7, #49, #5
    42bc:      	orr	x27, x26, x21
    42c0:      	orr	w14, w26, #0x100
    42c4:      	add	x0, x11, #0x9cc
    42c8:      	add	x1, sp, #0x20
    42cc:      	orr	w2, wzr, #0x10
    42d0:      	lsr	x5, x27, #32
    42d4:      	str	w5, [x8, #0x4]
    42d8:      	str	w14, [sp, #0x24]
    42dc:      	bl	0xb25c <.text+0xa25c>
    42e0:      	ldr	x0, [sp, #0x10]
    42e4:      	add	x3, sp, #0x20
    42e8:      	ldr	w1, [sp, #0x1c]
    42ec:      	mov	w2, w23
    42f0:      	bl	0x8fcc <.text+0x7fcc>
    42f4:      	mov	w8, w0
    42f8:      	tbnz	w8, #0x1f, 0x43f4 <.text+0x33f4>
    42fc:      	ldr	w12, [sp, #0xc]
    4300:      	lsl	w2, w20, #1
    4304:      	add	w21, w2, w19
    4308:      	mov	w28, #0x70000           // =458752
    430c:      	mov	w5, #0xc80c             // =51212
    4310:      	add	w3, w12, w21, lsl #4
    4314:      	movk	w28, #0xa120
    4318:      	add	w27, w3, w5
    431c:      	orr	w1, wzr, #0x400
    4320:      	mov	w0, w27
    4324:      	mov	w2, wzr
    4328:      	mov	w3, w28
    432c:      	bl	0xa6d4 <.text+0x96d4>
    4330:      	sxtw	x26, w0
    4334:      	tbnz	w0, #0x1f, 0x4420 <.text+0x3420>
    4338:      	add	x0, sp, #0x20
    433c:      	orr	w1, wzr, #0x10
    4340:      	bl	0xb1bc <.text+0xa1bc>
    4344:      	ldr	w6, [sp, #0x2c]
    4348:      	mov	w4, #-0x410             // =-1040
    434c:      	mov	w7, #0x402              // =1026
    4350:      	ldr	x0, [sp, #0x10]
    4354:      	ldr	w1, [sp, #0x1c]
    4358:      	orr	w10, wzr, #0x1
    435c:      	add	x3, sp, #0x20
    4360:      	and	w8, w6, w4
    4364:      	orr	w9, w8, w7
    4368:      	strh	w10, [sp, #0x28]
    436c:      	mov	w2, w23
    4370:      	str	w9, [sp, #0x2c]
    4374:      	bl	0x8fcc <.text+0x7fcc>
    4378:      	mov	w9, w0
    437c:      	tbnz	w9, #0x1f, 0x4440 <.text+0x3440>
    4380:      	orr	w1, wzr, #0x400
    4384:      	mov	w0, w27
    4388:      	mov	w2, wzr
    438c:      	mov	w3, w28
    4390:      	bl	0xa6d4 <.text+0x96d4>
    4394:      	sxtw	x26, w0
    4398:      	tbnz	w0, #0x1f, 0x4420 <.text+0x3420>
    439c:      	ldr	x8, [x24, #0x1e0]
    43a0:      	mov	w27, #0xc720            // =50976
    43a4:      	add	x0, x8, x27
    43a8:      	bl	0xcc88 <.text+0xbc88>
    43ac:      	ldr	x2, [x24, #0x1e0]
    43b0:      	orr	w28, wzr, #0x1
    43b4:      	lsl	w1, w28, w21
    43b8:      	orr	w1, w0, w1
    43bc:      	add	x0, x2, x27
    43c0:      	bl	0xccc0 <.text+0xbcc0>
    43c4:      	ldr	x0, [x24, #0x1e0]
    43c8:      	add	x0, x0, x27
    43cc:      	bl	0xcc88 <.text+0xbc88>
    43d0:      	add	x1, x24, x20, lsl #4
    43d4:      	add	x8, x1, x19, lsl #3
    43d8:      	ldr	x5, [x8, #0x638]
    43dc:      	cbz	x5, 0x4464 <.text+0x3464>
    43e0:      	add	x9, x24, x20, lsl #3
    43e4:      	add	x16, x9, x19, lsl #2
    43e8:      	ldr	w27, [x16, #0x738]
    43ec:      	lsl	w7, w27, #4
    43f0:      	b	0x4494 <.text+0x3494>
    43f4:      	adrp	x1, 0xe000 <.text+0xd000>
    43f8:      	adrp	x2, 0xe000 <.text+0xd000>
    43fc:      	add	x1, x1, #0x91a
    4400:      	add	x2, x2, #0x94e
    4404:      	orr	w0, wzr, #0x80000000
    4408:      	mov	w3, w20
    440c:      	mov	w4, w19
    4410:      	mov	w5, w8
    4414:      	bl	0xac7c <.text+0x9c7c>
    4418:      	mov	x26, xzr
    441c:      	b	0x44dc <.text+0x34dc>
    4420:      	adrp	x1, 0xe000 <.text+0xd000>
    4424:      	adrp	x2, 0xe000 <.text+0xd000>
    4428:      	add	x1, x1, #0x966
    442c:      	add	x2, x2, #0x94e
    4430:      	orr	w0, wzr, #0x80000000
    4434:      	mov	x3, x26
    4438:      	bl	0xac7c <.text+0x9c7c>
    443c:      	b	0x44dc <.text+0x34dc>
    4440:      	adrp	x1, 0xe000 <.text+0xd000>
    4444:      	adrp	x2, 0xe000 <.text+0xd000>
    4448:      	add	x1, x1, #0x988
    444c:      	add	x2, x2, #0x94e
    4450:      	orr	w0, wzr, #0x80000000
    4454:      	mov	w3, w20
    4458:      	mov	w4, w19
    445c:      	mov	w5, w9
    4460:      	b	0x44d8 <.text+0x34d8>
    4464:      	orr	w0, wzr, #0x30
    4468:      	orr	w1, wzr, #0x10
    446c:      	add	x25, x8, #0x638
    4470:      	bl	0xd1a0 <.text+0xc1a0>
    4474:      	str	x0, [x25]
    4478:      	cbz	x0, 0x4500 <.text+0x3500>
    447c:      	add	x10, x24, x20, lsl #3
    4480:      	add	x17, x10, x19, lsl #2
    4484:      	orr	w0, wzr, #0x3
    4488:      	orr	w7, wzr, #0x30
    448c:      	str	w0, [x17, #0x738]
    4490:      	ldr	x5, [x25]
    4494:      	ldrb	w4, [x24, #0x614]
    4498:      	and	w3, w22, #0xffff
    449c:      	ldr	x0, [sp, #0x10]
    44a0:      	mov	w2, w23
    44a4:      	ldr	w1, [sp, #0x1c]
    44a8:      	mov	x6, x5
    44ac:      	bl	0x8bac <.text+0x7bac>
    44b0:      	mov	w10, w0
    44b4:      	tbz	w10, #0x1f, 0x44dc <.text+0x34dc>
    44b8:      	adrp	x1, 0xe000 <.text+0xd000>
    44bc:      	adrp	x2, 0xe000 <.text+0xd000>
    44c0:      	add	x1, x1, #0x9c7
    44c4:      	add	x2, x2, #0x94e
    44c8:      	orr	w0, wzr, #0x80000000
    44cc:      	mov	w3, w20
    44d0:      	mov	w4, w19
    44d4:      	mov	w5, w10
    44d8:      	bl	0xac7c <.text+0x9c7c>
    44dc:      	mov	x0, x26
    44e0:      	sub	sp, x29, #0x50
    44e4:      	ldp	x29, x30, [sp, #0x50]
    44e8:      	ldp	x20, x19, [sp, #0x40]
    44ec:      	ldp	x22, x21, [sp, #0x30]
    44f0:      	ldp	x24, x23, [sp, #0x20]
    44f4:      	ldp	x26, x25, [sp, #0x10]
    44f8:      	ldp	x28, x27, [sp], #0x60
    44fc:      	ret
    4500:      	adrp	x1, 0xe000 <.text+0xd000>
    4504:      	adrp	x2, 0xe000 <.text+0xd000>
    4508:      	add	x1, x1, #0x2ed
    450c:      	add	x2, x2, #0x94e
    4510:      	orr	w0, wzr, #0x80000000
    4514:      	bl	0xac7c <.text+0x9c7c>
    4518:      	mov	x26, #-0x8000000000000000 // =-9223372036854775808
    451c:      	movk	x26, #0x9
    4520:      	b	0x44dc <.text+0x34dc>
    4524:      	stp	x20, x19, [sp, #-0x20]!
    4528:      	stp	x29, x30, [sp, #0x10]
    452c:      	add	x29, sp, #0x10
    4530:      	cbz	x0, 0x455c <.text+0x355c>
    4534:      	ldr	x8, [x0, #0x1e0]
    4538:      	mov	w9, #0xc704             // =50948
    453c:      	add	x19, x8, x9
    4540:      	mov	x0, x19
    4544:      	bl	0xcc88 <.text+0xbc88>
    4548:      	orr	w1, w0, #0x200
    454c:      	mov	x0, x19
    4550:      	bl	0xccc0 <.text+0xbcc0>
    4554:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    4558:      	b	0x457c <.text+0x357c>
    455c:      	adrp	x1, 0xf000 <.text+0xe000>
    4560:      	adrp	x2, 0xe000 <.text+0xd000>
    4564:      	add	x1, x1, #0xce7
    4568:      	add	x2, x2, #0x9fc
    456c:      	orr	w0, wzr, #0x80000000
    4570:      	bl	0xac7c <.text+0x9c7c>
    4574:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4578:      	movk	x0, #0x2
    457c:      	ldp	x29, x30, [sp, #0x10]
    4580:      	ldp	x20, x19, [sp], #0x20
    4584:      	ret
    4588:      	stp	x20, x19, [sp, #-0x20]!
    458c:      	stp	x29, x30, [sp, #0x10]
    4590:      	add	x29, sp, #0x10
    4594:      	cbz	x0, 0x45c0 <.text+0x35c0>
    4598:      	ldr	x8, [x0, #0x1e0]
    459c:      	mov	w9, #0xc704             // =50948
    45a0:      	add	x19, x8, x9
    45a4:      	mov	x0, x19
    45a8:      	bl	0xcc88 <.text+0xbc88>
    45ac:      	orr	w1, w0, #0x800
    45b0:      	mov	x0, x19
    45b4:      	bl	0xccc0 <.text+0xbcc0>
    45b8:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    45bc:      	b	0x45e0 <.text+0x35e0>
    45c0:      	adrp	x1, 0xf000 <.text+0xe000>
    45c4:      	adrp	x2, 0xe000 <.text+0xd000>
    45c8:      	add	x1, x1, #0xce7
    45cc:      	add	x2, x2, #0xa13
    45d0:      	orr	w0, wzr, #0x80000000
    45d4:      	bl	0xac7c <.text+0x9c7c>
    45d8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    45dc:      	movk	x0, #0x2
    45e0:      	ldp	x29, x30, [sp, #0x10]
    45e4:      	ldp	x20, x19, [sp], #0x20
    45e8:      	ret
    45ec:      	stp	x20, x19, [sp, #-0x20]!
    45f0:      	stp	x29, x30, [sp, #0x10]
    45f4:      	add	x29, sp, #0x10
    45f8:      	mov	x19, x0
    45fc:      	cbz	x19, 0x4644 <.text+0x3644>
    4600:      	ldr	w3, [x19, #0xe0c]
    4604:      	sub	w8, w3, #0x1
    4608:      	cmp	w8, #0x4
    460c:      	b.hi	0x4668 <.text+0x3668>
    4610:      	ldr	x8, [x19, #0x1e0]
    4614:      	mov	w9, #0xc704             // =50948
    4618:      	add	x20, x8, x9
    461c:      	mov	x0, x20
    4620:      	bl	0xcc88 <.text+0xbc88>
    4624:      	ldr	w10, [x19, #0xe0c]
    4628:      	mov	w8, w0
    462c:      	mov	x0, x20
    4630:      	bfi	w8, w10, #1, #4
    4634:      	mov	w1, w8
    4638:      	bl	0xccc0 <.text+0xbcc0>
    463c:      	mov	x0, xzr
    4640:      	b	0x4684 <.text+0x3684>
    4644:      	adrp	x1, 0xf000 <.text+0xe000>
    4648:      	adrp	x2, 0xe000 <.text+0xd000>
    464c:      	add	x1, x1, #0xce7
    4650:      	add	x2, x2, #0xa2a
    4654:      	orr	w0, wzr, #0x80000000
    4658:      	bl	0xac7c <.text+0x9c7c>
    465c:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4660:      	movk	x0, #0x2
    4664:      	b	0x4684 <.text+0x3684>
    4668:      	adrp	x1, 0xe000 <.text+0xd000>
    466c:      	adrp	x2, 0xe000 <.text+0xd000>
    4670:      	add	x1, x1, #0xa43
    4674:      	add	x2, x2, #0xa2a
    4678:      	orr	w0, wzr, #0x80000000
    467c:      	bl	0xac7c <.text+0x9c7c>
    4680:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    4684:      	ldp	x29, x30, [sp, #0x10]
    4688:      	ldp	x20, x19, [sp], #0x20
    468c:      	ret
    4690:      	stp	x22, x21, [sp, #-0x30]!
    4694:      	stp	x20, x19, [sp, #0x10]
    4698:      	stp	x29, x30, [sp, #0x20]
    469c:      	add	x29, sp, #0x20
    46a0:      	sub	sp, sp, #0x10
    46a4:      	mov	x19, x0
    46a8:      	mov	w9, #0xc704             // =50948
    46ac:      	add	x20, x19, #0x1f0
    46b0:      	ldr	x8, [x19, #0x1e0]
    46b4:      	add	x0, x8, x9
    46b8:      	bl	0xcc88 <.text+0xbc88>
    46bc:      	tbnz	w0, #0xb, 0x46dc <.text+0x36dc>
    46c0:      	ldr	x10, [x19, #0x1e0]
    46c4:      	mov	w11, #0xc704            // =50948
    46c8:      	add	x0, x10, x11
    46cc:      	bl	0xcc88 <.text+0xbc88>
    46d0:      	tbnz	w0, #0x9, 0x46f8 <.text+0x36f8>
    46d4:      	mov	w21, wzr
    46d8:      	b	0x4708 <.text+0x3708>
    46dc:      	ldrb	w9, [x19, #0x1a4]
    46e0:      	mov	w11, #0x7d              // =125
    46e4:      	ldrb	w8, [x19, #0x1a3]
    46e8:      	bfi	w8, w9, #8, #8
    46ec:      	cmp	w8, #0x7d
    46f0:      	csel	w21, w8, w11, lo
    46f4:      	b	0x4708 <.text+0x3708>
    46f8:      	ldrb	w9, [x19, #0x1a0]
    46fc:      	mov	w13, #0x7d              // =125
    4700:      	cmp	w9, #0x7d
    4704:      	csel	w21, w9, w13, lo
    4708:      	add	x0, sp, #0x8
    470c:      	orr	w1, wzr, #0x8
    4710:      	bl	0xb1bc <.text+0xa1bc>
    4714:      	ldp	w17, w14, [sp, #0x8]
    4718:      	mov	w15, #-0x500            // =-1280
    471c:      	mov	w16, #0x402             // =1026
    4720:      	mov	x0, x20
    4724:      	and	w1, w14, w15
    4728:      	orr	w2, w1, w16
    472c:      	add	x1, sp, #0x8
    4730:      	bfxil	w17, w21, #0, #10
    4734:      	stp	w17, w2, [sp, #0x8]
    4738:      	bl	0x9ffc <.text+0x8ffc>
    473c:      	mov	w8, w0
    4740:      	tbnz	w8, #0x1f, 0x4788 <.text+0x3788>
    4744:      	ldr	w4, [x19, #0x1e0]
    4748:      	mov	w5, #0xc714             // =50964
    474c:      	mov	w3, #0x70000            // =458752
    4750:      	movk	w3, #0xa120
    4754:      	orr	w1, wzr, #0x400
    4758:      	add	w0, w4, w5
    475c:      	mov	w2, wzr
    4760:      	bl	0xa6d4 <.text+0x96d4>
    4764:      	sxtw	x19, w0
    4768:      	tbz	w0, #0x1f, 0x47a8 <.text+0x37a8>
    476c:      	adrp	x1, 0xe000 <.text+0xd000>
    4770:      	adrp	x2, 0xe000 <.text+0xd000>
    4774:      	add	x1, x1, #0xab7
    4778:      	add	x2, x2, #0xaa2
    477c:      	orr	w0, wzr, #0x80000000
    4780:      	bl	0xac7c <.text+0x9c7c>
    4784:      	b	0x47a8 <.text+0x37a8>
    4788:      	adrp	x1, 0xe000 <.text+0xd000>
    478c:      	adrp	x2, 0xe000 <.text+0xd000>
    4790:      	add	x1, x1, #0xa66
    4794:      	add	x2, x2, #0xaa2
    4798:      	orr	w0, wzr, #0x80000000
    479c:      	mov	w3, w8
    47a0:      	bl	0xac7c <.text+0x9c7c>
    47a4:      	mov	x19, xzr
    47a8:      	mov	x0, x19
    47ac:      	sub	sp, x29, #0x20
    47b0:      	ldp	x29, x30, [sp, #0x20]
    47b4:      	ldp	x20, x19, [sp, #0x10]
    47b8:      	ldp	x22, x21, [sp], #0x30
    47bc:      	ret
    47c0:      	stp	x20, x19, [sp, #-0x20]!
    47c4:      	stp	x29, x30, [sp, #0x10]
    47c8:      	add	x29, sp, #0x10
    47cc:      	mov	x19, x0
    47d0:      	mov	w9, #0xc700             // =50944
    47d4:      	ldr	x8, [x19, #0x1e0]
    47d8:      	add	x20, x8, x9
    47dc:      	mov	x0, x20
    47e0:      	bl	0xcc88 <.text+0xbc88>
    47e4:      	ldrb	w9, [x19, #0x189]
    47e8:      	mov	w8, w0
    47ec:      	mov	x0, x20
    47f0:      	bfi	w8, w9, #3, #7
    47f4:      	mov	w1, w8
    47f8:      	bl	0xccc0 <.text+0xbcc0>
    47fc:      	ldp	x29, x30, [sp, #0x10]
    4800:      	mov	x0, xzr
    4804:      	ldp	x20, x19, [sp], #0x20
    4808:      	ret
    480c:      	stp	x22, x21, [sp, #-0x30]!
    4810:      	stp	x20, x19, [sp, #0x10]
    4814:      	stp	x29, x30, [sp, #0x20]
    4818:      	add	x29, sp, #0x20
    481c:      	mov	x19, x1
    4820:      	mov	x20, x0
    4824:      	bl	0x6c30 <.text+0x5c30>
    4828:      	mov	w21, w0
    482c:      	mov	x0, x19
    4830:      	bl	0x6a90 <.text+0x5a90>
    4834:      	mov	x19, x0
    4838:      	tbnz	x19, #0x3f, 0x4868 <.text+0x3868>
    483c:      	cbz	w21, 0x4884 <.text+0x3884>
    4840:      	mov	w0, w21
    4844:      	bl	0x6c40 <.text+0x5c40>
    4848:      	adrp	x1, 0xe000 <.text+0xd000>
    484c:      	adrp	x2, 0xe000 <.text+0xd000>
    4850:      	mov	x3, x0
    4854:      	add	x1, x1, #0xb17
    4858:      	add	x2, x2, #0xb03
    485c:      	orr	w0, wzr, #0x80000000
    4860:      	bl	0xac7c <.text+0x9c7c>
    4864:      	b	0x48c4 <.text+0x38c4>
    4868:      	adrp	x1, 0xe000 <.text+0xd000>
    486c:      	adrp	x2, 0xe000 <.text+0xd000>
    4870:      	add	x1, x1, #0xaca
    4874:      	add	x2, x2, #0xb03
    4878:      	orr	w0, wzr, #0x80000000
    487c:      	bl	0xac7c <.text+0x9c7c>
    4880:      	b	0x48c4 <.text+0x38c4>
    4884:      	mov	x0, x20
    4888:      	bl	0x410c <.text+0x310c>
    488c:      	mov	x0, x20
    4890:      	bl	0x48d8 <.text+0x38d8>
    4894:      	ldr	x8, [x20, #0x1e0]
    4898:      	mov	w9, #0xc700             // =50944
    489c:      	add	x21, x8, x9
    48a0:      	mov	x0, x21
    48a4:      	bl	0xcc88 <.text+0xbc88>
    48a8:      	and	w1, w0, #0xfffffc07
    48ac:      	mov	x0, x21
    48b0:      	bl	0xccc0 <.text+0xbcc0>
    48b4:      	add	x0, x20, #0x1f0
    48b8:      	bl	0x8864 <.text+0x7864>
    48bc:      	mov	x0, x20
    48c0:      	bl	0x650c <.text+0x550c>
    48c4:      	mov	x0, x19
    48c8:      	ldp	x29, x30, [sp, #0x20]
    48cc:      	ldp	x20, x19, [sp, #0x10]
    48d0:      	ldp	x22, x21, [sp], #0x30
    48d4:      	ret
    48d8:      	stp	x24, x23, [sp, #-0x40]!
    48dc:      	stp	x22, x21, [sp, #0x10]
    48e0:      	stp	x20, x19, [sp, #0x20]
    48e4:      	stp	x29, x30, [sp, #0x30]
    48e8:      	add	x29, sp, #0x30
    48ec:      	sub	sp, sp, #0x10
    48f0:      	mov	x19, x0
    48f4:      	cbz	x19, 0x499c <.text+0x399c>
    48f8:      	adrp	x22, 0xe000 <.text+0xd000>
    48fc:      	adrp	x23, 0xe000 <.text+0xd000>
    4900:      	mov	w20, wzr
    4904:      	add	x21, x19, #0x1f0
    4908:      	add	x22, x22, #0xd34
    490c:      	add	x23, x23, #0xe1e
    4910:      	b	0x4918 <.text+0x3918>
    4914:      	add	w20, w20, #0x1
    4918:      	cmp	w20, #0x10
    491c:      	b.eq	0x499c <.text+0x399c>
    4920:      	mov	w24, wzr
    4924:      	b	0x492c <.text+0x392c>
    4928:      	add	w24, w24, #0x1
    492c:      	cmp	w24, #0x2
    4930:      	b.eq	0x4914 <.text+0x3914>
    4934:      	add	x3, sp, #0xc
    4938:      	str	wzr, [sp, #0xc]
    493c:      	mov	x0, x21
    4940:      	mov	w1, w20
    4944:      	mov	w2, w24
    4948:      	bl	0x921c <.text+0x821c>
    494c:      	mov	w8, w0
    4950:      	tbnz	w8, #0x1f, 0x497c <.text+0x397c>
    4954:      	ldr	w8, [sp, #0xc]
    4958:      	cmp	w8, #0x5
    495c:      	ccmp	w8, #0x3, #0x4, ne
    4960:      	b.ne	0x4928 <.text+0x3928>
    4964:      	mov	w3, wzr
    4968:      	mov	x0, x19
    496c:      	mov	w1, w20
    4970:      	mov	w2, w24
    4974:      	bl	0x5468 <.text+0x4468>
    4978:      	b	0x4928 <.text+0x3928>
    497c:      	orr	w0, wzr, #0x80000000
    4980:      	mov	x1, x22
    4984:      	mov	x2, x23
    4988:      	mov	w3, w20
    498c:      	mov	w4, w24
    4990:      	mov	w5, w8
    4994:      	bl	0xac7c <.text+0x9c7c>
    4998:      	b	0x4928 <.text+0x3928>
    499c:      	sub	sp, x29, #0x30
    49a0:      	ldp	x29, x30, [sp, #0x30]
    49a4:      	ldp	x20, x19, [sp, #0x20]
    49a8:      	ldp	x22, x21, [sp, #0x10]
    49ac:      	ldp	x24, x23, [sp], #0x40
    49b0:      	ret
    49b4:      	stp	x26, x25, [sp, #-0x50]!
    49b8:      	stp	x24, x23, [sp, #0x10]
    49bc:      	stp	x22, x21, [sp, #0x20]
    49c0:      	stp	x20, x19, [sp, #0x30]
    49c4:      	stp	x29, x30, [sp, #0x40]
    49c8:      	add	x29, sp, #0x40
    49cc:      	sub	sp, sp, #0x30
    49d0:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    49d4:      	mov	x20, x0
    49d8:      	movk	x19, #0x2
    49dc:      	cbz	x20, 0x49fc <.text+0x39fc>
    49e0:      	ldr	w8, [x20, #0x198]
    49e4:      	cmp	w8, #0x1
    49e8:      	b.hi	0x4a18 <.text+0x3a18>
    49ec:      	orr	w9, wzr, #0x1
    49f0:      	add	x21, x20, #0x1f0
    49f4:      	strb	w9, [x20, #0x19c]
    49f8:      	b	0x4a28 <.text+0x3a28>
    49fc:      	adrp	x1, 0xf000 <.text+0xe000>
    4a00:      	adrp	x2, 0xe000 <.text+0xd000>
    4a04:      	add	x1, x1, #0xce7
    4a08:      	add	x2, x2, #0xb4a
    4a0c:      	orr	w0, wzr, #0x80000000
    4a10:      	bl	0xac7c <.text+0x9c7c>
    4a14:      	b	0x4d28 <.text+0x3d28>
    4a18:      	mov	x19, xzr
    4a1c:      	b	0x4d1c <.text+0x3d1c>
    4a20:      	mov	x0, x20
    4a24:      	bl	0x4d48 <.text+0x3d48>
    4a28:      	mov	w1, wzr
    4a2c:      	mov	w2, wzr
    4a30:      	add	x3, sp, #0x2c
    4a34:      	mov	x0, x21
    4a38:      	bl	0x921c <.text+0x821c>
    4a3c:      	orr	w2, wzr, #0x1
    4a40:      	add	x3, sp, #0x28
    4a44:      	mov	x0, x21
    4a48:      	mov	w1, wzr
    4a4c:      	bl	0x921c <.text+0x821c>
    4a50:      	ldp	w10, w9, [sp, #0x28]
    4a54:      	cmp	w9, #0x4
    4a58:      	ccmp	w10, #0x4, #0x4, ne
    4a5c:      	b.eq	0x4a20 <.text+0x3a20>
    4a60:      	adrp	x25, 0x13000
    4a64:      	mov	w22, #0x2710            // =10000
    4a68:      	mov	x0, x22
    4a6c:      	ldr	x8, [x25, #0x478]
    4a70:      	ldr	x8, [x8, #0xf8]
    4a74:      	blr	x8
    4a78:      	mov	w23, #0xfd              // =253
    4a7c:      	mov	w2, wzr
    4a80:      	add	x3, sp, #0xc
    4a84:      	mov	x0, x21
    4a88:      	mov	w1, w23
    4a8c:      	bl	0xa0f4 <.text+0x90f4>
    4a90:      	mov	w24, wzr
    4a94:      	b	0x4ac8 <.text+0x3ac8>
    4a98:      	mov	x0, x20
    4a9c:      	bl	0x4d48 <.text+0x3d48>
    4aa0:      	ldr	x9, [x25, #0x478]
    4aa4:      	mov	w0, w22
    4aa8:      	ldr	x9, [x9, #0xf8]
    4aac:      	blr	x9
    4ab0:      	mov	w2, wzr
    4ab4:      	add	x3, sp, #0xc
    4ab8:      	mov	x0, x21
    4abc:      	mov	w1, w23
    4ac0:      	bl	0xa0f4 <.text+0x90f4>
    4ac4:      	add	w24, w24, #0x1
    4ac8:      	tbnz	w0, #0x1f, 0x4ae8 <.text+0x3ae8>
    4acc:      	and	w8, w24, #0xff
    4ad0:      	cmp	w8, #0x31
    4ad4:      	b.hi	0x4ae8 <.text+0x3ae8>
    4ad8:      	ldrb	w12, [x20, #0x19d]
    4adc:      	cbz	w12, 0x4a98 <.text+0x3a98>
    4ae0:      	ldr	w13, [sp, #0xc]
    4ae4:      	cbnz	w13, 0x4a98 <.text+0x3a98>
    4ae8:      	mov	x0, x20
    4aec:      	bl	0x410c <.text+0x310c>
    4af0:      	ldr	x10, [x25, #0x478]
    4af4:      	mov	w22, #0x2710            // =10000
    4af8:      	mov	x0, x22
    4afc:      	ldr	x10, [x10, #0xf8]
    4b00:      	blr	x10
    4b04:      	mov	w23, #0xfd              // =253
    4b08:      	mov	w2, wzr
    4b0c:      	add	x3, sp, #0xc
    4b10:      	mov	x0, x21
    4b14:      	mov	w1, w23
    4b18:      	bl	0xa0f4 <.text+0x90f4>
    4b1c:      	mov	w24, wzr
    4b20:      	b	0x4b54 <.text+0x3b54>
    4b24:      	mov	x0, x20
    4b28:      	bl	0x4d48 <.text+0x3d48>
    4b2c:      	ldr	x11, [x25, #0x478]
    4b30:      	mov	w0, w22
    4b34:      	ldr	x11, [x11, #0xf8]
    4b38:      	blr	x11
    4b3c:      	mov	w2, wzr
    4b40:      	add	x3, sp, #0xc
    4b44:      	mov	x0, x21
    4b48:      	mov	w1, w23
    4b4c:      	bl	0xa0f4 <.text+0x90f4>
    4b50:      	add	w24, w24, #0x1
    4b54:      	tbnz	w0, #0x1f, 0x4b74 <.text+0x3b74>
    4b58:      	and	w9, w24, #0xff
    4b5c:      	cmp	w9, #0x31
    4b60:      	b.hi	0x4b74 <.text+0x3b74>
    4b64:      	ldrb	w15, [x20, #0x19d]
    4b68:      	cbz	w15, 0x4b24 <.text+0x3b24>
    4b6c:      	ldr	w16, [sp, #0xc]
    4b70:      	cbnz	w16, 0x4b24 <.text+0x3b24>
    4b74:      	ldr	w17, [sp, #0x10]
    4b78:      	mov	w1, #-0xf02             // =-3842
    4b7c:      	add	x0, sp, #0x10
    4b80:      	and	w2, w17, w1
    4b84:      	orr	w11, w2, #0x1
    4b88:      	str	w11, [sp, #0x10]
    4b8c:      	bl	0x6a90 <.text+0x5a90>
    4b90:      	mov	x22, x0
    4b94:      	tbnz	x22, #0x3f, 0x4c58 <.text+0x3c58>
    4b98:      	ldr	x12, [x25, #0x478]
    4b9c:      	mov	w0, #0x10000            // =65536
    4ba0:      	movk	w0, #0x86a0
    4ba4:      	ldr	x12, [x12, #0xf8]
    4ba8:      	blr	x12
    4bac:      	mov	w23, #0xfd              // =253
    4bb0:      	mov	w2, wzr
    4bb4:      	add	x3, sp, #0xc
    4bb8:      	mov	x0, x21
    4bbc:      	mov	w1, w23
    4bc0:      	bl	0xa0f4 <.text+0x90f4>
    4bc4:      	mov	w22, w0
    4bc8:      	mov	w24, #0x2710            // =10000
    4bcc:      	b	0x4c00 <.text+0x3c00>
    4bd0:      	mov	x0, x20
    4bd4:      	bl	0x4d48 <.text+0x3d48>
    4bd8:      	ldr	x13, [x25, #0x478]
    4bdc:      	mov	x0, x24
    4be0:      	ldr	x13, [x13, #0xf8]
    4be4:      	blr	x13
    4be8:      	mov	w2, wzr
    4bec:      	add	x3, sp, #0xc
    4bf0:      	mov	x0, x21
    4bf4:      	mov	w1, w23
    4bf8:      	bl	0xa0f4 <.text+0x90f4>
    4bfc:      	mov	w22, w0
    4c00:      	tbnz	w22, #0x1f, 0x4c0c <.text+0x3c0c>
    4c04:      	ldr	w4, [sp, #0xc]
    4c08:      	cbnz	w4, 0x4bd0 <.text+0x3bd0>
    4c0c:      	ldr	x14, [x20, #0x1e0]
    4c10:      	mov	w15, #0xc704            // =50948
    4c14:      	add	x24, x14, x15
    4c18:      	mov	x0, x24
    4c1c:      	bl	0xcc88 <.text+0xbc88>
    4c20:      	and	w1, w0, #0x7fffffff
    4c24:      	mov	x0, x24
    4c28:      	bl	0xccc0 <.text+0xbcc0>
    4c2c:      	ldr	w5, [x20, #0x1e0]
    4c30:      	mov	w6, #0xc70c             // =50956
    4c34:      	mov	w3, #0x70000            // =458752
    4c38:      	movk	w3, #0xa120
    4c3c:      	orr	w1, wzr, #0x400000
    4c40:      	add	w0, w5, w6
    4c44:      	orr	w2, wzr, #0x1
    4c48:      	bl	0xa6d4 <.text+0x96d4>
    4c4c:      	tbnz	w0, #0x1f, 0x4c78 <.text+0x3c78>
    4c50:      	sxtw	x19, w22
    4c54:      	b	0x4c94 <.text+0x3c94>
    4c58:      	adrp	x1, 0xe000 <.text+0xd000>
    4c5c:      	adrp	x2, 0xe000 <.text+0xd000>
    4c60:      	add	x1, x1, #0xb63
    4c64:      	add	x2, x2, #0xb4a
    4c68:      	orr	w0, wzr, #0x80000000
    4c6c:      	bl	0xac7c <.text+0x9c7c>
    4c70:      	mov	x19, x22
    4c74:      	b	0x4d28 <.text+0x3d28>
    4c78:      	adrp	x1, 0xe000 <.text+0xd000>
    4c7c:      	adrp	x2, 0xe000 <.text+0xd000>
    4c80:      	add	x1, x1, #0xba1
    4c84:      	add	x2, x2, #0xb4a
    4c88:      	orr	w0, wzr, #0x80000000
    4c8c:      	bl	0xac7c <.text+0x9c7c>
    4c90:      	add	x19, x19, #0x10
    4c94:      	mov	x0, x21
    4c98:      	bl	0x8920 <.text+0x7920>
    4c9c:      	tbz	w0, #0x1f, 0x4cbc <.text+0x3cbc>
    4ca0:      	adrp	x1, 0xe000 <.text+0xd000>
    4ca4:      	adrp	x2, 0xe000 <.text+0xd000>
    4ca8:      	add	x1, x1, #0xbcf
    4cac:      	add	x2, x2, #0xb4a
    4cb0:      	orr	w0, wzr, #0x80000000
    4cb4:      	bl	0xac7c <.text+0x9c7c>
    4cb8:      	mov	x19, #-0x7ffffffffffffff9 // =-9223372036854775801
    4cbc:      	mov	w1, wzr
    4cc0:      	mov	w2, wzr
    4cc4:      	mov	x0, x20
    4cc8:      	bl	0x51e8 <.text+0x41e8>
    4ccc:      	mov	x21, xzr
    4cd0:      	add	x22, x20, #0x638
    4cd4:      	b	0x4ce0 <.text+0x3ce0>
    4cd8:      	add	x21, x21, #0x1
    4cdc:      	mov	x22, x23
    4ce0:      	cmp	x21, #0x10
    4ce4:      	b.eq	0x4d18 <.text+0x3d18>
    4ce8:      	mov	x24, xzr
    4cec:      	add	x23, x22, #0x10
    4cf0:      	b	0x4cfc <.text+0x3cfc>
    4cf4:      	add	x24, x24, #0x1
    4cf8:      	add	x22, x22, #0x8
    4cfc:      	cmp	x24, #0x2
    4d00:      	b.eq	0x4cd8 <.text+0x3cd8>
    4d04:      	ldr	x0, [x22]
    4d08:      	cbz	x0, 0x4cf4 <.text+0x3cf4>
    4d0c:      	bl	0xd1b8 <.text+0xc1b8>
    4d10:      	str	xzr, [x22]
    4d14:      	b	0x4cf4 <.text+0x3cf4>
    4d18:      	strb	wzr, [x20, #0x19c]
    4d1c:      	mov	w1, wzr
    4d20:      	mov	x0, x20
    4d24:      	bl	0x208c <.text+0x108c>
    4d28:      	mov	x0, x19
    4d2c:      	sub	sp, x29, #0x40
    4d30:      	ldp	x29, x30, [sp, #0x40]
    4d34:      	ldp	x20, x19, [sp, #0x30]
    4d38:      	ldp	x22, x21, [sp, #0x20]
    4d3c:      	ldp	x24, x23, [sp, #0x10]
    4d40:      	ldp	x26, x25, [sp], #0x50
    4d44:      	ret
    4d48:      	stp	x28, x27, [sp, #-0x60]!
    4d4c:      	stp	x26, x25, [sp, #0x10]
    4d50:      	stp	x24, x23, [sp, #0x20]
    4d54:      	stp	x22, x21, [sp, #0x30]
    4d58:      	stp	x20, x19, [sp, #0x40]
    4d5c:      	stp	x29, x30, [sp, #0x50]
    4d60:      	add	x29, sp, #0x50
    4d64:      	sub	sp, sp, #0x40
    4d68:      	mov	x19, x0
    4d6c:      	add	x20, x19, #0x1f0
    4d70:      	mov	w2, wzr
    4d74:      	mov	w1, #0xfd               // =253
    4d78:      	add	x3, sp, #0x2c
    4d7c:      	mov	x0, x20
    4d80:      	bl	0xa0f4 <.text+0x90f4>
    4d84:      	mov	w8, w0
    4d88:      	tbnz	w8, #0x1f, 0x4e1c <.text+0x3e1c>
    4d8c:      	ldr	w12, [sp, #0x2c]
    4d90:      	cbz	w12, 0x517c <.text+0x417c>
    4d94:      	mov	w2, wzr
    4d98:      	mov	w1, #0xfd               // =253
    4d9c:      	add	x3, sp, #0x10
    4da0:      	mov	x0, x20
    4da4:      	bl	0xa1e0 <.text+0x91e0>
    4da8:      	mov	w9, w0
    4dac:      	tbnz	w9, #0x1f, 0x4e3c <.text+0x3e3c>
    4db0:      	ldr	w23, [sp, #0x10]
    4db4:      	tbnz	w23, #0x0, 0x4e5c <.text+0x3e5c>
    4db8:      	and	w9, w23, #0x3c0
    4dbc:      	cmp	w9, #0x40
    4dc0:      	b.ne	0x4dd8 <.text+0x3dd8>
    4dc4:      	ldr	w26, [x19, #0xe0c]
    4dc8:      	cbz	w26, 0x4dd8 <.text+0x3dd8>
    4dcc:      	mov	x0, x19
    4dd0:      	bl	0x45ec <.text+0x35ec>
    4dd4:      	tbnz	x0, #0x3f, 0x4f68 <.text+0x3f68>
    4dd8:      	ubfx	w11, w23, #1, #5
    4ddc:      	ubfx	w2, w23, #1, #1
    4de0:      	sub	w11, w11, w2
    4de4:      	ubfx	w23, w11, #1, #8
    4de8:      	cbz	w23, 0x4e84 <.text+0x3e84>
    4dec:      	cbz	x19, 0x4e9c <.text+0x3e9c>
    4df0:      	ldr	w12, [sp, #0x10]
    4df4:      	ubfx	w9, w12, #6, #4
    4df8:      	cmp	w9, #0x6
    4dfc:      	b.eq	0x4f8c <.text+0x3f8c>
    4e00:      	cmp	w9, #0x1
    4e04:      	b.ne	0x517c <.text+0x417c>
    4e08:      	mov	w3, wzr
    4e0c:      	mov	x0, x19
    4e10:      	lsr	w1, w11, #1
    4e14:      	bl	0x57b8 <.text+0x47b8>
    4e18:      	b	0x517c <.text+0x417c>
    4e1c:      	adrp	x1, 0xe000 <.text+0xd000>
    4e20:      	adrp	x2, 0xe000 <.text+0xd000>
    4e24:      	add	x1, x1, #0xbf4
    4e28:      	add	x2, x2, #0xc1b
    4e2c:      	orr	w0, wzr, #0x80000000
    4e30:      	mov	w3, w8
    4e34:      	bl	0xac7c <.text+0x9c7c>
    4e38:      	b	0x517c <.text+0x417c>
    4e3c:      	adrp	x1, 0xe000 <.text+0xd000>
    4e40:      	adrp	x2, 0xe000 <.text+0xd000>
    4e44:      	add	x1, x1, #0xc30
    4e48:      	add	x2, x2, #0xc1b
    4e4c:      	orr	w0, wzr, #0x80000000
    4e50:      	mov	w3, w9
    4e54:      	bl	0xac7c <.text+0x9c7c>
    4e58:      	b	0x517c <.text+0x417c>
    4e5c:      	ubfx	w8, w23, #8, #4
    4e60:      	cmp	w8, #0xb
    4e64:      	b.hi	0x517c <.text+0x417c>
    4e68:      	adrp	x9, 0xe000 <.text+0xd000>
    4e6c:      	add	x9, x9, #0x5c8
    4e70:      	ldr	x8, [x9, x8, lsl #3]
    4e74:      	br	x8
    4e78:      	orr	w1, wzr, #0x1
    4e7c:      	strb	w1, [x19, #0x19d]
    4e80:      	b	0x517c <.text+0x417c>
    4e84:      	add	x0, sp, #0x10
    4e88:      	bl	0x6a90 <.text+0x5a90>
    4e8c:      	tbz	x0, #0x3f, 0x517c <.text+0x417c>
    4e90:      	adrp	x1, 0xf000 <.text+0xe000>
    4e94:      	add	x1, x1, #0x13f
    4e98:      	b	0x4f70 <.text+0x3f70>
    4e9c:      	adrp	x1, 0xf000 <.text+0xe000>
    4ea0:      	adrp	x2, 0xf000 <.text+0xe000>
    4ea4:      	add	x1, x1, #0xce7
    4ea8:      	add	x2, x2, #0x193
    4eac:      	orr	w0, wzr, #0x80000000
    4eb0:      	bl	0xac7c <.text+0x9c7c>
    4eb4:      	adrp	x1, 0xf000 <.text+0xe000>
    4eb8:      	add	x1, x1, #0x167
    4ebc:      	b	0x4f70 <.text+0x3f70>
    4ec0:      	add	x1, sp, #0x10
    4ec4:      	mov	x0, x19
    4ec8:      	bl	0x480c <.text+0x380c>
    4ecc:      	mov	x21, x0
    4ed0:      	b	0x5160 <.text+0x4160>
    4ed4:      	ldrb	w14, [x19, #0x19c]
    4ed8:      	cbnz	w14, 0x4ee0 <.text+0x3ee0>
    4edc:      	strb	wzr, [x19, #0x19d]
    4ee0:      	ldr	x9, [x19, #0x1e0]
    4ee4:      	mov	w10, #0xc70c            // =50956
    4ee8:      	add	x0, x9, x10
    4eec:      	bl	0xcc88 <.text+0xbc88>
    4ef0:      	and	w8, w0, #0x7
    4ef4:      	cbz	w8, 0x4fa0 <.text+0x3fa0>
    4ef8:      	cmp	w8, #0x2
    4efc:      	b.eq	0x4fac <.text+0x3fac>
    4f00:      	cmp	w8, #0x4
    4f04:      	b.ne	0x4fb8 <.text+0x3fb8>
    4f08:      	orr	w17, wzr, #0x4
    4f0c:      	str	w17, [x19, #0x184]
    4f10:      	b	0x4fcc <.text+0x3fcc>
    4f14:      	mov	w1, wzr
    4f18:      	b	0x4f20 <.text+0x3f20>
    4f1c:      	orr	w1, wzr, #0x1
    4f20:      	mov	x0, x19
    4f24:      	bl	0x6464 <.text+0x5464>
    4f28:      	b	0x517c <.text+0x417c>
    4f2c:      	adrp	x1, 0xf000 <.text+0xe000>
    4f30:      	adrp	x2, 0xe000 <.text+0xd000>
    4f34:      	mov	w21, #0x555             // =1365
    4f38:      	add	x1, x1, #0xae
    4f3c:      	add	x2, x2, #0xcb8
    4f40:      	orr	w0, wzr, #0x80000000
    4f44:      	mov	w3, w21
    4f48:      	bl	0xac7c <.text+0x9c7c>
    4f4c:      	adrp	x0, 0xe000 <.text+0xd000>
    4f50:      	adrp	x2, 0x11000 <.text+0x10000>
    4f54:      	add	x0, x0, #0xd24
    4f58:      	add	x2, x2, #0xe70
    4f5c:      	mov	x1, x21
    4f60:      	bl	0xb008 <.text+0xa008>
    4f64:      	b	0x4f64 <.text+0x3f64>
    4f68:      	adrp	x1, 0xf000 <.text+0xe000>
    4f6c:      	add	x1, x1, #0x105
    4f70:      	adrp	x2, 0xf000 <.text+0xe000>
    4f74:      	add	x2, x2, #0x129
    4f78:      	orr	w0, wzr, #0x80000000
    4f7c:      	bl	0xac7c <.text+0x9c7c>
    4f80:      	adrp	x1, 0xe000 <.text+0xd000>
    4f84:      	add	x1, x1, #0xc7a
    4f88:      	b	0x516c <.text+0x416c>
    4f8c:      	adrp	x1, 0xf000 <.text+0xe000>
    4f90:      	adrp	x2, 0xf000 <.text+0xe000>
    4f94:      	add	x1, x1, #0x1b1
    4f98:      	add	x2, x2, #0x193
    4f9c:      	b	0x5174 <.text+0x4174>
    4fa0:      	orr	w3, wzr, #0x3
    4fa4:      	str	w3, [x19, #0x184]
    4fa8:      	b	0x4fcc <.text+0x3fcc>
    4fac:      	orr	w4, wzr, #0x1
    4fb0:      	str	w4, [x19, #0x184]
    4fb4:      	b	0x4fcc <.text+0x3fcc>
    4fb8:      	orr	w8, w8, #0x2
    4fbc:      	cmp	w8, #0x3
    4fc0:      	b.ne	0x519c <.text+0x419c>
    4fc4:      	orr	w6, wzr, #0x2
    4fc8:      	str	w6, [x19, #0x184]
    4fcc:      	ldr	x11, [x19, #0x1e0]
    4fd0:      	mov	w12, #0xc110            // =49424
    4fd4:      	add	x22, x11, x12
    4fd8:      	mov	x0, x22
    4fdc:      	bl	0xcc88 <.text+0xbc88>
    4fe0:      	and	w1, w0, #0xffffff3f
    4fe4:      	mov	x0, x22
    4fe8:      	bl	0xccc0 <.text+0xbcc0>
    4fec:      	mov	x22, #0x3c01000000000000 // =4323737117252386816
    4ff0:      	movk	x22, #0xc001, lsl #32
    4ff4:      	movk	x22, #0xc1ff, lsl #16
    4ff8:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    4ffc:      	adrp	x28, 0xd000 <.text+0xc000>
    5000:      	mov	x0, xzr
    5004:      	mov	x21, xzr
    5008:      	add	x11, x19, #0x9cc
    500c:      	mov	w12, #0xc80c            // =51212
    5010:      	movk	x22, #0xfae0
    5014:      	movk	x23, #0x500
    5018:      	str	x11, [sp]
    501c:      	add	x28, x28, #0xcb8
    5020:      	b	0x5030 <.text+0x4030>
    5024:      	ldr	x11, [sp]
    5028:      	orr	w0, wzr, #0x1
    502c:      	mov	w12, #0xc80c            // =51212
    5030:      	cbnz	x0, 0x51d8 <.text+0x41d8>
    5034:      	lsl	w7, w0, #5
    5038:      	str	x0, [sp, #0x8]
    503c:      	mov	x24, xzr
    5040:      	add	x27, x12, w7, uxtw
    5044:      	mov	x25, x11
    5048:      	lsl	w26, w0, #1
    504c:      	cmp	x24, #0x1
    5050:      	b.hi	0x5024 <.text+0x4024>
    5054:      	add	x0, sp, #0x30
    5058:      	orr	w1, wzr, #0x10
    505c:      	bl	0xb1bc <.text+0xa1bc>
    5060:      	add	x13, sp, #0x30
    5064:      	ldr	w16, [x19, #0x184]
    5068:      	orr	x8, x13, #0x4
    506c:      	ldr	w14, [sp, #0x34]
    5070:      	orr	w2, w24, w26
    5074:      	ldr	w9, [sp, #0x3c]
    5078:      	lsl	w17, w2, #25
    507c:      	ldrb	w6, [x19, #0x614]
    5080:      	ldr	w15, [x8, #0x4]
    5084:      	and	x10, x17, #0x3e000000
    5088:      	ldr	x3, [x28, x16, lsl #3]
    508c:      	mov	w16, #0x401             // =1025
    5090:      	orr	w2, wzr, #0x10
    5094:      	bfi	x14, x15, #32, #32
    5098:      	and	x4, x14, x22
    509c:      	orr	x5, x10, x4
    50a0:      	mov	w15, #-0x410            // =-1040
    50a4:      	and	w10, w9, w15
    50a8:      	bfi	x5, x3, #35, #11
    50ac:      	orr	w0, w10, w16
    50b0:      	bfxil	x5, x6, #0, #5
    50b4:      	orr	x7, x5, x23
    50b8:      	lsr	x1, x7, #32
    50bc:      	str	w0, [sp, #0x3c]
    50c0:      	mov	x0, x25
    50c4:      	str	w1, [x8, #0x4]
    50c8:      	add	x1, sp, #0x30
    50cc:      	str	w7, [sp, #0x34]
    50d0:      	bl	0xb25c <.text+0xa25c>
    50d4:      	mov	w1, wzr
    50d8:      	add	x3, sp, #0x30
    50dc:      	mov	x0, x20
    50e0:      	mov	w2, w24
    50e4:      	bl	0x8fcc <.text+0x7fcc>
    50e8:      	mov	w10, w0
    50ec:      	tbnz	w10, #0x1f, 0x5144 <.text+0x4144>
    50f0:      	ldr	w8, [x19, #0x1e0]
    50f4:      	mov	w3, #0x70000            // =458752
    50f8:      	orr	w1, wzr, #0x400
    50fc:      	mov	w2, wzr
    5100:      	movk	w3, #0xa120
    5104:      	add	w0, w27, w8
    5108:      	bl	0xa6d4 <.text+0x96d4>
    510c:      	add	x24, x24, #0x1
    5110:      	add	x25, x25, #0x10
    5114:      	add	x27, x27, #0x10
    5118:      	sxtw	x21, w0
    511c:      	tbz	w0, #0x1f, 0x504c <.text+0x404c>
    5120:      	adrp	x1, 0xf000 <.text+0xe000>
    5124:      	ldr	x3, [sp, #0x8]
    5128:      	adrp	x2, 0xf000 <.text+0xe000>
    512c:      	sub	w4, w24, #0x1
    5130:      	add	x1, x1, #0xdd
    5134:      	add	x2, x2, #0xc3
    5138:      	orr	w0, wzr, #0x80000000
    513c:      	bl	0xac7c <.text+0x9c7c>
    5140:      	b	0x5160 <.text+0x4160>
    5144:      	adrp	x1, 0xe000 <.text+0xd000>
    5148:      	adrp	x2, 0xf000 <.text+0xe000>
    514c:      	add	x1, x1, #0x826
    5150:      	add	x2, x2, #0xc3
    5154:      	orr	w0, wzr, #0x80000000
    5158:      	mov	w3, w10
    515c:      	bl	0xac7c <.text+0x9c7c>
    5160:      	tbz	x21, #0x3f, 0x517c <.text+0x417c>
    5164:      	adrp	x1, 0xe000 <.text+0xd000>
    5168:      	add	x1, x1, #0xc56
    516c:      	adrp	x2, 0xe000 <.text+0xd000>
    5170:      	add	x2, x2, #0xc1b
    5174:      	orr	w0, wzr, #0x80000000
    5178:      	bl	0xac7c <.text+0x9c7c>
    517c:      	sub	sp, x29, #0x50
    5180:      	ldp	x29, x30, [sp, #0x50]
    5184:      	ldp	x20, x19, [sp, #0x40]
    5188:      	ldp	x22, x21, [sp, #0x30]
    518c:      	ldp	x24, x23, [sp, #0x20]
    5190:      	ldp	x26, x25, [sp, #0x10]
    5194:      	ldp	x28, x27, [sp], #0x60
    5198:      	ret
    519c:      	adrp	x1, 0xf000 <.text+0xe000>
    51a0:      	adrp	x2, 0xe000 <.text+0xd000>
    51a4:      	mov	w21, #0x3e9             // =1001
    51a8:      	add	x1, x1, #0xae
    51ac:      	add	x2, x2, #0xcb8
    51b0:      	orr	w0, wzr, #0x80000000
    51b4:      	mov	w3, w21
    51b8:      	bl	0xac7c <.text+0x9c7c>
    51bc:      	adrp	x0, 0xe000 <.text+0xd000>
    51c0:      	adrp	x2, 0x11000 <.text+0x10000>
    51c4:      	add	x0, x0, #0xd24
    51c8:      	add	x2, x2, #0xe70
    51cc:      	mov	x1, x21
    51d0:      	bl	0xb008 <.text+0xa008>
    51d4:      	b	0x51d4 <.text+0x41d4>
    51d8:      	ldr	w1, [x19, #0x184]
    51dc:      	mov	x0, x19
    51e0:      	bl	0x2240 <.text+0x1240>
    51e4:      	b	0x5160 <.text+0x4160>
    51e8:      	stp	x26, x25, [sp, #-0x50]!
    51ec:      	stp	x24, x23, [sp, #0x10]
    51f0:      	stp	x22, x21, [sp, #0x20]
    51f4:      	stp	x20, x19, [sp, #0x30]
    51f8:      	stp	x29, x30, [sp, #0x40]
    51fc:      	add	x29, sp, #0x40
    5200:      	mov	w19, w2
    5204:      	mov	w20, w1
    5208:      	mov	x21, x0
    520c:      	cbz	x21, 0x52f0 <.text+0x42f0>
    5210:      	and	w25, w20, #0xff
    5214:      	cbnz	w25, 0x5228 <.text+0x4228>
    5218:      	ldrb	w8, [x21, #0x181]
    521c:      	cbz	w8, 0x5228 <.text+0x4228>
    5220:      	bl	0x6c30 <.text+0x5c30>
    5224:      	cbz	w0, 0x534c <.text+0x434c>
    5228:      	and	w8, w19, #0xff
    522c:      	add	x9, x21, x25, lsl #5
    5230:      	add	x8, x9, w8, uxtw #4
    5234:      	add	x0, x8, #0x7b8
    5238:      	bl	0xb94c <.text+0xa94c>
    523c:      	and	w9, w0, #0xff
    5240:      	cbnz	w9, 0x534c <.text+0x434c>
    5244:      	ldrb	w9, [x21, #0x181]
    5248:      	cbz	w9, 0x52fc <.text+0x42fc>
    524c:      	add	x0, x21, #0x1f0
    5250:      	mov	w1, w20
    5254:      	mov	w2, w19
    5258:      	bl	0x9e5c <.text+0x8e5c>
    525c:      	tbnz	w0, #0x1f, 0x5314 <.text+0x4314>
    5260:      	and	w22, w20, #0xff
    5264:      	ldr	w12, [x21, #0x1e0]
    5268:      	lsl	w10, w22, #1
    526c:      	add	w11, w10, w19, uxtb
    5270:      	lsl	w13, w11, #4
    5274:      	mov	w8, #0xc80c             // =51212
    5278:      	add	x25, x8, w13, uxtw
    527c:      	mov	w3, #0x70000            // =458752
    5280:      	add	w0, w25, w12
    5284:      	movk	w3, #0xa120
    5288:      	orr	w1, wzr, #0x400
    528c:      	mov	w2, wzr
    5290:      	and	w23, w19, #0xff
    5294:      	bl	0xa6d4 <.text+0x96d4>
    5298:      	mov	w24, w0
    529c:      	tbnz	w24, #0x1f, 0x532c <.text+0x432c>
    52a0:      	ldr	x8, [x21, #0x1e0]
    52a4:      	add	x0, x25, x8
    52a8:      	bl	0xcc88 <.text+0xbc88>
    52ac:      	and	w12, w0, #0xf000
    52b0:      	cbz	w12, 0x52d4 <.text+0x42d4>
    52b4:      	adrp	x1, 0xf000 <.text+0xe000>
    52b8:      	adrp	x2, 0xf000 <.text+0xe000>
    52bc:      	add	x1, x1, #0x4b
    52c0:      	add	x2, x2, #0x34
    52c4:      	orr	w0, wzr, #0x80000000
    52c8:      	mov	w3, w22
    52cc:      	mov	w4, w23
    52d0:      	bl	0xac7c <.text+0x9c7c>
    52d4:      	orr	w3, wzr, #0x1
    52d8:      	mov	x0, x21
    52dc:      	mov	w1, w20
    52e0:      	mov	w2, w19
    52e4:      	bl	0x57b8 <.text+0x47b8>
    52e8:      	cbnz	w24, 0x5324 <.text+0x4324>
    52ec:      	b	0x534c <.text+0x434c>
    52f0:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    52f4:      	movk	x0, #0x2
    52f8:      	b	0x5350 <.text+0x4350>
    52fc:      	orr	w3, wzr, #0x1
    5300:      	mov	x0, x21
    5304:      	mov	w1, w20
    5308:      	mov	w2, w19
    530c:      	bl	0x57b8 <.text+0x47b8>
    5310:      	b	0x534c <.text+0x434c>
    5314:      	mov	w10, #-0x80000000       // =-2147483648
    5318:      	movk	w10, #0xe
    531c:      	cmp	w0, w10
    5320:      	b.eq	0x534c <.text+0x434c>
    5324:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    5328:      	b	0x5350 <.text+0x4350>
    532c:      	adrp	x1, 0xe000 <.text+0xd000>
    5330:      	adrp	x2, 0xf000 <.text+0xe000>
    5334:      	add	x1, x1, #0xffd
    5338:      	add	x2, x2, #0x34
    533c:      	orr	w0, wzr, #0x80000000
    5340:      	mov	w3, w22
    5344:      	mov	w4, w23
    5348:      	bl	0xac7c <.text+0x9c7c>
    534c:      	mov	x0, xzr
    5350:      	ldp	x29, x30, [sp, #0x40]
    5354:      	ldp	x20, x19, [sp, #0x30]
    5358:      	ldp	x22, x21, [sp, #0x20]
    535c:      	ldp	x24, x23, [sp, #0x10]
    5360:      	ldp	x26, x25, [sp], #0x50
    5364:      	ret
    5368:      	stp	x22, x21, [sp, #-0x30]!
    536c:      	stp	x20, x19, [sp, #0x10]
    5370:      	stp	x29, x30, [sp, #0x20]
    5374:      	add	x29, sp, #0x20
    5378:      	mov	x20, x0
    537c:      	add	x21, x20, #0x9b8
    5380:      	mov	x0, x21
    5384:      	mov	x19, x1
    5388:      	bl	0xb94c <.text+0xa94c>
    538c:      	and	w8, w0, #0xff
    5390:      	cbz	w8, 0x539c <.text+0x439c>
    5394:      	str	xzr, [x19]
    5398:      	b	0x53c0 <.text+0x43c0>
    539c:      	mov	x0, x21
    53a0:      	bl	0xb8fc <.text+0xa8fc>
    53a4:      	str	x0, [x19]
    53a8:      	bl	0xb9a4 <.text+0xa9a4>
    53ac:      	ldr	w9, [x20, #0x9c8]
    53b0:      	sub	w10, w9, #0x1
    53b4:      	str	w10, [x20, #0x9c8]
    53b8:      	ldr	x8, [x19]
    53bc:      	cbz	x8, 0x53d0 <.text+0x43d0>
    53c0:      	ldp	x29, x30, [sp, #0x20]
    53c4:      	ldp	x20, x19, [sp, #0x10]
    53c8:      	ldp	x22, x21, [sp], #0x30
    53cc:      	ret
    53d0:      	adrp	x1, 0xe000 <.text+0xd000>
    53d4:      	adrp	x2, 0xe000 <.text+0xd000>
    53d8:      	mov	w19, #0x61e             // =1566
    53dc:      	add	x1, x1, #0xca0
    53e0:      	add	x2, x2, #0xcb8
    53e4:      	orr	w0, wzr, #0x80000000
    53e8:      	mov	w3, w19
    53ec:      	bl	0xac7c <.text+0x9c7c>
    53f0:      	adrp	x0, 0xe000 <.text+0xd000>
    53f4:      	adrp	x2, 0x11000 <.text+0x10000>
    53f8:      	add	x0, x0, #0xd24
    53fc:      	add	x2, x2, #0xe70
    5400:      	mov	x1, x19
    5404:      	bl	0xb008 <.text+0xa008>
    5408:      	b	0x5408 <.text+0x4408>
    540c:      	stp	x20, x19, [sp, #-0x20]!
    5410:      	stp	x29, x30, [sp, #0x10]
    5414:      	add	x29, sp, #0x10
    5418:      	and	w8, w1, #0xff
    541c:      	and	w9, w2, #0xff
    5420:      	add	x10, x0, x8, lsl #5
    5424:      	add	x8, x10, w9, uxtw #4
    5428:      	add	x20, x8, #0x7b8
    542c:      	mov	x0, x20
    5430:      	mov	x19, x3
    5434:      	bl	0xb94c <.text+0xa94c>
    5438:      	and	w8, w0, #0xff
    543c:      	cbz	w8, 0x5450 <.text+0x4450>
    5440:      	str	xzr, [x19]
    5444:      	ldp	x29, x30, [sp, #0x10]
    5448:      	ldp	x20, x19, [sp], #0x20
    544c:      	ret
    5450:      	mov	x0, x20
    5454:      	bl	0xb8fc <.text+0xa8fc>
    5458:      	str	x0, [x19]
    545c:      	ldp	x29, x30, [sp, #0x10]
    5460:      	ldp	x20, x19, [sp], #0x20
    5464:      	b	0xb9a4 <.text+0xa9a4>
    5468:      	stp	x24, x23, [sp, #-0x40]!
    546c:      	stp	x22, x21, [sp, #0x10]
    5470:      	stp	x20, x19, [sp, #0x20]
    5474:      	stp	x29, x30, [sp, #0x30]
    5478:      	add	x29, sp, #0x30
    547c:      	sub	sp, sp, #0x10
    5480:      	mov	w24, w3
    5484:      	mov	w20, w2
    5488:      	mov	w22, w1
    548c:      	mov	x19, x0
    5490:      	cbz	x19, 0x558c <.text+0x458c>
    5494:      	and	w23, w22, #0xff
    5498:      	cbz	w23, 0x5598 <.text+0x4598>
    549c:      	add	x21, x19, #0x1f0
    54a0:      	str	wzr, [sp, #0xc]
    54a4:      	add	x3, sp, #0xc
    54a8:      	mov	x0, x21
    54ac:      	mov	w1, w22
    54b0:      	mov	w2, w20
    54b4:      	bl	0x921c <.text+0x821c>
    54b8:      	mov	w8, w0
    54bc:      	tbz	w8, #0x1f, 0x54e4 <.text+0x44e4>
    54c0:      	adrp	x1, 0xe000 <.text+0xd000>
    54c4:      	adrp	x2, 0xe000 <.text+0xd000>
    54c8:      	add	x1, x1, #0xd34
    54cc:      	add	x2, x2, #0xd73
    54d0:      	orr	w0, wzr, #0x80000000
    54d4:      	mov	w3, w23
    54d8:      	mov	w4, w20
    54dc:      	mov	w5, w8
    54e0:      	bl	0xac7c <.text+0x9c7c>
    54e4:      	mov	x0, x21
    54e8:      	mov	w1, w22
    54ec:      	mov	w2, w20
    54f0:      	mov	w3, w24
    54f4:      	bl	0x8d24 <.text+0x7d24>
    54f8:      	mov	w9, w0
    54fc:      	tbnz	w9, #0x1f, 0x55b0 <.text+0x45b0>
    5500:      	ldr	w10, [x19, #0x1e0]
    5504:      	add	w11, w20, w23, lsl #1
    5508:      	mov	w13, #0xc80c            // =51212
    550c:      	mov	w3, #0x70000            // =458752
    5510:      	movk	w3, #0xa120
    5514:      	add	w12, w10, w11, lsl #4
    5518:      	add	w0, w12, w13
    551c:      	orr	w1, wzr, #0x400
    5520:      	mov	w2, wzr
    5524:      	bl	0xa6d4 <.text+0x96d4>
    5528:      	sxtw	x21, w0
    552c:      	tbnz	w0, #0x1f, 0x55d4 <.text+0x45d4>
    5530:      	and	w8, w24, #0xff
    5534:      	cbnz	w8, 0x5610 <.text+0x4610>
    5538:      	ldr	w9, [sp, #0xc]
    553c:      	cmp	w9, #0x2
    5540:      	b.ne	0x5610 <.text+0x4610>
    5544:      	mov	x3, sp
    5548:      	str	xzr, [sp]
    554c:      	mov	x0, x19
    5550:      	mov	w1, w22
    5554:      	mov	w2, w20
    5558:      	bl	0x540c <.text+0x440c>
    555c:      	ldr	x3, [sp]
    5560:      	cbz	x3, 0x55f8 <.text+0x45f8>
    5564:      	ldr	w1, [x3, #0x10]
    5568:      	mov	x0, x19
    556c:      	ubfx	w2, w1, #8, #8
    5570:      	ubfx	w4, w1, #16, #8
    5574:      	bl	0x562c <.text+0x462c>
    5578:      	mov	x21, x0
    557c:      	tbz	x21, #0x3f, 0x5610 <.text+0x4610>
    5580:      	adrp	x1, 0xe000 <.text+0xd000>
    5584:      	add	x1, x1, #0xde2
    5588:      	b	0x5600 <.text+0x4600>
    558c:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    5590:      	movk	x21, #0x2
    5594:      	b	0x5610 <.text+0x4610>
    5598:      	sub	sp, x29, #0x30
    559c:      	ldp	x29, x30, [sp, #0x30]
    55a0:      	ldp	x20, x19, [sp, #0x20]
    55a4:      	ldp	x22, x21, [sp, #0x10]
    55a8:      	ldp	x24, x23, [sp], #0x40
    55ac:      	b	0x6c24 <.text+0x5c24>
    55b0:      	adrp	x1, 0xe000 <.text+0xd000>
    55b4:      	adrp	x2, 0xe000 <.text+0xd000>
    55b8:      	add	x1, x1, #0xd91
    55bc:      	add	x2, x2, #0xd73
    55c0:      	orr	w0, wzr, #0x80000000
    55c4:      	mov	w3, w9
    55c8:      	bl	0xac7c <.text+0x9c7c>
    55cc:      	mov	x21, #-0x7ffffffffffffff9 // =-9223372036854775801
    55d0:      	b	0x5610 <.text+0x4610>
    55d4:      	adrp	x1, 0xe000 <.text+0xd000>
    55d8:      	adrp	x2, 0xe000 <.text+0xd000>
    55dc:      	add	x1, x1, #0xdb8
    55e0:      	add	x2, x2, #0xd73
    55e4:      	orr	w0, wzr, #0x80000000
    55e8:      	mov	w3, w23
    55ec:      	mov	w4, w20
    55f0:      	bl	0xac7c <.text+0x9c7c>
    55f4:      	b	0x5610 <.text+0x4610>
    55f8:      	adrp	x1, 0xe000 <.text+0xd000>
    55fc:      	add	x1, x1, #0xe01
    5600:      	adrp	x2, 0xe000 <.text+0xd000>
    5604:      	add	x2, x2, #0xd73
    5608:      	orr	w0, wzr, #0x80000000
    560c:      	bl	0xac7c <.text+0x9c7c>
    5610:      	mov	x0, x21
    5614:      	sub	sp, x29, #0x30
    5618:      	ldp	x29, x30, [sp, #0x30]
    561c:      	ldp	x20, x19, [sp, #0x20]
    5620:      	ldp	x22, x21, [sp, #0x10]
    5624:      	ldp	x24, x23, [sp], #0x40
    5628:      	ret
    562c:      	stp	x24, x23, [sp, #-0x40]!
    5630:      	stp	x22, x21, [sp, #0x10]
    5634:      	stp	x20, x19, [sp, #0x20]
    5638:      	stp	x29, x30, [sp, #0x30]
    563c:      	add	x29, sp, #0x30
    5640:      	mov	x19, x3
    5644:      	mov	w20, w2
    5648:      	mov	w22, w1
    564c:      	mov	x21, x0
    5650:      	cbz	x21, 0x56ac <.text+0x46ac>
    5654:      	cbz	x19, 0x56ac <.text+0x46ac>
    5658:      	ldr	x8, [x19, #0x450]
    565c:      	add	x23, x21, #0x1f0
    5660:      	ldr	x9, [x8, #0x18]
    5664:      	add	w8, w20, w22, lsl #1
    5668:      	cbz	x9, 0x56d0 <.text+0x46d0>
    566c:      	and	w9, w20, #0xff
    5670:      	cmp	w9, #0x1
    5674:      	b.ne	0x56a4 <.text+0x46a4>
    5678:      	and	w9, w22, #0xff
    567c:      	add	x9, x21, w9, uxtw #1
    5680:      	ldrb	w12, [x9, #0xd2]
    5684:      	cbz	w12, 0x56a4 <.text+0x46a4>
    5688:      	and	x9, x8, #0xff
    568c:      	ldr	w14, [x19, #0x448]
    5690:      	add	x10, x21, x9, lsl #5
    5694:      	ldr	w13, [x10, #0x220]
    5698:      	udiv	w15, w14, w13
    569c:      	msub	w16, w15, w13, w14
    56a0:      	cbz	w16, 0x56d0 <.text+0x46d0>
    56a4:      	mov	w7, wzr
    56a8:      	b	0x56d4 <.text+0x46d4>
    56ac:      	adrp	x1, 0xf000 <.text+0xe000>
    56b0:      	adrp	x2, 0xf000 <.text+0xe000>
    56b4:      	add	x1, x1, #0xce7
    56b8:      	add	x2, x2, #0x1e7
    56bc:      	orr	w0, wzr, #0x80000000
    56c0:      	bl	0xac7c <.text+0x9c7c>
    56c4:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    56c8:      	movk	x0, #0x2
    56cc:      	b	0x57a4 <.text+0x47a4>
    56d0:      	orr	w7, wzr, #0x1
    56d4:      	ldr	w6, [x19, #0x448]
    56d8:      	add	x24, x19, #0x10
    56dc:      	mov	w5, wzr
    56e0:      	mov	x0, x23
    56e4:      	mov	x1, x24
    56e8:      	mov	w2, w22
    56ec:      	mov	w3, w20
    56f0:      	bl	0x928c <.text+0x828c>
    56f4:      	mov	w8, w0
    56f8:      	tbnz	w8, #0x1f, 0x574c <.text+0x474c>
    56fc:      	ldr	x2, [x19, #0x450]
    5700:      	mov	x0, x23
    5704:      	mov	x1, x24
    5708:      	bl	0x93c8 <.text+0x83c8>
    570c:      	mov	w9, w0
    5710:      	tbnz	w9, #0x1f, 0x5768 <.text+0x4768>
    5714:      	mov	x0, x23
    5718:      	mov	x1, x24
    571c:      	bl	0x9af8 <.text+0x8af8>
    5720:      	mov	w10, w0
    5724:      	tbnz	w10, #0x1f, 0x5784 <.text+0x4784>
    5728:      	and	w11, w22, #0xff
    572c:      	and	w8, w20, #0xff
    5730:      	add	x12, x21, x11, lsl #5
    5734:      	add	x8, x12, w8, uxtw #4
    5738:      	add	x0, x8, #0x7b8
    573c:      	mov	x1, x19
    5740:      	bl	0xb898 <.text+0xa898>
    5744:      	mov	x0, xzr
    5748:      	b	0x57a4 <.text+0x47a4>
    574c:      	adrp	x1, 0xf000 <.text+0xe000>
    5750:      	adrp	x2, 0xf000 <.text+0xe000>
    5754:      	add	x1, x1, #0x1fd
    5758:      	add	x2, x2, #0x1e7
    575c:      	orr	w0, wzr, #0x80000000
    5760:      	mov	w3, w8
    5764:      	b	0x579c <.text+0x479c>
    5768:      	adrp	x1, 0xf000 <.text+0xe000>
    576c:      	adrp	x2, 0xf000 <.text+0xe000>
    5770:      	add	x1, x1, #0x21c
    5774:      	add	x2, x2, #0x1e7
    5778:      	orr	w0, wzr, #0x80000000
    577c:      	mov	w3, w9
    5780:      	b	0x579c <.text+0x479c>
    5784:      	adrp	x1, 0xf000 <.text+0xe000>
    5788:      	adrp	x2, 0xf000 <.text+0xe000>
    578c:      	add	x1, x1, #0x23a
    5790:      	add	x2, x2, #0x1e7
    5794:      	orr	w0, wzr, #0x80000000
    5798:      	mov	w3, w10
    579c:      	bl	0xac7c <.text+0x9c7c>
    57a0:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    57a4:      	ldp	x29, x30, [sp, #0x30]
    57a8:      	ldp	x20, x19, [sp, #0x20]
    57ac:      	ldp	x22, x21, [sp, #0x10]
    57b0:      	ldp	x24, x23, [sp], #0x40
    57b4:      	ret
    57b8:      	stp	x24, x23, [sp, #-0x40]!
    57bc:      	stp	x22, x21, [sp, #0x10]
    57c0:      	stp	x20, x19, [sp, #0x20]
    57c4:      	stp	x29, x30, [sp, #0x30]
    57c8:      	add	x29, sp, #0x30
    57cc:      	sub	sp, sp, #0x10
    57d0:      	mov	w22, w3
    57d4:      	str	xzr, [sp, #0x8]
    57d8:      	add	x3, sp, #0x8
    57dc:      	mov	w24, w2
    57e0:      	mov	w21, w1
    57e4:      	mov	x19, x0
    57e8:      	bl	0x540c <.text+0x440c>
    57ec:      	ldr	x20, [sp, #0x8]
    57f0:      	cbz	x20, 0x5828 <.text+0x4828>
    57f4:      	ldrb	w8, [x19, #0x19e]
    57f8:      	cbz	w8, 0x5874 <.text+0x4874>
    57fc:      	strb	wzr, [x19, #0x19e]
    5800:      	ldr	w3, [x20, #0x20]
    5804:      	cmp	w3, #0x6
    5808:      	b.ne	0x5854 <.text+0x4854>
    580c:      	ldr	x10, [x20, #0x38]
    5810:      	add	x0, x19, #0x19f
    5814:      	orr	w2, wzr, #0x6
    5818:      	ldp	w1, w9, [x10]
    581c:      	bfi	x1, x9, #32, #32
    5820:      	bl	0xb25c <.text+0xa25c>
    5824:      	b	0x586c <.text+0x486c>
    5828:      	adrp	x1, 0xe000 <.text+0xd000>
    582c:      	adrp	x2, 0xe000 <.text+0xd000>
    5830:      	and	w3, w21, #0xff
    5834:      	and	w4, w24, #0xff
    5838:      	add	x1, x1, #0xe3d
    583c:      	add	x2, x2, #0xe84
    5840:      	orr	w0, wzr, #0x80000000
    5844:      	bl	0xac7c <.text+0x9c7c>
    5848:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    584c:      	movk	x0, #0xe
    5850:      	b	0x5a70 <.text+0x4a70>
    5854:      	adrp	x1, 0xe000 <.text+0xd000>
    5858:      	adrp	x2, 0xe000 <.text+0xd000>
    585c:      	add	x1, x1, #0xe9a
    5860:      	add	x2, x2, #0xe84
    5864:      	orr	w0, wzr, #0x80000000
    5868:      	bl	0xac7c <.text+0x9c7c>
    586c:      	mov	x0, x19
    5870:      	bl	0x4690 <.text+0x3690>
    5874:      	ldrh	w8, [x19, #0xdf0]
    5878:      	and	w9, w24, #0xff
    587c:      	cbnz	w9, 0x5890 <.text+0x4890>
    5880:      	and	w10, w8, #0xff
    5884:      	cbz	w10, 0x5890 <.text+0x4890>
    5888:      	strb	wzr, [x19, #0xdf0]
    588c:      	b	0x5a48 <.text+0x4a48>
    5890:      	cmp	w9, #0x1
    5894:      	b.ne	0x58a8 <.text+0x48a8>
    5898:      	cmp	w8, #0x100
    589c:      	b.lo	0x58a8 <.text+0x48a8>
    58a0:      	strb	wzr, [x19, #0xdf1]
    58a4:      	b	0x5a48 <.text+0x4a48>
    58a8:      	and	w11, w22, #0xff
    58ac:      	cbz	w11, 0x58cc <.text+0x48cc>
    58b0:      	ldr	x8, [x20, #0x38]
    58b4:      	cbz	x8, 0x58cc <.text+0x48cc>
    58b8:      	ldp	w10, w11, [x8]
    58bc:      	ldr	x12, [x19, #0xdd0]
    58c0:      	bfi	x10, x11, #32, #32
    58c4:      	cmp	x10, x12
    58c8:      	b.eq	0x5a48 <.text+0x4a48>
    58cc:      	add	x0, x19, #0x1c8
    58d0:      	bl	0xb8fc <.text+0xa8fc>
    58d4:      	mov	x23, x0
    58d8:      	cbz	x23, 0x591c <.text+0x491c>
    58dc:      	mov	x0, x23
    58e0:      	bl	0xb9a4 <.text+0xa9a4>
    58e4:      	tst	w24, #0xff
    58e8:      	orr	w13, wzr, #0x2
    58ec:      	cinc	w14, w13, ne
    58f0:      	str	w14, [x23, #0x10]
    58f4:      	ldrb	w15, [x19, #0xdd9]
    58f8:      	cbz	w15, 0x5958 <.text+0x4958>
    58fc:      	ldr	x14, [x19, #0xde0]
    5900:      	strb	wzr, [x19, #0xdd9]
    5904:      	str	x14, [x23, #0x30]
    5908:      	ldr	x15, [x19, #0xde8]
    590c:      	str	x15, [x23, #0x18]
    5910:      	str	xzr, [x19, #0xde0]
    5914:      	str	xzr, [x19, #0xde8]
    5918:      	b	0x598c <.text+0x498c>
    591c:      	adrp	x1, 0xe000 <.text+0xd000>
    5920:      	adrp	x2, 0xe000 <.text+0xd000>
    5924:      	mov	w19, #0x7ba             // =1978
    5928:      	add	x1, x1, #0xec7
    592c:      	add	x2, x2, #0xcb8
    5930:      	orr	w0, wzr, #0x80000000
    5934:      	mov	w3, w19
    5938:      	bl	0xac7c <.text+0x9c7c>
    593c:      	adrp	x0, 0xe000 <.text+0xd000>
    5940:      	adrp	x2, 0x11000 <.text+0x10000>
    5944:      	add	x0, x0, #0xd24
    5948:      	add	x2, x2, #0xe70
    594c:      	mov	x1, x19
    5950:      	bl	0xb008 <.text+0xa008>
    5954:      	b	0x5954 <.text+0x4954>
    5958:      	ldr	x9, [x20, #0x38]
    595c:      	cbz	x9, 0x597c <.text+0x497c>
    5960:      	ldp	w8, w16, [x9]
    5964:      	bfi	x8, x16, #32, #32
    5968:      	cbz	x8, 0x597c <.text+0x497c>
    596c:      	ldr	w16, [x20, #0x20]
    5970:      	cbz	w16, 0x597c <.text+0x497c>
    5974:      	str	x8, [x23, #0x30]
    5978:      	b	0x5984 <.text+0x4984>
    597c:      	ldr	x17, [x20, #0x458]
    5980:      	str	x17, [x23, #0x30]
    5984:      	ldr	w3, [x20, #0x20]
    5988:      	str	x3, [x23, #0x18]
    598c:      	and	w12, w22, #0xff
    5990:      	cbz	w12, 0x59a0 <.text+0x49a0>
    5994:      	orr	w17, wzr, #0x2
    5998:      	str	w17, [x23, #0x20]
    599c:      	b	0x59b4 <.text+0x49b4>
    59a0:      	ldrb	w13, [x20, #0x30]
    59a4:      	cmp	w13, #0x0
    59a8:      	orr	w1, wzr, #0x1
    59ac:      	cinc	w2, w1, ne
    59b0:      	str	w2, [x23, #0x20]
    59b4:      	ldrb	w3, [x20, #0x10]
    59b8:      	strb	w3, [x23, #0x24]
    59bc:      	ldrb	w4, [x20, #0x11]
    59c0:      	str	w4, [x23, #0x28]
    59c4:      	ldrb	w5, [x19, #0xe08]
    59c8:      	cbz	w5, 0x59dc <.text+0x49dc>
    59cc:      	orr	w6, wzr, #0x1
    59d0:      	strb	wzr, [x19, #0xe08]
    59d4:      	str	xzr, [x23, #0x18]
    59d8:      	str	w6, [x23, #0x20]
    59dc:      	and	w14, w21, #0xff
    59e0:      	cbnz	w14, 0x5a3c <.text+0x4a3c>
    59e4:      	ldrb	w15, [x20, #0x30]
    59e8:      	cmp	w15, #0x2
    59ec:      	b.ne	0x5a3c <.text+0x4a3c>
    59f0:      	ldrb	w16, [x20, #0x12]
    59f4:      	cmp	w16, #0x5
    59f8:      	b.ne	0x5a1c <.text+0x4a1c>
    59fc:      	orr	w22, wzr, #0x1
    5a00:      	strb	w22, [x19, #0xe08]
    5a04:      	str	w22, [x23, #0x20]
    5a08:      	ldr	w4, [x20, #0x18]
    5a0c:      	str	x4, [x23, #0x18]
    5a10:      	ldrb	w17, [x20, #0x30]
    5a14:      	cmp	w17, #0x2
    5a18:      	b.ne	0x5a3c <.text+0x4a3c>
    5a1c:      	ldrb	w0, [x20, #0x12]
    5a20:      	sub	w1, w0, #0x3
    5a24:      	cmp	w1, #0x1
    5a28:      	b.hi	0x5a3c <.text+0x4a3c>
    5a2c:      	orr	w9, wzr, #0x1
    5a30:      	strb	wzr, [x19, #0xe08]
    5a34:      	str	xzr, [x23, #0x18]
    5a38:      	str	w9, [x23, #0x20]
    5a3c:      	add	x0, x19, #0x1b8
    5a40:      	mov	x1, x23
    5a44:      	bl	0xb898 <.text+0xa898>
    5a48:      	cbz	x20, 0x5a6c <.text+0x4a6c>
    5a4c:      	add	x0, x19, #0x9b8
    5a50:      	mov	x1, x20
    5a54:      	bl	0xb898 <.text+0xa898>
    5a58:      	ldr	w2, [x19, #0x9c8]
    5a5c:      	mov	x0, xzr
    5a60:      	add	w4, w2, #0x1
    5a64:      	str	w4, [x19, #0x9c8]
    5a68:      	b	0x5a70 <.text+0x4a70>
    5a6c:      	mov	x0, xzr
    5a70:      	sub	sp, x29, #0x30
    5a74:      	ldp	x29, x30, [sp, #0x30]
    5a78:      	ldp	x20, x19, [sp, #0x20]
    5a7c:      	ldp	x22, x21, [sp, #0x10]
    5a80:      	ldp	x24, x23, [sp], #0x40
    5a84:      	ret
    5a88:      	stp	x26, x25, [sp, #-0x50]!
    5a8c:      	stp	x24, x23, [sp, #0x10]
    5a90:      	stp	x22, x21, [sp, #0x20]
    5a94:      	stp	x20, x19, [sp, #0x30]
    5a98:      	stp	x29, x30, [sp, #0x40]
    5a9c:      	add	x29, sp, #0x40
    5aa0:      	mov	w22, w1
    5aa4:      	mov	w21, w2
    5aa8:      	and	w8, w22, #0xff
    5aac:      	mov	x23, x0
    5ab0:      	and	w24, w21, #0xff
    5ab4:      	add	x25, x23, x8, lsl #5
    5ab8:      	add	x8, x25, w24, uxtw #4
    5abc:      	add	x0, x8, #0x7b8
    5ac0:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    5ac4:      	mov	w20, w3
    5ac8:      	movk	x19, #0x6
    5acc:      	bl	0xb94c <.text+0xa94c>
    5ad0:      	and	w8, w0, #0xff
    5ad4:      	cbz	w8, 0x5afc <.text+0x4afc>
    5ad8:      	add	x9, x25, x24, lsl #4
    5adc:      	add	x24, x9, #0xbd0
    5ae0:      	mov	x0, x24
    5ae4:      	bl	0xb94c <.text+0xa94c>
    5ae8:      	and	w9, w0, #0xff
    5aec:      	cbz	w9, 0x5b30 <.text+0x4b30>
    5af0:      	adrp	x1, 0xe000 <.text+0xd000>
    5af4:      	add	x1, x1, #0xf1e
    5af8:      	b	0x5b04 <.text+0x4b04>
    5afc:      	adrp	x1, 0xe000 <.text+0xd000>
    5b00:      	add	x1, x1, #0xee3
    5b04:      	adrp	x2, 0xe000 <.text+0xd000>
    5b08:      	add	x2, x2, #0xf09
    5b0c:      	orr	w0, wzr, #0x80000000
    5b10:      	bl	0xac7c <.text+0x9c7c>
    5b14:      	mov	x0, x19
    5b18:      	ldp	x29, x30, [sp, #0x40]
    5b1c:      	ldp	x20, x19, [sp, #0x30]
    5b20:      	ldp	x22, x21, [sp, #0x20]
    5b24:      	ldp	x24, x23, [sp, #0x10]
    5b28:      	ldp	x26, x25, [sp], #0x50
    5b2c:      	ret
    5b30:      	mov	x0, x24
    5b34:      	bl	0xb8fc <.text+0xa8fc>
    5b38:      	mov	x19, x0
    5b3c:      	cbz	x19, 0x5b74 <.text+0x4b74>
    5b40:      	mov	x0, x19
    5b44:      	bl	0xb9a4 <.text+0xa9a4>
    5b48:      	mov	x0, x23
    5b4c:      	mov	w1, w22
    5b50:      	mov	w2, w21
    5b54:      	mov	x3, x19
    5b58:      	mov	w4, w20
    5b5c:      	bl	0x562c <.text+0x462c>
    5b60:      	mov	x19, x0
    5b64:      	tbz	x19, #0x3f, 0x5b14 <.text+0x4b14>
    5b68:      	adrp	x1, 0xe000 <.text+0xd000>
    5b6c:      	add	x1, x1, #0xde2
    5b70:      	b	0x5b04 <.text+0x4b04>
    5b74:      	adrp	x1, 0xe000 <.text+0xd000>
    5b78:      	adrp	x2, 0xe000 <.text+0xd000>
    5b7c:      	mov	w23, #0x83c             // =2108
    5b80:      	add	x1, x1, #0x98
    5b84:      	add	x2, x2, #0xcb8
    5b88:      	orr	w0, wzr, #0x80000000
    5b8c:      	mov	w3, w23
    5b90:      	bl	0xac7c <.text+0x9c7c>
    5b94:      	adrp	x0, 0xe000 <.text+0xd000>
    5b98:      	adrp	x2, 0x11000 <.text+0x10000>
    5b9c:      	add	x0, x0, #0xd24
    5ba0:      	add	x2, x2, #0xe70
    5ba4:      	mov	x1, x23
    5ba8:      	bl	0xb008 <.text+0xa008>
    5bac:      	b	0x5bac <.text+0x4bac>
    5bb0:      	stp	x26, x25, [sp, #-0x50]!
    5bb4:      	stp	x24, x23, [sp, #0x10]
    5bb8:      	stp	x22, x21, [sp, #0x20]
    5bbc:      	stp	x20, x19, [sp, #0x30]
    5bc0:      	stp	x29, x30, [sp, #0x40]
    5bc4:      	add	x29, sp, #0x40
    5bc8:      	sub	sp, sp, #0x10
    5bcc:      	mov	x19, x0
    5bd0:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    5bd4:      	mov	x22, x5
    5bd8:      	mov	x25, x4
    5bdc:      	ldrb	w8, [x19, #0x181]
    5be0:      	mov	w24, w3
    5be4:      	str	xzr, [sp, #0x8]
    5be8:      	mov	w20, w2
    5bec:      	mov	w21, w1
    5bf0:      	movk	x23, #0x2
    5bf4:      	cbz	w8, 0x5c68 <.text+0x4c68>
    5bf8:      	cbz	x25, 0x5c90 <.text+0x4c90>
    5bfc:      	add	x1, sp, #0x8
    5c00:      	mov	x0, x19
    5c04:      	bl	0x5368 <.text+0x4368>
    5c08:      	ldr	x8, [sp, #0x8]
    5c0c:      	cbz	x8, 0x5cdc <.text+0x4cdc>
    5c10:      	add	w10, w20, w21, lsl #1
    5c14:      	and	x10, x10, #0xff
    5c18:      	add	x11, x19, x10, lsl #5
    5c1c:      	and	w10, w21, #0xff
    5c20:      	ldr	w9, [x11, #0x220]
    5c24:      	cbz	w10, 0x5cac <.text+0x4cac>
    5c28:      	and	w11, w20, #0xff
    5c2c:      	cbnz	w11, 0x5cac <.text+0x4cac>
    5c30:      	cbnz	w24, 0x5cac <.text+0x4cac>
    5c34:      	str	w9, [x8, #0x448]
    5c38:      	orr	w8, wzr, #0x1
    5c3c:      	ldr	x12, [sp, #0x8]
    5c40:      	ldr	x13, [x12, #0x450]
    5c44:      	str	x8, [x13]
    5c48:      	ldr	x14, [sp, #0x8]
    5c4c:      	ldr	x15, [x14, #0x450]
    5c50:      	str	x9, [x15, #0x18]
    5c54:      	ldr	x16, [sp, #0x8]
    5c58:      	ldr	x17, [x16, #0x450]
    5c5c:      	add	x0, x16, #0x48
    5c60:      	str	x0, [x17, #0x10]
    5c64:      	b	0x5d7c <.text+0x4d7c>
    5c68:      	adrp	x1, 0xe000 <.text+0xd000>
    5c6c:      	adrp	x2, 0xe000 <.text+0xd000>
    5c70:      	and	w3, w21, #0xff
    5c74:      	and	w4, w20, #0xff
    5c78:      	add	x1, x1, #0xf38
    5c7c:      	add	x2, x2, #0xf7b
    5c80:      	orr	w0, wzr, #0x80000000
    5c84:      	bl	0xac7c <.text+0x9c7c>
    5c88:      	add	x23, x23, #0x4
    5c8c:      	b	0x5e08 <.text+0x4e08>
    5c90:      	adrp	x1, 0xf000 <.text+0xe000>
    5c94:      	adrp	x2, 0xf000 <.text+0xe000>
    5c98:      	add	x1, x1, #0xce7
    5c9c:      	add	x2, x2, #0x258
    5ca0:      	orr	w0, wzr, #0x80000000
    5ca4:      	bl	0xac7c <.text+0x9c7c>
    5ca8:      	b	0x5df0 <.text+0x4df0>
    5cac:      	cbz	w24, 0x5cfc <.text+0x4cfc>
    5cb0:      	udiv	w11, w24, w9
    5cb4:      	msub	w10, w11, w9, w24
    5cb8:      	cbnz	w10, 0x5cd4 <.text+0x4cd4>
    5cbc:      	and	w12, w21, #0xff
    5cc0:      	and	w13, w20, #0xff
    5cc4:      	add	x11, x19, w12, uxtw #1
    5cc8:      	add	x12, x11, w13, uxtw
    5ccc:      	ldrb	w12, [x12, #0xd1]
    5cd0:      	cbz	w12, 0x5cfc <.text+0x4cfc>
    5cd4:      	sub	w9, w9, w10
    5cd8:      	b	0x5d00 <.text+0x4d00>
    5cdc:      	adrp	x1, 0xf000 <.text+0xe000>
    5ce0:      	adrp	x2, 0xf000 <.text+0xe000>
    5ce4:      	add	x1, x1, #0x278
    5ce8:      	add	x2, x2, #0x258
    5cec:      	orr	w0, wzr, #0x80000000
    5cf0:      	bl	0xac7c <.text+0x9c7c>
    5cf4:      	add	x23, x23, #0x7
    5cf8:      	b	0x5df0 <.text+0x4df0>
    5cfc:      	mov	w9, wzr
    5d00:      	ldr	x1, [x8, #0x450]
    5d04:      	mov	w11, w24
    5d08:      	and	w8, w20, #0xff
    5d0c:      	str	x11, [x1, #0x18]
    5d10:      	ldr	x2, [sp, #0x8]
    5d14:      	ldr	x3, [x2, #0x450]
    5d18:      	str	x25, [x3, #0x10]
    5d1c:      	cbnz	w8, 0x5d64 <.text+0x4d64>
    5d20:      	cbz	w9, 0x5d64 <.text+0x4d64>
    5d24:      	ldr	x4, [sp, #0x8]
    5d28:      	add	w13, w9, w24
    5d2c:      	orr	w12, wzr, #0x2
    5d30:      	str	w13, [x4, #0x448]
    5d34:      	mov	w13, w9
    5d38:      	ldr	x5, [sp, #0x8]
    5d3c:      	ldr	x6, [x5, #0x450]
    5d40:      	str	x12, [x6]
    5d44:      	ldr	x7, [sp, #0x8]
    5d48:      	ldr	x23, [x7, #0x450]
    5d4c:      	str	x13, [x23, #0x30]
    5d50:      	ldr	x8, [sp, #0x8]
    5d54:      	ldr	x9, [x8, #0x450]
    5d58:      	add	x10, x8, #0x48
    5d5c:      	str	x10, [x9, #0x28]
    5d60:      	b	0x5d7c <.text+0x4d7c>
    5d64:      	ldr	x11, [sp, #0x8]
    5d68:      	orr	w14, wzr, #0x1
    5d6c:      	str	w24, [x11, #0x448]
    5d70:      	ldr	x12, [sp, #0x8]
    5d74:      	ldr	x13, [x12, #0x450]
    5d78:      	str	x14, [x13]
    5d7c:      	ldr	x9, [sp, #0x8]
    5d80:      	cbz	x9, 0x5dec <.text+0x4dec>
    5d84:      	and	w14, w21, #0xff
    5d88:      	str	x22, [x9, #0x458]
    5d8c:      	cbz	w14, 0x5e28 <.text+0x4e28>
    5d90:      	ldr	x22, [sp, #0x8]
    5d94:      	orr	w4, wzr, #0x1
    5d98:      	mov	x0, x19
    5d9c:      	mov	w1, w21
    5da0:      	mov	w2, w20
    5da4:      	mov	x3, x22
    5da8:      	bl	0x562c <.text+0x462c>
    5dac:      	mov	x23, x0
    5db0:      	tbz	x23, #0x3f, 0x5e08 <.text+0x4e08>
    5db4:      	adrp	x1, 0xe000 <.text+0xd000>
    5db8:      	adrp	x2, 0xe000 <.text+0xd000>
    5dbc:      	add	x1, x1, #0xde2
    5dc0:      	add	x2, x2, #0xf7b
    5dc4:      	orr	w0, wzr, #0x80000000
    5dc8:      	bl	0xac7c <.text+0x9c7c>
    5dcc:      	cbz	x22, 0x5e08 <.text+0x4e08>
    5dd0:      	add	x0, x19, #0x9b8
    5dd4:      	mov	x1, x22
    5dd8:      	bl	0xb898 <.text+0xa898>
    5ddc:      	ldr	w16, [x19, #0x9c8]
    5de0:      	add	w17, w16, #0x1
    5de4:      	str	w17, [x19, #0x9c8]
    5de8:      	b	0x5e08 <.text+0x4e08>
    5dec:      	mov	x23, xzr
    5df0:      	adrp	x1, 0xe000 <.text+0xd000>
    5df4:      	adrp	x2, 0xe000 <.text+0xd000>
    5df8:      	add	x1, x1, #0xf8c
    5dfc:      	add	x2, x2, #0xf7b
    5e00:      	orr	w0, wzr, #0x80000000
    5e04:      	bl	0xac7c <.text+0x9c7c>
    5e08:      	mov	x0, x23
    5e0c:      	sub	sp, x29, #0x40
    5e10:      	ldp	x29, x30, [sp, #0x40]
    5e14:      	ldp	x20, x19, [sp, #0x30]
    5e18:      	ldp	x22, x21, [sp, #0x20]
    5e1c:      	ldp	x24, x23, [sp, #0x10]
    5e20:      	ldp	x26, x25, [sp], #0x50
    5e24:      	ret
    5e28:      	ldrb	w14, [x19, #0xe08]
    5e2c:      	cbz	w14, 0x5e98 <.text+0x4e98>
    5e30:      	ldr	x14, [sp, #0x8]
    5e34:      	and	w9, w20, #0xff
    5e38:      	add	x8, x19, w9, uxtw #4
    5e3c:      	add	x0, x8, #0x7b8
    5e40:      	strb	wzr, [x14, #0x10]
    5e44:      	ldr	x15, [sp, #0x8]
    5e48:      	strb	w20, [x15, #0x11]
    5e4c:      	add	x20, x19, #0x1f0
    5e50:      	ldr	x16, [sp, #0x8]
    5e54:      	str	xzr, [x16, #0x38]
    5e58:      	ldr	x1, [sp, #0x8]
    5e5c:      	bl	0xb898 <.text+0xa898>
    5e60:      	mov	w1, wzr
    5e64:      	orr	w2, wzr, #0x1
    5e68:      	mov	x0, x20
    5e6c:      	bl	0x9e5c <.text+0x8e5c>
    5e70:      	mov	x23, xzr
    5e74:      	tbz	w0, #0x1f, 0x5e08 <.text+0x4e08>
    5e78:      	adrp	x1, 0xe000 <.text+0xd000>
    5e7c:      	adrp	x2, 0xe000 <.text+0xd000>
    5e80:      	add	x1, x1, #0xfab
    5e84:      	add	x2, x2, #0xf7b
    5e88:      	orr	w0, wzr, #0x80000000
    5e8c:      	bl	0xac7c <.text+0x9c7c>
    5e90:      	mov	x23, xzr
    5e94:      	b	0x5e08 <.text+0x4e08>
    5e98:      	and	w15, w20, #0xff
    5e9c:      	ldr	x1, [sp, #0x8]
    5ea0:      	add	x9, x19, w15, uxtw #4
    5ea4:      	add	x0, x9, #0xbd0
    5ea8:      	bl	0xb898 <.text+0xa898>
    5eac:      	mov	x23, xzr
    5eb0:      	b	0x5e08 <.text+0x4e08>
    5eb4:      	mov	x8, x0
    5eb8:      	cbz	x8, 0x5f40 <.text+0x4f40>
    5ebc:      	cbz	x2, 0x5f40 <.text+0x4f40>
    5ec0:      	cbz	x3, 0x5f40 <.text+0x4f40>
    5ec4:      	str	xzr, [x2]
    5ec8:      	orr	w12, w1, #0x80
    5ecc:      	str	xzr, [x3]
    5ed0:      	mov	w0, wzr
    5ed4:      	ldr	x9, [x8, #0x1a8]
    5ed8:      	mov	x10, xzr
    5edc:      	ldr	x6, [x9, #0x8]
    5ee0:      	and	w9, w12, #0xff
    5ee4:      	ldr	x11, [x6]
    5ee8:      	b	0x5ef0 <.text+0x4ef0>
    5eec:      	add	x10, x10, #0x1
    5ef0:      	ldr	x7, [x11]
    5ef4:      	ldrb	w13, [x7, #0x4]
    5ef8:      	cmp	x10, x13
    5efc:      	b.hs	0x5f6c <.text+0x4f6c>
    5f00:      	ldr	x12, [x11, #0x8]
    5f04:      	mov	x17, xzr
    5f08:      	ldr	x15, [x12, x10, lsl #3]
    5f0c:      	ldr	x13, [x15]
    5f10:      	ldrb	w12, [x13, #0x4]
    5f14:      	cmp	x17, x12
    5f18:      	b.hs	0x5eec <.text+0x4eec>
    5f1c:      	ldr	x14, [x15, #0x8]
    5f20:      	ldr	x4, [x14, x17, lsl #3]
    5f24:      	add	x17, x17, #0x1
    5f28:      	ldrb	w13, [x4, #0x2]
    5f2c:      	cmp	w13, w9
    5f30:      	b.ne	0x5f14 <.text+0x4f14>
    5f34:      	orr	w0, wzr, #0x1
    5f38:      	str	x4, [x2]
    5f3c:      	b	0x5eec <.text+0x4eec>
    5f40:      	stp	x29, x30, [sp, #-0x10]!
    5f44:      	mov	x29, sp
    5f48:      	adrp	x1, 0xf000 <.text+0xe000>
    5f4c:      	adrp	x2, 0xf000 <.text+0xe000>
    5f50:      	add	x1, x1, #0x7f
    5f54:      	add	x2, x2, #0x95
    5f58:      	orr	w0, wzr, #0x80000000
    5f5c:      	bl	0xac7c <.text+0x9c7c>
    5f60:      	mov	w0, wzr
    5f64:      	ldp	x29, x30, [sp], #0x10
    5f68:      	ret
    5f6c:      	ldr	x5, [x8, #0x1b0]
    5f70:      	cbz	x5, 0x5fd8 <.text+0x4fd8>
    5f74:      	ldr	x2, [x5, #0x8]
    5f78:      	mov	x13, xzr
    5f7c:      	ldr	x12, [x2]
    5f80:      	ldr	x8, [x12]
    5f84:      	ldrb	w8, [x8, #0x4]
    5f88:      	b	0x5f90 <.text+0x4f90>
    5f8c:      	add	x13, x13, #0x1
    5f90:      	cmp	x13, x8
    5f94:      	b.hs	0x5fd8 <.text+0x4fd8>
    5f98:      	ldr	x10, [x12, #0x8]
    5f9c:      	mov	x16, xzr
    5fa0:      	ldr	x14, [x10, x13, lsl #3]
    5fa4:      	ldr	x11, [x14]
    5fa8:      	ldrb	w10, [x11, #0x4]
    5fac:      	cmp	x16, x10
    5fb0:      	b.hs	0x5f8c <.text+0x4f8c>
    5fb4:      	ldr	x15, [x14, #0x8]
    5fb8:      	ldr	x1, [x15, x16, lsl #3]
    5fbc:      	add	x16, x16, #0x1
    5fc0:      	ldr	x17, [x1]
    5fc4:      	ldrb	w11, [x17, #0x2]
    5fc8:      	cmp	w11, w9
    5fcc:      	b.ne	0x5fac <.text+0x4fac>
    5fd0:      	orr	w0, wzr, #0x1
    5fd4:      	str	x1, [x3]
    5fd8:      	ret
    5fdc:      	orr	w8, wzr, #0x1
    5fe0:      	str	wzr, [x0, #0x184]
    5fe4:      	strb	wzr, [x0, #0x189]
    5fe8:      	strb	wzr, [x0, #0x18a]
    5fec:      	strb	w8, [x0, #0x180]
    5ff0:      	str	xzr, [x0, #0x190]
    5ff4:      	ret
    5ff8:      	stp	x26, x25, [sp, #-0x50]!
    5ffc:      	stp	x24, x23, [sp, #0x10]
    6000:      	stp	x22, x21, [sp, #0x20]
    6004:      	stp	x20, x19, [sp, #0x30]
    6008:      	stp	x29, x30, [sp, #0x40]
    600c:      	add	x29, sp, #0x40
    6010:      	mov	x20, x0
    6014:      	ldrb	w8, [x20, #0x181]
    6018:      	strb	wzr, [x20, #0x180]
    601c:      	cbz	w8, 0x6034 <.text+0x5034>
    6020:      	orr	w9, wzr, #0x1
    6024:      	mov	w1, wzr
    6028:      	mov	x0, x20
    602c:      	strb	w9, [x20, #0x19d]
    6030:      	bl	0x6144 <.text+0x5144>
    6034:      	add	x19, x20, #0x1b8
    6038:      	strb	wzr, [x20, #0x18a]
    603c:      	add	x21, x20, #0x1c8
    6040:      	strb	wzr, [x20, #0x181]
    6044:      	str	wzr, [x20, #0x184]
    6048:      	strb	wzr, [x20, #0x189]
    604c:      	b	0x606c <.text+0x506c>
    6050:      	mov	x0, x19
    6054:      	bl	0xb8fc <.text+0xa8fc>
    6058:      	mov	x22, x0
    605c:      	bl	0xb9a4 <.text+0xa9a4>
    6060:      	mov	x0, x21
    6064:      	mov	x1, x22
    6068:      	bl	0xb898 <.text+0xa898>
    606c:      	mov	x0, x19
    6070:      	bl	0xb94c <.text+0xa94c>
    6074:      	and	w8, w0, #0xff
    6078:      	cbz	w8, 0x6050 <.text+0x5050>
    607c:      	ldr	x8, [x20, #0xdd0]
    6080:      	cbz	x8, 0x612c <.text+0x512c>
    6084:      	mov	x21, xzr
    6088:      	add	x19, x20, #0x9b8
    608c:      	add	x20, x20, #0x7b8
    6090:      	b	0x609c <.text+0x509c>
    6094:      	add	x21, x21, #0x1
    6098:      	mov	x20, x23
    609c:      	cmp	x21, #0x10
    60a0:      	b.eq	0x612c <.text+0x512c>
    60a4:      	mov	x24, xzr
    60a8:      	add	x23, x20, #0x20
    60ac:      	b	0x60b8 <.text+0x50b8>
    60b0:      	add	x24, x24, #0x1
    60b4:      	mov	x20, x25
    60b8:      	cmp	x24, #0x2
    60bc:      	b.eq	0x6094 <.text+0x5094>
    60c0:      	add	x25, x20, #0x10
    60c4:      	b	0x60e4 <.text+0x50e4>
    60c8:      	mov	x0, x20
    60cc:      	bl	0xb8fc <.text+0xa8fc>
    60d0:      	mov	x22, x0
    60d4:      	bl	0xb9a4 <.text+0xa9a4>
    60d8:      	mov	x0, x19
    60dc:      	mov	x1, x22
    60e0:      	bl	0xb898 <.text+0xa898>
    60e4:      	mov	x0, x20
    60e8:      	bl	0xb94c <.text+0xa94c>
    60ec:      	and	w9, w0, #0xff
    60f0:      	cbz	w9, 0x60c8 <.text+0x50c8>
    60f4:      	add	x20, x20, #0x418
    60f8:      	b	0x6118 <.text+0x5118>
    60fc:      	mov	x0, x20
    6100:      	bl	0xb8fc <.text+0xa8fc>
    6104:      	mov	x22, x0
    6108:      	bl	0xb9a4 <.text+0xa9a4>
    610c:      	mov	x0, x19
    6110:      	mov	x1, x22
    6114:      	bl	0xb898 <.text+0xa898>
    6118:      	mov	x0, x20
    611c:      	bl	0xb94c <.text+0xa94c>
    6120:      	and	w10, w0, #0xff
    6124:      	cbz	w10, 0x60fc <.text+0x50fc>
    6128:      	b	0x60b0 <.text+0x50b0>
    612c:      	ldp	x29, x30, [sp, #0x40]
    6130:      	ldp	x20, x19, [sp, #0x30]
    6134:      	ldp	x22, x21, [sp, #0x20]
    6138:      	ldp	x24, x23, [sp, #0x10]
    613c:      	ldp	x26, x25, [sp], #0x50
    6140:      	ret
    6144:      	stp	x24, x23, [sp, #-0x40]!
    6148:      	stp	x22, x21, [sp, #0x10]
    614c:      	stp	x20, x19, [sp, #0x20]
    6150:      	stp	x29, x30, [sp, #0x30]
    6154:      	add	x29, sp, #0x30
    6158:      	mov	x19, x0
    615c:      	and	w8, w1, #0xff
    6160:      	cmp	w8, #0x1
    6164:      	strb	w1, [x19, #0x181]
    6168:      	b.ne	0x61e8 <.text+0x51e8>
    616c:      	ldr	x9, [x19, #0xa8]
    6170:      	cmp	w9, #0x5
    6174:      	b.ne	0x619c <.text+0x519c>
    6178:      	lsr	x8, x9, #32
    617c:      	cmp	w8, #0x10
    6180:      	b.hi	0x6264 <.text+0x5264>
    6184:      	mov	w12, #0x10000           // =65536
    6188:      	orr	w11, wzr, #0x1
    618c:      	movk	w12, #0x8001
    6190:      	lsl	w13, w11, w8
    6194:      	and	w14, w13, w12
    6198:      	cbz	w14, 0x6264 <.text+0x5264>
    619c:      	str	wzr, [x19, #0x198]
    61a0:      	ldr	x0, [x19, #0x1e8]
    61a4:      	bl	0xd200 <.text+0xc200>
    61a8:      	mov	x0, x19
    61ac:      	bl	0x36b8 <.text+0x26b8>
    61b0:      	mov	x9, x0
    61b4:      	tbnz	x9, #0x3f, 0x6238 <.text+0x5238>
    61b8:      	ldr	x12, [x19, #0x1e0]
    61bc:      	mov	w13, #0xc704            // =50948
    61c0:      	add	x21, x12, x13
    61c4:      	mov	x0, x21
    61c8:      	bl	0xcc88 <.text+0xbc88>
    61cc:      	orr	w1, w0, #0x80000000
    61d0:      	mov	x0, x21
    61d4:      	ldp	x29, x30, [sp, #0x30]
    61d8:      	ldp	x20, x19, [sp, #0x20]
    61dc:      	ldp	x22, x21, [sp, #0x10]
    61e0:      	ldp	x24, x23, [sp], #0x40
    61e4:      	b	0xccc0 <.text+0xbcc0>
    61e8:      	ldr	x0, [x19, #0x1e8]
    61ec:      	bl	0xd230 <.text+0xc230>
    61f0:      	mov	x0, x19
    61f4:      	bl	0x49b4 <.text+0x39b4>
    61f8:      	tbz	x0, #0x3f, 0x6214 <.text+0x5214>
    61fc:      	adrp	x1, 0xf000 <.text+0xe000>
    6200:      	adrp	x2, 0xf000 <.text+0xe000>
    6204:      	add	x1, x1, #0x406
    6208:      	add	x2, x2, #0x3a1
    620c:      	orr	w0, wzr, #0x80000000
    6210:      	bl	0xac7c <.text+0x9c7c>
    6214:      	strb	wzr, [x19, #0x18a]
    6218:      	strb	wzr, [x19, #0x189]
    621c:      	strb	wzr, [x19, #0x182]
    6220:      	str	xzr, [x19, #0x190]
    6224:      	ldp	x29, x30, [sp, #0x30]
    6228:      	ldp	x20, x19, [sp, #0x20]
    622c:      	ldp	x22, x21, [sp, #0x10]
    6230:      	ldp	x24, x23, [sp], #0x40
    6234:      	ret
    6238:      	ldp	x29, x30, [sp, #0x30]
    623c:      	adrp	x1, 0xf000 <.text+0xe000>
    6240:      	ldp	x20, x19, [sp, #0x20]
    6244:      	adrp	x2, 0xf000 <.text+0xe000>
    6248:      	ldp	x22, x21, [sp, #0x10]
    624c:      	add	x1, x1, #0x3b9
    6250:      	add	x2, x2, #0x3a1
    6254:      	orr	w0, wzr, #0x80000000
    6258:      	mov	x3, x9
    625c:      	ldp	x24, x23, [sp], #0x40
    6260:      	b	0xac7c <.text+0x9c7c>
    6264:      	add	x20, x19, #0x198
    6268:      	orr	w22, wzr, #0x1
    626c:      	adrp	x23, 0x13000
    6270:      	mov	w21, #0x2710            // =10000
    6274:      	mov	w0, wzr
    6278:      	mov	x1, x20
    627c:      	bl	0xd254 <.text+0xc254>
    6280:      	mov	x8, x0
    6284:      	tbnz	x8, #0x3f, 0x6310 <.text+0x5310>
    6288:      	ldr	w3, [x20]
    628c:      	cmp	w3, #0x8
    6290:      	b.ne	0x62bc <.text+0x52bc>
    6294:      	ldr	x10, [x23, #0x478]
    6298:      	mov	x0, x21
    629c:      	ldr	x10, [x10, #0xf8]
    62a0:      	blr	x10
    62a4:      	add	x8, x22, #0x1
    62a8:      	ldr	w3, [x20]
    62ac:      	cmp	x22, #0x63
    62b0:      	mov	x22, x8
    62b4:      	ccmp	w3, #0x8, #0x0, ls
    62b8:      	b.eq	0x6274 <.text+0x5274>
    62bc:      	cmp	w3, #0x2
    62c0:      	b.lo	0x61a0 <.text+0x51a0>
    62c4:      	b.eq	0x62dc <.text+0x52dc>
    62c8:      	cmp	w3, #0x7
    62cc:      	b.ne	0x62e8 <.text+0x52e8>
    62d0:      	mov	w15, #0x1f4             // =500
    62d4:      	str	x15, [x19, #0x190]
    62d8:      	b	0x6224 <.text+0x5224>
    62dc:      	mov	w14, #0x5dc             // =1500
    62e0:      	str	x14, [x19, #0x190]
    62e4:      	b	0x6224 <.text+0x5224>
    62e8:      	ldp	x29, x30, [sp, #0x30]
    62ec:      	adrp	x1, 0xf000 <.text+0xe000>
    62f0:      	ldp	x20, x19, [sp, #0x20]
    62f4:      	adrp	x2, 0xf000 <.text+0xe000>
    62f8:      	ldp	x22, x21, [sp, #0x10]
    62fc:      	add	x1, x1, #0x3ea
    6300:      	add	x2, x2, #0x3a1
    6304:      	orr	w0, wzr, #0x80000000
    6308:      	ldp	x24, x23, [sp], #0x40
    630c:      	b	0xac7c <.text+0x9c7c>
    6310:      	adrp	x1, 0xf000 <.text+0xe000>
    6314:      	adrp	x2, 0xf000 <.text+0xe000>
    6318:      	add	x1, x1, #0x357
    631c:      	add	x2, x2, #0x3a1
    6320:      	orr	w0, wzr, #0x80000000
    6324:      	mov	x3, x8
    6328:      	bl	0xac7c <.text+0x9c7c>
    632c:      	str	wzr, [x20]
    6330:      	b	0x61a0 <.text+0x51a0>
    6334:      	stp	x20, x19, [sp, #-0x20]!
    6338:      	stp	x29, x30, [sp, #0x10]
    633c:      	add	x29, sp, #0x10
    6340:      	sub	sp, sp, #0x10
    6344:      	orr	w11, wzr, #0x1
    6348:      	mov	x19, x0
    634c:      	strb	w11, [sp, #0xf]
    6350:      	cbz	x19, 0x63c4 <.text+0x53c4>
    6354:      	ldrh	w8, [x19, #0x180]
    6358:      	and	w9, w8, #0xff
    635c:      	cbz	w9, 0x63d0 <.text+0x53d0>
    6360:      	ldr	x10, [x19, #0xa8]
    6364:      	cmp	w10, #0x5
    6368:      	b.ne	0x6390 <.text+0x5390>
    636c:      	lsr	x9, x10, #32
    6370:      	cmp	w9, #0x10
    6374:      	b.hi	0x6414 <.text+0x5414>
    6378:      	mov	w15, #0x10000           // =65536
    637c:      	orr	w14, wzr, #0x1
    6380:      	movk	w15, #0x8001
    6384:      	lsl	w16, w14, w9
    6388:      	and	w17, w16, w15
    638c:      	cbz	w17, 0x6414 <.text+0x5414>
    6390:      	orr	w9, wzr, #0x1
    6394:      	lsr	w10, w8, #8
    6398:      	strb	w9, [sp, #0xf]
    639c:      	cbz	w10, 0x63ec <.text+0x53ec>
    63a0:      	tbz	w9, #0x0, 0x63f8 <.text+0x53f8>
    63a4:      	ldr	x10, [x19, #0x1e0]
    63a8:      	mov	w11, #0xc704            // =50948
    63ac:      	add	x0, x10, x11
    63b0:      	bl	0xcc88 <.text+0xbc88>
    63b4:      	tbz	w0, #0x1f, 0x6404 <.text+0x5404>
    63b8:      	mov	x0, x19
    63bc:      	bl	0x4d48 <.text+0x3d48>
    63c0:      	b	0x6404 <.text+0x5404>
    63c4:      	adrp	x1, 0xf000 <.text+0xe000>
    63c8:      	add	x1, x1, #0x2ac
    63cc:      	b	0x63d8 <.text+0x53d8>
    63d0:      	adrp	x1, 0xf000 <.text+0xe000>
    63d4:      	add	x1, x1, #0x2eb
    63d8:      	adrp	x2, 0xf000 <.text+0xe000>
    63dc:      	add	x2, x2, #0x2da
    63e0:      	orr	w0, wzr, #0x80000000
    63e4:      	bl	0xac7c <.text+0x9c7c>
    63e8:      	b	0x6404 <.text+0x5404>
    63ec:      	cbz	w9, 0x6404 <.text+0x5404>
    63f0:      	orr	w1, wzr, #0x1
    63f4:      	b	0x63fc <.text+0x53fc>
    63f8:      	mov	w1, wzr
    63fc:      	mov	x0, x19
    6400:      	bl	0x6144 <.text+0x5144>
    6404:      	sub	sp, x29, #0x10
    6408:      	ldp	x29, x30, [sp, #0x10]
    640c:      	ldp	x20, x19, [sp], #0x20
    6410:      	ret
    6414:      	ldr	x0, [x19, #0xa0]
    6418:      	mov	w1, #0x5                // =5
    641c:      	add	x2, sp, #0xf
    6420:      	ldr	x9, [x0, #0x30]
    6424:      	blr	x9
    6428:      	mov	x8, x0
    642c:      	tbnz	x8, #0x3f, 0x6444 <.text+0x5444>
    6430:      	ldrb	w8, [sp, #0xf]
    6434:      	ldrb	w10, [x19, #0x181]
    6438:      	cmp	w8, #0x0
    643c:      	cset	w9, ne
    6440:      	b	0x639c <.text+0x539c>
    6444:      	adrp	x1, 0xf000 <.text+0xe000>
    6448:      	adrp	x2, 0xf000 <.text+0xe000>
    644c:      	add	x1, x1, #0x305
    6450:      	add	x2, x2, #0x2da
    6454:      	orr	w0, wzr, #0x80000000
    6458:      	mov	x3, x8
    645c:      	bl	0xac7c <.text+0x9c7c>
    6460:      	b	0x6404 <.text+0x5404>
    6464:      	stp	x20, x19, [sp, #-0x20]!
    6468:      	stp	x29, x30, [sp, #0x10]
    646c:      	add	x29, sp, #0x10
    6470:      	mov	x19, x0
    6474:      	mov	w20, w1
    6478:      	ldrb	w8, [x19, #0x182]
    647c:      	cmp	w8, w20, uxtb
    6480:      	b.eq	0x6500 <.text+0x5500>
    6484:      	and	w9, w20, #0xff
    6488:      	cbz	w9, 0x6498 <.text+0x5498>
    648c:      	str	xzr, [x19, #0x190]
    6490:      	orr	w1, wzr, #0x7
    6494:      	b	0x64f4 <.text+0x54f4>
    6498:      	ldrb	w9, [x19, #0x18a]
    649c:      	cbz	w9, 0x64cc <.text+0x54cc>
    64a0:      	ldr	w10, [x19, #0x184]
    64a4:      	cmp	w10, #0x4
    64a8:      	b.ne	0x64d4 <.text+0x54d4>
    64ac:      	ldr	x8, [x19, #0x1b0]
    64b0:      	ldr	x9, [x8, #0x8]
    64b4:      	ldr	x10, [x9]
    64b8:      	ldr	x11, [x10]
    64bc:      	ldrb	w8, [x11, #0x8]
    64c0:      	lsl	x9, x8, #3
    64c4:      	str	x9, [x19, #0x190]
    64c8:      	b	0x64f0 <.text+0x54f0>
    64cc:      	str	xzr, [x19, #0x190]
    64d0:      	b	0x64f0 <.text+0x54f0>
    64d4:      	ldr	x12, [x19, #0x1a8]
    64d8:      	ldr	x13, [x12, #0x8]
    64dc:      	ldr	x14, [x13]
    64e0:      	ldr	x15, [x14]
    64e4:      	ldrb	w10, [x15, #0x8]
    64e8:      	lsl	x11, x10, #1
    64ec:      	str	x11, [x19, #0x190]
    64f0:      	orr	w1, wzr, #0x8
    64f4:      	mov	x0, x19
    64f8:      	bl	0x2160 <.text+0x1160>
    64fc:      	strb	w20, [x19, #0x182]
    6500:      	ldp	x29, x30, [sp, #0x10]
    6504:      	ldp	x20, x19, [sp], #0x20
    6508:      	ret
    650c:      	orr	w1, wzr, #0x6
    6510:      	strb	wzr, [x0, #0x18a]
    6514:      	strb	wzr, [x0, #0x189]
    6518:      	b	0x2160 <.text+0x1160>
    651c:      	stp	x24, x23, [sp, #-0x40]!
    6520:      	stp	x22, x21, [sp, #0x10]
    6524:      	stp	x20, x19, [sp, #0x20]
    6528:      	stp	x29, x30, [sp, #0x30]
    652c:      	add	x29, sp, #0x30
    6530:      	mov	x19, x1
    6534:      	mov	x20, x0
    6538:      	cbz	x20, 0x65c8 <.text+0x55c8>
    653c:      	cbz	x19, 0x65c8 <.text+0x55c8>
    6540:      	cbz	x2, 0x65c8 <.text+0x55c8>
    6544:      	cbz	x3, 0x65c8 <.text+0x55c8>
    6548:      	ldrb	w9, [x19, #0x7]
    654c:      	ldrb	w12, [x19, #0x6]
    6550:      	bfi	w12, w9, #8, #8
    6554:      	cmp	w12, #0x0
    6558:      	cset	w11, ne
    655c:      	strb	w11, [x2]
    6560:      	ldrb	w12, [x19]
    6564:      	lsr	w13, w12, #7
    6568:      	str	w13, [x3]
    656c:      	ldrb	w8, [x19]
    6570:      	and	w13, w8, #0x60
    6574:      	cbnz	w13, 0x67e4 <.text+0x57e4>
    6578:      	and	w11, w8, #0x1f
    657c:      	cmp	w11, #0x1
    6580:      	b.eq	0x65e4 <.text+0x55e4>
    6584:      	cbnz	w11, 0x67e4 <.text+0x57e4>
    6588:      	ldrb	w8, [x19, #0x1]
    658c:      	cmp	w8, #0x8
    6590:      	b.gt	0x6624 <.text+0x5624>
    6594:      	cmp	w8, #0x3
    6598:      	b.eq	0x6640 <.text+0x5640>
    659c:      	cmp	w8, #0x5
    65a0:      	b.ne	0x67e4 <.text+0x57e4>
    65a4:      	ldrb	w5, [x20, #0x18a]
    65a8:      	cbz	w5, 0x669c <.text+0x569c>
    65ac:      	adrp	x1, 0xf000 <.text+0xe000>
    65b0:      	adrp	x2, 0xf000 <.text+0xe000>
    65b4:      	add	x1, x1, #0x46d
    65b8:      	add	x2, x2, #0x49a
    65bc:      	orr	w0, wzr, #0x80000000
    65c0:      	bl	0xac7c <.text+0x9c7c>
    65c4:      	b	0x67e4 <.text+0x57e4>
    65c8:      	adrp	x0, 0xf000 <.text+0xe000>
    65cc:      	adrp	x2, 0xf000 <.text+0xe000>
    65d0:      	add	x0, x0, #0x42e
    65d4:      	mov	w1, #0x2ca              // =714
    65d8:      	add	x2, x2, #0x43d
    65dc:      	bl	0xb008 <.text+0xa008>
    65e0:      	b	0x65e0 <.text+0x55e0>
    65e4:      	ldrb	w16, [x19, #0x1]
    65e8:      	cmp	w16, #0xb
    65ec:      	b.ne	0x6608 <.text+0x5608>
    65f0:      	ldrb	w17, [x20, #0x18a]
    65f4:      	cbz	w17, 0x6608 <.text+0x5608>
    65f8:      	ldrb	w2, [x19, #0x2]
    65fc:      	mov	x0, x20
    6600:      	ldrb	w1, [x19, #0x4]
    6604:      	bl	0x6854 <.text+0x5854>
    6608:      	mov	x0, x20
    660c:      	mov	x1, x19
    6610:      	ldp	x29, x30, [sp, #0x30]
    6614:      	ldp	x20, x19, [sp, #0x20]
    6618:      	ldp	x22, x21, [sp, #0x10]
    661c:      	ldp	x24, x23, [sp], #0x40
    6620:      	b	0x1f9c <.text+0xf9c>
    6624:      	cmp	w8, #0x9
    6628:      	b.eq	0x6670 <.text+0x5670>
    662c:      	cmp	w8, #0x30
    6630:      	b.ne	0x67e4 <.text+0x57e4>
    6634:      	orr	w21, wzr, #0x1
    6638:      	strb	w21, [x20, #0x19e]
    663c:      	b	0x67e4 <.text+0x57e4>
    6640:      	ldrb	w10, [x19, #0x3]
    6644:      	ldrb	w9, [x19, #0x2]
    6648:      	bfi	w9, w10, #8, #8
    664c:      	cmp	w9, #0x2
    6650:      	b.eq	0x66b0 <.text+0x56b0>
    6654:      	cmp	w9, #0x31
    6658:      	b.eq	0x66d0 <.text+0x56d0>
    665c:      	cmp	w9, #0x30
    6660:      	b.ne	0x67e4 <.text+0x57e4>
    6664:      	mov	x0, x20
    6668:      	bl	0x4524 <.text+0x3524>
    666c:      	b	0x67e4 <.text+0x57e4>
    6670:      	ldrb	w21, [x19, #0x2]
    6674:      	ldrb	w7, [x20, #0x18a]
    6678:      	cmp	w7, w21
    667c:      	b.eq	0x67e4 <.text+0x57e4>
    6680:      	cbz	w21, 0x66dc <.text+0x56dc>
    6684:      	ldr	w14, [x20, #0x184]
    6688:      	cmp	w14, #0x4
    668c:      	b.ne	0x6700 <.text+0x5700>
    6690:      	ldr	x8, [x20, #0x1b0]
    6694:      	add	x8, x8, #0x8
    6698:      	b	0x6708 <.text+0x5708>
    669c:      	ldrb	w6, [x19, #0x2]
    66a0:      	mov	x0, x20
    66a4:      	strb	w6, [x20, #0x189]
    66a8:      	bl	0x47c0 <.text+0x37c0>
    66ac:      	b	0x67e4 <.text+0x57e4>
    66b0:      	ldrb	w13, [x19, #0x5]
    66b4:      	ldrb	w10, [x19, #0x4]
    66b8:      	bfi	w10, w13, #8, #8
    66bc:      	cmp	w10, #0x8ff
    66c0:      	b.hi	0x67e4 <.text+0x57e4>
    66c4:      	lsr	w15, w10, #8
    66c8:      	str	w15, [x20, #0xe0c]
    66cc:      	b	0x67e4 <.text+0x57e4>
    66d0:      	mov	x0, x20
    66d4:      	bl	0x4588 <.text+0x3588>
    66d8:      	b	0x67e4 <.text+0x57e4>
    66dc:      	mov	x0, x20
    66e0:      	strb	wzr, [x20, #0x18a]
    66e4:      	str	xzr, [x20, #0x190]
    66e8:      	bl	0x410c <.text+0x310c>
    66ec:      	mov	x0, x20
    66f0:      	bl	0x48d8 <.text+0x38d8>
    66f4:      	add	x0, x20, #0x1f0
    66f8:      	bl	0x8864 <.text+0x7864>
    66fc:      	b	0x67e4 <.text+0x57e4>
    6700:      	ldr	x9, [x20, #0x1a8]
    6704:      	add	x8, x9, #0x8
    6708:      	ldr	x10, [x8]
    670c:      	ldr	x23, [x10]
    6710:      	ldr	x11, [x23]
    6714:      	ldrb	w2, [x11, #0x5]
    6718:      	cmp	w2, w21
    671c:      	b.ne	0x678c <.text+0x578c>
    6720:      	mov	x0, x20
    6724:      	bl	0x3f4c <.text+0x2f4c>
    6728:      	mov	x8, x0
    672c:      	tbnz	x8, #0x3f, 0x67ac <.text+0x57ac>
    6730:      	mov	x24, xzr
    6734:      	ldr	x12, [x23]
    6738:      	ldrb	w9, [x12, #0x4]
    673c:      	cmp	x24, x9
    6740:      	b.hs	0x6800 <.text+0x5800>
    6744:      	ldr	x13, [x23, #0x8]
    6748:      	mov	w2, wzr
    674c:      	mov	x0, x20
    6750:      	ldr	x14, [x13, x24, lsl #3]
    6754:      	ldr	x15, [x14]
    6758:      	ldrb	w22, [x15, #0x2]
    675c:      	mov	w1, w22
    6760:      	bl	0x6854 <.text+0x5854>
    6764:      	add	x24, x24, #0x1
    6768:      	tbz	x0, #0x3f, 0x6734 <.text+0x5734>
    676c:      	adrp	x1, 0xf000 <.text+0xe000>
    6770:      	adrp	x2, 0xf000 <.text+0xe000>
    6774:      	add	x1, x1, #0x542
    6778:      	add	x2, x2, #0x508
    677c:      	orr	w0, wzr, #0x80000000
    6780:      	mov	w3, w22
    6784:      	bl	0xac7c <.text+0x9c7c>
    6788:      	b	0x67c8 <.text+0x57c8>
    678c:      	adrp	x1, 0xf000 <.text+0xe000>
    6790:      	adrp	x2, 0xf000 <.text+0xe000>
    6794:      	add	x1, x1, #0x4d9
    6798:      	add	x2, x2, #0x508
    679c:      	orr	w0, wzr, #0x80000000
    67a0:      	mov	w3, w21
    67a4:      	bl	0xac7c <.text+0x9c7c>
    67a8:      	b	0x67c8 <.text+0x57c8>
    67ac:      	adrp	x1, 0xf000 <.text+0xe000>
    67b0:      	adrp	x2, 0xf000 <.text+0xe000>
    67b4:      	add	x1, x1, #0x51e
    67b8:      	add	x2, x2, #0x508
    67bc:      	orr	w0, wzr, #0x80000000
    67c0:      	mov	x3, x8
    67c4:      	bl	0xac7c <.text+0x9c7c>
    67c8:      	ldrb	w3, [x19, #0x2]
    67cc:      	adrp	x1, 0xf000 <.text+0xe000>
    67d0:      	adrp	x2, 0xf000 <.text+0xe000>
    67d4:      	add	x1, x1, #0x4b5
    67d8:      	add	x2, x2, #0x49a
    67dc:      	orr	w0, wzr, #0x80000000
    67e0:      	bl	0xac7c <.text+0x9c7c>
    67e4:      	mov	x0, x20
    67e8:      	mov	x1, x19
    67ec:      	ldp	x29, x30, [sp, #0x30]
    67f0:      	ldp	x20, x19, [sp, #0x20]
    67f4:      	ldp	x22, x21, [sp, #0x10]
    67f8:      	ldp	x24, x23, [sp], #0x40
    67fc:      	b	0x1ca4 <.text+0xca4>
    6800:      	ldr	w15, [x20, #0x184]
    6804:      	strb	w21, [x20, #0x18a]
    6808:      	cmp	w15, #0x4
    680c:      	strb	wzr, [x20, #0x182]
    6810:      	b.ne	0x6834 <.text+0x5834>
    6814:      	ldr	x16, [x20, #0x1b0]
    6818:      	ldr	x17, [x16, #0x8]
    681c:      	ldr	x0, [x17]
    6820:      	ldr	x1, [x0]
    6824:      	ldrb	w11, [x1, #0x8]
    6828:      	lsl	x12, x11, #3
    682c:      	str	x12, [x20, #0x190]
    6830:      	b	0x67e4 <.text+0x57e4>
    6834:      	ldr	x4, [x20, #0x1a8]
    6838:      	ldr	x5, [x4, #0x8]
    683c:      	ldr	x6, [x5]
    6840:      	ldr	x7, [x6]
    6844:      	ldrb	w13, [x7, #0x8]
    6848:      	lsl	x14, x13, #1
    684c:      	str	x14, [x20, #0x190]
    6850:      	b	0x67e4 <.text+0x57e4>
    6854:      	stp	x26, x25, [sp, #-0x50]!
    6858:      	stp	x24, x23, [sp, #0x10]
    685c:      	stp	x22, x21, [sp, #0x20]
    6860:      	stp	x20, x19, [sp, #0x30]
    6864:      	stp	x29, x30, [sp, #0x40]
    6868:      	add	x29, sp, #0x40
    686c:      	mov	x19, x0
    6870:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    6874:      	movk	x0, #0xe
    6878:      	ldr	w8, [x19, #0x184]
    687c:      	cmp	w8, #0x4
    6880:      	b.ne	0x6948 <.text+0x5948>
    6884:      	ldr	x14, [x19, #0x1b0]
    6888:      	mov	x10, xzr
    688c:      	ldr	x15, [x14, #0x8]
    6890:      	ldr	x8, [x15]
    6894:      	ldr	x16, [x8]
    6898:      	ldrb	w9, [x16, #0x4]
    689c:      	b	0x68a4 <.text+0x58a4>
    68a0:      	add	x10, x10, #0x1
    68a4:      	cmp	x10, x9
    68a8:      	b.hs	0x6a08 <.text+0x5a08>
    68ac:      	ldr	x17, [x8, #0x8]
    68b0:      	ldr	x20, [x17, x10, lsl #3]
    68b4:      	ldr	x12, [x20]
    68b8:      	ldrb	w11, [x12, #0x2]
    68bc:      	cmp	w11, w1, uxtb
    68c0:      	b.ne	0x68a0 <.text+0x58a0>
    68c4:      	ldrb	w13, [x12, #0x3]
    68c8:      	cmp	w13, w2, uxtb
    68cc:      	b.ne	0x68a0 <.text+0x58a0>
    68d0:      	ldrb	w23, [x12, #0x4]
    68d4:      	adrp	x25, 0xd000 <.text+0xc000>
    68d8:      	mov	x21, xzr
    68dc:      	mov	x22, xzr
    68e0:      	mov	w24, #0x28              // =40
    68e4:      	add	x25, x25, #0xcb8
    68e8:      	b	0x693c <.text+0x593c>
    68ec:      	ldr	x0, [x20, #0x8]
    68f0:      	ldr	x1, [x0, x21]
    68f4:      	mov	x0, x19
    68f8:      	ldp	x2, x3, [x1]
    68fc:      	ldr	w13, [x19, #0x184]
    6900:      	ldrb	w12, [x2, #0x3]
    6904:      	ldrb	w9, [x2, #0x2]
    6908:      	lsl	x14, x13, #3
    690c:      	ldrb	w7, [x2, #0x6]
    6910:      	ldrb	w6, [x3, #0x2]
    6914:      	and	x4, x12, #0x3
    6918:      	and	w1, w9, #0xf
    691c:      	madd	x5, x4, x24, x25
    6920:      	and	w3, w12, #0x3
    6924:      	lsr	w2, w9, #7
    6928:      	ldrh	w4, [x5, x14]
    692c:      	mov	w5, wzr
    6930:      	bl	0x4198 <.text+0x3198>
    6934:      	add	x22, x22, #0x1
    6938:      	add	x21, x21, #0x8
    693c:      	cmp	x22, x23
    6940:      	b.ne	0x68ec <.text+0x58ec>
    6944:      	b	0x6a04 <.text+0x5a04>
    6948:      	ldr	x6, [x19, #0x1a8]
    694c:      	mov	x11, xzr
    6950:      	ldr	x7, [x6, #0x8]
    6954:      	ldr	x9, [x7]
    6958:      	ldr	x20, [x9]
    695c:      	ldrb	w8, [x20, #0x4]
    6960:      	b	0x6968 <.text+0x5968>
    6964:      	add	x11, x11, #0x1
    6968:      	cmp	x11, x8
    696c:      	b.hs	0x6a08 <.text+0x5a08>
    6970:      	ldr	x21, [x9, #0x8]
    6974:      	ldr	x20, [x21, x11, lsl #3]
    6978:      	ldr	x13, [x20]
    697c:      	ldrb	w10, [x13, #0x2]
    6980:      	cmp	w10, w1, uxtb
    6984:      	b.ne	0x6964 <.text+0x5964>
    6988:      	ldrb	w12, [x13, #0x3]
    698c:      	cmp	w12, w2, uxtb
    6990:      	b.ne	0x6964 <.text+0x5964>
    6994:      	ldrb	w23, [x13, #0x4]
    6998:      	adrp	x25, 0xd000 <.text+0xc000>
    699c:      	mov	x21, xzr
    69a0:      	mov	x22, xzr
    69a4:      	mov	w24, #0x28              // =40
    69a8:      	add	x25, x25, #0xcb8
    69ac:      	b	0x69fc <.text+0x59fc>
    69b0:      	ldr	x8, [x20, #0x8]
    69b4:      	mov	w5, wzr
    69b8:      	ldr	w1, [x19, #0x184]
    69bc:      	mov	w6, wzr
    69c0:      	mov	x0, x19
    69c4:      	ldr	x9, [x8, x21]
    69c8:      	lsl	x2, x1, #3
    69cc:      	ldrb	w17, [x9, #0x3]
    69d0:      	ldrb	w14, [x9, #0x2]
    69d4:      	ldrb	w7, [x9, #0x6]
    69d8:      	and	x10, x17, #0x3
    69dc:      	and	w1, w14, #0xf
    69e0:      	madd	x11, x10, x24, x25
    69e4:      	and	w3, w17, #0x3
    69e8:      	ldrh	w4, [x11, x2]
    69ec:      	lsr	w2, w14, #7
    69f0:      	bl	0x4198 <.text+0x3198>
    69f4:      	add	x22, x22, #0x1
    69f8:      	add	x21, x21, #0x8
    69fc:      	cmp	x22, x23
    6a00:      	b.ne	0x69b0 <.text+0x59b0>
    6a04:      	mov	x0, xzr
    6a08:      	ldp	x29, x30, [sp, #0x40]
    6a0c:      	ldp	x20, x19, [sp, #0x30]
    6a10:      	ldp	x22, x21, [sp, #0x20]
    6a14:      	ldp	x24, x23, [sp, #0x10]
    6a18:      	ldp	x26, x25, [sp], #0x50
    6a1c:      	ret
    6a20:      	stp	x29, x30, [sp, #-0x10]!
    6a24:      	mov	x29, sp
    6a28:      	cbz	x0, 0x6a68 <.text+0x5a68>
    6a2c:      	adrp	x9, 0x13000
    6a30:      	add	x9, x9, #0x190
    6a34:      	orr	w10, wzr, #0x1
    6a38:      	ldr	x8, [x9, #0x10]
    6a3c:      	str	x0, [x9, #0x248]
    6a40:      	strb	wzr, [x9, #0x250]
    6a44:      	str	w10, [x9, #0x254]
    6a48:      	str	wzr, [x9, #0x240]
    6a4c:      	cbz	x8, 0x6a60 <.text+0x5a60>
    6a50:      	adrp	x0, 0x13000
    6a54:      	mov	w1, #0x9                // =9
    6a58:      	add	x0, x0, #0x190
    6a5c:      	blr	x8
    6a60:      	mov	x0, xzr
    6a64:      	b	0x6a88 <.text+0x5a88>
    6a68:      	adrp	x1, 0xf000 <.text+0xe000>
    6a6c:      	adrp	x2, 0xf000 <.text+0xe000>
    6a70:      	add	x1, x1, #0xce7
    6a74:      	add	x2, x2, #0x613
    6a78:      	orr	w0, wzr, #0x80000000
    6a7c:      	bl	0xac7c <.text+0x9c7c>
    6a80:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    6a84:      	movk	x0, #0x2
    6a88:      	ldp	x29, x30, [sp], #0x10
    6a8c:      	ret
    6a90:      	mov	x8, x0
    6a94:      	cbz	x8, 0x6ac8 <.text+0x5ac8>
    6a98:      	ldr	w9, [x8]
    6a9c:      	tbnz	w9, #0x0, 0x6af8 <.text+0x5af8>
    6aa0:      	ubfx	w9, w9, #6, #4
    6aa4:      	cmp	w9, #0x1
    6aa8:      	b.eq	0x6b20 <.text+0x5b20>
    6aac:      	cmp	w9, #0x7
    6ab0:      	b.eq	0x6b28 <.text+0x5b28>
    6ab4:      	mov	x0, xzr
    6ab8:      	cmp	w9, #0x3
    6abc:      	b.ne	0x6b14 <.text+0x5b14>
    6ac0:      	orr	w0, wzr, #0x1
    6ac4:      	b	0x6b2c <.text+0x5b2c>
    6ac8:      	stp	x29, x30, [sp, #-0x10]!
    6acc:      	mov	x29, sp
    6ad0:      	adrp	x1, 0xf000 <.text+0xe000>
    6ad4:      	adrp	x2, 0xf000 <.text+0xe000>
    6ad8:      	add	x1, x1, #0xce7
    6adc:      	add	x2, x2, #0x621
    6ae0:      	orr	w0, wzr, #0x80000000
    6ae4:      	bl	0xac7c <.text+0x9c7c>
    6ae8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    6aec:      	movk	x0, #0x2
    6af0:      	ldp	x29, x30, [sp], #0x10
    6af4:      	b	0x6b14 <.text+0x5b14>
    6af8:      	ubfx	w10, w9, #8, #4
    6afc:      	cbz	w10, 0x6b18 <.text+0x5b18>
    6b00:      	mov	x0, xzr
    6b04:      	cmp	w10, #0x1
    6b08:      	b.ne	0x6b14 <.text+0x5b14>
    6b0c:      	orr	w0, wzr, #0x2
    6b10:      	b	0x6b2c <.text+0x5b2c>
    6b14:      	ret
    6b18:      	orr	w0, wzr, #0x3
    6b1c:      	b	0x6b2c <.text+0x5b2c>
    6b20:      	mov	w0, wzr
    6b24:      	b	0x6b2c <.text+0x5b2c>
    6b28:      	orr	w0, wzr, #0x4
    6b2c:      	mov	x1, x8
    6b30:      	b	0x6b34 <.text+0x5b34>
    6b34:      	stp	x22, x21, [sp, #-0x30]!
    6b38:      	stp	x20, x19, [sp, #0x10]
    6b3c:      	stp	x29, x30, [sp, #0x20]
    6b40:      	add	x29, sp, #0x20
    6b44:      	mov	x20, x1
    6b48:      	mov	w21, w0
    6b4c:      	cmp	w21, #0x6
    6b50:      	b.lo	0x6b6c <.text+0x5b6c>
    6b54:      	adrp	x1, 0xf000 <.text+0xe000>
    6b58:      	adrp	x2, 0xf000 <.text+0xe000>
    6b5c:      	add	x1, x1, #0x6ad
    6b60:      	add	x2, x2, #0x6c8
    6b64:      	orr	w0, wzr, #0x80000000
    6b68:      	bl	0xac7c <.text+0x9c7c>
    6b6c:      	adrp	x8, 0x13000
    6b70:      	add	x8, x8, #0x190
    6b74:      	ldr	w19, [x8, #0x240]
    6b78:      	cmp	w19, #0x8
    6b7c:      	b.lo	0x6ba0 <.text+0x5ba0>
    6b80:      	adrp	x1, 0xf000 <.text+0xe000>
    6b84:      	add	x1, x1, #0x6de
    6b88:      	adrp	x2, 0xf000 <.text+0xe000>
    6b8c:      	add	x2, x2, #0x6c8
    6b90:      	orr	w0, wzr, #0x80000000
    6b94:      	bl	0xac7c <.text+0x9c7c>
    6b98:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    6b9c:      	b	0x6c14 <.text+0x5c14>
    6ba0:      	mov	w10, #0x48              // =72
    6ba4:      	madd	x9, x19, x10, x8
    6ba8:      	add	x8, x9, w21, uxtw #3
    6bac:      	ldr	x8, [x8, #0x18]
    6bb0:      	cbz	x8, 0x6c10 <.text+0x5c10>
    6bb4:      	adrp	x21, 0x13000
    6bb8:      	add	x21, x21, #0x190
    6bbc:      	mov	x0, x21
    6bc0:      	mov	x1, x20
    6bc4:      	blr	x8
    6bc8:      	cmp	w0, w19
    6bcc:      	ccmp	w0, #0xa, #0x4, ne
    6bd0:      	b.eq	0x6c10 <.text+0x5c10>
    6bd4:      	cmp	w0, #0x8
    6bd8:      	b.lo	0x6be8 <.text+0x5be8>
    6bdc:      	adrp	x1, 0xf000 <.text+0xe000>
    6be0:      	add	x1, x1, #0x6fa
    6be4:      	b	0x6b88 <.text+0x5b88>
    6be8:      	mov	w11, w0
    6bec:      	str	w0, [x21, #0x240]
    6bf0:      	mov	w12, #0x48              // =72
    6bf4:      	madd	x10, x11, x12, x21
    6bf8:      	ldr	x9, [x10, #0x10]
    6bfc:      	cbz	x9, 0x6c10 <.text+0x5c10>
    6c00:      	adrp	x0, 0x13000
    6c04:      	add	x0, x0, #0x190
    6c08:      	mov	w1, w19
    6c0c:      	blr	x9
    6c10:      	mov	x0, xzr
    6c14:      	ldp	x29, x30, [sp, #0x20]
    6c18:      	ldp	x20, x19, [sp, #0x10]
    6c1c:      	ldp	x22, x21, [sp], #0x30
    6c20:      	ret
    6c24:      	mov	x1, xzr
    6c28:      	mov	w0, #0x5                // =5
    6c2c:      	b	0x6b34 <.text+0x5b34>
    6c30:      	adrp	x8, 0x13000
    6c34:      	add	x8, x8, #0x190
    6c38:      	ldr	w0, [x8, #0x240]
    6c3c:      	ret
    6c40:      	cmp	w0, #0x7
    6c44:      	b.ls	0x6c50 <.text+0x5c50>
    6c48:      	mov	x0, xzr
    6c4c:      	ret
    6c50:      	mov	w8, w0
    6c54:      	mov	w9, #0x48               // =72
    6c58:      	mul	x10, x8, x9
    6c5c:      	adrp	x8, 0x13000
    6c60:      	add	x8, x8, #0x190
    6c64:      	ldr	x0, [x8, x10]
    6c68:      	ret
    6c6c:      	stp	x22, x21, [sp, #-0x30]!
    6c70:      	stp	x20, x19, [sp, #0x10]
    6c74:      	stp	x29, x30, [sp, #0x20]
    6c78:      	add	x29, sp, #0x20
    6c7c:      	mov	w20, w1
    6c80:      	mov	x21, x0
    6c84:      	cbz	x21, 0x6cd8 <.text+0x5cd8>
    6c88:      	ldr	x0, [x21, #0x248]
    6c8c:      	mov	w1, wzr
    6c90:      	mov	w2, w20
    6c94:      	bl	0x51e8 <.text+0x41e8>
    6c98:      	mov	x19, x0
    6c9c:      	tbnz	x19, #0x3f, 0x6d14 <.text+0x5d14>
    6ca0:      	ldr	x8, [x21, #0x248]
    6ca4:      	mov	w10, #0xc80c            // =51212
    6ca8:      	mov	w3, #0x70000            // =458752
    6cac:      	movk	w3, #0xa120
    6cb0:      	orr	w1, wzr, #0x400
    6cb4:      	ldr	w8, [x8, #0x1e0]
    6cb8:      	mov	w2, wzr
    6cbc:      	add	w9, w8, w20, lsl #4
    6cc0:      	add	w0, w9, w10
    6cc4:      	bl	0xa6d4 <.text+0x96d4>
    6cc8:      	tbz	w0, #0x1f, 0x6d2c <.text+0x5d2c>
    6ccc:      	adrp	x1, 0xf000 <.text+0xe000>
    6cd0:      	add	x1, x1, #0x7fa
    6cd4:      	b	0x6d1c <.text+0x5d1c>
    6cd8:      	adrp	x1, 0xf000 <.text+0xe000>
    6cdc:      	adrp	x2, 0xf000 <.text+0xe000>
    6ce0:      	mov	w19, #0x2c              // =44
    6ce4:      	add	x1, x1, #0x730
    6ce8:      	add	x2, x2, #0x743
    6cec:      	orr	w0, wzr, #0x80000000
    6cf0:      	mov	w3, w19
    6cf4:      	bl	0xac7c <.text+0x9c7c>
    6cf8:      	adrp	x0, 0xf000 <.text+0xe000>
    6cfc:      	adrp	x2, 0x11000 <.text+0x10000>
    6d00:      	add	x0, x0, #0x7af
    6d04:      	add	x2, x2, #0xe70
    6d08:      	mov	x1, x19
    6d0c:      	bl	0xb008 <.text+0xa008>
    6d10:      	b	0x6d10 <.text+0x5d10>
    6d14:      	adrp	x1, 0xf000 <.text+0xe000>
    6d18:      	add	x1, x1, #0x7c1
    6d1c:      	adrp	x2, 0xf000 <.text+0xe000>
    6d20:      	add	x2, x2, #0x7e5
    6d24:      	orr	w0, wzr, #0x80000000
    6d28:      	bl	0xac7c <.text+0x9c7c>
    6d2c:      	mov	x0, x19
    6d30:      	ldp	x29, x30, [sp, #0x20]
    6d34:      	ldp	x20, x19, [sp, #0x10]
    6d38:      	ldp	x22, x21, [sp], #0x30
    6d3c:      	ret
    6d40:      	mov	w0, #0xa                // =10
    6d44:      	ret
    6d48:      	stp	x20, x19, [sp, #-0x20]!
    6d4c:      	stp	x29, x30, [sp, #0x10]
    6d50:      	add	x29, sp, #0x10
    6d54:      	mov	x19, x0
    6d58:      	cbz	x19, 0x6dbc <.text+0x5dbc>
    6d5c:      	cbz	x1, 0x6dbc <.text+0x5dbc>
    6d60:      	ldr	x0, [x19, #0x248]
    6d64:      	mov	w1, wzr
    6d68:      	mov	w2, wzr
    6d6c:      	orr	w3, wzr, #0x1
    6d70:      	bl	0x5468 <.text+0x4468>
    6d74:      	tbnz	x0, #0x3f, 0x6df8 <.text+0x5df8>
    6d78:      	ldr	x8, [x19, #0x248]
    6d7c:      	mov	w9, #0xc80c             // =51212
    6d80:      	mov	w3, #0x70000            // =458752
    6d84:      	movk	w3, #0xa120
    6d88:      	orr	w1, wzr, #0x400
    6d8c:      	ldr	w8, [x8, #0x1e0]
    6d90:      	mov	w2, wzr
    6d94:      	add	w0, w8, w9
    6d98:      	bl	0xa6d4 <.text+0x96d4>
    6d9c:      	tbz	w0, #0x1f, 0x6e1c <.text+0x5e1c>
    6da0:      	adrp	x1, 0xf000 <.text+0xe000>
    6da4:      	adrp	x2, 0xf000 <.text+0xe000>
    6da8:      	add	x1, x1, #0x7fa
    6dac:      	add	x2, x2, #0x875
    6db0:      	orr	w0, wzr, #0x80000000
    6db4:      	bl	0xac7c <.text+0x9c7c>
    6db8:      	b	0x6e1c <.text+0x5e1c>
    6dbc:      	adrp	x1, 0xf000 <.text+0xe000>
    6dc0:      	adrp	x2, 0xf000 <.text+0xe000>
    6dc4:      	mov	w19, #0x65              // =101
    6dc8:      	add	x1, x1, #0x827
    6dcc:      	add	x2, x2, #0x743
    6dd0:      	orr	w0, wzr, #0x80000000
    6dd4:      	mov	w3, w19
    6dd8:      	bl	0xac7c <.text+0x9c7c>
    6ddc:      	adrp	x0, 0xf000 <.text+0xe000>
    6de0:      	adrp	x2, 0x11000 <.text+0x10000>
    6de4:      	add	x0, x0, #0x7af
    6de8:      	add	x2, x2, #0xe70
    6dec:      	mov	x1, x19
    6df0:      	bl	0xb008 <.text+0xa008>
    6df4:      	b	0x6df4 <.text+0x5df4>
    6df8:      	ldr	w0, [x19, #0x240]
    6dfc:      	bl	0x6c40 <.text+0x5c40>
    6e00:      	adrp	x1, 0xf000 <.text+0xe000>
    6e04:      	adrp	x2, 0xf000 <.text+0xe000>
    6e08:      	mov	x3, x0
    6e0c:      	add	x1, x1, #0x843
    6e10:      	add	x2, x2, #0x875
    6e14:      	orr	w0, wzr, #0x80000000
    6e18:      	bl	0xac7c <.text+0x9c7c>
    6e1c:      	ldp	x29, x30, [sp, #0x10]
    6e20:      	mov	w0, wzr
    6e24:      	ldp	x20, x19, [sp], #0x20
    6e28:      	ret
    6e2c:      	mov	w0, wzr
    6e30:      	ret
    6e34:      	orr	w0, wzr, #0x6
    6e38:      	ret
    6e3c:      	stp	x20, x19, [sp, #-0x20]!
    6e40:      	stp	x29, x30, [sp, #0x10]
    6e44:      	add	x29, sp, #0x10
    6e48:      	sub	sp, sp, #0x10
    6e4c:      	mov	x19, x0
    6e50:      	str	xzr, [sp, #0x8]
    6e54:      	cbz	x19, 0x6f7c <.text+0x5f7c>
    6e58:      	ldr	x20, [x19, #0x248]
    6e5c:      	add	x0, x20, #0x7b8
    6e60:      	bl	0xb94c <.text+0xa94c>
    6e64:      	and	w8, w0, #0xff
    6e68:      	cbz	w8, 0x6fc4 <.text+0x5fc4>
    6e6c:      	ldr	x0, [x19, #0x248]
    6e70:      	add	x1, sp, #0x8
    6e74:      	bl	0x5368 <.text+0x4368>
    6e78:      	ldr	x8, [sp, #0x8]
    6e7c:      	cbz	x8, 0x6fb8 <.text+0x5fb8>
    6e80:      	ldr	x9, [x8, #0x450]
    6e84:      	cbz	x9, 0x6fb8 <.text+0x5fb8>
    6e88:      	orr	w10, wzr, #0x8
    6e8c:      	add	x20, x20, #0x1f0
    6e90:      	mov	w2, wzr
    6e94:      	str	w10, [x8, #0x448]
    6e98:      	orr	w8, wzr, #0x1
    6e9c:      	ldr	x9, [sp, #0x8]
    6ea0:      	mov	w3, wzr
    6ea4:      	orr	w4, wzr, #0x2
    6ea8:      	mov	x0, x20
    6eac:      	mov	w5, wzr
    6eb0:      	ldr	x11, [x9, #0x450]
    6eb4:      	mov	w7, wzr
    6eb8:      	str	x8, [x11]
    6ebc:      	ldr	x12, [sp, #0x8]
    6ec0:      	ldr	x13, [x12, #0x450]
    6ec4:      	str	x10, [x13, #0x18]
    6ec8:      	ldr	x10, [x19, #0x248]
    6ecc:      	ldr	x14, [sp, #0x8]
    6ed0:      	ldr	x11, [x10, #0xdd0]
    6ed4:      	ldr	x15, [x14, #0x450]
    6ed8:      	str	x11, [x15, #0x10]
    6edc:      	ldr	x16, [sp, #0x8]
    6ee0:      	ldr	w6, [x16, #0x448]
    6ee4:      	add	x1, x16, #0x10
    6ee8:      	bl	0x928c <.text+0x828c>
    6eec:      	mov	w8, w0
    6ef0:      	tbnz	w8, #0x1f, 0x6fec <.text+0x5fec>
    6ef4:      	ldr	x17, [sp, #0x8]
    6ef8:      	mov	x0, x20
    6efc:      	ldr	x2, [x17, #0x450]
    6f00:      	add	x1, x17, #0x10
    6f04:      	bl	0x93c8 <.text+0x83c8>
    6f08:      	mov	w9, w0
    6f0c:      	tbnz	w9, #0x1f, 0x700c <.text+0x600c>
    6f10:      	ldr	x0, [sp, #0x8]
    6f14:      	add	x1, x0, #0x10
    6f18:      	mov	x0, x20
    6f1c:      	bl	0x9af8 <.text+0x8af8>
    6f20:      	mov	w10, w0
    6f24:      	tbnz	w10, #0x1f, 0x702c <.text+0x602c>
    6f28:      	ldr	x1, [x19, #0x248]
    6f2c:      	mov	w12, #0xc80c            // =51212
    6f30:      	mov	w3, #0x70000            // =458752
    6f34:      	movk	w3, #0xa120
    6f38:      	mov	w2, wzr
    6f3c:      	ldr	w11, [x1, #0x1e0]
    6f40:      	orr	w1, wzr, #0x400
    6f44:      	add	w0, w11, w12
    6f48:      	bl	0xa6d4 <.text+0x96d4>
    6f4c:      	tbz	w0, #0x1f, 0x6f68 <.text+0x5f68>
    6f50:      	adrp	x1, 0xf000 <.text+0xe000>
    6f54:      	adrp	x2, 0xf000 <.text+0xe000>
    6f58:      	add	x1, x1, #0x7fa
    6f5c:      	add	x2, x2, #0x885
    6f60:      	orr	w0, wzr, #0x80000000
    6f64:      	bl	0xac7c <.text+0x9c7c>
    6f68:      	ldr	x2, [x19, #0x248]
    6f6c:      	ldr	x1, [sp, #0x8]
    6f70:      	add	x0, x2, #0x7b8
    6f74:      	bl	0xb898 <.text+0xa898>
    6f78:      	b	0x6fdc <.text+0x5fdc>
    6f7c:      	adrp	x1, 0xf000 <.text+0xe000>
    6f80:      	adrp	x2, 0xf000 <.text+0xe000>
    6f84:      	mov	w19, #0xab              // =171
    6f88:      	add	x1, x1, #0x730
    6f8c:      	add	x2, x2, #0x743
    6f90:      	orr	w0, wzr, #0x80000000
    6f94:      	mov	w3, w19
    6f98:      	bl	0xac7c <.text+0x9c7c>
    6f9c:      	adrp	x0, 0xf000 <.text+0xe000>
    6fa0:      	adrp	x2, 0x11000 <.text+0x10000>
    6fa4:      	add	x0, x0, #0x7af
    6fa8:      	add	x2, x2, #0xe70
    6fac:      	mov	x1, x19
    6fb0:      	bl	0xb008 <.text+0xa008>
    6fb4:      	b	0x6fb4 <.text+0x5fb4>
    6fb8:      	adrp	x1, 0xf000 <.text+0xe000>
    6fbc:      	add	x1, x1, #0x278
    6fc0:      	b	0x6fcc <.text+0x5fcc>
    6fc4:      	adrp	x1, 0xe000 <.text+0xd000>
    6fc8:      	add	x1, x1, #0xee3
    6fcc:      	adrp	x2, 0xf000 <.text+0xe000>
    6fd0:      	add	x2, x2, #0x885
    6fd4:      	orr	w0, wzr, #0x80000000
    6fd8:      	bl	0xac7c <.text+0x9c7c>
    6fdc:      	sub	sp, x29, #0x10
    6fe0:      	ldp	x29, x30, [sp, #0x10]
    6fe4:      	ldp	x20, x19, [sp], #0x20
    6fe8:      	ret
    6fec:      	adrp	x1, 0xf000 <.text+0xe000>
    6ff0:      	adrp	x2, 0xf000 <.text+0xe000>
    6ff4:      	add	x1, x1, #0x1fd
    6ff8:      	add	x2, x2, #0x885
    6ffc:      	orr	w0, wzr, #0x80000000
    7000:      	mov	w3, w8
    7004:      	bl	0xac7c <.text+0x9c7c>
    7008:      	b	0x6fdc <.text+0x5fdc>
    700c:      	adrp	x1, 0xf000 <.text+0xe000>
    7010:      	adrp	x2, 0xf000 <.text+0xe000>
    7014:      	add	x1, x1, #0x21c
    7018:      	add	x2, x2, #0x885
    701c:      	orr	w0, wzr, #0x80000000
    7020:      	mov	w3, w9
    7024:      	bl	0xac7c <.text+0x9c7c>
    7028:      	b	0x6fdc <.text+0x5fdc>
    702c:      	adrp	x1, 0xf000 <.text+0xe000>
    7030:      	adrp	x2, 0xf000 <.text+0xe000>
    7034:      	add	x1, x1, #0x23a
    7038:      	add	x2, x2, #0x885
    703c:      	orr	w0, wzr, #0x80000000
    7040:      	mov	w3, w10
    7044:      	bl	0xac7c <.text+0x9c7c>
    7048:      	b	0x6fdc <.text+0x5fdc>
    704c:      	stp	x20, x19, [sp, #-0x20]!
    7050:      	stp	x29, x30, [sp, #0x10]
    7054:      	add	x29, sp, #0x10
    7058:      	sub	sp, sp, #0x10
    705c:      	mov	x19, x0
    7060:      	str	xzr, [sp, #0x8]
    7064:      	cbz	x19, 0x710c <.text+0x610c>
    7068:      	cbz	x1, 0x710c <.text+0x610c>
    706c:      	ldrb	w8, [x1]
    7070:      	tbnz	w8, #0x0, 0x7148 <.text+0x6148>
    7074:      	ldr	x0, [x19, #0x248]
    7078:      	mov	w1, wzr
    707c:      	mov	w2, wzr
    7080:      	add	x3, sp, #0x8
    7084:      	bl	0x540c <.text+0x440c>
    7088:      	ldr	x9, [x19, #0x248]
    708c:      	add	x0, x9, #0x7b8
    7090:      	bl	0xb94c <.text+0xa94c>
    7094:      	and	w8, w0, #0xff
    7098:      	cbz	w8, 0x71b0 <.text+0x61b0>
    709c:      	ldr	x8, [sp, #0x8]
    70a0:      	cbz	x8, 0x7184 <.text+0x6184>
    70a4:      	ldr	w9, [x8, #0x20]
    70a8:      	cmp	w9, #0x8
    70ac:      	b.ne	0x7184 <.text+0x6184>
    70b0:      	ldr	x10, [x8, #0x40]
    70b4:      	ldr	x0, [x19, #0x248]
    70b8:      	ldr	x8, [x10, #0x10]
    70bc:      	ldr	x1, [x0, #0xdd0]
    70c0:      	cmp	x8, x1
    70c4:      	b.ne	0x7184 <.text+0x6184>
    70c8:      	add	x2, x19, #0x250
    70cc:      	add	x3, x19, #0x254
    70d0:      	bl	0x651c <.text+0x551c>
    70d4:      	ldr	x11, [x19, #0x248]
    70d8:      	ldr	x1, [sp, #0x8]
    70dc:      	add	x0, x11, #0x9b8
    70e0:      	bl	0xb898 <.text+0xa898>
    70e4:      	ldr	x12, [x19, #0x248]
    70e8:      	ldr	w10, [x12, #0x9c8]
    70ec:      	add	w11, w10, #0x1
    70f0:      	orr	w10, wzr, #0x1
    70f4:      	str	w11, [x12, #0x9c8]
    70f8:      	ldrb	w12, [x19, #0x250]
    70fc:      	cmp	w12, #0x0
    7100:      	orr	w12, wzr, #0x3
    7104:      	csel	w0, w12, w10, ne
    7108:      	b	0x71a0 <.text+0x61a0>
    710c:      	adrp	x1, 0xf000 <.text+0xe000>
    7110:      	adrp	x2, 0xf000 <.text+0xe000>
    7114:      	mov	w19, #0xf6              // =246
    7118:      	add	x1, x1, #0x827
    711c:      	add	x2, x2, #0x743
    7120:      	orr	w0, wzr, #0x80000000
    7124:      	mov	w3, w19
    7128:      	bl	0xac7c <.text+0x9c7c>
    712c:      	adrp	x0, 0xf000 <.text+0xe000>
    7130:      	adrp	x2, 0x11000 <.text+0x10000>
    7134:      	add	x0, x0, #0x7af
    7138:      	add	x2, x2, #0xe70
    713c:      	mov	x1, x19
    7140:      	bl	0xb008 <.text+0xa008>
    7144:      	b	0x7144 <.text+0x6144>
    7148:      	adrp	x1, 0xf000 <.text+0xe000>
    714c:      	adrp	x2, 0xf000 <.text+0xe000>
    7150:      	mov	w19, #0xf7              // =247
    7154:      	add	x1, x1, #0x899
    7158:      	add	x2, x2, #0x743
    715c:      	orr	w0, wzr, #0x80000000
    7160:      	mov	w3, w19
    7164:      	bl	0xac7c <.text+0x9c7c>
    7168:      	adrp	x0, 0xf000 <.text+0xe000>
    716c:      	adrp	x2, 0x11000 <.text+0x10000>
    7170:      	add	x0, x0, #0x7af
    7174:      	add	x2, x2, #0xe70
    7178:      	mov	x1, x19
    717c:      	bl	0xb008 <.text+0xa008>
    7180:      	b	0x7180 <.text+0x6180>
    7184:      	adrp	x1, 0xf000 <.text+0xe000>
    7188:      	adrp	x2, 0xf000 <.text+0xe000>
    718c:      	add	x1, x1, #0x921
    7190:      	add	x2, x2, #0x950
    7194:      	orr	w0, wzr, #0x80000000
    7198:      	bl	0xac7c <.text+0x9c7c>
    719c:      	orr	w0, wzr, #0x6
    71a0:      	sub	sp, x29, #0x10
    71a4:      	ldp	x29, x30, [sp, #0x10]
    71a8:      	ldp	x20, x19, [sp], #0x20
    71ac:      	ret
    71b0:      	adrp	x1, 0xf000 <.text+0xe000>
    71b4:      	adrp	x2, 0xf000 <.text+0xe000>
    71b8:      	add	x1, x1, #0x8c7
    71bc:      	add	x2, x2, #0x743
    71c0:      	orr	w0, wzr, #0x80000000
    71c4:      	orr	w3, wzr, #0xfc
    71c8:      	bl	0xac7c <.text+0x9c7c>
    71cc:      	adrp	x0, 0xf000 <.text+0xe000>
    71d0:      	adrp	x2, 0x11000 <.text+0x10000>
    71d4:      	add	x0, x0, #0x7af
    71d8:      	add	x2, x2, #0xe70
    71dc:      	orr	w1, wzr, #0xfc
    71e0:      	bl	0xb008 <.text+0xa008>
    71e4:      	b	0x71e4 <.text+0x61e4>
    71e8:      	orr	w0, wzr, #0x6
    71ec:      	ret
    71f0:      	ret
    71f4:      	orr	w0, wzr, #0x6
    71f8:      	ret
    71fc:      	stp	x20, x19, [sp, #-0x20]!
    7200:      	stp	x29, x30, [sp, #0x10]
    7204:      	add	x29, sp, #0x10
    7208:      	cbz	x0, 0x7238 <.text+0x6238>
    720c:      	cbz	x1, 0x7238 <.text+0x6238>
    7210:      	ldr	w8, [x1]
    7214:      	tbnz	w8, #0x0, 0x7274 <.text+0x6274>
    7218:      	and	w8, w8, #0x3000
    721c:      	ldp	x29, x30, [sp, #0x10]
    7220:      	orr	w9, wzr, #0x6
    7224:      	cmp	w8, #0x2, lsl #12       // =0x2000
    7228:      	orr	w11, wzr, #0x2
    722c:      	csel	w0, w11, w9, eq
    7230:      	ldp	x20, x19, [sp], #0x20
    7234:      	ret
    7238:      	adrp	x1, 0xf000 <.text+0xe000>
    723c:      	adrp	x2, 0xf000 <.text+0xe000>
    7240:      	mov	w19, #0x14e             // =334
    7244:      	add	x1, x1, #0x827
    7248:      	add	x2, x2, #0x743
    724c:      	orr	w0, wzr, #0x80000000
    7250:      	mov	w3, w19
    7254:      	bl	0xac7c <.text+0x9c7c>
    7258:      	adrp	x0, 0xf000 <.text+0xe000>
    725c:      	adrp	x2, 0x11000 <.text+0x10000>
    7260:      	add	x0, x0, #0x7af
    7264:      	add	x2, x2, #0xe70
    7268:      	mov	x1, x19
    726c:      	bl	0xb008 <.text+0xa008>
    7270:      	b	0x7270 <.text+0x6270>
    7274:      	adrp	x1, 0xf000 <.text+0xe000>
    7278:      	adrp	x2, 0xf000 <.text+0xe000>
    727c:      	mov	w19, #0x14f             // =335
    7280:      	add	x1, x1, #0x899
    7284:      	add	x2, x2, #0x743
    7288:      	orr	w0, wzr, #0x80000000
    728c:      	mov	w3, w19
    7290:      	bl	0xac7c <.text+0x9c7c>
    7294:      	adrp	x0, 0xf000 <.text+0xe000>
    7298:      	adrp	x2, 0x11000 <.text+0x10000>
    729c:      	add	x0, x0, #0x7af
    72a0:      	add	x2, x2, #0xe70
    72a4:      	mov	x1, x19
    72a8:      	bl	0xb008 <.text+0xa008>
    72ac:      	b	0x72ac <.text+0x62ac>
    72b0:      	stp	x20, x19, [sp, #-0x20]!
    72b4:      	stp	x29, x30, [sp, #0x10]
    72b8:      	add	x29, sp, #0x10
    72bc:      	mov	x19, x0
    72c0:      	cbz	x19, 0x730c <.text+0x630c>
    72c4:      	ldr	x0, [x19, #0x248]
    72c8:      	orr	w2, wzr, #0x1
    72cc:      	orr	w3, wzr, #0x3
    72d0:      	mov	w1, wzr
    72d4:      	bl	0x5a88 <.text+0x4a88>
    72d8:      	ldr	x8, [x19, #0x248]
    72dc:      	mov	w9, #0xc81c             // =51228
    72e0:      	mov	w3, #0x70000            // =458752
    72e4:      	movk	w3, #0xa120
    72e8:      	orr	w1, wzr, #0x400
    72ec:      	ldr	w8, [x8, #0x1e0]
    72f0:      	mov	w2, wzr
    72f4:      	add	w0, w8, w9
    72f8:      	bl	0xa6d4 <.text+0x96d4>
    72fc:      	tbnz	w0, #0x1f, 0x7348 <.text+0x6348>
    7300:      	ldp	x29, x30, [sp, #0x10]
    7304:      	ldp	x20, x19, [sp], #0x20
    7308:      	ret
    730c:      	adrp	x1, 0xf000 <.text+0xe000>
    7310:      	adrp	x2, 0xf000 <.text+0xe000>
    7314:      	mov	w19, #0x16b             // =363
    7318:      	add	x1, x1, #0x730
    731c:      	add	x2, x2, #0x743
    7320:      	orr	w0, wzr, #0x80000000
    7324:      	mov	w3, w19
    7328:      	bl	0xac7c <.text+0x9c7c>
    732c:      	adrp	x0, 0xf000 <.text+0xe000>
    7330:      	adrp	x2, 0x11000 <.text+0x10000>
    7334:      	add	x0, x0, #0x7af
    7338:      	add	x2, x2, #0xe70
    733c:      	mov	x1, x19
    7340:      	bl	0xb008 <.text+0xa008>
    7344:      	b	0x7344 <.text+0x6344>
    7348:      	ldp	x29, x30, [sp, #0x10]
    734c:      	adrp	x1, 0xf000 <.text+0xe000>
    7350:      	adrp	x2, 0xf000 <.text+0xe000>
    7354:      	add	x1, x1, #0x7fa
    7358:      	add	x2, x2, #0x96b
    735c:      	orr	w0, wzr, #0x80000000
    7360:      	ldp	x20, x19, [sp], #0x20
    7364:      	b	0xac7c <.text+0x9c7c>
    7368:      	stp	x20, x19, [sp, #-0x20]!
    736c:      	stp	x29, x30, [sp, #0x10]
    7370:      	add	x29, sp, #0x10
    7374:      	cbz	x0, 0x73cc <.text+0x63cc>
    7378:      	cbz	x1, 0x73cc <.text+0x63cc>
    737c:      	ldr	w8, [x1]
    7380:      	tbnz	w8, #0x0, 0x7408 <.text+0x6408>
    7384:      	ldr	x0, [x0, #0x248]
    7388:      	ubfx	w9, w8, #1, #5
    738c:      	ubfx	w2, w8, #1, #1
    7390:      	sub	w10, w9, w2
    7394:      	mov	w3, wzr
    7398:      	lsr	w1, w10, #1
    739c:      	bl	0x57b8 <.text+0x47b8>
    73a0:      	tbz	x0, #0x3f, 0x73bc <.text+0x63bc>
    73a4:      	adrp	x1, 0xf000 <.text+0xe000>
    73a8:      	adrp	x2, 0xf000 <.text+0xe000>
    73ac:      	add	x1, x1, #0x981
    73b0:      	add	x2, x2, #0x9b3
    73b4:      	orr	w0, wzr, #0x80000000
    73b8:      	bl	0xac7c <.text+0x9c7c>
    73bc:      	ldp	x29, x30, [sp, #0x10]
    73c0:      	mov	w0, wzr
    73c4:      	ldp	x20, x19, [sp], #0x20
    73c8:      	ret
    73cc:      	adrp	x1, 0xf000 <.text+0xe000>
    73d0:      	adrp	x2, 0xf000 <.text+0xe000>
    73d4:      	mov	w19, #0x188             // =392
    73d8:      	add	x1, x1, #0x827
    73dc:      	add	x2, x2, #0x743
    73e0:      	orr	w0, wzr, #0x80000000
    73e4:      	mov	w3, w19
    73e8:      	bl	0xac7c <.text+0x9c7c>
    73ec:      	adrp	x0, 0xf000 <.text+0xe000>
    73f0:      	adrp	x2, 0x11000 <.text+0x10000>
    73f4:      	add	x0, x0, #0x7af
    73f8:      	add	x2, x2, #0xe70
    73fc:      	mov	x1, x19
    7400:      	bl	0xb008 <.text+0xa008>
    7404:      	b	0x7404 <.text+0x6404>
    7408:      	adrp	x1, 0xf000 <.text+0xe000>
    740c:      	adrp	x2, 0xf000 <.text+0xe000>
    7410:      	mov	w19, #0x189             // =393
    7414:      	add	x1, x1, #0x899
    7418:      	add	x2, x2, #0x743
    741c:      	orr	w0, wzr, #0x80000000
    7420:      	mov	w3, w19
    7424:      	bl	0xac7c <.text+0x9c7c>
    7428:      	adrp	x0, 0xf000 <.text+0xe000>
    742c:      	adrp	x2, 0x11000 <.text+0x10000>
    7430:      	add	x0, x0, #0x7af
    7434:      	add	x2, x2, #0xe70
    7438:      	mov	x1, x19
    743c:      	bl	0xb008 <.text+0xa008>
    7440:      	b	0x7440 <.text+0x6440>
    7444:      	orr	w0, wzr, #0x6
    7448:      	ret
    744c:      	cbz	x0, 0x745c <.text+0x645c>
    7450:      	cbz	x1, 0x745c <.text+0x645c>
    7454:      	mov	w0, wzr
    7458:      	ret
    745c:      	stp	x20, x19, [sp, #-0x20]!
    7460:      	stp	x29, x30, [sp, #0x10]
    7464:      	add	x29, sp, #0x10
    7468:      	adrp	x1, 0xf000 <.text+0xe000>
    746c:      	adrp	x2, 0xf000 <.text+0xe000>
    7470:      	mov	w19, #0x1ac             // =428
    7474:      	add	x1, x1, #0x827
    7478:      	add	x2, x2, #0x743
    747c:      	orr	w0, wzr, #0x80000000
    7480:      	mov	w3, w19
    7484:      	bl	0xac7c <.text+0x9c7c>
    7488:      	adrp	x0, 0xf000 <.text+0xe000>
    748c:      	adrp	x2, 0x11000 <.text+0x10000>
    7490:      	add	x0, x0, #0x7af
    7494:      	add	x2, x2, #0xe70
    7498:      	mov	x1, x19
    749c:      	bl	0xb008 <.text+0xa008>
    74a0:      	ldp	x29, x30, [sp, #0x10]
    74a4:      	ldp	x20, x19, [sp], #0x20
    74a8:      	b	0x74a8 <.text+0x64a8>
    74ac:      	strb	wzr, [x0, #0x258]
    74b0:      	ret
    74b4:      	stp	x20, x19, [sp, #-0x20]!
    74b8:      	stp	x29, x30, [sp, #0x10]
    74bc:      	add	x29, sp, #0x10
    74c0:      	cbz	x0, 0x7518 <.text+0x6518>
    74c4:      	cbz	x1, 0x7518 <.text+0x6518>
    74c8:      	ldr	w8, [x1]
    74cc:      	tbnz	w8, #0x0, 0x7554 <.text+0x6554>
    74d0:      	ldr	x0, [x0, #0x248]
    74d4:      	ubfx	w9, w8, #1, #5
    74d8:      	ubfx	w2, w8, #1, #1
    74dc:      	sub	w10, w9, w2
    74e0:      	mov	w3, wzr
    74e4:      	lsr	w1, w10, #1
    74e8:      	bl	0x57b8 <.text+0x47b8>
    74ec:      	tbz	x0, #0x3f, 0x7508 <.text+0x6508>
    74f0:      	adrp	x1, 0xf000 <.text+0xe000>
    74f4:      	adrp	x2, 0xf000 <.text+0xe000>
    74f8:      	add	x1, x1, #0x9d0
    74fc:      	add	x2, x2, #0xa08
    7500:      	orr	w0, wzr, #0x80000000
    7504:      	bl	0xac7c <.text+0x9c7c>
    7508:      	ldp	x29, x30, [sp, #0x10]
    750c:      	orr	w0, wzr, #0x4
    7510:      	ldp	x20, x19, [sp], #0x20
    7514:      	ret
    7518:      	adrp	x1, 0xf000 <.text+0xe000>
    751c:      	adrp	x2, 0xf000 <.text+0xe000>
    7520:      	mov	w19, #0x1ce             // =462
    7524:      	add	x1, x1, #0x827
    7528:      	add	x2, x2, #0x743
    752c:      	orr	w0, wzr, #0x80000000
    7530:      	mov	w3, w19
    7534:      	bl	0xac7c <.text+0x9c7c>
    7538:      	adrp	x0, 0xf000 <.text+0xe000>
    753c:      	adrp	x2, 0x11000 <.text+0x10000>
    7540:      	add	x0, x0, #0x7af
    7544:      	add	x2, x2, #0xe70
    7548:      	mov	x1, x19
    754c:      	bl	0xb008 <.text+0xa008>
    7550:      	b	0x7550 <.text+0x6550>
    7554:      	adrp	x1, 0xf000 <.text+0xe000>
    7558:      	adrp	x2, 0xf000 <.text+0xe000>
    755c:      	mov	w19, #0x1cf             // =463
    7560:      	add	x1, x1, #0x899
    7564:      	add	x2, x2, #0x743
    7568:      	orr	w0, wzr, #0x80000000
    756c:      	mov	w3, w19
    7570:      	bl	0xac7c <.text+0x9c7c>
    7574:      	adrp	x0, 0xf000 <.text+0xe000>
    7578:      	adrp	x2, 0x11000 <.text+0x10000>
    757c:      	add	x0, x0, #0x7af
    7580:      	add	x2, x2, #0xe70
    7584:      	mov	x1, x19
    7588:      	bl	0xb008 <.text+0xa008>
    758c:      	b	0x758c <.text+0x658c>
    7590:      	stp	x20, x19, [sp, #-0x20]!
    7594:      	stp	x29, x30, [sp, #0x10]
    7598:      	add	x29, sp, #0x10
    759c:      	cbz	x0, 0x7614 <.text+0x6614>
    75a0:      	cbz	x1, 0x7614 <.text+0x6614>
    75a4:      	ldr	w8, [x1]
    75a8:      	tbnz	w8, #0x0, 0x7650 <.text+0x6650>
    75ac:      	mov	w9, #0xf000000          // =251658240
    75b0:      	movk	w9, #0x3c0
    75b4:      	mov	w11, #0x8000000         // =134217728
    75b8:      	and	w10, w8, w9
    75bc:      	movk	w11, #0x1c0
    75c0:      	cmp	w10, w11
    75c4:      	b.ne	0x768c <.text+0x668c>
    75c8:      	ldr	x0, [x0, #0x248]
    75cc:      	ubfx	w13, w8, #1, #5
    75d0:      	ubfx	w14, w8, #1, #1
    75d4:      	sub	w15, w13, w14
    75d8:      	mov	w2, wzr
    75dc:      	mov	w3, wzr
    75e0:      	lsr	w1, w15, #1
    75e4:      	bl	0x57b8 <.text+0x47b8>
    75e8:      	mov	x8, x0
    75ec:      	mov	w0, wzr
    75f0:      	tbz	x8, #0x3f, 0x7690 <.text+0x6690>
    75f4:      	adrp	x1, 0xf000 <.text+0xe000>
    75f8:      	adrp	x2, 0xf000 <.text+0xe000>
    75fc:      	add	x1, x1, #0x981
    7600:      	add	x2, x2, #0xa22
    7604:      	orr	w0, wzr, #0x80000000
    7608:      	bl	0xac7c <.text+0x9c7c>
    760c:      	mov	w0, wzr
    7610:      	b	0x7690 <.text+0x6690>
    7614:      	adrp	x1, 0xf000 <.text+0xe000>
    7618:      	adrp	x2, 0xf000 <.text+0xe000>
    761c:      	mov	w19, #0x1e7             // =487
    7620:      	add	x1, x1, #0x827
    7624:      	add	x2, x2, #0x743
    7628:      	orr	w0, wzr, #0x80000000
    762c:      	mov	w3, w19
    7630:      	bl	0xac7c <.text+0x9c7c>
    7634:      	adrp	x0, 0xf000 <.text+0xe000>
    7638:      	adrp	x2, 0x11000 <.text+0x10000>
    763c:      	add	x0, x0, #0x7af
    7640:      	add	x2, x2, #0xe70
    7644:      	mov	x1, x19
    7648:      	bl	0xb008 <.text+0xa008>
    764c:      	b	0x764c <.text+0x664c>
    7650:      	adrp	x1, 0xf000 <.text+0xe000>
    7654:      	adrp	x2, 0xf000 <.text+0xe000>
    7658:      	mov	w19, #0x1e8             // =488
    765c:      	add	x1, x1, #0x899
    7660:      	add	x2, x2, #0x743
    7664:      	orr	w0, wzr, #0x80000000
    7668:      	mov	w3, w19
    766c:      	bl	0xac7c <.text+0x9c7c>
    7670:      	adrp	x0, 0xf000 <.text+0xe000>
    7674:      	adrp	x2, 0x11000 <.text+0x10000>
    7678:      	add	x0, x0, #0x7af
    767c:      	add	x2, x2, #0xe70
    7680:      	mov	x1, x19
    7684:      	bl	0xb008 <.text+0xa008>
    7688:      	b	0x7688 <.text+0x6688>
    768c:      	mov	w0, #0xa                // =10
    7690:      	ldp	x29, x30, [sp, #0x10]
    7694:      	ldp	x20, x19, [sp], #0x20
    7698:      	ret
    769c:      	stp	x20, x19, [sp, #-0x20]!
    76a0:      	stp	x29, x30, [sp, #0x10]
    76a4:      	add	x29, sp, #0x10
    76a8:      	mov	x19, x0
    76ac:      	cbz	x19, 0x7738 <.text+0x6738>
    76b0:      	cbz	x1, 0x7738 <.text+0x6738>
    76b4:      	ldr	w9, [x1]
    76b8:      	tbnz	w9, #0x0, 0x7774 <.text+0x6774>
    76bc:      	ldr	w2, [x19, #0x254]
    76c0:      	ubfx	w10, w9, #1, #5
    76c4:      	ubfx	w20, w9, #1, #1
    76c8:      	sub	w8, w10, w20
    76cc:      	ubfx	w11, w8, #1, #8
    76d0:      	cbnz	w11, 0x77b0 <.text+0x67b0>
    76d4:      	cmp	w20, w2
    76d8:      	b.ne	0x77b0 <.text+0x67b0>
    76dc:      	ldrb	w13, [x19, #0x258]
    76e0:      	cbnz	w13, 0x7808 <.text+0x6808>
    76e4:      	ldr	x0, [x19, #0x248]
    76e8:      	mov	w3, #0x5                // =5
    76ec:      	mov	w2, w20
    76f0:      	lsr	w1, w8, #1
    76f4:      	bl	0x5a88 <.text+0x4a88>
    76f8:      	tbnz	x0, #0x3f, 0x77e4 <.text+0x67e4>
    76fc:      	ldr	x8, [x19, #0x248]
    7700:      	mov	w15, #0xc80c            // =51212
    7704:      	mov	w3, #0x70000            // =458752
    7708:      	bfi	w15, w20, #4, #1
    770c:      	movk	w3, #0xa120
    7710:      	ldr	w14, [x8, #0x1e0]
    7714:      	orr	w1, wzr, #0x400
    7718:      	mov	w2, wzr
    771c:      	add	w0, w15, w14
    7720:      	bl	0xa6d4 <.text+0x96d4>
    7724:      	tbnz	w0, #0x1f, 0x77f0 <.text+0x67f0>
    7728:      	orr	w16, wzr, #0x1
    772c:      	mov	w0, #0xa                // =10
    7730:      	strb	w16, [x19, #0x258]
    7734:      	b	0x780c <.text+0x680c>
    7738:      	adrp	x1, 0xf000 <.text+0xe000>
    773c:      	adrp	x2, 0xf000 <.text+0xe000>
    7740:      	mov	w19, #0x20d             // =525
    7744:      	add	x1, x1, #0x827
    7748:      	add	x2, x2, #0x743
    774c:      	orr	w0, wzr, #0x80000000
    7750:      	mov	w3, w19
    7754:      	bl	0xac7c <.text+0x9c7c>
    7758:      	adrp	x0, 0xf000 <.text+0xe000>
    775c:      	adrp	x2, 0x11000 <.text+0x10000>
    7760:      	add	x0, x0, #0x7af
    7764:      	add	x2, x2, #0xe70
    7768:      	mov	x1, x19
    776c:      	bl	0xb008 <.text+0xa008>
    7770:      	b	0x7770 <.text+0x6770>
    7774:      	adrp	x1, 0xf000 <.text+0xe000>
    7778:      	adrp	x2, 0xf000 <.text+0xe000>
    777c:      	mov	w19, #0x20e             // =526
    7780:      	add	x1, x1, #0x899
    7784:      	add	x2, x2, #0x743
    7788:      	orr	w0, wzr, #0x80000000
    778c:      	mov	w3, w19
    7790:      	bl	0xac7c <.text+0x9c7c>
    7794:      	adrp	x0, 0xf000 <.text+0xe000>
    7798:      	adrp	x2, 0x11000 <.text+0x10000>
    779c:      	add	x0, x0, #0x7af
    77a0:      	add	x2, x2, #0xe70
    77a4:      	mov	x1, x19
    77a8:      	bl	0xb008 <.text+0xa008>
    77ac:      	b	0x77ac <.text+0x67ac>
    77b0:      	ldr	x0, [x19, #0x248]
    77b4:      	mov	w1, wzr
    77b8:      	bl	0x51e8 <.text+0x41e8>
    77bc:      	tbz	x0, #0x3f, 0x77dc <.text+0x67dc>
    77c0:      	ldr	w3, [x19, #0x254]
    77c4:      	adrp	x1, 0xf000 <.text+0xe000>
    77c8:      	adrp	x2, 0xf000 <.text+0xe000>
    77cc:      	add	x1, x1, #0xa85
    77d0:      	add	x2, x2, #0xa6b
    77d4:      	orr	w0, wzr, #0x80000000
    77d8:      	bl	0xac7c <.text+0x9c7c>
    77dc:      	orr	w0, wzr, #0x6
    77e0:      	b	0x780c <.text+0x680c>
    77e4:      	adrp	x1, 0xf000 <.text+0xe000>
    77e8:      	add	x1, x1, #0xa44
    77ec:      	b	0x77f8 <.text+0x67f8>
    77f0:      	adrp	x1, 0xf000 <.text+0xe000>
    77f4:      	add	x1, x1, #0x7fa
    77f8:      	adrp	x2, 0xf000 <.text+0xe000>
    77fc:      	add	x2, x2, #0xa6b
    7800:      	orr	w0, wzr, #0x80000000
    7804:      	bl	0xac7c <.text+0x9c7c>
    7808:      	mov	w0, #0xa                // =10
    780c:      	ldp	x29, x30, [sp, #0x10]
    7810:      	ldp	x20, x19, [sp], #0x20
    7814:      	ret
    7818:      	stp	x20, x19, [sp, #-0x20]!
    781c:      	stp	x29, x30, [sp, #0x10]
    7820:      	add	x29, sp, #0x10
    7824:      	cbz	x0, 0x7870 <.text+0x6870>
    7828:      	cbz	x1, 0x7870 <.text+0x6870>
    782c:      	ldrb	w8, [x1]
    7830:      	tbnz	w8, #0x0, 0x78ac <.text+0x68ac>
    7834:      	adrp	x1, 0xf000 <.text+0xe000>
    7838:      	adrp	x2, 0xf000 <.text+0xe000>
    783c:      	mov	w19, #0x242             // =578
    7840:      	add	x1, x1, #0xab1
    7844:      	add	x2, x2, #0x743
    7848:      	orr	w0, wzr, #0x80000000
    784c:      	mov	w3, w19
    7850:      	bl	0xac7c <.text+0x9c7c>
    7854:      	adrp	x0, 0xf000 <.text+0xe000>
    7858:      	adrp	x2, 0x11000 <.text+0x10000>
    785c:      	add	x0, x0, #0x7af
    7860:      	add	x2, x2, #0xe70
    7864:      	mov	x1, x19
    7868:      	bl	0xb008 <.text+0xa008>
    786c:      	b	0x786c <.text+0x686c>
    7870:      	adrp	x1, 0xf000 <.text+0xe000>
    7874:      	adrp	x2, 0xf000 <.text+0xe000>
    7878:      	mov	w19, #0x241             // =577
    787c:      	add	x1, x1, #0x827
    7880:      	add	x2, x2, #0x743
    7884:      	orr	w0, wzr, #0x80000000
    7888:      	mov	w3, w19
    788c:      	bl	0xac7c <.text+0x9c7c>
    7890:      	adrp	x0, 0xf000 <.text+0xe000>
    7894:      	adrp	x2, 0x11000 <.text+0x10000>
    7898:      	add	x0, x0, #0x7af
    789c:      	add	x2, x2, #0xe70
    78a0:      	mov	x1, x19
    78a4:      	bl	0xb008 <.text+0xa008>
    78a8:      	b	0x78a8 <.text+0x68a8>
    78ac:      	ldr	w1, [x0, #0x254]
    78b0:      	bl	0x6c6c <.text+0x5c6c>
    78b4:      	ldp	x29, x30, [sp, #0x10]
    78b8:      	mov	w0, wzr
    78bc:      	ldp	x20, x19, [sp], #0x20
    78c0:      	ret
    78c4:      	ret
    78c8:      	orr	w0, wzr, #0x6
    78cc:      	ret
    78d0:      	stp	x20, x19, [sp, #-0x20]!
    78d4:      	stp	x29, x30, [sp, #0x10]
    78d8:      	add	x29, sp, #0x10
    78dc:      	cbz	x0, 0x7914 <.text+0x6914>
    78e0:      	cbz	x1, 0x7914 <.text+0x6914>
    78e4:      	ldr	w8, [x1]
    78e8:      	tbnz	w8, #0x0, 0x7950 <.text+0x6950>
    78ec:      	and	w9, w8, #0x3000
    78f0:      	cmp	w9, #0x1, lsl #12       // =0x1000
    78f4:      	b.ne	0x798c <.text+0x698c>
    78f8:      	ldr	w10, [x0, #0x254]
    78fc:      	ubfx	w11, w8, #1, #1
    7900:      	orr	w12, wzr, #0x6
    7904:      	cmp	w11, w10
    7908:      	orr	w14, wzr, #0x3
    790c:      	csel	w0, w14, w12, eq
    7910:      	b	0x79a4 <.text+0x69a4>
    7914:      	adrp	x1, 0xf000 <.text+0xe000>
    7918:      	adrp	x2, 0xf000 <.text+0xe000>
    791c:      	mov	w19, #0x274             // =628
    7920:      	add	x1, x1, #0x827
    7924:      	add	x2, x2, #0x743
    7928:      	orr	w0, wzr, #0x80000000
    792c:      	mov	w3, w19
    7930:      	bl	0xac7c <.text+0x9c7c>
    7934:      	adrp	x0, 0xf000 <.text+0xe000>
    7938:      	adrp	x2, 0x11000 <.text+0x10000>
    793c:      	add	x0, x0, #0x7af
    7940:      	add	x2, x2, #0xe70
    7944:      	mov	x1, x19
    7948:      	bl	0xb008 <.text+0xa008>
    794c:      	b	0x794c <.text+0x694c>
    7950:      	adrp	x1, 0xf000 <.text+0xe000>
    7954:      	adrp	x2, 0xf000 <.text+0xe000>
    7958:      	mov	w19, #0x275             // =629
    795c:      	add	x1, x1, #0x899
    7960:      	add	x2, x2, #0x743
    7964:      	orr	w0, wzr, #0x80000000
    7968:      	mov	w3, w19
    796c:      	bl	0xac7c <.text+0x9c7c>
    7970:      	adrp	x0, 0xf000 <.text+0xe000>
    7974:      	adrp	x2, 0x11000 <.text+0x10000>
    7978:      	add	x0, x0, #0x7af
    797c:      	add	x2, x2, #0xe70
    7980:      	mov	x1, x19
    7984:      	bl	0xb008 <.text+0xa008>
    7988:      	b	0x7988 <.text+0x6988>
    798c:      	ldr	x8, [x0, #0x248]
    7990:      	mov	w15, #0x5               // =5
    7994:      	ldrb	w8, [x8, #0xe08]
    7998:      	cmp	w8, #0x0
    799c:      	orr	w17, wzr, #0x7
    79a0:      	csel	w0, w17, w15, ne
    79a4:      	ldp	x29, x30, [sp, #0x10]
    79a8:      	ldp	x20, x19, [sp], #0x20
    79ac:      	ret
    79b0:      	cbz	x0, 0x79d0 <.text+0x69d0>
    79b4:      	ldr	w8, [x0, #0x254]
    79b8:      	mov	w1, wzr
    79bc:      	ldr	x0, [x0, #0x248]
    79c0:      	cmp	w8, #0x0
    79c4:      	cset	w2, eq
    79c8:      	orr	w3, wzr, #0x4
    79cc:      	b	0x5a88 <.text+0x4a88>
    79d0:      	stp	x20, x19, [sp, #-0x20]!
    79d4:      	stp	x29, x30, [sp, #0x10]
    79d8:      	add	x29, sp, #0x10
    79dc:      	adrp	x1, 0xf000 <.text+0xe000>
    79e0:      	adrp	x2, 0xf000 <.text+0xe000>
    79e4:      	mov	w19, #0x2a0             // =672
    79e8:      	add	x1, x1, #0x730
    79ec:      	add	x2, x2, #0x743
    79f0:      	orr	w0, wzr, #0x80000000
    79f4:      	mov	w3, w19
    79f8:      	bl	0xac7c <.text+0x9c7c>
    79fc:      	adrp	x0, 0xf000 <.text+0xe000>
    7a00:      	adrp	x2, 0x11000 <.text+0x10000>
    7a04:      	add	x0, x0, #0x7af
    7a08:      	add	x2, x2, #0xe70
    7a0c:      	mov	x1, x19
    7a10:      	bl	0xb008 <.text+0xa008>
    7a14:      	ldp	x29, x30, [sp, #0x10]
    7a18:      	ldp	x20, x19, [sp], #0x20
    7a1c:      	b	0x7a1c <.text+0x6a1c>
    7a20:      	stp	x20, x19, [sp, #-0x20]!
    7a24:      	stp	x29, x30, [sp, #0x10]
    7a28:      	add	x29, sp, #0x10
    7a2c:      	cbz	x0, 0x7a84 <.text+0x6a84>
    7a30:      	cbz	x1, 0x7a84 <.text+0x6a84>
    7a34:      	ldr	w8, [x1]
    7a38:      	tbnz	w8, #0x0, 0x7ac0 <.text+0x6ac0>
    7a3c:      	ldr	x0, [x0, #0x248]
    7a40:      	ubfx	w9, w8, #1, #5
    7a44:      	ubfx	w2, w8, #1, #1
    7a48:      	sub	w10, w9, w2
    7a4c:      	mov	w3, wzr
    7a50:      	lsr	w1, w10, #1
    7a54:      	bl	0x57b8 <.text+0x47b8>
    7a58:      	tbz	x0, #0x3f, 0x7a74 <.text+0x6a74>
    7a5c:      	adrp	x1, 0xf000 <.text+0xe000>
    7a60:      	adrp	x2, 0xf000 <.text+0xe000>
    7a64:      	add	x1, x1, #0x981
    7a68:      	add	x2, x2, #0xade
    7a6c:      	orr	w0, wzr, #0x80000000
    7a70:      	bl	0xac7c <.text+0x9c7c>
    7a74:      	ldp	x29, x30, [sp, #0x10]
    7a78:      	mov	w0, wzr
    7a7c:      	ldp	x20, x19, [sp], #0x20
    7a80:      	ret
    7a84:      	adrp	x1, 0xf000 <.text+0xe000>
    7a88:      	adrp	x2, 0xf000 <.text+0xe000>
    7a8c:      	mov	w19, #0x2b4             // =692
    7a90:      	add	x1, x1, #0x827
    7a94:      	add	x2, x2, #0x743
    7a98:      	orr	w0, wzr, #0x80000000
    7a9c:      	mov	w3, w19
    7aa0:      	bl	0xac7c <.text+0x9c7c>
    7aa4:      	adrp	x0, 0xf000 <.text+0xe000>
    7aa8:      	adrp	x2, 0x11000 <.text+0x10000>
    7aac:      	add	x0, x0, #0x7af
    7ab0:      	add	x2, x2, #0xe70
    7ab4:      	mov	x1, x19
    7ab8:      	bl	0xb008 <.text+0xa008>
    7abc:      	b	0x7abc <.text+0x6abc>
    7ac0:      	adrp	x1, 0xf000 <.text+0xe000>
    7ac4:      	adrp	x2, 0xf000 <.text+0xe000>
    7ac8:      	mov	w19, #0x2b5             // =693
    7acc:      	add	x1, x1, #0x899
    7ad0:      	add	x2, x2, #0x743
    7ad4:      	orr	w0, wzr, #0x80000000
    7ad8:      	mov	w3, w19
    7adc:      	bl	0xac7c <.text+0x9c7c>
    7ae0:      	adrp	x0, 0xf000 <.text+0xe000>
    7ae4:      	adrp	x2, 0x11000 <.text+0x10000>
    7ae8:      	add	x0, x0, #0x7af
    7aec:      	add	x2, x2, #0xe70
    7af0:      	mov	x1, x19
    7af4:      	bl	0xb008 <.text+0xa008>
    7af8:      	b	0x7af8 <.text+0x6af8>
    7afc:      	orr	w0, wzr, #0x6
    7b00:      	ret
    7b04:      	stp	x20, x19, [sp, #-0x20]!
    7b08:      	stp	x29, x30, [sp, #0x10]
    7b0c:      	add	x29, sp, #0x10
    7b10:      	cbz	x0, 0x7b5c <.text+0x6b5c>
    7b14:      	cbz	x1, 0x7b5c <.text+0x6b5c>
    7b18:      	ldrb	w8, [x1]
    7b1c:      	tbnz	w8, #0x0, 0x7b98 <.text+0x6b98>
    7b20:      	adrp	x1, 0xf000 <.text+0xe000>
    7b24:      	adrp	x2, 0xf000 <.text+0xe000>
    7b28:      	mov	w19, #0x2db             // =731
    7b2c:      	add	x1, x1, #0xab1
    7b30:      	add	x2, x2, #0x743
    7b34:      	orr	w0, wzr, #0x80000000
    7b38:      	mov	w3, w19
    7b3c:      	bl	0xac7c <.text+0x9c7c>
    7b40:      	adrp	x0, 0xf000 <.text+0xe000>
    7b44:      	adrp	x2, 0x11000 <.text+0x10000>
    7b48:      	add	x0, x0, #0x7af
    7b4c:      	add	x2, x2, #0xe70
    7b50:      	mov	x1, x19
    7b54:      	bl	0xb008 <.text+0xa008>
    7b58:      	b	0x7b58 <.text+0x6b58>
    7b5c:      	adrp	x1, 0xf000 <.text+0xe000>
    7b60:      	adrp	x2, 0xf000 <.text+0xe000>
    7b64:      	mov	w19, #0x2da             // =730
    7b68:      	add	x1, x1, #0x827
    7b6c:      	add	x2, x2, #0x743
    7b70:      	orr	w0, wzr, #0x80000000
    7b74:      	mov	w3, w19
    7b78:      	bl	0xac7c <.text+0x9c7c>
    7b7c:      	adrp	x0, 0xf000 <.text+0xe000>
    7b80:      	adrp	x2, 0x11000 <.text+0x10000>
    7b84:      	add	x0, x0, #0x7af
    7b88:      	add	x2, x2, #0xe70
    7b8c:      	mov	x1, x19
    7b90:      	bl	0xb008 <.text+0xa008>
    7b94:      	b	0x7b94 <.text+0x6b94>
    7b98:      	ldr	w8, [x0, #0x254]
    7b9c:      	cmp	w8, #0x0
    7ba0:      	cset	w1, eq
    7ba4:      	bl	0x6c6c <.text+0x5c6c>
    7ba8:      	ldp	x29, x30, [sp, #0x10]
    7bac:      	mov	w0, wzr
    7bb0:      	ldp	x20, x19, [sp], #0x20
    7bb4:      	ret
    7bb8:      	ret
    7bbc:      	stp	x29, x30, [sp, #-0x10]!
    7bc0:      	mov	x29, sp
    7bc4:      	cbz	x0, 0x7bf0 <.text+0x6bf0>
    7bc8:      	ldr	x8, [x0, #0x248]
    7bcc:      	mov	w1, wzr
    7bd0:      	mov	w2, wzr
    7bd4:      	orr	w3, wzr, #0x1
    7bd8:      	add	x0, x8, #0x1f0
    7bdc:      	bl	0x8d24 <.text+0x7d24>
    7be0:      	mov	w8, w0
    7be4:      	tbnz	w8, #0x1f, 0x7c28 <.text+0x6c28>
    7be8:      	ldp	x29, x30, [sp], #0x10
    7bec:      	ret
    7bf0:      	adrp	x1, 0xf000 <.text+0xe000>
    7bf4:      	adrp	x2, 0xf000 <.text+0xe000>
    7bf8:      	add	x1, x1, #0x730
    7bfc:      	add	x2, x2, #0x743
    7c00:      	orr	w0, wzr, #0x80000000
    7c04:      	orr	w3, wzr, #0x300
    7c08:      	bl	0xac7c <.text+0x9c7c>
    7c0c:      	adrp	x0, 0xf000 <.text+0xe000>
    7c10:      	adrp	x2, 0x11000 <.text+0x10000>
    7c14:      	add	x0, x0, #0x7af
    7c18:      	add	x2, x2, #0xe70
    7c1c:      	orr	w1, wzr, #0x300
    7c20:      	bl	0xb008 <.text+0xa008>
    7c24:      	b	0x7c24 <.text+0x6c24>
    7c28:      	adrp	x1, 0xe000 <.text+0xd000>
    7c2c:      	adrp	x2, 0xf000 <.text+0xe000>
    7c30:      	add	x1, x1, #0xd91
    7c34:      	add	x2, x2, #0xafb
    7c38:      	orr	w0, wzr, #0x80000000
    7c3c:      	mov	w3, w8
    7c40:      	ldp	x29, x30, [sp], #0x10
    7c44:      	b	0xac7c <.text+0x9c7c>
    7c48:      	stp	x20, x19, [sp, #-0x20]!
    7c4c:      	stp	x29, x30, [sp, #0x10]
    7c50:      	add	x29, sp, #0x10
    7c54:      	cbz	x0, 0x7ca0 <.text+0x6ca0>
    7c58:      	cbz	x1, 0x7ca0 <.text+0x6ca0>
    7c5c:      	ldrb	w8, [x1]
    7c60:      	tbnz	w8, #0x0, 0x7cdc <.text+0x6cdc>
    7c64:      	adrp	x1, 0xf000 <.text+0xe000>
    7c68:      	adrp	x2, 0xf000 <.text+0xe000>
    7c6c:      	mov	w19, #0x318             // =792
    7c70:      	add	x1, x1, #0xab1
    7c74:      	add	x2, x2, #0x743
    7c78:      	orr	w0, wzr, #0x80000000
    7c7c:      	mov	w3, w19
    7c80:      	bl	0xac7c <.text+0x9c7c>
    7c84:      	adrp	x0, 0xf000 <.text+0xe000>
    7c88:      	adrp	x2, 0x11000 <.text+0x10000>
    7c8c:      	add	x0, x0, #0x7af
    7c90:      	add	x2, x2, #0xe70
    7c94:      	mov	x1, x19
    7c98:      	bl	0xb008 <.text+0xa008>
    7c9c:      	b	0x7c9c <.text+0x6c9c>
    7ca0:      	adrp	x1, 0xf000 <.text+0xe000>
    7ca4:      	adrp	x2, 0xf000 <.text+0xe000>
    7ca8:      	mov	w19, #0x317             // =791
    7cac:      	add	x1, x1, #0x827
    7cb0:      	add	x2, x2, #0x743
    7cb4:      	orr	w0, wzr, #0x80000000
    7cb8:      	mov	w3, w19
    7cbc:      	bl	0xac7c <.text+0x9c7c>
    7cc0:      	adrp	x0, 0xf000 <.text+0xe000>
    7cc4:      	adrp	x2, 0x11000 <.text+0x10000>
    7cc8:      	add	x0, x0, #0x7af
    7ccc:      	add	x2, x2, #0xe70
    7cd0:      	mov	x1, x19
    7cd4:      	bl	0xb008 <.text+0xa008>
    7cd8:      	b	0x7cd8 <.text+0x6cd8>
    7cdc:      	ldr	x8, [x0, #0x248]
    7ce0:      	mov	w10, #0xc80c            // =51212
    7ce4:      	mov	w3, #0x70000            // =458752
    7ce8:      	movk	w3, #0xa120
    7cec:      	orr	w1, wzr, #0x400
    7cf0:      	ldr	w9, [x8, #0x1e0]
    7cf4:      	mov	w2, wzr
    7cf8:      	add	w0, w9, w10
    7cfc:      	bl	0xa6d4 <.text+0x96d4>
    7d00:      	tbz	w0, #0x1f, 0x7d1c <.text+0x6d1c>
    7d04:      	adrp	x1, 0xf000 <.text+0xe000>
    7d08:      	adrp	x2, 0xf000 <.text+0xe000>
    7d0c:      	add	x1, x1, #0x7fa
    7d10:      	add	x2, x2, #0xb0e
    7d14:      	orr	w0, wzr, #0x80000000
    7d18:      	bl	0xac7c <.text+0x9c7c>
    7d1c:      	ldp	x29, x30, [sp, #0x10]
    7d20:      	mov	w0, wzr
    7d24:      	ldp	x20, x19, [sp], #0x20
    7d28:      	ret
    7d2c:      	mov	w0, wzr
    7d30:      	ret
    7d34:      	stp	x28, x27, [sp, #-0x60]!
    7d38:      	stp	x26, x25, [sp, #0x10]
    7d3c:      	stp	x24, x23, [sp, #0x20]
    7d40:      	stp	x22, x21, [sp, #0x30]
    7d44:      	stp	x20, x19, [sp, #0x40]
    7d48:      	stp	x29, x30, [sp, #0x50]
    7d4c:      	add	x29, sp, #0x50
    7d50:      	sub	sp, sp, #0x40
    7d54:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    7d58:      	mov	x19, x2
    7d5c:      	mov	x21, x1
    7d60:      	movk	x20, #0x9
    7d64:      	cbz	x21, 0x7dbc <.text+0x6dbc>
    7d68:      	cbz	x19, 0x7dbc <.text+0x6dbc>
    7d6c:      	ldr	x8, [x21]
    7d70:      	cbz	x8, 0x7dc8 <.text+0x6dc8>
    7d74:      	ldrb	w8, [x8, #0x11]
    7d78:      	cmp	w8, #0x1
    7d7c:      	b.ne	0x7de4 <.text+0x6de4>
    7d80:      	ldr	x17, [x21, #0x8]
    7d84:      	cbz	x17, 0x7e00 <.text+0x6e00>
    7d88:      	ldr	x12, [x17]
    7d8c:      	cbz	x12, 0x7e1c <.text+0x6e1c>
    7d90:      	ldr	x16, [x12]
    7d94:      	cbz	x16, 0x7e38 <.text+0x6e38>
    7d98:      	ldrb	w11, [x16, #0x3]
    7d9c:      	ldrb	w8, [x16, #0x2]
    7da0:      	ldrb	w24, [x16, #0x4]
    7da4:      	ldr	x9, [x12, #0x8]
    7da8:      	cbz	x9, 0x7eb8 <.text+0x6eb8>
    7dac:      	mov	x22, xzr
    7db0:      	mov	x10, xzr
    7db4:      	bfi	x8, x11, #8, #8
    7db8:      	b	0x7e5c <.text+0x6e5c>
    7dbc:      	adrp	x1, 0xf000 <.text+0xe000>
    7dc0:      	add	x1, x1, #0xce7
    7dc4:      	b	0x7dec <.text+0x6dec>
    7dc8:      	adrp	x1, 0xf000 <.text+0xe000>
    7dcc:      	adrp	x2, 0xf000 <.text+0xe000>
    7dd0:      	adrp	x3, 0xf000 <.text+0xe000>
    7dd4:      	add	x1, x1, #0xb32
    7dd8:      	add	x2, x2, #0xb21
    7ddc:      	add	x3, x3, #0xbc4
    7de0:      	b	0x7ed0 <.text+0x6ed0>
    7de4:      	adrp	x1, 0xf000 <.text+0xe000>
    7de8:      	add	x1, x1, #0xb49
    7dec:      	adrp	x2, 0xf000 <.text+0xe000>
    7df0:      	add	x2, x2, #0xb21
    7df4:      	orr	w0, wzr, #0x80000000
    7df8:      	bl	0xac7c <.text+0x9c7c>
    7dfc:      	b	0x7ed8 <.text+0x6ed8>
    7e00:      	adrp	x1, 0xf000 <.text+0xe000>
    7e04:      	adrp	x2, 0xf000 <.text+0xe000>
    7e08:      	adrp	x3, 0xf000 <.text+0xe000>
    7e0c:      	add	x1, x1, #0xb32
    7e10:      	add	x2, x2, #0xb21
    7e14:      	add	x3, x3, #0xbd5
    7e18:      	b	0x7ed0 <.text+0x6ed0>
    7e1c:      	adrp	x1, 0xf000 <.text+0xe000>
    7e20:      	adrp	x2, 0xf000 <.text+0xe000>
    7e24:      	adrp	x3, 0xf000 <.text+0xe000>
    7e28:      	add	x1, x1, #0xb32
    7e2c:      	add	x2, x2, #0xb21
    7e30:      	add	x3, x3, #0xbea
    7e34:      	b	0x7ed0 <.text+0x6ed0>
    7e38:      	adrp	x1, 0xf000 <.text+0xe000>
    7e3c:      	adrp	x2, 0xf000 <.text+0xe000>
    7e40:      	adrp	x3, 0xf000 <.text+0xe000>
    7e44:      	add	x1, x1, #0xb32
    7e48:      	add	x2, x2, #0xb21
    7e4c:      	add	x3, x3, #0xbf9
    7e50:      	b	0x7ed0 <.text+0x6ed0>
    7e54:      	add	x10, x10, #0x1
    7e58:      	add	x9, x9, #0x8
    7e5c:      	cmp	x10, x24
    7e60:      	b.hs	0x7f24 <.text+0x6f24>
    7e64:      	ldr	x15, [x9]
    7e68:      	cbz	x15, 0x8120 <.text+0x7120>
    7e6c:      	ldr	x14, [x15]
    7e70:      	cbz	x14, 0x813c <.text+0x713c>
    7e74:      	ldr	x11, [x15, #0x8]
    7e78:      	cbz	x11, 0x8158 <.text+0x7158>
    7e7c:      	ldrb	w12, [x14, #0x4]
    7e80:      	mov	x13, xzr
    7e84:      	add	x22, x12, x22
    7e88:      	cmp	x13, x12
    7e8c:      	b.hs	0x7e54 <.text+0x6e54>
    7e90:      	ldr	x15, [x11], #0x8
    7e94:      	add	x13, x13, #0x1
    7e98:      	cbnz	x15, 0x7e88 <.text+0x6e88>
    7e9c:      	adrp	x1, 0xf000 <.text+0xe000>
    7ea0:      	adrp	x2, 0xf000 <.text+0xe000>
    7ea4:      	adrp	x3, 0xf000 <.text+0xe000>
    7ea8:      	add	x1, x1, #0xb32
    7eac:      	add	x2, x2, #0xb21
    7eb0:      	add	x3, x3, #0xc5d
    7eb4:      	b	0x7ed0 <.text+0x6ed0>
    7eb8:      	adrp	x1, 0xf000 <.text+0xe000>
    7ebc:      	adrp	x2, 0xf000 <.text+0xe000>
    7ec0:      	adrp	x3, 0xf000 <.text+0xe000>
    7ec4:      	add	x1, x1, #0xb32
    7ec8:      	add	x2, x2, #0xb21
    7ecc:      	add	x3, x3, #0xc03
    7ed0:      	orr	w0, wzr, #0x80000000
    7ed4:      	bl	0xac7c <.text+0x9c7c>
    7ed8:      	adrp	x1, 0xf000 <.text+0xe000>
    7edc:      	adrp	x2, 0xf000 <.text+0xe000>
    7ee0:      	sub	x20, x20, #0x7
    7ee4:      	add	x1, x1, #0xb6e
    7ee8:      	add	x2, x2, #0xb21
    7eec:      	orr	w0, wzr, #0x80000000
    7ef0:      	mov	x3, x20
    7ef4:      	bl	0xac7c <.text+0x9c7c>
    7ef8:      	cbz	x19, 0x7f00 <.text+0x6f00>
    7efc:      	str	xzr, [x19]
    7f00:      	mov	x0, x20
    7f04:      	sub	sp, x29, #0x50
    7f08:      	ldp	x29, x30, [sp, #0x50]
    7f0c:      	ldp	x20, x19, [sp, #0x40]
    7f10:      	ldp	x22, x21, [sp, #0x30]
    7f14:      	ldp	x24, x23, [sp, #0x20]
    7f18:      	ldp	x26, x25, [sp, #0x10]
    7f1c:      	ldp	x28, x27, [sp], #0x60
    7f20:      	ret
    7f24:      	orr	w9, wzr, #0x6
    7f28:      	orr	w1, wzr, #0x400
    7f2c:      	madd	x26, x22, x9, x8
    7f30:      	add	x0, x26, #0x12
    7f34:      	bl	0xd1a0 <.text+0xc1a0>
    7f38:      	mov	x28, x0
    7f3c:      	cbz	x28, 0x8184 <.text+0x7184>
    7f40:      	add	x10, x22, x24
    7f44:      	lsl	x25, x24, #3
    7f48:      	add	x1, x25, x10, lsl #4
    7f4c:      	add	x0, x1, #0x30
    7f50:      	bl	0xbf44 <.text+0xaf44>
    7f54:      	mov	x27, x0
    7f58:      	cbz	x27, 0x81b4 <.text+0x71b4>
    7f5c:      	adrp	x16, 0x13000
    7f60:      	add	x2, x27, #0x18
    7f64:      	add	x16, x16, #0x3f0
    7f68:      	mov	x0, x28
    7f6c:      	str	x16, [x27, #0x10]
    7f70:      	stp	x28, x2, [x27]
    7f74:      	mov	w2, #0x12               // =18
    7f78:      	ldr	x1, [x21]
    7f7c:      	bl	0xb25c <.text+0xa25c>
    7f80:      	mov	w2, #0x9                // =9
    7f84:      	strb	wzr, [x28, #0x2]
    7f88:      	orr	w9, wzr, #0x3
    7f8c:      	add	x0, x28, #0x12
    7f90:      	strb	w2, [x28, #0x7]
    7f94:      	strb	w9, [x28, #0x3]
    7f98:      	ldr	x22, [x27, #0x8]
    7f9c:      	mov	x3, x22
    7fa0:      	stp	x27, x22, [sp]
    7fa4:      	add	x4, x22, #0x18
    7fa8:      	str	x0, [x3, #0x8]!
    7fac:      	str	x4, [x22, #0x10]
    7fb0:      	str	x3, [x22]
    7fb4:      	ldr	x5, [x21, #0x8]
    7fb8:      	ldr	x6, [x5]
    7fbc:      	ldr	x1, [x6]
    7fc0:      	bl	0xb25c <.text+0xa25c>
    7fc4:      	lsr	x17, x26, #8
    7fc8:      	strb	w26, [x28, #0x14]
    7fcc:      	mov	x27, xzr
    7fd0:      	strb	w17, [x28, #0x15]
    7fd4:      	mov	x1, xzr
    7fd8:      	ldr	x0, [x22, #0x10]
    7fdc:      	add	x23, x28, #0x1b
    7fe0:      	orr	w20, wzr, #0x4
    7fe4:      	add	x2, x0, x25
    7fe8:      	add	x8, x2, x24, lsl #4
    7fec:      	b	0x801c <.text+0x701c>
    7ff0:      	ldp	x4, x1, [sp, #0x18]
    7ff4:      	mov	w3, #0x75               // =117
    7ff8:      	ldr	x22, [sp, #0x10]
    7ffc:      	add	x27, x27, #0x8
    8000:      	madd	x23, x26, x3, x4
    8004:      	add	x6, x1, x22, lsl #3
    8008:      	ldp	x2, x1, [sp, #0x28]
    800c:      	add	x8, x6, x26, lsl #7
    8010:      	ldr	x24, [sp, #0x38]
    8014:      	add	x1, x1, #0x1
    8018:      	add	x2, x2, #0x10
    801c:      	cmp	x1, x24
    8020:      	b.eq	0x8174 <.text+0x7174>
    8024:      	stp	x1, x24, [sp, #0x30]
    8028:      	ldr	x7, [x21, #0x8]
    802c:      	ldr	x26, [sp, #0x8]
    8030:      	str	x2, [sp, #0x28]
    8034:      	ldr	x0, [x7]
    8038:      	mov	w7, #0x9                // =9
    803c:      	ldr	x22, [x26, #0x10]
    8040:      	ldr	x25, [x0, #0x8]
    8044:      	mov	x0, x23
    8048:      	ldr	x24, [x25, x27]
    804c:      	ldr	x28, [x24]
    8050:      	ldrb	w26, [x28, #0x4]
    8054:      	mov	x28, x8
    8058:      	str	x2, [x22, x27]
    805c:      	str	x23, [x2]
    8060:      	str	x28, [x2, #0x8]
    8064:      	mov	w2, w7
    8068:      	ldr	x9, [x21, #0x8]
    806c:      	str	x28, [sp, #0x20]
    8070:      	ldr	x10, [x9]
    8074:      	ldr	x11, [x10, #0x8]
    8078:      	ldr	x13, [x11, x27]
    807c:      	ldr	x1, [x13]
    8080:      	bl	0xb25c <.text+0xa25c>
    8084:      	mov	x25, xzr
    8088:      	mov	x24, xzr
    808c:      	add	x23, x23, #0x9
    8090:      	add	x22, x28, x26, lsl #3
    8094:      	lsl	x12, x26, #3
    8098:      	stp	x12, x23, [sp, #0x10]
    809c:      	b	0x80d0 <.text+0x70d0>
    80a0:      	orr	w11, wzr, #0x6
    80a4:      	strb	w20, [x23, #0x9]
    80a8:      	orr	w12, wzr, #0x30
    80ac:      	strb	wzr, [x23, #0xa]
    80b0:      	add	x24, x24, #0x1
    80b4:      	strb	wzr, [x23, #0xc]
    80b8:      	strb	w11, [x23, #0x7]
    80bc:      	add	x25, x25, #0x8
    80c0:      	strb	w12, [x23, #0x8]
    80c4:      	add	x22, x22, #0x10
    80c8:      	strb	wzr, [x23, #0xb]
    80cc:      	add	x23, x23, #0xd
    80d0:      	cmp	x24, x26
    80d4:      	b.eq	0x7ff0 <.text+0x6ff0>
    80d8:      	add	x12, x23, #0x7
    80dc:      	str	x22, [x28], #0x8
    80e0:      	orr	w2, wzr, #0x7
    80e4:      	stp	x23, x12, [x22]
    80e8:      	mov	x0, x23
    80ec:      	ldr	x14, [x21, #0x8]
    80f0:      	ldr	x15, [x14]
    80f4:      	ldr	x16, [x15, #0x8]
    80f8:      	ldr	x8, [x16, x27]
    80fc:      	ldr	x17, [x8, #0x8]
    8100:      	ldr	x1, [x17, x25]
    8104:      	bl	0xb25c <.text+0xa25c>
    8108:      	ldrb	w9, [x23, #0x3]
    810c:      	cmp	w9, #0x2
    8110:      	b.ne	0x80a0 <.text+0x70a0>
    8114:      	strb	w20, [x23, #0x5]
    8118:      	strb	wzr, [x23, #0x4]
    811c:      	b	0x80a0 <.text+0x70a0>
    8120:      	adrp	x1, 0xf000 <.text+0xe000>
    8124:      	adrp	x2, 0xf000 <.text+0xe000>
    8128:      	adrp	x3, 0xf000 <.text+0xe000>
    812c:      	add	x1, x1, #0xb32
    8130:      	add	x2, x2, #0xb21
    8134:      	add	x3, x3, #0xc1b
    8138:      	b	0x7ed0 <.text+0x6ed0>
    813c:      	adrp	x1, 0xf000 <.text+0xe000>
    8140:      	adrp	x2, 0xf000 <.text+0xe000>
    8144:      	adrp	x3, 0xf000 <.text+0xe000>
    8148:      	add	x1, x1, #0xb32
    814c:      	add	x2, x2, #0xb21
    8150:      	add	x3, x3, #0xc2d
    8154:      	b	0x7ed0 <.text+0x6ed0>
    8158:      	adrp	x1, 0xf000 <.text+0xe000>
    815c:      	adrp	x2, 0xf000 <.text+0xe000>
    8160:      	adrp	x3, 0xf000 <.text+0xe000>
    8164:      	add	x1, x1, #0xb32
    8168:      	add	x2, x2, #0xb21
    816c:      	add	x3, x3, #0xc3a
    8170:      	b	0x7ed0 <.text+0x6ed0>
    8174:      	ldr	x21, [sp]
    8178:      	mov	x20, xzr
    817c:      	str	x21, [x19]
    8180:      	b	0x7f00 <.text+0x6f00>
    8184:      	adrp	x21, 0xf000 <.text+0xe000>
    8188:      	adrp	x1, 0xf000 <.text+0xe000>
    818c:      	add	x21, x21, #0xb21
    8190:      	add	x1, x1, #0xd62
    8194:      	orr	w0, wzr, #0x80000000
    8198:      	mov	x2, x21
    819c:      	bl	0xac7c <.text+0x9c7c>
    81a0:      	adrp	x1, 0xf000 <.text+0xe000>
    81a4:      	add	x1, x1, #0xb6e
    81a8:      	orr	w0, wzr, #0x80000000
    81ac:      	mov	x2, x21
    81b0:      	b	0x7ef0 <.text+0x6ef0>
    81b4:      	adrp	x21, 0xf000 <.text+0xe000>
    81b8:      	adrp	x1, 0xf000 <.text+0xe000>
    81bc:      	add	x21, x21, #0xb21
    81c0:      	add	x1, x1, #0xd62
    81c4:      	orr	w0, wzr, #0x80000000
    81c8:      	mov	x2, x21
    81cc:      	bl	0xac7c <.text+0x9c7c>
    81d0:      	adrp	x1, 0xf000 <.text+0xe000>
    81d4:      	add	x1, x1, #0xb6e
    81d8:      	orr	w0, wzr, #0x80000000
    81dc:      	mov	x2, x21
    81e0:      	mov	x3, x20
    81e4:      	bl	0xac7c <.text+0x9c7c>
    81e8:      	mov	x0, x28
    81ec:      	bl	0xbf9c <.text+0xaf9c>
    81f0:      	b	0x7ef8 <.text+0x6ef8>
    81f4:      	stp	x20, x19, [sp, #-0x20]!
    81f8:      	stp	x29, x30, [sp, #0x10]
    81fc:      	add	x29, sp, #0x10
    8200:      	mov	x19, x0
    8204:      	cbz	x19, 0x8224 <.text+0x7224>
    8208:      	ldr	x0, [x19]
    820c:      	cbz	x0, 0x8214 <.text+0x7214>
    8210:      	bl	0xd1b8 <.text+0xc1b8>
    8214:      	ldp	x29, x30, [sp, #0x10]
    8218:      	mov	x0, x19
    821c:      	ldp	x20, x19, [sp], #0x20
    8220:      	b	0xbf9c <.text+0xaf9c>
    8224:      	ldp	x29, x30, [sp, #0x10]
    8228:      	ldp	x20, x19, [sp], #0x20
    822c:      	ret
    8230:      	stp	x20, x19, [sp, #-0x20]!
    8234:      	stp	x29, x30, [sp, #0x10]
    8238:      	add	x29, sp, #0x10
    823c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    8240:      	movk	x19, #0x2
    8244:      	cbz	x0, 0x8288 <.text+0x7288>
    8248:      	ldr	x8, [x0]
    824c:      	cbz	x8, 0x8294 <.text+0x7294>
    8250:      	ldrb	w9, [x8, #0x11]
    8254:      	cmp	w9, #0x1
    8258:      	b.ne	0x83d4 <.text+0x73d4>
    825c:      	ldr	x9, [x0, #0x8]
    8260:      	cbz	x9, 0x82b0 <.text+0x72b0>
    8264:      	ldr	x6, [x9]
    8268:      	cbz	x6, 0x82cc <.text+0x72cc>
    826c:      	ldr	x2, [x6]
    8270:      	cbz	x2, 0x82e8 <.text+0x72e8>
    8274:      	ldr	x11, [x6, #0x8]
    8278:      	cbz	x11, 0x8364 <.text+0x7364>
    827c:      	ldrb	w9, [x2, #0x4]
    8280:      	mov	x13, xzr
    8284:      	b	0x830c <.text+0x730c>
    8288:      	adrp	x1, 0xf000 <.text+0xe000>
    828c:      	add	x1, x1, #0xb98
    8290:      	b	0x83dc <.text+0x73dc>
    8294:      	adrp	x1, 0xf000 <.text+0xe000>
    8298:      	adrp	x2, 0xf000 <.text+0xe000>
    829c:      	adrp	x3, 0xf000 <.text+0xe000>
    82a0:      	add	x1, x1, #0xb32
    82a4:      	add	x2, x2, #0xbae
    82a8:      	add	x3, x3, #0xbc4
    82ac:      	b	0x837c <.text+0x737c>
    82b0:      	adrp	x1, 0xf000 <.text+0xe000>
    82b4:      	adrp	x2, 0xf000 <.text+0xe000>
    82b8:      	adrp	x3, 0xf000 <.text+0xe000>
    82bc:      	add	x1, x1, #0xb32
    82c0:      	add	x2, x2, #0xbae
    82c4:      	add	x3, x3, #0xbd5
    82c8:      	b	0x837c <.text+0x737c>
    82cc:      	adrp	x1, 0xf000 <.text+0xe000>
    82d0:      	adrp	x2, 0xf000 <.text+0xe000>
    82d4:      	adrp	x3, 0xf000 <.text+0xe000>
    82d8:      	add	x1, x1, #0xb32
    82dc:      	add	x2, x2, #0xbae
    82e0:      	add	x3, x3, #0xbea
    82e4:      	b	0x837c <.text+0x737c>
    82e8:      	adrp	x1, 0xf000 <.text+0xe000>
    82ec:      	adrp	x2, 0xf000 <.text+0xe000>
    82f0:      	adrp	x3, 0xf000 <.text+0xe000>
    82f4:      	add	x1, x1, #0xb32
    82f8:      	add	x2, x2, #0xbae
    82fc:      	add	x3, x3, #0xbf9
    8300:      	b	0x837c <.text+0x737c>
    8304:      	add	x13, x13, #0x1
    8308:      	add	x11, x11, #0x8
    830c:      	cmp	x13, x9
    8310:      	b.hs	0x8388 <.text+0x7388>
    8314:      	ldr	x7, [x11]
    8318:      	cbz	x7, 0x83fc <.text+0x73fc>
    831c:      	ldr	x5, [x7]
    8320:      	cbz	x5, 0x8418 <.text+0x7418>
    8324:      	ldr	x15, [x7, #0x8]
    8328:      	cbz	x15, 0x8434 <.text+0x7434>
    832c:      	ldrb	w10, [x5, #0x4]
    8330:      	mov	x17, xzr
    8334:      	cmp	x17, x10
    8338:      	b.hs	0x8304 <.text+0x7304>
    833c:      	ldr	x16, [x15], #0x8
    8340:      	add	x17, x17, #0x1
    8344:      	cbnz	x16, 0x8334 <.text+0x7334>
    8348:      	adrp	x1, 0xf000 <.text+0xe000>
    834c:      	adrp	x2, 0xf000 <.text+0xe000>
    8350:      	adrp	x3, 0xf000 <.text+0xe000>
    8354:      	add	x1, x1, #0xb32
    8358:      	add	x2, x2, #0xbae
    835c:      	add	x3, x3, #0xc5d
    8360:      	b	0x837c <.text+0x737c>
    8364:      	adrp	x1, 0xf000 <.text+0xe000>
    8368:      	adrp	x2, 0xf000 <.text+0xe000>
    836c:      	adrp	x3, 0xf000 <.text+0xe000>
    8370:      	add	x1, x1, #0xb32
    8374:      	add	x2, x2, #0xbae
    8378:      	add	x3, x3, #0xc03
    837c:      	orr	w0, wzr, #0x80000000
    8380:      	bl	0xac7c <.text+0x9c7c>
    8384:      	b	0x83ec <.text+0x73ec>
    8388:      	cbz	x1, 0x8604 <.text+0x7604>
    838c:      	ldr	x9, [x1]
    8390:      	cbz	x9, 0x8450 <.text+0x7450>
    8394:      	ldr	x15, [x1, #0x10]
    8398:      	cbz	x15, 0x846c <.text+0x746c>
    839c:      	ldrb	w10, [x9, #0x11]
    83a0:      	cmp	w10, #0x1
    83a4:      	b.ne	0x83d4 <.text+0x73d4>
    83a8:      	ldr	x10, [x1, #0x8]
    83ac:      	cbz	x10, 0x8488 <.text+0x7488>
    83b0:      	ldr	x1, [x10]
    83b4:      	cbz	x1, 0x84a4 <.text+0x74a4>
    83b8:      	ldr	x3, [x1]
    83bc:      	cbz	x3, 0x84c0 <.text+0x74c0>
    83c0:      	ldr	x10, [x1, #0x8]
    83c4:      	cbz	x10, 0x84dc <.text+0x74dc>
    83c8:      	ldrb	w11, [x3, #0x4]
    83cc:      	mov	x12, xzr
    83d0:      	b	0x8500 <.text+0x7500>
    83d4:      	adrp	x1, 0xf000 <.text+0xe000>
    83d8:      	add	x1, x1, #0xb49
    83dc:      	adrp	x2, 0xf000 <.text+0xe000>
    83e0:      	add	x2, x2, #0xbae
    83e4:      	orr	w0, wzr, #0x80000000
    83e8:      	bl	0xac7c <.text+0x9c7c>
    83ec:      	ldp	x29, x30, [sp, #0x10]
    83f0:      	mov	x0, x19
    83f4:      	ldp	x20, x19, [sp], #0x20
    83f8:      	ret
    83fc:      	adrp	x1, 0xf000 <.text+0xe000>
    8400:      	adrp	x2, 0xf000 <.text+0xe000>
    8404:      	adrp	x3, 0xf000 <.text+0xe000>
    8408:      	add	x1, x1, #0xb32
    840c:      	add	x2, x2, #0xbae
    8410:      	add	x3, x3, #0xc1b
    8414:      	b	0x837c <.text+0x737c>
    8418:      	adrp	x1, 0xf000 <.text+0xe000>
    841c:      	adrp	x2, 0xf000 <.text+0xe000>
    8420:      	adrp	x3, 0xf000 <.text+0xe000>
    8424:      	add	x1, x1, #0xb32
    8428:      	add	x2, x2, #0xbae
    842c:      	add	x3, x3, #0xc2d
    8430:      	b	0x837c <.text+0x737c>
    8434:      	adrp	x1, 0xf000 <.text+0xe000>
    8438:      	adrp	x2, 0xf000 <.text+0xe000>
    843c:      	adrp	x3, 0xf000 <.text+0xe000>
    8440:      	add	x1, x1, #0xb32
    8444:      	add	x2, x2, #0xbae
    8448:      	add	x3, x3, #0xc3a
    844c:      	b	0x837c <.text+0x737c>
    8450:      	adrp	x1, 0xf000 <.text+0xe000>
    8454:      	adrp	x2, 0xf000 <.text+0xe000>
    8458:      	adrp	x3, 0xf000 <.text+0xe000>
    845c:      	add	x1, x1, #0xb32
    8460:      	add	x2, x2, #0xbae
    8464:      	add	x3, x3, #0xbc1
    8468:      	b	0x837c <.text+0x737c>
    846c:      	adrp	x1, 0xf000 <.text+0xe000>
    8470:      	adrp	x2, 0xf000 <.text+0xe000>
    8474:      	adrp	x3, 0xf000 <.text+0xe000>
    8478:      	add	x1, x1, #0xb32
    847c:      	add	x2, x2, #0xbae
    8480:      	add	x3, x3, #0xbcb
    8484:      	b	0x837c <.text+0x737c>
    8488:      	adrp	x1, 0xf000 <.text+0xe000>
    848c:      	adrp	x2, 0xf000 <.text+0xe000>
    8490:      	adrp	x3, 0xf000 <.text+0xe000>
    8494:      	add	x1, x1, #0xb32
    8498:      	add	x2, x2, #0xbae
    849c:      	add	x3, x3, #0xbd2
    84a0:      	b	0x837c <.text+0x737c>
    84a4:      	adrp	x1, 0xf000 <.text+0xe000>
    84a8:      	adrp	x2, 0xf000 <.text+0xe000>
    84ac:      	adrp	x3, 0xf000 <.text+0xe000>
    84b0:      	add	x1, x1, #0xb32
    84b4:      	add	x2, x2, #0xbae
    84b8:      	add	x3, x3, #0xbe7
    84bc:      	b	0x837c <.text+0x737c>
    84c0:      	adrp	x1, 0xf000 <.text+0xe000>
    84c4:      	adrp	x2, 0xf000 <.text+0xe000>
    84c8:      	adrp	x3, 0xf000 <.text+0xe000>
    84cc:      	add	x1, x1, #0xb32
    84d0:      	add	x2, x2, #0xbae
    84d4:      	add	x3, x3, #0xbf6
    84d8:      	b	0x837c <.text+0x737c>
    84dc:      	adrp	x1, 0xf000 <.text+0xe000>
    84e0:      	adrp	x2, 0xf000 <.text+0xe000>
    84e4:      	adrp	x3, 0xf000 <.text+0xe000>
    84e8:      	add	x1, x1, #0xb32
    84ec:      	add	x2, x2, #0xbae
    84f0:      	add	x3, x3, #0xc00
    84f4:      	b	0x837c <.text+0x737c>
    84f8:      	add	x12, x12, #0x1
    84fc:      	add	x10, x10, #0x8
    8500:      	cmp	x12, x11
    8504:      	b.hs	0x85a4 <.text+0x75a4>
    8508:      	ldr	x0, [x10]
    850c:      	cbz	x0, 0x860c <.text+0x760c>
    8510:      	ldr	x4, [x0]
    8514:      	cbz	x4, 0x8628 <.text+0x7628>
    8518:      	ldr	x14, [x0, #0x8]
    851c:      	cbz	x14, 0x8644 <.text+0x7644>
    8520:      	ldrb	w13, [x4, #0x4]
    8524:      	mov	x16, xzr
    8528:      	cmp	x16, x13
    852c:      	b.hs	0x84f8 <.text+0x74f8>
    8530:      	ldr	x15, [x14]
    8534:      	cbz	x15, 0x856c <.text+0x756c>
    8538:      	ldr	x4, [x15]
    853c:      	cbz	x4, 0x8588 <.text+0x7588>
    8540:      	ldr	x5, [x15, #0x8]
    8544:      	add	x16, x16, #0x1
    8548:      	add	x14, x14, #0x8
    854c:      	cbnz	x5, 0x8528 <.text+0x7528>
    8550:      	adrp	x1, 0xf000 <.text+0xe000>
    8554:      	adrp	x2, 0xf000 <.text+0xe000>
    8558:      	adrp	x3, 0xf000 <.text+0xe000>
    855c:      	add	x1, x1, #0xb32
    8560:      	add	x2, x2, #0xbae
    8564:      	add	x3, x3, #0xc66
    8568:      	b	0x837c <.text+0x737c>
    856c:      	adrp	x1, 0xf000 <.text+0xe000>
    8570:      	adrp	x2, 0xf000 <.text+0xe000>
    8574:      	adrp	x3, 0xf000 <.text+0xe000>
    8578:      	add	x1, x1, #0xb32
    857c:      	add	x2, x2, #0xbae
    8580:      	add	x3, x3, #0xc49
    8584:      	b	0x837c <.text+0x737c>
    8588:      	adrp	x1, 0xf000 <.text+0xe000>
    858c:      	adrp	x2, 0xf000 <.text+0xe000>
    8590:      	adrp	x3, 0xf000 <.text+0xe000>
    8594:      	add	x1, x1, #0xb32
    8598:      	add	x2, x2, #0xbae
    859c:      	add	x3, x3, #0xc5a
    85a0:      	b	0x837c <.text+0x737c>
    85a4:      	ldrb	w11, [x8, #0x4]
    85a8:      	ldrb	w12, [x9, #0x4]
    85ac:      	cmp	w11, w12
    85b0:      	b.ne	0x8660 <.text+0x7660>
    85b4:      	ldrb	w14, [x8, #0x5]
    85b8:      	ldrb	w15, [x9, #0x5]
    85bc:      	cmp	w14, w15
    85c0:      	b.ne	0x866c <.text+0x766c>
    85c4:      	ldrb	w17, [x8, #0x9]
    85c8:      	ldrb	w0, [x8, #0x8]
    85cc:      	ldrb	w1, [x9, #0x9]
    85d0:      	ldrb	w2, [x9, #0x8]
    85d4:      	bfi	w0, w17, #8, #8
    85d8:      	bfi	w2, w1, #8, #8
    85dc:      	cmp	w0, w2
    85e0:      	b.ne	0x8678 <.text+0x7678>
    85e4:      	ldrb	w4, [x8, #0xb]
    85e8:      	ldrb	w8, [x8, #0xa]
    85ec:      	ldrb	w5, [x9, #0xb]
    85f0:      	ldrb	w6, [x9, #0xa]
    85f4:      	bfi	w8, w4, #8, #8
    85f8:      	bfi	w6, w5, #8, #8
    85fc:      	cmp	w8, w6
    8600:      	b.ne	0x8684 <.text+0x7684>
    8604:      	mov	x19, xzr
    8608:      	b	0x83ec <.text+0x73ec>
    860c:      	adrp	x1, 0xf000 <.text+0xe000>
    8610:      	adrp	x2, 0xf000 <.text+0xe000>
    8614:      	adrp	x3, 0xf000 <.text+0xe000>
    8618:      	add	x1, x1, #0xb32
    861c:      	add	x2, x2, #0xbae
    8620:      	add	x3, x3, #0xc18
    8624:      	b	0x837c <.text+0x737c>
    8628:      	adrp	x1, 0xf000 <.text+0xe000>
    862c:      	adrp	x2, 0xf000 <.text+0xe000>
    8630:      	adrp	x3, 0xf000 <.text+0xe000>
    8634:      	add	x1, x1, #0xb32
    8638:      	add	x2, x2, #0xbae
    863c:      	add	x3, x3, #0xc2a
    8640:      	b	0x837c <.text+0x737c>
    8644:      	adrp	x1, 0xf000 <.text+0xe000>
    8648:      	adrp	x2, 0xf000 <.text+0xe000>
    864c:      	adrp	x3, 0xf000 <.text+0xe000>
    8650:      	add	x1, x1, #0xb32
    8654:      	add	x2, x2, #0xbae
    8658:      	add	x3, x3, #0xc37
    865c:      	b	0x837c <.text+0x737c>
    8660:      	adrp	x1, 0xf000 <.text+0xe000>
    8664:      	add	x1, x1, #0xc7c
    8668:      	b	0x868c <.text+0x768c>
    866c:      	adrp	x1, 0xf000 <.text+0xe000>
    8670:      	add	x1, x1, #0xc96
    8674:      	b	0x868c <.text+0x768c>
    8678:      	adrp	x1, 0xf000 <.text+0xe000>
    867c:      	add	x1, x1, #0xcb3
    8680:      	b	0x868c <.text+0x768c>
    8684:      	adrp	x1, 0xf000 <.text+0xe000>
    8688:      	add	x1, x1, #0xccb
    868c:      	adrp	x2, 0xf000 <.text+0xe000>
    8690:      	add	x2, x2, #0xbae
    8694:      	orr	w0, wzr, #0x80000000
    8698:      	bl	0xac7c <.text+0x9c7c>
    869c:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    86a0:      	b	0x83ec <.text+0x73ec>
    86a4:      	stp	x22, x21, [sp, #-0x30]!
    86a8:      	stp	x20, x19, [sp, #0x10]
    86ac:      	stp	x29, x30, [sp, #0x20]
    86b0:      	add	x29, sp, #0x20
    86b4:      	mov	w19, w2
    86b8:      	mov	x20, x0
    86bc:      	cbz	x20, 0x8704 <.text+0x7704>
    86c0:      	cbz	x1, 0x8704 <.text+0x7704>
    86c4:      	cbz	w19, 0x8704 <.text+0x7704>
    86c8:      	mov	x21, xzr
    86cc:      	b	0x86ec <.text+0x76ec>
    86d0:      	ldr	w9, [x20]
    86d4:      	add	x22, x1, #0x10
    86d8:      	ldr	w10, [x1]
    86dc:      	add	w0, w10, w9
    86e0:      	bl	0xcc88 <.text+0xbc88>
    86e4:      	add	x21, x21, #0x1
    86e8:      	mov	x1, x22
    86ec:      	cmp	w21, w19
    86f0:      	b.ne	0x86d0 <.text+0x76d0>
    86f4:      	ldp	x29, x30, [sp, #0x20]
    86f8:      	ldp	x20, x19, [sp, #0x10]
    86fc:      	ldp	x22, x21, [sp], #0x30
    8700:      	ret
    8704:      	ldp	x29, x30, [sp, #0x20]
    8708:      	adrp	x1, 0xf000 <.text+0xe000>
    870c:      	ldp	x20, x19, [sp, #0x10]
    8710:      	adrp	x2, 0xf000 <.text+0xe000>
    8714:      	adrp	x3, 0xf000 <.text+0xe000>
    8718:      	add	x1, x1, #0xce4
    871c:      	add	x2, x2, #0xd11
    8720:      	add	x3, x3, #0xd1d
    8724:      	orr	w0, wzr, #0x80000000
    8728:      	ldp	x22, x21, [sp], #0x30
    872c:      	b	0xac7c <.text+0x9c7c>
    8730:      	stp	x22, x21, [sp, #-0x30]!
    8734:      	stp	x20, x19, [sp, #0x10]
    8738:      	stp	x29, x30, [sp, #0x20]
    873c:      	add	x29, sp, #0x20
    8740:      	mov	w19, #-0x80000000       // =-2147483648
    8744:      	mov	x21, x1
    8748:      	mov	x20, x0
    874c:      	movk	w19, #0x2
    8750:      	cbz	x20, 0x87e0 <.text+0x77e0>
    8754:      	cbz	x21, 0x87e0 <.text+0x77e0>
    8758:      	mov	w9, #0xc120             // =49440
    875c:      	str	w21, [x20]
    8760:      	add	w0, w21, w9
    8764:      	bl	0xcc88 <.text+0xbc88>
    8768:      	mov	w11, #0xc144            // =49476
    876c:      	str	w0, [x20, #0x4]
    8770:      	add	w8, w21, w11
    8774:      	mov	x0, x8
    8778:      	bl	0xcc88 <.text+0xbc88>
    877c:      	ubfx	w8, w0, #15, #6
    8780:      	strb	w8, [x20, #0x8]
    8784:      	cbz	w8, 0x8804 <.text+0x7804>
    8788:      	and	w8, w8, #0xff
    878c:      	orr	w9, wzr, #0x18
    8790:      	mul	x0, x8, x9
    8794:      	bl	0xbf44 <.text+0xaf44>
    8798:      	str	x0, [x20, #0x10]
    879c:      	cbz	x0, 0x882c <.text+0x782c>
    87a0:      	mov	x8, xzr
    87a4:      	strb	wzr, [x20, #0x9]
    87a8:      	add	x9, x20, #0x28
    87ac:      	mov	w10, #0xfeff            // =65279
    87b0:      	b	0x87d0 <.text+0x77d0>
    87b4:      	add	x11, x9, #0x20
    87b8:      	stur	wzr, [x9, #-0x10]
    87bc:      	add	x8, x8, #0x1
    87c0:      	sturh	w10, [x9, #-0xc]
    87c4:      	stur	xzr, [x9, #-0x8]
    87c8:      	str	xzr, [x9]
    87cc:      	mov	x9, x11
    87d0:      	cmp	x8, #0x20
    87d4:      	b.ne	0x87b4 <.text+0x77b4>
    87d8:      	mov	w19, wzr
    87dc:      	b	0x8850 <.text+0x7850>
    87e0:      	adrp	x1, 0xf000 <.text+0xe000>
    87e4:      	adrp	x2, 0xf000 <.text+0xe000>
    87e8:      	adrp	x3, 0xf000 <.text+0xe000>
    87ec:      	add	x1, x1, #0xce4
    87f0:      	add	x2, x2, #0xd21
    87f4:      	add	x3, x3, #0xd2f
    87f8:      	orr	w0, wzr, #0x80000000
    87fc:      	bl	0xac7c <.text+0x9c7c>
    8800:      	b	0x8850 <.text+0x7850>
    8804:      	adrp	x1, 0xf000 <.text+0xe000>
    8808:      	adrp	x2, 0xf000 <.text+0xe000>
    880c:      	adrp	x3, 0xf000 <.text+0xe000>
    8810:      	add	x1, x1, #0xd34
    8814:      	add	x2, x2, #0xd21
    8818:      	add	x3, x3, #0xd2f
    881c:      	orr	w0, wzr, #0x80000000
    8820:      	bl	0xac7c <.text+0x9c7c>
    8824:      	add	w19, w19, #0x4
    8828:      	b	0x8850 <.text+0x7850>
    882c:      	adrp	x1, 0xf000 <.text+0xe000>
    8830:      	adrp	x2, 0xf000 <.text+0xe000>
    8834:      	adrp	x3, 0xf000 <.text+0xe000>
    8838:      	add	x1, x1, #0xd5f
    883c:      	add	x2, x2, #0xd21
    8840:      	add	x3, x3, #0xd2f
    8844:      	orr	w0, wzr, #0x80000000
    8848:      	bl	0xac7c <.text+0x9c7c>
    884c:      	add	w19, w19, #0x3
    8850:      	mov	w0, w19
    8854:      	ldp	x29, x30, [sp, #0x20]
    8858:      	ldp	x20, x19, [sp, #0x10]
    885c:      	ldp	x22, x21, [sp], #0x30
    8860:      	ret
    8864:      	cbz	x0, 0x8914 <.text+0x7914>
    8868:      	stp	x24, x23, [sp, #-0x40]!
    886c:      	stp	x22, x21, [sp, #0x10]
    8870:      	stp	x20, x19, [sp, #0x20]
    8874:      	stp	x29, x30, [sp, #0x30]
    8878:      	add	x29, sp, #0x30
    887c:      	add	x22, x0, #0x58
    8880:      	orr	w19, wzr, #0x2
    8884:      	orr	w20, wzr, #0xff
    8888:      	orr	w21, wzr, #0xfe
    888c:      	b	0x8898 <.text+0x7898>
    8890:      	add	x19, x19, #0x1
    8894:      	mov	x22, x23
    8898:      	cmp	x19, #0x10
    889c:      	b.eq	0x88fc <.text+0x78fc>
    88a0:      	ldr	w8, [x22]
    88a4:      	add	x23, x22, #0x20
    88a8:      	cbz	w8, 0x8890 <.text+0x7890>
    88ac:      	ldr	x8, [x22, #0x8]
    88b0:      	str	wzr, [x22]
    88b4:      	strb	w20, [x22, #0x4]
    88b8:      	strb	w21, [x22, #0x5]
    88bc:      	str	wzr, [x22, #0x18]
    88c0:      	str	xzr, [x8, #0x10]
    88c4:      	ldr	x9, [x22, #0x8]
    88c8:      	str	wzr, [x9, #0x18]
    88cc:      	ldr	x10, [x22, #0x8]
    88d0:      	str	xzr, [x10, #0x20]
    88d4:      	ldr	x11, [x22, #0x8]
    88d8:      	str	xzr, [x11, #0x28]
    88dc:      	ldr	x12, [x22, #0x8]
    88e0:      	str	wzr, [x12, #0x30]
    88e4:      	ldr	x0, [x22, #0x8]
    88e8:      	cbz	x0, 0x88f4 <.text+0x78f4>
    88ec:      	bl	0xbf9c <.text+0xaf9c>
    88f0:      	str	xzr, [x22, #0x8]
    88f4:      	str	xzr, [x22, #0x10]
    88f8:      	b	0x8890 <.text+0x7890>
    88fc:      	ldp	x29, x30, [sp, #0x30]
    8900:      	mov	w0, wzr
    8904:      	ldp	x20, x19, [sp, #0x20]
    8908:      	ldp	x22, x21, [sp, #0x10]
    890c:      	ldp	x24, x23, [sp], #0x40
    8910:      	ret
    8914:      	mov	w0, #-0x80000000        // =-2147483648
    8918:      	movk	w0, #0x2
    891c:      	ret
    8920:      	stp	x24, x23, [sp, #-0x40]!
    8924:      	stp	x22, x21, [sp, #0x10]
    8928:      	stp	x20, x19, [sp, #0x20]
    892c:      	stp	x29, x30, [sp, #0x30]
    8930:      	add	x29, sp, #0x30
    8934:      	mov	x19, x0
    8938:      	cbz	x19, 0x8a24 <.text+0x7a24>
    893c:      	mov	w8, wzr
    8940:      	str	wzr, [x19]
    8944:      	orr	w9, wzr, #0x18
    8948:      	strb	wzr, [x19, #0x8]
    894c:      	b	0x897c <.text+0x797c>
    8950:      	mov	w10, w8
    8954:      	ldr	x11, [x19, #0x10]
    8958:      	add	w8, w8, #0x1
    895c:      	mul	x12, x10, x9
    8960:      	str	xzr, [x11, x12]
    8964:      	ldr	x11, [x19, #0x10]
    8968:      	add	x10, x11, x12
    896c:      	str	xzr, [x10, #0x8]
    8970:      	ldr	x13, [x19, #0x10]
    8974:      	add	x12, x13, x12
    8978:      	str	wzr, [x12, #0x10]
    897c:      	ldrb	w10, [x19, #0x9]
    8980:      	cmp	w8, w10
    8984:      	b.lo	0x8950 <.text+0x7950>
    8988:      	ldr	x0, [x19, #0x10]
    898c:      	strb	wzr, [x19, #0x9]
    8990:      	cbz	x0, 0x899c <.text+0x799c>
    8994:      	bl	0xbf9c <.text+0xaf9c>
    8998:      	str	xzr, [x19, #0x10]
    899c:      	mov	x20, xzr
    89a0:      	add	x22, x19, #0x18
    89a4:      	orr	w19, wzr, #0xff
    89a8:      	orr	w21, wzr, #0xfe
    89ac:      	b	0x89b8 <.text+0x79b8>
    89b0:      	add	x20, x20, #0x1
    89b4:      	mov	x22, x23
    89b8:      	cmp	x20, #0x10
    89bc:      	b.eq	0x8a1c <.text+0x7a1c>
    89c0:      	ldr	w8, [x22]
    89c4:      	add	x23, x22, #0x20
    89c8:      	cbz	w8, 0x89b0 <.text+0x79b0>
    89cc:      	ldr	x8, [x22, #0x8]
    89d0:      	str	wzr, [x22]
    89d4:      	strb	w19, [x22, #0x4]
    89d8:      	strb	w21, [x22, #0x5]
    89dc:      	str	wzr, [x22, #0x18]
    89e0:      	str	xzr, [x8, #0x10]
    89e4:      	ldr	x9, [x22, #0x8]
    89e8:      	str	wzr, [x9, #0x18]
    89ec:      	ldr	x13, [x22, #0x8]
    89f0:      	str	xzr, [x13, #0x20]
    89f4:      	ldr	x14, [x22, #0x8]
    89f8:      	str	xzr, [x14, #0x28]
    89fc:      	ldr	x15, [x22, #0x8]
    8a00:      	str	wzr, [x15, #0x30]
    8a04:      	ldr	x0, [x22, #0x8]
    8a08:      	cbz	x0, 0x8a14 <.text+0x7a14>
    8a0c:      	bl	0xbf9c <.text+0xaf9c>
    8a10:      	str	xzr, [x22, #0x8]
    8a14:      	str	xzr, [x22, #0x10]
    8a18:      	b	0x89b0 <.text+0x79b0>
    8a1c:      	mov	w0, wzr
    8a20:      	b	0x8a2c <.text+0x7a2c>
    8a24:      	mov	w0, #-0x80000000        // =-2147483648
    8a28:      	movk	w0, #0x2
    8a2c:      	ldp	x29, x30, [sp, #0x30]
    8a30:      	ldp	x20, x19, [sp, #0x20]
    8a34:      	ldp	x22, x21, [sp, #0x10]
    8a38:      	ldp	x24, x23, [sp], #0x40
    8a3c:      	ret
    8a40:      	stp	x24, x23, [sp, #-0x40]!
    8a44:      	stp	x22, x21, [sp, #0x10]
    8a48:      	stp	x20, x19, [sp, #0x20]
    8a4c:      	stp	x29, x30, [sp, #0x30]
    8a50:      	add	x29, sp, #0x30
    8a54:      	mov	w23, #-0x80000000       // =-2147483648
    8a58:      	mov	w20, w4
    8a5c:      	mov	w21, w3
    8a60:      	mov	x22, x2
    8a64:      	mov	x19, x0
    8a68:      	movk	w23, #0x2
    8a6c:      	cbz	x1, 0x8a98 <.text+0x7a98>
    8a70:      	cbz	x22, 0x8a98 <.text+0x7a98>
    8a74:      	and	w8, w21, #0x3
    8a78:      	cbnz	w8, 0x8a98 <.text+0x7a98>
    8a7c:      	cbz	w21, 0x8a98 <.text+0x7a98>
    8a80:      	cbz	x19, 0x8a98 <.text+0x7a98>
    8a84:      	cbz	x5, 0x8a98 <.text+0x7a98>
    8a88:      	mov	w8, w21
    8a8c:      	udiv	x9, x22, x8
    8a90:      	msub	x10, x9, x8, x22
    8a94:      	cbz	x10, 0x8ad0 <.text+0x7ad0>
    8a98:      	adrp	x1, 0xf000 <.text+0xe000>
    8a9c:      	adrp	x2, 0xf000 <.text+0xe000>
    8aa0:      	adrp	x3, 0xf000 <.text+0xe000>
    8aa4:      	add	x1, x1, #0xce4
    8aa8:      	add	x2, x2, #0xd80
    8aac:      	add	x3, x3, #0xd2f
    8ab0:      	orr	w0, wzr, #0x80000000
    8ab4:      	bl	0xac7c <.text+0x9c7c>
    8ab8:      	ldp	x29, x30, [sp, #0x30]
    8abc:      	mov	w0, w23
    8ac0:      	ldp	x20, x19, [sp, #0x20]
    8ac4:      	ldp	x22, x21, [sp, #0x10]
    8ac8:      	ldp	x24, x23, [sp], #0x40
    8acc:      	ret
    8ad0:      	ldrb	w24, [x19, #0x9]
    8ad4:      	ldrb	w8, [x19, #0x8]
    8ad8:      	cmp	w24, w8
    8adc:      	b.hs	0x8b84 <.text+0x7b84>
    8ae0:      	add	w9, w24, #0x1
    8ae4:      	orr	w11, wzr, #0x18
    8ae8:      	strb	w9, [x19, #0x9]
    8aec:      	mul	x12, x24, x11
    8af0:      	strb	w24, [x5]
    8af4:      	ldr	x8, [x19, #0x10]
    8af8:      	str	x1, [x8, x12]
    8afc:      	ldr	x13, [x19, #0x10]
    8b00:      	add	x9, x13, x12
    8b04:      	str	x1, [x9, #0x8]
    8b08:      	lsr	x1, x22, #32
    8b0c:      	ldr	x14, [x19, #0x10]
    8b10:      	add	x10, x14, x12
    8b14:      	mov	w12, #0xc404            // =50180
    8b18:      	str	w21, [x10, #0x10]
    8b1c:      	ldr	w10, [x19]
    8b20:      	add	w11, w10, w24, lsl #4
    8b24:      	add	w0, w11, w12
    8b28:      	bl	0xccc0 <.text+0xbcc0>
    8b2c:      	ldr	w13, [x19]
    8b30:      	mov	w15, #0xc400            // =50176
    8b34:      	mov	w1, w22
    8b38:      	add	w14, w13, w24, lsl #4
    8b3c:      	add	w0, w14, w15
    8b40:      	bl	0xccc0 <.text+0xbcc0>
    8b44:      	ldr	w16, [x19]
    8b48:      	orr	w10, w21, #0x80000000
    8b4c:      	tst	w20, #0xff
    8b50:      	mov	w2, #0xc408             // =50184
    8b54:      	csel	w1, w10, w21, eq
    8b58:      	add	w0, w16, w24, lsl #4
    8b5c:      	add	w0, w0, w2
    8b60:      	bl	0xccc0 <.text+0xbcc0>
    8b64:      	ldr	w3, [x19]
    8b68:      	mov	w5, #0xc40c             // =50188
    8b6c:      	mov	w1, wzr
    8b70:      	add	w4, w3, w24, lsl #4
    8b74:      	add	w0, w4, w5
    8b78:      	bl	0xccc0 <.text+0xbcc0>
    8b7c:      	mov	w23, wzr
    8b80:      	b	0x8ab8 <.text+0x7ab8>
    8b84:      	adrp	x1, 0xf000 <.text+0xe000>
    8b88:      	adrp	x2, 0xf000 <.text+0xe000>
    8b8c:      	adrp	x3, 0xf000 <.text+0xe000>
    8b90:      	add	x1, x1, #0xd98
    8b94:      	add	x2, x2, #0xd80
    8b98:      	add	x3, x3, #0xd2f
    8b9c:      	orr	w0, wzr, #0x80000000
    8ba0:      	bl	0xac7c <.text+0x9c7c>
    8ba4:      	add	w23, w23, #0x3
    8ba8:      	b	0x8ab8 <.text+0x7ab8>
    8bac:      	stp	x26, x25, [sp, #-0x50]!
    8bb0:      	stp	x24, x23, [sp, #0x10]
    8bb4:      	stp	x22, x21, [sp, #0x20]
    8bb8:      	stp	x20, x19, [sp, #0x30]
    8bbc:      	stp	x29, x30, [sp, #0x40]
    8bc0:      	add	x29, sp, #0x40
    8bc4:      	mov	w19, #-0x80000000       // =-2147483648
    8bc8:      	mov	w23, w7
    8bcc:      	mov	x21, x6
    8bd0:      	mov	x22, x5
    8bd4:      	mov	w20, w4
    8bd8:      	movk	w19, #0x2
    8bdc:      	cbz	x0, 0x8c6c <.text+0x7c6c>
    8be0:      	and	w8, w1, #0xff
    8be4:      	cmp	w8, #0xf
    8be8:      	and	w8, w2, #0xff
    8bec:      	ccmp	w8, #0x1, #0x2, ls
    8bf0:      	b.hi	0x8c6c <.text+0x7c6c>
    8bf4:      	ldrb	w9, [x0, #0x9]
    8bf8:      	cmp	w9, w20, uxtb
    8bfc:      	b.ls	0x8c6c <.text+0x7c6c>
    8c00:      	mov	w24, w23
    8c04:      	cbz	x21, 0x8c6c <.text+0x7c6c>
    8c08:      	cmp	w23, #0x30
    8c0c:      	b.lo	0x8c6c <.text+0x7c6c>
    8c10:      	and	w10, w23, #0xf
    8c14:      	cbnz	w10, 0x8c6c <.text+0x7c6c>
    8c18:      	cmp	w3, #0x400
    8c1c:      	b.hi	0x8c6c <.text+0x7c6c>
    8c20:      	cbz	x22, 0x8c6c <.text+0x7c6c>
    8c24:      	and	x8, x21, #0xf
    8c28:      	cbnz	x8, 0x8c6c <.text+0x7c6c>
    8c2c:      	add	w8, w2, w1, lsl #1
    8c30:      	and	x4, x8, #0xff
    8c34:      	add	x25, x0, x4, lsl #5
    8c38:      	mov	x26, x25
    8c3c:      	ldr	w12, [x26, #0x18]!
    8c40:      	cbz	w12, 0x8ca8 <.text+0x7ca8>
    8c44:      	adrp	x1, 0xf000 <.text+0xe000>
    8c48:      	adrp	x2, 0xf000 <.text+0xe000>
    8c4c:      	adrp	x3, 0xf000 <.text+0xe000>
    8c50:      	add	x1, x1, #0xdf6
    8c54:      	add	x2, x2, #0xde7
    8c58:      	add	x3, x3, #0xd2f
    8c5c:      	orr	w0, wzr, #0x80000000
    8c60:      	bl	0xac7c <.text+0x9c7c>
    8c64:      	add	w19, w19, #0x2
    8c68:      	b	0x8c8c <.text+0x7c8c>
    8c6c:      	adrp	x1, 0xf000 <.text+0xe000>
    8c70:      	adrp	x2, 0xf000 <.text+0xe000>
    8c74:      	adrp	x3, 0xf000 <.text+0xe000>
    8c78:      	add	x1, x1, #0xce4
    8c7c:      	add	x2, x2, #0xde7
    8c80:      	add	x3, x3, #0xd2f
    8c84:      	orr	w0, wzr, #0x80000000
    8c88:      	bl	0xac7c <.text+0x9c7c>
    8c8c:      	mov	w0, w19
    8c90:      	ldp	x29, x30, [sp, #0x40]
    8c94:      	ldp	x20, x19, [sp, #0x30]
    8c98:      	ldp	x22, x21, [sp, #0x20]
    8c9c:      	ldp	x24, x23, [sp, #0x10]
    8ca0:      	ldp	x26, x25, [sp], #0x50
    8ca4:      	ret
    8ca8:      	orr	w0, wzr, #0x38
    8cac:      	str	w3, [x25, #0x30]
    8cb0:      	bl	0xbf44 <.text+0xaf44>
    8cb4:      	cbz	x0, 0x8cfc <.text+0x7cfc>
    8cb8:      	add	x9, x24, x22
    8cbc:      	str	w23, [x0, #0x18]
    8cc0:      	stp	x22, x21, [x0]
    8cc4:      	mov	w19, wzr
    8cc8:      	str	x22, [x0, #0x10]
    8ccc:      	orr	w13, wzr, #0x80
    8cd0:      	stp	x22, x22, [x0, #0x20]
    8cd4:      	orr	w14, wzr, #0x1
    8cd8:      	str	wzr, [x0, #0x30]
    8cdc:      	stur	w21, [x9, #-0x10]
    8ce0:      	ldr	w10, [x0, #0xc]
    8ce4:      	stp	w10, wzr, [x9, #-0xc]
    8ce8:      	stur	w13, [x9, #-0x4]
    8cec:      	str	x0, [x25, #0x20]
    8cf0:      	strb	w20, [x25, #0x1d]
    8cf4:      	str	w14, [x26]
    8cf8:      	b	0x8c8c <.text+0x7c8c>
    8cfc:      	adrp	x1, 0xf000 <.text+0xe000>
    8d00:      	adrp	x2, 0xf000 <.text+0xe000>
    8d04:      	adrp	x3, 0xf000 <.text+0xe000>
    8d08:      	add	x1, x1, #0xd5f
    8d0c:      	add	x2, x2, #0xde7
    8d10:      	add	x3, x3, #0xd2f
    8d14:      	orr	w0, wzr, #0x80000000
    8d18:      	bl	0xac7c <.text+0x9c7c>
    8d1c:      	add	w19, w19, #0x3
    8d20:      	b	0x8c8c <.text+0x7c8c>
    8d24:      	stp	x28, x27, [sp, #-0x60]!
    8d28:      	stp	x26, x25, [sp, #0x10]
    8d2c:      	stp	x24, x23, [sp, #0x20]
    8d30:      	stp	x22, x21, [sp, #0x30]
    8d34:      	stp	x20, x19, [sp, #0x40]
    8d38:      	stp	x29, x30, [sp, #0x50]
    8d3c:      	add	x29, sp, #0x50
    8d40:      	sub	sp, sp, #0x10
    8d44:      	mov	w24, #-0x80000000       // =-2147483648
    8d48:      	mov	w19, w3
    8d4c:      	mov	w22, w2
    8d50:      	mov	w23, w1
    8d54:      	mov	x21, x0
    8d58:      	movk	w24, #0x2
    8d5c:      	cbz	x21, 0x8d74 <.text+0x7d74>
    8d60:      	and	w8, w23, #0xff
    8d64:      	cmp	w8, #0xf
    8d68:      	and	w8, w22, #0xff
    8d6c:      	ccmp	w8, #0x2, #0x2, ls
    8d70:      	b.lo	0x8d80 <.text+0x7d80>
    8d74:      	adrp	x1, 0xf000 <.text+0xe000>
    8d78:      	add	x1, x1, #0xce4
    8d7c:      	b	0x8df8 <.text+0x7df8>
    8d80:      	add	w9, w22, w23, lsl #1
    8d84:      	and	x8, x9, #0xff
    8d88:      	add	x27, x21, x8, lsl #5
    8d8c:      	mov	x25, x27
    8d90:      	and	w20, w9, #0xff
    8d94:      	ldr	w26, [x25, #0x18]!
    8d98:      	cbz	w26, 0x8dc4 <.text+0x7dc4>
    8d9c:      	cmp	w8, #0x1
    8da0:      	b.eq	0x8df0 <.text+0x7df0>
    8da4:      	orr	w10, w20, w19
    8da8:      	and	w9, w10, #0xff
    8dac:      	cbz	w9, 0x8df0 <.text+0x7df0>
    8db0:      	and	w10, w19, #0xff
    8db4:      	cbz	w10, 0x8e34 <.text+0x7e34>
    8db8:      	orr	w11, wzr, #0x3
    8dbc:      	str	w11, [x25]
    8dc0:      	b	0x8edc <.text+0x7edc>
    8dc4:      	adrp	x1, 0xf000 <.text+0xe000>
    8dc8:      	adrp	x2, 0xe000 <.text+0xd000>
    8dcc:      	adrp	x3, 0xf000 <.text+0xe000>
    8dd0:      	add	x1, x1, #0xe2a
    8dd4:      	add	x2, x2, #0xd78
    8dd8:      	add	x3, x3, #0xe26
    8ddc:      	orr	w0, wzr, #0x80000000
    8de0:      	mov	w4, w20
    8de4:      	bl	0xac7c <.text+0x9c7c>
    8de8:      	add	w24, w24, #0x2
    8dec:      	b	0x8e10 <.text+0x7e10>
    8df0:      	adrp	x1, 0xf000 <.text+0xe000>
    8df4:      	add	x1, x1, #0xe58
    8df8:      	adrp	x2, 0xe000 <.text+0xd000>
    8dfc:      	adrp	x3, 0xf000 <.text+0xe000>
    8e00:      	add	x2, x2, #0xd78
    8e04:      	add	x3, x3, #0xe26
    8e08:      	orr	w0, wzr, #0x80000000
    8e0c:      	bl	0xac7c <.text+0x9c7c>
    8e10:      	mov	w0, w24
    8e14:      	sub	sp, x29, #0x50
    8e18:      	ldp	x29, x30, [sp, #0x50]
    8e1c:      	ldp	x20, x19, [sp, #0x40]
    8e20:      	ldp	x22, x21, [sp, #0x30]
    8e24:      	ldp	x24, x23, [sp, #0x20]
    8e28:      	ldp	x26, x25, [sp, #0x10]
    8e2c:      	ldp	x28, x27, [sp], #0x60
    8e30:      	ret
    8e34:      	cmp	w26, #0x2
    8e38:      	b.ne	0x8edc <.text+0x7edc>
    8e3c:      	mov	x28, x27
    8e40:      	str	wzr, [sp, #0x8]
    8e44:      	mov	w13, #0xd08             // =3336
    8e48:      	str	xzr, [sp]
    8e4c:      	mov	x3, sp
    8e50:      	mov	x0, x21
    8e54:      	mov	w1, w23
    8e58:      	mov	w2, w22
    8e5c:      	ldrb	w14, [x28, #0x1c]!
    8e60:      	bfi	w13, w14, #16, #8
    8e64:      	str	w13, [sp, #0xc]
    8e68:      	bl	0x8fcc <.text+0x7fcc>
    8e6c:      	mov	w24, w0
    8e70:      	tbnz	w24, #0x1f, 0x8f9c <.text+0x7f9c>
    8e74:      	ldr	w16, [x21]
    8e78:      	mov	w1, #0xc80c             // =51212
    8e7c:      	mov	w3, #0x2710             // =10000
    8e80:      	mov	w2, wzr
    8e84:      	add	w17, w16, w20, lsl #4
    8e88:      	add	w0, w17, w1
    8e8c:      	orr	w1, wzr, #0x400
    8e90:      	bl	0xa6d4 <.text+0x96d4>
    8e94:      	tbz	w0, #0x1f, 0x8eb8 <.text+0x7eb8>
    8e98:      	adrp	x1, 0xf000 <.text+0xe000>
    8e9c:      	adrp	x2, 0xe000 <.text+0xd000>
    8ea0:      	adrp	x3, 0xf000 <.text+0xe000>
    8ea4:      	add	x1, x1, #0xed4
    8ea8:      	add	x2, x2, #0xd78
    8eac:      	add	x3, x3, #0xe26
    8eb0:      	orr	w0, wzr, #0x80000000
    8eb4:      	bl	0xac7c <.text+0x9c7c>
    8eb8:      	adrp	x9, 0x13000
    8ebc:      	mov	w0, #0x3e8              // =1000
    8ec0:      	ldr	x10, [x9, #0x478]
    8ec4:      	ldr	x8, [x10, #0xf8]
    8ec8:      	blr	x8
    8ecc:      	ldr	x0, [x27, #0x20]
    8ed0:      	orr	w2, wzr, #0xff
    8ed4:      	strb	w2, [x28]
    8ed8:      	bl	0x9180 <.text+0x8180>
    8edc:      	tst	w19, #0xff
    8ee0:      	mov	w5, #0x504              // =1284
    8ee4:      	cinc	w6, w5, eq
    8ee8:      	mov	x3, sp
    8eec:      	mov	x0, x21
    8ef0:      	mov	w1, w23
    8ef4:      	stp	wzr, w6, [sp, #0x8]
    8ef8:      	mov	w2, w22
    8efc:      	str	xzr, [sp]
    8f00:      	bl	0x8fcc <.text+0x7fcc>
    8f04:      	mov	w24, w0
    8f08:      	tbnz	w24, #0x1f, 0x8f60 <.text+0x7f60>
    8f0c:      	ldr	w7, [x21]
    8f10:      	mov	w23, #0xc80c            // =51212
    8f14:      	mov	w3, #0x2710             // =10000
    8f18:      	orr	w1, wzr, #0x400
    8f1c:      	mov	w2, wzr
    8f20:      	add	w22, w7, w20, lsl #4
    8f24:      	add	w0, w22, w23
    8f28:      	bl	0xa6d4 <.text+0x96d4>
    8f2c:      	tbz	w0, #0x1f, 0x8f50 <.text+0x7f50>
    8f30:      	adrp	x1, 0xf000 <.text+0xe000>
    8f34:      	adrp	x2, 0xe000 <.text+0xd000>
    8f38:      	adrp	x3, 0xf000 <.text+0xe000>
    8f3c:      	add	x1, x1, #0xf44
    8f40:      	add	x2, x2, #0xd78
    8f44:      	add	x3, x3, #0xe26
    8f48:      	orr	w0, wzr, #0x80000000
    8f4c:      	bl	0xac7c <.text+0x9c7c>
    8f50:      	and	w11, w19, #0xff
    8f54:      	cbz	w11, 0x8f8c <.text+0x7f8c>
    8f58:      	mov	w24, wzr
    8f5c:      	b	0x8e10 <.text+0x7e10>
    8f60:      	adrp	x1, 0xf000 <.text+0xe000>
    8f64:      	adrp	x2, 0xe000 <.text+0xd000>
    8f68:      	adrp	x3, 0xf000 <.text+0xe000>
    8f6c:      	add	x1, x1, #0xf00
    8f70:      	add	x2, x2, #0xd78
    8f74:      	add	x3, x3, #0xe26
    8f78:      	orr	w0, wzr, #0x80000000
    8f7c:      	mov	w4, w20
    8f80:      	bl	0xac7c <.text+0x9c7c>
    8f84:      	str	w26, [x25]
    8f88:      	b	0x8e10 <.text+0x7e10>
    8f8c:      	orr	w19, wzr, #0x1
    8f90:      	mov	w24, wzr
    8f94:      	str	w19, [x25]
    8f98:      	b	0x8e10 <.text+0x7e10>
    8f9c:      	adrp	x1, 0xf000 <.text+0xe000>
    8fa0:      	adrp	x2, 0xe000 <.text+0xd000>
    8fa4:      	adrp	x3, 0xf000 <.text+0xe000>
    8fa8:      	add	x1, x1, #0xe98
    8fac:      	add	x2, x2, #0xd78
    8fb0:      	add	x3, x3, #0xe26
    8fb4:      	orr	w0, wzr, #0x80000000
    8fb8:      	mov	w4, w20
    8fbc:      	bl	0xac7c <.text+0x9c7c>
    8fc0:      	orr	w15, wzr, #0x2
    8fc4:      	str	w15, [x25]
    8fc8:      	b	0x8e10 <.text+0x7e10>
    8fcc:      	stp	x26, x25, [sp, #-0x50]!
    8fd0:      	stp	x24, x23, [sp, #0x10]
    8fd4:      	stp	x22, x21, [sp, #0x20]
    8fd8:      	stp	x20, x19, [sp, #0x30]
    8fdc:      	stp	x29, x30, [sp, #0x40]
    8fe0:      	add	x29, sp, #0x40
    8fe4:      	mov	w22, w2
    8fe8:      	mov	w23, w1
    8fec:      	and	w8, w22, #0xff
    8ff0:      	cmp	w8, #0x1
    8ff4:      	and	w8, w23, #0xff
    8ff8:      	ccmp	w8, #0xf, #0x2, ls
    8ffc:      	mov	x19, x0
    9000:      	mov	x20, x3
    9004:      	ccmp	x19, #0x0, #0x4, ls
    9008:      	ccmp	x20, #0x0, #0x4, ne
    900c:      	b.ne	0x903c <.text+0x803c>
    9010:      	adrp	x1, 0xf000 <.text+0xe000>
    9014:      	adrp	x2, 0x10000 <.text+0xf000>
    9018:      	adrp	x3, 0xf000 <.text+0xe000>
    901c:      	add	x1, x1, #0xce4
    9020:      	add	x2, x2, #0x342
    9024:      	add	x3, x3, #0xe26
    9028:      	orr	w0, wzr, #0x80000000
    902c:      	bl	0xac7c <.text+0x9c7c>
    9030:      	mov	w0, #-0x80000000        // =-2147483648
    9034:      	movk	w0, #0x2
    9038:      	b	0x9168 <.text+0x8168>
    903c:      	ldr	w10, [x19]
    9040:      	mov	w25, #0xc200            // =49664
    9044:      	add	w0, w10, w25
    9048:      	bl	0xcc88 <.text+0xbc88>
    904c:      	mov	w21, w0
    9050:      	lsr	w11, w21, #6
    9054:      	tbz	w11, #0x0, 0x9074 <.text+0x8074>
    9058:      	ldr	w12, [x19]
    905c:      	add	w24, w12, w25
    9060:      	mov	x0, x24
    9064:      	bl	0xcc88 <.text+0xbc88>
    9068:      	and	w1, w0, #0xffffffbf
    906c:      	mov	x0, x24
    9070:      	bl	0xccc0 <.text+0xbcc0>
    9074:      	ldr	w13, [x19]
    9078:      	add	w23, w22, w23, lsl #1
    907c:      	mov	w9, #0xc80c             // =51212
    9080:      	add	w22, w9, w23, uxtb #4
    9084:      	add	w0, w22, w13
    9088:      	bl	0xcc88 <.text+0xbc88>
    908c:      	tbnz	w0, #0xa, 0x913c <.text+0x813c>
    9090:      	ldr	w14, [x19]
    9094:      	and	w10, w23, #0xff
    9098:      	lsl	w23, w10, #4
    909c:      	ldr	w1, [x20]
    90a0:      	mov	w16, #0xc800            // =51200
    90a4:      	add	w15, w23, w14
    90a8:      	add	w0, w15, w16
    90ac:      	bl	0xccc0 <.text+0xbcc0>
    90b0:      	ldr	w17, [x19]
    90b4:      	mov	w3, #0xc804             // =51204
    90b8:      	ldr	w1, [x20, #0x4]
    90bc:      	add	w2, w23, w17
    90c0:      	add	w0, w2, w3
    90c4:      	bl	0xccc0 <.text+0xbcc0>
    90c8:      	ldr	w4, [x19]
    90cc:      	mov	w6, #0xc808             // =51208
    90d0:      	ldr	w1, [x20, #0x8]
    90d4:      	add	w5, w23, w4
    90d8:      	add	w0, w5, w6
    90dc:      	bl	0xccc0 <.text+0xbcc0>
    90e0:      	ldr	w7, [x20, #0xc]
    90e4:      	and	w9, w7, #0xf
    90e8:      	sub	w11, w9, #0x1
    90ec:      	cmp	w11, #0x8
    90f0:      	b.hi	0x9144 <.text+0x8144>
    90f4:      	ubfx	w21, w21, #6, #1
    90f8:      	bl	0xaba0 <.text+0x9ba0>
    90fc:      	ldr	w8, [x19]
    9100:      	ldr	w1, [x20, #0xc]
    9104:      	add	w0, w22, w8
    9108:      	bl	0xccc0 <.text+0xbcc0>
    910c:      	cbz	w21, 0x9134 <.text+0x8134>
    9110:      	ldr	w22, [x19]
    9114:      	add	w24, w22, w25
    9118:      	mov	x0, x24
    911c:      	bl	0xcc88 <.text+0xbc88>
    9120:      	mov	w8, w0
    9124:      	bfi	w8, w21, #6, #1
    9128:      	mov	x0, x24
    912c:      	mov	w1, w8
    9130:      	bl	0xccc0 <.text+0xbcc0>
    9134:      	mov	w0, wzr
    9138:      	b	0x9168 <.text+0x8168>
    913c:      	mov	w0, #-0x7ffffff9        // =-2147483641
    9140:      	b	0x9168 <.text+0x8168>
    9144:      	adrp	x1, 0x10000 <.text+0xf000>
    9148:      	adrp	x2, 0x10000 <.text+0xf000>
    914c:      	adrp	x3, 0xf000 <.text+0xe000>
    9150:      	add	x1, x1, #0x325
    9154:      	add	x2, x2, #0x342
    9158:      	add	x3, x3, #0xe26
    915c:      	orr	w0, wzr, #0x80000000
    9160:      	bl	0xac7c <.text+0x9c7c>
    9164:      	mov	w0, #-0x7ffffffd        // =-2147483645
    9168:      	ldp	x29, x30, [sp, #0x40]
    916c:      	ldp	x20, x19, [sp, #0x30]
    9170:      	ldp	x22, x21, [sp, #0x20]
    9174:      	ldp	x24, x23, [sp, #0x10]
    9178:      	ldp	x26, x25, [sp], #0x50
    917c:      	ret
    9180:      	cbz	x0, 0x91fc <.text+0x81fc>
    9184:      	ldr	x8, [x0, #0x10]
    9188:      	str	wzr, [x0, #0x30]
    918c:      	stp	x8, x8, [x0, #0x20]
    9190:      	cbz	x8, 0x91f8 <.text+0x81f8>
    9194:      	ldr	w11, [x8, #0x8]!
    9198:      	ldr	w12, [x8, #0x4]
    919c:      	bfi	x11, x12, #32, #32
    91a0:      	and	x9, x11, #0xfffffffeffffffff
    91a4:      	lsr	x13, x9, #32
    91a8:      	add	x11, x8, #0x8
    91ac:      	stp	w9, w13, [x8]
    91b0:      	ldr	x9, [x0, #0x10]
    91b4:      	ldr	w14, [x0, #0x18]
    91b8:      	ldr	x15, [x0, #0x20]
    91bc:      	add	x10, x14, x9
    91c0:      	cmp	x11, x10
    91c4:      	csel	x8, x11, x9, lo
    91c8:      	cmp	x8, x15
    91cc:      	b.ne	0x9194 <.text+0x8194>
    91d0:      	sub	x12, x8, #0x10
    91d4:      	cmp	x12, x9
    91d8:      	csel	x10, x10, x8, lo
    91dc:      	ldr	w0, [x10, #-0x8]!
    91e0:      	ldr	w4, [x10, #0x4]
    91e4:      	bfi	x0, x4, #32, #32
    91e8:      	and	x13, x0, #0xfffffc0fffffffff
    91ec:      	orr	x14, x13, #0x8000000000
    91f0:      	lsr	x5, x14, #32
    91f4:      	stp	w13, w5, [x10]
    91f8:      	ret
    91fc:      	adrp	x1, 0xf000 <.text+0xe000>
    9200:      	adrp	x2, 0x10000 <.text+0xf000>
    9204:      	adrp	x3, 0xf000 <.text+0xe000>
    9208:      	add	x1, x1, #0xce4
    920c:      	add	x2, x2, #0x482
    9210:      	add	x3, x3, #0xd0d
    9214:      	orr	w0, wzr, #0x80000000
    9218:      	b	0xac7c <.text+0x9c7c>
    921c:      	and	w8, w2, #0xff
    9220:      	cmp	w8, #0x1
    9224:      	and	w8, w1, #0xff
    9228:      	ccmp	w8, #0xf, #0x2, ls
    922c:      	ccmp	x0, #0x0, #0x4, ls
    9230:      	ccmp	x3, #0x0, #0x4, ne
    9234:      	b.ne	0x9270 <.text+0x8270>
    9238:      	stp	x29, x30, [sp, #-0x10]!
    923c:      	mov	x29, sp
    9240:      	adrp	x1, 0xf000 <.text+0xe000>
    9244:      	adrp	x2, 0xf000 <.text+0xe000>
    9248:      	adrp	x3, 0xf000 <.text+0xe000>
    924c:      	add	x1, x1, #0xce4
    9250:      	add	x2, x2, #0xf71
    9254:      	add	x3, x3, #0xf7f
    9258:      	orr	w0, wzr, #0x80000000
    925c:      	bl	0xac7c <.text+0x9c7c>
    9260:      	mov	w0, #-0x80000000        // =-2147483648
    9264:      	movk	w0, #0x2
    9268:      	ldp	x29, x30, [sp], #0x10
    926c:      	ret
    9270:      	add	w8, w2, w1, lsl #1
    9274:      	and	x8, x8, #0xff
    9278:      	add	x9, x0, x8, lsl #5
    927c:      	mov	w0, wzr
    9280:      	ldr	w9, [x9, #0x18]
    9284:      	str	w9, [x3]
    9288:      	ret
    928c:      	stp	x20, x19, [sp, #-0x20]!
    9290:      	stp	x29, x30, [sp, #0x10]
    9294:      	add	x29, sp, #0x10
    9298:      	mov	w19, #-0x80000000       // =-2147483648
    929c:      	movk	w19, #0x2
    92a0:      	cbz	x0, 0x92c8 <.text+0x82c8>
    92a4:      	cbz	x1, 0x92c8 <.text+0x82c8>
    92a8:      	and	w8, w2, #0xff
    92ac:      	cmp	w8, #0xf
    92b0:      	and	w8, w3, #0xff
    92b4:      	ccmp	w8, #0x1, #0x2, ls
    92b8:      	sub	w9, w4, #0x1
    92bc:      	and	w10, w9, #0xff
    92c0:      	ccmp	w10, #0x7, #0x2, ls
    92c4:      	b.lo	0x92ec <.text+0x82ec>
    92c8:      	adrp	x1, 0xf000 <.text+0xe000>
    92cc:      	adrp	x2, 0xf000 <.text+0xe000>
    92d0:      	adrp	x3, 0xf000 <.text+0xe000>
    92d4:      	add	x1, x1, #0xce4
    92d8:      	add	x2, x2, #0xf83
    92dc:      	add	x3, x3, #0xd0d
    92e0:      	orr	w0, wzr, #0x80000000
    92e4:      	bl	0xac7c <.text+0x9c7c>
    92e8:      	b	0x93b8 <.text+0x83b8>
    92ec:      	add	w10, w3, w2, lsl #1
    92f0:      	cbnz	w8, 0x931c <.text+0x831c>
    92f4:      	and	w8, w10, #0xff
    92f8:      	orr	w12, w4, #0x4
    92fc:      	add	x11, x0, x8, lsl #5
    9300:      	and	w13, w12, #0xff
    9304:      	ldr	w9, [x11, #0x30]
    9308:      	udiv	w11, w6, w9
    930c:      	msub	w11, w11, w9, w6
    9310:      	cmp	w11, #0x0
    9314:      	ccmp	w13, #0x5, #0x0, ne
    9318:      	b.eq	0x938c <.text+0x838c>
    931c:      	and	w9, w10, #0xff
    9320:      	add	x10, x0, x9, lsl #5
    9324:      	ldr	w12, [x10, #0x18]
    9328:      	cbz	w12, 0x9360 <.text+0x8360>
    932c:      	mov	w19, wzr
    9330:      	strb	w2, [x1]
    9334:      	strb	w3, [x1, #0x1]
    9338:      	strb	w4, [x1, #0x2]
    933c:      	strh	w5, [x1, #0x4]
    9340:      	str	w6, [x1, #0x8]
    9344:      	strb	w7, [x1, #0xc]
    9348:      	str	wzr, [x1, #0x10]
    934c:      	strb	wzr, [x1, #0x14]
    9350:      	stp	wzr, wzr, [x1, #0x18]
    9354:      	strb	wzr, [x1, #0x20]
    9358:      	stp	xzr, xzr, [x1, #0x28]
    935c:      	b	0x93b8 <.text+0x83b8>
    9360:      	adrp	x1, 0xf000 <.text+0xe000>
    9364:      	adrp	x2, 0xf000 <.text+0xe000>
    9368:      	adrp	x3, 0xf000 <.text+0xe000>
    936c:      	add	x1, x1, #0xff3
    9370:      	add	x2, x2, #0xf83
    9374:      	add	x3, x3, #0xd0d
    9378:      	orr	w0, wzr, #0x80000000
    937c:      	mov	w4, w9
    9380:      	bl	0xac7c <.text+0x9c7c>
    9384:      	add	w19, w19, #0xa
    9388:      	b	0x93b8 <.text+0x83b8>
    938c:      	adrp	x1, 0xf000 <.text+0xe000>
    9390:      	adrp	x2, 0xf000 <.text+0xe000>
    9394:      	adrp	x3, 0xf000 <.text+0xe000>
    9398:      	add	x1, x1, #0xf91
    939c:      	add	x2, x2, #0xf83
    93a0:      	add	x3, x3, #0xd0d
    93a4:      	orr	w0, wzr, #0x80000000
    93a8:      	mov	w4, w6
    93ac:      	mov	w5, w9
    93b0:      	mov	w6, w8
    93b4:      	bl	0xac7c <.text+0x9c7c>
    93b8:      	ldp	x29, x30, [sp, #0x10]
    93bc:      	mov	w0, w19
    93c0:      	ldp	x20, x19, [sp], #0x20
    93c4:      	ret
    93c8:      	stp	x28, x27, [sp, #-0x60]!
    93cc:      	stp	x26, x25, [sp, #0x10]
    93d0:      	stp	x24, x23, [sp, #0x20]
    93d4:      	stp	x22, x21, [sp, #0x30]
    93d8:      	stp	x20, x19, [sp, #0x40]
    93dc:      	stp	x29, x30, [sp, #0x50]
    93e0:      	add	x29, sp, #0x50
    93e4:      	mov	w20, #-0x80000000       // =-2147483648
    93e8:      	mov	x24, x2
    93ec:      	mov	x19, x1
    93f0:      	mov	x21, x0
    93f4:      	movk	w20, #0x2
    93f8:      	cbz	x21, 0x9474 <.text+0x8474>
    93fc:      	cbz	x19, 0x9474 <.text+0x8474>
    9400:      	cbz	x24, 0x9474 <.text+0x8474>
    9404:      	ldr	x10, [x24]
    9408:      	cbz	x10, 0x9480 <.text+0x8480>
    940c:      	ldrh	w9, [x19]
    9410:      	mov	w1, wzr
    9414:      	lsl	w10, w9, #1
    9418:      	add	w14, w10, w9, lsr #8
    941c:      	and	x23, x14, #0xff
    9420:      	add	x27, x21, x23, lsl #5
    9424:      	ldr	x22, [x27, #0x20]
    9428:      	mov	x0, x22
    942c:      	bl	0x9984 <.text+0x8984>
    9430:      	tbnz	w0, #0x1f, 0x94c0 <.text+0x84c0>
    9434:      	ldr	w11, [x22, #0x30]
    9438:      	cbz	w11, 0x94ec <.text+0x84ec>
    943c:      	ldp	x8, x0, [x22, #0x20]
    9440:      	cmp	x8, x0
    9444:      	b.ne	0x94f0 <.text+0x84f0>
    9448:      	adrp	x1, 0x10000 <.text+0xf000>
    944c:      	adrp	x2, 0x10000 <.text+0xf000>
    9450:      	adrp	x3, 0xf000 <.text+0xe000>
    9454:      	add	x1, x1, #0x91
    9458:      	add	x2, x2, #0x20
    945c:      	add	x3, x3, #0xd0d
    9460:      	orr	w0, wzr, #0x80000000
    9464:      	mov	w4, w23
    9468:      	bl	0xac7c <.text+0x9c7c>
    946c:      	add	w20, w20, #0x9
    9470:      	b	0x94a0 <.text+0x84a0>
    9474:      	adrp	x1, 0xf000 <.text+0xe000>
    9478:      	add	x1, x1, #0xce4
    947c:      	b	0x9488 <.text+0x8488>
    9480:      	adrp	x1, 0x10000 <.text+0xf000>
    9484:      	add	x1, x1, #0x2d
    9488:      	adrp	x2, 0x10000 <.text+0xf000>
    948c:      	adrp	x3, 0xf000 <.text+0xe000>
    9490:      	add	x2, x2, #0x20
    9494:      	add	x3, x3, #0xd0d
    9498:      	orr	w0, wzr, #0x80000000
    949c:      	bl	0xac7c <.text+0x9c7c>
    94a0:      	mov	w0, w20
    94a4:      	ldp	x29, x30, [sp, #0x50]
    94a8:      	ldp	x20, x19, [sp, #0x40]
    94ac:      	ldp	x22, x21, [sp, #0x30]
    94b0:      	ldp	x24, x23, [sp, #0x20]
    94b4:      	ldp	x26, x25, [sp, #0x10]
    94b8:      	ldp	x28, x27, [sp], #0x60
    94bc:      	ret
    94c0:      	adrp	x1, 0x10000 <.text+0xf000>
    94c4:      	adrp	x2, 0x10000 <.text+0xf000>
    94c8:      	adrp	x3, 0xf000 <.text+0xe000>
    94cc:      	add	x1, x1, #0x51
    94d0:      	add	x2, x2, #0x20
    94d4:      	add	x3, x3, #0xd0d
    94d8:      	orr	w0, wzr, #0x80000000
    94dc:      	mov	w4, w23
    94e0:      	bl	0xac7c <.text+0x9c7c>
    94e4:      	add	w20, w20, #0x4
    94e8:      	b	0x94a0 <.text+0x84a0>
    94ec:      	ldr	x8, [x22, #0x20]
    94f0:      	stp	x8, x24, [x19, #0x28]
    94f4:      	mov	x9, #0x500000000        // =21474836480
    94f8:      	strb	wzr, [x19, #0x14]
    94fc:      	stp	wzr, wzr, [x19, #0x18]
    9500:      	ldr	x25, [x22, #0x20]
    9504:      	ldr	w12, [x19, #0x8]
    9508:      	cbz	w12, 0x9530 <.text+0x8530>
    950c:      	ldrb	w8, [x19, #0x2]
    9510:      	sub	w10, w8, #0x3
    9514:      	cmp	w10, #0x1
    9518:      	b.hi	0x9630 <.text+0x8630>
    951c:      	mov	x1, xzr
    9520:      	str	wzr, [x19, #0x8]
    9524:      	mov	w8, wzr
    9528:      	mov	w26, wzr
    952c:      	b	0x953c <.text+0x853c>
    9530:      	mov	x1, xzr
    9534:      	mov	w8, wzr
    9538:      	mov	w26, wzr
    953c:      	ldrb	w11, [x19, #0x2]
    9540:      	sub	w12, w11, #0x3
    9544:      	cmp	w12, #0x2
    9548:      	b.lo	0x957c <.text+0x857c>
    954c:      	ldrb	w13, [x19, #0x1]
    9550:      	cmp	w13, #0x1
    9554:      	b.ne	0x9574 <.text+0x8574>
    9558:      	ldrb	w4, [x19, #0xc]
    955c:      	cbz	w4, 0x9574 <.text+0x8574>
    9560:      	ldr	w0, [x19, #0x10]
    9564:      	ldr	w2, [x19, #0x8]
    9568:      	add	w13, w0, w8
    956c:      	cmp	w13, w2
    9570:      	b.hs	0x957c <.text+0x857c>
    9574:      	mov	x10, x1
    9578:      	b	0x9880 <.text+0x8880>
    957c:      	ldr	x10, [x22, #0x20]
    9580:      	ldr	w1, [x22, #0x30]
    9584:      	cbz	w1, 0x9594 <.text+0x8594>
    9588:      	ldr	x12, [x22, #0x28]
    958c:      	cmp	x10, x12
    9590:      	b.eq	0x9880 <.text+0x8880>
    9594:      	ldr	w16, [x10, #0xc]
    9598:      	mov	x14, #-0x1000000000000  // =-281474976710656
    959c:      	stp	wzr, wzr, [x10]
    95a0:      	movk	x14, #0xc005, lsl #32
    95a4:      	add	w26, w26, #0x1
    95a8:      	lsl	x17, x16, #32
    95ac:      	and	x11, x17, #0xfffffff000000000
    95b0:      	orr	x11, x11, x9
    95b4:      	lsr	x13, x11, #32
    95b8:      	and	x0, x11, x14
    95bc:      	stp	w9, w13, [x10, #0x8]
    95c0:      	mov	x2, x0
    95c4:      	ldrb	w1, [x19, #0x2]
    95c8:      	bfi	x2, x1, #36, #6
    95cc:      	lsr	x5, x2, #32
    95d0:      	stp	w0, w5, [x10, #0x8]
    95d4:      	ldrh	w3, [x19, #0x4]
    95d8:      	lsl	x7, x3, #46
    95dc:      	bfi	x7, x1, #36, #6
    95e0:      	orr	x6, x7, x9
    95e4:      	lsr	x4, x6, #32
    95e8:      	stp	w9, w4, [x10, #0x8]
    95ec:      	ldrb	w9, [x19, #0x14]
    95f0:      	add	w14, w9, #0x1
    95f4:      	strb	w14, [x19, #0x14]
    95f8:      	ldr	w15, [x22, #0x30]
    95fc:      	ldr	x12, [x22, #0x20]
    9600:      	ldr	x13, [x22, #0x10]
    9604:      	ldr	w9, [x22, #0x18]
    9608:      	add	w16, w15, #0x1
    960c:      	add	x10, x12, #0x10
    9610:      	add	x12, x9, x13
    9614:      	str	w16, [x22, #0x30]
    9618:      	cmp	x10, x12
    961c:      	str	x10, [x22, #0x20]
    9620:      	b.lo	0x9880 <.text+0x8880>
    9624:      	mov	x10, x13
    9628:      	str	x13, [x22, #0x20]
    962c:      	b	0x9880 <.text+0x8880>
    9630:      	mov	x16, #0x3f500000000     // =4350801870848
    9634:      	mov	x15, #-0x3ffa00000001   // =-70342974373889
    9638:      	movk	x16, #0xff, lsl #16
    963c:      	mov	x1, xzr
    9640:      	mov	w8, wzr
    9644:      	mov	w0, wzr
    9648:      	mov	w26, wzr
    964c:      	add	x11, x27, #0x18
    9650:      	orr	w12, wzr, #0x18
    9654:      	orr	w13, wzr, #0x1
    9658:      	orr	w14, wzr, #0xffffff
    965c:      	movk	x15, #0xff, lsl #16
    9660:      	movk	x16, #0xffff
    9664:      	mov	x17, #0x8100000000      // =554050781184
    9668:      	mov	x10, x25
    966c:      	b	0x967c <.text+0x867c>
    9670:      	add	w8, w4, w8
    9674:      	add	w0, w0, #0x1
    9678:      	mov	x1, x10
    967c:      	ldr	x2, [x24]
    9680:      	mov	w0, w0
    9684:      	cmp	x0, x2
    9688:      	b.hs	0x953c <.text+0x853c>
    968c:      	madd	x2, x0, x12, x24
    9690:      	mov	w3, wzr
    9694:      	add	x1, x2, #0x18
    9698:      	add	x2, x2, #0x10
    969c:      	b	0x96a8 <.text+0x86a8>
    96a0:      	mov	x10, x7
    96a4:      	str	x7, [x22, #0x20]
    96a8:      	ldr	x6, [x1]
    96ac:      	mov	w4, w3
    96b0:      	cmp	x4, x6
    96b4:      	b.hs	0x9670 <.text+0x8670>
    96b8:      	ldr	w5, [x22, #0x30]
    96bc:      	cbz	w5, 0x96cc <.text+0x86cc>
    96c0:      	ldr	x7, [x22, #0x28]
    96c4:      	cmp	x10, x7
    96c8:      	b.eq	0x9880 <.text+0x8880>
    96cc:      	ldrb	w3, [x19, #0x2]
    96d0:      	cmp	w3, #0x5
    96d4:      	b.ne	0x96e8 <.text+0x86e8>
    96d8:      	ldrb	w7, [x19, #0x14]
    96dc:      	cbz	w7, 0x96e8 <.text+0x86e8>
    96e0:      	strb	w13, [x19, #0x2]
    96e4:      	ldr	x6, [x1]
    96e8:      	sub	w6, w6, w4
    96ec:      	ldr	x7, [x22, #0x10]
    96f0:      	ldr	w3, [x22, #0x18]
    96f4:      	lsr	w5, w6, #24
    96f8:      	cmp	w5, #0x0
    96fc:      	csel	w5, w14, w6, ne
    9700:      	add	x6, x10, #0x10
    9704:      	add	x7, x3, x7
    9708:      	cmp	x6, x7
    970c:      	b.lo	0x97d4 <.text+0x87d4>
    9710:      	ldrb	w3, [x19, #0x14]
    9714:      	cbnz	w3, 0x973c <.text+0x873c>
    9718:      	ldr	w3, [x11]
    971c:      	cmp	w23, #0x0
    9720:      	cset	w6, eq
    9724:      	cmp	w3, #0x3
    9728:      	cset	w7, eq
    972c:      	cmp	w3, #0x1
    9730:      	b.eq	0x9788 <.text+0x8788>
    9734:      	and	w6, w6, w7
    9738:      	cbnz	w6, 0x9788 <.text+0x8788>
    973c:      	ldr	x7, [x22, #0x8]
    9740:      	ldr	w3, [x10, #0xc]
    9744:      	str	w7, [x10]
    9748:      	lsr	x6, x3, #14
    974c:      	ldr	w7, [x22, #0xc]
    9750:      	mov	x3, x17
    9754:      	bfi	x3, x6, #46, #18
    9758:      	lsr	x6, x3, #32
    975c:      	stp	wzr, w6, [x10, #0x8]
    9760:      	str	w7, [x10, #0x4]
    9764:      	mov	x7, x17
    9768:      	ldrh	w3, [x19, #0x4]
    976c:      	bfi	x7, x3, #46, #16
    9770:      	lsr	x6, x7, #32
    9774:      	stp	wzr, w6, [x10, #0x8]
    9778:      	ldrb	w6, [x19, #0x14]
    977c:      	add	w7, w6, #0x1
    9780:      	strb	w7, [x19, #0x14]
    9784:      	b	0x97a8 <.text+0x87a8>
    9788:      	ldr	w3, [x10, #0x8]!
    978c:      	ldr	w7, [x10, #0x4]
    9790:      	bfi	x3, x7, #32, #32
    9794:      	and	x3, x3, #0xfffffffeffffffff
    9798:      	lsr	x6, x3, #32
    979c:      	stp	w3, w6, [x10]
    97a0:      	ldr	x10, [x22, #0x10]
    97a4:      	str	x10, [x19, #0x28]
    97a8:      	ldr	w3, [x22, #0x30]
    97ac:      	add	w26, w26, #0x1
    97b0:      	ldr	x10, [x22, #0x10]
    97b4:      	add	w6, w3, #0x1
    97b8:      	cmn	w3, #0x1
    97bc:      	str	x10, [x22, #0x20]
    97c0:      	str	w6, [x22, #0x30]
    97c4:      	b.eq	0x97d4 <.text+0x87d4>
    97c8:      	ldr	x3, [x22, #0x28]
    97cc:      	cmp	x10, x3
    97d0:      	b.eq	0x9880 <.text+0x8880>
    97d4:      	ldr	w3, [x2]
    97d8:      	add	w26, w26, #0x1
    97dc:      	ldr	w6, [x10, #0xc]
    97e0:      	add	w3, w3, w4
    97e4:      	lsl	x7, x6, #32
    97e8:      	and	x7, x7, #0xfffffff000000000
    97ec:      	str	w3, [x10]
    97f0:      	bfxil	x7, x5, #0, #24
    97f4:      	ldr	x6, [x2]
    97f8:      	orr	x3, x7, x9
    97fc:      	lsr	x7, x3, #32
    9800:      	stp	w3, w7, [x10, #0x8]
    9804:      	and	x3, x3, x15
    9808:      	add	x6, x6, x4
    980c:      	lsr	x6, x6, #32
    9810:      	str	w6, [x10, #0x4]
    9814:      	mov	x6, x3
    9818:      	ldrb	w7, [x19, #0x2]
    981c:      	bfi	x6, x7, #36, #6
    9820:      	lsr	x7, x6, #32
    9824:      	stp	w3, w7, [x10, #0x8]
    9828:      	and	x3, x6, x16
    982c:      	ldrh	w6, [x19, #0x4]
    9830:      	mov	x7, x3
    9834:      	bfi	x7, x6, #46, #16
    9838:      	lsr	x6, x7, #32
    983c:      	stp	w3, w6, [x10, #0x8]
    9840:      	add	w3, w5, w4
    9844:      	ldrb	w10, [x19, #0x14]
    9848:      	add	w7, w10, #0x1
    984c:      	strb	w7, [x19, #0x14]
    9850:      	ldr	w6, [x22, #0x30]
    9854:      	ldr	x10, [x22, #0x20]
    9858:      	ldr	x7, [x22, #0x10]
    985c:      	ldr	w4, [x22, #0x18]
    9860:      	add	w5, w6, #0x1
    9864:      	add	x10, x10, #0x10
    9868:      	add	x6, x4, x7
    986c:      	str	w5, [x22, #0x30]
    9870:      	cmp	x10, x6
    9874:      	str	x10, [x22, #0x20]
    9878:      	b.lo	0x96a8 <.text+0x86a8>
    987c:      	b	0x96a0 <.text+0x86a0>
    9880:      	ldr	x16, [x22, #0x20]
    9884:      	cmp	x10, x16
    9888:      	b.eq	0x98d0 <.text+0x88d0>
    988c:      	adrp	x1, 0x10000 <.text+0xf000>
    9890:      	adrp	x2, 0x10000 <.text+0xf000>
    9894:      	adrp	x3, 0xf000 <.text+0xe000>
    9898:      	add	x1, x1, #0xb8
    989c:      	add	x2, x2, #0x20
    98a0:      	add	x3, x3, #0xd0d
    98a4:      	orr	w0, wzr, #0x80000000
    98a8:      	bl	0xac7c <.text+0x9c7c>
    98ac:      	ldr	w17, [x22, #0x30]
    98b0:      	add	w20, w20, #0x4
    98b4:      	str	x25, [x22, #0x20]
    98b8:      	sub	w1, w17, w26, uxtb
    98bc:      	str	w1, [x22, #0x30]
    98c0:      	stp	xzr, xzr, [x19, #0x28]
    98c4:      	strb	wzr, [x19, #0x14]
    98c8:      	str	xzr, [x19, #0x18]
    98cc:      	b	0x94a0 <.text+0x84a0>
    98d0:      	ldr	x11, [x22, #0x10]
    98d4:      	sub	x9, x10, #0x10
    98d8:      	cmp	x9, x11
    98dc:      	b.hs	0x98ec <.text+0x88ec>
    98e0:      	ldr	w10, [x22, #0x18]
    98e4:      	add	x13, x10, x11
    98e8:      	sub	x9, x13, #0x10
    98ec:      	ldr	w13, [x9, #0xc]
    98f0:      	orr	x0, xzr, #0x8000000000
    98f4:      	lsl	x14, x13, #32
    98f8:      	and	x14, x14, #0x3f000000000
    98fc:      	cmp	x14, x0
    9900:      	b.ne	0x991c <.text+0x891c>
    9904:      	sub	x9, x9, #0x10
    9908:      	cmp	x9, x11
    990c:      	b.hs	0x991c <.text+0x891c>
    9910:      	ldr	w5, [x22, #0x18]
    9914:      	add	x15, x5, x11
    9918:      	sub	x9, x15, #0x10
    991c:      	mov	x10, x9
    9920:      	str	w8, [x19, #0x18]
    9924:      	ldr	w11, [x10, #0x8]!
    9928:      	mov	x3, x11
    992c:      	ldr	w8, [x10, #0x4]
    9930:      	bfi	x3, x8, #32, #32
    9934:      	orr	x8, x3, #0x80000000000
    9938:      	lsr	x7, x8, #32
    993c:      	stp	w11, w7, [x10]
    9940:      	ldr	w10, [x19, #0x10]
    9944:      	ldr	w11, [x19, #0x18]
    9948:      	ldr	w12, [x19, #0x8]
    994c:      	add	w15, w11, w10
    9950:      	cmp	w15, w12
    9954:      	b.lo	0x9968 <.text+0x8968>
    9958:      	and	x16, x8, #0xfffffff9ffffffff
    995c:      	orr	x17, x16, #0x200000000
    9960:      	lsr	x6, x17, #32
    9964:      	stp	w16, w6, [x9, #0x8]
    9968:      	ldrh	w1, [x19]
    996c:      	mov	x0, x21
    9970:      	lsr	w2, w1, #8
    9974:      	bl	0x9a80 <.text+0x8a80>
    9978:      	bl	0xaba0 <.text+0x9ba0>
    997c:      	mov	w20, wzr
    9980:      	b	0x94a0 <.text+0x84a0>
    9984:      	cbz	x0, 0x9a44 <.text+0x8a44>
    9988:      	ldr	x11, [x0, #0x28]
    998c:      	cbz	x11, 0x9a44 <.text+0x8a44>
    9990:      	ldr	w16, [x11, #0xc]
    9994:      	orr	x9, xzr, #0x8000000000
    9998:      	ldr	w13, [x0, #0x30]
    999c:      	orr	w10, wzr, #0x1
    99a0:      	ubfx	w12, w16, #2, #1
    99a4:      	b	0x99b0 <.text+0x89b0>
    99a8:      	mov	x11, x8
    99ac:      	str	x8, [x0, #0x28]
    99b0:      	mov	w8, wzr
    99b4:      	cbz	w13, 0x9a78 <.text+0x8a78>
    99b8:      	cbz	x11, 0x9a78 <.text+0x8a78>
    99bc:      	ldp	w13, w16, [x11, #0x8]
    99c0:      	tst	w1, #0xff
    99c4:      	cset	w14, ne
    99c8:      	tst	w12, #0xff
    99cc:      	cset	w15, ne
    99d0:      	bfi	x13, x16, #32, #32
    99d4:      	tbz	x13, #0x20, 0x99f0 <.text+0x89f0>
    99d8:      	and	x8, x13, #0x3f000000000
    99dc:      	cmp	x8, x9
    99e0:      	b.eq	0x99f0 <.text+0x89f0>
    99e4:      	mov	w8, wzr
    99e8:      	and	w3, w14, w15
    99ec:      	cbz	w3, 0x9a78 <.text+0x8a78>
    99f0:      	and	x12, x13, #0xfffffffeffffffff
    99f4:      	lsr	x14, x12, #32
    99f8:      	stp	w12, w14, [x11, #0x8]
    99fc:      	ldr	x14, [x0, #0x28]
    9a00:      	ldr	w11, [x0, #0x30]
    9a04:      	ldr	x8, [x0, #0x10]
    9a08:      	ldr	w4, [x0, #0x18]
    9a0c:      	ldr	w15, [x14, #0xc]
    9a10:      	add	x6, x4, x8
    9a14:      	lsl	x17, x15, #32
    9a18:      	and	x13, x17, #0x3f000000000
    9a1c:      	cmp	x13, x9
    9a20:      	sub	w13, w11, #0x1
    9a24:      	add	x11, x14, #0x10
    9a28:      	ubfx	w4, w15, #2, #1
    9a2c:      	csel	w12, w10, w4, eq
    9a30:      	str	w13, [x0, #0x30]
    9a34:      	cmp	x11, x6
    9a38:      	str	x11, [x0, #0x28]
    9a3c:      	b.lo	0x99b0 <.text+0x89b0>
    9a40:      	b	0x99a8 <.text+0x89a8>
    9a44:      	stp	x29, x30, [sp, #-0x10]!
    9a48:      	mov	x29, sp
    9a4c:      	adrp	x1, 0xf000 <.text+0xe000>
    9a50:      	adrp	x2, 0x10000 <.text+0xf000>
    9a54:      	adrp	x3, 0xf000 <.text+0xe000>
    9a58:      	add	x1, x1, #0xce4
    9a5c:      	add	x2, x2, #0x492
    9a60:      	add	x3, x3, #0xd0d
    9a64:      	orr	w0, wzr, #0x80000000
    9a68:      	bl	0xac7c <.text+0x9c7c>
    9a6c:      	mov	w8, #-0x80000000        // =-2147483648
    9a70:      	movk	w8, #0x2
    9a74:      	ldp	x29, x30, [sp], #0x10
    9a78:      	mov	w0, w8
    9a7c:      	ret
    9a80:      	cbz	x0, 0x9a98 <.text+0x8a98>
    9a84:      	and	w8, w1, #0xff
    9a88:      	cmp	w8, #0xf
    9a8c:      	and	w8, w2, #0xff
    9a90:      	ccmp	w8, #0x2, #0x2, ls
    9a94:      	b.lo	0x9ab8 <.text+0x8ab8>
    9a98:      	adrp	x1, 0xf000 <.text+0xe000>
    9a9c:      	adrp	x2, 0x10000 <.text+0xf000>
    9aa0:      	adrp	x3, 0xf000 <.text+0xe000>
    9aa4:      	add	x1, x1, #0xce4
    9aa8:      	add	x2, x2, #0xf3
    9aac:      	add	x3, x3, #0xe26
    9ab0:      	orr	w0, wzr, #0x80000000
    9ab4:      	b	0xac7c <.text+0x9c7c>
    9ab8:      	b	0x9abc <.text+0x8abc>
    9abc:      	cbz	x0, 0x9ad4 <.text+0x8ad4>
    9ac0:      	and	w8, w1, #0xff
    9ac4:      	cmp	w8, #0xf
    9ac8:      	and	w8, w2, #0xff
    9acc:      	ccmp	w8, #0x2, #0x2, ls
    9ad0:      	b.lo	0x9af4 <.text+0x8af4>
    9ad4:      	adrp	x1, 0xf000 <.text+0xe000>
    9ad8:      	adrp	x2, 0x10000 <.text+0xf000>
    9adc:      	adrp	x3, 0xf000 <.text+0xe000>
    9ae0:      	add	x1, x1, #0xce4
    9ae4:      	add	x2, x2, #0x104
    9ae8:      	add	x3, x3, #0xe26
    9aec:      	orr	w0, wzr, #0x80000000
    9af0:      	b	0xac7c <.text+0x9c7c>
    9af4:      	ret
    9af8:      	stp	x28, x27, [sp, #-0x60]!
    9afc:      	stp	x26, x25, [sp, #0x10]
    9b00:      	stp	x24, x23, [sp, #0x20]
    9b04:      	stp	x22, x21, [sp, #0x30]
    9b08:      	stp	x20, x19, [sp, #0x40]
    9b0c:      	stp	x29, x30, [sp, #0x50]
    9b10:      	add	x29, sp, #0x50
    9b14:      	sub	sp, sp, #0x10
    9b18:      	mov	w19, #-0x80000000       // =-2147483648
    9b1c:      	mov	x22, x1
    9b20:      	mov	x21, x0
    9b24:      	movk	w19, #0x2
    9b28:      	cbz	x21, 0x9cc8 <.text+0x8cc8>
    9b2c:      	cbz	x22, 0x9cc8 <.text+0x8cc8>
    9b30:      	ldrb	w9, [x22, #0x14]
    9b34:      	cbz	w9, 0x9cc8 <.text+0x8cc8>
    9b38:      	ldr	x8, [x22, #0x28]
    9b3c:      	cbz	x8, 0x9cc8 <.text+0x8cc8>
    9b40:      	ldr	w8, [x22]
    9b44:      	movi	v0.2d, #0000000000000000
    9b48:      	lsl	w10, w8, #1
    9b4c:      	add	w12, w10, w8, lsr #8
    9b50:      	and	x20, x12, #0xff
    9b54:      	str	q0, [sp]
    9b58:      	add	x25, x21, x20, lsl #5
    9b5c:      	mov	x24, x25
    9b60:      	ldr	w5, [x24, #0x18]!
    9b64:      	cmp	w5, #0x1
    9b68:      	b.eq	0x9b7c <.text+0x8b7c>
    9b6c:      	cbnz	w20, 0x9d54 <.text+0x8d54>
    9b70:      	and	w8, w8, #0xff0000
    9b74:      	cmp	w8, #0x20, lsl #12      // =0x20000
    9b78:      	b.ne	0x9d54 <.text+0x8d54>
    9b7c:      	ldr	w13, [x21]
    9b80:      	mov	w23, #0xc704            // =50948
    9b84:      	add	w0, w13, w23
    9b88:      	bl	0xcc88 <.text+0xbc88>
    9b8c:      	ldr	x8, [x25, #0x20]
    9b90:      	cbz	x8, 0x9d0c <.text+0x8d0c>
    9b94:      	ldr	x9, [x22, #0x28]
    9b98:      	cbz	x9, 0x9d0c <.text+0x8d0c>
    9b9c:      	ldr	x11, [x8, #0x10]
    9ba0:      	subs	x10, x9, x11
    9ba4:      	b.lo	0x9d0c <.text+0x8d0c>
    9ba8:      	ldr	w13, [x8, #0x18]
    9bac:      	add	x14, x13, x11
    9bb0:      	cmp	x9, x14
    9bb4:      	b.hs	0x9d0c <.text+0x8d0c>
    9bb8:      	ldr	x16, [x8, #0x8]
    9bbc:      	lsr	w26, w0, #31
    9bc0:      	ldrh	w14, [x22, #0x4]
    9bc4:      	mov	w15, #0x406             // =1030
    9bc8:      	ldr	w17, [x21]
    9bcc:      	mov	w27, #0xc70c            // =50956
    9bd0:      	add	x4, x16, x10
    9bd4:      	lsl	w16, w14, #16
    9bd8:      	bfi	w16, w26, #8, #1
    9bdc:      	orr	w5, w16, w15
    9be0:      	add	w0, w17, w27
    9be4:      	lsr	x6, x4, #32
    9be8:      	stp	w4, w6, [sp, #0x4]
    9bec:      	str	w5, [sp, #0xc]
    9bf0:      	bl	0xcc88 <.text+0xbc88>
    9bf4:      	and	w9, w0, #0x7
    9bf8:      	cmp	w9, #0x4
    9bfc:      	b.eq	0x9c40 <.text+0x8c40>
    9c00:      	ldr	w6, [x21]
    9c04:      	add	w0, w6, w27
    9c08:      	bl	0xcc88 <.text+0xbc88>
    9c0c:      	cmp	w20, #0x1
    9c10:      	b.ne	0x9c40 <.text+0x8c40>
    9c14:      	and	w10, w0, #0x3c0000
    9c18:      	cmp	w10, #0x80, lsl #12     // =0x80000
    9c1c:      	b.ne	0x9c40 <.text+0x8c40>
    9c20:      	ldr	w0, [x21]
    9c24:      	add	w23, w0, w23
    9c28:      	mov	x0, x23
    9c2c:      	bl	0xcc88 <.text+0xbc88>
    9c30:      	and	w8, w0, #0xfffffe1f
    9c34:      	orr	w1, w8, #0x100
    9c38:      	mov	x0, x23
    9c3c:      	bl	0xccc0 <.text+0xbcc0>
    9c40:      	ldrh	w1, [x22]
    9c44:      	mov	x3, sp
    9c48:      	mov	x0, x21
    9c4c:      	lsr	w2, w1, #8
    9c50:      	bl	0x8fcc <.text+0x7fcc>
    9c54:      	mov	w23, w0
    9c58:      	tbnz	w23, #0x1f, 0x9e20 <.text+0x8e20>
    9c5c:      	orr	w1, wzr, #0x4
    9c60:      	str	w1, [x24]
    9c64:      	str	x22, [x25, #0x28]
    9c68:      	cbnz	w26, 0x9e44 <.text+0x8e44>
    9c6c:      	ldr	w2, [x21]
    9c70:      	mov	w27, #0xc80c            // =51212
    9c74:      	add	w26, w27, w20, lsl #4
    9c78:      	mov	w3, #0x2710             // =10000
    9c7c:      	orr	w1, wzr, #0x400
    9c80:      	add	w0, w26, w2
    9c84:      	mov	w2, wzr
    9c88:      	bl	0xa6d4 <.text+0x96d4>
    9c8c:      	ldr	w8, [x21]
    9c90:      	add	w0, w26, w8
    9c94:      	bl	0xcc88 <.text+0xbc88>
    9c98:      	and	w9, w0, #0xf000
    9c9c:      	cbz	w9, 0x9e4c <.text+0x8e4c>
    9ca0:      	adrp	x1, 0x10000 <.text+0xf000>
    9ca4:      	adrp	x2, 0x10000 <.text+0xf000>
    9ca8:      	adrp	x3, 0xf000 <.text+0xe000>
    9cac:      	add	x1, x1, #0x1aa
    9cb0:      	add	x2, x2, #0x113
    9cb4:      	add	x3, x3, #0xe26
    9cb8:      	orr	w0, wzr, #0x80000000
    9cbc:      	bl	0xac7c <.text+0x9c7c>
    9cc0:      	add	w19, w19, #0x4
    9cc4:      	b	0x9ce8 <.text+0x8ce8>
    9cc8:      	adrp	x1, 0xf000 <.text+0xe000>
    9ccc:      	adrp	x2, 0x10000 <.text+0xf000>
    9cd0:      	adrp	x3, 0xf000 <.text+0xe000>
    9cd4:      	add	x1, x1, #0xce4
    9cd8:      	add	x2, x2, #0x113
    9cdc:      	add	x3, x3, #0xe26
    9ce0:      	orr	w0, wzr, #0x80000000
    9ce4:      	bl	0xac7c <.text+0x9c7c>
    9ce8:      	mov	w0, w19
    9cec:      	sub	sp, x29, #0x50
    9cf0:      	ldp	x29, x30, [sp, #0x50]
    9cf4:      	ldp	x20, x19, [sp, #0x40]
    9cf8:      	ldp	x22, x21, [sp, #0x30]
    9cfc:      	ldp	x24, x23, [sp, #0x20]
    9d00:      	ldp	x26, x25, [sp, #0x10]
    9d04:      	ldp	x28, x27, [sp], #0x60
    9d08:      	ret
    9d0c:      	adrp	x1, 0xf000 <.text+0xe000>
    9d10:      	adrp	x2, 0x10000 <.text+0xf000>
    9d14:      	adrp	x3, 0xf000 <.text+0xe000>
    9d18:      	add	x1, x1, #0xce4
    9d1c:      	add	x2, x2, #0x4a1
    9d20:      	add	x3, x3, #0xd0d
    9d24:      	orr	w0, wzr, #0x80000000
    9d28:      	bl	0xac7c <.text+0x9c7c>
    9d2c:      	adrp	x1, 0x10000 <.text+0xf000>
    9d30:      	add	x1, x1, #0x120
    9d34:      	adrp	x2, 0x10000 <.text+0xf000>
    9d38:      	adrp	x3, 0xf000 <.text+0xe000>
    9d3c:      	add	x2, x2, #0x113
    9d40:      	add	x3, x3, #0xe26
    9d44:      	orr	w0, wzr, #0x80000000
    9d48:      	mov	w4, w20
    9d4c:      	bl	0xac7c <.text+0x9c7c>
    9d50:      	b	0x9ce8 <.text+0x8ce8>
    9d54:      	cmp	w5, #0x2
    9d58:      	b.ne	0x9df4 <.text+0x8df4>
    9d5c:      	ldr	w11, [x21]
    9d60:      	mov	w26, #0xc70c            // =50956
    9d64:      	ldrb	w10, [x25, #0x1c]
    9d68:      	mov	w12, #0x507             // =1287
    9d6c:      	add	w0, w11, w26
    9d70:      	bfi	w12, w10, #16, #8
    9d74:      	str	w12, [sp, #0xc]
    9d78:      	bl	0xcc88 <.text+0xbc88>
    9d7c:      	and	w11, w0, #0x7
    9d80:      	cmp	w11, #0x4
    9d84:      	b.eq	0x9dcc <.text+0x8dcc>
    9d88:      	ldr	w14, [x21]
    9d8c:      	add	w0, w14, w26
    9d90:      	bl	0xcc88 <.text+0xbc88>
    9d94:      	cmp	w20, #0x1
    9d98:      	b.ne	0x9dcc <.text+0x8dcc>
    9d9c:      	and	w12, w0, #0x3c0000
    9da0:      	cmp	w12, #0x80, lsl #12     // =0x80000
    9da4:      	b.ne	0x9dcc <.text+0x8dcc>
    9da8:      	ldr	w16, [x21]
    9dac:      	mov	w5, #0xc704             // =50948
    9db0:      	add	w23, w16, w5
    9db4:      	mov	x0, x23
    9db8:      	bl	0xcc88 <.text+0xbc88>
    9dbc:      	and	w10, w0, #0xfffffe1f
    9dc0:      	orr	w1, w10, #0x100
    9dc4:      	mov	x0, x23
    9dc8:      	bl	0xccc0 <.text+0xbcc0>
    9dcc:      	ldrh	w1, [x22]
    9dd0:      	mov	x3, sp
    9dd4:      	mov	x0, x21
    9dd8:      	lsr	w2, w1, #8
    9ddc:      	bl	0x8fcc <.text+0x7fcc>
    9de0:      	mov	w19, w0
    9de4:      	tbz	w19, #0x1f, 0x9ce8 <.text+0x8ce8>
    9de8:      	adrp	x1, 0x10000 <.text+0xf000>
    9dec:      	add	x1, x1, #0x1cb
    9df0:      	b	0x9d34 <.text+0x8d34>
    9df4:      	adrp	x1, 0x10000 <.text+0xf000>
    9df8:      	adrp	x2, 0x10000 <.text+0xf000>
    9dfc:      	adrp	x3, 0xf000 <.text+0xe000>
    9e00:      	add	x1, x1, #0x210
    9e04:      	add	x2, x2, #0x113
    9e08:      	add	x3, x3, #0xd0d
    9e0c:      	orr	w0, wzr, #0x80000000
    9e10:      	mov	w4, w20
    9e14:      	bl	0xac7c <.text+0x9c7c>
    9e18:      	mov	w19, #-0x7ffffff1       // =-2147483633
    9e1c:      	b	0x9ce8 <.text+0x8ce8>
    9e20:      	adrp	x1, 0x10000 <.text+0xf000>
    9e24:      	adrp	x2, 0x10000 <.text+0xf000>
    9e28:      	adrp	x3, 0xf000 <.text+0xe000>
    9e2c:      	add	x1, x1, #0x166
    9e30:      	add	x2, x2, #0x113
    9e34:      	add	x3, x3, #0xe26
    9e38:      	orr	w0, wzr, #0x80000000
    9e3c:      	mov	w4, w20
    9e40:      	bl	0xac7c <.text+0x9c7c>
    9e44:      	mov	w19, w23
    9e48:      	b	0x9ce8 <.text+0x8ce8>
    9e4c:      	orr	w9, wzr, #0x2
    9e50:      	mov	w19, w23
    9e54:      	str	w9, [x24]
    9e58:      	b	0x9ce8 <.text+0x8ce8>
    9e5c:      	stp	x26, x25, [sp, #-0x50]!
    9e60:      	stp	x24, x23, [sp, #0x10]
    9e64:      	stp	x22, x21, [sp, #0x20]
    9e68:      	stp	x20, x19, [sp, #0x30]
    9e6c:      	stp	x29, x30, [sp, #0x40]
    9e70:      	add	x29, sp, #0x40
    9e74:      	sub	sp, sp, #0x10
    9e78:      	mov	w19, #-0x80000000       // =-2147483648
    9e7c:      	mov	w22, w2
    9e80:      	mov	w23, w1
    9e84:      	mov	x20, x0
    9e88:      	movk	w19, #0x2
    9e8c:      	cbz	x20, 0x9ea4 <.text+0x8ea4>
    9e90:      	and	w8, w23, #0xff
    9e94:      	cmp	w8, #0xf
    9e98:      	and	w9, w22, #0xff
    9e9c:      	ccmp	w9, #0x2, #0x2, ls
    9ea0:      	b.lo	0x9ec8 <.text+0x8ec8>
    9ea4:      	adrp	x1, 0xf000 <.text+0xe000>
    9ea8:      	adrp	x2, 0x10000 <.text+0xf000>
    9eac:      	adrp	x3, 0xf000 <.text+0xe000>
    9eb0:      	add	x1, x1, #0xce4
    9eb4:      	add	x2, x2, #0x244
    9eb8:      	add	x3, x3, #0xe26
    9ebc:      	orr	w0, wzr, #0x80000000
    9ec0:      	bl	0xac7c <.text+0x9c7c>
    9ec4:      	b	0x9fdc <.text+0x8fdc>
    9ec8:      	add	w8, w22, w23, lsl #1
    9ecc:      	and	x21, x8, #0xff
    9ed0:      	add	x24, x20, x21, lsl #5
    9ed4:      	mov	x25, x24
    9ed8:      	ldrb	w8, [x25, #0x1c]!
    9edc:      	cmp	w8, #0xff
    9ee0:      	b.eq	0x9f24 <.text+0x8f24>
    9ee4:      	mov	w10, #0xd08             // =3336
    9ee8:      	mov	w19, #0x3e8             // =1000
    9eec:      	mov	w26, #-0x7ffffff9       // =-2147483641
    9ef0:      	bfi	w10, w8, #16, #8
    9ef4:      	stp	wzr, w10, [sp, #0x8]
    9ef8:      	str	xzr, [sp]
    9efc:      	mov	x3, sp
    9f00:      	mov	x0, x20
    9f04:      	mov	w1, w23
    9f08:      	mov	w2, w22
    9f0c:      	bl	0x8fcc <.text+0x7fcc>
    9f10:      	cmp	w0, w26
    9f14:      	b.ne	0x9f2c <.text+0x8f2c>
    9f18:      	subs	w19, w19, #0x1
    9f1c:      	b.ne	0x9efc <.text+0x8efc>
    9f20:      	b	0x9f30 <.text+0x8f30>
    9f24:      	add	w19, w19, #0xc
    9f28:      	b	0x9fdc <.text+0x8fdc>
    9f2c:      	tbz	w0, #0x1f, 0x9f54 <.text+0x8f54>
    9f30:      	adrp	x1, 0x10000 <.text+0xf000>
    9f34:      	adrp	x2, 0x10000 <.text+0xf000>
    9f38:      	adrp	x3, 0xf000 <.text+0xe000>
    9f3c:      	add	x1, x1, #0x25a
    9f40:      	add	x2, x2, #0x244
    9f44:      	add	x3, x3, #0xe26
    9f48:      	orr	w0, wzr, #0x80000000
    9f4c:      	mov	w4, w21
    9f50:      	bl	0xac7c <.text+0x9c7c>
    9f54:      	ldr	w12, [x20]
    9f58:      	mov	w14, #0xc80c            // =51212
    9f5c:      	mov	w3, #0x2710             // =10000
    9f60:      	orr	w1, wzr, #0x400
    9f64:      	mov	w2, wzr
    9f68:      	add	w13, w12, w21, lsl #4
    9f6c:      	add	w0, w13, w14
    9f70:      	bl	0xa6d4 <.text+0x96d4>
    9f74:      	mov	w19, w0
    9f78:      	tbz	w19, #0x1f, 0x9f9c <.text+0x8f9c>
    9f7c:      	adrp	x1, 0xf000 <.text+0xe000>
    9f80:      	adrp	x2, 0x10000 <.text+0xf000>
    9f84:      	adrp	x3, 0xf000 <.text+0xe000>
    9f88:      	add	x1, x1, #0xed4
    9f8c:      	add	x2, x2, #0x244
    9f90:      	add	x3, x3, #0xe26
    9f94:      	orr	w0, wzr, #0x80000000
    9f98:      	bl	0xac7c <.text+0x9c7c>
    9f9c:      	adrp	x9, 0x13000
    9fa0:      	mov	w0, #0x3e8              // =1000
    9fa4:      	ldr	x10, [x9, #0x478]
    9fa8:      	ldr	x9, [x10, #0xf8]
    9fac:      	blr	x9
    9fb0:      	mov	x8, x24
    9fb4:      	ldr	w10, [x8, #0x18]!
    9fb8:      	cmp	w10, #0x3
    9fbc:      	ccmp	w10, #0x5, #0x4, ne
    9fc0:      	b.eq	0x9fcc <.text+0x8fcc>
    9fc4:      	orr	w16, wzr, #0x1
    9fc8:      	str	w16, [x8]
    9fcc:      	ldr	x0, [x24, #0x20]
    9fd0:      	orr	w17, wzr, #0xff
    9fd4:      	strb	w17, [x25]
    9fd8:      	bl	0x9180 <.text+0x8180>
    9fdc:      	mov	w0, w19
    9fe0:      	sub	sp, x29, #0x40
    9fe4:      	ldp	x29, x30, [sp, #0x40]
    9fe8:      	ldp	x20, x19, [sp, #0x30]
    9fec:      	ldp	x22, x21, [sp, #0x20]
    9ff0:      	ldp	x24, x23, [sp, #0x10]
    9ff4:      	ldp	x26, x25, [sp], #0x50
    9ff8:      	ret
    9ffc:      	stp	x22, x21, [sp, #-0x30]!
    a000:      	stp	x20, x19, [sp, #0x10]
    a004:      	stp	x29, x30, [sp, #0x20]
    a008:      	add	x29, sp, #0x20
    a00c:      	mov	x20, x1
    a010:      	mov	x19, x0
    a014:      	cbz	x19, 0xa084 <.text+0x9084>
    a018:      	cbz	x20, 0xa084 <.text+0x9084>
    a01c:      	ldr	w8, [x19]
    a020:      	mov	w21, #0xc714            // =50964
    a024:      	add	w0, w8, w21
    a028:      	bl	0xcc88 <.text+0xbc88>
    a02c:      	tbnz	w0, #0xa, 0xa0b0 <.text+0x90b0>
    a030:      	ldr	w1, [x20, #0x4]
    a034:      	and	w8, w1, #0xff
    a038:      	cmp	w8, #0x10
    a03c:      	b.hi	0xa0cc <.text+0x90cc>
    a040:      	mov	w11, #0x10000           // =65536
    a044:      	orr	w10, wzr, #0x1
    a048:      	movk	w11, #0x12b4
    a04c:      	lsl	w12, w10, w8
    a050:      	and	w13, w12, w11
    a054:      	cbz	w13, 0xa0c4 <.text+0x90c4>
    a058:      	ldr	w15, [x19]
    a05c:      	mov	w16, #0xc710            // =50960
    a060:      	ldr	w1, [x20]
    a064:      	add	w0, w15, w16
    a068:      	bl	0xccc0 <.text+0xbcc0>
    a06c:      	ldr	w1, [x20, #0x4]
    a070:      	ldr	w17, [x19]
    a074:      	add	w0, w17, w21
    a078:      	bl	0xccc0 <.text+0xbcc0>
    a07c:      	mov	w0, wzr
    a080:      	b	0xa0b4 <.text+0x90b4>
    a084:      	adrp	x1, 0xf000 <.text+0xe000>
    a088:      	adrp	x2, 0x10000 <.text+0xf000>
    a08c:      	adrp	x3, 0xf000 <.text+0xe000>
    a090:      	add	x1, x1, #0xce4
    a094:      	add	x2, x2, #0x30f
    a098:      	add	x3, x3, #0xe26
    a09c:      	orr	w0, wzr, #0x80000000
    a0a0:      	bl	0xac7c <.text+0x9c7c>
    a0a4:      	mov	w0, #-0x80000000        // =-2147483648
    a0a8:      	movk	w0, #0x2
    a0ac:      	b	0xa0b4 <.text+0x90b4>
    a0b0:      	mov	w0, #-0x7ffffff9        // =-2147483641
    a0b4:      	ldp	x29, x30, [sp, #0x20]
    a0b8:      	ldp	x20, x19, [sp, #0x10]
    a0bc:      	ldp	x22, x21, [sp], #0x30
    a0c0:      	ret
    a0c4:      	cmp	w8, #0xa
    a0c8:      	b.eq	0xa070 <.text+0x9070>
    a0cc:      	adrp	x1, 0x10000 <.text+0xf000>
    a0d0:      	adrp	x2, 0x10000 <.text+0xf000>
    a0d4:      	adrp	x3, 0xf000 <.text+0xe000>
    a0d8:      	add	x1, x1, #0x325
    a0dc:      	add	x2, x2, #0x30f
    a0e0:      	add	x3, x3, #0xe26
    a0e4:      	orr	w0, wzr, #0x80000000
    a0e8:      	bl	0xac7c <.text+0x9c7c>
    a0ec:      	mov	w0, #-0x7ffffffd        // =-2147483645
    a0f0:      	b	0xa0b4 <.text+0x90b4>
    a0f4:      	stp	x20, x19, [sp, #-0x20]!
    a0f8:      	stp	x29, x30, [sp, #0x10]
    a0fc:      	add	x29, sp, #0x10
    a100:      	mov	w19, #-0x80000000       // =-2147483648
    a104:      	mov	x20, x3
    a108:      	movk	w19, #0x2
    a10c:      	cbz	x0, 0xa134 <.text+0x9134>
    a110:      	cbz	x20, 0xa134 <.text+0x9134>
    a114:      	and	w4, w1, #0xff
    a118:      	cmp	w4, #0x10
    a11c:      	b.lo	0xa128 <.text+0x9128>
    a120:      	cmp	w4, #0xfd
    a124:      	b.ne	0xa134 <.text+0x9134>
    a128:      	and	w5, w2, #0xff
    a12c:      	cmp	w5, #0x2
    a130:      	b.lo	0xa164 <.text+0x9164>
    a134:      	adrp	x1, 0xf000 <.text+0xe000>
    a138:      	adrp	x2, 0x10000 <.text+0xf000>
    a13c:      	adrp	x3, 0xf000 <.text+0xe000>
    a140:      	add	x1, x1, #0xce4
    a144:      	add	x2, x2, #0x35a
    a148:      	add	x3, x3, #0xf7f
    a14c:      	orr	w0, wzr, #0x80000000
    a150:      	bl	0xac7c <.text+0x9c7c>
    a154:      	ldp	x29, x30, [sp, #0x10]
    a158:      	mov	w0, w19
    a15c:      	ldp	x20, x19, [sp], #0x20
    a160:      	ret
    a164:      	and	w8, w1, #0xff
    a168:      	cmp	w8, #0xfd
    a16c:      	b.ne	0xa178 <.text+0x9178>
    a170:      	mov	w8, wzr
    a174:      	b	0xa188 <.text+0x9188>
    a178:      	add	w8, w2, w1, lsl #1
    a17c:      	and	x8, x8, #0xff
    a180:      	add	x9, x0, x8, lsl #5
    a184:      	ldrb	w8, [x9, #0x1d]
    a188:      	ldrb	w13, [x0, #0x9]
    a18c:      	cmp	w8, w13
    a190:      	b.hs	0xa1b8 <.text+0x91b8>
    a194:      	ldr	w15, [x0]
    a198:      	mov	w17, #0xc40c            // =50188
    a19c:      	add	w16, w15, w8, lsl #4
    a1a0:      	add	w0, w16, w17
    a1a4:      	bl	0xcc88 <.text+0xbc88>
    a1a8:      	mov	w19, wzr
    a1ac:      	ubfx	w3, w0, #2, #14
    a1b0:      	str	w3, [x20]
    a1b4:      	b	0xa154 <.text+0x9154>
    a1b8:      	adrp	x1, 0x10000 <.text+0xf000>
    a1bc:      	adrp	x2, 0x10000 <.text+0xf000>
    a1c0:      	adrp	x3, 0xf000 <.text+0xe000>
    a1c4:      	add	x1, x1, #0x36b
    a1c8:      	add	x2, x2, #0x35a
    a1cc:      	add	x3, x3, #0xf7f
    a1d0:      	orr	w0, wzr, #0x80000000
    a1d4:      	bl	0xac7c <.text+0x9c7c>
    a1d8:      	add	w19, w19, #0x6
    a1dc:      	b	0xa154 <.text+0x9154>
    a1e0:      	stp	x26, x25, [sp, #-0x50]!
    a1e4:      	stp	x24, x23, [sp, #0x10]
    a1e8:      	stp	x22, x21, [sp, #0x20]
    a1ec:      	stp	x20, x19, [sp, #0x30]
    a1f0:      	stp	x29, x30, [sp, #0x40]
    a1f4:      	add	x29, sp, #0x40
    a1f8:      	sub	sp, sp, #0x50
    a1fc:      	mov	w21, #-0x80000000       // =-2147483648
    a200:      	mov	x19, x3
    a204:      	mov	x20, x0
    a208:      	movk	w21, #0x2
    a20c:      	cbz	x20, 0xa234 <.text+0x9234>
    a210:      	cbz	x19, 0xa234 <.text+0x9234>
    a214:      	and	w4, w1, #0xff
    a218:      	cmp	w4, #0x10
    a21c:      	b.lo	0xa228 <.text+0x9228>
    a220:      	cmp	w4, #0xfd
    a224:      	b.ne	0xa234 <.text+0x9234>
    a228:      	and	w5, w2, #0xff
    a22c:      	cmp	w5, #0x2
    a230:      	b.lo	0xa274 <.text+0x9274>
    a234:      	adrp	x1, 0xf000 <.text+0xe000>
    a238:      	adrp	x2, 0x10000 <.text+0xf000>
    a23c:      	adrp	x3, 0xf000 <.text+0xe000>
    a240:      	add	x1, x1, #0xce4
    a244:      	add	x2, x2, #0x3a6
    a248:      	add	x3, x3, #0xf7f
    a24c:      	orr	w0, wzr, #0x80000000
    a250:      	bl	0xac7c <.text+0x9c7c>
    a254:      	mov	w0, w21
    a258:      	sub	sp, x29, #0x40
    a25c:      	ldp	x29, x30, [sp, #0x40]
    a260:      	ldp	x20, x19, [sp, #0x30]
    a264:      	ldp	x22, x21, [sp, #0x20]
    a268:      	ldp	x24, x23, [sp, #0x10]
    a26c:      	ldp	x26, x25, [sp], #0x50
    a270:      	ret
    a274:      	and	w8, w1, #0xff
    a278:      	cmp	w8, #0xfd
    a27c:      	b.ne	0xa288 <.text+0x9288>
    a280:      	mov	w22, wzr
    a284:      	b	0xa298 <.text+0x9298>
    a288:      	add	w9, w2, w1, lsl #1
    a28c:      	and	x17, x9, #0xff
    a290:      	add	x0, x20, x17, lsl #5
    a294:      	ldrb	w22, [x0, #0x1d]
    a298:      	ldrb	w15, [x20, #0x9]
    a29c:      	cmp	w22, w15
    a2a0:      	b.hs	0xa348 <.text+0x9348>
    a2a4:      	ldr	x12, [x20, #0x10]
    a2a8:      	orr	w6, wzr, #0x18
    a2ac:      	madd	x12, x22, x6, x12
    a2b0:      	mov	x9, x12
    a2b4:      	mov	x13, x12
    a2b8:      	ldr	x1, [x9, #0x8]!
    a2bc:      	ldr	w17, [x1]
    a2c0:      	str	w17, [x19]
    a2c4:      	ldr	x2, [x9]
    a2c8:      	add	x14, x2, #0x4
    a2cc:      	str	x14, [x9]
    a2d0:      	ldr	x8, [x13], #0x10
    a2d4:      	ldr	w7, [x13]
    a2d8:      	add	x10, x7, x8
    a2dc:      	cmp	x14, x10
    a2e0:      	b.lo	0xa2ec <.text+0x92ec>
    a2e4:      	mov	x14, x8
    a2e8:      	str	x8, [x9]
    a2ec:      	ldr	w3, [x19]
    a2f0:      	mov	w4, #0xf01              // =3841
    a2f4:      	and	w11, w3, w4
    a2f8:      	cmp	w11, #0xc01
    a2fc:      	b.ne	0xa370 <.text+0x9370>
    a300:      	add	x3, x14, #0x8
    a304:      	cmp	x3, x10
    a308:      	b.ls	0xa314 <.text+0x9314>
    a30c:      	mov	x14, x8
    a310:      	str	x8, [x9]
    a314:      	ldr	x1, [x14]
    a318:      	str	x1, [x19, #0x8]
    a31c:      	ldr	x4, [x9]
    a320:      	ldr	x11, [x12]
    a324:      	ldr	w2, [x13]
    a328:      	add	x5, x4, #0x8
    a32c:      	add	x3, x2, x11
    a330:      	cmp	x5, x3
    a334:      	str	x5, [x9]
    a338:      	orr	w24, wzr, #0xc
    a33c:      	b.lo	0xa374 <.text+0x9374>
    a340:      	str	x11, [x9]
    a344:      	b	0xa374 <.text+0x9374>
    a348:      	adrp	x1, 0x10000 <.text+0xf000>
    a34c:      	adrp	x2, 0x10000 <.text+0xf000>
    a350:      	adrp	x3, 0xf000 <.text+0xe000>
    a354:      	add	x1, x1, #0x36b
    a358:      	add	x2, x2, #0x3a6
    a35c:      	add	x3, x3, #0xf7f
    a360:      	orr	w0, wzr, #0x80000000
    a364:      	bl	0xac7c <.text+0x9c7c>
    a368:      	add	w21, w21, #0x6
    a36c:      	b	0xa254 <.text+0x9254>
    a370:      	orr	w24, wzr, #0x4
    a374:      	ldr	w7, [x20]
    a378:      	mov	w2, #0xc40c             // =50188
    a37c:      	add	w23, w2, w22, lsl #4
    a380:      	add	w21, w23, w7
    a384:      	mov	x0, x21
    a388:      	bl	0xcc88 <.text+0xbc88>
    a38c:      	and	w9, w0, #0xffff0000
    a390:      	orr	w1, w9, w24
    a394:      	mov	x0, x21
    a398:      	bl	0xccc0 <.text+0xbcc0>
    a39c:      	ldr	w8, [x19]
    a3a0:      	tbnz	w8, #0x0, 0xa424 <.text+0x9424>
    a3a4:      	mov	w23, #0xf000000         // =251658240
    a3a8:      	movk	w23, #0x3c0
    a3ac:      	mov	w12, #0x6000000         // =100663296
    a3b0:      	ubfx	w22, w8, #1, #5
    a3b4:      	and	w11, w8, w23
    a3b8:      	movk	w12, #0x1c0
    a3bc:      	cmp	w11, w12
    a3c0:      	b.ne	0xa4e8 <.text+0x94e8>
    a3c4:      	and	w6, w22, #0xff
    a3c8:      	add	x15, x20, x6, lsl #5
    a3cc:      	mov	x16, x15
    a3d0:      	ldr	w10, [x16, #0x18]!
    a3d4:      	cmp	w10, #0x4
    a3d8:      	b.ne	0xa4e8 <.text+0x94e8>
    a3dc:      	and	w13, w8, #0xf000
    a3e0:      	cbz	w13, 0xa4d4 <.text+0x94d4>
    a3e4:      	orr	w4, wzr, #0x1
    a3e8:      	orr	w6, wzr, #0xff
    a3ec:      	adrp	x1, 0x10000 <.text+0xf000>
    a3f0:      	str	w4, [x16]
    a3f4:      	adrp	x2, 0x10000 <.text+0xf000>
    a3f8:      	strb	w6, [x15, #0x1c]
    a3fc:      	adrp	x3, 0xf000 <.text+0xe000>
    a400:      	ldr	w15, [x19]
    a404:      	and	w4, w22, #0xff
    a408:      	add	x1, x1, #0x3f8
    a40c:      	add	x2, x2, #0x3a6
    a410:      	add	x3, x3, #0xf7f
    a414:      	orr	w0, wzr, #0x80000000
    a418:      	ubfx	w5, w15, #12, #4
    a41c:      	bl	0xac7c <.text+0x9c7c>
    a420:      	b	0xa4e8 <.text+0x94e8>
    a424:      	and	w9, w8, #0xf00
    a428:      	cmp	w9, #0xb00
    a42c:      	b.ne	0xa698 <.text+0x9698>
    a430:      	adrp	x1, 0x10000 <.text+0xf000>
    a434:      	adrp	x2, 0x10000 <.text+0xf000>
    a438:      	adrp	x3, 0xf000 <.text+0xe000>
    a43c:      	add	x1, x1, #0x3b6
    a440:      	add	x2, x2, #0x3a6
    a444:      	add	x3, x3, #0xf7f
    a448:      	orr	w0, wzr, #0x80000000
    a44c:      	lsl	w22, w22, #4
    a450:      	bl	0xac7c <.text+0x9c7c>
    a454:      	mov	w1, #0xc708             // =50952
    a458:      	str	w23, [sp, #0x40]
    a45c:      	mov	w0, #0xc404             // =50180
    a460:      	mov	w13, #0xc400            // =50176
    a464:      	mov	w8, #0xc408             // =50184
    a468:      	str	w1, [sp]
    a46c:      	adrp	x14, 0x10000 <.text+0xf000>
    a470:      	add	w9, w22, w0
    a474:      	add	w24, w22, w13
    a478:      	adrp	x15, 0x10000 <.text+0xf000>
    a47c:      	add	w10, w22, w8
    a480:      	str	w9, [sp, #0x10]
    a484:      	adrp	x22, 0x10000 <.text+0xf000>
    a488:      	str	w24, [sp, #0x20]
    a48c:      	adrp	x16, 0x10000 <.text+0xf000>
    a490:      	adrp	x8, 0x10000 <.text+0xf000>
    a494:      	str	w10, [sp, #0x30]
    a498:      	add	x14, x14, #0x4ba
    a49c:      	add	x15, x15, #0x4c5
    a4a0:      	add	x22, x22, #0x4d0
    a4a4:      	add	x16, x16, #0x4db
    a4a8:      	str	x14, [sp, #0x8]
    a4ac:      	add	x8, x8, #0x4e6
    a4b0:      	str	x15, [sp, #0x18]
    a4b4:      	mov	w2, #0x5                // =5
    a4b8:      	str	x22, [sp, #0x28]
    a4bc:      	mov	x1, sp
    a4c0:      	str	x16, [sp, #0x38]
    a4c4:      	mov	x0, x20
    a4c8:      	str	x8, [sp, #0x48]
    a4cc:      	bl	0x86a4 <.text+0x76a4>
    a4d0:      	b	0xa698 <.text+0x9698>
    a4d4:      	orr	w3, wzr, #0x2
    a4d8:      	str	w3, [x16]
    a4dc:      	ldrb	w16, [x19, #0x2]
    a4e0:      	and	w14, w16, #0x7f
    a4e4:      	strb	w14, [x15, #0x1c]
    a4e8:      	ldr	w7, [x19]
    a4ec:      	ubfx	w15, w7, #6, #4
    a4f0:      	sub	w16, w15, #0x1
    a4f4:      	cmp	w16, #0x1
    a4f8:      	b.hi	0xa698 <.text+0x9698>
    a4fc:      	and	w7, w22, #0xff
    a500:      	mov	w21, wzr
    a504:      	add	x23, x20, x7, lsl #5
    a508:      	mov	x24, x23
    a50c:      	ldr	w8, [x24, #0x18]!
    a510:      	cmp	w8, #0x5
    a514:      	b.hi	0xa254 <.text+0x9254>
    a518:      	orr	w1, wzr, #0x1
    a51c:      	mov	w0, #0x2c               // =44
    a520:      	lsl	w9, w1, w8
    a524:      	and	w13, w9, w0
    a528:      	cbz	w13, 0xa254 <.text+0x9254>
    a52c:      	mov	x8, x23
    a530:      	orr	w13, wzr, #0xf0ffffff
    a534:      	orr	x16, xzr, #0x8000000000
    a538:      	ldr	x10, [x8, #0x20]!
    a53c:      	mov	x25, x8
    a540:      	ldr	x20, [x25, #0x8]!
    a544:      	ldr	x11, [x20, #0x28]
    a548:      	strb	wzr, [x20, #0x20]
    a54c:      	ldr	w14, [x19]
    a550:      	ldrb	w12, [x20, #0x14]
    a554:      	ldr	w17, [x11, #0x8]
    a558:      	ubfx	w9, w14, #13, #1
    a55c:      	and	x21, x17, #0xf0000000
    a560:      	b	0xa580 <.text+0x9580>
    a564:      	ldr	x5, [x10, #0x10]
    a568:      	add	x11, x11, #0x10
    a56c:      	ldr	w7, [x10, #0x18]
    a570:      	sub	w12, w12, #0x1
    a574:      	add	x0, x7, x5
    a578:      	cmp	x11, x0
    a57c:      	csel	x11, x11, x5, lo
    a580:      	ldp	w17, w4, [x11, #0x8]
    a584:      	cmp	w12, #0x2
    a588:      	bfi	x17, x4, #32, #32
    a58c:      	and	x5, x17, x13
    a590:      	b.lo	0xa5a8 <.text+0x95a8>
    a594:      	cbnz	x5, 0xa5a8 <.text+0x95a8>
    a598:      	tbz	x17, #0x20, 0xa564 <.text+0x9564>
    a59c:      	and	x14, x17, #0x3f000000000
    a5a0:      	cmp	x14, x16
    a5a4:      	b.eq	0xa564 <.text+0x9564>
    a5a8:      	cbz	x5, 0xa614 <.text+0x9614>
    a5ac:      	mov	w13, wzr
    a5b0:      	orr	x14, xzr, #0x8000000000
    a5b4:      	orr	w15, wzr, #0x20000000
    a5b8:      	ubfx	x2, x17, #28, #4
    a5bc:      	strb	w2, [x20, #0x20]
    a5c0:      	b	0xa5e8 <.text+0x95e8>
    a5c4:      	ldr	x17, [x10, #0x10]
    a5c8:      	and	w0, w4, #0xffffff
    a5cc:      	ldr	w4, [x10, #0x18]
    a5d0:      	add	w13, w0, w13
    a5d4:      	add	x0, x11, #0x10
    a5d8:      	sub	w12, w12, #0x1
    a5dc:      	add	x11, x4, x17
    a5e0:      	cmp	x0, x11
    a5e4:      	csel	x11, x0, x17, lo
    a5e8:      	cbz	w12, 0xa618 <.text+0x9618>
    a5ec:      	ldp	w4, w3, [x11, #0x8]
    a5f0:      	bfi	x4, x3, #32, #32
    a5f4:      	and	x16, x4, #0x3f000000000
    a5f8:      	cmp	x16, x14
    a5fc:      	ccmp	x21, x15, #0x4, ne
    a600:      	and	x17, x4, #0x100000000
    a604:      	ccmp	w9, #0x0, #0x0, ne
    a608:      	ccmp	x17, #0x0, #0x4, eq
    a60c:      	b.ne	0xa618 <.text+0x9618>
    a610:      	b	0xa5c4 <.text+0x95c4>
    a614:      	mov	w13, wzr
    a618:      	ldr	w10, [x20, #0x18]
    a61c:      	ldr	w11, [x20, #0x10]
    a620:      	sub	w12, w10, w13
    a624:      	add	w17, w11, w12
    a628:      	orr	w10, wzr, #0x20000000
    a62c:      	cmp	x21, x10
    a630:      	str	w12, [x20, #0x1c]
    a634:      	str	w17, [x20, #0x10]
    a638:      	cset	w16, eq
    a63c:      	ldr	x0, [x8]
    a640:      	orr	w1, w16, w9
    a644:      	bl	0x9984 <.text+0x8984>
    a648:      	tbz	w0, #0x1f, 0xa670 <.text+0x9670>
    a64c:      	adrp	x1, 0x10000 <.text+0xf000>
    a650:      	adrp	x2, 0x10000 <.text+0xf000>
    a654:      	adrp	x3, 0xf000 <.text+0xe000>
    a658:      	and	w4, w22, #0xff
    a65c:      	add	x1, x1, #0x442
    a660:      	add	x2, x2, #0x3a6
    a664:      	add	x3, x3, #0xd0d
    a668:      	orr	w0, wzr, #0x80000000
    a66c:      	bl	0xac7c <.text+0x9c7c>
    a670:      	ldr	w22, [x19]
    a674:      	and	w10, w22, #0x3c0
    a678:      	cmp	w10, #0x40
    a67c:      	b.ne	0xa698 <.text+0x9698>
    a680:      	orr	w9, wzr, #0x20000000
    a684:      	cmp	x21, x9
    a688:      	b.ne	0xa6a0 <.text+0x96a0>
    a68c:      	ldrb	w17, [x20, #0x2]
    a690:      	cmp	w17, #0x5
    a694:      	b.ne	0xa6a0 <.text+0x96a0>
    a698:      	mov	w21, wzr
    a69c:      	b	0xa254 <.text+0x9254>
    a6a0:      	mov	x0, x20
    a6a4:      	bl	0xa8e0 <.text+0x98e0>
    a6a8:      	ldr	w1, [x24]
    a6ac:      	cmp	w1, #0x3
    a6b0:      	ccmp	w1, #0x5, #0x4, ne
    a6b4:      	b.eq	0xa6c0 <.text+0x96c0>
    a6b8:      	orr	w15, wzr, #0x1
    a6bc:      	str	w15, [x24]
    a6c0:      	orr	w24, wzr, #0xff
    a6c4:      	str	xzr, [x25]
    a6c8:      	mov	w21, wzr
    a6cc:      	strb	w24, [x23, #0x1c]
    a6d0:      	b	0xa254 <.text+0x9254>
    a6d4:      	stp	x26, x25, [sp, #-0x50]!
    a6d8:      	stp	x24, x23, [sp, #0x10]
    a6dc:      	stp	x22, x21, [sp, #0x20]
    a6e0:      	stp	x20, x19, [sp, #0x30]
    a6e4:      	stp	x29, x30, [sp, #0x40]
    a6e8:      	add	x29, sp, #0x40
    a6ec:      	mov	w9, #-0x33340000        // =-859045888
    a6f0:      	mov	w8, w3
    a6f4:      	movk	w9, #0xcccd
    a6f8:      	mov	w25, #-0x80000000       // =-2147483648
    a6fc:      	mul	x10, x8, x9
    a700:      	mov	w19, w1
    a704:      	mov	w20, w0
    a708:      	lsr	x8, x10, #35
    a70c:      	mov	w22, #-0x1              // =-1
    a710:      	and	w23, w2, #0xff
    a714:      	add	w24, w8, #0x1
    a718:      	movk	w25, #0x9
    a71c:      	adrp	x26, 0x13000
    a720:      	mov	w21, #0xa               // =10
    a724:      	b	0xa738 <.text+0x9738>
    a728:      	ldr	x9, [x26, #0x478]
    a72c:      	mov	x0, x21
    a730:      	ldr	x11, [x9, #0xf8]
    a734:      	blr	x11
    a738:      	add	w22, w22, #0x1
    a73c:      	mov	w0, w25
    a740:      	cmp	w22, w24
    a744:      	b.hs	0xa768 <.text+0x9768>
    a748:      	mov	x0, x20
    a74c:      	bl	0xcc88 <.text+0xbc88>
    a750:      	and	w9, w0, w19
    a754:      	cmp	w9, w19
    a758:      	cset	w11, eq
    a75c:      	cmp	w11, w23
    a760:      	b.ne	0xa728 <.text+0x9728>
    a764:      	mov	w0, wzr
    a768:      	ldp	x29, x30, [sp, #0x40]
    a76c:      	ldp	x20, x19, [sp, #0x30]
    a770:      	ldp	x22, x21, [sp, #0x20]
    a774:      	ldp	x24, x23, [sp, #0x10]
    a778:      	ldp	x26, x25, [sp], #0x50
    a77c:      	ret
    a780:      	stp	x22, x21, [sp, #-0x30]!
    a784:      	stp	x20, x19, [sp, #0x10]
    a788:      	stp	x29, x30, [sp, #0x20]
    a78c:      	add	x29, sp, #0x20
    a790:      	sub	sp, sp, #0xc0
    a794:      	adrp	x21, 0x13000
    a798:      	mov	w20, w1
    a79c:      	add	x22, sp, #0x28
    a7a0:      	ldr	x21, [x21]
    a7a4:      	mov	x19, x0
    a7a8:      	str	x21, [x22]
    a7ac:      	cbz	x19, 0xa858 <.text+0x9858>
    a7b0:      	mov	w1, #0x81               // =129
    a7b4:      	add	x0, sp, #0x37
    a7b8:      	mov	w2, wzr
    a7bc:      	bl	0xb218 <.text+0xa218>
    a7c0:      	cmp	w20, #0x40
    a7c4:      	ldp	w1, w8, [x19]
    a7c8:      	orr	w9, wzr, #0x40
    a7cc:      	add	x0, sp, #0x37
    a7d0:      	csel	w2, w9, w20, hi
    a7d4:      	bfi	x1, x8, #32, #32
    a7d8:      	bl	0xa87c <.text+0x987c>
    a7dc:      	ldp	w3, w8, [x19, #0x4]
    a7e0:      	adrp	x1, 0x10000 <.text+0xf000>
    a7e4:      	ldr	w2, [x19]
    a7e8:      	add	x1, x1, #0x4f1
    a7ec:      	orr	w0, wzr, #0x40
    a7f0:      	and	w4, w8, #0xffffff
    a7f4:      	bl	0xac7c <.text+0x9c7c>
    a7f8:      	adrp	x1, 0xf000 <.text+0xe000>
    a7fc:      	add	x1, x1, #0x871
    a800:      	orr	w0, wzr, #0x40
    a804:      	add	x2, sp, #0x37
    a808:      	bl	0xac7c <.text+0x9c7c>
    a80c:      	ldp	w10, w11, [x19, #0x8]
    a810:      	adrp	x1, 0x10000 <.text+0xf000>
    a814:      	orr	w0, wzr, #0x40
    a818:      	add	x1, x1, #0x55d
    a81c:      	and	w4, w11, #0x1
    a820:      	ubfx	w2, w10, #24, #2
    a824:      	lsr	w3, w10, #28
    a828:      	ubfx	w5, w11, #1, #1
    a82c:      	ubfx	w6, w11, #2, #1
    a830:      	ubfx	w7, w11, #3, #1
    a834:      	ubfx	w12, w11, #4, #6
    a838:      	ubfx	w13, w11, #10, #1
    a83c:      	ubfx	w14, w11, #11, #1
    a840:      	str	w12, [sp]
    a844:      	ubfx	w11, w11, #14, #16
    a848:      	str	w13, [sp, #0x8]
    a84c:      	str	w14, [sp, #0x10]
    a850:      	str	w11, [sp, #0x18]
    a854:      	bl	0xac7c <.text+0x9c7c>
    a858:      	ldr	x10, [x22]
    a85c:      	sub	x12, x21, x10
    a860:      	cbnz	x12, 0xa878 <.text+0x9878>
    a864:      	sub	sp, x29, #0x20
    a868:      	ldp	x29, x30, [sp, #0x20]
    a86c:      	ldp	x20, x19, [sp, #0x10]
    a870:      	ldp	x22, x21, [sp], #0x30
    a874:      	ret
    a878:      	bl	0x117c <.text+0x17c>
    a87c:      	stp	x22, x21, [sp, #-0x30]!
    a880:      	stp	x20, x19, [sp, #0x10]
    a884:      	stp	x29, x30, [sp, #0x20]
    a888:      	add	x29, sp, #0x20
    a88c:      	mov	w19, w2
    a890:      	mov	x20, x1
    a894:      	mov	x21, x0
    a898:      	cbz	x21, 0xa8d0 <.text+0x98d0>
    a89c:      	cbz	x20, 0xa8d0 <.text+0x98d0>
    a8a0:      	cbz	w19, 0xa8d0 <.text+0x98d0>
    a8a4:      	adrp	x22, 0x10000 <.text+0xf000>
    a8a8:      	add	x22, x22, #0x735
    a8ac:      	b	0xa8cc <.text+0x98cc>
    a8b0:      	ldrb	w3, [x20], #0x1
    a8b4:      	orr	w1, wzr, #0x3
    a8b8:      	mov	x0, x21
    a8bc:      	mov	x2, x22
    a8c0:      	bl	0xaa38 <.text+0x9a38>
    a8c4:      	add	x21, x21, #0x2
    a8c8:      	sub	w19, w19, #0x1
    a8cc:      	cbnz	w19, 0xa8b0 <.text+0x98b0>
    a8d0:      	ldp	x29, x30, [sp, #0x20]
    a8d4:      	ldp	x20, x19, [sp, #0x10]
    a8d8:      	ldp	x22, x21, [sp], #0x30
    a8dc:      	ret
    a8e0:      	stp	x20, x19, [sp, #-0x20]!
    a8e4:      	stp	x29, x30, [sp, #0x10]
    a8e8:      	add	x29, sp, #0x10
    a8ec:      	mov	x19, x0
    a8f0:      	cbz	x19, 0xa904 <.text+0x9904>
    a8f4:      	adrp	x8, 0xd000 <.text+0xc000>
    a8f8:      	add	x8, x8, #0xbf4
    a8fc:      	ldrb	w8, [x8, #0x2]
    a900:      	tbnz	w8, #0x6, 0xa910 <.text+0x9910>
    a904:      	ldp	x29, x30, [sp, #0x10]
    a908:      	ldp	x20, x19, [sp], #0x20
    a90c:      	ret
    a910:      	adrp	x1, 0x10000 <.text+0xf000>
    a914:      	add	x1, x1, #0x712
    a918:      	orr	w0, wzr, #0x400000
    a91c:      	mov	x2, x19
    a920:      	bl	0xac7c <.text+0x9c7c>
    a924:      	mov	x0, x19
    a928:      	bl	0xa944 <.text+0x9944>
    a92c:      	ldp	x29, x30, [sp, #0x10]
    a930:      	adrp	x1, 0x10000 <.text+0xf000>
    a934:      	add	x1, x1, #0x70f
    a938:      	orr	w0, wzr, #0x40
    a93c:      	ldp	x20, x19, [sp], #0x20
    a940:      	b	0xac7c <.text+0x9c7c>
    a944:      	stp	x20, x19, [sp, #-0x20]!
    a948:      	stp	x29, x30, [sp, #0x10]
    a94c:      	add	x29, sp, #0x10
    a950:      	sub	sp, sp, #0x10
    a954:      	mov	x19, x0
    a958:      	cbz	x19, 0xa9ec <.text+0x99ec>
    a95c:      	ldr	x6, [x19, #0x8]
    a960:      	adrp	x9, 0x10000 <.text+0xf000>
    a964:      	ldr	w8, [x19]
    a968:      	adrp	x10, 0x10000 <.text+0xf000>
    a96c:      	add	x9, x9, #0x9ed
    a970:      	ldrh	w5, [x19, #0x4]
    a974:      	add	x10, x10, #0x9e8
    a978:      	ldr	w11, [x19, #0x10]
    a97c:      	tst	x6, #0xff00000000
    a980:      	adrp	x1, 0x10000 <.text+0xf000>
    a984:      	and	w2, w8, #0xff
    a988:      	csel	x7, x10, x9, ne
    a98c:      	str	w11, [sp]
    a990:      	add	x1, x1, #0x915
    a994:      	orr	w0, wzr, #0x40
    a998:      	ubfx	w3, w8, #8, #8
    a99c:      	ubfx	w4, w8, #16, #8
    a9a0:      	bl	0xac7c <.text+0x9c7c>
    a9a4:      	ldrb	w2, [x19, #0x14]
    a9a8:      	adrp	x1, 0x10000 <.text+0xf000>
    a9ac:      	ldp	w3, w4, [x19, #0x18]
    a9b0:      	add	x1, x1, #0x9f3
    a9b4:      	ldrb	w5, [x19, #0x20]
    a9b8:      	orr	w0, wzr, #0x40
    a9bc:      	ldp	x7, x6, [x19, #0x28]
    a9c0:      	bl	0xac7c <.text+0x9c7c>
    a9c4:      	ldr	x0, [x19, #0x28]
    a9c8:      	ldr	w1, [x19, #0x8]
    a9cc:      	bl	0xa780 <.text+0x9780>
    a9d0:      	adrp	x1, 0x10000 <.text+0xf000>
    a9d4:      	add	x1, x1, #0xab5
    a9d8:      	orr	w0, wzr, #0x40
    a9dc:      	sub	sp, x29, #0x10
    a9e0:      	ldp	x29, x30, [sp, #0x10]
    a9e4:      	ldp	x20, x19, [sp], #0x20
    a9e8:      	b	0xac7c <.text+0x9c7c>
    a9ec:      	sub	sp, x29, #0x10
    a9f0:      	ldp	x29, x30, [sp, #0x10]
    a9f4:      	ldp	x20, x19, [sp], #0x20
    a9f8:      	ret
    a9fc:      	stp	x29, x30, [sp, #-0x10]!
    aa00:      	mov	x29, sp
    aa04:      	adrp	x0, 0x13000
    aa08:      	add	x0, x0, #0x60
    aa0c:      	bl	0xc45c <.text+0xb45c>
    aa10:      	cbz	x0, 0xaa28 <.text+0x9a28>
    aa14:      	add	x8, x0, #0x18
    aa18:      	adrp	x9, 0x13000
    aa1c:      	mov	x0, xzr
    aa20:      	str	x8, [x9, #0x458]
    aa24:      	b	0xaa30 <.text+0x9a30>
    aa28:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    aa2c:      	movk	x0, #0x6
    aa30:      	ldp	x29, x30, [sp], #0x10
    aa34:      	ret
    aa38:      	stp	x24, x23, [sp, #-0x40]!
    aa3c:      	stp	x22, x21, [sp, #0x10]
    aa40:      	stp	x20, x19, [sp, #0x20]
    aa44:      	stp	x29, x30, [sp, #0x30]
    aa48:      	add	x29, sp, #0x30
    aa4c:      	sub	sp, sp, #0xf0
    aa50:      	stp	q6, q7, [sp, #0x60]
    aa54:      	mov	x19, x2
    aa58:      	stp	q4, q5, [sp, #0x40]
    aa5c:      	mov	x20, x1
    aa60:      	stp	q2, q3, [sp, #0x20]
    aa64:      	mov	x22, x0
    aa68:      	stp	q0, q1, [sp]
    aa6c:      	stp	x6, x7, [sp, #0xa0]
    aa70:      	stp	x4, x5, [sp, #0x90]
    aa74:      	str	x3, [sp, #0x88]
    aa78:      	bl	0xabd0 <.text+0x9bd0>
    aa7c:      	mov	w21, w0
    aa80:      	bl	0xab50 <.text+0x9b50>
    aa84:      	adrp	x23, 0x13000
    aa88:      	ldr	x9, [x23, #0x458]
    aa8c:      	cbnz	x9, 0xaa9c <.text+0x9a9c>
    aa90:      	bl	0xa9fc <.text+0x99fc>
    aa94:      	ldr	x10, [x23, #0x458]
    aa98:      	cbz	x10, 0xab24 <.text+0x9b24>
    aa9c:      	orr	w8, wzr, #0xffffff80
    aaa0:      	mov	w9, #-0x28              // =-40
    aaa4:      	mov	x11, sp
    aaa8:      	add	x12, sp, #0x88
    aaac:      	stp	w9, w8, [x29, #-0x38]
    aab0:      	add	x10, x29, #0x10
    aab4:      	add	x8, x11, #0x80
    aab8:      	ldr	x11, [x23, #0x458]
    aabc:      	add	x9, x12, #0x28
    aac0:      	stp	x10, x9, [x29, #-0x50]
    aac4:      	stur	x8, [x29, #-0x40]
    aac8:      	ldr	x8, [x11, #0x8]
    aacc:      	cbz	x8, 0xab08 <.text+0x9b08>
    aad0:      	ldp	x12, x11, [x29, #-0x40]
    aad4:      	sub	x3, x29, #0x70
    aad8:      	ldp	x14, x13, [x29, #-0x50]
    aadc:      	mov	x0, x22
    aae0:      	mov	x1, x20
    aae4:      	stp	x12, x11, [x29, #-0x60]
    aae8:      	mov	x2, x19
    aaec:      	stp	x14, x13, [x29, #-0x70]
    aaf0:      	blr	x8
    aaf4:      	mov	x19, x0
    aaf8:      	and	w8, w21, #0xff
    aafc:      	cbz	w8, 0xab28 <.text+0x9b28>
    ab00:      	bl	0xab44 <.text+0x9b44>
    ab04:      	b	0xab28 <.text+0x9b28>
    ab08:      	adrp	x0, 0x10000 <.text+0xf000>
    ab0c:      	adrp	x2, 0x10000 <.text+0xf000>
    ab10:      	add	x0, x0, #0xac0
    ab14:      	mov	w1, #0x50               // =80
    ab18:      	add	x2, x2, #0xacd
    ab1c:      	bl	0xb008 <.text+0xa008>
    ab20:      	b	0xab20 <.text+0x9b20>
    ab24:      	mov	x19, xzr
    ab28:      	mov	x0, x19
    ab2c:      	sub	sp, x29, #0x30
    ab30:      	ldp	x29, x30, [sp, #0x30]
    ab34:      	ldp	x20, x19, [sp, #0x20]
    ab38:      	ldp	x22, x21, [sp, #0x10]
    ab3c:      	ldp	x24, x23, [sp], #0x40
    ab40:      	ret
    ab44:      	msr	DAIFClr, #0x3
    ab48:      	isb
    ab4c:      	ret
    ab50:      	msr	DAIFSet, #0x3
    ab54:      	isb
    ab58:      	ret
    ab5c:      	dc	ivac, x0
    ab60:      	ret
    ab64:      	dc	cvac, x0
    ab68:      	ret
    ab6c:      	mrs	x1, CurrentEL
    ab70:      	cmp	x1, #0x8
    ab74:      	b.gt	0xab94 <.text+0x9b94>
    ab78:      	b.eq	0xab8c <.text+0x9b8c>
    ab7c:      	cbnz	x1, 0xab84 <.text+0x9b84>
    ab80:      	b	0xab80 <.text+0x9b80>
    ab84:      	mrs	x0, SCTLR_EL1
    ab88:      	b	0xab98 <.text+0x9b98>
    ab8c:      	mrs	x0, SCTLR_EL2
    ab90:      	b	0xab98 <.text+0x9b98>
    ab94:      	mrs	x0, SCTLR_EL3
    ab98:      	and	x0, x0, #0x1
    ab9c:      	ret
    aba0:      	dmb	sy
    aba4:      	ret
    aba8:      	dsb	sy
    abac:      	ret
    abb0:      	isb
    abb4:      	ret
    abb8:      	mov	x0, #0x1                // =1
    abbc:      	ret
    abc0:      	mrs	x0, CurrentEL
    abc4:      	ret
    abc8:      	mrs	x0, CTR_EL0
    abcc:      	ret
    abd0:      	mrs	x0, DAIF
    abd4:      	tst	w0, #0x80
    abd8:      	cset	w0, eq
    abdc:      	ret
    abe0:      	mrs	x1, CurrentEL
    abe4:      	cmp	x1, #0x8
    abe8:      	b.gt	0xabe8 <.text+0x9be8>
    abec:      	b.eq	0xac00 <.text+0x9c00>
    abf0:      	cbnz	x1, 0xabf8 <.text+0x9bf8>
    abf4:      	b	0xabf4 <.text+0x9bf4>
    abf8:      	mrs	x0, TTBR0_EL1
    abfc:      	b	0xac04 <.text+0x9c04>
    ac00:      	mrs	x0, TTBR0_EL2
    ac04:      	and	x0, x0, #0xffffffffffff
    ac08:      	isb
    ac0c:      	ret
    ac10:      	mrs	x1, CurrentEL
    ac14:      	cmp	x1, #0x8
    ac18:      	b.gt	0xac38 <.text+0x9c38>
    ac1c:      	b.eq	0xac30 <.text+0x9c30>
    ac20:      	cbnz	x1, 0xac28 <.text+0x9c28>
    ac24:      	b	0xac24 <.text+0x9c24>
    ac28:      	mrs	x0, TCR_EL1
    ac2c:      	b	0xac3c <.text+0x9c3c>
    ac30:      	mrs	x0, TCR_EL2
    ac34:      	b	0xac3c <.text+0x9c3c>
    ac38:      	mrs	x0, TCR_EL3
    ac3c:      	isb
    ac40:      	ret
    ac44:      	mrs	x0, CurrentEL
    ac48:      	cmp	x0, #0x8
    ac4c:      	b.gt	0xac6c <.text+0x9c6c>
    ac50:      	b.eq	0xac64 <.text+0x9c64>
    ac54:      	cbnz	x0, 0xac5c <.text+0x9c5c>
    ac58:      	b	0xac58 <.text+0x9c58>
    ac5c:      	tlbi	vmalle1
    ac60:      	b	0xac70 <.text+0x9c70>
    ac64:      	tlbi	alle2
    ac68:      	b	0xac70 <.text+0x9c70>
    ac6c:      	tlbi	alle3
    ac70:      	dsb	sy
    ac74:      	isb
    ac78:      	ret
    ac7c:      	stp	x28, x27, [sp, #-0x50]!
    ac80:      	stp	x24, x23, [sp, #0x10]
    ac84:      	stp	x22, x21, [sp, #0x20]
    ac88:      	stp	x20, x19, [sp, #0x30]
    ac8c:      	stp	x29, x30, [sp, #0x40]
    ac90:      	add	x29, sp, #0x40
    ac94:      	sub	sp, sp, #0x1a0
    ac98:      	mov	x21, x1
    ac9c:      	stp	q6, q7, [sp, #0x60]
    aca0:      	mov	x23, x0
    aca4:      	stp	q4, q5, [sp, #0x40]
    aca8:      	stp	q2, q3, [sp, #0x20]
    acac:      	stp	q0, q1, [sp]
    acb0:      	stp	x6, x7, [sp, #0xa0]
    acb4:      	stp	x4, x5, [sp, #0x90]
    acb8:      	stp	x2, x3, [sp, #0x80]
    acbc:      	cbz	x21, 0xaf7c <.text+0x9f7c>
    acc0:      	bl	0xc524 <.text+0xb524>
    acc4:      	mov	w10, w0
    acc8:      	and	x11, x10, x23
    accc:      	cbz	x11, 0xafd0 <.text+0x9fd0>
    acd0:      	mov	x0, x21
    acd4:      	bl	0xbc60 <.text+0xac60>
    acd8:      	add	x19, x0, #0x68
    acdc:      	cmp	x19, #0xd0
    ace0:      	b.hi	0xafd0 <.text+0x9fd0>
    ace4:      	add	x8, sp, #0xd0
    ace8:      	str	w23, [sp, #0xd4]
    acec:      	add	x22, x8, #0x68
    acf0:      	mov	w1, #0x68               // =104
    acf4:      	mov	x0, x22
    acf8:      	mov	x2, x21
    acfc:      	mov	x3, x1
    ad00:      	orr	x20, x8, #0x4
    ad04:      	add	x24, x8, #0x8
    ad08:      	bl	0xba2c <.text+0xaa2c>
    ad0c:      	mov	x10, sp
    ad10:      	add	x11, sp, #0x80
    ad14:      	orr	w8, wzr, #0xffffff80
    ad18:      	mov	w9, #-0x30              // =-48
    ad1c:      	add	x6, x10, #0x80
    ad20:      	add	x7, x11, #0x30
    ad24:      	add	x10, x29, #0x10
    ad28:      	stp	w9, w8, [sp, #0xc8]
    ad2c:      	orr	w8, wzr, #0x1
    ad30:      	stp	x7, x6, [sp, #0xb8]
    ad34:      	mov	x9, #0x680100000000     // =114353504256000
    ad38:      	str	x10, [sp, #0xb0]
    ad3c:      	adrp	x10, 0x10000 <.text+0xf000>
    ad40:      	add	x10, x10, #0xbc0
    ad44:      	b	0xad4c <.text+0x9d4c>
    ad48:      	add	x21, x21, #0x1
    ad4c:      	ldrb	w11, [x21]
    ad50:      	cmp	w11, #0x25
    ad54:      	b.eq	0xad60 <.text+0x9d60>
    ad58:      	cbnz	w11, 0xad48 <.text+0x9d48>
    ad5c:      	b	0xaf98 <.text+0x9f98>
    ad60:      	mov	w14, wzr
    ad64:      	b	0xad74 <.text+0x9d74>
    ad68:      	ldr	x16, [x17]
    ad6c:      	mov	w14, w11
    ad70:      	str	x16, [x24], #0x8
    ad74:      	mov	x12, x21
    ad78:      	ldrb	w13, [x21, #0x1]!
    ad7c:      	mov	w11, w14
    ad80:      	cmp	w13, #0x2e
    ad84:      	b.hi	0xad98 <.text+0x9d98>
    ad88:      	lsl	x14, x8, x13
    ad8c:      	and	x15, x14, x9
    ad90:      	mov	w14, w11
    ad94:      	cbnz	x15, 0xad74 <.text+0x9d74>
    ad98:      	sub	w14, w13, #0x30
    ad9c:      	cmp	w14, #0xa
    ada0:      	mov	w14, w11
    ada4:      	b.lo	0xad74 <.text+0x9d74>
    ada8:      	cmp	w13, #0x4b
    adac:      	b.gt	0xade0 <.text+0x9de0>
    adb0:      	cmp	w13, #0x2a
    adb4:      	b.ne	0xae04 <.text+0x9e04>
    adb8:      	ldrsw	x14, [sp, #0xc8]
    adbc:      	tbz	w14, #0x1f, 0xadd0 <.text+0x9dd0>
    adc0:      	add	w12, w14, #0x8
    adc4:      	cmp	w12, #0x0
    adc8:      	str	w12, [sp, #0xc8]
    adcc:      	b.le	0xadf8 <.text+0x9df8>
    add0:      	ldr	x17, [sp, #0xb0]
    add4:      	add	x13, x17, #0x8
    add8:      	str	x13, [sp, #0xb0]
    addc:      	b	0xad68 <.text+0x9d68>
    ade0:      	orr	w14, wzr, #0x1
    ade4:      	cmp	w13, #0x4c
    ade8:      	b.eq	0xad74 <.text+0x9d74>
    adec:      	cmp	w13, #0x6c
    adf0:      	b.eq	0xad74 <.text+0x9d74>
    adf4:      	b	0xae10 <.text+0x9e10>
    adf8:      	ldr	x13, [sp, #0xb8]
    adfc:      	add	x17, x13, x14
    ae00:      	b	0xad68 <.text+0x9d68>
    ae04:      	cbnz	w13, 0xae10 <.text+0x9e10>
    ae08:      	mov	x21, x12
    ae0c:      	b	0xae14 <.text+0x9e14>
    ae10:      	add	x21, x12, #0x1
    ae14:      	ldrb	w13, [x21]
    ae18:      	sub	w5, w13, #0x61
    ae1c:      	cmp	w5, #0x17
    ae20:      	b.hi	0xae5c <.text+0x9e5c>
    ae24:      	ldr	x17, [x10, x5, lsl #3]
    ae28:      	br	x17
    ae2c:      	ldrsw	x15, [sp, #0xc8]
    ae30:      	tbz	w15, #0x1f, 0xae44 <.text+0x9e44>
    ae34:      	add	w1, w15, #0x8
    ae38:      	cmp	w1, #0x0
    ae3c:      	str	w1, [sp, #0xc8]
    ae40:      	b.le	0xaf64 <.text+0x9f64>
    ae44:      	ldr	x3, [sp, #0xb0]
    ae48:      	add	x15, x3, #0x8
    ae4c:      	str	x15, [sp, #0xb0]
    ae50:      	ldr	x2, [x3]
    ae54:      	str	x2, [x24], #0x8
    ae58:      	b	0xaf34 <.text+0x9f34>
    ae5c:      	cmp	w13, #0x53
    ae60:      	b.eq	0xaeac <.text+0x9eac>
    ae64:      	cmp	w13, #0x58
    ae68:      	b.ne	0xaf34 <.text+0x9f34>
    ae6c:      	ldrsw	x12, [sp, #0xc8]
    ae70:      	and	w15, w11, #0xff
    ae74:      	cbnz	w15, 0xaedc <.text+0x9edc>
    ae78:      	cmp	w13, #0x70
    ae7c:      	b.eq	0xaedc <.text+0x9edc>
    ae80:      	tbz	w12, #0x1f, 0xae94 <.text+0x9e94>
    ae84:      	add	w17, w12, #0x8
    ae88:      	cmp	w17, #0x0
    ae8c:      	str	w17, [sp, #0xc8]
    ae90:      	b.le	0xaf4c <.text+0x9f4c>
    ae94:      	ldr	x1, [sp, #0xb0]
    ae98:      	add	x14, x1, #0x8
    ae9c:      	str	x14, [sp, #0xb0]
    aea0:      	ldr	x5, [x1]
    aea4:      	str	w5, [x24], #0x8
    aea8:      	b	0xaf34 <.text+0x9f34>
    aeac:      	ldrsw	x11, [sp, #0xc8]
    aeb0:      	tbz	w11, #0x1f, 0xaec4 <.text+0x9ec4>
    aeb4:      	add	w0, w11, #0x8
    aeb8:      	cmp	w0, #0x0
    aebc:      	str	w0, [sp, #0xc8]
    aec0:      	b.le	0xaf40 <.text+0x9f40>
    aec4:      	ldr	x2, [sp, #0xb0]
    aec8:      	add	x11, x2, #0x8
    aecc:      	str	x11, [sp, #0xb0]
    aed0:      	ldr	x0, [x2]
    aed4:      	str	x0, [x24], #0x8
    aed8:      	b	0xaf34 <.text+0x9f34>
    aedc:      	tbz	w12, #0x1f, 0xaef0 <.text+0x9ef0>
    aee0:      	add	w16, w12, #0x8
    aee4:      	cmp	w16, #0x0
    aee8:      	str	w16, [sp, #0xc8]
    aeec:      	b.le	0xaf58 <.text+0x9f58>
    aef0:      	ldr	x0, [sp, #0xb0]
    aef4:      	add	x12, x0, #0x8
    aef8:      	str	x12, [sp, #0xb0]
    aefc:      	ldr	x7, [x0]
    af00:      	str	x7, [x24], #0x8
    af04:      	b	0xaf34 <.text+0x9f34>
    af08:      	ldrsw	x16, [sp, #0xc8]
    af0c:      	tbz	w16, #0x1f, 0xaf20 <.text+0x9f20>
    af10:      	add	w2, w16, #0x8
    af14:      	cmp	w2, #0x0
    af18:      	str	w2, [sp, #0xc8]
    af1c:      	b.le	0xaf70 <.text+0x9f70>
    af20:      	ldr	x4, [sp, #0xb0]
    af24:      	add	x16, x4, #0x8
    af28:      	str	x16, [sp, #0xb0]
    af2c:      	ldr	x11, [x4]
    af30:      	str	x11, [x24], #0x8
    af34:      	cmp	x24, x22
    af38:      	b.ls	0xad48 <.text+0x9d48>
    af3c:      	b	0xafec <.text+0x9fec>
    af40:      	ldr	x3, [sp, #0xb8]
    af44:      	add	x2, x3, x11
    af48:      	b	0xaed0 <.text+0x9ed0>
    af4c:      	ldr	x6, [sp, #0xb8]
    af50:      	add	x1, x6, x12
    af54:      	b	0xaea0 <.text+0x9ea0>
    af58:      	ldr	x23, [sp, #0xb8]
    af5c:      	add	x0, x23, x12
    af60:      	b	0xaefc <.text+0x9efc>
    af64:      	ldr	x1, [sp, #0xb8]
    af68:      	add	x3, x1, x15
    af6c:      	b	0xae50 <.text+0x9e50>
    af70:      	ldr	x4, [sp, #0xb8]
    af74:      	add	x4, x4, x16
    af78:      	b	0xaf2c <.text+0x9f2c>
    af7c:      	adrp	x0, 0x10000 <.text+0xf000>
    af80:      	adrp	x2, 0x10000 <.text+0xf000>
    af84:      	add	x0, x0, #0xc80
    af88:      	mov	w1, #0x44               // =68
    af8c:      	add	x2, x2, #0xb49
    af90:      	bl	0xb008 <.text+0xa008>
    af94:      	b	0xaf94 <.text+0x9f94>
    af98:      	bl	0xd494 <.text+0xc494>
    af9c:      	bl	0xd4a4 <.text+0xc4a4>
    afa0:      	bl	0xd4b4 <.text+0xc4b4>
    afa4:      	and	w8, w0, #0xff
    afa8:      	cbz	w8, 0xafd0 <.text+0x9fd0>
    afac:      	adrp	x4, 0x13000
    afb0:      	mov	w2, wzr
    afb4:      	mov	x3, xzr
    afb8:      	mov	w1, #0x3050000          // =50659328
    afbc:      	add	x4, x4, #0x50
    afc0:      	orr	w0, wzr, #0x3
    afc4:      	mov	x5, x20
    afc8:      	mov	x6, x19
    afcc:      	bl	0xd4c4 <.text+0xc4c4>
    afd0:      	sub	sp, x29, #0x40
    afd4:      	ldp	x29, x30, [sp, #0x40]
    afd8:      	ldp	x20, x19, [sp, #0x30]
    afdc:      	ldp	x22, x21, [sp, #0x20]
    afe0:      	ldp	x24, x23, [sp, #0x10]
    afe4:      	ldp	x28, x27, [sp], #0x50
    afe8:      	ret
    afec:      	adrp	x0, 0x10000 <.text+0xf000>
    aff0:      	adrp	x2, 0x10000 <.text+0xf000>
    aff4:      	add	x0, x0, #0xc80
    aff8:      	mov	w1, #0xce               // =206
    affc:      	add	x2, x2, #0xc8b
    b000:      	bl	0xb008 <.text+0xa008>
    b004:      	b	0xb004 <.text+0xa004>
    b008:      	stp	x28, x27, [sp, #-0x60]!
    b00c:      	stp	x26, x25, [sp, #0x10]
    b010:      	stp	x24, x23, [sp, #0x20]
    b014:      	stp	x22, x21, [sp, #0x30]
    b018:      	stp	x20, x19, [sp, #0x40]
    b01c:      	stp	x29, x30, [sp, #0x50]
    b020:      	add	x29, sp, #0x50
    b024:      	sub	sp, sp, #0xd0
    b028:      	adrp	x28, 0x13000
    b02c:      	mov	x22, x0
    b030:      	mov	x20, x2
    b034:      	ldr	x8, [x28, #0x18]
    b038:      	mov	x24, x1
    b03c:      	mov	x0, x8
    b040:      	bl	0xbc60 <.text+0xac60>
    b044:      	mov	x26, x0
    b048:      	mov	x0, x22
    b04c:      	bl	0xbc60 <.text+0xac60>
    b050:      	mov	x19, x0
    b054:      	mov	x0, x20
    b058:      	bl	0xbc60 <.text+0xac60>
    b05c:      	mov	x21, x0
    b060:      	add	x9, x26, x19
    b064:      	add	x9, x9, x21
    b068:      	add	x8, x9, #0x2a
    b06c:      	cmp	x8, #0xc9
    b070:      	b.lo	0xb0b4 <.text+0xa0b4>
    b074:      	add	x8, x19, #0x28
    b078:      	add	x10, x8, x21
    b07c:      	cmp	x10, #0xc9
    b080:      	b.lo	0xb0a0 <.text+0xa0a0>
    b084:      	mov	w12, #0xa0              // =160
    b088:      	cmp	x8, #0xc8
    b08c:      	mov	w14, #0x9f              // =159
    b090:      	sub	x15, x12, x19
    b094:      	orr	w16, wzr, #0x1
    b098:      	csel	x19, x19, x14, lo
    b09c:      	csel	x21, x15, x16, lo
    b0a0:      	add	x23, sp, #0x8
    b0a4:      	str	w24, [sp, #0x1c]
    b0a8:      	mov	x27, xzr
    b0ac:      	add	x25, x23, #0x28
    b0b0:      	b	0xb10c <.text+0xa10c>
    b0b4:      	add	x23, sp, #0x8
    b0b8:      	str	w24, [sp, #0x1c]
    b0bc:      	add	x27, x26, #0x2
    b0c0:      	add	x25, x23, #0x28
    b0c4:      	cmn	x26, #0x2
    b0c8:      	b.eq	0xb10c <.text+0xa10c>
    b0cc:      	adrp	x1, 0x10000 <.text+0xf000>
    b0d0:      	add	x1, x1, #0xcb3
    b0d4:      	orr	w2, wzr, #0x1
    b0d8:      	mov	x0, x25
    b0dc:      	add	x23, sp, #0x8
    b0e0:      	bl	0xb25c <.text+0xa25c>
    b0e4:      	ldr	x1, [x28, #0x18]
    b0e8:      	add	x0, x25, #0x1
    b0ec:      	sub	x2, x26, #0x1
    b0f0:      	bl	0xb25c <.text+0xa25c>
    b0f4:      	add	x11, x25, x27
    b0f8:      	adrp	x1, 0x10000 <.text+0xf000>
    b0fc:      	sub	x0, x11, #0x2
    b100:      	add	x1, x1, #0xcb5
    b104:      	orr	w2, wzr, #0x2
    b108:      	bl	0xb25c <.text+0xa25c>
    b10c:      	add	x0, x25, x27
    b110:      	mov	x1, x22
    b114:      	mov	x2, x19
    b118:      	bl	0xb25c <.text+0xa25c>
    b11c:      	add	x0, x0, x19
    b120:      	mov	x1, x20
    b124:      	mov	x2, x21
    b128:      	sturb	wzr, [x0, #-0x1]
    b12c:      	bl	0xb25c <.text+0xa25c>
    b130:      	add	x12, x21, x0
    b134:      	sturb	wzr, [x12, #-0x1]
    b138:      	bl	0xd494 <.text+0xc494>
    b13c:      	bl	0xd4a4 <.text+0xc4a4>
    b140:      	and	w8, w0, #0xff
    b144:      	cbz	w8, 0xb17c <.text+0xa17c>
    b148:      	add	x2, x21, x19
    b14c:      	add	x13, x2, x27
    b150:      	mov	w0, #-0x70000000        // =-1879048192
    b154:      	mov	w1, #0x3050000          // =50659328
    b158:      	add	x6, x13, #0x28
    b15c:      	mov	w2, wzr
    b160:      	mov	x3, xzr
    b164:      	mov	x4, xzr
    b168:      	movk	w0, #0x2
    b16c:      	movk	w1, #0x7
    b170:      	mov	x5, x23
    b174:      	bl	0xd4c4 <.text+0xc4c4>
    b178:      	b	0xb180 <.text+0xa180>
    b17c:      	bl	0xd4b4 <.text+0xc4b4>
    b180:      	adrp	x14, 0xd000 <.text+0xc000>
    b184:      	ldrb	w8, [x14, #0xc59]
    b188:      	tbnz	w8, #0x4, 0xb198 <.text+0xa198>
    b18c:      	tbz	w8, #0x5, 0xb19c <.text+0xa19c>
    b190:      	bl	0xb6e8 <.text+0xa6e8>
    b194:      	b	0xb19c <.text+0xa19c>
    b198:      	bl	0xbcf4 <.text+0xacf4>
    b19c:      	sub	sp, x29, #0x50
    b1a0:      	ldp	x29, x30, [sp, #0x50]
    b1a4:      	ldp	x20, x19, [sp, #0x40]
    b1a8:      	ldp	x22, x21, [sp, #0x30]
    b1ac:      	ldp	x24, x23, [sp, #0x20]
    b1b0:      	ldp	x26, x25, [sp, #0x10]
    b1b4:      	ldp	x28, x27, [sp], #0x60
    b1b8:      	ret
    b1bc:      	stp	x29, x30, [sp, #-0x10]!
    b1c0:      	mov	x29, sp
    b1c4:      	cbnz	x0, 0xb1e8 <.text+0xa1e8>
    b1c8:      	cbz	x1, 0xb1e8 <.text+0xa1e8>
    b1cc:      	adrp	x0, 0x10000 <.text+0xf000>
    b1d0:      	adrp	x2, 0x10000 <.text+0xf000>
    b1d4:      	add	x0, x0, #0xccf
    b1d8:      	mov	w1, #0x31               // =49
    b1dc:      	add	x2, x2, #0xce0
    b1e0:      	bl	0xb008 <.text+0xa008>
    b1e4:      	b	0xb1e4 <.text+0xa1e4>
    b1e8:      	neg	x8, x0
    b1ec:      	cmp	x1, x8
    b1f0:      	b.ls	0xb210 <.text+0xa210>
    b1f4:      	adrp	x0, 0x10000 <.text+0xf000>
    b1f8:      	adrp	x2, 0x10000 <.text+0xf000>
    b1fc:      	add	x0, x0, #0xccf
    b200:      	mov	w1, #0x32               // =50
    b204:      	add	x2, x2, #0xd08
    b208:      	bl	0xb008 <.text+0xa008>
    b20c:      	b	0xb20c <.text+0xa20c>
    b210:      	ldp	x29, x30, [sp], #0x10
    b214:      	b	0xb2f4 <.text+0xa2f4>
    b218:      	cbz	x1, 0xb254 <.text+0xa254>
    b21c:      	sub	x8, x1, #0x1
    b220:      	mvn	x9, x0
    b224:      	cmp	x8, x9
    b228:      	b.ls	0xb258 <.text+0xa258>
    b22c:      	stp	x29, x30, [sp, #-0x10]!
    b230:      	mov	x29, sp
    b234:      	adrp	x0, 0x10000 <.text+0xf000>
    b238:      	adrp	x2, 0x10000 <.text+0xf000>
    b23c:      	add	x0, x0, #0xd3e
    b240:      	mov	w1, #0x36               // =54
    b244:      	add	x2, x2, #0xd4e
    b248:      	bl	0xb008 <.text+0xa008>
    b24c:      	ldp	x29, x30, [sp], #0x10
    b250:      	b	0xb250 <.text+0xa250>
    b254:      	ret
    b258:      	b	0xb2fc <.text+0xa2fc>
    b25c:      	cbz	x2, 0xb2cc <.text+0xa2cc>
    b260:      	stp	x29, x30, [sp, #-0x10]!
    b264:      	mov	x29, sp
    b268:      	sub	x8, x2, #0x1
    b26c:      	mvn	x9, x0
    b270:      	cmp	x8, x9
    b274:      	ldp	x29, x30, [sp], #0x10
    b278:      	b.ls	0xb298 <.text+0xa298>
    b27c:      	adrp	x0, 0x10000 <.text+0xf000>
    b280:      	adrp	x2, 0x10000 <.text+0xf000>
    b284:      	add	x0, x0, #0xd86
    b288:      	add	x2, x2, #0xd97
    b28c:      	orr	w1, wzr, #0x38
    b290:      	bl	0xb008 <.text+0xa008>
    b294:      	b	0xb294 <.text+0xa294>
    b298:      	mvn	x11, x1
    b29c:      	cmp	x8, x11
    b2a0:      	b.ls	0xb2c0 <.text+0xa2c0>
    b2a4:      	adrp	x0, 0x10000 <.text+0xf000>
    b2a8:      	adrp	x2, 0x10000 <.text+0xf000>
    b2ac:      	add	x0, x0, #0xd86
    b2b0:      	mov	w1, #0x39               // =57
    b2b4:      	add	x2, x2, #0xdda
    b2b8:      	bl	0xb008 <.text+0xa008>
    b2bc:      	b	0xb2bc <.text+0xa2bc>
    b2c0:      	cmp	x0, x1
    b2c4:      	b.eq	0xb2cc <.text+0xa2cc>
    b2c8:      	b	0xb63c <.text+0xa63c>
    b2cc:      	ret
    b2d0:      	dup	v0.8h, w2
    b2d4:      	lsl	x1, x1, #1
    b2d8:      	b	0xb300 <.text+0xa300>
    b2dc:      	dup	v0.4s, w2
    b2e0:      	lsl	x1, x1, #2
    b2e4:      	b	0xb300 <.text+0xa300>
    b2e8:      	dup	v0.2d, x2
    b2ec:      	lsl	x1, x1, #3
    b2f0:      	b	0xb300 <.text+0xa300>
    b2f4:      	movi	v0.16b, #0x0
    b2f8:      	b	0xb300 <.text+0xa300>
    b2fc:      	dup	v0.16b, w2
    b300:      	add	x4, x0, x1
    b304:      	mov	x2, v0.d[0]
    b308:      	cmp	x1, #0x60
    b30c:      	b.hi	0xb384 <.text+0xa384>
    b310:      	cmp	x1, #0x10
    b314:      	b.hs	0xb350 <.text+0xa350>
    b318:      	tbz	w1, #0x3, 0xb32c <.text+0xa32c>
    b31c:      	str	x2, [x0]
    b320:      	stur	x2, [x4, #-0x8]
    b324:      	ret
    b328:      	nop
    b32c:      	tbz	w1, #0x2, 0xb33c <.text+0xa33c>
    b330:      	str	w2, [x0]
    b334:      	stur	w2, [x4, #-0x4]
    b338:      	ret
    b33c:      	cbz	x1, 0xb34c <.text+0xa34c>
    b340:      	strb	w2, [x0]
    b344:      	tbz	w1, #0x1, 0xb34c <.text+0xa34c>
    b348:      	sturh	w2, [x4, #-0x2]
    b34c:      	ret
    b350:      	str	q0, [x0]
    b354:      	tbnz	w1, #0x6, 0xb370 <.text+0xa370>
    b358:      	stur	q0, [x4, #-0x10]
    b35c:      	tbz	w1, #0x5, 0xb368 <.text+0xa368>
    b360:      	str	q0, [x0, #0x10]
    b364:      	stur	q0, [x4, #-0x20]
    b368:      	ret
    b36c:      	nop
    b370:      	str	q0, [x0, #0x10]
    b374:      	stp	q0, q0, [x0, #0x20]
    b378:      	stp	q0, q0, [x4, #-0x20]
    b37c:      	ret
    b380:      	nop
    b384:      	and	x3, x0, #0xfffffffffffffff0
    b388:      	str	q0, [x0]
    b38c:      	cmp	x1, #0x100
    b390:      	ccmp	x2, #0x0, #0x0, hs
    b394:      	b.eq	0xb3c0 <.text+0xa3c0>
    b398:      	sub	x1, x4, x3
    b39c:      	add	x3, x3, #0x10
    b3a0:      	sub	x1, x1, #0x50
    b3a4:      	stp	q0, q0, [x3], #0x40
    b3a8:      	stp	q0, q0, [x3, #-0x20]
    b3ac:      	subs	x1, x1, #0x40
    b3b0:      	b.hi	0xb3a4 <.text+0xa3a4>
    b3b4:      	stp	q0, q0, [x4, #-0x40]
    b3b8:      	stp	q0, q0, [x4, #-0x20]
    b3bc:      	ret
    b3c0:      	mrs	x5, DCZID_EL0
    b3c4:      	tbnz	w5, #0x4, 0xb398 <.text+0xa398>
    b3c8:      	and	w5, w5, #0xf
    b3cc:      	cmp	w5, #0x4
    b3d0:      	b.ne	0xb420 <.text+0xa420>
    b3d4:      	str	q0, [x3, #0x10]
    b3d8:      	stp	q0, q0, [x3, #0x20]
    b3dc:      	and	x3, x3, #0xffffffffffffffc0
    b3e0:      	stp	q0, q0, [x3, #0x40]
    b3e4:      	stp	q0, q0, [x3, #0x60]
    b3e8:      	sub	x1, x4, x3
    b3ec:      	sub	x1, x1, #0x100
    b3f0:      	add	x3, x3, #0x80
    b3f4:      	nop
    b3f8:      	dc	zva, x3
    b3fc:      	add	x3, x3, #0x40
    b400:      	subs	x1, x1, #0x40
    b404:      	b.hi	0xb3f8 <.text+0xa3f8>
    b408:      	stp	q0, q0, [x3]
    b40c:      	stp	q0, q0, [x3, #0x20]
    b410:      	stp	q0, q0, [x4, #-0x40]
    b414:      	stp	q0, q0, [x4, #-0x20]
    b418:      	ret
    b41c:      	nop
    b420:      	cmp	w5, #0x5
    b424:      	b.ne	0xb46c <.text+0xa46c>
    b428:      	str	q0, [x3, #0x10]
    b42c:      	stp	q0, q0, [x3, #0x20]
    b430:      	stp	q0, q0, [x3, #0x40]
    b434:      	stp	q0, q0, [x3, #0x60]
    b438:      	and	x3, x3, #0xffffffffffffff80
    b43c:      	sub	x1, x4, x3
    b440:      	sub	x1, x1, #0x100
    b444:      	add	x3, x3, #0x80
    b448:      	dc	zva, x3
    b44c:      	add	x3, x3, #0x80
    b450:      	subs	x1, x1, #0x80
    b454:      	b.hi	0xb448 <.text+0xa448>
    b458:      	stp	q0, q0, [x4, #-0x80]
    b45c:      	stp	q0, q0, [x4, #-0x60]
    b460:      	stp	q0, q0, [x4, #-0x40]
    b464:      	stp	q0, q0, [x4, #-0x20]
    b468:      	ret
    b46c:      	mov	w6, #0x4                // =4
    b470:      	lsl	w7, w6, w5
    b474:      	add	x5, x7, #0x40
    b478:      	cmp	x1, x5
    b47c:      	b.lo	0xb398 <.text+0xa398>
    b480:      	sub	x6, x7, #0x1
    b484:      	add	x5, x3, x7
    b488:      	add	x3, x3, #0x10
    b48c:      	subs	x1, x5, x3
    b490:      	bic	x5, x5, x6
    b494:      	b.eq	0xb4a8 <.text+0xa4a8>
    b498:      	stp	q0, q0, [x3], #0x40
    b49c:      	stp	q0, q0, [x3, #-0x20]
    b4a0:      	subs	x1, x1, #0x40
    b4a4:      	b.hi	0xb498 <.text+0xa498>
    b4a8:      	mov	x3, x5
    b4ac:      	sub	x1, x4, x5
    b4b0:      	subs	x1, x1, x7
    b4b4:      	b.lo	0xb4c8 <.text+0xa4c8>
    b4b8:      	dc	zva, x3
    b4bc:      	add	x3, x3, x7
    b4c0:      	subs	x1, x1, x7
    b4c4:      	b.hs	0xb4b8 <.text+0xa4b8>
    b4c8:      	add	x1, x1, x7
    b4cc:      	b	0xb3ac <.text+0xa3ac>
    b4d0:      	prfm	pldl1keep, [x1]
    b4d4:      	add	x4, x1, x2
    b4d8:      	add	x5, x0, x2
    b4dc:      	cmp	x2, #0x10
    b4e0:      	b.ls	0xb520 <.text+0xa520>
    b4e4:      	cmp	x2, #0x60
    b4e8:      	b.hi	0xb5b0 <.text+0xa5b0>
    b4ec:      	sub	x9, x2, #0x1
    b4f0:      	ldp	x6, x7, [x1]
    b4f4:      	tbnz	w9, #0x6, 0xb580 <.text+0xa580>
    b4f8:      	ldp	x12, x13, [x4, #-0x10]
    b4fc:      	tbz	w9, #0x5, 0xb510 <.text+0xa510>
    b500:      	ldp	x8, x9, [x1, #0x10]
    b504:      	ldp	x10, x11, [x4, #-0x20]
    b508:      	stp	x8, x9, [x0, #0x10]
    b50c:      	stp	x10, x11, [x5, #-0x20]
    b510:      	stp	x6, x7, [x0]
    b514:      	stp	x12, x13, [x5, #-0x10]
    b518:      	ret
    b51c:      	nop
    b520:      	cmp	x2, #0x8
    b524:      	b.lo	0xb540 <.text+0xa540>
    b528:      	ldr	x6, [x1]
    b52c:      	ldur	x7, [x4, #-0x8]
    b530:      	str	x6, [x0]
    b534:      	stur	x7, [x5, #-0x8]
    b538:      	ret
    b53c:      	nop
    b540:      	tbz	w2, #0x2, 0xb558 <.text+0xa558>
    b544:      	ldr	w6, [x1]
    b548:      	ldur	w7, [x4, #-0x4]
    b54c:      	str	w6, [x0]
    b550:      	stur	w7, [x5, #-0x4]
    b554:      	ret
    b558:      	cbz	x2, 0xb578 <.text+0xa578>
    b55c:      	lsr	x9, x2, #1
    b560:      	ldrb	w6, [x1]
    b564:      	ldurb	w7, [x4, #-0x1]
    b568:      	ldrb	w8, [x1, x9]
    b56c:      	strb	w6, [x0]
    b570:      	strb	w8, [x0, x9]
    b574:      	sturb	w7, [x5, #-0x1]
    b578:      	ret
    b57c:      	nop
    b580:      	ldp	x8, x9, [x1, #0x10]
    b584:      	ldp	x10, x11, [x1, #0x20]
    b588:      	ldp	x12, x13, [x1, #0x30]
    b58c:      	ldp	x14, x15, [x4, #-0x20]
    b590:      	ldp	x4, x3, [x4, #-0x10]
    b594:      	stp	x6, x7, [x0]
    b598:      	stp	x8, x9, [x0, #0x10]
    b59c:      	stp	x10, x11, [x0, #0x20]
    b5a0:      	stp	x12, x13, [x0, #0x30]
    b5a4:      	stp	x14, x15, [x5, #-0x20]
    b5a8:      	stp	x4, x3, [x5, #-0x10]
    b5ac:      	ret
    b5b0:      	and	x9, x0, #0xf
    b5b4:      	and	x3, x0, #0xfffffffffffffff0
    b5b8:      	ldp	x12, x13, [x1]
    b5bc:      	sub	x1, x1, x9
    b5c0:      	add	x2, x2, x9
    b5c4:      	ldp	x6, x7, [x1, #0x10]
    b5c8:      	stp	x12, x13, [x0]
    b5cc:      	ldp	x8, x9, [x1, #0x20]
    b5d0:      	ldp	x10, x11, [x1, #0x30]
    b5d4:      	ldp	x12, x13, [x1, #0x40]!
    b5d8:      	subs	x2, x2, #0x90
    b5dc:      	b.ls	0xb608 <.text+0xa608>
    b5e0:      	stp	x6, x7, [x3, #0x10]
    b5e4:      	ldp	x6, x7, [x1, #0x10]
    b5e8:      	stp	x8, x9, [x3, #0x20]
    b5ec:      	ldp	x8, x9, [x1, #0x20]
    b5f0:      	stp	x10, x11, [x3, #0x30]
    b5f4:      	ldp	x10, x11, [x1, #0x30]
    b5f8:      	stp	x12, x13, [x3, #0x40]!
    b5fc:      	ldp	x12, x13, [x1, #0x40]!
    b600:      	subs	x2, x2, #0x40
    b604:      	b.hi	0xb5e0 <.text+0xa5e0>
    b608:      	ldp	x14, x15, [x4, #-0x40]
    b60c:      	stp	x6, x7, [x3, #0x10]
    b610:      	ldp	x6, x7, [x4, #-0x30]
    b614:      	stp	x8, x9, [x3, #0x20]
    b618:      	ldp	x8, x9, [x4, #-0x20]
    b61c:      	stp	x10, x11, [x3, #0x30]
    b620:      	ldp	x10, x11, [x4, #-0x10]
    b624:      	stp	x12, x13, [x3, #0x40]
    b628:      	stp	x14, x15, [x5, #-0x40]
    b62c:      	stp	x6, x7, [x5, #-0x30]
    b630:      	stp	x8, x9, [x5, #-0x20]
    b634:      	stp	x10, x11, [x5, #-0x10]
    b638:      	ret
    b63c:      	sub	x3, x0, x1
    b640:      	cmp	x2, #0x60
    b644:      	ccmp	x3, x2, #0x2, hi
    b648:      	b.hs	0xb4d0 <.text+0xa4d0>
    b64c:      	cbz	x3, 0xb6e4 <.text+0xa6e4>
    b650:      	add	x5, x0, x2
    b654:      	add	x4, x1, x2
    b658:      	and	x3, x5, #0xf
    b65c:      	ldp	x12, x13, [x4, #-0x10]
    b660:      	sub	x4, x4, x3
    b664:      	sub	x2, x2, x3
    b668:      	ldp	x6, x7, [x4, #-0x10]
    b66c:      	stp	x12, x13, [x5, #-0x10]
    b670:      	ldp	x8, x9, [x4, #-0x20]
    b674:      	ldp	x10, x11, [x4, #-0x30]
    b678:      	ldp	x12, x13, [x4, #-0x40]!
    b67c:      	sub	x5, x5, x3
    b680:      	subs	x2, x2, #0x80
    b684:      	b.ls	0xb6b4 <.text+0xa6b4>
    b688:      	nop
    b68c:      	stp	x6, x7, [x5, #-0x10]
    b690:      	ldp	x6, x7, [x4, #-0x10]
    b694:      	stp	x8, x9, [x5, #-0x20]
    b698:      	ldp	x8, x9, [x4, #-0x20]
    b69c:      	stp	x10, x11, [x5, #-0x30]
    b6a0:      	ldp	x10, x11, [x4, #-0x30]
    b6a4:      	stp	x12, x13, [x5, #-0x40]!
    b6a8:      	ldp	x12, x13, [x4, #-0x40]!
    b6ac:      	subs	x2, x2, #0x40
    b6b0:      	b.hi	0xb68c <.text+0xa68c>
    b6b4:      	ldp	x14, x15, [x1, #0x30]
    b6b8:      	stp	x6, x7, [x5, #-0x10]
    b6bc:      	ldp	x6, x7, [x1, #0x20]
    b6c0:      	stp	x8, x9, [x5, #-0x20]
    b6c4:      	ldp	x8, x9, [x1, #0x10]
    b6c8:      	stp	x10, x11, [x5, #-0x30]
    b6cc:      	ldp	x10, x11, [x1]
    b6d0:      	stp	x12, x13, [x5, #-0x40]
    b6d4:      	stp	x14, x15, [x0, #0x30]
    b6d8:      	stp	x6, x7, [x0, #0x20]
    b6dc:      	stp	x8, x9, [x0, #0x10]
    b6e0:      	stp	x10, x11, [x0]
    b6e4:      	ret
    b6e8:      	sub	sp, sp, #0x10
    b6ec:      	str	xzr, [sp, #0x8]
    b6f0:      	ldr	x8, [sp, #0x8]
    b6f4:      	cbz	x8, 0xb6f0 <.text+0xa6f0>
    b6f8:      	add	sp, sp, #0x10
    b6fc:      	ret
    b700:      	stp	x29, x30, [sp, #-0x10]!
    b704:      	mov	x29, sp
    b708:      	cbz	x0, 0xb74c <.text+0xa74c>
    b70c:      	ldr	x9, [x0]
    b710:      	cbz	x9, 0xb768 <.text+0xa768>
    b714:      	ldr	x10, [x0, #0x8]
    b718:      	cbz	x10, 0xb784 <.text+0xa784>
    b71c:      	cbz	x1, 0xb7a0 <.text+0xa7a0>
    b720:      	adrp	x8, 0xd000 <.text+0xc000>
    b724:      	mov	x10, xzr
    b728:      	and	w11, w2, #0xff
    b72c:      	ldr	w8, [x8, #0xc5c]
    b730:      	cbz	w11, 0xb7f4 <.text+0xa7f4>
    b734:      	adrp	x14, 0xd000 <.text+0xc000>
    b738:      	mov	x11, x0
    b73c:      	ldrb	w12, [x14, #0xc5a]
    b740:      	cbz	w12, 0xb7f8 <.text+0xa7f8>
    b744:      	mov	x10, xzr
    b748:      	b	0xb7c0 <.text+0xa7c0>
    b74c:      	adrp	x0, 0x10000 <.text+0xf000>
    b750:      	adrp	x2, 0x11000 <.text+0x10000>
    b754:      	add	x0, x0, #0xe18
    b758:      	add	x2, x2, #0xbad
    b75c:      	orr	w1, wzr, #0x3c
    b760:      	bl	0xb008 <.text+0xa008>
    b764:      	b	0xb764 <.text+0xa764>
    b768:      	adrp	x0, 0x10000 <.text+0xf000>
    b76c:      	adrp	x2, 0x10000 <.text+0xf000>
    b770:      	add	x0, x0, #0xe18
    b774:      	mov	w1, #0x3d               // =61
    b778:      	add	x2, x2, #0xe25
    b77c:      	bl	0xb008 <.text+0xa008>
    b780:      	b	0xb780 <.text+0xa780>
    b784:      	adrp	x0, 0x10000 <.text+0xf000>
    b788:      	adrp	x2, 0x10000 <.text+0xf000>
    b78c:      	add	x0, x0, #0xe18
    b790:      	add	x2, x2, #0xe47
    b794:      	orr	w1, wzr, #0x3e
    b798:      	bl	0xb008 <.text+0xa008>
    b79c:      	b	0xb79c <.text+0xa79c>
    b7a0:      	adrp	x0, 0x10000 <.text+0xf000>
    b7a4:      	adrp	x2, 0x10000 <.text+0xf000>
    b7a8:      	add	x0, x0, #0xe18
    b7ac:      	add	x2, x2, #0xe66
    b7b0:      	orr	w1, wzr, #0x3f
    b7b4:      	bl	0xb008 <.text+0xa008>
    b7b8:      	b	0xb7b8 <.text+0xa7b8>
    b7bc:      	ldr	x9, [x9]
    b7c0:      	mov	w11, w8
    b7c4:      	cbz	w11, 0xb7d4 <.text+0xa7d4>
    b7c8:      	add	x10, x10, #0x1
    b7cc:      	cmp	x10, x8
    b7d0:      	b.hs	0xb848 <.text+0xa848>
    b7d4:      	cmp	x9, x0
    b7d8:      	ccmp	x9, x1, #0x4, ne
    b7dc:      	b.ne	0xb7bc <.text+0xa7bc>
    b7e0:      	cmp	x9, x1
    b7e4:      	mov	x11, x1
    b7e8:      	b.eq	0xb7f8 <.text+0xa7f8>
    b7ec:      	mov	w0, wzr
    b7f0:      	b	0xb824 <.text+0xa824>
    b7f4:      	mov	x11, x0
    b7f8:      	cbz	w8, 0xb820 <.text+0xa820>
    b7fc:      	add	x12, x10, #0x1
    b800:      	ldr	x11, [x11]
    b804:      	mov	x13, x12
    b808:      	add	x12, x13, #0x1
    b80c:      	cmp	x11, x0
    b810:      	ccmp	x13, x8, #0x2, ne
    b814:      	b.lo	0xb800 <.text+0xa800>
    b818:      	cmp	x13, x8
    b81c:      	b.hs	0xb82c <.text+0xa82c>
    b820:      	orr	w0, wzr, #0x1
    b824:      	ldp	x29, x30, [sp], #0x10
    b828:      	ret
    b82c:      	adrp	x0, 0x10000 <.text+0xf000>
    b830:      	adrp	x2, 0x10000 <.text+0xf000>
    b834:      	add	x0, x0, #0xe18
    b838:      	mov	w1, #0x6d               // =109
    b83c:      	add	x2, x2, #0xe7b
    b840:      	bl	0xb008 <.text+0xa008>
    b844:      	b	0xb844 <.text+0xa844>
    b848:      	adrp	x0, 0x10000 <.text+0xf000>
    b84c:      	adrp	x2, 0x10000 <.text+0xf000>
    b850:      	add	x0, x0, #0xe18
    b854:      	mov	w1, #0x50               // =80
    b858:      	add	x2, x2, #0xe7b
    b85c:      	bl	0xb008 <.text+0xa008>
    b860:      	b	0xb860 <.text+0xa860>
    b864:      	cbz	x0, 0xb870 <.text+0xa870>
    b868:      	stp	x0, x0, [x0]
    b86c:      	ret
    b870:      	stp	x29, x30, [sp, #-0x10]!
    b874:      	mov	x29, sp
    b878:      	adrp	x0, 0x10000 <.text+0xf000>
    b87c:      	adrp	x2, 0x10000 <.text+0xf000>
    b880:      	add	x0, x0, #0xe18
    b884:      	mov	w1, #0x8a               // =138
    b888:      	add	x2, x2, #0xeb1
    b88c:      	bl	0xb008 <.text+0xa008>
    b890:      	ldp	x29, x30, [sp], #0x10
    b894:      	b	0xb894 <.text+0xa894>
    b898:      	stp	x20, x19, [sp, #-0x20]!
    b89c:      	stp	x29, x30, [sp, #0x10]
    b8a0:      	add	x29, sp, #0x10
    b8a4:      	mov	w2, wzr
    b8a8:      	mov	x19, x1
    b8ac:      	mov	x20, x0
    b8b0:      	bl	0xb700 <.text+0xa700>
    b8b4:      	and	w8, w0, #0xff
    b8b8:      	cbz	w8, 0xb8e0 <.text+0xa8e0>
    b8bc:      	str	x20, [x19]
    b8c0:      	mov	x0, x20
    b8c4:      	ldr	x8, [x20, #0x8]
    b8c8:      	str	x8, [x19, #0x8]
    b8cc:      	str	x19, [x8]
    b8d0:      	str	x19, [x20, #0x8]
    b8d4:      	ldp	x29, x30, [sp, #0x10]
    b8d8:      	ldp	x20, x19, [sp], #0x20
    b8dc:      	ret
    b8e0:      	adrp	x0, 0x10000 <.text+0xf000>
    b8e4:      	adrp	x2, 0x10000 <.text+0xf000>
    b8e8:      	add	x0, x0, #0xe18
    b8ec:      	mov	w1, #0xda               // =218
    b8f0:      	add	x2, x2, #0xeca
    b8f4:      	bl	0xb008 <.text+0xa008>
    b8f8:      	b	0xb8f8 <.text+0xa8f8>
    b8fc:      	stp	x20, x19, [sp, #-0x20]!
    b900:      	stp	x29, x30, [sp, #0x10]
    b904:      	add	x29, sp, #0x10
    b908:      	mov	x19, x0
    b90c:      	mov	w2, wzr
    b910:      	mov	x1, x19
    b914:      	bl	0xb700 <.text+0xa700>
    b918:      	and	w8, w0, #0xff
    b91c:      	cbz	w8, 0xb930 <.text+0xa930>
    b920:      	ldr	x0, [x19]
    b924:      	ldp	x29, x30, [sp, #0x10]
    b928:      	ldp	x20, x19, [sp], #0x20
    b92c:      	ret
    b930:      	adrp	x0, 0x10000 <.text+0xf000>
    b934:      	adrp	x2, 0x10000 <.text+0xf000>
    b938:      	add	x0, x0, #0xe18
    b93c:      	add	x2, x2, #0xf0b
    b940:      	orr	w1, wzr, #0x100
    b944:      	bl	0xb008 <.text+0xa008>
    b948:      	b	0xb948 <.text+0xa948>
    b94c:      	stp	x20, x19, [sp, #-0x20]!
    b950:      	stp	x29, x30, [sp, #0x10]
    b954:      	add	x29, sp, #0x10
    b958:      	mov	x19, x0
    b95c:      	mov	w2, wzr
    b960:      	mov	x1, x19
    b964:      	bl	0xb700 <.text+0xa700>
    b968:      	and	w8, w0, #0xff
    b96c:      	cbz	w8, 0xb988 <.text+0xa988>
    b970:      	ldr	x8, [x19]
    b974:      	ldp	x29, x30, [sp, #0x10]
    b978:      	cmp	x8, x19
    b97c:      	cset	w0, eq
    b980:      	ldp	x20, x19, [sp], #0x20
    b984:      	ret
    b988:      	adrp	x0, 0x10000 <.text+0xf000>
    b98c:      	adrp	x2, 0x10000 <.text+0xf000>
    b990:      	add	x0, x0, #0xe18
    b994:      	mov	w1, #0x169              // =361
    b998:      	add	x2, x2, #0xf83
    b99c:      	bl	0xb008 <.text+0xa008>
    b9a0:      	b	0xb9a0 <.text+0xa9a0>
    b9a4:      	stp	x20, x19, [sp, #-0x20]!
    b9a8:      	stp	x29, x30, [sp, #0x10]
    b9ac:      	add	x29, sp, #0x10
    b9b0:      	mov	x19, x0
    b9b4:      	bl	0xb94c <.text+0xa94c>
    b9b8:      	and	w8, w0, #0xff
    b9bc:      	cbz	w8, 0xb9dc <.text+0xa9dc>
    b9c0:      	adrp	x0, 0x10000 <.text+0xf000>
    b9c4:      	adrp	x2, 0x11000 <.text+0x10000>
    b9c8:      	add	x0, x0, #0xe18
    b9cc:      	mov	w1, #0x221              // =545
    b9d0:      	add	x2, x2, #0x10
    b9d4:      	bl	0xb008 <.text+0xa008>
    b9d8:      	b	0xb9d8 <.text+0xa9d8>
    b9dc:      	ldp	x8, x9, [x19]
    b9e0:      	str	x9, [x8, #0x8]
    b9e4:      	ldp	x8, x9, [x19]
    b9e8:      	str	x8, [x9]
    b9ec:      	ldr	x0, [x19]
    b9f0:      	ldp	x29, x30, [sp, #0x10]
    b9f4:      	ldp	x20, x19, [sp], #0x20
    b9f8:      	ret
    b9fc:      	add	x8, x2, x3
    ba00:      	cmp	x0, x2
    ba04:      	ccmp	x0, x8, #0x2, hs
    ba08:      	b.lo	0xba24 <.text+0xaa24>
    ba0c:      	add	x10, x0, x1
    ba10:      	cmp	x2, x0
    ba14:      	ccmp	x2, x10, #0x2, hs
    ba18:      	b.lo	0xba24 <.text+0xaa24>
    ba1c:      	mov	w0, wzr
    ba20:      	ret
    ba24:      	orr	w0, wzr, #0x1
    ba28:      	ret
    ba2c:      	stp	x22, x21, [sp, #-0x30]!
    ba30:      	stp	x20, x19, [sp, #0x10]
    ba34:      	stp	x29, x30, [sp, #0x20]
    ba38:      	add	x29, sp, #0x20
    ba3c:      	mov	x20, x2
    ba40:      	mov	x19, x0
    ba44:      	cbz	x19, 0xba7c <.text+0xaa7c>
    ba48:      	cbz	x20, 0xba98 <.text+0xaa98>
    ba4c:      	adrp	x9, 0xd000 <.text+0xc000>
    ba50:      	ldr	w8, [x9, #0xc60]
    ba54:      	cbz	w8, 0xbad8 <.text+0xaad8>
    ba58:      	cmp	x8, x1
    ba5c:      	b.hs	0xbab4 <.text+0xaab4>
    ba60:      	adrp	x0, 0x11000 <.text+0x10000>
    ba64:      	adrp	x2, 0x11000 <.text+0x10000>
    ba68:      	add	x0, x0, #0x25
    ba6c:      	mov	w1, #0x2a5              // =677
    ba70:      	add	x2, x2, #0x1f7
    ba74:      	bl	0xb008 <.text+0xa008>
    ba78:      	b	0xba78 <.text+0xaa78>
    ba7c:      	adrp	x0, 0x11000 <.text+0x10000>
    ba80:      	adrp	x2, 0x11000 <.text+0x10000>
    ba84:      	add	x0, x0, #0x25
    ba88:      	mov	w1, #0x29e              // =670
    ba8c:      	add	x2, x2, #0xa0
    ba90:      	bl	0xb008 <.text+0xa008>
    ba94:      	b	0xba94 <.text+0xaa94>
    ba98:      	adrp	x0, 0x11000 <.text+0x10000>
    ba9c:      	adrp	x2, 0x11000 <.text+0x10000>
    baa0:      	add	x0, x0, #0x25
    baa4:      	mov	w1, #0x29f              // =671
    baa8:      	add	x2, x2, #0xbe
    baac:      	bl	0xb008 <.text+0xa008>
    bab0:      	b	0xbab0 <.text+0xaab0>
    bab4:      	cmp	x8, x3
    bab8:      	b.hs	0xbad8 <.text+0xaad8>
    babc:      	adrp	x0, 0x11000 <.text+0x10000>
    bac0:      	adrp	x2, 0x11000 <.text+0x10000>
    bac4:      	add	x0, x0, #0x25
    bac8:      	mov	w1, #0x2a6              // =678
    bacc:      	add	x2, x2, #0x290
    bad0:      	bl	0xb008 <.text+0xa008>
    bad4:      	b	0xbad4 <.text+0xaad4>
    bad8:      	cbz	x1, 0xbafc <.text+0xaafc>
    badc:      	mov	x8, xzr
    bae0:      	b	0xbae8 <.text+0xaae8>
    bae4:      	add	x8, x8, #0x1
    bae8:      	cmp	x8, x1
    baec:      	b.hs	0xbb18 <.text+0xab18>
    baf0:      	ldrb	w9, [x20, x8]
    baf4:      	cbnz	w9, 0xbae4 <.text+0xaae4>
    baf8:      	b	0xbb20 <.text+0xab20>
    bafc:      	adrp	x0, 0x11000 <.text+0x10000>
    bb00:      	adrp	x2, 0x11000 <.text+0x10000>
    bb04:      	add	x0, x0, #0x25
    bb08:      	mov	w1, #0x2ac              // =684
    bb0c:      	add	x2, x2, #0x117
    bb10:      	bl	0xb008 <.text+0xa008>
    bb14:      	b	0xbb14 <.text+0xab14>
    bb18:      	cmp	x3, x1
    bb1c:      	b.hs	0xbb8c <.text+0xab8c>
    bb20:      	cmp	x8, x3
    bb24:      	csel	x21, x3, x8, hi
    bb28:      	add	x3, x21, #0x1
    bb2c:      	mov	x0, x19
    bb30:      	mov	x2, x20
    bb34:      	bl	0xb9fc <.text+0xa9fc>
    bb38:      	and	w8, w0, #0xff
    bb3c:      	cbz	w8, 0xbb68 <.text+0xab68>
    bb40:      	adrp	x0, 0x11000 <.text+0x10000>
    bb44:      	adrp	x2, 0x11000 <.text+0x10000>
    bb48:      	add	x0, x0, #0x25
    bb4c:      	mov	w1, #0x2bc              // =700
    bb50:      	add	x2, x2, #0x235
    bb54:      	bl	0xb008 <.text+0xa008>
    bb58:      	b	0xbb58 <.text+0xab58>
    bb5c:      	add	x20, x20, #0x1
    bb60:      	strb	w8, [x19], #0x1
    bb64:      	sub	x21, x21, #0x1
    bb68:      	cbz	x21, 0xbb74 <.text+0xab74>
    bb6c:      	ldrb	w8, [x20]
    bb70:      	cbnz	w8, 0xbb5c <.text+0xab5c>
    bb74:      	strb	wzr, [x19]
    bb78:      	mov	x0, xzr
    bb7c:      	ldp	x29, x30, [sp, #0x20]
    bb80:      	ldp	x20, x19, [sp, #0x10]
    bb84:      	ldp	x22, x21, [sp], #0x30
    bb88:      	ret
    bb8c:      	adrp	x0, 0x11000 <.text+0x10000>
    bb90:      	adrp	x2, 0x11000 <.text+0x10000>
    bb94:      	add	x0, x0, #0x25
    bb98:      	mov	w1, #0x2b3              // =691
    bb9c:      	add	x2, x2, #0x126
    bba0:      	bl	0xb008 <.text+0xa008>
    bba4:      	b	0xbba4 <.text+0xaba4>
    bba8:      	stp	x29, x30, [sp, #-0x10]!
    bbac:      	mov	x29, sp
    bbb0:      	cbz	x0, 0xbc00 <.text+0xac00>
    bbb4:      	tbnz	w0, #0x0, 0xbc1c <.text+0xac1c>
    bbb8:      	adrp	x9, 0xd000 <.text+0xc000>
    bbbc:      	mov	x8, xzr
    bbc0:      	ldr	w9, [x9, #0xc64]
    bbc4:      	b	0xbbd0 <.text+0xabd0>
    bbc8:      	add	x0, x0, #0x2
    bbcc:      	add	x8, x8, #0x1
    bbd0:      	ldrh	w10, [x0]
    bbd4:      	cbz	w10, 0xbc38 <.text+0xac38>
    bbd8:      	cbz	w9, 0xbbc8 <.text+0xabc8>
    bbdc:      	cmp	x8, x9
    bbe0:      	b.lo	0xbbc8 <.text+0xabc8>
    bbe4:      	adrp	x0, 0x11000 <.text+0x10000>
    bbe8:      	adrp	x2, 0x11000 <.text+0x10000>
    bbec:      	add	x0, x0, #0x29
    bbf0:      	mov	w1, #0xcf               // =207
    bbf4:      	add	x2, x2, #0x3f9
    bbf8:      	bl	0xb008 <.text+0xa008>
    bbfc:      	b	0xbbfc <.text+0xabfc>
    bc00:      	adrp	x0, 0x11000 <.text+0x10000>
    bc04:      	adrp	x2, 0x10000 <.text+0xf000>
    bc08:      	add	x0, x0, #0x29
    bc0c:      	mov	w1, #0xc6               // =198
    bc10:      	add	x2, x2, #0xb7d
    bc14:      	bl	0xb008 <.text+0xa008>
    bc18:      	b	0xbc18 <.text+0xac18>
    bc1c:      	adrp	x0, 0x11000 <.text+0x10000>
    bc20:      	adrp	x2, 0x11000 <.text+0x10000>
    bc24:      	add	x0, x0, #0x29
    bc28:      	mov	w1, #0xc7               // =199
    bc2c:      	add	x2, x2, #0x32
    bc30:      	bl	0xb008 <.text+0xa008>
    bc34:      	b	0xbc34 <.text+0xac34>
    bc38:      	mov	x0, x8
    bc3c:      	ldp	x29, x30, [sp], #0x10
    bc40:      	ret
    bc44:      	stp	x29, x30, [sp, #-0x10]!
    bc48:      	mov	x29, sp
    bc4c:      	bl	0xbba8 <.text+0xaba8>
    bc50:      	lsl	x8, x0, #1
    bc54:      	add	x0, x8, #0x2
    bc58:      	ldp	x29, x30, [sp], #0x10
    bc5c:      	ret
    bc60:      	stp	x29, x30, [sp, #-0x10]!
    bc64:      	mov	x29, sp
    bc68:      	bl	0xbc78 <.text+0xac78>
    bc6c:      	add	x0, x0, #0x1
    bc70:      	ldp	x29, x30, [sp], #0x10
    bc74:      	ret
    bc78:      	stp	x29, x30, [sp, #-0x10]!
    bc7c:      	mov	x29, sp
    bc80:      	cbz	x0, 0xbccc <.text+0xaccc>
    bc84:      	adrp	x9, 0xd000 <.text+0xc000>
    bc88:      	mov	x8, xzr
    bc8c:      	ldr	w9, [x9, #0xc60]
    bc90:      	b	0xbc9c <.text+0xac9c>
    bc94:      	add	x0, x0, #0x1
    bc98:      	add	x8, x8, #0x1
    bc9c:      	ldrb	w10, [x0]
    bca0:      	cbz	w10, 0xbce8 <.text+0xace8>
    bca4:      	cbz	w9, 0xbc94 <.text+0xac94>
    bca8:      	cmp	x8, x9
    bcac:      	b.lo	0xbc94 <.text+0xac94>
    bcb0:      	adrp	x0, 0x11000 <.text+0x10000>
    bcb4:      	adrp	x2, 0x11000 <.text+0x10000>
    bcb8:      	add	x0, x0, #0x29
    bcbc:      	mov	w1, #0x516              // =1302
    bcc0:      	add	x2, x2, #0x6e5
    bcc4:      	bl	0xb008 <.text+0xa008>
    bcc8:      	b	0xbcc8 <.text+0xacc8>
    bccc:      	adrp	x0, 0x11000 <.text+0x10000>
    bcd0:      	adrp	x2, 0x10000 <.text+0xf000>
    bcd4:      	add	x0, x0, #0x29
    bcd8:      	mov	w1, #0x50e              // =1294
    bcdc:      	add	x2, x2, #0xb7d
    bce0:      	bl	0xb008 <.text+0xa008>
    bce4:      	b	0xbce4 <.text+0xace4>
    bce8:      	mov	x0, x8
    bcec:      	ldp	x29, x30, [sp], #0x10
    bcf0:      	ret
    bcf4:      	svc	#0xdbdb
    bcf8:      	ret
    bcfc:      	cmp	x1, #0x40
    bd00:      	b.hs	0xbd08 <.text+0xad08>
    bd04:      	b	0xbd30 <.text+0xad30>
    bd08:      	stp	x29, x30, [sp, #-0x10]!
    bd0c:      	mov	x29, sp
    bd10:      	adrp	x0, 0x11000 <.text+0x10000>
    bd14:      	adrp	x2, 0x11000 <.text+0x10000>
    bd18:      	add	x0, x0, #0x8a3
    bd1c:      	mov	w1, #0x27               // =39
    bd20:      	add	x2, x2, #0x8af
    bd24:      	bl	0xb008 <.text+0xa008>
    bd28:      	ldp	x29, x30, [sp], #0x10
    bd2c:      	b	0xbd2c <.text+0xad2c>
    bd30:      	lsr	x0, x0, x1
    bd34:      	ret
    bd38:      	stp	x24, x23, [sp, #-0x40]!
    bd3c:      	stp	x22, x21, [sp, #0x10]
    bd40:      	stp	x20, x19, [sp, #0x20]
    bd44:      	stp	x29, x30, [sp, #0x30]
    bd48:      	add	x29, sp, #0x30
    bd4c:      	sub	sp, sp, #0x10
    bd50:      	mov	x19, x2
    bd54:      	mov	x20, x1
    bd58:      	mov	w8, w0
    bd5c:      	sub	x21, x19, #0x1
    bd60:      	and	x10, x21, x19
    bd64:      	cbz	x10, 0xbd84 <.text+0xad84>
    bd68:      	adrp	x0, 0x11000 <.text+0x10000>
    bd6c:      	adrp	x2, 0x11000 <.text+0x10000>
    bd70:      	add	x0, x0, #0xed3
    bd74:      	mov	w1, #0xbe               // =190
    bd78:      	add	x2, x2, #0x8c5
    bd7c:      	bl	0xb008 <.text+0xa008>
    bd80:      	b	0xbd80 <.text+0xad80>
    bd84:      	cbz	x20, 0xbeb0 <.text+0xaeb0>
    bd88:      	cmp	x19, #0x1, lsl #12      // =0x1000
    bd8c:      	b.ls	0xbe84 <.text+0xae84>
    bd90:      	tst	x19, #0xfff
    bd94:      	lsr	x12, x19, #12
    bd98:      	cinc	x22, x12, ne
    bd9c:      	add	x2, x22, x20
    bda0:      	cmp	x2, x20
    bda4:      	b.ls	0xbed0 <.text+0xaed0>
    bda8:      	adrp	x23, 0x13000
    bdac:      	mov	w0, wzr
    bdb0:      	add	x3, sp, #0x8
    bdb4:      	ldr	x9, [x23, #0x478]
    bdb8:      	mov	w1, w8
    bdbc:      	ldr	x15, [x9, #0x28]
    bdc0:      	blr	x15
    bdc4:      	tbnz	x0, #0x3f, 0xbeb0 <.text+0xaeb0>
    bdc8:      	ldr	x0, [sp, #0x8]
    bdcc:      	neg	x16, x19
    bdd0:      	add	x17, x0, x21
    bdd4:      	and	x19, x17, x16
    bdd8:      	sub	x3, x19, x0
    bddc:      	tst	x3, #0xfff
    bde0:      	lsr	x4, x3, #12
    bde4:      	cinc	x21, x4, ne
    bde8:      	cbz	x21, 0xbe30 <.text+0xae30>
    bdec:      	ldr	x8, [x23, #0x478]
    bdf0:      	mov	x1, x21
    bdf4:      	ldr	x6, [x8, #0x30]
    bdf8:      	blr	x6
    bdfc:      	mov	x8, x0
    be00:      	tbz	x8, #0x3f, 0xbe30 <.text+0xae30>
    be04:      	adrp	x1, 0xd000 <.text+0xc000>
    be08:      	add	x1, x1, #0xb94
    be0c:      	orr	w0, wzr, #0x80000000
    be10:      	mov	x2, x8
    be14:      	bl	0xac7c <.text+0x9c7c>
    be18:      	adrp	x0, 0x11000 <.text+0x10000>
    be1c:      	adrp	x2, 0xd000 <.text+0xc000>
    be20:      	add	x0, x0, #0xed3
    be24:      	mov	w1, #0xd9               // =217
    be28:      	add	x2, x2, #0xbc8
    be2c:      	bl	0xb008 <.text+0xa008>
    be30:      	add	x0, x19, x20, lsl #12
    be34:      	subs	x1, x22, x21
    be38:      	str	x0, [sp, #0x8]
    be3c:      	b.eq	0xbeb4 <.text+0xaeb4>
    be40:      	ldr	x10, [x23, #0x478]
    be44:      	ldr	x7, [x10, #0x30]
    be48:      	blr	x7
    be4c:      	mov	x9, x0
    be50:      	tbz	x9, #0x3f, 0xbeb4 <.text+0xaeb4>
    be54:      	adrp	x1, 0xd000 <.text+0xc000>
    be58:      	add	x1, x1, #0xb94
    be5c:      	orr	w0, wzr, #0x80000000
    be60:      	mov	x2, x9
    be64:      	bl	0xac7c <.text+0x9c7c>
    be68:      	adrp	x0, 0x11000 <.text+0x10000>
    be6c:      	adrp	x2, 0xd000 <.text+0xc000>
    be70:      	add	x0, x0, #0xed3
    be74:      	mov	w1, #0xe2               // =226
    be78:      	add	x2, x2, #0xbc8
    be7c:      	bl	0xb008 <.text+0xa008>
    be80:      	b	0xbeb4 <.text+0xaeb4>
    be84:      	adrp	x11, 0x13000
    be88:      	mov	w0, wzr
    be8c:      	add	x3, sp, #0x8
    be90:      	ldr	x12, [x11, #0x478]
    be94:      	mov	w1, w8
    be98:      	mov	x2, x20
    be9c:      	ldr	x19, [x12, #0x28]
    bea0:      	blr	x19
    bea4:      	tbnz	x0, #0x3f, 0xbeb0 <.text+0xaeb0>
    bea8:      	ldr	x19, [sp, #0x8]
    beac:      	b	0xbeb4 <.text+0xaeb4>
    beb0:      	mov	x19, xzr
    beb4:      	mov	x0, x19
    beb8:      	sub	sp, x29, #0x30
    bebc:      	ldp	x29, x30, [sp, #0x30]
    bec0:      	ldp	x20, x19, [sp, #0x20]
    bec4:      	ldp	x22, x21, [sp, #0x10]
    bec8:      	ldp	x24, x23, [sp], #0x40
    becc:      	ret
    bed0:      	adrp	x0, 0x11000 <.text+0x10000>
    bed4:      	adrp	x2, 0x11000 <.text+0x10000>
    bed8:      	add	x0, x0, #0xed3
    bedc:      	mov	w1, #0xcc               // =204
    bee0:      	add	x2, x2, #0x8e8
    bee4:      	bl	0xb008 <.text+0xa008>
    bee8:      	b	0xbee8 <.text+0xaee8>
    beec:      	mov	x8, x0
    bef0:      	mov	x9, x1
    bef4:      	orr	w0, wzr, #0x4
    bef8:      	mov	x1, x8
    befc:      	mov	x2, x9
    bf00:      	b	0xbd38 <.text+0xad38>
    bf04:      	stp	x29, x30, [sp, #-0x10]!
    bf08:      	mov	x29, sp
    bf0c:      	sub	sp, sp, #0x10
    bf10:      	adrp	x8, 0x13000
    bf14:      	add	x2, sp, #0x8
    bf18:      	ldr	x9, [x8, #0x478]
    bf1c:      	ldr	x8, [x9, #0x40]
    bf20:      	blr	x8
    bf24:      	tbnz	x0, #0x3f, 0xbf30 <.text+0xaf30>
    bf28:      	ldr	x0, [sp, #0x8]
    bf2c:      	b	0xbf38 <.text+0xaf38>
    bf30:      	mov	x0, xzr
    bf34:      	str	xzr, [sp, #0x8]
    bf38:      	mov	sp, x29
    bf3c:      	ldp	x29, x30, [sp], #0x10
    bf40:      	ret
    bf44:      	mov	x8, x0
    bf48:      	orr	w0, wzr, #0x4
    bf4c:      	mov	x1, x8
    bf50:      	b	0xbf04 <.text+0xaf04>
    bf54:      	stp	x20, x19, [sp, #-0x20]!
    bf58:      	stp	x29, x30, [sp, #0x10]
    bf5c:      	add	x29, sp, #0x10
    bf60:      	mov	x19, x1
    bf64:      	bl	0xbf04 <.text+0xaf04>
    bf68:      	cbz	x0, 0xbf7c <.text+0xaf7c>
    bf6c:      	ldp	x29, x30, [sp, #0x10]
    bf70:      	mov	x1, x19
    bf74:      	ldp	x20, x19, [sp], #0x20
    bf78:      	b	0xb1bc <.text+0xa1bc>
    bf7c:      	ldp	x29, x30, [sp, #0x10]
    bf80:      	mov	x0, xzr
    bf84:      	ldp	x20, x19, [sp], #0x20
    bf88:      	ret
    bf8c:      	mov	x8, x0
    bf90:      	orr	w0, wzr, #0x4
    bf94:      	mov	x1, x8
    bf98:      	b	0xbf54 <.text+0xaf54>
    bf9c:      	stp	x29, x30, [sp, #-0x10]!
    bfa0:      	mov	x29, sp
    bfa4:      	adrp	x8, 0x13000
    bfa8:      	ldr	x9, [x8, #0x478]
    bfac:      	ldr	x9, [x9, #0x48]
    bfb0:      	blr	x9
    bfb4:      	mov	x8, x0
    bfb8:      	tbnz	x8, #0x3f, 0xbfc4 <.text+0xafc4>
    bfbc:      	ldp	x29, x30, [sp], #0x10
    bfc0:      	ret
    bfc4:      	adrp	x1, 0xd000 <.text+0xc000>
    bfc8:      	add	x1, x1, #0xb94
    bfcc:      	orr	w0, wzr, #0x80000000
    bfd0:      	mov	x2, x8
    bfd4:      	bl	0xac7c <.text+0x9c7c>
    bfd8:      	adrp	x0, 0x11000 <.text+0x10000>
    bfdc:      	adrp	x2, 0xd000 <.text+0xc000>
    bfe0:      	add	x0, x0, #0xed3
    bfe4:      	mov	w1, #0x333              // =819
    bfe8:      	add	x2, x2, #0xbc8
    bfec:      	ldp	x29, x30, [sp], #0x10
    bff0:      	b	0xb008 <.text+0xa008>
    bff4:      	ldr	x8, [x1, #0x58]
    bff8:      	adrp	x9, 0x13000
    bffc:      	str	x8, [x9, #0x460]
    c000:      	cbz	x8, 0xc00c <.text+0xb00c>
    c004:      	mov	x0, xzr
    c008:      	ret
    c00c:      	stp	x29, x30, [sp, #-0x10]!
    c010:      	mov	x29, sp
    c014:      	adrp	x0, 0x11000 <.text+0x10000>
    c018:      	adrp	x2, 0x11000 <.text+0x10000>
    c01c:      	add	x0, x0, #0x939
    c020:      	mov	w1, #0x2f               // =47
    c024:      	add	x2, x2, #0x957
    c028:      	bl	0xb008 <.text+0xa008>
    c02c:      	ldp	x29, x30, [sp], #0x10
    c030:      	b	0xc030 <.text+0xb030>
    c034:      	stp	x29, x30, [sp, #-0x10]!
    c038:      	mov	x29, sp
    c03c:      	adrp	x8, 0x13000
    c040:      	str	x0, [x8, #0x468]
    c044:      	cbz	x0, 0xc070 <.text+0xb070>
    c048:      	adrp	x9, 0x13000
    c04c:      	str	x1, [x9, #0x470]
    c050:      	cbz	x1, 0xc08c <.text+0xb08c>
    c054:      	ldr	x8, [x1, #0x60]
    c058:      	adrp	x10, 0x13000
    c05c:      	str	x8, [x10, #0x478]
    c060:      	cbz	x8, 0xc0a8 <.text+0xb0a8>
    c064:      	mov	x0, xzr
    c068:      	ldp	x29, x30, [sp], #0x10
    c06c:      	ret
    c070:      	adrp	x0, 0x11000 <.text+0x10000>
    c074:      	adrp	x2, 0x11000 <.text+0x10000>
    c078:      	add	x0, x0, #0x96b
    c07c:      	mov	w1, #0x33               // =51
    c080:      	add	x2, x2, #0x986
    c084:      	bl	0xb008 <.text+0xa008>
    c088:      	b	0xc088 <.text+0xb088>
    c08c:      	adrp	x0, 0x11000 <.text+0x10000>
    c090:      	adrp	x2, 0x11000 <.text+0x10000>
    c094:      	add	x0, x0, #0x96b
    c098:      	mov	w1, #0x39               // =57
    c09c:      	add	x2, x2, #0x9a3
    c0a0:      	bl	0xb008 <.text+0xa008>
    c0a4:      	b	0xc0a4 <.text+0xb0a4>
    c0a8:      	adrp	x0, 0x11000 <.text+0x10000>
    c0ac:      	adrp	x2, 0x11000 <.text+0x10000>
    c0b0:      	add	x0, x0, #0x96b
    c0b4:      	add	x2, x2, #0x9b7
    c0b8:      	orr	w1, wzr, #0x3f
    c0bc:      	bl	0xb008 <.text+0xa008>
    c0c0:      	b	0xc0c0 <.text+0xb0c0>
    c0c4:      	stp	x20, x19, [sp, #-0x20]!
    c0c8:      	stp	x29, x30, [sp, #0x10]
    c0cc:      	add	x29, sp, #0x10
    c0d0:      	mov	x8, x5
    c0d4:      	mov	x9, x0
    c0d8:      	cbz	x2, 0xc14c <.text+0xb14c>
    c0dc:      	mov	x0, x2
    c0e0:      	str	x9, [x2, #0x20]
    c0e4:      	adrp	x10, 0xd000 <.text+0xc000>
    c0e8:      	adrp	x9, 0x13000
    c0ec:      	str	x3, [x0, #0x28]!
    c0f0:      	ldrb	w10, [x10, #0xc69]
    c0f4:      	cmp	x8, #0x0
    c0f8:      	ldr	x11, [x9, #0x478]
    c0fc:      	cset	w12, ne
    c100:      	cmp	w10, #0x0
    c104:      	cset	w13, eq
    c108:      	ldr	x10, [x11, #0x148]
    c10c:      	and	w9, w12, w13
    c110:      	cbz	x4, 0xc168 <.text+0xb168>
    c114:      	adrp	x12, 0xd000 <.text+0xc000>
    c118:      	ldrb	w11, [x12, #0xc68]
    c11c:      	cbnz	w11, 0xc168 <.text+0xb168>
    c120:      	tbz	w9, #0x0, 0xc188 <.text+0xb188>
    c124:      	adrp	x1, 0x13000
    c128:      	adrp	x3, 0x13000
    c12c:      	adrp	x5, 0x13000
    c130:      	mov	x7, xzr
    c134:      	add	x1, x1, #0x100
    c138:      	add	x3, x3, #0x110
    c13c:      	add	x5, x5, #0x120
    c140:      	mov	x6, x8
    c144:      	blr	x10
    c148:      	b	0xc1b4 <.text+0xb1b4>
    c14c:      	adrp	x0, 0x11000 <.text+0x10000>
    c150:      	adrp	x2, 0x11000 <.text+0x10000>
    c154:      	add	x0, x0, #0x9cb
    c158:      	mov	w1, #0xf2               // =242
    c15c:      	add	x2, x2, #0x9dd
    c160:      	bl	0xb008 <.text+0xa008>
    c164:      	b	0xc164 <.text+0xb164>
    c168:      	tbz	w9, #0x0, 0xc1a4 <.text+0xb1a4>
    c16c:      	adrp	x1, 0x13000
    c170:      	adrp	x3, 0x13000
    c174:      	mov	x5, xzr
    c178:      	add	x1, x1, #0x100
    c17c:      	add	x3, x3, #0x120
    c180:      	mov	x4, x8
    c184:      	b	0xc19c <.text+0xb19c>
    c188:      	adrp	x1, 0x13000
    c18c:      	adrp	x3, 0x13000
    c190:      	mov	x5, xzr
    c194:      	add	x1, x1, #0x100
    c198:      	add	x3, x3, #0x110
    c19c:      	blr	x10
    c1a0:      	b	0xc1b4 <.text+0xb1b4>
    c1a4:      	adrp	x1, 0x13000
    c1a8:      	mov	x3, xzr
    c1ac:      	add	x1, x1, #0x100
    c1b0:      	blr	x10
    c1b4:      	mov	x19, x0
    c1b8:      	tbz	x19, #0x3f, 0xc1e8 <.text+0xb1e8>
    c1bc:      	adrp	x1, 0xd000 <.text+0xc000>
    c1c0:      	add	x1, x1, #0xb94
    c1c4:      	orr	w0, wzr, #0x80000000
    c1c8:      	mov	x2, x19
    c1cc:      	bl	0xac7c <.text+0x9c7c>
    c1d0:      	adrp	x0, 0x11000 <.text+0x10000>
    c1d4:      	adrp	x2, 0xd000 <.text+0xc000>
    c1d8:      	add	x0, x0, #0x9cb
    c1dc:      	mov	w1, #0x11f              // =287
    c1e0:      	add	x2, x2, #0xbc8
    c1e4:      	bl	0xb008 <.text+0xa008>
    c1e8:      	ldp	x29, x30, [sp, #0x10]
    c1ec:      	mov	x0, x19
    c1f0:      	ldp	x20, x19, [sp], #0x20
    c1f4:      	ret
    c1f8:      	mov	x0, xzr
    c1fc:      	ret
    c200:      	stp	x26, x25, [sp, #-0x50]!
    c204:      	stp	x24, x23, [sp, #0x10]
    c208:      	stp	x22, x21, [sp, #0x20]
    c20c:      	stp	x20, x19, [sp, #0x30]
    c210:      	stp	x29, x30, [sp, #0x40]
    c214:      	add	x29, sp, #0x40
    c218:      	mov	x19, x1
    c21c:      	mov	x20, x0
    c220:      	cbz	x20, 0xc2a4 <.text+0xb2a4>
    c224:      	cbz	x19, 0xc2c0 <.text+0xb2c0>
    c228:      	adrp	x8, 0x13000
    c22c:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    c230:      	mov	x25, xzr
    c234:      	ldr	x21, [x8, #0x470]
    c238:      	mov	x22, #-0x1              // =-1
    c23c:      	movk	x23, #0xe
    c240:      	str	xzr, [x19]
    c244:      	ldr	x8, [x21, #0x68]
    c248:      	mov	x24, x25
    c24c:      	add	x22, x22, #0x1
    c250:      	mov	x0, x23
    c254:      	cmp	x22, x8
    c258:      	b.hs	0xc28c <.text+0xb28c>
    c25c:      	ldr	x10, [x21, #0x70]
    c260:      	mov	x0, x20
    c264:      	add	x25, x24, #0x18
    c268:      	add	x1, x10, x24
    c26c:      	bl	0xd7c4 <.text+0xc7c4>
    c270:      	and	w8, w0, #0xff
    c274:      	cbz	w8, 0xc244 <.text+0xb244>
    c278:      	ldr	x11, [x21, #0x70]
    c27c:      	mov	x0, xzr
    c280:      	add	x9, x11, x24
    c284:      	ldr	x12, [x9, #0x10]
    c288:      	str	x12, [x19]
    c28c:      	ldp	x29, x30, [sp, #0x40]
    c290:      	ldp	x20, x19, [sp, #0x30]
    c294:      	ldp	x22, x21, [sp, #0x20]
    c298:      	ldp	x24, x23, [sp, #0x10]
    c29c:      	ldp	x26, x25, [sp], #0x50
    c2a0:      	ret
    c2a4:      	adrp	x0, 0x11000 <.text+0x10000>
    c2a8:      	adrp	x2, 0x11000 <.text+0x10000>
    c2ac:      	add	x0, x0, #0x9fb
    c2b0:      	mov	w1, #0x61               // =97
    c2b4:      	add	x2, x2, #0xa05
    c2b8:      	bl	0xb008 <.text+0xa008>
    c2bc:      	b	0xc2bc <.text+0xb2bc>
    c2c0:      	adrp	x0, 0x11000 <.text+0x10000>
    c2c4:      	adrp	x2, 0x11000 <.text+0x10000>
    c2c8:      	add	x0, x0, #0x9fb
    c2cc:      	mov	w1, #0x62               // =98
    c2d0:      	add	x2, x2, #0xc98
    c2d4:      	bl	0xb008 <.text+0xa008>
    c2d8:      	b	0xc2d8 <.text+0xb2d8>
    c2dc:      	stp	x20, x19, [sp, #-0x20]!
    c2e0:      	stp	x29, x30, [sp, #0x10]
    c2e4:      	add	x29, sp, #0x10
    c2e8:      	adrp	x0, 0x13000
    c2ec:      	adrp	x1, 0x13000
    c2f0:      	add	x0, x0, #0x70
    c2f4:      	add	x1, x1, #0x480
    c2f8:      	bl	0xc200 <.text+0xb200>
    c2fc:      	mov	x19, x0
    c300:      	tbz	x19, #0x3f, 0xc330 <.text+0xb330>
    c304:      	adrp	x1, 0xd000 <.text+0xc000>
    c308:      	add	x1, x1, #0xb94
    c30c:      	orr	w0, wzr, #0x80000000
    c310:      	mov	x2, x19
    c314:      	bl	0xac7c <.text+0x9c7c>
    c318:      	adrp	x0, 0x11000 <.text+0x10000>
    c31c:      	adrp	x2, 0xd000 <.text+0xc000>
    c320:      	add	x0, x0, #0xba0
    c324:      	mov	w1, #0x31               // =49
    c328:      	add	x2, x2, #0xbc8
    c32c:      	bl	0xb008 <.text+0xa008>
    c330:      	adrp	x8, 0x13000
    c334:      	ldr	x8, [x8, #0x480]
    c338:      	cbz	x8, 0xc34c <.text+0xb34c>
    c33c:      	ldp	x29, x30, [sp, #0x10]
    c340:      	mov	x0, x19
    c344:      	ldp	x20, x19, [sp], #0x20
    c348:      	ret
    c34c:      	adrp	x0, 0x11000 <.text+0x10000>
    c350:      	adrp	x2, 0x11000 <.text+0x10000>
    c354:      	add	x0, x0, #0xba0
    c358:      	mov	w1, #0x32               // =50
    c35c:      	add	x2, x2, #0xba9
    c360:      	bl	0xb008 <.text+0xa008>
    c364:      	b	0xc364 <.text+0xb364>
    c368:      	adrp	x8, 0x13000
    c36c:      	ldr	x0, [x8, #0x480]
    c370:      	cbz	x0, 0xc378 <.text+0xb378>
    c374:      	ret
    c378:      	stp	x29, x30, [sp, #-0x10]!
    c37c:      	mov	x29, sp
    c380:      	adrp	x0, 0x11000 <.text+0x10000>
    c384:      	adrp	x2, 0x11000 <.text+0x10000>
    c388:      	add	x0, x0, #0xba0
    c38c:      	mov	w1, #0x4d               // =77
    c390:      	add	x2, x2, #0xba9
    c394:      	bl	0xb008 <.text+0xa008>
    c398:      	ldp	x29, x30, [sp], #0x10
    c39c:      	b	0xc39c <.text+0xb39c>
    c3a0:      	cbz	x1, 0xc3d0 <.text+0xb3d0>
    c3a4:      	orr	w8, wzr, #0xffff
    c3a8:      	b	0xc3b0 <.text+0xb3b0>
    c3ac:      	add	x1, x1, x10
    c3b0:      	ldr	w10, [x1]
    c3b4:      	and	w9, w10, #0xffff
    c3b8:      	lsr	w10, w10, #16
    c3bc:      	cmp	w9, w8
    c3c0:      	b.eq	0xc3f8 <.text+0xb3f8>
    c3c4:      	cmp	w9, w0, uxth
    c3c8:      	b.ne	0xc3ac <.text+0xb3ac>
    c3cc:      	b	0xc3fc <.text+0xb3fc>
    c3d0:      	stp	x29, x30, [sp, #-0x10]!
    c3d4:      	mov	x29, sp
    c3d8:      	adrp	x0, 0x11000 <.text+0x10000>
    c3dc:      	adrp	x2, 0x11000 <.text+0x10000>
    c3e0:      	add	x0, x0, #0xba0
    c3e4:      	mov	w1, #0x6b               // =107
    c3e8:      	add	x2, x2, #0xbc2
    c3ec:      	bl	0xb008 <.text+0xa008>
    c3f0:      	ldp	x29, x30, [sp], #0x10
    c3f4:      	b	0xc3f4 <.text+0xb3f4>
    c3f8:      	mov	x1, xzr
    c3fc:      	mov	x0, x1
    c400:      	ret
    c404:      	stp	x20, x19, [sp, #-0x20]!
    c408:      	stp	x29, x30, [sp, #0x10]
    c40c:      	add	x29, sp, #0x10
    c410:      	mov	x19, x0
    c414:      	b	0xc420 <.text+0xb420>
    c418:      	ldrh	w8, [x20, #0x2]
    c41c:      	add	x1, x20, x8
    c420:      	orr	w0, wzr, #0x4
    c424:      	bl	0xc3a0 <.text+0xb3a0>
    c428:      	mov	x20, x0
    c42c:      	cbz	x20, 0xc448 <.text+0xb448>
    c430:      	add	x1, x20, #0x8
    c434:      	mov	x0, x19
    c438:      	bl	0xd7c4 <.text+0xc7c4>
    c43c:      	and	w8, w0, #0xff
    c440:      	cbz	w8, 0xc418 <.text+0xb418>
    c444:      	b	0xc44c <.text+0xb44c>
    c448:      	mov	x20, xzr
    c44c:      	ldp	x29, x30, [sp, #0x10]
    c450:      	mov	x0, x20
    c454:      	ldp	x20, x19, [sp], #0x20
    c458:      	ret
    c45c:      	stp	x20, x19, [sp, #-0x20]!
    c460:      	stp	x29, x30, [sp, #0x10]
    c464:      	add	x29, sp, #0x10
    c468:      	mov	x19, x0
    c46c:      	bl	0xc368 <.text+0xb368>
    c470:      	ldp	x29, x30, [sp, #0x10]
    c474:      	mov	x1, x0
    c478:      	mov	x0, x19
    c47c:      	ldp	x20, x19, [sp], #0x20
    c480:      	b	0xc404 <.text+0xb404>
    c484:      	cbz	x1, 0xc49c <.text+0xb49c>
    c488:      	adrp	x8, 0x13000
    c48c:      	mov	x0, xzr
    c490:      	ldr	w8, [x8, #0x48c]
    c494:      	str	x8, [x1]
    c498:      	ret
    c49c:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    c4a0:      	movk	x0, #0x2
    c4a4:      	ret
    c4a8:      	adrp	x8, 0x13000
    c4ac:      	mov	x0, xzr
    c4b0:      	str	w1, [x8, #0x48c]
    c4b4:      	ret
    c4b8:      	stp	x20, x19, [sp, #-0x20]!
    c4bc:      	stp	x29, x30, [sp, #0x10]
    c4c0:      	add	x29, sp, #0x10
    c4c4:      	sub	sp, sp, #0x10
    c4c8:      	adrp	x8, 0x13000
    c4cc:      	str	x0, [sp, #0x8]
    c4d0:      	adrp	x9, 0xd000 <.text+0xc000>
    c4d4:      	adrp	x2, 0x13000
    c4d8:      	str	x1, [x8, #0x490]
    c4dc:      	adrp	x10, 0x13000
    c4e0:      	ldr	x11, [x1, #0x60]
    c4e4:      	adrp	x1, 0x13000
    c4e8:      	ldr	w8, [x9, #0xbf4]
    c4ec:      	add	x1, x1, #0x130
    c4f0:      	add	x2, x2, #0x408
    c4f4:      	add	x0, sp, #0x8
    c4f8:      	ldr	x9, [x11, #0x148]
    c4fc:      	mov	x3, xzr
    c500:      	str	w8, [x10, #0x48c]
    c504:      	blr	x9
    c508:      	mov	x19, x0
    c50c:      	bl	0xc524 <.text+0xb524>
    c510:      	mov	x0, x19
    c514:      	sub	sp, x29, #0x10
    c518:      	ldp	x29, x30, [sp, #0x10]
    c51c:      	ldp	x20, x19, [sp], #0x20
    c520:      	ret
    c524:      	stp	x22, x21, [sp, #-0x30]!
    c528:      	stp	x20, x19, [sp, #0x10]
    c52c:      	stp	x29, x30, [sp, #0x20]
    c530:      	add	x29, sp, #0x20
    c534:      	sub	sp, sp, #0x10
    c538:      	adrp	x21, 0x13000
    c53c:      	ldr	x9, [x21, #0x490]
    c540:      	cbz	x9, 0xc604 <.text+0xb604>
    c544:      	adrp	x20, 0x13000
    c548:      	ldrb	w8, [x20, #0x488]
    c54c:      	cbnz	w8, 0xc5f8 <.text+0xb5f8>
    c550:      	ldr	x10, [x9, #0x60]
    c554:      	orr	w0, wzr, #0x1f
    c558:      	ldr	x8, [x10, #0x18]
    c55c:      	blr	x8
    c560:      	ldr	x11, [x21, #0x490]
    c564:      	mov	x19, x0
    c568:      	ldr	x12, [x11, #0x60]
    c56c:      	ldr	x9, [x12, #0x20]
    c570:      	blr	x9
    c574:      	cmp	x19, #0x8
    c578:      	b.hi	0xc5f8 <.text+0xb5f8>
    c57c:      	orr	w11, wzr, #0x8
    c580:      	ldr	x13, [x21, #0x490]
    c584:      	adrp	x0, 0x11000 <.text+0x10000>
    c588:      	adrp	x1, 0x13000
    c58c:      	str	x11, [sp, #0x8]
    c590:      	add	x0, x0, #0xbee
    c594:      	ldr	x14, [x13, #0x58]
    c598:      	add	x1, x1, #0x80
    c59c:      	add	x3, sp, #0x8
    c5a0:      	mov	x4, sp
    c5a4:      	mov	x2, xzr
    c5a8:      	ldr	x12, [x14, #0x48]
    c5ac:      	blr	x12
    c5b0:      	mov	x13, #-0x6000000000000000 // =-6917529027641081856
    c5b4:      	movk	x13, #0x2
    c5b8:      	cmp	x0, x13
    c5bc:      	b.ne	0xc624 <.text+0xb624>
    c5c0:      	adrp	x0, 0x13000
    c5c4:      	add	x0, x0, #0x80
    c5c8:      	bl	0xc45c <.text+0xb45c>
    c5cc:      	cbz	x0, 0xc5f8 <.text+0xb5f8>
    c5d0:      	ldrh	w8, [x0, #0x2]
    c5d4:      	cmp	w8, #0x1c
    c5d8:      	adrp	x8, 0x13000
    c5dc:      	add	x8, x8, #0x48c
    c5e0:      	b.ne	0xc60c <.text+0xb60c>
    c5e4:      	ldr	w11, [x0, #0x18]
    c5e8:      	orr	w12, wzr, #0x1
    c5ec:      	strb	w12, [x20, #0x488]
    c5f0:      	str	w11, [x8]
    c5f4:      	b	0xc60c <.text+0xb60c>
    c5f8:      	adrp	x8, 0x13000
    c5fc:      	add	x8, x8, #0x48c
    c600:      	b	0xc60c <.text+0xb60c>
    c604:      	adrp	x8, 0xd000 <.text+0xc000>
    c608:      	add	x8, x8, #0xbf4
    c60c:      	ldr	w0, [x8]
    c610:      	sub	sp, x29, #0x20
    c614:      	ldp	x29, x30, [sp, #0x20]
    c618:      	ldp	x20, x19, [sp, #0x10]
    c61c:      	ldp	x22, x21, [sp], #0x30
    c620:      	ret
    c624:      	adrp	x8, 0x13000
    c628:      	orr	w9, wzr, #0x1
    c62c:      	add	x8, x8, #0x48c
    c630:      	strb	w9, [x20, #0x488]
    c634:      	tbnz	x0, #0x3f, 0xc60c <.text+0xb60c>
    c638:      	ldr	x15, [sp]
    c63c:      	str	w15, [x8]
    c640:      	b	0xc60c <.text+0xb60c>
    c644:      	ldr	x8, [x1, #0x60]
    c648:      	adrp	x1, 0x13000
    c64c:      	adrp	x2, 0x13000
    c650:      	mov	x3, xzr
    c654:      	add	x1, x1, #0x130
    c658:      	ldr	x4, [x8, #0x150]
    c65c:      	add	x2, x2, #0x408
    c660:      	br	x4
    c664:      	adrp	x9, 0x11000 <.text+0x10000>
    c668:      	add	x9, x9, #0xd50
    c66c:      	mov	x8, xzr
    c670:      	add	x10, x9, #0x8
    c674:      	b	0xc680 <.text+0xb680>
    c678:      	add	x8, x8, #0x1
    c67c:      	add	x10, x10, #0x18
    c680:      	cmp	x8, #0x2
    c684:      	b.hi	0xc698 <.text+0xb698>
    c688:      	ldr	x12, [x10]
    c68c:      	cmp	x12, x0
    c690:      	b.lo	0xc678 <.text+0xb678>
    c694:      	b	0xc6a4 <.text+0xb6a4>
    c698:      	cmp	x8, #0x3
    c69c:      	cset	w10, eq
    c6a0:      	sub	x8, x8, w10, uxtw
    c6a4:      	cbz	x1, 0xc6ac <.text+0xb6ac>
    c6a8:      	str	x8, [x1]
    c6ac:      	cbz	x2, 0xc6d4 <.text+0xb6d4>
    c6b0:      	orr	w14, wzr, #0x18
    c6b4:      	madd	x10, x8, x14, x9
    c6b8:      	orr	w9, wzr, #0x1
    c6bc:      	sub	w11, w9, w0
    c6c0:      	ldr	w8, [x10, #0x10]
    c6c4:      	add	w12, w11, w8
    c6c8:      	lsl	w8, w9, w12
    c6cc:      	sxtw	x9, w8
    c6d0:      	str	x9, [x2]
    c6d4:      	ret
    c6d8:      	stp	x20, x19, [sp, #-0x20]!
    c6dc:      	stp	x29, x30, [sp, #0x10]
    c6e0:      	add	x29, sp, #0x10
    c6e4:      	mov	x19, x1
    c6e8:      	mov	x20, x0
    c6ec:      	bl	0xabc0 <.text+0x9bc0>
    c6f0:      	ldp	x29, x30, [sp, #0x10]
    c6f4:      	cmp	x0, #0x4
    c6f8:      	orr	x9, xzr, #0x40000000000000
    c6fc:      	orr	x10, xzr, #0x60000000000000
    c700:      	csel	x2, x10, x9, eq
    c704:      	mov	x3, #-0xfffffffff001    // =-281474976706561
    c708:      	mov	x0, x20
    c70c:      	mov	x1, x19
    c710:      	ldp	x20, x19, [sp], #0x20
    c714:      	b	0xc718 <.text+0xb718>
    c718:      	stp	x22, x21, [sp, #-0x30]!
    c71c:      	stp	x20, x19, [sp, #0x10]
    c720:      	stp	x29, x30, [sp, #0x20]
    c724:      	add	x29, sp, #0x20
    c728:      	mov	x19, x3
    c72c:      	mov	x20, x2
    c730:      	mov	x21, x1
    c734:      	mov	x22, x0
    c738:      	bl	0xabe0 <.text+0x9be0>
    c73c:      	mov	x1, x22
    c740:      	mov	x2, x21
    c744:      	mov	x3, x20
    c748:      	mov	x4, x19
    c74c:      	bl	0xc794 <.text+0xb794>
    c750:      	tbnz	x0, #0x3f, 0xc75c <.text+0xb75c>
    c754:      	bl	0xac44 <.text+0x9c44>
    c758:      	mov	x0, xzr
    c75c:      	ldp	x29, x30, [sp, #0x20]
    c760:      	ldp	x20, x19, [sp, #0x10]
    c764:      	ldp	x22, x21, [sp], #0x30
    c768:      	ret
    c76c:      	stp	x29, x30, [sp, #-0x10]!
    c770:      	mov	x29, sp
    c774:      	adrp	x8, 0xc000 <.text+0xb000>
    c778:      	adrp	x0, 0xc000 <.text+0xb000>
    c77c:      	add	x0, x0, #0xb38
    c780:      	ldr	w1, [x8, #0xbf8]
    c784:      	bl	0xd6b0 <.text+0xc6b0>
    c788:      	mov	x0, xzr
    c78c:      	ldp	x29, x30, [sp], #0x10
    c790:      	ret
    c794:      	stp	x28, x27, [sp, #-0x60]!
    c798:      	stp	x26, x25, [sp, #0x10]
    c79c:      	stp	x24, x23, [sp, #0x20]
    c7a0:      	stp	x22, x21, [sp, #0x30]
    c7a4:      	stp	x20, x19, [sp, #0x40]
    c7a8:      	stp	x29, x30, [sp, #0x50]
    c7ac:      	add	x29, sp, #0x50
    c7b0:      	sub	sp, sp, #0x40
    c7b4:      	mov	x23, x2
    c7b8:      	stp	x3, x4, [sp, #0x10]
    c7bc:      	mov	x2, #-0x8000000000000000 // =-9223372036854775808
    c7c0:      	str	x0, [sp, #0x20]
    c7c4:      	movk	x2, #0x2
    c7c8:      	mov	x24, x1
    c7cc:      	cbz	x23, 0xca78 <.text+0xba78>
    c7d0:      	and	x12, x23, #0xfff
    c7d4:      	cbnz	x12, 0xca78 <.text+0xba78>
    c7d8:      	orr	w19, wzr, #0x3
    c7dc:      	str	x2, [sp, #0x8]
    c7e0:      	orr	w22, wzr, #0x1
    c7e4:      	and	x14, x24, #0xfff
    c7e8:      	cbnz	x14, 0xcaac <.text+0xbaac>
    c7ec:      	cbz	x23, 0xcad0 <.text+0xbad0>
    c7f0:      	and	x15, x23, #0xfff
    c7f4:      	cbnz	x15, 0xcad0 <.text+0xbad0>
    c7f8:      	bl	0xac10 <.text+0x9c10>
    c7fc:      	and	x0, x0, #0x3f
    c800:      	add	x1, sp, #0x38
    c804:      	add	x2, sp, #0x30
    c808:      	bl	0xc664 <.text+0xb664>
    c80c:      	cbz	x24, 0xc818 <.text+0xb818>
    c810:      	mov	x0, x24
    c814:      	b	0xc81c <.text+0xb81c>
    c818:      	mov	x0, x23
    c81c:      	bl	0xd840 <.text+0xc840>
    c820:      	mov	x8, #-0x1c72000000000000 // =-2049700780406996992
    c824:      	movk	x8, #0x38e3, lsl #32
    c828:      	movk	x8, #0x8e38, lsl #16
    c82c:      	sub	x16, x0, #0xc
    c830:      	movk	x8, #0xe38f
    c834:      	mov	w10, #0x27              // =39
    c838:      	umulh	x3, x16, x8
    c83c:      	sub	x17, x19, x3, lsr #3
    c840:      	cmp	x17, #0x1
    c844:      	csel	x0, x17, x22, hi
    c848:      	sub	x21, x0, #0x1
    c84c:      	add	x5, x0, x0, lsl #3
    c850:      	sub	x10, x10, x5
    c854:      	orr	w6, wzr, #0x1
    c858:      	add	x21, x21, #0x1
    c85c:      	lsl	x7, x6, x10
    c860:      	sub	x10, x10, #0x9
    c864:      	cmp	x23, x7
    c868:      	b.lo	0xc854 <.text+0xb854>
    c86c:      	ldr	x22, [sp, #0x38]
    c870:      	orr	w11, wzr, #0x1e
    c874:      	ldr	x26, [sp, #0x20]
    c878:      	mov	x25, xzr
    c87c:      	str	x23, [sp, #0x28]
    c880:      	add	x1, x22, x22, lsl #3
    c884:      	sub	x19, x11, x1
    c888:      	b	0xc894 <.text+0xb894>
    c88c:      	add	x22, x22, #0x1
    c890:      	sub	x19, x19, #0x9
    c894:      	cmp	x22, x21
    c898:      	b.hi	0xc9b8 <.text+0xb9b8>
    c89c:      	add	x27, x19, #0x9
    c8a0:      	cmp	x22, #0x3
    c8a4:      	lsr	x28, x24, x27
    c8a8:      	ubfiz	x0, x28, #3, #9
    c8ac:      	add	x25, x0, x26
    c8b0:      	ldr	x20, [x25]
    c8b4:      	and	x11, x20, #0x3
    c8b8:      	ccmp	x11, #0x3, #0x0, ne
    c8bc:      	b.eq	0xc964 <.text+0xb964>
    c8c0:      	cmp	x11, #0x1
    c8c4:      	b.ne	0xc974 <.text+0xb974>
    c8c8:      	cmp	x22, x21
    c8cc:      	b.eq	0xc88c <.text+0xb88c>
    c8d0:      	mov	x23, x24
    c8d4:      	cmp	x22, #0x2
    c8d8:      	orr	w0, wzr, #0x1
    c8dc:      	orr	w1, wzr, #0x1000
    c8e0:      	orr	w14, wzr, #0x1
    c8e4:      	orr	w15, wzr, #0x3
    c8e8:      	csel	x24, x15, x14, eq
    c8ec:      	bl	0xbeec <.text+0xaeec>
    c8f0:      	mov	x26, x0
    c8f4:      	cbz	x26, 0xcafc <.text+0xbafc>
    c8f8:      	mov	x13, #-0x10000000000000 // =-4503599627370496
    c8fc:      	movk	x13, #0xffc
    c900:      	and	x13, x20, x13
    c904:      	mov	x8, xzr
    c908:      	lsl	x20, x20, #58
    c90c:      	and	x9, x20, #0x8000000000000000
    c910:      	orr	x13, x13, x24
    c914:      	lsl	x16, x28, x27
    c918:      	b	0xc930 <.text+0xb930>
    c91c:      	lsl	x24, x8, x19
    c920:      	add	x17, x24, x16
    c924:      	orr	x3, x13, x17
    c928:      	str	x3, [x26, x8, lsl #3]
    c92c:      	add	x8, x8, #0x1
    c930:      	cmp	x8, #0x200
    c934:      	b.ne	0xc91c <.text+0xb91c>
    c938:      	and	x1, x26, #0xfffffffff000
    c93c:      	orr	x16, x9, x1
    c940:      	orr	x27, x16, #0x3
    c944:      	bl	0xab6c <.text+0x9b6c>
    c948:      	and	w8, w0, #0xff
    c94c:      	cbz	w8, 0xc9ac <.text+0xb9ac>
    c950:      	mov	x0, x25
    c954:      	mov	x1, x27
    c958:      	bl	0xcb38 <.text+0xbb38>
    c95c:      	mov	x24, x23
    c960:      	b	0xc88c <.text+0xb88c>
    c964:      	cmp	x22, x21
    c968:      	and	x26, x20, #0xfffffffff000
    c96c:      	cinc	x21, x21, eq
    c970:      	b	0xc88c <.text+0xb88c>
    c974:      	cmp	x22, x21
    c978:      	b.eq	0xc88c <.text+0xb88c>
    c97c:      	orr	w0, wzr, #0x1
    c980:      	orr	w1, wzr, #0x1000
    c984:      	bl	0xbeec <.text+0xaeec>
    c988:      	mov	x26, x0
    c98c:      	cbz	x26, 0xcafc <.text+0xbafc>
    c990:      	orr	w1, wzr, #0x1000
    c994:      	mov	x0, x26
    c998:      	bl	0xb1bc <.text+0xa1bc>
    c99c:      	and	x2, x26, #0xfffffffff000
    c9a0:      	orr	x3, x2, #0x3
    c9a4:      	str	x3, [x25]
    c9a8:      	b	0xc88c <.text+0xb88c>
    c9ac:      	str	x27, [x25]
    c9b0:      	mov	x24, x23
    c9b4:      	b	0xc88c <.text+0xb88c>
    c9b8:      	ldp	x5, x6, [sp, #0x30]
    c9bc:      	cmp	x21, x6
    c9c0:      	lsl	x4, x5, #3
    c9c4:      	sub	x5, x4, #0x8
    c9c8:      	orr	w12, wzr, #0xff8
    c9cc:      	csel	x17, x5, x12, eq
    c9d0:      	cbz	x25, 0xcb28 <.text+0xbb28>
    c9d4:      	orr	w19, wzr, #0x3
    c9d8:      	sub	x22, x19, x21
    c9dc:      	ldp	x9, x3, [sp, #0x10]
    c9e0:      	add	x6, x22, x22, lsl #3
    c9e4:      	ldr	x16, [sp, #0x28]
    c9e8:      	cmp	x21, #0x3
    c9ec:      	add	x7, x6, #0xc
    c9f0:      	orr	w22, wzr, #0x1
    c9f4:      	csel	x2, x22, x19, ne
    c9f8:      	add	x8, x17, x26
    c9fc:      	add	x13, x25, #0x8
    ca00:      	orr	x10, x2, x9
    ca04:      	lsl	x9, x22, x7
    ca08:      	sub	x14, x16, x9
    ca0c:      	mov	x15, x16
    ca10:      	ldur	x0, [x13, #-0x8]
    ca14:      	mov	x11, x24
    ca18:      	and	x25, x11, #0xfffffffff000
    ca1c:      	mov	x12, x15
    ca20:      	mov	x23, x14
    ca24:      	and	x14, x0, x3
    ca28:      	orr	x15, x10, x25
    ca2c:      	orr	x20, x15, x14
    ca30:      	cmp	x21, #0x3
    ca34:      	stur	x20, [x13, #-0x8]
    ca38:      	b.eq	0xca4c <.text+0xba4c>
    ca3c:      	ldr	x24, [x13]
    ca40:      	and	x14, x24, #0x3
    ca44:      	cmp	x14, #0x3
    ca48:      	b.eq	0xca64 <.text+0xba64>
    ca4c:      	subs	x14, x23, x9
    ca50:      	add	x24, x11, x9
    ca54:      	ccmp	x13, x8, #0x2, hs
    ca58:      	add	x13, x13, #0x8
    ca5c:      	sub	x15, x12, x9
    ca60:      	b.ls	0xca10 <.text+0xba10>
    ca64:      	add	x24, x9, x11
    ca68:      	cmp	x12, x9
    ca6c:      	b.ne	0xc7e4 <.text+0xb7e4>
    ca70:      	mov	x0, xzr
    ca74:      	b	0xcb08 <.text+0xbb08>
    ca78:      	adrp	x1, 0xd000 <.text+0xc000>
    ca7c:      	add	x1, x1, #0xb94
    ca80:      	orr	w0, wzr, #0x80000000
    ca84:      	mov	x19, x2
    ca88:      	bl	0xac7c <.text+0x9c7c>
    ca8c:      	adrp	x0, 0x11000 <.text+0x10000>
    ca90:      	adrp	x2, 0x11000 <.text+0x10000>
    ca94:      	add	x0, x0, #0xc42
    ca98:      	mov	w1, #0x1a5              // =421
    ca9c:      	add	x2, x2, #0xd01
    caa0:      	bl	0xb008 <.text+0xa008>
    caa4:      	mov	x0, x19
    caa8:      	b	0xcb08 <.text+0xbb08>
    caac:      	adrp	x1, 0xd000 <.text+0xc000>
    cab0:      	ldr	x2, [sp, #0x8]
    cab4:      	add	x1, x1, #0xb94
    cab8:      	orr	w0, wzr, #0x80000000
    cabc:      	bl	0xac7c <.text+0x9c7c>
    cac0:      	adrp	x0, 0x11000 <.text+0x10000>
    cac4:      	add	x0, x0, #0xc42
    cac8:      	mov	w1, #0x10c              // =268
    cacc:      	b	0xcaf0 <.text+0xbaf0>
    cad0:      	adrp	x1, 0xd000 <.text+0xc000>
    cad4:      	ldr	x2, [sp, #0x8]
    cad8:      	add	x1, x1, #0xb94
    cadc:      	orr	w0, wzr, #0x80000000
    cae0:      	bl	0xac7c <.text+0x9c7c>
    cae4:      	adrp	x0, 0x11000 <.text+0x10000>
    cae8:      	add	x0, x0, #0xc42
    caec:      	mov	w1, #0x112              // =274
    caf0:      	adrp	x2, 0x11000 <.text+0x10000>
    caf4:      	add	x2, x2, #0xd01
    caf8:      	bl	0xb008 <.text+0xa008>
    cafc:      	mov	x28, #-0x8000000000000000 // =-9223372036854775808
    cb00:      	movk	x28, #0x2
    cb04:      	add	x0, x28, #0x7
    cb08:      	sub	sp, x29, #0x50
    cb0c:      	ldp	x29, x30, [sp, #0x50]
    cb10:      	ldp	x20, x19, [sp, #0x40]
    cb14:      	ldp	x22, x21, [sp, #0x30]
    cb18:      	ldp	x24, x23, [sp, #0x20]
    cb1c:      	ldp	x26, x25, [sp, #0x10]
    cb20:      	ldp	x28, x27, [sp], #0x60
    cb24:      	ret
    cb28:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    cb2c:      	movk	x21, #0x2
    cb30:      	add	x0, x21, #0x7
    cb34:      	b	0xcb08 <.text+0xbb08>
    cb38:      	mrs	x2, DAIF
    cb3c:      	msr	DAIFSet, #0xf
    cb40:      	isb
    cb44:      	dc	civac, x0
    cb48:      	dsb	ish
    cb4c:      	mrs	x3, CurrentEL
    cb50:      	cmp	x3, #0x8
    cb54:      	b.gt	0xcbc4 <.text+0xbbc4>
    cb58:      	b.eq	0xcb94 <.text+0xbb94>
    cb5c:      	cbnz	x3, 0xcb64 <.text+0xbb64>
    cb60:      	b	0xcb60 <.text+0xbb60>
    cb64:      	mrs	x8, SCTLR_EL1
    cb68:      	and	x9, x8, #0xfffffffffffffffe
    cb6c:      	msr	SCTLR_EL1, x9
    cb70:      	isb
    cb74:      	str	x1, [x0]
    cb78:      	dmb	sy
    cb7c:      	dc	ivac, x0
    cb80:      	tlbi	vmalle1
    cb84:      	dsb	sy
    cb88:      	msr	SCTLR_EL1, x8
    cb8c:      	isb
    cb90:      	b	0xcbf0 <.text+0xbbf0>
    cb94:      	mrs	x8, SCTLR_EL2
    cb98:      	and	x9, x8, #0xfffffffffffffffe
    cb9c:      	msr	SCTLR_EL2, x9
    cba0:      	isb
    cba4:      	str	x1, [x0]
    cba8:      	dmb	sy
    cbac:      	dc	ivac, x0
    cbb0:      	tlbi	alle2
    cbb4:      	dsb	sy
    cbb8:      	msr	SCTLR_EL2, x8
    cbbc:      	isb
    cbc0:      	b	0xcbf0 <.text+0xbbf0>
    cbc4:      	mrs	x8, SCTLR_EL3
    cbc8:      	and	x9, x8, #0xfffffffffffffffe
    cbcc:      	msr	SCTLR_EL3, x9
    cbd0:      	isb
    cbd4:      	str	x1, [x0]
    cbd8:      	dmb	sy
    cbdc:      	dc	ivac, x0
    cbe0:      	tlbi	alle3
    cbe4:      	dsb	sy
    cbe8:      	msr	SCTLR_EL3, x8
    cbec:      	isb
    cbf0:      	msr	DAIF, x2
    cbf4:      	ret
    cbf8:      	udf	#0xc0
    cbfc:      	stp	x20, x19, [sp, #-0x20]!
    cc00:      	stp	x29, x30, [sp, #0x10]
    cc04:      	add	x29, sp, #0x10
    cc08:      	adrp	x0, 0x13000
    cc0c:      	adrp	x1, 0x13000
    cc10:      	add	x0, x0, #0x90
    cc14:      	add	x1, x1, #0x498
    cc18:      	bl	0xc200 <.text+0xb200>
    cc1c:      	mov	x19, x0
    cc20:      	tbz	x19, #0x3f, 0xcc50 <.text+0xbc50>
    cc24:      	adrp	x1, 0xd000 <.text+0xc000>
    cc28:      	add	x1, x1, #0xb94
    cc2c:      	orr	w0, wzr, #0x80000000
    cc30:      	mov	x2, x19
    cc34:      	bl	0xac7c <.text+0x9c7c>
    cc38:      	adrp	x0, 0x11000 <.text+0x10000>
    cc3c:      	adrp	x2, 0xd000 <.text+0xc000>
    cc40:      	add	x0, x0, #0xd98
    cc44:      	add	x2, x2, #0xbc8
    cc48:      	orr	w1, wzr, #0x40
    cc4c:      	bl	0xb008 <.text+0xa008>
    cc50:      	adrp	x8, 0x13000
    cc54:      	ldr	x8, [x8, #0x498]
    cc58:      	cbz	x8, 0xcc6c <.text+0xbc6c>
    cc5c:      	ldp	x29, x30, [sp, #0x10]
    cc60:      	mov	x0, x19
    cc64:      	ldp	x20, x19, [sp], #0x20
    cc68:      	ret
    cc6c:      	adrp	x0, 0x11000 <.text+0x10000>
    cc70:      	adrp	x2, 0x11000 <.text+0x10000>
    cc74:      	add	x0, x0, #0xd98
    cc78:      	mov	w1, #0x41               // =65
    cc7c:      	add	x2, x2, #0xdae
    cc80:      	bl	0xb008 <.text+0xa008>
    cc84:      	b	0xcc84 <.text+0xbc84>
    cc88:      	and	x8, x0, #0x3
    cc8c:      	cbz	x8, 0xccb8 <.text+0xbcb8>
    cc90:      	stp	x29, x30, [sp, #-0x10]!
    cc94:      	mov	x29, sp
    cc98:      	adrp	x0, 0x11000 <.text+0x10000>
    cc9c:      	adrp	x2, 0x11000 <.text+0x10000>
    cca0:      	add	x0, x0, #0xdc2
    cca4:      	mov	w1, #0x15d              // =349
    cca8:      	add	x2, x2, #0xde0
    ccac:      	bl	0xb008 <.text+0xa008>
    ccb0:      	ldp	x29, x30, [sp], #0x10
    ccb4:      	b	0xccb4 <.text+0xbcb4>
    ccb8:      	ldr	w0, [x0]
    ccbc:      	ret
    ccc0:      	mov	x8, x0
    ccc4:      	and	x9, x8, #0x3
    ccc8:      	cbz	x9, 0xccf4 <.text+0xbcf4>
    cccc:      	stp	x29, x30, [sp, #-0x10]!
    ccd0:      	mov	x29, sp
    ccd4:      	adrp	x0, 0x11000 <.text+0x10000>
    ccd8:      	adrp	x2, 0x11000 <.text+0x10000>
    ccdc:      	add	x0, x0, #0xdc2
    cce0:      	mov	w1, #0x176              // =374
    cce4:      	add	x2, x2, #0xde0
    cce8:      	bl	0xb008 <.text+0xa008>
    ccec:      	ldp	x29, x30, [sp], #0x10
    ccf0:      	b	0xccf0 <.text+0xbcf0>
    ccf4:      	mov	w0, w1
    ccf8:      	str	w1, [x8]
    ccfc:      	ret
    cd00:      	stp	x29, x30, [sp, #-0x10]!
    cd04:      	mov	x29, sp
    cd08:      	bl	0xabb8 <.text+0x9bb8>
    cd0c:      	cbz	x0, 0xcd40 <.text+0xbd40>
    cd10:      	adrp	x8, 0xd000 <.text+0xc000>
    cd14:      	ldr	w8, [x8, #0xc6c]
    cd18:      	sub	w9, w8, #0x1
    cd1c:      	mov	w8, #0xf0000            // =983040
    cd20:      	movk	w8, #0x423e
    cd24:      	cmp	w9, w8
    cd28:      	b.ls	0xcd6c <.text+0xbd6c>
    cd2c:      	bl	0xd880 <.text+0xc880>
    cd30:      	cbz	x0, 0xcd88 <.text+0xbd88>
    cd34:      	mov	x0, xzr
    cd38:      	ldp	x29, x30, [sp], #0x10
    cd3c:      	ret
    cd40:      	adrp	x1, 0x11000 <.text+0x10000>
    cd44:      	add	x1, x1, #0xe72
    cd48:      	orr	w0, wzr, #0x80000000
    cd4c:      	bl	0xac7c <.text+0x9c7c>
    cd50:      	adrp	x0, 0x11000 <.text+0x10000>
    cd54:      	adrp	x2, 0x11000 <.text+0x10000>
    cd58:      	add	x0, x0, #0xe06
    cd5c:      	mov	w1, #0x50               // =80
    cd60:      	add	x2, x2, #0xe70
    cd64:      	bl	0xb008 <.text+0xa008>
    cd68:      	b	0xcd68 <.text+0xbd68>
    cd6c:      	adrp	x0, 0x11000 <.text+0x10000>
    cd70:      	adrp	x2, 0x11000 <.text+0x10000>
    cd74:      	add	x0, x0, #0xe06
    cd78:      	add	x2, x2, #0xe18
    cd7c:      	orr	w1, wzr, #0x38
    cd80:      	bl	0xb008 <.text+0xa008>
    cd84:      	b	0xcd84 <.text+0xbd84>
    cd88:      	adrp	x0, 0x11000 <.text+0x10000>
    cd8c:      	adrp	x2, 0x11000 <.text+0x10000>
    cd90:      	add	x0, x0, #0xe06
    cd94:      	mov	w1, #0x4c               // =76
    cd98:      	add	x2, x2, #0xe4e
    cd9c:      	bl	0xb008 <.text+0xa008>
    cda0:      	b	0xcda0 <.text+0xbda0>
    cda4:      	b	0xd95c <.text+0xc95c>
    cda8:      	stp	x22, x21, [sp, #-0x30]!
    cdac:      	stp	x20, x19, [sp, #0x10]
    cdb0:      	stp	x29, x30, [sp, #0x20]
    cdb4:      	add	x29, sp, #0x20
    cdb8:      	adrp	x20, 0x13000
    cdbc:      	add	x20, x20, #0x420
    cdc0:      	ldr	x8, [x20]
    cdc4:      	cmp	x8, x20
    cdc8:      	b.eq	0xce10 <.text+0xbe10>
    cdcc:      	adrp	x21, 0x13000
    cdd0:      	ldr	x22, [x8]
    cdd4:      	ldurb	w9, [x8, #-0x4]
    cdd8:      	cbnz	w9, 0xce04 <.text+0xbe04>
    cddc:      	ldr	x9, [x21, #0x478]
    cde0:      	sub	x19, x8, #0x20
    cde4:      	ldr	x0, [x19]
    cde8:      	ldr	x8, [x9, #0x30]
    cdec:      	ldr	x1, [x19, #0x10]
    cdf0:      	blr	x8
    cdf4:      	add	x0, x19, #0x20
    cdf8:      	bl	0xb9a4 <.text+0xa9a4>
    cdfc:      	mov	x0, x19
    ce00:      	bl	0xbf9c <.text+0xaf9c>
    ce04:      	cmp	x22, x20
    ce08:      	mov	x8, x22
    ce0c:      	b.ne	0xcdd0 <.text+0xbdd0>
    ce10:      	ldp	x29, x30, [sp, #0x20]
    ce14:      	mov	x0, xzr
    ce18:      	ldp	x20, x19, [sp, #0x10]
    ce1c:      	ldp	x22, x21, [sp], #0x30
    ce20:      	ret
    ce24:      	stp	x24, x23, [sp, #-0x40]!
    ce28:      	stp	x22, x21, [sp, #0x10]
    ce2c:      	stp	x20, x19, [sp, #0x20]
    ce30:      	stp	x29, x30, [sp, #0x30]
    ce34:      	add	x29, sp, #0x30
    ce38:      	sub	sp, sp, #0x40
    ce3c:      	mov	x19, x1
    ce40:      	mov	w20, w0
    ce44:      	cbz	x19, 0xd0b0 <.text+0xc0b0>
    ce48:      	adrp	x8, 0x13000
    ce4c:      	mov	w9, #-0x1               // =-1
    ce50:      	sub	x23, x2, #0x1
    ce54:      	add	x8, x8, #0x420
    ce58:      	and	x10, x23, x2
    ce5c:      	str	x9, [sp, #0x38]
    ce60:      	cbz	x10, 0xce80 <.text+0xbe80>
    ce64:      	adrp	x0, 0x11000 <.text+0x10000>
    ce68:      	adrp	x2, 0x11000 <.text+0x10000>
    ce6c:      	add	x0, x0, #0xecb
    ce70:      	mov	w1, #0x68               // =104
    ce74:      	add	x2, x2, #0x8c5
    ce78:      	bl	0xb008 <.text+0xa008>
    ce7c:      	b	0xce7c <.text+0xbe7c>
    ce80:      	mov	x10, xzr
    ce84:      	mov	x9, x8
    ce88:      	b	0xce90 <.text+0xbe90>
    ce8c:      	mov	x10, x0
    ce90:      	ldr	x9, [x9]
    ce94:      	cmp	x9, x8
    ce98:      	b.eq	0xcef8 <.text+0xbef8>
    ce9c:      	ldurb	w11, [x9, #-0x4]
    cea0:      	cbnz	w11, 0xcef0 <.text+0xbef0>
    cea4:      	sub	x11, x9, #0x20
    cea8:      	ldr	w12, [x11, #0x18]
    ceac:      	cmp	w12, w20
    ceb0:      	b.ne	0xcef0 <.text+0xbef0>
    ceb4:      	ldr	x13, [x11]
    ceb8:      	and	x14, x13, x23
    cebc:      	cbnz	x14, 0xcef0 <.text+0xbef0>
    cec0:      	ldr	x12, [x11, #0x10]
    cec4:      	cmp	x12, x19
    cec8:      	b.eq	0xd0cc <.text+0xc0cc>
    cecc:      	b.ls	0xcef0 <.text+0xbef0>
    ced0:      	mov	x0, x11
    ced4:      	cbz	x10, 0xce8c <.text+0xbe8c>
    ced8:      	ldr	x3, [x10, #0x10]
    cedc:      	cmp	x3, x12
    cee0:      	mov	x0, x10
    cee4:      	b.ls	0xce8c <.text+0xbe8c>
    cee8:      	mov	x0, x11
    ceec:      	b	0xce8c <.text+0xbe8c>
    cef0:      	mov	x0, x10
    cef4:      	b	0xce8c <.text+0xbe8c>
    cef8:      	cbz	x10, 0xcf24 <.text+0xbf24>
    cefc:      	ldr	x0, [x10]
    cf00:      	orr	w9, wzr, #0x1
    cf04:      	adrp	x8, 0x13000
    cf08:      	ldr	x5, [x10, #0x10]
    cf0c:      	strb	w9, [x10, #0x1c]
    cf10:      	str	x0, [x10, #0x8]
    cf14:      	ldr	x6, [x8, #0x4a8]
    cf18:      	sub	x7, x6, x5, lsl #12
    cf1c:      	str	x7, [x8, #0x4a8]
    cf20:      	b	0xd0b4 <.text+0xc0b4>
    cf24:      	cmp	x2, #0x1, lsl #12       // =0x1000
    cf28:      	b.ls	0xcf3c <.text+0xbf3c>
    cf2c:      	tst	x2, #0xfff
    cf30:      	add	x19, x19, x2, lsr #12
    cf34:      	cinc	x19, x19, ne
    cf38:      	b	0xcf40 <.text+0xbf40>
    cf3c:      	mov	x23, xzr
    cf40:      	adrp	x24, 0x13000
    cf44:      	orr	w0, wzr, #0x1
    cf48:      	add	x3, sp, #0x38
    cf4c:      	ldr	x13, [x24, #0x478]
    cf50:      	mov	w1, w20
    cf54:      	mov	x2, x19
    cf58:      	ldr	x8, [x13, #0x28]
    cf5c:      	blr	x8
    cf60:      	tbz	x0, #0x3f, 0xcf88 <.text+0xbf88>
    cf64:      	ldr	x14, [x24, #0x478]
    cf68:      	mov	w0, wzr
    cf6c:      	add	x3, sp, #0x38
    cf70:      	mov	w1, w20
    cf74:      	mov	x2, x19
    cf78:      	ldr	x12, [x14, #0x28]
    cf7c:      	blr	x12
    cf80:      	mov	x21, x0
    cf84:      	tbnz	x21, #0x3f, 0xd084 <.text+0xc084>
    cf88:      	adrp	x22, 0x13000
    cf8c:      	ldr	x0, [sp, #0x38]
    cf90:      	mov	x1, sp
    cf94:      	ldr	x15, [x22, #0x498]
    cf98:      	ldr	x2, [x15, #0x38]
    cf9c:      	blr	x2
    cfa0:      	mov	x21, x0
    cfa4:      	tbnz	x21, #0x3f, 0xd058 <.text+0xc058>
    cfa8:      	ldr	x0, [sp, #0x18]
    cfac:      	adrp	x16, 0x13000
    cfb0:      	ldr	x17, [x22, #0x498]
    cfb4:      	lsl	x22, x19, #12
    cfb8:      	orr	w2, wzr, #0x2
    cfbc:      	mov	x1, x22
    cfc0:      	str	x0, [x16, #0x4a0]
    cfc4:      	ldr	x9, [x17, #0x40]
    cfc8:      	ldr	x0, [sp, #0x38]
    cfcc:      	blr	x9
    cfd0:      	mov	x21, x0
    cfd4:      	tbnz	x21, #0x3f, 0xd070 <.text+0xc070>
    cfd8:      	ldr	x0, [sp, #0x38]
    cfdc:      	mov	x1, x22
    cfe0:      	bl	0xc6d8 <.text+0xb6d8>
    cfe4:      	cbz	x0, 0xd000 <.text+0xc000>
    cfe8:      	ldr	x2, [sp, #0x38]
    cfec:      	adrp	x1, 0x11000 <.text+0x10000>
    cff0:      	add	x1, x1, #0xee9
    cff4:      	orr	w0, wzr, #0x80000000
    cff8:      	mov	x3, x22
    cffc:      	bl	0xac7c <.text+0x9c7c>
    d000:      	ldr	x0, [sp, #0x38]
    d004:      	mov	x1, x22
    d008:      	bl	0xd710 <.text+0xc710>
    d00c:      	orr	w0, wzr, #0x30
    d010:      	bl	0xbf44 <.text+0xaf44>
    d014:      	mov	x21, x0
    d018:      	cbz	x21, 0xd0f0 <.text+0xc0f0>
    d01c:      	ldr	x1, [sp, #0x38]
    d020:      	adrp	x0, 0x13000
    d024:      	orr	w10, wzr, #0x1
    d028:      	add	x0, x0, #0x420
    d02c:      	str	x1, [x21]
    d030:      	add	x1, x21, #0x20
    d034:      	ldr	x13, [sp, #0x38]
    d038:      	add	x14, x13, x23
    d03c:      	bic	x15, x14, x23
    d040:      	stp	x15, x19, [x21, #0x8]
    d044:      	strb	w10, [x21, #0x1c]
    d048:      	str	w20, [x21, #0x18]
    d04c:      	bl	0xb898 <.text+0xa898>
    d050:      	ldr	x0, [x21, #0x8]
    d054:      	b	0xd0b4 <.text+0xc0b4>
    d058:      	ldr	x0, [x24, #0x478]
    d05c:      	mov	x1, x19
    d060:      	ldr	x10, [x0, #0x30]
    d064:      	ldr	x0, [sp, #0x38]
    d068:      	blr	x10
    d06c:      	b	0xd084 <.text+0xc084>
    d070:      	ldr	x1, [x24, #0x478]
    d074:      	ldr	x0, [sp, #0x38]
    d078:      	ldr	x11, [x1, #0x30]
    d07c:      	mov	x1, x19
    d080:      	blr	x11
    d084:      	adrp	x1, 0xd000 <.text+0xc000>
    d088:      	add	x1, x1, #0xb94
    d08c:      	orr	w0, wzr, #0x80000000
    d090:      	mov	x2, x21
    d094:      	bl	0xac7c <.text+0x9c7c>
    d098:      	adrp	x0, 0x11000 <.text+0x10000>
    d09c:      	adrp	x2, 0xd000 <.text+0xc000>
    d0a0:      	add	x0, x0, #0xecb
    d0a4:      	mov	w1, #0x185              // =389
    d0a8:      	add	x2, x2, #0xbc8
    d0ac:      	bl	0xb008 <.text+0xa008>
    d0b0:      	mov	x0, xzr
    d0b4:      	sub	sp, x29, #0x30
    d0b8:      	ldp	x29, x30, [sp, #0x30]
    d0bc:      	ldp	x20, x19, [sp, #0x20]
    d0c0:      	ldp	x22, x21, [sp, #0x10]
    d0c4:      	ldp	x24, x23, [sp], #0x40
    d0c8:      	ret
    d0cc:      	ldr	x0, [x11]
    d0d0:      	orr	w8, wzr, #0x1
    d0d4:      	adrp	x12, 0x13000
    d0d8:      	strb	w8, [x11, #0x1c]
    d0dc:      	str	x0, [x11, #0x8]
    d0e0:      	ldr	x16, [x12, #0x4a8]
    d0e4:      	sub	x17, x16, x19, lsl #12
    d0e8:      	str	x17, [x12, #0x4a8]
    d0ec:      	b	0xd0b4 <.text+0xc0b4>
    d0f0:      	adrp	x0, 0x11000 <.text+0x10000>
    d0f4:      	adrp	x2, 0x11000 <.text+0x10000>
    d0f8:      	add	x0, x0, #0xecb
    d0fc:      	mov	w1, #0xc9               // =201
    d100:      	add	x2, x2, #0xbdb
    d104:      	bl	0xb008 <.text+0xa008>
    d108:      	b	0xd108 <.text+0xc108>
    d10c:      	cbz	x0, 0xd14c <.text+0xc14c>
    d110:      	adrp	x9, 0x13000
    d114:      	add	x9, x9, #0x420
    d118:      	mov	x8, x9
    d11c:      	ldr	x8, [x8]
    d120:      	cmp	x8, x9
    d124:      	b.eq	0xd14c <.text+0xc14c>
    d128:      	ldur	x11, [x8, #-0x18]
    d12c:      	cmp	x11, x0
    d130:      	b.ne	0xd11c <.text+0xc11c>
    d134:      	adrp	x9, 0x13000
    d138:      	sturb	wzr, [x8, #-0x4]
    d13c:      	ldur	x8, [x8, #-0x10]
    d140:      	ldr	x13, [x9, #0x4a8]
    d144:      	add	x14, x13, x8, lsl #12
    d148:      	str	x14, [x9, #0x4a8]
    d14c:      	ret
    d150:      	sub	x8, x2, #0x1
    d154:      	and	x8, x8, x2
    d158:      	cbz	x8, 0xd184 <.text+0xc184>
    d15c:      	stp	x29, x30, [sp, #-0x10]!
    d160:      	mov	x29, sp
    d164:      	adrp	x0, 0x11000 <.text+0x10000>
    d168:      	adrp	x2, 0x11000 <.text+0x10000>
    d16c:      	add	x0, x0, #0xecb
    d170:      	mov	w1, #0x1a4              // =420
    d174:      	add	x2, x2, #0x8c5
    d178:      	bl	0xb008 <.text+0xa008>
    d17c:      	ldp	x29, x30, [sp], #0x10
    d180:      	b	0xd180 <.text+0xc180>
    d184:      	cmp	x2, #0x1, lsl #12       // =0x1000
    d188:      	orr	w10, wzr, #0x1000
    d18c:      	csel	x2, x10, x2, lo
    d190:      	tst	x1, #0xfff
    d194:      	lsr	x12, x1, #12
    d198:      	cinc	x1, x12, ne
    d19c:      	b	0xce24 <.text+0xbe24>
    d1a0:      	mov	x8, x0
    d1a4:      	mov	x9, x1
    d1a8:      	orr	w0, wzr, #0x4
    d1ac:      	mov	x1, x8
    d1b0:      	mov	x2, x9
    d1b4:      	b	0xd150 <.text+0xc150>
    d1b8:      	b	0xd10c <.text+0xc10c>
    d1bc:      	stp	x20, x19, [sp, #-0x20]!
    d1c0:      	stp	x29, x30, [sp, #0x10]
    d1c4:      	add	x29, sp, #0x10
    d1c8:      	mov	x19, x1
    d1cc:      	mov	w20, w0
    d1d0:      	bl	0xd690 <.text+0xc690>
    d1d4:      	ldp	x29, x30, [sp, #0x10]
    d1d8:      	mov	x2, x0
    d1dc:      	mov	w0, w20
    d1e0:      	mov	x1, x19
    d1e4:      	ldp	x20, x19, [sp], #0x20
    d1e8:      	b	0xd150 <.text+0xc150>
    d1ec:      	mov	x8, x0
    d1f0:      	orr	w0, wzr, #0x4
    d1f4:      	mov	x1, x8
    d1f8:      	b	0xd1bc <.text+0xc1bc>
    d1fc:      	b	0xd10c <.text+0xc10c>
    d200:      	ldr	w9, [x0, #0x10]
    d204:      	orr	w8, wzr, #0x1000000
    d208:      	and	w9, w9, #0x10000000
    d20c:      	orr	w10, w9, #0x100000
    d210:      	str	w10, [x0, #0x10]
    d214:      	ldr	w10, [x0, #0x10]
    d218:      	and	w11, w10, #0x100000
    d21c:      	orr	w12, w11, #0x10000000
    d220:      	str	w12, [x0, #0x10]
    d224:      	ldr	wzr, [x0, #0x30]
    d228:      	str	w8, [x0, #0x30]
    d22c:      	ret
    d230:      	ldr	w8, [x0, #0x10]
    d234:      	and	w8, w8, #0x10000000
    d238:      	str	w8, [x0, #0x10]
    d23c:      	ldr	w9, [x0, #0x10]
    d240:      	and	w9, w9, #0x100000
    d244:      	str	w9, [x0, #0x10]
    d248:      	ldr	wzr, [x0, #0x30]
    d24c:      	str	wzr, [x0, #0x30]
    d250:      	ret
    d254:      	stp	x22, x21, [sp, #-0x30]!
    d258:      	stp	x20, x19, [sp, #0x10]
    d25c:      	stp	x29, x30, [sp, #0x20]
    d260:      	add	x29, sp, #0x20
    d264:      	sub	sp, sp, #0x10
    d268:      	adrp	x21, 0x13000
    d26c:      	orr	w9, wzr, #0x8
    d270:      	mov	x20, x1
    d274:      	ldr	x8, [x21, #0x4b0]
    d278:      	str	w9, [sp, #0xc]
    d27c:      	cbnz	x8, 0xd2b0 <.text+0xc2b0>
    d280:      	adrp	x10, 0x13000
    d284:      	adrp	x0, 0x13000
    d288:      	adrp	x2, 0x13000
    d28c:      	ldr	x11, [x10, #0x478]
    d290:      	mov	x1, xzr
    d294:      	add	x0, x0, #0x150
    d298:      	add	x2, x2, #0x4b0
    d29c:      	ldr	x8, [x11, #0x140]
    d2a0:      	blr	x8
    d2a4:      	mov	x19, x0
    d2a8:      	tbnz	x19, #0x3f, 0xd2f8 <.text+0xc2f8>
    d2ac:      	ldr	x8, [x21, #0x4b0]
    d2b0:      	ldr	x9, [x8, #0x10]
    d2b4:      	orr	w0, wzr, #0x1
    d2b8:      	add	x1, sp, #0xc
    d2bc:      	blr	x9
    d2c0:      	mov	x19, x0
    d2c4:      	tbnz	x19, #0x3f, 0xd2ec <.text+0xc2ec>
    d2c8:      	ldr	w9, [sp, #0xc]
    d2cc:      	cmp	w9, #0x8
    d2d0:      	b.hi	0xd338 <.text+0xc338>
    d2d4:      	adrp	x12, 0x11000 <.text+0x10000>
    d2d8:      	add	x12, x12, #0xf10
    d2dc:      	ldr	x10, [x12, x9, lsl #3]
    d2e0:      	br	x10
    d2e4:      	str	wzr, [x20]
    d2e8:      	b	0xd34c <.text+0xc34c>
    d2ec:      	adrp	x1, 0x12000 <.text+0x11000>
    d2f0:      	add	x1, x1, #0x8
    d2f4:      	b	0xd304 <.text+0xc304>
    d2f8:      	adrp	x1, 0x11000 <.text+0x10000>
    d2fc:      	str	xzr, [x21, #0x4b0]
    d300:      	add	x1, x1, #0xfd4
    d304:      	orr	w0, wzr, #0x80000000
    d308:      	mov	x2, x19
    d30c:      	bl	0xac7c <.text+0x9c7c>
    d310:      	b	0xd34c <.text+0xc34c>
    d314:      	orr	w13, wzr, #0x7
    d318:      	str	w13, [x20]
    d31c:      	b	0xd34c <.text+0xc34c>
    d320:      	orr	w10, wzr, #0x1
    d324:      	str	w10, [x20]
    d328:      	b	0xd34c <.text+0xc34c>
    d32c:      	orr	w11, wzr, #0x2
    d330:      	str	w11, [x20]
    d334:      	b	0xd34c <.text+0xc34c>
    d338:      	orr	w14, wzr, #0x8
    d33c:      	str	w14, [x20]
    d340:      	b	0xd34c <.text+0xc34c>
    d344:      	orr	w12, wzr, #0x8
    d348:      	str	w12, [x20]
    d34c:      	mov	x0, x19
    d350:      	sub	sp, x29, #0x20
    d354:      	ldp	x29, x30, [sp, #0x20]
    d358:      	ldp	x20, x19, [sp, #0x10]
    d35c:      	ldp	x22, x21, [sp], #0x30
    d360:      	ret
    d364:      	mov	x8, x0
    d368:      	b	0xd374 <.text+0xc374>
    d36c:      	strb	w1, [x8], #0x1
    d370:      	sub	w2, w2, #0x1
    d374:      	cbnz	w2, 0xd36c <.text+0xc36c>
    d378:      	ret
    d37c:      	stp	x20, x19, [sp, #-0x20]!
    d380:      	stp	x29, x30, [sp, #0x10]
    d384:      	add	x29, sp, #0x10
    d388:      	adrp	x19, 0x13000
    d38c:      	ldr	x9, [x19, #0x4b8]
    d390:      	cbnz	x9, 0xd3c8 <.text+0xc3c8>
    d394:      	adrp	x9, 0x13000
    d398:      	ldr	x8, [x9, #0x478]
    d39c:      	cbz	x8, 0xd3c8 <.text+0xc3c8>
    d3a0:      	ldr	x8, [x8, #0x140]
    d3a4:      	cbz	x8, 0xd3c8 <.text+0xc3c8>
    d3a8:      	adrp	x0, 0x13000
    d3ac:      	adrp	x2, 0x13000
    d3b0:      	mov	x1, xzr
    d3b4:      	add	x0, x0, #0xf0
    d3b8:      	add	x2, x2, #0x4b8
    d3bc:      	blr	x8
    d3c0:      	tbz	x0, #0x3f, 0xd3c8 <.text+0xc3c8>
    d3c4:      	str	xzr, [x19, #0x4b8]
    d3c8:      	ldp	x29, x30, [sp, #0x10]
    d3cc:      	ldp	x20, x19, [sp], #0x20
    d3d0:      	ret
    d3d4:      	stp	x24, x23, [sp, #-0x40]!
    d3d8:      	stp	x22, x21, [sp, #0x10]
    d3dc:      	stp	x20, x19, [sp, #0x20]
    d3e0:      	stp	x29, x30, [sp, #0x30]
    d3e4:      	add	x29, sp, #0x30
    d3e8:      	adrp	x9, 0xd000 <.text+0xc000>
    d3ec:      	mov	w21, w0
    d3f0:      	mov	x19, x4
    d3f4:      	ldrb	w8, [x9, #0xc58]
    d3f8:      	mov	x20, x3
    d3fc:      	mov	w22, w2
    d400:      	mov	w23, w1
    d404:      	and	w9, w21, #0xff
    d408:      	cmp	w9, #0x1
    d40c:      	b.ne	0xd418 <.text+0xc418>
    d410:      	and	w10, w8, #0x1
    d414:      	cbnz	w10, 0xd440 <.text+0xc440>
    d418:      	cmp	w9, #0x2
    d41c:      	b.ne	0xd42c <.text+0xc42c>
    d420:      	and	w11, w8, #0x2
    d424:      	and	w12, w11, #0xff
    d428:      	cbnz	w12, 0xd440 <.text+0xc440>
    d42c:      	cmp	w9, #0x3
    d430:      	b.ne	0xd47c <.text+0xc47c>
    d434:      	and	w8, w8, #0x4
    d438:      	and	w9, w8, #0xff
    d43c:      	cbz	w9, 0xd47c <.text+0xc47c>
    d440:      	bl	0xd37c <.text+0xc37c>
    d444:      	adrp	x10, 0x13000
    d448:      	ldr	x8, [x10, #0x4b8]
    d44c:      	cbz	x8, 0xd47c <.text+0xc47c>
    d450:      	ldr	x5, [x8]
    d454:      	mov	w0, w21
    d458:      	mov	w2, w22
    d45c:      	mov	x3, x20
    d460:      	mov	x4, x19
    d464:      	ldp	x29, x30, [sp, #0x30]
    d468:      	mov	w1, w23
    d46c:      	ldp	x20, x19, [sp, #0x20]
    d470:      	ldp	x22, x21, [sp, #0x10]
    d474:      	ldp	x24, x23, [sp], #0x40
    d478:      	br	x5
    d47c:      	ldp	x29, x30, [sp, #0x30]
    d480:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    d484:      	ldp	x20, x19, [sp, #0x20]
    d488:      	ldp	x22, x21, [sp, #0x10]
    d48c:      	ldp	x24, x23, [sp], #0x40
    d490:      	ret
    d494:      	adrp	x8, 0xd000 <.text+0xc000>
    d498:      	ldrb	w8, [x8, #0xc58]
    d49c:      	and	w0, w8, #0x1
    d4a0:      	ret
    d4a4:      	adrp	x8, 0xd000 <.text+0xc000>
    d4a8:      	ldrb	w8, [x8, #0xc58]
    d4ac:      	ubfx	w0, w8, #1, #1
    d4b0:      	ret
    d4b4:      	adrp	x8, 0xd000 <.text+0xc000>
    d4b8:      	ldrb	w8, [x8, #0xc58]
    d4bc:      	ubfx	w0, w8, #2, #1
    d4c0:      	ret
    d4c4:      	stp	x28, x27, [sp, #-0x60]!
    d4c8:      	stp	x26, x25, [sp, #0x10]
    d4cc:      	stp	x24, x23, [sp, #0x20]
    d4d0:      	stp	x22, x21, [sp, #0x30]
    d4d4:      	stp	x20, x19, [sp, #0x40]
    d4d8:      	stp	x29, x30, [sp, #0x50]
    d4dc:      	add	x29, sp, #0x50
    d4e0:      	sub	sp, sp, #0x210
    d4e4:      	mov	x23, x6
    d4e8:      	mov	x24, x5
    d4ec:      	mov	x25, x4
    d4f0:      	mov	x21, x3
    d4f4:      	mov	w19, w2
    d4f8:      	mov	w20, w1
    d4fc:      	mov	w22, w0
    d500:      	cbnz	x24, 0xd524 <.text+0xc524>
    d504:      	cbz	x23, 0xd524 <.text+0xc524>
    d508:      	adrp	x0, 0x12000 <.text+0x11000>
    d50c:      	adrp	x2, 0x12000 <.text+0x11000>
    d510:      	add	x0, x0, #0x3b
    d514:      	add	x2, x2, #0x13a
    d518:      	orr	w1, wzr, #0x1f0
    d51c:      	bl	0xb008 <.text+0xa008>
    d520:      	b	0xd520 <.text+0xc520>
    d524:      	cbz	x24, 0xd548 <.text+0xc548>
    d528:      	cbnz	x23, 0xd548 <.text+0xc548>
    d52c:      	adrp	x0, 0x12000 <.text+0x11000>
    d530:      	adrp	x2, 0x12000 <.text+0x11000>
    d534:      	add	x0, x0, #0x3b
    d538:      	mov	w1, #0x1f1              // =497
    d53c:      	add	x2, x2, #0x177
    d540:      	bl	0xb008 <.text+0xa008>
    d544:      	b	0xd544 <.text+0xc544>
    d548:      	adrp	x27, 0x13000
    d54c:      	ldr	x9, [x27, #0x478]
    d550:      	cbz	x9, 0xd5d0 <.text+0xc5d0>
    d554:      	ldr	x10, [x9, #0x40]
    d558:      	cbz	x10, 0xd5d0 <.text+0xc5d0>
    d55c:      	ldr	x11, [x9, #0x48]
    d560:      	cbz	x11, 0xd5d0 <.text+0xc5d0>
    d564:      	ldr	x9, [x9, #0x18]
    d568:      	orr	w0, wzr, #0x1f
    d56c:      	blr	x9
    d570:      	ldr	x10, [x27, #0x478]
    d574:      	mov	x26, x0
    d578:      	ldr	x12, [x10, #0x20]
    d57c:      	blr	x12
    d580:      	cmp	x26, #0x10
    d584:      	stur	xzr, [x29, #-0x58]
    d588:      	b.hi	0xd5ac <.text+0xc5ac>
    d58c:      	ldr	x11, [x27, #0x478]
    d590:      	add	x1, x23, #0x14
    d594:      	orr	w0, wzr, #0x4
    d598:      	sub	x2, x29, #0x58
    d59c:      	ldr	x14, [x11, #0x40]
    d5a0:      	blr	x14
    d5a4:      	ldur	x8, [x29, #-0x58]
    d5a8:      	cbnz	x8, 0xd600 <.text+0xc600>
    d5ac:      	cmp	x23, #0x1ed
    d5b0:      	b.lo	0xd5f8 <.text+0xc5f8>
    d5b4:      	adrp	x1, 0x12000 <.text+0x11000>
    d5b8:      	add	x1, x1, #0x1b4
    d5bc:      	orr	w0, wzr, #0x80000000
    d5c0:      	bl	0xac7c <.text+0x9c7c>
    d5c4:      	mov	x24, #-0x8000000000000000 // =-9223372036854775808
    d5c8:      	movk	x24, #0x9
    d5cc:      	b	0xd5d4 <.text+0xc5d4>
    d5d0:      	mov	x24, #-0x7ffffffffffffffd // =-9223372036854775805
    d5d4:      	mov	x0, x24
    d5d8:      	sub	sp, x29, #0x50
    d5dc:      	ldp	x29, x30, [sp, #0x50]
    d5e0:      	ldp	x20, x19, [sp, #0x40]
    d5e4:      	ldp	x22, x21, [sp, #0x30]
    d5e8:      	ldp	x24, x23, [sp, #0x20]
    d5ec:      	ldp	x26, x25, [sp, #0x10]
    d5f0:      	ldp	x28, x27, [sp], #0x60
    d5f4:      	ret
    d5f8:      	mov	x8, sp
    d5fc:      	stur	x8, [x29, #-0x58]
    d600:      	mov	w9, #0x14               // =20
    d604:      	adrp	x16, 0x13000
    d608:      	add	x16, x16, #0x40
    d60c:      	strh	w9, [x8]
    d610:      	cmp	x25, #0x0
    d614:      	ldur	x12, [x29, #-0x58]
    d618:      	csel	x1, x16, x25, eq
    d61c:      	strh	w23, [x12, #0x2]
    d620:      	ldur	x13, [x29, #-0x58]
    d624:      	add	x0, x13, #0x4
    d628:      	bl	0xd770 <.text+0xc770>
    d62c:      	cbz	x24, 0xd644 <.text+0xc644>
    d630:      	ldur	x14, [x29, #-0x58]
    d634:      	mov	x1, x24
    d638:      	mov	x2, x23
    d63c:      	add	x0, x14, #0x14
    d640:      	bl	0xb25c <.text+0xa25c>
    d644:      	adrp	x5, 0x13000
    d648:      	ldur	x4, [x29, #-0x58]
    d64c:      	add	x5, x5, #0x8
    d650:      	cmp	x21, #0x0
    d654:      	csel	x3, x5, x21, eq
    d658:      	mov	w0, w22
    d65c:      	mov	w1, w20
    d660:      	mov	w2, w19
    d664:      	bl	0xd3d4 <.text+0xc3d4>
    d668:      	ldur	x8, [x29, #-0x58]
    d66c:      	mov	x24, x0
    d670:      	mov	x15, sp
    d674:      	cmp	x8, x15
    d678:      	b.eq	0xd5d4 <.text+0xc5d4>
    d67c:      	ldr	x16, [x27, #0x478]
    d680:      	mov	x0, x8
    d684:      	ldr	x2, [x16, #0x48]
    d688:      	blr	x2
    d68c:      	b	0xd5d4 <.text+0xc5d4>
    d690:      	stp	x29, x30, [sp, #-0x10]!
    d694:      	mov	x29, sp
    d698:      	bl	0xabc8 <.text+0x9bc8>
    d69c:      	ubfx	w8, w0, #16, #4
    d6a0:      	orr	w9, wzr, #0x4
    d6a4:      	lsl	w0, w9, w8
    d6a8:      	ldp	x29, x30, [sp], #0x10
    d6ac:      	ret
    d6b0:      	stp	x22, x21, [sp, #-0x30]!
    d6b4:      	stp	x20, x19, [sp, #0x10]
    d6b8:      	stp	x29, x30, [sp, #0x20]
    d6bc:      	add	x29, sp, #0x20
    d6c0:      	mov	x22, x1
    d6c4:      	mov	x19, x0
    d6c8:      	bl	0xd690 <.text+0xc690>
    d6cc:      	mov	x20, x0
    d6d0:      	neg	x8, x20
    d6d4:      	and	x21, x19, x8
    d6d8:      	add	x22, x19, x22
    d6dc:      	b	0xd6ec <.text+0xc6ec>
    d6e0:      	mov	x0, x21
    d6e4:      	bl	0xab64 <.text+0x9b64>
    d6e8:      	add	x21, x21, x20
    d6ec:      	cmp	x21, x22
    d6f0:      	b.lo	0xd6e0 <.text+0xc6e0>
    d6f4:      	bl	0xaba8 <.text+0x9ba8>
    d6f8:      	bl	0xabb0 <.text+0x9bb0>
    d6fc:      	mov	x0, x19
    d700:      	ldp	x29, x30, [sp, #0x20]
    d704:      	ldp	x20, x19, [sp, #0x10]
    d708:      	ldp	x22, x21, [sp], #0x30
    d70c:      	ret
    d710:      	stp	x22, x21, [sp, #-0x30]!
    d714:      	stp	x20, x19, [sp, #0x10]
    d718:      	stp	x29, x30, [sp, #0x20]
    d71c:      	add	x29, sp, #0x20
    d720:      	mov	x22, x1
    d724:      	mov	x19, x0
    d728:      	bl	0xd690 <.text+0xc690>
    d72c:      	mov	x20, x0
    d730:      	neg	x8, x20
    d734:      	and	x21, x19, x8
    d738:      	add	x22, x19, x22
    d73c:      	b	0xd74c <.text+0xc74c>
    d740:      	mov	x0, x21
    d744:      	bl	0xab5c <.text+0x9b5c>
    d748:      	add	x21, x21, x20
    d74c:      	cmp	x21, x22
    d750:      	b.lo	0xd740 <.text+0xc740>
    d754:      	bl	0xaba8 <.text+0x9ba8>
    d758:      	bl	0xabb0 <.text+0x9bb0>
    d75c:      	mov	x0, x19
    d760:      	ldp	x29, x30, [sp, #0x20]
    d764:      	ldp	x20, x19, [sp, #0x10]
    d768:      	ldp	x22, x21, [sp], #0x30
    d76c:      	ret
    d770:      	stp	x29, x30, [sp, #-0x10]!
    d774:      	mov	x29, sp
    d778:      	cbz	x0, 0xd78c <.text+0xc78c>
    d77c:      	cbz	x1, 0xd7a8 <.text+0xc7a8>
    d780:      	orr	w2, wzr, #0x10
    d784:      	ldp	x29, x30, [sp], #0x10
    d788:      	b	0xb63c <.text+0xa63c>
    d78c:      	adrp	x0, 0x12000 <.text+0x11000>
    d790:      	adrp	x2, 0x12000 <.text+0x11000>
    d794:      	add	x0, x0, #0x1ec
    d798:      	mov	w1, #0x2f               // =47
    d79c:      	add	x2, x2, #0x1f9
    d7a0:      	bl	0xb008 <.text+0xa008>
    d7a4:      	b	0xd7a4 <.text+0xc7a4>
    d7a8:      	adrp	x0, 0x12000 <.text+0x11000>
    d7ac:      	adrp	x2, 0x12000 <.text+0x11000>
    d7b0:      	add	x0, x0, #0x1ec
    d7b4:      	add	x2, x2, #0x219
    d7b8:      	orr	w1, wzr, #0x30
    d7bc:      	bl	0xb008 <.text+0xa008>
    d7c0:      	b	0xd7c0 <.text+0xc7c0>
    d7c4:      	stp	x29, x30, [sp, #-0x10]!
    d7c8:      	mov	x29, sp
    d7cc:      	cbz	x0, 0xd7dc <.text+0xc7dc>
    d7d0:      	cbz	x1, 0xd7f8 <.text+0xc7f8>
    d7d4:      	ldp	x29, x30, [sp], #0x10
    d7d8:      	b	0xd820 <.text+0xc820>
    d7dc:      	adrp	x0, 0x12000 <.text+0x11000>
    d7e0:      	adrp	x2, 0x12000 <.text+0x11000>
    d7e4:      	add	x0, x0, #0x1ec
    d7e8:      	mov	w1, #0x4c               // =76
    d7ec:      	add	x2, x2, #0x234
    d7f0:      	bl	0xb008 <.text+0xa008>
    d7f4:      	b	0xd7f4 <.text+0xc7f4>
    d7f8:      	adrp	x0, 0x12000 <.text+0x11000>
    d7fc:      	adrp	x2, 0x12000 <.text+0x11000>
    d800:      	add	x0, x0, #0x1ec
    d804:      	mov	w1, #0x4d               // =77
    d808:      	add	x2, x2, #0x24a
    d80c:      	bl	0xb008 <.text+0xa008>
    d810:      	b	0xd810 <.text+0xc810>
		...
    d820:      	mov	x2, xzr
    d824:      	ldp	x3, x4, [x0]
    d828:      	cbz	x1, 0xd830 <.text+0xc830>
    d82c:      	ldp	x1, x2, [x1]
    d830:      	cmp	x1, x3
    d834:      	ccmp	x2, x4, #0x0, eq
    d838:      	cset	w0, eq
    d83c:      	ret
    d840:      	stp	x20, x19, [sp, #-0x20]!
    d844:      	stp	x29, x30, [sp, #0x10]
    d848:      	add	x29, sp, #0x10
    d84c:      	cbz	x0, 0xd86c <.text+0xc86c>
    d850:      	mov	x19, xzr
    d854:      	b	0xd864 <.text+0xc864>
    d858:      	orr	w1, wzr, #0x1
    d85c:      	add	x19, x19, #0x1
    d860:      	bl	0xbcfc <.text+0xacfc>
    d864:      	tbz	w0, #0x0, 0xd858 <.text+0xc858>
    d868:      	b	0xd870 <.text+0xc870>
    d86c:      	mov	x19, #-0x1              // =-1
    d870:      	ldp	x29, x30, [sp, #0x10]
    d874:      	mov	x0, x19
    d878:      	ldp	x20, x19, [sp], #0x20
    d87c:      	ret
    d880:      	stp	x29, x30, [sp, #-0x10]!
    d884:      	mov	x29, sp
    d888:      	sub	sp, sp, #0x10
    d88c:      	add	x1, sp, #0x8
    d890:      	str	xzr, [sp, #0x8]
    d894:      	mov	w0, wzr
    d898:      	bl	0xda40 <.text+0xca40>
    d89c:      	ldr	x0, [sp, #0x8]
    d8a0:      	mov	sp, x29
    d8a4:      	ldp	x29, x30, [sp], #0x10
    d8a8:      	ret
    d8ac:      	udf	#0x0
    d8b0:      	ldr	x0, 0xd9d0 <.text+0xc9d0>
    d8b4:      	str	xzr, [x0]
    d8b8:      	bl	0xab64 <.text+0x9b64>
    d8bc:      	dsb	sy
    d8c0:      	isb
    d8c4:      	ldr	x0, 0xd9d8 <.text+0xc9d8>
    d8c8:      	ldr	x2, 0xd9e0 <.text+0xc9e0>
    d8cc:      	mov	x3, #0x8                // =8
    d8d0:      	smc	#0
    d8d4:      	cmp	w0, #0x0
    d8d8:      	b.gt	0xd8d0 <.text+0xc8d0>
    d8dc:      	cmp	w0, #0x0
    d8e0:      	b.ne	0xd8fc <.text+0xc8fc>
    d8e4:      	ldr	x0, 0xd9e8 <.text+0xc9e8>
    d8e8:      	bl	0xab5c <.text+0x9b5c>
    d8ec:      	dsb	sy
    d8f0:      	isb
    d8f4:      	ldr	x1, 0xd9f0 <.text+0xc9f0>
    d8f8:      	ldr	x0, [x1]
    d8fc:      	ldp	x29, x30, [sp], #0x10
    d900:      	ret
    d904:      	ldr	x0, 0xd9f8 <.text+0xc9f8>
    d908:      	str	xzr, [x0]
    d90c:      	bl	0xab64 <.text+0x9b64>
    d910:      	dsb	sy
    d914:      	isb
    d918:      	ldr	x0, 0xda00 <.text+0xca00>
    d91c:      	mov	x1, #0x22               // =34
    d920:      	ldr	x2, 0xda08 <.text+0xca08>
    d924:      	mov	x3, #0x8                // =8
    d928:      	smc	#0
    d92c:      	cmp	w0, #0x0
    d930:      	b.gt	0xd928 <.text+0xc928>
    d934:      	cmp	w0, #0x0
    d938:      	b.ne	0xd954 <.text+0xc954>
    d93c:      	ldr	x0, 0xda10 <.text+0xca10>
    d940:      	bl	0xab5c <.text+0x9b5c>
    d944:      	dsb	sy
    d948:      	isb
    d94c:      	ldr	x1, 0xda18 <.text+0xca18>
    d950:      	ldr	x0, [x1]
    d954:      	ldp	x29, x30, [sp], #0x10
    d958:      	ret
    d95c:      	stp	x29, x30, [sp, #-0x10]!
    d960:      	mov	x29, sp
    d964:      	ldr	x0, 0xda20 <.text+0xca20>
    d968:      	ldr	x0, [x0]
    d96c:      	adr	x1, 0xd978 <.text+0xc978>
    d970:      	ldr	x2, [x1, x0]
    d974:      	br	x2
    d978:      	udf	#0xd990
    d97c:      	udf	#0x0
    d980:      	udf	#0xd8b0
    d984:      	udf	#0x0
    d988:      	udf	#0xd904
    d98c:      	udf	#0x0
    d990:      	ldr	x0, 0xda28 <.text+0xca28>
    d994:      	mov	x1, #0x1                // =1
    d998:      	ldr	x2, 0xda30 <.text+0xca30>
    d99c:      	smc	#0
    d9a0:      	cmp	w0, #0x0
    d9a4:      	b.gt	0xd99c <.text+0xc99c>
    d9a8:      	cmp	w0, #0x0
    d9ac:      	ldr	x1, 0xda38 <.text+0xca38>
    d9b0:      	b.ne	0xd9c0 <.text+0xc9c0>
    d9b4:      	mov	x0, #0x10               // =16
    d9b8:      	str	x0, [x1]
    d9bc:      	b	0xd904 <.text+0xc904>
    d9c0:      	mov	x0, #0x8                // =8
    d9c4:      	str	x0, [x1]
    d9c8:      	b	0xd8b0 <.text+0xc8b0>
    d9cc:      	nop
    d9d0:      	<unknown>
    d9d4:      	udf	#0x0
    d9d8:      	<unknown>
    d9dc:      	udf	#0x0
    d9e0:      	<unknown>
    d9e4:      	udf	#0x0
    d9e8:      	<unknown>
    d9ec:      	udf	#0x0
    d9f0:      	<unknown>
    d9f4:      	udf	#0x0
    d9f8:      	<unknown>
    d9fc:      	udf	#0x0
    da00:      	<unknown>
    da04:      	udf	#0x0
    da08:      	<unknown>
    da0c:      	udf	#0x0
    da10:      	<unknown>
    da14:      	udf	#0x0
    da18:      	<unknown>
    da1c:      	udf	#0x0
    da20:      	<unknown>
    da24:      	udf	#0x0
    da28:      	<unknown>
    da2c:      	udf	#0x0
    da30:      	<unknown>
    da34:      	udf	#0x0
    da38:      	<unknown>
    da3c:      	udf	#0x0
    da40:      	stp	x20, x19, [sp, #-0x20]!
    da44:      	stp	x29, x30, [sp, #0x10]
    da48:      	add	x29, sp, #0x10
    da4c:      	mov	x19, x1
    da50:      	mov	w20, w0
    da54:      	bl	0xabb8 <.text+0x9bb8>
    da58:      	cbz	x0, 0xda90 <.text+0xca90>
    da5c:      	mov	w8, w20
    da60:      	cmp	w20, #0xe
    da64:      	b.hi	0xdabc <.text+0xcabc>
    da68:      	adrp	x9, 0x12000 <.text+0x11000>
    da6c:      	add	x9, x9, #0x2c0
    da70:      	ldr	x9, [x9, x8, lsl #3]
    da74:      	br	x9
    da78:      	ldp	x29, x30, [sp, #0x10]
    da7c:      	adrp	x1, 0x12000 <.text+0x11000>
    da80:      	add	x1, x1, #0x338
    da84:      	orr	w0, wzr, #0x80000000
    da88:      	ldp	x20, x19, [sp], #0x20
    da8c:      	b	0xac7c <.text+0x9c7c>
    da90:      	adrp	x1, 0x12000 <.text+0x11000>
    da94:      	add	x1, x1, #0x3b2
    da98:      	orr	w0, wzr, #0x80000000
    da9c:      	bl	0xac7c <.text+0x9c7c>
    daa0:      	adrp	x0, 0x12000 <.text+0x11000>
    daa4:      	adrp	x2, 0x11000 <.text+0x10000>
    daa8:      	add	x0, x0, #0x415
    daac:      	mov	w1, #0x5e               // =94
    dab0:      	add	x2, x2, #0xe70
    dab4:      	bl	0xb008 <.text+0xa008>
    dab8:      	b	0xdab8 <.text+0xcab8>
    dabc:      	ldp	x29, x30, [sp, #0x10]
    dac0:      	adrp	x1, 0x12000 <.text+0x11000>
    dac4:      	add	x1, x1, #0x388
    dac8:      	orr	w0, wzr, #0x80000000
    dacc:      	mov	w2, w20
    dad0:      	ldp	x20, x19, [sp], #0x20
    dad4:      	b	0xac7c <.text+0x9c7c>
    dad8:      	bl	0xdb3c <.text+0xcb3c>
    dadc:      	b	0xdb2c <.text+0xcb2c>
    dae0:      	bl	0xdb44 <.text+0xcb44>
    dae4:      	b	0xdb2c <.text+0xcb2c>
    dae8:      	bl	0xdb4c <.text+0xcb4c>
    daec:      	b	0xdb2c <.text+0xcb2c>
    daf0:      	bl	0xdb54 <.text+0xcb54>
    daf4:      	b	0xdb2c <.text+0xcb2c>
    daf8:      	bl	0xdb5c <.text+0xcb5c>
    dafc:      	b	0xdb2c <.text+0xcb2c>
    db00:      	bl	0xdb64 <.text+0xcb64>
    db04:      	b	0xdb2c <.text+0xcb2c>
    db08:      	bl	0xdb6c <.text+0xcb6c>
    db0c:      	b	0xdb2c <.text+0xcb2c>
    db10:      	bl	0xdb74 <.text+0xcb74>
    db14:      	b	0xdb2c <.text+0xcb2c>
    db18:      	bl	0xdb7c <.text+0xcb7c>
    db1c:      	b	0xdb2c <.text+0xcb2c>
    db20:      	bl	0xdb84 <.text+0xcb84>
    db24:      	b	0xdb2c <.text+0xcb2c>
    db28:      	bl	0xdb8c <.text+0xcb8c>
    db2c:      	str	x0, [x19]
    db30:      	ldp	x29, x30, [sp, #0x10]
    db34:      	ldp	x20, x19, [sp], #0x20
    db38:      	ret
    db3c:      	mrs	x0, CNTFRQ_EL0
    db40:      	ret
    db44:      	mrs	x0, CNTPCT_EL0
    db48:      	ret
    db4c:      	mrs	x0, CNTKCTL_EL1
    db50:      	ret
    db54:      	mrs	x0, CNTP_TVAL_EL0
    db58:      	ret
    db5c:      	mrs	x0, CNTP_CTL_EL0
    db60:      	ret
    db64:      	mrs	x0, CNTV_TVAL_EL0
    db68:      	ret
    db6c:      	mrs	x0, CNTV_CTL_EL0
    db70:      	ret
    db74:      	mrs	x0, CNTVCT_EL0
    db78:      	ret
    db7c:      	mrs	x0, CNTP_CVAL_EL0
    db80:      	ret
    db84:      	mrs	x0, CNTV_CVAL_EL0
    db88:      	ret
    db8c:      	mrs	x0, CNTVOFF_EL2
    db90:      	ret
    db94:      	<unknown>
    db98:      	<unknown>
    db9c:      	<unknown>
    dba0:      	<unknown>
    dba4:      	<unknown>
    dba8:      	<unknown>
    dbac:      	<unknown>
    dbb0:      	bic	w5, w17, w9, lsl #28
    dbb4:      	ldpsw	x0, x17, [x0, #-0x70]
    dbb8:      	addhnt	z22.b, z11.h, z18.h
    dbbc:      	ldrh	w14, [x3, #0x193a]
    dbc0:      	umin	v16.8h, v26.8h, v9.8h
    dbc4:      	<unknown>
    dbc8:      	<unknown>
    dbcc:      	<unknown>
    dbd0:      	stnp	w15, w20, [x18, #-0x100]
    dbd4:      	<unknown>
    dbd8:      	<unknown>
    dbdc:      	<unknown>
    dbe0:      	<unknown>
    dbe4:      	fnmla	z19.h, p1/m, z1.h, z24.h
    dbe8:      	<unknown>
    dbec:      	ushl	v15.8h, v27.8h, v5.8h
    dbf0:      	udf	#0x632e
    dbf4:      	<unknown>
    dbf8:      	<unknown>
    dbfc:      	<unknown>
    dc00:      	<unknown>
    dc04:      	<unknown>
    dc08:      	<unknown>
    dc0c:      	<unknown>
    dc10:      	<unknown>
    dc14:      	<unknown>
    dc18:      	<unknown>
    dc1c:      	<unknown>
    dc20:      	<unknown>
    dc24:      	<unknown>
    dc28:      	<unknown>
    dc2c:      	udf	#0x2e
    dc30:      	<unknown>
    dc34:      	<unknown>
    dc38:      	<unknown>
    dc3c:      	<unknown>
    dc40:      	<unknown>
    dc44:      	<unknown>
    dc48:      	<unknown>
    dc4c:      	<unknown>
    dc50:      	<unknown>
    dc54:      	udf	#0x65
    dc58:      	udf	#0x2b06
    dc5c:      	<unknown>
    dc60:      	<unknown>
    dc64:      	<unknown>
    dc68:      	udf	#0x101
    dc6c:      	<unknown>
		...
    dc78:      	udf	#0x23a8
    dc7c:      	udf	#0x0
    dc80:      	udf	#0x23dc
    dc84:      	udf	#0x0
    dc88:      	udf	#0x23ec
    dc8c:      	udf	#0x0
    dc90:      	udf	#0x23fc
    dc94:      	udf	#0x0
    dc98:      	udf	#0x23fc
    dc9c:      	udf	#0x0
    dca0:      	udf	#0x23fc
    dca4:      	udf	#0x0
    dca8:      	udf	#0x23fc
    dcac:      	udf	#0x0
    dcb0:      	udf	#0x2408
		...
    dcc0:      	udf	#0x8
    dcc4:      	udf	#0x0
    dcc8:      	udf	#0x40
    dccc:      	udf	#0x0
    dcd0:      	udf	#0x40
    dcd4:      	udf	#0x0
    dcd8:      	udf	#0x200
		...
    dcf0:      	udf	#0x3ff
    dcf4:      	udf	#0x0
    dcf8:      	udf	#0x400
    dcfc:      	udf	#0x0
    dd00:      	udf	#0x400
		...
    dd18:      	udf	#0x40
    dd1c:      	udf	#0x0
    dd20:      	udf	#0x200
    dd24:      	udf	#0x0
    dd28:      	udf	#0x400
		...
    dd38:      	udf	#0x8
    dd3c:      	udf	#0x0
    dd40:      	udf	#0x40
    dd44:      	udf	#0x0
    dd48:      	udf	#0x400
    dd4c:      	udf	#0x0
    dd50:      	udf	#0x400
    dd54:      	udf	#0x0
    dd58:      	<unknown>
    dd5c:      	ldpsw	x14, x17, [x11, #-0x40]
    dd60:      	mls	v20.8h, v19.8h, v15.h[2]
    dd64:      	<unknown>
    dd68:      	fnmls	z22.h, p2/m, z11.h, z3.h
    dd6c:      	<unknown>
    dd70:      	<unknown>
    dd74:      	<unknown>
    dd78:      	<unknown>
    dd7c:      	<unknown>
    dd80:      	<unknown>
    dd84:      	luti4	v2.16b, { v2.16b }, v6[0]
    dd88:      	<unknown>
    dd8c:      	<unknown>
    dd90:      	fnmls	z18.h, p2/m, z11.h, z22.h
    dd94:      	raddhn2	v18.8h, v19.4s, v9.4s
    dd98:      	<unknown>
    dd9c:      	<unknown>
    dda0:      	<unknown>
    dda4:      	<unknown>
    dda8:      	<unknown>
    ddac:      	fnmls	z18.h, p2/m, z11.h, z22.h
    ddb0:      	raddhn2	v18.8h, v19.4s, v9.4s
    ddb4:      	<unknown>
    ddb8:      	<unknown>
    ddbc:      	<unknown>
    ddc0:      	ldnp	d14, d24, [x11, #-0x1e0]
    ddc4:      	umlal2	v5.4s, v3.8h, v4.h[3]
    ddc8:      	fnmls	z0.h, p3/m, z25.h, z16.h
    ddcc:      	<unknown>
    ddd0:      	umlal2	v2.4s, v2.8h, v3.h[0]
    ddd4:      	<unknown>
    ddd8:      	fcmla	v0.8h, v1.8h, v18.h[1], #180
    dddc:      	<unknown>
    dde0:      	<unknown>
    dde4:      	<unknown>
    dde8:      	<unknown>
    ddec:      	<unknown>
    ddf0:      	<unknown>
    ddf4:      	<unknown>
    ddf8:      	<unknown>
    ddfc:      	ldnp	d14, d24, [x11, #-0x1e0]
    de00:      	umlal2	v5.4s, v3.8h, v4.h[3]
    de04:      	<unknown>
    de08:      	<unknown>
    de0c:      	<unknown>
    de10:      	umlal2	v14.4s, v2.8h, v3.h[2]
    de14:      	<unknown>
    de18:      	<unknown>
    de1c:      	<unknown>
    de20:      	ldnp	d6, d24, [x11, #-0x170]
    de24:      	<unknown>
    de28:      	fmls	z15.h, p0/m, z3.h, z7.h
    de2c:      	<unknown>
    de30:      	umlal2	v2.4s, v2.8h, v3.h[2]
    de34:      	<unknown>
    de38:      	<unknown>
    de3c:      	<unknown>
    de40:      	bic	w5, w27, w19, lsr #28
    de44:      	<unknown>
    de48:      	ldpsw	x0, x25, [x17, #-0xf8]
    de4c:      	<unknown>
    de50:      	adr	x20, 0x4ec3f
    de54:      	fcmla	v5.8h, v19.8h, v6.h[1], #270
    de58:      	adr	x18, 0x4ec07
    de5c:      	<unknown>
    de60:      	<unknown>
    de64:      	<unknown>
    de68:      	<unknown>
    de6c:      	uqshl	v1.2d, v3.2d, #0x29
    de70:      	cmpge	p14.b, p2/z, z19.b, #0x0
    de74:      	<unknown>
    de78:      	ldnp	d14, d24, [x11, #-0x1e0]
    de7c:      	umlal2	v5.4s, v3.8h, v4.h[3]
    de80:      	<unknown>
    de84:      	ldnp	d20, d24, [x11, #-0x140]
    de88:      	<unknown>
    de8c:      	adr	x6, 0x4e857
    de90:      	<unknown>
    de94:      	<unknown>
    de98:      	<unknown>
    de9c:      	<unknown>
    dea0:      	<unknown>
    dea4:      	fnmls	z18.h, p2/m, z11.h, z22.h
    dea8:      	raddhn2	v18.8h, v19.4s, v9.4s
    deac:      	<unknown>
    deb0:      	<unknown>
    deb4:      	<unknown>
    deb8:      	<unknown>
    debc:      	<unknown>
    dec0:      	ldpsw	x5, x28, [x19, #-0x50]
    dec4:      	<unknown>
    dec8:      	<unknown>
    decc:      	<unknown>
    ded0:      	<unknown>
    ded4:      	ldpsw	x0, x25, [x17, #-0xf8]
    ded8:      	<unknown>
    dedc:      	<unknown>
    dee0:      	psel	p5, p8, p9.h[w14, 1]
    dee4:      	<unknown>
    dee8:      	bc.lo	0xb2790
    deec:      	<unknown>
    def0:      	rsubhn2	v19.8h, v19.4s, v6.4s
    def4:      	<unknown>
    def8:      	ldp	w18, w25, [x10, #-0x78]
    defc:      	<unknown>
    df00:      	fcmla	v15.4h, v19.4h, v11.h[1], #270
    df04:      	fnmls	z8.h, p3/m, z27.h, z13.h
    df08:      	<unknown>
    df0c:      	<unknown>
    df10:      	ldsetb	w22, w15, [x9]
    df14:      	sqdmlal2	v21.4s, v9.8h, v15.h[5]
    df18:      	usubwb	z24.h, z10.h, z7.b
    df1c:      	<unknown>
    df20:      	<unknown>
    df24:      	<unknown>
    df28:      	<unknown>
    df2c:      	<unknown>
    df30:      	<unknown>
    df34:      	<unknown>
    df38:      	ldp	d15, d27, [x9, #-0xd0]
    df3c:      	<unknown>
    df40:      	umlsl2	v15.4s, v17.8h, v15.h[2]
    df44:      	ldp	d20, d23, [x27, #-0x170]
    df48:      	<unknown>
    df4c:      	fcmla	v15.8h, v9.8h, v3.h[1], #180
    df50:      	<unknown>
    df54:      	ldpsw	x15, x17, [x1, #-0x70]
    df58:      	<unknown>
    df5c:      	<unknown>
    df60:      	<unknown>
    df64:      	ldurh	w3, [x27, #0x43]
    df68:      	<unknown>
    df6c:      	<unknown>
    df70:      	rsubhn	v23.8b, v27.8h, v19.8h
    df74:      	<unknown>
    df78:      	<unknown>
    df7c:      	<unknown>
    df80:      	<unknown>
    df84:      	<unknown>
    df88:      	smlal2	v5.4s, v3.8h, v2.h[0]
    df8c:      	fmls	z19.h, p0/m, z2.h, z4.h
    df90:      	ldpsw	x19, x24, [x27, #-0x70]
    df94:      	<unknown>
    df98:      	<unknown>
    df9c:      	<unknown>
    dfa0:      	bic	w1, w27, w5, lsr #25
    dfa4:      	<unknown>
    dfa8:      	fcmeq	p6.h, p3/z, z19.h, z19.h
    dfac:      	<unknown>
    dfb0:      	<unknown>
    dfb4:      	<unknown>
    dfb8:      	ldpsw	x0, x25, [x17, #-0xf8]
    dfbc:      	<unknown>
    dfc0:      	subs	w20, w27, #0x81b
    dfc4:      	fnmls	z21.h, p1/m, z11.h, z21.h
    dfc8:      	<unknown>
    dfcc:      	<unknown>
    dfd0:      	adr	x3, 0xe0e1f
    dfd4:      	<unknown>
    dfd8:      	<unknown>
    dfdc:      	<unknown>
    dfe0:      	fnmls	z20.h, p0/m, z11.h, z7.h
    dfe4:      	<unknown>
    dfe8:      	<unknown>
    dfec:      	<unknown>
    dff0:      	<unknown>
    dff4:      	<unknown>
    dff8:      	<unknown>
    dffc:      	<unknown>
    e000:      	<unknown>
    e004:      	<unknown>
    e008:      	<unknown>
    e00c:      	<unknown>
    e010:      	<unknown>
    e014:      	<unknown>
    e018:      	<unknown>
    e01c:      	ldnp	d6, d24, [x11, #-0x170]
    e020:      	<unknown>
    e024:      	<unknown>
    e028:      	<unknown>
    e02c:      	<unknown>
    e030:      	<unknown>
    e034:      	<unknown>
    e038:      	<unknown>
    e03c:      	<unknown>
    e040:      	<unknown>
    e044:      	ldnp	d6, d24, [x11, #-0x170]
    e048:      	<unknown>
    e04c:      	<unknown>
    e050:      	<unknown>
    e054:      	<unknown>
    e058:      	<unknown>
    e05c:      	<unknown>
    e060:      	<unknown>
    e064:      	fnmls	z20.h, p0/m, z11.h, z7.h
    e068:      	<unknown>
    e06c:      	<unknown>
    e070:      	<unknown>
    e074:      	<unknown>
    e078:      	<unknown>
    e07c:      	<unknown>
    e080:      	usubwt	z20.h, z26.h, z6.b
    e084:      	<unknown>
    e088:      	<unknown>
    e08c:      	<unknown>
    e090:      	<unknown>
    e094:      	<unknown>
    e098:      	psel	p5, p8, p9.h[w14, 1]
    e09c:      	<unknown>
    e0a0:      	bc.lo	0xb2948
    e0a4:      	ldpsw	x26, x8, [x1, #0x60]
    e0a8:      	<unknown>
    e0ac:      	bic	w20, w19, w25, lsr #28
    e0b0:      	<unknown>
    e0b4:      	<unknown>
    e0b8:      	<unknown>
    e0bc:      	<unknown>
    e0c0:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e0c4:      	<unknown>
    e0c8:      	<unknown>
    e0cc:      	<unknown>
    e0d0:      	<unknown>
    e0d4:      	<unknown>
    e0d8:      	<unknown>
    e0dc:      	bfdot	z0.s, z17.h, z1.h[0]
    e0e0:      	<unknown>
    e0e4:      	<unknown>
    e0e8:      	<unknown>
    e0ec:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e0f0:      	<unknown>
    e0f4:      	<unknown>
    e0f8:      	<unknown>
    e0fc:      	raddhnt	z2.b, z3.h, z5.h
    e100:      	sqshlu	v14.2d, v3.2d, #0x30
    e104:      	<unknown>
    e108:      	<unknown>
    e10c:      	ldpsw	x0, x25, [x17, #-0xf8]
    e110:      	<unknown>
    e114:      	<unknown>
    e118:      	<unknown>
    e11c:      	fmls	z5.h, p0/m, z3.h, z4.h
    e120:      	fnmls	z22.h, p2/m, z11.h, z3.h
    e124:      	<unknown>
    e128:      	<unknown>
    e12c:      	<unknown>
    e130:      	<unknown>
    e134:      	<unknown>
    e138:      	usubl2	v26.4s, v1.8h, v9.8h
    e13c:      	ldpsw	x22, x24, [x11, #-0xa0]
    e140:      	fmaxnmv	h4, p0, z3.h
    e144:      	fnmls	z22.h, p2/m, z11.h, z3.h
    e148:      	<unknown>
    e14c:      	<unknown>
    e150:      	<unknown>
    e154:      	ldpsw	x15, x27, [x19, #-0xd0]
    e158:      	fnmls	z7.h, p5/m, z11.h, z18.h
    e15c:      	<unknown>
    e160:      	<unknown>
    e164:      	ldpsw	x4, x28, [x3, #-0x88]
    e168:      	subhnt	z14.b, z3.h, z19.h
    e16c:      	<unknown>
    e170:      	<unknown>
    e174:      	<unknown>
    e178:      	ldpsw	x4, x28, [x3, #-0x88]
    e17c:      	<unknown>
    e180:      	<unknown>
    e184:      	<unknown>
    e188:      	<unknown>
    e18c:      	<unknown>
    e190:      	<unknown>
    e194:      	ldpsw	x4, x25, [x10, #-0x50]
    e198:      	<unknown>
    e19c:      	<unknown>
    e1a0:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e1a4:      	<unknown>
    e1a8:      	<unknown>
    e1ac:      	adr	x18, 0xd6ada
    e1b0:      	<unknown>
    e1b4:      	fcmla	z3.h, p5/m, z3.h, z9.h, #270
    e1b8:      	<unknown>
    e1bc:      	<unknown>
    e1c0:      	b.nv	0xf700c
    e1c4:      	<unknown>
    e1c8:      	<unknown>
    e1cc:      	<unknown>
    e1d0:      	<unknown>
    e1d4:      	adr	x5, 0xd6f9f
    e1d8:      	<unknown>
    e1dc:      	ldnp	d19, d29, [x2, #-0x1f0]
    e1e0:      	<unknown>
    e1e4:      	bic	p4.b, p9/z, p11.b, p0.b
    e1e8:      	<unknown>
    e1ec:      	fnmls	z1.h, p2/m, z11.h, z12.h
    e1f0:      	umlal2	v4.4s, v3.8h, v4.h[3]
    e1f4:      	<unknown>
    e1f8:      	<unknown>
    e1fc:      	umin	v16.8h, v27.8h, v9.8h
    e200:      	<unknown>
    e204:      	<unknown>
    e208:      	<unknown>
    e20c:      	adr	x5, 0x4e959
    e210:      	<unknown>
    e214:      	<unknown>
    e218:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e21c:      	addhnt	z19.b, z10.h, z20.h
    e220:      	sqshlu	v14.2d, v3.2d, #0x30
    e224:      	<unknown>
    e228:      	ldnp	d20, d24, [x11, #-0x140]
    e22c:      	<unknown>
    e230:      	<unknown>
    e234:      	<unknown>
    e238:      	<unknown>
    e23c:      	<unknown>
    e240:      	<unknown>
    e244:      	fmul	z16.h, z3.h, z5.h[0]
    e248:      	ldpsw	x12, x8, [x1, #-0xe0]
    e24c:      	fmul	z18.h, z3.h, z5.h[0]
    e250:      	uaddl2	v10.4s, v0.8h, v21.8h
    e254:      	ldnp	d19, d29, [x3, #-0x1f0]
    e258:      	<unknown>
    e25c:      	addhnt	z2.b, z19.h, z14.h
    e260:      	<unknown>
    e264:      	<unknown>
    e268:      	<unknown>
    e26c:      	psel	p5, p8, p9.h[w14, 1]
    e270:      	<unknown>
    e274:      	bc.lo	0xb2b1c
    e278:      	ssubl2	v26.8h, v1.16b, v8.16b
    e27c:      	<unknown>
    e280:      	st4	{ v1.b, v2.b, v3.b, v4.b }[15], [x9]
    e284:      	<unknown>
    e288:      	<unknown>
    e28c:      	<unknown>
    e290:      	<unknown>
    e294:      	<unknown>
    e298:      	<unknown>
    e29c:      	<unknown>
    e2a0:      	<unknown>
    e2a4:      	<unknown>
    e2a8:      	<unknown>
    e2ac:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e2b0:      	uabdl2	v20.4s, v18.8h, v1.8h
    e2b4:      	<unknown>
    e2b8:      	<unknown>
    e2bc:      	fcmeq	p6.h, p3/z, z19.h, z7.h
    e2c0:      	<unknown>
    e2c4:      	uabdl2	v20.4s, v18.8h, v1.8h
    e2c8:      	<unknown>
    e2cc:      	fnmls	z19.h, p2/m, z10.h, z26.h
    e2d0:      	<unknown>
    e2d4:      	ldnp	d6, d27, [x19, #0x10]
    e2d8:      	<unknown>
    e2dc:      	<unknown>
    e2e0:      	<unknown>
    e2e4:      	<unknown>
    e2e8:      	<unknown>
    e2ec:      	<unknown>
    e2f0:      	<unknown>
    e2f4:      	<unknown>
    e2f8:      	sqshlu	v13.2d, v11.2d, #0x2d
    e2fc:      	<unknown>
    e300:      	<unknown>
    e304:      	fnmla	z14.h, p1/m, z19.h, z18.h
    e308:      	<unknown>
    e30c:      	fnmls	z14.h, p4/m, z27.h, z6.h
    e310:      	<unknown>
    e314:      	<unknown>
    e318:      	<unknown>
    e31c:      	fcmla	v14.8h, v27.8h, v20.h[1], #180
    e320:      	raddhn2	v16.8h, v27.4s, v15.4s
    e324:      	ldnp	d20, d28, [x19, #-0x110]
    e328:      	<unknown>
    e32c:      	<unknown>
    e330:      	<unknown>
    e334:      	<unknown>
    e338:      	b.eq	0xa6e7c
    e33c:      	<unknown>
    e340:      	eor	w1, w19, #0xfffffff
    e344:      	usubl2	v24.4s, v2.8h, v5.8h
    e348:      	ldpsw	x4, x28, [x3, #-0x88]
    e34c:      	stgp	x14, x29, [x3, #-0x400]
    e350:      	umlal2	v19.4s, v3.8h, v14.h[2]
    e354:      	<unknown>
    e358:      	<unknown>
    e35c:      	bic	w20, w11, w4, lsr #25
    e360:      	<unknown>
    e364:      	fcmeq	p6.h, p3/z, z19.h, z19.h
    e368:      	fdot	z20.s, z11.b, z6.b[1]
    e36c:      	umin	v16.8h, v27.8h, v9.8h
    e370:      	ldnp	d20, d20, [x3, #-0x110]
    e374:      	<unknown>
    e378:      	<unknown>
    e37c:      	<unknown>
    e380:      	<unknown>
    e384:      	<unknown>
    e388:      	ldnp	d13, d24, [x11, #-0x140]
    e38c:      	<unknown>
    e390:      	<unknown>
    e394:      	<unknown>
    e398:      	ldpsw	x4, x28, [x3, #-0x88]
    e39c:      	uqshl	v14.2d, v3.2d, #0x10
    e3a0:      	ldrh	w12, [x11, #0x11b4]
    e3a4:      	<unknown>
    e3a8:      	ldp	d0, d27, [x9, #-0x1b0]
    e3ac:      	<unknown>
    e3b0:      	<unknown>
    e3b4:      	ldpsw	x3, x24, [x11, #-0x60]
    e3b8:      	<unknown>
    e3bc:      	fnmls	z1.h, p2/m, z11.h, z12.h
    e3c0:      	umlal2	v4.4s, v3.8h, v6.h[2]
    e3c4:      	<unknown>
    e3c8:      	luti4	v2.16b, { v2.16b }, v6[0]
    e3cc:      	<unknown>
    e3d0:      	fnmls	z5.h, p0/m, z11.h, z20.h
    e3d4:      	<unknown>
    e3d8:      	<unknown>
    e3dc:      	<unknown>
    e3e0:      	<unknown>
    e3e4:      	<unknown>
    e3e8:      	<unknown>
    e3ec:      	<unknown>
    e3f0:      	<unknown>
    e3f4:      	ldpsw	x7, x17, [x11, #-0xd0]
    e3f8:      	<unknown>
    e3fc:      	ldp	d6, d27, [x27, #-0xe0]
    e400:      	<unknown>
    e404:      	<unknown>
    e408:      	ldnp	d15, d24, [x27, #-0x110]
    e40c:      	<unknown>
    e410:      	<unknown>
    e414:      	<unknown>
    e418:      	<unknown>
    e41c:      	<unknown>
    e420:      	<unknown>
    e424:      	<unknown>
    e428:      	ldp	d6, d27, [x27, #-0xe0]
    e42c:      	<unknown>
    e430:      	<unknown>
    e434:      	<unknown>
    e438:      	<unknown>
    e43c:      	<unknown>
    e440:      	<unknown>
    e444:      	ldpsw	x9, x24, [x11, #-0xa0]
    e448:      	<unknown>
    e44c:      	<unknown>
    e450:      	<unknown>
    e454:      	sqshlu	v18.2d, v11.2d, #0x33
    e458:      	fnmls	z21.h, p4/m, z19.h, z3.h
    e45c:      	<unknown>
    e460:      	rsubhn2	v19.8h, v19.4s, v6.4s
    e464:      	<unknown>
    e468:      	ldr	x14, 0xf7194
    e46c:      	<unknown>
    e470:      	<unknown>
    e474:      	<unknown>
    e478:      	<unknown>
    e47c:      	subhn2	v9.8h, v11.4s, v12.4s
    e480:      	fnmls	z21.h, p3/m, z11.h, z2.h
    e484:      	<unknown>
    e488:      	umlal2	v26.4s, v1.8h, v12.h[0]
    e48c:      	fnmls	z3.h, p0/m, z11.h, z20.h
    e490:      	<unknown>
    e494:      	<unknown>
    e498:      	<unknown>
    e49c:      	<unknown>
    e4a0:      	ldp	d9, d19, [x11, #-0x1b0]
    e4a4:      	<unknown>
    e4a8:      	<unknown>
    e4ac:      	<unknown>
    e4b0:      	ldnp	d15, d24, [x27, #-0x110]
    e4b4:      	<unknown>
    e4b8:      	<unknown>
    e4bc:      	<unknown>
    e4c0:      	ands	w26, w1, #0xf800000f
    e4c4:      	<unknown>
    e4c8:      	<unknown>
    e4cc:      	<unknown>
    e4d0:      	<unknown>
    e4d4:      	<unknown>
    e4d8:      	ldpsw	x7, x17, [x11, #-0xd0]
    e4dc:      	<unknown>
    e4e0:      	<unknown>
    e4e4:      	adr	x14, 0xed1b2
    e4e8:      	<unknown>
    e4ec:      	<unknown>
    e4f0:      	bic	w21, w11, w4, lsr #26
    e4f4:      	<unknown>
    e4f8:      	<unknown>
    e4fc:      	<unknown>
    e500:      	<unknown>
    e504:      	ldpsw	x0, x25, [x17, #-0xf8]
    e508:      	<unknown>
    e50c:      	bic	w0, w9, w18, lsr #9
    e510:      	<unknown>
    e514:      	ldnp	d0, d16, [x25, #-0x1f0]
    e518:      	<unknown>
    e51c:      	<unknown>
    e520:      	<unknown>
    e524:      	ldnp	d6, d24, [x11, #-0x170]
    e528:      	<unknown>
    e52c:      	<unknown>
    e530:      	and	p5.b, p14/z, p1.b, p0.b
    e534:      	<unknown>
    e538:      	sqdmlsl	s15, h19, v5.h[2]
    e53c:      	<unknown>
    e540:      	<unknown>
    e544:      	ldpsw	x0, x25, [x17, #-0xf8]
    e548:      	ldnp	s12, s25, [x11, #-0xe0]
    e54c:      	bic	w0, w9, w4, lsr #9
    e550:      	<unknown>
    e554:      	<unknown>
    e558:      	<unknown>
    e55c:      	<unknown>
    e560:      	<unknown>
    e564:      	<unknown>
    e568:      	<unknown>
    e56c:      	<unknown>
    e570:      	<unknown>
    e574:      	<unknown>
		...
    e580:      	udf	#0x8
    e584:      	udf	#0x0
    e588:      	udf	#0x20
    e58c:      	udf	#0x0
    e590:      	udf	#0x20
    e594:      	udf	#0x0
    e598:      	udf	#0x20
    e59c:      	udf	#0x0
    e5a0:      	udf	#0x20
    e5a4:      	udf	#0x0
    e5a8:      	udf	#0x20
    e5ac:      	udf	#0x0
    e5b0:      	udf	#0x20
    e5b4:      	udf	#0x0
    e5b8:      	udf	#0x20
    e5bc:      	udf	#0x0
    e5c0:      	udf	#0x4
    e5c4:      	udf	#0x0
    e5c8:      	udf	#0x4e78
    e5cc:      	udf	#0x0
    e5d0:      	udf	#0x4ec0
    e5d4:      	udf	#0x0
    e5d8:      	udf	#0x4ed4
    e5dc:      	udf	#0x0
    e5e0:      	udf	#0x517c
    e5e4:      	udf	#0x0
    e5e8:      	udf	#0x4f14
    e5ec:      	udf	#0x0
    e5f0:      	udf	#0x517c
    e5f4:      	udf	#0x0
    e5f8:      	udf	#0x4f1c
    e5fc:      	udf	#0x0
    e600:      	udf	#0x517c
    e604:      	udf	#0x0
    e608:      	udf	#0x517c
    e60c:      	udf	#0x0
    e610:      	udf	#0x517c
    e614:      	udf	#0x0
    e618:      	udf	#0x517c
    e61c:      	udf	#0x0
    e620:      	udf	#0x4f2c
    e624:      	udf	#0x0
    e628:      	<unknown>
    e62c:      	<unknown>
    e630:      	fnmls	z6.h, p4/m, z18.h, z5.h
    e634:      	<unknown>
    e638:      	<unknown>
    e63c:      	<unknown>
    e640:      	<unknown>
    e644:      	ldpsw	x14, x26, [x11, #-0x60]
    e648:      	<unknown>
    e64c:      	<unknown>
    e650:      	<unknown>
    e654:      	ldeorh	w16, w26, [x1]
    e658:      	ldseth	w24, w5, [x1]
    e65c:      	<unknown>
    e660:      	<unknown>
    e664:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    e668:      	<unknown>
    e66c:      	ldp	d9, d29, [x3, #0x90]
    e670:      	bic	p0.b, p11/z, p3.b, p0.b
    e674:      	<unknown>
    e678:      	ldnp	d14, d24, [x11, #-0x1e0]
    e67c:      	umlal2	v5.4s, v3.8h, v4.h[3]
    e680:      	<unknown>
    e684:      	<unknown>
    e688:      	<unknown>
    e68c:      	<unknown>
    e690:      	umlal2	v5.4s, v3.8h, v3.h[2]
    e694:      	<unknown>
    e698:      	<unknown>
    e69c:      	ldnp	d6, d24, [x10, #-0x170]
    e6a0:      	<unknown>
    e6a4:      	<unknown>
    e6a8:      	<unknown>
    e6ac:      	<unknown>
    e6b0:      	<unknown>
    e6b4:      	<unknown>
    e6b8:      	<unknown>
    e6bc:      	<unknown>
    e6c0:      	<unknown>
    e6c4:      	adr	x16, 0x595c9
    e6c8:      	<unknown>
    e6cc:      	<unknown>
    e6d0:      	<unknown>
    e6d4:      	bc.mi	0xb2efc
    e6d8:      	<unknown>
    e6dc:      	ldnp	d6, d24, [x10, #-0x170]
    e6e0:      	cmpgt	p3.b, p2/z, z19.b, #0x0
    e6e4:      	<unknown>
    e6e8:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    e6ec:      	<unknown>
    e6f0:      	subhnb	z21.b, z19.h, z5.h
    e6f4:      	<unknown>
    e6f8:      	<unknown>
    e6fc:      	<unknown>
    e700:      	fnmls	z1.h, p2/m, z11.h, z12.h
    e704:      	adr	x4, 0x4ee51
    e708:      	<unknown>
    e70c:      	cmpgt	p8.b, p2/z, z19.b, #0x0
    e710:      	<unknown>
    e714:      	fnmls	z1.h, p2/m, z11.h, z12.h
    e718:      	umlal2	v4.4s, v3.8h, v4.h[3]
    e71c:      	rsubhn2	v0.8h, v25.4s, v15.4s
    e720:      	<unknown>
    e724:      	<unknown>
    e728:      	fmul	z16.h, z3.h, z5.h[0]
    e72c:      	ldpsw	x12, x8, [x1, #-0xe0]
    e730:      	fmul	z18.h, z3.h, z5.h[0]
    e734:      	ldeorh	w16, w26, [x1]
    e738:      	ldseth	w24, w5, [x1]
    e73c:      	<unknown>
    e740:      	<unknown>
    e744:      	fnmls	z1.h, p0/m, z19.h, z12.h
    e748:      	ldpsw	x0, x29, [x25, #-0x70]
    e74c:      	<unknown>
    e750:      	adr	x5, 0x995de
    e754:      	<unknown>
    e758:      	ldp	d9, d25, [x27, #0x30]
    e75c:      	cmpge	p4.b, p2/z, z19.b, #0x0
    e760:      	<unknown>
    e764:      	fnmls	z1.h, p2/m, z11.h, z12.h
    e768:      	umlal2	v4.4s, v3.8h, v4.h[3]
    e76c:      	<unknown>
    e770:      	<unknown>
    e774:      	<unknown>
    e778:      	umlal2	v5.4s, v3.8h, v3.h[2]
    e77c:      	<unknown>
    e780:      	<unknown>
    e784:      	<unknown>
    e788:      	<unknown>
    e78c:      	<unknown>
    e790:      	<unknown>
    e794:      	adr	x16, 0x59699
    e798:      	cmpgt	p8.b, p2/z, z19.b, #0x0
    e79c:      	<unknown>
    e7a0:      	ldnp	d14, d24, [x11, #-0x1e0]
    e7a4:      	umlal2	v5.4s, v3.8h, v4.h[3]
    e7a8:      	ldpsw	x0, x29, [x25, #-0x70]
    e7ac:      	<unknown>
    e7b0:      	adr	x5, 0x9963e
    e7b4:      	<unknown>
    e7b8:      	<unknown>
    e7bc:      	ldpsw	x15, x27, [x19, #-0xd0]
    e7c0:      	bfdot	z7.s, z27.h, z5.h[1]
    e7c4:      	<unknown>
    e7c8:      	<unknown>
    e7cc:      	raddhn2	v3.8h, v27.4s, v15.4s
    e7d0:      	<unknown>
    e7d4:      	adr	x18, 0x99482
    e7d8:      	ldpsw	x0, x25, [x17, #-0xf8]
    e7dc:      	<unknown>
    e7e0:      	<unknown>
    e7e4:      	<unknown>
    e7e8:      	<unknown>
    e7ec:      	<unknown>
    e7f0:      	adr	x16, 0x596f5
    e7f4:      	<unknown>
    e7f8:      	<unknown>
    e7fc:      	ldnp	d6, d24, [x10, #-0x170]
    e800:      	<unknown>
    e804:      	<unknown>
    e808:      	<unknown>
    e80c:      	<unknown>
    e810:      	<unknown>
    e814:      	<unknown>
    e818:      	fnmls	z20.h, p0/m, z11.h, z20.h
    e81c:      	<unknown>
    e820:      	fnmls	z8.h, p2/m, z11.h, z14.h
    e824:      	<unknown>
    e828:      	<unknown>
    e82c:      	ldpsw	x3, x21, [x27, #-0x70]
    e830:      	<unknown>
    e834:      	ldpsw	x4, x28, [x3, #-0x88]
    e838:      	uqshl	v14.2d, v3.2d, #0x3
    e83c:      	umin	v13.8h, v11.8h, v1.8h
    e840:      	<unknown>
    e844:      	adr	x5, 0x996d2
    e848:      	<unknown>
    e84c:      	<unknown>
    e850:      	ldnp	d6, d24, [x11, #-0x170]
    e854:      	<unknown>
    e858:      	adr	x16, 0x5975d
    e85c:      	<unknown>
    e860:      	<unknown>
    e864:      	<unknown>
    e868:      	<unknown>
    e86c:      	ldpsw	x15, x27, [x19, #-0xd0]
    e870:      	<unknown>
    e874:      	<unknown>
    e878:      	ldpsw	x0, x17, [x17, #-0xf8]
    e87c:      	<unknown>
    e880:      	ands	w20, w27, #0xfffffff
    e884:      	uqsub	v5.8h, v11.8h, v9.8h
    e888:      	<unknown>
    e88c:      	fnmls	z12.h, p2/m, z11.h, z26.h
    e890:      	fnmls	z0.h, p5/m, z1.h, z8.h
    e894:      	<unknown>
    e898:      	<unknown>
    e89c:      	ldnp	d0, d24, [x9, #-0x140]
    e8a0:      	<unknown>
    e8a4:      	bic	w9, w27, w14, lsr #27
    e8a8:      	<unknown>
    e8ac:      	<unknown>
    e8b0:      	<unknown>
    e8b4:      	fdot	z5.s, z11.b, z6.b[1]
    e8b8:      	umin	v16.8h, v27.8h, v9.8h
    e8bc:      	ldp	d20, d16, [x27, #-0x110]
    e8c0:      	<unknown>
    e8c4:      	<unknown>
    e8c8:      	sabdl2	v1.4s, v19.8h, v20.8h
    e8cc:      	uqshl	v5.2d, v27.2d, #0x3
    e8d0:      	<unknown>
    e8d4:      	<unknown>
    e8d8:      	<unknown>
    e8dc:      	ldeorh	w16, w26, [x1]
    e8e0:      	ldseth	w24, w5, [x1]
    e8e4:      	<unknown>
    e8e8:      	<unknown>
    e8ec:      	<unknown>
    e8f0:      	<unknown>
    e8f4:      	stgp	x18, x25, [x11, #-0x260]
    e8f8:      	ldpsw	x14, x26, [x11, #-0x60]
    e8fc:      	<unknown>
    e900:      	<unknown>
    e904:      	<unknown>
    e908:      	<unknown>
    e90c:      	ands	w5, w19, #0x1fffffff
    e910:      	<unknown>
    e914:      	<unknown>
    e918:      	<unknown>
    e91c:      	<unknown>
    e920:      	<unknown>
    e924:      	<unknown>
    e928:      	<unknown>
    e92c:      	<unknown>
    e930:      	<unknown>
    e934:      	<unknown>
    e938:      	fmul	z16.h, z3.h, z5.h[0]
    e93c:      	ldpsw	x12, x8, [x1, #-0xe0]
    e940:      	fmul	z18.h, z3.h, z5.h[0]
    e944:      	ldeorh	w16, w26, [x1]
    e948:      	ldseth	w24, w5, [x1]
    e94c:      	<unknown>
    e950:      	<unknown>
    e954:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    e958:      	<unknown>
    e95c:      	adr	x5, 0xd7727
    e960:      	<unknown>
    e964:      	<unknown>
    e968:      	<unknown>
    e96c:      	ldpsw	x3, x21, [x27, #-0xf8]
    e970:      	<unknown>
    e974:      	<unknown>
    e978:      	ldnp	d6, d24, [x11, #-0x170]
    e97c:      	<unknown>
    e980:      	adr	x16, 0x59885
    e984:      	<unknown>
    e988:      	<unknown>
    e98c:      	ldnp	d6, d24, [x10, #-0x170]
    e990:      	<unknown>
    e994:      	fmls	z15.h, p0/m, z3.h, z19.h
    e998:      	<unknown>
    e99c:      	<unknown>
    e9a0:      	ands	w5, w19, #0x1fffffff
    e9a4:      	<unknown>
    e9a8:      	<unknown>
    e9ac:      	<unknown>
    e9b0:      	<unknown>
    e9b4:      	<unknown>
    e9b8:      	<unknown>
    e9bc:      	adr	x4, 0x4f109
    e9c0:      	<unknown>
    e9c4:      	cmpgt	p8.b, p2/z, z19.b, #0x0
    e9c8:      	<unknown>
    e9cc:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    e9d0:      	<unknown>
    e9d4:      	subhnb	z21.b, z19.h, z5.h
    e9d8:      	<unknown>
    e9dc:      	<unknown>
    e9e0:      	<unknown>
    e9e4:      	<unknown>
    e9e8:      	<unknown>
    e9ec:      	<unknown>
    e9f0:      	<unknown>
    e9f4:      	adr	x16, 0x598f9
    e9f8:      	<unknown>
    e9fc:      	<unknown>
    ea00:      	<unknown>
    ea04:      	<unknown>
    ea08:      	adds	w12, w11, #0x559, lsl #12 // =0x559000
    ea0c:      	<unknown>
    ea10:      	<unknown>
    ea14:      	rsubhn2	v19.8h, v19.4s, v6.4s
    ea18:      	<unknown>
    ea1c:      	ldnp	d1, d27, [x19, #-0x1c0]
    ea20:      	<unknown>
    ea24:      	ldnp	d14, d24, [x11, #-0x1e0]
    ea28:      	<unknown>
    ea2c:      	<unknown>
    ea30:      	<unknown>
    ea34:      	fnmls	z1.h, p0/m, z19.h, z12.h
    ea38:      	fcmeq	p8.h, p4/z, z26.h, z20.h
    ea3c:      	uqshl	v19.2d, v3.2d, #0xd
    ea40:      	and	p4.b, p9/z, p11.b, p0.b
    ea44:      	b.ne	0x4f190
    ea48:      	<unknown>
    ea4c:      	fnmls	z13.h, p3/m, z27.h, z4.h
    ea50:      	<unknown>
    ea54:      	adr	x0, 0xf98bb
    ea58:      	<unknown>
    ea5c:      	<unknown>
    ea60:      	strh	w16, [x1, x5, lsl #1]
    ea64:      	<unknown>
    ea68:      	<unknown>
    ea6c:      	ldpsw	x3, x21, [x27, #-0x70]
    ea70:      	fcmne	p4.h, p1/z, z11.h, z4.h
    ea74:      	fnmls	z22.h, p2/m, z11.h, z3.h
    ea78:      	ldp	d3, d27, [x26, #-0x130]
    ea7c:      	<unknown>
    ea80:      	adr	x19, 0xf772a
    ea84:      	fcmla	v5.8h, v19.8h, v9.h[1], #270
    ea88:      	adr	x4, 0xd57b6
    ea8c:      	ldp	d1, d28, [x19, #-0x1f0]
    ea90:      	<unknown>
    ea94:      	<unknown>
    ea98:      	ldeorh	w16, w26, [x1]
    ea9c:      	ldseth	w24, w5, [x1]
    eaa0:      	<unknown>
    eaa4:      	<unknown>
    eaa8:      	<unknown>
    eaac:      	fnmls	z14.h, p1/m, z3.h, z12.h
    eab0:      	<unknown>
    eab4:      	and	p5.b, p11/z, p3.b, p0.b
    eab8:      	<unknown>
    eabc:      	<unknown>
    eac0:      	<unknown>
    eac4:      	<unknown>
    eac8:      	<unknown>
    eacc:      	umlal2	v26.4s, v1.8h, v3.h[0]
    ead0:      	uqshl	v14.2d, v3.2d, #0x32
    ead4:      	<unknown>
    ead8:      	<unknown>
    eadc:      	<unknown>
    eae0:      	<unknown>
    eae4:      	ldnp	d6, d24, [x11, #-0x170]
    eae8:      	<unknown>
    eaec:      	<unknown>
    eaf0:      	<unknown>
    eaf4:      	fmls	z19.h, p0/m, z3.h, z18.h
    eaf8:      	<unknown>
    eafc:      	uabd	v5.8h, v19.8h, v5.8h
    eb00:      	<unknown>
    eb04:      	rsubhn2	v19.8h, v19.4s, v6.4s
    eb08:      	<unknown>
    eb0c:      	ldnp	d1, d27, [x19, #-0x1c0]
    eb10:      	<unknown>
    eb14:      	and	p5.b, p13/z, p3.b, p0.b
    eb18:      	<unknown>
    eb1c:      	<unknown>
    eb20:      	<unknown>
    eb24:      	fnmls	z14.h, p1/m, z3.h, z12.h
    eb28:      	<unknown>
    eb2c:      	<unknown>
    eb30:      	<unknown>
    eb34:      	<unknown>
    eb38:      	ldnp	d3, d29, [x2, #-0xe0]
    eb3c:      	<unknown>
    eb40:      	stgp	x20, x25, [x11, #-0x400]
    eb44:      	<unknown>
    eb48:      	<unknown>
    eb4c:      	<unknown>
    eb50:      	<unknown>
    eb54:      	fnmls	z14.h, p1/m, z3.h, z12.h
    eb58:      	<unknown>
    eb5c:      	fnmls	z15.h, p3/m, z19.h, z14.h
    eb60:      	and	p3.b, p13/z, p3.b, p0.b
    eb64:      	<unknown>
    eb68:      	<unknown>
    eb6c:      	<unknown>
    eb70:      	fnmls	z20.h, p0/m, z11.h, z20.h
    eb74:      	<unknown>
    eb78:      	fnmls	z8.h, p2/m, z11.h, z14.h
    eb7c:      	ldpsw	x0, x25, [x17, #-0xf8]
    eb80:      	<unknown>
    eb84:      	adr	x20, 0x4f973
    eb88:      	fnmls	z18.h, p3/m, z27.h, z3.h
    eb8c:      	<unknown>
    eb90:      	fcmla	v9.8h, v27.8h, v3.h[1], #270
    eb94:      	<unknown>
    eb98:      	<unknown>
    eb9c:      	bic	w5, w19, w20, lsr #27
    eba0:      	<unknown>
    eba4:      	ldp	d0, d21, [x1, #-0x170]
    eba8:      	sqshlu	v5.4s, v3.4s, #0x0
    ebac:      	<unknown>
    ebb0:      	ldpsw	x1, x26, [x11, #-0x60]
    ebb4:      	<unknown>
    ebb8:      	<unknown>
    ebbc:      	<unknown>
    ebc0:      	fnmls	z15.h, p3/m, z3.h, z12.h
    ebc4:      	umlal2	v18.4s, v3.8h, v4.h[3]
    ebc8:      	ldnp	d0, d26, [x1, #-0x1f0]
    ebcc:      	cmpgt	p4.b, p2/z, z19.b, #0x0
    ebd0:      	<unknown>
    ebd4:      	fnmls	z1.h, p2/m, z11.h, z12.h
    ebd8:      	umlal2	v4.4s, v3.8h, v4.h[3]
    ebdc:      	fnmls	z0.h, p0/m, z25.h, z12.h
    ebe0:      	<unknown>
    ebe4:      	umlal2	v16.4s, v3.8h, v3.h[2]
    ebe8:      	umin	v13.8h, v11.8h, v15.8h
    ebec:      	ldrh	w0, [x1, #0x10b6]
    ebf0:      	<unknown>
    ebf4:      	<unknown>
    ebf8:      	ldnp	d6, d24, [x10, #-0x170]
    ebfc:      	<unknown>
    ec00:      	fmls	z15.h, p0/m, z3.h, z7.h
    ec04:      	<unknown>
    ec08:      	<unknown>
    ec0c:      	umin	v3.8h, v27.8h, v21.8h
    ec10:      	adr	x20, 0x4f35d
    ec14:      	<unknown>
    ec18:      	<unknown>
    ec1c:      	rsubhn2	v19.8h, v19.4s, v6.4s
    ec20:      	subhnt	z4.b, z26.h, z3.h
    ec24:      	<unknown>
    ec28:      	<unknown>
    ec2c:      	<unknown>
    ec30:      	<unknown>
    ec34:      	ldnp	d6, d24, [x10, #-0x170]
    ec38:      	<unknown>
    ec3c:      	fmls	z15.h, p0/m, z3.h, z7.h
    ec40:      	fmls	z20.h, p0/m, z3.h, z14.h
    ec44:      	<unknown>
    ec48:      	<unknown>
    ec4c:      	ldeorh	w16, w26, [x1]
    ec50:      	ldseth	w24, w5, [x1]
    ec54:      	<unknown>
    ec58:      	<unknown>
    ec5c:      	<unknown>
    ec60:      	<unknown>
    ec64:      	<unknown>
    ec68:      	<unknown>
    ec6c:      	ldpsw	x4, x25, [x11, #-0x50]
    ec70:      	<unknown>
    ec74:      	<unknown>
    ec78:      	<unknown>
    ec7c:      	<unknown>
    ec80:      	<unknown>
    ec84:      	<unknown>
    ec88:      	<unknown>
    ec8c:      	<unknown>
    ec90:      	adr	x5, 0xd7a5f
    ec94:      	<unknown>
    ec98:      	fnmls	z0.h, p1/m, z9.h, z22.h
    ec9c:      	<unknown>
    eca0:      	psel	p5, p8, p9.h[w14, 1]
    eca4:      	<unknown>
    eca8:      	bc.lo	0xb3550
    ecac:      	<unknown>
    ecb0:      	umlsl2	v18.4s, v19.8h, v14.h[0]
    ecb4:      	<unknown>
    ecb8:      	<unknown>
    ecbc:      	<unknown>
    ecc0:      	bics	w13, w11, w15, lsl #25
    ecc4:      	ldpsw	x5, x27, [x19, #-0xa8]
    ecc8:      	adds	w14, w27, #0xbdc
    eccc:      	strb	w22, [x1, #0xd4e]
    ecd0:      	<unknown>
    ecd4:      	<unknown>
    ecd8:      	adr	x17, 0xa98c2
    ecdc:      	<unknown>
    ece0:      	<unknown>
    ece4:      	umlalt	z15.h, z9.b, z15.b
    ece8:      	<unknown>
    ecec:      	strb	w19, [x10, #0xe13]
    ecf0:      	stp	d25, d14, [x1, #-0x110]
    ecf4:      	strb	w19, [x11, #0xe1b]
    ecf8:      	<unknown>
    ecfc:      	<unknown>
    ed00:      	<unknown>
    ed04:      	sub	w5, w27, #0xbdc
    ed08:      	adr	x3, 0xe9af6
    ed0c:      	<unknown>
    ed10:      	fnmls	z18.h, p2/m, z11.h, z22.h
    ed14:      	<unknown>
    ed18:      	rsubhn2	v19.8h, v19.4s, v6.4s
    ed1c:      	<unknown>
    ed20:      	<unknown>
    ed24:      	<unknown>
    ed28:      	<unknown>
    ed2c:      	adr	x19, 0xe9653
    ed30:      	<unknown>
    ed34:      	<unknown>
    ed38:      	ldnp	d6, d24, [x10, #-0x170]
    ed3c:      	<unknown>
    ed40:      	fmls	z15.h, p0/m, z3.h, z7.h
    ed44:      	adr	x20, 0xd9153
    ed48:      	<unknown>
    ed4c:      	sqshlu	v20.4s, v11.4s, #0x0
    ed50:      	adr	x14, 0x9915e
    ed54:      	ldnp	s0, s9, [x9, #-0xe0]
    ed58:      	smlalt	z0.h, z9.b, z16.b
    ed5c:      	<unknown>
    ed60:      	<unknown>
    ed64:      	<unknown>
    ed68:      	<unknown>
    ed6c:      	whilewr	p0.h, x1, x24
    ed70:      	<unknown>
    ed74:      	rsubhn2	v19.8h, v19.4s, v6.4s
    ed78:      	<unknown>
    ed7c:      	<unknown>
    ed80:      	ldpsw	x4, x28, [x3, #-0x88]
    ed84:      	<unknown>
    ed88:      	<unknown>
    ed8c:      	fnmls	z20.h, p0/m, z11.h, z20.h
    ed90:      	<unknown>
    ed94:      	ldpsw	x0, x17, [x17, #-0xf8]
    ed98:      	<unknown>
    ed9c:      	<unknown>
    eda0:      	<unknown>
    eda4:      	ldnp	d20, d24, [x11, #-0x140]
    eda8:      	<unknown>
    edac:      	<unknown>
    edb0:      	adr	x16, 0x59cb5
    edb4:      	<unknown>
    edb8:      	<unknown>
    edbc:      	ldnp	d6, d24, [x10, #-0x170]
    edc0:      	<unknown>
    edc4:      	<unknown>
    edc8:      	ldnp	d19, d29, [x3, #-0x1f0]
    edcc:      	<unknown>
    edd0:      	<unknown>
    edd4:      	<unknown>
    edd8:      	ldpsw	x4, x8, [x3, #0x20]
    eddc:      	fmul	z18.h, z3.h, z5.h[0]
    ede0:      	<unknown>
    ede4:      	<unknown>
    ede8:      	<unknown>
    edec:      	<unknown>
    edf0:      	ldp	d19, d29, [x11, #-0x1e0]
    edf4:      	<unknown>
    edf8:      	<unknown>
    edfc:      	bic	w6, w11, w18, lsr #25
    ee00:      	<unknown>
    ee04:      	raddhn2	v0.8h, v25.4s, v1.4s
    ee08:      	<unknown>
    ee0c:      	<unknown>
    ee10:      	<unknown>
    ee14:      	<unknown>
    ee18:      	<unknown>
    ee1c:      	<unknown>
    ee20:      	<unknown>
    ee24:      	ldnp	d23, d24, [x27, #0x30]
    ee28:      	<unknown>
    ee2c:      	<unknown>
    ee30:      	raddhnt	z1.b, z3.h, z12.h
    ee34:      	sqshlu	v14.2d, v3.2d, #0x30
    ee38:      	<unknown>
    ee3c:      	<unknown>
    ee40:      	adr	x0, 0xff6e7
    ee44:      	ldpsw	x5, x24, [x27, #-0x60]
    ee48:      	<unknown>
    ee4c:      	<unknown>
    ee50:      	<unknown>
    ee54:      	fmul	z16.h, z3.h, z5.h[0]
    ee58:      	<unknown>
    ee5c:      	<unknown>
    ee60:      	<unknown>
    ee64:      	<unknown>
    ee68:      	fnmls	z8.h, p1/m, z11.h, z18.h
    ee6c:      	<unknown>
    ee70:      	<unknown>
    ee74:      	<unknown>
    ee78:      	<unknown>
    ee7c:      	<unknown>
    ee80:      	<unknown>
    ee84:      	fnmls	z7.h, p1/m, z10.h, z14.h
    ee88:      	fnmls	z18.h, p0/m, z11.h, z20.h
    ee8c:      	<unknown>
    ee90:      	adr	x3, 0xe9c7b
    ee94:      	<unknown>
    ee98:      	<unknown>
    ee9c:      	<unknown>
    eea0:      	usubwt	z20.h, z26.h, z19.b
    eea4:      	<unknown>
    eea8:      	<unknown>
    eeac:      	fnmls	z20.h, p0/m, z11.h, z7.h
    eeb0:      	fnmls	z0.h, p5/m, z9.h, z14.h
    eeb4:      	<unknown>
    eeb8:      	<unknown>
    eebc:      	<unknown>
    eec0:      	whilehs	pn12.b, x3, x0, vlx4
    eec4:      	cmpge	p4.b, p2/z, z19.b, #0x0
    eec8:      	<unknown>
    eecc:      	<unknown>
    eed0:      	ccmn	w18, w20, #0x5, pl
    eed4:      	fnmla	z0.h, p1/m, z17.h, z18.h
    eed8:      	<unknown>
    eedc:      	<unknown>
    eee0:      	cmpgt	p9.b, p2/z, z19.b, #0x0
    eee4:      	b.ne	0x4f630
    eee8:      	adr	x8, 0x4fb97
    eeec:      	ldpsw	x18, x25, [x11, #-0x50]
    eef0:      	<unknown>
    eef4:      	<unknown>
    eef8:      	<unknown>
    eefc:      	ldnp	d20, d26, [x11, #-0x140]
    ef00:      	b.eq	0x95724
    ef04:      	and	w9, w18, w5, lsr #21
    ef08:      	<unknown>
    ef0c:      	<unknown>
    ef10:      	uabal2	v3.4s, v27.8h, v5.8h
    ef14:      	<unknown>
    ef18:      	fnmla	z12.h, p6/m, z3.h, z6.h
    ef1c:      	<unknown>
    ef20:      	umlal2	v26.4s, v1.8h, v14.h[0]
    ef24:      	uabal2	v0.4s, v1.8h, v5.8h
    ef28:      	<unknown>
    ef2c:      	<unknown>
    ef30:      	<unknown>
    ef34:      	<unknown>
    ef38:      	<unknown>
    ef3c:      	<unknown>
    ef40:      	<unknown>
    ef44:      	<unknown>
    ef48:      	<unknown>
    ef4c:      	<unknown>
    ef50:      	<unknown>
    ef54:      	umax	v12.16b, v11.16b, v0.16b
    ef58:      	<unknown>
    ef5c:      	<unknown>
    ef60:      	ldnp	s8, s25, [x11, #-0xe0]
    ef64:      	rsubhn2	v0.8h, v25.4s, v1.4s
    ef68:      	<unknown>
    ef6c:      	uabdl2	v20.4s, v19.8h, v1.8h
    ef70:      	<unknown>
    ef74:      	<unknown>
    ef78:      	<unknown>
    ef7c:      	rsubhn2	v19.8h, v19.4s, v6.4s
    ef80:      	b.mi	0xd5e68
    ef84:      	<unknown>
    ef88:      	<unknown>
    ef8c:      	<unknown>
    ef90:      	ldnp	d6, d24, [x10, #-0x170]
    ef94:      	<unknown>
    ef98:      	<unknown>
    ef9c:      	fnmls	z5.h, p0/m, z11.h, z20.h
    efa0:      	<unknown>
    efa4:      	<unknown>
    efa8:      	cmpge	p5.b, p2/z, z19.b, #0x0
    efac:      	<unknown>
    efb0:      	adr	x5, 0xf9e3f
    efb4:      	<unknown>
    efb8:      	<unknown>
    efbc:      	ssubwb	z20.h, z18.h, z21.b
    efc0:      	<unknown>
    efc4:      	<unknown>
    efc8:      	raddhn2	v3.8h, v27.4s, v1.4s
    efcc:      	b.lo	0xe7c78
    efd0:      	<unknown>
    efd4:      	<unknown>
    efd8:      	<unknown>
    efdc:      	ldpsw	x0, x25, [x17, #-0xf8]
    efe0:      	<unknown>
    efe4:      	<unknown>
    efe8:      	<unknown>
    efec:      	ldnp	d9, d24, [x27, #-0x1f0]
    eff0:      	<unknown>
    eff4:      	umin	v16.8h, v27.8h, v9.8h
    eff8:      	bic	w20, w3, w17, lsl #8
    effc:      	<unknown>
    f000:      	fdot	z0.s, z9.b, z6.b[1]
    f004:      	<unknown>
    f008:      	fnmls	z14.h, p4/m, z27.h, z6.h
    f00c:      	umlal2	v18.4s, v3.8h, v3.h[0]
    f010:      	umin	v13.8h, v11.8h, v1.8h
    f014:      	usubl2	v4.4s, v3.8h, v15.8h
    f018:      	<unknown>
    f01c:      	<unknown>
    f020:      	ldpsw	x5, x28, [x2, #0x20]
    f024:      	fmul	z18.h, z3.h, z5.h[0]
    f028:      	ldp	d0, d29, [x1, #-0x170]
    f02c:      	sqshlu	v5.4s, v3.4s, #0x0
    f030:      	<unknown>
    f034:      	<unknown>
    f038:      	<unknown>
    f03c:      	<unknown>
    f040:      	<unknown>
    f044:      	<unknown>
    f048:      	eor	p5.b, p12/z, p3.b, p0.b
    f04c:      	<unknown>
    f050:      	b.al	0x4fcdc
    f054:      	<unknown>
    f058:      	<unknown>
    f05c:      	ldp	d3, d27, [x26, #-0x130]
    f060:      	<unknown>
    f064:      	<unknown>
    f068:      	fmul	z16.h, z3.h, z5.h[0]
    f06c:      	adr	x12, 0x99473
    f070:      	<unknown>
    f074:      	<unknown>
    f078:      	fnmls	z1.h, p2/m, z11.h, z12.h
    f07c:      	cmpge	p4.b, p2/z, z19.b, #0x0
    f080:      	stgp	x1, x14, [x19, #-0x400]
    f084:      	ldnp	d14, d29, [x19, #-0x1f0]
    f088:      	<unknown>
    f08c:      	fnmls	z18.h, p0/m, z11.h, z13.h
    f090:      	bic	w20, w11, w18, lsr #25
    f094:      	<unknown>
    f098:      	<unknown>
    f09c:      	<unknown>
    f0a0:      	<unknown>
    f0a4:      	<unknown>
    f0a8:      	uqshl	v1.2d, v3.2d, #0x29
    f0ac:      	<unknown>
    f0b0:      	<unknown>
    f0b4:      	ssubwb	z1.h, z26.h, z19.b
    f0b8:      	<unknown>
    f0bc:      	<unknown>
    f0c0:      	<unknown>
    f0c4:      	rsubhn2	v19.8h, v19.4s, v6.4s
    f0c8:      	<unknown>
    f0cc:      	ldnp	d1, d27, [x19, #-0x1c0]
    f0d0:      	raddhn2	v5.8h, v27.4s, v15.4s
    f0d4:      	<unknown>
    f0d8:      	fnmls	z4.h, p3/m, z26.h, z14.h
    f0dc:      	<unknown>
    f0e0:      	<unknown>
    f0e4:      	<unknown>
    f0e8:      	sqshlu	v18.2d, v11.2d, #0x23
    f0ec:      	<unknown>
    f0f0:      	<unknown>
    f0f4:      	<unknown>
    f0f8:      	<unknown>
    f0fc:      	<unknown>
    f100:      	bic	w0, w9, w4, lsr #9
    f104:      	<unknown>
    f108:      	ldpsw	x0, x17, [x17, #-0xf8]
    f10c:      	<unknown>
    f110:      	<unknown>
    f114:      	ldnp	d14, d24, [x11, #-0x1e0]
    f118:      	<unknown>
    f11c:      	<unknown>
    f120:      	umlal2	v20.4s, v3.8h, v13.h[2]
    f124:      	bic	w4, w11, w0, lsl #25
    f128:      	<unknown>
    f12c:      	<unknown>
    f130:      	uqxtn2	v3.8h, v3.4s
    f134:      	raddhnt	z4.b, z3.h, z5.h
    f138:      	fnmla	z16.h, p1/m, z11.h, z22.h
    f13c:      	and	p14.b, p13/z, p3.b, p0.b
    f140:      	<unknown>
    f144:      	fnmls	z1.h, p2/m, z11.h, z12.h
    f148:      	umlal2	v4.4s, v3.8h, v4.h[3]
    f14c:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    f150:      	<unknown>
    f154:      	rsubhn2	v0.8h, v25.4s, v15.4s
    f158:      	ldnp	d20, d28, [x19, #-0x110]
    f15c:      	<unknown>
    f160:      	uabd	v5.8h, v19.8h, v5.8h
    f164:      	cmpgt	p4.b, p2/z, z19.b, #0x0
    f168:      	<unknown>
    f16c:      	fnmls	z1.h, p2/m, z11.h, z12.h
    f170:      	umlal2	v4.4s, v3.8h, v4.h[3]
    f174:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    f178:      	<unknown>
    f17c:      	umin	v0.8h, v17.8h, v15.8h
    f180:      	rsubhn2	v0.8h, v25.4s, v15.4s
    f184:      	ldnp	d20, d28, [x19, #-0x110]
    f188:      	<unknown>
    f18c:      	uabd	v5.8h, v19.8h, v5.8h
    f190:      	<unknown>
    f194:      	rsubhn2	v19.8h, v19.4s, v6.4s
    f198:      	<unknown>
    f19c:      	ldnp	d1, d27, [x19, #-0x1c0]
    f1a0:      	ldnp	d5, d16, [x19, #-0xb0]
    f1a4:      	<unknown>
    f1a8:      	<unknown>
    f1ac:      	<unknown>
    f1b0:      	<unknown>
    f1b4:      	<unknown>
    f1b8:      	fnmls	z5.h, p2/m, z11.h, z22.h
    f1bc:      	<unknown>
    f1c0:      	ldp	d18, d25, [x11, #-0x1f0]
    f1c4:      	fnmls	z0.h, p1/m, z9.h, z22.h
    f1c8:      	uqshl	v14.4s, v3.4s, #0x0
    f1cc:      	umlal2	v14.4s, v3.8h, v14.h[2]
    f1d0:      	<unknown>
    f1d4:      	ldp	d18, d25, [x11, #-0x1f0]
    f1d8:      	<unknown>
    f1dc:      	adr	x5, 0xd7fab
    f1e0:      	<unknown>
    f1e4:      	<unknown>
    f1e8:      	rsubhn2	v19.8h, v19.4s, v6.4s
    f1ec:      	<unknown>
    f1f0:      	ldpsw	x21, x24, [x19, #-0x98]
    f1f4:      	<unknown>
    f1f8:      	fnmls	z14.h, p3/m, z26.h, z4.h
    f1fc:      	<unknown>
    f200:      	fnmla	z0.h, p4/m, z1.h, z18.h
    f204:      	fnmls	z16.h, p0/m, z11.h, z18.h
    f208:      	<unknown>
    f20c:      	ldnp	d6, d24, [x10, #-0x170]
    f210:      	<unknown>
    f214:      	adr	x16, 0x5a119
    f218:      	<unknown>
    f21c:      	<unknown>
    f220:      	<unknown>
    f224:      	<unknown>
    f228:      	<unknown>
    f22c:      	<unknown>
    f230:      	ldeorh	w16, w26, [x1]
    f234:      	ldseth	w24, w5, [x1]
    f238:      	<unknown>
    f23c:      	<unknown>
    f240:      	<unknown>
    f244:      	<unknown>
    f248:      	ldnp	d6, d24, [x10, #-0x170]
    f24c:      	<unknown>
    f250:      	adr	x16, 0x5a155
    f254:      	<unknown>
    f258:      	<unknown>
    f25c:      	<unknown>
    f260:      	<unknown>
    f264:      	<unknown>
    f268:      	<unknown>
    f26c:      	sri	v5.2d, v19.2d, #0xe
    f270:      	<unknown>
    f274:      	<unknown>
    f278:      	<unknown>
    f27c:      	<unknown>
    f280:      	<unknown>
    f284:      	<unknown>
    f288:      	fnmls	z14.h, p3/m, z27.h, z4.h
    f28c:      	udf	#0xa73
    f290:      	<unknown>
    f294:      	<unknown>
    f298:      	<unknown>
    f29c:      	<unknown>
    f2a0:      	<unknown>
    f2a4:      	<unknown>
    f2a8:      	udf	#0x64
    f2ac:      	<unknown>
    f2b0:      	<unknown>
    f2b4:      	<unknown>
    f2b8:      	<unknown>
    f2bc:      	fnmls	z13.h, p1/m, z11.h, z20.h
    f2c0:      	<unknown>
    f2c4:      	<unknown>
    f2c8:      	<unknown>
    f2cc:      	<unknown>
    f2d0:      	<unknown>
    f2d4:      	<unknown>
    f2d8:      	<unknown>
    f2dc:      	<unknown>
    f2e0:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    f2e4:      	sqshlu	v18.2d, v11.2d, #0x10
    f2e8:      	and	p12.b, p11/z, p3.b, p0.b
    f2ec:      	<unknown>
    f2f0:      	rsubhn2	v19.8h, v19.4s, v6.4s
    f2f4:      	<unknown>
    f2f8:      	<unknown>
    f2fc:      	<unknown>
    f300:      	bic	w12, w11, w4, lsr #25
    f304:      	<unknown>
    f308:      	<unknown>
    f30c:      	<unknown>
    f310:      	<unknown>
    f314:      	ldpsw	x15, x27, [x19, #-0xd0]
    f318:      	fcmla	v7.8h, v3.8h, v18.h[1], #180
    f31c:      	<unknown>
    f320:      	usubl2	v12.4s, v3.8h, v21.8h
    f324:      	fnmls	z2.h, p0/m, z11.h, z12.h
    f328:      	<unknown>
    f32c:      	<unknown>
    f330:      	<unknown>
    f334:      	<unknown>
    f338:      	<unknown>
    f33c:      	<unknown>
    f340:      	<unknown>
    f344:      	<unknown>
    f348:      	<unknown>
    f34c:      	<unknown>
    f350:      	<unknown>
    f354:      	cmpge	p10.b, p2/z, z16.b, #0x0
    f358:      	adr	x1, 0x4faa6
    f35c:      	<unknown>
    f360:      	<unknown>
    f364:      	fcmla	v7.8h, v3.8h, v18.h[1], #180
    f368:      	<unknown>
    f36c:      	<unknown>
    f370:      	<unknown>
    f374:      	fcmla	v5.8h, v19.8h, v16.h[0], #270
    f378:      	stp	w18, w29, [x3, #-0xc0]
    f37c:      	ldpsw	x0, x25, [x17, #-0xf8]
    f380:      	<unknown>
    f384:      	<unknown>
    f388:      	<unknown>
    f38c:      	<unknown>
    f390:      	<unknown>
    f394:      	<unknown>
    f398:      	<unknown>
    f39c:      	and	w4, w2, w13, lsl #20
    f3a0:      	<unknown>
    f3a4:      	<unknown>
    f3a8:      	<unknown>
    f3ac:      	<unknown>
    f3b0:      	<unknown>
    f3b4:      	<unknown>
    f3b8:      	<unknown>
    f3bc:      	<unknown>
    f3c0:      	<unknown>
    f3c4:      	<unknown>
    f3c8:      	ldpsw	x5, x18, [x11, #-0x90]
    f3cc:      	adr	x20, 0xe9cfb
    f3d0:      	<unknown>
    f3d4:      	<unknown>
    f3d8:      	<unknown>
    f3dc:      	<unknown>
    f3e0:      	<unknown>
    f3e4:      	<unknown>
    f3e8:      	<unknown>
    f3ec:      	<unknown>
    f3f0:      	<unknown>
    f3f4:      	umlal2	v14.4s, v3.8h, v0.h[1]
    f3f8:      	<unknown>
    f3fc:      	<unknown>
    f400:      	and	w5, w1, w13, lsl #25
    f404:      	<unknown>
    f408:      	<unknown>
    f40c:      	<unknown>
    f410:      	<unknown>
    f414:      	<unknown>
    f418:      	<unknown>
    f41c:      	ldnp	d3, d24, [x11, #-0x1e0]
    f420:      	ldpsw	x5, x8, [x3, #-0xe0]
    f424:      	rsubhn2	v19.8h, v27.4s, v15.4s
    f428:      	<unknown>
    f42c:      	<unknown>
    f430:      	<unknown>
    f434:      	<unknown>
    f438:      	<unknown>
    f43c:      	<unknown>
    f440:      	<unknown>
    f444:      	<unknown>
    f448:      	<unknown>
    f44c:      	<unknown>
    f450:      	<unknown>
    f454:      	<unknown>
    f458:      	fnmls	z20.h, p0/m, z11.h, z7.h
    f45c:      	<unknown>
    f460:      	<unknown>
    f464:      	<unknown>
    f468:      	<unknown>
    f46c:      	<unknown>
    f470:      	<unknown>
    f474:      	<unknown>
    f478:      	<unknown>
    f47c:      	fnmls	z18.h, p1/m, z11.h, z3.h
    f480:      	<unknown>
    f484:      	<unknown>
    f488:      	<unknown>
    f48c:      	<unknown>
    f490:      	<unknown>
    f494:      	fnmls	z20.h, p0/m, z11.h, z20.h
    f498:      	<unknown>
    f49c:      	<unknown>
    f4a0:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    f4a4:      	<unknown>
    f4a8:      	fnmls	z14.h, p1/m, z3.h, z12.h
    f4ac:      	<unknown>
    f4b0:      	<unknown>
    f4b4:      	<unknown>
    f4b8:      	ldpsw	x0, x17, [x17, #-0xf8]
    f4bc:      	<unknown>
    f4c0:      	<unknown>
    f4c4:      	<unknown>
    f4c8:      	ldpsw	x15, x27, [x19, #-0xd0]
    f4cc:      	<unknown>
    f4d0:      	<unknown>
    f4d4:      	bic	w0, w9, w4, lsr #9
    f4d8:      	<unknown>
    f4dc:      	ldpsw	x0, x17, [x17, #-0xf8]
    f4e0:      	<unknown>
    f4e4:      	<unknown>
    f4e8:      	<unknown>
    f4ec:      	<unknown>
    f4f0:      	fnmls	z5.h, p4/m, z27.h, z20.h
    f4f4:      	umlal2	v4.4s, v3.8h, v3.h[2]
    f4f8:      	<unknown>
    f4fc:      	<unknown>
    f500:      	<unknown>
    f504:      	<unknown>
    f508:      	<unknown>
    f50c:      	<unknown>
    f510:      	fnmls	z3.h, p3/m, z26.h, z18.h
    f514:      	<unknown>
    f518:      	ldpsw	x15, x27, [x19, #-0xd0]
    f51c:      	<unknown>
    f520:      	<unknown>
    f524:      	<unknown>
    f528:      	fcmne	p7.h, p0/z, z27.h, z19.h
    f52c:      	raddhn2	v20.8h, v27.4s, v15.4s
    f530:      	<unknown>
    f534:      	<unknown>
    f538:      	fnmls	z1.h, p2/m, z11.h, z12.h
    f53c:      	ands	w4, w3, #0xf800000f
    f540:      	<unknown>
    f544:      	<unknown>
    f548:      	<unknown>
    f54c:      	<unknown>
    f550:      	<unknown>
    f554:      	fnmls	z9.h, p3/m, z19.h, z20.h
    f558:      	<unknown>
    f55c:      	fmul	z5.h, z3.h, z5.h[0]
    f560:      	<unknown>
    f564:      	b.le	0xb614c
    f568:      	shl	d1, d2, #0x5
    f56c:      	<unknown>
    f570:      	bc.nv	0x99fd8
    f574:      	<unknown>
    f578:      	<unknown>
    f57c:      	saddwb	z20.h, z10.h, z20.b
    f580:      	<unknown>
    f584:      	<unknown>
    f588:      	<unknown>
    f58c:      	<unknown>
    f590:      	<unknown>
    f594:      	<unknown>
    f598:      	<unknown>
    f59c:      	bc.lo	0x92024
    f5a0:      	<unknown>
    f5a4:      	<unknown>
    f5a8:      	<unknown>
    f5ac:      	<unknown>
    f5b0:      	<unknown>
    f5b4:      	<unknown>
    f5b8:      	<unknown>
    f5bc:      	<unknown>
    f5c0:      	<unknown>
    f5c4:      	<unknown>
    f5c8:      	b.hi	0xb5fb0
    f5cc:      	retaasppc	0xef64 <.text+0xdf64>
    f5d0:      	<unknown>
    f5d4:      	saddwb	z20.h, z10.h, z20.b
    f5d8:      	<unknown>
    f5dc:      	b.gt	0xb61c4
    f5e0:      	<unknown>
    f5e4:      	retaasppc	0xef7c <.text+0xdf7c>
    f5e8:      	<unknown>
    f5ec:      	saddwb	z20.h, z10.h, z20.b
    f5f0:      	bc.nv	0x9a058
    f5f4:      	<unknown>
    f5f8:      	<unknown>
    f5fc:      	<unknown>
    f600:      	saddwb	z20.h, z10.h, z20.b
    f604:      	adr	xzr, 0xc1e4e
    f608:      	<unknown>
    f60c:      	bc.lo	0x92094
    f610:      	<unknown>
    f614:      	<unknown>
    f618:      	<unknown>
    f61c:      	fnmls	z12.h, p2/m, z11.h, z26.h
    f620:      	ldp	d0, d21, [x8, #-0xd0]
    f624:      	<unknown>
    f628:      	subhnb	z5.b, z27.h, z19.h
    f62c:      	<unknown>
    f630:      	<unknown>
    f634:      	usubwb	z31.h, z2.h, z6.b
    f638:      	<unknown>
    f63c:      	ssubwb	z13.h, z2.h, z12.b
    f640:      	saddwt	z20.h, z10.h, z31.b
    f644:      	<unknown>
    f648:      	<unknown>
    f64c:      	luti4	v5.8h, { v18.8h, v19.8h }, v31[2]
    f650:      	ssubwt	z15.h, z2.h, z18.b
    f654:      	<unknown>
    f658:      	<unknown>
    f65c:      	<unknown>
    f660:      	b.pl	0x9a0c8
    f664:      	<unknown>
    f668:      	<unknown>
    f66c:      	<unknown>
    f670:      	uaddwt	z15.h, z18.h, z14.b
    f674:      	ssubwt	z3.h, z2.h, z31.b
    f678:      	<unknown>
    f67c:      	<unknown>
    f680:      	<unknown>
    f684:      	ssubwb	z13.h, z2.h, z12.b
    f688:      	saddwt	z20.h, z10.h, z31.b
    f68c:      	<unknown>
    f690:      	usubwt	z13.h, z26.h, z19.b
    f694:      	bc.mi	0xb627c
    f698:      	<unknown>
    f69c:      	<unknown>
    f6a0:      	umlsl2	v14.4s, v27.8h, v14.h[6]
    f6a4:      	<unknown>
    f6a8:      	<unknown>
    f6ac:      	<unknown>
    f6b0:      	<unknown>
    f6b4:      	ldxrh	w19, [x2]
    f6b8:      	smlslt	z15.h, z10.b, z12.b
    f6bc:      	<unknown>
    f6c0:      	adr	x8, 0xafeea
    f6c4:      	<unknown>
    f6c8:      	adr	x21, 0xea532
    f6cc:      	fnmls	z18.h, p3/m, z27.h, z3.h
    f6d0:      	<unknown>
    f6d4:      	<unknown>
    f6d8:      	fnmls	z15.h, p4/m, z19.h, z11.h
    f6dc:      	<unknown>
    f6e0:      	<unknown>
    f6e4:      	ldpsw	x22, x24, [x11, #-0xa0]
    f6e8:      	<unknown>
    f6ec:      	uabdl2	v18.4s, v19.8h, v5.8h
    f6f0:      	<unknown>
    f6f4:      	<unknown>
    f6f8:      	<unknown>
    f6fc:      	<unknown>
    f700:      	ldpsw	x22, x24, [x11, #-0xa0]
    f704:      	fmls	z4.h, p0/m, z3.h, z14.h
    f708:      	<unknown>
    f70c:      	fnmls	z20.h, p0/m, z11.h, z20.h
    f710:      	<unknown>
    f714:      	fnmls	z21.h, p4/m, z19.h, z14.h
    f718:      	uqsub	v4.16b, v3.16b, v0.16b
    f71c:      	<unknown>
    f720:      	<unknown>
    f724:      	<unknown>
    f728:      	<unknown>
    f72c:      	<unknown>
    f730:      	psel	p5, p8, p9.h[w14, 1]
    f734:      	<unknown>
    f738:      	bc.lo	0xb3fe0
    f73c:      	<unknown>
    f740:      	<unknown>
    f744:      	<unknown>
    f748:      	ldp	d15, d26, [x1, #-0x110]
    f74c:      	fmls	z5.h, p3/m, z27.h, z10.h
    f750:      	<unknown>
    f754:      	tbz	w19, #0x6, 0x11d40 <.text+0x10d40>
    f758:      	<unknown>
    f75c:      	<unknown>
    f760:      	sub	w5, w18, #0x7d3, lsl #12 // =0x7d3000
    f764:      	<unknown>
    f768:      	<unknown>
    f76c:      	<unknown>
    f770:      	uaddwt	z13.h, z26.h, z4.b
    f774:      	<unknown>
    f778:      	strb	w13, [x2, #0xe4e]
    f77c:      	<unknown>
    f780:      	strb	w13, [x3, #0xe4e]
    f784:      	<unknown>
    f788:      	ldpsw	x15, x29, [x3, #0xf8]
    f78c:      	fnmls	z13.h, p0/m, z11.h, z7.h
    f790:      	<unknown>
    f794:      	subs	w15, w11, w16, lsr #27
    f798:      	<unknown>
    f79c:      	<unknown>
    f7a0:      	<unknown>
    f7a4:      	<unknown>
    f7a8:      	<unknown>
    f7ac:      	<unknown>
    f7b0:      	rsubhn2	v19.8h, v19.4s, v6.4s
    f7b4:      	ldnp	d3, d29, [x2, #-0xe0]
    f7b8:      	ldp	d19, d27, [x10, #0x90]
    f7bc:      	<unknown>
    f7c0:      	<unknown>
    f7c4:      	ldpsw	x0, x17, [x17, #-0xf8]
    f7c8:      	<unknown>
    f7cc:      	<unknown>
    f7d0:      	<unknown>
    f7d4:      	<unknown>
    f7d8:      	<unknown>
    f7dc:      	<unknown>
    f7e0:      	bic	w6, w11, w18, lsr #25
    f7e4:      	ldp	d0, d21, [x8, #-0xd0]
    f7e8:      	fdot	z31.s, z10.b, z6.b[1]
    f7ec:      	uabdl2	v20.4s, v18.8h, v1.8h
    f7f0:      	<unknown>
    f7f4:      	ldpsw	xzr, x21, [x26, #-0xf8]
    f7f8:      	<unknown>
    f7fc:      	ldpsw	x26, x8, [x1, #0xa0]
    f800:      	<unknown>
    f804:      	<unknown>
    f808:      	<unknown>
    f80c:      	<unknown>
    f810:      	<unknown>
    f814:      	ldp	d3, d27, [x27, #-0x130]
    f818:      	<unknown>
    f81c:      	<unknown>
    f820:      	<unknown>
    f824:      	cmpge	p8.b, p2/z, z19.b, #0x0
    f828:      	<unknown>
    f82c:      	<unknown>
    f830:      	ccmn	w18, w20, #0x5, pl
    f834:      	<unknown>
    f838:      	<unknown>
    f83c:      	<unknown>
    f840:      	cmpge	p9.b, p2/z, z17.b, #0x0
    f844:      	<unknown>
    f848:      	fnmls	z1.h, p2/m, z11.h, z12.h
    f84c:      	umlal2	v4.4s, v3.8h, v4.h[3]
    f850:      	<unknown>
    f854:      	<unknown>
    f858:      	<unknown>
    f85c:      	<unknown>
    f860:      	sqshlu	v14.2d, v3.2d, #0x30
    f864:      	<unknown>
    f868:      	<unknown>
    f86c:      	fnmls	z20.h, p0/m, z11.h, z20.h
    f870:      	bic	w0, w9, w1, lsr #9
    f874:      	ldp	d0, d21, [x8, #-0xd0]
    f878:      	<unknown>
    f87c:      	<unknown>
    f880:      	<unknown>
    f884:      	ldp	d0, d21, [x8, #-0xd0]
    f888:      	<unknown>
    f88c:      	<unknown>
    f890:      	smullb	z21.h, z3.b, z31.b
    f894:      	ldrh	w14, [x3, #0x193a]
    f898:      	<unknown>
    f89c:      	<unknown>
    f8a0:      	<unknown>
    f8a4:      	stnp	w20, w14, [x18, #-0x100]
    f8a8:      	<unknown>
    f8ac:      	<unknown>
    f8b0:      	<unknown>
    f8b4:      	<unknown>
    f8b8:      	<unknown>
    f8bc:      	addhnb	z9.b, z27.h, z5.h
    f8c0:      	<unknown>
    f8c4:      	cmpge	p9.b, p2/z, z17.b, #0x0
    f8c8:      	<unknown>
    f8cc:      	<unknown>
    f8d0:      	ccmn	w18, w20, #0x5, pl
    f8d4:      	<unknown>
    f8d8:      	<unknown>
    f8dc:      	<unknown>
    f8e0:      	<unknown>
    f8e4:      	<unknown>
    f8e8:      	<unknown>
    f8ec:      	<unknown>
    f8f0:      	<unknown>
    f8f4:      	<unknown>
    f8f8:      	fnmls	z14.h, p4/m, z27.h, z6.h
    f8fc:      	<unknown>
    f900:      	<unknown>
    f904:      	<unknown>
    f908:      	adr	x12, 0x9a4f2
    f90c:      	<unknown>
    f910:      	adr	x3, 0x9a4fa
    f914:      	<unknown>
    f918:      	bc.nv	0xba300
    f91c:      	bic	w29, w10, w9, lsl #10
    f920:      	<unknown>
    f924:      	ldp	d0, d16, [x25, #-0x110]
    f928:      	<unknown>
    f92c:      	<unknown>
    f930:      	<unknown>
    f934:      	<unknown>
    f938:      	fnmls	z0.h, p0/m, z25.h, z8.h
    f93c:      	ldnp	s3, s26, [x27, #-0x68]
    f940:      	<unknown>
    f944:      	umin	v12.8h, v3.8h, v9.8h
    f948:      	adr	x7, 0x99d56
    f94c:      	<unknown>
    f950:      	sqdmlsl	s21, h26, v13.h[2]
    f954:      	ldnp	d3, d29, [x2, #-0xe0]
    f958:      	<unknown>
    f95c:      	<unknown>
    f960:      	fcmla	v5.8h, v19.8h, v3.h[0], #270
    f964:      	fnmls	z13.h, p4/m, z3.h, z12.h
    f968:      	<unknown>
    f96c:      	<unknown>
    f970:      	<unknown>
    f974:      	<unknown>
    f978:      	sabdlb	z19.h, z19.b, z31.b
    f97c:      	ldrh	w14, [x3, #0x193a]
    f980:      	<unknown>
    f984:      	ldpsw	x0, x17, [x17, #-0xf8]
    f988:      	<unknown>
    f98c:      	<unknown>
    f990:      	<unknown>
    f994:      	<unknown>
    f998:      	<unknown>
    f99c:      	adr	x3, 0xea787
    f9a0:      	fnmls	z12.h, p1/m, z11.h, z20.h
    f9a4:      	<unknown>
    f9a8:      	<unknown>
    f9ac:      	uqshl	v1.2d, v3.2d, #0x29
    f9b0:      	<unknown>
    f9b4:      	<unknown>
    f9b8:      	<unknown>
    f9bc:      	<unknown>
    f9c0:      	ldr	x19, 0xce00c
    f9c4:      	<unknown>
    f9c8:      	ldnp	d15, d27, [x11, #-0x100]
    f9cc:      	<unknown>
    f9d0:      	<unknown>
    f9d4:      	ldnp	d6, d24, [x10, #-0x170]
    f9d8:      	<unknown>
    f9dc:      	fmls	z15.h, p0/m, z3.h, z19.h
    f9e0:      	ldr	x14, 0x5066c
    f9e4:      	<unknown>
    f9e8:      	ldnp	d15, d27, [x11, #-0x100]
    f9ec:      	<unknown>
    f9f0:      	ldpsw	x14, x27, [x27, #-0x60]
    f9f4:      	<unknown>
    f9f8:      	<unknown>
    f9fc:      	<unknown>
    fa00:      	fnmls	z3.h, p3/m, z3.h, z9.h
    fa04:      	<unknown>
    fa08:      	sqdmlsl	s21, h26, v13.h[2]
    fa0c:      	ldnp	d3, d29, [x2, #-0xe0]
    fa10:      	<unknown>
    fa14:      	fnmla	z31.h, p6/m, z2.h, z6.h
    fa18:      	ldp	d18, d16, [x27, #-0x110]
    fa1c:      	<unknown>
    fa20:      	<unknown>
    fa24:      	ldrh	w13, [x27, #0x12e]
    fa28:      	<unknown>
    fa2c:      	sqshl	d19, d2, #0x33
    fa30:      	<unknown>
    fa34:      	adr	x12, 0xce6e2
    fa38:      	ldpsw	x5, x27, [x19, #-0xe0]
    fa3c:      	fcmeq	p14.h, p1/z, z27.h, z19.h
    fa40:      	<unknown>
    fa44:      	<unknown>
    fa48:      	ldnp	d6, d24, [x10, #-0x170]
    fa4c:      	<unknown>
    fa50:      	fmls	z15.h, p0/m, z3.h, z19.h
    fa54:      	<unknown>
    fa58:      	<unknown>
    fa5c:      	<unknown>
    fa60:      	<unknown>
    fa64:      	<unknown>
    fa68:      	<unknown>
    fa6c:      	<unknown>
    fa70:      	<unknown>
    fa74:      	sqshl	d1, d3, #0x21
    fa78:      	<unknown>
    fa7c:      	<unknown>
    fa80:      	ldrh	w5, [x11, #0x1230]
    fa84:      	<unknown>
    fa88:      	ldpsw	x0, x17, [x17, #-0xf8]
    fa8c:      	<unknown>
    fa90:      	<unknown>
    fa94:      	<unknown>
    fa98:      	<unknown>
    fa9c:      	<unknown>
    faa0:      	<unknown>
    faa4:      	<unknown>
    faa8:      	<unknown>
    faac:      	bic	w0, w9, w4, lsr #9
    fab0:      	<unknown>
    fab4:      	<unknown>
    fab8:      	<unknown>
    fabc:      	stnp	w20, w14, [x18, #-0x100]
    fac0:      	ldp	s5, s29, [x18, #-0x60]
    fac4:      	ldp	d30, d21, [x1, #-0x1b0]
    fac8:      	<unknown>
    facc:      	<unknown>
    fad0:      	ldpsw	x4, x25, [x10, #-0x50]
    fad4:      	<unknown>
    fad8:      	ldp	w5, w27, [x19, #-0x60]
    fadc:      	<unknown>
    fae0:      	<unknown>
    fae4:      	<unknown>
    fae8:      	<unknown>
    faec:      	<unknown>
    faf0:      	fcmla	v5.8h, v19.8h, v3.h[0], #270
    faf4:      	fnmls	z13.h, p4/m, z3.h, z12.h
    faf8:      	<unknown>
    fafc:      	<unknown>
    fb00:      	<unknown>
    fb04:      	<unknown>
    fb08:      	<unknown>
    fb0c:      	<unknown>
    fb10:      	fcmge	p13.h, p7/z, z27.h, z19.h
    fb14:      	<unknown>
    fb18:      	<unknown>
    fb1c:      	<unknown>
    fb20:      	<unknown>
    fb24:      	<unknown>
    fb28:      	<unknown>
    fb2c:      	<unknown>
    fb30:      	<unknown>
    fb34:      	<unknown>
    fb38:      	<unknown>
    fb3c:      	<unknown>
    fb40:      	adr	x3, 0xe298f
    fb44:      	bic	w20, w27, w18, lsr #27
    fb48:      	<unknown>
    fb4c:      	<unknown>
    fb50:      	<unknown>
    fb54:      	<unknown>
    fb58:      	<unknown>
    fb5c:      	shl	v1.2d, v2.2d, #0x9
    fb60:      	<unknown>
    fb64:      	<unknown>
    fb68:      	<unknown>
    fb6c:      	<unknown>
    fb70:      	<unknown>
    fb74:      	<unknown>
    fb78:      	ldnp	s0, s9, [x9, #-0x70]
    fb7c:      	fnmls	z0.h, p1/m, z17.h, z18.h
    fb80:      	<unknown>
    fb84:      	<unknown>
    fb88:      	adr	x3, 0xe29d7
    fb8c:      	<unknown>
    fb90:      	sqshlu	v13.2d, v11.2d, #0x2d
    fb94:      	<unknown>
    fb98:      	<unknown>
    fb9c:      	<unknown>
    fba0:      	<unknown>
    fba4:      	<unknown>
    fba8:      	<unknown>
    fbac:      	<unknown>
    fbb0:      	<unknown>
    fbb4:      	fcmne	p4.h, p1/z, z11.h, z4.h
    fbb8:      	fnmls	z22.h, p2/m, z11.h, z3.h
    fbbc:      	<unknown>
    fbc0:      	<unknown>
    fbc4:      	ldpsw	x4, x25, [x11, #-0x50]
    fbc8:      	ubfx	w3, w11, #0, #26
    fbcc:      	smlal2	v19.4s, v2.8h, v2.h[0]
    fbd0:      	<unknown>
    fbd4:      	rsubhn2	v0.8h, v25.4s, v15.4s
    fbd8:      	<unknown>
    fbdc:      	<unknown>
    fbe0:      	<unknown>
    fbe4:      	ubfx	w12, w11, #0, #26
    fbe8:      	umlal2	v19.4s, v2.8h, v3.h[2]
    fbec:      	<unknown>
    fbf0:      	<unknown>
    fbf4:      	<unknown>
    fbf8:      	rsubhn2	v0.8h, v25.4s, v15.4s
    fbfc:      	<unknown>
    fc00:      	stgp	x19, x20, [x26, #-0x400]
    fc04:      	<unknown>
    fc08:      	fnmls	z6.h, p0/m, z11.h, z3.h
    fc0c:      	<unknown>
    fc10:      	<unknown>
    fc14:      	<unknown>
    fc18:      	stgp	x19, x20, [x26, #-0x400]
    fc1c:      	<unknown>
    fc20:      	fnmls	z6.h, p0/m, z11.h, z3.h
    fc24:      	<unknown>
    fc28:      	<unknown>
    fc2c:      	<unknown>
    fc30:      	<unknown>
    fc34:      	ubfx	w3, w11, #0, #26
    fc38:      	usubl2	v19.4s, v2.8h, v5.8h
    fc3c:      	ldpsw	x4, x28, [x3, #-0x88]
    fc40:      	<unknown>
    fc44:      	fnmls	z1.h, p0/m, z19.h, z12.h
    fc48:      	<unknown>
    fc4c:      	adr	x5, 0xd8a1b
    fc50:      	<unknown>
    fc54:      	<unknown>
    fc58:      	<unknown>
    fc5c:      	<unknown>
    fc60:      	umin	v16.8h, v27.8h, v9.8h
    fc64:      	<unknown>
    fc68:      	<unknown>
    fc6c:      	umin	v16.8h, v27.8h, v9.8h
    fc70:      	umlal2	v20.4s, v3.8h, v3.h[2]
    fc74:      	uabdl2	v13.4s, v3.8h, v1.8h
    fc78:      	<unknown>
    fc7c:      	<unknown>
    fc80:      	ldpsw	x4, x25, [x10, #-0x50]
    fc84:      	ldnp	d3, d25, [x11, #0x30]
    fc88:      	<unknown>
    fc8c:      	ldp	d13, d26, [x11, #-0xd0]
    fc90:      	<unknown>
    fc94:      	<unknown>
    fc98:      	fmaxnmv	h26, p0, z1.h
    fc9c:      	fnmls	z22.h, p2/m, z11.h, z3.h
    fca0:      	<unknown>
    fca4:      	<unknown>
    fca8:      	<unknown>
    fcac:      	<unknown>
    fcb0:      	cmpge	p8.b, p2/z, z19.b, #0x0
    fcb4:      	<unknown>
    fcb8:      	<unknown>
    fcbc:      	cmla	z18.h, z3.h, z9.h, #0
    fcc0:      	<unknown>
    fcc4:      	<unknown>
    fcc8:      	cmpge	p8.b, p2/z, z19.b, #0x0
    fccc:      	adr	x1, 0x5041a
    fcd0:      	<unknown>
    fcd4:      	<unknown>
    fcd8:      	ldpsw	x4, x8, [x2, #-0x98]
    fcdc:      	<unknown>
    fce0:      	<unknown>
    fce4:      	psel	p5, p8, p9.h[w14, 1]
    fce8:      	stgp	x1, x14, [x19, #-0x400]
    fcec:      	ldnp	d14, d29, [x19, #-0x1f0]
    fcf0:      	adr	x9, 0x5097f
    fcf4:      	ldp	d1, d28, [x19, #-0x1f0]
    fcf8:      	<unknown>
    fcfc:      	<unknown>
    fd00:      	<unknown>
    fd04:      	fnmls	z3.h, p3/m, z26.h, z18.h
    fd08:      	<unknown>
    fd0c:      	<unknown>
    fd10:      	<unknown>
    fd14:      	adr	x4, 0xeabbf
    fd18:      	<unknown>
    fd1c:      	<unknown>
    fd20:      	<unknown>
    fd24:      	<unknown>
    fd28:      	ldpsw	x9, x24, [x11, #-0xa0]
    fd2c:      	<unknown>
    fd30:      	<unknown>
    fd34:      	psel	p5, p8, p9.h[w14, 1]
    fd38:      	adr	x1, 0x50485
    fd3c:      	fnmls	z0.h, p1/m, z9.h, z22.h
    fd40:      	<unknown>
    fd44:      	fnmls	z21.h, p1/m, z19.h, z6.h
    fd48:      	<unknown>
    fd4c:      	fcmla	v21.8h, v3.8h, v16.h[1], #270
    fd50:      	<unknown>
    fd54:      	<unknown>
    fd58:      	fnmls	z3.h, p3/m, z27.h, z18.h
    fd5c:      	cmpge	p1.b, p2/z, z17.b, #0x0
    fd60:      	<unknown>
    fd64:      	fmls	z26.h, p0/m, z1.h, z13.h
    fd68:      	ldrh	w13, [x27, #0x1936]
    fd6c:      	ldnp	d0, d24, [x9, #-0x140]
    fd70:      	<unknown>
    fd74:      	<unknown>
    fd78:      	ldnp	d6, d24, [x11, #-0x170]
    fd7c:      	<unknown>
    fd80:      	<unknown>
    fd84:      	ldpsw	x15, x27, [x19, #-0xd0]
    fd88:      	fnmls	z7.h, p5/m, z11.h, z18.h
    fd8c:      	uabd	v5.8h, v18.8h, v5.8h
    fd90:      	<unknown>
    fd94:      	<unknown>
    fd98:      	psel	p5, p8, p9.h[w14, 1]
    fd9c:      	<unknown>
    fda0:      	umax	v8.16b, v11.16b, v0.16b
    fda4:      	fnmls	z21.h, p3/m, z11.h, z2.h
    fda8:      	<unknown>
    fdac:      	fnmls	z0.h, p1/m, z9.h, z22.h
    fdb0:      	<unknown>
    fdb4:      	fnmls	z21.h, p1/m, z19.h, z6.h
    fdb8:      	<unknown>
    fdbc:      	fnmls	z24.h, p0/m, z27.h, z5.h
    fdc0:      	<unknown>
    fdc4:      	<unknown>
    fdc8:      	ldpsw	x23, x8, [x3, #-0xa0]
    fdcc:      	bic	w13, w11, w20, lsr #26
    fdd0:      	<unknown>
    fdd4:      	<unknown>
    fdd8:      	adr	x20, 0x9aa86
    fddc:      	adr	x13, 0x100a06
    fde0:      	ldpsw	x11, x29, [x3, #0x98]
    fde4:      	<unknown>
    fde8:      	umlsl2	v23.4s, v27.8h, v3.h[0]
    fdec:      	<unknown>
    fdf0:      	subhnb	z21.b, z19.h, z5.h
    fdf4:      	<unknown>
    fdf8:      	<unknown>
    fdfc:      	ldrh	w0, [x1, #0x1438]
    fe00:      	<unknown>
    fe04:      	usubl2	v12.4s, v3.8h, v5.8h
    fe08:      	ldpsw	x4, x28, [x3, #-0x88]
    fe0c:      	<unknown>
    fe10:      	ldnp	d4, d8, [x3, #-0x1f0]
    fe14:      	<unknown>
    fe18:      	umlal2	v25.4s, v3.8h, v3.h[2]
    fe1c:      	<unknown>
    fe20:      	<unknown>
    fe24:      	ldp	d10, d0, [x0, #0x30]
    fe28:      	<unknown>
    fe2c:      	<unknown>
    fe30:      	ldrh	w0, [x1, #0x1438]
    fe34:      	<unknown>
    fe38:      	usubl2	v12.4s, v3.8h, v5.8h
    fe3c:      	ldpsw	x4, x28, [x3, #-0x88]
    fe40:      	<unknown>
    fe44:      	<unknown>
    fe48:      	ldpsw	x0, x29, [x9, #-0x90]
    fe4c:      	ldpsw	x14, x26, [x11, #-0x60]
    fe50:      	<unknown>
    fe54:      	<unknown>
    fe58:      	psel	p5, p8, p9.h[w14, 1]
    fe5c:      	<unknown>
    fe60:      	<unknown>
    fe64:      	<unknown>
    fe68:      	<unknown>
    fe6c:      	ldnp	d19, d29, [x3, #-0x1f0]
    fe70:      	usubl2	v12.4s, v3.8h, v15.8h
    fe74:      	fnmls	z0.h, p5/m, z1.h, z8.h
    fe78:      	b.eq	0xba85c
    fe7c:      	<unknown>
    fe80:      	ldpsw	x5, x24, [x27, #-0x60]
    fe84:      	<unknown>
    fe88:      	umlal2	v6.4s, v3.8h, v3.h[2]
    fe8c:      	uqshl	v14.2d, v3.2d, #0x32
    fe90:      	adr	x12, 0xda29f
    fe94:      	<unknown>
    fe98:      	psel	p5, p8, p9.h[w14, 1]
    fe9c:      	<unknown>
    fea0:      	fnmls	z1.h, p2/m, z11.h, z12.h
    fea4:      	umlal2	v4.4s, v3.8h, v4.h[3]
    fea8:      	fnmls	z0.h, p1/m, z9.h, z24.h
    feac:      	fnmls	z3.h, p5/m, z11.h, z20.h
    feb0:      	fdot	z0.s, z9.b, z6.b[1]
    feb4:      	<unknown>
    feb8:      	ldp	d0, d24, [x25, #-0x110]
    febc:      	<unknown>
    fec0:      	<unknown>
    fec4:      	<unknown>
    fec8:      	ldnp	d9, d24, [x27, #-0x1f0]
    fecc:      	<unknown>
    fed0:      	<unknown>
    fed4:      	psel	p5, p8, p9.h[w14, 1]
    fed8:      	<unknown>
    fedc:      	<unknown>
    fee0:      	<unknown>
    fee4:      	<unknown>
    fee8:      	<unknown>
    feec:      	<unknown>
    fef0:      	<unknown>
    fef4:      	ldp	d0, d29, [x1, #-0x170]
    fef8:      	<unknown>
    fefc:      	<unknown>
    ff00:      	psel	p5, p8, p9.h[w14, 1]
    ff04:      	<unknown>
    ff08:      	fnmls	z1.h, p2/m, z11.h, z12.h
    ff0c:      	umlal2	v4.4s, v3.8h, v4.h[3]
    ff10:      	fnmls	z0.h, p1/m, z9.h, z24.h
    ff14:      	fnmls	z3.h, p5/m, z11.h, z20.h
    ff18:      	<unknown>
    ff1c:      	fnmla	z15.h, p0/m, z25.h, z12.h
    ff20:      	<unknown>
    ff24:      	ldnp	d20, d24, [x11, #-0x140]
    ff28:      	ldp	d0, d24, [x25, #-0x110]
    ff2c:      	<unknown>
    ff30:      	<unknown>
    ff34:      	<unknown>
    ff38:      	ldnp	d9, d24, [x27, #-0x1f0]
    ff3c:      	<unknown>
    ff40:      	<unknown>
    ff44:      	psel	p5, p8, p9.h[w14, 1]
    ff48:      	<unknown>
    ff4c:      	<unknown>
    ff50:      	<unknown>
    ff54:      	ldp	d3, d27, [x27, #-0x130]
    ff58:      	<unknown>
    ff5c:      	<unknown>
    ff60:      	uqshl	v21.2d, v3.2d, #0x29
    ff64:      	ldpsw	x14, x8, [x3, #-0x60]
    ff68:      	<unknown>
    ff6c:      	bic	w15, w11, w20, lsr #29
    ff70:      	<unknown>
    ff74:      	addhnt	z7.b, z10.h, z20.h
    ff78:      	<unknown>
    ff7c:      	<unknown>
    ff80:      	sqrdmlsh	z22.b, z3.b, z0.b
    ff84:      	<unknown>
    ff88:      	<unknown>
    ff8c:      	<unknown>
    ff90:      	<unknown>
    ff94:      	<unknown>
    ff98:      	<unknown>
    ff9c:      	<unknown>
    ffa0:      	<unknown>
    ffa4:      	uqshl	v3.2d, v3.2d, #0x29
    ffa8:      	fmls	z14.h, p0/m, z3.h, z12.h
    ffac:      	<unknown>
    ffb0:      	<unknown>
    ffb4:      	<unknown>
    ffb8:      	stp	d0, d24, [x9, #-0x200]
    ffbc:      	ldpsw	x21, x27, [x3, #-0x60]
    ffc0:      	<unknown>
    ffc4:      	<unknown>
    ffc8:      	stp	d8, d25, [x11, #-0x200]
    ffcc:      	ldp	d1, d30, [x3, #-0x170]
    ffd0:      	adr	x21, 0x50d7f
    ffd4:      	fnmls	z1.h, p0/m, z27.h, z11.h
    ffd8:      	ldpsw	x20, x8, [x3, #-0x68]
    ffdc:      	<unknown>
    ffe0:      	<unknown>
    ffe4:      	<unknown>
    ffe8:      	<unknown>
    ffec:      	fmlalb	z16.h, z27.b, z5.b[2]
    fff0:      	cmpgt	p13.b, p2/z, z18.b, #0x0
    fff4:      	<unknown>
    fff8:      	<unknown>
    fffc:      	<unknown>
   10000:      	<unknown>
   10004:      	sqshlu	v14.2d, v3.2d, #0x30
   10008:      	<unknown>
   1000c:      	<unknown>
   10010:      	<unknown>
   10014:      	<unknown>
   10018:      	<unknown>
   1001c:      	<unknown>
   10020:      	<unknown>
   10024:      	<unknown>
   10028:      	<unknown>
   1002c:      	<unknown>
   10030:      	<unknown>
   10034:      	<unknown>
   10038:      	<unknown>
   1003c:      	<unknown>
   10040:      	<unknown>
   10044:      	<unknown>
   10048:      	stnp	d5, d28, [x19, #-0x200]
   1004c:      	bic	w9, w27, w20, lsr #28
   10050:      	<unknown>
   10054:      	<unknown>
   10058:      	ldnp	d6, d24, [x11, #-0x170]
   1005c:      	<unknown>
   10060:      	ldrh	w15, [x3, #0x1990]
   10064:      	<unknown>
   10068:      	<unknown>
   1006c:      	<unknown>
   10070:      	ldpsw	x2, x8, [x2, #-0x70]
   10074:      	<unknown>
   10078:      	adr	x15, 0x50ec7
   1007c:      	ldpsw	x8, x30, [x11, #-0x68]
   10080:      	<unknown>
   10084:      	adr	x5, 0xd8e53
   10088:      	<unknown>
   1008c:      	bic	w0, w9, w4, lsr #9
   10090:      	<unknown>
   10094:      	<unknown>
   10098:      	<unknown>
   1009c:      	<unknown>
   100a0:      	<unknown>
   100a4:      	<unknown>
   100a8:      	<unknown>
   100ac:      	stgp	x5, x25, [x1, #-0x400]
   100b0:      	<unknown>
   100b4:      	<unknown>
   100b8:      	psel	p5, p8, p9.h[w14, 1]
   100bc:      	<unknown>
   100c0:      	<unknown>
   100c4:      	<unknown>
   100c8:      	<unknown>
   100cc:      	bc.hs	0x92974
   100d0:      	<unknown>
   100d4:      	<unknown>
   100d8:      	eor	w1, w9, #0x1ff
   100dc:      	<unknown>
   100e0:      	<unknown>
   100e4:      	uabdl2	v0.4s, v17.8h, v9.8h
   100e8:      	usubl2	v7.4s, v3.8h, v1.8h
   100ec:      	<unknown>
   100f0:      	<unknown>
   100f4:      	<unknown>
   100f8:      	<unknown>
   100fc:      	uabal2	v2.4s, v19.8h, v9.8h
   10100:      	<unknown>
   10104:      	<unknown>
   10108:      	bc.pl	0xf0eb4
   1010c:      	ldpsw	x18, x24, [x19, #0x90]
   10110:      	<unknown>
   10114:      	<unknown>
   10118:      	<unknown>
   1011c:      	<unknown>
   10120:      	psel	p5, p8, p9.h[w14, 1]
   10124:      	<unknown>
   10128:      	fnmls	z1.h, p2/m, z11.h, z12.h
   1012c:      	umlal2	v4.4s, v3.8h, v4.h[3]
   10130:      	<unknown>
   10134:      	ldrh	w0, [x1, #0x1438]
   10138:      	<unknown>
   1013c:      	fmul	z12.h, z3.h, z1.h[4]
   10140:      	<unknown>
   10144:      	<unknown>
   10148:      	<unknown>
   1014c:      	<unknown>
   10150:      	<unknown>
   10154:      	ldnp	d9, d24, [x27, #-0x1f0]
   10158:      	<unknown>
   1015c:      	umin	v16.8h, v27.8h, v9.8h
   10160:      	fmul	z20.h, z3.h, z5.h[0]
   10164:      	<unknown>
   10168:      	<unknown>
   1016c:      	ldpsw	x0, x25, [x17, #-0xf8]
   10170:      	<unknown>
   10174:      	<unknown>
   10178:      	<unknown>
   1017c:      	<unknown>
   10180:      	<unknown>
   10184:      	<unknown>
   10188:      	ldp	d0, d24, [x25, #-0x110]
   1018c:      	<unknown>
   10190:      	<unknown>
   10194:      	<unknown>
   10198:      	ldnp	d9, d24, [x27, #-0x1f0]
   1019c:      	<unknown>
   101a0:      	umin	v16.8h, v27.8h, v9.8h
   101a4:      	fmul	z20.h, z3.h, z5.h[0]
   101a8:      	<unknown>
   101ac:      	<unknown>
   101b0:      	<unknown>
   101b4:      	<unknown>
   101b8:      	<unknown>
   101bc:      	<unknown>
   101c0:      	<unknown>
   101c4:      	fnmls	z1.h, p2/m, z11.h, z12.h
   101c8:      	cmpge	p4.b, p2/z, z19.b, #0x0
   101cc:      	<unknown>
   101d0:      	<unknown>
   101d4:      	<unknown>
   101d8:      	<unknown>
   101dc:      	<unknown>
   101e0:      	<unknown>
   101e4:      	<unknown>
   101e8:      	<unknown>
   101ec:      	<unknown>
   101f0:      	<unknown>
   101f4:      	sqshlu	v14.4s, v3.4s, #0x0
   101f8:      	<unknown>
   101fc:      	<unknown>
   10200:      	<unknown>
   10204:      	sqshlu	v14.2d, v3.2d, #0x30
   10208:      	<unknown>
   1020c:      	<unknown>
   10210:      	psel	p5, p8, p9.h[w14, 1]
   10214:      	adr	x1, 0x50963
   10218:      	ldpsw	x8, x30, [x11, #-0x68]
   1021c:      	<unknown>
   10220:      	adr	x5, 0xd8fef
   10224:      	<unknown>
   10228:      	<unknown>
   1022c:      	stgp	x9, x28, [x27, #-0x400]
   10230:      	usubl2	v14.4s, v3.8h, v9.8h
   10234:      	ldpsw	x22, x24, [x11, #-0xa0]
   10238:      	<unknown>
   1023c:      	<unknown>
   10240:      	<unknown>
   10244:      	<unknown>
   10248:      	fnmls	z1.h, p3/m, z19.h, z3.h
   1024c:      	<unknown>
   10250:      	fnmls	z14.h, p4/m, z27.h, z6.h
   10254:      	<unknown>
   10258:      	<unknown>
   1025c:      	<unknown>
   10260:      	ldpsw	x0, x25, [x17, #-0xf8]
   10264:      	<unknown>
   10268:      	<unknown>
   1026c:      	<unknown>
   10270:      	<unknown>
   10274:      	<unknown>
   10278:      	<unknown>
   1027c:      	<unknown>
   10280:      	sqshlu	v14.4s, v3.4s, #0x0
   10284:      	<unknown>
   10288:      	<unknown>
   1028c:      	<unknown>
   10290:      	sqshlu	v14.2d, v3.2d, #0x30
   10294:      	<unknown>
   10298:      	<unknown>
   1029c:      	<unknown>
   102a0:      	fnmls	z1.h, p3/m, z19.h, z3.h
   102a4:      	<unknown>
   102a8:      	fnmls	z14.h, p4/m, z27.h, z6.h
   102ac:      	<unknown>
   102b0:      	<unknown>
   102b4:      	<unknown>
   102b8:      	ldnp	d14, d24, [x27, #-0x1b0]
   102bc:      	b.ne	0xe9044
   102c0:      	<unknown>
   102c4:      	<unknown>
   102c8:      	<unknown>
   102cc:      	<unknown>
   102d0:      	ldnp	d6, d24, [x11, #-0x170]
   102d4:      	<unknown>
   102d8:      	<unknown>
   102dc:      	ldnp	d14, d24, [x27, #-0x1b0]
   102e0:      	<unknown>
   102e4:      	fnmls	z14.h, p4/m, z27.h, z6.h
   102e8:      	usubl2	v18.4s, v3.8h, v15.8h
   102ec:      	ldrh	w0, [x1, #0x1438]
   102f0:      	<unknown>
   102f4:      	usubl2	v12.4s, v3.8h, v5.8h
   102f8:      	ldpsw	x4, x28, [x3, #-0x88]
   102fc:      	<unknown>
   10300:      	<unknown>
   10304:      	ldpsw	x15, x27, [x19, #-0x60]
   10308:      	uabd	v14.8h, v11.8h, v9.8h
   1030c:      	<unknown>
   10310:      	<unknown>
   10314:      	<unknown>
   10318:      	<unknown>
   1031c:      	ldp	d5, d16, [x27, #-0x110]
   10320:      	<unknown>
   10324:      	<unknown>
   10328:      	<unknown>
   1032c:      	<unknown>
   10330:      	<unknown>
   10334:      	ldp	d3, d27, [x27, #-0x130]
   10338:      	<unknown>
   1033c:      	fnmls	z20.h, p6/m, z11.h, z16.h
   10340:      	<unknown>
   10344:      	ldpsw	x3, x21, [x27, #-0x70]
   10348:      	<unknown>
   1034c:      	ldpsw	x4, x28, [x3, #-0x88]
   10350:      	uqshl	v14.2d, v3.2d, #0x3
   10354:      	umin	v13.8h, v11.8h, v1.8h
   10358:      	<unknown>
   1035c:      	<unknown>
   10360:      	uabd	v5.8h, v18.8h, v5.8h
   10364:      	<unknown>
   10368:      	and	p14.b, p13/z, p3.b, p0.b
   1036c:      	<unknown>
   10370:      	usubl2	v26.4s, v1.8h, v9.8h
   10374:      	ldpsw	x22, x24, [x11, #-0xa0]
   10378:      	<unknown>
   1037c:      	<unknown>
   10380:      	<unknown>
   10384:      	stgp	x5, x28, [x19, #-0x400]
   10388:      	<unknown>
   1038c:      	<unknown>
   10390:      	<unknown>
   10394:      	<unknown>
   10398:      	<unknown>
   1039c:      	<unknown>
   103a0:      	fmul	z26.h, z1.h, z5.h[0]
   103a4:      	<unknown>
   103a8:      	<unknown>
   103ac:      	<unknown>
   103b0:      	uabd	v5.8h, v18.8h, v5.8h
   103b4:      	<unknown>
   103b8:      	<unknown>
   103bc:      	saddwt	z0.h, z9.h, z22.b
   103c0:      	<unknown>
   103c4:      	saddwt	z21.h, z18.h, z6.b
   103c8:      	<unknown>
   103cc:      	<unknown>
   103d0:      	<unknown>
   103d4:      	ldp	d0, d20, [x25, #-0x110]
   103d8:      	<unknown>
   103dc:      	<unknown>
   103e0:      	ldrh	w0, [x9, #0x10b6]
   103e4:      	<unknown>
   103e8:      	fmls	z5.h, p0/m, z3.h, z2.h
   103ec:      	<unknown>
   103f0:      	adr	x18, 0xf11df
   103f4:      	<unknown>
   103f8:      	psel	p5, p8, p9.h[w14, 1]
   103fc:      	<unknown>
   10400:      	<unknown>
   10404:      	<unknown>
   10408:      	ldp	d0, d24, [x25, #-0x110]
   1040c:      	<unknown>
   10410:      	ldpsw	x0, x25, [x17, #-0xf8]
   10414:      	<unknown>
   10418:      	adr	x15, 0x511e7
   1041c:      	ldpsw	x8, x30, [x11, #-0x68]
   10420:      	<unknown>
   10424:      	adr	x5, 0xd91f3
   10428:      	<unknown>
   1042c:      	ldnp	s0, s9, [x9, #-0xe0]
   10430:      	fnmla	z0.h, p1/m, z9.h, z22.h
   10434:      	<unknown>
   10438:      	<unknown>
   1043c:      	fmul	z26.h, z1.h, z5.h[0]
   10440:      	<unknown>
   10444:      	<unknown>
   10448:      	ldpsw	x0, x25, [x17, #-0xf8]
   1044c:      	<unknown>
   10450:      	<unknown>
   10454:      	<unknown>
   10458:      	ldpsw	x18, x27, [x27, #-0x90]
   1045c:      	<unknown>
   10460:      	ands	w18, w19, #0x1ffffff
   10464:      	<unknown>
   10468:      	<unknown>
   1046c:      	<unknown>
   10470:      	ldnp	d9, d24, [x27, #-0x1f0]
   10474:      	<unknown>
   10478:      	umin	v16.8h, v27.8h, v9.8h
   1047c:      	fmul	z20.h, z3.h, z5.h[0]
   10480:      	<unknown>
   10484:      	<unknown>
   10488:      	<unknown>
   1048c:      	uabal2	v2.4s, v19.8h, v9.8h
   10490:      	<unknown>
   10494:      	uabal2	v3.4s, v27.8h, v25.8h
   10498:      	<unknown>
   1049c:      	<unknown>
   104a0:      	<unknown>
   104a4:      	b.vc	0xf914c
   104a8:      	<unknown>
   104ac:      	<unknown>
   104b0:      	fcmla	z1.h, p3/m, z3.h, z1.h, #270
   104b4:      	<unknown>
   104b8:      	saddlb	z19.h, z3.b, z4.b
   104bc:      	<unknown>
   104c0:      	<unknown>
   104c4:      	<unknown>
   104c8:      	smlslt	z14.h, z2.b, z1.b
   104cc:      	<unknown>
   104d0:      	<unknown>
   104d4:      	<unknown>
   104d8:      	<unknown>
   104dc:      	b.pl	0xacfa4
   104e0:      	<unknown>
   104e4:      	saddlb	z0.h, z1.b, z7.b
   104e8:      	<unknown>
   104ec:      	b.nv	0xacf94
   104f0:      	<unknown>
   104f4:      	<unknown>
   104f8:      	<unknown>
   104fc:      	<unknown>
   10500:      	<unknown>
   10504:      	adr	x0, 0x50ca9
   10508:      	<unknown>
   1050c:      	<unknown>
   10510:      	<unknown>
   10514:      	<unknown>
   10518:      	adr	x2, 0xdd3c2
   1051c:      	ldpsw	x20, x28, [x19, #0x40]
   10520:      	<unknown>
   10524:      	adr	x16, 0x5b429
   10528:      	<unknown>
   1052c:      	<unknown>
   10530:      	<unknown>
   10534:      	<unknown>
   10538:      	fnmls	z19.h, p2/m, z10.h, z26.h
   1053c:      	str	b0, [x1, #0x808]
   10540:      	bic	w0, w9, w4, lsr #9
   10544:      	<unknown>
   10548:      	<unknown>
   1054c:      	<unknown>
   10550:      	<unknown>
   10554:      	<unknown>
   10558:      	ldeorh	w16, w29, [x1]
   1055c:      	<unknown>
   10560:      	<unknown>
   10564:      	adr	x0, 0x5096a
   10568:      	<unknown>
   1056c:      	<unknown>
   10570:      	<unknown>
   10574:      	<unknown>
   10578:      	<unknown>
   1057c:      	<unknown>
   10580:      	<unknown>
   10584:      	<unknown>
   10588:      	<unknown>
   1058c:      	strh	w16, [x1, x5, lsl #1]
   10590:      	<unknown>
   10594:      	<unknown>
   10598:      	<unknown>
   1059c:      	<unknown>
   105a0:      	<unknown>
   105a4:      	<unknown>
   105a8:      	<unknown>
   105ac:      	<unknown>
   105b0:      	<unknown>
   105b4:      	<unknown>
   105b8:      	<unknown>
   105bc:      	<unknown>
   105c0:      	<unknown>
   105c4:      	<unknown>
   105c8:      	<unknown>
   105cc:      	<unknown>
   105d0:      	<unknown>
   105d4:      	str	b0, [x1, #0x808]
   105d8:      	bic	w0, w9, w4, lsr #9
   105dc:      	<unknown>
   105e0:      	<unknown>
   105e4:      	<unknown>
   105e8:      	<unknown>
   105ec:      	<unknown>
   105f0:      	fmul	z29.h, z1.h, z5.h[0]
   105f4:      	<unknown>
   105f8:      	<unknown>
   105fc:      	b.eq	0x50a00
   10600:      	bc.hs	0x96e48
   10604:      	<unknown>
   10608:      	<unknown>
   1060c:      	<unknown>
   10610:      	<unknown>
   10614:      	<unknown>
   10618:      	<unknown>
   1061c:      	<unknown>
   10620:      	<unknown>
   10624:      	<unknown>
   10628:      	<unknown>
   1062c:      	<unknown>
   10630:      	<unknown>
   10634:      	<unknown>
   10638:      	str	b0, [x1, #0x808]
   1063c:      	bic	w0, w9, w4, lsr #9
   10640:      	<unknown>
   10644:      	<unknown>
   10648:      	<unknown>
   1064c:      	<unknown>
   10650:      	<unknown>
   10654:      	fmul	z29.h, z1.h, z5.h[0]
   10658:      	<unknown>
   1065c:      	usubwt	z3.h, z26.h, z4.b
   10660:      	uaddwb	z22.h, z10.h, z3.b
   10664:      	whilerw	p10.h, x1, x24
   10668:      	ldnp	d16, d14, [x1, #-0x140]
   1066c:      	<unknown>
   10670:      	<unknown>
   10674:      	fnmls	z3.h, p3/m, z26.h, z18.h
   10678:      	fnmls	z2.h, p0/m, z10.h, z19.h
   1067c:      	<unknown>
   10680:      	<unknown>
   10684:      	<unknown>
   10688:      	ldeorh	w16, w29, [x1]
   1068c:      	ldseth	w24, w5, [x1]
   10690:      	<unknown>
   10694:      	<unknown>
   10698:      	fmaxnmv	h2, p4, z27.h
   1069c:      	fnmls	z22.h, p2/m, z11.h, z3.h
   106a0:      	<unknown>
   106a4:      	str	b14, [x3, #0x81d]
   106a8:      	bic	w0, w9, w4, lsr #9
   106ac:      	<unknown>
   106b0:      	<unknown>
   106b4:      	<unknown>
   106b8:      	<unknown>
   106bc:      	<unknown>
   106c0:      	<unknown>
   106c4:      	<unknown>
   106c8:      	<unknown>
   106cc:      	<unknown>
   106d0:      	<unknown>
   106d4:      	<unknown>
   106d8:      	<unknown>
   106dc:      	adr	x0, 0x50e81
   106e0:      	<unknown>
   106e4:      	<unknown>
   106e8:      	<unknown>
   106ec:      	and	w0, w1, w29, lsr #8
   106f0:      	adr	x0, 0x9aaf7
   106f4:      	<unknown>
   106f8:      	<unknown>
   106fc:      	<unknown>
   10700:      	<unknown>
   10704:      	<unknown>
   10708:      	<unknown>
   1070c:      	str	h0, [x9, #0x52e]
   10710:      	<unknown>
   10714:      	fcmla	v5.8h, v19.8h, v3.h[0], #270
   10718:      	fnmls	z13.h, p4/m, z3.h, z12.h
   1071c:      	<unknown>
   10720:      	<unknown>
   10724:      	ldeorh	w16, w29, [x1]
   10728:      	stnp	d5, d12, [x1, #-0x80]
   1072c:      	stp	s12, s30, [x3, #-0x100]
   10730:      	bic	w30, w1, w27, lsr #8
   10734:      	orr	w0, w8, #0x3ff0000
   10738:      	<unknown>
   1073c:      	<unknown>
   10740:      	<unknown>
   10744:      	bic	w5, w1, w26, lsl #25
   10748:      	<unknown>
   1074c:      	<unknown>
   10750:      	<unknown>
   10754:      	<unknown>
   10758:      	adr	x16, 0x5b65d
   1075c:      	<unknown>
   10760:      	<unknown>
   10764:      	ssubl2	v0.8h, v1.16b, v0.16b
   10768:      	rsubhnb	z5.b, z3.h, z20.h
   1076c:      	str	b22, [x3, #0x81d]
   10770:      	whilewr	p0.h, x1, x24
   10774:      	ldnp	d16, d14, [x1, #-0x140]
   10778:      	<unknown>
   1077c:      	<unknown>
   10780:      	fnmls	z19.h, p2/m, z10.h, z26.h
   10784:      	<unknown>
   10788:      	fmul	z29.h, z1.h, z5.h[0]
   1078c:      	uaddl2	v10.4s, v0.8h, v21.8h
   10790:      	<unknown>
   10794:      	ldpsw	x9, x24, [x11, #-0xa0]
   10798:      	<unknown>
   1079c:      	<unknown>
   107a0:      	fnmls	z20.h, p2/m, z11.h, z22.h
   107a4:      	<unknown>
   107a8:      	uabd	v18.8h, v3.8h, v9.8h
   107ac:      	<unknown>
   107b0:      	<unknown>
   107b4:      	<unknown>
   107b8:      	<unknown>
   107bc:      	<unknown>
   107c0:      	adr	x9, 0x5158f
   107c4:      	<unknown>
   107c8:      	<unknown>
   107cc:      	ldnp	d19, d29, [x3, #-0x1f0]
   107d0:      	<unknown>
   107d4:      	umin	v21.8h, v19.8h, v11.8h
   107d8:      	<unknown>
   107dc:      	adr	x5, 0xd95ab
   107e0:      	<unknown>
   107e4:      	<unknown>
   107e8:      	stnp	w20, w25, [x11, #-0x100]
   107ec:      	<unknown>
   107f0:      	<unknown>
   107f4:      	<unknown>
   107f8:      	ldnp	d9, d24, [x27, #-0x1f0]
   107fc:      	fdot	z0.s, z9.b, z6.b[1]
   10800:      	umin	v16.8h, v27.8h, v9.8h
   10804:      	fmul	z20.h, z3.h, z5.h[0]
   10808:      	<unknown>
   1080c:      	<unknown>
   10810:      	<unknown>
   10814:      	<unknown>
   10818:      	<unknown>
   1081c:      	<unknown>
   10820:      	<unknown>
   10824:      	eor	w0, w1, #0x1ff
   10828:      	<unknown>
   1082c:      	<unknown>
   10830:      	str	b4, [x2, #0x808]
   10834:      	bic	w0, w9, w4, lsr #9
   10838:      	<unknown>
   1083c:      	<unknown>
   10840:      	<unknown>
   10844:      	<unknown>
   10848:      	<unknown>
   1084c:      	<unknown>
   10850:      	<unknown>
   10854:      	uabal2	v0.4s, v17.8h, v9.8h
   10858:      	<unknown>
   1085c:      	<unknown>
   10860:      	adr	x0, 0x51005
   10864:      	<unknown>
   10868:      	<unknown>
   1086c:      	<unknown>
   10870:      	<unknown>
   10874:      	bic	w0, w1, w29, lsr #8
   10878:      	<unknown>
   1087c:      	<unknown>
   10880:      	<unknown>
   10884:      	<unknown>
   10888:      	<unknown>
   1088c:      	adr	x16, 0x5b791
   10890:      	stp	s24, s30, [x1, #-0x100]
   10894:      	bic	w30, w1, w27, lsr #8
   10898:      	<unknown>
   1089c:      	<unknown>
   108a0:      	<unknown>
   108a4:      	<unknown>
   108a8:      	adr	x0, 0x5104d
   108ac:      	<unknown>
   108b0:      	<unknown>
   108b4:      	<unknown>
   108b8:      	<unknown>
   108bc:      	<unknown>
   108c0:      	<unknown>
   108c4:      	<unknown>
   108c8:      	fmul	z29.h, z1.h, z5.h[0]
   108cc:      	<unknown>
   108d0:      	<unknown>
   108d4:      	subs	w0, w9, #0xb91, lsl #12 // =0xb91000
   108d8:      	<unknown>
   108dc:      	adr	x0, 0x51081
   108e0:      	<unknown>
   108e4:      	<unknown>
   108e8:      	<unknown>
   108ec:      	fmaxnmv	h0, p0, z1.h
   108f0:      	<unknown>
   108f4:      	<unknown>
   108f8:      	adr	x16, 0x5b7fd
   108fc:      	<unknown>
   10900:      	<unknown>
   10904:      	ssubl2	v0.8h, v1.16b, v0.16b
   10908:      	<unknown>
   1090c:      	str	b2, [x26, #0x81c]
   10910:      	bic	w0, w9, w4, lsr #9
   10914:      	<unknown>
   10918:      	<unknown>
   1091c:      	<unknown>
   10920:      	<unknown>
   10924:      	<unknown>
   10928:      	<unknown>
   1092c:      	<unknown>
   10930:      	<unknown>
   10934:      	<unknown>
   10938:      	<unknown>
   1093c:      	<unknown>
   10940:      	<unknown>
   10944:      	<unknown>
   10948:      	<unknown>
   1094c:      	fmul	z29.h, z1.h, z5.h[0]
   10950:      	<unknown>
   10954:      	<unknown>
   10958:      	<unknown>
   1095c:      	<unknown>
   10960:      	<unknown>
   10964:      	<unknown>
   10968:      	<unknown>
   1096c:      	<unknown>
   10970:      	<unknown>
   10974:      	<unknown>
   10978:      	<unknown>
   1097c:      	<unknown>
   10980:      	<unknown>
   10984:      	<unknown>
   10988:      	fmul	z29.h, z1.h, z5.h[0]
   1098c:      	<unknown>
   10990:      	<unknown>
   10994:      	<unknown>
   10998:      	<unknown>
   1099c:      	<unknown>
   109a0:      	fcmeq	p3.h, p5/z, z3.h, z12.h
   109a4:      	<unknown>
   109a8:      	<unknown>
   109ac:      	<unknown>
   109b0:      	<unknown>
   109b4:      	ldnp	d19, d25, [x11, #0x1a0]
   109b8:      	<unknown>
   109bc:      	<unknown>
   109c0:      	<unknown>
   109c4:      	<unknown>
   109c8:      	<unknown>
   109cc:      	<unknown>
   109d0:      	<unknown>
   109d4:      	ldrh	w1, [x3, #0x136]
   109d8:      	ldr	x20, 0xf7684
   109dc:      	fnmls	z6.h, p1/m, z11.h, z18.h
   109e0:      	<unknown>
   109e4:      	<unknown>
   109e8:      	fnmls	z20.h, p4/m, z18.h, z21.h
   109ec:      	ldnp	d0, d17, [x16, #-0x1f0]
   109f0:      	<unknown>
   109f4:      	<unknown>
   109f8:      	ssubl2	v0.8h, v1.16b, v0.16b
   109fc:      	<unknown>
   10a00:      	<unknown>
   10a04:      	<unknown>
   10a08:      	<unknown>
   10a0c:      	fmul	z29.h, z1.h, z5.h[0]
   10a10:      	<unknown>
   10a14:      	<unknown>
   10a18:      	<unknown>
   10a1c:      	<unknown>
   10a20:      	<unknown>
   10a24:      	<unknown>
   10a28:      	<unknown>
   10a2c:      	<unknown>
   10a30:      	<unknown>
   10a34:      	<unknown>
   10a38:      	<unknown>
   10a3c:      	<unknown>
   10a40:      	<unknown>
   10a44:      	<unknown>
   10a48:      	fmul	z29.h, z1.h, z5.h[0]
   10a4c:      	<unknown>
   10a50:      	<unknown>
   10a54:      	fnmla	z0.h, p6/m, z1.h, z6.h
   10a58:      	<unknown>
   10a5c:      	<unknown>
   10a60:      	<unknown>
   10a64:      	<unknown>
   10a68:      	<unknown>
   10a6c:      	<unknown>
   10a70:      	<unknown>
   10a74:      	<unknown>
   10a78:      	<unknown>
   10a7c:      	<unknown>
   10a80:      	<unknown>
   10a84:      	ldeorh	w16, w29, [x1]
   10a88:      	ldseth	w24, w5, [x1]
   10a8c:      	<unknown>
   10a90:      	<unknown>
   10a94:      	fnmla	z0.h, p6/m, z1.h, z6.h
   10a98:      	<unknown>
   10a9c:      	<unknown>
   10aa0:      	<unknown>
   10aa4:      	<unknown>
   10aa8:      	adr	x16, 0x5b9ad
   10aac:      	stp	s24, s30, [x1, #-0x100]
   10ab0:      	bic	w30, w1, w27, lsr #8
   10ab4:      	<unknown>
   10ab8:      	<unknown>
   10abc:      	<unknown>
   10ac0:      	uabdl2	v16.4s, v18.8h, v9.8h
   10ac4:      	<unknown>
   10ac8:      	<unknown>
   10acc:      	ldpsw	x0, x20, [x0, #-0x70]
   10ad0:      	<unknown>
   10ad4:      	adr	x12, 0xd57fe
   10ad8:      	<unknown>
   10adc:      	ldpsw	x1, x28, [x26, #-0xe8]
   10ae0:      	adr	x9, 0xb75ae
   10ae4:      	<unknown>
   10ae8:      	<unknown>
   10aec:      	umlal2	v8.4s, v1.8h, v6.h[7]
   10af0:      	orn	w9, w3, w0, lsl #25
   10af4:      	stp	w9, w8, [x1, #-0x80]
   10af8:      	ldpsw	x0, x20, [x0, #-0x70]
   10afc:      	<unknown>
   10b00:      	adr	x12, 0xd582a
   10b04:      	<unknown>
   10b08:      	<unknown>
   10b0c:      	<unknown>
   10b10:      	ldpsw	x19, x20, [x2, #-0x70]
   10b14:      	<unknown>
   10b18:      	stnp	w29, w8, [x1, #-0xc0]
   10b1c:      	<unknown>
   10b20:      	<unknown>
   10b24:      	adr	x16, 0x1104a <.text+0x1004a>
   10b28:      	<unknown>
   10b2c:      	ldpsw	x19, x26, [x2, #0x60]
   10b30:      	<unknown>
   10b34:      	fdiv	v13.8h, v17.8h, v21.8h
   10b38:      	<unknown>
   10b3c:      	adr	x5, 0xb760a
   10b40:      	<unknown>
   10b44:      	ldpsw	x1, x28, [x26, #-0xe8]
   10b48:      	<unknown>
   10b4c:      	<unknown>
   10b50:      	stnp	w1, w15, [x9, #-0x100]
   10b54:      	ldpsw	x8, x29, [x17, #-0x88]
   10b58:      	stp	w4, w8, [x3, #-0xb0]
   10b5c:      	<unknown>
   10b60:      	uabdl2	v16.4s, v18.8h, v9.8h
   10b64:      	<unknown>
   10b68:      	<unknown>
   10b6c:      	<unknown>
   10b70:      	umlsl2	v14.4s, v11.8h, v3.h[6]
   10b74:      	<unknown>
   10b78:      	b.gt	0xdba24
   10b7c:      	<unknown>
   10b80:      	<unknown>
   10b84:      	stnp	w1, w15, [x9, #-0x100]
   10b88:      	ldpsw	x8, x29, [x17, #-0x88]
   10b8c:      	stp	w4, w8, [x3, #-0xb0]
   10b90:      	<unknown>
   10b94:      	uabdl2	v16.4s, v18.8h, v9.8h
   10b98:      	<unknown>
   10b9c:      	<unknown>
   10ba0:      	<unknown>
   10ba4:      	uabdl2	v16.4s, v18.8h, v9.8h
   10ba8:      	uqshl	v20.8h, v3.8h, v5.8h
   10bac:      	<unknown>
   10bb0:      	stnp	w1, w15, [x9, #-0x100]
   10bb4:      	ldpsw	x8, x29, [x17, #-0x88]
   10bb8:      	stp	w4, w8, [x3, #-0xb0]
   10bbc:      	<unknown>
   10bc0:      	udf	#0xaeac
   10bc4:      	udf	#0x0
   10bc8:      	udf	#0xaf34
   10bcc:      	udf	#0x0
   10bd0:      	udf	#0xae2c
   10bd4:      	udf	#0x0
   10bd8:      	udf	#0xae6c
   10bdc:      	udf	#0x0
   10be0:      	udf	#0xaf34
   10be4:      	udf	#0x0
   10be8:      	udf	#0xaf34
   10bec:      	udf	#0x0
   10bf0:      	udf	#0xaeac
   10bf4:      	udf	#0x0
   10bf8:      	udf	#0xaf34
   10bfc:      	udf	#0x0
   10c00:      	udf	#0xaf34
   10c04:      	udf	#0x0
   10c08:      	udf	#0xaf34
   10c0c:      	udf	#0x0
   10c10:      	udf	#0xaf34
   10c14:      	udf	#0x0
   10c18:      	udf	#0xaf34
   10c1c:      	udf	#0x0
   10c20:      	udf	#0xaf34
   10c24:      	udf	#0x0
   10c28:      	udf	#0xaf34
   10c2c:      	udf	#0x0
   10c30:      	udf	#0xaf34
   10c34:      	udf	#0x0
   10c38:      	udf	#0xae6c
   10c3c:      	udf	#0x0
   10c40:      	udf	#0xaf34
   10c44:      	udf	#0x0
   10c48:      	udf	#0xaf08
   10c4c:      	udf	#0x0
   10c50:      	udf	#0xaeac
   10c54:      	udf	#0x0
   10c58:      	udf	#0xaeac
   10c5c:      	udf	#0x0
   10c60:      	udf	#0xae6c
   10c64:      	udf	#0x0
   10c68:      	udf	#0xaf34
   10c6c:      	udf	#0x0
   10c70:      	udf	#0xaf34
   10c74:      	udf	#0x0
   10c78:      	udf	#0xae6c
   10c7c:      	udf	#0x0
   10c80:      	<unknown>
   10c84:      	<unknown>
   10c88:      	stnp	w14, w24, [x25]
   10c8c:      	<unknown>
   10c90:      	stp	w24, w8, [x1, #-0xb0]
   10c94:      	fnmls	z2.h, p0/m, z10.h, z19.h
   10c98:      	<unknown>
   10c9c:      	<unknown>
   10ca0:      	<unknown>
   10ca4:      	umlal2	v29.4s, v1.8h, v6.h[0]
   10ca8:      	<unknown>
   10cac:      	ldpsw	x19, x29, [x2, #-0x70]
   10cb0:      	<unknown>
   10cb4:      	<unknown>
   10cb8:      	<unknown>
   10cbc:      	<unknown>
   10cc0:      	stnp	w29, w8, [x1, #-0xc0]
   10cc4:      	<unknown>
   10cc8:      	<unknown>
   10ccc:      	<unknown>
   10cd0:      	<unknown>
   10cd4:      	<unknown>
   10cd8:      	fnmls	z1.h, p4/m, z3.h, z16.h
   10cdc:      	<unknown>
   10ce0:      	<unknown>
   10ce4:      	<unknown>
   10ce8:      	<unknown>
   10cec:      	umlal2	v8.4s, v1.8h, v6.h[7]
   10cf0:      	orn	w9, w3, w0, lsl #25
   10cf4:      	stp	w9, w8, [x1, #-0x80]
   10cf8:      	<unknown>
   10cfc:      	<unknown>
   10d00:      	<unknown>
   10d04:      	<unknown>
   10d08:      	<unknown>
   10d0c:      	str	b20, [x3, x0]
   10d10:      	adr	x29, 0x61115
   10d14:      	<unknown>
   10d18:      	<unknown>
   10d1c:      	<unknown>
   10d20:      	<unknown>
   10d24:      	<unknown>
   10d28:      	stnp	w0, w11, [x9, #-0x100]
   10d2c:      	bc.pl	0xad654
   10d30:      	<unknown>
   10d34:      	<unknown>
   10d38:      	adds	w0, w25, #0x80a
   10d3c:      	fadd	z9.h, z1.h, z19.h
   10d40:      	ldp	d20, d19, [x11, #-0x1b0]
   10d44:      	adr	x23, 0xd3b8f
   10d48:      	umax	v16.4h, v11.4h, v18.4h
   10d4c:      	<unknown>
   10d50:      	<unknown>
   10d54:      	<unknown>
   10d58:      	<unknown>
   10d5c:      	adr	x29, 0x61161
   10d60:      	<unknown>
   10d64:      	<unknown>
   10d68:      	<unknown>
   10d6c:      	<unknown>
   10d70:      	<unknown>
   10d74:      	stnp	w0, w11, [x9, #-0x100]
   10d78:      	bc.pl	0xad6a0
   10d7c:      	<unknown>
   10d80:      	<unknown>
   10d84:      	mla	v9.8h, v1.8h, v3.h[0]
   10d88:      	fcmne	p0.h, p6/z, z11.h, z13.h
   10d8c:      	<unknown>
   10d90:      	<unknown>
   10d94:      	stnp	w14, w24, [x25]
   10d98:      	<unknown>
   10d9c:      	stp	s20, s26, [x3, #-0x100]
   10da0:      	<unknown>
   10da4:      	stnp	w28, w15, [x9, #-0x100]
   10da8:      	<unknown>
   10dac:      	<unknown>
   10db0:      	<unknown>
   10db4:      	<unknown>
   10db8:      	<unknown>
   10dbc:      	<unknown>
   10dc0:      	<unknown>
   10dc4:      	<unknown>
   10dc8:      	ldpsw	x5, x28, [x27, #-0x60]
   10dcc:      	ldpsw	x14, x24, [x11, #-0x60]
   10dd0:      	<unknown>
   10dd4:      	<unknown>
   10dd8:      	<unknown>
   10ddc:      	<unknown>
   10de0:      	<unknown>
   10de4:      	<unknown>
   10de8:      	adr	x29, 0x611ed
   10dec:      	<unknown>
   10df0:      	<unknown>
   10df4:      	<unknown>
   10df8:      	<unknown>
   10dfc:      	<unknown>
   10e00:      	stnp	w0, w11, [x9, #-0x100]
   10e04:      	bc.pl	0xad72c
   10e08:      	umlal2	v14.4s, v10.8h, v3.h[5]
   10e0c:      	fnmls	z21.h, p4/m, z19.h, z3.h
   10e10:      	<unknown>
   10e14:      	<unknown>
   10e18:      	<unknown>
   10e1c:      	ldpsw	x5, x25, [x3, #0x60]
   10e20:      	<unknown>
   10e24:      	<unknown>
   10e28:      	<unknown>
   10e2c:      	<unknown>
   10e30:      	ldpsw	x18, x25, [x3, #0x60]
   10e34:      	<unknown>
   10e38:      	stnp	w29, w8, [x1, #-0xc0]
   10e3c:      	<unknown>
   10e40:      	<unknown>
   10e44:      	st1	{ v16.4s, v17.4s, v18.4s, v19.4s }, [x9]
   10e48:      	ldp	s9, s28, [x27, #-0x60]
   10e4c:      	<unknown>
   10e50:      	uqshl	v11.8h, v3.8h, v9.8h
   10e54:      	str	b11, [x3, #0x848]
   10e58:      	<unknown>
   10e5c:      	<unknown>
   10e60:      	adr	x10, 0x51385
   10e64:      	mla	v9.8h, v1.8h, v14.h[0]
   10e68:      	<unknown>
   10e6c:      	stnp	w29, w8, [x1, #-0xc0]
   10e70:      	<unknown>
   10e74:      	<unknown>
   10e78:      	<unknown>
   10e7c:      	<unknown>
   10e80:      	<unknown>
   10e84:      	<unknown>
   10e88:      	<unknown>
   10e8c:      	<unknown>
   10e90:      	ldnp	d2, d29, [x10, #-0x170]
   10e94:      	<unknown>
   10e98:      	<unknown>
   10e9c:      	ldp	d9, d27, [x11, #-0xb0]
   10ea0:      	<unknown>
   10ea4:      	ldpsw	x5, x25, [x3, #0x60]
   10ea8:      	fcmne	p3.h, p5/z, z3.h, z12.h
   10eac:      	<unknown>
   10eb0:      	<unknown>
   10eb4:      	<unknown>
   10eb8:      	str	b4, [x3, #0x848]
   10ebc:      	<unknown>
   10ec0:      	<unknown>
   10ec4:      	adr	x10, 0x513e9
   10ec8:      	<unknown>
   10ecc:      	umax	v20.8h, v11.8h, v18.8h
   10ed0:      	<unknown>
   10ed4:      	ldpsw	x19, x25, [x11, #0x60]
   10ed8:      	<unknown>
   10edc:      	<unknown>
   10ee0:      	<unknown>
   10ee4:      	<unknown>
   10ee8:      	<unknown>
   10eec:      	ldnp	s5, s24, [x11, #-0xe0]
   10ef0:      	<unknown>
   10ef4:      	<unknown>
   10ef8:      	smlal2	v8.4s, v1.8h, v2.h[4]
   10efc:      	<unknown>
   10f00:      	adr	x14, 0x61429
   10f04:      	stp	w29, w15, [x9, #-0x78]
   10f08:      	<unknown>
   10f0c:      	<unknown>
   10f10:      	<unknown>
   10f14:      	<unknown>
   10f18:      	<unknown>
   10f1c:      	fnmls	z14.h, p3/m, z26.h, z4.h
   10f20:      	ldpsw	x9, x27, [x18, #0x60]
   10f24:      	stnp	w19, w29, [x3, #-0x100]
   10f28:      	<unknown>
   10f2c:      	ldpsw	x12, x8, [x1, #0x60]
   10f30:      	<unknown>
   10f34:      	smlal2	v8.4s, v1.8h, v2.h[4]
   10f38:      	<unknown>
   10f3c:      	adr	x14, 0x61465
   10f40:      	stp	w29, w15, [x9, #-0x78]
   10f44:      	<unknown>
   10f48:      	<unknown>
   10f4c:      	<unknown>
   10f50:      	<unknown>
   10f54:      	<unknown>
   10f58:      	fnmls	z14.h, p3/m, z26.h, z4.h
   10f5c:      	ldpsw	x9, x27, [x18, #0x60]
   10f60:      	stnp	w19, w29, [x3, #-0x100]
   10f64:      	<unknown>
   10f68:      	umlal2	v12.4s, v1.8h, v14.h[0]
   10f6c:      	<unknown>
   10f70:      	smlal2	v8.4s, v1.8h, v2.h[4]
   10f74:      	<unknown>
   10f78:      	adds	w14, w10, #0xa0a
   10f7c:      	stp	w29, w15, [x9, #-0x78]
   10f80:      	<unknown>
   10f84:      	<unknown>
   10f88:      	<unknown>
   10f8c:      	<unknown>
   10f90:      	<unknown>
   10f94:      	fnmls	z14.h, p3/m, z26.h, z4.h
   10f98:      	ldpsw	x9, x27, [x18, #0x60]
   10f9c:      	stnp	w19, w29, [x3, #-0x100]
   10fa0:      	<unknown>
   10fa4:      	<unknown>
   10fa8:      	ldpsw	x12, x8, [x1, #0x60]
   10fac:      	fcmne	p3.h, p5/z, z3.h, z8.h
   10fb0:      	<unknown>
   10fb4:      	smlal2	v8.4s, v1.8h, v2.h[4]
   10fb8:      	<unknown>
   10fbc:      	adr	x14, 0x614e5
   10fc0:      	stp	w29, w15, [x9, #-0x78]
   10fc4:      	<unknown>
   10fc8:      	<unknown>
   10fcc:      	<unknown>
   10fd0:      	<unknown>
   10fd4:      	<unknown>
   10fd8:      	fnmls	z14.h, p3/m, z26.h, z4.h
   10fdc:      	ldpsw	x9, x27, [x18, #0x60]
   10fe0:      	stnp	w19, w29, [x3, #-0x100]
   10fe4:      	<unknown>
   10fe8:      	<unknown>
   10fec:      	<unknown>
   10ff0:      	sqshlu	v19.2d, v10.2d, #0x23
   10ff4:      	<unknown>
   10ff8:      	ldnp	s20, s28, [x19, #-0x38]
   10ffc:      	<unknown>
   11000:      	uaddwt	z15.h, z26.h, z12.b
   11004:      	stnp	w1, w19, [x18, #-0xb8]
   11008:      	adds	w17, w9, #0xf4f
   1100c:      	<unknown>
   11010:      	<unknown>
   11014:      	subhnb	z9.b, z27.h, z20.h
   11018:      	ldrh	w13, [x3, #0x1a38]
   1101c:      	<unknown>
   11020:      	ldp	w20, w28, [x19, #-0x38]
   11024:      	<unknown>
   11028:      	<unknown>
   1102c:      	umin	v9.4h, v19.4h, v7.4h
   11030:      	stnp	w3, w0, [x3, #-0xc0]
   11034:      	bc.pl	0xad95c
   11038:      	<unknown>
   1103c:      	uabdl2	v20.4s, v19.8h, v9.8h
   11040:      	<unknown>
   11044:      	adr	x16, 0x71f49
   11048:      	adr	x16, 0x7164d
   1104c:      	<unknown>
   11050:      	adr	x29, 0x517f5
   11054:      	<unknown>
   11058:      	<unknown>
   1105c:      	fmaxnmv	h9, p0, z1.h
   11060:      	uabd	v19.8h, v3.8h, v9.8h
   11064:      	uqshl	v1.2d, v3.2d, #0x29
   11068:      	<unknown>
   1106c:      	adr	x16, 0x71f71
   11070:      	adr	x16, 0x71675
   11074:      	<unknown>
   11078:      	adr	x29, 0x5181d
   1107c:      	<unknown>
   11080:      	<unknown>
   11084:      	umlal2	v9.4s, v1.8h, v3.h[1]
   11088:      	fnmls	z21.h, p4/m, z19.h, z3.h
   1108c:      	adr	x0, 0x51551
   11090:      	adr	x24, 0x7169d
   11094:      	adr	x16, 0x71699
   11098:      	str	b17, [x9, #0x80a]
   1109c:      	<unknown>
   110a0:      	<unknown>
   110a4:      	<unknown>
   110a8:      	<unknown>
   110ac:      	<unknown>
   110b0:      	umlal2	v8.4s, v1.8h, v6.h[7]
   110b4:      	orn	w9, w3, w0, lsl #25
   110b8:      	stp	w9, w8, [x1, #-0x80]
   110bc:      	<unknown>
   110c0:      	<unknown>
   110c4:      	str	b5, [x3, #0x848]
   110c8:      	<unknown>
   110cc:      	<unknown>
   110d0:      	adr	x10, 0x515f5
   110d4:      	stnp	w9, w10, [x9]
   110d8:      	<unknown>
   110dc:      	<unknown>
   110e0:      	stnp	w28, w15, [x9, #-0x100]
   110e4:      	<unknown>
   110e8:      	ldpsw	x4, x23, [x27, #0x30]
   110ec:      	<unknown>
   110f0:      	ldpsw	x20, x16, [x19, #-0x58]
   110f4:      	adr	x12, 0xcfd82
   110f8:      	<unknown>
   110fc:      	<unknown>
   11100:      	ldpsw	x13, x21, [x11, #-0x90]
   11104:      	fnmls	z3.h, p3/m, z27.h, z4.h
   11108:      	ldpsw	x19, x29, [x2, #-0x70]
   1110c:      	fcmeq	p14.h, p1/z, z27.h, z12.h
   11110:      	<unknown>
   11114:      	stnp	w9, w10, [x9]
   11118:      	<unknown>
   1111c:      	<unknown>
   11120:      	adr	x1, 0x518c5
   11124:      	<unknown>
   11128:      	<unknown>
   1112c:      	<unknown>
   11130:      	<unknown>
   11134:      	<unknown>
   11138:      	<unknown>
   1113c:      	fnmls	z9.h, p3/m, z18.h, z20.h
   11140:      	ldnp	d18, d27, [x19, #-0x1f0]
   11144:      	fnmls	z19.h, p0/m, z10.h, z6.h
   11148:      	ldpsw	x19, x29, [x2, #-0x70]
   1114c:      	sqshlu	v14.2d, v27.2d, #0xe
   11150:      	sqshl	v19.2d, v2.2d, #0x32
   11154:      	ldnp	d22, d25, [x11, #-0xe0]
   11158:      	stnp	w1, w28, [x3, #-0x100]
   1115c:      	<unknown>
   11160:      	<unknown>
   11164:      	ldnp	s9, s27, [x27, #-0x90]
   11168:      	<unknown>
   1116c:      	<unknown>
   11170:      	<unknown>
   11174:      	adds	w8, w10, #0x490, lsl #12 // =0x490000
   11178:      	stp	w22, w8, [x1, #-0xb0]
   1117c:      	<unknown>
   11180:      	<unknown>
   11184:      	<unknown>
   11188:      	fcmeq	p3.h, p1/z, z11.h, z12.h
   1118c:      	<unknown>
   11190:      	stnp	w17, w10, [x9]
   11194:      	<unknown>
   11198:      	str	b20, [x3, x0]
   1119c:      	<unknown>
   111a0:      	<unknown>
   111a4:      	<unknown>
   111a8:      	<unknown>
   111ac:      	ldnp	d2, d29, [x10, #-0x170]
   111b0:      	<unknown>
   111b4:      	<unknown>
   111b8:      	ldp	d9, d27, [x11, #-0xb0]
   111bc:      	<unknown>
   111c0:      	<unknown>
   111c4:      	uabdl2	v20.4s, v19.8h, v9.8h
   111c8:      	uqshl	v7.8h, v3.8h, v5.8h
   111cc:      	ldp	w7, w29, [x3, #-0xc0]
   111d0:      	<unknown>
   111d4:      	<unknown>
   111d8:      	<unknown>
   111dc:      	stp	w29, w8, [x1, #-0x80]
   111e0:      	umlal2	v0.4s, v0.8h, v3.h[4]
   111e4:      	fcmne	p0.h, p6/z, z11.h, z12.h
   111e8:      	<unknown>
   111ec:      	<unknown>
   111f0:      	fcmeq	p3.h, p1/z, z11.h, z12.h
   111f4:      	stnp	w14, w10, [x11]
   111f8:      	<unknown>
   111fc:      	<unknown>
   11200:      	stnp	w28, w15, [x9, #-0x100]
   11204:      	<unknown>
   11208:      	ldpsw	x4, x23, [x27, #0x30]
   1120c:      	<unknown>
   11210:      	ldpsw	x20, x16, [x19, #-0x58]
   11214:      	adr	x12, 0xcfea2
   11218:      	<unknown>
   1121c:      	<unknown>
   11220:      	<unknown>
   11224:      	<unknown>
   11228:      	<unknown>
   1122c:      	<unknown>
   11230:      	stp	w20, w26, [x3, #-0xb8]
   11234:      	<unknown>
   11238:      	<unknown>
   1123c:      	<unknown>
   11240:      	<unknown>
   11244:      	smin	v9.8h, v19.8h, v7.8h
   11248:      	<unknown>
   1124c:      	<unknown>
   11250:      	fnmla	z18.h, p3/m, z27.h, z22.h
   11254:      	adr	x18, 0xd3fe3
   11258:      	fmaxnmv	h0, p2, z1.h
   1125c:      	uabd	v19.8h, v3.8h, v9.8h
   11260:      	uqshl	v1.2d, v3.2d, #0x29
   11264:      	<unknown>
   11268:      	<unknown>
   1126c:      	<unknown>
   11270:      	<unknown>
   11274:      	orn	w18, w2, w0, lsl #14
   11278:      	<unknown>
   1127c:      	ldnp	s18, s24, [x27, #-0xd8]
   11280:      	<unknown>
   11284:      	<unknown>
   11288:      	adds	w5, w19, w0, uxtx #3
   1128c:      	<unknown>
   11290:      	uqshl	v8.8h, v1.8h, v5.8h
   11294:      	<unknown>
   11298:      	stnp	w28, w15, [x9, #-0x100]
   1129c:      	<unknown>
   112a0:      	ldpsw	x4, x23, [x27, #0x30]
   112a4:      	<unknown>
   112a8:      	ldpsw	x20, x16, [x19, #-0x58]
   112ac:      	adr	x12, 0xcff3a
   112b0:      	<unknown>
   112b4:      	<unknown>
   112b8:      	<unknown>
   112bc:      	<unknown>
   112c0:      	<unknown>
   112c4:      	<unknown>
   112c8:      	stp	w20, w26, [x3, #-0xb8]
   112cc:      	<unknown>
   112d0:      	<unknown>
   112d4:      	<unknown>
   112d8:      	<unknown>
   112dc:      	umlal2	v8.4s, v1.8h, v6.h[7]
   112e0:      	orn	w9, w3, w0, lsl #25
   112e4:      	stp	w9, w8, [x1, #-0x80]
   112e8:      	<unknown>
   112ec:      	<unknown>
   112f0:      	<unknown>
   112f4:      	ldpsw	x5, x28, [x27, #-0x60]
   112f8:      	ldpsw	x14, x24, [x11, #-0x60]
   112fc:      	stnp	w15, w27, [x19]
   11300:      	bc.pl	0xadc28
   11304:      	stnp	w14, w10, [x10, #-0x100]
   11308:      	fmaxnmv	h0, p2, z1.h
   1130c:      	uabd	v19.8h, v3.8h, v9.8h
   11310:      	uqshl	v1.2d, v3.2d, #0x29
   11314:      	<unknown>
   11318:      	<unknown>
   1131c:      	adds	w20, w3, w0, uxtx #2
   11320:      	<unknown>
   11324:      	umlal2	v28.4s, v1.8h, v3.h[1]
   11328:      	fnmls	z21.h, p4/m, z19.h, z3.h
   1132c:      	stnp	w0, w10, [x9]
   11330:      	bc.pl	0xadc58
   11334:      	stnp	w14, w10, [x10, #-0x100]
   11338:      	umlal2	v0.4s, v1.8h, v3.h[5]
   1133c:      	fnmls	z21.h, p4/m, z19.h, z3.h
   11340:      	<unknown>
   11344:      	<unknown>
   11348:      	<unknown>
   1134c:      	<unknown>
   11350:      	<unknown>
   11354:      	<unknown>
   11358:      	<unknown>
   1135c:      	stnp	w0, w10, [x9]
   11360:      	bc.pl	0xadc88
   11364:      	stnp	w14, w10, [x10, #-0x100]
   11368:      	fmaxnmv	h0, p2, z1.h
   1136c:      	uabd	v19.8h, v3.8h, v9.8h
   11370:      	uqshl	v1.2d, v3.2d, #0x29
   11374:      	<unknown>
   11378:      	<unknown>
   1137c:      	<unknown>
   11380:      	umlal2	v28.4s, v1.8h, v3.h[1]
   11384:      	fnmls	z21.h, p4/m, z19.h, z3.h
   11388:      	<unknown>
   1138c:      	<unknown>
   11390:      	<unknown>
   11394:      	<unknown>
   11398:      	<unknown>
   1139c:      	<unknown>
   113a0:      	uqshl	v18.8h, v3.8h, v5.8h
   113a4:      	<unknown>
   113a8:      	ldp	w18, w24, [x27, #-0xd8]
   113ac:      	<unknown>
   113b0:      	<unknown>
   113b4:      	<unknown>
   113b8:      	<unknown>
   113bc:      	fadd	z9.h, z1.h, z12.h
   113c0:      	<unknown>
   113c4:      	<unknown>
   113c8:      	<unknown>
   113cc:      	ldpsw	x4, x23, [x27, #0x30]
   113d0:      	<unknown>
   113d4:      	ldpsw	x20, x16, [x19, #-0x58]
   113d8:      	adr	x12, 0xd0066
   113dc:      	<unknown>
   113e0:      	<unknown>
   113e4:      	ldpsw	x13, x21, [x11, #-0x90]
   113e8:      	fnmls	z3.h, p3/m, z27.h, z4.h
   113ec:      	ldpsw	x19, x29, [x2, #-0x70]
   113f0:      	fcmeq	p14.h, p1/z, z27.h, z12.h
   113f4:      	<unknown>
   113f8:      	uqshl	v0.8h, v0.8h, v5.8h
   113fc:      	<unknown>
   11400:      	<unknown>
   11404:      	<unknown>
   11408:      	fnmls	z6.h, p2/m, z10.h, z24.h
   1140c:      	<unknown>
   11410:      	<unknown>
   11414:      	<unknown>
   11418:      	ldpsw	x13, x24, [x10, #-0x40]
   1141c:      	<unknown>
   11420:      	umlsl2	v14.4s, v11.8h, v3.h[6]
   11424:      	<unknown>
   11428:      	<unknown>
   1142c:      	<unknown>
   11430:      	ubfx	w20, w3, #0, #27
   11434:      	ldpsw	x20, x28, [x19, #0x98]
   11438:      	stnp	w26, w25, [x11, #-0x100]
   1143c:      	<unknown>
   11440:      	<unknown>
   11444:      	ldp	w9, w27, [x19, #-0xc8]
   11448:      	<unknown>
   1144c:      	<unknown>
   11450:      	<unknown>
   11454:      	<unknown>
   11458:      	rsubhn2	v5.8h, v27.4s, v15.4s
   1145c:      	<unknown>
   11460:      	ldp	w9, w27, [x19, #-0xc8]
   11464:      	<unknown>
   11468:      	fadd	z16.h, z1.h, z18.h
   1146c:      	<unknown>
   11470:      	<unknown>
   11474:      	stnp	w8, w10, [x1, #-0xc0]
   11478:      	bc.pl	0xadda0
   1147c:      	<unknown>
   11480:      	stp	s16, s10, [x9, #-0x100]
   11484:      	<unknown>
   11488:      	uabdl2	v20.4s, v19.8h, v9.8h
   1148c:      	<unknown>
   11490:      	<unknown>
   11494:      	<unknown>
   11498:      	stp	w0, w12, [x9, #-0x80]
   1149c:      	<unknown>
   114a0:      	<unknown>
   114a4:      	<unknown>
   114a8:      	tbz	w9, #0xa, 0xc374 <.text+0xb374>
   114ac:      	orr	w20, w1, #0xffffefff
   114b0:      	stnp	w0, w10, [x1, #-0xc0]
   114b4:      	bc.pl	0xadddc
   114b8:      	<unknown>
   114bc:      	<unknown>
   114c0:      	orn	w13, w1, w8, lsl #8
   114c4:      	ldpsw	x19, x29, [x2, #-0x70]
   114c8:      	stp	s14, s25, [x27, #-0x100]
   114cc:      	adr	x0, 0x5fe51
   114d0:      	stnp	s7, s10, [x9, #-0x100]
   114d4:      	stp	w0, w12, [x9, #-0x80]
   114d8:      	<unknown>
   114dc:      	<unknown>
   114e0:      	stnp	w28, w15, [x9, #-0x100]
   114e4:      	<unknown>
   114e8:      	<unknown>
   114ec:      	adr	x9, 0x10d8f1
   114f0:      	<unknown>
   114f4:      	fnmls	z9.h, p3/m, z18.h, z20.h
   114f8:      	ldnp	d18, d27, [x19, #-0x1f0]
   114fc:      	<unknown>
   11500:      	b.hi	0xf612c
   11504:      	urshl	v15.8h, v11.8h, v9.8h
   11508:      	stnp	w20, w27, [x19, #-0x100]
   1150c:      	<unknown>
   11510:      	ldp	w9, w27, [x19, #-0xc8]
   11514:      	<unknown>
   11518:      	<unknown>
   1151c:      	<unknown>
   11520:      	<unknown>
   11524:      	adds	w0, w9, #0x80b
   11528:      	str	b9, [x1, #0xf48]
   1152c:      	adr	x0, 0x5feb1
   11530:      	fadd	z7.h, z1.h, z18.h
   11534:      	<unknown>
   11538:      	<unknown>
   1153c:      	ldpsw	x18, x20, [x26, #-0xc0]
   11540:      	tbz	w6, #0xa, 0xc3cc <.text+0xb3cc>
   11544:      	stnp	w20, w8, [x1, #-0xc0]
   11548:      	<unknown>
   1154c:      	stp	w20, w13, [x18, #-0x60]
   11550:      	stp	w0, wzr, [x17, #-0x80]
   11554:      	<unknown>
   11558:      	<unknown>
   1155c:      	<unknown>
   11560:      	<unknown>
   11564:      	fcmla	v1.8h, v19.8h, v20.h[0], #270
   11568:      	<unknown>
   1156c:      	orn	w14, w3, w8, lsl #8
   11570:      	ldpsw	x19, x29, [x2, #-0x70]
   11574:      	<unknown>
   11578:      	stp	w12, w8, [x1, #-0x60]
   1157c:      	<unknown>
   11580:      	ldp	w14, w21, [x2, #0x70]
   11584:      	<unknown>
   11588:      	ldurb	w8, [x10, #-0xdc]
   1158c:      	<unknown>
   11590:      	<unknown>
   11594:      	str	b5, [x3, #0x848]
   11598:      	ldxrh	w0, [x1]
   1159c:      	orn	w1, w18, w24, lsl #20
   115a0:      	fmaxnmv	h9, p0, z1.h
   115a4:      	uabd	v19.8h, v3.8h, v9.8h
   115a8:      	uqshl	v1.2d, v3.2d, #0x29
   115ac:      	stnp	w14, w10, [x11]
   115b0:      	bc.pl	0xaded8
   115b4:      	stnp	w14, w10, [x10, #-0x100]
   115b8:      	fmaxnmv	h0, p2, z1.h
   115bc:      	uabd	v19.8h, v3.8h, v9.8h
   115c0:      	uqshl	v1.2d, v3.2d, #0x29
   115c4:      	<unknown>
   115c8:      	<unknown>
   115cc:      	adds	w20, w3, w0, uxtx #2
   115d0:      	<unknown>
   115d4:      	<unknown>
   115d8:      	<unknown>
   115dc:      	stp	w18, w14, [x2, #-0xb0]
   115e0:      	<unknown>
   115e4:      	stp	w3, w25, [x11, #-0x100]
   115e8:      	stnp	w0, w10, [x9]
   115ec:      	bc.pl	0xadf14
   115f0:      	stnp	w14, w10, [x10, #-0x100]
   115f4:      	ldxrh	w0, [x1]
   115f8:      	orn	w1, w18, w24, lsl #20
   115fc:      	<unknown>
   11600:      	<unknown>
   11604:      	<unknown>
   11608:      	<unknown>
   1160c:      	adds	w20, w3, w0, uxtx #2
   11610:      	<unknown>
   11614:      	fmaxnmv	h28, p0, z1.h
   11618:      	uabd	v19.8h, v3.8h, v9.8h
   1161c:      	uqshl	v1.2d, v3.2d, #0x29
   11620:      	<unknown>
   11624:      	<unknown>
   11628:      	<unknown>
   1162c:      	ldeorh	w16, w28, [x1]
   11630:      	<unknown>
   11634:      	ldpsw	x1, x28, [x26, #-0xe8]
   11638:      	<unknown>
   1163c:      	fnmls	z19.h, p2/m, z10.h, z26.h
   11640:      	fcmeq	p0.h, p2/z, z1.h, #0.0
   11644:      	uabd	v20.8h, v11.8h, v18.8h
   11648:      	<unknown>
   1164c:      	<unknown>
   11650:      	<unknown>
   11654:      	<unknown>
   11658:      	<unknown>
   1165c:      	<unknown>
   11660:      	ldpsw	x5, x28, [x27, #-0x60]
   11664:      	ldpsw	x14, x24, [x11, #-0x60]
   11668:      	adds	w15, w19, w0, uxtx #3
   1166c:      	uqshl	v0.8h, v1.8h, v5.8h
   11670:      	ldp	w7, w29, [x3, #-0xc0]
   11674:      	<unknown>
   11678:      	<unknown>
   1167c:      	<unknown>
   11680:      	<unknown>
   11684:      	<unknown>
   11688:      	<unknown>
   1168c:      	<unknown>
   11690:      	<unknown>
   11694:      	<unknown>
   11698:      	<unknown>
   1169c:      	fmaxnmv	h28, p0, z1.h
   116a0:      	uabd	v19.8h, v3.8h, v9.8h
   116a4:      	uqshl	v1.2d, v3.2d, #0x29
   116a8:      	<unknown>
   116ac:      	<unknown>
   116b0:      	str	b20, [x3, x0]
   116b4:      	<unknown>
   116b8:      	<unknown>
   116bc:      	fnmls	z6.h, p2/m, z10.h, z24.h
   116c0:      	<unknown>
   116c4:      	<unknown>
   116c8:      	<unknown>
   116cc:      	ldpsw	x13, x24, [x10, #-0x40]
   116d0:      	<unknown>
   116d4:      	ldpsw	x19, x24, [x27, #-0xb8]
   116d8:      	ldpsw	x19, x29, [x2, #-0x70]
   116dc:      	fcmeq	p14.h, p1/z, z27.h, z12.h
   116e0:      	<unknown>
   116e4:      	uqshl	v0.8h, v0.8h, v5.8h
   116e8:      	<unknown>
   116ec:      	<unknown>
   116f0:      	<unknown>
   116f4:      	fnmls	z6.h, p2/m, z10.h, z24.h
   116f8:      	<unknown>
   116fc:      	<unknown>
   11700:      	<unknown>
   11704:      	ldpsw	x13, x24, [x10, #-0x40]
   11708:      	<unknown>
   1170c:      	ldpsw	x19, x24, [x27, #-0xb8]
   11710:      	ldpsw	x19, x29, [x2, #-0x70]
   11714:      	fcmeq	p14.h, p1/z, z27.h, z12.h
   11718:      	<unknown>
   1171c:      	<unknown>
   11720:      	<unknown>
   11724:      	<unknown>
   11728:      	<unknown>
   1172c:      	<unknown>
   11730:      	ldpsw	x19, x29, [x2, #-0x70]
   11734:      	<unknown>
   11738:      	ldpsw	x1, x28, [x26, #-0xe8]
   1173c:      	<unknown>
   11740:      	fnmls	z19.h, p2/m, z10.h, z26.h
   11744:      	fcmne	p0.h, p2/z, z1.h, #0.0
   11748:      	<unknown>
   1174c:      	ldpsw	x19, x29, [x2, #-0x70]
   11750:      	<unknown>
   11754:      	ldpsw	x1, x28, [x26, #-0xe8]
   11758:      	<unknown>
   1175c:      	fnmls	z19.h, p2/m, z10.h, z26.h
   11760:      	fmaxnmv	h0, p2, z1.h
   11764:      	uabd	v19.8h, v3.8h, v9.8h
   11768:      	uqshl	v1.2d, v3.2d, #0x29
   1176c:      	<unknown>
   11770:      	<unknown>
   11774:      	ldpsw	x1, x28, [x26, #-0xe8]
   11778:      	<unknown>
   1177c:      	fnmls	z19.h, p2/m, z10.h, z26.h
   11780:      	<unknown>
   11784:      	<unknown>
   11788:      	str	b9, [x1, #0x848]
   1178c:      	<unknown>
   11790:      	ldpsw	x19, x24, [x27, #-0xb8]
   11794:      	<unknown>
   11798:      	<unknown>
   1179c:      	<unknown>
   117a0:      	<unknown>
   117a4:      	uabdl2	v20.4s, v19.8h, v9.8h
   117a8:      	<unknown>
   117ac:      	<unknown>
   117b0:      	<unknown>
   117b4:      	<unknown>
   117b8:      	adds	w0, w9, #0x80b
   117bc:      	str	b9, [x1, #0xf48]
   117c0:      	<unknown>
   117c4:      	<unknown>
   117c8:      	<unknown>
   117cc:      	<unknown>
   117d0:      	<unknown>
   117d4:      	<unknown>
   117d8:      	<unknown>
   117dc:      	<unknown>
   117e0:      	<unknown>
   117e4:      	<unknown>
   117e8:      	ldxrh	w8, [x1]
   117ec:      	<unknown>
   117f0:      	<unknown>
   117f4:      	ldpsw	x5, x28, [x27, #-0x60]
   117f8:      	ldpsw	x14, x24, [x11, #-0x60]
   117fc:      	stp	s15, s27, [x19, #-0x100]
   11800:      	<unknown>
   11804:      	ldp	w18, w24, [x27, #-0xd8]
   11808:      	<unknown>
   1180c:      	ldpsw	x19, x24, [x27, #-0xb8]
   11810:      	<unknown>
   11814:      	stnp	w5, w27, [x19, #-0x100]
   11818:      	<unknown>
   1181c:      	<unknown>
   11820:      	<unknown>
   11824:      	<unknown>
   11828:      	<unknown>
   1182c:      	<unknown>
   11830:      	<unknown>
   11834:      	ldurb	w8, [x10, #-0xdc]
   11838:      	<unknown>
   1183c:      	<unknown>
   11840:      	<unknown>
   11844:      	ldp	w9, w27, [x27, #-0x90]
   11848:      	<unknown>
   1184c:      	<unknown>
   11850:      	<unknown>
   11854:      	<unknown>
   11858:      	<unknown>
   1185c:      	<unknown>
   11860:      	orn	w5, w11, w0, lsl #10
   11864:      	<unknown>
   11868:      	<unknown>
   1186c:      	<unknown>
   11870:      	stp	w18, w12, [x10, #-0x50]
   11874:      	<unknown>
   11878:      	<unknown>
   1187c:      	adr	x28, 0x73c81
   11880:      	<unknown>
   11884:      	<unknown>
   11888:      	ldeorh	w16, w28, [x1]
   1188c:      	stnp	w1, w12, [x3]
   11890:      	<unknown>
   11894:      	<unknown>
   11898:      	ldp	w16, w30, [x1, #-0xd0]
   1189c:      	adr	x0, 0x52021
   118a0:      	eor	w24, w11, #0x1ffffff
   118a4:      	<unknown>
   118a8:      	cbz	w20, 0x7e354
   118ac:      	<unknown>
   118b0:      	<unknown>
   118b4:      	tbz	w0, #0x4, 0x12038 <.text+0x11038>
   118b8:      	<unknown>
   118bc:      	<unknown>
   118c0:      	adr	x1, 0x52065
   118c4:      	ldnp	d0, d10, [x0, #0x10]
   118c8:      	ldp	d9, d25, [x27, #-0x120]
   118cc:      	<unknown>
   118d0:      	<unknown>
   118d4:      	<unknown>
   118d8:      	<unknown>
   118dc:      	adds	w0, w9, #0x80b
   118e0:      	str	b9, [x9, #0x80a]
   118e4:      	<unknown>
   118e8:      	ldnp	d18, d25, [x10, #-0x1f0]
   118ec:      	fnmls	z16.h, p0/m, z10.h, z7.h
   118f0:      	<unknown>
   118f4:      	fnmls	z16.h, p0/m, z10.h, z7.h
   118f8:      	ldnp	d19, d0, [x3, #0x10]
   118fc:      	<unknown>
   11900:      	<unknown>
   11904:      	fnmls	z19.h, p2/m, z10.h, z26.h
   11908:      	<unknown>
   1190c:      	<unknown>
   11910:      	<unknown>
   11914:      	<unknown>
   11918:      	<unknown>
   1191c:      	<unknown>
   11920:      	stp	s12, s19, [x2, #-0x100]
   11924:      	<unknown>
   11928:      	ldp	w14, w21, [x2, #0x70]
   1192c:      	<unknown>
   11930:      	<unknown>
   11934:      	stp	w11, w8, [x1, #-0x78]
   11938:      	<unknown>
   1193c:      	uabal2	v9.4s, v19.8h, v21.8h
   11940:      	fnmls	z20.h, p2/m, z11.h, z13.h
   11944:      	<unknown>
   11948:      	<unknown>
   1194c:      	ldnp	d20, d24, [x10, #-0x1e0]
   11950:      	<unknown>
   11954:      	<unknown>
   11958:      	<unknown>
   1195c:      	stnp	w29, w8, [x1, #-0xc0]
   11960:      	<unknown>
   11964:      	<unknown>
   11968:      	<unknown>
   1196c:      	<unknown>
   11970:      	<unknown>
   11974:      	ldpsw	x5, x28, [x19, #-0x50]
   11978:      	b.lo	0xf8624
   1197c:      	fnmls	z1.h, p0/m, z19.h, z12.h
   11980:      	<unknown>
   11984:      	<unknown>
   11988:      	fnmls	z13.h, p0/m, z11.h, z7.h
   1198c:      	<unknown>
   11990:      	<unknown>
   11994:      	stnp	w29, w8, [x1, #-0xc0]
   11998:      	<unknown>
   1199c:      	<unknown>
   119a0:      	<unknown>
   119a4:      	<unknown>
   119a8:      	stnp	w29, w8, [x1, #-0xc0]
   119ac:      	<unknown>
   119b0:      	<unknown>
   119b4:      	<unknown>
   119b8:      	<unknown>
   119bc:      	stnp	w29, w8, [x1, #-0xc0]
   119c0:      	<unknown>
   119c4:      	<unknown>
   119c8:      	<unknown>
   119cc:      	<unknown>
   119d0:      	fnmls	z18.h, p2/m, z11.h, z22.h
   119d4:      	<unknown>
   119d8:      	<unknown>
   119dc:      	ldpsw	x0, x17, [x0, #-0x70]
   119e0:      	<unknown>
   119e4:      	ldpsw	x9, x27, [x19, #-0xe0]
   119e8:      	<unknown>
   119ec:      	stnp	w29, w8, [x1, #-0xc0]
   119f0:      	<unknown>
   119f4:      	<unknown>
   119f8:      	<unknown>
   119fc:      	<unknown>
   11a00:      	<unknown>
   11a04:      	<unknown>
   11a08:      	<unknown>
   11a0c:      	<unknown>
   11a10:      	stnp	w29, w8, [x1, #-0xc0]
   11a14:      	<unknown>
   11a18:      	<unknown>
   11a1c:      	adr	x16, 0x11f42 <.text+0x10f42>
   11a20:      	<unknown>
   11a24:      	<unknown>
   11a28:      	<unknown>
   11a2c:      	stnp	w1, w15, [x9, #-0x100]
   11a30:      	ldpsw	x8, x29, [x17, #-0x88]
   11a34:      	stp	w4, w8, [x3, #-0xb0]
   11a38:      	<unknown>
   11a3c:      	ldpsw	x14, x27, [x26, #-0x60]
   11a40:      	<unknown>
   11a44:      	ldpsw	x14, x24, [x27, #-0x60]
   11a48:      	<unknown>
   11a4c:      	stnp	w29, w8, [x1, #-0xc0]
   11a50:      	<unknown>
   11a54:      	<unknown>
   11a58:      	eor	w16, w9, #0x7ff
   11a5c:      	<unknown>
   11a60:      	<unknown>
   11a64:      	<unknown>
   11a68:      	stnp	w1, w15, [x9, #-0x100]
   11a6c:      	ldpsw	x8, x29, [x17, #-0x88]
   11a70:      	stp	w4, w8, [x3, #-0xb0]
   11a74:      	<unknown>
   11a78:      	fnmls	z14.h, p0/m, z10.h, z13.h
   11a7c:      	<unknown>
   11a80:      	umlal2	v8.4s, v1.8h, v6.h[7]
   11a84:      	orn	w9, w3, w0, lsl #25
   11a88:      	stp	w9, w8, [x1, #-0x80]
   11a8c:      	<unknown>
   11a90:      	b.ls	0x10475c
   11a94:      	<unknown>
   11a98:      	adds	w29, w1, #0xcc8
   11a9c:      	<unknown>
   11aa0:      	str	b11, [x3, #0x848]
   11aa4:      	<unknown>
   11aa8:      	<unknown>
   11aac:      	adr	x10, 0x51fd1
   11ab0:      	<unknown>
   11ab4:      	ldpsw	x9, x27, [x27, #-0x70]
   11ab8:      	str	b20, [x11, x0, lsl #0]
   11abc:      	adds	w29, w1, #0xcc8
   11ac0:      	<unknown>
   11ac4:      	<unknown>
   11ac8:      	<unknown>
   11acc:      	<unknown>
   11ad0:      	umlsl2	v6.4s, v11.8h, v12.h[4]
   11ad4:      	fcmeq	p3.h, p2/z, z27.h, z18.h
   11ad8:      	<unknown>
   11adc:      	st1	{ v5.8h, v6.8h, v7.8h }, [x3]
   11ae0:      	ldp	s15, s24, [x27, #-0xa8]
   11ae4:      	<unknown>
   11ae8:      	str	b11, [x3, #0x848]
   11aec:      	ldpsw	x0, x17, [x9, #-0xd0]
   11af0:      	<unknown>
   11af4:      	umin	v21.8h, v18.8h, v9.8h
   11af8:      	<unknown>
   11afc:      	fnmls	z12.h, p2/m, z11.h, z26.h
   11b00:      	mla	v4.8h, v3.8h, v12.h[0]
   11b04:      	<unknown>
   11b08:      	<unknown>
   11b0c:      	<unknown>
   11b10:      	<unknown>
   11b14:      	<unknown>
   11b18:      	ldpsw	x3, x28, [x11, #-0x58]
   11b1c:      	<unknown>
   11b20:      	fnmls	z14.h, p0/m, z10.h, z13.h
   11b24:      	<unknown>
   11b28:      	umlal2	v8.4s, v1.8h, v6.h[7]
   11b2c:      	orn	w9, w3, w0, lsl #25
   11b30:      	stp	w9, w8, [x1, #-0x80]
   11b34:      	<unknown>
   11b38:      	<unknown>
   11b3c:      	<unknown>
   11b40:      	umlal2	v8.4s, v1.8h, v6.h[7]
   11b44:      	orn	w9, w3, w0, lsl #25
   11b48:      	stp	w9, w8, [x1, #-0x80]
   11b4c:      	<unknown>
   11b50:      	<unknown>
   11b54:      	str	b5, [x3, #0x848]
   11b58:      	<unknown>
   11b5c:      	<unknown>
   11b60:      	adr	x10, 0x52085
   11b64:      	<unknown>
   11b68:      	fnmls	z1.h, p3/m, z3.h, z21.h
   11b6c:      	<unknown>
   11b70:      	umlal2	v8.4s, v1.8h, v6.h[7]
   11b74:      	orn	w9, w3, w0, lsl #25
   11b78:      	stp	w9, w8, [x1, #-0x80]
   11b7c:      	adr	x0, 0xfc5df
   11b80:      	<unknown>
   11b84:      	<unknown>
   11b88:      	<unknown>
   11b8c:      	<unknown>
   11b90:      	stnp	w1, w15, [x9, #-0x100]
   11b94:      	ldpsw	x8, x29, [x17, #-0x88]
   11b98:      	stp	w4, w8, [x3, #-0xb0]
   11b9c:      	<unknown>
   11ba0:      	<unknown>
   11ba4:      	<unknown>
   11ba8:      	<unknown>
   11bac:      	<unknown>
   11bb0:      	str	b20, [x3, #0x848]
   11bb4:      	<unknown>
   11bb8:      	<unknown>
   11bbc:      	adr	x10, 0x520e1
   11bc0:      	mla	v9.8h, v1.8h, v8.h[0]
   11bc4:      	<unknown>
   11bc8:      	<unknown>
   11bcc:      	stnp	w29, w8, [x1, #-0xc0]
   11bd0:      	<unknown>
   11bd4:      	<unknown>
   11bd8:      	stnp	w16, w10, [x9]
   11bdc:      	<unknown>
   11be0:      	<unknown>
   11be4:      	str	b9, [x1, #0xc0a]
   11be8:      	stp	w29, w12, [x9, #-0xb8]
   11bec:      	<unknown>
   11bf0:      	<unknown>
   11bf4:      	<unknown>
   11bf8:      	<unknown>
   11bfc:      	udf	#0x67
   11c00:      	fnmls	z16.h, p0/m, z10.h, z7.h
   11c04:      	<unknown>
   11c08:      	<unknown>
   11c0c:      	<unknown>
   11c10:      	<unknown>
   11c14:      	<unknown>
   11c18:      	<unknown>
   11c1c:      	<unknown>
   11c20:      	<unknown>
   11c24:      	<unknown>
   11c28:      	<unknown>
   11c2c:      	stnp	d16, d30, [x1, #-0x1b0]
   11c30:      	umlal2	v24.4s, v2.8h, v14.h[2]
   11c34:      	<unknown>
   11c38:      	<unknown>
   11c3c:      	umax	v20.4h, v11.4h, v4.4h
   11c40:      	<unknown>
   11c44:      	<unknown>
   11c48:      	<unknown>
   11c4c:      	uabdl	v15.4s, v19.4h, v5.4h
   11c50:      	<unknown>
   11c54:      	<unknown>
   11c58:      	<unknown>
   11c5c:      	sqshlu	v20.2d, v11.2d, #0x14
   11c60:      	<unknown>
   11c64:      	ldpsw	x20, x29, [x3, #-0x70]
   11c68:      	fnmls	z2.h, p5/m, z11.h, z20.h
   11c6c:      	ldeorh	w16, w26, [x1]
   11c70:      	<unknown>
   11c74:      	<unknown>
   11c78:      	<unknown>
   11c7c:      	stgp	x5, x28, [x27, #-0x400]
   11c80:      	umlal2	v19.4s, v3.8h, v14.h[2]
   11c84:      	<unknown>
   11c88:      	<unknown>
   11c8c:      	umax	v20.4h, v11.4h, v4.4h
   11c90:      	fadd	z10.h, z0.h, z13.h
   11c94:      	ldrh	w13, [x27, #0x1936]
   11c98:      	ldnp	d20, d24, [x10, #-0x1e0]
   11c9c:      	str	b5, [x3, #0x848]
   11ca0:      	<unknown>
   11ca4:      	<unknown>
   11ca8:      	adr	x10, 0x521cd
   11cac:      	<unknown>
   11cb0:      	raddhn2	v13.8h, v27.4s, v15.4s
   11cb4:      	<unknown>
   11cb8:      	ldp	d18, d25, [x11, #0xd0]
   11cbc:      	bc.pl	0x52408
   11cc0:      	<unknown>
   11cc4:      	fcmla	z1.h, p6/m, z3.h, z1.h, #270
   11cc8:      	<unknown>
   11ccc:      	ldeorh	w16, w19, [x3]
   11cd0:      	<unknown>
   11cd4:      	uabdl2	v9.8h, v27.16b, v0.16b
   11cd8:      	<unknown>
   11cdc:      	fcmla	v21.8h, v3.8h, v16.h[1], #270
   11ce0:      	<unknown>
   11ce4:      	<unknown>
   11ce8:      	<unknown>
   11cec:      	<unknown>
   11cf0:      	rsubhn2	v0.8h, v25.4s, v15.4s
   11cf4:      	<unknown>
   11cf8:      	ldpsw	x18, x24, [x11, #-0x60]
   11cfc:      	bic	w15, w19, w14, lsl #27
   11d00:      	<unknown>
   11d04:      	<unknown>
   11d08:      	<unknown>
   11d0c:      	eor	w8, w1, #0xff000007
   11d10:      	<unknown>
   11d14:      	b.al	0xb88fc
   11d18:      	<unknown>
   11d1c:      	<unknown>
   11d20:      	adr	x24, 0x72325
   11d24:      	adr	x16, 0x72329
   11d28:      	adr	x16, 0x7232d
   11d2c:      	adr	x16, 0x72331
   11d30:      	<unknown>
   11d34:      	orr	w28, w3, #0xff000001
   11d38:      	stp	w9, w10, [x9, #-0xb8]
   11d3c:      	adr	x0, 0xf07bf
   11d40:      	<unknown>
   11d44:      	adr	x1, 0x524e9
		...
   11d50:      	udf	#0x10
   11d54:      	udf	#0x0
   11d58:      	udf	#0x18
   11d5c:      	udf	#0x0
   11d60:      	udf	#0x18
   11d64:      	udf	#0x0
   11d68:      	udf	#0x19
   11d6c:      	udf	#0x0
   11d70:      	udf	#0x21
   11d74:      	udf	#0x0
   11d78:      	udf	#0x21
   11d7c:      	udf	#0x0
   11d80:      	udf	#0x22
   11d84:      	udf	#0x0
   11d88:      	udf	#0x27
   11d8c:      	udf	#0x0
   11d90:      	udf	#0x2a
   11d94:      	udf	#0x0
   11d98:      	<unknown>
   11d9c:      	ldpsw	x5, x28, [x19, #-0x50]
   11da0:      	b.lo	0xf8a4c
   11da4:      	fnmls	z1.h, p0/m, z19.h, z12.h
   11da8:      	<unknown>
   11dac:      	<unknown>
   11db0:      	str	b19, [x2, #0x848]
   11db4:      	<unknown>
   11db8:      	<unknown>
   11dbc:      	adr	x10, 0x522e1
   11dc0:      	mla	v9.8h, v1.8h, v9.h[0]
   11dc4:      	<unknown>
   11dc8:      	<unknown>
   11dcc:      	fcmla	z0.h, p2/m, z0.h, z1.h, #90
   11dd0:      	<unknown>
   11dd4:      	<unknown>
   11dd8:      	str	b17, [x9, #0x80a]
   11ddc:      	<unknown>
   11de0:      	bfdot	z8.s, z9.h, z4.h[0]
   11de4:      	<unknown>
   11de8:      	<unknown>
   11dec:      	str	b9, [x1, #0xf48]
   11df0:      	stnp	w0, w12, [x1]
   11df4:      	<unknown>
   11df8:      	<unknown>
   11dfc:      	stp	w6, w8, [x1, #-0x48]
   11e00:      	<unknown>
   11e04:      	<unknown>
   11e08:      	<unknown>
   11e0c:      	ldp	d8, d21, [x3, #-0x170]
   11e10:      	ldpsw	x5, x28, [x19, #0x60]
   11e14:      	<unknown>
   11e18:      	adr	x8, 0xe09fe
   11e1c:      	<unknown>
   11e20:      	<unknown>
   11e24:      	<unknown>
   11e28:      	<unknown>
   11e2c:      	<unknown>
   11e30:      	<unknown>
   11e34:      	ldpsw	x3, x26, [x3, #0xa0]
   11e38:      	<unknown>
   11e3c:      	<unknown>
   11e40:      	mls	v14.4h, v3.4h, v10.h[7]
   11e44:      	adr	x17, 0x72449
   11e48:      	<unknown>
   11e4c:      	<unknown>
   11e50:      	ushl	v13.8h, v27.8h, v5.8h
   11e54:      	<unknown>
   11e58:      	fnmls	z20.h, p2/m, z10.h, z13.h
   11e5c:      	<unknown>
   11e60:      	fnmls	z20.h, p2/m, z10.h, z13.h
   11e64:      	fnmla	z18.h, p1/m, z19.h, z18.h
   11e68:      	stp	w17, w8, [x3, #-0xc0]
   11e6c:      	<unknown>
   11e70:      	<unknown>
   11e74:      	<unknown>
   11e78:      	<unknown>
   11e7c:      	<unknown>
   11e80:      	<unknown>
   11e84:      	fnmls	z20.h, p2/m, z10.h, z13.h
   11e88:      	<unknown>
   11e8c:      	<unknown>
   11e90:      	<unknown>
   11e94:      	<unknown>
   11e98:      	stgp	x12, x25, [x11, #-0x400]
   11e9c:      	<unknown>
   11ea0:      	adr	x5, 0x982ae
   11ea4:      	<unknown>
   11ea8:      	fnmls	z5.h, p3/m, z19.h, z3.h
   11eac:      	ldpsw	x0, x29, [x1, #-0xc0]
   11eb0:      	ldpsw	x19, x8, [x3, #-0xa0]
   11eb4:      	<unknown>
   11eb8:      	<unknown>
   11ebc:      	<unknown>
   11ec0:      	<unknown>
   11ec4:      	<unknown>
   11ec8:      	<unknown>
   11ecc:      	<unknown>
   11ed0:      	<unknown>
   11ed4:      	<unknown>
   11ed8:      	ldnp	d25, d16, [x11, #-0x140]
   11edc:      	<unknown>
   11ee0:      	<unknown>
   11ee4:      	<unknown>
   11ee8:      	ccmn	w0, #0xe, #0x0, pl
   11eec:      	whilewr	p0.h, x1, x24
   11ef0:      	stnp	d16, d12, [x9, #-0xa0]
   11ef4:      	adr	x24, 0x6c4a1
   11ef8:      	adds	w24, w11, #0xc09
   11efc:      	<unknown>
   11f00:      	ldpsw	x27, x17, [x18, #-0xf8]
   11f04:      	<unknown>
   11f08:      	udf	#0xa
   11f0c:      	udf	#0x0
   11f10:      	udf	#0xd2e4
   11f14:      	udf	#0x0
   11f18:      	udf	#0xd314
   11f1c:      	udf	#0x0
   11f20:      	udf	#0xd320
   11f24:      	udf	#0x0
   11f28:      	udf	#0xd32c
   11f2c:      	udf	#0x0
   11f30:      	udf	#0xd338
   11f34:      	udf	#0x0
   11f38:      	udf	#0xd338
   11f3c:      	udf	#0x0
   11f40:      	udf	#0xd338
   11f44:      	udf	#0x0
   11f48:      	udf	#0xd338
   11f4c:      	udf	#0x0
   11f50:      	udf	#0xd344
   11f54:      	udf	#0x0
   11f58:      	uabd	v19.8h, v2.8h, v1.8h
   11f5c:      	<unknown>
   11f60:      	<unknown>
   11f64:      	<unknown>
   11f68:      	<unknown>
   11f6c:      	<unknown>
   11f70:      	cmla	z0.h, z1.h, z19.h, #180
   11f74:      	<unknown>
   11f78:      	<unknown>
   11f7c:      	<unknown>
   11f80:      	umin	v4.8h, v26.8h, v23.8h
   11f84:      	fnmls	z19.h, p5/m, z3.h, z18.h
   11f88:      	adr	x1, 0x52d36
   11f8c:      	<unknown>
   11f90:      	adr	x8, 0x9a7f6
   11f94:      	fadd	z9.h, z1.h, z4.h
   11f98:      	<unknown>
   11f9c:      	<unknown>
   11fa0:      	<unknown>
   11fa4:      	<unknown>
   11fa8:      	<unknown>
   11fac:      	<unknown>
   11fb0:      	<unknown>
   11fb4:      	<unknown>
   11fb8:      	<unknown>
   11fbc:      	<unknown>
   11fc0:      	<unknown>
   11fc4:      	umin	v21.8h, v18.8h, v11.8h
   11fc8:      	<unknown>
   11fcc:      	<unknown>
   11fd0:      	<unknown>
   11fd4:      	ldnp	d6, d24, [x10, #-0x170]
   11fd8:      	<unknown>
   11fdc:      	adr	x15, 0xf03eb
   11fe0:      	adr	x5, 0x52dae
   11fe4:      	<unknown>
   11fe8:      	<unknown>
   11fec:      	<unknown>
   11ff0:      	ldnp	d15, d24, [x27, #-0x110]
   11ff4:      	<unknown>
   11ff8:      	<unknown>
   11ffc:      	stnp	w29, w8, [x1, #-0x100]
   12000:      	strh	w16, [x1, x5, lsl #1]
   12004:      	<unknown>
   12008:      	ldnp	d6, d24, [x10, #-0x170]
   1200c:      	<unknown>
   12010:      	<unknown>
   12014:      	adr	x12, 0x52da2
   12018:      	<unknown>
   1201c:      	<unknown>
   12020:      	adr	x7, 0xf6cce
   12024:      	<unknown>
   12028:      	<unknown>
   1202c:      	str	b21, [x27, #0x81c]
   12030:      	adr	x0, 0x62435
   12034:      	ldp	w24, w9, [x11, #-0x40]
   12038:      	eor	w13, w16, #0x7
   1203c:      	<unknown>
   12040:      	<unknown>
   12044:      	<unknown>
   12048:      	<unknown>
   1204c:      	<unknown>
   12050:      	<unknown>
   12054:      	bfdot	z20.s, z27.h, z7.h[1]
   12058:      	str	b5, [x3, #0x848]
   1205c:      	<unknown>
   12060:      	<unknown>
   12064:      	adr	x10, 0x52589
   12068:      	ldpsw	x9, x0, [x1, #0x30]
   1206c:      	<unknown>
   12070:      	<unknown>
   12074:      	stnp	w29, w8, [x1, #-0xc0]
   12078:      	<unknown>
   1207c:      	<unknown>
   12080:      	cmla	z16.b, z9.b, z0.b, #180
   12084:      	<unknown>
   12088:      	ldpsw	x9, x28, [x3, #-0x60]
   1208c:      	<unknown>
   12090:      	stnp	w29, w8, [x1, #-0xc0]
   12094:      	<unknown>
   12098:      	<unknown>
   1209c:      	st1	{ v16.4s, v17.4s, v18.4s, v19.4s }, [x9]
   120a0:      	smin	v9.8h, v19.8h, v5.8h
   120a4:      	fnmls	z21.h, p3/m, z11.h, z2.h
   120a8:      	str	b18, [x3, #0x848]
   120ac:      	<unknown>
   120b0:      	<unknown>
   120b4:      	adr	x10, 0x525d9
   120b8:      	<unknown>
   120bc:      	<unknown>
   120c0:      	ldnp	d5, d29, [x19, #-0x1b0]
   120c4:      	<unknown>
   120c8:      	umlal2	v8.4s, v1.8h, v6.h[7]
   120cc:      	orn	w9, w3, w0, lsl #25
   120d0:      	stp	w9, w8, [x1, #-0x80]
   120d4:      	<unknown>
   120d8:      	<unknown>
   120dc:      	stnp	w1, w15, [x9, #-0x100]
   120e0:      	ldpsw	x8, x29, [x17, #-0x88]
   120e4:      	stp	w4, w8, [x3, #-0xb0]
   120e8:      	<unknown>
   120ec:      	ldpsw	x4, x25, [x10, #-0x50]
   120f0:      	<unknown>
   120f4:      	<unknown>
   120f8:      	stnp	w29, w8, [x1, #-0xc0]
   120fc:      	<unknown>
   12100:      	<unknown>
   12104:      	<unknown>
   12108:      	uabd	v24.8h, v3.8h, v5.8h
   1210c:      	<unknown>
   12110:      	<unknown>
   12114:      	stnp	w1, w15, [x9, #-0x100]
   12118:      	ldpsw	x8, x29, [x17, #-0x88]
   1211c:      	stp	w4, w8, [x3, #-0xb0]
   12120:      	<unknown>
   12124:      	fnmls	z5.h, p6/m, z2.h, z20.h
   12128:      	<unknown>
   1212c:      	<unknown>
   12130:      	fnmls	z19.h, p2/m, z10.h, z26.h
   12134:      	<unknown>
   12138:      	stnp	w16, w0, [x1, #-0xf8]
   1213c:      	<unknown>
   12140:      	fnmls	z5.h, p3/m, z19.h, z4.h
   12144:      	<unknown>
   12148:      	str	b1, [x3, #0xf48]
   1214c:      	<unknown>
   12150:      	<unknown>
   12154:      	adr	x10, 0x52679
   12158:      	<unknown>
   1215c:      	sqshrnb	z6.b, z1.h, #0x8
   12160:      	uabd	v24.8h, v3.8h, v5.8h
   12164:      	<unknown>
   12168:      	<unknown>
   1216c:      	<unknown>
   12170:      	adr	x1, 0x52915
   12174:      	<unknown>
   12178:      	ldtrh	w8, [x1, #0x52]
   1217c:      	<unknown>
   12180:      	<unknown>
   12184:      	<unknown>
   12188:      	stnp	w29, w8, [x1, #-0xc0]
   1218c:      	<unknown>
   12190:      	<unknown>
   12194:      	<unknown>
   12198:      	stnp	w6, w9, [x17, #-0x100]
   1219c:      	fnmls	z5.h, p6/m, z2.h, z20.h
   121a0:      	<unknown>
   121a4:      	<unknown>
   121a8:      	fnmls	z19.h, p2/m, z10.h, z26.h
   121ac:      	<unknown>
   121b0:      	<unknown>
   121b4:      	<unknown>
   121b8:      	<unknown>
   121bc:      	<unknown>
   121c0:      	fnmls	z5.h, p6/m, z3.h, z20.h
   121c4:      	<unknown>
   121c8:      	<unknown>
   121cc:      	<unknown>
   121d0:      	uqshl	v0.2d, v1.2d, #0x2f
   121d4:      	<unknown>
   121d8:      	<unknown>
   121dc:      	fmls	z15.h, p0/m, z3.h, z2.h
   121e0:      	adr	x0, 0xdd027
   121e4:      	fnmls	z15.h, p4/m, z19.h, z20.h
   121e8:      	<unknown>
   121ec:      	<unknown>
   121f0:      	<unknown>
   121f4:      	<unknown>
   121f8:      	<unknown>
   121fc:      	<unknown>
   12200:      	<unknown>
   12204:      	<unknown>
   12208:      	<unknown>
   1220c:      	umlal2	v8.4s, v1.8h, v6.h[7]
   12210:      	orn	w9, w3, w0, lsl #25
   12214:      	stp	w9, w8, [x1, #-0x80]
   12218:      	<unknown>
   1221c:      	<unknown>
   12220:      	<unknown>
   12224:      	stnp	w1, w15, [x9, #-0x100]
   12228:      	ldpsw	x8, x29, [x17, #-0x88]
   1222c:      	stp	w4, w8, [x3, #-0xb0]
   12230:      	<unknown>
   12234:      	<unknown>
   12238:      	str	b17, [x1, #0x848]
   1223c:      	<unknown>
   12240:      	<unknown>
   12244:      	adr	x10, 0x52769
   12248:      	<unknown>
   1224c:      	<unknown>
   12250:      	stnp	w1, w15, [x9, #-0x100]
   12254:      	ldpsw	x8, x29, [x17, #-0x88]
   12258:      	stp	w4, w8, [x3, #-0xb0]
   1225c:      	<unknown>
   12260:      	<unknown>
   12264:      	ldp	w14, w21, [x2, #0x70]
   12268:      	<unknown>
   1226c:      	<unknown>
   12270:      	ldpsw	x0, x10, [x1, #-0x68]
   12274:      	<unknown>
   12278:      	<unknown>
   1227c:      	<unknown>
   12280:      	<unknown>
   12284:      	stp	s17, s10, [x9, #-0x100]
   12288:      	stp	w0, w12, [x9, #-0xb8]
   1228c:      	<unknown>
   12290:      	<unknown>
   12294:      	<unknown>
   12298:      	<unknown>
   1229c:      	<unknown>
   122a0:      	<unknown>
   122a4:      	<unknown>
   122a8:      	<unknown>
   122ac:      	stp	s18, s10, [x11, #-0x100]
   122b0:      	stp	w0, w12, [x9, #-0xb8]
   122b4:      	<unknown>
   122b8:      	udf	#0x30
   122bc:      	udf	#0x0
   122c0:      	udf	#0xdad8
   122c4:      	udf	#0x0
   122c8:      	udf	#0xdae0
   122cc:      	udf	#0x0
   122d0:      	udf	#0xdae8
   122d4:      	udf	#0x0
   122d8:      	udf	#0xdaf0
   122dc:      	udf	#0x0
   122e0:      	udf	#0xdaf8
   122e4:      	udf	#0x0
   122e8:      	udf	#0xdb00
   122ec:      	udf	#0x0
   122f0:      	udf	#0xdb08
   122f4:      	udf	#0x0
   122f8:      	udf	#0xdb10
   122fc:      	udf	#0x0
   12300:      	udf	#0xdb18
   12304:      	udf	#0x0
   12308:      	udf	#0xdb20
   1230c:      	udf	#0x0
   12310:      	udf	#0xdb28
   12314:      	udf	#0x0
   12318:      	udf	#0xda78
   1231c:      	udf	#0x0
   12320:      	udf	#0xda78
   12324:      	udf	#0x0
   12328:      	udf	#0xda78
   1232c:      	udf	#0x0
   12330:      	udf	#0xda78
   12334:      	udf	#0x0
   12338:      	<unknown>
   1233c:      	ldpsw	x18, x25, [x11, #-0xc8]
   12340:      	<unknown>
   12344:      	<unknown>
   12348:      	<unknown>
   1234c:      	<unknown>
   12350:      	<unknown>
   12354:      	<unknown>
   12358:      	umlsl2	v22.4s, v11.8h, v3.h[7]
   1235c:      	umlal2	v18.4s, v3.8h, v13.h[0]
   12360:      	<unknown>
   12364:      	<unknown>
   12368:      	fmls	z20.h, p0/m, z3.h, z16.h
   1236c:      	<unknown>
   12370:      	fmls	z13.h, p0/m, z3.h, z18.h
   12374:      	<unknown>
   12378:      	<unknown>
   1237c:      	<unknown>
   12380:      	uqshl	v1.2d, v3.2d, #0x29
   12384:      	<unknown>
   12388:      	umin	v21.8h, v18.8h, v11.8h
   1238c:      	<unknown>
   12390:      	<unknown>
   12394:      	fnmls	z7.h, p1/m, z10.h, z14.h
   12398:      	<unknown>
   1239c:      	fnmls	z20.h, p2/m, z10.h, z13.h
   123a0:      	fmls	z18.h, p0/m, z3.h, z18.h
   123a4:      	<unknown>
   123a8:      	<unknown>
   123ac:      	bic	w24, w19, w0, lsl #11
   123b0:      	<unknown>
   123b4:      	adr	x20, 0xed063
   123b8:      	umlal2	v20.4s, v3.8h, v4.h[3]
   123bc:      	<unknown>
   123c0:      	<unknown>
   123c4:      	fminv	h13, p0, z2.h
   123c8:      	ldpsw	x14, x25, [x11, #-0x70]
   123cc:      	ldpsw	x3, x8, [x3, #0xa0]
   123d0:      	<unknown>
   123d4:      	ldpsw	x18, x25, [x11, #-0xc8]
   123d8:      	<unknown>
   123dc:      	<unknown>
   123e0:      	<unknown>
   123e4:      	<unknown>
   123e8:      	<unknown>
   123ec:      	b.ls	0x53058
   123f0:      	<unknown>
   123f4:      	<unknown>
   123f8:      	ldpsw	x5, x27, [x19, #-0x68]
   123fc:      	stgp	x15, x27, [x19, #-0x400]
   12400:      	umlal2	v19.4s, v3.8h, v14.h[2]
   12404:      	ldp	d20, d8, [x3, #-0x170]
   12408:      	ldp	d16, d27, [x3, #-0x1b0]
   1240c:      	fnmls	z5.h, p3/m, z19.h, z20.h
   12410:      	<unknown>
   12414:      	<unknown>
   12418:      	cbz	w3, 0x7f124
   1241c:      	<unknown>
   12420:      	fnmls	z20.h, p2/m, z10.h, z13.h
   12424:      	<unknown>
   12428:      	<unknown>
   1242c:      	<unknown>
   12430:      	<unknown>
   12434:      	eor	w20, w27, #0xfffffff
   12438:      	<unknown>
   1243c:      	ldrh	w15, [x18, #0x1636]
   12440:      	<unknown>
   12444:      	fnmls	z9.h, p4/m, z27.h, z20.h
   12448:      	<unknown>
   1244c:      	<unknown>
   12450:      	<unknown>
   12454:      	<unknown>
   12458:      	<unknown>
   1245c:      	<unknown>
   12460:      	eor	w20, w27, #0xfffffff
   12464:      	<unknown>
   12468:      	ldrh	w15, [x18, #0x1636]
   1246c:      	<unknown>
   12470:      	fnmls	z9.h, p4/m, z27.h, z20.h
   12474:      	<unknown>
   12478:      	<unknown>
   1247c:      	<unknown>
   12480:      	fnmls	z1.h, p5/m, z2.h, z20.h
   12484:      	<unknown>
   12488:      	<unknown>
   1248c:      	fnmls	z18.h, p2/m, z11.h, z20.h
   12490:      	<unknown>
   12494:      	<unknown>
   12498:      	fnmls	z7.h, p1/m, z10.h, z14.h
   1249c:      	<unknown>
   124a0:      	fnmls	z20.h, p2/m, z10.h, z13.h
   124a4:      	fmls	z18.h, p0/m, z3.h, z18.h
   124a8:      	<unknown>
   124ac:      	uabdl	v5.4s, v19.4h, v19.4h
   124b0:      	<unknown>
   124b4:      	<unknown>
   124b8:      	ushl	v0.8h, v25.8h, v5.8h
   124bc:      	<unknown>
   124c0:      	ldp	d0, d21, [x1, #-0x170]
   124c4:      	<unknown>
   124c8:      	uabd	v24.8h, v3.8h, v5.8h
   124cc:      	<unknown>
   124d0:      	<unknown>
   124d4:      	<unknown>
   124d8:      	ldnp	d9, d27, [x11, #-0x100]
   124dc:      	umin	v5.8h, v11.8h, v5.8h
   124e0:      	<unknown>
   124e4:      	udf	#0x200a
		...
