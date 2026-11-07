
UsbConfigDxe.efi:	file format coff-arm64

Disassembly of section .text:

0000000000001000 <.text>:
    1000:      	stp	x20, x19, [sp, #-0x20]!
    1004:      	stp	x29, x30, [sp, #0x10]
    1008:      	add	x29, sp, #0x10
    100c:      	mov	x20, x0
    1010:      	bl	0x139c <.text+0x39c>
    1014:      	mov	x19, x0
    1018:      	tbnz	x19, #0x3f, 0x102c <.text+0x2c>
    101c:      	adrp	x8, 0xc000
    1020:      	mov	x0, x20
    1024:      	ldr	x1, [x8, #0x518]
    1028:      	bl	0x134c <.text+0x34c>
    102c:      	ldp	x29, x30, [sp, #0x10]
    1030:      	mov	x0, x19
    1034:      	ldp	x20, x19, [sp], #0x20
    1038:      	ret
    103c:      	stp	x22, x21, [sp, #-0x30]!
    1040:      	stp	x20, x19, [sp, #0x10]
    1044:      	stp	x29, x30, [sp, #0x20]
    1048:      	add	x29, sp, #0x20
    104c:      	sub	sp, sp, #0x10
    1050:      	adrp	x8, 0x7000 <.text+0x6000>
    1054:      	mov	x19, x1
    1058:      	mov	x20, x0
    105c:      	ldr	w8, [x8, #0xe3c]
    1060:      	cbz	w8, 0x107c <.text+0x7c>
    1064:      	ldr	w9, [x19, #0x8]
    1068:      	cmp	w9, w8
    106c:      	b.hs	0x107c <.text+0x7c>
    1070:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    1074:      	movk	x21, #0x19
    1078:      	b	0x1118 <.text+0x118>
    107c:      	mov	x0, x20
    1080:      	mov	x1, x19
    1084:      	bl	0x117c <.text+0x17c>
    1088:      	adrp	x9, 0x7000 <.text+0x6000>
    108c:      	ldrb	w11, [x9, #0xe40]
    1090:      	cbz	w11, 0x10f8 <.text+0xf8>
    1094:      	adrp	x10, 0xc000
    1098:      	adrp	x1, 0xc000
    109c:      	add	x1, x1, #0xf0
    10a0:      	ldr	x11, [x10, #0x520]
    10a4:      	add	x2, sp, #0x8
    10a8:      	mov	x0, x20
    10ac:      	ldr	x9, [x11, #0x98]
    10b0:      	blr	x9
    10b4:      	mov	x8, x0
    10b8:      	tbz	x8, #0x3f, 0x10e8 <.text+0xe8>
    10bc:      	adrp	x1, 0x7000 <.text+0x6000>
    10c0:      	add	x1, x1, #0xdc8
    10c4:      	orr	w0, wzr, #0x80000000
    10c8:      	mov	x2, x8
    10cc:      	bl	0x18bc <.text+0x8bc>
    10d0:      	adrp	x0, 0x7000 <.text+0x6000>
    10d4:      	adrp	x2, 0x7000 <.text+0x6000>
    10d8:      	add	x0, x0, #0xde9
    10dc:      	add	x2, x2, #0xdfc
    10e0:      	orr	w1, wzr, #0x7e
    10e4:      	bl	0x1c48 <.text+0xc48>
    10e8:      	ldr	x12, [sp, #0x8]
    10ec:      	adrp	x10, 0x1000 <.text>
    10f0:      	add	x10, x10, #0x0
    10f4:      	str	x10, [x12, #0x58]
    10f8:      	mov	x0, x20
    10fc:      	mov	x1, x19
    1100:      	bl	0x1398 <.text+0x398>
    1104:      	mov	x21, x0
    1108:      	tbz	x21, #0x3f, 0x1118 <.text+0x118>
    110c:      	mov	x0, x20
    1110:      	mov	x1, x19
    1114:      	bl	0x134c <.text+0x34c>
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
    1168:      	bl	0x2780 <.text+0x1780>
    116c:      	adrp	x8, 0xc000
    1170:      	str	x0, [x8]
    1174:      	ldp	x29, x30, [sp], #0x10
    1178:      	ret
    117c:      	stp	x20, x19, [sp, #-0x20]!
    1180:      	stp	x29, x30, [sp, #0x10]
    1184:      	add	x29, sp, #0x10
    1188:      	mov	x19, x1
    118c:      	mov	x20, x0
    1190:      	bl	0x2098 <.text+0x1098>
    1194:      	mov	x8, x0
    1198:      	tbz	x8, #0x3f, 0x11c8 <.text+0x1c8>
    119c:      	adrp	x1, 0x7000 <.text+0x6000>
    11a0:      	add	x1, x1, #0xdc8
    11a4:      	orr	w0, wzr, #0x80000000
    11a8:      	mov	x2, x8
    11ac:      	bl	0x18bc <.text+0x8bc>
    11b0:      	adrp	x0, 0x7000 <.text+0x6000>
    11b4:      	adrp	x2, 0x7000 <.text+0x6000>
    11b8:      	add	x0, x0, #0xe1d
    11bc:      	mov	w1, #0x13b              // =315
    11c0:      	add	x2, x2, #0xdfc
    11c4:      	bl	0x1c48 <.text+0xc48>
    11c8:      	mov	x0, x20
    11cc:      	mov	x1, x19
    11d0:      	bl	0x20d8 <.text+0x10d8>
    11d4:      	mov	x9, x0
    11d8:      	tbz	x9, #0x3f, 0x1208 <.text+0x208>
    11dc:      	adrp	x1, 0x7000 <.text+0x6000>
    11e0:      	add	x1, x1, #0xdc8
    11e4:      	orr	w0, wzr, #0x80000000
    11e8:      	mov	x2, x9
    11ec:      	bl	0x18bc <.text+0x8bc>
    11f0:      	adrp	x0, 0x7000 <.text+0x6000>
    11f4:      	adrp	x2, 0x7000 <.text+0x6000>
    11f8:      	add	x0, x0, #0xe1d
    11fc:      	mov	w1, #0x13e              // =318
    1200:      	add	x2, x2, #0xdfc
    1204:      	bl	0x1c48 <.text+0xc48>
    1208:      	mov	x0, x20
    120c:      	mov	x1, x19
    1210:      	bl	0x2168 <.text+0x1168>
    1214:      	mov	x10, x0
    1218:      	tbz	x10, #0x3f, 0x1248 <.text+0x248>
    121c:      	adrp	x1, 0x7000 <.text+0x6000>
    1220:      	add	x1, x1, #0xdc8
    1224:      	orr	w0, wzr, #0x80000000
    1228:      	mov	x2, x10
    122c:      	bl	0x18bc <.text+0x8bc>
    1230:      	adrp	x0, 0x7000 <.text+0x6000>
    1234:      	adrp	x2, 0x7000 <.text+0x6000>
    1238:      	add	x0, x0, #0xe1d
    123c:      	mov	w1, #0x141              // =321
    1240:      	add	x2, x2, #0xdfc
    1244:      	bl	0x1c48 <.text+0xc48>
    1248:      	mov	x0, x20
    124c:      	mov	x1, x19
    1250:      	bl	0x224c <.text+0x124c>
    1254:      	mov	x11, x0
    1258:      	tbz	x11, #0x3f, 0x1288 <.text+0x288>
    125c:      	adrp	x1, 0x7000 <.text+0x6000>
    1260:      	add	x1, x1, #0xdc8
    1264:      	orr	w0, wzr, #0x80000000
    1268:      	mov	x2, x11
    126c:      	bl	0x18bc <.text+0x8bc>
    1270:      	adrp	x0, 0x7000 <.text+0x6000>
    1274:      	adrp	x2, 0x7000 <.text+0x6000>
    1278:      	add	x0, x0, #0xe1d
    127c:      	mov	w1, #0x144              // =324
    1280:      	add	x2, x2, #0xdfc
    1284:      	bl	0x1c48 <.text+0xc48>
    1288:      	mov	x0, x20
    128c:      	mov	x1, x19
    1290:      	bl	0x2428 <.text+0x1428>
    1294:      	mov	x12, x0
    1298:      	tbz	x12, #0x3f, 0x12c8 <.text+0x2c8>
    129c:      	adrp	x1, 0x7000 <.text+0x6000>
    12a0:      	add	x1, x1, #0xdc8
    12a4:      	orr	w0, wzr, #0x80000000
    12a8:      	mov	x2, x12
    12ac:      	bl	0x18bc <.text+0x8bc>
    12b0:      	adrp	x0, 0x7000 <.text+0x6000>
    12b4:      	adrp	x2, 0x7000 <.text+0x6000>
    12b8:      	add	x0, x0, #0xe1d
    12bc:      	mov	w1, #0x147              // =327
    12c0:      	add	x2, x2, #0xdfc
    12c4:      	bl	0x1c48 <.text+0xc48>
    12c8:      	bl	0x25d4 <.text+0x15d4>
    12cc:      	mov	x13, x0
    12d0:      	tbz	x13, #0x3f, 0x1300 <.text+0x300>
    12d4:      	adrp	x1, 0x7000 <.text+0x6000>
    12d8:      	add	x1, x1, #0xdc8
    12dc:      	orr	w0, wzr, #0x80000000
    12e0:      	mov	x2, x13
    12e4:      	bl	0x18bc <.text+0x8bc>
    12e8:      	adrp	x0, 0x7000 <.text+0x6000>
    12ec:      	adrp	x2, 0x7000 <.text+0x6000>
    12f0:      	add	x0, x0, #0xe1d
    12f4:      	mov	w1, #0x14a              // =330
    12f8:      	add	x2, x2, #0xdfc
    12fc:      	bl	0x1c48 <.text+0xc48>
    1300:      	bl	0x26c0 <.text+0x16c0>
    1304:      	mov	x14, x0
    1308:      	tbnz	x14, #0x3f, 0x1318 <.text+0x318>
    130c:      	ldp	x29, x30, [sp, #0x10]
    1310:      	ldp	x20, x19, [sp], #0x20
    1314:      	ret
    1318:      	adrp	x1, 0x7000 <.text+0x6000>
    131c:      	add	x1, x1, #0xdc8
    1320:      	orr	w0, wzr, #0x80000000
    1324:      	mov	x2, x14
    1328:      	bl	0x18bc <.text+0x8bc>
    132c:      	ldp	x29, x30, [sp, #0x10]
    1330:      	adrp	x0, 0x7000 <.text+0x6000>
    1334:      	adrp	x2, 0x7000 <.text+0x6000>
    1338:      	add	x0, x0, #0xe1d
    133c:      	mov	w1, #0x14d              // =333
    1340:      	add	x2, x2, #0xdfc
    1344:      	ldp	x20, x19, [sp], #0x20
    1348:      	b	0x1c48 <.text+0xc48>
    134c:      	stp	x29, x30, [sp, #-0x10]!
    1350:      	mov	x29, sp
    1354:      	bl	0x25b4 <.text+0x15b4>
    1358:      	mov	x8, x0
    135c:      	tbnz	x8, #0x3f, 0x1368 <.text+0x368>
    1360:      	ldp	x29, x30, [sp], #0x10
    1364:      	ret
    1368:      	adrp	x1, 0x7000 <.text+0x6000>
    136c:      	add	x1, x1, #0xdc8
    1370:      	orr	w0, wzr, #0x80000000
    1374:      	mov	x2, x8
    1378:      	bl	0x18bc <.text+0x8bc>
    137c:      	adrp	x0, 0x7000 <.text+0x6000>
    1380:      	adrp	x2, 0x7000 <.text+0x6000>
    1384:      	add	x0, x0, #0xe1d
    1388:      	mov	w1, #0x164              // =356
    138c:      	add	x2, x2, #0xdfc
    1390:      	ldp	x29, x30, [sp], #0x10
    1394:      	b	0x1c48 <.text+0xc48>
    1398:      	b	0x16dc <.text+0x6dc>
    139c:      	mov	x0, xzr
    13a0:      	ret
    13a4:      	mov	w0, w1
    13a8:      	mov	x1, x2
    13ac:      	b	0x28b8 <.text+0x18b8>
    13b0:      	mov	w0, w1
    13b4:      	mov	w1, w2
    13b8:      	b	0x29c4 <.text+0x19c4>
    13bc:      	mov	w0, w1
    13c0:      	mov	w1, w2
    13c4:      	b	0x2ba4 <.text+0x1ba4>
    13c8:      	mov	x0, x1
    13cc:      	b	0x2df8 <.text+0x1df8>
    13d0:      	mov	x0, x1
    13d4:      	b	0x2e00 <.text+0x1e00>
    13d8:      	stp	x20, x19, [sp, #-0x20]!
    13dc:      	stp	x29, x30, [sp, #0x10]
    13e0:      	add	x29, sp, #0x10
    13e4:      	mov	w0, w1
    13e8:      	mov	x1, x2
    13ec:      	bl	0x3bd4 <.text+0x2bd4>
    13f0:      	mov	x19, x0
    13f4:      	tbz	x19, #0x3f, 0x1414 <.text+0x414>
    13f8:      	adrp	x1, 0x7000 <.text+0x6000>
    13fc:      	adrp	x2, 0x7000 <.text+0x6000>
    1400:      	add	x1, x1, #0xe41
    1404:      	add	x2, x2, #0xe78
    1408:      	orr	w0, wzr, #0x80000000
    140c:      	mov	x3, x19
    1410:      	bl	0x18bc <.text+0x8bc>
    1414:      	ldp	x29, x30, [sp, #0x10]
    1418:      	mov	x0, x19
    141c:      	ldp	x20, x19, [sp], #0x20
    1420:      	ret
    1424:      	mov	w0, w1
    1428:      	mov	w1, w2
    142c:      	mov	x2, x3
    1430:      	b	0x2e48 <.text+0x1e48>
    1434:      	mov	w0, w1
    1438:      	mov	x1, x2
    143c:      	b	0x3b3c <.text+0x2b3c>
    1440:      	stp	x20, x19, [sp, #-0x20]!
    1444:      	stp	x29, x30, [sp, #0x10]
    1448:      	add	x29, sp, #0x10
    144c:      	mov	w0, w1
    1450:      	mov	w1, w2
    1454:      	bl	0x32a4 <.text+0x22a4>
    1458:      	mov	x19, x0
    145c:      	tbz	x19, #0x3f, 0x1478 <.text+0x478>
    1460:      	adrp	x1, 0x7000 <.text+0x6000>
    1464:      	adrp	x2, 0x7000 <.text+0x6000>
    1468:      	add	x1, x1, #0xe8f
    146c:      	add	x2, x2, #0xeaf
    1470:      	orr	w0, wzr, #0x80000000
    1474:      	bl	0x18bc <.text+0x8bc>
    1478:      	ldp	x29, x30, [sp, #0x10]
    147c:      	mov	x0, x19
    1480:      	ldp	x20, x19, [sp], #0x20
    1484:      	ret
    1488:      	stp	x20, x19, [sp, #-0x20]!
    148c:      	stp	x29, x30, [sp, #0x10]
    1490:      	add	x29, sp, #0x10
    1494:      	mov	w0, w1
    1498:      	mov	w1, w2
    149c:      	bl	0x384c <.text+0x284c>
    14a0:      	mov	x19, x0
    14a4:      	tbz	x19, #0x3f, 0x14c0 <.text+0x4c0>
    14a8:      	adrp	x1, 0x7000 <.text+0x6000>
    14ac:      	adrp	x2, 0x7000 <.text+0x6000>
    14b0:      	add	x1, x1, #0xe8f
    14b4:      	add	x2, x2, #0xec8
    14b8:      	orr	w0, wzr, #0x80000000
    14bc:      	bl	0x18bc <.text+0x8bc>
    14c0:      	ldp	x29, x30, [sp, #0x10]
    14c4:      	mov	x0, x19
    14c8:      	ldp	x20, x19, [sp], #0x20
    14cc:      	ret
    14d0:      	mov	w0, w1
    14d4:      	mov	w1, w2
    14d8:      	b	0x2cd0 <.text+0x1cd0>
    14dc:      	mov	w0, w1
    14e0:      	mov	w1, w2
    14e4:      	b	0x2d64 <.text+0x1d64>
    14e8:      	stp	x20, x19, [sp, #-0x20]!
    14ec:      	stp	x29, x30, [sp, #0x10]
    14f0:      	add	x29, sp, #0x10
    14f4:      	mov	w0, w1
    14f8:      	bl	0x3a3c <.text+0x2a3c>
    14fc:      	mov	x19, x0
    1500:      	tbz	x19, #0x3f, 0x1520 <.text+0x520>
    1504:      	adrp	x1, 0x7000 <.text+0x6000>
    1508:      	adrp	x2, 0x7000 <.text+0x6000>
    150c:      	add	x1, x1, #0xee0
    1510:      	add	x2, x2, #0xf0a
    1514:      	orr	w0, wzr, #0x80000000
    1518:      	mov	x3, x19
    151c:      	bl	0x18bc <.text+0x8bc>
    1520:      	ldp	x29, x30, [sp, #0x10]
    1524:      	mov	x0, x19
    1528:      	ldp	x20, x19, [sp], #0x20
    152c:      	ret
    1530:      	stp	x20, x19, [sp, #-0x20]!
    1534:      	stp	x29, x30, [sp, #0x10]
    1538:      	add	x29, sp, #0x10
    153c:      	cbz	x0, 0x1574 <.text+0x574>
    1540:      	cbz	x1, 0x1574 <.text+0x574>
    1544:      	mov	x0, x1
    1548:      	bl	0x3b44 <.text+0x2b44>
    154c:      	mov	x19, x0
    1550:      	tbz	x19, #0x3f, 0x1594 <.text+0x594>
    1554:      	adrp	x1, 0x7000 <.text+0x6000>
    1558:      	adrp	x2, 0x7000 <.text+0x6000>
    155c:      	add	x1, x1, #0xf4b
    1560:      	add	x2, x2, #0xf35
    1564:      	orr	w0, wzr, #0x80000000
    1568:      	mov	x3, x19
    156c:      	bl	0x18bc <.text+0x8bc>
    1570:      	b	0x1594 <.text+0x594>
    1574:      	adrp	x1, 0x7000 <.text+0x6000>
    1578:      	adrp	x2, 0x7000 <.text+0x6000>
    157c:      	add	x1, x1, #0xf1e
    1580:      	add	x2, x2, #0xf35
    1584:      	orr	w0, wzr, #0x80000000
    1588:      	bl	0x18bc <.text+0x8bc>
    158c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1590:      	movk	x19, #0x2
    1594:      	ldp	x29, x30, [sp, #0x10]
    1598:      	mov	x0, x19
    159c:      	ldp	x20, x19, [sp], #0x20
    15a0:      	ret
    15a4:      	stp	x20, x19, [sp, #-0x20]!
    15a8:      	stp	x29, x30, [sp, #0x10]
    15ac:      	add	x29, sp, #0x10
    15b0:      	cbz	x0, 0x15ec <.text+0x5ec>
    15b4:      	cbz	x2, 0x15ec <.text+0x5ec>
    15b8:      	mov	w0, w1
    15bc:      	mov	x1, x2
    15c0:      	bl	0x3b8c <.text+0x2b8c>
    15c4:      	mov	x19, x0
    15c8:      	tbz	x19, #0x3f, 0x160c <.text+0x60c>
    15cc:      	adrp	x1, 0x7000 <.text+0x6000>
    15d0:      	adrp	x2, 0x7000 <.text+0x6000>
    15d4:      	add	x1, x1, #0xf87
    15d8:      	add	x2, x2, #0xf6d
    15dc:      	orr	w0, wzr, #0x80000000
    15e0:      	mov	x3, x19
    15e4:      	bl	0x18bc <.text+0x8bc>
    15e8:      	b	0x160c <.text+0x60c>
    15ec:      	adrp	x1, 0x7000 <.text+0x6000>
    15f0:      	adrp	x2, 0x7000 <.text+0x6000>
    15f4:      	add	x1, x1, #0xf1e
    15f8:      	add	x2, x2, #0xf6d
    15fc:      	orr	w0, wzr, #0x80000000
    1600:      	bl	0x18bc <.text+0x8bc>
    1604:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1608:      	movk	x19, #0x2
    160c:      	ldp	x29, x30, [sp, #0x10]
    1610:      	mov	x0, x19
    1614:      	ldp	x20, x19, [sp], #0x20
    1618:      	ret
    161c:      	mov	w0, w1
    1620:      	mov	x1, x2
    1624:      	b	0x3cf4 <.text+0x2cf4>
    1628:      	mov	w0, w1
    162c:      	b	0x3e14 <.text+0x2e14>
    1630:      	stp	x20, x19, [sp, #-0x20]!
    1634:      	stp	x29, x30, [sp, #0x10]
    1638:      	add	x29, sp, #0x10
    163c:      	bl	0x3754 <.text+0x2754>
    1640:      	adrp	x19, 0xc000
    1644:      	ldr	x0, [x19, #0x4f0]
    1648:      	cbz	x0, 0x1660 <.text+0x660>
    164c:      	adrp	x8, 0xc000
    1650:      	ldr	x9, [x8, #0x520]
    1654:      	ldr	x8, [x9, #0x70]
    1658:      	blr	x8
    165c:      	str	xzr, [x19, #0x4f0]
    1660:      	adrp	x19, 0xc000
    1664:      	add	x19, x19, #0x4f0
    1668:      	ldr	x0, [x19, #0x8]
    166c:      	cbz	x0, 0x1684 <.text+0x684>
    1670:      	adrp	x10, 0xc000
    1674:      	ldr	x11, [x10, #0x520]
    1678:      	ldr	x9, [x11, #0x70]
    167c:      	blr	x9
    1680:      	str	xzr, [x19, #0x8]
    1684:      	ldp	x29, x30, [sp, #0x10]
    1688:      	ldp	x20, x19, [sp], #0x20
    168c:      	ret
    1690:      	mov	w1, wzr
    1694:      	b	0x14e8 <.text+0x4e8>
    1698:      	stp	x29, x30, [sp, #-0x10]!
    169c:      	mov	x29, sp
    16a0:      	orr	w1, wzr, #0x4
    16a4:      	mov	w0, wzr
    16a8:      	bl	0x32a4 <.text+0x22a4>
    16ac:      	mov	x8, x0
    16b0:      	tbnz	x8, #0x3f, 0x16bc <.text+0x6bc>
    16b4:      	ldp	x29, x30, [sp], #0x10
    16b8:      	ret
    16bc:      	adrp	x1, 0x7000 <.text+0x6000>
    16c0:      	adrp	x2, 0x7000 <.text+0x6000>
    16c4:      	add	x1, x1, #0xfad
    16c8:      	add	x2, x2, #0xfcf
    16cc:      	orr	w0, wzr, #0x80000000
    16d0:      	mov	x3, x8
    16d4:      	ldp	x29, x30, [sp], #0x10
    16d8:      	b	0x18bc <.text+0x8bc>
    16dc:      	stp	x22, x21, [sp, #-0x30]!
    16e0:      	stp	x20, x19, [sp, #0x10]
    16e4:      	stp	x29, x30, [sp, #0x20]
    16e8:      	add	x29, sp, #0x20
    16ec:      	adrp	x21, 0xc000
    16f0:      	ldr	x8, [x21, #0x520]
    16f4:      	stp	xzr, xzr, [sp, #-0x10]!
    16f8:      	ldr	x8, [x8, #0x140]
    16fc:      	adrp	x0, 0xc000
    1700:      	mov	x1, xzr
    1704:      	add	x0, x0, #0x140
    1708:      	add	x2, sp, #0x8
    170c:      	blr	x8
    1710:      	mov	x19, x0
    1714:      	tbnz	x19, #0x3f, 0x1830 <.text+0x830>
    1718:      	ldr	x0, [sp, #0x8]
    171c:      	adrp	x1, 0xc000
    1720:      	add	x1, x1, #0x4d0
    1724:      	ldr	x9, [x0, #0x8]
    1728:      	blr	x9
    172c:      	mov	x19, x0
    1730:      	tbnz	x19, #0x3f, 0x183c <.text+0x83c>
    1734:      	ldr	x9, [x21, #0x520]
    1738:      	adrp	x0, 0xc000
    173c:      	mov	x1, xzr
    1740:      	add	x0, x0, #0xc0
    1744:      	mov	x2, sp
    1748:      	ldr	x10, [x9, #0x140]
    174c:      	blr	x10
    1750:      	mov	x19, x0
    1754:      	tbnz	x19, #0x3f, 0x1848 <.text+0x848>
    1758:      	ldr	x0, [sp]
    175c:      	adrp	x1, 0xc000
    1760:      	add	x1, x1, #0x4e0
    1764:      	ldr	x11, [x0, #0x8]
    1768:      	blr	x11
    176c:      	mov	x19, x0
    1770:      	tbnz	x19, #0x3f, 0x1854 <.text+0x854>
    1774:      	ldr	x10, [x21, #0x520]
    1778:      	adrp	x20, 0xc000
    177c:      	adrp	x2, 0x1000 <.text>
    1780:      	adrp	x4, 0xc000
    1784:      	add	x20, x20, #0x4f0
    1788:      	ldr	x12, [x10, #0x170]
    178c:      	mov	x3, xzr
    1790:      	add	x2, x2, #0x630
    1794:      	add	x4, x4, #0x20
    1798:      	orr	w0, wzr, #0x200
    179c:      	orr	w1, wzr, #0x8
    17a0:      	mov	x5, x20
    17a4:      	blr	x12
    17a8:      	mov	x19, x0
    17ac:      	tbnz	x19, #0x3f, 0x1860 <.text+0x860>
    17b0:      	ldr	x11, [x21, #0x520]
    17b4:      	adrp	x2, 0x1000 <.text>
    17b8:      	adrp	x4, 0xc000
    17bc:      	mov	x3, xzr
    17c0:      	add	x5, x20, #0x8
    17c4:      	ldr	x13, [x11, #0x170]
    17c8:      	add	x2, x2, #0x690
    17cc:      	add	x4, x4, #0x30
    17d0:      	orr	w0, wzr, #0x200
    17d4:      	orr	w1, wzr, #0x8
    17d8:      	blr	x13
    17dc:      	mov	x19, x0
    17e0:      	tbnz	x19, #0x3f, 0x1890 <.text+0x890>
    17e4:      	bl	0x2ec8 <.text+0x1ec8>
    17e8:      	mov	x19, x0
    17ec:      	tbnz	x19, #0x3f, 0x189c <.text+0x89c>
    17f0:      	ldr	x12, [x21, #0x520]
    17f4:      	adrp	x2, 0x1000 <.text>
    17f8:      	adrp	x4, 0xc000
    17fc:      	mov	x3, xzr
    1800:      	add	x5, x20, #0x10
    1804:      	ldr	x14, [x12, #0x170]
    1808:      	add	x2, x2, #0x698
    180c:      	add	x4, x4, #0x40
    1810:      	orr	w0, wzr, #0x200
    1814:      	orr	w1, wzr, #0x8
    1818:      	blr	x14
    181c:      	mov	x19, x0
    1820:      	tbz	x19, #0x3f, 0x1878 <.text+0x878>
    1824:      	adrp	x1, 0x8000 <.text+0x7000>
    1828:      	add	x1, x1, #0x11d
    182c:      	b	0x18a4 <.text+0x8a4>
    1830:      	adrp	x1, 0x7000 <.text+0x6000>
    1834:      	add	x1, x1, #0xfea
    1838:      	b	0x1868 <.text+0x868>
    183c:      	adrp	x1, 0x8000 <.text+0x7000>
    1840:      	add	x1, x1, #0x34
    1844:      	b	0x1868 <.text+0x868>
    1848:      	adrp	x1, 0x8000 <.text+0x7000>
    184c:      	add	x1, x1, #0x54
    1850:      	b	0x1868 <.text+0x868>
    1854:      	adrp	x1, 0x8000 <.text+0x7000>
    1858:      	add	x1, x1, #0x7d
    185c:      	b	0x1868 <.text+0x868>
    1860:      	adrp	x1, 0x8000 <.text+0x7000>
    1864:      	add	x1, x1, #0x9d
    1868:      	adrp	x2, 0x8000 <.text+0x7000>
    186c:      	add	x2, x2, #0x1a
    1870:      	orr	w0, wzr, #0x80000000
    1874:      	bl	0x18bc <.text+0x8bc>
    1878:      	mov	x0, x19
    187c:      	sub	sp, x29, #0x20
    1880:      	ldp	x29, x30, [sp, #0x20]
    1884:      	ldp	x20, x19, [sp, #0x10]
    1888:      	ldp	x22, x21, [sp], #0x30
    188c:      	ret
    1890:      	adrp	x1, 0x8000 <.text+0x7000>
    1894:      	add	x1, x1, #0xd2
    1898:      	b	0x18a4 <.text+0x8a4>
    189c:      	adrp	x1, 0x8000 <.text+0x7000>
    18a0:      	add	x1, x1, #0xff
    18a4:      	adrp	x2, 0x8000 <.text+0x7000>
    18a8:      	add	x2, x2, #0x1a
    18ac:      	orr	w0, wzr, #0x80000000
    18b0:      	mov	x3, x19
    18b4:      	bl	0x18bc <.text+0x8bc>
    18b8:      	b	0x1878 <.text+0x878>
    18bc:      	stp	x28, x27, [sp, #-0x50]!
    18c0:      	stp	x24, x23, [sp, #0x10]
    18c4:      	stp	x22, x21, [sp, #0x20]
    18c8:      	stp	x20, x19, [sp, #0x30]
    18cc:      	stp	x29, x30, [sp, #0x40]
    18d0:      	add	x29, sp, #0x40
    18d4:      	sub	sp, sp, #0x1a0
    18d8:      	mov	x21, x1
    18dc:      	stp	q6, q7, [sp, #0x60]
    18e0:      	mov	x23, x0
    18e4:      	stp	q4, q5, [sp, #0x40]
    18e8:      	stp	q2, q3, [sp, #0x20]
    18ec:      	stp	q0, q1, [sp]
    18f0:      	stp	x6, x7, [sp, #0xa0]
    18f4:      	stp	x4, x5, [sp, #0x90]
    18f8:      	stp	x2, x3, [sp, #0x80]
    18fc:      	cbz	x21, 0x1bbc <.text+0xbbc>
    1900:      	bl	0x2494 <.text+0x1494>
    1904:      	mov	w10, w0
    1908:      	and	x11, x10, x23
    190c:      	cbz	x11, 0x1c10 <.text+0xc10>
    1910:      	mov	x0, x21
    1914:      	bl	0x1fc0 <.text+0xfc0>
    1918:      	add	x19, x0, #0x68
    191c:      	cmp	x19, #0xd0
    1920:      	b.hi	0x1c10 <.text+0xc10>
    1924:      	add	x8, sp, #0xd0
    1928:      	str	w23, [sp, #0xd4]
    192c:      	add	x22, x8, #0x68
    1930:      	mov	w1, #0x68               // =104
    1934:      	mov	x0, x22
    1938:      	mov	x2, x21
    193c:      	mov	x3, x1
    1940:      	orr	x20, x8, #0x4
    1944:      	add	x24, x8, #0x8
    1948:      	bl	0x1e44 <.text+0xe44>
    194c:      	mov	x10, sp
    1950:      	add	x11, sp, #0x80
    1954:      	orr	w8, wzr, #0xffffff80
    1958:      	mov	w9, #-0x30              // =-48
    195c:      	add	x6, x10, #0x80
    1960:      	add	x7, x11, #0x30
    1964:      	add	x10, x29, #0x10
    1968:      	stp	w9, w8, [sp, #0xc8]
    196c:      	orr	w8, wzr, #0x1
    1970:      	stp	x7, x6, [sp, #0xb8]
    1974:      	mov	x9, #0x680100000000     // =114353504256000
    1978:      	str	x10, [sp, #0xb0]
    197c:      	adrp	x10, 0x8000 <.text+0x7000>
    1980:      	add	x10, x10, #0x148
    1984:      	b	0x198c <.text+0x98c>
    1988:      	add	x21, x21, #0x1
    198c:      	ldrb	w11, [x21]
    1990:      	cmp	w11, #0x25
    1994:      	b.eq	0x19a0 <.text+0x9a0>
    1998:      	cbnz	w11, 0x1988 <.text+0x988>
    199c:      	b	0x1bd8 <.text+0xbd8>
    19a0:      	mov	w14, wzr
    19a4:      	b	0x19b4 <.text+0x9b4>
    19a8:      	ldr	x16, [x17]
    19ac:      	mov	w14, w11
    19b0:      	str	x16, [x24], #0x8
    19b4:      	mov	x12, x21
    19b8:      	ldrb	w13, [x21, #0x1]!
    19bc:      	mov	w11, w14
    19c0:      	cmp	w13, #0x2e
    19c4:      	b.hi	0x19d8 <.text+0x9d8>
    19c8:      	lsl	x14, x8, x13
    19cc:      	and	x15, x14, x9
    19d0:      	mov	w14, w11
    19d4:      	cbnz	x15, 0x19b4 <.text+0x9b4>
    19d8:      	sub	w14, w13, #0x30
    19dc:      	cmp	w14, #0xa
    19e0:      	mov	w14, w11
    19e4:      	b.lo	0x19b4 <.text+0x9b4>
    19e8:      	cmp	w13, #0x4b
    19ec:      	b.gt	0x1a20 <.text+0xa20>
    19f0:      	cmp	w13, #0x2a
    19f4:      	b.ne	0x1a44 <.text+0xa44>
    19f8:      	ldrsw	x14, [sp, #0xc8]
    19fc:      	tbz	w14, #0x1f, 0x1a10 <.text+0xa10>
    1a00:      	add	w12, w14, #0x8
    1a04:      	cmp	w12, #0x0
    1a08:      	str	w12, [sp, #0xc8]
    1a0c:      	b.le	0x1a38 <.text+0xa38>
    1a10:      	ldr	x17, [sp, #0xb0]
    1a14:      	add	x13, x17, #0x8
    1a18:      	str	x13, [sp, #0xb0]
    1a1c:      	b	0x19a8 <.text+0x9a8>
    1a20:      	orr	w14, wzr, #0x1
    1a24:      	cmp	w13, #0x4c
    1a28:      	b.eq	0x19b4 <.text+0x9b4>
    1a2c:      	cmp	w13, #0x6c
    1a30:      	b.eq	0x19b4 <.text+0x9b4>
    1a34:      	b	0x1a50 <.text+0xa50>
    1a38:      	ldr	x13, [sp, #0xb8]
    1a3c:      	add	x17, x13, x14
    1a40:      	b	0x19a8 <.text+0x9a8>
    1a44:      	cbnz	w13, 0x1a50 <.text+0xa50>
    1a48:      	mov	x21, x12
    1a4c:      	b	0x1a54 <.text+0xa54>
    1a50:      	add	x21, x12, #0x1
    1a54:      	ldrb	w13, [x21]
    1a58:      	sub	w5, w13, #0x61
    1a5c:      	cmp	w5, #0x17
    1a60:      	b.hi	0x1a9c <.text+0xa9c>
    1a64:      	ldr	x17, [x10, x5, lsl #3]
    1a68:      	br	x17
    1a6c:      	ldrsw	x15, [sp, #0xc8]
    1a70:      	tbz	w15, #0x1f, 0x1a84 <.text+0xa84>
    1a74:      	add	w1, w15, #0x8
    1a78:      	cmp	w1, #0x0
    1a7c:      	str	w1, [sp, #0xc8]
    1a80:      	b.le	0x1ba4 <.text+0xba4>
    1a84:      	ldr	x3, [sp, #0xb0]
    1a88:      	add	x15, x3, #0x8
    1a8c:      	str	x15, [sp, #0xb0]
    1a90:      	ldr	x2, [x3]
    1a94:      	str	x2, [x24], #0x8
    1a98:      	b	0x1b74 <.text+0xb74>
    1a9c:      	cmp	w13, #0x53
    1aa0:      	b.eq	0x1aec <.text+0xaec>
    1aa4:      	cmp	w13, #0x58
    1aa8:      	b.ne	0x1b74 <.text+0xb74>
    1aac:      	ldrsw	x12, [sp, #0xc8]
    1ab0:      	and	w15, w11, #0xff
    1ab4:      	cbnz	w15, 0x1b1c <.text+0xb1c>
    1ab8:      	cmp	w13, #0x70
    1abc:      	b.eq	0x1b1c <.text+0xb1c>
    1ac0:      	tbz	w12, #0x1f, 0x1ad4 <.text+0xad4>
    1ac4:      	add	w17, w12, #0x8
    1ac8:      	cmp	w17, #0x0
    1acc:      	str	w17, [sp, #0xc8]
    1ad0:      	b.le	0x1b8c <.text+0xb8c>
    1ad4:      	ldr	x1, [sp, #0xb0]
    1ad8:      	add	x14, x1, #0x8
    1adc:      	str	x14, [sp, #0xb0]
    1ae0:      	ldr	x5, [x1]
    1ae4:      	str	w5, [x24], #0x8
    1ae8:      	b	0x1b74 <.text+0xb74>
    1aec:      	ldrsw	x11, [sp, #0xc8]
    1af0:      	tbz	w11, #0x1f, 0x1b04 <.text+0xb04>
    1af4:      	add	w0, w11, #0x8
    1af8:      	cmp	w0, #0x0
    1afc:      	str	w0, [sp, #0xc8]
    1b00:      	b.le	0x1b80 <.text+0xb80>
    1b04:      	ldr	x2, [sp, #0xb0]
    1b08:      	add	x11, x2, #0x8
    1b0c:      	str	x11, [sp, #0xb0]
    1b10:      	ldr	x0, [x2]
    1b14:      	str	x0, [x24], #0x8
    1b18:      	b	0x1b74 <.text+0xb74>
    1b1c:      	tbz	w12, #0x1f, 0x1b30 <.text+0xb30>
    1b20:      	add	w16, w12, #0x8
    1b24:      	cmp	w16, #0x0
    1b28:      	str	w16, [sp, #0xc8]
    1b2c:      	b.le	0x1b98 <.text+0xb98>
    1b30:      	ldr	x0, [sp, #0xb0]
    1b34:      	add	x12, x0, #0x8
    1b38:      	str	x12, [sp, #0xb0]
    1b3c:      	ldr	x7, [x0]
    1b40:      	str	x7, [x24], #0x8
    1b44:      	b	0x1b74 <.text+0xb74>
    1b48:      	ldrsw	x16, [sp, #0xc8]
    1b4c:      	tbz	w16, #0x1f, 0x1b60 <.text+0xb60>
    1b50:      	add	w2, w16, #0x8
    1b54:      	cmp	w2, #0x0
    1b58:      	str	w2, [sp, #0xc8]
    1b5c:      	b.le	0x1bb0 <.text+0xbb0>
    1b60:      	ldr	x4, [sp, #0xb0]
    1b64:      	add	x16, x4, #0x8
    1b68:      	str	x16, [sp, #0xb0]
    1b6c:      	ldr	x11, [x4]
    1b70:      	str	x11, [x24], #0x8
    1b74:      	cmp	x24, x22
    1b78:      	b.ls	0x1988 <.text+0x988>
    1b7c:      	b	0x1c2c <.text+0xc2c>
    1b80:      	ldr	x3, [sp, #0xb8]
    1b84:      	add	x2, x3, x11
    1b88:      	b	0x1b10 <.text+0xb10>
    1b8c:      	ldr	x6, [sp, #0xb8]
    1b90:      	add	x1, x6, x12
    1b94:      	b	0x1ae0 <.text+0xae0>
    1b98:      	ldr	x23, [sp, #0xb8]
    1b9c:      	add	x0, x23, x12
    1ba0:      	b	0x1b3c <.text+0xb3c>
    1ba4:      	ldr	x1, [sp, #0xb8]
    1ba8:      	add	x3, x1, x15
    1bac:      	b	0x1a90 <.text+0xa90>
    1bb0:      	ldr	x4, [sp, #0xb8]
    1bb4:      	add	x4, x4, x16
    1bb8:      	b	0x1b6c <.text+0xb6c>
    1bbc:      	adrp	x0, 0x8000 <.text+0x7000>
    1bc0:      	adrp	x2, 0x8000 <.text+0x7000>
    1bc4:      	add	x0, x0, #0x208
    1bc8:      	mov	w1, #0x44               // =68
    1bcc:      	add	x2, x2, #0x213
    1bd0:      	bl	0x1c48 <.text+0xc48>
    1bd4:      	b	0x1bd4 <.text+0xbd4>
    1bd8:      	bl	0x65b8 <.text+0x55b8>
    1bdc:      	bl	0x65c8 <.text+0x55c8>
    1be0:      	bl	0x65d8 <.text+0x55d8>
    1be4:      	and	w8, w0, #0xff
    1be8:      	cbz	w8, 0x1c10 <.text+0xc10>
    1bec:      	adrp	x4, 0xc000
    1bf0:      	mov	w2, wzr
    1bf4:      	mov	x3, xzr
    1bf8:      	mov	w1, #0x3050000          // =50659328
    1bfc:      	add	x4, x4, #0x70
    1c00:      	orr	w0, wzr, #0x3
    1c04:      	mov	x5, x20
    1c08:      	mov	x6, x19
    1c0c:      	bl	0x65e8 <.text+0x55e8>
    1c10:      	sub	sp, x29, #0x40
    1c14:      	ldp	x29, x30, [sp, #0x40]
    1c18:      	ldp	x20, x19, [sp, #0x30]
    1c1c:      	ldp	x22, x21, [sp, #0x20]
    1c20:      	ldp	x24, x23, [sp, #0x10]
    1c24:      	ldp	x28, x27, [sp], #0x50
    1c28:      	ret
    1c2c:      	adrp	x0, 0x8000 <.text+0x7000>
    1c30:      	adrp	x2, 0x8000 <.text+0x7000>
    1c34:      	add	x0, x0, #0x208
    1c38:      	mov	w1, #0xce               // =206
    1c3c:      	add	x2, x2, #0x22a
    1c40:      	bl	0x1c48 <.text+0xc48>
    1c44:      	b	0x1c44 <.text+0xc44>
    1c48:      	stp	x28, x27, [sp, #-0x60]!
    1c4c:      	stp	x26, x25, [sp, #0x10]
    1c50:      	stp	x24, x23, [sp, #0x20]
    1c54:      	stp	x22, x21, [sp, #0x30]
    1c58:      	stp	x20, x19, [sp, #0x40]
    1c5c:      	stp	x29, x30, [sp, #0x50]
    1c60:      	add	x29, sp, #0x50
    1c64:      	sub	sp, sp, #0xd0
    1c68:      	adrp	x28, 0xc000
    1c6c:      	mov	x22, x0
    1c70:      	mov	x20, x2
    1c74:      	ldr	x8, [x28, #0x18]
    1c78:      	mov	x24, x1
    1c7c:      	mov	x0, x8
    1c80:      	bl	0x1fc0 <.text+0xfc0>
    1c84:      	mov	x26, x0
    1c88:      	mov	x0, x22
    1c8c:      	bl	0x1fc0 <.text+0xfc0>
    1c90:      	mov	x19, x0
    1c94:      	mov	x0, x20
    1c98:      	bl	0x1fc0 <.text+0xfc0>
    1c9c:      	mov	x21, x0
    1ca0:      	add	x9, x26, x19
    1ca4:      	add	x9, x9, x21
    1ca8:      	add	x8, x9, #0x2a
    1cac:      	cmp	x8, #0xc9
    1cb0:      	b.lo	0x1cf4 <.text+0xcf4>
    1cb4:      	add	x8, x19, #0x28
    1cb8:      	add	x10, x8, x21
    1cbc:      	cmp	x10, #0xc9
    1cc0:      	b.lo	0x1ce0 <.text+0xce0>
    1cc4:      	mov	w12, #0xa0              // =160
    1cc8:      	cmp	x8, #0xc8
    1ccc:      	mov	w14, #0x9f              // =159
    1cd0:      	sub	x15, x12, x19
    1cd4:      	orr	w16, wzr, #0x1
    1cd8:      	csel	x19, x19, x14, lo
    1cdc:      	csel	x21, x15, x16, lo
    1ce0:      	add	x23, sp, #0x8
    1ce4:      	str	w24, [sp, #0x1c]
    1ce8:      	mov	x27, xzr
    1cec:      	add	x25, x23, #0x28
    1cf0:      	b	0x1d4c <.text+0xd4c>
    1cf4:      	add	x23, sp, #0x8
    1cf8:      	str	w24, [sp, #0x1c]
    1cfc:      	add	x27, x26, #0x2
    1d00:      	add	x25, x23, #0x28
    1d04:      	cmn	x26, #0x2
    1d08:      	b.eq	0x1d4c <.text+0xd4c>
    1d0c:      	adrp	x1, 0x8000 <.text+0x7000>
    1d10:      	add	x1, x1, #0x252
    1d14:      	orr	w2, wzr, #0x1
    1d18:      	mov	x0, x25
    1d1c:      	add	x23, sp, #0x8
    1d20:      	bl	0x68b4 <.text+0x58b4>
    1d24:      	ldr	x1, [x28, #0x18]
    1d28:      	add	x0, x25, #0x1
    1d2c:      	sub	x2, x26, #0x1
    1d30:      	bl	0x68b4 <.text+0x58b4>
    1d34:      	add	x11, x25, x27
    1d38:      	adrp	x1, 0x8000 <.text+0x7000>
    1d3c:      	sub	x0, x11, #0x2
    1d40:      	add	x1, x1, #0x254
    1d44:      	orr	w2, wzr, #0x2
    1d48:      	bl	0x68b4 <.text+0x58b4>
    1d4c:      	add	x0, x25, x27
    1d50:      	mov	x1, x22
    1d54:      	mov	x2, x19
    1d58:      	bl	0x68b4 <.text+0x58b4>
    1d5c:      	add	x0, x0, x19
    1d60:      	mov	x1, x20
    1d64:      	mov	x2, x21
    1d68:      	sturb	wzr, [x0, #-0x1]
    1d6c:      	bl	0x68b4 <.text+0x58b4>
    1d70:      	add	x12, x21, x0
    1d74:      	sturb	wzr, [x12, #-0x1]
    1d78:      	bl	0x65b8 <.text+0x55b8>
    1d7c:      	bl	0x65c8 <.text+0x55c8>
    1d80:      	and	w8, w0, #0xff
    1d84:      	cbz	w8, 0x1dbc <.text+0xdbc>
    1d88:      	add	x2, x21, x19
    1d8c:      	add	x13, x2, x27
    1d90:      	mov	w0, #-0x70000000        // =-1879048192
    1d94:      	mov	w1, #0x3050000          // =50659328
    1d98:      	add	x6, x13, #0x28
    1d9c:      	mov	w2, wzr
    1da0:      	mov	x3, xzr
    1da4:      	mov	x4, xzr
    1da8:      	movk	w0, #0x2
    1dac:      	movk	w1, #0x7
    1db0:      	mov	x5, x23
    1db4:      	bl	0x65e8 <.text+0x55e8>
    1db8:      	b	0x1dc0 <.text+0xdc0>
    1dbc:      	bl	0x65d8 <.text+0x55d8>
    1dc0:      	adrp	x14, 0x7000 <.text+0x6000>
    1dc4:      	ldrb	w8, [x14, #0xe29]
    1dc8:      	tbnz	w8, #0x4, 0x1dd8 <.text+0xdd8>
    1dcc:      	tbz	w8, #0x5, 0x1ddc <.text+0xddc>
    1dd0:      	bl	0x1dfc <.text+0xdfc>
    1dd4:      	b	0x1ddc <.text+0xddc>
    1dd8:      	bl	0x2054 <.text+0x1054>
    1ddc:      	sub	sp, x29, #0x50
    1de0:      	ldp	x29, x30, [sp, #0x50]
    1de4:      	ldp	x20, x19, [sp, #0x40]
    1de8:      	ldp	x22, x21, [sp, #0x30]
    1dec:      	ldp	x24, x23, [sp, #0x20]
    1df0:      	ldp	x26, x25, [sp, #0x10]
    1df4:      	ldp	x28, x27, [sp], #0x60
    1df8:      	ret
    1dfc:      	sub	sp, sp, #0x10
    1e00:      	str	xzr, [sp, #0x8]
    1e04:      	ldr	x8, [sp, #0x8]
    1e08:      	cbz	x8, 0x1e04 <.text+0xe04>
    1e0c:      	add	sp, sp, #0x10
    1e10:      	ret
    1e14:      	add	x8, x2, x3
    1e18:      	cmp	x0, x2
    1e1c:      	ccmp	x0, x8, #0x2, hs
    1e20:      	b.lo	0x1e3c <.text+0xe3c>
    1e24:      	add	x10, x0, x1
    1e28:      	cmp	x2, x0
    1e2c:      	ccmp	x2, x10, #0x2, hs
    1e30:      	b.lo	0x1e3c <.text+0xe3c>
    1e34:      	mov	w0, wzr
    1e38:      	ret
    1e3c:      	orr	w0, wzr, #0x1
    1e40:      	ret
    1e44:      	stp	x22, x21, [sp, #-0x30]!
    1e48:      	stp	x20, x19, [sp, #0x10]
    1e4c:      	stp	x29, x30, [sp, #0x20]
    1e50:      	add	x29, sp, #0x20
    1e54:      	mov	x20, x2
    1e58:      	mov	x19, x0
    1e5c:      	cbz	x19, 0x1e94 <.text+0xe94>
    1e60:      	cbz	x20, 0x1eb0 <.text+0xeb0>
    1e64:      	adrp	x9, 0x7000 <.text+0x6000>
    1e68:      	ldr	w8, [x9, #0xe2c]
    1e6c:      	cbz	w8, 0x1ef0 <.text+0xef0>
    1e70:      	cmp	x8, x1
    1e74:      	b.hs	0x1ecc <.text+0xecc>
    1e78:      	adrp	x0, 0x8000 <.text+0x7000>
    1e7c:      	adrp	x2, 0x8000 <.text+0x7000>
    1e80:      	add	x0, x0, #0x26e
    1e84:      	mov	w1, #0x2a5              // =677
    1e88:      	add	x2, x2, #0x440
    1e8c:      	bl	0x1c48 <.text+0xc48>
    1e90:      	b	0x1e90 <.text+0xe90>
    1e94:      	adrp	x0, 0x8000 <.text+0x7000>
    1e98:      	adrp	x2, 0x8000 <.text+0x7000>
    1e9c:      	add	x0, x0, #0x26e
    1ea0:      	mov	w1, #0x29e              // =670
    1ea4:      	add	x2, x2, #0x2e9
    1ea8:      	bl	0x1c48 <.text+0xc48>
    1eac:      	b	0x1eac <.text+0xeac>
    1eb0:      	adrp	x0, 0x8000 <.text+0x7000>
    1eb4:      	adrp	x2, 0x8000 <.text+0x7000>
    1eb8:      	add	x0, x0, #0x26e
    1ebc:      	mov	w1, #0x29f              // =671
    1ec0:      	add	x2, x2, #0x307
    1ec4:      	bl	0x1c48 <.text+0xc48>
    1ec8:      	b	0x1ec8 <.text+0xec8>
    1ecc:      	cmp	x8, x3
    1ed0:      	b.hs	0x1ef0 <.text+0xef0>
    1ed4:      	adrp	x0, 0x8000 <.text+0x7000>
    1ed8:      	adrp	x2, 0x8000 <.text+0x7000>
    1edc:      	add	x0, x0, #0x26e
    1ee0:      	mov	w1, #0x2a6              // =678
    1ee4:      	add	x2, x2, #0x4d9
    1ee8:      	bl	0x1c48 <.text+0xc48>
    1eec:      	b	0x1eec <.text+0xeec>
    1ef0:      	cbz	x1, 0x1f14 <.text+0xf14>
    1ef4:      	mov	x8, xzr
    1ef8:      	b	0x1f00 <.text+0xf00>
    1efc:      	add	x8, x8, #0x1
    1f00:      	cmp	x8, x1
    1f04:      	b.hs	0x1f30 <.text+0xf30>
    1f08:      	ldrb	w9, [x20, x8]
    1f0c:      	cbnz	w9, 0x1efc <.text+0xefc>
    1f10:      	b	0x1f38 <.text+0xf38>
    1f14:      	adrp	x0, 0x8000 <.text+0x7000>
    1f18:      	adrp	x2, 0x8000 <.text+0x7000>
    1f1c:      	add	x0, x0, #0x26e
    1f20:      	mov	w1, #0x2ac              // =684
    1f24:      	add	x2, x2, #0x360
    1f28:      	bl	0x1c48 <.text+0xc48>
    1f2c:      	b	0x1f2c <.text+0xf2c>
    1f30:      	cmp	x3, x1
    1f34:      	b.hs	0x1fa4 <.text+0xfa4>
    1f38:      	cmp	x8, x3
    1f3c:      	csel	x21, x3, x8, hi
    1f40:      	add	x3, x21, #0x1
    1f44:      	mov	x0, x19
    1f48:      	mov	x2, x20
    1f4c:      	bl	0x1e14 <.text+0xe14>
    1f50:      	and	w8, w0, #0xff
    1f54:      	cbz	w8, 0x1f80 <.text+0xf80>
    1f58:      	adrp	x0, 0x8000 <.text+0x7000>
    1f5c:      	adrp	x2, 0x8000 <.text+0x7000>
    1f60:      	add	x0, x0, #0x26e
    1f64:      	mov	w1, #0x2bc              // =700
    1f68:      	add	x2, x2, #0x47e
    1f6c:      	bl	0x1c48 <.text+0xc48>
    1f70:      	b	0x1f70 <.text+0xf70>
    1f74:      	add	x20, x20, #0x1
    1f78:      	strb	w8, [x19], #0x1
    1f7c:      	sub	x21, x21, #0x1
    1f80:      	cbz	x21, 0x1f8c <.text+0xf8c>
    1f84:      	ldrb	w8, [x20]
    1f88:      	cbnz	w8, 0x1f74 <.text+0xf74>
    1f8c:      	strb	wzr, [x19]
    1f90:      	mov	x0, xzr
    1f94:      	ldp	x29, x30, [sp, #0x20]
    1f98:      	ldp	x20, x19, [sp, #0x10]
    1f9c:      	ldp	x22, x21, [sp], #0x30
    1fa0:      	ret
    1fa4:      	adrp	x0, 0x8000 <.text+0x7000>
    1fa8:      	adrp	x2, 0x8000 <.text+0x7000>
    1fac:      	add	x0, x0, #0x26e
    1fb0:      	mov	w1, #0x2b3              // =691
    1fb4:      	add	x2, x2, #0x36f
    1fb8:      	bl	0x1c48 <.text+0xc48>
    1fbc:      	b	0x1fbc <.text+0xfbc>
    1fc0:      	stp	x29, x30, [sp, #-0x10]!
    1fc4:      	mov	x29, sp
    1fc8:      	bl	0x1fd8 <.text+0xfd8>
    1fcc:      	add	x0, x0, #0x1
    1fd0:      	ldp	x29, x30, [sp], #0x10
    1fd4:      	ret
    1fd8:      	stp	x29, x30, [sp, #-0x10]!
    1fdc:      	mov	x29, sp
    1fe0:      	cbz	x0, 0x202c <.text+0x102c>
    1fe4:      	adrp	x9, 0x7000 <.text+0x6000>
    1fe8:      	mov	x8, xzr
    1fec:      	ldr	w9, [x9, #0xe2c]
    1ff0:      	b	0x1ffc <.text+0xffc>
    1ff4:      	add	x0, x0, #0x1
    1ff8:      	add	x8, x8, #0x1
    1ffc:      	ldrb	w10, [x0]
    2000:      	cbz	w10, 0x2048 <.text+0x1048>
    2004:      	cbz	w9, 0x1ff4 <.text+0xff4>
    2008:      	cmp	x8, x9
    200c:      	b.lo	0x1ff4 <.text+0xff4>
    2010:      	adrp	x0, 0x8000 <.text+0x7000>
    2014:      	adrp	x2, 0x8000 <.text+0x7000>
    2018:      	add	x0, x0, #0x272
    201c:      	mov	w1, #0x516              // =1302
    2020:      	add	x2, x2, #0x945
    2024:      	bl	0x1c48 <.text+0xc48>
    2028:      	b	0x2028 <.text+0x1028>
    202c:      	adrp	x0, 0x8000 <.text+0x7000>
    2030:      	adrp	x2, 0x8000 <.text+0x7000>
    2034:      	add	x0, x0, #0x272
    2038:      	mov	w1, #0x50e              // =1294
    203c:      	add	x2, x2, #0x642
    2040:      	bl	0x1c48 <.text+0xc48>
    2044:      	b	0x2044 <.text+0x1044>
    2048:      	mov	x0, x8
    204c:      	ldp	x29, x30, [sp], #0x10
    2050:      	ret
    2054:      	svc	#0xdbdb
    2058:      	ret
    205c:      	cbz	w1, 0x2064 <.text+0x1064>
    2060:      	b	0x208c <.text+0x108c>
    2064:      	stp	x29, x30, [sp, #-0x10]!
    2068:      	mov	x29, sp
    206c:      	adrp	x0, 0x8000 <.text+0x7000>
    2070:      	adrp	x2, 0x8000 <.text+0x7000>
    2074:      	add	x0, x0, #0xb03
    2078:      	mov	w1, #0x2b               // =43
    207c:      	add	x2, x2, #0xb0f
    2080:      	bl	0x1c48 <.text+0xc48>
    2084:      	ldp	x29, x30, [sp], #0x10
    2088:      	b	0x2088 <.text+0x1088>
    208c:      	mov	w8, w1
    2090:      	udiv	x0, x0, x8
    2094:      	ret
    2098:      	ldr	x8, [x1, #0x58]
    209c:      	adrp	x9, 0xc000
    20a0:      	str	x8, [x9, #0x508]
    20a4:      	cbz	x8, 0x20b0 <.text+0x10b0>
    20a8:      	mov	x0, xzr
    20ac:      	ret
    20b0:      	stp	x29, x30, [sp, #-0x10]!
    20b4:      	mov	x29, sp
    20b8:      	adrp	x0, 0x8000 <.text+0x7000>
    20bc:      	adrp	x2, 0x8000 <.text+0x7000>
    20c0:      	add	x0, x0, #0xb1c
    20c4:      	mov	w1, #0x2f               // =47
    20c8:      	add	x2, x2, #0xb3a
    20cc:      	bl	0x1c48 <.text+0xc48>
    20d0:      	ldp	x29, x30, [sp], #0x10
    20d4:      	b	0x20d4 <.text+0x10d4>
    20d8:      	stp	x29, x30, [sp, #-0x10]!
    20dc:      	mov	x29, sp
    20e0:      	adrp	x8, 0xc000
    20e4:      	str	x0, [x8, #0x510]
    20e8:      	cbz	x0, 0x2114 <.text+0x1114>
    20ec:      	adrp	x9, 0xc000
    20f0:      	str	x1, [x9, #0x518]
    20f4:      	cbz	x1, 0x2130 <.text+0x1130>
    20f8:      	ldr	x8, [x1, #0x60]
    20fc:      	adrp	x10, 0xc000
    2100:      	str	x8, [x10, #0x520]
    2104:      	cbz	x8, 0x214c <.text+0x114c>
    2108:      	mov	x0, xzr
    210c:      	ldp	x29, x30, [sp], #0x10
    2110:      	ret
    2114:      	adrp	x0, 0x8000 <.text+0x7000>
    2118:      	adrp	x2, 0x8000 <.text+0x7000>
    211c:      	add	x0, x0, #0xb4e
    2120:      	mov	w1, #0x33               // =51
    2124:      	add	x2, x2, #0xb69
    2128:      	bl	0x1c48 <.text+0xc48>
    212c:      	b	0x212c <.text+0x112c>
    2130:      	adrp	x0, 0x8000 <.text+0x7000>
    2134:      	adrp	x2, 0x8000 <.text+0x7000>
    2138:      	add	x0, x0, #0xb4e
    213c:      	mov	w1, #0x39               // =57
    2140:      	add	x2, x2, #0xb86
    2144:      	bl	0x1c48 <.text+0xc48>
    2148:      	b	0x2148 <.text+0x1148>
    214c:      	adrp	x0, 0x8000 <.text+0x7000>
    2150:      	adrp	x2, 0x8000 <.text+0x7000>
    2154:      	add	x0, x0, #0xb4e
    2158:      	add	x2, x2, #0xb9a
    215c:      	orr	w1, wzr, #0x3f
    2160:      	bl	0x1c48 <.text+0xc48>
    2164:      	b	0x2164 <.text+0x1164>
    2168:      	mov	x0, xzr
    216c:      	ret
    2170:      	stp	x26, x25, [sp, #-0x50]!
    2174:      	stp	x24, x23, [sp, #0x10]
    2178:      	stp	x22, x21, [sp, #0x20]
    217c:      	stp	x20, x19, [sp, #0x30]
    2180:      	stp	x29, x30, [sp, #0x40]
    2184:      	add	x29, sp, #0x40
    2188:      	mov	x19, x1
    218c:      	mov	x20, x0
    2190:      	cbz	x20, 0x2214 <.text+0x1214>
    2194:      	cbz	x19, 0x2230 <.text+0x1230>
    2198:      	adrp	x8, 0xc000
    219c:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    21a0:      	mov	x25, xzr
    21a4:      	ldr	x21, [x8, #0x518]
    21a8:      	mov	x22, #-0x1              // =-1
    21ac:      	movk	x23, #0xe
    21b0:      	str	xzr, [x19]
    21b4:      	ldr	x8, [x21, #0x68]
    21b8:      	mov	x24, x25
    21bc:      	add	x22, x22, #0x1
    21c0:      	mov	x0, x23
    21c4:      	cmp	x22, x8
    21c8:      	b.hs	0x21fc <.text+0x11fc>
    21cc:      	ldr	x10, [x21, #0x70]
    21d0:      	mov	x0, x20
    21d4:      	add	x25, x24, #0x18
    21d8:      	add	x1, x10, x24
    21dc:      	bl	0x6808 <.text+0x5808>
    21e0:      	and	w8, w0, #0xff
    21e4:      	cbz	w8, 0x21b4 <.text+0x11b4>
    21e8:      	ldr	x11, [x21, #0x70]
    21ec:      	mov	x0, xzr
    21f0:      	add	x9, x11, x24
    21f4:      	ldr	x12, [x9, #0x10]
    21f8:      	str	x12, [x19]
    21fc:      	ldp	x29, x30, [sp, #0x40]
    2200:      	ldp	x20, x19, [sp, #0x30]
    2204:      	ldp	x22, x21, [sp, #0x20]
    2208:      	ldp	x24, x23, [sp, #0x10]
    220c:      	ldp	x26, x25, [sp], #0x50
    2210:      	ret
    2214:      	adrp	x0, 0x8000 <.text+0x7000>
    2218:      	adrp	x2, 0x8000 <.text+0x7000>
    221c:      	add	x0, x0, #0xbae
    2220:      	mov	w1, #0x61               // =97
    2224:      	add	x2, x2, #0xbb8
    2228:      	bl	0x1c48 <.text+0xc48>
    222c:      	b	0x222c <.text+0x122c>
    2230:      	adrp	x0, 0x8000 <.text+0x7000>
    2234:      	adrp	x2, 0x8000 <.text+0x7000>
    2238:      	add	x0, x0, #0xbae
    223c:      	mov	w1, #0x62               // =98
    2240:      	add	x2, x2, #0xbd2
    2244:      	bl	0x1c48 <.text+0xc48>
    2248:      	b	0x2248 <.text+0x1248>
    224c:      	stp	x20, x19, [sp, #-0x20]!
    2250:      	stp	x29, x30, [sp, #0x10]
    2254:      	add	x29, sp, #0x10
    2258:      	adrp	x0, 0xc000
    225c:      	adrp	x1, 0xc000
    2260:      	add	x0, x0, #0x80
    2264:      	add	x1, x1, #0x528
    2268:      	bl	0x2170 <.text+0x1170>
    226c:      	mov	x19, x0
    2270:      	tbz	x19, #0x3f, 0x22a0 <.text+0x12a0>
    2274:      	adrp	x1, 0x7000 <.text+0x6000>
    2278:      	add	x1, x1, #0xdc8
    227c:      	orr	w0, wzr, #0x80000000
    2280:      	mov	x2, x19
    2284:      	bl	0x18bc <.text+0x8bc>
    2288:      	adrp	x0, 0x8000 <.text+0x7000>
    228c:      	adrp	x2, 0x7000 <.text+0x6000>
    2290:      	add	x0, x0, #0xd69
    2294:      	mov	w1, #0x31               // =49
    2298:      	add	x2, x2, #0xdfc
    229c:      	bl	0x1c48 <.text+0xc48>
    22a0:      	adrp	x8, 0xc000
    22a4:      	ldr	x8, [x8, #0x528]
    22a8:      	cbz	x8, 0x22bc <.text+0x12bc>
    22ac:      	ldp	x29, x30, [sp, #0x10]
    22b0:      	mov	x0, x19
    22b4:      	ldp	x20, x19, [sp], #0x20
    22b8:      	ret
    22bc:      	adrp	x0, 0x8000 <.text+0x7000>
    22c0:      	adrp	x2, 0x8000 <.text+0x7000>
    22c4:      	add	x0, x0, #0xd69
    22c8:      	mov	w1, #0x32               // =50
    22cc:      	add	x2, x2, #0xd72
    22d0:      	bl	0x1c48 <.text+0xc48>
    22d4:      	b	0x22d4 <.text+0x12d4>
    22d8:      	adrp	x8, 0xc000
    22dc:      	ldr	x0, [x8, #0x528]
    22e0:      	cbz	x0, 0x22e8 <.text+0x12e8>
    22e4:      	ret
    22e8:      	stp	x29, x30, [sp, #-0x10]!
    22ec:      	mov	x29, sp
    22f0:      	adrp	x0, 0x8000 <.text+0x7000>
    22f4:      	adrp	x2, 0x8000 <.text+0x7000>
    22f8:      	add	x0, x0, #0xd69
    22fc:      	mov	w1, #0x4d               // =77
    2300:      	add	x2, x2, #0xd72
    2304:      	bl	0x1c48 <.text+0xc48>
    2308:      	ldp	x29, x30, [sp], #0x10
    230c:      	b	0x230c <.text+0x130c>
    2310:      	cbz	x1, 0x2340 <.text+0x1340>
    2314:      	orr	w8, wzr, #0xffff
    2318:      	b	0x2320 <.text+0x1320>
    231c:      	add	x1, x1, x10
    2320:      	ldr	w10, [x1]
    2324:      	and	w9, w10, #0xffff
    2328:      	lsr	w10, w10, #16
    232c:      	cmp	w9, w8
    2330:      	b.eq	0x2368 <.text+0x1368>
    2334:      	cmp	w9, w0, uxth
    2338:      	b.ne	0x231c <.text+0x131c>
    233c:      	b	0x236c <.text+0x136c>
    2340:      	stp	x29, x30, [sp, #-0x10]!
    2344:      	mov	x29, sp
    2348:      	adrp	x0, 0x8000 <.text+0x7000>
    234c:      	adrp	x2, 0x8000 <.text+0x7000>
    2350:      	add	x0, x0, #0xd69
    2354:      	mov	w1, #0x6b               // =107
    2358:      	add	x2, x2, #0xd8b
    235c:      	bl	0x1c48 <.text+0xc48>
    2360:      	ldp	x29, x30, [sp], #0x10
    2364:      	b	0x2364 <.text+0x1364>
    2368:      	mov	x1, xzr
    236c:      	mov	x0, x1
    2370:      	ret
    2374:      	stp	x20, x19, [sp, #-0x20]!
    2378:      	stp	x29, x30, [sp, #0x10]
    237c:      	add	x29, sp, #0x10
    2380:      	mov	x19, x0
    2384:      	b	0x2390 <.text+0x1390>
    2388:      	ldrh	w8, [x20, #0x2]
    238c:      	add	x1, x20, x8
    2390:      	orr	w0, wzr, #0x4
    2394:      	bl	0x2310 <.text+0x1310>
    2398:      	mov	x20, x0
    239c:      	cbz	x20, 0x23b8 <.text+0x13b8>
    23a0:      	add	x1, x20, #0x8
    23a4:      	mov	x0, x19
    23a8:      	bl	0x6808 <.text+0x5808>
    23ac:      	and	w8, w0, #0xff
    23b0:      	cbz	w8, 0x2388 <.text+0x1388>
    23b4:      	b	0x23bc <.text+0x13bc>
    23b8:      	mov	x20, xzr
    23bc:      	ldp	x29, x30, [sp, #0x10]
    23c0:      	mov	x0, x20
    23c4:      	ldp	x20, x19, [sp], #0x20
    23c8:      	ret
    23cc:      	stp	x20, x19, [sp, #-0x20]!
    23d0:      	stp	x29, x30, [sp, #0x10]
    23d4:      	add	x29, sp, #0x10
    23d8:      	mov	x19, x0
    23dc:      	bl	0x22d8 <.text+0x12d8>
    23e0:      	ldp	x29, x30, [sp, #0x10]
    23e4:      	mov	x1, x0
    23e8:      	mov	x0, x19
    23ec:      	ldp	x20, x19, [sp], #0x20
    23f0:      	b	0x2374 <.text+0x1374>
    23f4:      	cbz	x1, 0x240c <.text+0x140c>
    23f8:      	adrp	x8, 0xc000
    23fc:      	mov	x0, xzr
    2400:      	ldr	w8, [x8, #0x534]
    2404:      	str	x8, [x1]
    2408:      	ret
    240c:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    2410:      	movk	x0, #0x2
    2414:      	ret
    2418:      	adrp	x8, 0xc000
    241c:      	mov	x0, xzr
    2420:      	str	w1, [x8, #0x534]
    2424:      	ret
    2428:      	stp	x20, x19, [sp, #-0x20]!
    242c:      	stp	x29, x30, [sp, #0x10]
    2430:      	add	x29, sp, #0x10
    2434:      	sub	sp, sp, #0x10
    2438:      	adrp	x8, 0xc000
    243c:      	str	x0, [sp, #0x8]
    2440:      	adrp	x9, 0x7000 <.text+0x6000>
    2444:      	adrp	x2, 0xc000
    2448:      	str	x1, [x8, #0x538]
    244c:      	adrp	x10, 0xc000
    2450:      	ldr	x11, [x1, #0x60]
    2454:      	adrp	x1, 0xc000
    2458:      	ldr	w8, [x9, #0xe30]
    245c:      	add	x1, x1, #0xe0
    2460:      	add	x2, x2, #0x200
    2464:      	add	x0, sp, #0x8
    2468:      	ldr	x9, [x11, #0x148]
    246c:      	mov	x3, xzr
    2470:      	str	w8, [x10, #0x534]
    2474:      	blr	x9
    2478:      	mov	x19, x0
    247c:      	bl	0x2494 <.text+0x1494>
    2480:      	mov	x0, x19
    2484:      	sub	sp, x29, #0x10
    2488:      	ldp	x29, x30, [sp, #0x10]
    248c:      	ldp	x20, x19, [sp], #0x20
    2490:      	ret
    2494:      	stp	x22, x21, [sp, #-0x30]!
    2498:      	stp	x20, x19, [sp, #0x10]
    249c:      	stp	x29, x30, [sp, #0x20]
    24a0:      	add	x29, sp, #0x20
    24a4:      	sub	sp, sp, #0x10
    24a8:      	adrp	x21, 0xc000
    24ac:      	ldr	x9, [x21, #0x538]
    24b0:      	cbz	x9, 0x2574 <.text+0x1574>
    24b4:      	adrp	x20, 0xc000
    24b8:      	ldrb	w8, [x20, #0x530]
    24bc:      	cbnz	w8, 0x2568 <.text+0x1568>
    24c0:      	ldr	x10, [x9, #0x60]
    24c4:      	orr	w0, wzr, #0x1f
    24c8:      	ldr	x8, [x10, #0x18]
    24cc:      	blr	x8
    24d0:      	ldr	x11, [x21, #0x538]
    24d4:      	mov	x19, x0
    24d8:      	ldr	x12, [x11, #0x60]
    24dc:      	ldr	x9, [x12, #0x20]
    24e0:      	blr	x9
    24e4:      	cmp	x19, #0x8
    24e8:      	b.hi	0x2568 <.text+0x1568>
    24ec:      	orr	w11, wzr, #0x8
    24f0:      	ldr	x13, [x21, #0x538]
    24f4:      	adrp	x0, 0x8000 <.text+0x7000>
    24f8:      	adrp	x1, 0xc000
    24fc:      	str	x11, [sp, #0x8]
    2500:      	add	x0, x0, #0xdb6
    2504:      	ldr	x14, [x13, #0x58]
    2508:      	add	x1, x1, #0x90
    250c:      	add	x3, sp, #0x8
    2510:      	mov	x4, sp
    2514:      	mov	x2, xzr
    2518:      	ldr	x12, [x14, #0x48]
    251c:      	blr	x12
    2520:      	mov	x13, #-0x6000000000000000 // =-6917529027641081856
    2524:      	movk	x13, #0x2
    2528:      	cmp	x0, x13
    252c:      	b.ne	0x2594 <.text+0x1594>
    2530:      	adrp	x0, 0xc000
    2534:      	add	x0, x0, #0x90
    2538:      	bl	0x23cc <.text+0x13cc>
    253c:      	cbz	x0, 0x2568 <.text+0x1568>
    2540:      	ldrh	w8, [x0, #0x2]
    2544:      	cmp	w8, #0x1c
    2548:      	adrp	x8, 0xc000
    254c:      	add	x8, x8, #0x534
    2550:      	b.ne	0x257c <.text+0x157c>
    2554:      	ldr	w11, [x0, #0x18]
    2558:      	orr	w12, wzr, #0x1
    255c:      	strb	w12, [x20, #0x530]
    2560:      	str	w11, [x8]
    2564:      	b	0x257c <.text+0x157c>
    2568:      	adrp	x8, 0xc000
    256c:      	add	x8, x8, #0x534
    2570:      	b	0x257c <.text+0x157c>
    2574:      	adrp	x8, 0x7000 <.text+0x6000>
    2578:      	add	x8, x8, #0xe30
    257c:      	ldr	w0, [x8]
    2580:      	sub	sp, x29, #0x20
    2584:      	ldp	x29, x30, [sp, #0x20]
    2588:      	ldp	x20, x19, [sp, #0x10]
    258c:      	ldp	x22, x21, [sp], #0x30
    2590:      	ret
    2594:      	adrp	x8, 0xc000
    2598:      	orr	w9, wzr, #0x1
    259c:      	add	x8, x8, #0x534
    25a0:      	strb	w9, [x20, #0x530]
    25a4:      	tbnz	x0, #0x3f, 0x257c <.text+0x157c>
    25a8:      	ldr	x15, [sp]
    25ac:      	str	w15, [x8]
    25b0:      	b	0x257c <.text+0x157c>
    25b4:      	ldr	x8, [x1, #0x60]
    25b8:      	adrp	x1, 0xc000
    25bc:      	adrp	x2, 0xc000
    25c0:      	mov	x3, xzr
    25c4:      	add	x1, x1, #0xe0
    25c8:      	ldr	x4, [x8, #0x150]
    25cc:      	add	x2, x2, #0x200
    25d0:      	br	x4
    25d4:      	stp	x29, x30, [sp, #-0x10]!
    25d8:      	mov	x29, sp
    25dc:      	adrp	x8, 0x2000 <.text+0x1000>
    25e0:      	adrp	x0, 0x2000 <.text+0x1000>
    25e4:      	add	x0, x0, #0x5fc
    25e8:      	ldr	w1, [x8, #0x6bc]
    25ec:      	bl	0x6d80 <.text+0x5d80>
    25f0:      	mov	x0, xzr
    25f4:      	ldp	x29, x30, [sp], #0x10
    25f8:      	ret
    25fc:      	mrs	x2, DAIF
    2600:      	msr	DAIFSet, #0xf
    2604:      	isb
    2608:      	dc	civac, x0
    260c:      	dsb	ish
    2610:      	mrs	x3, CurrentEL
    2614:      	cmp	x3, #0x8
    2618:      	b.gt	0x2688 <.text+0x1688>
    261c:      	b.eq	0x2658 <.text+0x1658>
    2620:      	cbnz	x3, 0x2628 <.text+0x1628>
    2624:      	b	0x2624 <.text+0x1624>
    2628:      	mrs	x8, SCTLR_EL1
    262c:      	and	x9, x8, #0xfffffffffffffffe
    2630:      	msr	SCTLR_EL1, x9
    2634:      	isb
    2638:      	str	x1, [x0]
    263c:      	dmb	sy
    2640:      	dc	ivac, x0
    2644:      	tlbi	vmalle1
    2648:      	dsb	sy
    264c:      	msr	SCTLR_EL1, x8
    2650:      	isb
    2654:      	b	0x26b4 <.text+0x16b4>
    2658:      	mrs	x8, SCTLR_EL2
    265c:      	and	x9, x8, #0xfffffffffffffffe
    2660:      	msr	SCTLR_EL2, x9
    2664:      	isb
    2668:      	str	x1, [x0]
    266c:      	dmb	sy
    2670:      	dc	ivac, x0
    2674:      	tlbi	alle2
    2678:      	dsb	sy
    267c:      	msr	SCTLR_EL2, x8
    2680:      	isb
    2684:      	b	0x26b4 <.text+0x16b4>
    2688:      	mrs	x8, SCTLR_EL3
    268c:      	and	x9, x8, #0xfffffffffffffffe
    2690:      	msr	SCTLR_EL3, x9
    2694:      	isb
    2698:      	str	x1, [x0]
    269c:      	dmb	sy
    26a0:      	dc	ivac, x0
    26a4:      	tlbi	alle3
    26a8:      	dsb	sy
    26ac:      	msr	SCTLR_EL3, x8
    26b0:      	isb
    26b4:      	msr	DAIF, x2
    26b8:      	ret
    26bc:      	udf	#0xc0
    26c0:      	stp	x29, x30, [sp, #-0x10]!
    26c4:      	mov	x29, sp
    26c8:      	bl	0x6ee0 <.text+0x5ee0>
    26cc:      	cbz	x0, 0x2700 <.text+0x1700>
    26d0:      	adrp	x8, 0x7000 <.text+0x6000>
    26d4:      	ldr	w8, [x8, #0xe34]
    26d8:      	sub	w9, w8, #0x1
    26dc:      	mov	w8, #0xf0000            // =983040
    26e0:      	movk	w8, #0x423e
    26e4:      	cmp	w9, w8
    26e8:      	b.ls	0x272c <.text+0x172c>
    26ec:      	bl	0x6f10 <.text+0x5f10>
    26f0:      	cbz	x0, 0x2748 <.text+0x1748>
    26f4:      	mov	x0, xzr
    26f8:      	ldp	x29, x30, [sp], #0x10
    26fc:      	ret
    2700:      	adrp	x1, 0x8000 <.text+0x7000>
    2704:      	add	x1, x1, #0xe34
    2708:      	orr	w0, wzr, #0x80000000
    270c:      	bl	0x18bc <.text+0x8bc>
    2710:      	adrp	x0, 0x8000 <.text+0x7000>
    2714:      	adrp	x2, 0x8000 <.text+0x7000>
    2718:      	add	x0, x0, #0xdc8
    271c:      	mov	w1, #0x50               // =80
    2720:      	add	x2, x2, #0xe32
    2724:      	bl	0x1c48 <.text+0xc48>
    2728:      	b	0x2728 <.text+0x1728>
    272c:      	adrp	x0, 0x8000 <.text+0x7000>
    2730:      	adrp	x2, 0x8000 <.text+0x7000>
    2734:      	add	x0, x0, #0xdc8
    2738:      	add	x2, x2, #0xdda
    273c:      	orr	w1, wzr, #0x38
    2740:      	bl	0x1c48 <.text+0xc48>
    2744:      	b	0x2744 <.text+0x1744>
    2748:      	adrp	x0, 0x8000 <.text+0x7000>
    274c:      	adrp	x2, 0x8000 <.text+0x7000>
    2750:      	add	x0, x0, #0xdc8
    2754:      	mov	w1, #0x4c               // =76
    2758:      	add	x2, x2, #0xe10
    275c:      	bl	0x1c48 <.text+0xc48>
    2760:      	b	0x2760 <.text+0x1760>
    2764:      	b	0x6f3c <.text+0x5f3c>
    2768:      	cbz	x0, 0x2770 <.text+0x1770>
    276c:      	str	xzr, [x0]
    2770:      	cbz	x1, 0x277c <.text+0x177c>
    2774:      	mov	x8, #-0x1               // =-1
    2778:      	str	x8, [x1]
    277c:      	b	0x6f10 <.text+0x5f10>
    2780:      	b	0x778c <.text+0x678c>
    2784:      	stp	x22, x21, [sp, #-0x30]!
    2788:      	stp	x20, x19, [sp, #0x10]
    278c:      	stp	x29, x30, [sp, #0x20]
    2790:      	add	x29, sp, #0x20
    2794:      	mov	x20, x1
    2798:      	orr	w8, wzr, #0x8
    279c:      	adrp	x21, 0xc000
    27a0:      	str	w8, [x20]
    27a4:      	ldr	x8, [x21, #0x558]
    27a8:      	cbnz	x8, 0x27dc <.text+0x17dc>
    27ac:      	adrp	x9, 0xc000
    27b0:      	adrp	x0, 0xc000
    27b4:      	adrp	x2, 0xc000
    27b8:      	ldr	x10, [x9, #0x520]
    27bc:      	mov	x1, xzr
    27c0:      	add	x0, x0, #0x150
    27c4:      	add	x2, x2, #0x558
    27c8:      	ldr	x8, [x10, #0x140]
    27cc:      	blr	x8
    27d0:      	mov	x19, x0
    27d4:      	tbnz	x19, #0x3f, 0x2800 <.text+0x1800>
    27d8:      	ldr	x8, [x21, #0x558]
    27dc:      	ldr	x9, [x8, #0x10]
    27e0:      	orr	w0, wzr, #0x1
    27e4:      	mov	x1, x20
    27e8:      	blr	x9
    27ec:      	mov	x19, x0
    27f0:      	tbz	x19, #0x3f, 0x2820 <.text+0x1820>
    27f4:      	adrp	x1, 0x8000 <.text+0x7000>
    27f8:      	add	x1, x1, #0xed7
    27fc:      	b	0x280c <.text+0x180c>
    2800:      	adrp	x1, 0x8000 <.text+0x7000>
    2804:      	str	xzr, [x21, #0x558]
    2808:      	add	x1, x1, #0xe8d
    280c:      	adrp	x2, 0x8000 <.text+0x7000>
    2810:      	add	x2, x2, #0xec4
    2814:      	orr	w0, wzr, #0x80000000
    2818:      	mov	x3, x19
    281c:      	bl	0x18bc <.text+0x8bc>
    2820:      	mov	x0, x19
    2824:      	ldp	x29, x30, [sp, #0x20]
    2828:      	ldp	x20, x19, [sp, #0x10]
    282c:      	ldp	x22, x21, [sp], #0x30
    2830:      	ret
    2834:      	stp	x20, x19, [sp, #-0x20]!
    2838:      	stp	x29, x30, [sp, #0x10]
    283c:      	add	x29, sp, #0x10
    2840:      	mov	x19, x1
    2844:      	mov	w8, w0
    2848:      	cbz	x19, 0x2860 <.text+0x1860>
    284c:      	cmp	w8, #0x5
    2850:      	b.ne	0x2884 <.text+0x1884>
    2854:      	mov	x0, xzr
    2858:      	str	wzr, [x19]
    285c:      	b	0x28ac <.text+0x18ac>
    2860:      	adrp	x1, 0x8000 <.text+0x7000>
    2864:      	adrp	x2, 0x8000 <.text+0x7000>
    2868:      	add	x1, x1, #0xf0d
    286c:      	add	x2, x2, #0xf36
    2870:      	orr	w0, wzr, #0x80000000
    2874:      	bl	0x18bc <.text+0x8bc>
    2878:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    287c:      	movk	x0, #0x2
    2880:      	b	0x28ac <.text+0x18ac>
    2884:      	adrp	x1, 0x8000 <.text+0x7000>
    2888:      	adrp	x2, 0x8000 <.text+0x7000>
    288c:      	add	x1, x1, #0xf41
    2890:      	add	x2, x2, #0xf36
    2894:      	orr	w0, wzr, #0x80000000
    2898:      	mov	w3, w8
    289c:      	bl	0x18bc <.text+0x8bc>
    28a0:      	orr	w8, wzr, #0x1
    28a4:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    28a8:      	str	w8, [x19]
    28ac:      	ldp	x29, x30, [sp, #0x10]
    28b0:      	ldp	x20, x19, [sp], #0x20
    28b4:      	ret
    28b8:      	stp	x22, x21, [sp, #-0x30]!
    28bc:      	stp	x20, x19, [sp, #0x10]
    28c0:      	stp	x29, x30, [sp, #0x20]
    28c4:      	add	x29, sp, #0x20
    28c8:      	sub	sp, sp, #0x10
    28cc:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    28d0:      	mov	x20, x1
    28d4:      	mov	w8, w0
    28d8:      	movk	x19, #0x2
    28dc:      	cbz	x20, 0x290c <.text+0x190c>
    28e0:      	cmp	w8, #0x7
    28e4:      	b.lo	0x2918 <.text+0x1918>
    28e8:      	adrp	x1, 0x8000 <.text+0x7000>
    28ec:      	adrp	x2, 0x8000 <.text+0x7000>
    28f0:      	add	x1, x1, #0xfb8
    28f4:      	add	x2, x2, #0xfa8
    28f8:      	orr	w0, wzr, #0x80000000
    28fc:      	mov	w3, w8
    2900:      	bl	0x18bc <.text+0x8bc>
    2904:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    2908:      	b	0x29ac <.text+0x19ac>
    290c:      	adrp	x1, 0x8000 <.text+0x7000>
    2910:      	add	x1, x1, #0xf79
    2914:      	b	0x293c <.text+0x193c>
    2918:      	add	x1, sp, #0xc
    291c:      	mov	w0, w8
    2920:      	bl	0x2834 <.text+0x1834>
    2924:      	mov	x21, x0
    2928:      	tbnz	x21, #0x3f, 0x2950 <.text+0x1950>
    292c:      	ldr	w8, [sp, #0xc]
    2930:      	cbz	w8, 0x2970 <.text+0x1970>
    2934:      	adrp	x1, 0x9000 <.text+0x8000>
    2938:      	add	x1, x1, #0x18
    293c:      	adrp	x2, 0x8000 <.text+0x7000>
    2940:      	add	x2, x2, #0xfa8
    2944:      	orr	w0, wzr, #0x80000000
    2948:      	bl	0x18bc <.text+0x8bc>
    294c:      	b	0x29ac <.text+0x19ac>
    2950:      	adrp	x1, 0x8000 <.text+0x7000>
    2954:      	adrp	x2, 0x8000 <.text+0x7000>
    2958:      	add	x1, x1, #0xff5
    295c:      	add	x2, x2, #0xfa8
    2960:      	orr	w0, wzr, #0x80000000
    2964:      	bl	0x18bc <.text+0x8bc>
    2968:      	mov	x19, x21
    296c:      	b	0x29ac <.text+0x19ac>
    2970:      	adrp	x8, 0xc000
    2974:      	add	x8, x8, #0x218
    2978:      	mov	x1, x20
    297c:      	ldr	x0, [x8, #0x18]
    2980:      	ldr	x8, [x0, #0x50]
    2984:      	blr	x8
    2988:      	mov	x19, x0
    298c:      	tbz	x19, #0x3f, 0x29ac <.text+0x19ac>
    2990:      	adrp	x1, 0x9000 <.text+0x8000>
    2994:      	adrp	x2, 0x8000 <.text+0x7000>
    2998:      	add	x1, x1, #0x32
    299c:      	add	x2, x2, #0xfa8
    29a0:      	orr	w0, wzr, #0x80000000
    29a4:      	mov	x3, x19
    29a8:      	bl	0x18bc <.text+0x8bc>
    29ac:      	mov	x0, x19
    29b0:      	sub	sp, x29, #0x20
    29b4:      	ldp	x29, x30, [sp, #0x20]
    29b8:      	ldp	x20, x19, [sp, #0x10]
    29bc:      	ldp	x22, x21, [sp], #0x30
    29c0:      	ret
    29c4:      	stp	x22, x21, [sp, #-0x30]!
    29c8:      	stp	x20, x19, [sp, #0x10]
    29cc:      	stp	x29, x30, [sp, #0x20]
    29d0:      	add	x29, sp, #0x20
    29d4:      	mov	w8, w1
    29d8:      	mov	w21, w0
    29dc:      	cbz	w8, 0x2a18 <.text+0x1a18>
    29e0:      	adrp	x1, 0x9000 <.text+0x8000>
    29e4:      	adrp	x2, 0x9000 <.text+0x8000>
    29e8:      	add	x1, x1, #0x68
    29ec:      	add	x2, x2, #0x9b
    29f0:      	orr	w0, wzr, #0x80000000
    29f4:      	mov	w3, w8
    29f8:      	bl	0x18bc <.text+0x8bc>
    29fc:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    2a00:      	movk	x19, #0x2
    2a04:      	mov	x0, x19
    2a08:      	ldp	x29, x30, [sp, #0x20]
    2a0c:      	ldp	x20, x19, [sp, #0x10]
    2a10:      	ldp	x22, x21, [sp], #0x30
    2a14:      	ret
    2a18:      	adrp	x8, 0xc000
    2a1c:      	add	x8, x8, #0x218
    2a20:      	ldr	x20, [x8, #0x18]
    2a24:      	cbz	x20, 0x2a70 <.text+0x1a70>
    2a28:      	ldr	x8, [x20, #0x8]
    2a2c:      	cbz	x8, 0x2aac <.text+0x1aac>
    2a30:      	mov	w1, wzr
    2a34:      	mov	x0, x20
    2a38:      	blr	x8
    2a3c:      	mov	x19, x0
    2a40:      	tbnz	x19, #0x3f, 0x2ae8 <.text+0x1ae8>
    2a44:      	cmp	w21, #0x4
    2a48:      	b.ne	0x2b0c <.text+0x1b0c>
    2a4c:      	ldr	x9, [x20, #0x10]
    2a50:      	cbz	x9, 0x2b30 <.text+0x1b30>
    2a54:      	mov	x0, x20
    2a58:      	blr	x9
    2a5c:      	mov	x19, x0
    2a60:      	tbz	x19, #0x3f, 0x2a04 <.text+0x1a04>
    2a64:      	adrp	x1, 0x9000 <.text+0x8000>
    2a68:      	add	x1, x1, #0x203
    2a6c:      	b	0x2af0 <.text+0x1af0>
    2a70:      	adrp	x1, 0x9000 <.text+0x8000>
    2a74:      	adrp	x2, 0x9000 <.text+0x8000>
    2a78:      	mov	w19, #0xee              // =238
    2a7c:      	add	x1, x1, #0xa5
    2a80:      	add	x2, x2, #0xc9
    2a84:      	orr	w0, wzr, #0x80000000
    2a88:      	mov	w3, w19
    2a8c:      	bl	0x18bc <.text+0x8bc>
    2a90:      	adrp	x0, 0x9000 <.text+0x8000>
    2a94:      	adrp	x2, 0x8000 <.text+0x7000>
    2a98:      	add	x0, x0, #0x140
    2a9c:      	add	x2, x2, #0xe32
    2aa0:      	mov	x1, x19
    2aa4:      	bl	0x1c48 <.text+0xc48>
    2aa8:      	b	0x2aa8 <.text+0x1aa8>
    2aac:      	adrp	x1, 0x9000 <.text+0x8000>
    2ab0:      	adrp	x2, 0x9000 <.text+0x8000>
    2ab4:      	mov	w19, #0xf1              // =241
    2ab8:      	add	x1, x1, #0x14f
    2abc:      	add	x2, x2, #0xc9
    2ac0:      	orr	w0, wzr, #0x80000000
    2ac4:      	mov	w3, w19
    2ac8:      	bl	0x18bc <.text+0x8bc>
    2acc:      	adrp	x0, 0x9000 <.text+0x8000>
    2ad0:      	adrp	x2, 0x8000 <.text+0x7000>
    2ad4:      	add	x0, x0, #0x140
    2ad8:      	add	x2, x2, #0xe32
    2adc:      	mov	x1, x19
    2ae0:      	bl	0x1c48 <.text+0xc48>
    2ae4:      	b	0x2ae4 <.text+0x1ae4>
    2ae8:      	adrp	x1, 0x9000 <.text+0x8000>
    2aec:      	add	x1, x1, #0x17f
    2af0:      	adrp	x2, 0x9000 <.text+0x8000>
    2af4:      	add	x2, x2, #0x9b
    2af8:      	orr	w0, wzr, #0x80000000
    2afc:      	mov	w3, wzr
    2b00:      	mov	x4, x19
    2b04:      	bl	0x18bc <.text+0x8bc>
    2b08:      	b	0x2a04 <.text+0x1a04>
    2b0c:      	ldr	x10, [x20, #0x18]
    2b10:      	cbz	x10, 0x2b6c <.text+0x1b6c>
    2b14:      	mov	x0, x20
    2b18:      	blr	x10
    2b1c:      	mov	x19, x0
    2b20:      	tbz	x19, #0x3f, 0x2a04 <.text+0x1a04>
    2b24:      	adrp	x1, 0x9000 <.text+0x8000>
    2b28:      	add	x1, x1, #0x286
    2b2c:      	b	0x2af0 <.text+0x1af0>
    2b30:      	adrp	x1, 0x9000 <.text+0x8000>
    2b34:      	adrp	x2, 0x9000 <.text+0x8000>
    2b38:      	mov	w19, #0xf7              // =247
    2b3c:      	add	x1, x1, #0x1d3
    2b40:      	add	x2, x2, #0xc9
    2b44:      	orr	w0, wzr, #0x80000000
    2b48:      	mov	w3, w19
    2b4c:      	bl	0x18bc <.text+0x8bc>
    2b50:      	adrp	x0, 0x9000 <.text+0x8000>
    2b54:      	adrp	x2, 0x8000 <.text+0x7000>
    2b58:      	add	x0, x0, #0x140
    2b5c:      	add	x2, x2, #0xe32
    2b60:      	mov	x1, x19
    2b64:      	bl	0x1c48 <.text+0xc48>
    2b68:      	b	0x2b68 <.text+0x1b68>
    2b6c:      	adrp	x1, 0x9000 <.text+0x8000>
    2b70:      	adrp	x2, 0x9000 <.text+0x8000>
    2b74:      	add	x1, x1, #0x258
    2b78:      	add	x2, x2, #0xc9
    2b7c:      	orr	w0, wzr, #0x80000000
    2b80:      	orr	w3, wzr, #0xfc
    2b84:      	bl	0x18bc <.text+0x8bc>
    2b88:      	adrp	x0, 0x9000 <.text+0x8000>
    2b8c:      	adrp	x2, 0x8000 <.text+0x7000>
    2b90:      	add	x0, x0, #0x140
    2b94:      	add	x2, x2, #0xe32
    2b98:      	orr	w1, wzr, #0xfc
    2b9c:      	bl	0x1c48 <.text+0xc48>
    2ba0:      	b	0x2ba0 <.text+0x1ba0>
    2ba4:      	stp	x20, x19, [sp, #-0x20]!
    2ba8:      	stp	x29, x30, [sp, #0x10]
    2bac:      	add	x29, sp, #0x10
    2bb0:      	sub	sp, sp, #0x10
    2bb4:      	mov	w19, w0
    2bb8:      	cmp	w19, #0x7
    2bbc:      	b.lo	0x2be4 <.text+0x1be4>
    2bc0:      	adrp	x1, 0x9000 <.text+0x8000>
    2bc4:      	adrp	x2, 0x9000 <.text+0x8000>
    2bc8:      	add	x1, x1, #0x2d9
    2bcc:      	add	x2, x2, #0x30a
    2bd0:      	orr	w0, wzr, #0x80000000
    2bd4:      	mov	w3, w19
    2bd8:      	bl	0x18bc <.text+0x8bc>
    2bdc:      	mov	x20, #-0x7ffffffffffffffd // =-9223372036854775805
    2be0:      	b	0x2c80 <.text+0x1c80>
    2be4:      	add	x1, sp, #0xc
    2be8:      	mov	w0, w19
    2bec:      	bl	0x2834 <.text+0x1834>
    2bf0:      	mov	x20, x0
    2bf4:      	tbnz	x20, #0x3f, 0x2c24 <.text+0x1c24>
    2bf8:      	ldr	w9, [sp, #0xc]
    2bfc:      	cbz	w9, 0x2c40 <.text+0x1c40>
    2c00:      	adrp	x1, 0x9000 <.text+0x8000>
    2c04:      	adrp	x2, 0x9000 <.text+0x8000>
    2c08:      	add	x1, x1, #0x18
    2c0c:      	add	x2, x2, #0x30a
    2c10:      	orr	w0, wzr, #0x80000000
    2c14:      	bl	0x18bc <.text+0x8bc>
    2c18:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    2c1c:      	movk	x20, #0x2
    2c20:      	b	0x2c80 <.text+0x1c80>
    2c24:      	adrp	x1, 0x9000 <.text+0x8000>
    2c28:      	adrp	x2, 0x9000 <.text+0x8000>
    2c2c:      	add	x1, x1, #0x313
    2c30:      	add	x2, x2, #0x30a
    2c34:      	orr	w0, wzr, #0x80000000
    2c38:      	bl	0x18bc <.text+0x8bc>
    2c3c:      	b	0x2c80 <.text+0x1c80>
    2c40:      	adrp	x8, 0xc000
    2c44:      	add	x8, x8, #0x218
    2c48:      	ldr	x0, [x8, #0x18]
    2c4c:      	ldr	x8, [x0, #0x30]
    2c50:      	cbz	x8, 0x2c94 <.text+0x1c94>
    2c54:      	blr	x8
    2c58:      	mov	x20, x0
    2c5c:      	tbz	x20, #0x3f, 0x2c80 <.text+0x1c80>
    2c60:      	adrp	x1, 0x9000 <.text+0x8000>
    2c64:      	adrp	x2, 0x9000 <.text+0x8000>
    2c68:      	add	x1, x1, #0x373
    2c6c:      	add	x2, x2, #0x30a
    2c70:      	orr	w0, wzr, #0x80000000
    2c74:      	mov	w3, w19
    2c78:      	mov	x4, x20
    2c7c:      	bl	0x18bc <.text+0x8bc>
    2c80:      	mov	x0, x20
    2c84:      	sub	sp, x29, #0x10
    2c88:      	ldp	x29, x30, [sp, #0x10]
    2c8c:      	ldp	x20, x19, [sp], #0x20
    2c90:      	ret
    2c94:      	adrp	x1, 0x9000 <.text+0x8000>
    2c98:      	adrp	x2, 0x9000 <.text+0x8000>
    2c9c:      	mov	w20, #0x12f             // =303
    2ca0:      	add	x1, x1, #0x348
    2ca4:      	add	x2, x2, #0xc9
    2ca8:      	orr	w0, wzr, #0x80000000
    2cac:      	mov	w3, w20
    2cb0:      	bl	0x18bc <.text+0x8bc>
    2cb4:      	adrp	x0, 0x9000 <.text+0x8000>
    2cb8:      	adrp	x2, 0x8000 <.text+0x7000>
    2cbc:      	add	x0, x0, #0x140
    2cc0:      	add	x2, x2, #0xe32
    2cc4:      	mov	x1, x20
    2cc8:      	bl	0x1c48 <.text+0xc48>
    2ccc:      	b	0x2ccc <.text+0x1ccc>
    2cd0:      	stp	x20, x19, [sp, #-0x20]!
    2cd4:      	stp	x29, x30, [sp, #0x10]
    2cd8:      	add	x29, sp, #0x10
    2cdc:      	mov	w8, w1
    2ce0:      	mov	w9, w8
    2ce4:      	mov	w10, #0xd0              // =208
    2ce8:      	cbz	w8, 0x2d14 <.text+0x1d14>
    2cec:      	adrp	x1, 0x9000 <.text+0x8000>
    2cf0:      	adrp	x2, 0x9000 <.text+0x8000>
    2cf4:      	add	x1, x1, #0x3aa
    2cf8:      	add	x2, x2, #0x3d9
    2cfc:      	orr	w0, wzr, #0x80000000
    2d00:      	mov	w3, w8
    2d04:      	bl	0x18bc <.text+0x8bc>
    2d08:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    2d0c:      	movk	x19, #0x2
    2d10:      	b	0x2d54 <.text+0x1d54>
    2d14:      	adrp	x8, 0xc000
    2d18:      	add	x8, x8, #0x218
    2d1c:      	madd	x8, x9, x10, x8
    2d20:      	ldr	x0, [x8, #0x18]
    2d24:      	ldr	x11, [x0, #0x38]
    2d28:      	blr	x11
    2d2c:      	mov	x19, x0
    2d30:      	tbz	x19, #0x3f, 0x2d54 <.text+0x1d54>
    2d34:      	adrp	x1, 0x9000 <.text+0x8000>
    2d38:      	adrp	x2, 0x9000 <.text+0x8000>
    2d3c:      	add	x1, x1, #0x3e2
    2d40:      	add	x2, x2, #0x3d9
    2d44:      	orr	w0, wzr, #0x80000000
    2d48:      	mov	w3, wzr
    2d4c:      	mov	x4, x19
    2d50:      	bl	0x18bc <.text+0x8bc>
    2d54:      	ldp	x29, x30, [sp, #0x10]
    2d58:      	mov	x0, x19
    2d5c:      	ldp	x20, x19, [sp], #0x20
    2d60:      	ret
    2d64:      	stp	x20, x19, [sp, #-0x20]!
    2d68:      	stp	x29, x30, [sp, #0x10]
    2d6c:      	add	x29, sp, #0x10
    2d70:      	mov	w8, w1
    2d74:      	mov	w9, w8
    2d78:      	mov	w10, #0xd0              // =208
    2d7c:      	cbz	w8, 0x2da8 <.text+0x1da8>
    2d80:      	adrp	x1, 0x9000 <.text+0x8000>
    2d84:      	adrp	x2, 0x9000 <.text+0x8000>
    2d88:      	add	x1, x1, #0x42f
    2d8c:      	add	x2, x2, #0x45d
    2d90:      	orr	w0, wzr, #0x80000000
    2d94:      	mov	w3, w8
    2d98:      	bl	0x18bc <.text+0x8bc>
    2d9c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    2da0:      	movk	x19, #0x2
    2da4:      	b	0x2de8 <.text+0x1de8>
    2da8:      	adrp	x8, 0xc000
    2dac:      	add	x8, x8, #0x218
    2db0:      	madd	x8, x9, x10, x8
    2db4:      	ldr	x0, [x8, #0x18]
    2db8:      	ldr	x11, [x0, #0x40]
    2dbc:      	blr	x11
    2dc0:      	mov	x19, x0
    2dc4:      	tbz	x19, #0x3f, 0x2de8 <.text+0x1de8>
    2dc8:      	adrp	x1, 0x9000 <.text+0x8000>
    2dcc:      	adrp	x2, 0x9000 <.text+0x8000>
    2dd0:      	add	x1, x1, #0x465
    2dd4:      	add	x2, x2, #0x45d
    2dd8:      	orr	w0, wzr, #0x80000000
    2ddc:      	mov	w3, wzr
    2de0:      	mov	x4, x19
    2de4:      	bl	0x18bc <.text+0x8bc>
    2de8:      	ldp	x29, x30, [sp, #0x10]
    2dec:      	mov	x0, x19
    2df0:      	ldp	x20, x19, [sp], #0x20
    2df4:      	ret
    2df8:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    2dfc:      	ret
    2e00:      	cbz	x0, 0x2e14 <.text+0x1e14>
    2e04:      	mov	w9, #0x5                // =5
    2e08:      	mov	x8, xzr
    2e0c:      	str	w9, [x0]
    2e10:      	b	0x2e40 <.text+0x1e40>
    2e14:      	stp	x29, x30, [sp, #-0x10]!
    2e18:      	mov	x29, sp
    2e1c:      	adrp	x1, 0x9000 <.text+0x8000>
    2e20:      	adrp	x2, 0x9000 <.text+0x8000>
    2e24:      	add	x1, x1, #0x4b0
    2e28:      	add	x2, x2, #0x4e0
    2e2c:      	orr	w0, wzr, #0x80000000
    2e30:      	bl	0x18bc <.text+0x8bc>
    2e34:      	mov	x8, #-0x8000000000000000 // =-9223372036854775808
    2e38:      	movk	x8, #0x2
    2e3c:      	ldp	x29, x30, [sp], #0x10
    2e40:      	mov	x0, x8
    2e44:      	ret
    2e48:      	stp	x20, x19, [sp, #-0x20]!
    2e4c:      	stp	x29, x30, [sp, #0x10]
    2e50:      	add	x29, sp, #0x10
    2e54:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    2e58:      	mov	w8, w1
    2e5c:      	movk	x19, #0x2
    2e60:      	cbz	x2, 0x2e90 <.text+0x1e90>
    2e64:      	cbz	w8, 0x2eac <.text+0x1eac>
    2e68:      	orr	w9, wzr, #0x7
    2e6c:      	adrp	x1, 0x9000 <.text+0x8000>
    2e70:      	add	x1, x1, #0x532
    2e74:      	str	w9, [x2]
    2e78:      	adrp	x2, 0x9000 <.text+0x8000>
    2e7c:      	add	x2, x2, #0x521
    2e80:      	orr	w0, wzr, #0x80000000
    2e84:      	mov	w3, w8
    2e88:      	bl	0x18bc <.text+0x8bc>
    2e8c:      	b	0x2eb8 <.text+0x1eb8>
    2e90:      	adrp	x1, 0x9000 <.text+0x8000>
    2e94:      	adrp	x2, 0x9000 <.text+0x8000>
    2e98:      	add	x1, x1, #0x4f1
    2e9c:      	add	x2, x2, #0x521
    2ea0:      	orr	w0, wzr, #0x80000000
    2ea4:      	bl	0x18bc <.text+0x8bc>
    2ea8:      	b	0x2eb8 <.text+0x1eb8>
    2eac:      	mov	w10, #0x5               // =5
    2eb0:      	mov	x19, xzr
    2eb4:      	str	w10, [x2]
    2eb8:      	ldp	x29, x30, [sp, #0x10]
    2ebc:      	mov	x0, x19
    2ec0:      	ldp	x20, x19, [sp], #0x20
    2ec4:      	ret
    2ec8:      	stp	x22, x21, [sp, #-0x30]!
    2ecc:      	stp	x20, x19, [sp, #0x10]
    2ed0:      	stp	x29, x30, [sp, #0x20]
    2ed4:      	add	x29, sp, #0x20
    2ed8:      	sub	sp, sp, #0x40
    2edc:      	adrp	x21, 0xc000
    2ee0:      	add	x21, x21, #0x218
    2ee4:      	ldr	x9, [x21, #0xe0]
    2ee8:      	cbz	x9, 0x2f18 <.text+0x1f18>
    2eec:      	adrp	x9, 0x7000 <.text+0x6000>
    2ef0:      	ldrb	w8, [x9, #0xe27]
    2ef4:      	cbz	w8, 0x2f10 <.text+0x1f10>
    2ef8:      	adrp	x1, 0x9000 <.text+0x8000>
    2efc:      	adrp	x2, 0x9000 <.text+0x8000>
    2f00:      	add	x1, x1, #0x576
    2f04:      	add	x2, x2, #0x59f
    2f08:      	orr	w0, wzr, #0x80000000
    2f0c:      	bl	0x18bc <.text+0x8bc>
    2f10:      	mov	x19, xzr
    2f14:      	b	0x3178 <.text+0x2178>
    2f18:      	add	x19, x21, #0xf8
    2f1c:      	adrp	x1, 0xc000
    2f20:      	add	x1, x1, #0x160
    2f24:      	mov	w2, #0xa0               // =160
    2f28:      	mov	x0, x19
    2f2c:      	bl	0x6f64 <.text+0x5f64>
    2f30:      	movi	v1.2d, #0000000000000000
    2f34:      	orr	w9, wzr, #0x1
    2f38:      	orr	w10, wzr, #0x10000
    2f3c:      	adrp	x20, 0xc000
    2f40:      	str	w9, [x21, #0x180]
    2f44:      	adrp	x1, 0xc000
    2f48:      	str	w10, [x21, #0x184]
    2f4c:      	mov	x3, xzr
    2f50:      	add	x0, x21, #0xe0
    2f54:      	str	q1, [sp, #0x10]
    2f58:      	add	x1, x1, #0xb0
    2f5c:      	ldr	x10, [sp, #0x18]
    2f60:      	mov	x2, x19
    2f64:      	str	x10, [x21, #0xe0]
    2f68:      	ldr	x11, [sp, #0x10]
    2f6c:      	ldr	x10, [x20, #0x520]
    2f70:      	str	x11, [x21, #0xd8]
    2f74:      	ldr	x12, [x10, #0x148]
    2f78:      	blr	x12
    2f7c:      	mov	x19, x0
    2f80:      	tbnz	x19, #0x3f, 0x3044 <.text+0x2044>
    2f84:      	adrp	x1, 0xc000
    2f88:      	add	x0, x21, #0x28
    2f8c:      	add	x1, x1, #0x160
    2f90:      	mov	w2, #0xa0               // =160
    2f94:      	bl	0x6f64 <.text+0x5f64>
    2f98:      	movi	v0.2d, #0000000000000000
    2f9c:      	orr	x13, xzr, #0x1000000000000
    2fa0:      	mov	x0, xzr
    2fa4:      	add	x1, x21, #0x18
    2fa8:      	str	x13, [x21, #0xb0]
    2fac:      	str	q0, [sp]
    2fb0:      	ldr	x14, [sp, #0x8]
    2fb4:      	str	x14, [x21, #0x10]
    2fb8:      	ldr	x15, [sp]
    2fbc:      	str	x15, [x21, #0x8]
    2fc0:      	bl	0x44f4 <.text+0x34f4>
    2fc4:      	ldr	w8, [x21, #0xb0]
    2fc8:      	mov	x19, x0
    2fcc:      	tbnz	x19, #0x3f, 0x3060 <.text+0x2060>
    2fd0:      	add	x1, x21, #0x20
    2fd4:      	mov	x0, x8
    2fd8:      	bl	0x5c70 <.text+0x4c70>
    2fdc:      	mov	x19, x0
    2fe0:      	tbnz	x19, #0x3f, 0x307c <.text+0x207c>
    2fe4:      	adrp	x11, 0xc000
    2fe8:      	ldr	w8, [x11, #0x4d0]
    2fec:      	cmp	w8, #0x1d
    2ff0:      	b.ne	0x3098 <.text+0x2098>
    2ff4:      	ldr	x13, [x21, #0x18]
    2ff8:      	orr	w12, wzr, #0x1
    2ffc:      	orr	w14, wzr, #0x8
    3000:      	orr	w1, wzr, #0x1
    3004:      	mov	w0, wzr
    3008:      	strb	w12, [x21, #0xc8]
    300c:      	str	w12, [x21, #0xcc]
    3010:      	str	w14, [x13]
    3014:      	bl	0x32a4 <.text+0x22a4>
    3018:      	mov	x19, x0
    301c:      	tbz	x19, #0x3f, 0x3178 <.text+0x2178>
    3020:      	adrp	x1, 0x9000 <.text+0x8000>
    3024:      	adrp	x2, 0x9000 <.text+0x8000>
    3028:      	add	x1, x1, #0x64e
    302c:      	add	x2, x2, #0x59f
    3030:      	orr	w0, wzr, #0x80000000
    3034:      	mov	x3, x19
    3038:      	mov	w4, wzr
    303c:      	bl	0x18bc <.text+0x8bc>
    3040:      	b	0x3178 <.text+0x2178>
    3044:      	adrp	x1, 0x9000 <.text+0x8000>
    3048:      	adrp	x2, 0x9000 <.text+0x8000>
    304c:      	add	x1, x1, #0x5ad
    3050:      	add	x2, x2, #0x59f
    3054:      	orr	w0, wzr, #0x80000000
    3058:      	bl	0x18bc <.text+0x8bc>
    305c:      	b	0x3178 <.text+0x2178>
    3060:      	adrp	x1, 0x9000 <.text+0x8000>
    3064:      	adrp	x2, 0x9000 <.text+0x8000>
    3068:      	add	x1, x1, #0x5ef
    306c:      	add	x2, x2, #0x59f
    3070:      	orr	w0, wzr, #0x80000000
    3074:      	mov	w3, w8
    3078:      	b	0x3170 <.text+0x2170>
    307c:      	ldr	w3, [x21, #0xb0]
    3080:      	adrp	x1, 0x9000 <.text+0x8000>
    3084:      	adrp	x2, 0x9000 <.text+0x8000>
    3088:      	add	x1, x1, #0x620
    308c:      	add	x2, x2, #0x59f
    3090:      	orr	w0, wzr, #0x80000000
    3094:      	b	0x3170 <.text+0x2170>
    3098:      	adrp	x12, 0x7000 <.text+0x6000>
    309c:      	ldrb	w13, [x12, #0xe38]
    30a0:      	cbz	w13, 0x30f4 <.text+0x20f4>
    30a4:      	adrp	x22, 0xc000
    30a8:      	add	x0, sp, #0x20
    30ac:      	ldr	x14, [x22, #0x558]
    30b0:      	ldr	x16, [x14, #0x60]
    30b4:      	blr	x16
    30b8:      	tbnz	x0, #0x3f, 0x3108 <.text+0x2108>
    30bc:      	bl	0x7c2c <.text+0x6c2c>
    30c0:      	ldr	x3, [sp, #0x20]
    30c4:      	mov	w5, w0
    30c8:      	sub	x8, x5, x3
    30cc:      	cmp	x8, #0x77
    30d0:      	b.hi	0x311c <.text+0x211c>
    30d4:      	ldr	x16, [x20, #0x520]
    30d8:      	orr	w7, wzr, #0x78
    30dc:      	sub	x19, x7, x8
    30e0:      	mov	w8, #0x3e8              // =1000
    30e4:      	ldr	x4, [x16, #0xf8]
    30e8:      	mul	x0, x19, x8
    30ec:      	blr	x4
    30f0:      	b	0x311c <.text+0x211c>
    30f4:      	orr	w15, wzr, #0x1
    30f8:      	orr	w16, wzr, #0x4
    30fc:      	strb	w15, [x21, #0xc8]
    3100:      	str	w16, [x21, #0xcc]
    3104:      	b	0x320c <.text+0x220c>
    3108:      	ldr	x15, [x20, #0x520]
    310c:      	mov	w0, #0x10000            // =65536
    3110:      	movk	w0, #0xd4c0
    3114:      	ldr	x17, [x15, #0xf8]
    3118:      	blr	x17
    311c:      	ldr	x0, [x21, #0x20]
    3120:      	add	x1, sp, #0x2c
    3124:      	bl	0x608c <.text+0x508c>
    3128:      	mov	x19, x0
    312c:      	tbnz	x19, #0x3f, 0x3158 <.text+0x2158>
    3130:      	ldr	w9, [sp, #0x2c]
    3134:      	cmp	w9, #0x2
    3138:      	b.ne	0x3190 <.text+0x2190>
    313c:      	ldr	x17, [x21, #0x18]
    3140:      	orr	w1, wzr, #0x1
    3144:      	orr	w2, wzr, #0x8
    3148:      	strb	w1, [x21, #0xc8]
    314c:      	str	w1, [x21, #0xcc]
    3150:      	str	w2, [x17]
    3154:      	b	0x31e8 <.text+0x21e8>
    3158:      	adrp	x1, 0x9000 <.text+0x8000>
    315c:      	adrp	x2, 0x9000 <.text+0x8000>
    3160:      	add	x1, x1, #0x685
    3164:      	add	x2, x2, #0x59f
    3168:      	orr	w0, wzr, #0x80000000
    316c:      	mov	w3, wzr
    3170:      	mov	x4, x19
    3174:      	bl	0x18bc <.text+0x8bc>
    3178:      	mov	x0, x19
    317c:      	sub	sp, x29, #0x20
    3180:      	ldp	x29, x30, [sp, #0x20]
    3184:      	ldp	x20, x19, [sp, #0x10]
    3188:      	ldp	x22, x21, [sp], #0x30
    318c:      	ret
    3190:      	adrp	x0, 0xc000
    3194:      	orr	w1, wzr, #0x1
    3198:      	add	x3, sp, #0x30
    319c:      	ldr	x2, [x0, #0x508]
    31a0:      	adrp	x0, 0x9000 <.text+0x8000>
    31a4:      	str	x1, [sp, #0x30]
    31a8:      	adrp	x1, 0xc000
    31ac:      	add	x0, x0, #0xf10
    31b0:      	add	x1, x1, #0x50
    31b4:      	ldr	x9, [x2, #0x48]
    31b8:      	sub	x4, x29, #0x21
    31bc:      	mov	x2, xzr
    31c0:      	blr	x9
    31c4:      	tbnz	x0, #0x3f, 0x31e8 <.text+0x21e8>
    31c8:      	ldurb	w4, [x29, #-0x21]
    31cc:      	cbz	w4, 0x31e8 <.text+0x21e8>
    31d0:      	ldr	x1, [x21, #0x18]
    31d4:      	orr	w5, wzr, #0x1
    31d8:      	orr	w6, wzr, #0x8
    31dc:      	strb	w5, [x21, #0xc8]
    31e0:      	str	w5, [x21, #0xcc]
    31e4:      	str	w6, [x1]
    31e8:      	ldr	x3, [x21, #0x18]
    31ec:      	ldr	w10, [x3]
    31f0:      	cmp	w10, #0x8
    31f4:      	b.ne	0x320c <.text+0x220c>
    31f8:      	ldr	x4, [x22, #0x558]
    31fc:      	orr	w0, wzr, #0x1
    3200:      	mov	w1, wzr
    3204:      	ldr	x2, [x4, #0x20]
    3208:      	blr	x2
    320c:      	ldr	x5, [x20, #0x520]
    3210:      	mov	w0, #-0x80000000        // =-2147483648
    3214:      	adrp	x2, 0x3000 <.text+0x2000>
    3218:      	adrp	x4, 0xc000
    321c:      	mov	x3, xzr
    3220:      	ldr	x10, [x5, #0x50]
    3224:      	movk	w0, #0x200
    3228:      	add	x2, x2, #0x4bc
    322c:      	add	x4, x4, #0x540
    3230:      	orr	w1, wzr, #0x8
    3234:      	blr	x10
    3238:      	mov	x19, x0
    323c:      	tbnz	x19, #0x3f, 0x3284 <.text+0x2284>
    3240:      	ldr	x6, [x20, #0x520]
    3244:      	adrp	x21, 0xc000
    3248:      	ldr	x0, [x21, #0x540]
    324c:      	ldr	x11, [x6, #0x68]
    3250:      	blr	x11
    3254:      	ldr	x7, [x20, #0x520]
    3258:      	mov	w2, #0x4c0000           // =4980736
    325c:      	ldr	x0, [x21, #0x540]
    3260:      	movk	w2, #0x4b40
    3264:      	orr	w1, wzr, #0x1
    3268:      	ldr	x12, [x7, #0x58]
    326c:      	blr	x12
    3270:      	mov	x19, x0
    3274:      	tbz	x19, #0x3f, 0x3178 <.text+0x2178>
    3278:      	adrp	x1, 0x9000 <.text+0x8000>
    327c:      	add	x1, x1, #0x6ec
    3280:      	b	0x328c <.text+0x228c>
    3284:      	adrp	x1, 0x9000 <.text+0x8000>
    3288:      	add	x1, x1, #0x6b6
    328c:      	adrp	x2, 0x9000 <.text+0x8000>
    3290:      	add	x2, x2, #0x59f
    3294:      	orr	w0, wzr, #0x80000000
    3298:      	mov	x3, x19
    329c:      	bl	0x18bc <.text+0x8bc>
    32a0:      	b	0x3178 <.text+0x2178>
    32a4:      	stp	x22, x21, [sp, #-0x30]!
    32a8:      	stp	x20, x19, [sp, #0x10]
    32ac:      	stp	x29, x30, [sp, #0x20]
    32b0:      	add	x29, sp, #0x20
    32b4:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    32b8:      	mov	w8, w1
    32bc:      	mov	w9, w0
    32c0:      	movk	x19, #0x2
    32c4:      	cbnz	w9, 0x32e0 <.text+0x22e0>
    32c8:      	cmp	w8, #0x10, lsl #12      // =0x10000
    32cc:      	b.hs	0x32e0 <.text+0x22e0>
    32d0:      	cmp	w8, #0x8
    32d4:      	b.ne	0x3304 <.text+0x2304>
    32d8:      	orr	w8, wzr, #0x1
    32dc:      	b	0x3320 <.text+0x2320>
    32e0:      	adrp	x1, 0x9000 <.text+0x8000>
    32e4:      	adrp	x2, 0x9000 <.text+0x8000>
    32e8:      	add	x1, x1, #0x898
    32ec:      	add	x2, x2, #0x8dd
    32f0:      	orr	w0, wzr, #0x80000000
    32f4:      	mov	w3, w9
    32f8:      	mov	w4, w8
    32fc:      	bl	0x18bc <.text+0x8bc>
    3300:      	b	0x34a8 <.text+0x24a8>
    3304:      	cmp	w8, #0x10
    3308:      	b.ne	0x3314 <.text+0x2314>
    330c:      	orr	w8, wzr, #0x4
    3310:      	b	0x3320 <.text+0x2320>
    3314:      	cmp	w8, #0x1
    3318:      	ccmp	w8, #0x4, #0x4, ne
    331c:      	b.ne	0x343c <.text+0x243c>
    3320:      	adrp	x20, 0xc000
    3324:      	add	x20, x20, #0x218
    3328:      	ldp	w14, w15, [x20, #0xc8]
    332c:      	ldr	w1, [x20, #0xb4]
    3330:      	tst	w14, #0xff
    3334:      	csel	w21, w8, w15, eq
    3338:      	cmp	w1, w21
    333c:      	b.ne	0x3348 <.text+0x2348>
    3340:      	mov	x19, xzr
    3344:      	b	0x34a8 <.text+0x24a8>
    3348:      	cmp	w1, #0x10, lsl #12      // =0x10000
    334c:      	b.eq	0x3360 <.text+0x2360>
    3350:      	mov	w0, wzr
    3354:      	bl	0x384c <.text+0x284c>
    3358:      	mov	x19, x0
    335c:      	tbnz	x19, #0x3f, 0x345c <.text+0x245c>
    3360:      	cmp	w21, #0x4
    3364:      	stp	wzr, w21, [x20, #0xb0]
    3368:      	b.ne	0x33d4 <.text+0x23d4>
    336c:      	ldr	x0, [x20, #0x10]
    3370:      	cbnz	x0, 0x33a4 <.text+0x23a4>
    3374:      	adrp	x8, 0xc000
    3378:      	adrp	x1, 0xc000
    337c:      	mov	x3, xzr
    3380:      	ldr	x9, [x8, #0x520]
    3384:      	add	x0, x20, #0x10
    3388:      	add	x2, x20, #0x28
    338c:      	add	x1, x1, #0xb0
    3390:      	ldr	x8, [x9, #0x148]
    3394:      	blr	x8
    3398:      	mov	x19, x0
    339c:      	tbnz	x19, #0x3f, 0x3480 <.text+0x2480>
    33a0:      	ldr	x0, [x20, #0x10]
    33a4:      	adrp	x10, 0xc000
    33a8:      	mov	x1, xzr
    33ac:      	mov	x2, xzr
    33b0:      	ldr	x11, [x10, #0x520]
    33b4:      	orr	w3, wzr, #0x1
    33b8:      	ldr	x9, [x11, #0x108]
    33bc:      	blr	x9
    33c0:      	mov	x19, x0
    33c4:      	tbz	x19, #0x3f, 0x34a8 <.text+0x24a8>
    33c8:      	adrp	x1, 0x9000 <.text+0x8000>
    33cc:      	add	x1, x1, #0x9e8
    33d0:      	b	0x3494 <.text+0x2494>
    33d4:      	ldr	x0, [x20, #0x8]
    33d8:      	cbnz	x0, 0x340c <.text+0x240c>
    33dc:      	adrp	x12, 0xc000
    33e0:      	adrp	x1, 0xc000
    33e4:      	mov	x3, xzr
    33e8:      	ldr	x13, [x12, #0x520]
    33ec:      	add	x0, x20, #0x8
    33f0:      	add	x2, x20, #0x28
    33f4:      	add	x1, x1, #0xb0
    33f8:      	ldr	x10, [x13, #0x148]
    33fc:      	blr	x10
    3400:      	mov	x19, x0
    3404:      	tbnz	x19, #0x3f, 0x348c <.text+0x248c>
    3408:      	ldr	x0, [x20, #0x8]
    340c:      	adrp	x14, 0xc000
    3410:      	mov	x1, xzr
    3414:      	mov	x2, xzr
    3418:      	ldr	x15, [x14, #0x520]
    341c:      	orr	w3, wzr, #0x1
    3420:      	ldr	x11, [x15, #0x108]
    3424:      	blr	x11
    3428:      	mov	x19, x0
    342c:      	tbz	x19, #0x3f, 0x34a8 <.text+0x24a8>
    3430:      	adrp	x1, 0x9000 <.text+0x8000>
    3434:      	add	x1, x1, #0xa86
    3438:      	b	0x3494 <.text+0x2494>
    343c:      	adrp	x1, 0x9000 <.text+0x8000>
    3440:      	adrp	x2, 0x9000 <.text+0x8000>
    3444:      	add	x1, x1, #0x8f0
    3448:      	add	x2, x2, #0x8dd
    344c:      	orr	w0, wzr, #0x80000000
    3450:      	mov	w3, w8
    3454:      	bl	0x18bc <.text+0x8bc>
    3458:      	b	0x34a8 <.text+0x24a8>
    345c:      	adrp	x1, 0x9000 <.text+0x8000>
    3460:      	adrp	x2, 0x9000 <.text+0x8000>
    3464:      	add	x1, x1, #0x93c
    3468:      	add	x2, x2, #0x8dd
    346c:      	orr	w0, wzr, #0x80000000
    3470:      	mov	w3, wzr
    3474:      	mov	x4, x19
    3478:      	bl	0x18bc <.text+0x8bc>
    347c:      	b	0x34a8 <.text+0x24a8>
    3480:      	adrp	x1, 0x9000 <.text+0x8000>
    3484:      	add	x1, x1, #0x993
    3488:      	b	0x3494 <.text+0x2494>
    348c:      	adrp	x1, 0x9000 <.text+0x8000>
    3490:      	add	x1, x1, #0xa37
    3494:      	adrp	x2, 0x9000 <.text+0x8000>
    3498:      	add	x2, x2, #0x8dd
    349c:      	orr	w0, wzr, #0x80000000
    34a0:      	mov	x3, x19
    34a4:      	bl	0x18bc <.text+0x8bc>
    34a8:      	mov	x0, x19
    34ac:      	ldp	x29, x30, [sp, #0x20]
    34b0:      	ldp	x20, x19, [sp, #0x10]
    34b4:      	ldp	x22, x21, [sp], #0x30
    34b8:      	ret
    34bc:      	stp	x24, x23, [sp, #-0x40]!
    34c0:      	stp	x22, x21, [sp, #0x10]
    34c4:      	stp	x20, x19, [sp, #0x20]
    34c8:      	stp	x29, x30, [sp, #0x30]
    34cc:      	add	x29, sp, #0x30
    34d0:      	sub	sp, sp, #0x20
    34d4:      	adrp	x21, 0xc000
    34d8:      	add	x21, x21, #0x218
    34dc:      	add	x1, sp, #0x14
    34e0:      	add	x2, sp, #0x8
    34e4:      	ldr	x0, [x21, #0x20]
    34e8:      	mov	x3, sp
    34ec:      	bl	0x5d18 <.text+0x4d18>
    34f0:      	ldr	w8, [sp, #0x14]
    34f4:      	sub	w11, w8, #0x1
    34f8:      	cmp	w11, #0x1
    34fc:      	b.hi	0x373c <.text+0x273c>
    3500:      	ldr	w22, [sp]
    3504:      	orr	w10, wzr, #0x8
    3508:      	ldr	x20, [x21, #0x18]
    350c:      	cmp	w8, #0x2
    3510:      	str	w10, [sp, #0x18]
    3514:      	b.ne	0x3540 <.text+0x2540>
    3518:      	ldr	x0, [x21, #0x20]
    351c:      	add	x1, sp, #0x1c
    3520:      	bl	0x61b0 <.text+0x51b0>
    3524:      	ldr	w10, [sp, #0x1c]
    3528:      	cmp	w10, #0x1
    352c:      	b.eq	0x3564 <.text+0x2564>
    3530:      	cmp	w10, #0x2
    3534:      	b.ne	0x3564 <.text+0x2564>
    3538:      	orr	w1, wzr, #0x1
    353c:      	b	0x3568 <.text+0x2568>
    3540:      	ldr	w12, [x21, #0xb4]
    3544:      	cmp	w12, #0x4
    3548:      	ccmp	w12, #0x2, #0x4, ne
    354c:      	b.ne	0x373c <.text+0x273c>
    3550:      	ldr	x16, [x20, #0x60]
    3554:      	orr	w1, wzr, #0x1
    3558:      	mov	x0, x20
    355c:      	blr	x16
    3560:      	b	0x373c <.text+0x273c>
    3564:      	mov	w1, wzr
    3568:      	ldr	x9, [x20, #0x48]
    356c:      	mov	x0, x20
    3570:      	blr	x9
    3574:      	mov	x19, x0
    3578:      	tbz	x19, #0x3f, 0x359c <.text+0x259c>
    357c:      	adrp	x1, 0x9000 <.text+0x8000>
    3580:      	adrp	x2, 0x9000 <.text+0x8000>
    3584:      	add	x1, x1, #0xede
    3588:      	add	x2, x2, #0xecd
    358c:      	orr	w0, wzr, #0x80000000
    3590:      	mov	x3, x19
    3594:      	mov	w4, wzr
    3598:      	bl	0x18bc <.text+0x8bc>
    359c:      	adrp	x23, 0x7000 <.text+0x6000>
    35a0:      	cmp	w22, #0x1
    35a4:      	b.ne	0x35b4 <.text+0x25b4>
    35a8:      	add	x1, sp, #0x18
    35ac:      	bl	0x2784 <.text+0x1784>
    35b0:      	mov	x19, x0
    35b4:      	ldr	w9, [x21, #0xb4]
    35b8:      	ldrb	w8, [x23, #0xe39]
    35bc:      	cmp	w9, #0x3
    35c0:      	b.gt	0x35d8 <.text+0x25d8>
    35c4:      	cmp	w9, #0x1
    35c8:      	b.eq	0x3654 <.text+0x2654>
    35cc:      	cmp	w9, #0x2
    35d0:      	b.eq	0x35e8 <.text+0x25e8>
    35d4:      	b	0x3650 <.text+0x2650>
    35d8:      	cmp	w9, #0x10, lsl #12      // =0x10000
    35dc:      	b.eq	0x366c <.text+0x266c>
    35e0:      	cmp	w9, #0x4
    35e4:      	b.ne	0x3650 <.text+0x2650>
    35e8:      	cmp	w22, #0x1
    35ec:      	b.ne	0x366c <.text+0x266c>
    35f0:      	ldr	w4, [sp, #0x18]
    35f4:      	orr	w8, w4, #0x2
    35f8:      	cmp	w8, #0x2
    35fc:      	b.ne	0x366c <.text+0x266c>
    3600:      	ldr	x10, [x20, #0x8]
    3604:      	orr	w1, wzr, #0x1
    3608:      	mov	x0, x20
    360c:      	blr	x10
    3610:      	mov	x8, x0
    3614:      	tbnz	x8, #0x3f, 0x3704 <.text+0x2704>
    3618:      	ldr	x11, [x20, #0x10]
    361c:      	mov	x0, x20
    3620:      	blr	x11
    3624:      	mov	x19, x0
    3628:      	tbz	x19, #0x3f, 0x366c <.text+0x266c>
    362c:      	adrp	x1, 0x9000 <.text+0x8000>
    3630:      	adrp	x2, 0x9000 <.text+0x8000>
    3634:      	add	x1, x1, #0x203
    3638:      	add	x2, x2, #0xe5a
    363c:      	orr	w0, wzr, #0x80000000
    3640:      	mov	w3, wzr
    3644:      	mov	x4, x19
    3648:      	bl	0x18bc <.text+0x8bc>
    364c:      	b	0x3724 <.text+0x2724>
    3650:      	cbnz	w9, 0x366c <.text+0x266c>
    3654:      	cbnz	w8, 0x366c <.text+0x266c>
    3658:      	ldr	x12, [x20, #0x58]
    365c:      	mov	x0, x20
    3660:      	blr	x12
    3664:      	mov	x19, x0
    3668:      	tbnz	x19, #0x3f, 0x36e4 <.text+0x26e4>
    366c:      	adrp	x8, 0x7000 <.text+0x6000>
    3670:      	ldrb	w6, [x8, #0xe27]
    3674:      	cbz	w6, 0x36b8 <.text+0x26b8>
    3678:      	ldr	x13, [x21, #0xc8]
    367c:      	mov	x14, #0x100000001       // =4294967297
    3680:      	and	x9, x13, #0xffffffff000000ff
    3684:      	cmp	x9, x14
    3688:      	b.eq	0x36a4 <.text+0x26a4>
    368c:      	cmp	w22, #0x1
    3690:      	b.ne	0x36b8 <.text+0x26b8>
    3694:      	ldr	w1, [sp, #0x18]
    3698:      	orr	w9, w1, #0x2
    369c:      	cmp	w9, #0x2
    36a0:      	b.ne	0x36b8 <.text+0x26b8>
    36a4:      	orr	w1, wzr, #0x4
    36a8:      	mov	w0, wzr
    36ac:      	bl	0x32a4 <.text+0x22a4>
    36b0:      	mov	x19, x0
    36b4:      	tbnz	x19, #0x3f, 0x36c0 <.text+0x26c0>
    36b8:      	cbnz	x19, 0x3724 <.text+0x2724>
    36bc:      	b	0x373c <.text+0x273c>
    36c0:      	adrp	x1, 0x9000 <.text+0x8000>
    36c4:      	adrp	x2, 0x9000 <.text+0x8000>
    36c8:      	add	x1, x1, #0x64e
    36cc:      	add	x2, x2, #0xe5a
    36d0:      	orr	w0, wzr, #0x80000000
    36d4:      	mov	x3, x19
    36d8:      	mov	w4, wzr
    36dc:      	bl	0x18bc <.text+0x8bc>
    36e0:      	b	0x3724 <.text+0x2724>
    36e4:      	adrp	x1, 0x9000 <.text+0x8000>
    36e8:      	adrp	x2, 0x9000 <.text+0x8000>
    36ec:      	add	x1, x1, #0xe71
    36f0:      	add	x2, x2, #0xe5a
    36f4:      	orr	w0, wzr, #0x80000000
    36f8:      	mov	x3, x19
    36fc:      	bl	0x18bc <.text+0x8bc>
    3700:      	b	0x3724 <.text+0x2724>
    3704:      	adrp	x1, 0x9000 <.text+0x8000>
    3708:      	adrp	x2, 0x9000 <.text+0x8000>
    370c:      	add	x1, x1, #0x17f
    3710:      	add	x2, x2, #0xe5a
    3714:      	orr	w0, wzr, #0x80000000
    3718:      	mov	w3, wzr
    371c:      	mov	x4, x8
    3720:      	bl	0x18bc <.text+0x8bc>
    3724:      	adrp	x1, 0x9000 <.text+0x8000>
    3728:      	adrp	x2, 0x9000 <.text+0x8000>
    372c:      	add	x1, x1, #0xe99
    3730:      	add	x2, x2, #0xe5a
    3734:      	orr	w0, wzr, #0x80000000
    3738:      	bl	0x18bc <.text+0x8bc>
    373c:      	sub	sp, x29, #0x30
    3740:      	ldp	x29, x30, [sp, #0x30]
    3744:      	ldp	x20, x19, [sp, #0x20]
    3748:      	ldp	x22, x21, [sp, #0x10]
    374c:      	ldp	x24, x23, [sp], #0x40
    3750:      	ret
    3754:      	stp	x20, x19, [sp, #-0x20]!
    3758:      	stp	x29, x30, [sp, #0x10]
    375c:      	add	x29, sp, #0x10
    3760:      	sub	sp, sp, #0x10
    3764:      	adrp	x19, 0xc000
    3768:      	ldr	x0, [x19, #0x540]
    376c:      	cbz	x0, 0x3784 <.text+0x2784>
    3770:      	adrp	x8, 0xc000
    3774:      	ldr	x9, [x8, #0x520]
    3778:      	ldr	x8, [x9, #0x70]
    377c:      	blr	x8
    3780:      	str	xzr, [x19, #0x540]
    3784:      	adrp	x19, 0xc000
    3788:      	add	x19, x19, #0x218
    378c:      	adrp	x10, 0x7000 <.text+0x6000>
    3790:      	ldr	x0, [x19, #0x18]
    3794:      	ldrb	w8, [x10, #0xe38]
    3798:      	cbz	w8, 0x37bc <.text+0x27bc>
    379c:      	ldr	x10, [x19, #0xc8]
    37a0:      	mov	x12, #0x100000001       // =4294967297
    37a4:      	and	x11, x10, #0xffffffff000000ff
    37a8:      	cmp	x11, x12
    37ac:      	b.eq	0x37c8 <.text+0x27c8>
    37b0:      	ldr	x13, [x0, #0x68]
    37b4:      	blr	x13
    37b8:      	b	0x37c8 <.text+0x27c8>
    37bc:      	ldr	x9, [x0, #0x60]
    37c0:      	orr	w1, wzr, #0x1
    37c4:      	blr	x9
    37c8:      	ldr	x0, [x19, #0x18]
    37cc:      	bl	0x5230 <.text+0x4230>
    37d0:      	ldr	x0, [x19, #0x20]
    37d4:      	bl	0x5cfc <.text+0x4cfc>
    37d8:      	adrp	x12, 0xc000
    37dc:      	orr	w14, wzr, #0x1
    37e0:      	adrp	x0, 0x9000 <.text+0x8000>
    37e4:      	ldr	x13, [x12, #0x508]
    37e8:      	adrp	x1, 0xc000
    37ec:      	str	x14, [sp]
    37f0:      	add	x0, x0, #0xf36
    37f4:      	add	x1, x1, #0x50
    37f8:      	mov	x3, sp
    37fc:      	ldr	x15, [x13, #0x48]
    3800:      	add	x4, sp, #0xf
    3804:      	mov	x2, xzr
    3808:      	blr	x15
    380c:      	tbnz	x0, #0x3f, 0x3838 <.text+0x2838>
    3810:      	ldrb	w9, [sp, #0xf]
    3814:      	cbz	w9, 0x3838 <.text+0x2838>
    3818:      	bl	0x78ac <.text+0x68ac>
    381c:      	adrp	x14, 0xc000
    3820:      	mov	w0, #0x1388             // =5000
    3824:      	ldr	x15, [x14, #0x520]
    3828:      	ldr	x16, [x15, #0xf8]
    382c:      	blr	x16
    3830:      	orr	w0, wzr, #0x2
    3834:      	bl	0x78f0 <.text+0x68f0>
    3838:      	mov	x0, xzr
    383c:      	sub	sp, x29, #0x10
    3840:      	ldp	x29, x30, [sp, #0x10]
    3844:      	ldp	x20, x19, [sp], #0x20
    3848:      	ret
    384c:      	stp	x20, x19, [sp, #-0x20]!
    3850:      	stp	x29, x30, [sp, #0x10]
    3854:      	add	x29, sp, #0x10
    3858:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    385c:      	mov	w8, w1
    3860:      	mov	w9, w0
    3864:      	movk	x19, #0x2
    3868:      	cbnz	w9, 0x3884 <.text+0x2884>
    386c:      	cmp	w8, #0x10, lsl #12      // =0x10000
    3870:      	b.hs	0x3884 <.text+0x2884>
    3874:      	cmp	w8, #0x8
    3878:      	b.ne	0x38a8 <.text+0x28a8>
    387c:      	orr	w8, wzr, #0x1
    3880:      	b	0x38b4 <.text+0x28b4>
    3884:      	adrp	x1, 0x9000 <.text+0x8000>
    3888:      	adrp	x2, 0x9000 <.text+0x8000>
    388c:      	add	x1, x1, #0x732
    3890:      	add	x2, x2, #0x776
    3894:      	orr	w0, wzr, #0x80000000
    3898:      	mov	w3, w9
    389c:      	mov	w4, w8
    38a0:      	bl	0x18bc <.text+0x8bc>
    38a4:      	b	0x3a2c <.text+0x2a2c>
    38a8:      	cmp	w8, #0x10
    38ac:      	b.ne	0x38b4 <.text+0x28b4>
    38b0:      	orr	w8, wzr, #0x4
    38b4:      	adrp	x20, 0xc000
    38b8:      	add	x20, x20, #0x218
    38bc:      	ldp	w13, w14, [x20, #0xc8]
    38c0:      	tst	w13, #0xff
    38c4:      	csel	w9, w8, w14, eq
    38c8:      	cmp	w9, #0x1
    38cc:      	ccmp	w9, #0x4, #0x4, ne
    38d0:      	b.ne	0x3918 <.text+0x2918>
    38d4:      	ldr	w4, [x20, #0xb4]
    38d8:      	cmp	w4, w9
    38dc:      	b.ne	0x3938 <.text+0x2938>
    38e0:      	cmp	w9, #0x4
    38e4:      	b.ne	0x3960 <.text+0x2960>
    38e8:      	ldr	x0, [x20, #0x10]
    38ec:      	cbz	x0, 0x3998 <.text+0x2998>
    38f0:      	adrp	x8, 0xc000
    38f4:      	mov	x1, xzr
    38f8:      	mov	x2, xzr
    38fc:      	ldr	x9, [x8, #0x520]
    3900:      	ldr	x8, [x9, #0x110]
    3904:      	blr	x8
    3908:      	mov	x19, x0
    390c:      	tbnz	x19, #0x3f, 0x3a04 <.text+0x2a04>
    3910:      	str	xzr, [x20, #0x10]
    3914:      	b	0x398c <.text+0x298c>
    3918:      	adrp	x1, 0x9000 <.text+0x8000>
    391c:      	adrp	x2, 0x9000 <.text+0x8000>
    3920:      	add	x1, x1, #0x788
    3924:      	add	x2, x2, #0x776
    3928:      	orr	w0, wzr, #0x80000000
    392c:      	mov	w3, w9
    3930:      	bl	0x18bc <.text+0x8bc>
    3934:      	b	0x3a2c <.text+0x2a2c>
    3938:      	adrp	x1, 0x9000 <.text+0x8000>
    393c:      	adrp	x2, 0x9000 <.text+0x8000>
    3940:      	add	x1, x1, #0x7a9
    3944:      	add	x2, x2, #0x776
    3948:      	orr	w0, wzr, #0x80000000
    394c:      	mov	w3, wzr
    3950:      	mov	w5, w9
    3954:      	bl	0x18bc <.text+0x8bc>
    3958:      	add	x19, x19, #0x11
    395c:      	b	0x3a2c <.text+0x2a2c>
    3960:      	ldr	x0, [x20, #0x8]
    3964:      	cbz	x0, 0x39bc <.text+0x29bc>
    3968:      	adrp	x10, 0xc000
    396c:      	mov	x1, xzr
    3970:      	mov	x2, xzr
    3974:      	ldr	x11, [x10, #0x520]
    3978:      	ldr	x9, [x11, #0x110]
    397c:      	blr	x9
    3980:      	mov	x19, x0
    3984:      	tbnz	x19, #0x3f, 0x3a10 <.text+0x2a10>
    3988:      	str	xzr, [x20, #0x8]
    398c:      	orr	w0, wzr, #0x10000
    3990:      	str	w0, [x20, #0xb4]
    3994:      	b	0x3a2c <.text+0x2a2c>
    3998:      	adrp	x1, 0x7000 <.text+0x6000>
    399c:      	add	x1, x1, #0xdc8
    39a0:      	orr	w0, wzr, #0x80000000
    39a4:      	mov	x2, x19
    39a8:      	bl	0x18bc <.text+0x8bc>
    39ac:      	adrp	x0, 0x9000 <.text+0x8000>
    39b0:      	add	x0, x0, #0x140
    39b4:      	mov	w1, #0x315              // =789
    39b8:      	b	0x39dc <.text+0x29dc>
    39bc:      	adrp	x1, 0x7000 <.text+0x6000>
    39c0:      	add	x1, x1, #0xdc8
    39c4:      	orr	w0, wzr, #0x80000000
    39c8:      	mov	x2, x19
    39cc:      	bl	0x18bc <.text+0x8bc>
    39d0:      	adrp	x0, 0x9000 <.text+0x8000>
    39d4:      	add	x0, x0, #0x140
    39d8:      	mov	w1, #0x31c              // =796
    39dc:      	adrp	x2, 0x7000 <.text+0x6000>
    39e0:      	add	x2, x2, #0xdfc
    39e4:      	bl	0x1c48 <.text+0xc48>
    39e8:      	adrp	x1, 0x7000 <.text+0x6000>
    39ec:      	adrp	x2, 0x9000 <.text+0x8000>
    39f0:      	add	x1, x1, #0xf1e
    39f4:      	add	x2, x2, #0x776
    39f8:      	orr	w0, wzr, #0x80000000
    39fc:      	bl	0x18bc <.text+0x8bc>
    3a00:      	b	0x3a2c <.text+0x2a2c>
    3a04:      	adrp	x1, 0x9000 <.text+0x8000>
    3a08:      	add	x1, x1, #0x7fa
    3a0c:      	b	0x3a18 <.text+0x2a18>
    3a10:      	adrp	x1, 0x9000 <.text+0x8000>
    3a14:      	add	x1, x1, #0x84c
    3a18:      	adrp	x2, 0x9000 <.text+0x8000>
    3a1c:      	add	x2, x2, #0x776
    3a20:      	orr	w0, wzr, #0x80000000
    3a24:      	mov	x3, x19
    3a28:      	bl	0x18bc <.text+0x8bc>
    3a2c:      	ldp	x29, x30, [sp, #0x10]
    3a30:      	mov	x0, x19
    3a34:      	ldp	x20, x19, [sp], #0x20
    3a38:      	ret
    3a3c:      	stp	x20, x19, [sp, #-0x20]!
    3a40:      	stp	x29, x30, [sp, #0x10]
    3a44:      	add	x29, sp, #0x10
    3a48:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    3a4c:      	mov	w8, w0
    3a50:      	movk	x19, #0x2
    3a54:      	cbz	w8, 0x3a78 <.text+0x2a78>
    3a58:      	adrp	x1, 0x9000 <.text+0x8000>
    3a5c:      	adrp	x2, 0x9000 <.text+0x8000>
    3a60:      	add	x1, x1, #0xacf
    3a64:      	add	x2, x2, #0xb08
    3a68:      	orr	w0, wzr, #0x80000000
    3a6c:      	mov	w3, w8
    3a70:      	bl	0x18bc <.text+0x8bc>
    3a74:      	b	0x3b2c <.text+0x2b2c>
    3a78:      	adrp	x8, 0xc000
    3a7c:      	add	x8, x8, #0x160
    3a80:      	ldr	w8, [x8, #0x8c]
    3a84:      	cmp	w8, #0x4
    3a88:      	b.eq	0x3ab4 <.text+0x2ab4>
    3a8c:      	cmp	w8, #0x10, lsl #12      // =0x10000
    3a90:      	b.ne	0x3ae8 <.text+0x2ae8>
    3a94:      	adrp	x1, 0x9000 <.text+0x8000>
    3a98:      	adrp	x2, 0x9000 <.text+0x8000>
    3a9c:      	add	x1, x1, #0xb20
    3aa0:      	add	x2, x2, #0xb08
    3aa4:      	orr	w0, wzr, #0x80000000
    3aa8:      	bl	0x18bc <.text+0x8bc>
    3aac:      	add	x19, x19, #0x4
    3ab0:      	b	0x3b2c <.text+0x2b2c>
    3ab4:      	orr	w1, wzr, #0x4
    3ab8:      	mov	w0, wzr
    3abc:      	bl	0x384c <.text+0x284c>
    3ac0:      	mov	x19, x0
    3ac4:      	tbnz	x19, #0x3f, 0x3b0c <.text+0x2b0c>
    3ac8:      	orr	w1, wzr, #0x1
    3acc:      	mov	w0, wzr
    3ad0:      	bl	0x32a4 <.text+0x22a4>
    3ad4:      	mov	x19, x0
    3ad8:      	tbz	x19, #0x3f, 0x3b2c <.text+0x2b2c>
    3adc:      	adrp	x1, 0x9000 <.text+0x8000>
    3ae0:      	add	x1, x1, #0xc02
    3ae4:      	b	0x3b14 <.text+0x2b14>
    3ae8:      	adrp	x1, 0x9000 <.text+0x8000>
    3aec:      	adrp	x2, 0x9000 <.text+0x8000>
    3af0:      	add	x1, x1, #0xb63
    3af4:      	add	x2, x2, #0xb08
    3af8:      	orr	w0, wzr, #0x80000000
    3afc:      	mov	w3, wzr
    3b00:      	bl	0x18bc <.text+0x8bc>
    3b04:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    3b08:      	b	0x3b2c <.text+0x2b2c>
    3b0c:      	adrp	x1, 0x9000 <.text+0x8000>
    3b10:      	add	x1, x1, #0xba7
    3b14:      	adrp	x2, 0x9000 <.text+0x8000>
    3b18:      	add	x2, x2, #0xb08
    3b1c:      	orr	w0, wzr, #0x80000000
    3b20:      	mov	w3, wzr
    3b24:      	mov	x4, x19
    3b28:      	bl	0x18bc <.text+0x8bc>
    3b2c:      	ldp	x29, x30, [sp, #0x10]
    3b30:      	mov	x0, x19
    3b34:      	ldp	x20, x19, [sp], #0x20
    3b38:      	ret
    3b3c:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    3b40:      	ret
    3b44:      	cbz	x0, 0x3b58 <.text+0x2b58>
    3b48:      	orr	w9, wzr, #0x1
    3b4c:      	mov	x8, xzr
    3b50:      	strb	w9, [x0]
    3b54:      	b	0x3b84 <.text+0x2b84>
    3b58:      	stp	x29, x30, [sp, #-0x10]!
    3b5c:      	mov	x29, sp
    3b60:      	adrp	x1, 0x7000 <.text+0x6000>
    3b64:      	adrp	x2, 0x9000 <.text+0x8000>
    3b68:      	add	x1, x1, #0xf1e
    3b6c:      	add	x2, x2, #0xc5e
    3b70:      	orr	w0, wzr, #0x80000000
    3b74:      	bl	0x18bc <.text+0x8bc>
    3b78:      	mov	x8, #-0x8000000000000000 // =-9223372036854775808
    3b7c:      	movk	x8, #0x2
    3b80:      	ldp	x29, x30, [sp], #0x10
    3b84:      	mov	x0, x8
    3b88:      	ret
    3b8c:      	cbnz	w0, 0x3ba4 <.text+0x2ba4>
    3b90:      	cbz	x1, 0x3ba4 <.text+0x2ba4>
    3b94:      	orr	w8, wzr, #0x18
    3b98:      	mov	x0, xzr
    3b9c:      	str	w8, [x1]
    3ba0:      	ret
    3ba4:      	stp	x29, x30, [sp, #-0x10]!
    3ba8:      	mov	x29, sp
    3bac:      	adrp	x1, 0x7000 <.text+0x6000>
    3bb0:      	adrp	x2, 0x9000 <.text+0x8000>
    3bb4:      	add	x1, x1, #0xf1e
    3bb8:      	add	x2, x2, #0xc77
    3bbc:      	orr	w0, wzr, #0x80000000
    3bc0:      	bl	0x18bc <.text+0x8bc>
    3bc4:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    3bc8:      	movk	x0, #0x2
    3bcc:      	ldp	x29, x30, [sp], #0x10
    3bd0:      	ret
    3bd4:      	stp	x22, x21, [sp, #-0x30]!
    3bd8:      	stp	x20, x19, [sp, #0x10]
    3bdc:      	stp	x29, x30, [sp, #0x20]
    3be0:      	add	x29, sp, #0x20
    3be4:      	sub	sp, sp, #0x10
    3be8:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    3bec:      	mov	x20, x1
    3bf0:      	mov	w8, w0
    3bf4:      	movk	x19, #0x2
    3bf8:      	cmp	w8, #0x5
    3bfc:      	b.ne	0x3c3c <.text+0x2c3c>
    3c00:      	cbz	x20, 0x3c3c <.text+0x2c3c>
    3c04:      	mov	w0, #0x5                // =5
    3c08:      	add	x1, sp, #0x8
    3c0c:      	bl	0x2834 <.text+0x1834>
    3c10:      	mov	x21, x0
    3c14:      	tbnz	x21, #0x3f, 0x3c60 <.text+0x2c60>
    3c18:      	ldr	w8, [sp, #0x8]
    3c1c:      	cbz	w8, 0x3c88 <.text+0x2c88>
    3c20:      	adrp	x1, 0x9000 <.text+0x8000>
    3c24:      	adrp	x2, 0x9000 <.text+0x8000>
    3c28:      	add	x1, x1, #0x18
    3c2c:      	add	x2, x2, #0xcc6
    3c30:      	orr	w0, wzr, #0x80000000
    3c34:      	bl	0x18bc <.text+0x8bc>
    3c38:      	b	0x3cdc <.text+0x2cdc>
    3c3c:      	adrp	x1, 0x9000 <.text+0x8000>
    3c40:      	adrp	x2, 0x9000 <.text+0x8000>
    3c44:      	add	x1, x1, #0xc94
    3c48:      	add	x2, x2, #0xcc6
    3c4c:      	orr	w0, wzr, #0x80000000
    3c50:      	mov	w3, w8
    3c54:      	mov	x4, x20
    3c58:      	bl	0x18bc <.text+0x8bc>
    3c5c:      	b	0x3cdc <.text+0x2cdc>
    3c60:      	adrp	x1, 0x9000 <.text+0x8000>
    3c64:      	adrp	x2, 0x9000 <.text+0x8000>
    3c68:      	add	x1, x1, #0xcd9
    3c6c:      	add	x2, x2, #0xcc6
    3c70:      	mov	w3, #0x5                // =5
    3c74:      	orr	w0, wzr, #0x80000000
    3c78:      	mov	x4, x21
    3c7c:      	bl	0x18bc <.text+0x8bc>
    3c80:      	mov	x19, x21
    3c84:      	b	0x3cdc <.text+0x2cdc>
    3c88:      	adrp	x8, 0xc000
    3c8c:      	add	x8, x8, #0x218
    3c90:      	add	x1, sp, #0xc
    3c94:      	ldr	x0, [x8, #0x20]
    3c98:      	bl	0x5ff0 <.text+0x4ff0>
    3c9c:      	mov	x19, x0
    3ca0:      	tbnz	x19, #0x3f, 0x3cbc <.text+0x2cbc>
    3ca4:      	ldr	w9, [sp, #0xc]
    3ca8:      	sub	w10, w9, #0x1
    3cac:      	cmp	w10, #0x2
    3cb0:      	cset	w11, lo
    3cb4:      	strb	w11, [x20]
    3cb8:      	b	0x3cdc <.text+0x2cdc>
    3cbc:      	ldr	w3, [sp, #0x8]
    3cc0:      	adrp	x1, 0x9000 <.text+0x8000>
    3cc4:      	adrp	x2, 0x9000 <.text+0x8000>
    3cc8:      	add	x1, x1, #0x685
    3ccc:      	add	x2, x2, #0xcc6
    3cd0:      	orr	w0, wzr, #0x80000000
    3cd4:      	mov	x4, x19
    3cd8:      	bl	0x18bc <.text+0x8bc>
    3cdc:      	mov	x0, x19
    3ce0:      	sub	sp, x29, #0x20
    3ce4:      	ldp	x29, x30, [sp, #0x20]
    3ce8:      	ldp	x20, x19, [sp, #0x10]
    3cec:      	ldp	x22, x21, [sp], #0x30
    3cf0:      	ret
    3cf4:      	stp	x20, x19, [sp, #-0x20]!
    3cf8:      	stp	x29, x30, [sp, #0x10]
    3cfc:      	add	x29, sp, #0x10
    3d00:      	adrp	x8, 0xc000
    3d04:      	ldr	w9, [x8, #0x4d0]
    3d08:      	mov	w8, w0
    3d0c:      	cmp	w9, #0x1d
    3d10:      	b.ne	0x3d1c <.text+0x2d1c>
    3d14:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    3d18:      	b	0x3d44 <.text+0x2d44>
    3d1c:      	cbz	w8, 0x3d54 <.text+0x2d54>
    3d20:      	adrp	x1, 0x9000 <.text+0x8000>
    3d24:      	adrp	x2, 0x9000 <.text+0x8000>
    3d28:      	add	x1, x1, #0xd09
    3d2c:      	add	x2, x2, #0xd42
    3d30:      	orr	w0, wzr, #0x80000000
    3d34:      	mov	w3, w8
    3d38:      	bl	0x18bc <.text+0x8bc>
    3d3c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    3d40:      	movk	x19, #0x2
    3d44:      	ldp	x29, x30, [sp, #0x10]
    3d48:      	mov	x0, x19
    3d4c:      	ldp	x20, x19, [sp], #0x20
    3d50:      	ret
    3d54:      	adrp	x9, 0xc000
    3d58:      	add	x9, x9, #0x218
    3d5c:      	ldr	x0, [x9, #0x18]
    3d60:      	cbz	x0, 0x3d9c <.text+0x2d9c>
    3d64:      	ldr	x8, [x0, #0x20]
    3d68:      	cbz	x8, 0x3dd8 <.text+0x2dd8>
    3d6c:      	blr	x8
    3d70:      	mov	x19, x0
    3d74:      	tbz	x19, #0x3f, 0x3d44 <.text+0x2d44>
    3d78:      	adrp	x1, 0x9000 <.text+0x8000>
    3d7c:      	adrp	x2, 0x9000 <.text+0x8000>
    3d80:      	add	x1, x1, #0xd85
    3d84:      	add	x2, x2, #0xd42
    3d88:      	orr	w0, wzr, #0x80000000
    3d8c:      	mov	w3, wzr
    3d90:      	mov	x4, x19
    3d94:      	bl	0x18bc <.text+0x8bc>
    3d98:      	b	0x3d44 <.text+0x2d44>
    3d9c:      	adrp	x1, 0x9000 <.text+0x8000>
    3da0:      	adrp	x2, 0x9000 <.text+0x8000>
    3da4:      	mov	w19, #0x566             // =1382
    3da8:      	add	x1, x1, #0xa5
    3dac:      	add	x2, x2, #0xc9
    3db0:      	orr	w0, wzr, #0x80000000
    3db4:      	mov	w3, w19
    3db8:      	bl	0x18bc <.text+0x8bc>
    3dbc:      	adrp	x0, 0x9000 <.text+0x8000>
    3dc0:      	adrp	x2, 0x8000 <.text+0x7000>
    3dc4:      	add	x0, x0, #0x140
    3dc8:      	add	x2, x2, #0xe32
    3dcc:      	mov	x1, x19
    3dd0:      	bl	0x1c48 <.text+0xc48>
    3dd4:      	b	0x3dd4 <.text+0x2dd4>
    3dd8:      	adrp	x1, 0x9000 <.text+0x8000>
    3ddc:      	adrp	x2, 0x9000 <.text+0x8000>
    3de0:      	mov	w19, #0x569             // =1385
    3de4:      	add	x1, x1, #0xd52
    3de8:      	add	x2, x2, #0xc9
    3dec:      	orr	w0, wzr, #0x80000000
    3df0:      	mov	w3, w19
    3df4:      	bl	0x18bc <.text+0x8bc>
    3df8:      	adrp	x0, 0x9000 <.text+0x8000>
    3dfc:      	adrp	x2, 0x8000 <.text+0x7000>
    3e00:      	add	x0, x0, #0x140
    3e04:      	add	x2, x2, #0xe32
    3e08:      	mov	x1, x19
    3e0c:      	bl	0x1c48 <.text+0xc48>
    3e10:      	b	0x3e10 <.text+0x2e10>
    3e14:      	stp	x20, x19, [sp, #-0x20]!
    3e18:      	stp	x29, x30, [sp, #0x10]
    3e1c:      	add	x29, sp, #0x10
    3e20:      	adrp	x8, 0xc000
    3e24:      	ldr	w9, [x8, #0x4d0]
    3e28:      	mov	w8, w0
    3e2c:      	cmp	w9, #0x1d
    3e30:      	b.ne	0x3e3c <.text+0x2e3c>
    3e34:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    3e38:      	b	0x3e64 <.text+0x2e64>
    3e3c:      	cbz	w8, 0x3e74 <.text+0x2e74>
    3e40:      	adrp	x1, 0x9000 <.text+0x8000>
    3e44:      	adrp	x2, 0x9000 <.text+0x8000>
    3e48:      	add	x1, x1, #0x68
    3e4c:      	add	x2, x2, #0xdd2
    3e50:      	orr	w0, wzr, #0x80000000
    3e54:      	mov	w3, w8
    3e58:      	bl	0x18bc <.text+0x8bc>
    3e5c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    3e60:      	movk	x19, #0x2
    3e64:      	ldp	x29, x30, [sp, #0x10]
    3e68:      	mov	x0, x19
    3e6c:      	ldp	x20, x19, [sp], #0x20
    3e70:      	ret
    3e74:      	adrp	x9, 0xc000
    3e78:      	add	x9, x9, #0x218
    3e7c:      	ldr	x0, [x9, #0x18]
    3e80:      	cbz	x0, 0x3ebc <.text+0x2ebc>
    3e84:      	ldr	x8, [x0, #0x28]
    3e88:      	cbz	x8, 0x3ef8 <.text+0x2ef8>
    3e8c:      	blr	x8
    3e90:      	mov	x19, x0
    3e94:      	tbz	x19, #0x3f, 0x3e64 <.text+0x2e64>
    3e98:      	adrp	x1, 0x9000 <.text+0x8000>
    3e9c:      	adrp	x2, 0x9000 <.text+0x8000>
    3ea0:      	add	x1, x1, #0xe10
    3ea4:      	add	x2, x2, #0xdd2
    3ea8:      	orr	w0, wzr, #0x80000000
    3eac:      	mov	w3, wzr
    3eb0:      	mov	x4, x19
    3eb4:      	bl	0x18bc <.text+0x8bc>
    3eb8:      	b	0x3e64 <.text+0x2e64>
    3ebc:      	adrp	x1, 0x9000 <.text+0x8000>
    3ec0:      	adrp	x2, 0x9000 <.text+0x8000>
    3ec4:      	mov	w19, #0x59b             // =1435
    3ec8:      	add	x1, x1, #0xa5
    3ecc:      	add	x2, x2, #0xc9
    3ed0:      	orr	w0, wzr, #0x80000000
    3ed4:      	mov	w3, w19
    3ed8:      	bl	0x18bc <.text+0x8bc>
    3edc:      	adrp	x0, 0x9000 <.text+0x8000>
    3ee0:      	adrp	x2, 0x8000 <.text+0x7000>
    3ee4:      	add	x0, x0, #0x140
    3ee8:      	add	x2, x2, #0xe32
    3eec:      	mov	x1, x19
    3ef0:      	bl	0x1c48 <.text+0xc48>
    3ef4:      	b	0x3ef4 <.text+0x2ef4>
    3ef8:      	adrp	x1, 0x9000 <.text+0x8000>
    3efc:      	adrp	x2, 0x9000 <.text+0x8000>
    3f00:      	mov	w19, #0x59e             // =1438
    3f04:      	add	x1, x1, #0xde0
    3f08:      	add	x2, x2, #0xc9
    3f0c:      	orr	w0, wzr, #0x80000000
    3f10:      	mov	w3, w19
    3f14:      	bl	0x18bc <.text+0x8bc>
    3f18:      	adrp	x0, 0x9000 <.text+0x8000>
    3f1c:      	adrp	x2, 0x8000 <.text+0x7000>
    3f20:      	add	x0, x0, #0x140
    3f24:      	add	x2, x2, #0xe32
    3f28:      	mov	x1, x19
    3f2c:      	bl	0x1c48 <.text+0xc48>
    3f30:      	b	0x3f30 <.text+0x2f30>
    3f34:      	stp	x20, x19, [sp, #-0x20]!
    3f38:      	stp	x29, x30, [sp, #0x10]
    3f3c:      	add	x29, sp, #0x10
    3f40:      	adrp	x9, 0xc000
    3f44:      	ldr	w8, [x9, #0x4d0]
    3f48:      	cmp	w8, #0x1d
    3f4c:      	b.ne	0x3f60 <.text+0x2f60>
    3f50:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    3f54:      	ldp	x29, x30, [sp, #0x10]
    3f58:      	ldp	x20, x19, [sp], #0x20
    3f5c:      	ret
    3f60:      	adrp	x19, 0xc000
    3f64:      	ldr	x8, [x19, #0x558]
    3f68:      	cbnz	x8, 0x3f98 <.text+0x2f98>
    3f6c:      	adrp	x10, 0xc000
    3f70:      	adrp	x0, 0xc000
    3f74:      	adrp	x2, 0xc000
    3f78:      	ldr	x11, [x10, #0x520]
    3f7c:      	mov	x1, xzr
    3f80:      	add	x0, x0, #0x150
    3f84:      	add	x2, x2, #0x558
    3f88:      	ldr	x8, [x11, #0x140]
    3f8c:      	blr	x8
    3f90:      	tbnz	x0, #0x3f, 0x3fb0 <.text+0x2fb0>
    3f94:      	ldr	x8, [x19, #0x558]
    3f98:      	ldr	x2, [x8, #0x20]
    3f9c:      	orr	w0, wzr, #0x1
    3fa0:      	ldp	x29, x30, [sp, #0x10]
    3fa4:      	orr	w1, wzr, #0x1
    3fa8:      	ldp	x20, x19, [sp], #0x20
    3fac:      	br	x2
    3fb0:      	str	xzr, [x19, #0x558]
    3fb4:      	b	0x3f54 <.text+0x2f54>
    3fb8:      	ldr	w8, [x0, #0x70]
    3fbc:      	cmp	w8, #0x5
    3fc0:      	b.ne	0x4088 <.text+0x3088>
    3fc4:      	stp	x24, x23, [sp, #-0x40]!
    3fc8:      	stp	x22, x21, [sp, #0x10]
    3fcc:      	stp	x20, x19, [sp, #0x20]
    3fd0:      	stp	x29, x30, [sp, #0x30]
    3fd4:      	add	x29, sp, #0x30
    3fd8:      	mov	w19, #0x100000          // =1048576
    3fdc:      	movk	w19, #0xf000
    3fe0:      	orr	w1, wzr, #0x1
    3fe4:      	mov	x0, x19
    3fe8:      	bl	0x7a64 <.text+0x6a64>
    3fec:      	add	x20, x19, #0x3, lsl #12 // =0x3000
    3ff0:      	orr	w1, wzr, #0x1
    3ff4:      	mov	x0, x20
    3ff8:      	bl	0x7a64 <.text+0x6a64>
    3ffc:      	mov	w21, #0x150000          // =1376256
    4000:      	movk	w21, #0x20
    4004:      	orr	w1, wzr, #0x1
    4008:      	mov	x0, x21
    400c:      	bl	0x7a64 <.text+0x6a64>
    4010:      	orr	x22, x21, #0x4
    4014:      	orr	w1, wzr, #0x1
    4018:      	mov	x0, x22
    401c:      	bl	0x7a64 <.text+0x6a64>
    4020:      	adrp	x24, 0xc000
    4024:      	mov	w23, #0x64              // =100
    4028:      	mov	x0, x23
    402c:      	ldr	x8, [x24, #0x520]
    4030:      	ldr	x8, [x8, #0xf8]
    4034:      	blr	x8
    4038:      	orr	w1, wzr, #0xfffffffe
    403c:      	mov	x0, x22
    4040:      	bl	0x7a90 <.text+0x6a90>
    4044:      	orr	w1, wzr, #0xfffffffe
    4048:      	mov	x0, x21
    404c:      	bl	0x7a90 <.text+0x6a90>
    4050:      	orr	w1, wzr, #0xfffffffe
    4054:      	mov	x0, x20
    4058:      	bl	0x7a90 <.text+0x6a90>
    405c:      	orr	w1, wzr, #0xfffffffe
    4060:      	mov	x0, x19
    4064:      	bl	0x7a90 <.text+0x6a90>
    4068:      	ldr	x9, [x24, #0x520]
    406c:      	mov	x0, x23
    4070:      	ldr	x1, [x9, #0xf8]
    4074:      	ldp	x29, x30, [sp, #0x30]
    4078:      	ldp	x20, x19, [sp, #0x20]
    407c:      	ldp	x22, x21, [sp, #0x10]
    4080:      	ldp	x24, x23, [sp], #0x40
    4084:      	br	x1
    4088:      	ret
    408c:      	mov	w8, w3
    4090:      	mov	x9, x1
    4094:      	mov	x10, x0
    4098:      	cbz	x10, 0x40a4 <.text+0x30a4>
    409c:      	cbz	x9, 0x40a4 <.text+0x30a4>
    40a0:      	cbnz	w8, 0x40cc <.text+0x30cc>
    40a4:      	adrp	x1, 0xa000 <.text+0x9000>
    40a8:      	adrp	x2, 0xa000 <.text+0x9000>
    40ac:      	add	x1, x1, #0x1e
    40b0:      	add	x2, x2, #0x68
    40b4:      	orr	w0, wzr, #0x80000000
    40b8:      	mov	x3, x10
    40bc:      	mov	x4, x9
    40c0:      	mov	w5, w8
    40c4:      	b	0x18bc <.text+0x8bc>
    40c8:      	add	w2, w2, #0x1
    40cc:      	cmp	w2, w8
    40d0:      	b.hs	0x40f4 <.text+0x30f4>
    40d4:      	ldr	w11, [x10, w2, uxtw #2]
    40d8:      	mov	w12, w2
    40dc:      	cmn	w11, #0x1
    40e0:      	b.eq	0x40c8 <.text+0x30c8>
    40e4:      	cbz	w11, 0x40f4 <.text+0x30f4>
    40e8:      	ldrb	w12, [x9, x12]
    40ec:      	str	w12, [x11]
    40f0:      	b	0x40c8 <.text+0x30c8>
    40f4:      	ret
    40f8:      	stp	x29, x30, [sp, #-0x10]!
    40fc:      	mov	x29, sp
    4100:      	mov	w0, #0x780000           // =7864320
    4104:      	movk	w0, #0x4238
    4108:      	bl	0x7af8 <.text+0x6af8>
    410c:      	ubfx	w8, w0, #16, #4
    4110:      	cbz	w8, 0x412c <.text+0x312c>
    4114:      	mov	w0, #0xc010000          // =201392128
    4118:      	movk	w0, #0x223c
    411c:      	lsl	w2, w8, #4
    4120:      	orr	w1, wzr, #0xffffff0f
    4124:      	ldp	x29, x30, [sp], #0x10
    4128:      	b	0x7abc <.text+0x6abc>
    412c:      	ldp	x29, x30, [sp], #0x10
    4130:      	ret
    4134:      	stp	x24, x23, [sp, #-0x40]!
    4138:      	stp	x22, x21, [sp, #0x10]
    413c:      	stp	x20, x19, [sp, #0x20]
    4140:      	stp	x29, x30, [sp, #0x30]
    4144:      	add	x29, sp, #0x30
    4148:      	sub	sp, sp, #0x30
    414c:      	adrp	x23, 0xc000
    4150:      	mov	w20, w1
    4154:      	ldr	w8, [x23, #0x4d0]
    4158:      	cmp	w8, #0xf
    415c:      	b.ne	0x4248 <.text+0x3248>
    4160:      	mov	w19, #0xa920000         // =177340416
    4164:      	movk	w19, #0x20
    4168:      	sub	x21, x19, #0x1c
    416c:      	orr	w1, wzr, #0x7f
    4170:      	mov	x0, x21
    4174:      	bl	0x7b30 <.text+0x6b30>
    4178:      	mov	w1, wzr
    417c:      	mov	x0, x21
    4180:      	bl	0x7b30 <.text+0x6b30>
    4184:      	orr	x0, x19, #0x8
    4188:      	orr	w1, wzr, #0x3ff
    418c:      	bl	0x7b30 <.text+0x6b30>
    4190:      	orr	x0, x19, #0xc
    4194:      	orr	w1, wzr, #0x1f
    4198:      	bl	0x7b30 <.text+0x6b30>
    419c:      	mov	w21, #0xa920000         // =177340416
    41a0:      	movk	w21, #0x9404
    41a4:      	mov	w1, #0x19               // =25
    41a8:      	mov	x0, x21
    41ac:      	bl	0x7b30 <.text+0x6b30>
    41b0:      	orr	x0, x21, #0x10
    41b4:      	orr	w1, wzr, #0x20
    41b8:      	bl	0x7b30 <.text+0x6b30>
    41bc:      	add	x0, x21, #0xc
    41c0:      	mov	w1, #0x79               // =121
    41c4:      	bl	0x7b30 <.text+0x6b30>
    41c8:      	add	x0, x21, #0x14
    41cc:      	mov	w1, wzr
    41d0:      	bl	0x7b30 <.text+0x6b30>
    41d4:      	mov	w1, #0x99               // =153
    41d8:      	mov	x0, x21
    41dc:      	bl	0x7b30 <.text+0x6b30>
    41e0:      	add	x0, x21, #0x4
    41e4:      	orr	w1, wzr, #0x4
    41e8:      	bl	0x7b30 <.text+0x6b30>
    41ec:      	mov	w1, #0xd9               // =217
    41f0:      	mov	x0, x21
    41f4:      	bl	0x7b30 <.text+0x6b30>
    41f8:      	orr	w1, wzr, #0x100000
    41fc:      	mov	x0, x19
    4200:      	bl	0x7b30 <.text+0x6b30>
    4204:      	mov	w1, wzr
    4208:      	mov	x0, x19
    420c:      	bl	0x7b30 <.text+0x6b30>
    4210:      	mov	w1, #0x1a0              // =416
    4214:      	mov	x0, x19
    4218:      	bl	0x7b30 <.text+0x6b30>
    421c:      	sub	x0, x19, #0xc
    4220:      	mov	w1, #0x5                // =5
    4224:      	bl	0x7b30 <.text+0x6b30>
    4228:      	sub	x0, x19, #0x10
    422c:      	bl	0x7af8 <.text+0x6af8>
    4230:      	adrp	x8, 0xc000
    4234:      	mov	w0, #0x64               // =100
    4238:      	ldr	x9, [x8, #0x520]
    423c:      	ldr	x8, [x9, #0xf8]
    4240:      	blr	x8
    4244:      	ldr	w8, [x23, #0x4d0]
    4248:      	cmp	w8, #0x10
    424c:      	mov	w12, #0x10000           // =65536
    4250:      	orr	w11, wzr, #0x1
    4254:      	movk	w12, #0x8001
    4258:      	lsl	w8, w11, w8
    425c:      	and	w13, w8, w12
    4260:      	ccmp	w13, #0x0, #0x4, ls
    4264:      	b.ne	0x44c0 <.text+0x34c0>
    4268:      	mov	w21, #0x110000          // =1114112
    426c:      	movk	w21, #0x2000
    4270:      	orr	w1, wzr, #0x1
    4274:      	mov	x0, x21
    4278:      	mov	w19, #0xc010000         // =201392128
    427c:      	movk	w19, #0x2210
    4280:      	bl	0x7a64 <.text+0x6a64>
    4284:      	adrp	x23, 0xc000
    4288:      	mov	w22, #0x64              // =100
    428c:      	mov	x0, x22
    4290:      	ldr	x10, [x23, #0x520]
    4294:      	ldr	x9, [x10, #0xf8]
    4298:      	blr	x9
    429c:      	orr	w1, wzr, #0xfffffffe
    42a0:      	mov	x0, x21
    42a4:      	bl	0x7a90 <.text+0x6a90>
    42a8:      	ldr	x11, [x23, #0x520]
    42ac:      	mov	x0, x22
    42b0:      	ldr	x10, [x11, #0xf8]
    42b4:      	blr	x10
    42b8:      	cmp	w20, #0x8
    42bc:      	b.ne	0x436c <.text+0x336c>
    42c0:      	adrp	x12, 0xc000
    42c4:      	ldr	w15, [x12, #0x4e0]
    42c8:      	lsr	w16, w15, #17
    42cc:      	cbnz	w16, 0x436c <.text+0x336c>
    42d0:      	mov	w1, #0x63               // =99
    42d4:      	mov	x0, x19
    42d8:      	bl	0x7b30 <.text+0x6b30>
    42dc:      	ldr	x13, [x23, #0x520]
    42e0:      	mov	w20, #0x64              // =100
    42e4:      	mov	x0, x20
    42e8:      	ldr	x11, [x13, #0xf8]
    42ec:      	blr	x11
    42f0:      	sub	x0, x19, #0x20c
    42f4:      	mov	w1, #0x13               // =19
    42f8:      	bl	0x7b30 <.text+0x6b30>
    42fc:      	sub	x0, x19, #0x84
    4300:      	orr	w1, wzr, #0x7c
    4304:      	bl	0x7b30 <.text+0x6b30>
    4308:      	sub	x0, x19, #0x1e4
    430c:      	orr	w1, wzr, #0x80
    4310:      	bl	0x7b30 <.text+0x6b30>
    4314:      	sub	x0, x19, #0x8c
    4318:      	mov	w1, #0xa                // =10
    431c:      	bl	0x7b30 <.text+0x6b30>
    4320:      	add	x0, x19, #0xc
    4324:      	mov	w1, #0x8c               // =140
    4328:      	bl	0x7b30 <.text+0x6b30>
    432c:      	add	x0, x19, #0x2c
    4330:      	mov	w1, #0x5                // =5
    4334:      	bl	0x7b30 <.text+0x6b30>
    4338:      	add	x0, x19, #0x30
    433c:      	orr	w1, wzr, #0x3
    4340:      	bl	0x7b30 <.text+0x6b30>
    4344:      	add	x0, x19, #0x8
    4348:      	orr	w1, wzr, #0xff
    434c:      	bl	0x7b30 <.text+0x6b30>
    4350:      	bl	0x40f8 <.text+0x30f8>
    4354:      	ldr	x14, [x23, #0x520]
    4358:      	mov	x0, x20
    435c:      	ldr	x12, [x14, #0xf8]
    4360:      	blr	x12
    4364:      	mov	w1, #0x62               // =98
    4368:      	b	0x444c <.text+0x344c>
    436c:      	mov	w1, #0x23               // =35
    4370:      	mov	x0, x19
    4374:      	bl	0x7b30 <.text+0x6b30>
    4378:      	ldr	x15, [x23, #0x520]
    437c:      	mov	w0, #0x64               // =100
    4380:      	ldr	x13, [x15, #0xf8]
    4384:      	blr	x13
    4388:      	adrp	x0, 0xa000 <.text+0x9000>
    438c:      	add	x0, x0, #0xa8
    4390:      	mov	x1, sp
    4394:      	bl	0x76a0 <.text+0x66a0>
    4398:      	cbnz	w0, 0x43d4 <.text+0x33d4>
    439c:      	adrp	x1, 0xa000 <.text+0x9000>
    43a0:      	mov	w2, wzr
    43a4:      	add	x1, x1, #0x89
    43a8:      	mov	x0, sp
    43ac:      	add	x3, sp, #0x20
    43b0:      	bl	0x76c0 <.text+0x66c0>
    43b4:      	cbnz	w0, 0x43d4 <.text+0x33d4>
    43b8:      	adrp	x1, 0xa000 <.text+0x9000>
    43bc:      	mov	w2, wzr
    43c0:      	add	x1, x1, #0x99
    43c4:      	mov	x0, sp
    43c8:      	add	x3, sp, #0x10
    43cc:      	bl	0x76c0 <.text+0x66c0>
    43d0:      	cbz	w0, 0x44dc <.text+0x34dc>
    43d4:      	sub	x0, x19, #0x20c
    43d8:      	mov	w1, #0x13               // =19
    43dc:      	bl	0x7b30 <.text+0x6b30>
    43e0:      	sub	x0, x19, #0x84
    43e4:      	orr	w1, wzr, #0x7c
    43e8:      	bl	0x7b30 <.text+0x6b30>
    43ec:      	sub	x0, x19, #0x1e4
    43f0:      	orr	w1, wzr, #0x80
    43f4:      	bl	0x7b30 <.text+0x6b30>
    43f8:      	sub	x0, x19, #0x8c
    43fc:      	mov	w1, #0xa                // =10
    4400:      	bl	0x7b30 <.text+0x6b30>
    4404:      	sub	x0, x19, #0x15c
    4408:      	mov	w1, #0x19               // =25
    440c:      	bl	0x7b30 <.text+0x6b30>
    4410:      	add	x0, x19, #0x30
    4414:      	mov	w1, #0x9                // =9
    4418:      	bl	0x7b30 <.text+0x6b30>
    441c:      	add	x0, x19, #0x2c
    4420:      	mov	w1, #0xa5               // =165
    4424:      	bl	0x7b30 <.text+0x6b30>
    4428:      	add	x0, x19, #0xc
    442c:      	mov	w1, wzr
    4430:      	bl	0x7b30 <.text+0x6b30>
    4434:      	bl	0x40f8 <.text+0x30f8>
    4438:      	ldr	x16, [x23, #0x520]
    443c:      	mov	w0, #0x64               // =100
    4440:      	ldr	x14, [x16, #0xf8]
    4444:      	blr	x14
    4448:      	mov	w1, #0x22               // =34
    444c:      	mov	x0, x19
    4450:      	bl	0x7b30 <.text+0x6b30>
    4454:      	ldr	x17, [x23, #0x520]
    4458:      	mov	w0, #0xc8               // =200
    445c:      	ldr	x15, [x17, #0xf8]
    4460:      	blr	x15
    4464:      	add	x0, x19, #0x68
    4468:      	orr	w1, wzr, #0x4
    446c:      	bl	0x7b30 <.text+0x6b30>
    4470:      	orr	w21, wzr, #0x1
    4474:      	mov	w20, #0x64              // =100
    4478:      	add	x0, x19, #0x88
    447c:      	bl	0x7af8 <.text+0x6af8>
    4480:      	ldr	x1, [x23, #0x520]
    4484:      	and	w22, w0, #0x1
    4488:      	mov	x0, x20
    448c:      	ldr	x16, [x1, #0xf8]
    4490:      	blr	x16
    4494:      	cmp	x21, #0x31
    4498:      	b.hi	0x44a4 <.text+0x34a4>
    449c:      	add	x21, x21, #0x1
    44a0:      	cbz	w22, 0x4478 <.text+0x3478>
    44a4:      	cbnz	w22, 0x44c0 <.text+0x34c0>
    44a8:      	adrp	x1, 0xa000 <.text+0x9000>
    44ac:      	adrp	x2, 0xa000 <.text+0x9000>
    44b0:      	add	x1, x1, #0xb7
    44b4:      	add	x2, x2, #0xd7
    44b8:      	orr	w0, wzr, #0x80000000
    44bc:      	bl	0x18bc <.text+0x8bc>
    44c0:      	mov	x0, xzr
    44c4:      	sub	sp, x29, #0x30
    44c8:      	ldp	x29, x30, [sp, #0x30]
    44cc:      	ldp	x20, x19, [sp, #0x20]
    44d0:      	ldp	x22, x21, [sp, #0x10]
    44d4:      	ldp	x24, x23, [sp], #0x40
    44d8:      	ret
    44dc:      	ldr	x0, [sp, #0x28]
    44e0:      	mov	w2, wzr
    44e4:      	ldr	x1, [sp, #0x18]
    44e8:      	orr	w3, wzr, #0x8
    44ec:      	bl	0x408c <.text+0x308c>
    44f0:      	b	0x4434 <.text+0x3434>
    44f4:      	stp	x22, x21, [sp, #-0x30]!
    44f8:      	stp	x20, x19, [sp, #0x10]
    44fc:      	stp	x29, x30, [sp, #0x20]
    4500:      	add	x29, sp, #0x20
    4504:      	sub	sp, sp, #0x30
    4508:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    450c:      	mov	x19, x1
    4510:      	mov	x21, x0
    4514:      	movk	x20, #0x2
    4518:      	cbz	x19, 0x4758 <.text+0x3758>
    451c:      	mov	w0, #0xb8               // =184
    4520:      	bl	0x6e58 <.text+0x5e58>
    4524:      	cbz	x0, 0x477c <.text+0x377c>
    4528:      	cbnz	x21, 0x4750 <.text+0x3750>
    452c:      	adrp	x8, 0x4000 <.text+0x3000>
    4530:      	add	x8, x8, #0xa68
    4534:      	adrp	x9, 0x4000 <.text+0x3000>
    4538:      	add	x9, x9, #0xb3c
    453c:      	fmov	d0, x8
    4540:      	adrp	x11, 0x4000 <.text+0x3000>
    4544:      	add	x11, x11, #0xcbc
    4548:      	adrp	x10, 0x4000 <.text+0x3000>
    454c:      	add	x10, x10, #0x7e8
    4550:      	fmov	d1, x11
    4554:      	adrp	x13, 0x4000 <.text+0x3000>
    4558:      	add	x13, x13, #0xd24
    455c:      	mov	v0.d[1], x9
    4560:      	str	x10, [x0, #0x8]
    4564:      	adrp	x16, 0x4000 <.text+0x3000>
    4568:      	add	x16, x16, #0xd60
    456c:      	adrp	x15, 0x4000 <.text+0x3000>
    4570:      	mov	v1.d[1], x13
    4574:      	add	x15, x15, #0xc0c
    4578:      	fmov	d2, x16
    457c:      	adrp	x3, 0x4000 <.text+0x3000>
    4580:      	str	q0, [sp, #0x20]
    4584:      	add	x3, x3, #0xeb4
    4588:      	ldr	x12, [sp, #0x28]
    458c:      	adrp	x6, 0x4000 <.text+0x3000>
    4590:      	adrp	x21, 0x4000 <.text+0x3000>
    4594:      	adrp	x1, 0x4000 <.text+0x3000>
    4598:      	adrp	x2, 0x4000 <.text+0x3000>
    459c:      	str	x12, [x0, #0x18]
    45a0:      	mov	v2.d[1], x3
    45a4:      	ldr	x14, [sp, #0x20]
    45a8:      	adrp	x8, 0x5000 <.text+0x4000>
    45ac:      	str	x15, [x0, #0x20]
    45b0:      	add	x6, x6, #0xf14
    45b4:      	add	x21, x21, #0xf5c
    45b8:      	add	x1, x1, #0xfa4
    45bc:      	str	x14, [x0, #0x10]
    45c0:      	add	x2, x2, #0xfe4
    45c4:      	str	q1, [sp, #0x10]
    45c8:      	add	x8, x8, #0x44
    45cc:      	ldr	x17, [sp, #0x18]
    45d0:      	adrp	x11, 0xc000
    45d4:      	adrp	x12, 0xc000
    45d8:      	mov	w9, #0xa800000          // =176160768
    45dc:      	orr	w10, wzr, #0x8
    45e0:      	str	x17, [x0, #0x30]
    45e4:      	add	x11, x11, #0x3b8
    45e8:      	ldr	x4, [sp, #0x10]
    45ec:      	add	x12, x12, #0x438
    45f0:      	adrp	x20, 0xc000
    45f4:      	str	x4, [x0, #0x28]
    45f8:      	str	q2, [sp]
    45fc:      	ldr	x5, [sp, #0x8]
    4600:      	str	x5, [x0, #0x40]
    4604:      	ldr	x7, [sp]
    4608:      	stp	x6, x21, [x0, #0x48]
    460c:      	stp	x1, x2, [x0, #0x58]
    4610:      	str	x8, [x0, #0x68]
    4614:      	mov	w8, #0x5                // =5
    4618:      	str	x7, [x0, #0x38]
    461c:      	str	x0, [x19]
    4620:      	str	w8, [x0, #0x70]
    4624:      	stp	x9, x10, [x0, #0x78]
    4628:      	stp	x11, x10, [x0, #0x88]
    462c:      	stp	x12, xzr, [x0, #0x98]
    4630:      	str	xzr, [x0, #0xb0]
    4634:      	strb	wzr, [x0, #0xa8]
    4638:      	ldr	x0, [x20, #0x550]
    463c:      	cbnz	x0, 0x466c <.text+0x366c>
    4640:      	adrp	x8, 0xc000
    4644:      	adrp	x0, 0xc000
    4648:      	adrp	x2, 0xc000
    464c:      	ldr	x9, [x8, #0x520]
    4650:      	mov	x1, xzr
    4654:      	add	x0, x0, #0x120
    4658:      	add	x2, x2, #0x550
    465c:      	ldr	x13, [x9, #0x140]
    4660:      	blr	x13
    4664:      	tbz	x0, #0x3f, 0x466c <.text+0x366c>
    4668:      	str	xzr, [x20, #0x550]
    466c:      	adrp	x10, 0xc000
    4670:      	ldr	w8, [x10, #0x4d0]
    4674:      	cmp	w8, #0x1d
    4678:      	b.eq	0x46b4 <.text+0x36b4>
    467c:      	adrp	x19, 0xc000
    4680:      	ldr	x14, [x19, #0x558]
    4684:      	cbnz	x14, 0x46b4 <.text+0x36b4>
    4688:      	adrp	x11, 0xc000
    468c:      	adrp	x0, 0xc000
    4690:      	adrp	x2, 0xc000
    4694:      	ldr	x12, [x11, #0x520]
    4698:      	mov	x1, xzr
    469c:      	add	x0, x0, #0x150
    46a0:      	add	x2, x2, #0x558
    46a4:      	ldr	x15, [x12, #0x140]
    46a8:      	blr	x15
    46ac:      	tbz	x0, #0x3f, 0x46b4 <.text+0x36b4>
    46b0:      	str	xzr, [x19, #0x558]
    46b4:      	adrp	x20, 0xc000
    46b8:      	ldr	x16, [x20, #0x560]
    46bc:      	cbnz	x16, 0x46e4 <.text+0x36e4>
    46c0:      	adrp	x0, 0xa000 <.text+0x9000>
    46c4:      	adrp	x1, 0xa000 <.text+0x9000>
    46c8:      	add	x0, x0, #0x478
    46cc:      	add	x1, x1, #0x485
    46d0:      	orr	w2, wzr, #0x40
    46d4:      	mov	w3, wzr
    46d8:      	mov	x4, xzr
    46dc:      	bl	0x793c <.text+0x693c>
    46e0:      	str	x0, [x20, #0x560]
    46e4:      	adrp	x19, 0xc000
    46e8:      	add	x19, x19, #0x560
    46ec:      	ldr	x17, [x19, #0x8]
    46f0:      	cbnz	x17, 0x4718 <.text+0x3718>
    46f4:      	adrp	x0, 0xa000 <.text+0x9000>
    46f8:      	adrp	x1, 0xa000 <.text+0x9000>
    46fc:      	add	x0, x0, #0x48d
    4700:      	add	x1, x1, #0x497
    4704:      	orr	w2, wzr, #0x40
    4708:      	mov	w3, wzr
    470c:      	mov	x4, xzr
    4710:      	bl	0x793c <.text+0x693c>
    4714:      	str	x0, [x19, #0x8]
    4718:      	ldr	x3, [x19, #0x10]
    471c:      	cbnz	x3, 0x4744 <.text+0x3744>
    4720:      	adrp	x0, 0xa000 <.text+0x9000>
    4724:      	adrp	x1, 0xa000 <.text+0x9000>
    4728:      	add	x0, x0, #0x4a4
    472c:      	add	x1, x1, #0x4ae
    4730:      	orr	w2, wzr, #0x40
    4734:      	mov	w3, wzr
    4738:      	mov	x4, xzr
    473c:      	bl	0x793c <.text+0x693c>
    4740:      	str	x0, [x19, #0x10]
    4744:      	adrp	x19, 0xc000
    4748:      	ldr	x4, [x19, #0x548]
    474c:      	cbz	x4, 0x47b0 <.text+0x37b0>
    4750:      	mov	x20, xzr
    4754:      	b	0x4798 <.text+0x3798>
    4758:      	adrp	x1, 0xa000 <.text+0x9000>
    475c:      	adrp	x2, 0xa000 <.text+0x9000>
    4760:      	add	x1, x1, #0xe4
    4764:      	add	x2, x2, #0x114
    4768:      	orr	w0, wzr, #0x80000000
    476c:      	mov	x3, x21
    4770:      	mov	x4, xzr
    4774:      	bl	0x18bc <.text+0x8bc>
    4778:      	b	0x4798 <.text+0x3798>
    477c:      	adrp	x1, 0xa000 <.text+0x9000>
    4780:      	adrp	x2, 0xa000 <.text+0x9000>
    4784:      	add	x1, x1, #0x127
    4788:      	add	x2, x2, #0x114
    478c:      	orr	w0, wzr, #0x80000000
    4790:      	bl	0x18bc <.text+0x8bc>
    4794:      	add	x20, x20, #0x7
    4798:      	mov	x0, x20
    479c:      	sub	sp, x29, #0x20
    47a0:      	ldp	x29, x30, [sp, #0x20]
    47a4:      	ldp	x20, x19, [sp, #0x10]
    47a8:      	ldp	x22, x21, [sp], #0x30
    47ac:      	ret
    47b0:      	adrp	x13, 0xc000
    47b4:      	adrp	x0, 0xc000
    47b8:      	adrp	x2, 0xc000
    47bc:      	ldr	x14, [x13, #0x520]
    47c0:      	mov	x1, xzr
    47c4:      	add	x0, x0, #0x130
    47c8:      	add	x2, x2, #0x548
    47cc:      	ldr	x5, [x14, #0x140]
    47d0:      	blr	x5
    47d4:      	mov	x20, xzr
    47d8:      	tbz	x0, #0x3f, 0x4798 <.text+0x3798>
    47dc:      	mov	x20, xzr
    47e0:      	str	xzr, [x19, #0x548]
    47e4:      	b	0x4798 <.text+0x3798>
    47e8:      	stp	x24, x23, [sp, #-0x40]!
    47ec:      	stp	x22, x21, [sp, #0x10]
    47f0:      	stp	x20, x19, [sp, #0x20]
    47f4:      	stp	x29, x30, [sp, #0x30]
    47f8:      	add	x29, sp, #0x30
    47fc:      	mov	x19, x0
    4800:      	cbz	x19, 0x487c <.text+0x387c>
    4804:      	adrp	x8, 0xc000
    4808:      	ldr	x8, [x8, #0x550]
    480c:      	cbz	x8, 0x4a30 <.text+0x3a30>
    4810:      	ldr	x22, [x19, #0x78]
    4814:      	and	w8, w1, #0xff
    4818:      	cbnz	w8, 0x4918 <.text+0x3918>
    481c:      	mov	x0, xzr
    4820:      	bl	0x7548 <.text+0x6548>
    4824:      	ldr	w9, [x19, #0x70]
    4828:      	cmp	w9, #0x5
    482c:      	b.ne	0x4844 <.text+0x3844>
    4830:      	adrp	x9, 0xc000
    4834:      	ldr	x0, [x9, #0x560]
    4838:      	cbz	x0, 0x4844 <.text+0x3844>
    483c:      	orr	w1, wzr, #0x2
    4840:      	bl	0x79e8 <.text+0x69e8>
    4844:      	orr	w0, wzr, #0x1
    4848:      	bl	0x5274 <.text+0x4274>
    484c:      	ldr	w10, [x19, #0x70]
    4850:      	cmp	w10, #0x5
    4854:      	b.ne	0x48e4 <.text+0x38e4>
    4858:      	adrp	x23, 0xc000
    485c:      	add	x23, x23, #0x560
    4860:      	mov	w20, #0x30000           // =196608
    4864:      	movk	w20, #0xd40
    4868:      	ldr	x0, [x23, #0x8]
    486c:      	cbz	x0, 0x48a0 <.text+0x38a0>
    4870:      	mov	w1, w20
    4874:      	bl	0x79e8 <.text+0x69e8>
    4878:      	b	0x48b8 <.text+0x38b8>
    487c:      	adrp	x1, 0x7000 <.text+0x6000>
    4880:      	adrp	x2, 0xa000 <.text+0x9000>
    4884:      	add	x1, x1, #0xf1e
    4888:      	add	x2, x2, #0x152
    488c:      	orr	w0, wzr, #0x80000000
    4890:      	bl	0x18bc <.text+0x8bc>
    4894:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    4898:      	movk	x20, #0x2
    489c:      	b	0x4a34 <.text+0x3a34>
    48a0:      	adrp	x1, 0xa000 <.text+0x9000>
    48a4:      	adrp	x2, 0xa000 <.text+0x9000>
    48a8:      	add	x1, x1, #0x162
    48ac:      	add	x2, x2, #0x152
    48b0:      	orr	w0, wzr, #0x80000000
    48b4:      	bl	0x18bc <.text+0x8bc>
    48b8:      	ldr	x0, [x23, #0x10]
    48bc:      	cbz	x0, 0x48cc <.text+0x38cc>
    48c0:      	mov	w1, w20
    48c4:      	bl	0x79e8 <.text+0x69e8>
    48c8:      	b	0x48e4 <.text+0x38e4>
    48cc:      	adrp	x1, 0xa000 <.text+0x9000>
    48d0:      	adrp	x2, 0xa000 <.text+0x9000>
    48d4:      	add	x1, x1, #0x182
    48d8:      	add	x2, x2, #0x152
    48dc:      	orr	w0, wzr, #0x80000000
    48e0:      	bl	0x18bc <.text+0x8bc>
    48e4:      	ldr	x9, [x19, #0xa0]
    48e8:      	cbnz	x9, 0x48f4 <.text+0x38f4>
    48ec:      	ldp	x0, x1, [x19, #0x80]
    48f0:      	bl	0x52f0 <.text+0x42f0>
    48f4:      	ldp	x0, x1, [x19, #0x90]
    48f8:      	bl	0x53e0 <.text+0x43e0>
    48fc:      	ldp	x0, x1, [x19, #0x80]
    4900:      	bl	0x52f0 <.text+0x42f0>
    4904:      	mov	x20, x0
    4908:      	tbnz	x20, #0x3f, 0x4a4c <.text+0x3a4c>
    490c:      	ldr	x10, [x19, #0xa0]
    4910:      	add	x11, x10, #0x1
    4914:      	str	x11, [x19, #0xa0]
    4918:      	mov	w20, #0x100000          // =1048576
    491c:      	movk	w20, #0xf004
    4920:      	orr	w1, wzr, #0x1
    4924:      	mov	x0, x20
    4928:      	bl	0x7a64 <.text+0x6a64>
    492c:      	adrp	x23, 0xc000
    4930:      	mov	w21, #0x64              // =100
    4934:      	mov	x0, x21
    4938:      	ldr	x12, [x23, #0x520]
    493c:      	ldr	x10, [x12, #0xf8]
    4940:      	blr	x10
    4944:      	orr	w1, wzr, #0xfffffffe
    4948:      	mov	x0, x20
    494c:      	bl	0x7a90 <.text+0x6a90>
    4950:      	ldr	x13, [x23, #0x520]
    4954:      	mov	x0, x21
    4958:      	ldr	x11, [x13, #0xf8]
    495c:      	blr	x11
    4960:      	mov	x0, x19
    4964:      	bl	0x3fb8 <.text+0x2fb8>
    4968:      	mov	w0, #0xc010000          // =201392128
    496c:      	movk	w0, #0x6010
    4970:      	mov	w1, #0x11               // =17
    4974:      	bl	0x7b30 <.text+0x6b30>
    4978:      	ldr	w1, [x19]
    497c:      	bl	0x4134 <.text+0x3134>
    4980:      	adrp	x14, 0x7000 <.text+0x6000>
    4984:      	ldrb	w20, [x14, #0xe39]
    4988:      	cbnz	w20, 0x49b8 <.text+0x39b8>
    498c:      	mov	x0, x19
    4990:      	bl	0x54c8 <.text+0x44c8>
    4994:      	ldr	w11, [x19, #0x70]
    4998:      	cmp	w11, #0x5
    499c:      	ccmp	x0, #0x0, #0x4, eq
    49a0:      	b.ne	0x49b8 <.text+0x39b8>
    49a4:      	cbnz	w20, 0x49b8 <.text+0x39b8>
    49a8:      	mov	w15, #0xc2c0            // =49856
    49ac:      	add	x0, x22, x15
    49b0:      	orr	w1, wzr, #0xfffbffff
    49b4:      	b	0x4a20 <.text+0x3a20>
    49b8:      	mov	w12, #0xf0000           // =983040
    49bc:      	movk	w12, #0x8808
    49c0:      	add	x20, x22, x12
    49c4:      	orr	w1, wzr, #0x100
    49c8:      	mov	x0, x20
    49cc:      	bl	0x7a64 <.text+0x6a64>
    49d0:      	ldr	x15, [x23, #0x520]
    49d4:      	mov	w21, #0x64              // =100
    49d8:      	mov	x0, x21
    49dc:      	ldr	x13, [x15, #0xf8]
    49e0:      	blr	x13
    49e4:      	orr	w1, wzr, #0x1
    49e8:      	mov	x0, x20
    49ec:      	bl	0x7a64 <.text+0x6a64>
    49f0:      	orr	w1, wzr, #0x8
    49f4:      	mov	x0, x20
    49f8:      	bl	0x7a64 <.text+0x6a64>
    49fc:      	orr	w1, wzr, #0xfffffdff
    4a00:      	mov	x0, x20
    4a04:      	bl	0x7a90 <.text+0x6a90>
    4a08:      	ldr	x16, [x23, #0x520]
    4a0c:      	mov	x0, x21
    4a10:      	ldr	x14, [x16, #0xf8]
    4a14:      	blr	x14
    4a18:      	orr	w1, wzr, #0xfffffeff
    4a1c:      	mov	x0, x20
    4a20:      	bl	0x7a90 <.text+0x6a90>
    4a24:      	add	x0, x22, #0x28
    4a28:      	orr	w1, wzr, #0x2
    4a2c:      	bl	0x7a64 <.text+0x6a64>
    4a30:      	mov	x20, xzr
    4a34:      	mov	x0, x20
    4a38:      	ldp	x29, x30, [sp, #0x30]
    4a3c:      	ldp	x20, x19, [sp, #0x20]
    4a40:      	ldp	x22, x21, [sp, #0x10]
    4a44:      	ldp	x24, x23, [sp], #0x40
    4a48:      	ret
    4a4c:      	adrp	x1, 0xa000 <.text+0x9000>
    4a50:      	adrp	x2, 0xa000 <.text+0x9000>
    4a54:      	add	x1, x1, #0x1a1
    4a58:      	add	x2, x2, #0x152
    4a5c:      	orr	w0, wzr, #0x80000000
    4a60:      	bl	0x18bc <.text+0x8bc>
    4a64:      	b	0x4a34 <.text+0x3a34>
    4a68:      	stp	x20, x19, [sp, #-0x20]!
    4a6c:      	stp	x29, x30, [sp, #0x10]
    4a70:      	add	x29, sp, #0x10
    4a74:      	cbz	x0, 0x4abc <.text+0x3abc>
    4a78:      	ldr	x8, [x0, #0x78]
    4a7c:      	cbz	x8, 0x4ae0 <.text+0x3ae0>
    4a80:      	adrp	x9, 0xc000
    4a84:      	ldr	w9, [x9, #0x4d0]
    4a88:      	cmp	w9, #0xf
    4a8c:      	b.ne	0x4b1c <.text+0x3b1c>
    4a90:      	mov	w9, #0xc704             // =50948
    4a94:      	add	x19, x8, x9
    4a98:      	orr	w1, wzr, #0x40000000
    4a9c:      	mov	x0, x19
    4aa0:      	bl	0x7a64 <.text+0x6a64>
    4aa4:      	mov	x0, x19
    4aa8:      	bl	0x7af8 <.text+0x6af8>
    4aac:      	tbnz	w0, #0x1e, 0x4aa4 <.text+0x3aa4>
    4ab0:      	orr	w1, wzr, #0x10
    4ab4:      	bl	0x4134 <.text+0x3134>
    4ab8:      	b	0x4b2c <.text+0x3b2c>
    4abc:      	adrp	x1, 0x7000 <.text+0x6000>
    4ac0:      	adrp	x2, 0xa000 <.text+0x9000>
    4ac4:      	add	x1, x1, #0xf1e
    4ac8:      	add	x2, x2, #0x2df
    4acc:      	orr	w0, wzr, #0x80000000
    4ad0:      	bl	0x18bc <.text+0x8bc>
    4ad4:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4ad8:      	movk	x0, #0x2
    4adc:      	b	0x4b30 <.text+0x3b30>
    4ae0:      	adrp	x1, 0xa000 <.text+0x9000>
    4ae4:      	adrp	x2, 0xa000 <.text+0x9000>
    4ae8:      	mov	w19, #0x550             // =1360
    4aec:      	add	x1, x1, #0x2f6
    4af0:      	add	x2, x2, #0x315
    4af4:      	orr	w0, wzr, #0x80000000
    4af8:      	mov	w3, w19
    4afc:      	bl	0x18bc <.text+0x8bc>
    4b00:      	adrp	x0, 0xa000 <.text+0x9000>
    4b04:      	adrp	x2, 0x8000 <.text+0x7000>
    4b08:      	add	x0, x0, #0x38c
    4b0c:      	add	x2, x2, #0xe32
    4b10:      	mov	x1, x19
    4b14:      	bl	0x1c48 <.text+0xc48>
    4b18:      	b	0x4b18 <.text+0x3b18>
    4b1c:      	mov	w10, #0xc200            // =49664
    4b20:      	add	x0, x8, x10
    4b24:      	orr	w1, wzr, #0x100
    4b28:      	bl	0x7a64 <.text+0x6a64>
    4b2c:      	mov	x0, xzr
    4b30:      	ldp	x29, x30, [sp, #0x10]
    4b34:      	ldp	x20, x19, [sp], #0x20
    4b38:      	ret
    4b3c:      	stp	x20, x19, [sp, #-0x20]!
    4b40:      	stp	x29, x30, [sp, #0x10]
    4b44:      	add	x29, sp, #0x10
    4b48:      	mov	x20, x0
    4b4c:      	cbz	x20, 0x4bc0 <.text+0x3bc0>
    4b50:      	bl	0x3f34 <.text+0x2f34>
    4b54:      	mov	x19, x0
    4b58:      	tbnz	x19, #0x3f, 0x4be4 <.text+0x3be4>
    4b5c:      	ldr	x20, [x20, #0x78]
    4b60:      	mov	w8, #0xc110             // =49424
    4b64:      	orr	w1, wzr, #0xffffcfff
    4b68:      	add	x19, x20, x8
    4b6c:      	mov	x0, x19
    4b70:      	bl	0x7a90 <.text+0x6a90>
    4b74:      	mov	w1, #0x1004             // =4100
    4b78:      	mov	x0, x19
    4b7c:      	bl	0x7a64 <.text+0x6a64>
    4b80:      	add	x0, x20, #0x420
    4b84:      	orr	w1, wzr, #0x2000000
    4b88:      	bl	0x7a64 <.text+0x6a64>
    4b8c:      	add	x0, x20, #0x430
    4b90:      	orr	w1, wzr, #0x2000000
    4b94:      	bl	0x7a64 <.text+0x6a64>
    4b98:      	mov	w9, #0xc10c             // =49420
    4b9c:      	add	x0, x20, x9
    4ba0:      	mov	w1, #0x23180000         // =588775424
    4ba4:      	bl	0x7a64 <.text+0x6a64>
    4ba8:      	mov	w10, #0xc104            // =49412
    4bac:      	add	x0, x20, x10
    4bb0:      	orr	w1, wzr, #0x1e00
    4bb4:      	bl	0x7a64 <.text+0x6a64>
    4bb8:      	mov	x19, xzr
    4bbc:      	b	0x4bfc <.text+0x3bfc>
    4bc0:      	adrp	x1, 0xa000 <.text+0x9000>
    4bc4:      	adrp	x2, 0xa000 <.text+0x9000>
    4bc8:      	add	x1, x1, #0x3a0
    4bcc:      	add	x2, x2, #0x3b8
    4bd0:      	orr	w0, wzr, #0x80000000
    4bd4:      	bl	0x18bc <.text+0x8bc>
    4bd8:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    4bdc:      	movk	x19, #0x2
    4be0:      	b	0x4bfc <.text+0x3bfc>
    4be4:      	adrp	x1, 0xa000 <.text+0x9000>
    4be8:      	adrp	x2, 0xa000 <.text+0x9000>
    4bec:      	add	x1, x1, #0x3c6
    4bf0:      	add	x2, x2, #0x3b8
    4bf4:      	orr	w0, wzr, #0x80000000
    4bf8:      	bl	0x18bc <.text+0x8bc>
    4bfc:      	ldp	x29, x30, [sp, #0x10]
    4c00:      	mov	x0, x19
    4c04:      	ldp	x20, x19, [sp], #0x20
    4c08:      	ret
    4c0c:      	stp	x20, x19, [sp, #-0x20]!
    4c10:      	stp	x29, x30, [sp, #0x10]
    4c14:      	add	x29, sp, #0x10
    4c18:      	mov	x19, x1
    4c1c:      	cbz	x0, 0x4c38 <.text+0x3c38>
    4c20:      	adrp	x9, 0xc000
    4c24:      	ldr	w8, [x9, #0x4d0]
    4c28:      	cmp	w8, #0x1d
    4c2c:      	b.ne	0x4c64 <.text+0x3c64>
    4c30:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    4c34:      	b	0x4c58 <.text+0x3c58>
    4c38:      	adrp	x1, 0xa000 <.text+0x9000>
    4c3c:      	adrp	x2, 0xa000 <.text+0x9000>
    4c40:      	add	x1, x1, #0x3a0
    4c44:      	add	x2, x2, #0x3e8
    4c48:      	orr	w0, wzr, #0x80000000
    4c4c:      	bl	0x18bc <.text+0x8bc>
    4c50:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4c54:      	movk	x0, #0x2
    4c58:      	ldp	x29, x30, [sp, #0x10]
    4c5c:      	ldp	x20, x19, [sp], #0x20
    4c60:      	ret
    4c64:      	adrp	x20, 0xc000
    4c68:      	ldr	x8, [x20, #0x558]
    4c6c:      	cbnz	x8, 0x4c9c <.text+0x3c9c>
    4c70:      	adrp	x10, 0xc000
    4c74:      	adrp	x0, 0xc000
    4c78:      	adrp	x2, 0xc000
    4c7c:      	ldr	x11, [x10, #0x520]
    4c80:      	mov	x1, xzr
    4c84:      	add	x0, x0, #0x150
    4c88:      	add	x2, x2, #0x558
    4c8c:      	ldr	x8, [x11, #0x140]
    4c90:      	blr	x8
    4c94:      	tbnz	x0, #0x3f, 0x4cb4 <.text+0x3cb4>
    4c98:      	ldr	x8, [x20, #0x558]
    4c9c:      	ldr	x2, [x8, #0x28]
    4ca0:      	orr	w0, wzr, #0x1
    4ca4:      	ldp	x29, x30, [sp, #0x10]
    4ca8:      	mov	x1, x19
    4cac:      	ldp	x20, x19, [sp], #0x20
    4cb0:      	br	x2
    4cb4:      	str	xzr, [x20, #0x558]
    4cb8:      	b	0x4c58 <.text+0x3c58>
    4cbc:      	stp	x20, x19, [sp, #-0x20]!
    4cc0:      	stp	x29, x30, [sp, #0x10]
    4cc4:      	add	x29, sp, #0x10
    4cc8:      	cbz	x0, 0x4cf4 <.text+0x3cf4>
    4ccc:      	bl	0x3f34 <.text+0x2f34>
    4cd0:      	mov	x19, x0
    4cd4:      	tbz	x19, #0x3f, 0x4d14 <.text+0x3d14>
    4cd8:      	adrp	x1, 0xa000 <.text+0x9000>
    4cdc:      	adrp	x2, 0xa000 <.text+0x9000>
    4ce0:      	add	x1, x1, #0x3c6
    4ce4:      	add	x2, x2, #0x3f7
    4ce8:      	orr	w0, wzr, #0x80000000
    4cec:      	bl	0x18bc <.text+0x8bc>
    4cf0:      	b	0x4d14 <.text+0x3d14>
    4cf4:      	adrp	x1, 0xa000 <.text+0x9000>
    4cf8:      	adrp	x2, 0xa000 <.text+0x9000>
    4cfc:      	add	x1, x1, #0x3a0
    4d00:      	add	x2, x2, #0x3f7
    4d04:      	orr	w0, wzr, #0x80000000
    4d08:      	bl	0x18bc <.text+0x8bc>
    4d0c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    4d10:      	movk	x19, #0x2
    4d14:      	ldp	x29, x30, [sp, #0x10]
    4d18:      	mov	x0, x19
    4d1c:      	ldp	x20, x19, [sp], #0x20
    4d20:      	ret
    4d24:      	cbz	x0, 0x4d30 <.text+0x3d30>
    4d28:      	mov	x0, xzr
    4d2c:      	ret
    4d30:      	stp	x29, x30, [sp, #-0x10]!
    4d34:      	mov	x29, sp
    4d38:      	adrp	x1, 0x7000 <.text+0x6000>
    4d3c:      	adrp	x2, 0xa000 <.text+0x9000>
    4d40:      	add	x1, x1, #0xf1e
    4d44:      	add	x2, x2, #0x407
    4d48:      	orr	w0, wzr, #0x80000000
    4d4c:      	bl	0x18bc <.text+0x8bc>
    4d50:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4d54:      	movk	x0, #0x2
    4d58:      	ldp	x29, x30, [sp], #0x10
    4d5c:      	ret
    4d60:      	stp	x22, x21, [sp, #-0x30]!
    4d64:      	stp	x20, x19, [sp, #0x10]
    4d68:      	stp	x29, x30, [sp, #0x20]
    4d6c:      	add	x29, sp, #0x20
    4d70:      	mov	x19, x0
    4d74:      	cbz	x19, 0x4db0 <.text+0x3db0>
    4d78:      	adrp	x8, 0xc000
    4d7c:      	mov	w10, #0x10000           // =65536
    4d80:      	orr	w9, wzr, #0x1
    4d84:      	ldr	w8, [x8, #0x4d0]
    4d88:      	movk	w10, #0x8001
    4d8c:      	cmp	w8, #0x10
    4d90:      	lsl	w8, w9, w8
    4d94:      	and	w12, w8, w10
    4d98:      	ccmp	w12, #0x0, #0x4, ls
    4d9c:      	b.ne	0x4da8 <.text+0x3da8>
    4da0:      	ldrb	w13, [x19, #0xa8]
    4da4:      	cbz	w13, 0x4dd4 <.text+0x3dd4>
    4da8:      	mov	x0, xzr
    4dac:      	b	0x4ea4 <.text+0x3ea4>
    4db0:      	adrp	x1, 0x7000 <.text+0x6000>
    4db4:      	adrp	x2, 0xa000 <.text+0x9000>
    4db8:      	add	x1, x1, #0xf1e
    4dbc:      	add	x2, x2, #0x412
    4dc0:      	orr	w0, wzr, #0x80000000
    4dc4:      	bl	0x18bc <.text+0x8bc>
    4dc8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4dcc:      	movk	x0, #0x2
    4dd0:      	b	0x4ea4 <.text+0x3ea4>
    4dd4:      	ldr	x8, [x19, #0xa0]
    4dd8:      	cbnz	x8, 0x4df0 <.text+0x3df0>
    4ddc:      	ldp	x0, x1, [x19, #0x80]
    4de0:      	bl	0x52f0 <.text+0x42f0>
    4de4:      	ldr	x9, [x19, #0xa0]
    4de8:      	add	x10, x9, #0x1
    4dec:      	str	x10, [x19, #0xa0]
    4df0:      	mov	w21, #0x100000          // =1048576
    4df4:      	movk	w21, #0xf000
    4df8:      	orr	w1, wzr, #0x1
    4dfc:      	mov	x0, x21
    4e00:      	bl	0x7a64 <.text+0x6a64>
    4e04:      	add	x0, x21, #0x3, lsl #12  // =0x3000
    4e08:      	orr	w1, wzr, #0x1
    4e0c:      	bl	0x7a64 <.text+0x6a64>
    4e10:      	mov	w20, #0x150000          // =1376256
    4e14:      	movk	w20, #0x20
    4e18:      	orr	w1, wzr, #0x1
    4e1c:      	mov	x0, x20
    4e20:      	bl	0x7a64 <.text+0x6a64>
    4e24:      	orr	x0, x20, #0x4
    4e28:      	orr	w1, wzr, #0x1
    4e2c:      	bl	0x7a64 <.text+0x6a64>
    4e30:      	ldp	x0, x1, [x19, #0x90]
    4e34:      	bl	0x53e0 <.text+0x43e0>
    4e38:      	mov	x20, x0
    4e3c:      	mov	w0, wzr
    4e40:      	bl	0x5274 <.text+0x4274>
    4e44:      	orr	x0, x21, #0x4
    4e48:      	orr	w1, wzr, #0x1
    4e4c:      	bl	0x7a64 <.text+0x6a64>
    4e50:      	adrp	x11, 0xc000
    4e54:      	ldr	x0, [x11, #0x560]
    4e58:      	cbz	x0, 0x4e64 <.text+0x3e64>
    4e5c:      	orr	w1, wzr, #0x1
    4e60:      	bl	0x79e8 <.text+0x69e8>
    4e64:      	adrp	x21, 0xc000
    4e68:      	add	x21, x21, #0x560
    4e6c:      	ldr	x0, [x21, #0x8]
    4e70:      	cbz	x0, 0x4e7c <.text+0x3e7c>
    4e74:      	mov	w1, wzr
    4e78:      	bl	0x79e8 <.text+0x69e8>
    4e7c:      	ldr	x0, [x21, #0x10]
    4e80:      	cbz	x0, 0x4e8c <.text+0x3e8c>
    4e84:      	mov	w1, wzr
    4e88:      	bl	0x79e8 <.text+0x69e8>
    4e8c:      	ldr	x12, [x19, #0xa0]
    4e90:      	orr	w14, wzr, #0x1
    4e94:      	mov	x0, x20
    4e98:      	strb	w14, [x19, #0xa8]
    4e9c:      	sub	x13, x12, #0x1
    4ea0:      	str	x13, [x19, #0xa0]
    4ea4:      	ldp	x29, x30, [sp, #0x20]
    4ea8:      	ldp	x20, x19, [sp, #0x10]
    4eac:      	ldp	x22, x21, [sp], #0x30
    4eb0:      	ret
    4eb4:      	stp	x29, x30, [sp, #-0x10]!
    4eb8:      	mov	x29, sp
    4ebc:      	cbz	x0, 0x4ef0 <.text+0x3ef0>
    4ec0:      	adrp	x8, 0xc000
    4ec4:      	mov	w10, #0x10000           // =65536
    4ec8:      	orr	w9, wzr, #0x1
    4ecc:      	ldr	w8, [x8, #0x4d0]
    4ed0:      	movk	w10, #0x8001
    4ed4:      	cmp	w8, #0x10
    4ed8:      	lsl	w8, w9, w8
    4edc:      	and	w12, w8, w10
    4ee0:      	ccmp	w12, #0x0, #0x4, ls
    4ee4:      	b.ne	0x4f08 <.text+0x3f08>
    4ee8:      	bl	0x3fb8 <.text+0x2fb8>
    4eec:      	b	0x4f08 <.text+0x3f08>
    4ef0:      	adrp	x1, 0x7000 <.text+0x6000>
    4ef4:      	adrp	x2, 0xa000 <.text+0x9000>
    4ef8:      	add	x1, x1, #0xf1e
    4efc:      	add	x2, x2, #0x420
    4f00:      	orr	w0, wzr, #0x80000000
    4f04:      	bl	0x18bc <.text+0x8bc>
    4f08:      	mov	x0, xzr
    4f0c:      	ldp	x29, x30, [sp], #0x10
    4f10:      	ret
    4f14:      	cbz	x0, 0x4f28 <.text+0x3f28>
    4f18:      	and	w9, w1, #0xff
    4f1c:      	mov	x8, xzr
    4f20:      	str	x9, [x0, #0xb0]
    4f24:      	b	0x4f54 <.text+0x3f54>
    4f28:      	stp	x29, x30, [sp, #-0x10]!
    4f2c:      	mov	x29, sp
    4f30:      	adrp	x1, 0x7000 <.text+0x6000>
    4f34:      	adrp	x2, 0xa000 <.text+0x9000>
    4f38:      	add	x1, x1, #0xf1e
    4f3c:      	add	x2, x2, #0x42d
    4f40:      	orr	w0, wzr, #0x80000000
    4f44:      	bl	0x18bc <.text+0x8bc>
    4f48:      	mov	x8, #-0x8000000000000000 // =-9223372036854775808
    4f4c:      	movk	x8, #0x2
    4f50:      	ldp	x29, x30, [sp], #0x10
    4f54:      	mov	x0, x8
    4f58:      	ret
    4f5c:      	cbz	x0, 0x4f74 <.text+0x3f74>
    4f60:      	cbz	x1, 0x4f74 <.text+0x3f74>
    4f64:      	ldr	x8, [x0, #0x78]
    4f68:      	mov	x0, xzr
    4f6c:      	str	x8, [x1]
    4f70:      	ret
    4f74:      	stp	x29, x30, [sp, #-0x10]!
    4f78:      	mov	x29, sp
    4f7c:      	adrp	x1, 0x7000 <.text+0x6000>
    4f80:      	adrp	x2, 0xa000 <.text+0x9000>
    4f84:      	add	x1, x1, #0xf1e
    4f88:      	add	x2, x2, #0x43d
    4f8c:      	orr	w0, wzr, #0x80000000
    4f90:      	bl	0x18bc <.text+0x8bc>
    4f94:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4f98:      	movk	x0, #0x2
    4f9c:      	ldp	x29, x30, [sp], #0x10
    4fa0:      	ret
    4fa4:      	stp	x29, x30, [sp, #-0x10]!
    4fa8:      	mov	x29, sp
    4fac:      	cbz	x0, 0x4fbc <.text+0x3fbc>
    4fb0:      	bl	0x54c8 <.text+0x44c8>
    4fb4:      	mov	x0, xzr
    4fb8:      	b	0x4fdc <.text+0x3fdc>
    4fbc:      	adrp	x1, 0x7000 <.text+0x6000>
    4fc0:      	adrp	x2, 0xa000 <.text+0x9000>
    4fc4:      	add	x1, x1, #0xf1e
    4fc8:      	add	x2, x2, #0x44e
    4fcc:      	orr	w0, wzr, #0x80000000
    4fd0:      	bl	0x18bc <.text+0x8bc>
    4fd4:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    4fd8:      	movk	x0, #0x2
    4fdc:      	ldp	x29, x30, [sp], #0x10
    4fe0:      	ret
    4fe4:      	stp	x29, x30, [sp, #-0x10]!
    4fe8:      	mov	x29, sp
    4fec:      	cbz	x0, 0x500c <.text+0x400c>
    4ff0:      	and	w8, w1, #0xff
    4ff4:      	cbz	w8, 0x5030 <.text+0x4030>
    4ff8:      	mov	w0, #0xc010000          // =201392128
    4ffc:      	movk	w0, #0x2210
    5000:      	mov	w1, #0x23               // =35
    5004:      	bl	0x7b30 <.text+0x6b30>
    5008:      	b	0x5038 <.text+0x4038>
    500c:      	adrp	x1, 0x7000 <.text+0x6000>
    5010:      	adrp	x2, 0xa000 <.text+0x9000>
    5014:      	add	x1, x1, #0xf1e
    5018:      	add	x2, x2, #0x45e
    501c:      	orr	w0, wzr, #0x80000000
    5020:      	bl	0x18bc <.text+0x8bc>
    5024:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    5028:      	movk	x0, #0x2
    502c:      	b	0x503c <.text+0x403c>
    5030:      	ldr	w1, [x0]
    5034:      	bl	0x4134 <.text+0x3134>
    5038:      	mov	x0, xzr
    503c:      	ldp	x29, x30, [sp], #0x10
    5040:      	ret
    5044:      	stp	x22, x21, [sp, #-0x30]!
    5048:      	stp	x20, x19, [sp, #0x10]
    504c:      	stp	x29, x30, [sp, #0x20]
    5050:      	add	x29, sp, #0x20
    5054:      	adrp	x21, 0xc000
    5058:      	ldr	w8, [x21, #0x4d0]
    505c:      	cmp	w8, #0xf
    5060:      	b.ne	0x514c <.text+0x414c>
    5064:      	mov	w19, #0xa920000         // =177340416
    5068:      	movk	w19, #0x20
    506c:      	sub	x20, x19, #0x1c
    5070:      	orr	w1, wzr, #0x7f
    5074:      	mov	x0, x20
    5078:      	bl	0x7b30 <.text+0x6b30>
    507c:      	mov	w1, wzr
    5080:      	mov	x0, x20
    5084:      	bl	0x7b30 <.text+0x6b30>
    5088:      	orr	x0, x19, #0x8
    508c:      	orr	w1, wzr, #0x3ff
    5090:      	bl	0x7b30 <.text+0x6b30>
    5094:      	orr	x0, x19, #0xc
    5098:      	orr	w1, wzr, #0x1f
    509c:      	bl	0x7b30 <.text+0x6b30>
    50a0:      	mov	w20, #0xa920000         // =177340416
    50a4:      	movk	w20, #0x9404
    50a8:      	mov	w1, #0x19               // =25
    50ac:      	mov	x0, x20
    50b0:      	bl	0x7b30 <.text+0x6b30>
    50b4:      	orr	x0, x20, #0x10
    50b8:      	orr	w1, wzr, #0x20
    50bc:      	bl	0x7b30 <.text+0x6b30>
    50c0:      	add	x0, x20, #0xc
    50c4:      	mov	w1, #0x79               // =121
    50c8:      	bl	0x7b30 <.text+0x6b30>
    50cc:      	add	x0, x20, #0x14
    50d0:      	mov	w1, wzr
    50d4:      	bl	0x7b30 <.text+0x6b30>
    50d8:      	mov	w1, #0x99               // =153
    50dc:      	mov	x0, x20
    50e0:      	bl	0x7b30 <.text+0x6b30>
    50e4:      	add	x0, x20, #0x4
    50e8:      	orr	w1, wzr, #0x4
    50ec:      	bl	0x7b30 <.text+0x6b30>
    50f0:      	mov	w1, #0xd9               // =217
    50f4:      	mov	x0, x20
    50f8:      	bl	0x7b30 <.text+0x6b30>
    50fc:      	orr	w1, wzr, #0x100000
    5100:      	mov	x0, x19
    5104:      	bl	0x7b30 <.text+0x6b30>
    5108:      	mov	w1, wzr
    510c:      	mov	x0, x19
    5110:      	bl	0x7b30 <.text+0x6b30>
    5114:      	mov	w1, #0x1a0              // =416
    5118:      	mov	x0, x19
    511c:      	bl	0x7b30 <.text+0x6b30>
    5120:      	sub	x0, x19, #0xc
    5124:      	mov	w1, #0x5                // =5
    5128:      	bl	0x7b30 <.text+0x6b30>
    512c:      	sub	x0, x19, #0x10
    5130:      	bl	0x7af8 <.text+0x6af8>
    5134:      	adrp	x8, 0xc000
    5138:      	mov	w0, #0x64               // =100
    513c:      	ldr	x9, [x8, #0x520]
    5140:      	ldr	x8, [x9, #0xf8]
    5144:      	blr	x8
    5148:      	ldr	w8, [x21, #0x4d0]
    514c:      	cmp	w8, #0x10
    5150:      	mov	w12, #0x10000           // =65536
    5154:      	orr	w11, wzr, #0x1
    5158:      	movk	w12, #0x8001
    515c:      	lsl	w8, w11, w8
    5160:      	and	w13, w8, w12
    5164:      	ccmp	w13, #0x0, #0x4, ls
    5168:      	b.ne	0x521c <.text+0x421c>
    516c:      	mov	w19, #0x110000          // =1114112
    5170:      	movk	w19, #0x2000
    5174:      	orr	w1, wzr, #0x1
    5178:      	mov	x0, x19
    517c:      	bl	0x7a64 <.text+0x6a64>
    5180:      	adrp	x21, 0xc000
    5184:      	mov	w20, #0x64              // =100
    5188:      	mov	x0, x20
    518c:      	ldr	x10, [x21, #0x520]
    5190:      	ldr	x9, [x10, #0xf8]
    5194:      	blr	x9
    5198:      	orr	w1, wzr, #0xfffffffe
    519c:      	mov	x0, x19
    51a0:      	bl	0x7a90 <.text+0x6a90>
    51a4:      	ldr	x11, [x21, #0x520]
    51a8:      	mov	x0, x20
    51ac:      	ldr	x10, [x11, #0xf8]
    51b0:      	blr	x10
    51b4:      	mov	w19, #0xc010000         // =201392128
    51b8:      	movk	w19, #0x2004
    51bc:      	add	x0, x19, #0x20c
    51c0:      	mov	w1, #0x23               // =35
    51c4:      	bl	0x7b30 <.text+0x6b30>
    51c8:      	ldr	x12, [x21, #0x520]
    51cc:      	mov	x0, x20
    51d0:      	ldr	x11, [x12, #0xf8]
    51d4:      	blr	x11
    51d8:      	mov	w1, #0x13               // =19
    51dc:      	mov	x0, x19
    51e0:      	bl	0x7b30 <.text+0x6b30>
    51e4:      	mov	w12, #0x188             // =392
    51e8:      	orr	x0, x19, x12
    51ec:      	orr	w1, wzr, #0x7c
    51f0:      	bl	0x7b30 <.text+0x6b30>
    51f4:      	mov	w13, #0x28              // =40
    51f8:      	orr	x0, x19, x13
    51fc:      	orr	w1, wzr, #0x80
    5200:      	bl	0x7b30 <.text+0x6b30>
    5204:      	orr	x0, x19, #0x180
    5208:      	mov	w1, #0xa                // =10
    520c:      	bl	0x7b30 <.text+0x6b30>
    5210:      	add	x0, x19, #0x23c
    5214:      	mov	w1, wzr
    5218:      	bl	0x7b30 <.text+0x6b30>
    521c:      	ldp	x29, x30, [sp, #0x20]
    5220:      	mov	x0, xzr
    5224:      	ldp	x20, x19, [sp, #0x10]
    5228:      	ldp	x22, x21, [sp], #0x30
    522c:      	ret
    5230:      	stp	x29, x30, [sp, #-0x10]!
    5234:      	mov	x29, sp
    5238:      	cbz	x0, 0x5248 <.text+0x4248>
    523c:      	bl	0x6e68 <.text+0x5e68>
    5240:      	mov	x0, xzr
    5244:      	b	0x526c <.text+0x426c>
    5248:      	adrp	x1, 0xa000 <.text+0x9000>
    524c:      	adrp	x2, 0xa000 <.text+0x9000>
    5250:      	add	x1, x1, #0xe4
    5254:      	add	x2, x2, #0x13d
    5258:      	orr	w0, wzr, #0x80000000
    525c:      	mov	x3, xzr
    5260:      	bl	0x18bc <.text+0x8bc>
    5264:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    5268:      	movk	x0, #0x2
    526c:      	ldp	x29, x30, [sp], #0x10
    5270:      	ret
    5274:      	stp	x20, x19, [sp, #-0x20]!
    5278:      	stp	x29, x30, [sp, #0x10]
    527c:      	add	x29, sp, #0x10
    5280:      	sub	sp, sp, #0x10
    5284:      	adrp	x20, 0xc000
    5288:      	mov	w19, w0
    528c:      	ldr	x8, [x20, #0x550]
    5290:      	cbz	x8, 0x52e0 <.text+0x42e0>
    5294:      	ldr	x9, [x8, #0x50]
    5298:      	adrp	x1, 0x9000 <.text+0x8000>
    529c:      	add	x1, x1, #0xf5a
    52a0:      	add	x2, sp, #0x8
    52a4:      	mov	x0, x8
    52a8:      	blr	x9
    52ac:      	and	w8, w19, #0xff
    52b0:      	cbz	w8, 0x52d0 <.text+0x42d0>
    52b4:      	cmp	w8, #0x1
    52b8:      	b.ne	0x52e0 <.text+0x42e0>
    52bc:      	ldr	x0, [x20, #0x550]
    52c0:      	ldr	x1, [sp, #0x8]
    52c4:      	ldr	x8, [x0, #0x58]
    52c8:      	blr	x8
    52cc:      	b	0x52e0 <.text+0x42e0>
    52d0:      	ldr	x0, [x20, #0x550]
    52d4:      	ldr	x1, [sp, #0x8]
    52d8:      	ldr	x10, [x0, #0x60]
    52dc:      	blr	x10
    52e0:      	sub	sp, x29, #0x10
    52e4:      	ldp	x29, x30, [sp, #0x10]
    52e8:      	ldp	x20, x19, [sp], #0x20
    52ec:      	ret
    52f0:      	stp	x26, x25, [sp, #-0x50]!
    52f4:      	stp	x24, x23, [sp, #0x10]
    52f8:      	stp	x22, x21, [sp, #0x20]
    52fc:      	stp	x20, x19, [sp, #0x30]
    5300:      	stp	x29, x30, [sp, #0x40]
    5304:      	add	x29, sp, #0x40
    5308:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    530c:      	mov	x20, x0
    5310:      	movk	x19, #0x2
    5314:      	cbz	x20, 0x538c <.text+0x438c>
    5318:      	cbz	x1, 0x538c <.text+0x438c>
    531c:      	adrp	x8, 0xc000
    5320:      	ldr	x8, [x8, #0x550]
    5324:      	cbz	x8, 0x53a8 <.text+0x43a8>
    5328:      	adrp	x21, 0xa000 <.text+0x9000>
    532c:      	adrp	x22, 0xa000 <.text+0x9000>
    5330:      	mov	x19, xzr
    5334:      	mov	x23, xzr
    5338:      	add	x24, x1, #0xc
    533c:      	add	x21, x21, #0x1f3
    5340:      	add	x22, x22, #0x1c6
    5344:      	b	0x5350 <.text+0x4350>
    5348:      	add	x23, x23, #0x1
    534c:      	mov	x24, x25
    5350:      	cmp	x23, x20
    5354:      	b.eq	0x53c4 <.text+0x43c4>
    5358:      	ldur	x0, [x24, #-0xc]
    535c:      	add	x25, x24, #0x10
    5360:      	ldur	w1, [x24, #-0x4]
    5364:      	ldr	w2, [x24]
    5368:      	bl	0x6268 <.text+0x5268>
    536c:      	mov	x19, x0
    5370:      	tbz	x19, #0x3f, 0x5348 <.text+0x4348>
    5374:      	ldur	x3, [x24, #-0xc]
    5378:      	orr	w0, wzr, #0x80000000
    537c:      	mov	x1, x21
    5380:      	mov	x2, x22
    5384:      	bl	0x18bc <.text+0x8bc>
    5388:      	b	0x5348 <.text+0x4348>
    538c:      	adrp	x1, 0x7000 <.text+0x6000>
    5390:      	adrp	x2, 0xa000 <.text+0x9000>
    5394:      	add	x1, x1, #0xf1e
    5398:      	add	x2, x2, #0x1c6
    539c:      	orr	w0, wzr, #0x80000000
    53a0:      	bl	0x18bc <.text+0x8bc>
    53a4:      	b	0x53c4 <.text+0x43c4>
    53a8:      	adrp	x1, 0xa000 <.text+0x9000>
    53ac:      	adrp	x2, 0xa000 <.text+0x9000>
    53b0:      	add	x1, x1, #0x1d4
    53b4:      	add	x2, x2, #0x1c6
    53b8:      	orr	w0, wzr, #0x80000000
    53bc:      	bl	0x18bc <.text+0x8bc>
    53c0:      	add	x19, x19, #0xc
    53c4:      	mov	x0, x19
    53c8:      	ldp	x29, x30, [sp, #0x40]
    53cc:      	ldp	x20, x19, [sp, #0x30]
    53d0:      	ldp	x22, x21, [sp, #0x20]
    53d4:      	ldp	x24, x23, [sp, #0x10]
    53d8:      	ldp	x26, x25, [sp], #0x50
    53dc:      	ret
    53e0:      	stp	x26, x25, [sp, #-0x50]!
    53e4:      	stp	x24, x23, [sp, #0x10]
    53e8:      	stp	x22, x21, [sp, #0x20]
    53ec:      	stp	x20, x19, [sp, #0x30]
    53f0:      	stp	x29, x30, [sp, #0x40]
    53f4:      	add	x29, sp, #0x40
    53f8:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    53fc:      	mov	x21, x1
    5400:      	mov	x20, x0
    5404:      	movk	x19, #0x2
    5408:      	cbz	x20, 0x5474 <.text+0x4474>
    540c:      	cbz	x21, 0x5474 <.text+0x4474>
    5410:      	adrp	x8, 0xc000
    5414:      	ldr	x8, [x8, #0x550]
    5418:      	cbz	x8, 0x5490 <.text+0x4490>
    541c:      	adrp	x22, 0xa000 <.text+0x9000>
    5420:      	adrp	x23, 0xa000 <.text+0x9000>
    5424:      	mov	x19, xzr
    5428:      	mov	x24, xzr
    542c:      	add	x22, x22, #0x225
    5430:      	add	x23, x23, #0x214
    5434:      	b	0x5440 <.text+0x4440>
    5438:      	add	x24, x24, #0x1
    543c:      	mov	x21, x25
    5440:      	cmp	x24, x20
    5444:      	b.eq	0x54ac <.text+0x44ac>
    5448:      	ldr	x0, [x21]
    544c:      	add	x25, x21, #0x10
    5450:      	bl	0x6378 <.text+0x5378>
    5454:      	mov	x19, x0
    5458:      	tbz	x19, #0x3f, 0x5438 <.text+0x4438>
    545c:      	ldr	x3, [x21]
    5460:      	orr	w0, wzr, #0x80000000
    5464:      	mov	x1, x22
    5468:      	mov	x2, x23
    546c:      	bl	0x18bc <.text+0x8bc>
    5470:      	b	0x5438 <.text+0x4438>
    5474:      	adrp	x1, 0x7000 <.text+0x6000>
    5478:      	adrp	x2, 0xa000 <.text+0x9000>
    547c:      	add	x1, x1, #0xf1e
    5480:      	add	x2, x2, #0x214
    5484:      	orr	w0, wzr, #0x80000000
    5488:      	bl	0x18bc <.text+0x8bc>
    548c:      	b	0x54ac <.text+0x44ac>
    5490:      	adrp	x1, 0xa000 <.text+0x9000>
    5494:      	adrp	x2, 0xa000 <.text+0x9000>
    5498:      	add	x1, x1, #0x1d4
    549c:      	add	x2, x2, #0x214
    54a0:      	orr	w0, wzr, #0x80000000
    54a4:      	bl	0x18bc <.text+0x8bc>
    54a8:      	add	x19, x19, #0xc
    54ac:      	mov	x0, x19
    54b0:      	ldp	x29, x30, [sp, #0x40]
    54b4:      	ldp	x20, x19, [sp, #0x30]
    54b8:      	ldp	x22, x21, [sp, #0x20]
    54bc:      	ldp	x24, x23, [sp, #0x10]
    54c0:      	ldp	x26, x25, [sp], #0x50
    54c4:      	ret
    54c8:      	stp	x26, x25, [sp, #-0x50]!
    54cc:      	stp	x24, x23, [sp, #0x10]
    54d0:      	stp	x22, x21, [sp, #0x20]
    54d4:      	stp	x20, x19, [sp, #0x30]
    54d8:      	stp	x29, x30, [sp, #0x40]
    54dc:      	add	x29, sp, #0x40
    54e0:      	sub	sp, sp, #0x40
    54e4:      	adrp	x8, 0xc000
    54e8:      	mov	x20, x0
    54ec:      	mov	w10, #0x10000           // =65536
    54f0:      	ldr	w8, [x8, #0x4d0]
    54f4:      	orr	w9, wzr, #0x1
    54f8:      	movk	w10, #0x8001
    54fc:      	cmp	w8, #0x10
    5500:      	lsl	w8, w9, w8
    5504:      	and	w12, w8, w10
    5508:      	ccmp	w12, #0x0, #0x4, ls
    550c:      	b.ne	0x5bdc <.text+0x4bdc>
    5510:      	ldr	x8, [x20, #0x78]
    5514:      	mov	w9, #0xa800000          // =176160768
    5518:      	cmp	x8, x9
    551c:      	b.ne	0x5be4 <.text+0x4be4>
    5520:      	mov	w21, #0x150000          // =1376256
    5524:      	movk	w21, #0x4
    5528:      	orr	w1, wzr, #0xfffffffe
    552c:      	mov	x0, x21
    5530:      	mov	w19, #0xc010000         // =201392128
    5534:      	movk	w19, #0xa00
    5538:      	bl	0x7a90 <.text+0x6a90>
    553c:      	add	x22, x21, #0x1c
    5540:      	orr	w1, wzr, #0x1
    5544:      	mov	x0, x22
    5548:      	bl	0x7a64 <.text+0x6a64>
    554c:      	orr	x23, x21, #0x20
    5550:      	orr	w1, wzr, #0x1
    5554:      	mov	x0, x23
    5558:      	bl	0x7a64 <.text+0x6a64>
    555c:      	adrp	x25, 0xc000
    5560:      	mov	w24, #0x64              // =100
    5564:      	mov	x0, x24
    5568:      	ldr	x9, [x25, #0x520]
    556c:      	ldr	x11, [x9, #0xf8]
    5570:      	blr	x11
    5574:      	orr	w1, wzr, #0xfffffffe
    5578:      	mov	x0, x23
    557c:      	bl	0x7a90 <.text+0x6a90>
    5580:      	orr	w1, wzr, #0xfffffffe
    5584:      	mov	x0, x22
    5588:      	bl	0x7a90 <.text+0x6a90>
    558c:      	ldr	x10, [x25, #0x520]
    5590:      	mov	x0, x24
    5594:      	ldr	x12, [x10, #0xf8]
    5598:      	blr	x12
    559c:      	orr	w1, wzr, #0x1
    55a0:      	mov	x0, x21
    55a4:      	bl	0x7a64 <.text+0x6a64>
    55a8:      	add	x0, x19, #0x204
    55ac:      	orr	w1, wzr, #0x1
    55b0:      	bl	0x7b30 <.text+0x6b30>
    55b4:      	adrp	x0, 0xa000 <.text+0x9000>
    55b8:      	add	x0, x0, #0xa8
    55bc:      	mov	x1, sp
    55c0:      	bl	0x76a0 <.text+0x66a0>
    55c4:      	cbnz	w0, 0x5600 <.text+0x4600>
    55c8:      	adrp	x1, 0xa000 <.text+0x9000>
    55cc:      	mov	w2, wzr
    55d0:      	add	x1, x1, #0x247
    55d4:      	mov	x0, sp
    55d8:      	add	x3, sp, #0x20
    55dc:      	bl	0x76c0 <.text+0x66c0>
    55e0:      	cbnz	w0, 0x5600 <.text+0x4600>
    55e4:      	adrp	x1, 0xa000 <.text+0x9000>
    55e8:      	mov	w2, wzr
    55ec:      	add	x1, x1, #0x257
    55f0:      	mov	x0, sp
    55f4:      	add	x3, sp, #0x10
    55f8:      	bl	0x76c0 <.text+0x66c0>
    55fc:      	cbz	w0, 0x5c58 <.text+0x4c58>
    5600:      	sub	x0, x19, #0x980
    5604:      	mov	w1, #0x14               // =20
    5608:      	bl	0x7b30 <.text+0x6b30>
    560c:      	sub	x0, x19, #0x9cc
    5610:      	orr	w1, wzr, #0x4
    5614:      	bl	0x7b30 <.text+0x6b30>
    5618:      	sub	x0, x19, #0x8c8
    561c:      	orr	w1, wzr, #0x30
    5620:      	bl	0x7b30 <.text+0x6b30>
    5624:      	sub	x0, x19, #0x9c4
    5628:      	orr	w1, wzr, #0x6
    562c:      	bl	0x7b30 <.text+0x6b30>
    5630:      	sub	x0, x19, #0x978
    5634:      	mov	w1, wzr
    5638:      	bl	0x7b30 <.text+0x6b30>
    563c:      	sub	x0, x19, #0x974
    5640:      	orr	w1, wzr, #0x8
    5644:      	bl	0x7b30 <.text+0x6b30>
    5648:      	sub	x0, x19, #0x8a4
    564c:      	orr	w1, wzr, #0x6
    5650:      	bl	0x7b30 <.text+0x6b30>
    5654:      	sub	x0, x19, #0x89c
    5658:      	orr	w1, wzr, #0x1
    565c:      	bl	0x7b30 <.text+0x6b30>
    5660:      	sub	x0, x19, #0x8c4
    5664:      	mov	w1, wzr
    5668:      	bl	0x7b30 <.text+0x6b30>
    566c:      	sub	x0, x19, #0x950
    5670:      	mov	w1, #0x82               // =130
    5674:      	bl	0x7b30 <.text+0x6b30>
    5678:      	sub	x0, x19, #0x948
    567c:      	mov	w1, #0xab               // =171
    5680:      	bl	0x7b30 <.text+0x6b30>
    5684:      	sub	x0, x19, #0x944
    5688:      	mov	w1, #0xea               // =234
    568c:      	bl	0x7b30 <.text+0x6b30>
    5690:      	sub	x0, x19, #0x940
    5694:      	orr	w1, wzr, #0x2
    5698:      	bl	0x7b30 <.text+0x6b30>
    569c:      	sub	x0, x19, #0x9a0
    56a0:      	orr	w1, wzr, #0x8
    56a4:      	bl	0x7b30 <.text+0x6b30>
    56a8:      	mov	w21, #0x16              // =22
    56ac:      	sub	x0, x19, #0x998
    56b0:      	mov	w1, w21
    56b4:      	bl	0x7b30 <.text+0x6b30>
    56b8:      	mov	w22, #0x34              // =52
    56bc:      	sub	x0, x19, #0x990
    56c0:      	mov	w1, w22
    56c4:      	bl	0x7b30 <.text+0x6b30>
    56c8:      	sub	x0, x19, #0x928
    56cc:      	orr	w1, wzr, #0x3f
    56d0:      	bl	0x7b30 <.text+0x6b30>
    56d4:      	sub	x0, x19, #0x924
    56d8:      	mov	w1, wzr
    56dc:      	bl	0x7b30 <.text+0x6b30>
    56e0:      	mov	w23, #0xa               // =10
    56e4:      	sub	x0, x19, #0x8b8
    56e8:      	mov	w1, w23
    56ec:      	bl	0x7b30 <.text+0x6b30>
    56f0:      	sub	x0, x19, #0x968
    56f4:      	mov	w1, #0x15               // =21
    56f8:      	bl	0x7b30 <.text+0x6b30>
    56fc:      	sub	x0, x19, #0x964
    5700:      	mov	w1, w22
    5704:      	bl	0x7b30 <.text+0x6b30>
    5708:      	sub	x0, x19, #0x960
    570c:      	mov	w1, wzr
    5710:      	bl	0x7b30 <.text+0x6b30>
    5714:      	sub	x0, x19, #0x970
    5718:      	orr	w1, wzr, #0x4
    571c:      	bl	0x7b30 <.text+0x6b30>
    5720:      	sub	x0, x19, #0x8ac
    5724:      	mov	w1, wzr
    5728:      	bl	0x7b30 <.text+0x6b30>
    572c:      	sub	x0, x19, #0x96c
    5730:      	mov	w1, wzr
    5734:      	bl	0x7b30 <.text+0x6b30>
    5738:      	sub	x0, x19, #0x910
    573c:      	mov	w1, wzr
    5740:      	bl	0x7b30 <.text+0x6b30>
    5744:      	sub	x0, x19, #0x9f4
    5748:      	mov	w1, w23
    574c:      	bl	0x7b30 <.text+0x6b30>
    5750:      	sub	x0, x19, #0x9f0
    5754:      	orr	w1, wzr, #0x1
    5758:      	bl	0x7b30 <.text+0x6b30>
    575c:      	sub	x0, x19, #0x9e4
    5760:      	mov	w1, #0x31               // =49
    5764:      	bl	0x7b30 <.text+0x6b30>
    5768:      	sub	x0, x19, #0x9e0
    576c:      	orr	w1, wzr, #0x1
    5770:      	bl	0x7b30 <.text+0x6b30>
    5774:      	sub	x0, x19, #0x9ec
    5778:      	mov	w1, wzr
    577c:      	bl	0x7b30 <.text+0x6b30>
    5780:      	sub	x0, x19, #0x9e8
    5784:      	mov	w1, wzr
    5788:      	bl	0x7b30 <.text+0x6b30>
    578c:      	mov	w22, #0x85              // =133
    5790:      	sub	x0, x19, #0x9dc
    5794:      	mov	w1, w22
    5798:      	bl	0x7b30 <.text+0x6b30>
    579c:      	sub	x0, x19, #0x9d8
    57a0:      	orr	w1, wzr, #0x7
    57a4:      	bl	0x7b30 <.text+0x6b30>
    57a8:      	sub	x0, x19, #0x9b8
    57ac:      	orr	w1, wzr, #0xf
    57b0:      	bl	0x7b30 <.text+0x6b30>
    57b4:      	sub	x0, x19, #0x930
    57b8:      	orr	w1, wzr, #0x80
    57bc:      	bl	0x7b30 <.text+0x6b30>
    57c0:      	mov	w24, #0xb               // =11
    57c4:      	sub	x0, x19, #0x5d0
    57c8:      	mov	w1, w24
    57cc:      	bl	0x7b30 <.text+0x6b30>
    57d0:      	sub	x0, x19, #0x1d0
    57d4:      	mov	w1, w24
    57d8:      	bl	0x7b30 <.text+0x6b30>
    57dc:      	sub	x0, x19, #0x5bc
    57e0:      	orr	w1, wzr, #0x80
    57e4:      	bl	0x7b30 <.text+0x6b30>
    57e8:      	sub	x0, x19, #0x1bc
    57ec:      	orr	w1, wzr, #0x80
    57f0:      	bl	0x7b30 <.text+0x6b30>
    57f4:      	sub	x0, x19, #0x5c4
    57f8:      	mov	w1, wzr
    57fc:      	bl	0x7b30 <.text+0x6b30>
    5800:      	sub	x0, x19, #0x1c4
    5804:      	mov	w1, wzr
    5808:      	bl	0x7b30 <.text+0x6b30>
    580c:      	sub	x0, x19, #0x5c0
    5810:      	mov	w1, wzr
    5814:      	bl	0x7b30 <.text+0x6b30>
    5818:      	sub	x0, x19, #0x1c0
    581c:      	mov	w1, wzr
    5820:      	bl	0x7b30 <.text+0x6b30>
    5824:      	sub	x0, x19, #0x5f8
    5828:      	mov	w1, w23
    582c:      	bl	0x7b30 <.text+0x6b30>
    5830:      	sub	x0, x19, #0x1f8
    5834:      	mov	w1, w23
    5838:      	bl	0x7b30 <.text+0x6b30>
    583c:      	sub	x0, x19, #0x5ec
    5840:      	orr	w1, wzr, #0x6
    5844:      	bl	0x7b30 <.text+0x6b30>
    5848:      	sub	x0, x19, #0x1ec
    584c:      	orr	w1, wzr, #0x6
    5850:      	bl	0x7b30 <.text+0x6b30>
    5854:      	mov	w23, #0x75              // =117
    5858:      	sub	x0, x19, #0x5cc
    585c:      	mov	w1, w23
    5860:      	bl	0x7b30 <.text+0x6b30>
    5864:      	sub	x0, x19, #0x1cc
    5868:      	mov	w1, w23
    586c:      	bl	0x7b30 <.text+0x6b30>
    5870:      	sub	x0, x19, #0x52c
    5874:      	orr	w1, wzr, #0xf
    5878:      	bl	0x7b30 <.text+0x6b30>
    587c:      	sub	x0, x19, #0x12c
    5880:      	orr	w1, wzr, #0xf
    5884:      	bl	0x7b30 <.text+0x6b30>
    5888:      	mov	w24, #0x4e              // =78
    588c:      	sub	x0, x19, #0x528
    5890:      	mov	w1, w24
    5894:      	bl	0x7b30 <.text+0x6b30>
    5898:      	sub	x0, x19, #0x128
    589c:      	mov	w1, w24
    58a0:      	bl	0x7b30 <.text+0x6b30>
    58a4:      	sub	x0, x19, #0x524
    58a8:      	orr	w1, wzr, #0x18
    58ac:      	bl	0x7b30 <.text+0x6b30>
    58b0:      	sub	x0, x19, #0x124
    58b4:      	orr	w1, wzr, #0x18
    58b8:      	bl	0x7b30 <.text+0x6b30>
    58bc:      	sub	x0, x19, #0x508
    58c0:      	orr	w1, wzr, #0x7
    58c4:      	bl	0x7b30 <.text+0x6b30>
    58c8:      	sub	x0, x19, #0x108
    58cc:      	orr	w1, wzr, #0x7
    58d0:      	bl	0x7b30 <.text+0x6b30>
    58d4:      	sub	x0, x19, #0x504
    58d8:      	orr	w1, wzr, #0x80
    58dc:      	bl	0x7b30 <.text+0x6b30>
    58e0:      	sub	x0, x19, #0x104
    58e4:      	orr	w1, wzr, #0x80
    58e8:      	bl	0x7b30 <.text+0x6b30>
    58ec:      	sub	x0, x19, #0x4fc
    58f0:      	orr	w1, wzr, #0x3
    58f4:      	bl	0x7b30 <.text+0x6b30>
    58f8:      	sub	x0, x19, #0xfc
    58fc:      	orr	w1, wzr, #0x3
    5900:      	bl	0x7b30 <.text+0x6b30>
    5904:      	sub	x0, x19, #0x4f4
    5908:      	mov	w1, w21
    590c:      	bl	0x7b30 <.text+0x6b30>
    5910:      	sub	x0, x19, #0xf4
    5914:      	mov	w1, w21
    5918:      	bl	0x7b30 <.text+0x6b30>
    591c:      	sub	x0, x19, #0x500
    5920:      	mov	w1, wzr
    5924:      	bl	0x7b30 <.text+0x6b30>
    5928:      	sub	x0, x19, #0x100
    592c:      	mov	w1, wzr
    5930:      	bl	0x7b30 <.text+0x6b30>
    5934:      	mov	w24, #0x5               // =5
    5938:      	sub	x0, x19, #0x49c
    593c:      	mov	w1, w24
    5940:      	bl	0x7b30 <.text+0x6b30>
    5944:      	sub	x0, x19, #0x9c
    5948:      	mov	w1, w24
    594c:      	bl	0x7b30 <.text+0x6b30>
    5950:      	sub	x0, x19, #0x7a0
    5954:      	orr	w1, wzr, #0x10
    5958:      	bl	0x7b30 <.text+0x6b30>
    595c:      	sub	x0, x19, #0x3a0
    5960:      	orr	w1, wzr, #0x10
    5964:      	bl	0x7b30 <.text+0x6b30>
    5968:      	mov	w24, #0x12              // =18
    596c:      	sub	x0, x19, #0x75c
    5970:      	mov	w1, w24
    5974:      	bl	0x7b30 <.text+0x6b30>
    5978:      	sub	x0, x19, #0x35c
    597c:      	mov	w1, w24
    5980:      	bl	0x7b30 <.text+0x6b30>
    5984:      	sub	x0, x19, #0x774
    5988:      	mov	w1, w21
    598c:      	bl	0x7b30 <.text+0x6b30>
    5990:      	sub	x0, x19, #0x374
    5994:      	mov	w1, w21
    5998:      	bl	0x7b30 <.text+0x6b30>
    599c:      	sub	x0, x19, #0x7bc
    59a0:      	mov	w1, wzr
    59a4:      	bl	0x7b30 <.text+0x6b30>
    59a8:      	sub	x0, x19, #0x3bc
    59ac:      	mov	w1, wzr
    59b0:      	bl	0x7b30 <.text+0x6b30>
    59b4:      	sub	x0, x19, #0x7b8
    59b8:      	mov	w1, wzr
    59bc:      	bl	0x7b30 <.text+0x6b30>
    59c0:      	sub	x0, x19, #0x3b8
    59c4:      	mov	w1, wzr
    59c8:      	bl	0x7b30 <.text+0x6b30>
    59cc:      	add	x0, x19, #0x20c
    59d0:      	mov	w1, #0x9f               // =159
    59d4:      	bl	0x7b30 <.text+0x6b30>
    59d8:      	add	x0, x19, #0x224
    59dc:      	mov	w1, #0x17               // =23
    59e0:      	bl	0x7b30 <.text+0x6b30>
    59e4:      	add	x0, x19, #0x228
    59e8:      	orr	w1, wzr, #0xf
    59ec:      	bl	0x7b30 <.text+0x6b30>
    59f0:      	add	x0, x19, #0x2c8
    59f4:      	mov	w1, #0x83               // =131
    59f8:      	bl	0x7b30 <.text+0x6b30>
    59fc:      	add	x0, x19, #0x2c4
    5a00:      	orr	w1, wzr, #0x2
    5a04:      	bl	0x7b30 <.text+0x6b30>
    5a08:      	add	x0, x19, #0x2cc
    5a0c:      	mov	w1, #0x9                // =9
    5a10:      	bl	0x7b30 <.text+0x6b30>
    5a14:      	add	x0, x19, #0x2d0
    5a18:      	mov	w1, #0xa2               // =162
    5a1c:      	bl	0x7b30 <.text+0x6b30>
    5a20:      	add	x0, x19, #0x2d4
    5a24:      	mov	w1, w22
    5a28:      	bl	0x7b30 <.text+0x6b30>
    5a2c:      	add	x0, x19, #0x280
    5a30:      	mov	w1, #0xd1               // =209
    5a34:      	bl	0x7b30 <.text+0x6b30>
    5a38:      	add	x0, x19, #0x284
    5a3c:      	orr	w1, wzr, #0x1f
    5a40:      	bl	0x7b30 <.text+0x6b30>
    5a44:      	add	x0, x19, #0x288
    5a48:      	mov	w1, #0x47               // =71
    5a4c:      	bl	0x7b30 <.text+0x6b30>
    5a50:      	add	x0, x19, #0x2b8
    5a54:      	mov	w1, w23
    5a58:      	bl	0x7b30 <.text+0x6b30>
    5a5c:      	add	x0, x19, #0x2bc
    5a60:      	mov	w1, #0x13               // =19
    5a64:      	bl	0x7b30 <.text+0x6b30>
    5a68:      	add	x0, x19, #0x2b0
    5a6c:      	mov	w1, #0x86               // =134
    5a70:      	bl	0x7b30 <.text+0x6b30>
    5a74:      	add	x0, x19, #0x2a0
    5a78:      	orr	w1, wzr, #0x4
    5a7c:      	bl	0x7b30 <.text+0x6b30>
    5a80:      	add	x0, x19, #0x28c
    5a84:      	mov	w1, #0x44               // =68
    5a88:      	bl	0x7b30 <.text+0x6b30>
    5a8c:      	add	x0, x19, #0x270
    5a90:      	mov	w1, #0xe7               // =231
    5a94:      	bl	0x7b30 <.text+0x6b30>
    5a98:      	add	x0, x19, #0x274
    5a9c:      	orr	w1, wzr, #0x3
    5aa0:      	bl	0x7b30 <.text+0x6b30>
    5aa4:      	add	x0, x19, #0x278
    5aa8:      	orr	w1, wzr, #0x40
    5aac:      	bl	0x7b30 <.text+0x6b30>
    5ab0:      	add	x0, x19, #0x27c
    5ab4:      	mov	w1, wzr
    5ab8:      	bl	0x7b30 <.text+0x6b30>
    5abc:      	add	x0, x19, #0x3d8
    5ac0:      	mov	w1, #0xba               // =186
    5ac4:      	bl	0x7b30 <.text+0x6b30>
    5ac8:      	mov	w1, wzr
    5acc:      	mov	x0, x19
    5ad0:      	bl	0x7b30 <.text+0x6b30>
    5ad4:      	ldr	w2, [x20, #0xb0]
    5ad8:      	orr	w1, wzr, #0xfffffffe
    5adc:      	mov	x0, x19
    5ae0:      	bl	0x7abc <.text+0x6abc>
    5ae4:      	orr	w1, wzr, #0xfffffffd
    5ae8:      	orr	w2, wzr, #0x2
    5aec:      	mov	x0, x19
    5af0:      	bl	0x7abc <.text+0x6abc>
    5af4:      	add	x0, x19, #0x200
    5af8:      	mov	w1, wzr
    5afc:      	bl	0x7b30 <.text+0x6b30>
    5b00:      	add	x0, x19, #0x208
    5b04:      	orr	w1, wzr, #0x3
    5b08:      	bl	0x7b30 <.text+0x6b30>
    5b0c:      	mov	x22, #-0x1              // =-1
    5b10:      	mov	w20, #0x3e8             // =1000
    5b14:      	b	0x5b28 <.text+0x4b28>
    5b18:      	ldr	x11, [x25, #0x520]
    5b1c:      	mov	x0, x20
    5b20:      	ldr	x14, [x11, #0xf8]
    5b24:      	blr	x14
    5b28:      	add	x21, x19, #0x374
    5b2c:      	mov	x0, x21
    5b30:      	bl	0x7af8 <.text+0x6af8>
    5b34:      	tbz	w0, #0x6, 0x5b5c <.text+0x4b5c>
    5b38:      	add	x22, x22, #0x1
    5b3c:      	cmp	x22, #0x3e8
    5b40:      	b.lo	0x5b18 <.text+0x4b18>
    5b44:      	adrp	x1, 0xa000 <.text+0x9000>
    5b48:      	adrp	x2, 0xa000 <.text+0x9000>
    5b4c:      	add	x1, x1, #0x266
    5b50:      	add	x2, x2, #0x286
    5b54:      	orr	w0, wzr, #0x80000000
    5b58:      	bl	0x18bc <.text+0x8bc>
    5b5c:      	mov	x0, x21
    5b60:      	bl	0x7af8 <.text+0x6af8>
    5b64:      	mov	w3, w0
    5b68:      	tbnz	w3, #0x6, 0x5bec <.text+0x4bec>
    5b6c:      	adrp	x20, 0xc000
    5b70:      	adrp	x1, 0xa000 <.text+0x9000>
    5b74:      	orr	w13, wzr, #0x4
    5b78:      	ldr	x0, [x20, #0x550]
    5b7c:      	add	x1, x1, #0x8
    5b80:      	add	x2, sp, #0x30
    5b84:      	ldr	x15, [x0, #0x8]
    5b88:      	strb	w13, [sp, #0x3f]
    5b8c:      	blr	x15
    5b90:      	mov	x19, x0
    5b94:      	tbnz	x19, #0x3f, 0x5bc8 <.text+0x4bc8>
    5b98:      	ldr	x0, [x20, #0x550]
    5b9c:      	mov	w2, #0x7730000          // =124977152
    5ba0:      	ldr	x1, [sp, #0x30]
    5ba4:      	mov	w3, wzr
    5ba8:      	mov	w4, wzr
    5bac:      	movk	w2, #0x5940
    5bb0:      	ldr	x16, [x0, #0x48]
    5bb4:      	mov	w5, wzr
    5bb8:      	mov	w6, wzr
    5bbc:      	mov	w7, wzr
    5bc0:      	blr	x16
    5bc4:      	mov	x19, x0
    5bc8:      	ldr	x12, [x25, #0x520]
    5bcc:      	mov	w0, #0x64               // =100
    5bd0:      	ldr	x17, [x12, #0xf8]
    5bd4:      	blr	x17
    5bd8:      	b	0x5c0c <.text+0x4c0c>
    5bdc:      	mov	x19, xzr
    5be0:      	b	0x5c0c <.text+0x4c0c>
    5be4:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    5be8:      	b	0x5c0c <.text+0x4c0c>
    5bec:      	adrp	x1, 0xa000 <.text+0x9000>
    5bf0:      	adrp	x2, 0xa000 <.text+0x9000>
    5bf4:      	add	x1, x1, #0x293
    5bf8:      	add	x2, x2, #0x286
    5bfc:      	orr	w0, wzr, #0x80000000
    5c00:      	bl	0x18bc <.text+0x8bc>
    5c04:      	mov	x19, #-0x7ffffffffffffff9 // =-9223372036854775801
    5c08:      	strb	wzr, [sp, #0x3f]
    5c0c:      	adrp	x13, 0xc000
    5c10:      	adrp	x0, 0xa000 <.text+0x9000>
    5c14:      	adrp	x1, 0xc000
    5c18:      	ldr	x14, [x13, #0x508]
    5c1c:      	add	x0, x0, #0x4bc
    5c20:      	add	x1, x1, #0x50
    5c24:      	orr	w2, wzr, #0x3
    5c28:      	orr	w3, wzr, #0x1
    5c2c:      	ldr	x5, [x14, #0x58]
    5c30:      	add	x4, sp, #0x3f
    5c34:      	blr	x5
    5c38:      	mov	x0, x19
    5c3c:      	sub	sp, x29, #0x40
    5c40:      	ldp	x29, x30, [sp, #0x40]
    5c44:      	ldp	x20, x19, [sp, #0x30]
    5c48:      	ldp	x22, x21, [sp, #0x20]
    5c4c:      	ldp	x24, x23, [sp, #0x10]
    5c50:      	ldp	x26, x25, [sp], #0x50
    5c54:      	ret
    5c58:      	ldr	x0, [sp, #0x28]
    5c5c:      	mov	w2, wzr
    5c60:      	ldr	x1, [sp, #0x18]
    5c64:      	mov	w3, #0x84               // =132
    5c68:      	bl	0x408c <.text+0x308c>
    5c6c:      	b	0x5ad4 <.text+0x4ad4>
    5c70:      	stp	x20, x19, [sp, #-0x20]!
    5c74:      	stp	x29, x30, [sp, #0x10]
    5c78:      	add	x29, sp, #0x10
    5c7c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    5c80:      	mov	x20, x1
    5c84:      	movk	x19, #0x2
    5c88:      	cbz	x20, 0x5cb0 <.text+0x4cb0>
    5c8c:      	orr	w0, wzr, #0x20
    5c90:      	bl	0x6e58 <.text+0x5e58>
    5c94:      	cbz	x0, 0x5cd0 <.text+0x4cd0>
    5c98:      	mov	x19, xzr
    5c9c:      	orr	w8, wzr, #0x1
    5ca0:      	stp	wzr, w8, [x0]
    5ca4:      	str	wzr, [x0, #0x1c]
    5ca8:      	str	x0, [x20]
    5cac:      	b	0x5cec <.text+0x4cec>
    5cb0:      	adrp	x1, 0xa000 <.text+0x9000>
    5cb4:      	adrp	x2, 0xa000 <.text+0x9000>
    5cb8:      	add	x1, x1, #0x520
    5cbc:      	add	x2, x2, #0x54a
    5cc0:      	orr	w0, wzr, #0x80000000
    5cc4:      	mov	x3, xzr
    5cc8:      	bl	0x18bc <.text+0x8bc>
    5ccc:      	b	0x5cec <.text+0x4cec>
    5cd0:      	adrp	x1, 0xa000 <.text+0x9000>
    5cd4:      	adrp	x2, 0xa000 <.text+0x9000>
    5cd8:      	add	x1, x1, #0x55d
    5cdc:      	add	x2, x2, #0x54a
    5ce0:      	orr	w0, wzr, #0x80000000
    5ce4:      	bl	0x18bc <.text+0x8bc>
    5ce8:      	add	x19, x19, #0x7
    5cec:      	ldp	x29, x30, [sp, #0x10]
    5cf0:      	mov	x0, x19
    5cf4:      	ldp	x20, x19, [sp], #0x20
    5cf8:      	ret
    5cfc:      	cbz	x0, 0x5d10 <.text+0x4d10>
    5d00:      	stp	x29, x30, [sp, #-0x10]!
    5d04:      	mov	x29, sp
    5d08:      	bl	0x6e68 <.text+0x5e68>
    5d0c:      	ldp	x29, x30, [sp], #0x10
    5d10:      	mov	x0, xzr
    5d14:      	ret
    5d18:      	stp	x26, x25, [sp, #-0x50]!
    5d1c:      	stp	x24, x23, [sp, #0x10]
    5d20:      	stp	x22, x21, [sp, #0x20]
    5d24:      	stp	x20, x19, [sp, #0x30]
    5d28:      	stp	x29, x30, [sp, #0x40]
    5d2c:      	add	x29, sp, #0x40
    5d30:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    5d34:      	mov	x20, x3
    5d38:      	mov	x23, x2
    5d3c:      	mov	x22, x1
    5d40:      	mov	x21, x0
    5d44:      	movk	x19, #0x2
    5d48:      	cbz	x21, 0x5db4 <.text+0x4db4>
    5d4c:      	cbz	x22, 0x5db4 <.text+0x4db4>
    5d50:      	cbz	x23, 0x5db4 <.text+0x4db4>
    5d54:      	cbz	x20, 0x5db4 <.text+0x4db4>
    5d58:      	adrp	x10, 0xc000
    5d5c:      	str	wzr, [x22]
    5d60:      	ldr	w8, [x10, #0x4d0]
    5d64:      	cmp	w8, #0x10
    5d68:      	b.hi	0x5dec <.text+0x4dec>
    5d6c:      	mov	w11, #0x10000           // =65536
    5d70:      	orr	w10, wzr, #0x1
    5d74:      	movk	w11, #0x8001
    5d78:      	lsl	w8, w10, w8
    5d7c:      	and	w12, w8, w11
    5d80:      	cbz	w12, 0x5dec <.text+0x4dec>
    5d84:      	ldr	w9, [x21, #0x4]
    5d88:      	cmp	w9, #0x1
    5d8c:      	b.ne	0x5de0 <.text+0x4de0>
    5d90:      	orr	w14, wzr, #0x2
    5d94:      	orr	w8, wzr, #0x4
    5d98:      	orr	w15, wzr, #0x1
    5d9c:      	str	w14, [x21, #0x4]
    5da0:      	mov	x19, xzr
    5da4:      	str	w14, [x22]
    5da8:      	str	x8, [x23]
    5dac:      	str	w15, [x20]
    5db0:      	b	0x5ef8 <.text+0x4ef8>
    5db4:      	adrp	x1, 0xa000 <.text+0x9000>
    5db8:      	adrp	x2, 0xa000 <.text+0x9000>
    5dbc:      	add	x1, x1, #0x573
    5dc0:      	add	x2, x2, #0x5c5
    5dc4:      	orr	w0, wzr, #0x80000000
    5dc8:      	mov	x3, x21
    5dcc:      	mov	x4, x22
    5dd0:      	mov	x5, x23
    5dd4:      	mov	x6, x20
    5dd8:      	bl	0x18bc <.text+0x8bc>
    5ddc:      	b	0x5ef8 <.text+0x4ef8>
    5de0:      	mov	x19, xzr
    5de4:      	str	wzr, [x22]
    5de8:      	b	0x5ef8 <.text+0x4ef8>
    5dec:      	adrp	x25, 0xc000
    5df0:      	ldr	x9, [x25, #0x558]
    5df4:      	cbz	x9, 0x5ec0 <.text+0x4ec0>
    5df8:      	ldr	x9, [x9, #0x38]
    5dfc:      	add	x24, x21, #0x1c
    5e00:      	orr	w0, wzr, #0x1
    5e04:      	mov	x1, x24
    5e08:      	blr	x9
    5e0c:      	mov	x19, x0
    5e10:      	tbnz	x19, #0x3f, 0x5ee0 <.text+0x4ee0>
    5e14:      	adrp	x11, 0xc000
    5e18:      	ldrb	w16, [x11, #0x578]
    5e1c:      	cbz	w16, 0x5e24 <.text+0x4e24>
    5e20:      	str	wzr, [x24]
    5e24:      	adrp	x12, 0xc000
    5e28:      	ldrb	w17, [x12, #0x579]
    5e2c:      	cbz	w17, 0x5e38 <.text+0x4e38>
    5e30:      	orr	w0, wzr, #0x1
    5e34:      	str	w0, [x24]
    5e38:      	adrp	x13, 0xc000
    5e3c:      	ldrb	w1, [x13, #0x57a]
    5e40:      	cbz	w1, 0x5f14 <.text+0x4f14>
    5e44:      	orr	w2, wzr, #0x2
    5e48:      	str	w2, [x24]
    5e4c:      	ldr	w11, [x21, #0x4]
    5e50:      	cmp	w11, #0x2
    5e54:      	b.eq	0x5ef8 <.text+0x4ef8>
    5e58:      	orr	w7, wzr, #0x2
    5e5c:      	orr	w9, wzr, #0x1
    5e60:      	orr	w12, wzr, #0x4
    5e64:      	str	w7, [x22]
    5e68:      	str	w9, [x20]
    5e6c:      	str	x12, [x23]
    5e70:      	ldr	w13, [x22]
    5e74:      	cmp	w13, #0x2
    5e78:      	b.ne	0x5f54 <.text+0x4f54>
    5e7c:      	orr	w14, wzr, #0x2
    5e80:      	add	x1, x21, #0x8
    5e84:      	orr	w0, wzr, #0x1
    5e88:      	str	w14, [x21, #0x4]
    5e8c:      	ldr	x15, [x25, #0x558]
    5e90:      	ldr	x14, [x15, #0x30]
    5e94:      	blr	x14
    5e98:      	mov	x19, x0
    5e9c:      	tbz	x19, #0x3f, 0x5ef8 <.text+0x4ef8>
    5ea0:      	adrp	x1, 0xa000 <.text+0x9000>
    5ea4:      	adrp	x2, 0xa000 <.text+0x9000>
    5ea8:      	add	x1, x1, #0x766
    5eac:      	add	x2, x2, #0x6ed
    5eb0:      	orr	w0, wzr, #0x80000000
    5eb4:      	mov	x3, x19
    5eb8:      	bl	0x18bc <.text+0x8bc>
    5ebc:      	b	0x5ef8 <.text+0x4ef8>
    5ec0:      	adrp	x1, 0xa000 <.text+0x9000>
    5ec4:      	adrp	x2, 0xa000 <.text+0x9000>
    5ec8:      	add	x1, x1, #0x6c5
    5ecc:      	add	x2, x2, #0x6ed
    5ed0:      	orr	w0, wzr, #0x80000000
    5ed4:      	bl	0x18bc <.text+0x8bc>
    5ed8:      	add	x19, x19, #0xc
    5edc:      	b	0x5ef8 <.text+0x4ef8>
    5ee0:      	adrp	x1, 0xa000 <.text+0x9000>
    5ee4:      	adrp	x2, 0xa000 <.text+0x9000>
    5ee8:      	add	x1, x1, #0x64b
    5eec:      	add	x2, x2, #0x6ed
    5ef0:      	orr	w0, wzr, #0x80000000
    5ef4:      	bl	0x18bc <.text+0x8bc>
    5ef8:      	mov	x0, x19
    5efc:      	ldp	x29, x30, [sp, #0x40]
    5f00:      	ldp	x20, x19, [sp, #0x30]
    5f04:      	ldp	x22, x21, [sp, #0x20]
    5f08:      	ldp	x24, x23, [sp, #0x10]
    5f0c:      	ldp	x26, x25, [sp], #0x50
    5f10:      	ret
    5f14:      	ldr	w8, [x24]
    5f18:      	cmp	w8, #0x3
    5f1c:      	b.hi	0x5fa8 <.text+0x4fa8>
    5f20:      	adrp	x14, 0xa000 <.text+0x9000>
    5f24:      	add	x14, x14, #0x4d8
    5f28:      	ldr	x10, [x14, x8, lsl #3]
    5f2c:      	br	x10
    5f30:      	ldr	w10, [x21, #0x4]
    5f34:      	cmp	w10, #0x1
    5f38:      	b.eq	0x5ef8 <.text+0x4ef8>
    5f3c:      	orr	w5, wzr, #0x1
    5f40:      	orr	w11, wzr, #0x4
    5f44:      	str	w5, [x22]
    5f48:      	str	wzr, [x20]
    5f4c:      	str	x11, [x23]
    5f50:      	b	0x5e70 <.text+0x4e70>
    5f54:      	orr	w15, wzr, #0x1
    5f58:      	add	x1, x21, #0x8
    5f5c:      	orr	w0, wzr, #0x1
    5f60:      	str	w15, [x21, #0x4]
    5f64:      	ldr	x16, [x25, #0x558]
    5f68:      	ldr	x2, [x16, #0x30]
    5f6c:      	ldp	x29, x30, [sp, #0x40]
    5f70:      	ldp	x20, x19, [sp, #0x30]
    5f74:      	ldp	x22, x21, [sp, #0x20]
    5f78:      	ldp	x24, x23, [sp, #0x10]
    5f7c:      	ldp	x26, x25, [sp], #0x50
    5f80:      	br	x2
    5f84:      	adrp	x1, 0xa000 <.text+0x9000>
    5f88:      	adrp	x2, 0xa000 <.text+0x9000>
    5f8c:      	add	x1, x1, #0x711
    5f90:      	add	x2, x2, #0x6ed
    5f94:      	orr	w0, wzr, #0x80000000
    5f98:      	bl	0x18bc <.text+0x8bc>
    5f9c:      	orr	w8, wzr, #0x3
    5fa0:      	str	w8, [x20]
    5fa4:      	b	0x5ef8 <.text+0x4ef8>
    5fa8:      	adrp	x1, 0xa000 <.text+0x9000>
    5fac:      	adrp	x2, 0xa000 <.text+0x9000>
    5fb0:      	add	x1, x1, #0x73c
    5fb4:      	add	x2, x2, #0x6ed
    5fb8:      	orr	w0, wzr, #0x80000000
    5fbc:      	bl	0x18bc <.text+0x8bc>
    5fc0:      	orr	w12, wzr, #0x3
    5fc4:      	str	w12, [x20]
    5fc8:      	b	0x5ef8 <.text+0x4ef8>
    5fcc:      	ldr	w12, [x21, #0x4]
    5fd0:      	cmp	w12, #0x2
    5fd4:      	b.eq	0x5ef8 <.text+0x4ef8>
    5fd8:      	orr	w11, wzr, #0x2
    5fdc:      	orr	w13, wzr, #0x4
    5fe0:      	str	w11, [x22]
    5fe4:      	str	w11, [x20]
    5fe8:      	str	x13, [x23]
    5fec:      	b	0x5e70 <.text+0x4e70>
    5ff0:      	mov	x8, x1
    5ff4:      	mov	x9, x0
    5ff8:      	cbz	x9, 0x6028 <.text+0x5028>
    5ffc:      	cbz	x8, 0x6028 <.text+0x5028>
    6000:      	ldr	w9, [x9, #0x1c]
    6004:      	cbz	w9, 0x6060 <.text+0x5060>
    6008:      	cmp	w9, #0x1
    600c:      	b.eq	0x606c <.text+0x506c>
    6010:      	cmp	w9, #0x2
    6014:      	b.ne	0x607c <.text+0x507c>
    6018:      	orr	w11, wzr, #0x1
    601c:      	mov	x0, xzr
    6020:      	str	w11, [x8]
    6024:      	ret
    6028:      	stp	x29, x30, [sp, #-0x10]!
    602c:      	mov	x29, sp
    6030:      	adrp	x1, 0xa000 <.text+0x9000>
    6034:      	adrp	x2, 0xa000 <.text+0x9000>
    6038:      	add	x1, x1, #0x5e0
    603c:      	add	x2, x2, #0x617
    6040:      	orr	w0, wzr, #0x80000000
    6044:      	mov	x3, x9
    6048:      	mov	x4, x8
    604c:      	bl	0x18bc <.text+0x8bc>
    6050:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    6054:      	movk	x0, #0x2
    6058:      	ldp	x29, x30, [sp], #0x10
    605c:      	ret
    6060:      	mov	x0, xzr
    6064:      	str	wzr, [x8]
    6068:      	ret
    606c:      	orr	w12, wzr, #0x2
    6070:      	mov	x0, xzr
    6074:      	str	w12, [x8]
    6078:      	ret
    607c:      	orr	w13, wzr, #0x3
    6080:      	mov	x0, xzr
    6084:      	str	w13, [x8]
    6088:      	ret
    608c:      	stp	x22, x21, [sp, #-0x30]!
    6090:      	stp	x20, x19, [sp, #0x10]
    6094:      	stp	x29, x30, [sp, #0x20]
    6098:      	add	x29, sp, #0x20
    609c:      	sub	sp, sp, #0x10
    60a0:      	mov	x19, x1
    60a4:      	str	wzr, [sp, #0xc]
    60a8:      	mov	x8, x0
    60ac:      	cbz	x8, 0x612c <.text+0x512c>
    60b0:      	cbz	x19, 0x612c <.text+0x512c>
    60b4:      	adrp	x21, 0xc000
    60b8:      	ldr	x8, [x21, #0x558]
    60bc:      	cbnz	x8, 0x60f0 <.text+0x50f0>
    60c0:      	adrp	x9, 0xc000
    60c4:      	adrp	x0, 0xc000
    60c8:      	adrp	x2, 0xc000
    60cc:      	ldr	x10, [x9, #0x520]
    60d0:      	mov	x1, xzr
    60d4:      	add	x0, x0, #0x150
    60d8:      	add	x2, x2, #0x558
    60dc:      	ldr	x9, [x10, #0x140]
    60e0:      	blr	x9
    60e4:      	mov	x20, x0
    60e8:      	tbnz	x20, #0x3f, 0x6174 <.text+0x5174>
    60ec:      	ldr	x8, [x21, #0x558]
    60f0:      	ldr	x10, [x8, #0x38]
    60f4:      	orr	w0, wzr, #0x1
    60f8:      	add	x1, sp, #0xc
    60fc:      	blr	x10
    6100:      	mov	x20, x0
    6104:      	tbnz	x20, #0x3f, 0x6158 <.text+0x5158>
    6108:      	ldr	w8, [sp, #0xc]
    610c:      	cbz	w8, 0x617c <.text+0x517c>
    6110:      	cmp	w8, #0x1
    6114:      	b.eq	0x6184 <.text+0x5184>
    6118:      	cmp	w8, #0x2
    611c:      	b.ne	0x6190 <.text+0x5190>
    6120:      	orr	w10, wzr, #0x1
    6124:      	str	w10, [x19]
    6128:      	b	0x6198 <.text+0x5198>
    612c:      	adrp	x1, 0xa000 <.text+0x9000>
    6130:      	adrp	x2, 0xa000 <.text+0x9000>
    6134:      	add	x1, x1, #0x5e0
    6138:      	add	x2, x2, #0x630
    613c:      	orr	w0, wzr, #0x80000000
    6140:      	mov	x3, x8
    6144:      	mov	x4, x19
    6148:      	bl	0x18bc <.text+0x8bc>
    614c:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    6150:      	movk	x20, #0x2
    6154:      	b	0x6198 <.text+0x5198>
    6158:      	adrp	x1, 0xa000 <.text+0x9000>
    615c:      	adrp	x2, 0xa000 <.text+0x9000>
    6160:      	add	x1, x1, #0x64b
    6164:      	add	x2, x2, #0x630
    6168:      	orr	w0, wzr, #0x80000000
    616c:      	bl	0x18bc <.text+0x8bc>
    6170:      	b	0x6198 <.text+0x5198>
    6174:      	str	xzr, [x21, #0x558]
    6178:      	b	0x6198 <.text+0x5198>
    617c:      	str	wzr, [x19]
    6180:      	b	0x6198 <.text+0x5198>
    6184:      	orr	w11, wzr, #0x2
    6188:      	str	w11, [x19]
    618c:      	b	0x6198 <.text+0x5198>
    6190:      	orr	w12, wzr, #0x3
    6194:      	str	w12, [x19]
    6198:      	mov	x0, x20
    619c:      	sub	sp, x29, #0x20
    61a0:      	ldp	x29, x30, [sp, #0x20]
    61a4:      	ldp	x20, x19, [sp, #0x10]
    61a8:      	ldp	x22, x21, [sp], #0x30
    61ac:      	ret
    61b0:      	mov	x8, x1
    61b4:      	mov	x9, x0
    61b8:      	cbz	x9, 0x61e8 <.text+0x51e8>
    61bc:      	cbz	x8, 0x61e8 <.text+0x51e8>
    61c0:      	ldr	w10, [x9, #0x8]
    61c4:      	cmp	w10, #0x4
    61c8:      	b.hi	0x6258 <.text+0x5258>
    61cc:      	adrp	x11, 0xa000 <.text+0x9000>
    61d0:      	add	x11, x11, #0x4f8
    61d4:      	ldr	x9, [x11, x10, lsl #3]
    61d8:      	br	x9
    61dc:      	mov	x0, xzr
    61e0:      	str	wzr, [x8]
    61e4:      	ret
    61e8:      	stp	x29, x30, [sp, #-0x10]!
    61ec:      	mov	x29, sp
    61f0:      	adrp	x1, 0xa000 <.text+0x9000>
    61f4:      	adrp	x2, 0xa000 <.text+0x9000>
    61f8:      	add	x1, x1, #0x675
    61fc:      	add	x2, x2, #0x6af
    6200:      	orr	w0, wzr, #0x80000000
    6204:      	mov	x3, x9
    6208:      	mov	x4, x8
    620c:      	bl	0x18bc <.text+0x8bc>
    6210:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    6214:      	movk	x0, #0x2
    6218:      	ldp	x29, x30, [sp], #0x10
    621c:      	ret
    6220:      	orr	w10, wzr, #0x1
    6224:      	mov	x0, xzr
    6228:      	str	w10, [x8]
    622c:      	ret
    6230:      	orr	w11, wzr, #0x2
    6234:      	mov	x0, xzr
    6238:      	str	w11, [x8]
    623c:      	ret
    6240:      	orr	w12, wzr, #0x3
    6244:      	mov	x0, xzr
    6248:      	str	w12, [x8]
    624c:      	ret
    6250:      	orr	w13, wzr, #0x4
    6254:      	str	w13, [x8]
    6258:      	orr	w14, wzr, #0x4
    625c:      	mov	x0, xzr
    6260:      	str	w14, [x8]
    6264:      	ret
    6268:      	stp	x24, x23, [sp, #-0x40]!
    626c:      	stp	x22, x21, [sp, #0x10]
    6270:      	stp	x20, x19, [sp, #0x20]
    6274:      	stp	x29, x30, [sp, #0x30]
    6278:      	add	x29, sp, #0x30
    627c:      	sub	sp, sp, #0x10
    6280:      	mov	w20, w2
    6284:      	mov	w22, w1
    6288:      	mov	x19, x0
    628c:      	cbz	x19, 0x6310 <.text+0x5310>
    6290:      	adrp	x23, 0xc000
    6294:      	ldr	x0, [x23, #0x550]
    6298:      	cbz	x0, 0x6310 <.text+0x5310>
    629c:      	ldr	x8, [x0, #0x8]
    62a0:      	add	x2, sp, #0x8
    62a4:      	mov	x1, x19
    62a8:      	blr	x8
    62ac:      	mov	x21, x0
    62b0:      	tbnz	x21, #0x3f, 0x6334 <.text+0x5334>
    62b4:      	cbz	w22, 0x62d4 <.text+0x52d4>
    62b8:      	ldr	x0, [x23, #0x550]
    62bc:      	mov	w3, wzr
    62c0:      	ldr	x1, [sp, #0x8]
    62c4:      	add	x4, sp, #0x4
    62c8:      	mov	w2, w22
    62cc:      	ldr	x9, [x0, #0x30]
    62d0:      	blr	x9
    62d4:      	ldr	x0, [x23, #0x550]
    62d8:      	ldr	x1, [sp, #0x8]
    62dc:      	ldr	x10, [x0, #0x10]
    62e0:      	blr	x10
    62e4:      	mov	x21, x0
    62e8:      	tbnz	x21, #0x3f, 0x6340 <.text+0x5340>
    62ec:      	cmp	w20, #0x2
    62f0:      	b.lo	0x635c <.text+0x535c>
    62f4:      	ldr	x0, [x23, #0x550]
    62f8:      	mov	w2, w20
    62fc:      	ldr	x1, [sp, #0x8]
    6300:      	ldr	x11, [x0, #0x78]
    6304:      	blr	x11
    6308:      	mov	x21, x0
    630c:      	b	0x635c <.text+0x535c>
    6310:      	adrp	x1, 0xa000 <.text+0x9000>
    6314:      	adrp	x2, 0xa000 <.text+0x9000>
    6318:      	add	x1, x1, #0x807
    631c:      	add	x2, x2, #0x81f
    6320:      	orr	w0, wzr, #0x80000000
    6324:      	bl	0x18bc <.text+0x8bc>
    6328:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    632c:      	movk	x21, #0x2
    6330:      	b	0x635c <.text+0x535c>
    6334:      	adrp	x1, 0xa000 <.text+0x9000>
    6338:      	add	x1, x1, #0x82b
    633c:      	b	0x6348 <.text+0x5348>
    6340:      	adrp	x1, 0xa000 <.text+0x9000>
    6344:      	add	x1, x1, #0x84e
    6348:      	adrp	x2, 0xa000 <.text+0x9000>
    634c:      	add	x2, x2, #0x81f
    6350:      	orr	w0, wzr, #0x80000000
    6354:      	mov	x3, x19
    6358:      	bl	0x18bc <.text+0x8bc>
    635c:      	mov	x0, x21
    6360:      	sub	sp, x29, #0x30
    6364:      	ldp	x29, x30, [sp, #0x30]
    6368:      	ldp	x20, x19, [sp, #0x20]
    636c:      	ldp	x22, x21, [sp, #0x10]
    6370:      	ldp	x24, x23, [sp], #0x40
    6374:      	ret
    6378:      	stp	x22, x21, [sp, #-0x30]!
    637c:      	stp	x20, x19, [sp, #0x10]
    6380:      	stp	x29, x30, [sp, #0x20]
    6384:      	add	x29, sp, #0x20
    6388:      	sub	sp, sp, #0x10
    638c:      	mov	x19, x0
    6390:      	strb	wzr, [sp, #0xf]
    6394:      	cbz	x19, 0x6430 <.text+0x5430>
    6398:      	adrp	x21, 0xc000
    639c:      	ldr	x0, [x21, #0x550]
    63a0:      	cbz	x0, 0x6430 <.text+0x5430>
    63a4:      	ldr	x8, [x0, #0x8]
    63a8:      	mov	x2, sp
    63ac:      	mov	x1, x19
    63b0:      	blr	x8
    63b4:      	mov	x20, x0
    63b8:      	tbnz	x20, #0x3f, 0x6454 <.text+0x5454>
    63bc:      	ldr	x0, [x21, #0x550]
    63c0:      	ldr	x1, [sp]
    63c4:      	ldr	x9, [x0, #0x18]
    63c8:      	blr	x9
    63cc:      	mov	x20, x0
    63d0:      	tbnz	x20, #0x3f, 0x6460 <.text+0x5460>
    63d4:      	adrp	x8, 0xc000
    63d8:      	mov	w0, #0x2710             // =10000
    63dc:      	ldr	x9, [x8, #0x520]
    63e0:      	ldr	x10, [x9, #0xf8]
    63e4:      	blr	x10
    63e8:      	ldr	x0, [x21, #0x550]
    63ec:      	add	x2, sp, #0xf
    63f0:      	ldr	x1, [sp]
    63f4:      	ldr	x11, [x0, #0x20]
    63f8:      	blr	x11
    63fc:      	mov	x20, x0
    6400:      	tbnz	x20, #0x3f, 0x646c <.text+0x546c>
    6404:      	ldrb	w8, [sp, #0xf]
    6408:      	cbz	w8, 0x6488 <.text+0x5488>
    640c:      	adrp	x1, 0xa000 <.text+0x9000>
    6410:      	adrp	x2, 0xa000 <.text+0x9000>
    6414:      	add	x1, x1, #0x8c5
    6418:      	add	x2, x2, #0x86d
    641c:      	orr	w0, wzr, #0x80000000
    6420:      	mov	x3, x19
    6424:      	bl	0x18bc <.text+0x8bc>
    6428:      	mov	x20, #-0x7ffffffffffffff9 // =-9223372036854775801
    642c:      	b	0x6488 <.text+0x5488>
    6430:      	adrp	x1, 0xa000 <.text+0x9000>
    6434:      	adrp	x2, 0xa000 <.text+0x9000>
    6438:      	add	x1, x1, #0x807
    643c:      	add	x2, x2, #0x86d
    6440:      	orr	w0, wzr, #0x80000000
    6444:      	bl	0x18bc <.text+0x8bc>
    6448:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    644c:      	movk	x20, #0x2
    6450:      	b	0x6488 <.text+0x5488>
    6454:      	adrp	x1, 0xa000 <.text+0x9000>
    6458:      	add	x1, x1, #0x82b
    645c:      	b	0x6474 <.text+0x5474>
    6460:      	adrp	x1, 0xa000 <.text+0x9000>
    6464:      	add	x1, x1, #0x87a
    6468:      	b	0x6474 <.text+0x5474>
    646c:      	adrp	x1, 0xa000 <.text+0x9000>
    6470:      	add	x1, x1, #0x89a
    6474:      	adrp	x2, 0xa000 <.text+0x9000>
    6478:      	add	x2, x2, #0x86d
    647c:      	orr	w0, wzr, #0x80000000
    6480:      	mov	x3, x19
    6484:      	bl	0x18bc <.text+0x8bc>
    6488:      	mov	x0, x20
    648c:      	sub	sp, x29, #0x20
    6490:      	ldp	x29, x30, [sp, #0x20]
    6494:      	ldp	x20, x19, [sp, #0x10]
    6498:      	ldp	x22, x21, [sp], #0x30
    649c:      	ret
    64a0:      	stp	x20, x19, [sp, #-0x20]!
    64a4:      	stp	x29, x30, [sp, #0x10]
    64a8:      	add	x29, sp, #0x10
    64ac:      	adrp	x19, 0xc000
    64b0:      	ldr	x9, [x19, #0x580]
    64b4:      	cbnz	x9, 0x64ec <.text+0x54ec>
    64b8:      	adrp	x9, 0xc000
    64bc:      	ldr	x8, [x9, #0x520]
    64c0:      	cbz	x8, 0x64ec <.text+0x54ec>
    64c4:      	ldr	x8, [x8, #0x140]
    64c8:      	cbz	x8, 0x64ec <.text+0x54ec>
    64cc:      	adrp	x0, 0xc000
    64d0:      	adrp	x2, 0xc000
    64d4:      	mov	x1, xzr
    64d8:      	add	x0, x0, #0xd0
    64dc:      	add	x2, x2, #0x580
    64e0:      	blr	x8
    64e4:      	tbz	x0, #0x3f, 0x64ec <.text+0x54ec>
    64e8:      	str	xzr, [x19, #0x580]
    64ec:      	ldp	x29, x30, [sp, #0x10]
    64f0:      	ldp	x20, x19, [sp], #0x20
    64f4:      	ret
    64f8:      	stp	x24, x23, [sp, #-0x40]!
    64fc:      	stp	x22, x21, [sp, #0x10]
    6500:      	stp	x20, x19, [sp, #0x20]
    6504:      	stp	x29, x30, [sp, #0x30]
    6508:      	add	x29, sp, #0x30
    650c:      	adrp	x9, 0x7000 <.text+0x6000>
    6510:      	mov	w21, w0
    6514:      	mov	x19, x4
    6518:      	ldrb	w8, [x9, #0xe28]
    651c:      	mov	x20, x3
    6520:      	mov	w22, w2
    6524:      	mov	w23, w1
    6528:      	and	w9, w21, #0xff
    652c:      	cmp	w9, #0x1
    6530:      	b.ne	0x653c <.text+0x553c>
    6534:      	and	w10, w8, #0x1
    6538:      	cbnz	w10, 0x6564 <.text+0x5564>
    653c:      	cmp	w9, #0x2
    6540:      	b.ne	0x6550 <.text+0x5550>
    6544:      	and	w11, w8, #0x2
    6548:      	and	w12, w11, #0xff
    654c:      	cbnz	w12, 0x6564 <.text+0x5564>
    6550:      	cmp	w9, #0x3
    6554:      	b.ne	0x65a0 <.text+0x55a0>
    6558:      	and	w8, w8, #0x4
    655c:      	and	w9, w8, #0xff
    6560:      	cbz	w9, 0x65a0 <.text+0x55a0>
    6564:      	bl	0x64a0 <.text+0x54a0>
    6568:      	adrp	x10, 0xc000
    656c:      	ldr	x8, [x10, #0x580]
    6570:      	cbz	x8, 0x65a0 <.text+0x55a0>
    6574:      	ldr	x5, [x8]
    6578:      	mov	w0, w21
    657c:      	mov	w2, w22
    6580:      	mov	x3, x20
    6584:      	mov	x4, x19
    6588:      	ldp	x29, x30, [sp, #0x30]
    658c:      	mov	w1, w23
    6590:      	ldp	x20, x19, [sp, #0x20]
    6594:      	ldp	x22, x21, [sp, #0x10]
    6598:      	ldp	x24, x23, [sp], #0x40
    659c:      	br	x5
    65a0:      	ldp	x29, x30, [sp, #0x30]
    65a4:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    65a8:      	ldp	x20, x19, [sp, #0x20]
    65ac:      	ldp	x22, x21, [sp, #0x10]
    65b0:      	ldp	x24, x23, [sp], #0x40
    65b4:      	ret
    65b8:      	adrp	x8, 0x7000 <.text+0x6000>
    65bc:      	ldrb	w8, [x8, #0xe28]
    65c0:      	and	w0, w8, #0x1
    65c4:      	ret
    65c8:      	adrp	x8, 0x7000 <.text+0x6000>
    65cc:      	ldrb	w8, [x8, #0xe28]
    65d0:      	ubfx	w0, w8, #1, #1
    65d4:      	ret
    65d8:      	adrp	x8, 0x7000 <.text+0x6000>
    65dc:      	ldrb	w8, [x8, #0xe28]
    65e0:      	ubfx	w0, w8, #2, #1
    65e4:      	ret
    65e8:      	stp	x28, x27, [sp, #-0x60]!
    65ec:      	stp	x26, x25, [sp, #0x10]
    65f0:      	stp	x24, x23, [sp, #0x20]
    65f4:      	stp	x22, x21, [sp, #0x30]
    65f8:      	stp	x20, x19, [sp, #0x40]
    65fc:      	stp	x29, x30, [sp, #0x50]
    6600:      	add	x29, sp, #0x50
    6604:      	sub	sp, sp, #0x210
    6608:      	mov	x23, x6
    660c:      	mov	x24, x5
    6610:      	mov	x25, x4
    6614:      	mov	x21, x3
    6618:      	mov	w19, w2
    661c:      	mov	w20, w1
    6620:      	mov	w22, w0
    6624:      	cbnz	x24, 0x6648 <.text+0x5648>
    6628:      	cbz	x23, 0x6648 <.text+0x5648>
    662c:      	adrp	x0, 0xa000 <.text+0x9000>
    6630:      	adrp	x2, 0xa000 <.text+0x9000>
    6634:      	add	x0, x0, #0x8e7
    6638:      	add	x2, x2, #0x9e6
    663c:      	orr	w1, wzr, #0x1f0
    6640:      	bl	0x1c48 <.text+0xc48>
    6644:      	b	0x6644 <.text+0x5644>
    6648:      	cbz	x24, 0x666c <.text+0x566c>
    664c:      	cbnz	x23, 0x666c <.text+0x566c>
    6650:      	adrp	x0, 0xa000 <.text+0x9000>
    6654:      	adrp	x2, 0xa000 <.text+0x9000>
    6658:      	add	x0, x0, #0x8e7
    665c:      	mov	w1, #0x1f1              // =497
    6660:      	add	x2, x2, #0xa23
    6664:      	bl	0x1c48 <.text+0xc48>
    6668:      	b	0x6668 <.text+0x5668>
    666c:      	adrp	x27, 0xc000
    6670:      	ldr	x9, [x27, #0x520]
    6674:      	cbz	x9, 0x66f4 <.text+0x56f4>
    6678:      	ldr	x10, [x9, #0x40]
    667c:      	cbz	x10, 0x66f4 <.text+0x56f4>
    6680:      	ldr	x11, [x9, #0x48]
    6684:      	cbz	x11, 0x66f4 <.text+0x56f4>
    6688:      	ldr	x9, [x9, #0x18]
    668c:      	orr	w0, wzr, #0x1f
    6690:      	blr	x9
    6694:      	ldr	x10, [x27, #0x520]
    6698:      	mov	x26, x0
    669c:      	ldr	x12, [x10, #0x20]
    66a0:      	blr	x12
    66a4:      	cmp	x26, #0x10
    66a8:      	stur	xzr, [x29, #-0x58]
    66ac:      	b.hi	0x66d0 <.text+0x56d0>
    66b0:      	ldr	x11, [x27, #0x520]
    66b4:      	add	x1, x23, #0x14
    66b8:      	orr	w0, wzr, #0x4
    66bc:      	sub	x2, x29, #0x58
    66c0:      	ldr	x14, [x11, #0x40]
    66c4:      	blr	x14
    66c8:      	ldur	x8, [x29, #-0x58]
    66cc:      	cbnz	x8, 0x6724 <.text+0x5724>
    66d0:      	cmp	x23, #0x1ed
    66d4:      	b.lo	0x671c <.text+0x571c>
    66d8:      	adrp	x1, 0xa000 <.text+0x9000>
    66dc:      	add	x1, x1, #0xa60
    66e0:      	orr	w0, wzr, #0x80000000
    66e4:      	bl	0x18bc <.text+0x8bc>
    66e8:      	mov	x24, #-0x8000000000000000 // =-9223372036854775808
    66ec:      	movk	x24, #0x9
    66f0:      	b	0x66f8 <.text+0x56f8>
    66f4:      	mov	x24, #-0x7ffffffffffffffd // =-9223372036854775805
    66f8:      	mov	x0, x24
    66fc:      	sub	sp, x29, #0x50
    6700:      	ldp	x29, x30, [sp, #0x50]
    6704:      	ldp	x20, x19, [sp, #0x40]
    6708:      	ldp	x22, x21, [sp, #0x30]
    670c:      	ldp	x24, x23, [sp, #0x20]
    6710:      	ldp	x26, x25, [sp, #0x10]
    6714:      	ldp	x28, x27, [sp], #0x60
    6718:      	ret
    671c:      	mov	x8, sp
    6720:      	stur	x8, [x29, #-0x58]
    6724:      	mov	w9, #0x14               // =20
    6728:      	adrp	x16, 0xc000
    672c:      	add	x16, x16, #0x60
    6730:      	strh	w9, [x8]
    6734:      	cmp	x25, #0x0
    6738:      	ldur	x12, [x29, #-0x58]
    673c:      	csel	x1, x16, x25, eq
    6740:      	strh	w23, [x12, #0x2]
    6744:      	ldur	x13, [x29, #-0x58]
    6748:      	add	x0, x13, #0x4
    674c:      	bl	0x67b4 <.text+0x57b4>
    6750:      	cbz	x24, 0x6768 <.text+0x5768>
    6754:      	ldur	x14, [x29, #-0x58]
    6758:      	mov	x1, x24
    675c:      	mov	x2, x23
    6760:      	add	x0, x14, #0x14
    6764:      	bl	0x68b4 <.text+0x58b4>
    6768:      	adrp	x5, 0xc000
    676c:      	ldur	x4, [x29, #-0x58]
    6770:      	add	x5, x5, #0x8
    6774:      	cmp	x21, #0x0
    6778:      	csel	x3, x5, x21, eq
    677c:      	mov	w0, w22
    6780:      	mov	w1, w20
    6784:      	mov	w2, w19
    6788:      	bl	0x64f8 <.text+0x54f8>
    678c:      	ldur	x8, [x29, #-0x58]
    6790:      	mov	x24, x0
    6794:      	mov	x15, sp
    6798:      	cmp	x8, x15
    679c:      	b.eq	0x66f8 <.text+0x56f8>
    67a0:      	ldr	x16, [x27, #0x520]
    67a4:      	mov	x0, x8
    67a8:      	ldr	x2, [x16, #0x48]
    67ac:      	blr	x2
    67b0:      	b	0x66f8 <.text+0x56f8>
    67b4:      	stp	x29, x30, [sp, #-0x10]!
    67b8:      	mov	x29, sp
    67bc:      	cbz	x0, 0x67d0 <.text+0x57d0>
    67c0:      	cbz	x1, 0x67ec <.text+0x57ec>
    67c4:      	orr	w2, wzr, #0x10
    67c8:      	ldp	x29, x30, [sp], #0x10
    67cc:      	b	0x6c9c <.text+0x5c9c>
    67d0:      	adrp	x0, 0xa000 <.text+0x9000>
    67d4:      	adrp	x2, 0xa000 <.text+0x9000>
    67d8:      	add	x0, x0, #0xa98
    67dc:      	mov	w1, #0x2f               // =47
    67e0:      	add	x2, x2, #0xaa5
    67e4:      	bl	0x1c48 <.text+0xc48>
    67e8:      	b	0x67e8 <.text+0x57e8>
    67ec:      	adrp	x0, 0xa000 <.text+0x9000>
    67f0:      	adrp	x2, 0xa000 <.text+0x9000>
    67f4:      	add	x0, x0, #0xa98
    67f8:      	add	x2, x2, #0xac5
    67fc:      	orr	w1, wzr, #0x30
    6800:      	bl	0x1c48 <.text+0xc48>
    6804:      	b	0x6804 <.text+0x5804>
    6808:      	stp	x29, x30, [sp, #-0x10]!
    680c:      	mov	x29, sp
    6810:      	cbz	x0, 0x6820 <.text+0x5820>
    6814:      	cbz	x1, 0x683c <.text+0x583c>
    6818:      	ldp	x29, x30, [sp], #0x10
    681c:      	b	0x6d60 <.text+0x5d60>
    6820:      	adrp	x0, 0xa000 <.text+0x9000>
    6824:      	adrp	x2, 0xa000 <.text+0x9000>
    6828:      	add	x0, x0, #0xa98
    682c:      	mov	w1, #0x4c               // =76
    6830:      	add	x2, x2, #0xae0
    6834:      	bl	0x1c48 <.text+0xc48>
    6838:      	b	0x6838 <.text+0x5838>
    683c:      	adrp	x0, 0xa000 <.text+0x9000>
    6840:      	adrp	x2, 0xa000 <.text+0x9000>
    6844:      	add	x0, x0, #0xa98
    6848:      	mov	w1, #0x4d               // =77
    684c:      	add	x2, x2, #0xaf6
    6850:      	bl	0x1c48 <.text+0xc48>
    6854:      	b	0x6854 <.text+0x5854>
    6858:      	stp	x29, x30, [sp, #-0x10]!
    685c:      	mov	x29, sp
    6860:      	cbnz	x0, 0x6884 <.text+0x5884>
    6864:      	cbz	x1, 0x6884 <.text+0x5884>
    6868:      	adrp	x0, 0xa000 <.text+0x9000>
    686c:      	adrp	x2, 0xa000 <.text+0x9000>
    6870:      	add	x0, x0, #0xb9c
    6874:      	mov	w1, #0x31               // =49
    6878:      	add	x2, x2, #0xbad
    687c:      	bl	0x1c48 <.text+0xc48>
    6880:      	b	0x6880 <.text+0x5880>
    6884:      	neg	x8, x0
    6888:      	cmp	x1, x8
    688c:      	b.ls	0x68ac <.text+0x58ac>
    6890:      	adrp	x0, 0xa000 <.text+0x9000>
    6894:      	adrp	x2, 0xa000 <.text+0x9000>
    6898:      	add	x0, x0, #0xb9c
    689c:      	mov	w1, #0x32               // =50
    68a0:      	add	x2, x2, #0xb3e
    68a4:      	bl	0x1c48 <.text+0xc48>
    68a8:      	b	0x68a8 <.text+0x58a8>
    68ac:      	ldp	x29, x30, [sp], #0x10
    68b0:      	b	0x6954 <.text+0x5954>
    68b4:      	cbz	x2, 0x6924 <.text+0x5924>
    68b8:      	stp	x29, x30, [sp, #-0x10]!
    68bc:      	mov	x29, sp
    68c0:      	sub	x8, x2, #0x1
    68c4:      	mvn	x9, x0
    68c8:      	cmp	x8, x9
    68cc:      	ldp	x29, x30, [sp], #0x10
    68d0:      	b.ls	0x68f0 <.text+0x58f0>
    68d4:      	adrp	x0, 0xa000 <.text+0x9000>
    68d8:      	adrp	x2, 0xa000 <.text+0x9000>
    68dc:      	add	x0, x0, #0xbd5
    68e0:      	add	x2, x2, #0xbe6
    68e4:      	orr	w1, wzr, #0x38
    68e8:      	bl	0x1c48 <.text+0xc48>
    68ec:      	b	0x68ec <.text+0x58ec>
    68f0:      	mvn	x11, x1
    68f4:      	cmp	x8, x11
    68f8:      	b.ls	0x6918 <.text+0x5918>
    68fc:      	adrp	x0, 0xa000 <.text+0x9000>
    6900:      	adrp	x2, 0xa000 <.text+0x9000>
    6904:      	add	x0, x0, #0xbd5
    6908:      	mov	w1, #0x39               // =57
    690c:      	add	x2, x2, #0xc29
    6910:      	bl	0x1c48 <.text+0xc48>
    6914:      	b	0x6914 <.text+0x5914>
    6918:      	cmp	x0, x1
    691c:      	b.eq	0x6924 <.text+0x5924>
    6920:      	b	0x6c9c <.text+0x5c9c>
    6924:      	ret
		...
    6930:      	dup	v0.8h, w2
    6934:      	lsl	x1, x1, #1
    6938:      	b	0x6960 <.text+0x5960>
    693c:      	dup	v0.4s, w2
    6940:      	lsl	x1, x1, #2
    6944:      	b	0x6960 <.text+0x5960>
    6948:      	dup	v0.2d, x2
    694c:      	lsl	x1, x1, #3
    6950:      	b	0x6960 <.text+0x5960>
    6954:      	movi	v0.16b, #0x0
    6958:      	b	0x6960 <.text+0x5960>
    695c:      	dup	v0.16b, w2
    6960:      	add	x4, x0, x1
    6964:      	mov	x2, v0.d[0]
    6968:      	cmp	x1, #0x60
    696c:      	b.hi	0x69e4 <.text+0x59e4>
    6970:      	cmp	x1, #0x10
    6974:      	b.hs	0x69b0 <.text+0x59b0>
    6978:      	tbz	w1, #0x3, 0x698c <.text+0x598c>
    697c:      	str	x2, [x0]
    6980:      	stur	x2, [x4, #-0x8]
    6984:      	ret
    6988:      	nop
    698c:      	tbz	w1, #0x2, 0x699c <.text+0x599c>
    6990:      	str	w2, [x0]
    6994:      	stur	w2, [x4, #-0x4]
    6998:      	ret
    699c:      	cbz	x1, 0x69ac <.text+0x59ac>
    69a0:      	strb	w2, [x0]
    69a4:      	tbz	w1, #0x1, 0x69ac <.text+0x59ac>
    69a8:      	sturh	w2, [x4, #-0x2]
    69ac:      	ret
    69b0:      	str	q0, [x0]
    69b4:      	tbnz	w1, #0x6, 0x69d0 <.text+0x59d0>
    69b8:      	stur	q0, [x4, #-0x10]
    69bc:      	tbz	w1, #0x5, 0x69c8 <.text+0x59c8>
    69c0:      	str	q0, [x0, #0x10]
    69c4:      	stur	q0, [x4, #-0x20]
    69c8:      	ret
    69cc:      	nop
    69d0:      	str	q0, [x0, #0x10]
    69d4:      	stp	q0, q0, [x0, #0x20]
    69d8:      	stp	q0, q0, [x4, #-0x20]
    69dc:      	ret
    69e0:      	nop
    69e4:      	and	x3, x0, #0xfffffffffffffff0
    69e8:      	str	q0, [x0]
    69ec:      	cmp	x1, #0x100
    69f0:      	ccmp	x2, #0x0, #0x0, hs
    69f4:      	b.eq	0x6a20 <.text+0x5a20>
    69f8:      	sub	x1, x4, x3
    69fc:      	add	x3, x3, #0x10
    6a00:      	sub	x1, x1, #0x50
    6a04:      	stp	q0, q0, [x3], #0x40
    6a08:      	stp	q0, q0, [x3, #-0x20]
    6a0c:      	subs	x1, x1, #0x40
    6a10:      	b.hi	0x6a04 <.text+0x5a04>
    6a14:      	stp	q0, q0, [x4, #-0x40]
    6a18:      	stp	q0, q0, [x4, #-0x20]
    6a1c:      	ret
    6a20:      	mrs	x5, DCZID_EL0
    6a24:      	tbnz	w5, #0x4, 0x69f8 <.text+0x59f8>
    6a28:      	and	w5, w5, #0xf
    6a2c:      	cmp	w5, #0x4
    6a30:      	b.ne	0x6a80 <.text+0x5a80>
    6a34:      	str	q0, [x3, #0x10]
    6a38:      	stp	q0, q0, [x3, #0x20]
    6a3c:      	and	x3, x3, #0xffffffffffffffc0
    6a40:      	stp	q0, q0, [x3, #0x40]
    6a44:      	stp	q0, q0, [x3, #0x60]
    6a48:      	sub	x1, x4, x3
    6a4c:      	sub	x1, x1, #0x100
    6a50:      	add	x3, x3, #0x80
    6a54:      	nop
    6a58:      	dc	zva, x3
    6a5c:      	add	x3, x3, #0x40
    6a60:      	subs	x1, x1, #0x40
    6a64:      	b.hi	0x6a58 <.text+0x5a58>
    6a68:      	stp	q0, q0, [x3]
    6a6c:      	stp	q0, q0, [x3, #0x20]
    6a70:      	stp	q0, q0, [x4, #-0x40]
    6a74:      	stp	q0, q0, [x4, #-0x20]
    6a78:      	ret
    6a7c:      	nop
    6a80:      	cmp	w5, #0x5
    6a84:      	b.ne	0x6acc <.text+0x5acc>
    6a88:      	str	q0, [x3, #0x10]
    6a8c:      	stp	q0, q0, [x3, #0x20]
    6a90:      	stp	q0, q0, [x3, #0x40]
    6a94:      	stp	q0, q0, [x3, #0x60]
    6a98:      	and	x3, x3, #0xffffffffffffff80
    6a9c:      	sub	x1, x4, x3
    6aa0:      	sub	x1, x1, #0x100
    6aa4:      	add	x3, x3, #0x80
    6aa8:      	dc	zva, x3
    6aac:      	add	x3, x3, #0x80
    6ab0:      	subs	x1, x1, #0x80
    6ab4:      	b.hi	0x6aa8 <.text+0x5aa8>
    6ab8:      	stp	q0, q0, [x4, #-0x80]
    6abc:      	stp	q0, q0, [x4, #-0x60]
    6ac0:      	stp	q0, q0, [x4, #-0x40]
    6ac4:      	stp	q0, q0, [x4, #-0x20]
    6ac8:      	ret
    6acc:      	mov	w6, #0x4                // =4
    6ad0:      	lsl	w7, w6, w5
    6ad4:      	add	x5, x7, #0x40
    6ad8:      	cmp	x1, x5
    6adc:      	b.lo	0x69f8 <.text+0x59f8>
    6ae0:      	sub	x6, x7, #0x1
    6ae4:      	add	x5, x3, x7
    6ae8:      	add	x3, x3, #0x10
    6aec:      	subs	x1, x5, x3
    6af0:      	bic	x5, x5, x6
    6af4:      	b.eq	0x6b08 <.text+0x5b08>
    6af8:      	stp	q0, q0, [x3], #0x40
    6afc:      	stp	q0, q0, [x3, #-0x20]
    6b00:      	subs	x1, x1, #0x40
    6b04:      	b.hi	0x6af8 <.text+0x5af8>
    6b08:      	mov	x3, x5
    6b0c:      	sub	x1, x4, x5
    6b10:      	subs	x1, x1, x7
    6b14:      	b.lo	0x6b28 <.text+0x5b28>
    6b18:      	dc	zva, x3
    6b1c:      	add	x3, x3, x7
    6b20:      	subs	x1, x1, x7
    6b24:      	b.hs	0x6b18 <.text+0x5b18>
    6b28:      	add	x1, x1, x7
    6b2c:      	b	0x6a0c <.text+0x5a0c>
    6b30:      	prfm	pldl1keep, [x1]
    6b34:      	add	x4, x1, x2
    6b38:      	add	x5, x0, x2
    6b3c:      	cmp	x2, #0x10
    6b40:      	b.ls	0x6b80 <.text+0x5b80>
    6b44:      	cmp	x2, #0x60
    6b48:      	b.hi	0x6c10 <.text+0x5c10>
    6b4c:      	sub	x9, x2, #0x1
    6b50:      	ldp	x6, x7, [x1]
    6b54:      	tbnz	w9, #0x6, 0x6be0 <.text+0x5be0>
    6b58:      	ldp	x12, x13, [x4, #-0x10]
    6b5c:      	tbz	w9, #0x5, 0x6b70 <.text+0x5b70>
    6b60:      	ldp	x8, x9, [x1, #0x10]
    6b64:      	ldp	x10, x11, [x4, #-0x20]
    6b68:      	stp	x8, x9, [x0, #0x10]
    6b6c:      	stp	x10, x11, [x5, #-0x20]
    6b70:      	stp	x6, x7, [x0]
    6b74:      	stp	x12, x13, [x5, #-0x10]
    6b78:      	ret
    6b7c:      	nop
    6b80:      	cmp	x2, #0x8
    6b84:      	b.lo	0x6ba0 <.text+0x5ba0>
    6b88:      	ldr	x6, [x1]
    6b8c:      	ldur	x7, [x4, #-0x8]
    6b90:      	str	x6, [x0]
    6b94:      	stur	x7, [x5, #-0x8]
    6b98:      	ret
    6b9c:      	nop
    6ba0:      	tbz	w2, #0x2, 0x6bb8 <.text+0x5bb8>
    6ba4:      	ldr	w6, [x1]
    6ba8:      	ldur	w7, [x4, #-0x4]
    6bac:      	str	w6, [x0]
    6bb0:      	stur	w7, [x5, #-0x4]
    6bb4:      	ret
    6bb8:      	cbz	x2, 0x6bd8 <.text+0x5bd8>
    6bbc:      	lsr	x9, x2, #1
    6bc0:      	ldrb	w6, [x1]
    6bc4:      	ldurb	w7, [x4, #-0x1]
    6bc8:      	ldrb	w8, [x1, x9]
    6bcc:      	strb	w6, [x0]
    6bd0:      	strb	w8, [x0, x9]
    6bd4:      	sturb	w7, [x5, #-0x1]
    6bd8:      	ret
    6bdc:      	nop
    6be0:      	ldp	x8, x9, [x1, #0x10]
    6be4:      	ldp	x10, x11, [x1, #0x20]
    6be8:      	ldp	x12, x13, [x1, #0x30]
    6bec:      	ldp	x14, x15, [x4, #-0x20]
    6bf0:      	ldp	x4, x3, [x4, #-0x10]
    6bf4:      	stp	x6, x7, [x0]
    6bf8:      	stp	x8, x9, [x0, #0x10]
    6bfc:      	stp	x10, x11, [x0, #0x20]
    6c00:      	stp	x12, x13, [x0, #0x30]
    6c04:      	stp	x14, x15, [x5, #-0x20]
    6c08:      	stp	x4, x3, [x5, #-0x10]
    6c0c:      	ret
    6c10:      	and	x9, x0, #0xf
    6c14:      	and	x3, x0, #0xfffffffffffffff0
    6c18:      	ldp	x12, x13, [x1]
    6c1c:      	sub	x1, x1, x9
    6c20:      	add	x2, x2, x9
    6c24:      	ldp	x6, x7, [x1, #0x10]
    6c28:      	stp	x12, x13, [x0]
    6c2c:      	ldp	x8, x9, [x1, #0x20]
    6c30:      	ldp	x10, x11, [x1, #0x30]
    6c34:      	ldp	x12, x13, [x1, #0x40]!
    6c38:      	subs	x2, x2, #0x90
    6c3c:      	b.ls	0x6c68 <.text+0x5c68>
    6c40:      	stp	x6, x7, [x3, #0x10]
    6c44:      	ldp	x6, x7, [x1, #0x10]
    6c48:      	stp	x8, x9, [x3, #0x20]
    6c4c:      	ldp	x8, x9, [x1, #0x20]
    6c50:      	stp	x10, x11, [x3, #0x30]
    6c54:      	ldp	x10, x11, [x1, #0x30]
    6c58:      	stp	x12, x13, [x3, #0x40]!
    6c5c:      	ldp	x12, x13, [x1, #0x40]!
    6c60:      	subs	x2, x2, #0x40
    6c64:      	b.hi	0x6c40 <.text+0x5c40>
    6c68:      	ldp	x14, x15, [x4, #-0x40]
    6c6c:      	stp	x6, x7, [x3, #0x10]
    6c70:      	ldp	x6, x7, [x4, #-0x30]
    6c74:      	stp	x8, x9, [x3, #0x20]
    6c78:      	ldp	x8, x9, [x4, #-0x20]
    6c7c:      	stp	x10, x11, [x3, #0x30]
    6c80:      	ldp	x10, x11, [x4, #-0x10]
    6c84:      	stp	x12, x13, [x3, #0x40]
    6c88:      	stp	x14, x15, [x5, #-0x40]
    6c8c:      	stp	x6, x7, [x5, #-0x30]
    6c90:      	stp	x8, x9, [x5, #-0x20]
    6c94:      	stp	x10, x11, [x5, #-0x10]
    6c98:      	ret
    6c9c:      	sub	x3, x0, x1
    6ca0:      	cmp	x2, #0x60
    6ca4:      	ccmp	x3, x2, #0x2, hi
    6ca8:      	b.hs	0x6b30 <.text+0x5b30>
    6cac:      	cbz	x3, 0x6d44 <.text+0x5d44>
    6cb0:      	add	x5, x0, x2
    6cb4:      	add	x4, x1, x2
    6cb8:      	and	x3, x5, #0xf
    6cbc:      	ldp	x12, x13, [x4, #-0x10]
    6cc0:      	sub	x4, x4, x3
    6cc4:      	sub	x2, x2, x3
    6cc8:      	ldp	x6, x7, [x4, #-0x10]
    6ccc:      	stp	x12, x13, [x5, #-0x10]
    6cd0:      	ldp	x8, x9, [x4, #-0x20]
    6cd4:      	ldp	x10, x11, [x4, #-0x30]
    6cd8:      	ldp	x12, x13, [x4, #-0x40]!
    6cdc:      	sub	x5, x5, x3
    6ce0:      	subs	x2, x2, #0x80
    6ce4:      	b.ls	0x6d14 <.text+0x5d14>
    6ce8:      	nop
    6cec:      	stp	x6, x7, [x5, #-0x10]
    6cf0:      	ldp	x6, x7, [x4, #-0x10]
    6cf4:      	stp	x8, x9, [x5, #-0x20]
    6cf8:      	ldp	x8, x9, [x4, #-0x20]
    6cfc:      	stp	x10, x11, [x5, #-0x30]
    6d00:      	ldp	x10, x11, [x4, #-0x30]
    6d04:      	stp	x12, x13, [x5, #-0x40]!
    6d08:      	ldp	x12, x13, [x4, #-0x40]!
    6d0c:      	subs	x2, x2, #0x40
    6d10:      	b.hi	0x6cec <.text+0x5cec>
    6d14:      	ldp	x14, x15, [x1, #0x30]
    6d18:      	stp	x6, x7, [x5, #-0x10]
    6d1c:      	ldp	x6, x7, [x1, #0x20]
    6d20:      	stp	x8, x9, [x5, #-0x20]
    6d24:      	ldp	x8, x9, [x1, #0x10]
    6d28:      	stp	x10, x11, [x5, #-0x30]
    6d2c:      	ldp	x10, x11, [x1]
    6d30:      	stp	x12, x13, [x5, #-0x40]
    6d34:      	stp	x14, x15, [x0, #0x30]
    6d38:      	stp	x6, x7, [x0, #0x20]
    6d3c:      	stp	x8, x9, [x0, #0x10]
    6d40:      	stp	x10, x11, [x0]
    6d44:      	ret
		...
    6d60:      	mov	x2, xzr
    6d64:      	ldp	x3, x4, [x0]
    6d68:      	cbz	x1, 0x6d70 <.text+0x5d70>
    6d6c:      	ldp	x1, x2, [x1]
    6d70:      	cmp	x1, x3
    6d74:      	ccmp	x2, x4, #0x0, eq
    6d78:      	cset	w0, eq
    6d7c:      	ret
    6d80:      	stp	x22, x21, [sp, #-0x30]!
    6d84:      	stp	x20, x19, [sp, #0x10]
    6d88:      	stp	x29, x30, [sp, #0x20]
    6d8c:      	add	x29, sp, #0x20
    6d90:      	mov	x22, x1
    6d94:      	mov	x19, x0
    6d98:      	bl	0x6ef0 <.text+0x5ef0>
    6d9c:      	mov	x20, x0
    6da0:      	neg	x8, x20
    6da4:      	and	x21, x19, x8
    6da8:      	add	x22, x19, x22
    6dac:      	b	0x6dbc <.text+0x5dbc>
    6db0:      	mov	x0, x21
    6db4:      	bl	0x6ec8 <.text+0x5ec8>
    6db8:      	add	x21, x21, x20
    6dbc:      	cmp	x21, x22
    6dc0:      	b.lo	0x6db0 <.text+0x5db0>
    6dc4:      	bl	0x6ed0 <.text+0x5ed0>
    6dc8:      	bl	0x6ed8 <.text+0x5ed8>
    6dcc:      	mov	x0, x19
    6dd0:      	ldp	x29, x30, [sp, #0x20]
    6dd4:      	ldp	x20, x19, [sp, #0x10]
    6dd8:      	ldp	x22, x21, [sp], #0x30
    6ddc:      	ret
    6de0:      	stp	x29, x30, [sp, #-0x10]!
    6de4:      	mov	x29, sp
    6de8:      	sub	sp, sp, #0x10
    6dec:      	adrp	x8, 0xc000
    6df0:      	add	x2, sp, #0x8
    6df4:      	ldr	x9, [x8, #0x520]
    6df8:      	ldr	x8, [x9, #0x40]
    6dfc:      	blr	x8
    6e00:      	tbnz	x0, #0x3f, 0x6e0c <.text+0x5e0c>
    6e04:      	ldr	x0, [sp, #0x8]
    6e08:      	b	0x6e14 <.text+0x5e14>
    6e0c:      	mov	x0, xzr
    6e10:      	str	xzr, [sp, #0x8]
    6e14:      	mov	sp, x29
    6e18:      	ldp	x29, x30, [sp], #0x10
    6e1c:      	ret
    6e20:      	stp	x20, x19, [sp, #-0x20]!
    6e24:      	stp	x29, x30, [sp, #0x10]
    6e28:      	add	x29, sp, #0x10
    6e2c:      	mov	x19, x1
    6e30:      	bl	0x6de0 <.text+0x5de0>
    6e34:      	cbz	x0, 0x6e48 <.text+0x5e48>
    6e38:      	ldp	x29, x30, [sp, #0x10]
    6e3c:      	mov	x1, x19
    6e40:      	ldp	x20, x19, [sp], #0x20
    6e44:      	b	0x6858 <.text+0x5858>
    6e48:      	ldp	x29, x30, [sp, #0x10]
    6e4c:      	mov	x0, xzr
    6e50:      	ldp	x20, x19, [sp], #0x20
    6e54:      	ret
    6e58:      	mov	x8, x0
    6e5c:      	orr	w0, wzr, #0x4
    6e60:      	mov	x1, x8
    6e64:      	b	0x6e20 <.text+0x5e20>
    6e68:      	stp	x29, x30, [sp, #-0x10]!
    6e6c:      	mov	x29, sp
    6e70:      	adrp	x8, 0xc000
    6e74:      	ldr	x9, [x8, #0x520]
    6e78:      	ldr	x9, [x9, #0x48]
    6e7c:      	blr	x9
    6e80:      	mov	x8, x0
    6e84:      	tbnz	x8, #0x3f, 0x6e90 <.text+0x5e90>
    6e88:      	ldp	x29, x30, [sp], #0x10
    6e8c:      	ret
    6e90:      	adrp	x1, 0x7000 <.text+0x6000>
    6e94:      	add	x1, x1, #0xdc8
    6e98:      	orr	w0, wzr, #0x80000000
    6e9c:      	mov	x2, x8
    6ea0:      	bl	0x18bc <.text+0x8bc>
    6ea4:      	adrp	x0, 0xa000 <.text+0x9000>
    6ea8:      	adrp	x2, 0x7000 <.text+0x6000>
    6eac:      	add	x0, x0, #0xc67
    6eb0:      	mov	w1, #0x333              // =819
    6eb4:      	add	x2, x2, #0xdfc
    6eb8:      	ldp	x29, x30, [sp], #0x10
    6ebc:      	b	0x1c48 <.text+0xc48>
    6ec0:      	dc	ivac, x0
    6ec4:      	ret
    6ec8:      	dc	cvac, x0
    6ecc:      	ret
    6ed0:      	dsb	sy
    6ed4:      	ret
    6ed8:      	isb
    6edc:      	ret
    6ee0:      	mov	x0, #0x1                // =1
    6ee4:      	ret
    6ee8:      	mrs	x0, CTR_EL0
    6eec:      	ret
    6ef0:      	stp	x29, x30, [sp, #-0x10]!
    6ef4:      	mov	x29, sp
    6ef8:      	bl	0x6ee8 <.text+0x5ee8>
    6efc:      	ubfx	w8, w0, #16, #4
    6f00:      	orr	w9, wzr, #0x4
    6f04:      	lsl	w0, w9, w8
    6f08:      	ldp	x29, x30, [sp], #0x10
    6f0c:      	ret
    6f10:      	stp	x29, x30, [sp, #-0x10]!
    6f14:      	mov	x29, sp
    6f18:      	sub	sp, sp, #0x10
    6f1c:      	add	x1, sp, #0x8
    6f20:      	str	xzr, [sp, #0x8]
    6f24:      	mov	w0, wzr
    6f28:      	bl	0x7c48 <.text+0x6c48>
    6f2c:      	ldr	x0, [sp, #0x8]
    6f30:      	mov	sp, x29
    6f34:      	ldp	x29, x30, [sp], #0x10
    6f38:      	ret
    6f3c:      	stp	x29, x30, [sp, #-0x10]!
    6f40:      	mov	x29, sp
    6f44:      	sub	sp, sp, #0x10
    6f48:      	orr	w0, wzr, #0x1
    6f4c:      	add	x1, sp, #0x8
    6f50:      	bl	0x7c48 <.text+0x6c48>
    6f54:      	ldr	x0, [sp, #0x8]
    6f58:      	mov	sp, x29
    6f5c:      	ldp	x29, x30, [sp], #0x10
    6f60:      	ret
    6f64:      	orr	w13, wzr, #0x2
    6f68:      	orr	w14, wzr, #0x1
    6f6c:      	mov	x10, xzr
    6f70:      	sub	x13, x13, x2
    6f74:      	add	x12, x2, #0xd
    6f78:      	sub	x15, x14, x2
    6f7c:      	add	x14, x2, #0xe
    6f80:      	neg	x4, x2
    6f84:      	add	x3, x2, #0xf
    6f88:      	mvn	x17, x2
    6f8c:      	add	x16, x2, #0x10
    6f90:      	mov	x6, x2
    6f94:      	mov	x8, x0
    6f98:      	mov	x9, x1
    6f9c:      	b	0x6fd8 <.text+0x5fd8>
    6fa0:      	ldrb	w7, [x1, x10]
    6fa4:      	add	x9, x9, #0x1
    6fa8:      	add	x8, x8, #0x1
    6fac:      	sub	x6, x6, #0x1
    6fb0:      	add	x13, x13, #0x1
    6fb4:      	sub	x12, x12, #0x1
    6fb8:      	strb	w7, [x0, x10]
    6fbc:      	add	x15, x15, #0x1
    6fc0:      	sub	x14, x14, #0x1
    6fc4:      	add	x10, x10, #0x1
    6fc8:      	add	x4, x4, #0x1
    6fcc:      	sub	x3, x3, #0x1
    6fd0:      	add	x17, x17, #0x1
    6fd4:      	sub	x16, x16, #0x1
    6fd8:      	mov	w5, w1
    6fdc:      	add	w5, w5, w10
    6fe0:      	cbz	x6, 0x6fec <.text+0x5fec>
    6fe4:      	and	x7, x5, #0x3
    6fe8:      	cbnz	x7, 0x6fa0 <.text+0x5fa0>
    6fec:      	sub	sp, sp, #0x40
    6ff0:      	add	x8, x0, x10
    6ff4:      	sub	x11, x2, x10
    6ff8:      	and	x5, x8, #0x3
    6ffc:      	add	x9, x1, x10
    7000:      	cbz	x5, 0x70e4 <.text+0x60e4>
    7004:      	cmp	x11, #0x20
    7008:      	b.lo	0x7354 <.text+0x6354>
    700c:      	cmp	x5, #0x3
    7010:      	b.eq	0x71f8 <.text+0x61f8>
    7014:      	cmp	x5, #0x2
    7018:      	b.eq	0x72a4 <.text+0x62a4>
    701c:      	cmp	x5, #0x1
    7020:      	b.ne	0x7354 <.text+0x6354>
    7024:      	mov	x7, xzr
    7028:      	ldrb	w17, [x9, #0x1]
    702c:      	cmn	x13, #0x11
    7030:      	ldrb	w3, [x9, #0x2]
    7034:      	orr	x14, xzr, #0xffffffffffffffef
    7038:      	csel	x11, x13, x14, hi
    703c:      	add	x5, x11, x12
    7040:      	strb	w17, [x8, #0x1]
    7044:      	and	x11, x5, #0xfffffffffffffff0
    7048:      	add	x6, x11, x1
    704c:      	ldr	w11, [x9]
    7050:      	sub	x14, x2, #0x3
    7054:      	strb	w3, [x8, #0x2]
    7058:      	add	x5, x6, x10
    705c:      	sub	x1, x14, x10
    7060:      	add	x14, x5, #0x3
    7064:      	strb	w11, [x8]
    7068:      	b	0x70a4 <.text+0x60a4>
    706c:      	add	x17, x9, x7
    7070:      	add	x3, x8, x7
    7074:      	sub	x1, x1, #0x10
    7078:      	ldp	w4, w6, [x17, #0x4]
    707c:      	add	x7, x7, #0x10
    7080:      	extr	w15, w4, w11, #0x18
    7084:      	ldp	w16, w11, [x17, #0xc]
    7088:      	extr	w5, w6, w4, #0x18
    708c:      	stur	w15, [x3, #0x3]
    7090:      	extr	w17, w16, w6, #0x18
    7094:      	stur	w5, [x3, #0x7]
    7098:      	extr	w4, w11, w16, #0x18
    709c:      	stur	w17, [x3, #0xb]
    70a0:      	stur	w4, [x3, #0xf]
    70a4:      	cmp	x1, #0x11
    70a8:      	b.hs	0x706c <.text+0x606c>
    70ac:      	cmn	x13, #0x11
    70b0:      	orr	x9, xzr, #0xffffffffffffffef
    70b4:      	csel	x17, x13, x9, hi
    70b8:      	add	x12, x17, x12
    70bc:      	orr	x11, xzr, #0xfffffffffffffffd
    70c0:      	and	x8, x12, #0xfffffffffffffff0
    70c4:      	sub	x7, x11, x8
    70c8:      	add	x3, x8, x0
    70cc:      	add	x2, x7, x2
    70d0:      	add	x9, x3, x10
    70d4:      	sub	x11, x2, x10
    70d8:      	add	x8, x9, #0x3
    70dc:      	mov	x9, x14
    70e0:      	b	0x7354 <.text+0x6354>
    70e4:      	mov	x12, xzr
    70e8:      	cmn	x17, #0x10
    70ec:      	orr	x3, xzr, #0xfffffffffffffff0
    70f0:      	csel	x4, x17, x3, hi
    70f4:      	add	x6, x4, x16
    70f8:      	and	x3, x6, #0xfffffffffffffff0
    70fc:      	add	x7, x0, x3
    7100:      	add	x5, x7, x10
    7104:      	b	0x7154 <.text+0x6154>
    7108:      	add	x4, x9, x12
    710c:      	add	x6, x8, x12
    7110:      	add	x12, x12, #0x10
    7114:      	ldp	w13, w14, [x4, #0x8]
    7118:      	bfi	x13, x14, #32, #32
    711c:      	str	x13, [sp, #0x8]
    7120:      	ldp	w15, w3, [x4]
    7124:      	bfi	x15, x3, #32, #32
    7128:      	str	x15, [sp]
    712c:      	ldr	q0, [sp]
    7130:      	str	q0, [sp, #0x10]
    7134:      	ldr	x4, [sp, #0x18]
    7138:      	str	w4, [x6, #0x8]
    713c:      	lsr	x13, x4, #32
    7140:      	ldr	x7, [sp, #0x10]
    7144:      	lsr	x14, x7, #32
    7148:      	str	w7, [x6]
    714c:      	str	w13, [x6, #0xc]
    7150:      	str	w14, [x6, #0x4]
    7154:      	subs	x11, x11, #0x10
    7158:      	b.hs	0x7108 <.text+0x6108>
    715c:      	cmn	x17, #0x10
    7160:      	orr	x9, xzr, #0xfffffffffffffff0
    7164:      	csel	x11, x17, x9, hi
    7168:      	add	x12, x11, x16
    716c:      	and	x15, x12, #0xfffffffffffffff0
    7170:      	sub	x2, x2, x15
    7174:      	sub	x8, x2, x10
    7178:      	tbnz	w8, #0x3, 0x7188 <.text+0x6188>
    717c:      	add	x16, x1, x15
    7180:      	add	x2, x16, x10
    7184:      	b	0x71b8 <.text+0x61b8>
    7188:      	cmn	x17, #0x10
    718c:      	csel	x17, x17, x9, hi
    7190:      	add	x9, x17, x16
    7194:      	and	x9, x9, #0xfffffffffffffff0
    7198:      	add	x1, x1, x9
    719c:      	add	x16, x1, x10
    71a0:      	add	x6, x0, x9
    71a4:      	add	x10, x6, x10
    71a8:      	ldp	w9, w12, [x16]
    71ac:      	add	x5, x10, #0x8
    71b0:      	add	x2, x16, #0x8
    71b4:      	stp	w9, w12, [x10]
    71b8:      	tbz	w8, #0x2, 0x71c4 <.text+0x61c4>
    71bc:      	ldr	w10, [x2], #0x4
    71c0:      	str	w10, [x5], #0x4
    71c4:      	tbz	w8, #0x1, 0x71e8 <.text+0x61e8>
    71c8:      	ldrb	w13, [x2]
    71cc:      	add	x10, x2, #0x2
    71d0:      	ldrb	w14, [x2, #0x1]
    71d4:      	add	x11, x5, #0x2
    71d8:      	mov	x2, x10
    71dc:      	strb	w13, [x5]
    71e0:      	strb	w14, [x5, #0x1]
    71e4:      	mov	x5, x11
    71e8:      	tbz	w8, #0x0, 0x7540 <.text+0x6540>
    71ec:      	ldrb	w8, [x2]
    71f0:      	strb	w8, [x5]
    71f4:      	b	0x7540 <.text+0x6540>
    71f8:      	mov	x11, xzr
    71fc:      	cmn	x4, #0x13
    7200:      	mov	x12, #-0x13             // =-19
    7204:      	csel	x16, x4, x12, hi
    7208:      	add	x15, x16, x3
    720c:      	and	x15, x15, #0xfffffffffffffff0
    7210:      	add	x5, x15, x1
    7214:      	ldr	w15, [x9]
    7218:      	sub	x13, x2, #0x1
    721c:      	add	x6, x5, x10
    7220:      	sub	x14, x13, x10
    7224:      	add	x13, x6, #0x1
    7228:      	strb	w15, [x8]
    722c:      	b	0x7268 <.text+0x6268>
    7230:      	add	x16, x9, x11
    7234:      	add	x1, x8, x11
    7238:      	sub	x14, x14, #0x10
    723c:      	ldp	w17, w7, [x16, #0x4]
    7240:      	add	x11, x11, #0x10
    7244:      	extr	w5, w17, w15, #0x8
    7248:      	ldp	w6, w15, [x16, #0xc]
    724c:      	extr	w16, w7, w17, #0x8
    7250:      	stur	w5, [x1, #0x1]
    7254:      	extr	w17, w6, w7, #0x8
    7258:      	stur	w16, [x1, #0x5]
    725c:      	extr	w7, w15, w6, #0x8
    7260:      	stur	w17, [x1, #0x9]
    7264:      	stur	w7, [x1, #0xd]
    7268:      	cmp	x14, #0x13
    726c:      	b.hs	0x7230 <.text+0x6230>
    7270:      	cmn	x4, #0x13
    7274:      	csel	x8, x4, x12, hi
    7278:      	add	x9, x8, x3
    727c:      	mvn	x11, x9
    7280:      	and	x5, x9, #0xfffffffffffffff0
    7284:      	orr	x11, x11, #0xf
    7288:      	add	x17, x5, x0
    728c:      	add	x12, x11, x2
    7290:      	add	x17, x17, x10
    7294:      	sub	x11, x12, x10
    7298:      	add	x8, x17, #0x1
    729c:      	mov	x9, x13
    72a0:      	b	0x7354 <.text+0x6354>
    72a4:      	mov	x13, xzr
    72a8:      	ldr	w16, [x9]
    72ac:      	cmn	x15, #0x12
    72b0:      	mov	x11, #-0x12             // =-18
    72b4:      	csel	x7, x15, x11, hi
    72b8:      	add	x3, x7, x14
    72bc:      	strb	w16, [x8]
    72c0:      	and	x7, x3, #0xfffffffffffffff0
    72c4:      	add	x1, x7, x1
    72c8:      	ldrb	w7, [x9, #0x1]
    72cc:      	sub	x12, x2, #0x2
    72d0:      	add	x1, x1, x10
    72d4:      	sub	x17, x12, x10
    72d8:      	add	x12, x1, #0x2
    72dc:      	strb	w7, [x8, #0x1]
    72e0:      	b	0x731c <.text+0x631c>
    72e4:      	add	x4, x9, x13
    72e8:      	add	x7, x8, x13
    72ec:      	sub	x17, x17, #0x10
    72f0:      	ldp	w1, w3, [x4, #0x4]
    72f4:      	add	x13, x13, #0x10
    72f8:      	extr	w5, w1, w16, #0x10
    72fc:      	ldp	w6, w16, [x4, #0xc]
    7300:      	extr	w4, w3, w1, #0x10
    7304:      	stur	w5, [x7, #0x2]
    7308:      	extr	w1, w6, w3, #0x10
    730c:      	stur	w4, [x7, #0x6]
    7310:      	extr	w3, w16, w6, #0x10
    7314:      	stur	w1, [x7, #0xa]
    7318:      	stur	w3, [x7, #0xe]
    731c:      	cmp	x17, #0x12
    7320:      	b.hs	0x72e4 <.text+0x62e4>
    7324:      	cmn	x15, #0x12
    7328:      	csel	x13, x15, x11, hi
    732c:      	add	x14, x13, x14
    7330:      	orr	x4, xzr, #0xfffffffffffffffe
    7334:      	and	x14, x14, #0xfffffffffffffff0
    7338:      	sub	x16, x4, x14
    733c:      	add	x15, x14, x0
    7340:      	add	x5, x16, x2
    7344:      	add	x2, x15, x10
    7348:      	sub	x11, x5, x10
    734c:      	add	x8, x2, #0x2
    7350:      	mov	x9, x12
    7354:      	tbz	w11, #0x4, 0x7488 <.text+0x6488>
    7358:      	mov	x15, x9
    735c:      	ldrb	w10, [x9, #0x3]
    7360:      	ldrb	w7, [x9, #0x2]
    7364:      	ldrb	w3, [x9, #0x1]
    7368:      	ldrb	w2, [x9]
    736c:      	ldrb	w1, [x15, #0x4]!
    7370:      	ldrb	w4, [x9, #0x5]
    7374:      	bfi	x7, x10, #8, #8
    7378:      	bfi	x2, x3, #8, #8
    737c:      	ldrb	w13, [x15, #0x3]
    7380:      	bfi	x2, x7, #16, #16
    7384:      	ldrb	w12, [x15, #0x2]
    7388:      	lsl	x14, x4, #8
    738c:      	orr	w16, w14, w1
    7390:      	lsl	x15, x13, #8
    7394:      	orr	w13, w15, w12
    7398:      	bfi	w16, w13, #16, #16
    739c:      	bfi	x2, x16, #32, #32
    73a0:      	mov	x16, x9
    73a4:      	str	x2, [sp, #0x20]
    73a8:      	ldrb	w5, [x9, #0x9]
    73ac:      	ldrb	w6, [x16, #0x8]!
    73b0:      	bfi	x6, x5, #8, #8
    73b4:      	ldrb	w17, [x16, #0x3]
    73b8:      	ldrb	w12, [x16, #0x2]
    73bc:      	ldrb	w10, [x16, #0x4]!
    73c0:      	ldrb	w7, [x9, #0xd]
    73c4:      	add	x9, x9, #0x10
    73c8:      	bfi	x12, x17, #8, #8
    73cc:      	ldrb	w3, [x16, #0x3]
    73d0:      	add	x17, x8, #0x10
    73d4:      	ldrb	w2, [x16, #0x2]
    73d8:      	lsl	x1, x7, #8
    73dc:      	bfi	x6, x12, #16, #16
    73e0:      	orr	w4, w1, w10
    73e4:      	lsl	x13, x3, #8
    73e8:      	mov	x1, x8
    73ec:      	orr	w10, w13, w2
    73f0:      	bfi	w4, w10, #16, #16
    73f4:      	bfi	x6, x4, #32, #32
    73f8:      	str	x6, [sp, #0x28]
    73fc:      	ldr	q0, [sp, #0x20]
    7400:      	str	q0, [sp, #0x30]
    7404:      	ldr	x2, [sp, #0x30]
    7408:      	strb	w2, [x8]
    740c:      	lsr	x16, x2, #40
    7410:      	ldr	x14, [sp, #0x38]
    7414:      	ubfx	x12, x2, #24, #8
    7418:      	ubfx	x10, x2, #16, #16
    741c:      	ubfx	x7, x2, #8, #24
    7420:      	lsr	x3, x2, #32
    7424:      	ubfx	x15, x14, #24, #8
    7428:      	ubfx	x5, x14, #16, #16
    742c:      	lsr	x6, x14, #32
    7430:      	strb	w14, [x1, #0x8]!
    7434:      	lsr	x4, x14, #40
    7438:      	strb	w15, [x1, #0x3]
    743c:      	ubfx	x13, x14, #8, #24
    7440:      	strb	w5, [x1, #0x2]
    7444:      	strb	w6, [x1, #0x4]!
    7448:      	strb	w16, [x8, #0x5]
    744c:      	lsr	x16, x2, #56
    7450:      	lsr	x2, x2, #48
    7454:      	strb	w12, [x8, #0x3]
    7458:      	strb	w10, [x8, #0x2]
    745c:      	lsr	x15, x14, #56
    7460:      	strb	w7, [x8, #0x1]
    7464:      	lsr	x14, x14, #48
    7468:      	strb	w4, [x8, #0xd]
    746c:      	strb	w13, [x8, #0x9]
    7470:      	strb	w3, [x8, #0x4]!
    7474:      	strb	w16, [x8, #0x3]
    7478:      	strb	w2, [x8, #0x2]
    747c:      	mov	x8, x17
    7480:      	strb	w15, [x1, #0x3]
    7484:      	strb	w14, [x1, #0x2]
    7488:      	tbz	w11, #0x3, 0x74dc <.text+0x64dc>
    748c:      	ldrb	w14, [x9]
    7490:      	add	x2, x9, #0x8
    7494:      	ldrb	w15, [x9, #0x1]
    7498:      	add	x3, x8, #0x8
    749c:      	ldrb	w4, [x9, #0x2]
    74a0:      	ldrb	w1, [x9, #0x3]
    74a4:      	ldrb	w6, [x9, #0x4]
    74a8:      	ldrb	w5, [x9, #0x5]
    74ac:      	ldrb	w16, [x9, #0x6]
    74b0:      	ldrb	w9, [x9, #0x7]
    74b4:      	strb	w14, [x8]
    74b8:      	strb	w15, [x8, #0x1]
    74bc:      	strb	w4, [x8, #0x2]
    74c0:      	strb	w1, [x8, #0x3]
    74c4:      	strb	w6, [x8, #0x4]
    74c8:      	strb	w5, [x8, #0x5]
    74cc:      	strb	w16, [x8, #0x6]
    74d0:      	strb	w9, [x8, #0x7]
    74d4:      	mov	x8, x3
    74d8:      	mov	x9, x2
    74dc:      	tbz	w11, #0x2, 0x7510 <.text+0x6510>
    74e0:      	ldrb	w3, [x9]
    74e4:      	add	x4, x9, #0x4
    74e8:      	ldrb	w17, [x9, #0x1]
    74ec:      	add	x5, x8, #0x4
    74f0:      	ldrb	w7, [x9, #0x2]
    74f4:      	ldrb	w12, [x9, #0x3]
    74f8:      	mov	x9, x4
    74fc:      	strb	w3, [x8]
    7500:      	strb	w17, [x8, #0x1]
    7504:      	strb	w7, [x8, #0x2]
    7508:      	strb	w12, [x8, #0x3]
    750c:      	mov	x8, x5
    7510:      	tbz	w11, #0x1, 0x7534 <.text+0x6534>
    7514:      	ldrb	w13, [x9]
    7518:      	add	x6, x9, #0x2
    751c:      	ldrb	w2, [x9, #0x1]
    7520:      	add	x7, x8, #0x2
    7524:      	mov	x9, x6
    7528:      	strb	w13, [x8]
    752c:      	strb	w2, [x8, #0x1]
    7530:      	mov	x8, x7
    7534:      	tbz	w11, #0x0, 0x7540 <.text+0x6540>
    7538:      	ldrb	w11, [x9]
    753c:      	strb	w11, [x8]
    7540:      	add	sp, sp, #0x40
    7544:      	ret
    7548:      	stp	x20, x19, [sp, #-0x20]!
    754c:      	stp	x29, x30, [sp, #0x10]
    7550:      	add	x29, sp, #0x10
    7554:      	mov	x19, x0
    7558:      	cbz	x19, 0x75c8 <.text+0x65c8>
    755c:      	adrp	x20, 0xc000
    7560:      	ldrb	w8, [x20, #0x590]
    7564:      	cmp	w8, #0x1
    7568:      	b.ne	0x757c <.text+0x657c>
    756c:      	adrp	x1, 0xa000 <.text+0x9000>
    7570:      	add	x1, x1, #0xcfc
    7574:      	orr	w0, wzr, #0x80000000
    7578:      	bl	0x18bc <.text+0x8bc>
    757c:      	orr	w9, wzr, #0x1
    7580:      	strb	w9, [x20, #0x590]
    7584:      	adrp	x20, 0xc000
    7588:      	ldr	w10, [x19]
    758c:      	add	x20, x20, #0x5a0
    7590:      	add	x9, x19, #0x10
    7594:      	str	w10, [x20, #0x28]
    7598:      	ldr	x8, [x19, #0x8]
    759c:      	add	x19, x20, #0x18
    75a0:      	str	x9, [x20]
    75a4:      	str	x8, [x20, #0x30]
    75a8:      	bl	0x7608 <.text+0x6608>
    75ac:      	ldp	x0, x8, [x20]
    75b0:      	add	x2, x20, #0x10
    75b4:      	mov	x1, x19
    75b8:      	ldr	x3, [x8, #0x8]
    75bc:      	ldp	x29, x30, [sp, #0x10]
    75c0:      	ldp	x20, x19, [sp], #0x20
    75c4:      	br	x3
    75c8:      	adrp	x19, 0xc000
    75cc:      	add	x19, x19, #0x5a0
    75d0:      	ldr	x9, [x19, #0x10]
    75d4:      	cbz	x9, 0x75e4 <.text+0x65e4>
    75d8:      	ldp	x29, x30, [sp, #0x10]
    75dc:      	ldp	x20, x19, [sp], #0x20
    75e0:      	ret
    75e4:      	bl	0x7608 <.text+0x6608>
    75e8:      	ldr	x10, [x19, #0x8]
    75ec:      	mov	x0, xzr
    75f0:      	mov	x1, xzr
    75f4:      	add	x2, x19, #0x10
    75f8:      	ldr	x4, [x10, #0x8]
    75fc:      	ldp	x29, x30, [sp, #0x10]
    7600:      	ldp	x20, x19, [sp], #0x20
    7604:      	br	x4
    7608:      	stp	x20, x19, [sp, #-0x20]!
    760c:      	stp	x29, x30, [sp, #0x10]
    7610:      	add	x29, sp, #0x10
    7614:      	adrp	x8, 0xc000
    7618:      	adrp	x19, 0xc000
    761c:      	add	x19, x19, #0x5a0
    7620:      	ldr	x9, [x8, #0x520]
    7624:      	adrp	x0, 0xc000
    7628:      	mov	x1, xzr
    762c:      	add	x2, x19, #0x8
    7630:      	add	x0, x0, #0x100
    7634:      	ldr	x9, [x9, #0x140]
    7638:      	blr	x9
    763c:      	mov	x8, x0
    7640:      	tbz	x8, #0x3f, 0x7670 <.text+0x6670>
    7644:      	adrp	x1, 0x7000 <.text+0x6000>
    7648:      	add	x1, x1, #0xdc8
    764c:      	orr	w0, wzr, #0x80000000
    7650:      	mov	x2, x8
    7654:      	bl	0x18bc <.text+0x8bc>
    7658:      	adrp	x0, 0xa000 <.text+0x9000>
    765c:      	adrp	x2, 0xa000 <.text+0x9000>
    7660:      	add	x0, x0, #0xd30
    7664:      	mov	w1, #0x69               // =105
    7668:      	add	x2, x2, #0xd43
    766c:      	bl	0x1c48 <.text+0xc48>
    7670:      	ldr	x10, [x19, #0x8]
    7674:      	cbz	x10, 0x7684 <.text+0x6684>
    7678:      	ldp	x29, x30, [sp, #0x10]
    767c:      	ldp	x20, x19, [sp], #0x20
    7680:      	ret
    7684:      	adrp	x0, 0xa000 <.text+0x9000>
    7688:      	adrp	x2, 0xa000 <.text+0x9000>
    768c:      	add	x0, x0, #0xd30
    7690:      	mov	w1, #0x6a               // =106
    7694:      	add	x2, x2, #0xd57
    7698:      	bl	0x1c48 <.text+0xc48>
    769c:      	b	0x769c <.text+0x669c>
    76a0:      	adrp	x9, 0xc000
    76a4:      	add	x9, x9, #0x5a0
    76a8:      	ldr	x8, [x9, #0x10]
    76ac:      	cbz	x8, 0x76b8 <.text+0x66b8>
    76b0:      	ldr	x2, [x8, #0xc8]
    76b4:      	br	x2
    76b8:      	mov	w0, #-0x1               // =-1
    76bc:      	ret
    76c0:      	adrp	x9, 0xc000
    76c4:      	add	x9, x9, #0x5a0
    76c8:      	ldr	x8, [x9, #0x10]
    76cc:      	cbz	x8, 0x76d8 <.text+0x66d8>
    76d0:      	ldr	x4, [x8, #0x100]
    76d4:      	br	x4
    76d8:      	mov	w0, #-0x1               // =-1
    76dc:      	ret
    76e0:      	ldr	x0, 0x7800 <.text+0x6800>
    76e4:      	str	xzr, [x0]
    76e8:      	bl	0x6ec8 <.text+0x5ec8>
    76ec:      	dsb	sy
    76f0:      	isb
    76f4:      	ldr	x0, 0x7808 <.text+0x6808>
    76f8:      	ldr	x2, 0x7810 <.text+0x6810>
    76fc:      	mov	x3, #0x8                // =8
    7700:      	smc	#0
    7704:      	cmp	w0, #0x0
    7708:      	b.gt	0x7700 <.text+0x6700>
    770c:      	cmp	w0, #0x0
    7710:      	b.ne	0x772c <.text+0x672c>
    7714:      	ldr	x0, 0x7818 <.text+0x6818>
    7718:      	bl	0x6ec0 <.text+0x5ec0>
    771c:      	dsb	sy
    7720:      	isb
    7724:      	ldr	x1, 0x7820 <.text+0x6820>
    7728:      	ldr	x0, [x1]
    772c:      	ldp	x29, x30, [sp], #0x10
    7730:      	ret
    7734:      	ldr	x0, 0x7828 <.text+0x6828>
    7738:      	str	xzr, [x0]
    773c:      	bl	0x6ec8 <.text+0x5ec8>
    7740:      	dsb	sy
    7744:      	isb
    7748:      	ldr	x0, 0x7830 <.text+0x6830>
    774c:      	mov	x1, #0x22               // =34
    7750:      	ldr	x2, 0x7838 <.text+0x6838>
    7754:      	mov	x3, #0x8                // =8
    7758:      	smc	#0
    775c:      	cmp	w0, #0x0
    7760:      	b.gt	0x7758 <.text+0x6758>
    7764:      	cmp	w0, #0x0
    7768:      	b.ne	0x7784 <.text+0x6784>
    776c:      	ldr	x0, 0x7840 <.text+0x6840>
    7770:      	bl	0x6ec0 <.text+0x5ec0>
    7774:      	dsb	sy
    7778:      	isb
    777c:      	ldr	x1, 0x7848 <.text+0x6848>
    7780:      	ldr	x0, [x1]
    7784:      	ldp	x29, x30, [sp], #0x10
    7788:      	ret
    778c:      	stp	x29, x30, [sp, #-0x10]!
    7790:      	mov	x29, sp
    7794:      	ldr	x0, 0x7850 <.text+0x6850>
    7798:      	ldr	x0, [x0]
    779c:      	adr	x1, 0x77a8 <.text+0x67a8>
    77a0:      	ldr	x2, [x1, x0]
    77a4:      	br	x2
    77a8:      	udf	#0x77c0
    77ac:      	udf	#0x0
    77b0:      	udf	#0x76e0
    77b4:      	udf	#0x0
    77b8:      	udf	#0x7734
    77bc:      	udf	#0x0
    77c0:      	ldr	x0, 0x7858 <.text+0x6858>
    77c4:      	mov	x1, #0x1                // =1
    77c8:      	ldr	x2, 0x7860 <.text+0x6860>
    77cc:      	smc	#0
    77d0:      	cmp	w0, #0x0
    77d4:      	b.gt	0x77cc <.text+0x67cc>
    77d8:      	cmp	w0, #0x0
    77dc:      	ldr	x1, 0x7868 <.text+0x6868>
    77e0:      	b.ne	0x77f0 <.text+0x67f0>
    77e4:      	mov	x0, #0x10               // =16
    77e8:      	str	x0, [x1]
    77ec:      	b	0x7734 <.text+0x6734>
    77f0:      	mov	x0, #0x8                // =8
    77f4:      	str	x0, [x1]
    77f8:      	b	0x76e0 <.text+0x66e0>
    77fc:      	nop
    7800:      	udf	#0xc4c0
    7804:      	udf	#0x0
    7808:      	<unknown>
    780c:      	udf	#0x0
    7810:      	udf	#0xc4c0
    7814:      	udf	#0x0
    7818:      	udf	#0xc4c0
    781c:      	udf	#0x0
    7820:      	udf	#0xc4c0
    7824:      	udf	#0x0
    7828:      	udf	#0xc4c0
    782c:      	udf	#0x0
    7830:      	<unknown>
    7834:      	udf	#0x0
    7838:      	udf	#0xc4c0
    783c:      	udf	#0x0
    7840:      	udf	#0xc4c0
    7844:      	udf	#0x0
    7848:      	udf	#0xc4c0
    784c:      	udf	#0x0
    7850:      	udf	#0xc4c8
    7854:      	udf	#0x0
    7858:      	<unknown>
    785c:      	udf	#0x0
    7860:      	<unknown>
    7864:      	udf	#0x0
    7868:      	udf	#0xc4c8
    786c:      	udf	#0x0
    7870:      	stp	x29, x30, [sp, #-0x10]!
    7874:      	mov	x29, sp
    7878:      	bl	0x7d9c <.text+0x6d9c>
    787c:      	cbz	x0, 0x78a0 <.text+0x68a0>
    7880:      	ldr	x3, [x0, #0x10]
    7884:      	adrp	x0, 0xa000 <.text+0x9000>
    7888:      	adrp	x2, 0xc000
    788c:      	mov	w1, wzr
    7890:      	add	x0, x0, #0xd6a
    7894:      	add	x2, x2, #0x5d8
    7898:      	ldp	x29, x30, [sp], #0x10
    789c:      	br	x3
    78a0:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    78a4:      	ldp	x29, x30, [sp], #0x10
    78a8:      	ret
    78ac:      	stp	x20, x19, [sp, #-0x20]!
    78b0:      	stp	x29, x30, [sp, #0x10]
    78b4:      	add	x29, sp, #0x10
    78b8:      	adrp	x19, 0xc000
    78bc:      	ldr	x8, [x19, #0x5d8]
    78c0:      	cbnz	x8, 0x78d0 <.text+0x68d0>
    78c4:      	bl	0x7870 <.text+0x6870>
    78c8:      	ldr	x8, [x19, #0x5d8]
    78cc:      	cbz	x8, 0x78e0 <.text+0x68e0>
    78d0:      	ldr	x0, [x8, #0x28]
    78d4:      	ldp	x29, x30, [sp, #0x10]
    78d8:      	ldp	x20, x19, [sp], #0x20
    78dc:      	br	x0
    78e0:      	ldp	x29, x30, [sp, #0x10]
    78e4:      	mov	x0, xzr
    78e8:      	ldp	x20, x19, [sp], #0x20
    78ec:      	ret
    78f0:      	stp	x20, x19, [sp, #-0x20]!
    78f4:      	stp	x29, x30, [sp, #0x10]
    78f8:      	add	x29, sp, #0x10
    78fc:      	adrp	x20, 0xc000
    7900:      	mov	w19, w0
    7904:      	ldr	x8, [x20, #0x5d8]
    7908:      	cbnz	x8, 0x7918 <.text+0x6918>
    790c:      	bl	0x7870 <.text+0x6870>
    7910:      	ldr	x8, [x20, #0x5d8]
    7914:      	cbz	x8, 0x792c <.text+0x692c>
    7918:      	ldr	x1, [x8, #0x38]
    791c:      	mov	w0, w19
    7920:      	ldp	x29, x30, [sp, #0x10]
    7924:      	ldp	x20, x19, [sp], #0x20
    7928:      	br	x1
    792c:      	ldp	x29, x30, [sp, #0x10]
    7930:      	mov	x0, xzr
    7934:      	ldp	x20, x19, [sp], #0x20
    7938:      	ret
    793c:      	stp	x24, x23, [sp, #-0x40]!
    7940:      	stp	x22, x21, [sp, #0x10]
    7944:      	stp	x20, x19, [sp, #0x20]
    7948:      	stp	x29, x30, [sp, #0x30]
    794c:      	add	x29, sp, #0x30
    7950:      	mov	x19, x4
    7954:      	str	xzr, [sp, #-0x10]!
    7958:      	adrp	x8, 0xc000
    795c:      	mov	x23, x0
    7960:      	adrp	x0, 0xc000
    7964:      	ldr	x9, [x8, #0x520]
    7968:      	mov	w21, w2
    796c:      	mov	x22, x1
    7970:      	mov	x1, xzr
    7974:      	add	x0, x0, #0x110
    7978:      	ldr	x9, [x9, #0x140]
    797c:      	add	x2, sp, #0x8
    7980:      	mov	w20, w3
    7984:      	blr	x9
    7988:      	mov	x8, x0
    798c:      	cbz	x8, 0x79a8 <.text+0x69a8>
    7990:      	adrp	x1, 0xa000 <.text+0x9000>
    7994:      	add	x1, x1, #0xd79
    7998:      	orr	w0, wzr, #0x80000000
    799c:      	mov	x2, x8
    79a0:      	bl	0x18bc <.text+0x8bc>
    79a4:      	b	0x79cc <.text+0x69cc>
    79a8:      	ldr	x10, [sp, #0x8]
    79ac:      	mov	x5, sp
    79b0:      	mov	x0, x23
    79b4:      	mov	x1, x22
    79b8:      	mov	w2, w21
    79bc:      	ldr	x10, [x10, #0x10]
    79c0:      	mov	w3, w20
    79c4:      	mov	x4, x19
    79c8:      	blr	x10
    79cc:      	ldr	x0, [sp]
    79d0:      	sub	sp, x29, #0x30
    79d4:      	ldp	x29, x30, [sp, #0x30]
    79d8:      	ldp	x20, x19, [sp, #0x20]
    79dc:      	ldp	x22, x21, [sp, #0x10]
    79e0:      	ldp	x24, x23, [sp], #0x40
    79e4:      	ret
    79e8:      	stp	x20, x19, [sp, #-0x20]!
    79ec:      	stp	x29, x30, [sp, #0x10]
    79f0:      	add	x29, sp, #0x10
    79f4:      	sub	sp, sp, #0x10
    79f8:      	adrp	x8, 0xc000
    79fc:      	mov	x20, x0
    7a00:      	adrp	x0, 0xc000
    7a04:      	ldr	x9, [x8, #0x520]
    7a08:      	mov	w19, w1
    7a0c:      	mov	x1, xzr
    7a10:      	add	x0, x0, #0x110
    7a14:      	add	x2, sp, #0x8
    7a18:      	ldr	x9, [x9, #0x140]
    7a1c:      	blr	x9
    7a20:      	mov	x8, x0
    7a24:      	cbz	x8, 0x7a40 <.text+0x6a40>
    7a28:      	adrp	x1, 0xa000 <.text+0x9000>
    7a2c:      	add	x1, x1, #0xd79
    7a30:      	orr	w0, wzr, #0x80000000
    7a34:      	mov	x2, x8
    7a38:      	bl	0x18bc <.text+0x8bc>
    7a3c:      	b	0x7a54 <.text+0x6a54>
    7a40:      	ldr	x10, [sp, #0x8]
    7a44:      	mov	x0, x20
    7a48:      	mov	w1, w19
    7a4c:      	ldr	x10, [x10, #0x28]
    7a50:      	blr	x10
    7a54:      	sub	sp, x29, #0x10
    7a58:      	ldp	x29, x30, [sp, #0x10]
    7a5c:      	ldp	x20, x19, [sp], #0x20
    7a60:      	ret
    7a64:      	stp	x20, x19, [sp, #-0x20]!
    7a68:      	stp	x29, x30, [sp, #0x10]
    7a6c:      	add	x29, sp, #0x10
    7a70:      	mov	w19, w1
    7a74:      	mov	x20, x0
    7a78:      	bl	0x7af8 <.text+0x6af8>
    7a7c:      	ldp	x29, x30, [sp, #0x10]
    7a80:      	orr	w1, w0, w19
    7a84:      	mov	x0, x20
    7a88:      	ldp	x20, x19, [sp], #0x20
    7a8c:      	b	0x7b30 <.text+0x6b30>
    7a90:      	stp	x20, x19, [sp, #-0x20]!
    7a94:      	stp	x29, x30, [sp, #0x10]
    7a98:      	add	x29, sp, #0x10
    7a9c:      	mov	w19, w1
    7aa0:      	mov	x20, x0
    7aa4:      	bl	0x7af8 <.text+0x6af8>
    7aa8:      	ldp	x29, x30, [sp, #0x10]
    7aac:      	and	w1, w0, w19
    7ab0:      	mov	x0, x20
    7ab4:      	ldp	x20, x19, [sp], #0x20
    7ab8:      	b	0x7b30 <.text+0x6b30>
    7abc:      	stp	x22, x21, [sp, #-0x30]!
    7ac0:      	stp	x20, x19, [sp, #0x10]
    7ac4:      	stp	x29, x30, [sp, #0x20]
    7ac8:      	add	x29, sp, #0x20
    7acc:      	mov	w19, w2
    7ad0:      	mov	w20, w1
    7ad4:      	mov	x21, x0
    7ad8:      	bl	0x7af8 <.text+0x6af8>
    7adc:      	and	w8, w0, w20
    7ae0:      	orr	w1, w8, w19
    7ae4:      	ldp	x29, x30, [sp, #0x20]
    7ae8:      	mov	x0, x21
    7aec:      	ldp	x20, x19, [sp, #0x10]
    7af0:      	ldp	x22, x21, [sp], #0x30
    7af4:      	b	0x7b30 <.text+0x6b30>
    7af8:      	and	x8, x0, #0x3
    7afc:      	cbz	x8, 0x7b28 <.text+0x6b28>
    7b00:      	stp	x29, x30, [sp, #-0x10]!
    7b04:      	mov	x29, sp
    7b08:      	adrp	x0, 0xa000 <.text+0x9000>
    7b0c:      	adrp	x2, 0xa000 <.text+0x9000>
    7b10:      	add	x0, x0, #0xd97
    7b14:      	mov	w1, #0x15d              // =349
    7b18:      	add	x2, x2, #0xdb5
    7b1c:      	bl	0x1c48 <.text+0xc48>
    7b20:      	ldp	x29, x30, [sp], #0x10
    7b24:      	b	0x7b24 <.text+0x6b24>
    7b28:      	ldr	w0, [x0]
    7b2c:      	ret
    7b30:      	mov	x8, x0
    7b34:      	and	x9, x8, #0x3
    7b38:      	cbz	x9, 0x7b64 <.text+0x6b64>
    7b3c:      	stp	x29, x30, [sp, #-0x10]!
    7b40:      	mov	x29, sp
    7b44:      	adrp	x0, 0xa000 <.text+0x9000>
    7b48:      	adrp	x2, 0xa000 <.text+0x9000>
    7b4c:      	add	x0, x0, #0xd97
    7b50:      	mov	w1, #0x176              // =374
    7b54:      	add	x2, x2, #0xdb5
    7b58:      	bl	0x1c48 <.text+0xc48>
    7b5c:      	ldp	x29, x30, [sp], #0x10
    7b60:      	b	0x7b60 <.text+0x6b60>
    7b64:      	mov	w0, w1
    7b68:      	str	w1, [x8]
    7b6c:      	ret
    7b70:      	stp	x22, x21, [sp, #-0x30]!
    7b74:      	stp	x20, x19, [sp, #0x10]
    7b78:      	stp	x29, x30, [sp, #0x20]
    7b7c:      	add	x29, sp, #0x20
    7b80:      	sub	sp, sp, #0x10
    7b84:      	mov	x20, x1
    7b88:      	mov	x19, x0
    7b8c:      	ldr	w1, [x20]
    7b90:      	cbnz	w1, 0x7c08 <.text+0x6c08>
    7b94:      	add	x0, sp, #0x8
    7b98:      	mov	x1, sp
    7b9c:      	bl	0x2768 <.text+0x1768>
    7ba0:      	mov	x9, #-0xf0001           // =-983041
    7ba4:      	movk	x9, #0xbdbf
    7ba8:      	mov	w11, #-0x100000         // =-1048576
    7bac:      	add	x10, x0, x9
    7bb0:      	movk	w11, #0xbdbe
    7bb4:      	cmp	x10, x11
    7bb8:      	b.hi	0x7c14 <.text+0x6c14>
    7bbc:      	ldp	x14, x13, [sp]
    7bc0:      	cmp	x13, x14
    7bc4:      	b.hs	0x7c14 <.text+0x6c14>
    7bc8:      	adrp	x21, 0xc000
    7bcc:      	and	x8, x0, #0xffffffff
    7bd0:      	mov	w1, #0xf0000            // =983040
    7bd4:      	str	w0, [x21, #0x5e0]
    7bd8:      	movk	w1, #0x4240
    7bdc:      	mov	x0, x8
    7be0:      	bl	0x205c <.text+0x105c>
    7be4:      	ldr	w8, [x21, #0x5e0]
    7be8:      	adrp	x9, 0xc000
    7bec:      	mov	w1, #0x3e8              // =1000
    7bf0:      	str	w0, [x9, #0x5e4]
    7bf4:      	mov	x0, x8
    7bf8:      	bl	0x205c <.text+0x105c>
    7bfc:      	adrp	x8, 0xc000
    7c00:      	str	w0, [x8, #0x5e8]
    7c04:      	ldr	w1, [x20]
    7c08:      	mov	x0, x19
    7c0c:      	bl	0x205c <.text+0x105c>
    7c10:      	b	0x7c18 <.text+0x6c18>
    7c14:      	mov	w0, wzr
    7c18:      	sub	sp, x29, #0x20
    7c1c:      	ldp	x29, x30, [sp, #0x20]
    7c20:      	ldp	x20, x19, [sp, #0x10]
    7c24:      	ldp	x22, x21, [sp], #0x30
    7c28:      	ret
    7c2c:      	stp	x29, x30, [sp, #-0x10]!
    7c30:      	mov	x29, sp
    7c34:      	bl	0x2764 <.text+0x1764>
    7c38:      	adrp	x1, 0xc000
    7c3c:      	add	x1, x1, #0x5e8
    7c40:      	ldp	x29, x30, [sp], #0x10
    7c44:      	b	0x7b70 <.text+0x6b70>
    7c48:      	stp	x20, x19, [sp, #-0x20]!
    7c4c:      	stp	x29, x30, [sp, #0x10]
    7c50:      	add	x29, sp, #0x10
    7c54:      	mov	x19, x1
    7c58:      	mov	w20, w0
    7c5c:      	bl	0x6ee0 <.text+0x5ee0>
    7c60:      	cbz	x0, 0x7c98 <.text+0x6c98>
    7c64:      	mov	w8, w20
    7c68:      	cmp	w20, #0xe
    7c6c:      	b.hi	0x7cc4 <.text+0x6cc4>
    7c70:      	adrp	x9, 0xa000 <.text+0x9000>
    7c74:      	add	x9, x9, #0xde0
    7c78:      	ldr	x9, [x9, x8, lsl #3]
    7c7c:      	br	x9
    7c80:      	ldp	x29, x30, [sp, #0x10]
    7c84:      	adrp	x1, 0xa000 <.text+0x9000>
    7c88:      	add	x1, x1, #0xe58
    7c8c:      	orr	w0, wzr, #0x80000000
    7c90:      	ldp	x20, x19, [sp], #0x20
    7c94:      	b	0x18bc <.text+0x8bc>
    7c98:      	adrp	x1, 0xa000 <.text+0x9000>
    7c9c:      	add	x1, x1, #0xed2
    7ca0:      	orr	w0, wzr, #0x80000000
    7ca4:      	bl	0x18bc <.text+0x8bc>
    7ca8:      	adrp	x0, 0xa000 <.text+0x9000>
    7cac:      	adrp	x2, 0x8000 <.text+0x7000>
    7cb0:      	add	x0, x0, #0xf35
    7cb4:      	mov	w1, #0x5e               // =94
    7cb8:      	add	x2, x2, #0xe32
    7cbc:      	bl	0x1c48 <.text+0xc48>
    7cc0:      	b	0x7cc0 <.text+0x6cc0>
    7cc4:      	ldp	x29, x30, [sp, #0x10]
    7cc8:      	adrp	x1, 0xa000 <.text+0x9000>
    7ccc:      	add	x1, x1, #0xea8
    7cd0:      	orr	w0, wzr, #0x80000000
    7cd4:      	mov	w2, w20
    7cd8:      	ldp	x20, x19, [sp], #0x20
    7cdc:      	b	0x18bc <.text+0x8bc>
    7ce0:      	bl	0x7d44 <.text+0x6d44>
    7ce4:      	b	0x7d34 <.text+0x6d34>
    7ce8:      	bl	0x7d4c <.text+0x6d4c>
    7cec:      	b	0x7d34 <.text+0x6d34>
    7cf0:      	bl	0x7d54 <.text+0x6d54>
    7cf4:      	b	0x7d34 <.text+0x6d34>
    7cf8:      	bl	0x7d5c <.text+0x6d5c>
    7cfc:      	b	0x7d34 <.text+0x6d34>
    7d00:      	bl	0x7d64 <.text+0x6d64>
    7d04:      	b	0x7d34 <.text+0x6d34>
    7d08:      	bl	0x7d6c <.text+0x6d6c>
    7d0c:      	b	0x7d34 <.text+0x6d34>
    7d10:      	bl	0x7d74 <.text+0x6d74>
    7d14:      	b	0x7d34 <.text+0x6d34>
    7d18:      	bl	0x7d7c <.text+0x6d7c>
    7d1c:      	b	0x7d34 <.text+0x6d34>
    7d20:      	bl	0x7d84 <.text+0x6d84>
    7d24:      	b	0x7d34 <.text+0x6d34>
    7d28:      	bl	0x7d8c <.text+0x6d8c>
    7d2c:      	b	0x7d34 <.text+0x6d34>
    7d30:      	bl	0x7d94 <.text+0x6d94>
    7d34:      	str	x0, [x19]
    7d38:      	ldp	x29, x30, [sp, #0x10]
    7d3c:      	ldp	x20, x19, [sp], #0x20
    7d40:      	ret
    7d44:      	mrs	x0, CNTFRQ_EL0
    7d48:      	ret
    7d4c:      	mrs	x0, CNTPCT_EL0
    7d50:      	ret
    7d54:      	mrs	x0, CNTKCTL_EL1
    7d58:      	ret
    7d5c:      	mrs	x0, CNTP_TVAL_EL0
    7d60:      	ret
    7d64:      	mrs	x0, CNTP_CTL_EL0
    7d68:      	ret
    7d6c:      	mrs	x0, CNTV_TVAL_EL0
    7d70:      	ret
    7d74:      	mrs	x0, CNTV_CTL_EL0
    7d78:      	ret
    7d7c:      	mrs	x0, CNTVCT_EL0
    7d80:      	ret
    7d84:      	mrs	x0, CNTP_CVAL_EL0
    7d88:      	ret
    7d8c:      	mrs	x0, CNTV_CVAL_EL0
    7d90:      	ret
    7d94:      	mrs	x0, CNTVOFF_EL2
    7d98:      	ret
    7d9c:      	stp	x29, x30, [sp, #-0x10]!
    7da0:      	mov	x29, sp
    7da4:      	adrp	x0, 0xc000
    7da8:      	add	x0, x0, #0xa0
    7dac:      	bl	0x23cc <.text+0x13cc>
    7db0:      	cbz	x0, 0x7dbc <.text+0x6dbc>
    7db4:      	ldr	x0, [x0, #0x18]
    7db8:      	b	0x7dc0 <.text+0x6dc0>
    7dbc:      	mov	x0, xzr
    7dc0:      	ldp	x29, x30, [sp], #0x10
    7dc4:      	ret
    7dc8:      	<unknown>
    7dcc:      	<unknown>
    7dd0:      	<unknown>
    7dd4:      	<unknown>
    7dd8:      	<unknown>
    7ddc:      	<unknown>
    7de0:      	<unknown>
    7de4:      	bic	w5, w17, w9, lsl #28
    7de8:      	ldpsw	x0, x17, [x0, #-0x70]
    7dec:      	addhnt	z22.b, z11.h, z18.h
    7df0:      	ldrh	w14, [x3, #0x193a]
    7df4:      	umin	v16.8h, v26.8h, v9.8h
    7df8:      	<unknown>
    7dfc:      	<unknown>
    7e00:      	<unknown>
    7e04:      	stnp	w15, w20, [x18, #-0x100]
    7e08:      	<unknown>
    7e0c:      	<unknown>
    7e10:      	<unknown>
    7e14:      	ldpsw	x15, x27, [x19, #-0xd0]
    7e18:      	fnmla	z7.h, p1/m, z3.h, z24.h
    7e1c:      	<unknown>
    7e20:      	ushl	v15.8h, v27.8h, v5.8h
    7e24:      	udf	#0x632e
    7e28:      	udf	#0x2b06
    7e2c:      	<unknown>
    7e30:      	<unknown>
    7e34:      	<unknown>
		...
    7e40:      	<unknown>
    7e44:      	ldpsw	x0, x17, [x17, #-0xf8]
    7e48:      	<unknown>
    7e4c:      	<unknown>
    7e50:      	<unknown>
    7e54:      	<unknown>
    7e58:      	<unknown>
    7e5c:      	raddhn2	v14.8h, v27.4s, v15.4s
    7e60:      	<unknown>
    7e64:      	<unknown>
    7e68:      	<unknown>
    7e6c:      	<unknown>
    7e70:      	<unknown>
    7e74:      	<unknown>
    7e78:      	<unknown>
    7e7c:      	ldpsw	x15, x27, [x19, #-0xd0]
    7e80:      	<unknown>
    7e84:      	umin	v3.8h, v26.8h, v14.8h
    7e88:      	<unknown>
    7e8c:      	sel	p5.b, p12, p11.b, p0.b
    7e90:      	<unknown>
    7e94:      	fnmls	z1.h, p2/m, z11.h, z12.h
    7e98:      	umlal2	v4.4s, v3.8h, v4.h[3]
    7e9c:      	<unknown>
    7ea0:      	<unknown>
    7ea4:      	<unknown>
    7ea8:      	fnmls	z15.h, p3/m, z3.h, z12.h
    7eac:      	<unknown>
    7eb0:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    7eb4:      	<unknown>
    7eb8:      	<unknown>
    7ebc:      	raddhn2	v20.8h, v27.4s, v15.4s
    7ec0:      	ldnp	d20, d28, [x19, #-0x110]
    7ec4:      	<unknown>
    7ec8:      	<unknown>
    7ecc:      	ldpsw	x15, x27, [x19, #-0xd0]
    7ed0:      	fcmla	v7.8h, v27.8h, v20.h[1], #180
    7ed4:      	raddhn2	v16.8h, v27.4s, v15.4s
    7ed8:      	ldnp	d20, d28, [x19, #-0x110]
    7edc:      	<unknown>
    7ee0:      	<unknown>
    7ee4:      	ldnp	d6, d24, [x10, #-0x170]
    7ee8:      	<unknown>
    7eec:      	umlal2	v15.4s, v3.8h, v4.h[3]
    7ef0:      	fnmls	z7.h, p1/m, z27.h, z12.h
    7ef4:      	rsubhn2	v0.8h, v25.4s, v15.4s
    7ef8:      	ldnp	d20, d28, [x19, #-0x110]
    7efc:      	<unknown>
    7f00:      	fnmls	z13.h, p3/m, z27.h, z4.h
    7f04:      	ands	w26, w1, #0xf800000f
    7f08:      	<unknown>
    7f0c:      	raddhn2	v2.8h, v27.4s, v15.4s
    7f10:      	b.vs	0xd6c3c
    7f14:      	ldnp	d15, d25, [x27, #-0x190]
    7f18:      	<unknown>
    7f1c:      	<unknown>
    7f20:      	usubl2	v26.4s, v1.8h, v9.8h
    7f24:      	ldpsw	x22, x24, [x11, #-0xa0]
    7f28:      	<unknown>
    7f2c:      	fnmls	z18.h, p0/m, z11.h, z13.h
    7f30:      	bic	w20, w11, w18, lsr #25
    7f34:      	<unknown>
    7f38:      	<unknown>
    7f3c:      	fcmeq	p9.h, p1/z, z27.h, z7.h
    7f40:      	<unknown>
    7f44:      	<unknown>
    7f48:      	and	p14.b, p13/z, p3.b, p0.b
    7f4c:      	<unknown>
    7f50:      	fnmls	z1.h, p2/m, z11.h, z12.h
    7f54:      	umlal2	v4.4s, v3.8h, v4.h[3]
    7f58:      	<unknown>
    7f5c:      	<unknown>
    7f60:      	umlal2	v5.4s, v3.8h, v3.h[2]
    7f64:      	<unknown>
    7f68:      	bic	w0, w9, w18, lsr #9
    7f6c:      	<unknown>
    7f70:      	<unknown>
    7f74:      	fcmeq	p9.h, p1/z, z27.h, z7.h
    7f78:      	adr	x20, 0xf29e7
    7f7c:      	<unknown>
    7f80:      	sqshlu	v5.2d, v3.2d, #0xd
    7f84:      	and	p4.b, p9/z, p11.b, p0.b
    7f88:      	<unknown>
    7f8c:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    7f90:      	<unknown>
    7f94:      	<unknown>
    7f98:      	<unknown>
    7f9c:      	<unknown>
    7fa0:      	<unknown>
    7fa4:      	<unknown>
    7fa8:      	bic	w0, w9, w18, lsr #9
    7fac:      	<unknown>
    7fb0:      	<unknown>
    7fb4:      	<unknown>
    7fb8:      	raddhn2	v20.8h, v27.4s, v15.4s
    7fbc:      	ldnp	d20, d28, [x19, #-0x110]
    7fc0:      	<unknown>
    7fc4:      	ldnp	d6, d24, [x11, #-0x170]
    7fc8:      	<unknown>
    7fcc:      	<unknown>
    7fd0:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    7fd4:      	<unknown>
    7fd8:      	<unknown>
    7fdc:      	raddhn2	v20.8h, v27.4s, v15.4s
    7fe0:      	ldnp	d20, d28, [x19, #-0x110]
    7fe4:      	<unknown>
    7fe8:      	<unknown>
    7fec:      	<unknown>
    7ff0:      	<unknown>
    7ff4:      	<unknown>
    7ff8:      	<unknown>
    7ffc:      	ldpsw	x7, x17, [x11, #-0xd0]
    8000:      	<unknown>
    8004:      	ldp	d6, d27, [x27, #-0xe0]
    8008:      	<unknown>
    800c:      	<unknown>
    8010:      	ldnp	d15, d24, [x27, #-0x110]
    8014:      	<unknown>
    8018:      	<unknown>
    801c:      	raddhn2	v2.8h, v27.4s, v15.4s
    8020:      	<unknown>
    8024:      	fnmls	z18.h, p2/m, z11.h, z22.h
    8028:      	<unknown>
    802c:      	fcmla	v18.8h, v11.8h, v16.h[2], #270
    8030:      	<unknown>
    8034:      	<unknown>
    8038:      	ldnp	d6, d24, [x10, #-0x170]
    803c:      	<unknown>
    8040:      	fmls	z15.h, p0/m, z3.h, z7.h
    8044:      	ldnp	d20, d8, [x3, #0x100]
    8048:      	uqshl	v1.2d, v3.2d, #0x26
    804c:      	<unknown>
    8050:      	<unknown>
    8054:      	<unknown>
    8058:      	ldnp	d6, d24, [x10, #-0x170]
    805c:      	<unknown>
    8060:      	usubl2	v15.4s, v3.8h, v9.8h
    8064:      	ldnp	d19, d29, [x3, #-0x1f0]
    8068:      	<unknown>
    806c:      	<unknown>
    8070:      	adr	x6, 0x48e5f
    8074:      	<unknown>
    8078:      	bic	w3, w27, w12, lsr #27
    807c:      	<unknown>
    8080:      	ldpsw	x0, x17, [x17, #-0xf8]
    8084:      	<unknown>
    8088:      	<unknown>
    808c:      	<unknown>
    8090:      	<unknown>
    8094:      	<unknown>
    8098:      	bic	w9, w27, w14, lsr #27
    809c:      	<unknown>
    80a0:      	ldpsw	x0, x17, [x17, #-0xf8]
    80a4:      	<unknown>
    80a8:      	ands	w20, w27, #0xfffffff
    80ac:      	<unknown>
    80b0:      	<unknown>
    80b4:      	<unknown>
    80b8:      	<unknown>
    80bc:      	<unknown>
    80c0:      	fnmls	z22.h, p2/m, z11.h, z3.h
    80c4:      	ldeorlh	w5, w19, [x3]
    80c8:      	<unknown>
    80cc:      	<unknown>
    80d0:      	<unknown>
    80d4:      	<unknown>
    80d8:      	<unknown>
    80dc:      	<unknown>
    80e0:      	<unknown>
    80e4:      	bc.mi	0x48d90
    80e8:      	ldnp	d15, d25, [x27, #-0x190]
    80ec:      	<unknown>
    80f0:      	fnmls	z13.h, p3/m, z26.h, z4.h
    80f4:      	uabd	v5.8h, v18.8h, v5.8h
    80f8:      	<unknown>
    80fc:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    8100:      	<unknown>
    8104:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    8108:      	<unknown>
    810c:      	<unknown>
    8110:      	ldpsw	x0, x25, [x17, #-0xf8]
    8114:      	ldnp	s12, s25, [x11, #-0xe0]
    8118:      	bic	w0, w9, w18, lsr #9
    811c:      	<unknown>
    8120:      	ldpsw	x0, x17, [x17, #-0xf8]
    8124:      	<unknown>
    8128:      	<unknown>
    812c:      	<unknown>
    8130:      	umlal2	v5.4s, v3.8h, v3.h[0]
    8134:      	<unknown>
    8138:      	subhnb	z21.b, z26.h, z2.h
    813c:      	<unknown>
    8140:      	ands	w14, w1, #0xf800000f
    8144:      	udf	#0xa
    8148:      	udf	#0x1aec
    814c:      	udf	#0x0
    8150:      	udf	#0x1b74
    8154:      	udf	#0x0
    8158:      	udf	#0x1a6c
    815c:      	udf	#0x0
    8160:      	udf	#0x1aac
    8164:      	udf	#0x0
    8168:      	udf	#0x1b74
    816c:      	udf	#0x0
    8170:      	udf	#0x1b74
    8174:      	udf	#0x0
    8178:      	udf	#0x1aec
    817c:      	udf	#0x0
    8180:      	udf	#0x1b74
    8184:      	udf	#0x0
    8188:      	udf	#0x1b74
    818c:      	udf	#0x0
    8190:      	udf	#0x1b74
    8194:      	udf	#0x0
    8198:      	udf	#0x1b74
    819c:      	udf	#0x0
    81a0:      	udf	#0x1b74
    81a4:      	udf	#0x0
    81a8:      	udf	#0x1b74
    81ac:      	udf	#0x0
    81b0:      	udf	#0x1b74
    81b4:      	udf	#0x0
    81b8:      	udf	#0x1b74
    81bc:      	udf	#0x0
    81c0:      	udf	#0x1aac
    81c4:      	udf	#0x0
    81c8:      	udf	#0x1b74
    81cc:      	udf	#0x0
    81d0:      	udf	#0x1b48
    81d4:      	udf	#0x0
    81d8:      	udf	#0x1aec
    81dc:      	udf	#0x0
    81e0:      	udf	#0x1aec
    81e4:      	udf	#0x0
    81e8:      	udf	#0x1aac
    81ec:      	udf	#0x0
    81f0:      	udf	#0x1b74
    81f4:      	udf	#0x0
    81f8:      	udf	#0x1b74
    81fc:      	udf	#0x0
    8200:      	udf	#0x1aac
    8204:      	udf	#0x0
    8208:      	<unknown>
    820c:      	<unknown>
    8210:      	<unknown>
    8214:      	<unknown>
    8218:      	str	b20, [x3, #0x848]
    821c:      	<unknown>
    8220:      	<unknown>
    8224:      	adr	x10, 0x48749
    8228:      	<unknown>
    822c:      	ldurb	w8, [x10, #-0xdc]
    8230:      	<unknown>
    8234:      	<unknown>
    8238:      	<unknown>
    823c:      	fnmls	z1.h, p4/m, z19.h, z11.h
    8240:      	str	b18, [x3, #0xf08]
    8244:      	<unknown>
    8248:      	<unknown>
    824c:      	uabdl2	v20.4s, v19.8h, v9.8h
    8250:      	<unknown>
    8254:      	<unknown>
    8258:      	fnmls	z21.h, p1/m, z19.h, z6.h
    825c:      	str	b18, [x3, #0x848]
    8260:      	<unknown>
    8264:      	<unknown>
    8268:      	adr	x10, 0x4878d
    826c:      	<unknown>
    8270:      	<unknown>
    8274:      	<unknown>
    8278:      	stnp	w14, w24, [x25]
    827c:      	<unknown>
    8280:      	<unknown>
    8284:      	ldpsw	x19, x29, [x2, #-0x70]
    8288:      	<unknown>
    828c:      	adr	x0, 0xf8891
    8290:      	adr	x16, 0x68895
    8294:      	stp	w16, w12, [x1, #-0x78]
    8298:      	<unknown>
    829c:      	stnp	w16, w0, [x1, #-0xc0]
    82a0:      	bc.pl	0xa4bc8
    82a4:      	<unknown>
    82a8:      	ldpsw	x5, x28, [x27, #-0x60]
    82ac:      	ldpsw	x14, x24, [x11, #-0x60]
    82b0:      	<unknown>
    82b4:      	adr	x0, 0xf88b9
    82b8:      	adr	x16, 0x688bd
    82bc:      	stp	w16, w12, [x1, #-0x78]
    82c0:      	<unknown>
    82c4:      	stnp	w16, w0, [x1, #-0xc0]
    82c8:      	bc.pl	0xa4bf0
    82cc:      	<unknown>
    82d0:      	<unknown>
    82d4:      	<unknown>
    82d8:      	adr	x16, 0x691dd
    82dc:      	adr	x16, 0x688e1
    82e0:      	<unknown>
    82e4:      	adr	x29, 0x48a89
    82e8:      	fmaxnmv	h0, p2, z0.h
    82ec:      	uabd	v19.8h, v3.8h, v9.8h
    82f0:      	uqshl	v1.2d, v3.2d, #0x29
    82f4:      	str	b14, [x3, #0x848]
    82f8:      	<unknown>
    82fc:      	<unknown>
    8300:      	adr	x10, 0x48825
    8304:      	stnp	w9, w10, [x9]
    8308:      	<unknown>
    830c:      	<unknown>
    8310:      	stnp	w29, w8, [x1, #-0xc0]
    8314:      	<unknown>
    8318:      	<unknown>
    831c:      	<unknown>
    8320:      	<unknown>
    8324:      	<unknown>
    8328:      	<unknown>
    832c:      	adr	x8, 0xd6f12
    8330:      	<unknown>
    8334:      	<unknown>
    8338:      	<unknown>
    833c:      	<unknown>
    8340:      	<unknown>
    8344:      	ldp	d1, d30, [x3, #-0x170]
    8348:      	<unknown>
    834c:      	<unknown>
    8350:      	<unknown>
    8354:      	<unknown>
    8358:      	<unknown>
    835c:      	<unknown>
    8360:      	<unknown>
    8364:      	<unknown>
    8368:      	<unknown>
    836c:      	stnp	w16, w10, [x9]
    8370:      	<unknown>
    8374:      	<unknown>
    8378:      	umlal2	v30.4s, v1.8h, v3.h[1]
    837c:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8380:      	ldp	w12, w25, [x10, #-0x90]
    8384:      	<unknown>
    8388:      	<unknown>
    838c:      	<unknown>
    8390:      	<unknown>
    8394:      	smin	v9.8h, v19.8h, v7.8h
    8398:      	<unknown>
    839c:      	<unknown>
    83a0:      	<unknown>
    83a4:      	<unknown>
    83a8:      	<unknown>
    83ac:      	<unknown>
    83b0:      	fmaxnmv	h12, p0, z1.h
    83b4:      	<unknown>
    83b8:      	stnp	w24, w11, [x3, #-0x100]
    83bc:      	<unknown>
    83c0:      	orn	w17, w17, w0, lsl #13
    83c4:      	<unknown>
    83c8:      	ldnp	s18, s24, [x27, #-0xd8]
    83cc:      	<unknown>
    83d0:      	<unknown>
    83d4:      	adds	w5, w19, w0, uxtx #3
    83d8:      	<unknown>
    83dc:      	uqshl	v8.8h, v1.8h, v5.8h
    83e0:      	<unknown>
    83e4:      	stnp	w28, w15, [x9, #-0x100]
    83e8:      	<unknown>
    83ec:      	ldpsw	x4, x23, [x27, #0x30]
    83f0:      	<unknown>
    83f4:      	ldpsw	x20, x16, [x19, #-0x58]
    83f8:      	adr	x12, 0xc7086
    83fc:      	<unknown>
    8400:      	<unknown>
    8404:      	ldpsw	x13, x21, [x11, #-0x90]
    8408:      	fnmls	z3.h, p3/m, z27.h, z4.h
    840c:      	ldpsw	x19, x29, [x2, #-0x70]
    8410:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    8414:      	<unknown>
    8418:      	stnp	w9, w10, [x9]
    841c:      	ldrh	w3, [x26, #0x1836]
    8420:      	<unknown>
    8424:      	adr	x1, 0x48bc9
    8428:      	<unknown>
    842c:      	<unknown>
    8430:      	<unknown>
    8434:      	<unknown>
    8438:      	<unknown>
    843c:      	<unknown>
    8440:      	<unknown>
    8444:      	<unknown>
    8448:      	<unknown>
    844c:      	adr	x8, 0xd7032
    8450:      	<unknown>
    8454:      	<unknown>
    8458:      	<unknown>
    845c:      	<unknown>
    8460:      	<unknown>
    8464:      	ldp	d1, d30, [x3, #-0x170]
    8468:      	<unknown>
    846c:      	<unknown>
    8470:      	uabdl2	v20.4s, v19.8h, v9.8h
    8474:      	uqshl	v7.8h, v3.8h, v5.8h
    8478:      	ldp	w7, w29, [x3, #-0xc0]
    847c:      	<unknown>
    8480:      	umax	v20.8h, v11.8h, v18.8h
    8484:      	<unknown>
    8488:      	<unknown>
    848c:      	<unknown>
    8490:      	<unknown>
    8494:      	<unknown>
    8498:      	<unknown>
    849c:      	<unknown>
    84a0:      	<unknown>
    84a4:      	ldpsw	x5, x28, [x27, #-0x60]
    84a8:      	ldpsw	x14, x24, [x11, #-0x60]
    84ac:      	<unknown>
    84b0:      	<unknown>
    84b4:      	ldnp	s13, s24, [x10, #-0x40]
    84b8:      	ldxrh	w0, [x1]
    84bc:      	<unknown>
    84c0:      	umlal2	v10.4s, v9.8h, v3.h[5]
    84c4:      	fnmls	z21.h, p4/m, z19.h, z3.h
    84c8:      	umlal2	v12.4s, v1.8h, v3.h[1]
    84cc:      	fnmls	z21.h, p4/m, z19.h, z3.h
    84d0:      	<unknown>
    84d4:      	stp	w11, w8, [x1, #-0x78]
    84d8:      	<unknown>
    84dc:      	<unknown>
    84e0:      	<unknown>
    84e4:      	adr	x8, 0xd70ca
    84e8:      	<unknown>
    84ec:      	<unknown>
    84f0:      	<unknown>
    84f4:      	<unknown>
    84f8:      	<unknown>
    84fc:      	ldp	d1, d30, [x3, #-0x170]
    8500:      	<unknown>
    8504:      	<unknown>
    8508:      	uabdl2	v20.4s, v19.8h, v9.8h
    850c:      	uqshl	v7.8h, v3.8h, v5.8h
    8510:      	ldp	w7, w29, [x3, #-0xc0]
    8514:      	fadd	z9.h, z1.h, z4.h
    8518:      	uabd	v19.8h, v3.8h, v9.8h
    851c:      	uqshl	v1.2d, v3.2d, #0x29
    8520:      	str	b14, [x3, #0x848]
    8524:      	<unknown>
    8528:      	<unknown>
    852c:      	adr	x10, 0x48a51
    8530:      	mla	v9.8h, v1.8h, v3.h[1]
    8534:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8538:      	<unknown>
    853c:      	<unknown>
    8540:      	<unknown>
    8544:      	<unknown>
    8548:      	<unknown>
    854c:      	<unknown>
    8550:      	<unknown>
    8554:      	ldpsw	x5, x28, [x27, #-0x60]
    8558:      	ldpsw	x14, x24, [x11, #-0x60]
    855c:      	adds	w15, w19, w0, uxtx #3
    8560:      	uqshl	v0.8h, v1.8h, v5.8h
    8564:      	<unknown>
    8568:      	stp	w11, w8, [x1, #-0x78]
    856c:      	<unknown>
    8570:      	<unknown>
    8574:      	<unknown>
    8578:      	<unknown>
    857c:      	<unknown>
    8580:      	<unknown>
    8584:      	<unknown>
    8588:      	<unknown>
    858c:      	<unknown>
    8590:      	adds	w20, w3, w0, uxtx #2
    8594:      	<unknown>
    8598:      	fmaxnmv	h28, p0, z1.h
    859c:      	uabd	v19.8h, v3.8h, v9.8h
    85a0:      	uqshl	v1.2d, v3.2d, #0x29
    85a4:      	<unknown>
    85a8:      	<unknown>
    85ac:      	<unknown>
    85b0:      	<unknown>
    85b4:      	ldpsw	x5, x28, [x27, #-0x60]
    85b8:      	ldpsw	x14, x24, [x11, #-0x60]
    85bc:      	adds	w15, w19, w0, uxtx #3
    85c0:      	uqshl	v0.8h, v1.8h, v5.8h
    85c4:      	ldp	w7, w29, [x3, #-0xc0]
    85c8:      	<unknown>
    85cc:      	<unknown>
    85d0:      	stnp	w5, w10, [x11]
    85d4:      	bc.pl	0xa4efc
    85d8:      	stnp	w14, w10, [x10, #-0x100]
    85dc:      	umlal2	v0.4s, v1.8h, v3.h[5]
    85e0:      	fnmls	z21.h, p4/m, z19.h, z3.h
    85e4:      	<unknown>
    85e8:      	fcmne	p4.h, p4/z, z19.h, z12.h
    85ec:      	umlal2	v14.4s, v3.8h, v3.h[5]
    85f0:      	fnmls	z21.h, p4/m, z19.h, z3.h
    85f4:      	<unknown>
    85f8:      	<unknown>
    85fc:      	<unknown>
    8600:      	<unknown>
    8604:      	st1	{ v0.4s, v1.4s, v2.4s, v3.4s }, [x9]
    8608:      	<unknown>
    860c:      	str	b8, [x3, #0xf08]
    8610:      	adr	x0, 0xd71f6
    8614:      	<unknown>
    8618:      	<unknown>
    861c:      	<unknown>
    8620:      	<unknown>
    8624:      	<unknown>
    8628:      	ldp	d1, d30, [x3, #-0x170]
    862c:      	<unknown>
    8630:      	<unknown>
    8634:      	<unknown>
    8638:      	<unknown>
    863c:      	<unknown>
    8640:      	<unknown>
    8644:      	<unknown>
    8648:      	<unknown>
    864c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8650:      	orn	w9, w3, w0, lsl #25
    8654:      	stp	w9, w8, [x1, #-0x80]
    8658:      	uqshl	v0.8h, v0.8h, v5.8h
    865c:      	<unknown>
    8660:      	<unknown>
    8664:      	<unknown>
    8668:      	fnmls	z6.h, p2/m, z10.h, z24.h
    866c:      	<unknown>
    8670:      	<unknown>
    8674:      	<unknown>
    8678:      	ldpsw	x13, x24, [x10, #-0x40]
    867c:      	<unknown>
    8680:      	umlsl2	v14.4s, v11.8h, v3.h[6]
    8684:      	<unknown>
    8688:      	<unknown>
    868c:      	<unknown>
    8690:      	ubfx	w20, w3, #0, #27
    8694:      	ldpsw	x20, x28, [x19, #0x98]
    8698:      	stnp	w26, w25, [x11, #-0x100]
    869c:      	<unknown>
    86a0:      	<unknown>
    86a4:      	ldp	w9, w27, [x19, #-0xc8]
    86a8:      	<unknown>
    86ac:      	<unknown>
    86b0:      	<unknown>
    86b4:      	<unknown>
    86b8:      	rsubhn2	v5.8h, v27.4s, v15.4s
    86bc:      	<unknown>
    86c0:      	ldp	w9, w27, [x19, #-0xc8]
    86c4:      	<unknown>
    86c8:      	fadd	z16.h, z1.h, z18.h
    86cc:      	<unknown>
    86d0:      	<unknown>
    86d4:      	stnp	w8, w10, [x1, #-0xc0]
    86d8:      	bc.pl	0xa5000
    86dc:      	<unknown>
    86e0:      	stp	s16, s10, [x9, #-0x100]
    86e4:      	<unknown>
    86e8:      	uabdl2	v20.4s, v19.8h, v9.8h
    86ec:      	<unknown>
    86f0:      	<unknown>
    86f4:      	<unknown>
    86f8:      	stp	w0, w12, [x9, #-0x80]
    86fc:      	<unknown>
    8700:      	<unknown>
    8704:      	<unknown>
    8708:      	tbz	w9, #0xa, 0x35d4 <.text+0x25d4>
    870c:      	orr	w20, w1, #0xffffefff
    8710:      	stnp	w0, w10, [x1, #-0xc0]
    8714:      	bc.pl	0xa503c
    8718:      	<unknown>
    871c:      	<unknown>
    8720:      	orn	w13, w1, w8, lsl #8
    8724:      	ldpsw	x19, x29, [x2, #-0x70]
    8728:      	stp	s14, s25, [x27, #-0x100]
    872c:      	adr	x0, 0x570b1
    8730:      	stnp	s7, s10, [x9, #-0x100]
    8734:      	stp	w0, w12, [x9, #-0x80]
    8738:      	<unknown>
    873c:      	<unknown>
    8740:      	stnp	w28, w15, [x9, #-0x100]
    8744:      	<unknown>
    8748:      	<unknown>
    874c:      	adr	x9, 0x104b51
    8750:      	<unknown>
    8754:      	fnmls	z9.h, p3/m, z18.h, z20.h
    8758:      	ldnp	d18, d27, [x19, #-0x1f0]
    875c:      	<unknown>
    8760:      	b.hi	0xed38c
    8764:      	urshl	v15.8h, v11.8h, v9.8h
    8768:      	stnp	w20, w27, [x19, #-0x100]
    876c:      	<unknown>
    8770:      	ldp	w9, w27, [x19, #-0xc8]
    8774:      	<unknown>
    8778:      	<unknown>
    877c:      	<unknown>
    8780:      	<unknown>
    8784:      	adds	w0, w9, #0x80b
    8788:      	str	b9, [x1, #0xf48]
    878c:      	adr	x0, 0x57111
    8790:      	fadd	z7.h, z1.h, z18.h
    8794:      	<unknown>
    8798:      	<unknown>
    879c:      	ldpsw	x18, x20, [x26, #-0xc0]
    87a0:      	tbz	w6, #0xa, 0x362c <.text+0x262c>
    87a4:      	stnp	w20, w8, [x1, #-0xc0]
    87a8:      	<unknown>
    87ac:      	stp	w20, w13, [x18, #-0x60]
    87b0:      	stp	w0, wzr, [x17, #-0x80]
    87b4:      	<unknown>
    87b8:      	<unknown>
    87bc:      	<unknown>
    87c0:      	<unknown>
    87c4:      	fcmla	v1.8h, v19.8h, v20.h[0], #270
    87c8:      	<unknown>
    87cc:      	orn	w14, w3, w8, lsl #8
    87d0:      	ldpsw	x19, x29, [x2, #-0x70]
    87d4:      	<unknown>
    87d8:      	stp	w12, w8, [x1, #-0x60]
    87dc:      	<unknown>
    87e0:      	ldp	w14, w21, [x2, #0x70]
    87e4:      	<unknown>
    87e8:      	ldurb	w8, [x10, #-0xdc]
    87ec:      	<unknown>
    87f0:      	<unknown>
    87f4:      	str	b5, [x3, #0x848]
    87f8:      	ldxrh	w0, [x1]
    87fc:      	orn	w1, w18, w24, lsl #20
    8800:      	fmaxnmv	h9, p0, z1.h
    8804:      	uabd	v19.8h, v3.8h, v9.8h
    8808:      	uqshl	v1.2d, v3.2d, #0x29
    880c:      	stnp	w14, w10, [x11]
    8810:      	bc.pl	0xa5138
    8814:      	stnp	w14, w10, [x10, #-0x100]
    8818:      	fmaxnmv	h0, p2, z1.h
    881c:      	uabd	v19.8h, v3.8h, v9.8h
    8820:      	uqshl	v1.2d, v3.2d, #0x29
    8824:      	<unknown>
    8828:      	<unknown>
    882c:      	adds	w20, w3, w0, uxtx #2
    8830:      	<unknown>
    8834:      	<unknown>
    8838:      	<unknown>
    883c:      	stp	w18, w14, [x2, #-0xb0]
    8840:      	<unknown>
    8844:      	stp	w3, w25, [x11, #-0x100]
    8848:      	stnp	w0, w10, [x9]
    884c:      	bc.pl	0xa5174
    8850:      	stnp	w14, w10, [x10, #-0x100]
    8854:      	ldxrh	w0, [x1]
    8858:      	orn	w1, w18, w24, lsl #20
    885c:      	<unknown>
    8860:      	<unknown>
    8864:      	<unknown>
    8868:      	<unknown>
    886c:      	adds	w20, w3, w0, uxtx #2
    8870:      	<unknown>
    8874:      	fmaxnmv	h28, p0, z1.h
    8878:      	uabd	v19.8h, v3.8h, v9.8h
    887c:      	uqshl	v1.2d, v3.2d, #0x29
    8880:      	<unknown>
    8884:      	<unknown>
    8888:      	<unknown>
    888c:      	ldeorh	w16, w28, [x1]
    8890:      	<unknown>
    8894:      	ldpsw	x1, x28, [x26, #-0xe8]
    8898:      	<unknown>
    889c:      	fnmls	z19.h, p2/m, z10.h, z26.h
    88a0:      	fcmeq	p0.h, p2/z, z1.h, #0.0
    88a4:      	uabd	v20.8h, v11.8h, v18.8h
    88a8:      	<unknown>
    88ac:      	<unknown>
    88b0:      	<unknown>
    88b4:      	<unknown>
    88b8:      	<unknown>
    88bc:      	<unknown>
    88c0:      	ldpsw	x5, x28, [x27, #-0x60]
    88c4:      	ldpsw	x14, x24, [x11, #-0x60]
    88c8:      	adds	w15, w19, w0, uxtx #3
    88cc:      	uqshl	v0.8h, v1.8h, v5.8h
    88d0:      	ldp	w7, w29, [x3, #-0xc0]
    88d4:      	<unknown>
    88d8:      	<unknown>
    88dc:      	<unknown>
    88e0:      	<unknown>
    88e4:      	<unknown>
    88e8:      	<unknown>
    88ec:      	<unknown>
    88f0:      	<unknown>
    88f4:      	<unknown>
    88f8:      	<unknown>
    88fc:      	fmaxnmv	h28, p0, z1.h
    8900:      	uabd	v19.8h, v3.8h, v9.8h
    8904:      	uqshl	v1.2d, v3.2d, #0x29
    8908:      	<unknown>
    890c:      	<unknown>
    8910:      	str	b20, [x3, x0]
    8914:      	<unknown>
    8918:      	<unknown>
    891c:      	fnmls	z6.h, p2/m, z10.h, z24.h
    8920:      	<unknown>
    8924:      	<unknown>
    8928:      	<unknown>
    892c:      	ldpsw	x13, x24, [x10, #-0x40]
    8930:      	<unknown>
    8934:      	ldpsw	x19, x24, [x27, #-0xb8]
    8938:      	ldpsw	x19, x29, [x2, #-0x70]
    893c:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    8940:      	<unknown>
    8944:      	uqshl	v0.8h, v0.8h, v5.8h
    8948:      	<unknown>
    894c:      	<unknown>
    8950:      	<unknown>
    8954:      	fnmls	z6.h, p2/m, z10.h, z24.h
    8958:      	<unknown>
    895c:      	<unknown>
    8960:      	<unknown>
    8964:      	ldpsw	x13, x24, [x10, #-0x40]
    8968:      	<unknown>
    896c:      	ldpsw	x19, x24, [x27, #-0xb8]
    8970:      	ldpsw	x19, x29, [x2, #-0x70]
    8974:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    8978:      	<unknown>
    897c:      	<unknown>
    8980:      	<unknown>
    8984:      	<unknown>
    8988:      	<unknown>
    898c:      	<unknown>
    8990:      	ldpsw	x19, x29, [x2, #-0x70]
    8994:      	<unknown>
    8998:      	ldpsw	x1, x28, [x26, #-0xe8]
    899c:      	<unknown>
    89a0:      	fnmls	z19.h, p2/m, z10.h, z26.h
    89a4:      	fcmne	p0.h, p2/z, z1.h, #0.0
    89a8:      	<unknown>
    89ac:      	ldpsw	x19, x29, [x2, #-0x70]
    89b0:      	<unknown>
    89b4:      	ldpsw	x1, x28, [x26, #-0xe8]
    89b8:      	<unknown>
    89bc:      	fnmls	z19.h, p2/m, z10.h, z26.h
    89c0:      	fmaxnmv	h0, p2, z1.h
    89c4:      	uabd	v19.8h, v3.8h, v9.8h
    89c8:      	uqshl	v1.2d, v3.2d, #0x29
    89cc:      	<unknown>
    89d0:      	<unknown>
    89d4:      	ldpsw	x1, x28, [x26, #-0xe8]
    89d8:      	<unknown>
    89dc:      	fnmls	z19.h, p2/m, z10.h, z26.h
    89e0:      	<unknown>
    89e4:      	<unknown>
    89e8:      	str	b9, [x1, #0x848]
    89ec:      	<unknown>
    89f0:      	ldpsw	x19, x24, [x27, #-0xb8]
    89f4:      	<unknown>
    89f8:      	<unknown>
    89fc:      	<unknown>
    8a00:      	<unknown>
    8a04:      	uabdl2	v20.4s, v19.8h, v9.8h
    8a08:      	<unknown>
    8a0c:      	<unknown>
    8a10:      	<unknown>
    8a14:      	<unknown>
    8a18:      	adds	w0, w9, #0x80b
    8a1c:      	str	b9, [x1, #0xf48]
    8a20:      	<unknown>
    8a24:      	<unknown>
    8a28:      	<unknown>
    8a2c:      	<unknown>
    8a30:      	<unknown>
    8a34:      	<unknown>
    8a38:      	<unknown>
    8a3c:      	<unknown>
    8a40:      	<unknown>
    8a44:      	<unknown>
    8a48:      	ldxrh	w8, [x1]
    8a4c:      	<unknown>
    8a50:      	<unknown>
    8a54:      	ldpsw	x5, x28, [x27, #-0x60]
    8a58:      	ldpsw	x14, x24, [x11, #-0x60]
    8a5c:      	stp	s15, s27, [x19, #-0x100]
    8a60:      	<unknown>
    8a64:      	ldp	w18, w24, [x27, #-0xd8]
    8a68:      	<unknown>
    8a6c:      	ldpsw	x19, x24, [x27, #-0xb8]
    8a70:      	<unknown>
    8a74:      	stnp	w5, w27, [x19, #-0x100]
    8a78:      	<unknown>
    8a7c:      	<unknown>
    8a80:      	<unknown>
    8a84:      	<unknown>
    8a88:      	<unknown>
    8a8c:      	<unknown>
    8a90:      	<unknown>
    8a94:      	ldurb	w8, [x10, #-0xdc]
    8a98:      	<unknown>
    8a9c:      	<unknown>
    8aa0:      	<unknown>
    8aa4:      	ldp	w9, w27, [x27, #-0x90]
    8aa8:      	<unknown>
    8aac:      	<unknown>
    8ab0:      	<unknown>
    8ab4:      	<unknown>
    8ab8:      	<unknown>
    8abc:      	<unknown>
    8ac0:      	orn	w5, w11, w0, lsl #10
    8ac4:      	<unknown>
    8ac8:      	<unknown>
    8acc:      	<unknown>
    8ad0:      	stp	w18, w12, [x10, #-0x50]
    8ad4:      	<unknown>
    8ad8:      	<unknown>
    8adc:      	adr	x28, 0x6aee1
    8ae0:      	<unknown>
    8ae4:      	<unknown>
    8ae8:      	ldeorh	w16, w28, [x1]
    8aec:      	stnp	w1, w12, [x3]
    8af0:      	<unknown>
    8af4:      	<unknown>
    8af8:      	ldp	w16, w30, [x1, #-0xd0]
    8afc:      	adr	x0, 0x49281
    8b00:      	<unknown>
    8b04:      	tbz	w9, #0xa, 0x39d0 <.text+0x29d0>
    8b08:      	orr	w20, w1, #0xffffefff
    8b0c:      	<unknown>
    8b10:      	<unknown>
    8b14:      	<unknown>
    8b18:      	<unknown>
    8b1c:      	ldpsw	x21, x25, [x10, #-0xd0]
    8b20:      	<unknown>
    8b24:      	<unknown>
    8b28:      	ldpsw	x5, x28, [x19, #-0x50]
    8b2c:      	b.lo	0xef7d8
    8b30:      	fnmls	z1.h, p0/m, z19.h, z12.h
    8b34:      	<unknown>
    8b38:      	<unknown>
    8b3c:      	str	b20, [x2, #0x848]
    8b40:      	<unknown>
    8b44:      	<unknown>
    8b48:      	adr	x10, 0x4906d
    8b4c:      	fadd	z9.h, z1.h, z21.h
    8b50:      	umlsl2	v6.4s, v11.8h, v2.h[4]
    8b54:      	fcmeq	p15.h, p5/z, z3.h, z19.h
    8b58:      	<unknown>
    8b5c:      	<unknown>
    8b60:      	<unknown>
    8b64:      	<unknown>
    8b68:      	ldp	d0, d25, [x24, #0x90]
    8b6c:      	<unknown>
    8b70:      	ldnp	d1, d27, [x19, #-0x1c0]
    8b74:      	str	b5, [x3, #0x848]
    8b78:      	<unknown>
    8b7c:      	<unknown>
    8b80:      	adr	x10, 0x490a5
    8b84:      	<unknown>
    8b88:      	str	b20, [x2, #0x848]
    8b8c:      	<unknown>
    8b90:      	<unknown>
    8b94:      	adr	x10, 0x490b9
    8b98:      	<unknown>
    8b9c:      	str	b19, [x2, #0x848]
    8ba0:      	<unknown>
    8ba4:      	<unknown>
    8ba8:      	adr	x10, 0x490cd
    8bac:      	fadd	z9.h, z1.h, z21.h
    8bb0:      	ldpsw	x6, x26, [x11, #0x60]
    8bb4:      	<unknown>
    8bb8:      	ldnp	d20, d24, [x10, #-0x1e0]
    8bbc:      	ldpsw	x5, x17, [x27, #-0x58]
    8bc0:      	str	b4, [x3, #0x848]
    8bc4:      	<unknown>
    8bc8:      	<unknown>
    8bcc:      	adr	x10, 0x490f1
    8bd0:      	<unknown>
    8bd4:      	<unknown>
    8bd8:      	stnp	w1, w15, [x9, #-0x100]
    8bdc:      	ldpsw	x8, x29, [x17, #-0x88]
    8be0:      	stp	w4, w8, [x3, #-0xb0]
    8be4:      	<unknown>
    8be8:      	<unknown>
    8bec:      	ldnp	d15, d24, [x27, #-0x110]
    8bf0:      	<unknown>
    8bf4:      	<unknown>
    8bf8:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8bfc:      	orn	w9, w3, w0, lsl #25
    8c00:      	stp	w9, w8, [x1, #-0x80]
    8c04:      	<unknown>
    8c08:      	<unknown>
    8c0c:      	<unknown>
    8c10:      	<unknown>
    8c14:      	stnp	w1, w15, [x9, #-0x100]
    8c18:      	ldpsw	x8, x29, [x17, #-0x88]
    8c1c:      	stp	w4, w8, [x3, #-0xb0]
    8c20:      	<unknown>
    8c24:      	ldpsw	x18, x25, [x10, #-0xc8]
    8c28:      	<unknown>
    8c2c:      	<unknown>
    8c30:      	<unknown>
    8c34:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8c38:      	orn	w9, w3, w0, lsl #25
    8c3c:      	stp	w9, w8, [x1, #-0x80]
    8c40:      	ldp	d0, d19, [x16, #-0x1f0]
    8c44:      	str	b5, [x3, #0x848]
    8c48:      	<unknown>
    8c4c:      	<unknown>
    8c50:      	adr	x10, 0x49175
    8c54:      	mla	v9.8h, v1.8h, v14.h[0]
    8c58:      	ldrh	w20, [x11, #0x1334]
    8c5c:      	<unknown>
    8c60:      	<unknown>
    8c64:      	mla	v17.8h, v1.8h, v12.h[0]
    8c68:      	<unknown>
    8c6c:      	stnp	w29, w8, [x1, #-0xc0]
    8c70:      	<unknown>
    8c74:      	<unknown>
    8c78:      	adr	x16, 0x919e <.text+0x819e>
    8c7c:      	<unknown>
    8c80:      	<unknown>
    8c84:      	<unknown>
    8c88:      	mla	v17.8h, v1.8h, v12.h[0]
    8c8c:      	<unknown>
    8c90:      	<unknown>
    8c94:      	<unknown>
    8c98:      	<unknown>
    8c9c:      	<unknown>
    8ca0:      	<unknown>
    8ca4:      	<unknown>
    8ca8:      	<unknown>
    8cac:      	<unknown>
    8cb0:      	<unknown>
    8cb4:      	<unknown>
    8cb8:      	<unknown>
    8cbc:      	ldpsw	x11, x21, [x11, #-0x90]
    8cc0:      	ldpsw	x14, x26, [x11, #-0x60]
    8cc4:      	<unknown>
    8cc8:      	st1	{ v5.8h, v6.8h, v7.8h }, [x3]
    8ccc:      	ldp	s15, s24, [x27, #-0xa8]
    8cd0:      	<unknown>
    8cd4:      	str	b11, [x3, #0xf48]
    8cd8:      	ldpsw	x0, x17, [x9, #-0xd0]
    8cdc:      	<unknown>
    8ce0:      	<unknown>
    8ce4:      	<unknown>
    8ce8:      	ldp	d0, d19, [x16, #-0x1f0]
    8cec:      	str	b5, [x3, #0x848]
    8cf0:      	<unknown>
    8cf4:      	<unknown>
    8cf8:      	adr	x10, 0x4921d
    8cfc:      	<unknown>
    8d00:      	ldpsw	x0, x17, [x25, #-0x58]
    8d04:      	str	b4, [x3, #0x848]
    8d08:      	<unknown>
    8d0c:      	<unknown>
    8d10:      	adr	x10, 0x49235
    8d14:      	<unknown>
    8d18:      	ldnp	d0, d21, [x17, #-0x1f0]
    8d1c:      	<unknown>
    8d20:      	stnp	w29, w8, [x1, #-0xc0]
    8d24:      	<unknown>
    8d28:      	<unknown>
    8d2c:      	orr	w16, w9, w0, lsl #10
    8d30:      	<unknown>
    8d34:      	str	b5, [x3, #0x848]
    8d38:      	<unknown>
    8d3c:      	<unknown>
    8d40:      	adr	x10, 0x49265
    8d44:      	<unknown>
    8d48:      	<unknown>
    8d4c:      	<unknown>
    8d50:      	<unknown>
    8d54:      	<unknown>
    8d58:      	<unknown>
    8d5c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8d60:      	orn	w9, w3, w0, lsl #25
    8d64:      	stp	w9, w8, [x1, #-0x80]
    8d68:      	<unknown>
    8d6c:      	<unknown>
    8d70:      	<unknown>
    8d74:      	ldpsw	x15, x24, [x19, #0x60]
    8d78:      	<unknown>
    8d7c:      	stnp	w29, w8, [x1, #-0xc0]
    8d80:      	<unknown>
    8d84:      	<unknown>
    8d88:      	stxrh	w0, w16, [x9]
    8d8c:      	<unknown>
    8d90:      	<unknown>
    8d94:      	stnp	w1, w15, [x9, #-0x100]
    8d98:      	ldpsw	x8, x29, [x17, #-0x88]
    8d9c:      	stp	w4, w8, [x3, #-0xb0]
    8da0:      	<unknown>
    8da4:      	smlal2	v8.4s, v1.8h, v2.h[4]
    8da8:      	<unknown>
    8dac:      	adr	x14, 0x592d5
    8db0:      	stp	w29, w15, [x9, #-0x78]
    8db4:      	<unknown>
    8db8:      	<unknown>
    8dbc:      	<unknown>
    8dc0:      	<unknown>
    8dc4:      	udf	#0x67
    8dc8:      	<unknown>
    8dcc:      	bc.hs	0xd9a38
    8dd0:      	<unknown>
    8dd4:      	<unknown>
    8dd8:      	<unknown>
    8ddc:      	<unknown>
    8de0:      	<unknown>
    8de4:      	<unknown>
    8de8:      	ldnp	d2, d29, [x10, #-0x170]
    8dec:      	<unknown>
    8df0:      	ldp	d4, d16, [x11, #-0xe0]
    8df4:      	<unknown>
    8df8:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8dfc:      	fnmla	z18.h, p1/m, z19.h, z18.h
    8e00:      	<unknown>
    8e04:      	adr	x26, 0x6b3f1
    8e08:      	adr	x16, 0x6940d
    8e0c:      	<unknown>
    8e10:      	<unknown>
    8e14:      	<unknown>
    8e18:      	ldpsw	x9, x24, [x27, #0xa0]
    8e1c:      	<unknown>
    8e20:      	ldpsw	x5, x29, [x3, #0xa0]
    8e24:      	<unknown>
    8e28:      	<unknown>
    8e2c:      	<unknown>
    8e30:      	<unknown>
    8e34:      	<unknown>
    8e38:      	<unknown>
    8e3c:      	<unknown>
    8e40:      	<unknown>
    8e44:      	ldpsw	x12, x8, [x3, #0xa0]
    8e48:      	<unknown>
    8e4c:      	uabdl2	v9.8h, v27.16b, v0.16b
    8e50:      	<unknown>
    8e54:      	ldnp	d22, d24, [x11, #-0x170]
    8e58:      	fnmls	z1.h, p0/m, z19.h, z12.h
    8e5c:      	<unknown>
    8e60:      	<unknown>
    8e64:      	ldnp	s3, s20, [x2, #0xa8]
    8e68:      	<unknown>
    8e6c:      	<unknown>
    8e70:      	<unknown>
    8e74:      	<unknown>
    8e78:      	<unknown>
    8e7c:      	rsubhn2	v3.8h, v11.4s, v14.4s
    8e80:      	<unknown>
    8e84:      	<unknown>
    8e88:      	bic	w5, w3, w14, lsl #25
    8e8c:      	<unknown>
    8e90:      	ldpsw	x0, x17, [x17, #-0xf8]
    8e94:      	<unknown>
    8e98:      	<unknown>
    8e9c:      	<unknown>
    8ea0:      	<unknown>
    8ea4:      	<unknown>
    8ea8:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    8eac:      	<unknown>
    8eb0:      	<unknown>
    8eb4:      	<unknown>
    8eb8:      	<unknown>
    8ebc:      	whilewr	p8.h, x1, x24
    8ec0:      	<unknown>
    8ec4:      	<unknown>
    8ec8:      	<unknown>
    8ecc:      	fcmla	v5.8h, v19.8h, v16.h[0], #270
    8ed0:      	ldrh	w18, [x3, #0xa3a]
    8ed4:      	bic	p0.b, p9/z, p11.b, p0.b
    8ed8:      	<unknown>
    8edc:      	fnmls	z1.h, p2/m, z11.h, z12.h
    8ee0:      	umlal2	v4.4s, v3.8h, v4.h[3]
    8ee4:      	ldnp	d0, d24, [x25, #-0x1f0]
    8ee8:      	<unknown>
    8eec:      	<unknown>
    8ef0:      	<unknown>
    8ef4:      	fcmla	v5.8h, v19.8h, v16.h[0], #270
    8ef8:      	<unknown>
    8efc:      	<unknown>
    8f00:      	<unknown>
    8f04:      	<unknown>
    8f08:      	bic	w5, w1, w9, lsl #30
    8f0c:      	<unknown>
    8f10:      	<unknown>
    8f14:      	fnmls	z3.h, p3/m, z26.h, z18.h
    8f18:      	<unknown>
    8f1c:      	<unknown>
    8f20:      	stp	s15, s28, [x19, #-0x100]
    8f24:      	<unknown>
    8f28:      	ldp	d5, d19, [x19, #-0xb0]
    8f2c:      	<unknown>
    8f30:      	<unknown>
    8f34:      	fadd	z10.h, z0.h, z7.h
    8f38:      	<unknown>
    8f3c:      	ldp	d5, d19, [x19, #-0xb0]
    8f40:      	<unknown>
    8f44:      	<unknown>
    8f48:      	fnmls	z3.h, p3/m, z26.h, z18.h
    8f4c:      	<unknown>
    8f50:      	<unknown>
    8f54:      	stp	s15, s28, [x19, #-0x100]
    8f58:      	<unknown>
    8f5c:      	fcmla	v21.8h, v3.8h, v16.h[1], #270
    8f60:      	<unknown>
    8f64:      	<unknown>
    8f68:      	<unknown>
    8f6c:      	ldrh	w5, [x3, #0x1a10]
    8f70:      	adr	x16, 0x49c1d
    8f74:      	bic	w24, w11, w24, lsr #9
    8f78:      	<unknown>
    8f7c:      	<unknown>
    8f80:      	fnmls	z3.h, p3/m, z26.h, z18.h
    8f84:      	fnmls	z2.h, p0/m, z10.h, z19.h
    8f88:      	<unknown>
    8f8c:      	<unknown>
    8f90:      	<unknown>
    8f94:      	<unknown>
    8f98:      	fcmla	z19.h, p1/m, z11.h, z1.h, #270
    8f9c:      	stgp	x4, x28, [x19, #-0x400]
    8fa0:      	<unknown>
    8fa4:      	<unknown>
    8fa8:      	<unknown>
    8fac:      	<unknown>
    8fb0:      	<unknown>
    8fb4:      	<unknown>
    8fb8:      	<unknown>
    8fbc:      	<unknown>
    8fc0:      	<unknown>
    8fc4:      	<unknown>
    8fc8:      	<unknown>
    8fcc:      	<unknown>
    8fd0:      	stp	s15, s28, [x19, #-0x100]
    8fd4:      	<unknown>
    8fd8:      	fcmla	v21.8h, v3.8h, v16.h[1], #270
    8fdc:      	<unknown>
    8fe0:      	<unknown>
    8fe4:      	<unknown>
    8fe8:      	ldrh	w5, [x3, #0x1a10]
    8fec:      	adr	x16, 0x49c99
    8ff0:      	bic	w24, w11, w24, lsr #9
    8ff4:      	<unknown>
    8ff8:      	ldpsw	x0, x25, [x17, #-0xf8]
    8ffc:      	<unknown>
    9000:      	<unknown>
    9004:      	<unknown>
    9008:      	<unknown>
    900c:      	<unknown>
    9010:      	<unknown>
    9014:      	<unknown>
    9018:      	<unknown>
    901c:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9020:      	<unknown>
    9024:      	<unknown>
    9028:      	ands	w15, w19, #0x3ffffff
    902c:      	fnmls	z1.h, p3/m, z19.h, z7.h
    9030:      	<unknown>
    9034:      	<unknown>
    9038:      	<unknown>
    903c:      	<unknown>
    9040:      	fminv	h13, p7, z17.h
    9044:      	<unknown>
    9048:      	bfdot	z5.s, z11.h, z4.h[0]
    904c:      	<unknown>
    9050:      	ldpsw	x0, x25, [x17, #-0xf8]
    9054:      	<unknown>
    9058:      	<unknown>
    905c:      	<unknown>
    9060:      	<unknown>
    9064:      	<unknown>
    9068:      	<unknown>
    906c:      	<unknown>
    9070:      	<unknown>
    9074:      	<unknown>
    9078:      	<unknown>
    907c:      	<unknown>
    9080:      	ldnp	d14, d29, [x19, #-0x1f0]
    9084:      	<unknown>
    9088:      	sabdl2	v15.4s, v19.8h, v5.8h
    908c:      	adr	x21, 0x49e3b
    9090:      	fnmls	z1.h, p4/m, z27.h, z19.h
    9094:      	<unknown>
    9098:      	<unknown>
    909c:      	ldpsw	x15, x27, [x19, #-0xd0]
    90a0:      	<unknown>
    90a4:      	<unknown>
    90a8:      	<unknown>
    90ac:      	<unknown>
    90b0:      	stnp	w20, w14, [x18, #-0x100]
    90b4:      	<unknown>
    90b8:      	<unknown>
    90bc:      	<unknown>
    90c0:      	<unknown>
    90c4:      	bic	w6, w27, w9, lsl #24
    90c8:      	<unknown>
    90cc:      	<unknown>
    90d0:      	<unknown>
    90d4:      	<unknown>
    90d8:      	<unknown>
    90dc:      	cbnz	w17, 0x797a0
    90e0:      	ldr	x25, 0xa7cc4
    90e4:      	<unknown>
    90e8:      	<unknown>
    90ec:      	<unknown>
    90f0:      	ssubwt	z31.h, z10.h, z19.b
    90f4:      	<unknown>
    90f8:      	<unknown>
    90fc:      	ldurb	w13, [x26, #0xd5]
    9100:      	<unknown>
    9104:      	lduminlb	w13, w13, [x27]
    9108:      	<unknown>
    910c:      	<unknown>
    9110:      	<unknown>
    9114:      	<unknown>
    9118:      	ldp	d17, d24, [x26, #-0x110]
    911c:      	umlsl	v16.4s, v26.4h, v7.h[6]
    9120:      	lduminlb	w13, w13, [x26]
    9124:      	adr	x25, 0x7984a
    9128:      	<unknown>
    912c:      	<unknown>
    9130:      	<unknown>
    9134:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    9138:      	<unknown>
    913c:      	umlsl	v12.4s, v10.4h, v2.h[6]
    9140:      	<unknown>
    9144:      	ldpsw	x15, x27, [x19, #-0xd0]
    9148:      	<unknown>
    914c:      	eor	p14.b, p8/z, p9.b, p0.b
    9150:      	<unknown>
    9154:      	<unknown>
    9158:      	ccmn	w18, w20, #0x5, pl
    915c:      	<unknown>
    9160:      	<unknown>
    9164:      	<unknown>
    9168:      	<unknown>
    916c:      	<unknown>
    9170:      	fdiv	v13.8h, v17.8h, v9.8h
    9174:      	uqshl	v9.2d, v3.2d, #0x3
    9178:      	umin	v13.8h, v11.8h, v15.8h
    917c:      	cmpge	p9.b, p2/z, z17.b, #0x0
    9180:      	<unknown>
    9184:      	ldpsw	x15, x27, [x19, #-0xd0]
    9188:      	<unknown>
    918c:      	<unknown>
    9190:      	<unknown>
    9194:      	<unknown>
    9198:      	<unknown>
    919c:      	<unknown>
    91a0:      	<unknown>
    91a4:      	<unknown>
    91a8:      	ldp	d3, d27, [x27, #-0x130]
    91ac:      	stgp	x15, x27, [x19, #-0x400]
    91b0:      	ldpsw	x14, x26, [x11, #-0x60]
    91b4:      	<unknown>
    91b8:      	uqshl	v1.2d, v3.2d, #0x29
    91bc:      	umlal2	v14.4s, v3.8h, v6.h[2]
    91c0:      	<unknown>
    91c4:      	umlal2	v2.4s, v2.8h, v3.h[2]
    91c8:      	whilelt	pn10.b, x11, x0, vlx4
    91cc:      	<unknown>
    91d0:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    91d4:      	<unknown>
    91d8:      	<unknown>
    91dc:      	ccmn	w18, w20, #0x5, pl
    91e0:      	<unknown>
    91e4:      	<unknown>
    91e8:      	<unknown>
    91ec:      	<unknown>
    91f0:      	<unknown>
    91f4:      	fdiv	v13.8h, v17.8h, v9.8h
    91f8:      	fcmeq	p9.h, p5/z, z3.h, z4.h
    91fc:      	fnmls	z22.h, p2/m, z11.h, z3.h
    9200:      	cmpge	p9.b, p2/z, z17.b, #0x0
    9204:      	<unknown>
    9208:      	ldpsw	x15, x27, [x19, #-0xd0]
    920c:      	<unknown>
    9210:      	<unknown>
    9214:      	<unknown>
    9218:      	<unknown>
    921c:      	<unknown>
    9220:      	<unknown>
    9224:      	<unknown>
    9228:      	<unknown>
    922c:      	ldpsw	x4, x25, [x11, #-0x50]
    9230:      	stgp	x3, x25, [x11, #-0x400]
    9234:      	ldpsw	x14, x26, [x11, #-0x60]
    9238:      	<unknown>
    923c:      	ldpsw	x1, x26, [x11, #-0x60]
    9240:      	<unknown>
    9244:      	<unknown>
    9248:      	<unknown>
    924c:      	<unknown>
    9250:      	<unknown>
    9254:      	<unknown>
    9258:      	psel	p5, p8, p9.h[w14, 1]
    925c:      	<unknown>
    9260:      	bc.lo	0xadb08
    9264:      	ssubl2	v26.8h, v1.16b, v8.16b
    9268:      	<unknown>
    926c:      	<unknown>
    9270:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    9274:      	<unknown>
    9278:      	<unknown>
    927c:      	<unknown>
    9280:      	ldp	w15, w28, [x27, #-0x60]
    9284:      	<unknown>
    9288:      	umlal2	v26.4s, v1.8h, v3.h[0]
    928c:      	<unknown>
    9290:      	<unknown>
    9294:      	<unknown>
    9298:      	stp	s15, s28, [x19, #-0x100]
    929c:      	ldpsw	x0, x25, [x17, #-0xf8]
    92a0:      	<unknown>
    92a4:      	adr	x20, 0x4a093
    92a8:      	fcmla	v5.8h, v19.8h, v6.h[1], #270
    92ac:      	<unknown>
    92b0:      	<unknown>
    92b4:      	<unknown>
    92b8:      	ldpsw	x9, x24, [x11, #-0xa0]
    92bc:      	<unknown>
    92c0:      	<unknown>
    92c4:      	<unknown>
    92c8:      	<unknown>
    92cc:      	fnmls	z3.h, p3/m, z27.h, z18.h
    92d0:      	<unknown>
    92d4:      	bic	w0, w9, w18, lsr #9
    92d8:      	<unknown>
    92dc:      	<unknown>
    92e0:      	<unknown>
    92e4:      	<unknown>
    92e8:      	<unknown>
    92ec:      	<unknown>
    92f0:      	adr	x14, 0xf415f
    92f4:      	<unknown>
    92f8:      	<unknown>
    92fc:      	<unknown>
    9300:      	<unknown>
    9304:      	strh	w16, [x1, x5, lsl #1]
    9308:      	fadd	z10.h, z0.h, z18.h
    930c:      	<unknown>
    9310:      	sel	p3.b, p8, p3.b, p0.b
    9314:      	eor	w1, w19, #0x7fff
    9318:      	<unknown>
    931c:      	<unknown>
    9320:      	<unknown>
    9324:      	stp	s15, s28, [x19, #-0x100]
    9328:      	ldpsw	x0, x25, [x17, #-0xf8]
    932c:      	<unknown>
    9330:      	<unknown>
    9334:      	<unknown>
    9338:      	<unknown>
    933c:      	<unknown>
    9340:      	<unknown>
    9344:      	<unknown>
    9348:      	psel	p5, p8, p9.h[w14, 1]
    934c:      	<unknown>
    9350:      	bc.lo	0xadbf8
    9354:      	ssubl2	v26.8h, v1.16b, v8.16b
    9358:      	<unknown>
    935c:      	<unknown>
    9360:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    9364:      	<unknown>
    9368:      	eor	w3, w11, #0x3ffc
    936c:      	<unknown>
    9370:      	cmpge	p9.b, p2/z, z17.b, #0x0
    9374:      	eor	w1, w19, #0x7fff
    9378:      	<unknown>
    937c:      	<unknown>
    9380:      	<unknown>
    9384:      	stp	s15, s28, [x19, #-0x100]
    9388:      	ldpsw	x0, x25, [x17, #-0xf8]
    938c:      	<unknown>
    9390:      	ands	w20, w27, #0xfffffff
    9394:      	<unknown>
    9398:      	<unknown>
    939c:      	<unknown>
    93a0:      	fmul	z5.h, z3.h, z5.h[0]
    93a4:      	ands	w26, w1, #0xf800000f
    93a8:      	<unknown>
    93ac:      	<unknown>
    93b0:      	<unknown>
    93b4:      	<unknown>
    93b8:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    93bc:      	<unknown>
    93c0:      	<unknown>
    93c4:      	<unknown>
    93c8:      	fnmls	z3.h, p3/m, z27.h, z18.h
    93cc:      	<unknown>
    93d0:      	<unknown>
    93d4:      	bic	w0, w9, w4, lsr #9
    93d8:      	<unknown>
    93dc:      	adr	x5, 0xa222a
    93e0:      	<unknown>
    93e4:      	<unknown>
    93e8:      	<unknown>
    93ec:      	<unknown>
    93f0:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    93f4:      	<unknown>
    93f8:      	ldnp	d6, d24, [x11, #-0x170]
    93fc:      	<unknown>
    9400:      	usubl2	v15.4s, v3.8h, v5.8h
    9404:      	<unknown>
    9408:      	<unknown>
    940c:      	fnmls	z16.h, p3/m, z27.h, z23.h
    9410:      	umlal2	v18.4s, v3.8h, v13.h[2]
    9414:      	<unknown>
    9418:      	<unknown>
    941c:      	<unknown>
    9420:      	sabdl2	v15.4s, v19.8h, v5.8h
    9424:      	whilelo	pn13.b, x11, x0, vlx4
    9428:      	<unknown>
    942c:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    9430:      	<unknown>
    9434:      	<unknown>
    9438:      	<unknown>
    943c:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    9440:      	<unknown>
    9444:      	<unknown>
    9448:      	<unknown>
    944c:      	fnmls	z3.h, p3/m, z27.h, z18.h
    9450:      	<unknown>
    9454:      	<unknown>
    9458:      	bic	w0, w9, w4, lsr #9
    945c:      	ldpsw	x0, x17, [x8, #-0x40]
    9460:      	<unknown>
    9464:      	<unknown>
    9468:      	ldpsw	x0, x17, [x9, #-0x40]
    946c:      	<unknown>
    9470:      	<unknown>
    9474:      	<unknown>
    9478:      	<unknown>
    947c:      	<unknown>
    9480:      	<unknown>
    9484:      	<unknown>
    9488:      	<unknown>
    948c:      	<unknown>
    9490:      	stp	d5, d28, [x19, #-0x200]
    9494:      	<unknown>
    9498:      	<unknown>
    949c:      	<unknown>
    94a0:      	fnmls	z3.h, p3/m, z27.h, z18.h
    94a4:      	<unknown>
    94a8:      	<unknown>
    94ac:      	<unknown>
    94b0:      	<unknown>
    94b4:      	<unknown>
    94b8:      	<unknown>
    94bc:      	<unknown>
    94c0:      	<unknown>
    94c4:      	<unknown>
    94c8:      	<unknown>
    94cc:      	umlal2	v13.4s, v1.8h, v3.h[0]
    94d0:      	ldrh	w18, [x11, #0xa32]
    94d4:      	stgp	x16, x25, [x11, #-0x400]
    94d8:      	<unknown>
    94dc:      	<unknown>
    94e0:      	<unknown>
    94e4:      	<unknown>
    94e8:      	<unknown>
    94ec:      	<unknown>
    94f0:      	<unknown>
    94f4:      	<unknown>
    94f8:      	<unknown>
    94fc:      	<unknown>
    9500:      	ldpsw	x15, x27, [x19, #-0xd0]
    9504:      	<unknown>
    9508:      	<unknown>
    950c:      	<unknown>
    9510:      	b.nv	0xd435c
    9514:      	<unknown>
    9518:      	sabdl2	v9.8h, v27.16b, v0.16b
    951c:      	and	w21, w2, w12, lsr #19
    9520:      	<unknown>
    9524:      	<unknown>
    9528:      	<unknown>
    952c:      	ldpsw	x15, x27, [x19, #-0xd0]
    9530:      	<unknown>
    9534:      	fminv	h26, p0, z1.h
    9538:      	<unknown>
    953c:      	<unknown>
    9540:      	<unknown>
    9544:      	<unknown>
    9548:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    954c:      	<unknown>
    9550:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9554:      	<unknown>
    9558:      	<unknown>
    955c:      	<unknown>
    9560:      	<unknown>
    9564:      	<unknown>
    9568:      	<unknown>
    956c:      	<unknown>
    9570:      	adr	x18, 0xc7e19
    9574:      	<unknown>
    9578:      	<unknown>
    957c:      	raddhn2	v2.8h, v26.4s, v15.4s
    9580:      	<unknown>
    9584:      	<unknown>
    9588:      	ldnp	d3, d24, [x11, #-0x140]
    958c:      	stp	d5, d25, [x3, #-0x200]
    9590:      	<unknown>
    9594:      	fcvtxn2	v20.4s, v3.2d
    9598:      	<unknown>
    959c:      	<unknown>
    95a0:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    95a4:      	<unknown>
    95a8:      	<unknown>
    95ac:      	<unknown>
    95b0:      	<unknown>
    95b4:      	<unknown>
    95b8:      	<unknown>
    95bc:      	<unknown>
    95c0:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    95c4:      	<unknown>
    95c8:      	ldnp	d6, d24, [x10, #-0x170]
    95cc:      	<unknown>
    95d0:      	usubl2	v15.4s, v3.8h, v9.8h
    95d4:      	ldnp	d19, d29, [x3, #-0x1f0]
    95d8:      	<unknown>
    95dc:      	<unknown>
    95e0:      	<unknown>
    95e4:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    95e8:      	<unknown>
    95ec:      	cmpge	p12.b, p2/z, z19.b, #0x0
    95f0:      	<unknown>
    95f4:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    95f8:      	<unknown>
    95fc:      	<unknown>
    9600:      	<unknown>
    9604:      	<unknown>
    9608:      	ldpsw	x0, x25, [x17, #-0xf8]
    960c:      	<unknown>
    9610:      	<unknown>
    9614:      	<unknown>
    9618:      	<unknown>
    961c:      	<unknown>
    9620:      	<unknown>
    9624:      	<unknown>
    9628:      	ldpsw	x15, x27, [x19, #-0xd0]
    962c:      	<unknown>
    9630:      	<unknown>
    9634:      	<unknown>
    9638:      	fnmls	z1.h, p2/m, z11.h, z12.h
    963c:      	usubl2	v4.4s, v3.8h, v15.8h
    9640:      	<unknown>
    9644:      	fmul	z5.h, z3.h, z5.h[0]
    9648:      	ands	w12, w1, #0xf800000f
    964c:      	<unknown>
    9650:      	<unknown>
    9654:      	<unknown>
    9658:      	<unknown>
    965c:      	ldnp	d18, d27, [x27, #-0x140]
    9660:      	<unknown>
    9664:      	fnmls	z1.h, p2/m, z11.h, z12.h
    9668:      	ldpsw	x4, x8, [x3, #-0x48]
    966c:      	<unknown>
    9670:      	<unknown>
    9674:      	ands	w26, w1, #0xf800000f
    9678:      	<unknown>
    967c:      	fnmls	z3.h, p3/m, z27.h, z18.h
    9680:      	bic	w0, w9, w4, lsr #9
    9684:      	<unknown>
    9688:      	<unknown>
    968c:      	<unknown>
    9690:      	<unknown>
    9694:      	raddhn2	v0.8h, v25.4s, v15.4s
    9698:      	<unknown>
    969c:      	<unknown>
    96a0:      	fnmls	z13.h, p3/m, z26.h, z4.h
    96a4:      	<unknown>
    96a8:      	<unknown>
    96ac:      	fmul	z5.h, z3.h, z5.h[0]
    96b0:      	ands	w26, w1, #0xf800000f
    96b4:      	<unknown>
    96b8:      	<unknown>
    96bc:      	<unknown>
    96c0:      	<unknown>
    96c4:      	<unknown>
    96c8:      	<unknown>
    96cc:      	bc.lo	0x49f14
    96d0:      	ldp	s25, s28, [x3, #-0xd8]
    96d4:      	<unknown>
    96d8:      	<unknown>
    96dc:      	<unknown>
    96e0:      	<unknown>
    96e4:      	<unknown>
    96e8:      	<unknown>
    96ec:      	<unknown>
    96f0:      	ldnp	d6, d24, [x10, #-0x170]
    96f4:      	<unknown>
    96f8:      	fmls	z15.h, p0/m, z3.h, z19.h
    96fc:      	umlal2	v20.4s, v3.8h, v0.h[3]
    9700:      	umin	v12.8h, v3.8h, v9.8h
    9704:      	fmls	z7.h, p0/m, z3.h, z16.h
    9708:      	<unknown>
    970c:      	<unknown>
    9710:      	<unknown>
    9714:      	adr	x0, 0xfc19b
    9718:      	<unknown>
    971c:      	uabd	v5.8h, v18.8h, v5.8h
    9720:      	ldpsw	x20, x8, [x3, #-0x48]
    9724:      	<unknown>
    9728:      	<unknown>
    972c:      	ands	w26, w1, #0xf800000f
    9730:      	<unknown>
    9734:      	<unknown>
    9738:      	fcmla	v2.8h, v27.8h, v20.h[1], #180
    973c:      	raddhn2	v16.8h, v27.4s, v15.4s
    9740:      	ldnp	d20, d28, [x19, #-0x110]
    9744:      	<unknown>
    9748:      	<unknown>
    974c:      	stp	s15, s28, [x19, #-0x100]
    9750:      	<unknown>
    9754:      	fmul	z5.h, z3.h, z5.h[0]
    9758:      	umlal2	v14.4s, v1.8h, v13.h[0]
    975c:      	ldrh	w4, [x11, #0xa32]
    9760:      	whilelt	pn8.b, x11, x0, vlx4
    9764:      	<unknown>
    9768:      	fnmls	z21.h, p4/m, z19.h, z18.h
    976c:      	stp	d14, d29, [x3, #-0x200]
    9770:      	<unknown>
    9774:      	<unknown>
    9778:      	fcmla	v2.8h, v27.8h, v20.h[1], #180
    977c:      	raddhn2	v16.8h, v27.4s, v15.4s
    9780:      	ldnp	d20, d28, [x19, #-0x110]
    9784:      	<unknown>
    9788:      	<unknown>
    978c:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    9790:      	<unknown>
    9794:      	<unknown>
    9798:      	<unknown>
    979c:      	fnmls	z13.h, p3/m, z26.h, z4.h
    97a0:      	fnmls	z20.h, p6/m, z10.h, z16.h
    97a4:      	bic	w0, w9, w4, lsr #9
    97a8:      	<unknown>
    97ac:      	<unknown>
    97b0:      	stp	s15, s28, [x19, #-0x100]
    97b4:      	<unknown>
    97b8:      	<unknown>
    97bc:      	<unknown>
    97c0:      	<unknown>
    97c4:      	<unknown>
    97c8:      	ldnp	d18, d27, [x27, #-0x140]
    97cc:      	<unknown>
    97d0:      	umlal2	v14.4s, v3.8h, v3.h[2]
    97d4:      	whilelt	pn10.b, x11, x0, vlx4
    97d8:      	<unknown>
    97dc:      	<unknown>
    97e0:      	fnmls	z13.h, p3/m, z27.h, z4.h
    97e4:      	ldnp	s0, s9, [x9, #-0xe0]
    97e8:      	<unknown>
    97ec:      	<unknown>
    97f0:      	fnmls	z13.h, p3/m, z27.h, z4.h
    97f4:      	ldp	w0, w9, [x9, #-0xe0]
    97f8:      	<unknown>
    97fc:      	<unknown>
    9800:      	<unknown>
    9804:      	<unknown>
    9808:      	<unknown>
    980c:      	fnmls	z15.h, p3/m, z19.h, z14.h
    9810:      	sub	w3, w3, #0x81d
    9814:      	<unknown>
    9818:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    981c:      	<unknown>
    9820:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    9824:      	<unknown>
    9828:      	fmls	z12.h, p0/m, z3.h, z16.h
    982c:      	<unknown>
    9830:      	ldnp	d5, d28, [x19, #-0x1f0]
    9834:      	fcvtxn2	v0.4s, v1.2d
    9838:      	<unknown>
    983c:      	<unknown>
    9840:      	<unknown>
    9844:      	<unknown>
    9848:      	<unknown>
    984c:      	<unknown>
    9850:      	ldnp	d6, d24, [x10, #-0x170]
    9854:      	<unknown>
    9858:      	ldpsw	x15, x8, [x3, #-0xe0]
    985c:      	rsubhn2	v19.8h, v27.4s, v15.4s
    9860:      	<unknown>
    9864:      	fcmla	v0.8h, v9.8h, v3.h[1], #180
    9868:      	<unknown>
    986c:      	<unknown>
    9870:      	adr	x9, 0x4a55f
    9874:      	<unknown>
    9878:      	<unknown>
    987c:      	<unknown>
    9880:      	fcvtxn2	v0.4s, v1.2d
    9884:      	<unknown>
    9888:      	<unknown>
    988c:      	<unknown>
    9890:      	<unknown>
    9894:      	<unknown>
    9898:      	<unknown>
    989c:      	<unknown>
    98a0:      	<unknown>
    98a4:      	<unknown>
    98a8:      	ldnp	d18, d27, [x27, #-0x140]
    98ac:      	<unknown>
    98b0:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    98b4:      	<unknown>
    98b8:      	fnmls	z3.h, p3/m, z26.h, z18.h
    98bc:      	uhsub	v0.4h, v9.4h, v4.4h
    98c0:      	<unknown>
    98c4:      	adr	x5, 0xfc353
    98c8:      	fmul	z5.h, z3.h, z5.h[0]
    98cc:      	<unknown>
    98d0:      	uabdl2	v18.4s, v19.8h, v5.8h
    98d4:      	umlal2	v20.4s, v3.8h, v13.h[2]
    98d8:      	bic	w4, w11, w26, lsl #25
    98dc:      	<unknown>
    98e0:      	<unknown>
    98e4:      	raddhn2	v20.8h, v27.4s, v15.4s
    98e8:      	ldnp	d20, d28, [x19, #-0x110]
    98ec:      	<unknown>
    98f0:      	<unknown>
    98f4:      	<unknown>
    98f8:      	<unknown>
    98fc:      	<unknown>
    9900:      	ldnp	d18, d27, [x27, #-0x140]
    9904:      	<unknown>
    9908:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    990c:      	<unknown>
    9910:      	fnmls	z1.h, p5/m, z3.h, z20.h
    9914:      	<unknown>
    9918:      	<unknown>
    991c:      	adr	x5, 0x4a7ab
    9920:      	<unknown>
    9924:      	<unknown>
    9928:      	<unknown>
    992c:      	<unknown>
    9930:      	b.nv	0xd45bc
    9934:      	<unknown>
    9938:      	<unknown>
    993c:      	<unknown>
    9940:      	<unknown>
    9944:      	<unknown>
    9948:      	<unknown>
    994c:      	fnmls	z15.h, p3/m, z3.h, z12.h
    9950:      	<unknown>
    9954:      	<unknown>
    9958:      	<unknown>
    995c:      	ldnp	d14, d24, [x11, #-0x1e0]
    9960:      	umlal2	v5.4s, v3.8h, v4.h[3]
    9964:      	fcmla	v0.8h, v25.8h, v20.h[1], #270
    9968:      	umlal2	v16.4s, v3.8h, v3.h[2]
    996c:      	uqshl	v14.2d, v3.2d, #0x32
    9970:      	<unknown>
    9974:      	<unknown>
    9978:      	fnmls	z3.h, p3/m, z27.h, z18.h
    997c:      	ldnp	s0, s9, [x9, #-0xe0]
    9980:      	<unknown>
    9984:      	<unknown>
    9988:      	stnp	w29, w8, [x1, #-0x100]
    998c:      	strh	w16, [x1, x5, lsl #1]
    9990:      	cmpge	p9.b, p2/z, z17.b, #0x0
    9994:      	<unknown>
    9998:      	fnmls	z1.h, p2/m, z11.h, z12.h
    999c:      	umlal2	v4.4s, v3.8h, v4.h[3]
    99a0:      	<unknown>
    99a4:      	ldnp	d20, d24, [x11, #-0x140]
    99a8:      	<unknown>
    99ac:      	<unknown>
    99b0:      	<unknown>
    99b4:      	<unknown>
    99b8:      	ldnp	d15, d24, [x27, #-0x110]
    99bc:      	fcmge	p0.h, p2/z, z1.h, #0.0
    99c0:      	<unknown>
    99c4:      	ldnp	d5, d28, [x19, #-0x1f0]
    99c8:      	ldpsw	x0, x16, [x25, #-0xa0]
    99cc:      	<unknown>
    99d0:      	<unknown>
    99d4:      	<unknown>
    99d8:      	<unknown>
    99dc:      	<unknown>
    99e0:      	<unknown>
    99e4:      	<unknown>
    99e8:      	<unknown>
    99ec:      	ldnp	d6, d24, [x10, #-0x170]
    99f0:      	<unknown>
    99f4:      	umlal2	v15.4s, v3.8h, v3.h[2]
    99f8:      	<unknown>
    99fc:      	<unknown>
    9a00:      	<unknown>
    9a04:      	raddhn2	v2.8h, v27.4s, v15.4s
    9a08:      	<unknown>
    9a0c:      	<unknown>
    9a10:      	ldnp	d15, d24, [x27, #-0x110]
    9a14:      	<unknown>
    9a18:      	fnmls	z9.h, p4/m, z3.h, z8.h
    9a1c:      	<unknown>
    9a20:      	<unknown>
    9a24:      	<unknown>
    9a28:      	<unknown>
    9a2c:      	fcmla	v5.8h, v19.8h, v18.h[1], #270
    9a30:      	<unknown>
    9a34:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    9a38:      	<unknown>
    9a3c:      	fnmls	z1.h, p2/m, z11.h, z12.h
    9a40:      	umlal2	v4.4s, v3.8h, v4.h[3]
    9a44:      	<unknown>
    9a48:      	ldnp	d20, d24, [x11, #-0x140]
    9a4c:      	<unknown>
    9a50:      	<unknown>
    9a54:      	<unknown>
    9a58:      	<unknown>
    9a5c:      	ldnp	d15, d24, [x27, #-0x110]
    9a60:      	umlal2	v0.4s, v1.8h, v8.h[4]
    9a64:      	<unknown>
    9a68:      	<unknown>
    9a6c:      	<unknown>
    9a70:      	fnmls	z14.h, p1/m, z3.h, z12.h
    9a74:      	ldpsw	x9, x8, [x1, #-0x48]
    9a78:      	<unknown>
    9a7c:      	<unknown>
    9a80:      	ands	w26, w1, #0xf800000f
    9a84:      	<unknown>
    9a88:      	<unknown>
    9a8c:      	<unknown>
    9a90:      	<unknown>
    9a94:      	umin	v3.8h, v27.8h, v14.8h
    9a98:      	<unknown>
    9a9c:      	ldp	d17, d24, [x26, #-0x110]
    9aa0:      	<unknown>
    9aa4:      	ldpsw	x15, x27, [x19, #-0xd0]
    9aa8:      	<unknown>
    9aac:      	<unknown>
    9ab0:      	<unknown>
    9ab4:      	<unknown>
    9ab8:      	<unknown>
    9abc:      	<unknown>
    9ac0:      	<unknown>
    9ac4:      	fcmla	v5.8h, v19.8h, v18.h[1], #270
    9ac8:      	<unknown>
    9acc:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    9ad0:      	<unknown>
    9ad4:      	umlsl2	v19.4s, v19.8h, v4.h[1]
    9ad8:      	fnmls	z7.h, p1/m, z27.h, z12.h
    9adc:      	<unknown>
    9ae0:      	ldnp	d18, d27, [x27, #-0x140]
    9ae4:      	fcmla	v5.8h, v19.8h, v13.h[0], #270
    9ae8:      	<unknown>
    9aec:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    9af0:      	<unknown>
    9af4:      	<unknown>
    9af8:      	<unknown>
    9afc:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9b00:      	<unknown>
    9b04:      	<unknown>
    9b08:      	bc.pl	0xce970
    9b0c:      	ldnp	d15, d25, [x27, #-0x190]
    9b10:      	raddhn2	v5.8h, v27.4s, v15.4s
    9b14:      	ldnp	d20, d28, [x19, #-0x110]
    9b18:      	<unknown>
    9b1c:      	<unknown>
    9b20:      	<unknown>
    9b24:      	bc.pl	0xce98c
    9b28:      	ldnp	d15, d25, [x27, #-0x190]
    9b2c:      	raddhn2	v5.8h, v27.4s, v15.4s
    9b30:      	ldnp	d20, d28, [x19, #-0x110]
    9b34:      	<unknown>
    9b38:      	<unknown>
    9b3c:      	<unknown>
    9b40:      	stp	s15, s28, [x19, #-0x100]
    9b44:      	<unknown>
    9b48:      	adr	x5, 0xfc5d7
    9b4c:      	<unknown>
    9b50:      	<unknown>
    9b54:      	<unknown>
    9b58:      	umlalt	z1.h, z2.b, z9.b
    9b5c:      	umlalt	z31.h, z10.b, z15.b
    9b60:      	cmpge	p5.b, p2/z, z18.b, #0x0
    9b64:      	<unknown>
    9b68:      	<unknown>
    9b6c:      	<unknown>
    9b70:      	ldpsw	x5, x29, [x3, #-0x60]
    9b74:      	<unknown>
    9b78:      	<unknown>
    9b7c:      	<unknown>
    9b80:      	<unknown>
    9b84:      	<unknown>
    9b88:      	<unknown>
    9b8c:      	fnmls	z3.h, p3/m, z27.h, z18.h
    9b90:      	ldp	w0, w9, [x9, #-0xe0]
    9b94:      	<unknown>
    9b98:      	<unknown>
    9b9c:      	adr	x19, 0xeaa4b
    9ba0:      	fnmls	z15.h, p4/m, z19.h, z20.h
    9ba4:      	cmpge	p4.b, p2/z, z19.b, #0x0
    9ba8:      	<unknown>
    9bac:      	umlsl2	v19.4s, v19.8h, v4.h[1]
    9bb0:      	fnmls	z7.h, p1/m, z27.h, z12.h
    9bb4:      	<unknown>
    9bb8:      	ldnp	d18, d27, [x27, #-0x140]
    9bbc:      	fcmla	v5.8h, v19.8h, v13.h[0], #270
    9bc0:      	<unknown>
    9bc4:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    9bc8:      	<unknown>
    9bcc:      	<unknown>
    9bd0:      	<unknown>
    9bd4:      	<unknown>
    9bd8:      	<unknown>
    9bdc:      	<unknown>
    9be0:      	fnmls	z15.h, p3/m, z3.h, z12.h
    9be4:      	usubl2	v18.4s, v3.8h, v15.8h
    9be8:      	<unknown>
    9bec:      	fmul	z5.h, z3.h, z5.h[0]
    9bf0:      	<unknown>
    9bf4:      	<unknown>
    9bf8:      	<unknown>
    9bfc:      	ldp	w8, w9, [x9, #-0x70]
    9c00:      	<unknown>
    9c04:      	<unknown>
    9c08:      	<unknown>
    9c0c:      	<unknown>
    9c10:      	<unknown>
    9c14:      	fnmls	z15.h, p3/m, z3.h, z12.h
    9c18:      	<unknown>
    9c1c:      	<unknown>
    9c20:      	<unknown>
    9c24:      	<unknown>
    9c28:      	ldnp	d14, d24, [x11, #-0x1e0]
    9c2c:      	umlal2	v5.4s, v3.8h, v4.h[3]
    9c30:      	<unknown>
    9c34:      	<unknown>
    9c38:      	<unknown>
    9c3c:      	fnmls	z15.h, p3/m, z3.h, z12.h
    9c40:      	usubl2	v18.4s, v3.8h, v15.8h
    9c44:      	<unknown>
    9c48:      	fmul	z5.h, z3.h, z5.h[0]
    9c4c:      	<unknown>
    9c50:      	<unknown>
    9c54:      	<unknown>
    9c58:      	ldp	w8, w9, [x9, #-0x70]
    9c5c:      	<unknown>
    9c60:      	raddhn2	v2.8h, v27.4s, v15.4s
    9c64:      	<unknown>
    9c68:      	fcmeq	p9.h, p0/z, z19.h, z7.h
    9c6c:      	<unknown>
    9c70:      	<unknown>
    9c74:      	<unknown>
    9c78:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    9c7c:      	<unknown>
    9c80:      	<unknown>
    9c84:      	<unknown>
    9c88:      	<unknown>
    9c8c:      	<unknown>
    9c90:      	<unknown>
    9c94:      	<unknown>
    9c98:      	<unknown>
    9c9c:      	<unknown>
    9ca0:      	<unknown>
    9ca4:      	fnmls	z13.h, p1/m, z11.h, z20.h
    9ca8:      	<unknown>
    9cac:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9cb0:      	fnmls	z20.h, p6/m, z10.h, z16.h
    9cb4:      	ldnp	s0, s9, [x9, #-0xe0]
    9cb8:      	<unknown>
    9cbc:      	<unknown>
    9cc0:      	adr	x4, 0x540cb
    9cc4:      	fadd	z10.h, z0.h, z7.h
    9cc8:      	<unknown>
    9ccc:      	<unknown>
    9cd0:      	<unknown>
    9cd4:      	<unknown>
    9cd8:      	<unknown>
    9cdc:      	<unknown>
    9ce0:      	<unknown>
    9ce4:      	<unknown>
    9ce8:      	<unknown>
    9cec:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9cf0:      	<unknown>
    9cf4:      	<unknown>
    9cf8:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9cfc:      	fnmls	z20.h, p6/m, z10.h, z16.h
    9d00:      	<unknown>
    9d04:      	bic	w0, w9, w18, lsr #9
    9d08:      	<unknown>
    9d0c:      	<unknown>
    9d10:      	<unknown>
    9d14:      	<unknown>
    9d18:      	fnmls	z20.h, p0/m, z11.h, z20.h
    9d1c:      	<unknown>
    9d20:      	<unknown>
    9d24:      	<unknown>
    9d28:      	ldpsw	x22, x24, [x11, #-0xa0]
    9d2c:      	umlal2	v4.4s, v3.8h, v3.h[0]
    9d30:      	<unknown>
    9d34:      	<unknown>
    9d38:      	<unknown>
    9d3c:      	fmul	z26.h, z1.h, z5.h[0]
    9d40:      	fadd	z10.h, z0.h, z7.h
    9d44:      	<unknown>
    9d48:      	<unknown>
    9d4c:      	<unknown>
    9d50:      	<unknown>
    9d54:      	<unknown>
    9d58:      	ssubwb	z1.h, z26.h, z19.b
    9d5c:      	<unknown>
    9d60:      	<unknown>
    9d64:      	str	b12, [x2, #0x848]
    9d68:      	<unknown>
    9d6c:      	fnmls	z3.h, p3/m, z26.h, z18.h
    9d70:      	ldp	s9, s25, [x18, #-0xe8]
    9d74:      	<unknown>
    9d78:      	<unknown>
    9d7c:      	<unknown>
    9d80:      	bic	w21, w27, w9, lsl #28
    9d84:      	<unknown>
    9d88:      	raddhn2	v0.8h, v25.4s, v15.4s
    9d8c:      	<unknown>
    9d90:      	<unknown>
    9d94:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    9d98:      	<unknown>
    9d9c:      	ldnp	d6, d24, [x11, #-0x170]
    9da0:      	<unknown>
    9da4:      	fmls	z15.h, p0/m, z3.h, z7.h
    9da8:      	<unknown>
    9dac:      	<unknown>
    9db0:      	<unknown>
    9db4:      	fnmls	z20.h, p0/m, z11.h, z20.h
    9db8:      	<unknown>
    9dbc:      	fnmls	z0.h, p5/m, z1.h, z8.h
    9dc0:      	<unknown>
    9dc4:      	<unknown>
    9dc8:      	fmul	z5.h, z3.h, z5.h[0]
    9dcc:      	ands	w26, w1, #0xf800000f
    9dd0:      	<unknown>
    9dd4:      	<unknown>
    9dd8:      	<unknown>
    9ddc:      	<unknown>
    9de0:      	psel	p5, p8, p9.h[w14, 1]
    9de4:      	<unknown>
    9de8:      	bc.lo	0xae690
    9dec:      	ssubl2	v26.8h, v1.16b, v8.16b
    9df0:      	<unknown>
    9df4:      	<unknown>
    9df8:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    9dfc:      	<unknown>
    9e00:      	sqrshrnt	z3.h, z11.s, #0x2
    9e04:      	ldnp	d14, d24, [x11, #-0x1e0]
    9e08:      	<unknown>
    9e0c:      	<unknown>
    9e10:      	<unknown>
    9e14:      	<unknown>
    9e18:      	<unknown>
    9e1c:      	<unknown>
    9e20:      	<unknown>
    9e24:      	<unknown>
    9e28:      	fnmls	z1.h, p2/m, z11.h, z12.h
    9e2c:      	umlal2	v4.4s, v3.8h, v4.h[3]
    9e30:      	<unknown>
    9e34:      	<unknown>
    9e38:      	<unknown>
    9e3c:      	<unknown>
    9e40:      	<unknown>
    9e44:      	fnmls	z0.h, p5/m, z1.h, z8.h
    9e48:      	<unknown>
    9e4c:      	<unknown>
    9e50:      	fmul	z5.h, z3.h, z5.h[0]
    9e54:      	ands	w26, w1, #0xf800000f
    9e58:      	<unknown>
    9e5c:      	fnmls	z14.h, p1/m, z3.h, z12.h
    9e60:      	<unknown>
    9e64:      	<unknown>
    9e68:      	ldr	x14, 0xeeb14
    9e6c:      	<unknown>
    9e70:      	<unknown>
    9e74:      	<unknown>
    9e78:      	<unknown>
    9e7c:      	fnmls	z18.h, p1/m, z10.h, z19.h
    9e80:      	<unknown>
    9e84:      	<unknown>
    9e88:      	<unknown>
    9e8c:      	<unknown>
    9e90:      	<unknown>
    9e94:      	bic	w0, w9, w18, lsr #9
    9e98:      	<unknown>
    9e9c:      	<unknown>
    9ea0:      	<unknown>
    9ea4:      	<unknown>
    9ea8:      	<unknown>
    9eac:      	stgp	x5, x25, [x3, #-0x400]
    9eb0:      	<unknown>
    9eb4:      	<unknown>
    9eb8:      	<unknown>
    9ebc:      	<unknown>
    9ec0:      	<unknown>
    9ec4:      	<unknown>
    9ec8:      	bic	w20, w11, w19, lsr #29
    9ecc:      	<unknown>
    9ed0:      	<unknown>
    9ed4:      	smin	v1.8h, v19.8h, v5.8h
    9ed8:      	fnmls	z21.h, p3/m, z11.h, z2.h
    9edc:      	<unknown>
    9ee0:      	<unknown>
    9ee4:      	<unknown>
    9ee8:      	umin	v0.8h, v1.8h, v9.8h
    9eec:      	<unknown>
    9ef0:      	<unknown>
    9ef4:      	<unknown>
    9ef8:      	<unknown>
    9efc:      	<unknown>
    9f00:      	<unknown>
    9f04:      	<unknown>
    9f08:      	<unknown>
    9f0c:      	<unknown>
    9f10:      	<unknown>
    9f14:      	<unknown>
    9f18:      	<unknown>
    9f1c:      	<unknown>
    9f20:      	<unknown>
    9f24:      	<unknown>
    9f28:      	<unknown>
    9f2c:      	<unknown>
    9f30:      	<unknown>
    9f34:      	<unknown>
    9f38:      	<unknown>
    9f3c:      	<unknown>
    9f40:      	<unknown>
    9f44:      	<unknown>
    9f48:      	<unknown>
    9f4c:      	<unknown>
    9f50:      	<unknown>
    9f54:      	<unknown>
    9f58:      	<unknown>
    9f5c:      	<unknown>
    9f60:      	adr	x2, 0x70b49
    9f64:      	<unknown>
    9f68:      	<unknown>
    9f6c:      	<unknown>
    9f70:      	<unknown>
    9f74:      	<unknown>
    9f78:      	ldnp	d9, d23, [x27, #-0x1d0]
    9f7c:      	<unknown>
    9f80:      	<unknown>
    9f84:      	adds	w7, w19, #0x95c, lsl #12 // =0x95c000
    9f88:      	<unknown>
    9f8c:      	<unknown>
    9f90:      	ldnp	d9, d23, [x27, #-0x1d0]
    9f94:      	<unknown>
    9f98:      	<unknown>
    9f9c:      	<unknown>
    9fa0:      	<unknown>
    9fa4:      	<unknown>
    9fa8:      	<unknown>
    9fac:      	<unknown>
    9fb0:      	adr	x19, 0x70bfd
    9fb4:      	fnmls	z31.h, p4/m, z26.h, z12.h
    9fb8:      	<unknown>
    9fbc:      	<unknown>
    9fc0:      	<unknown>
    9fc4:      	adr	x19, 0x70c11
    9fc8:      	<unknown>
    9fcc:      	<unknown>
    9fd0:      	<unknown>
    9fd4:      	<unknown>
    9fd8:      	<unknown>
    9fdc:      	adr	x19, 0xc8c2b
    9fe0:      	<unknown>
    9fe4:      	<unknown>
    9fe8:      	adr	x8, 0x6ec37
    9fec:      	<unknown>
    9ff0:      	<unknown>
    9ff4:      	<unknown>
    9ff8:      	<unknown>
    9ffc:      	<unknown>
    a000:      	sqshl	d1, d11, #0x38
    a004:      	<unknown>
    a008:      	<unknown>
    a00c:      	<unknown>
    a010:      	ldrh	wzr, [x2, #0x1438]
    a014:      	adr	xzr, 0xdce1f
    a018:      	ldnp	d5, d23, [x27, #-0x1d0]
    a01c:      	<unknown>
    a020:      	<unknown>
    a024:      	ldpsw	x22, x24, [x11, #-0xa0]
    a028:      	<unknown>
    a02c:      	fnmls	z18.h, p0/m, z11.h, z13.h
    a030:      	<unknown>
    a034:      	fcmla	z12.h, p0/m, z1.h, z1.h, #90
    a038:      	<unknown>
    a03c:      	<unknown>
    a040:      	<unknown>
    a044:      	<unknown>
    a048:      	fnmls	z1.h, p3/m, z3.h, z21.h
    a04c:      	<unknown>
    a050:      	adr	x25, 0x5445f
    a054:      	<unknown>
    a058:      	addhnb	z18.b, z11.h, z25.h
    a05c:      	ldrh	w14, [x3, #0x193a]
    a060:      	<unknown>
    a064:      	<unknown>
    a068:      	<unknown>
    a06c:      	ldpsw	x15, x27, [x19, #-0xd0]
    a070:      	<unknown>
    a074:      	<unknown>
    a078:      	<unknown>
    a07c:      	ldrh	w19, [x3, #0x1428]
    a080:      	<unknown>
    a084:      	ldrh	w18, [x19, #0x10b8]
    a088:      	<unknown>
    a08c:      	<unknown>
    a090:      	<unknown>
    a094:      	<unknown>
    a098:      	<unknown>
    a09c:      	<unknown>
    a0a0:      	<unknown>
    a0a4:      	<unknown>
    a0a8:      	<unknown>
    a0ac:      	<unknown>
    a0b0:      	<unknown>
    a0b4:      	and	p9.b, p3/z, p10.b, p0.b
    a0b8:      	<unknown>
    a0bc:      	<unknown>
    a0c0:      	<unknown>
    a0c4:      	ldrh	w2, [x2, #0x1428]
    a0c8:      	<unknown>
    a0cc:      	<unknown>
    a0d0:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    a0d4:      	<unknown>
    a0d8:      	<unknown>
    a0dc:      	<unknown>
    a0e0:      	<unknown>
    a0e4:      	<unknown>
    a0e8:      	<unknown>
    a0ec:      	<unknown>
    a0f0:      	<unknown>
    a0f4:      	fnmls	z13.h, p1/m, z11.h, z20.h
    a0f8:      	<unknown>
    a0fc:      	fnmls	z3.h, p3/m, z26.h, z18.h
    a100:      	<unknown>
    a104:      	<unknown>
    a108:      	<unknown>
    a10c:      	<unknown>
    a110:      	<unknown>
    a114:      	<unknown>
    a118:      	ldpsw	x15, x27, [x19, #-0xd0]
    a11c:      	<unknown>
    a120:      	<unknown>
    a124:      	and	p9.b, p13/z, p3.b, p0.b
    a128:      	<unknown>
    a12c:      	uqshl	v21.4s, v3.4s, #0x0
    a130:      	fcmeq	p6.h, p0/z, z3.h, #0.0
    a134:      	<unknown>
    a138:      	bic	w3, w11, w19, lsr #25
    a13c:      	<unknown>
    a140:      	<unknown>
    a144:      	sqshlu	v9.2d, v27.2d, #0x3
    a148:      	<unknown>
    a14c:      	ldpsw	x5, x26, [x11, #-0x90]
    a150:      	<unknown>
    a154:      	<unknown>
    a158:      	<unknown>
    a15c:      	<unknown>
    a160:      	<unknown>
    a164:      	ssubl2	v26.4s, v1.8h, v7.8h
    a168:      	ldnp	d16, d24, [x11, #0x30]
    a16c:      	<unknown>
    a170:      	<unknown>
    a174:      	<unknown>
    a178:      	sabdl2	v9.8h, v27.16b, v0.16b
    a17c:      	ldp	w21, w19, [x2, #0x60]
    a180:      	<unknown>
    a184:      	ssubl2	v26.4s, v1.8h, v7.8h
    a188:      	ldnp	d16, d24, [x11, #0x30]
    a18c:      	<unknown>
    a190:      	<unknown>
    a194:      	<unknown>
    a198:      	sabdl2	v9.8h, v27.16b, v0.16b
    a19c:      	and	w21, w2, w12, lsr #19
    a1a0:      	<unknown>
    a1a4:      	ldpsw	x0, x25, [x17, #-0xf8]
    a1a8:      	<unknown>
    a1ac:      	stgp	x20, x27, [x27, #-0x400]
    a1b0:      	ldpsw	x14, x26, [x11, #-0x60]
    a1b4:      	<unknown>
    a1b8:      	<unknown>
    a1bc:      	ldnp	d2, d8, [x2, #-0x1d0]
    a1c0:      	<unknown>
    a1c4:      	<unknown>
    a1c8:      	<unknown>
    a1cc:      	mls	v2.8h, v27.8h, v12.h[2]
    a1d0:      	<unknown>
    a1d4:      	<unknown>
    a1d8:      	<unknown>
    a1dc:      	fcmla	v11.8h, v3.8h, v18.h[1], #180
    a1e0:      	<unknown>
    a1e4:      	usubl2	v12.4s, v3.8h, v21.8h
    a1e8:      	ldpsw	x1, x29, [x19, #-0xf8]
    a1ec:      	ldnp	d12, d24, [x11, #-0x1e0]
    a1f0:      	cmpge	p5.b, p2/z, z19.b, #0x0
    a1f4:      	<unknown>
    a1f8:      	fnmls	z1.h, p2/m, z11.h, z12.h
    a1fc:      	umlal2	v4.4s, v3.8h, v4.h[3]
    a200:      	<unknown>
    a204:      	<unknown>
    a208:      	<unknown>
    a20c:      	<unknown>
    a210:      	<unknown>
    a214:      	<unknown>
    a218:      	<unknown>
    a21c:      	ldnp	d19, d24, [x19, #0x30]
    a220:      	<unknown>
    a224:      	<unknown>
    a228:      	ldpsw	x0, x25, [x17, #-0xf8]
    a22c:      	<unknown>
    a230:      	<unknown>
    a234:      	<unknown>
    a238:      	<unknown>
    a23c:      	<unknown>
    a240:      	<unknown>
    a244:      	<unknown>
    a248:      	<unknown>
    a24c:      	<unknown>
    a250:      	<unknown>
    a254:      	<unknown>
    a258:      	<unknown>
    a25c:      	<unknown>
    a260:      	<unknown>
    a264:      	<unknown>
    a268:      	<unknown>
    a26c:      	<unknown>
    a270:      	<unknown>
    a274:      	<unknown>
    a278:      	<unknown>
    a27c:      	<unknown>
    a280:      	<unknown>
    a284:      	<unknown>
    a288:      	<unknown>
    a28c:      	adr	x21, 0x8ecf6
    a290:      	and	p8.b, p14/z, p11.b, p0.b
    a294:      	<unknown>
    a298:      	<unknown>
    a29c:      	<unknown>
    a2a0:      	ldrh	w2, [x2, #0x1428]
    a2a4:      	<unknown>
    a2a8:      	<unknown>
    a2ac:      	<unknown>
    a2b0:      	<unknown>
    a2b4:      	<unknown>
    a2b8:      	ldxrh	w2, [x26]
    a2bc:      	<unknown>
    a2c0:      	<unknown>
    a2c4:      	<unknown>
    a2c8:      	<unknown>
    a2cc:      	<unknown>
    a2d0:      	bc.lo	0x8cd58
    a2d4:      	str	b21, [x26, #0x814]
    a2d8:      	whilewr	p0.h, x1, x24
    a2dc:      	<unknown>
    a2e0:      	adr	x19, 0x70f2d
    a2e4:      	<unknown>
    a2e8:      	ldpsw	x4, x25, [x10, #-0x50]
    a2ec:      	<unknown>
    a2f0:      	<unknown>
    a2f4:      	<unknown>
    a2f8:      	<unknown>
    a2fc:      	ssubwb	z1.h, z26.h, z19.b
    a300:      	<unknown>
    a304:      	<unknown>
    a308:      	bfdot	z5.s, z11.h, z4.h[0]
    a30c:      	str	b18, [x3, #0x848]
    a310:      	bic	w0, w1, w9, lsl #12
    a314:      	<unknown>
    a318:      	<unknown>
    a31c:      	<unknown>
    a320:      	<unknown>
    a324:      	<unknown>
    a328:      	cbnz	w17, 0x7a9ec
    a32c:      	ldr	x25, 0xa8f10
    a330:      	<unknown>
    a334:      	<unknown>
    a338:      	<unknown>
    a33c:      	ssubwt	z31.h, z10.h, z19.b
    a340:      	<unknown>
    a344:      	<unknown>
    a348:      	ldurb	w13, [x26, #0xd5]
    a34c:      	<unknown>
    a350:      	lduminlb	w13, w13, [x27]
    a354:      	<unknown>
    a358:      	<unknown>
    a35c:      	<unknown>
    a360:      	<unknown>
    a364:      	ldp	d17, d24, [x26, #-0x110]
    a368:      	umlsl	v16.4s, v26.4h, v7.h[6]
    a36c:      	lduminlb	w13, w13, [x26]
    a370:      	adr	x25, 0x7aa96
    a374:      	<unknown>
    a378:      	<unknown>
    a37c:      	<unknown>
    a380:      	umlsl2	v19.4s, v19.8h, v3.h[0]
    a384:      	<unknown>
    a388:      	umlsl	v12.4s, v10.4h, v2.h[6]
    a38c:      	<unknown>
    a390:      	ldpsw	x15, x27, [x19, #-0xd0]
    a394:      	<unknown>
    a398:      	fnmls	z3.h, p3/m, z26.h, z18.h
    a39c:      	<unknown>
    a3a0:      	<unknown>
    a3a4:      	<unknown>
    a3a8:      	<unknown>
    a3ac:      	<unknown>
    a3b0:      	fnmls	z13.h, p1/m, z11.h, z20.h
    a3b4:      	<unknown>
    a3b8:      	<unknown>
    a3bc:      	ldpsw	x16, x18, [x9, #-0x90]
    a3c0:      	<unknown>
    a3c4:      	<unknown>
    a3c8:      	<unknown>
    a3cc:      	<unknown>
    a3d0:      	<unknown>
    a3d4:      	<unknown>
    a3d8:      	ldpsw	x9, x24, [x11, #-0xa0]
    a3dc:      	<unknown>
    a3e0:      	<unknown>
    a3e4:      	<unknown>
    a3e8:      	<unknown>
    a3ec:      	<unknown>
    a3f0:      	<unknown>
    a3f4:      	<unknown>
    a3f8:      	adr	x19, 0x71045
    a3fc:      	<unknown>
    a400:      	<unknown>
    a404:      	<unknown>
    a408:      	adr	x19, 0x71055
    a40c:      	fnmls	z18.h, p1/m, z10.h, z19.h
    a410:      	<unknown>
    a414:      	uqshrnb	z2.h, z27.s, #0x10
    a418:      	<unknown>
    a41c:      	<unknown>
    a420:      	<unknown>
    a424:      	ldpsw	x16, x17, [x9, #-0x40]
    a428:      	ldp	d20, d19, [x3, #-0x100]
    a42c:      	<unknown>
    a430:      	<unknown>
    a434:      	ldrh	w20, [x3, #0x1428]
    a438:      	fnmls	z12.h, p0/m, z10.h, z14.h
    a43c:      	<unknown>
    a440:      	fminv	h19, p4, z1.h
    a444:      	<unknown>
    a448:      	bfdot	z5.s, z11.h, z4.h[0]
    a44c:      	<unknown>
    a450:      	eor	w2, w27, #0x1fff0000
    a454:      	<unknown>
    a458:      	<unknown>
    a45c:      	<unknown>
    a460:      	<unknown>
    a464:      	<unknown>
    a468:      	uqshl	v25.8h, v19.8h, v15.8h
    a46c:      	<unknown>
    a470:      	<unknown>
    a474:      	<unknown>
    a478:      	ldpsw	x15, x28, [x1, #-0x98]
    a47c:      	ldnp	d3, d11, [x27, #-0x1d0]
    a480:      	<unknown>
    a484:      	<unknown>
    a488:      	cmn	w26, #0xcdc, lsl #12    // =0xcdc000
    a48c:      	ldnp	d0, d11, [x24, #-0x1d0]
    a490:      	uqsub	v11.8h, v27.8h, v19.8h
    a494:      	<unknown>
    a498:      	<unknown>
    a49c:      	<unknown>
    a4a0:      	<unknown>
    a4a4:      	<unknown>
    a4a8:      	<unknown>
    a4ac:      	<unknown>
    a4b0:      	<unknown>
    a4b4:      	<unknown>
    a4b8:      	udf	#0x3172
    a4bc:      	<unknown>
    a4c0:      	<unknown>
    a4c4:      	<unknown>
    a4c8:      	<unknown>
    a4cc:      	<unknown>
    a4d0:      	<unknown>
    a4d4:      	udf	#0x64
    a4d8:      	udf	#0x5f30
    a4dc:      	udf	#0x0
    a4e0:      	udf	#0x5fcc
    a4e4:      	udf	#0x0
    a4e8:      	udf	#0x5e4c
    a4ec:      	udf	#0x0
    a4f0:      	udf	#0x5f84
    a4f4:      	udf	#0x0
    a4f8:      	udf	#0x61dc
    a4fc:      	udf	#0x0
    a500:      	udf	#0x6220
    a504:      	udf	#0x0
    a508:      	udf	#0x6230
    a50c:      	udf	#0x0
    a510:      	udf	#0x6240
    a514:      	udf	#0x0
    a518:      	udf	#0x6250
    a51c:      	udf	#0x0
    a520:      	<unknown>
    a524:      	<unknown>
    a528:      	<unknown>
    a52c:      	<unknown>
    a530:      	fnmls	z13.h, p1/m, z11.h, z20.h
    a534:      	<unknown>
    a538:      	adr	x21, 0xcf3a2
    a53c:      	<unknown>
    a540:      	ldnp	d1, d27, [x19, #-0x1c0]
    a544:      	adr	x5, 0x54953
    a548:      	<unknown>
    a54c:      	raddhn2	v2.8h, v27.4s, v15.4s
    a550:      	adr	x6, 0xd927e
    a554:      	<unknown>
    a558:      	<unknown>
    a55c:      	<unknown>
    a560:      	<unknown>
    a564:      	<unknown>
    a568:      	sqshlu	v18.2d, v11.2d, #0x33
    a56c:      	fnmls	z21.h, p4/m, z19.h, z3.h
    a570:      	cmpgt	p3.b, p2/z, z19.b, #0x0
    a574:      	<unknown>
    a578:      	ldnp	d14, d29, [x19, #-0x1f0]
    a57c:      	adr	x9, 0x4b20a
    a580:      	ldp	d1, d28, [x19, #-0x1f0]
    a584:      	<unknown>
    a588:      	<unknown>
    a58c:      	umlsl2	v19.4s, v19.8h, v0.h[1]
    a590:      	<unknown>
    a594:      	fnmls	z14.h, p1/m, z3.h, z12.h
    a598:      	ldnp	s0, s9, [x9, #-0x80]
    a59c:      	<unknown>
    a5a0:      	fnmls	z19.h, p0/m, z11.h, z7.h
    a5a4:      	ldnp	s0, s9, [x9, #-0x80]
    a5a8:      	ldrh	w0, [x1, #0x10a8]
    a5ac:      	<unknown>
    a5b0:      	fnmls	z19.h, p2/m, z10.h, z26.h
    a5b4:      	ldnp	s0, s9, [x9, #-0x80]
    a5b8:      	ldrh	w0, [x1, #0x10a8]
    a5bc:      	<unknown>
    a5c0:      	bic	w0, w9, w16, lsr #9
    a5c4:      	<unknown>
    a5c8:      	<unknown>
    a5cc:      	sqshlu	v9.2d, v27.2d, #0x10
    a5d0:      	subhnt	z18.b, z3.h, z19.h
    a5d4:      	<unknown>
    a5d8:      	<unknown>
    a5dc:      	<unknown>
    a5e0:      	<unknown>
    a5e4:      	<unknown>
    a5e8:      	<unknown>
    a5ec:      	<unknown>
    a5f0:      	fnmls	z13.h, p1/m, z11.h, z20.h
    a5f4:      	<unknown>
    a5f8:      	adr	x21, 0xcf462
    a5fc:      	<unknown>
    a600:      	ldnp	d1, d27, [x19, #-0x1c0]
    a604:      	adr	x5, 0x54a13
    a608:      	umlal2	v12.4s, v1.8h, v0.h[1]
    a60c:      	uqshl	v18.2d, v3.2d, #0xd
    a610:      	<unknown>
    a614:      	<unknown>
    a618:      	umlsl2	v19.4s, v19.8h, v0.h[1]
    a61c:      	fcmne	p2.h, p5/z, z3.h, z7.h
    a620:      	raddhn2	v20.8h, v27.4s, v15.4s
    a624:      	<unknown>
    a628:      	<unknown>
    a62c:      	<unknown>
    a630:      	adr	x21, 0xcf49a
    a634:      	<unknown>
    a638:      	<unknown>
    a63c:      	umin	v3.8h, v26.8h, v14.8h
    a640:      	ldpsw	x5, x24, [x27, #-0x60]
    a644:      	<unknown>
    a648:      	and	p4.b, p9/z, p11.b, p0.b
    a64c:      	<unknown>
    a650:      	fnmls	z1.h, p2/m, z11.h, z12.h
    a654:      	umlal2	v4.4s, v3.8h, v4.h[3]
    a658:      	<unknown>
    a65c:      	<unknown>
    a660:      	<unknown>
    a664:      	umin	v3.8h, v26.8h, v14.8h
    a668:      	<unknown>
    a66c:      	<unknown>
    a670:      	bic	w20, w11, w19, lsr #29
    a674:      	<unknown>
    a678:      	<unknown>
    a67c:      	<unknown>
    a680:      	<unknown>
    a684:      	<unknown>
    a688:      	<unknown>
    a68c:      	<unknown>
    a690:      	<unknown>
    a694:      	<unknown>
    a698:      	<unknown>
    a69c:      	<unknown>
    a6a0:      	<unknown>
    a6a4:      	<unknown>
    a6a8:      	pext	p5.b, pn11[3]
    a6ac:      	<unknown>
    a6b0:      	umlsl2	v19.4s, v19.8h, v0.h[1]
    a6b4:      	fcmne	p2.h, p5/z, z3.h, z7.h
    a6b8:      	<unknown>
    a6bc:      	<unknown>
    a6c0:      	<unknown>
    a6c4:      	<unknown>
    a6c8:      	ldpsw	x0, x17, [x17, #-0xf8]
    a6cc:      	<unknown>
    a6d0:      	<unknown>
    a6d4:      	<unknown>
    a6d8:      	<unknown>
    a6dc:      	fnmls	z20.h, p6/m, z10.h, z16.h
    a6e0:      	adr	x13, 0x4af46
    a6e4:      	<unknown>
    a6e8:      	bic	w3, w27, w12, lsr #27
    a6ec:      	<unknown>
    a6f0:      	<unknown>
    a6f4:      	sqshlu	v9.2d, v27.2d, #0x10
    a6f8:      	sub	w18, w3, #0xcdd, lsl #12 // =0xcdd000
    a6fc:      	ldrh	w21, [x11, #0x1932]
    a700:      	umin	v3.8h, v26.8h, v14.8h
    a704:      	ldpsw	x5, x24, [x27, #-0x60]
    a708:      	<unknown>
    a70c:      	fnmls	z1.h, p3/m, z19.h, z7.h
    a710:      	<unknown>
    a714:      	<unknown>
    a718:      	<unknown>
    a71c:      	adr	x0, 0xfd1a3
    a720:      	<unknown>
    a724:      	rsubhn2	v0.8h, v25.4s, v15.4s
    a728:      	<unknown>
    a72c:      	<unknown>
    a730:      	fmls	z5.h, p0/m, z3.h, z4.h
    a734:      	<unknown>
    a738:      	<unknown>
    a73c:      	<unknown>
    a740:      	<unknown>
    a744:      	bc.vc	0x4b510
    a748:      	<unknown>
    a74c:      	<unknown>
    a750:      	fnmls	z15.h, p3/m, z19.h, z14.h
    a754:      	stp	d3, d29, [x3, #-0x200]
    a758:      	<unknown>
    a75c:      	fnmls	z4.h, p1/m, z11.h, z20.h
    a760:      	<unknown>
    a764:      	<unknown>
    a768:      	<unknown>
    a76c:      	<unknown>
    a770:      	<unknown>
    a774:      	<unknown>
    a778:      	<unknown>
    a77c:      	adr	x7, 0xf3426
    a780:      	<unknown>
    a784:      	fnmls	z20.h, p0/m, z11.h, z20.h
    a788:      	<unknown>
    a78c:      	<unknown>
    a790:      	<unknown>
    a794:      	bic	w0, w9, w18, lsr #9
    a798:      	<unknown>
    a79c:      	ldnp	d21, d29, [x2, #-0x170]
    a7a0:      	<unknown>
    a7a4:      	adr	x12, 0xdd5b2
    a7a8:      	fcmeq	p8.h, p6/z, z11.h, z18.h
    a7ac:      	and	p1.b, p9/z, p3.b, p0.b
    a7b0:      	<unknown>
    a7b4:      	fnmls	z1.h, p2/m, z11.h, z12.h
    a7b8:      	umlal2	v4.4s, v3.8h, v4.h[3]
    a7bc:      	<unknown>
    a7c0:      	<unknown>
    a7c4:      	adr	x16, 0x4b0ee
    a7c8:      	ands	w8, w10, #0x7fffff
    a7cc:      	<unknown>
    a7d0:      	<unknown>
    a7d4:      	orr	w24, w11, #0x3ff0000
    a7d8:      	<unknown>
    a7dc:      	adr	x12, 0xdd5ea
    a7e0:      	<unknown>
    a7e4:      	<unknown>
    a7e8:      	<unknown>
    a7ec:      	<unknown>
    a7f0:      	ldrh	w2, [x2, #0x1428]
    a7f4:      	<unknown>
    a7f8:      	<unknown>
    a7fc:      	<unknown>
    a800:      	ldpsw	x25, x21, [x27, #-0x70]
    a804:      	bic	p4.b, p9/z, p11.b, p0.b
    a808:      	<unknown>
    a80c:      	ldnp	d14, d29, [x19, #-0x1f0]
    a810:      	adr	x9, 0x4b49e
    a814:      	ldp	d1, d28, [x19, #-0x1f0]
    a818:      	<unknown>
    a81c:      	<unknown>
    a820:      	ldnp	d14, d24, [x11, #-0x1e0]
    a824:      	mls	v5.8h, v27.8h, v12.h[2]
    a828:      	eor	p3.b, p10/z, p11.b, p0.b
    a82c:      	<unknown>
    a830:      	fnmls	z1.h, p2/m, z11.h, z12.h
    a834:      	umlal2	v4.4s, v3.8h, v4.h[3]
    a838:      	<unknown>
    a83c:      	umlsl2	v0.4s, v25.8h, v12.h[2]
    a840:      	<unknown>
    a844:      	umlal2	v4.4s, v2.8h, v6.h[2]
    a848:      	<unknown>
    a84c:      	<unknown>
    a850:      	<unknown>
    a854:      	<unknown>
    a858:      	<unknown>
    a85c:      	<unknown>
    a860:      	<unknown>
    a864:      	ldnp	d1, d8, [x3, #-0x1d0]
    a868:      	bic	w15, w27, w11, lsr #24
    a86c:      	<unknown>
    a870:      	fnmls	z1.h, p0/m, z19.h, z12.h
    a874:      	<unknown>
    a878:      	<unknown>
    a87c:      	<unknown>
    a880:      	<unknown>
    a884:      	<unknown>
    a888:      	<unknown>
    a88c:      	<unknown>
    a890:      	<unknown>
    a894:      	<unknown>
    a898:      	<unknown>
    a89c:      	<unknown>
    a8a0:      	<unknown>
    a8a4:      	<unknown>
    a8a8:      	fnmls	z4.h, p1/m, z11.h, z20.h
    a8ac:      	umin	v18.8h, v11.8h, v9.8h
    a8b0:      	<unknown>
    a8b4:      	<unknown>
    a8b8:      	<unknown>
    a8bc:      	<unknown>
    a8c0:      	bic	w0, w25, w14, lsr #27
    a8c4:      	<unknown>
    a8c8:      	umlsl2	v0.4s, v25.8h, v12.h[2]
    a8cc:      	ands	w3, w27, #0x7ffffff
    a8d0:      	ldpsw	x5, x27, [x11, #-0xf8]
    a8d4:      	<unknown>
    a8d8:      	ldnp	d14, d24, [x11, #-0x1e0]
    a8dc:      	<unknown>
    a8e0:      	<unknown>
    a8e4:      	eor	w1, w19, #0x7
    a8e8:      	<unknown>
    a8ec:      	<unknown>
    a8f0:      	<unknown>
    a8f4:      	<unknown>
    a8f8:      	<unknown>
    a8fc:      	<unknown>
    a900:      	bfdot	z20.s, z27.h, z7.h[1]
    a904:      	str	b5, [x3, #0x848]
    a908:      	<unknown>
    a90c:      	<unknown>
    a910:      	adr	x10, 0x4ae35
    a914:      	ldpsw	x9, x0, [x1, #0x30]
    a918:      	<unknown>
    a91c:      	<unknown>
    a920:      	stnp	w29, w8, [x1, #-0xc0]
    a924:      	<unknown>
    a928:      	<unknown>
    a92c:      	cmla	z16.b, z9.b, z0.b, #180
    a930:      	<unknown>
    a934:      	ldpsw	x9, x28, [x3, #-0x60]
    a938:      	<unknown>
    a93c:      	stnp	w29, w8, [x1, #-0xc0]
    a940:      	<unknown>
    a944:      	<unknown>
    a948:      	st1	{ v16.4s, v17.4s, v18.4s, v19.4s }, [x9]
    a94c:      	smin	v9.8h, v19.8h, v5.8h
    a950:      	fnmls	z21.h, p3/m, z11.h, z2.h
    a954:      	str	b18, [x3, #0x848]
    a958:      	<unknown>
    a95c:      	<unknown>
    a960:      	adr	x10, 0x4ae85
    a964:      	<unknown>
    a968:      	<unknown>
    a96c:      	ldnp	d5, d29, [x19, #-0x1b0]
    a970:      	<unknown>
    a974:      	umlal2	v8.4s, v1.8h, v6.h[7]
    a978:      	orn	w9, w3, w0, lsl #25
    a97c:      	stp	w9, w8, [x1, #-0x80]
    a980:      	<unknown>
    a984:      	<unknown>
    a988:      	stnp	w1, w15, [x9, #-0x100]
    a98c:      	ldpsw	x8, x29, [x17, #-0x88]
    a990:      	stp	w4, w8, [x3, #-0xb0]
    a994:      	<unknown>
    a998:      	ldpsw	x4, x25, [x10, #-0x50]
    a99c:      	<unknown>
    a9a0:      	<unknown>
    a9a4:      	stnp	w29, w8, [x1, #-0xc0]
    a9a8:      	<unknown>
    a9ac:      	<unknown>
    a9b0:      	<unknown>
    a9b4:      	uabd	v24.8h, v3.8h, v5.8h
    a9b8:      	<unknown>
    a9bc:      	<unknown>
    a9c0:      	stnp	w1, w15, [x9, #-0x100]
    a9c4:      	ldpsw	x8, x29, [x17, #-0x88]
    a9c8:      	stp	w4, w8, [x3, #-0xb0]
    a9cc:      	<unknown>
    a9d0:      	fnmls	z5.h, p6/m, z2.h, z20.h
    a9d4:      	<unknown>
    a9d8:      	<unknown>
    a9dc:      	fnmls	z19.h, p2/m, z10.h, z26.h
    a9e0:      	<unknown>
    a9e4:      	stnp	w16, w0, [x1, #-0xf8]
    a9e8:      	<unknown>
    a9ec:      	fnmls	z5.h, p3/m, z19.h, z4.h
    a9f0:      	<unknown>
    a9f4:      	str	b1, [x3, #0xf48]
    a9f8:      	<unknown>
    a9fc:      	<unknown>
    aa00:      	adr	x10, 0x4af25
    aa04:      	<unknown>
    aa08:      	sqshrnb	z6.b, z1.h, #0x8
    aa0c:      	uabd	v24.8h, v3.8h, v5.8h
    aa10:      	<unknown>
    aa14:      	<unknown>
    aa18:      	<unknown>
    aa1c:      	adr	x1, 0x4b1c1
    aa20:      	<unknown>
    aa24:      	ldtrh	w8, [x1, #0x52]
    aa28:      	<unknown>
    aa2c:      	<unknown>
    aa30:      	<unknown>
    aa34:      	stnp	w29, w8, [x1, #-0xc0]
    aa38:      	<unknown>
    aa3c:      	<unknown>
    aa40:      	<unknown>
    aa44:      	stnp	w6, w9, [x17, #-0x100]
    aa48:      	fnmls	z5.h, p6/m, z2.h, z20.h
    aa4c:      	<unknown>
    aa50:      	<unknown>
    aa54:      	fnmls	z19.h, p2/m, z10.h, z26.h
    aa58:      	<unknown>
    aa5c:      	<unknown>
    aa60:      	<unknown>
    aa64:      	<unknown>
    aa68:      	<unknown>
    aa6c:      	fnmls	z5.h, p6/m, z3.h, z20.h
    aa70:      	<unknown>
    aa74:      	<unknown>
    aa78:      	<unknown>
    aa7c:      	uqshl	v0.2d, v1.2d, #0x2f
    aa80:      	<unknown>
    aa84:      	<unknown>
    aa88:      	fmls	z15.h, p0/m, z3.h, z2.h
    aa8c:      	adr	x0, 0xd58d3
    aa90:      	fnmls	z15.h, p4/m, z19.h, z20.h
    aa94:      	<unknown>
    aa98:      	<unknown>
    aa9c:      	<unknown>
    aaa0:      	<unknown>
    aaa4:      	<unknown>
    aaa8:      	<unknown>
    aaac:      	<unknown>
    aab0:      	<unknown>
    aab4:      	<unknown>
    aab8:      	umlal2	v8.4s, v1.8h, v6.h[7]
    aabc:      	orn	w9, w3, w0, lsl #25
    aac0:      	stp	w9, w8, [x1, #-0x80]
    aac4:      	<unknown>
    aac8:      	<unknown>
    aacc:      	<unknown>
    aad0:      	stnp	w1, w15, [x9, #-0x100]
    aad4:      	ldpsw	x8, x29, [x17, #-0x88]
    aad8:      	stp	w4, w8, [x3, #-0xb0]
    aadc:      	<unknown>
    aae0:      	<unknown>
    aae4:      	str	b17, [x1, #0x848]
    aae8:      	<unknown>
    aaec:      	<unknown>
    aaf0:      	adr	x10, 0x4b015
    aaf4:      	<unknown>
    aaf8:      	<unknown>
    aafc:      	stnp	w1, w15, [x9, #-0x100]
    ab00:      	ldpsw	x8, x29, [x17, #-0x88]
    ab04:      	stp	w4, w8, [x3, #-0xb0]
    ab08:      	<unknown>
    ab0c:      	<unknown>
    ab10:      	ldp	w14, w21, [x2, #0x70]
    ab14:      	<unknown>
    ab18:      	<unknown>
    ab1c:      	ldpsw	x0, x10, [x1, #-0x68]
    ab20:      	<unknown>
    ab24:      	<unknown>
    ab28:      	<unknown>
    ab2c:      	<unknown>
    ab30:      	stp	s17, s10, [x9, #-0x100]
    ab34:      	stp	w0, w12, [x9, #-0xb8]
    ab38:      	<unknown>
    ab3c:      	fadd	z16.h, z1.h, z12.h
    ab40:      	<unknown>
    ab44:      	<unknown>
    ab48:      	<unknown>
    ab4c:      	<unknown>
    ab50:      	<unknown>
    ab54:      	<unknown>
    ab58:      	<unknown>
    ab5c:      	stp	s12, s19, [x2, #-0x100]
    ab60:      	<unknown>
    ab64:      	ldp	w14, w21, [x2, #0x70]
    ab68:      	<unknown>
    ab6c:      	adds	w5, w19, w0, uxtx #4
    ab70:      	<unknown>
    ab74:      	uqshl	v8.8h, v1.8h, v5.8h
    ab78:      	<unknown>
    ab7c:      	<unknown>
    ab80:      	fcmla	v9.8h, v19.8h, v5.h[3], #270
    ab84:      	orn	w6, w3, w8, lsl #8
    ab88:      	<unknown>
    ab8c:      	ldp	w16, w29, [x2, #-0x70]
    ab90:      	adds	w0, w9, #0x80b
    ab94:      	str	b9, [x9, #0x80a]
    ab98:      	<unknown>
    ab9c:      	sqshlu	v26.2d, v10.2d, #0x32
    aba0:      	<unknown>
    aba4:      	adr	x18, 0xeb7d3
    aba8:      	<unknown>
    abac:      	<unknown>
    abb0:      	fnmls	z21.h, p1/m, z19.h, z6.h
    abb4:      	str	b18, [x3, #0xf48]
    abb8:      	<unknown>
    abbc:      	<unknown>
    abc0:      	adr	x10, 0x4b0e5
    abc4:      	<unknown>
    abc8:      	uqshl	v0.8h, v1.8h, v5.8h
    abcc:      	<unknown>
    abd0:      	stp	w30, w8, [x1, #-0x80]
    abd4:      	adr	x0, 0xe9437
    abd8:      	ldp	d25, d19, [x11, #-0x1b0]
    abdc:      	adr	x23, 0xcda27
    abe0:      	umax	v16.4h, v11.4h, v18.4h
    abe4:      	<unknown>
    abe8:      	<unknown>
    abec:      	<unknown>
    abf0:      	<unknown>
    abf4:      	adr	x29, 0x5aff9
    abf8:      	<unknown>
    abfc:      	<unknown>
    ac00:      	<unknown>
    ac04:      	<unknown>
    ac08:      	<unknown>
    ac0c:      	stnp	w0, w11, [x9, #-0x100]
    ac10:      	bc.pl	0xa7538
    ac14:      	fmaxnmv	h14, p2, z10.h
    ac18:      	uabd	v19.8h, v3.8h, v9.8h
    ac1c:      	uqshl	v1.2d, v3.2d, #0x29
    ac20:      	<unknown>
    ac24:      	ldp	w6, w25, [x11, #-0x70]
    ac28:      	<unknown>
    ac2c:      	<unknown>
    ac30:      	adds	w0, w9, #0x80b
    ac34:      	str	b9, [x1, #0xf08]
    ac38:      	<unknown>
    ac3c:      	<unknown>
    ac40:      	<unknown>
    ac44:      	<unknown>
    ac48:      	<unknown>
    ac4c:      	<unknown>
    ac50:      	<unknown>
    ac54:      	<unknown>
    ac58:      	<unknown>
    ac5c:      	<unknown>
    ac60:      	fnmls	z21.h, p1/m, z19.h, z6.h
    ac64:      	st3	{ v18.b, v19.b, v20.b }[10], [x11]
    ac68:      	<unknown>
    ac6c:      	ldnp	d25, d16, [x11, #-0x140]
    ac70:      	<unknown>
    ac74:      	<unknown>
    ac78:      	<unknown>
    ac7c:      	<unknown>
    ac80:      	<unknown>
    ac84:      	<unknown>
    ac88:      	ldpsw	x8, x16, [x9, #-0xa0]
    ac8c:      	fnmls	z7.h, p3/m, z19.h, z13.h
    ac90:      	<unknown>
    ac94:      	ldnp	d0, d10, [x1, #0x10]
    ac98:      	ldp	d9, d25, [x27, #-0x120]
    ac9c:      	<unknown>
    aca0:      	stp	w13, w8, [x1, #-0x78]
    aca4:      	str	b9, [x1, #0xf48]
    aca8:      	eor	w0, w1, #0x1fff
    acac:      	adr	x5, 0xe38da
    acb0:      	<unknown>
    acb4:      	adr	x0, 0x4b47a
    acb8:      	<unknown>
    acbc:      	ldnp	d0, d16, [x8, #-0x140]
    acc0:      	<unknown>
    acc4:      	<unknown>
    acc8:      	<unknown>
    accc:      	stnp	w28, w15, [x9, #-0x100]
    acd0:      	<unknown>
    acd4:      	<unknown>
    acd8:      	<unknown>
    acdc:      	<unknown>
    ace0:      	<unknown>
    ace4:      	<unknown>
    ace8:      	<unknown>
    acec:      	<unknown>
    acf0:      	<unknown>
    acf4:      	adds	w5, w19, w0, uxtx #4
    acf8:      	<unknown>
    acfc:      	<unknown>
    ad00:      	<unknown>
    ad04:      	<unknown>
    ad08:      	fmls	z20.h, p0/m, z3.h, z18.h
    ad0c:      	ldpsw	x13, x26, [x9, #-0x90]
    ad10:      	ldnp	d20, d26, [x11, #-0x1f0]
    ad14:      	<unknown>
    ad18:      	<unknown>
    ad1c:      	<unknown>
    ad20:      	<unknown>
    ad24:      	<unknown>
    ad28:      	fnmls	z15.h, p3/m, z19.h, z13.h
    ad2c:      	<unknown>
    ad30:      	<unknown>
    ad34:      	<unknown>
    ad38:      	<unknown>
    ad3c:      	<unknown>
    ad40:      	<unknown>
    ad44:      	<unknown>
    ad48:      	<unknown>
    ad4c:      	<unknown>
    ad50:      	<unknown>
    ad54:      	<unknown>
    ad58:      	<unknown>
    ad5c:      	<unknown>
    ad60:      	<unknown>
    ad64:      	<unknown>
    ad68:      	fadd	z18.h, z3.h, z19.h
    ad6c:      	ldnp	d18, d26, [x11, #-0x1f0]
    ad70:      	<unknown>
    ad74:      	<unknown>
    ad78:      	<unknown>
    ad7c:      	<unknown>
    ad80:      	adr	x14, 0xcdb8a
    ad84:      	<unknown>
    ad88:      	<unknown>
    ad8c:      	ldnp	d6, d24, [x11, #-0x170]
    ad90:      	psel	p5, p9, p3.h[w14, 1]
    ad94:      	<unknown>
    ad98:      	<unknown>
    ad9c:      	uabdl	v1.4s, v18.4h, v13.4h
    ada0:      	<unknown>
    ada4:      	fnmls	z4.h, p1/m, z3.h, z18.h
    ada8:      	<unknown>
    adac:      	<unknown>
    adb0:      	adr	x29, 0x4b555
    adb4:      	fcmla	z0.h, p2/m, z0.h, z1.h, #90
    adb8:      	<unknown>
    adbc:      	<unknown>
    adc0:      	str	b19, [x9, #0x80a]
    adc4:      	<unknown>
    adc8:      	bfdot	z8.s, z9.h, z4.h[0]
    adcc:      	<unknown>
    add0:      	tbnz	w0, #0x4, 0xb294 <.text+0xa294>
    add4:      	str	b9, [x1, #0xf48]
    add8:      	udf	#0x3020
    addc:      	udf	#0x0
    ade0:      	udf	#0x7ce0
    ade4:      	udf	#0x0
    ade8:      	udf	#0x7ce8
    adec:      	udf	#0x0
    adf0:      	udf	#0x7cf0
    adf4:      	udf	#0x0
    adf8:      	udf	#0x7cf8
    adfc:      	udf	#0x0
    ae00:      	udf	#0x7d00
    ae04:      	udf	#0x0
    ae08:      	udf	#0x7d08
    ae0c:      	udf	#0x0
    ae10:      	udf	#0x7d10
    ae14:      	udf	#0x0
    ae18:      	udf	#0x7d18
    ae1c:      	udf	#0x0
    ae20:      	udf	#0x7d20
    ae24:      	udf	#0x0
    ae28:      	udf	#0x7d28
    ae2c:      	udf	#0x0
    ae30:      	udf	#0x7d30
    ae34:      	udf	#0x0
    ae38:      	udf	#0x7c80
    ae3c:      	udf	#0x0
    ae40:      	udf	#0x7c80
    ae44:      	udf	#0x0
    ae48:      	udf	#0x7c80
    ae4c:      	udf	#0x0
    ae50:      	udf	#0x7c80
    ae54:      	udf	#0x0
    ae58:      	<unknown>
    ae5c:      	ldpsw	x18, x25, [x11, #-0xc8]
    ae60:      	<unknown>
    ae64:      	<unknown>
    ae68:      	<unknown>
    ae6c:      	<unknown>
    ae70:      	<unknown>
    ae74:      	<unknown>
    ae78:      	umlsl2	v22.4s, v11.8h, v3.h[7]
    ae7c:      	umlal2	v18.4s, v3.8h, v13.h[0]
    ae80:      	<unknown>
    ae84:      	<unknown>
    ae88:      	fmls	z20.h, p0/m, z3.h, z16.h
    ae8c:      	<unknown>
    ae90:      	fmls	z13.h, p0/m, z3.h, z18.h
    ae94:      	<unknown>
    ae98:      	<unknown>
    ae9c:      	<unknown>
    aea0:      	uqshl	v1.2d, v3.2d, #0x29
    aea4:      	<unknown>
    aea8:      	umin	v21.8h, v18.8h, v11.8h
    aeac:      	<unknown>
    aeb0:      	<unknown>
    aeb4:      	fnmls	z7.h, p1/m, z10.h, z14.h
    aeb8:      	<unknown>
    aebc:      	fnmls	z20.h, p2/m, z10.h, z13.h
    aec0:      	fmls	z18.h, p0/m, z3.h, z18.h
    aec4:      	<unknown>
    aec8:      	<unknown>
    aecc:      	bic	w24, w19, w0, lsl #11
    aed0:      	<unknown>
    aed4:      	adr	x20, 0xe5b83
    aed8:      	umlal2	v20.4s, v3.8h, v4.h[3]
    aedc:      	<unknown>
    aee0:      	<unknown>
    aee4:      	fminv	h13, p0, z2.h
    aee8:      	ldpsw	x14, x25, [x11, #-0x70]
    aeec:      	ldpsw	x3, x8, [x3, #0xa0]
    aef0:      	<unknown>
    aef4:      	ldpsw	x18, x25, [x11, #-0xc8]
    aef8:      	<unknown>
    aefc:      	<unknown>
    af00:      	<unknown>
    af04:      	<unknown>
    af08:      	<unknown>
    af0c:      	b.ls	0x4bb78
    af10:      	<unknown>
    af14:      	<unknown>
    af18:      	ldpsw	x5, x27, [x19, #-0x68]
    af1c:      	stgp	x15, x27, [x19, #-0x400]
    af20:      	umlal2	v19.4s, v3.8h, v14.h[2]
    af24:      	ldp	d20, d8, [x3, #-0x170]
    af28:      	ldp	d16, d27, [x3, #-0x1b0]
    af2c:      	fnmls	z5.h, p3/m, z19.h, z20.h
    af30:      	<unknown>
    af34:      	<unknown>
    af38:      	cbz	w3, 0x77c44
    af3c:      	<unknown>
    af40:      	fnmls	z20.h, p2/m, z10.h, z13.h
    af44:      	<unknown>
    af48:      	<unknown>
    af4c:      	<unknown>
    af50:      	<unknown>
    af54:      	eor	w20, w27, #0xfffffff
    af58:      	<unknown>
    af5c:      	ldrh	w15, [x18, #0x1636]
    af60:      	<unknown>
    af64:      	fnmls	z9.h, p4/m, z27.h, z20.h
    af68:      	<unknown>
    af6c:      	<unknown>
    af70:      	<unknown>
    af74:      	<unknown>
    af78:      	<unknown>
    af7c:      	<unknown>
    af80:      	eor	w20, w27, #0xfffffff
    af84:      	<unknown>
    af88:      	ldrh	w15, [x18, #0x1636]
    af8c:      	<unknown>
    af90:      	fnmls	z9.h, p4/m, z27.h, z20.h
    af94:      	<unknown>
    af98:      	<unknown>
    af9c:      	<unknown>
    afa0:      	fnmls	z1.h, p5/m, z2.h, z20.h
    afa4:      	<unknown>
    afa8:      	<unknown>
    afac:      	fnmls	z18.h, p2/m, z11.h, z20.h
    afb0:      	<unknown>
    afb4:      	<unknown>
    afb8:      	fnmls	z7.h, p1/m, z10.h, z14.h
    afbc:      	<unknown>
    afc0:      	fnmls	z20.h, p2/m, z10.h, z13.h
    afc4:      	fmls	z18.h, p0/m, z3.h, z18.h
    afc8:      	<unknown>
    afcc:      	uabdl	v5.4s, v19.4h, v19.4h
    afd0:      	<unknown>
    afd4:      	<unknown>
    afd8:      	ushl	v0.8h, v25.8h, v5.8h
    afdc:      	<unknown>
    afe0:      	ldp	d0, d21, [x1, #-0x170]
    afe4:      	<unknown>
    afe8:      	uabd	v24.8h, v3.8h, v5.8h
    afec:      	<unknown>
    aff0:      	<unknown>
    aff4:      	<unknown>
    aff8:      	ldnp	d9, d27, [x11, #-0x100]
    affc:      	umin	v5.8h, v11.8h, v5.8h
    b000:      	<unknown>
    b004:      	udf	#0x200a
		...
