
UsbDeviceDxe.efi:	file format coff-arm64

Disassembly of section .text:

0000000000001000 <.text>:
    1000:      	stp	x20, x19, [sp, #-0x20]!
    1004:      	stp	x29, x30, [sp, #0x10]
    1008:      	add	x29, sp, #0x10
    100c:      	mov	x20, x0
    1010:      	bl	0x1470 <.text+0x470>
    1014:      	mov	x19, x0
    1018:      	tbnz	x19, #0x3f, 0x102c <.text+0x2c>
    101c:      	adrp	x8, 0xa000
    1020:      	mov	x0, x20
    1024:      	ldr	x1, [x8, #0x450]
    1028:      	bl	0x13cc <.text+0x3cc>
    102c:      	ldp	x29, x30, [sp, #0x10]
    1030:      	mov	x0, x19
    1034:      	ldp	x20, x19, [sp], #0x20
    1038:      	ret
    103c:      	stp	x22, x21, [sp, #-0x30]!
    1040:      	stp	x20, x19, [sp, #0x10]
    1044:      	stp	x29, x30, [sp, #0x20]
    1048:      	add	x29, sp, #0x20
    104c:      	sub	sp, sp, #0x10
    1050:      	adrp	x8, 0x6000 <.text+0x5000>
    1054:      	mov	x19, x1
    1058:      	mov	x20, x0
    105c:      	ldr	w8, [x8, #0x4c8]
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
    1088:      	adrp	x9, 0x6000 <.text+0x5000>
    108c:      	ldrb	w11, [x9, #0x4cc]
    1090:      	cbz	w11, 0x10f8 <.text+0xf8>
    1094:      	adrp	x10, 0xa000
    1098:      	adrp	x1, 0xa000
    109c:      	add	x1, x1, #0xc0
    10a0:      	ldr	x11, [x10, #0x458]
    10a4:      	add	x2, sp, #0x8
    10a8:      	mov	x0, x20
    10ac:      	ldr	x9, [x11, #0x98]
    10b0:      	blr	x9
    10b4:      	mov	x8, x0
    10b8:      	tbz	x8, #0x3f, 0x10e8 <.text+0xe8>
    10bc:      	adrp	x1, 0x6000 <.text+0x5000>
    10c0:      	add	x1, x1, #0x454
    10c4:      	orr	w0, wzr, #0x80000000
    10c8:      	mov	x2, x8
    10cc:      	bl	0x4674 <.text+0x3674>
    10d0:      	adrp	x0, 0x6000 <.text+0x5000>
    10d4:      	adrp	x2, 0x6000 <.text+0x5000>
    10d8:      	add	x0, x0, #0x475
    10dc:      	add	x2, x2, #0x488
    10e0:      	orr	w1, wzr, #0x7e
    10e4:      	bl	0x4a00 <.text+0x3a00>
    10e8:      	ldr	x12, [sp, #0x8]
    10ec:      	adrp	x10, 0x1000 <.text>
    10f0:      	add	x10, x10, #0x0
    10f4:      	str	x10, [x12, #0x58]
    10f8:      	mov	x0, x20
    10fc:      	mov	x1, x19
    1100:      	bl	0x146c <.text+0x46c>
    1104:      	mov	x21, x0
    1108:      	tbz	x21, #0x3f, 0x1118 <.text+0x118>
    110c:      	mov	x0, x20
    1110:      	mov	x1, x19
    1114:      	bl	0x13cc <.text+0x3cc>
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
    1168:      	bl	0x5d54 <.text+0x4d54>
    116c:      	adrp	x8, 0xa000
    1170:      	str	x0, [x8]
    1174:      	ldp	x29, x30, [sp], #0x10
    1178:      	ret
    117c:      	stp	x20, x19, [sp, #-0x20]!
    1180:      	stp	x29, x30, [sp, #0x10]
    1184:      	add	x29, sp, #0x10
    1188:      	mov	x19, x1
    118c:      	mov	x20, x0
    1190:      	bl	0x551c <.text+0x451c>
    1194:      	mov	x8, x0
    1198:      	tbz	x8, #0x3f, 0x11c8 <.text+0x1c8>
    119c:      	adrp	x1, 0x6000 <.text+0x5000>
    11a0:      	add	x1, x1, #0x454
    11a4:      	orr	w0, wzr, #0x80000000
    11a8:      	mov	x2, x8
    11ac:      	bl	0x4674 <.text+0x3674>
    11b0:      	adrp	x0, 0x6000 <.text+0x5000>
    11b4:      	adrp	x2, 0x6000 <.text+0x5000>
    11b8:      	add	x0, x0, #0x4a9
    11bc:      	mov	w1, #0x1cd              // =461
    11c0:      	add	x2, x2, #0x488
    11c4:      	bl	0x4a00 <.text+0x3a00>
    11c8:      	mov	x0, x20
    11cc:      	mov	x1, x19
    11d0:      	bl	0x5688 <.text+0x4688>
    11d4:      	mov	x9, x0
    11d8:      	tbz	x9, #0x3f, 0x1208 <.text+0x208>
    11dc:      	adrp	x1, 0x6000 <.text+0x5000>
    11e0:      	add	x1, x1, #0x454
    11e4:      	orr	w0, wzr, #0x80000000
    11e8:      	mov	x2, x9
    11ec:      	bl	0x4674 <.text+0x3674>
    11f0:      	adrp	x0, 0x6000 <.text+0x5000>
    11f4:      	adrp	x2, 0x6000 <.text+0x5000>
    11f8:      	add	x0, x0, #0x4a9
    11fc:      	mov	w1, #0x1d0              // =464
    1200:      	add	x2, x2, #0x488
    1204:      	bl	0x4a00 <.text+0x3a00>
    1208:      	mov	x0, x20
    120c:      	mov	x1, x19
    1210:      	bl	0x568c <.text+0x468c>
    1214:      	mov	x10, x0
    1218:      	tbz	x10, #0x3f, 0x1248 <.text+0x248>
    121c:      	adrp	x1, 0x6000 <.text+0x5000>
    1220:      	add	x1, x1, #0x454
    1224:      	orr	w0, wzr, #0x80000000
    1228:      	mov	x2, x10
    122c:      	bl	0x4674 <.text+0x3674>
    1230:      	adrp	x0, 0x6000 <.text+0x5000>
    1234:      	adrp	x2, 0x6000 <.text+0x5000>
    1238:      	add	x0, x0, #0x4a9
    123c:      	mov	w1, #0x1d3              // =467
    1240:      	add	x2, x2, #0x488
    1244:      	bl	0x4a00 <.text+0x3a00>
    1248:      	mov	x0, x20
    124c:      	mov	x1, x19
    1250:      	bl	0x56cc <.text+0x46cc>
    1254:      	mov	x11, x0
    1258:      	tbz	x11, #0x3f, 0x1288 <.text+0x288>
    125c:      	adrp	x1, 0x6000 <.text+0x5000>
    1260:      	add	x1, x1, #0x454
    1264:      	orr	w0, wzr, #0x80000000
    1268:      	mov	x2, x11
    126c:      	bl	0x4674 <.text+0x3674>
    1270:      	adrp	x0, 0x6000 <.text+0x5000>
    1274:      	adrp	x2, 0x6000 <.text+0x5000>
    1278:      	add	x0, x0, #0x4a9
    127c:      	mov	w1, #0x1d6              // =470
    1280:      	add	x2, x2, #0x488
    1284:      	bl	0x4a00 <.text+0x3a00>
    1288:      	mov	x0, x20
    128c:      	mov	x1, x19
    1290:      	bl	0x57b0 <.text+0x47b0>
    1294:      	mov	x12, x0
    1298:      	tbz	x12, #0x3f, 0x12c8 <.text+0x2c8>
    129c:      	adrp	x1, 0x6000 <.text+0x5000>
    12a0:      	add	x1, x1, #0x454
    12a4:      	orr	w0, wzr, #0x80000000
    12a8:      	mov	x2, x12
    12ac:      	bl	0x4674 <.text+0x3674>
    12b0:      	adrp	x0, 0x6000 <.text+0x5000>
    12b4:      	adrp	x2, 0x6000 <.text+0x5000>
    12b8:      	add	x0, x0, #0x4a9
    12bc:      	mov	w1, #0x1d9              // =473
    12c0:      	add	x2, x2, #0x488
    12c4:      	bl	0x4a00 <.text+0x3a00>
    12c8:      	mov	x0, x20
    12cc:      	mov	x1, x19
    12d0:      	bl	0x598c <.text+0x498c>
    12d4:      	mov	x13, x0
    12d8:      	tbz	x13, #0x3f, 0x1308 <.text+0x308>
    12dc:      	adrp	x1, 0x6000 <.text+0x5000>
    12e0:      	add	x1, x1, #0x454
    12e4:      	orr	w0, wzr, #0x80000000
    12e8:      	mov	x2, x13
    12ec:      	bl	0x4674 <.text+0x3674>
    12f0:      	adrp	x0, 0x6000 <.text+0x5000>
    12f4:      	adrp	x2, 0x6000 <.text+0x5000>
    12f8:      	add	x0, x0, #0x4a9
    12fc:      	mov	w1, #0x1dc              // =476
    1300:      	add	x2, x2, #0x488
    1304:      	bl	0x4a00 <.text+0x3a00>
    1308:      	bl	0x5b38 <.text+0x4b38>
    130c:      	mov	x14, x0
    1310:      	tbz	x14, #0x3f, 0x1340 <.text+0x340>
    1314:      	adrp	x1, 0x6000 <.text+0x5000>
    1318:      	add	x1, x1, #0x454
    131c:      	orr	w0, wzr, #0x80000000
    1320:      	mov	x2, x14
    1324:      	bl	0x4674 <.text+0x3674>
    1328:      	adrp	x0, 0x6000 <.text+0x5000>
    132c:      	adrp	x2, 0x6000 <.text+0x5000>
    1330:      	add	x0, x0, #0x4a9
    1334:      	mov	w1, #0x1df              // =479
    1338:      	add	x2, x2, #0x488
    133c:      	bl	0x4a00 <.text+0x3a00>
    1340:      	mov	x0, x20
    1344:      	mov	x1, x19
    1348:      	bl	0x5bdc <.text+0x4bdc>
    134c:      	mov	x15, x0
    1350:      	tbz	x15, #0x3f, 0x1380 <.text+0x380>
    1354:      	adrp	x1, 0x6000 <.text+0x5000>
    1358:      	add	x1, x1, #0x454
    135c:      	orr	w0, wzr, #0x80000000
    1360:      	mov	x2, x15
    1364:      	bl	0x4674 <.text+0x3674>
    1368:      	adrp	x0, 0x6000 <.text+0x5000>
    136c:      	adrp	x2, 0x6000 <.text+0x5000>
    1370:      	add	x0, x0, #0x4a9
    1374:      	mov	w1, #0x1e2              // =482
    1378:      	add	x2, x2, #0x488
    137c:      	bl	0x4a00 <.text+0x3a00>
    1380:      	bl	0x5c68 <.text+0x4c68>
    1384:      	mov	x16, x0
    1388:      	tbnz	x16, #0x3f, 0x1398 <.text+0x398>
    138c:      	ldp	x29, x30, [sp, #0x10]
    1390:      	ldp	x20, x19, [sp], #0x20
    1394:      	ret
    1398:      	adrp	x1, 0x6000 <.text+0x5000>
    139c:      	add	x1, x1, #0x454
    13a0:      	orr	w0, wzr, #0x80000000
    13a4:      	mov	x2, x16
    13a8:      	bl	0x4674 <.text+0x3674>
    13ac:      	ldp	x29, x30, [sp, #0x10]
    13b0:      	adrp	x0, 0x6000 <.text+0x5000>
    13b4:      	adrp	x2, 0x6000 <.text+0x5000>
    13b8:      	add	x0, x0, #0x4a9
    13bc:      	mov	w1, #0x1e5              // =485
    13c0:      	add	x2, x2, #0x488
    13c4:      	ldp	x20, x19, [sp], #0x20
    13c8:      	b	0x4a00 <.text+0x3a00>
    13cc:      	stp	x20, x19, [sp, #-0x20]!
    13d0:      	stp	x29, x30, [sp, #0x10]
    13d4:      	add	x29, sp, #0x10
    13d8:      	mov	x19, x1
    13dc:      	mov	x20, x0
    13e0:      	bl	0x5b18 <.text+0x4b18>
    13e4:      	mov	x8, x0
    13e8:      	tbz	x8, #0x3f, 0x1418 <.text+0x418>
    13ec:      	adrp	x1, 0x6000 <.text+0x5000>
    13f0:      	add	x1, x1, #0x454
    13f4:      	orr	w0, wzr, #0x80000000
    13f8:      	mov	x2, x8
    13fc:      	bl	0x4674 <.text+0x3674>
    1400:      	adrp	x0, 0x6000 <.text+0x5000>
    1404:      	adrp	x2, 0x6000 <.text+0x5000>
    1408:      	add	x0, x0, #0x4a9
    140c:      	mov	w1, #0x203              // =515
    1410:      	add	x2, x2, #0x488
    1414:      	bl	0x4a00 <.text+0x3a00>
    1418:      	mov	x0, x20
    141c:      	mov	x1, x19
    1420:      	bl	0x43e8 <.text+0x33e8>
    1424:      	mov	x9, x0
    1428:      	tbnz	x9, #0x3f, 0x1438 <.text+0x438>
    142c:      	ldp	x29, x30, [sp, #0x10]
    1430:      	ldp	x20, x19, [sp], #0x20
    1434:      	ret
    1438:      	adrp	x1, 0x6000 <.text+0x5000>
    143c:      	add	x1, x1, #0x454
    1440:      	orr	w0, wzr, #0x80000000
    1444:      	mov	x2, x9
    1448:      	bl	0x4674 <.text+0x3674>
    144c:      	ldp	x29, x30, [sp, #0x10]
    1450:      	adrp	x0, 0x6000 <.text+0x5000>
    1454:      	adrp	x2, 0x6000 <.text+0x5000>
    1458:      	add	x0, x0, #0x4a9
    145c:      	mov	w1, #0x206              // =518
    1460:      	add	x2, x2, #0x488
    1464:      	ldp	x20, x19, [sp], #0x20
    1468:      	b	0x4a00 <.text+0x3a00>
    146c:      	b	0x1f98 <.text+0xf98>
    1470:      	mov	x0, xzr
    1474:      	ret
    1478:      	stp	x28, x27, [sp, #-0x60]!
    147c:      	stp	x26, x25, [sp, #0x10]
    1480:      	stp	x24, x23, [sp, #0x20]
    1484:      	stp	x22, x21, [sp, #0x30]
    1488:      	stp	x20, x19, [sp, #0x40]
    148c:      	stp	x29, x30, [sp, #0x50]
    1490:      	add	x29, sp, #0x50
    1494:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1498:      	mov	x20, x5
    149c:      	mov	w21, w4
    14a0:      	mov	x22, x3
    14a4:      	mov	x23, x2
    14a8:      	mov	x24, x1
    14ac:      	mov	x25, x0
    14b0:      	movk	x19, #0x2
    14b4:      	cbz	x25, 0x15ac <.text+0x5ac>
    14b8:      	cbz	x24, 0x15ac <.text+0x5ac>
    14bc:      	cbz	x23, 0x15ac <.text+0x5ac>
    14c0:      	and	w8, w21, #0xff
    14c4:      	cbz	w8, 0x14cc <.text+0x4cc>
    14c8:      	cbz	x20, 0x15ac <.text+0x5ac>
    14cc:      	bl	0x1f1c <.text+0xf1c>
    14d0:      	mov	x19, x0
    14d4:      	tbnz	x19, #0x3f, 0x15ac <.text+0x5ac>
    14d8:      	adrp	x27, 0xa000
    14dc:      	ldr	x0, [x27, #0x410]
    14e0:      	ldr	x8, [x0, #0x78]
    14e4:      	blr	x8
    14e8:      	mov	x19, x0
    14ec:      	tbnz	x19, #0x3f, 0x15ac <.text+0x5ac>
    14f0:      	ldr	x0, [x27, #0x410]
    14f4:      	ldr	x9, [x0, #0x70]
    14f8:      	blr	x9
    14fc:      	mov	x19, x0
    1500:      	tbnz	x19, #0x3f, 0x1578 <.text+0x578>
    1504:      	adrp	x26, 0xa000
    1508:      	adrp	x8, 0xa000
    150c:      	add	x26, x26, #0x410
    1510:      	add	x8, x8, #0x140
    1514:      	add	x6, x26, #0x8
    1518:      	add	x7, x8, #0x238
    151c:      	mov	x0, x25
    1520:      	mov	x1, x24
    1524:      	mov	x2, x23
    1528:      	mov	x3, x22
    152c:      	mov	w4, w21
    1530:      	mov	x5, x20
    1534:      	bl	0x3560 <.text+0x2560>
    1538:      	mov	x19, x0
    153c:      	tbnz	x19, #0x3f, 0x1584 <.text+0x584>
    1540:      	ldr	x0, [x27, #0x410]
    1544:      	mov	w1, wzr
    1548:      	bl	0x200c <.text+0x100c>
    154c:      	mov	x19, x0
    1550:      	tbnz	x19, #0x3f, 0x1590 <.text+0x590>
    1554:      	ldr	x0, [x26], #0x8
    1558:      	ldr	x10, [x0, #0x10]
    155c:      	mov	x1, x26
    1560:      	blr	x10
    1564:      	mov	x19, x0
    1568:      	tbz	x19, #0x3f, 0x15ac <.text+0x5ac>
    156c:      	adrp	x1, 0x6000 <.text+0x5000>
    1570:      	add	x1, x1, #0x77a
    1574:      	b	0x1598 <.text+0x598>
    1578:      	adrp	x1, 0x6000 <.text+0x5000>
    157c:      	add	x1, x1, #0x6eb
    1580:      	b	0x1598 <.text+0x598>
    1584:      	adrp	x1, 0x6000 <.text+0x5000>
    1588:      	add	x1, x1, #0x724
    158c:      	b	0x1598 <.text+0x598>
    1590:      	adrp	x1, 0x6000 <.text+0x5000>
    1594:      	add	x1, x1, #0x74e
    1598:      	adrp	x2, 0x6000 <.text+0x5000>
    159c:      	add	x2, x2, #0x7ac
    15a0:      	orr	w0, wzr, #0x80000000
    15a4:      	mov	x3, x19
    15a8:      	bl	0x4674 <.text+0x3674>
    15ac:      	mov	x0, x19
    15b0:      	ldp	x29, x30, [sp, #0x50]
    15b4:      	ldp	x20, x19, [sp, #0x40]
    15b8:      	ldp	x22, x21, [sp, #0x30]
    15bc:      	ldp	x24, x23, [sp, #0x20]
    15c0:      	ldp	x26, x25, [sp, #0x10]
    15c4:      	ldp	x28, x27, [sp], #0x60
    15c8:      	ret
    15cc:      	stp	x20, x19, [sp, #-0x20]!
    15d0:      	stp	x29, x30, [sp, #0x10]
    15d4:      	add	x29, sp, #0x10
    15d8:      	sub	sp, sp, #0x10
    15dc:      	adrp	x10, 0xa000
    15e0:      	str	x1, [sp, #0x8]
    15e4:      	mov	x8, x2
    15e8:      	and	w20, w0, #0xf
    15ec:      	ldr	x9, [x10, #0x410]
    15f0:      	ubfx	w2, w0, #7, #1
    15f4:      	add	x3, sp, #0x8
    15f8:      	mov	w1, w20
    15fc:      	mov	x4, x8
    1600:      	ldr	x10, [x9, #0x50]
    1604:      	mov	x0, x9
    1608:      	blr	x10
    160c:      	mov	x19, x0
    1610:      	tbnz	x19, #0x3f, 0x1630 <.text+0x630>
    1614:      	and	w8, w20, #0xff
    1618:      	cbnz	w8, 0x164c <.text+0x64c>
    161c:      	adrp	x11, 0xa000
    1620:      	orr	w8, wzr, #0x1
    1624:      	add	x11, x11, #0x140
    1628:      	strb	w8, [x11, #0x290]
    162c:      	b	0x164c <.text+0x64c>
    1630:      	adrp	x1, 0x6000 <.text+0x5000>
    1634:      	adrp	x2, 0x6000 <.text+0x5000>
    1638:      	add	x1, x1, #0x5f9
    163c:      	add	x2, x2, #0x621
    1640:      	orr	w0, wzr, #0x80000000
    1644:      	mov	x3, x19
    1648:      	bl	0x4674 <.text+0x3674>
    164c:      	mov	x0, x19
    1650:      	sub	sp, x29, #0x10
    1654:      	ldp	x29, x30, [sp, #0x10]
    1658:      	ldp	x20, x19, [sp], #0x20
    165c:      	ret
    1660:      	stp	x24, x23, [sp, #-0x40]!
    1664:      	stp	x22, x21, [sp, #0x10]
    1668:      	stp	x20, x19, [sp, #0x20]
    166c:      	stp	x29, x30, [sp, #0x30]
    1670:      	add	x29, sp, #0x30
    1674:      	sub	sp, sp, #0x30
    1678:      	mov	x19, x2
    167c:      	mov	x20, x1
    1680:      	mov	x21, x0
    1684:      	cbz	x21, 0x175c <.text+0x75c>
    1688:      	cbz	x20, 0x175c <.text+0x75c>
    168c:      	cbz	x19, 0x175c <.text+0x75c>
    1690:      	adrp	x8, 0xa000
    1694:      	str	wzr, [x21]
    1698:      	orr	w9, wzr, #0x20
    169c:      	add	x1, sp, #0x2c
    16a0:      	ldr	x0, [x8, #0x410]
    16a4:      	mov	x2, sp
    16a8:      	str	x9, [sp]
    16ac:      	add	x3, sp, #0x8
    16b0:      	ldr	x10, [x0, #0x48]
    16b4:      	blr	x10
    16b8:      	mov	x22, x0
    16bc:      	tbnz	x22, #0x3f, 0x1780 <.text+0x780>
    16c0:      	ldr	w0, [sp, #0x2c]
    16c4:      	cbz	w0, 0x17a8 <.text+0x7a8>
    16c8:      	ldr	x1, [sp]
    16cc:      	add	x2, sp, #0x8
    16d0:      	bl	0x2164 <.text+0x1164>
    16d4:      	mov	x22, x0
    16d8:      	tbnz	x22, #0x3f, 0x178c <.text+0x78c>
    16dc:      	ldr	w8, [sp, #0x2c]
    16e0:      	orr	w9, w8, #0x1
    16e4:      	cmp	w9, #0x3
    16e8:      	b.ne	0x17d8 <.text+0x7d8>
    16ec:      	adrp	x9, 0xa000
    16f0:      	ldrb	w10, [sp, #0x14]
    16f4:      	add	x9, x9, #0x140
    16f8:      	ldrb	w11, [x9, #0x290]
    16fc:      	orr	w12, w11, w10
    1700:      	cbz	w12, 0x17c4 <.text+0x7c4>
    1704:      	cbnz	w10, 0x1710 <.text+0x710>
    1708:      	cmp	w11, #0x1
    170c:      	b.ne	0x17d4 <.text+0x7d4>
    1710:      	ldr	w12, [sp, #0x18]
    1714:      	orr	w14, wzr, #0x2
    1718:      	orr	w13, wzr, #0x18
    171c:      	ldr	x15, [sp, #0x20]
    1720:      	ldrsw	x11, [sp, #0x10]
    1724:      	str	w14, [x21]
    1728:      	cmp	w12, #0x0
    172c:      	ldr	x12, [sp, #0x8]
    1730:      	cset	w17, ne
    1734:      	str	x13, [x20]
    1738:      	cmp	w11, #0x4
    173c:      	orr	w1, w10, w17, lsl #7
    1740:      	stp	x12, x15, [x19, #0x8]
    1744:      	strb	w1, [x19, #0x4]
    1748:      	b.hi	0x17cc <.text+0x7cc>
    174c:      	adrp	x10, 0x6000 <.text+0x5000>
    1750:      	add	x10, x10, #0x910
    1754:      	ldr	w11, [x10, x11, lsl #2]
    1758:      	b	0x17d0 <.text+0x7d0>
    175c:      	adrp	x1, 0x6000 <.text+0x5000>
    1760:      	adrp	x2, 0x6000 <.text+0x5000>
    1764:      	add	x1, x1, #0x642
    1768:      	add	x2, x2, #0x659
    176c:      	orr	w0, wzr, #0x80000000
    1770:      	bl	0x4674 <.text+0x3674>
    1774:      	mov	x22, #-0x8000000000000000 // =-9223372036854775808
    1778:      	movk	x22, #0x2
    177c:      	b	0x17a8 <.text+0x7a8>
    1780:      	adrp	x1, 0x6000 <.text+0x5000>
    1784:      	add	x1, x1, #0x66e
    1788:      	b	0x1794 <.text+0x794>
    178c:      	adrp	x1, 0x6000 <.text+0x5000>
    1790:      	add	x1, x1, #0x693
    1794:      	adrp	x2, 0x6000 <.text+0x5000>
    1798:      	add	x2, x2, #0x659
    179c:      	orr	w0, wzr, #0x80000000
    17a0:      	mov	x3, x22
    17a4:      	bl	0x4674 <.text+0x3674>
    17a8:      	mov	x0, x22
    17ac:      	sub	sp, x29, #0x30
    17b0:      	ldp	x29, x30, [sp, #0x30]
    17b4:      	ldp	x20, x19, [sp, #0x20]
    17b8:      	ldp	x22, x21, [sp, #0x10]
    17bc:      	ldp	x24, x23, [sp], #0x40
    17c0:      	ret
    17c4:      	str	wzr, [x21]
    17c8:      	b	0x17d4 <.text+0x7d4>
    17cc:      	orr	w11, wzr, #0x3
    17d0:      	str	w11, [x19]
    17d4:      	strb	wzr, [x9, #0x290]
    17d8:      	adrp	x23, 0xa000
    17dc:      	add	x23, x23, #0x140
    17e0:      	ldr	w10, [x23, #0x1e4]
    17e4:      	ldr	w9, [x23, #0x1e0]
    17e8:      	cmp	w10, #0x3
    17ec:      	ccmp	w9, #0x3, #0x0, ne
    17f0:      	b.ne	0x1810 <.text+0x810>
    17f4:      	orr	w4, wzr, #0x1
    17f8:      	orr	w11, wzr, #0x4
    17fc:      	str	w4, [x21]
    1800:      	str	x11, [x20]
    1804:      	str	wzr, [x19]
    1808:      	ldr	w10, [x23, #0x1e4]
    180c:      	ldr	w9, [x23, #0x1e0]
    1810:      	cmp	w10, w9
    1814:      	b.eq	0x1830 <.text+0x830>
    1818:      	cbnz	w9, 0x1830 <.text+0x830>
    181c:      	orr	w6, wzr, #0x1
    1820:      	orr	w14, wzr, #0x4
    1824:      	str	w6, [x21]
    1828:      	str	x14, [x20]
    182c:      	str	w6, [x19]
    1830:      	cmp	w8, #0x1
    1834:      	b.ne	0x18dc <.text+0x8dc>
    1838:      	ldrb	w13, [x23, #0x290]
    183c:      	cmp	w13, #0x1
    1840:      	b.ne	0x17a8 <.text+0x7a8>
    1844:      	orr	w0, wzr, #0x3
    1848:      	mov	w16, #0x28              // =40
    184c:      	adrp	x12, 0xa000
    1850:      	add	x12, x12, #0x20
    1854:      	str	w0, [x21]
    1858:      	str	x16, [x20]
    185c:      	orr	w0, wzr, #0x8
    1860:      	orr	w24, wzr, #0x8
    1864:      	ldr	w2, [x12, #0xc]
    1868:      	str	w2, [x19, #0xc]
    186c:      	ldr	w10, [x12, #0x8]
    1870:      	str	w10, [x19, #0x8]
    1874:      	ldr	w11, [x12, #0x4]
    1878:      	str	w11, [x19, #0x4]
    187c:      	ldr	w9, [x12]
    1880:      	str	xzr, [x19, #0x10]
    1884:      	str	w9, [x19]
    1888:      	bl	0x458c <.text+0x358c>
    188c:      	ldr	x17, [sp, #0x8]
    1890:      	add	x9, x0, #0x4
    1894:      	str	x0, [x19, #0x20]
    1898:      	lsr	x3, x17, #40
    189c:      	strb	w17, [x0]
    18a0:      	ubfx	x4, x17, #24, #8
    18a4:      	ubfx	x5, x17, #16, #16
    18a8:      	strb	w3, [x0, #0x5]
    18ac:      	lsr	x6, x17, #32
    18b0:      	strb	w4, [x0, #0x3]
    18b4:      	ubfx	x7, x17, #8, #24
    18b8:      	strb	w5, [x0, #0x2]
    18bc:      	strb	w6, [x9], #0x2
    18c0:      	strb	w7, [x0, #0x1]
    18c4:      	lsr	x0, x17, #56
    18c8:      	ldr	w8, [sp, #0x2c]
    18cc:      	lsr	x2, x17, #48
    18d0:      	strb	w0, [x9, #0x1]
    18d4:      	strb	w2, [x9]
    18d8:      	str	x24, [x19, #0x18]
    18dc:      	cmp	w8, #0x9
    18e0:      	b.ne	0x197c <.text+0x97c>
    18e4:      	orr	w13, wzr, #0x3
    18e8:      	mov	w22, #0x28              // =40
    18ec:      	orr	w8, wzr, #0x2
    18f0:      	str	w13, [x21]
    18f4:      	adrp	x13, 0xa000
    18f8:      	add	x13, x13, #0x30
    18fc:      	str	x22, [x20]
    1900:      	orr	w0, wzr, #0x8
    1904:      	ldr	w14, [x13, #0xc]
    1908:      	str	w14, [x19, #0xc]
    190c:      	ldr	w16, [x13, #0x8]
    1910:      	str	w16, [x19, #0x8]
    1914:      	ldr	w17, [x13, #0x4]
    1918:      	str	w17, [x19, #0x4]
    191c:      	ldr	w1, [x13]
    1920:      	str	x8, [x19, #0x10]
    1924:      	str	w1, [x19]
    1928:      	bl	0x458c <.text+0x358c>
    192c:      	mov	x8, x0
    1930:      	orr	w1, wzr, #0x2
    1934:      	mov	x3, x8
    1938:      	str	x8, [x19, #0x20]
    193c:      	ldr	x0, [x23, #0x1e8]
    1940:      	ldr	w2, [x23, #0x1f8]
    1944:      	ldr	x9, [x0, #0x18]
    1948:      	blr	x9
    194c:      	mov	x22, x0
    1950:      	tbz	x22, #0x3f, 0x1970 <.text+0x970>
    1954:      	adrp	x1, 0x6000 <.text+0x5000>
    1958:      	adrp	x2, 0x6000 <.text+0x5000>
    195c:      	add	x1, x1, #0x6c2
    1960:      	add	x2, x2, #0x659
    1964:      	orr	w0, wzr, #0x80000000
    1968:      	mov	x3, x22
    196c:      	bl	0x4674 <.text+0x3674>
    1970:      	ldr	w8, [sp, #0x2c]
    1974:      	orr	w1, wzr, #0x8
    1978:      	str	x1, [x19, #0x18]
    197c:      	cmp	w8, #0x5
    1980:      	b.ne	0x17a8 <.text+0x7a8>
    1984:      	orr	w3, wzr, #0x3
    1988:      	mov	w10, #0x28              // =40
    198c:      	adrp	x14, 0xa000
    1990:      	add	x14, x14, #0x40
    1994:      	str	w3, [x21]
    1998:      	str	x10, [x20]
    199c:      	orr	w0, wzr, #0x4
    19a0:      	orr	w24, wzr, #0x4
    19a4:      	ldr	w4, [x14, #0xc]
    19a8:      	str	w4, [x19, #0xc]
    19ac:      	ldr	w5, [x14, #0x8]
    19b0:      	str	w5, [x19, #0x8]
    19b4:      	ldr	w6, [x14, #0x4]
    19b8:      	str	w6, [x19, #0x4]
    19bc:      	ldr	w7, [x14]
    19c0:      	str	xzr, [x19, #0x10]
    19c4:      	str	w7, [x19]
    19c8:      	bl	0x458c <.text+0x358c>
    19cc:      	str	x0, [x19, #0x20]
    19d0:      	str	wzr, [x0]
    19d4:      	ldr	x0, [x23, #0x1e8]
    19d8:      	ldr	x1, [x19, #0x20]
    19dc:      	ldr	x13, [x0, #0x8]
    19e0:      	blr	x13
    19e4:      	str	x24, [x19, #0x18]
    19e8:      	b	0x17a8 <.text+0x7a8>
    19ec:      	stp	x22, x21, [sp, #-0x30]!
    19f0:      	stp	x20, x19, [sp, #0x10]
    19f4:      	stp	x29, x30, [sp, #0x20]
    19f8:      	add	x29, sp, #0x20
    19fc:      	adrp	x22, 0xa000
    1a00:      	mov	x20, x1
    1a04:      	mov	x21, x0
    1a08:      	ldr	x8, [x22, #0x410]
    1a0c:      	cbnz	x8, 0x1a20 <.text+0xa20>
    1a10:      	bl	0x1f1c <.text+0xf1c>
    1a14:      	mov	x19, x0
    1a18:      	tbnz	x19, #0x3f, 0x1a3c <.text+0xa3c>
    1a1c:      	ldr	x8, [x22, #0x410]
    1a20:      	ldr	x9, [x8, #0x60]
    1a24:      	mov	x0, x8
    1a28:      	mov	x1, x21
    1a2c:      	mov	x2, x20
    1a30:      	blr	x9
    1a34:      	mov	x19, x0
    1a38:      	tbz	x19, #0x3f, 0x1a58 <.text+0xa58>
    1a3c:      	adrp	x1, 0x6000 <.text+0x5000>
    1a40:      	adrp	x2, 0x6000 <.text+0x5000>
    1a44:      	add	x1, x1, #0x7bb
    1a48:      	add	x2, x2, #0x7e2
    1a4c:      	orr	w0, wzr, #0x80000000
    1a50:      	mov	x3, x19
    1a54:      	bl	0x4674 <.text+0x3674>
    1a58:      	mov	x0, x19
    1a5c:      	ldp	x29, x30, [sp, #0x20]
    1a60:      	ldp	x20, x19, [sp, #0x10]
    1a64:      	ldp	x22, x21, [sp], #0x30
    1a68:      	ret
    1a6c:      	stp	x20, x19, [sp, #-0x20]!
    1a70:      	stp	x29, x30, [sp, #0x10]
    1a74:      	add	x29, sp, #0x10
    1a78:      	adrp	x9, 0xa000
    1a7c:      	ldr	x8, [x9, #0x410]
    1a80:      	mov	x9, x0
    1a84:      	mov	x1, x9
    1a88:      	ldr	x10, [x8, #0x68]
    1a8c:      	mov	x0, x8
    1a90:      	blr	x10
    1a94:      	mov	x19, x0
    1a98:      	tbz	x19, #0x3f, 0x1ab8 <.text+0xab8>
    1a9c:      	adrp	x1, 0x6000 <.text+0x5000>
    1aa0:      	adrp	x2, 0x6000 <.text+0x5000>
    1aa4:      	add	x1, x1, #0x7fa
    1aa8:      	add	x2, x2, #0x81d
    1aac:      	orr	w0, wzr, #0x80000000
    1ab0:      	mov	x3, x19
    1ab4:      	bl	0x4674 <.text+0x3674>
    1ab8:      	ldp	x29, x30, [sp, #0x10]
    1abc:      	mov	x0, x19
    1ac0:      	ldp	x20, x19, [sp], #0x20
    1ac4:      	ret
    1ac8:      	stp	x20, x19, [sp, #-0x20]!
    1acc:      	stp	x29, x30, [sp, #0x10]
    1ad0:      	add	x29, sp, #0x10
    1ad4:      	bl	0x20d4 <.text+0x10d4>
    1ad8:      	adrp	x9, 0xa000
    1adc:      	ldr	x0, [x9, #0x410]
    1ae0:      	cbz	x0, 0x1b40 <.text+0xb40>
    1ae4:      	ldr	x9, [x0, #0x78]
    1ae8:      	blr	x9
    1aec:      	mov	x19, x0
    1af0:      	tbnz	x19, #0x3f, 0x1b44 <.text+0xb44>
    1af4:      	adrp	x10, 0xa000
    1af8:      	add	x10, x10, #0x140
    1afc:      	add	x0, x10, #0x238
    1b00:      	bl	0x3cb0 <.text+0x2cb0>
    1b04:      	mov	x8, x0
    1b08:      	tbz	x8, #0x3f, 0x1b28 <.text+0xb28>
    1b0c:      	adrp	x1, 0x6000 <.text+0x5000>
    1b10:      	adrp	x2, 0x6000 <.text+0x5000>
    1b14:      	add	x1, x1, #0x5ab
    1b18:      	add	x2, x2, #0x59d
    1b1c:      	orr	w0, wzr, #0x80000000
    1b20:      	mov	x3, x8
    1b24:      	bl	0x4674 <.text+0x3674>
    1b28:      	adrp	x8, 0xa000
    1b2c:      	add	x8, x8, #0x410
    1b30:      	ldr	x10, [x8, #0x8]
    1b34:      	cbz	x10, 0x1b50 <.text+0xb50>
    1b38:      	add	x0, x8, #0x8
    1b3c:      	b	0x1b5c <.text+0xb5c>
    1b40:      	mov	x19, #-0x7ffffffffffffff9 // =-9223372036854775801
    1b44:      	adrp	x1, 0x6000 <.text+0x5000>
    1b48:      	add	x1, x1, #0x57f
    1b4c:      	b	0x1b78 <.text+0xb78>
    1b50:      	ldr	x11, [x8, #0x18]
    1b54:      	cbz	x11, 0x1b6c <.text+0xb6c>
    1b58:      	add	x0, x8, #0x18
    1b5c:      	bl	0x33c8 <.text+0x23c8>
    1b60:      	mov	x19, x0
    1b64:      	tbz	x19, #0x3f, 0x1b8c <.text+0xb8c>
    1b68:      	b	0x1b70 <.text+0xb70>
    1b6c:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    1b70:      	adrp	x1, 0x6000 <.text+0x5000>
    1b74:      	add	x1, x1, #0x5d4
    1b78:      	adrp	x2, 0x6000 <.text+0x5000>
    1b7c:      	add	x2, x2, #0x59d
    1b80:      	orr	w0, wzr, #0x80000000
    1b84:      	mov	x3, x19
    1b88:      	bl	0x4674 <.text+0x3674>
    1b8c:      	ldp	x29, x30, [sp, #0x10]
    1b90:      	mov	x0, x19
    1b94:      	ldp	x20, x19, [sp], #0x20
    1b98:      	ret
    1b9c:      	stp	x20, x19, [sp, #-0x20]!
    1ba0:      	stp	x29, x30, [sp, #0x10]
    1ba4:      	add	x29, sp, #0x10
    1ba8:      	adrp	x9, 0xa000
    1bac:      	and	w1, w0, #0xf
    1bb0:      	ubfx	w2, w0, #7, #1
    1bb4:      	ldr	x8, [x9, #0x410]
    1bb8:      	ldr	x9, [x8, #0x30]
    1bbc:      	mov	x0, x8
    1bc0:      	blr	x9
    1bc4:      	mov	x19, x0
    1bc8:      	tbz	x19, #0x3f, 0x1be8 <.text+0xbe8>
    1bcc:      	adrp	x1, 0x6000 <.text+0x5000>
    1bd0:      	adrp	x2, 0x6000 <.text+0x5000>
    1bd4:      	add	x1, x1, #0x5f9
    1bd8:      	add	x2, x2, #0x62f
    1bdc:      	orr	w0, wzr, #0x80000000
    1be0:      	mov	x3, x19
    1be4:      	bl	0x4674 <.text+0x3674>
    1be8:      	ldp	x29, x30, [sp, #0x10]
    1bec:      	mov	x0, x19
    1bf0:      	ldp	x20, x19, [sp], #0x20
    1bf4:      	ret
    1bf8:      	stp	x20, x19, [sp, #-0x20]!
    1bfc:      	stp	x29, x30, [sp, #0x10]
    1c00:      	add	x29, sp, #0x10
    1c04:      	adrp	x10, 0xa000
    1c08:      	mov	w8, w1
    1c0c:      	and	w1, w0, #0xf
    1c10:      	ldr	x9, [x10, #0x410]
    1c14:      	ubfx	w2, w0, #7, #1
    1c18:      	mov	w3, w8
    1c1c:      	ldr	x10, [x9, #0x40]
    1c20:      	mov	x0, x9
    1c24:      	blr	x10
    1c28:      	mov	x19, x0
    1c2c:      	tbz	x19, #0x3f, 0x1c4c <.text+0xc4c>
    1c30:      	adrp	x1, 0x6000 <.text+0x5000>
    1c34:      	adrp	x2, 0x6000 <.text+0x5000>
    1c38:      	add	x1, x1, #0x839
    1c3c:      	add	x2, x2, #0x85f
    1c40:      	orr	w0, wzr, #0x80000000
    1c44:      	mov	x3, x19
    1c48:      	bl	0x4674 <.text+0x3674>
    1c4c:      	ldp	x29, x30, [sp, #0x10]
    1c50:      	mov	x0, x19
    1c54:      	ldp	x20, x19, [sp], #0x20
    1c58:      	ret
    1c5c:      	stp	x22, x21, [sp, #-0x30]!
    1c60:      	stp	x20, x19, [sp, #0x10]
    1c64:      	stp	x29, x30, [sp, #0x20]
    1c68:      	add	x29, sp, #0x20
    1c6c:      	mov	x20, x0
    1c70:      	cbz	x20, 0x1d14 <.text+0xd14>
    1c74:      	bl	0x1f1c <.text+0xf1c>
    1c78:      	mov	x19, x0
    1c7c:      	tbnz	x19, #0x3f, 0x1d54 <.text+0xd54>
    1c80:      	adrp	x21, 0xa000
    1c84:      	ldr	x0, [x21, #0x410]
    1c88:      	ldr	x8, [x0, #0x78]
    1c8c:      	blr	x8
    1c90:      	mov	x19, x0
    1c94:      	tbnz	x19, #0x3f, 0x1d54 <.text+0xd54>
    1c98:      	ldr	x0, [x21, #0x410]
    1c9c:      	ldr	x9, [x0, #0x70]
    1ca0:      	blr	x9
    1ca4:      	mov	x19, x0
    1ca8:      	tbnz	x19, #0x3f, 0x1d20 <.text+0xd20>
    1cac:      	adrp	x22, 0xa000
    1cb0:      	adrp	x8, 0xa000
    1cb4:      	add	x22, x22, #0x410
    1cb8:      	add	x8, x8, #0x140
    1cbc:      	add	x1, x22, #0x8
    1cc0:      	add	x2, x22, #0x18
    1cc4:      	add	x3, x8, #0x238
    1cc8:      	mov	x0, x20
    1ccc:      	bl	0x3a94 <.text+0x2a94>
    1cd0:      	mov	x19, x0
    1cd4:      	tbnz	x19, #0x3f, 0x1d2c <.text+0xd2c>
    1cd8:      	ldr	x0, [x21, #0x410]
    1cdc:      	mov	w1, wzr
    1ce0:      	bl	0x200c <.text+0x100c>
    1ce4:      	mov	x19, x0
    1ce8:      	tbnz	x19, #0x3f, 0x1d38 <.text+0xd38>
    1cec:      	mov	x1, x22
    1cf0:      	add	x2, x22, #0x18
    1cf4:      	ldr	x0, [x1], #0x8
    1cf8:      	ldr	x10, [x0, #0x90]
    1cfc:      	blr	x10
    1d00:      	mov	x19, x0
    1d04:      	tbz	x19, #0x3f, 0x1d54 <.text+0xd54>
    1d08:      	adrp	x1, 0x6000 <.text+0x5000>
    1d0c:      	add	x1, x1, #0x77a
    1d10:      	b	0x1d40 <.text+0xd40>
    1d14:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1d18:      	movk	x19, #0x2
    1d1c:      	b	0x1d54 <.text+0xd54>
    1d20:      	adrp	x1, 0x6000 <.text+0x5000>
    1d24:      	add	x1, x1, #0x6eb
    1d28:      	b	0x1d40 <.text+0xd40>
    1d2c:      	adrp	x1, 0x6000 <.text+0x5000>
    1d30:      	add	x1, x1, #0x724
    1d34:      	b	0x1d40 <.text+0xd40>
    1d38:      	adrp	x1, 0x6000 <.text+0x5000>
    1d3c:      	add	x1, x1, #0x74e
    1d40:      	adrp	x2, 0x6000 <.text+0x5000>
    1d44:      	add	x2, x2, #0x713
    1d48:      	orr	w0, wzr, #0x80000000
    1d4c:      	mov	x3, x19
    1d50:      	bl	0x4674 <.text+0x3674>
    1d54:      	mov	x0, x19
    1d58:      	ldp	x29, x30, [sp, #0x20]
    1d5c:      	ldp	x20, x19, [sp, #0x10]
    1d60:      	ldp	x22, x21, [sp], #0x30
    1d64:      	ret
    1d68:      	stp	x20, x19, [sp, #-0x20]!
    1d6c:      	stp	x29, x30, [sp, #0x10]
    1d70:      	add	x29, sp, #0x10
    1d74:      	sub	sp, sp, #0x10
    1d78:      	mov	x19, x1
    1d7c:      	str	xzr, [sp, #0x8]
    1d80:      	cbz	x0, 0x1dcc <.text+0xdcc>
    1d84:      	cbz	x19, 0x1dcc <.text+0xdcc>
    1d88:      	ldr	w8, [x19, #0x8]
    1d8c:      	cmp	w8, #0x2
    1d90:      	b.ne	0x1df0 <.text+0xdf0>
    1d94:      	ldr	x8, [x19]
    1d98:      	adrp	x1, 0x6000 <.text+0x5000>
    1d9c:      	adrp	x2, 0x6000 <.text+0x5000>
    1da0:      	add	x1, x1, #0x4ee
    1da4:      	add	x2, x2, #0x4e4
    1da8:      	lsr	x9, x8, #32
    1dac:      	cmp	x9, #0x0
    1db0:      	cset	w9, ne
    1db4:      	and	w10, w8, #0xff
    1db8:      	orr	w3, w10, w9, lsl #7
    1dbc:      	orr	w0, wzr, #0x80000000
    1dc0:      	bl	0x4674 <.text+0x3674>
    1dc4:      	mov	x20, #-0x7ffffffffffffff9 // =-9223372036854775801
    1dc8:      	b	0x1e5c <.text+0xe5c>
    1dcc:      	adrp	x1, 0x6000 <.text+0x5000>
    1dd0:      	adrp	x2, 0x6000 <.text+0x5000>
    1dd4:      	add	x1, x1, #0x4cd
    1dd8:      	add	x2, x2, #0x4e4
    1ddc:      	orr	w0, wzr, #0x80000000
    1de0:      	bl	0x4674 <.text+0x3674>
    1de4:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    1de8:      	movk	x20, #0x2
    1dec:      	b	0x1e5c <.text+0xe5c>
    1df0:      	ldp	x10, x11, [x19, #0x20]
    1df4:      	add	x3, sp, #0x8
    1df8:      	ldr	x12, [x19, #0x10]
    1dfc:      	ldr	x13, [x0, #0x50]
    1e00:      	ldp	w1, w2, [x19]
    1e04:      	sub	x14, x11, x10
    1e08:      	add	x4, x12, x10
    1e0c:      	str	x14, [sp, #0x8]
    1e10:      	blr	x13
    1e14:      	mov	x20, x0
    1e18:      	tbnz	x20, #0x3f, 0x1e28 <.text+0xe28>
    1e1c:      	orr	w11, wzr, #0x2
    1e20:      	str	w11, [x19, #0x8]
    1e24:      	b	0x1e5c <.text+0xe5c>
    1e28:      	ldr	x15, [x19]
    1e2c:      	adrp	x1, 0x6000 <.text+0x5000>
    1e30:      	adrp	x2, 0x6000 <.text+0x5000>
    1e34:      	add	x1, x1, #0x520
    1e38:      	add	x2, x2, #0x4e4
    1e3c:      	lsr	x8, x15, #32
    1e40:      	cmp	x8, #0x0
    1e44:      	cset	w10, ne
    1e48:      	and	w9, w15, #0xff
    1e4c:      	orr	w3, w9, w10, lsl #7
    1e50:      	orr	w0, wzr, #0x80000000
    1e54:      	mov	x4, x20
    1e58:      	bl	0x4674 <.text+0x3674>
    1e5c:      	mov	x0, x20
    1e60:      	sub	sp, x29, #0x10
    1e64:      	ldp	x29, x30, [sp, #0x10]
    1e68:      	ldp	x20, x19, [sp], #0x20
    1e6c:      	ret
    1e70:      	stp	x20, x19, [sp, #-0x20]!
    1e74:      	stp	x29, x30, [sp, #0x10]
    1e78:      	add	x29, sp, #0x10
    1e7c:      	mov	x19, x1
    1e80:      	cbz	x0, 0x1ee4 <.text+0xee4>
    1e84:      	cbz	x19, 0x1ee4 <.text+0xee4>
    1e88:      	ldr	w8, [x19, #0x8]
    1e8c:      	cmp	w8, #0x2
    1e90:      	b.ne	0x1f08 <.text+0xf08>
    1e94:      	ldr	x8, [x0, #0x30]
    1e98:      	ldp	w1, w2, [x19]
    1e9c:      	blr	x8
    1ea0:      	mov	x20, x0
    1ea4:      	tbz	x20, #0x3f, 0x1edc <.text+0xedc>
    1ea8:      	ldr	x9, [x19]
    1eac:      	adrp	x1, 0x6000 <.text+0x5000>
    1eb0:      	adrp	x2, 0x6000 <.text+0x5000>
    1eb4:      	add	x1, x1, #0x550
    1eb8:      	add	x2, x2, #0x638
    1ebc:      	lsr	x8, x9, #32
    1ec0:      	cmp	x8, #0x0
    1ec4:      	cset	w10, ne
    1ec8:      	and	w9, w9, #0xff
    1ecc:      	orr	w3, w9, w10, lsl #7
    1ed0:      	orr	w0, wzr, #0x80000000
    1ed4:      	mov	x4, x20
    1ed8:      	bl	0x4674 <.text+0x3674>
    1edc:      	str	wzr, [x19, #0x8]
    1ee0:      	b	0x1f0c <.text+0xf0c>
    1ee4:      	adrp	x1, 0x6000 <.text+0x5000>
    1ee8:      	adrp	x2, 0x6000 <.text+0x5000>
    1eec:      	add	x1, x1, #0x4cd
    1ef0:      	add	x2, x2, #0x638
    1ef4:      	orr	w0, wzr, #0x80000000
    1ef8:      	bl	0x4674 <.text+0x3674>
    1efc:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    1f00:      	movk	x20, #0x2
    1f04:      	b	0x1f0c <.text+0xf0c>
    1f08:      	mov	x20, xzr
    1f0c:      	ldp	x29, x30, [sp, #0x10]
    1f10:      	mov	x0, x20
    1f14:      	ldp	x20, x19, [sp], #0x20
    1f18:      	ret
    1f1c:      	stp	x20, x19, [sp, #-0x20]!
    1f20:      	stp	x29, x30, [sp, #0x10]
    1f24:      	add	x29, sp, #0x10
    1f28:      	adrp	x20, 0xa000
    1f2c:      	ldr	x8, [x20, #0x410]
    1f30:      	cbz	x8, 0x1f3c <.text+0xf3c>
    1f34:      	mov	x19, xzr
    1f38:      	b	0x1f88 <.text+0xf88>
    1f3c:      	adrp	x8, 0xa000
    1f40:      	adrp	x0, 0xa000
    1f44:      	adrp	x2, 0xa000
    1f48:      	ldr	x9, [x8, #0x458]
    1f4c:      	mov	x1, xzr
    1f50:      	add	x0, x0, #0xa0
    1f54:      	add	x2, x2, #0x410
    1f58:      	ldr	x9, [x9, #0x140]
    1f5c:      	blr	x9
    1f60:      	mov	x19, x0
    1f64:      	tbz	x19, #0x3f, 0x1f88 <.text+0xf88>
    1f68:      	adrp	x1, 0x6000 <.text+0x5000>
    1f6c:      	str	xzr, [x20, #0x410]
    1f70:      	adrp	x2, 0x6000 <.text+0x5000>
    1f74:      	add	x1, x1, #0x8c6
    1f78:      	add	x2, x2, #0x8f3
    1f7c:      	orr	w0, wzr, #0x80000000
    1f80:      	mov	x3, x19
    1f84:      	bl	0x4674 <.text+0x3674>
    1f88:      	ldp	x29, x30, [sp, #0x10]
    1f8c:      	mov	x0, x19
    1f90:      	ldp	x20, x19, [sp], #0x20
    1f94:      	ret
    1f98:      	stp	x20, x19, [sp, #-0x20]!
    1f9c:      	stp	x29, x30, [sp, #0x10]
    1fa0:      	add	x29, sp, #0x10
    1fa4:      	sub	sp, sp, #0x10
    1fa8:      	adrp	x8, 0xa000
    1fac:      	str	x0, [sp, #0x8]
    1fb0:      	adrp	x1, 0xa000
    1fb4:      	adrp	x2, 0xa000
    1fb8:      	ldr	x9, [x8, #0x458]
    1fbc:      	add	x1, x1, #0xb0
    1fc0:      	add	x2, x2, #0xf0
    1fc4:      	add	x0, sp, #0x8
    1fc8:      	mov	x3, xzr
    1fcc:      	ldr	x8, [x9, #0x148]
    1fd0:      	blr	x8
    1fd4:      	mov	x19, x0
    1fd8:      	tbz	x19, #0x3f, 0x1ff8 <.text+0xff8>
    1fdc:      	adrp	x1, 0x6000 <.text+0x5000>
    1fe0:      	adrp	x2, 0x6000 <.text+0x5000>
    1fe4:      	add	x1, x1, #0x87e
    1fe8:      	add	x2, x2, #0x8ac
    1fec:      	orr	w0, wzr, #0x80000000
    1ff0:      	mov	x3, x19
    1ff4:      	bl	0x4674 <.text+0x3674>
    1ff8:      	mov	x0, x19
    1ffc:      	sub	sp, x29, #0x10
    2000:      	ldp	x29, x30, [sp, #0x10]
    2004:      	ldp	x20, x19, [sp], #0x20
    2008:      	ret
    200c:      	stp	x20, x19, [sp, #-0x20]!
    2010:      	stp	x29, x30, [sp, #0x10]
    2014:      	add	x29, sp, #0x10
    2018:      	cbz	x0, 0x2080 <.text+0x1080>
    201c:      	adrp	x20, 0xa000
    2020:      	add	x20, x20, #0x140
    2024:      	orr	w9, wzr, #0x4000
    2028:      	add	x2, x20, #0x218
    202c:      	str	x0, [x20, #0x1e8]
    2030:      	orr	w1, wzr, #0x4000
    2034:      	strb	wzr, [x20, #0x290]
    2038:      	strb	wzr, [x20, #0x208]
    203c:      	str	wzr, [x20, #0x210]
    2040:      	str	x9, [x20, #0x220]
    2044:      	str	xzr, [x20, #0x228]
    2048:      	str	xzr, [x20, #0x230]
    204c:      	ldr	x10, [x0, #0x60]
    2050:      	blr	x10
    2054:      	mov	x19, x0
    2058:      	tbnz	x19, #0x3f, 0x20a4 <.text+0x10a4>
    205c:      	ldr	x8, [x20, #0x10]
    2060:      	str	wzr, [x20, #0x1e0]
    2064:      	str	wzr, [x20, #0x1e4]
    2068:      	cbz	x8, 0x20c4 <.text+0x10c4>
    206c:      	adrp	x0, 0xa000
    2070:      	add	x0, x0, #0x140
    2074:      	orr	w1, wzr, #0x6
    2078:      	blr	x8
    207c:      	b	0x20c4 <.text+0x10c4>
    2080:      	adrp	x1, 0x6000 <.text+0x5000>
    2084:      	adrp	x2, 0x6000 <.text+0x5000>
    2088:      	add	x1, x1, #0x98f
    208c:      	add	x2, x2, #0x9a6
    2090:      	orr	w0, wzr, #0x80000000
    2094:      	bl	0x4674 <.text+0x3674>
    2098:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    209c:      	movk	x19, #0x2
    20a0:      	b	0x20c0 <.text+0x10c0>
    20a4:      	adrp	x1, 0x6000 <.text+0x5000>
    20a8:      	adrp	x2, 0x6000 <.text+0x5000>
    20ac:      	add	x1, x1, #0x9b6
    20b0:      	add	x2, x2, #0x9a6
    20b4:      	orr	w0, wzr, #0x80000000
    20b8:      	mov	x3, x19
    20bc:      	bl	0x4674 <.text+0x3674>
    20c0:      	bl	0x20d4 <.text+0x10d4>
    20c4:      	ldp	x29, x30, [sp, #0x10]
    20c8:      	mov	x0, x19
    20cc:      	ldp	x20, x19, [sp], #0x20
    20d0:      	ret
    20d4:      	stp	x20, x19, [sp, #-0x20]!
    20d8:      	stp	x29, x30, [sp, #0x10]
    20dc:      	add	x29, sp, #0x10
    20e0:      	adrp	x19, 0xa000
    20e4:      	add	x19, x19, #0x140
    20e8:      	ldr	x10, [x19, #0x218]
    20ec:      	cbz	x10, 0x2154 <.text+0x1154>
    20f0:      	ldr	x0, [x19, #0x1e8]
    20f4:      	add	x1, x19, #0x208
    20f8:      	bl	0x1e70 <.text+0xe70>
    20fc:      	mov	x8, x0
    2100:      	tbz	x8, #0x3f, 0x2120 <.text+0x1120>
    2104:      	adrp	x1, 0x6000 <.text+0x5000>
    2108:      	adrp	x2, 0x6000 <.text+0x5000>
    210c:      	add	x1, x1, #0x9ea
    2110:      	add	x2, x2, #0xa14
    2114:      	orr	w0, wzr, #0x80000000
    2118:      	mov	x3, x8
    211c:      	bl	0x4674 <.text+0x3674>
    2120:      	ldr	x0, [x19, #0x1e8]
    2124:      	ldr	x1, [x19, #0x218]
    2128:      	ldr	x11, [x0, #0x68]
    212c:      	blr	x11
    2130:      	mov	x9, x0
    2134:      	tbz	x9, #0x3f, 0x2154 <.text+0x1154>
    2138:      	adrp	x1, 0x6000 <.text+0x5000>
    213c:      	adrp	x2, 0x6000 <.text+0x5000>
    2140:      	add	x1, x1, #0xa21
    2144:      	add	x2, x2, #0xa14
    2148:      	orr	w0, wzr, #0x80000000
    214c:      	mov	x3, x9
    2150:      	bl	0x4674 <.text+0x3674>
    2154:      	strb	wzr, [x19, #0x290]
    2158:      	ldp	x29, x30, [sp, #0x10]
    215c:      	ldp	x20, x19, [sp], #0x20
    2160:      	ret
    2164:      	stp	x20, x19, [sp, #-0x20]!
    2168:      	stp	x29, x30, [sp, #0x10]
    216c:      	add	x29, sp, #0x10
    2170:      	mov	x8, x2
    2174:      	mov	x9, x1
    2178:      	mov	w10, w0
    217c:      	cbz	w10, 0x21b0 <.text+0x11b0>
    2180:      	cbz	x8, 0x21b0 <.text+0x11b0>
    2184:      	sub	w11, w10, #0x1
    2188:      	cmp	w11, #0x9
    218c:      	b.lo	0x21d4 <.text+0x11d4>
    2190:      	adrp	x1, 0x6000 <.text+0x5000>
    2194:      	adrp	x2, 0x6000 <.text+0x5000>
    2198:      	add	x1, x1, #0xa63
    219c:      	add	x2, x2, #0xa51
    21a0:      	orr	w0, wzr, #0x80000000
    21a4:      	bl	0x4674 <.text+0x3674>
    21a8:      	mov	x0, xzr
    21ac:      	b	0x2208 <.text+0x1208>
    21b0:      	adrp	x1, 0x6000 <.text+0x5000>
    21b4:      	adrp	x2, 0x6000 <.text+0x5000>
    21b8:      	add	x1, x1, #0x98f
    21bc:      	add	x2, x2, #0xa51
    21c0:      	orr	w0, wzr, #0x80000000
    21c4:      	bl	0x4674 <.text+0x3674>
    21c8:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    21cc:      	movk	x0, #0x2
    21d0:      	b	0x2208 <.text+0x1208>
    21d4:      	adrp	x12, 0xa000
    21d8:      	add	x12, x12, #0x140
    21dc:      	ldr	w19, [x12, #0x1e0]
    21e0:      	cmp	w19, #0x5
    21e4:      	str	w19, [x12, #0x1e4]
    21e8:      	b.lo	0x2214 <.text+0x1214>
    21ec:      	adrp	x1, 0x6000 <.text+0x5000>
    21f0:      	add	x1, x1, #0xa80
    21f4:      	adrp	x2, 0x6000 <.text+0x5000>
    21f8:      	add	x2, x2, #0xa51
    21fc:      	orr	w0, wzr, #0x80000000
    2200:      	bl	0x4674 <.text+0x3674>
    2204:      	mov	x0, #-0x7ffffffffffffff9 // =-9223372036854775801
    2208:      	ldp	x29, x30, [sp, #0x10]
    220c:      	ldp	x20, x19, [sp], #0x20
    2210:      	ret
    2214:      	orr	w13, wzr, #0x60
    2218:      	madd	x13, x19, x13, x12
    221c:      	add	x11, x13, w11, uxtw #3
    2220:      	ldr	x11, [x11, #0x18]
    2224:      	cbz	x11, 0x21a8 <.text+0x11a8>
    2228:      	adrp	x20, 0xa000
    222c:      	add	x20, x20, #0x140
    2230:      	mov	x0, x20
    2234:      	mov	w1, w10
    2238:      	mov	x2, x9
    223c:      	mov	x3, x8
    2240:      	blr	x11
    2244:      	cmp	w0, w19
    2248:      	ccmp	w0, #0x7, #0x4, ne
    224c:      	b.eq	0x21a8 <.text+0x11a8>
    2250:      	cmp	w0, #0x5
    2254:      	b.lo	0x2264 <.text+0x1264>
    2258:      	adrp	x1, 0x6000 <.text+0x5000>
    225c:      	add	x1, x1, #0xa9c
    2260:      	b	0x21f4 <.text+0x11f4>
    2264:      	mov	w12, w0
    2268:      	orr	w14, wzr, #0x60
    226c:      	madd	x8, x12, x14, x20
    2270:      	ldr	x10, [x8, #0x10]
    2274:      	str	w0, [x20, #0x1e0]
    2278:      	cbz	x10, 0x21a8 <.text+0x11a8>
    227c:      	adrp	x0, 0xa000
    2280:      	add	x0, x0, #0x140
    2284:      	mov	w1, w19
    2288:      	blr	x10
    228c:      	b	0x21a8 <.text+0x11a8>
    2290:      	adrp	x8, 0xa000
    2294:      	add	x8, x8, #0x140
    2298:      	ldr	w0, [x8, #0x1e0]
    229c:      	ret
    22a0:      	cmp	w0, #0x4
    22a4:      	b.ls	0x22b0 <.text+0x12b0>
    22a8:      	mov	x0, xzr
    22ac:      	ret
    22b0:      	mov	w8, w0
    22b4:      	orr	w9, wzr, #0x60
    22b8:      	mul	x10, x8, x9
    22bc:      	adrp	x8, 0xa000
    22c0:      	add	x8, x8, #0x140
    22c4:      	ldr	x0, [x8, x10]
    22c8:      	ret
    22cc:      	cmp	w0, #0x9
    22d0:      	b.hi	0x22e4 <.text+0x12e4>
    22d4:      	adrp	x8, 0x6000 <.text+0x5000>
    22d8:      	add	x8, x8, #0xbe0
    22dc:      	ldr	x0, [x8, w0, sxtw #3]
    22e0:      	ret
    22e4:      	adrp	x0, 0x6000 <.text+0x5000>
    22e8:      	add	x0, x0, #0xbc6
    22ec:      	ret
    22f0:      	stp	x29, x30, [sp, #-0x10]!
    22f4:      	mov	x29, sp
    22f8:      	ldrb	w10, [x1, #0x3]
    22fc:      	mov	x8, x0
    2300:      	ldrb	w3, [x1, #0x2]
    2304:      	bfi	w3, w10, #8, #8
    2308:      	cbz	w3, 0x2318 <.text+0x1318>
    230c:      	adrp	x1, 0x6000 <.text+0x5000>
    2310:      	add	x1, x1, #0xd08
    2314:      	b	0x2368 <.text+0x1368>
    2318:      	ldrb	w11, [x1, #0x7]
    231c:      	ldrb	w3, [x1, #0x6]
    2320:      	bfi	w3, w11, #8, #8
    2324:      	cmp	w3, #0x2
    2328:      	b.ne	0x2360 <.text+0x1360>
    232c:      	ldrb	w13, [x1]
    2330:      	and	w9, w13, #0x1f
    2334:      	cmp	w9, #0x1
    2338:      	b.eq	0x2384 <.text+0x1384>
    233c:      	mov	x0, xzr
    2340:      	cbnz	w9, 0x237c <.text+0x137c>
    2344:      	ldrb	w8, [x1, #0x5]
    2348:      	ldrb	w3, [x1, #0x4]
    234c:      	bfi	w3, w8, #8, #8
    2350:      	cbz	w3, 0x23d8 <.text+0x13d8>
    2354:      	adrp	x1, 0x6000 <.text+0x5000>
    2358:      	add	x1, x1, #0xd7c
    235c:      	b	0x2368 <.text+0x1368>
    2360:      	adrp	x1, 0x6000 <.text+0x5000>
    2364:      	add	x1, x1, #0xd4a
    2368:      	adrp	x2, 0x6000 <.text+0x5000>
    236c:      	add	x2, x2, #0xd3a
    2370:      	orr	w0, wzr, #0x80000000
    2374:      	bl	0x4674 <.text+0x3674>
    2378:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    237c:      	ldp	x29, x30, [sp], #0x10
    2380:      	ret
    2384:      	ldr	x9, [x8, #0x268]
    2388:      	ldr	x10, [x9]
    238c:      	ldrb	w9, [x1, #0x4]
    2390:      	ldrb	w15, [x10, #0x4]
    2394:      	cmp	w9, w15
    2398:      	b.hs	0x23bc <.text+0x13bc>
    239c:      	mov	x0, xzr
    23a0:      	cbz	w9, 0x237c <.text+0x137c>
    23a4:      	ldr	w8, [x8, #0x1e0]
    23a8:      	cmp	w8, #0x3
    23ac:      	b.eq	0x237c <.text+0x137c>
    23b0:      	adrp	x1, 0x6000 <.text+0x5000>
    23b4:      	add	x1, x1, #0xdf0
    23b8:      	b	0x23c4 <.text+0x13c4>
    23bc:      	adrp	x1, 0x6000 <.text+0x5000>
    23c0:      	add	x1, x1, #0xdca
    23c4:      	adrp	x2, 0x6000 <.text+0x5000>
    23c8:      	add	x2, x2, #0xd3a
    23cc:      	orr	w0, wzr, #0x80000000
    23d0:      	bl	0x4674 <.text+0x3674>
    23d4:      	b	0x2378 <.text+0x1378>
    23d8:      	mov	x0, xzr
    23dc:      	b	0x237c <.text+0x137c>
    23e0:      	stp	x24, x23, [sp, #-0x40]!
    23e4:      	stp	x22, x21, [sp, #0x10]
    23e8:      	stp	x20, x19, [sp, #0x20]
    23ec:      	stp	x29, x30, [sp, #0x30]
    23f0:      	add	x29, sp, #0x30
    23f4:      	sub	sp, sp, #0x10
    23f8:      	mov	x19, x3
    23fc:      	mov	x20, x2
    2400:      	mov	x23, x1
    2404:      	mov	x22, x0
    2408:      	bl	0x22f0 <.text+0x12f0>
    240c:      	mov	x21, x0
    2410:      	tbnz	x21, #0x3f, 0x244c <.text+0x144c>
    2414:      	ldrb	w8, [x23]
    2418:      	and	w8, w8, #0x1f
    241c:      	cmp	w8, #0x2
    2420:      	b.eq	0x246c <.text+0x146c>
    2424:      	cmp	w8, #0x1
    2428:      	b.eq	0x24c0 <.text+0x14c0>
    242c:      	mov	x21, xzr
    2430:      	cbnz	w8, 0x24d8 <.text+0x14d8>
    2434:      	add	x8, x22, #0x1f0
    2438:      	orr	w9, wzr, #0x2
    243c:      	mov	x21, xzr
    2440:      	str	x8, [x20]
    2444:      	str	x9, [x19]
    2448:      	b	0x24d8 <.text+0x14d8>
    244c:      	adrp	x1, 0x6000 <.text+0x5000>
    2450:      	add	x1, x1, #0xe17
    2454:      	adrp	x2, 0x6000 <.text+0x5000>
    2458:      	add	x2, x2, #0xe37
    245c:      	orr	w0, wzr, #0x80000000
    2460:      	mov	x3, x21
    2464:      	bl	0x4674 <.text+0x3674>
    2468:      	b	0x24d8 <.text+0x14d8>
    246c:      	ldr	x0, [x22, #0x1e8]
    2470:      	add	x3, sp, #0xf
    2474:      	ldrb	w11, [x23, #0x5]
    2478:      	ldrb	w12, [x23, #0x4]
    247c:      	ldr	x13, [x0, #0x38]
    2480:      	bfi	w12, w11, #8, #8
    2484:      	and	w1, w12, #0xf
    2488:      	ubfx	w2, w12, #7, #1
    248c:      	blr	x13
    2490:      	mov	x21, x0
    2494:      	tbnz	x21, #0x3f, 0x24f4 <.text+0x14f4>
    2498:      	ldrb	w13, [sp, #0xf]
    249c:      	adrp	x11, 0xa000
    24a0:      	mov	x21, xzr
    24a4:      	adrp	x9, 0xa000
    24a8:      	add	x11, x11, #0x440
    24ac:      	orr	w12, wzr, #0x2
    24b0:      	str	x11, [x20]
    24b4:      	strh	w13, [x9, #0x440]
    24b8:      	str	x12, [x19]
    24bc:      	b	0x24d8 <.text+0x14d8>
    24c0:      	adrp	x10, 0x7000 <.text+0x6000>
    24c4:      	orr	w8, wzr, #0x2
    24c8:      	add	x10, x10, #0x500
    24cc:      	mov	x21, xzr
    24d0:      	str	x10, [x20]
    24d4:      	str	x8, [x19]
    24d8:      	mov	x0, x21
    24dc:      	sub	sp, x29, #0x30
    24e0:      	ldp	x29, x30, [sp, #0x30]
    24e4:      	ldp	x20, x19, [sp, #0x20]
    24e8:      	ldp	x22, x21, [sp, #0x10]
    24ec:      	ldp	x24, x23, [sp], #0x40
    24f0:      	ret
    24f4:      	adrp	x1, 0x6000 <.text+0x5000>
    24f8:      	add	x1, x1, #0xe47
    24fc:      	b	0x2454 <.text+0x1454>
    2500:      	stp	x20, x19, [sp, #-0x20]!
    2504:      	stp	x29, x30, [sp, #0x10]
    2508:      	add	x29, sp, #0x10
    250c:      	mov	w0, w1
    2510:      	bl	0x22cc <.text+0x12cc>
    2514:      	mov	x19, x0
    2518:      	bl	0x2290 <.text+0x1290>
    251c:      	bl	0x22a0 <.text+0x12a0>
    2520:      	adrp	x1, 0x6000 <.text+0x5000>
    2524:      	adrp	x2, 0x6000 <.text+0x5000>
    2528:      	mov	x4, x0
    252c:      	add	x1, x1, #0xe6d
    2530:      	add	x2, x2, #0xe8d
    2534:      	orr	w0, wzr, #0x80000000
    2538:      	mov	x3, x19
    253c:      	bl	0x4674 <.text+0x3674>
    2540:      	ldp	x29, x30, [sp, #0x10]
    2544:      	orr	w0, wzr, #0x7
    2548:      	ldp	x20, x19, [sp], #0x20
    254c:      	ret
    2550:      	stp	x20, x19, [sp, #-0x20]!
    2554:      	stp	x29, x30, [sp, #0x10]
    2558:      	add	x29, sp, #0x10
    255c:      	mov	x19, x0
    2560:      	add	x1, x19, #0x208
    2564:      	ldr	x0, [x19, #0x1e8]
    2568:      	bl	0x1e70 <.text+0xe70>
    256c:      	strh	wzr, [x19, #0x1f0]
    2570:      	orr	w0, wzr, #0x2
    2574:      	strb	wzr, [x19, #0x1fc]
    2578:      	str	wzr, [x19, #0x1f8]
    257c:      	ldp	x29, x30, [sp, #0x10]
    2580:      	ldp	x20, x19, [sp], #0x20
    2584:      	ret
    2588:      	orr	w0, wzr, #0x4
    258c:      	ret
    2590:      	mov	w0, wzr
    2594:      	ret
    2598:      	stp	x22, x21, [sp, #-0x30]!
    259c:      	stp	x20, x19, [sp, #0x10]
    25a0:      	stp	x29, x30, [sp, #0x20]
    25a4:      	add	x29, sp, #0x20
    25a8:      	sub	sp, sp, #0x10
    25ac:      	mov	x19, x3
    25b0:      	orr	w8, wzr, #0x7
    25b4:      	add	x2, sp, #0xc
    25b8:      	mov	x1, x19
    25bc:      	mov	x20, x0
    25c0:      	str	w8, [sp, #0xc]
    25c4:      	bl	0x26d0 <.text+0x16d0>
    25c8:      	tbz	x0, #0x3f, 0x26b8 <.text+0x16b8>
    25cc:      	adrp	x21, 0x6000 <.text+0x5000>
    25d0:      	adrp	x1, 0x6000 <.text+0x5000>
    25d4:      	add	x21, x21, #0xebd
    25d8:      	add	x1, x1, #0xe9c
    25dc:      	orr	w0, wzr, #0x80000000
    25e0:      	mov	x2, x21
    25e4:      	bl	0x4674 <.text+0x3674>
    25e8:      	ldrb	w3, [x19]
    25ec:      	adrp	x1, 0x6000 <.text+0x5000>
    25f0:      	add	x1, x1, #0xed1
    25f4:      	orr	w0, wzr, #0x80000000
    25f8:      	mov	x2, x21
    25fc:      	bl	0x4674 <.text+0x3674>
    2600:      	ldrb	w3, [x19, #0x1]
    2604:      	adrp	x1, 0x6000 <.text+0x5000>
    2608:      	add	x1, x1, #0xeee
    260c:      	orr	w0, wzr, #0x80000000
    2610:      	mov	x2, x21
    2614:      	bl	0x4674 <.text+0x3674>
    2618:      	ldrb	w9, [x19, #0x3]
    261c:      	adrp	x1, 0x6000 <.text+0x5000>
    2620:      	ldrb	w3, [x19, #0x2]
    2624:      	add	x1, x1, #0xf0b
    2628:      	orr	w0, wzr, #0x80000000
    262c:      	mov	x2, x21
    2630:      	bfi	w3, w9, #8, #8
    2634:      	bl	0x4674 <.text+0x3674>
    2638:      	ldrb	w10, [x19, #0x5]
    263c:      	adrp	x1, 0x6000 <.text+0x5000>
    2640:      	ldrb	w3, [x19, #0x4]
    2644:      	add	x1, x1, #0xf28
    2648:      	orr	w0, wzr, #0x80000000
    264c:      	mov	x2, x21
    2650:      	bfi	w3, w10, #8, #8
    2654:      	bl	0x4674 <.text+0x3674>
    2658:      	ldrb	w11, [x19, #0x7]
    265c:      	adrp	x1, 0x6000 <.text+0x5000>
    2660:      	ldrb	w3, [x19, #0x6]
    2664:      	add	x1, x1, #0xf45
    2668:      	orr	w0, wzr, #0x80000000
    266c:      	mov	x2, x21
    2670:      	bfi	w3, w11, #8, #8
    2674:      	bl	0x4674 <.text+0x3674>
    2678:      	ldr	x0, [x20, #0x1e8]
    267c:      	mov	w1, wzr
    2680:      	ldrb	w12, [x19]
    2684:      	orr	w3, wzr, #0x1
    2688:      	ldr	x9, [x0, #0x40]
    268c:      	lsr	w2, w12, #7
    2690:      	blr	x9
    2694:      	mov	x8, x0
    2698:      	tbz	x8, #0x3f, 0x26b8 <.text+0x16b8>
    269c:      	adrp	x1, 0x6000 <.text+0x5000>
    26a0:      	adrp	x2, 0x6000 <.text+0x5000>
    26a4:      	add	x1, x1, #0x839
    26a8:      	add	x2, x2, #0xebd
    26ac:      	orr	w0, wzr, #0x80000000
    26b0:      	mov	x3, x8
    26b4:      	bl	0x4674 <.text+0x3674>
    26b8:      	ldr	w0, [sp, #0xc]
    26bc:      	sub	sp, x29, #0x20
    26c0:      	ldp	x29, x30, [sp, #0x20]
    26c4:      	ldp	x20, x19, [sp, #0x10]
    26c8:      	ldp	x22, x21, [sp], #0x30
    26cc:      	ret
    26d0:      	stp	x22, x21, [sp, #-0x30]!
    26d4:      	stp	x20, x19, [sp, #0x10]
    26d8:      	stp	x29, x30, [sp, #0x20]
    26dc:      	add	x29, sp, #0x20
    26e0:      	sub	sp, sp, #0x20
    26e4:      	orr	w8, wzr, #0x7
    26e8:      	str	xzr, [sp, #0x18]
    26ec:      	mov	x20, x1
    26f0:      	mov	x19, x0
    26f4:      	str	w8, [x2]
    26f8:      	ldrb	w9, [x20]
    26fc:      	str	xzr, [sp, #0x10]
    2700:      	strb	wzr, [sp, #0xf]
    2704:      	strb	wzr, [sp, #0xe]
    2708:      	and	w10, w9, #0x60
    270c:      	cbnz	w10, 0x2938 <.text+0x1938>
    2710:      	ldrb	w3, [x20, #0x1]
    2714:      	cmp	w3, #0xb
    2718:      	b.hi	0x2744 <.text+0x1744>
    271c:      	adrp	x10, 0x6000 <.text+0x5000>
    2720:      	add	x10, x10, #0xc30
    2724:      	ldr	x10, [x10, x3, lsl #3]
    2728:      	br	x10
    272c:      	add	x2, sp, #0x18
    2730:      	add	x3, sp, #0x10
    2734:      	mov	x0, x19
    2738:      	mov	x1, x20
    273c:      	bl	0x23e0 <.text+0x13e0>
    2740:      	b	0x2774 <.text+0x1774>
    2744:      	sub	w11, w3, #0x30
    2748:      	cmp	w11, #0x2
    274c:      	b.lo	0x29fc <.text+0x19fc>
    2750:      	adrp	x1, 0x7000 <.text+0x6000>
    2754:      	add	x1, x1, #0x254
    2758:      	b	0x288c <.text+0x188c>
    275c:      	mov	w2, wzr
    2760:      	b	0x2768 <.text+0x1768>
    2764:      	orr	w2, wzr, #0x1
    2768:      	mov	x0, x19
    276c:      	mov	x1, x20
    2770:      	bl	0x315c <.text+0x215c>
    2774:      	mov	x21, x0
    2778:      	tbz	x21, #0x3f, 0x29fc <.text+0x19fc>
    277c:      	b	0x293c <.text+0x193c>
    2780:      	ldrb	w14, [x20, #0x2]
    2784:      	orr	w15, wzr, #0x2
    2788:      	strb	w14, [x19, #0x1fc]
    278c:      	str	w15, [x2]
    2790:      	b	0x29fc <.text+0x19fc>
    2794:      	ldrb	w11, [x20, #0x3]
    2798:      	mov	x21, #-0x7ffffffffffffffd // =-9223372036854775805
    279c:      	ldrb	w8, [x20, #0x2]
    27a0:      	bfi	x8, x11, #8, #8
    27a4:      	ubfx	x12, x8, #8, #24
    27a8:      	sub	w9, w12, #0x1
    27ac:      	cmp	w9, #0xe
    27b0:      	b.hi	0x293c <.text+0x193c>
    27b4:      	adrp	x13, 0x6000 <.text+0x5000>
    27b8:      	add	x13, x13, #0xc90
    27bc:      	ldr	x13, [x13, x9, lsl #3]
    27c0:      	br	x13
    27c4:      	ldr	w12, [x19, #0x1f8]
    27c8:      	cmp	w12, #0x4
    27cc:      	b.ne	0x296c <.text+0x196c>
    27d0:      	ldrb	w0, [x19, #0x24d]
    27d4:      	add	x8, x19, #0x24a
    27d8:      	ldrb	w13, [x19, #0x24c]
    27dc:      	str	x8, [sp, #0x18]
    27e0:      	bfi	w13, w0, #8, #8
    27e4:      	cmp	w13, #0x300
    27e8:      	b.ne	0x27fc <.text+0x17fc>
    27ec:      	orr	w4, wzr, #0x3
    27f0:      	orr	w5, wzr, #0x10
    27f4:      	strb	w4, [x19, #0x24d]
    27f8:      	strb	w5, [x19, #0x24c]
    27fc:      	ldrb	w14, [x8]
    2800:      	str	x14, [sp, #0x10]
    2804:      	b	0x29fc <.text+0x19fc>
    2808:      	bl	0x2290 <.text+0x1290>
    280c:      	cmp	w0, #0x3
    2810:      	add	x10, sp, #0xf
    2814:      	cset	w13, eq
    2818:      	orr	w8, wzr, #0x1
    281c:      	stp	x8, x10, [sp, #0x10]
    2820:      	strb	w13, [sp, #0xf]
    2824:      	b	0x29fc <.text+0x19fc>
    2828:      	ldr	w9, [x19, #0x1f8]
    282c:      	cmp	w9, #0x4
    2830:      	b.eq	0x2868 <.text+0x1868>
    2834:      	cbnz	w9, 0x2870 <.text+0x1870>
    2838:      	adrp	x1, 0x7000 <.text+0x6000>
    283c:      	add	x1, x1, #0x1ef
    2840:      	b	0x2928 <.text+0x1928>
    2844:      	add	x11, sp, #0xe
    2848:      	orr	w12, wzr, #0x1
    284c:      	stp	x12, x11, [sp, #0x10]
    2850:      	b	0x29fc <.text+0x19fc>
    2854:      	ldrb	w12, [x20, #0x3]
    2858:      	ldrb	w13, [x20, #0x2]
    285c:      	bfi	w13, w12, #8, #8
    2860:      	cbnz	w13, 0x2938 <.text+0x1938>
    2864:      	b	0x29fc <.text+0x19fc>
    2868:      	add	x8, x19, #0x25b
    286c:      	b	0x2874 <.text+0x1874>
    2870:      	add	x8, x19, #0x249
    2874:      	ldrb	w3, [x20, #0x2]
    2878:      	ldrb	w15, [x8]
    287c:      	cmp	w3, w15
    2880:      	b.ls	0x28a0 <.text+0x18a0>
    2884:      	adrp	x1, 0x7000 <.text+0x6000>
    2888:      	add	x1, x1, #0x21a
    288c:      	adrp	x2, 0x7000 <.text+0x6000>
    2890:      	add	x2, x2, #0x1dd
    2894:      	orr	w0, wzr, #0x80000000
    2898:      	bl	0x4674 <.text+0x3674>
    289c:      	b	0x2938 <.text+0x1938>
    28a0:      	cmp	w3, #0x0
    28a4:      	orr	w0, wzr, #0x2
    28a8:      	cinc	w3, w0, ne
    28ac:      	str	w3, [x2]
    28b0:      	b	0x29fc <.text+0x19fc>
    28b4:      	ldr	w14, [x19, #0x1f8]
    28b8:      	cmp	w14, #0x4
    28bc:      	b.ne	0x297c <.text+0x197c>
    28c0:      	ldr	x16, [x19, #0x270]
    28c4:      	ldr	x17, [x16]
    28c8:      	ldrb	w3, [x17, #0x3]
    28cc:      	ldrb	w4, [x17, #0x2]
    28d0:      	bfi	x4, x3, #8, #8
    28d4:      	stp	x4, x17, [sp, #0x10]
    28d8:      	b	0x29fc <.text+0x19fc>
    28dc:      	ldrb	w10, [x19, #0x280]
    28e0:      	and	w15, w8, #0xff
    28e4:      	cmp	w15, w10
    28e8:      	b.hs	0x2938 <.text+0x1938>
    28ec:      	ldr	x3, [x19, #0x288]
    28f0:      	and	x0, x8, #0xff
    28f4:      	ldr	x8, [x3, x0, lsl #3]
    28f8:      	ldrb	w1, [x8]
    28fc:      	stp	x1, x8, [sp, #0x10]
    2900:      	b	0x29fc <.text+0x19fc>
    2904:      	ldrb	w16, [x19, #0x25c]
    2908:      	add	x15, x19, #0x25c
    290c:      	stp	x16, x15, [sp, #0x10]
    2910:      	b	0x29fc <.text+0x19fc>
    2914:      	ldr	w8, [x19, #0x1f8]
    2918:      	cmp	w8, #0x4
    291c:      	b.ne	0x2998 <.text+0x1998>
    2920:      	adrp	x1, 0x7000 <.text+0x6000>
    2924:      	add	x1, x1, #0x197
    2928:      	adrp	x2, 0x7000 <.text+0x6000>
    292c:      	add	x2, x2, #0x1dd
    2930:      	orr	w0, wzr, #0x80000000
    2934:      	bl	0x4674 <.text+0x3674>
    2938:      	mov	x21, #-0x7ffffffffffffffd // =-9223372036854775805
    293c:      	mov	x0, x21
    2940:      	sub	sp, x29, #0x20
    2944:      	ldp	x29, x30, [sp, #0x20]
    2948:      	ldp	x20, x19, [sp, #0x10]
    294c:      	ldp	x22, x21, [sp], #0x30
    2950:      	ret
    2954:      	ldr	x9, [x19, #0x278]
    2958:      	ldrb	w2, [x9, #0x3]
    295c:      	ldrb	w0, [x9, #0x2]
    2960:      	bfi	x0, x2, #8, #8
    2964:      	stp	x0, x9, [sp, #0x10]
    2968:      	b	0x29fc <.text+0x19fc>
    296c:      	ldrb	w15, [x19, #0x238]
    2970:      	add	x14, x19, #0x238
    2974:      	stp	x15, x14, [sp, #0x10]
    2978:      	b	0x29fc <.text+0x19fc>
    297c:      	ldr	x1, [x19, #0x268]
    2980:      	ldr	x4, [x1]
    2984:      	ldrb	w17, [x4, #0x3]
    2988:      	ldrb	w5, [x4, #0x2]
    298c:      	bfi	x5, x17, #8, #8
    2990:      	stp	x5, x4, [sp, #0x10]
    2994:      	b	0x29fc <.text+0x19fc>
    2998:      	ldr	x0, [x19, #0x1e8]
    299c:      	cmp	w8, #0x3
    29a0:      	orr	w1, wzr, #0x2
    29a4:      	cinc	w2, w1, ne
    29a8:      	orr	w1, wzr, #0x2
    29ac:      	ldr	x6, [x0, #0x18]
    29b0:      	add	x3, sp, #0xc
    29b4:      	blr	x6
    29b8:      	mov	x21, x0
    29bc:      	tbnz	x21, #0x3f, 0x2b70 <.text+0x1b70>
    29c0:      	ldr	w8, [x19, #0x1f8]
    29c4:      	cbz	w8, 0x2b70 <.text+0x1b70>
    29c8:      	ldrh	w1, [sp, #0xc]
    29cc:      	add	x0, x19, #0x238
    29d0:      	bl	0x2e94 <.text+0x1e94>
    29d4:      	ldr	x5, [x19, #0x268]
    29d8:      	orr	w9, wzr, #0x7
    29dc:      	ldr	x6, [x5]
    29e0:      	strb	w9, [x6, #0x1]
    29e4:      	ldr	x7, [x19, #0x268]
    29e8:      	ldr	x2, [x7]
    29ec:      	ldrb	w7, [x2, #0x3]
    29f0:      	ldrb	w21, [x2, #0x2]
    29f4:      	bfi	x21, x7, #8, #8
    29f8:      	stp	x21, x2, [sp, #0x10]
    29fc:      	ldr	w4, [x19, #0x210]
    2a00:      	cbz	w4, 0x2a40 <.text+0x1a40>
    2a04:      	adrp	x1, 0x7000 <.text+0x6000>
    2a08:      	adrp	x2, 0x6000 <.text+0x5000>
    2a0c:      	mov	w21, #0x33f             // =831
    2a10:      	add	x1, x1, #0x273
    2a14:      	add	x2, x2, #0xf9f
    2a18:      	orr	w0, wzr, #0x80000000
    2a1c:      	mov	w3, w21
    2a20:      	bl	0x4674 <.text+0x3674>
    2a24:      	adrp	x0, 0x7000 <.text+0x6000>
    2a28:      	adrp	x2, 0x8000 <.text+0x7000>
    2a2c:      	add	x0, x0, #0xb
    2a30:      	add	x2, x2, #0xb90
    2a34:      	mov	x1, x21
    2a38:      	bl	0x4a00 <.text+0x3a00>
    2a3c:      	b	0x2a3c <.text+0x1a3c>
    2a40:      	ldrb	w10, [x20, #0x7]
    2a44:      	ldrb	w9, [x20, #0x6]
    2a48:      	bfi	x9, x10, #8, #8
    2a4c:      	cbz	x9, 0x2aa0 <.text+0x1aa0>
    2a50:      	ldrsb	w6, [x20]
    2a54:      	tbnz	w6, #0x1f, 0x2ab4 <.text+0x1ab4>
    2a58:      	ldr	x15, [x19, #0x220]
    2a5c:      	cmp	x9, x15
    2a60:      	b.ls	0x2b38 <.text+0x1b38>
    2a64:      	ldr	x0, [x19, #0x1e8]
    2a68:      	mov	w1, wzr
    2a6c:      	mov	w2, wzr
    2a70:      	orr	w3, wzr, #0x1
    2a74:      	ldr	x4, [x0, #0x40]
    2a78:      	blr	x4
    2a7c:      	mov	x21, x0
    2a80:      	tbnz	x21, #0x3f, 0x2b64 <.text+0x1b64>
    2a84:      	adrp	x1, 0x7000 <.text+0x6000>
    2a88:      	adrp	x2, 0x7000 <.text+0x6000>
    2a8c:      	add	x1, x1, #0x2ab
    2a90:      	add	x2, x2, #0x1dd
    2a94:      	orr	w0, wzr, #0x80000000
    2a98:      	bl	0x4674 <.text+0x3674>
    2a9c:      	b	0x293c <.text+0x193c>
    2aa0:      	orr	w5, wzr, #0x1
    2aa4:      	str	xzr, [x19, #0x228]
    2aa8:      	str	xzr, [x19, #0x230]
    2aac:      	str	w5, [x19, #0x20c]
    2ab0:      	b	0x2b50 <.text+0x1b50>
    2ab4:      	orr	w7, wzr, #0x1
    2ab8:      	str	xzr, [x19, #0x228]
    2abc:      	str	w7, [x19, #0x20c]
    2ac0:      	ldrb	w9, [x20, #0x7]
    2ac4:      	ldrb	w12, [x20, #0x6]
    2ac8:      	ldp	x11, x1, [sp, #0x10]
    2acc:      	ldr	x0, [x19, #0x218]
    2ad0:      	bfi	x12, x9, #8, #8
    2ad4:      	cmp	x12, x11
    2ad8:      	csel	x2, x12, x11, lo
    2adc:      	str	x2, [x19, #0x230]
    2ae0:      	bl	0x4c10 <.text+0x3c10>
    2ae4:      	ldrb	w16, [x20, #0x1]
    2ae8:      	cmp	w16, #0x6
    2aec:      	b.ne	0x2b50 <.text+0x1b50>
    2af0:      	ldrb	w1, [x20, #0x3]
    2af4:      	lsl	w17, w1, #8
    2af8:      	cmp	w17, #0x700
    2afc:      	b.ne	0x2b50 <.text+0x1b50>
    2b00:      	ldr	x0, [x19, #0x1e8]
    2b04:      	orr	w1, wzr, #0x2
    2b08:      	ldr	w2, [x19, #0x1f8]
    2b0c:      	add	x3, sp, #0xc
    2b10:      	orr	w20, wzr, #0x2
    2b14:      	ldr	x14, [x0, #0x18]
    2b18:      	blr	x14
    2b1c:      	ldrh	w1, [sp, #0xc]
    2b20:      	add	x0, x19, #0x238
    2b24:      	bl	0x2e94 <.text+0x1e94>
    2b28:      	ldr	x11, [x19, #0x268]
    2b2c:      	ldr	x12, [x11]
    2b30:      	strb	w20, [x12, #0x1]
    2b34:      	b	0x2b50 <.text+0x1b50>
    2b38:      	str	xzr, [x19, #0x228]
    2b3c:      	str	wzr, [x19, #0x20c]
    2b40:      	ldrb	w3, [x20, #0x7]
    2b44:      	ldrb	w17, [x20, #0x6]
    2b48:      	bfi	x17, x3, #8, #8
    2b4c:      	str	x17, [x19, #0x230]
    2b50:      	ldr	x0, [x19, #0x1e8]
    2b54:      	add	x1, x19, #0x208
    2b58:      	bl	0x1d68 <.text+0xd68>
    2b5c:      	mov	x21, x0
    2b60:      	b	0x293c <.text+0x193c>
    2b64:      	adrp	x1, 0x6000 <.text+0x5000>
    2b68:      	add	x1, x1, #0x839
    2b6c:      	b	0x2b78 <.text+0x1b78>
    2b70:      	adrp	x1, 0x6000 <.text+0x5000>
    2b74:      	add	x1, x1, #0x6c2
    2b78:      	adrp	x2, 0x7000 <.text+0x6000>
    2b7c:      	add	x2, x2, #0x1dd
    2b80:      	orr	w0, wzr, #0x80000000
    2b84:      	mov	x3, x21
    2b88:      	bl	0x4674 <.text+0x3674>
    2b8c:      	b	0x293c <.text+0x193c>
    2b90:      	stp	x20, x19, [sp, #-0x20]!
    2b94:      	stp	x29, x30, [sp, #0x10]
    2b98:      	add	x29, sp, #0x10
    2b9c:      	mov	x19, x0
    2ba0:      	cmp	w1, #0x2
    2ba4:      	b.ne	0x2c00 <.text+0x1c00>
    2ba8:      	ldrb	w9, [x3, #0xc]
    2bac:      	cbnz	w9, 0x2c94 <.text+0x1c94>
    2bb0:      	ldrb	w10, [x19, #0x290]
    2bb4:      	cbnz	w10, 0x2c94 <.text+0x1c94>
    2bb8:      	str	wzr, [x19, #0x210]
    2bbc:      	ldr	w8, [x3, #0x8]
    2bc0:      	cmp	w8, #0x2
    2bc4:      	b.eq	0x2c94 <.text+0x1c94>
    2bc8:      	cmp	w8, #0x1
    2bcc:      	b.ne	0x2c3c <.text+0x1c3c>
    2bd0:      	ldr	x9, [x3]
    2bd4:      	cbz	x9, 0x2c94 <.text+0x1c94>
    2bd8:      	ldr	x0, [x19, #0x1e8]
    2bdc:      	orr	w13, wzr, #0x1
    2be0:      	add	x1, x19, #0x208
    2be4:      	str	xzr, [x19, #0x228]
    2be8:      	str	xzr, [x19, #0x230]
    2bec:      	str	w13, [x19, #0x20c]
    2bf0:      	bl	0x1d68 <.text+0xd68>
    2bf4:      	mov	x3, x0
    2bf8:      	tbz	x3, #0x3f, 0x2c94 <.text+0x1c94>
    2bfc:      	b	0x2c40 <.text+0x1c40>
    2c00:      	adrp	x1, 0x6000 <.text+0x5000>
    2c04:      	adrp	x2, 0x6000 <.text+0x5000>
    2c08:      	mov	w19, #0x4fa             // =1274
    2c0c:      	add	x1, x1, #0xf62
    2c10:      	add	x2, x2, #0xf9f
    2c14:      	orr	w0, wzr, #0x80000000
    2c18:      	mov	w3, w19
    2c1c:      	bl	0x4674 <.text+0x3674>
    2c20:      	adrp	x0, 0x7000 <.text+0x6000>
    2c24:      	adrp	x2, 0x8000 <.text+0x7000>
    2c28:      	add	x0, x0, #0xb
    2c2c:      	add	x2, x2, #0xb90
    2c30:      	mov	x1, x19
    2c34:      	bl	0x4a00 <.text+0x3a00>
    2c38:      	b	0x2c38 <.text+0x1c38>
    2c3c:      	mov	x3, #-0x7ffffffffffffff9 // =-9223372036854775801
    2c40:      	adrp	x1, 0x7000 <.text+0x6000>
    2c44:      	adrp	x2, 0x7000 <.text+0x6000>
    2c48:      	add	x1, x1, #0x1a
    2c4c:      	add	x2, x2, #0x45
    2c50:      	orr	w0, wzr, #0x80000000
    2c54:      	bl	0x4674 <.text+0x3674>
    2c58:      	ldr	x0, [x19, #0x1e8]
    2c5c:      	mov	w1, wzr
    2c60:      	mov	w2, wzr
    2c64:      	orr	w3, wzr, #0x1
    2c68:      	ldr	x10, [x0, #0x40]
    2c6c:      	blr	x10
    2c70:      	mov	x8, x0
    2c74:      	tbz	x8, #0x3f, 0x2c94 <.text+0x1c94>
    2c78:      	adrp	x1, 0x6000 <.text+0x5000>
    2c7c:      	adrp	x2, 0x7000 <.text+0x6000>
    2c80:      	add	x1, x1, #0x839
    2c84:      	add	x2, x2, #0x45
    2c88:      	orr	w0, wzr, #0x80000000
    2c8c:      	mov	x3, x8
    2c90:      	bl	0x4674 <.text+0x3674>
    2c94:      	ldp	x29, x30, [sp, #0x10]
    2c98:      	orr	w0, wzr, #0x7
    2c9c:      	ldp	x20, x19, [sp], #0x20
    2ca0:      	ret
    2ca4:      	stp	x20, x19, [sp, #-0x20]!
    2ca8:      	stp	x29, x30, [sp, #0x10]
    2cac:      	add	x29, sp, #0x10
    2cb0:      	mov	x19, x0
    2cb4:      	cmp	w1, #0x3
    2cb8:      	b.ne	0x2d10 <.text+0x1d10>
    2cbc:      	ldrb	w9, [x3, #0xc]
    2cc0:      	cbnz	w9, 0x2da4 <.text+0x1da4>
    2cc4:      	ldrb	w10, [x19, #0x290]
    2cc8:      	cbnz	w10, 0x2da4 <.text+0x1da4>
    2ccc:      	str	wzr, [x19, #0x210]
    2cd0:      	ldr	w8, [x3, #0x8]
    2cd4:      	cmp	w8, #0x2
    2cd8:      	b.eq	0x2da4 <.text+0x1da4>
    2cdc:      	cmp	w8, #0x1
    2ce0:      	b.ne	0x2d4c <.text+0x1d4c>
    2ce4:      	ldr	x9, [x3]
    2ce8:      	cbz	x9, 0x2da4 <.text+0x1da4>
    2cec:      	ldr	x0, [x19, #0x1e8]
    2cf0:      	add	x1, x19, #0x208
    2cf4:      	str	wzr, [x19, #0x20c]
    2cf8:      	str	xzr, [x19, #0x228]
    2cfc:      	str	xzr, [x19, #0x230]
    2d00:      	bl	0x1d68 <.text+0xd68>
    2d04:      	mov	x3, x0
    2d08:      	tbz	x3, #0x3f, 0x2da4 <.text+0x1da4>
    2d0c:      	b	0x2d50 <.text+0x1d50>
    2d10:      	adrp	x1, 0x7000 <.text+0x6000>
    2d14:      	adrp	x2, 0x6000 <.text+0x5000>
    2d18:      	mov	w19, #0x534             // =1332
    2d1c:      	add	x1, x1, #0x62
    2d20:      	add	x2, x2, #0xf9f
    2d24:      	orr	w0, wzr, #0x80000000
    2d28:      	mov	w3, w19
    2d2c:      	bl	0x4674 <.text+0x3674>
    2d30:      	adrp	x0, 0x7000 <.text+0x6000>
    2d34:      	adrp	x2, 0x8000 <.text+0x7000>
    2d38:      	add	x0, x0, #0xb
    2d3c:      	add	x2, x2, #0xb90
    2d40:      	mov	x1, x19
    2d44:      	bl	0x4a00 <.text+0x3a00>
    2d48:      	b	0x2d48 <.text+0x1d48>
    2d4c:      	mov	x3, #-0x7ffffffffffffff9 // =-9223372036854775801
    2d50:      	adrp	x1, 0x7000 <.text+0x6000>
    2d54:      	adrp	x2, 0x7000 <.text+0x6000>
    2d58:      	add	x1, x1, #0x1a
    2d5c:      	add	x2, x2, #0x9f
    2d60:      	orr	w0, wzr, #0x80000000
    2d64:      	bl	0x4674 <.text+0x3674>
    2d68:      	ldr	x0, [x19, #0x1e8]
    2d6c:      	mov	w1, wzr
    2d70:      	mov	w2, wzr
    2d74:      	orr	w3, wzr, #0x1
    2d78:      	ldr	x10, [x0, #0x40]
    2d7c:      	blr	x10
    2d80:      	mov	x8, x0
    2d84:      	tbz	x8, #0x3f, 0x2da4 <.text+0x1da4>
    2d88:      	adrp	x1, 0x6000 <.text+0x5000>
    2d8c:      	adrp	x2, 0x7000 <.text+0x6000>
    2d90:      	add	x1, x1, #0x839
    2d94:      	add	x2, x2, #0x9f
    2d98:      	orr	w0, wzr, #0x80000000
    2d9c:      	mov	x3, x8
    2da0:      	bl	0x4674 <.text+0x3674>
    2da4:      	ldp	x29, x30, [sp, #0x10]
    2da8:      	orr	w0, wzr, #0x7
    2dac:      	ldp	x20, x19, [sp], #0x20
    2db0:      	ret
    2db4:      	stp	x20, x19, [sp, #-0x20]!
    2db8:      	stp	x29, x30, [sp, #0x10]
    2dbc:      	add	x29, sp, #0x10
    2dc0:      	sub	sp, sp, #0x10
    2dc4:      	mov	x19, x0
    2dc8:      	cmp	w1, #0x9
    2dcc:      	strh	wzr, [sp, #0xe]
    2dd0:      	b.ne	0x2e28 <.text+0x1e28>
    2dd4:      	ldr	w2, [x3]
    2dd8:      	orr	w1, wzr, #0x2
    2ddc:      	ldr	x0, [x19, #0x1e8]
    2de0:      	add	x3, sp, #0xe
    2de4:      	str	w2, [x19, #0x1f8]
    2de8:      	ldr	x9, [x0, #0x18]
    2dec:      	blr	x9
    2df0:      	mov	x8, x0
    2df4:      	tbnz	x8, #0x3f, 0x2e08 <.text+0x1e08>
    2df8:      	ldr	w9, [x19, #0x1f8]
    2dfc:      	cmp	w9, #0x4
    2e00:      	b.eq	0x2e70 <.text+0x1e70>
    2e04:      	cbnz	w9, 0x2e64 <.text+0x1e64>
    2e08:      	adrp	x1, 0x6000 <.text+0x5000>
    2e0c:      	adrp	x2, 0x7000 <.text+0x6000>
    2e10:      	add	x1, x1, #0x6c2
    2e14:      	add	x2, x2, #0xef
    2e18:      	orr	w0, wzr, #0x80000000
    2e1c:      	mov	x3, x8
    2e20:      	bl	0x4674 <.text+0x3674>
    2e24:      	b	0x2e70 <.text+0x1e70>
    2e28:      	adrp	x1, 0x7000 <.text+0x6000>
    2e2c:      	adrp	x2, 0x6000 <.text+0x5000>
    2e30:      	mov	w19, #0x56f             // =1391
    2e34:      	add	x1, x1, #0xbc
    2e38:      	add	x2, x2, #0xf9f
    2e3c:      	orr	w0, wzr, #0x80000000
    2e40:      	mov	w3, w19
    2e44:      	bl	0x4674 <.text+0x3674>
    2e48:      	adrp	x0, 0x7000 <.text+0x6000>
    2e4c:      	adrp	x2, 0x8000 <.text+0x7000>
    2e50:      	add	x0, x0, #0xb
    2e54:      	add	x2, x2, #0xb90
    2e58:      	mov	x1, x19
    2e5c:      	bl	0x4a00 <.text+0x3a00>
    2e60:      	b	0x2e60 <.text+0x1e60>
    2e64:      	ldrh	w1, [sp, #0xe]
    2e68:      	add	x0, x19, #0x238
    2e6c:      	bl	0x2e94 <.text+0x1e94>
    2e70:      	ldr	w8, [x19, #0x1f8]
    2e74:      	orr	w9, wzr, #0x7
    2e78:      	cmp	w8, #0x4
    2e7c:      	orr	w12, wzr, #0x2
    2e80:      	csel	w0, w12, w9, eq
    2e84:      	sub	sp, x29, #0x10
    2e88:      	ldp	x29, x30, [sp, #0x10]
    2e8c:      	ldp	x20, x19, [sp], #0x20
    2e90:      	ret
    2e94:      	cbz	x0, 0x2f74 <.text+0x1f74>
    2e98:      	ldrb	w9, [x0, #0x11]
    2e9c:      	mov	x8, xzr
    2ea0:      	mov	x10, xzr
    2ea4:      	lsr	w11, w1, #8
    2ea8:      	b	0x2eb4 <.text+0x1eb4>
    2eac:      	add	x10, x10, #0x1
    2eb0:      	add	x8, x8, #0x8
    2eb4:      	and	w12, w10, #0xff
    2eb8:      	cmp	w12, w9
    2ebc:      	b.eq	0x2f70 <.text+0x1f70>
    2ec0:      	ldr	x12, [x0, #0x30]
    2ec4:      	ldr	x13, [x12, x8]
    2ec8:      	ldrb	w12, [x13, #0x4]
    2ecc:      	add	x16, x13, #0x9
    2ed0:      	b	0x2edc <.text+0x1edc>
    2ed4:      	ldrb	w13, [x16]
    2ed8:      	add	x16, x16, x13
    2edc:      	ldrb	w14, [x16, #0x1]
    2ee0:      	cmp	w14, #0x4
    2ee4:      	b.ne	0x2ed4 <.text+0x1ed4>
    2ee8:      	mov	w13, wzr
    2eec:      	b	0x2f00 <.text+0x1f00>
    2ef0:      	lsl	x17, x14, #3
    2ef4:      	sub	x3, x17, x14
    2ef8:      	add	x16, x15, x3
    2efc:      	add	w13, w13, #0x1
    2f00:      	and	w15, w13, #0xff
    2f04:      	cmp	w15, w12
    2f08:      	b.eq	0x2eac <.text+0x1eac>
    2f0c:      	ldrb	w14, [x16, #0x4]
    2f10:      	add	x15, x16, #0x9
    2f14:      	b	0x2f20 <.text+0x1f20>
    2f18:      	ldrb	w16, [x15]
    2f1c:      	add	x15, x15, x16
    2f20:      	ldrb	w17, [x15, #0x1]
    2f24:      	cmp	w17, #0x5
    2f28:      	b.ne	0x2f18 <.text+0x1f18>
    2f2c:      	mov	w16, wzr
    2f30:      	add	x17, x15, #0x4
    2f34:      	b	0x2f40 <.text+0x1f40>
    2f38:      	add	w16, w16, #0x1
    2f3c:      	mov	x17, x2
    2f40:      	mov	w2, w14
    2f44:      	and	w3, w16, #0xff
    2f48:      	cmp	w3, w2
    2f4c:      	b.eq	0x2ef0 <.text+0x1ef0>
    2f50:      	ldurb	w4, [x17, #-0x1]
    2f54:      	add	x2, x17, #0x7
    2f58:      	and	w3, w4, #0x3
    2f5c:      	cmp	w3, #0x2
    2f60:      	b.ne	0x2f38 <.text+0x1f38>
    2f64:      	strb	w1, [x17]
    2f68:      	strb	w11, [x17, #0x1]
    2f6c:      	b	0x2f38 <.text+0x1f38>
    2f70:      	ret
    2f74:      	adrp	x1, 0x6000 <.text+0x5000>
    2f78:      	adrp	x2, 0x7000 <.text+0x6000>
    2f7c:      	add	x1, x1, #0x642
    2f80:      	add	x2, x2, #0x4ec
    2f84:      	orr	w0, wzr, #0x80000000
    2f88:      	b	0x4674 <.text+0x3674>
    2f8c:      	str	wzr, [x0, #0x1f4]
    2f90:      	str	wzr, [x0, #0x1f8]
    2f94:      	str	wzr, [x0, #0x200]
    2f98:      	ret
    2f9c:      	orr	w0, wzr, #0x1
    2fa0:      	ret
    2fa4:      	stp	x29, x30, [sp, #-0x10]!
    2fa8:      	mov	x29, sp
    2fac:      	ldr	x8, [x0, #0x1e8]
    2fb0:      	add	x1, x0, #0x1f4
    2fb4:      	ldr	x9, [x8, #0x8]
    2fb8:      	mov	x0, x8
    2fbc:      	blr	x9
    2fc0:      	mov	x8, x0
    2fc4:      	tbnz	x8, #0x3f, 0x2fd0 <.text+0x1fd0>
    2fc8:      	ldp	x29, x30, [sp], #0x10
    2fcc:      	ret
    2fd0:      	adrp	x1, 0x7000 <.text+0x6000>
    2fd4:      	adrp	x2, 0x7000 <.text+0x6000>
    2fd8:      	add	x1, x1, #0x100
    2fdc:      	add	x2, x2, #0x124
    2fe0:      	orr	w0, wzr, #0x80000000
    2fe4:      	mov	x3, x8
    2fe8:      	ldp	x29, x30, [sp], #0x10
    2fec:      	b	0x4674 <.text+0x3674>
    2ff0:      	ldrb	w8, [x0]
    2ff4:      	ubfx	w3, w8, #5, #2
    2ff8:      	cbz	w3, 0x3028 <.text+0x2028>
    2ffc:      	stp	x29, x30, [sp, #-0x10]!
    3000:      	mov	x29, sp
    3004:      	adrp	x1, 0x7000 <.text+0x6000>
    3008:      	adrp	x2, 0x7000 <.text+0x6000>
    300c:      	add	x1, x1, #0x137
    3010:      	add	x2, x2, #0x165
    3014:      	orr	w0, wzr, #0x80000000
    3018:      	bl	0x4674 <.text+0x3674>
    301c:      	mov	w0, wzr
    3020:      	ldp	x29, x30, [sp], #0x10
    3024:      	ret
    3028:      	ldrb	w9, [x0, #0x1]
    302c:      	cmp	w9, #0x6
    3030:      	b.ne	0x305c <.text+0x205c>
    3034:      	ldrb	w8, [x0, #0x3]
    3038:      	mov	w0, wzr
    303c:      	cmp	w8, #0xf
    3040:      	b.hi	0x3064 <.text+0x2064>
    3044:      	orr	w12, wzr, #0x1
    3048:      	mov	w13, #0x84ce            // =33998
    304c:      	lsl	w14, w12, w8
    3050:      	and	w15, w14, w13
    3054:      	cbz	w15, 0x3064 <.text+0x2064>
    3058:      	ret
    305c:      	mov	w0, wzr
    3060:      	ret
    3064:      	cmp	w8, #0xfe
    3068:      	b.eq	0x3058 <.text+0x2058>
    306c:      	orr	w0, wzr, #0x1
    3070:      	ret
    3074:      	stp	x22, x21, [sp, #-0x30]!
    3078:      	stp	x20, x19, [sp, #0x10]
    307c:      	stp	x29, x30, [sp, #0x20]
    3080:      	add	x29, sp, #0x20
    3084:      	sub	sp, sp, #0x10
    3088:      	mov	x20, x3
    308c:      	orr	w21, wzr, #0x7
    3090:      	mov	x19, x0
    3094:      	mov	x0, x20
    3098:      	str	w21, [sp, #0xc]
    309c:      	bl	0x2ff0 <.text+0x1ff0>
    30a0:      	and	w8, w0, #0xff
    30a4:      	cbz	w8, 0x30b8 <.text+0x20b8>
    30a8:      	orr	w9, wzr, #0x1
    30ac:      	str	w21, [sp, #0xc]
    30b0:      	strb	w9, [x19, #0x290]
    30b4:      	b	0x3134 <.text+0x2134>
    30b8:      	ldrb	w8, [x20]
    30bc:      	ubfx	w9, w8, #5, #2
    30c0:      	cmp	w9, #0x1
    30c4:      	b.eq	0x3124 <.text+0x2124>
    30c8:      	cbnz	w9, 0x30e4 <.text+0x20e4>
    30cc:      	add	x2, sp, #0xc
    30d0:      	mov	x0, x19
    30d4:      	mov	x1, x20
    30d8:      	bl	0x26d0 <.text+0x16d0>
    30dc:      	tbz	x0, #0x3f, 0x3134 <.text+0x2134>
    30e0:      	ldrb	w8, [x20]
    30e4:      	ldr	x0, [x19, #0x1e8]
    30e8:      	mov	w1, wzr
    30ec:      	orr	w3, wzr, #0x1
    30f0:      	lsr	w2, w8, #7
    30f4:      	ldr	x9, [x0, #0x40]
    30f8:      	blr	x9
    30fc:      	mov	x8, x0
    3100:      	tbz	x8, #0x3f, 0x3134 <.text+0x2134>
    3104:      	adrp	x1, 0x6000 <.text+0x5000>
    3108:      	adrp	x2, 0x7000 <.text+0x6000>
    310c:      	add	x1, x1, #0x839
    3110:      	add	x2, x2, #0x17f
    3114:      	orr	w0, wzr, #0x80000000
    3118:      	mov	x3, x8
    311c:      	bl	0x4674 <.text+0x3674>
    3120:      	b	0x3134 <.text+0x2134>
    3124:      	orr	w11, wzr, #0x7
    3128:      	orr	w12, wzr, #0x1
    312c:      	str	w11, [sp, #0xc]
    3130:      	strb	w12, [x19, #0x290]
    3134:      	ldr	w0, [sp, #0xc]
    3138:      	sub	sp, x29, #0x20
    313c:      	ldp	x29, x30, [sp, #0x20]
    3140:      	ldp	x20, x19, [sp, #0x10]
    3144:      	ldp	x22, x21, [sp], #0x30
    3148:      	ret
    314c:      	str	w1, [x0, #0x200]
    3150:      	ret
    3154:      	ldr	w0, [x0, #0x200]
    3158:      	ret
    315c:      	stp	x20, x19, [sp, #-0x20]!
    3160:      	stp	x29, x30, [sp, #0x10]
    3164:      	add	x29, sp, #0x10
    3168:      	ldrb	w11, [x1]
    316c:      	mov	w8, w2
    3170:      	ldrb	w12, [x1, #0x3]
    3174:      	ldrb	w3, [x1, #0x2]
    3178:      	and	w9, w11, #0x1f
    317c:      	cmp	w9, #0x2
    3180:      	bfi	w3, w12, #8, #8
    3184:      	b.eq	0x31b4 <.text+0x21b4>
    3188:      	cmp	w9, #0x1
    318c:      	b.eq	0x31e0 <.text+0x21e0>
    3190:      	cbnz	w9, 0x321c <.text+0x221c>
    3194:      	and	w10, w8, #0xff
    3198:      	cbz	w10, 0x3238 <.text+0x2238>
    319c:      	cmp	w10, #0x1
    31a0:      	b.ne	0x3240 <.text+0x2240>
    31a4:      	ldr	w11, [x0, #0x1e0]
    31a8:      	cmp	w11, #0x3
    31ac:      	b.eq	0x3240 <.text+0x2240>
    31b0:      	b	0x3210 <.text+0x2210>
    31b4:      	ldrb	w2, [x0, #0x1fc]
    31b8:      	cbz	w2, 0x31c8 <.text+0x21c8>
    31bc:      	ldr	w17, [x0, #0x1e0]
    31c0:      	cmp	w17, #0x3
    31c4:      	b.eq	0x31d0 <.text+0x21d0>
    31c8:      	ldrb	w11, [x1, #0x4]
    31cc:      	cbnz	w11, 0x3210 <.text+0x2210>
    31d0:      	cbz	w3, 0x3290 <.text+0x2290>
    31d4:      	adrp	x1, 0x7000 <.text+0x6000>
    31d8:      	add	x1, x1, #0x4b2
    31dc:      	b	0x3380 <.text+0x2380>
    31e0:      	ldrb	w7, [x0, #0x1fc]
    31e4:      	cbz	w7, 0x3210 <.text+0x2210>
    31e8:      	ldr	w8, [x0, #0x1e0]
    31ec:      	cmp	w8, #0x3
    31f0:      	b.ne	0x3210 <.text+0x2210>
    31f4:      	ldr	w15, [x0, #0x1f8]
    31f8:      	cmp	w15, #0x4
    31fc:      	b.ne	0x32dc <.text+0x22dc>
    3200:      	cbz	w3, 0x3360 <.text+0x2360>
    3204:      	adrp	x1, 0x7000 <.text+0x6000>
    3208:      	add	x1, x1, #0x42c
    320c:      	b	0x3380 <.text+0x2380>
    3210:      	adrp	x1, 0x6000 <.text+0x5000>
    3214:      	add	x1, x1, #0xdf0
    3218:      	b	0x3224 <.text+0x2224>
    321c:      	adrp	x1, 0x7000 <.text+0x6000>
    3220:      	add	x1, x1, #0x2e6
    3224:      	adrp	x2, 0x7000 <.text+0x6000>
    3228:      	add	x2, x2, #0x2fe
    322c:      	orr	w0, wzr, #0x80000000
    3230:      	bl	0x4674 <.text+0x3674>
    3234:      	b	0x3390 <.text+0x2390>
    3238:      	ldrb	w17, [x0, #0x1fc]
    323c:      	cbz	w17, 0x3338 <.text+0x2338>
    3240:      	ldrb	w4, [x1, #0x5]
    3244:      	ldrb	w9, [x1, #0x4]
    3248:      	bfi	w9, w4, #8, #8
    324c:      	cbz	w9, 0x326c <.text+0x226c>
    3250:      	adrp	x1, 0x7000 <.text+0x6000>
    3254:      	adrp	x2, 0x7000 <.text+0x6000>
    3258:      	add	x1, x1, #0x339
    325c:      	add	x2, x2, #0x2fe
    3260:      	orr	w0, wzr, #0x80000000
    3264:      	mov	w3, w9
    3268:      	b	0x338c <.text+0x238c>
    326c:      	ldr	w12, [x0, #0x1f8]
    3270:      	cmp	w12, #0x4
    3274:      	b.ne	0x32e8 <.text+0x22e8>
    3278:      	sub	w13, w3, #0x30
    327c:      	cmp	w13, #0x3
    3280:      	b.lo	0x32f4 <.text+0x22f4>
    3284:      	adrp	x1, 0x7000 <.text+0x6000>
    3288:      	add	x1, x1, #0x370
    328c:      	b	0x3380 <.text+0x2380>
    3290:      	ldr	x0, [x0, #0x1e8]
    3294:      	mov	w3, w8
    3298:      	ldrb	w2, [x1, #0x5]
    329c:      	ldrb	w10, [x1, #0x4]
    32a0:      	ldr	x9, [x0, #0x40]
    32a4:      	bfi	w10, w2, #8, #8
    32a8:      	and	w1, w10, #0xf
    32ac:      	ubfx	w2, w10, #7, #1
    32b0:      	blr	x9
    32b4:      	mov	x19, x0
    32b8:      	tbz	x19, #0x3f, 0x33c0 <.text+0x23c0>
    32bc:      	adrp	x1, 0x6000 <.text+0x5000>
    32c0:      	adrp	x2, 0x7000 <.text+0x6000>
    32c4:      	add	x1, x1, #0x839
    32c8:      	add	x2, x2, #0x2d5
    32cc:      	orr	w0, wzr, #0x80000000
    32d0:      	mov	x3, x19
    32d4:      	bl	0x4674 <.text+0x3674>
    32d8:      	b	0x3394 <.text+0x2394>
    32dc:      	adrp	x1, 0x7000 <.text+0x6000>
    32e0:      	add	x1, x1, #0x46f
    32e4:      	b	0x3380 <.text+0x2380>
    32e8:      	sub	w14, w3, #0x1
    32ec:      	cmp	w14, #0x2
    32f0:      	b.hs	0x3344 <.text+0x2344>
    32f4:      	ldr	w1, [x0, #0x1f8]
    32f8:      	cmp	w1, #0x4
    32fc:      	b.ne	0x3350 <.text+0x2350>
    3300:      	cmp	w3, #0x32
    3304:      	b.eq	0x3390 <.text+0x2390>
    3308:      	cmp	w3, #0x31
    330c:      	b.eq	0x33a4 <.text+0x23a4>
    3310:      	cmp	w3, #0x30
    3314:      	b.ne	0x33c0 <.text+0x23c0>
    3318:      	ldrh	w15, [x0, #0x1f0]
    331c:      	mov	w16, #0xfffb            // =65531
    3320:      	tst	w8, #0xff
    3324:      	orr	w2, w15, #0x4
    3328:      	and	w17, w15, w16
    332c:      	csel	w1, w2, w17, ne
    3330:      	strh	w1, [x0, #0x1f0]
    3334:      	b	0x33c0 <.text+0x23c0>
    3338:      	adrp	x1, 0x7000 <.text+0x6000>
    333c:      	add	x1, x1, #0x315
    3340:      	b	0x3224 <.text+0x2224>
    3344:      	adrp	x1, 0x7000 <.text+0x6000>
    3348:      	add	x1, x1, #0x3b0
    334c:      	b	0x3380 <.text+0x2380>
    3350:      	sub	w0, w3, #0x1
    3354:      	cmp	w0, #0x2
    3358:      	b.lo	0x3390 <.text+0x2390>
    335c:      	b	0x33c0 <.text+0x23c0>
    3360:      	ldrb	w9, [x1, #0x5]
    3364:      	ldrb	w10, [x1, #0x4]
    3368:      	bfi	w10, w9, #8, #8
    336c:      	and	w16, w10, #0xfc00
    3370:      	cbz	w16, 0x33c0 <.text+0x23c0>
    3374:      	adrp	x1, 0x7000 <.text+0x6000>
    3378:      	lsr	w3, w10, #8
    337c:      	add	x1, x1, #0x3f0
    3380:      	adrp	x2, 0x7000 <.text+0x6000>
    3384:      	add	x2, x2, #0x2fe
    3388:      	orr	w0, wzr, #0x80000000
    338c:      	bl	0x4674 <.text+0x3674>
    3390:      	mov	x19, #-0x7ffffffffffffffd // =-9223372036854775805
    3394:      	ldp	x29, x30, [sp, #0x10]
    3398:      	mov	x0, x19
    339c:      	ldp	x20, x19, [sp], #0x20
    33a0:      	ret
    33a4:      	ldrh	w5, [x0, #0x1f0]
    33a8:      	mov	w6, #0xfff7             // =65527
    33ac:      	tst	w8, #0xff
    33b0:      	orr	w4, w5, #0x8
    33b4:      	and	w7, w5, w6
    33b8:      	csel	w9, w4, w7, ne
    33bc:      	strh	w9, [x0, #0x1f0]
    33c0:      	mov	x19, xzr
    33c4:      	b	0x3394 <.text+0x2394>
    33c8:      	stp	x28, x27, [sp, #-0x60]!
    33cc:      	stp	x26, x25, [sp, #0x10]
    33d0:      	stp	x24, x23, [sp, #0x20]
    33d4:      	stp	x22, x21, [sp, #0x30]
    33d8:      	stp	x20, x19, [sp, #0x40]
    33dc:      	stp	x29, x30, [sp, #0x50]
    33e0:      	add	x29, sp, #0x50
    33e4:      	mov	x25, x0
    33e8:      	str	x25, [sp, #-0x10]!
    33ec:      	cbz	x25, 0x3504 <.text+0x2504>
    33f0:      	ldr	x0, [x25]
    33f4:      	cbz	x0, 0x3504 <.text+0x2504>
    33f8:      	ldr	x8, [x25, #0x8]
    33fc:      	cbz	x8, 0x3504 <.text+0x2504>
    3400:      	ldrb	w12, [x0, #0x11]
    3404:      	adrp	x20, 0x6000 <.text+0x5000>
    3408:      	adrp	x22, 0x7000 <.text+0x6000>
    340c:      	mov	x24, xzr
    3410:      	mov	x26, xzr
    3414:      	add	x20, x20, #0x4cd
    3418:      	str	w12, [sp, #0xc]
    341c:      	add	x22, x22, #0x760
    3420:      	b	0x3430 <.text+0x2430>
    3424:      	ldr	x0, [x25]
    3428:      	add	x26, x26, #0x1
    342c:      	add	x24, x24, #0x8
    3430:      	ldr	w11, [sp, #0xc]
    3434:      	and	w8, w26, #0xff
    3438:      	cmp	w8, w11
    343c:      	b.eq	0x3528 <.text+0x2528>
    3440:      	ldr	x8, [x25, #0x8]
    3444:      	ldr	x27, [x8, x24]
    3448:      	cbz	x27, 0x34ec <.text+0x24ec>
    344c:      	ldr	x9, [x27]
    3450:      	mov	x28, xzr
    3454:      	ldrb	w10, [x0, #0x3]
    3458:      	mov	x25, xzr
    345c:      	ldrb	w23, [x0, #0x2]
    3460:      	ldrb	w21, [x9, #0x4]
    3464:      	bfi	w23, w10, #8, #8
    3468:      	b	0x3474 <.text+0x2474>
    346c:      	add	x25, x25, #0x1
    3470:      	add	x28, x28, #0x8
    3474:      	and	w9, w25, #0xff
    3478:      	cmp	w9, w21
    347c:      	b.eq	0x34cc <.text+0x24cc>
    3480:      	ldr	x10, [x27, #0x8]
    3484:      	ldr	x19, [x10, x28]
    3488:      	cbz	x19, 0x34b8 <.text+0x24b8>
    348c:      	ldp	x11, x2, [x19]
    3490:      	mov	w0, w23
    3494:      	ldrb	w1, [x11, #0x4]
    3498:      	bl	0x3dec <.text+0x2dec>
    349c:      	ldr	x0, [x19]
    34a0:      	bl	0x45fc <.text+0x35fc>
    34a4:      	ldr	x0, [x19, #0x8]
    34a8:      	str	xzr, [x19]
    34ac:      	bl	0x45fc <.text+0x35fc>
    34b0:      	str	xzr, [x19, #0x8]
    34b4:      	b	0x346c <.text+0x246c>
    34b8:      	orr	w0, wzr, #0x80000000
    34bc:      	mov	x1, x20
    34c0:      	mov	x2, x22
    34c4:      	bl	0x4674 <.text+0x3674>
    34c8:      	b	0x346c <.text+0x246c>
    34cc:      	ldr	x0, [x27]
    34d0:      	bl	0x45fc <.text+0x35fc>
    34d4:      	ldr	x0, [x27, #0x8]
    34d8:      	str	xzr, [x27]
    34dc:      	bl	0x45fc <.text+0x35fc>
    34e0:      	ldr	x25, [sp]
    34e4:      	str	xzr, [x27, #0x8]
    34e8:      	b	0x3424 <.text+0x2424>
    34ec:      	adrp	x2, 0x7000 <.text+0x6000>
    34f0:      	orr	w0, wzr, #0x80000000
    34f4:      	mov	x1, x20
    34f8:      	add	x2, x2, #0x747
    34fc:      	bl	0x4674 <.text+0x3674>
    3500:      	b	0x3424 <.text+0x2424>
    3504:      	adrp	x1, 0x6000 <.text+0x5000>
    3508:      	adrp	x2, 0x7000 <.text+0x6000>
    350c:      	add	x1, x1, #0x4cd
    3510:      	add	x2, x2, #0x502
    3514:      	orr	w0, wzr, #0x80000000
    3518:      	bl	0x4674 <.text+0x3674>
    351c:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    3520:      	movk	x0, #0x2
    3524:      	b	0x3540 <.text+0x2540>
    3528:      	bl	0x45fc <.text+0x35fc>
    352c:      	ldr	x0, [x25, #0x8]
    3530:      	str	xzr, [x25]
    3534:      	bl	0x45fc <.text+0x35fc>
    3538:      	mov	x0, xzr
    353c:      	str	xzr, [x25, #0x8]
    3540:      	sub	sp, x29, #0x50
    3544:      	ldp	x29, x30, [sp, #0x50]
    3548:      	ldp	x20, x19, [sp, #0x40]
    354c:      	ldp	x22, x21, [sp, #0x30]
    3550:      	ldp	x24, x23, [sp, #0x20]
    3554:      	ldp	x26, x25, [sp, #0x10]
    3558:      	ldp	x28, x27, [sp], #0x60
    355c:      	ret
    3560:      	stp	x28, x27, [sp, #-0x60]!
    3564:      	stp	x26, x25, [sp, #0x10]
    3568:      	stp	x24, x23, [sp, #0x20]
    356c:      	stp	x22, x21, [sp, #0x30]
    3570:      	stp	x20, x19, [sp, #0x40]
    3574:      	stp	x29, x30, [sp, #0x50]
    3578:      	add	x29, sp, #0x50
    357c:      	mov	x19, x7
    3580:      	mov	x22, x5
    3584:      	mov	w21, w4
    3588:      	mov	x20, x3
    358c:      	mov	x26, x2
    3590:      	mov	x24, x1
    3594:      	mov	x25, x0
    3598:      	cbz	x25, 0x364c <.text+0x264c>
    359c:      	cbz	x24, 0x364c <.text+0x264c>
    35a0:      	cbz	x26, 0x364c <.text+0x264c>
    35a4:      	and	w8, w21, #0xff
    35a8:      	cmp	x22, #0x0
    35ac:      	ccmp	w8, #0x0, #0x4, eq
    35b0:      	b.ne	0x364c <.text+0x264c>
    35b4:      	cbz	x19, 0x364c <.text+0x264c>
    35b8:      	mov	x0, x25
    35bc:      	mov	x1, x24
    35c0:      	mov	x2, x6
    35c4:      	bl	0x36b4 <.text+0x26b4>
    35c8:      	mov	x23, x0
    35cc:      	tbnz	x23, #0x3f, 0x366c <.text+0x266c>
    35d0:      	adrp	x27, 0xa000
    35d4:      	mov	w2, #0x12               // =18
    35d8:      	mov	x0, x19
    35dc:      	ldr	x8, [x27, #0x458]
    35e0:      	mov	x1, x25
    35e4:      	ldr	x8, [x8, #0x160]
    35e8:      	blr	x8
    35ec:      	ldr	x9, [x27, #0x458]
    35f0:      	add	x0, x19, #0x24
    35f4:      	mov	w2, #0xa                // =10
    35f8:      	mov	x1, x26
    35fc:      	ldr	x10, [x9, #0x160]
    3600:      	blr	x10
    3604:      	ldrb	w0, [x25, #0x11]
    3608:      	cbz	w0, 0x3620 <.text+0x2620>
    360c:      	add	x2, x19, #0x30
    3610:      	mov	x1, x24
    3614:      	bl	0x3784 <.text+0x2784>
    3618:      	mov	x23, x0
    361c:      	tbnz	x23, #0x3f, 0x366c <.text+0x266c>
    3620:      	and	w9, w21, #0xff
    3624:      	cbz	w9, 0x368c <.text+0x268c>
    3628:      	add	x2, x19, #0x50
    362c:      	mov	w0, w21
    3630:      	mov	x1, x22
    3634:      	bl	0x38bc <.text+0x28bc>
    3638:      	mov	x23, x0
    363c:      	strb	w21, [x19, #0x48]
    3640:      	cbz	x20, 0x366c <.text+0x266c>
    3644:      	tbz	x23, #0x3f, 0x3690 <.text+0x2690>
    3648:      	b	0x366c <.text+0x266c>
    364c:      	adrp	x1, 0x6000 <.text+0x5000>
    3650:      	adrp	x2, 0x7000 <.text+0x6000>
    3654:      	add	x1, x1, #0x642
    3658:      	add	x2, x2, #0x6f7
    365c:      	orr	w0, wzr, #0x80000000
    3660:      	bl	0x4674 <.text+0x3674>
    3664:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    3668:      	movk	x23, #0x2
    366c:      	mov	x0, x23
    3670:      	ldp	x29, x30, [sp, #0x50]
    3674:      	ldp	x20, x19, [sp, #0x40]
    3678:      	ldp	x22, x21, [sp, #0x30]
    367c:      	ldp	x24, x23, [sp, #0x20]
    3680:      	ldp	x26, x25, [sp, #0x10]
    3684:      	ldp	x28, x27, [sp], #0x60
    3688:      	ret
    368c:      	cbz	x20, 0x366c <.text+0x266c>
    3690:      	add	x1, x19, #0x40
    3694:      	mov	x0, x20
    3698:      	ldp	x29, x30, [sp, #0x50]
    369c:      	ldp	x20, x19, [sp, #0x40]
    36a0:      	ldp	x22, x21, [sp, #0x30]
    36a4:      	ldp	x24, x23, [sp, #0x20]
    36a8:      	ldp	x26, x25, [sp, #0x10]
    36ac:      	ldp	x28, x27, [sp], #0x60
    36b0:      	b	0x39e0 <.text+0x29e0>
    36b4:      	stp	x22, x21, [sp, #-0x30]!
    36b8:      	stp	x20, x19, [sp, #0x10]
    36bc:      	stp	x29, x30, [sp, #0x20]
    36c0:      	add	x29, sp, #0x20
    36c4:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    36c8:      	mov	x19, x2
    36cc:      	mov	x21, x1
    36d0:      	mov	x22, x0
    36d4:      	movk	x20, #0x2
    36d8:      	cbz	x21, 0x3724 <.text+0x2724>
    36dc:      	cbz	x22, 0x3724 <.text+0x2724>
    36e0:      	cbz	x19, 0x3724 <.text+0x2724>
    36e4:      	mov	w0, #0x12               // =18
    36e8:      	bl	0x458c <.text+0x358c>
    36ec:      	str	x0, [x19]
    36f0:      	cbz	x0, 0x3740 <.text+0x2740>
    36f4:      	adrp	x8, 0xa000
    36f8:      	mov	w2, #0x12               // =18
    36fc:      	mov	x1, x22
    3700:      	ldr	x9, [x8, #0x458]
    3704:      	ldr	x8, [x9, #0x160]
    3708:      	blr	x8
    370c:      	add	x2, x19, #0x8
    3710:      	mov	x0, x22
    3714:      	mov	x1, x21
    3718:      	bl	0x3ec4 <.text+0x2ec4>
    371c:      	mov	x20, x0
    3720:      	b	0x375c <.text+0x275c>
    3724:      	adrp	x1, 0x6000 <.text+0x5000>
    3728:      	adrp	x2, 0x7000 <.text+0x6000>
    372c:      	add	x1, x1, #0x4cd
    3730:      	add	x2, x2, #0x7a2
    3734:      	orr	w0, wzr, #0x80000000
    3738:      	bl	0x4674 <.text+0x3674>
    373c:      	b	0x375c <.text+0x275c>
    3740:      	adrp	x1, 0x7000 <.text+0x6000>
    3744:      	adrp	x2, 0x7000 <.text+0x6000>
    3748:      	add	x1, x1, #0x7b8
    374c:      	add	x2, x2, #0x7a2
    3750:      	orr	w0, wzr, #0x80000000
    3754:      	bl	0x4674 <.text+0x3674>
    3758:      	add	x20, x20, #0x7
    375c:      	cbz	x19, 0x3770 <.text+0x2770>
    3760:      	tbz	x20, #0x3f, 0x3770 <.text+0x2770>
    3764:      	ldr	x0, [x19]
    3768:      	cbz	x0, 0x3770 <.text+0x2770>
    376c:      	bl	0x45fc <.text+0x35fc>
    3770:      	mov	x0, x20
    3774:      	ldp	x29, x30, [sp, #0x20]
    3778:      	ldp	x20, x19, [sp, #0x10]
    377c:      	ldp	x22, x21, [sp], #0x30
    3780:      	ret
    3784:      	stp	x28, x27, [sp, #-0x60]!
    3788:      	stp	x26, x25, [sp, #0x10]
    378c:      	stp	x24, x23, [sp, #0x20]
    3790:      	stp	x22, x21, [sp, #0x30]
    3794:      	stp	x20, x19, [sp, #0x40]
    3798:      	stp	x29, x30, [sp, #0x50]
    379c:      	add	x29, sp, #0x50
    37a0:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    37a4:      	mov	x21, x2
    37a8:      	mov	x23, x1
    37ac:      	mov	w20, w0
    37b0:      	movk	x19, #0x9
    37b4:      	and	w8, w20, #0xff
    37b8:      	cbz	w8, 0x3858 <.text+0x2858>
    37bc:      	cbz	x23, 0x3858 <.text+0x2858>
    37c0:      	cbz	x21, 0x3858 <.text+0x2858>
    37c4:      	and	w26, w20, #0xff
    37c8:      	lsl	x0, x26, #3
    37cc:      	bl	0x458c <.text+0x358c>
    37d0:      	mov	x22, x0
    37d4:      	cbz	x22, 0x3878 <.text+0x2878>
    37d8:      	mov	x24, xzr
    37dc:      	adrp	x27, 0xa000
    37e0:      	b	0x37fc <.text+0x27fc>
    37e4:      	ldr	x9, [x27, #0x458]
    37e8:      	mov	x2, x25
    37ec:      	ldr	x1, [x23, x24, lsl #3]
    37f0:      	ldr	x10, [x9, #0x160]
    37f4:      	blr	x10
    37f8:      	add	x24, x24, #0x1
    37fc:      	cmp	x24, x26
    3800:      	b.hs	0x3894 <.text+0x2894>
    3804:      	ldr	x8, [x23, x24, lsl #3]
    3808:      	ldrb	w9, [x8, #0x3]
    380c:      	ldrb	w25, [x8, #0x2]
    3810:      	bfi	x25, x9, #8, #8
    3814:      	mov	x0, x25
    3818:      	bl	0x458c <.text+0x358c>
    381c:      	str	x0, [x22, x24, lsl #3]
    3820:      	cbnz	x0, 0x37e4 <.text+0x27e4>
    3824:      	adrp	x1, 0x7000 <.text+0x6000>
    3828:      	adrp	x2, 0x7000 <.text+0x6000>
    382c:      	add	x1, x1, #0xa67
    3830:      	add	x2, x2, #0xa34
    3834:      	orr	w0, wzr, #0x80000000
    3838:      	mov	w3, w24
    383c:      	bl	0x4674 <.text+0x3674>
    3840:      	mov	w0, w20
    3844:      	mov	x1, x22
    3848:      	bl	0x3d64 <.text+0x2d64>
    384c:      	mov	x0, x22
    3850:      	bl	0x45fc <.text+0x35fc>
    3854:      	b	0x389c <.text+0x289c>
    3858:      	adrp	x1, 0x7000 <.text+0x6000>
    385c:      	adrp	x2, 0x7000 <.text+0x6000>
    3860:      	add	x1, x1, #0xa1c
    3864:      	add	x2, x2, #0xa34
    3868:      	orr	w0, wzr, #0x80000000
    386c:      	bl	0x4674 <.text+0x3674>
    3870:      	sub	x19, x19, #0x7
    3874:      	b	0x389c <.text+0x289c>
    3878:      	adrp	x1, 0x7000 <.text+0x6000>
    387c:      	adrp	x2, 0x7000 <.text+0x6000>
    3880:      	add	x1, x1, #0xa51
    3884:      	add	x2, x2, #0xa34
    3888:      	orr	w0, wzr, #0x80000000
    388c:      	bl	0x4674 <.text+0x3674>
    3890:      	b	0x389c <.text+0x289c>
    3894:      	mov	x19, xzr
    3898:      	str	x22, [x21]
    389c:      	mov	x0, x19
    38a0:      	ldp	x29, x30, [sp, #0x50]
    38a4:      	ldp	x20, x19, [sp, #0x40]
    38a8:      	ldp	x22, x21, [sp, #0x30]
    38ac:      	ldp	x24, x23, [sp, #0x20]
    38b0:      	ldp	x26, x25, [sp, #0x10]
    38b4:      	ldp	x28, x27, [sp], #0x60
    38b8:      	ret
    38bc:      	stp	x26, x25, [sp, #-0x50]!
    38c0:      	stp	x24, x23, [sp, #0x10]
    38c4:      	stp	x22, x21, [sp, #0x20]
    38c8:      	stp	x20, x19, [sp, #0x30]
    38cc:      	stp	x29, x30, [sp, #0x40]
    38d0:      	add	x29, sp, #0x40
    38d4:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    38d8:      	mov	x21, x2
    38dc:      	mov	x23, x1
    38e0:      	mov	w20, w0
    38e4:      	movk	x19, #0x9
    38e8:      	and	w8, w20, #0xff
    38ec:      	cbz	w8, 0x3980 <.text+0x2980>
    38f0:      	cbz	x23, 0x3980 <.text+0x2980>
    38f4:      	cbz	x21, 0x3980 <.text+0x2980>
    38f8:      	and	w25, w20, #0xff
    38fc:      	lsl	x0, x25, #3
    3900:      	bl	0x458c <.text+0x358c>
    3904:      	mov	x22, x0
    3908:      	cbz	x22, 0x39a0 <.text+0x29a0>
    390c:      	mov	x24, xzr
    3910:      	adrp	x26, 0xa000
    3914:      	b	0x3930 <.text+0x2930>
    3918:      	ldr	x9, [x26, #0x458]
    391c:      	ldr	x1, [x23, x24, lsl #3]
    3920:      	ldr	x9, [x9, #0x160]
    3924:      	ldrb	w2, [x1]
    3928:      	blr	x9
    392c:      	add	x24, x24, #0x1
    3930:      	cmp	x24, x25
    3934:      	b.hs	0x39bc <.text+0x29bc>
    3938:      	ldr	x8, [x23, x24, lsl #3]
    393c:      	ldrb	w0, [x8]
    3940:      	bl	0x458c <.text+0x358c>
    3944:      	str	x0, [x22, x24, lsl #3]
    3948:      	cbnz	x0, 0x3918 <.text+0x2918>
    394c:      	adrp	x1, 0x7000 <.text+0x6000>
    3950:      	adrp	x2, 0x7000 <.text+0x6000>
    3954:      	add	x1, x1, #0xaae
    3958:      	add	x2, x2, #0xa91
    395c:      	orr	w0, wzr, #0x80000000
    3960:      	mov	w3, w24
    3964:      	bl	0x4674 <.text+0x3674>
    3968:      	mov	w0, w20
    396c:      	mov	x1, x22
    3970:      	bl	0x3d64 <.text+0x2d64>
    3974:      	mov	x0, x22
    3978:      	bl	0x45fc <.text+0x35fc>
    397c:      	b	0x39c4 <.text+0x29c4>
    3980:      	adrp	x1, 0x7000 <.text+0x6000>
    3984:      	adrp	x2, 0x7000 <.text+0x6000>
    3988:      	add	x1, x1, #0xa1c
    398c:      	add	x2, x2, #0xa91
    3990:      	orr	w0, wzr, #0x80000000
    3994:      	bl	0x4674 <.text+0x3674>
    3998:      	sub	x19, x19, #0x7
    399c:      	b	0x39c4 <.text+0x29c4>
    39a0:      	adrp	x1, 0x7000 <.text+0x6000>
    39a4:      	adrp	x2, 0x7000 <.text+0x6000>
    39a8:      	add	x1, x1, #0xa51
    39ac:      	add	x2, x2, #0xa91
    39b0:      	orr	w0, wzr, #0x80000000
    39b4:      	bl	0x4674 <.text+0x3674>
    39b8:      	b	0x39c4 <.text+0x29c4>
    39bc:      	mov	x19, xzr
    39c0:      	str	x22, [x21]
    39c4:      	mov	x0, x19
    39c8:      	ldp	x29, x30, [sp, #0x40]
    39cc:      	ldp	x20, x19, [sp, #0x30]
    39d0:      	ldp	x22, x21, [sp, #0x20]
    39d4:      	ldp	x24, x23, [sp, #0x10]
    39d8:      	ldp	x26, x25, [sp], #0x50
    39dc:      	ret
    39e0:      	stp	x22, x21, [sp, #-0x30]!
    39e4:      	stp	x20, x19, [sp, #0x10]
    39e8:      	stp	x29, x30, [sp, #0x20]
    39ec:      	add	x29, sp, #0x20
    39f0:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    39f4:      	mov	x21, x1
    39f8:      	mov	x20, x0
    39fc:      	movk	x19, #0x2
    3a00:      	cbz	x20, 0x3a48 <.text+0x2a48>
    3a04:      	cbz	x21, 0x3a48 <.text+0x2a48>
    3a08:      	ldrb	w8, [x20, #0x3]
    3a0c:      	ldrb	w0, [x20, #0x2]
    3a10:      	bfi	x0, x8, #8, #8
    3a14:      	bl	0x458c <.text+0x358c>
    3a18:      	str	x0, [x21]
    3a1c:      	cbz	x0, 0x3a64 <.text+0x2a64>
    3a20:      	adrp	x8, 0xa000
    3a24:      	ldrb	w10, [x20, #0x3]
    3a28:      	ldrb	w2, [x20, #0x2]
    3a2c:      	mov	x1, x20
    3a30:      	ldr	x9, [x8, #0x458]
    3a34:      	bfi	x2, x10, #8, #8
    3a38:      	ldr	x9, [x9, #0x160]
    3a3c:      	blr	x9
    3a40:      	mov	x19, xzr
    3a44:      	b	0x3a80 <.text+0x2a80>
    3a48:      	adrp	x1, 0x6000 <.text+0x5000>
    3a4c:      	adrp	x2, 0x7000 <.text+0x6000>
    3a50:      	add	x1, x1, #0x642
    3a54:      	add	x2, x2, #0xacf
    3a58:      	orr	w0, wzr, #0x80000000
    3a5c:      	bl	0x4674 <.text+0x3674>
    3a60:      	b	0x3a80 <.text+0x2a80>
    3a64:      	adrp	x1, 0x7000 <.text+0x6000>
    3a68:      	adrp	x2, 0x7000 <.text+0x6000>
    3a6c:      	add	x1, x1, #0xa51
    3a70:      	add	x2, x2, #0xacf
    3a74:      	orr	w0, wzr, #0x80000000
    3a78:      	bl	0x4674 <.text+0x3674>
    3a7c:      	add	x19, x19, #0x7
    3a80:      	mov	x0, x19
    3a84:      	ldp	x29, x30, [sp, #0x20]
    3a88:      	ldp	x20, x19, [sp, #0x10]
    3a8c:      	ldp	x22, x21, [sp], #0x30
    3a90:      	ret
    3a94:      	stp	x28, x27, [sp, #-0x60]!
    3a98:      	stp	x26, x25, [sp, #0x10]
    3a9c:      	stp	x24, x23, [sp, #0x20]
    3aa0:      	stp	x22, x21, [sp, #0x30]
    3aa4:      	stp	x20, x19, [sp, #0x40]
    3aa8:      	stp	x29, x30, [sp, #0x50]
    3aac:      	add	x29, sp, #0x50
    3ab0:      	mov	x22, #-0x8000000000000000 // =-9223372036854775808
    3ab4:      	mov	x21, x3
    3ab8:      	mov	x23, x2
    3abc:      	mov	x19, x1
    3ac0:      	mov	x20, x0
    3ac4:      	movk	x22, #0x2
    3ac8:      	cbz	x20, 0x3c28 <.text+0x2c28>
    3acc:      	ldp	x0, x1, [x20]
    3ad0:      	mov	x2, x19
    3ad4:      	bl	0x36b4 <.text+0x26b4>
    3ad8:      	tbnz	x0, #0x3f, 0x3c94 <.text+0x2c94>
    3adc:      	ldr	x24, [x20, #0x18]
    3ae0:      	cbz	x24, 0x3c44 <.text+0x2c44>
    3ae4:      	cbz	x23, 0x3c44 <.text+0x2c44>
    3ae8:      	ldr	x25, [x20, #0x10]
    3aec:      	cbz	x25, 0x3c44 <.text+0x2c44>
    3af0:      	ldr	x27, [x20, #0x28]
    3af4:      	mov	w0, #0x12               // =18
    3af8:      	bl	0x458c <.text+0x358c>
    3afc:      	str	x0, [x23]
    3b00:      	cbz	x0, 0x3c60 <.text+0x2c60>
    3b04:      	adrp	x26, 0xa000
    3b08:      	mov	w2, #0x12               // =18
    3b0c:      	mov	x1, x25
    3b10:      	ldr	x8, [x26, #0x458]
    3b14:      	ldr	x9, [x8, #0x160]
    3b18:      	blr	x9
    3b1c:      	add	x2, x23, #0x8
    3b20:      	mov	x0, x25
    3b24:      	mov	x1, x24
    3b28:      	bl	0x3ec4 <.text+0x2ec4>
    3b2c:      	mov	x22, x0
    3b30:      	tbnz	x22, #0x3f, 0x3c7c <.text+0x2c7c>
    3b34:      	str	x27, [x23, #0x10]
    3b38:      	mov	w24, #0x12              // =18
    3b3c:      	ldr	x9, [x26, #0x458]
    3b40:      	mov	x0, x21
    3b44:      	ldr	x1, [x20]
    3b48:      	mov	x2, x24
    3b4c:      	ldr	x10, [x9, #0x160]
    3b50:      	blr	x10
    3b54:      	ldr	x10, [x26, #0x458]
    3b58:      	add	x0, x21, #0x12
    3b5c:      	ldr	x1, [x20, #0x10]
    3b60:      	mov	x2, x24
    3b64:      	ldr	x11, [x10, #0x160]
    3b68:      	blr	x11
    3b6c:      	ldr	x11, [x26, #0x458]
    3b70:      	add	x0, x21, #0x24
    3b74:      	ldr	x1, [x20, #0x20]
    3b78:      	mov	w2, #0xa                // =10
    3b7c:      	ldr	x12, [x11, #0x160]
    3b80:      	blr	x12
    3b84:      	ldr	x12, [x20]
    3b88:      	ldrb	w0, [x12, #0x11]
    3b8c:      	cbz	w0, 0x3ba4 <.text+0x2ba4>
    3b90:      	ldr	x1, [x20, #0x8]
    3b94:      	add	x2, x21, #0x30
    3b98:      	bl	0x3784 <.text+0x2784>
    3b9c:      	mov	x22, x0
    3ba0:      	tbnz	x22, #0x3f, 0x3c94 <.text+0x2c94>
    3ba4:      	ldr	x13, [x20, #0x10]
    3ba8:      	ldrb	w0, [x13, #0x11]
    3bac:      	cbz	w0, 0x3bc4 <.text+0x2bc4>
    3bb0:      	ldr	x1, [x20, #0x18]
    3bb4:      	add	x2, x21, #0x38
    3bb8:      	bl	0x3784 <.text+0x2784>
    3bbc:      	mov	x22, x0
    3bc0:      	tbnz	x22, #0x3f, 0x3c94 <.text+0x2c94>
    3bc4:      	ldrb	w0, [x20, #0x30]
    3bc8:      	cbz	w0, 0x3be8 <.text+0x2be8>
    3bcc:      	ldr	x1, [x20, #0x38]
    3bd0:      	add	x2, x21, #0x50
    3bd4:      	bl	0x38bc <.text+0x28bc>
    3bd8:      	ldrb	w8, [x20, #0x30]
    3bdc:      	mov	x22, x0
    3be0:      	strb	w8, [x21, #0x48]
    3be4:      	tbnz	x22, #0x3f, 0x3c94 <.text+0x2c94>
    3be8:      	ldr	x8, [x20, #0x28]
    3bec:      	mov	x0, x22
    3bf0:      	cbz	x8, 0x3c94 <.text+0x2c94>
    3bf4:      	add	x21, x21, #0x40
    3bf8:      	mov	x0, x8
    3bfc:      	mov	x1, x21
    3c00:      	bl	0x39e0 <.text+0x29e0>
    3c04:      	tbnz	x0, #0x3f, 0x3c94 <.text+0x2c94>
    3c08:      	ldr	x14, [x20]
    3c0c:      	ldrb	w9, [x14, #0x3]
    3c10:      	lsl	w8, w9, #8
    3c14:      	cmp	w8, #0x300
    3c18:      	b.ne	0x3c94 <.text+0x2c94>
    3c1c:      	ldr	x13, [x21]
    3c20:      	str	x13, [x19, #0x10]
    3c24:      	b	0x3c94 <.text+0x2c94>
    3c28:      	adrp	x1, 0x6000 <.text+0x5000>
    3c2c:      	adrp	x2, 0x7000 <.text+0x6000>
    3c30:      	add	x1, x1, #0x642
    3c34:      	add	x2, x2, #0x711
    3c38:      	orr	w0, wzr, #0x80000000
    3c3c:      	bl	0x4674 <.text+0x3674>
    3c40:      	b	0x3c90 <.text+0x2c90>
    3c44:      	adrp	x1, 0x6000 <.text+0x5000>
    3c48:      	adrp	x2, 0x7000 <.text+0x6000>
    3c4c:      	add	x1, x1, #0x4cd
    3c50:      	add	x2, x2, #0xae1
    3c54:      	orr	w0, wzr, #0x80000000
    3c58:      	bl	0x4674 <.text+0x3674>
    3c5c:      	b	0x3c7c <.text+0x2c7c>
    3c60:      	adrp	x1, 0x7000 <.text+0x6000>
    3c64:      	adrp	x2, 0x7000 <.text+0x6000>
    3c68:      	add	x1, x1, #0x7b8
    3c6c:      	add	x2, x2, #0xae1
    3c70:      	orr	w0, wzr, #0x80000000
    3c74:      	bl	0x4674 <.text+0x3674>
    3c78:      	add	x22, x22, #0x7
    3c7c:      	cbz	x23, 0x3c90 <.text+0x2c90>
    3c80:      	tbz	x22, #0x3f, 0x3c90 <.text+0x2c90>
    3c84:      	ldr	x0, [x23]
    3c88:      	cbz	x0, 0x3c90 <.text+0x2c90>
    3c8c:      	bl	0x45fc <.text+0x35fc>
    3c90:      	mov	x0, x22
    3c94:      	ldp	x29, x30, [sp, #0x50]
    3c98:      	ldp	x20, x19, [sp, #0x40]
    3c9c:      	ldp	x22, x21, [sp, #0x30]
    3ca0:      	ldp	x24, x23, [sp, #0x20]
    3ca4:      	ldp	x26, x25, [sp, #0x10]
    3ca8:      	ldp	x28, x27, [sp], #0x60
    3cac:      	ret
    3cb0:      	stp	x20, x19, [sp, #-0x20]!
    3cb4:      	stp	x29, x30, [sp, #0x10]
    3cb8:      	add	x29, sp, #0x10
    3cbc:      	mov	x19, x0
    3cc0:      	cbz	x19, 0x3d30 <.text+0x2d30>
    3cc4:      	ldr	x1, [x19, #0x30]
    3cc8:      	cbz	x1, 0x3ce0 <.text+0x2ce0>
    3ccc:      	ldrb	w0, [x19, #0x11]
    3cd0:      	bl	0x3d64 <.text+0x2d64>
    3cd4:      	ldr	x0, [x19, #0x30]
    3cd8:      	bl	0x45fc <.text+0x35fc>
    3cdc:      	str	xzr, [x19, #0x30]
    3ce0:      	ldr	x1, [x19, #0x38]
    3ce4:      	cbz	x1, 0x3cfc <.text+0x2cfc>
    3ce8:      	ldrb	w0, [x19, #0x23]
    3cec:      	bl	0x3d64 <.text+0x2d64>
    3cf0:      	ldr	x0, [x19, #0x38]
    3cf4:      	bl	0x45fc <.text+0x35fc>
    3cf8:      	str	xzr, [x19, #0x38]
    3cfc:      	ldr	x0, [x19, #0x40]
    3d00:      	cbz	x0, 0x3d0c <.text+0x2d0c>
    3d04:      	bl	0x45fc <.text+0x35fc>
    3d08:      	str	xzr, [x19, #0x40]
    3d0c:      	ldr	x1, [x19, #0x50]
    3d10:      	cbz	x1, 0x3d54 <.text+0x2d54>
    3d14:      	ldrb	w0, [x19, #0x48]
    3d18:      	bl	0x3d64 <.text+0x2d64>
    3d1c:      	ldr	x0, [x19, #0x50]
    3d20:      	bl	0x45fc <.text+0x35fc>
    3d24:      	mov	x0, xzr
    3d28:      	str	xzr, [x19, #0x50]
    3d2c:      	b	0x3d58 <.text+0x2d58>
    3d30:      	adrp	x1, 0x6000 <.text+0x5000>
    3d34:      	adrp	x2, 0x7000 <.text+0x6000>
    3d38:      	add	x1, x1, #0x642
    3d3c:      	add	x2, x2, #0x72d
    3d40:      	orr	w0, wzr, #0x80000000
    3d44:      	bl	0x4674 <.text+0x3674>
    3d48:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    3d4c:      	movk	x0, #0x2
    3d50:      	b	0x3d58 <.text+0x2d58>
    3d54:      	mov	x0, xzr
    3d58:      	ldp	x29, x30, [sp, #0x10]
    3d5c:      	ldp	x20, x19, [sp], #0x20
    3d60:      	ret
    3d64:      	stp	x22, x21, [sp, #-0x30]!
    3d68:      	stp	x20, x19, [sp, #0x10]
    3d6c:      	stp	x29, x30, [sp, #0x20]
    3d70:      	add	x29, sp, #0x20
    3d74:      	mov	x19, x1
    3d78:      	mov	w20, w0
    3d7c:      	and	w8, w20, #0xff
    3d80:      	cbz	w8, 0x3db8 <.text+0x2db8>
    3d84:      	cbz	x19, 0x3db8 <.text+0x2db8>
    3d88:      	mov	x21, xzr
    3d8c:      	b	0x3d98 <.text+0x2d98>
    3d90:      	add	x21, x21, #0x1
    3d94:      	add	x19, x19, #0x8
    3d98:      	and	w8, w21, #0xff
    3d9c:      	cmp	w8, w20, uxtb
    3da0:      	b.eq	0x3ddc <.text+0x2ddc>
    3da4:      	ldr	x0, [x19]
    3da8:      	cbz	x0, 0x3d90 <.text+0x2d90>
    3dac:      	bl	0x45fc <.text+0x35fc>
    3db0:      	str	xzr, [x19]
    3db4:      	b	0x3d90 <.text+0x2d90>
    3db8:      	ldp	x29, x30, [sp, #0x20]
    3dbc:      	adrp	x1, 0x6000 <.text+0x5000>
    3dc0:      	ldp	x20, x19, [sp, #0x10]
    3dc4:      	adrp	x2, 0x7000 <.text+0x6000>
    3dc8:      	add	x1, x1, #0x4cd
    3dcc:      	add	x2, x2, #0xaf9
    3dd0:      	orr	w0, wzr, #0x80000000
    3dd4:      	ldp	x22, x21, [sp], #0x30
    3dd8:      	b	0x4674 <.text+0x3674>
    3ddc:      	ldp	x29, x30, [sp, #0x20]
    3de0:      	ldp	x20, x19, [sp, #0x10]
    3de4:      	ldp	x22, x21, [sp], #0x30
    3de8:      	ret
    3dec:      	stp	x22, x21, [sp, #-0x30]!
    3df0:      	stp	x20, x19, [sp, #0x10]
    3df4:      	stp	x29, x30, [sp, #0x20]
    3df8:      	add	x29, sp, #0x20
    3dfc:      	mov	x19, x2
    3e00:      	mov	w20, w1
    3e04:      	cbz	x19, 0x3ea0 <.text+0x2ea0>
    3e08:      	mov	x21, xzr
    3e0c:      	and	w8, w0, #0xff00
    3e10:      	cmp	w8, #0x200
    3e14:      	b.ne	0x3e4c <.text+0x2e4c>
    3e18:      	b	0x3e24 <.text+0x2e24>
    3e1c:      	add	x21, x21, #0x1
    3e20:      	add	x19, x19, #0x8
    3e24:      	and	w9, w21, #0xff
    3e28:      	cmp	w9, w20, uxtb
    3e2c:      	b.eq	0x3e90 <.text+0x2e90>
    3e30:      	ldr	x0, [x19]
    3e34:      	cbz	x0, 0x3e1c <.text+0x2e1c>
    3e38:      	bl	0x45fc <.text+0x35fc>
    3e3c:      	str	xzr, [x19]
    3e40:      	b	0x3e1c <.text+0x2e1c>
    3e44:      	add	x21, x21, #0x1
    3e48:      	add	x19, x19, #0x8
    3e4c:      	and	w10, w21, #0xff
    3e50:      	cmp	w10, w20, uxtb
    3e54:      	b.eq	0x3e90 <.text+0x2e90>
    3e58:      	ldr	x22, [x19]
    3e5c:      	cbz	x22, 0x3e44 <.text+0x2e44>
    3e60:      	ldr	x0, [x22]
    3e64:      	cbz	x0, 0x3e70 <.text+0x2e70>
    3e68:      	bl	0x45fc <.text+0x35fc>
    3e6c:      	str	xzr, [x22]
    3e70:      	ldr	x0, [x22, #0x8]
    3e74:      	cbz	x0, 0x3e80 <.text+0x2e80>
    3e78:      	bl	0x45fc <.text+0x35fc>
    3e7c:      	str	xzr, [x22, #0x8]
    3e80:      	ldr	x0, [x19]
    3e84:      	bl	0x45fc <.text+0x35fc>
    3e88:      	str	xzr, [x19]
    3e8c:      	b	0x3e44 <.text+0x2e44>
    3e90:      	ldp	x29, x30, [sp, #0x20]
    3e94:      	ldp	x20, x19, [sp, #0x10]
    3e98:      	ldp	x22, x21, [sp], #0x30
    3e9c:      	ret
    3ea0:      	ldp	x29, x30, [sp, #0x20]
    3ea4:      	adrp	x1, 0x6000 <.text+0x5000>
    3ea8:      	ldp	x20, x19, [sp, #0x10]
    3eac:      	adrp	x2, 0x7000 <.text+0x6000>
    3eb0:      	add	x1, x1, #0x4cd
    3eb4:      	add	x2, x2, #0x77c
    3eb8:      	orr	w0, wzr, #0x80000000
    3ebc:      	ldp	x22, x21, [sp], #0x30
    3ec0:      	b	0x4674 <.text+0x3674>
    3ec4:      	stp	x28, x27, [sp, #-0x60]!
    3ec8:      	stp	x26, x25, [sp, #0x10]
    3ecc:      	stp	x24, x23, [sp, #0x20]
    3ed0:      	stp	x22, x21, [sp, #0x30]
    3ed4:      	stp	x20, x19, [sp, #0x40]
    3ed8:      	stp	x29, x30, [sp, #0x50]
    3edc:      	add	x29, sp, #0x50
    3ee0:      	sub	sp, sp, #0x70
    3ee4:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    3ee8:      	mov	x26, x2
    3eec:      	mov	x20, x1
    3ef0:      	movk	x21, #0x9
    3ef4:      	cbz	x0, 0x3f44 <.text+0x2f44>
    3ef8:      	cbz	x20, 0x3f44 <.text+0x2f44>
    3efc:      	cbz	x26, 0x3f44 <.text+0x2f44>
    3f00:      	ldrb	w28, [x0, #0x11]
    3f04:      	ldrb	w22, [x0, #0x3]
    3f08:      	ldrb	w23, [x0, #0x2]
    3f0c:      	lsl	x0, x28, #3
    3f10:      	bl	0x458c <.text+0x358c>
    3f14:      	mov	x24, x0
    3f18:      	cbz	x24, 0x3f64 <.text+0x2f64>
    3f1c:      	bfi	w23, w22, #8, #8
    3f20:      	and	w13, w23, #0xff00
    3f24:      	mov	x25, xzr
    3f28:      	cmp	w13, #0x200
    3f2c:      	mov	w8, #0xd                // =13
    3f30:      	stur	w13, [x29, #-0x54]
    3f34:      	orr	w9, wzr, #0x7
    3f38:      	csel	x5, x9, x8, eq
    3f3c:      	str	x5, [sp, #0x48]
    3f40:      	b	0x3f9c <.text+0x2f9c>
    3f44:      	adrp	x1, 0x6000 <.text+0x5000>
    3f48:      	adrp	x2, 0x7000 <.text+0x6000>
    3f4c:      	add	x1, x1, #0x4cd
    3f50:      	add	x2, x2, #0x7e0
    3f54:      	orr	w0, wzr, #0x80000000
    3f58:      	bl	0x4674 <.text+0x3674>
    3f5c:      	sub	x21, x21, #0x7
    3f60:      	b	0x42c4 <.text+0x32c4>
    3f64:      	adrp	x1, 0x7000 <.text+0x6000>
    3f68:      	adrp	x2, 0x7000 <.text+0x6000>
    3f6c:      	add	x1, x1, #0x7fe
    3f70:      	add	x2, x2, #0x7e0
    3f74:      	orr	w0, wzr, #0x80000000
    3f78:      	bl	0x4674 <.text+0x3674>
    3f7c:      	b	0x42c4 <.text+0x32c4>
    3f80:      	ldr	x25, [sp, #0x8]
    3f84:      	ldr	x24, [sp, #0x60]
    3f88:      	str	x22, [x19, #0x8]
    3f8c:      	str	x19, [x24, x25, lsl #3]
    3f90:      	add	x25, x25, #0x1
    3f94:      	ldp	x20, x26, [sp, #0x18]
    3f98:      	ldr	x28, [sp, #0x10]
    3f9c:      	mov	w22, #0x9               // =9
    3fa0:      	and	w9, w25, #0xff
    3fa4:      	cmp	w9, w28
    3fa8:      	b.hs	0x42e8 <.text+0x32e8>
    3fac:      	add	x9, x24, w9, uxtw #3
    3fb0:      	cbz	x9, 0x4358 <.text+0x3358>
    3fb4:      	ldr	x27, [x20, x25, lsl #3]
    3fb8:      	cbz	x27, 0x4358 <.text+0x3358>
    3fbc:      	orr	w0, wzr, #0x10
    3fc0:      	bl	0x458c <.text+0x358c>
    3fc4:      	mov	x19, x0
    3fc8:      	cbz	x19, 0x4378 <.text+0x3378>
    3fcc:      	mov	x0, x22
    3fd0:      	bl	0x458c <.text+0x358c>
    3fd4:      	str	x0, [x19]
    3fd8:      	cbz	x0, 0x4394 <.text+0x3394>
    3fdc:      	adrp	x16, 0xa000
    3fe0:      	mov	x1, x27
    3fe4:      	mov	x2, x22
    3fe8:      	ldr	x10, [x16, #0x458]
    3fec:      	ldr	x10, [x10, #0x160]
    3ff0:      	blr	x10
    3ff4:      	ldrb	w7, [x27, #0x4]
    3ff8:      	lsl	x0, x7, #3
    3ffc:      	str	x7, [sp, #0x58]
    4000:      	bl	0x458c <.text+0x358c>
    4004:      	mov	x22, x0
    4008:      	str	x22, [sp, #0x50]
    400c:      	cbz	x22, 0x43a8 <.text+0x33a8>
    4010:      	str	x24, [sp, #0x60]
    4014:      	add	x24, x27, #0x9
    4018:      	stp	x25, x28, [sp, #0x8]
    401c:      	mov	w25, wzr
    4020:      	stp	x20, x26, [sp, #0x18]
    4024:      	mov	x20, xzr
    4028:      	ldrb	w9, [x27, #0x3]
    402c:      	ldrb	w26, [x27, #0x2]
    4030:      	bfi	w26, w9, #8, #8
    4034:      	b	0x406c <.text+0x306c>
    4038:      	ldr	x4, [sp, #0x48]
    403c:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    4040:      	str	x20, [x27, #0x8]
    4044:      	movk	x21, #0x9
    4048:      	ldp	x24, x20, [sp, #0x38]
    404c:      	madd	w11, w28, w4, w25
    4050:      	ldr	x22, [sp, #0x50]
    4054:      	ldr	x19, [sp, #0x30]
    4058:      	ldr	w23, [sp, #0x2c]
    405c:      	add	w25, w11, #0x9
    4060:      	add	x24, x24, w25, uxth
    4064:      	str	x27, [x22, x20, lsl #3]
    4068:      	add	x20, x20, #0x1
    406c:      	ldr	x6, [sp, #0x58]
    4070:      	and	w8, w20, #0xff
    4074:      	cmp	w8, w6
    4078:      	b.hs	0x3f80 <.text+0x2f80>
    407c:      	cbz	x24, 0x42f4 <.text+0x32f4>
    4080:      	add	x11, x22, w8, uxtw #3
    4084:      	cbz	x11, 0x42f4 <.text+0x32f4>
    4088:      	orr	w0, wzr, #0x10
    408c:      	bl	0x458c <.text+0x358c>
    4090:      	mov	x27, x0
    4094:      	cbz	x27, 0x4318 <.text+0x3318>
    4098:      	mov	w28, #0x9               // =9
    409c:      	mov	x0, x28
    40a0:      	bl	0x458c <.text+0x358c>
    40a4:      	str	x0, [x27]
    40a8:      	cbz	x0, 0x4338 <.text+0x3338>
    40ac:      	adrp	x17, 0xa000
    40b0:      	str	x20, [sp, #0x40]
    40b4:      	mov	x1, x24
    40b8:      	mov	x2, x28
    40bc:      	ldr	x12, [x17, #0x458]
    40c0:      	ldr	x11, [x12, #0x160]
    40c4:      	blr	x11
    40c8:      	ldrb	w28, [x24, #0x4]
    40cc:      	lsl	x0, x28, #3
    40d0:      	bl	0x458c <.text+0x358c>
    40d4:      	mov	x20, x0
    40d8:      	cbz	x20, 0x43c4 <.text+0x33c4>
    40dc:      	add	x22, x24, #0x9
    40e0:      	str	x24, [sp, #0x38]
    40e4:      	ldr	x24, [sp, #0x60]
    40e8:      	b	0x40f0 <.text+0x30f0>
    40ec:      	add	x22, x22, x8
    40f0:      	ldrb	w10, [x22, #0x1]
    40f4:      	cmp	w10, #0x5
    40f8:      	b.eq	0x4110 <.text+0x3110>
    40fc:      	ldrb	w8, [x22]
    4100:      	add	w25, w8, w25, uxth
    4104:      	cmp	w25, w26
    4108:      	b.ls	0x40ec <.text+0x30ec>
    410c:      	b	0x41ec <.text+0x31ec>
    4110:      	str	w23, [sp, #0x2c]
    4114:      	mov	x23, xzr
    4118:      	str	x19, [sp, #0x30]
    411c:      	b	0x4124 <.text+0x3124>
    4120:      	add	x23, x23, #0x1
    4124:      	cmp	x23, x28
    4128:      	b.hs	0x4038 <.text+0x3038>
    412c:      	ldur	w12, [x29, #-0x54]
    4130:      	cmp	w12, #0x200
    4134:      	b.ne	0x4168 <.text+0x3168>
    4138:      	orr	w0, wzr, #0x7
    413c:      	bl	0x458c <.text+0x358c>
    4140:      	str	x0, [x20, x23, lsl #3]
    4144:      	cbz	x0, 0x420c <.text+0x320c>
    4148:      	adrp	x1, 0xa000
    414c:      	orr	w2, wzr, #0x7
    4150:      	ldr	x13, [x1, #0x458]
    4154:      	mov	x1, x22
    4158:      	ldr	x13, [x13, #0x160]
    415c:      	blr	x13
    4160:      	add	x22, x22, #0x7
    4164:      	b	0x4120 <.text+0x3120>
    4168:      	orr	w0, wzr, #0x10
    416c:      	bl	0x458c <.text+0x358c>
    4170:      	mov	x19, x0
    4174:      	orr	w0, wzr, #0x7
    4178:      	bl	0x458c <.text+0x358c>
    417c:      	mov	x21, x0
    4180:      	orr	w0, wzr, #0x6
    4184:      	bl	0x458c <.text+0x358c>
    4188:      	mov	x24, x0
    418c:      	cbz	x19, 0x422c <.text+0x322c>
    4190:      	cbz	x21, 0x422c <.text+0x322c>
    4194:      	cbz	x24, 0x422c <.text+0x322c>
    4198:      	adrp	x2, 0xa000
    419c:      	str	x19, [x20, x23, lsl #3]
    41a0:      	stp	x21, x24, [x19]
    41a4:      	mov	x19, x2
    41a8:      	orr	w2, wzr, #0x7
    41ac:      	mov	x0, x21
    41b0:      	ldr	x14, [x19, #0x458]
    41b4:      	mov	x1, x22
    41b8:      	ldr	x14, [x14, #0x160]
    41bc:      	blr	x14
    41c0:      	ldr	x15, [x19, #0x458]
    41c4:      	add	x1, x22, #0x7
    41c8:      	orr	w2, wzr, #0x6
    41cc:      	mov	x0, x24
    41d0:      	ldr	x15, [x15, #0x160]
    41d4:      	blr	x15
    41d8:      	ldrb	w16, [x21]
    41dc:      	ldrb	w17, [x24]
    41e0:      	add	x3, x22, x16
    41e4:      	add	x22, x3, x17
    41e8:      	b	0x4120 <.text+0x3120>
    41ec:      	adrp	x1, 0x7000 <.text+0x6000>
    41f0:      	adrp	x2, 0x7000 <.text+0x6000>
    41f4:      	add	x1, x1, #0x989
    41f8:      	add	x2, x2, #0x944
    41fc:      	orr	w0, wzr, #0x80000000
    4200:      	bl	0x4674 <.text+0x3674>
    4204:      	sub	x21, x21, #0x7
    4208:      	b	0x4268 <.text+0x3268>
    420c:      	adrp	x1, 0x7000 <.text+0x6000>
    4210:      	adrp	x2, 0x7000 <.text+0x6000>
    4214:      	add	x1, x1, #0x9ac
    4218:      	add	x2, x2, #0x944
    421c:      	orr	w0, wzr, #0x80000000
    4220:      	mov	w3, w23
    4224:      	bl	0x4674 <.text+0x3674>
    4228:      	b	0x4254 <.text+0x3254>
    422c:      	adrp	x1, 0x7000 <.text+0x6000>
    4230:      	adrp	x2, 0x7000 <.text+0x6000>
    4234:      	add	x1, x1, #0x9cf
    4238:      	add	x2, x2, #0x944
    423c:      	orr	w0, wzr, #0x80000000
    4240:      	mov	w3, w23
    4244:      	mov	x4, x19
    4248:      	mov	x5, x21
    424c:      	mov	x6, x24
    4250:      	bl	0x4674 <.text+0x3674>
    4254:      	ldr	x24, [sp, #0x60]
    4258:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    425c:      	ldr	x19, [sp, #0x30]
    4260:      	movk	x21, #0x9
    4264:      	ldr	w23, [sp, #0x2c]
    4268:      	ldr	x22, [sp, #0x50]
    426c:      	mov	w0, w23
    4270:      	mov	w1, w28
    4274:      	mov	x2, x20
    4278:      	bl	0x3dec <.text+0x2dec>
    427c:      	mov	x0, x20
    4280:      	bl	0x45fc <.text+0x35fc>
    4284:      	ldr	x0, [x27]
    4288:      	cbz	x0, 0x4294 <.text+0x3294>
    428c:      	bl	0x45fc <.text+0x35fc>
    4290:      	str	xzr, [x27]
    4294:      	mov	x0, x27
    4298:      	bl	0x45fc <.text+0x35fc>
    429c:      	mov	x0, x22
    42a0:      	bl	0x45fc <.text+0x35fc>
    42a4:      	ldr	x0, [x19]
    42a8:      	cbz	x0, 0x42b4 <.text+0x32b4>
    42ac:      	bl	0x45fc <.text+0x35fc>
    42b0:      	str	xzr, [x19]
    42b4:      	mov	x0, x19
    42b8:      	bl	0x45fc <.text+0x35fc>
    42bc:      	mov	x0, x24
    42c0:      	bl	0x45fc <.text+0x35fc>
    42c4:      	mov	x0, x21
    42c8:      	sub	sp, x29, #0x50
    42cc:      	ldp	x29, x30, [sp, #0x50]
    42d0:      	ldp	x20, x19, [sp, #0x40]
    42d4:      	ldp	x22, x21, [sp, #0x30]
    42d8:      	ldp	x24, x23, [sp, #0x20]
    42dc:      	ldp	x26, x25, [sp, #0x10]
    42e0:      	ldp	x28, x27, [sp], #0x60
    42e4:      	ret
    42e8:      	mov	x21, xzr
    42ec:      	str	x24, [x26]
    42f0:      	b	0x42c4 <.text+0x32c4>
    42f4:      	adrp	x1, 0x6000 <.text+0x5000>
    42f8:      	adrp	x2, 0x7000 <.text+0x6000>
    42fc:      	add	x1, x1, #0x4cd
    4300:      	add	x2, x2, #0x8d5
    4304:      	orr	w0, wzr, #0x80000000
    4308:      	bl	0x4674 <.text+0x3674>
    430c:      	ldr	x24, [sp, #0x60]
    4310:      	sub	x21, x21, #0x7
    4314:      	b	0x429c <.text+0x329c>
    4318:      	adrp	x1, 0x7000 <.text+0x6000>
    431c:      	adrp	x2, 0x7000 <.text+0x6000>
    4320:      	add	x1, x1, #0x8f1
    4324:      	add	x2, x2, #0x8d5
    4328:      	orr	w0, wzr, #0x80000000
    432c:      	bl	0x4674 <.text+0x3674>
    4330:      	ldr	x24, [sp, #0x60]
    4334:      	b	0x429c <.text+0x329c>
    4338:      	adrp	x1, 0x7000 <.text+0x6000>
    433c:      	adrp	x2, 0x7000 <.text+0x6000>
    4340:      	add	x1, x1, #0x910
    4344:      	add	x2, x2, #0x8d5
    4348:      	orr	w0, wzr, #0x80000000
    434c:      	bl	0x4674 <.text+0x3674>
    4350:      	ldr	x24, [sp, #0x60]
    4354:      	b	0x4284 <.text+0x3284>
    4358:      	adrp	x1, 0x6000 <.text+0x5000>
    435c:      	adrp	x2, 0x7000 <.text+0x6000>
    4360:      	add	x1, x1, #0x4cd
    4364:      	add	x2, x2, #0x825
    4368:      	orr	w0, wzr, #0x80000000
    436c:      	bl	0x4674 <.text+0x3674>
    4370:      	sub	x21, x21, #0x7
    4374:      	b	0x42bc <.text+0x32bc>
    4378:      	adrp	x1, 0x7000 <.text+0x6000>
    437c:      	adrp	x2, 0x7000 <.text+0x6000>
    4380:      	add	x1, x1, #0x83e
    4384:      	add	x2, x2, #0x825
    4388:      	orr	w0, wzr, #0x80000000
    438c:      	bl	0x4674 <.text+0x3674>
    4390:      	b	0x42bc <.text+0x32bc>
    4394:      	adrp	x1, 0x7000 <.text+0x6000>
    4398:      	adrp	x2, 0x7000 <.text+0x6000>
    439c:      	add	x1, x1, #0x860
    43a0:      	add	x2, x2, #0x825
    43a4:      	b	0x43b8 <.text+0x33b8>
    43a8:      	adrp	x1, 0x7000 <.text+0x6000>
    43ac:      	adrp	x2, 0x7000 <.text+0x6000>
    43b0:      	add	x1, x1, #0x8b5
    43b4:      	add	x2, x2, #0x894
    43b8:      	orr	w0, wzr, #0x80000000
    43bc:      	bl	0x4674 <.text+0x3674>
    43c0:      	b	0x42a4 <.text+0x32a4>
    43c4:      	adrp	x1, 0x7000 <.text+0x6000>
    43c8:      	adrp	x2, 0x7000 <.text+0x6000>
    43cc:      	add	x1, x1, #0x96a
    43d0:      	add	x2, x2, #0x944
    43d4:      	orr	w0, wzr, #0x80000000
    43d8:      	bl	0x4674 <.text+0x3674>
    43dc:      	ldr	x24, [sp, #0x60]
    43e0:      	mov	x20, xzr
    43e4:      	b	0x426c <.text+0x326c>
    43e8:      	stp	x22, x21, [sp, #-0x30]!
    43ec:      	stp	x20, x19, [sp, #0x10]
    43f0:      	stp	x29, x30, [sp, #0x20]
    43f4:      	add	x29, sp, #0x20
    43f8:      	adrp	x20, 0xa000
    43fc:      	add	x20, x20, #0x3d8
    4400:      	ldr	x8, [x20]
    4404:      	cmp	x8, x20
    4408:      	b.eq	0x4450 <.text+0x3450>
    440c:      	adrp	x21, 0xa000
    4410:      	ldr	x22, [x8]
    4414:      	ldurb	w9, [x8, #-0x4]
    4418:      	cbnz	w9, 0x4444 <.text+0x3444>
    441c:      	ldr	x9, [x21, #0x458]
    4420:      	sub	x19, x8, #0x20
    4424:      	ldr	x0, [x19]
    4428:      	ldr	x8, [x9, #0x30]
    442c:      	ldr	x1, [x19, #0x10]
    4430:      	blr	x8
    4434:      	add	x0, x19, #0x20
    4438:      	bl	0x527c <.text+0x427c>
    443c:      	mov	x0, x19
    4440:      	bl	0x45fc <.text+0x35fc>
    4444:      	cmp	x22, x20
    4448:      	mov	x8, x22
    444c:      	b.ne	0x4410 <.text+0x3410>
    4450:      	ldp	x29, x30, [sp, #0x20]
    4454:      	mov	x0, xzr
    4458:      	ldp	x20, x19, [sp, #0x10]
    445c:      	ldp	x22, x21, [sp], #0x30
    4460:      	ret
    4464:      	stp	x22, x21, [sp, #-0x30]!
    4468:      	stp	x20, x19, [sp, #0x10]
    446c:      	stp	x29, x30, [sp, #0x20]
    4470:      	add	x29, sp, #0x20
    4474:      	mov	x22, x1
    4478:      	mov	x19, x0
    447c:      	bl	0x44ec <.text+0x34ec>
    4480:      	mov	x20, x0
    4484:      	neg	x8, x20
    4488:      	and	x21, x19, x8
    448c:      	add	x22, x19, x22
    4490:      	b	0x44a0 <.text+0x34a0>
    4494:      	mov	x0, x21
    4498:      	bl	0x44cc <.text+0x34cc>
    449c:      	add	x21, x21, x20
    44a0:      	cmp	x21, x22
    44a4:      	b.lo	0x4494 <.text+0x3494>
    44a8:      	bl	0x44d4 <.text+0x34d4>
    44ac:      	bl	0x44dc <.text+0x34dc>
    44b0:      	mov	x0, x19
    44b4:      	ldp	x29, x30, [sp, #0x20]
    44b8:      	ldp	x20, x19, [sp, #0x10]
    44bc:      	ldp	x22, x21, [sp], #0x30
    44c0:      	ret
    44c4:      	dc	ivac, x0
    44c8:      	ret
    44cc:      	dc	cvac, x0
    44d0:      	ret
    44d4:      	dsb	sy
    44d8:      	ret
    44dc:      	isb
    44e0:      	ret
    44e4:      	mov	x0, #0x1                // =1
    44e8:      	ret
    44ec:      	stp	x29, x30, [sp, #-0x10]!
    44f0:      	mov	x29, sp
    44f4:      	bl	0x450c <.text+0x350c>
    44f8:      	ubfx	w8, w0, #16, #4
    44fc:      	orr	w9, wzr, #0x4
    4500:      	lsl	w0, w9, w8
    4504:      	ldp	x29, x30, [sp], #0x10
    4508:      	ret
    450c:      	mrs	x0, CTR_EL0
    4510:      	ret
    4514:      	stp	x29, x30, [sp, #-0x10]!
    4518:      	mov	x29, sp
    451c:      	sub	sp, sp, #0x10
    4520:      	adrp	x8, 0xa000
    4524:      	add	x2, sp, #0x8
    4528:      	ldr	x9, [x8, #0x458]
    452c:      	ldr	x8, [x9, #0x40]
    4530:      	blr	x8
    4534:      	tbnz	x0, #0x3f, 0x4540 <.text+0x3540>
    4538:      	ldr	x0, [sp, #0x8]
    453c:      	b	0x4548 <.text+0x3548>
    4540:      	mov	x0, xzr
    4544:      	str	xzr, [sp, #0x8]
    4548:      	mov	sp, x29
    454c:      	ldp	x29, x30, [sp], #0x10
    4550:      	ret
    4554:      	stp	x20, x19, [sp, #-0x20]!
    4558:      	stp	x29, x30, [sp, #0x10]
    455c:      	add	x29, sp, #0x10
    4560:      	mov	x19, x1
    4564:      	bl	0x4514 <.text+0x3514>
    4568:      	cbz	x0, 0x457c <.text+0x357c>
    456c:      	ldp	x29, x30, [sp, #0x10]
    4570:      	mov	x1, x19
    4574:      	ldp	x20, x19, [sp], #0x20
    4578:      	b	0x4bb4 <.text+0x3bb4>
    457c:      	ldp	x29, x30, [sp, #0x10]
    4580:      	mov	x0, xzr
    4584:      	ldp	x20, x19, [sp], #0x20
    4588:      	ret
    458c:      	mov	x8, x0
    4590:      	orr	w0, wzr, #0x4
    4594:      	mov	x1, x8
    4598:      	b	0x4554 <.text+0x3554>
    459c:      	stp	x22, x21, [sp, #-0x30]!
    45a0:      	stp	x20, x19, [sp, #0x10]
    45a4:      	stp	x29, x30, [sp, #0x20]
    45a8:      	add	x29, sp, #0x20
    45ac:      	mov	x21, x2
    45b0:      	mov	x22, x1
    45b4:      	mov	x1, x21
    45b8:      	mov	x19, x3
    45bc:      	bl	0x4554 <.text+0x3554>
    45c0:      	mov	x20, x0
    45c4:      	cbz	x19, 0x45e8 <.text+0x35e8>
    45c8:      	cbz	x20, 0x45e8 <.text+0x35e8>
    45cc:      	cmp	x22, x21
    45d0:      	csel	x2, x22, x21, lo
    45d4:      	mov	x0, x20
    45d8:      	mov	x1, x19
    45dc:      	bl	0x4c10 <.text+0x3c10>
    45e0:      	mov	x0, x19
    45e4:      	bl	0x45fc <.text+0x35fc>
    45e8:      	mov	x0, x20
    45ec:      	ldp	x29, x30, [sp, #0x20]
    45f0:      	ldp	x20, x19, [sp, #0x10]
    45f4:      	ldp	x22, x21, [sp], #0x30
    45f8:      	ret
    45fc:      	stp	x29, x30, [sp, #-0x10]!
    4600:      	mov	x29, sp
    4604:      	adrp	x8, 0xa000
    4608:      	ldr	x9, [x8, #0x458]
    460c:      	ldr	x9, [x9, #0x48]
    4610:      	blr	x9
    4614:      	mov	x8, x0
    4618:      	tbnz	x8, #0x3f, 0x4624 <.text+0x3624>
    461c:      	ldp	x29, x30, [sp], #0x10
    4620:      	ret
    4624:      	adrp	x1, 0x6000 <.text+0x5000>
    4628:      	add	x1, x1, #0x454
    462c:      	orr	w0, wzr, #0x80000000
    4630:      	mov	x2, x8
    4634:      	bl	0x4674 <.text+0x3674>
    4638:      	adrp	x0, 0x7000 <.text+0x6000>
    463c:      	adrp	x2, 0x6000 <.text+0x5000>
    4640:      	add	x0, x0, #0xb17
    4644:      	mov	w1, #0x333              // =819
    4648:      	add	x2, x2, #0x488
    464c:      	ldp	x29, x30, [sp], #0x10
    4650:      	b	0x4a00 <.text+0x3a00>
    4654:      	mov	x8, x2
    4658:      	mov	x9, x0
    465c:      	mov	x10, x1
    4660:      	orr	w0, wzr, #0x4
    4664:      	mov	x1, x9
    4668:      	mov	x2, x10
    466c:      	mov	x3, x8
    4670:      	b	0x459c <.text+0x359c>
    4674:      	stp	x28, x27, [sp, #-0x50]!
    4678:      	stp	x24, x23, [sp, #0x10]
    467c:      	stp	x22, x21, [sp, #0x20]
    4680:      	stp	x20, x19, [sp, #0x30]
    4684:      	stp	x29, x30, [sp, #0x40]
    4688:      	add	x29, sp, #0x40
    468c:      	sub	sp, sp, #0x1a0
    4690:      	mov	x21, x1
    4694:      	stp	q6, q7, [sp, #0x60]
    4698:      	mov	x23, x0
    469c:      	stp	q4, q5, [sp, #0x40]
    46a0:      	stp	q2, q3, [sp, #0x20]
    46a4:      	stp	q0, q1, [sp]
    46a8:      	stp	x6, x7, [sp, #0xa0]
    46ac:      	stp	x4, x5, [sp, #0x90]
    46b0:      	stp	x2, x3, [sp, #0x80]
    46b4:      	cbz	x21, 0x4974 <.text+0x3974>
    46b8:      	bl	0x59f8 <.text+0x49f8>
    46bc:      	mov	w10, w0
    46c0:      	and	x11, x10, x23
    46c4:      	cbz	x11, 0x49c8 <.text+0x39c8>
    46c8:      	mov	x0, x21
    46cc:      	bl	0x5480 <.text+0x4480>
    46d0:      	add	x19, x0, #0x68
    46d4:      	cmp	x19, #0xd0
    46d8:      	b.hi	0x49c8 <.text+0x39c8>
    46dc:      	add	x8, sp, #0xd0
    46e0:      	str	w23, [sp, #0xd4]
    46e4:      	add	x22, x8, #0x68
    46e8:      	mov	w1, #0x68               // =104
    46ec:      	mov	x0, x22
    46f0:      	mov	x2, x21
    46f4:      	mov	x3, x1
    46f8:      	orr	x20, x8, #0x4
    46fc:      	add	x24, x8, #0x8
    4700:      	bl	0x5304 <.text+0x4304>
    4704:      	mov	x10, sp
    4708:      	add	x11, sp, #0x80
    470c:      	orr	w8, wzr, #0xffffff80
    4710:      	mov	w9, #-0x30              // =-48
    4714:      	add	x6, x10, #0x80
    4718:      	add	x7, x11, #0x30
    471c:      	add	x10, x29, #0x10
    4720:      	stp	w9, w8, [sp, #0xc8]
    4724:      	orr	w8, wzr, #0x1
    4728:      	stp	x7, x6, [sp, #0xb8]
    472c:      	mov	x9, #0x680100000000     // =114353504256000
    4730:      	str	x10, [sp, #0xb0]
    4734:      	adrp	x10, 0x7000 <.text+0x6000>
    4738:      	add	x10, x10, #0xbc8
    473c:      	b	0x4744 <.text+0x3744>
    4740:      	add	x21, x21, #0x1
    4744:      	ldrb	w11, [x21]
    4748:      	cmp	w11, #0x25
    474c:      	b.eq	0x4758 <.text+0x3758>
    4750:      	cbnz	w11, 0x4740 <.text+0x3740>
    4754:      	b	0x4990 <.text+0x3990>
    4758:      	mov	w14, wzr
    475c:      	b	0x476c <.text+0x376c>
    4760:      	ldr	x16, [x17]
    4764:      	mov	w14, w11
    4768:      	str	x16, [x24], #0x8
    476c:      	mov	x12, x21
    4770:      	ldrb	w13, [x21, #0x1]!
    4774:      	mov	w11, w14
    4778:      	cmp	w13, #0x2e
    477c:      	b.hi	0x4790 <.text+0x3790>
    4780:      	lsl	x14, x8, x13
    4784:      	and	x15, x14, x9
    4788:      	mov	w14, w11
    478c:      	cbnz	x15, 0x476c <.text+0x376c>
    4790:      	sub	w14, w13, #0x30
    4794:      	cmp	w14, #0xa
    4798:      	mov	w14, w11
    479c:      	b.lo	0x476c <.text+0x376c>
    47a0:      	cmp	w13, #0x4b
    47a4:      	b.gt	0x47d8 <.text+0x37d8>
    47a8:      	cmp	w13, #0x2a
    47ac:      	b.ne	0x47fc <.text+0x37fc>
    47b0:      	ldrsw	x14, [sp, #0xc8]
    47b4:      	tbz	w14, #0x1f, 0x47c8 <.text+0x37c8>
    47b8:      	add	w12, w14, #0x8
    47bc:      	cmp	w12, #0x0
    47c0:      	str	w12, [sp, #0xc8]
    47c4:      	b.le	0x47f0 <.text+0x37f0>
    47c8:      	ldr	x17, [sp, #0xb0]
    47cc:      	add	x13, x17, #0x8
    47d0:      	str	x13, [sp, #0xb0]
    47d4:      	b	0x4760 <.text+0x3760>
    47d8:      	orr	w14, wzr, #0x1
    47dc:      	cmp	w13, #0x4c
    47e0:      	b.eq	0x476c <.text+0x376c>
    47e4:      	cmp	w13, #0x6c
    47e8:      	b.eq	0x476c <.text+0x376c>
    47ec:      	b	0x4808 <.text+0x3808>
    47f0:      	ldr	x13, [sp, #0xb8]
    47f4:      	add	x17, x13, x14
    47f8:      	b	0x4760 <.text+0x3760>
    47fc:      	cbnz	w13, 0x4808 <.text+0x3808>
    4800:      	mov	x21, x12
    4804:      	b	0x480c <.text+0x380c>
    4808:      	add	x21, x12, #0x1
    480c:      	ldrb	w13, [x21]
    4810:      	sub	w5, w13, #0x61
    4814:      	cmp	w5, #0x17
    4818:      	b.hi	0x4854 <.text+0x3854>
    481c:      	ldr	x17, [x10, x5, lsl #3]
    4820:      	br	x17
    4824:      	ldrsw	x15, [sp, #0xc8]
    4828:      	tbz	w15, #0x1f, 0x483c <.text+0x383c>
    482c:      	add	w1, w15, #0x8
    4830:      	cmp	w1, #0x0
    4834:      	str	w1, [sp, #0xc8]
    4838:      	b.le	0x495c <.text+0x395c>
    483c:      	ldr	x3, [sp, #0xb0]
    4840:      	add	x15, x3, #0x8
    4844:      	str	x15, [sp, #0xb0]
    4848:      	ldr	x2, [x3]
    484c:      	str	x2, [x24], #0x8
    4850:      	b	0x492c <.text+0x392c>
    4854:      	cmp	w13, #0x53
    4858:      	b.eq	0x48a4 <.text+0x38a4>
    485c:      	cmp	w13, #0x58
    4860:      	b.ne	0x492c <.text+0x392c>
    4864:      	ldrsw	x12, [sp, #0xc8]
    4868:      	and	w15, w11, #0xff
    486c:      	cbnz	w15, 0x48d4 <.text+0x38d4>
    4870:      	cmp	w13, #0x70
    4874:      	b.eq	0x48d4 <.text+0x38d4>
    4878:      	tbz	w12, #0x1f, 0x488c <.text+0x388c>
    487c:      	add	w17, w12, #0x8
    4880:      	cmp	w17, #0x0
    4884:      	str	w17, [sp, #0xc8]
    4888:      	b.le	0x4944 <.text+0x3944>
    488c:      	ldr	x1, [sp, #0xb0]
    4890:      	add	x14, x1, #0x8
    4894:      	str	x14, [sp, #0xb0]
    4898:      	ldr	x5, [x1]
    489c:      	str	w5, [x24], #0x8
    48a0:      	b	0x492c <.text+0x392c>
    48a4:      	ldrsw	x11, [sp, #0xc8]
    48a8:      	tbz	w11, #0x1f, 0x48bc <.text+0x38bc>
    48ac:      	add	w0, w11, #0x8
    48b0:      	cmp	w0, #0x0
    48b4:      	str	w0, [sp, #0xc8]
    48b8:      	b.le	0x4938 <.text+0x3938>
    48bc:      	ldr	x2, [sp, #0xb0]
    48c0:      	add	x11, x2, #0x8
    48c4:      	str	x11, [sp, #0xb0]
    48c8:      	ldr	x0, [x2]
    48cc:      	str	x0, [x24], #0x8
    48d0:      	b	0x492c <.text+0x392c>
    48d4:      	tbz	w12, #0x1f, 0x48e8 <.text+0x38e8>
    48d8:      	add	w16, w12, #0x8
    48dc:      	cmp	w16, #0x0
    48e0:      	str	w16, [sp, #0xc8]
    48e4:      	b.le	0x4950 <.text+0x3950>
    48e8:      	ldr	x0, [sp, #0xb0]
    48ec:      	add	x12, x0, #0x8
    48f0:      	str	x12, [sp, #0xb0]
    48f4:      	ldr	x7, [x0]
    48f8:      	str	x7, [x24], #0x8
    48fc:      	b	0x492c <.text+0x392c>
    4900:      	ldrsw	x16, [sp, #0xc8]
    4904:      	tbz	w16, #0x1f, 0x4918 <.text+0x3918>
    4908:      	add	w2, w16, #0x8
    490c:      	cmp	w2, #0x0
    4910:      	str	w2, [sp, #0xc8]
    4914:      	b.le	0x4968 <.text+0x3968>
    4918:      	ldr	x4, [sp, #0xb0]
    491c:      	add	x16, x4, #0x8
    4920:      	str	x16, [sp, #0xb0]
    4924:      	ldr	x11, [x4]
    4928:      	str	x11, [x24], #0x8
    492c:      	cmp	x24, x22
    4930:      	b.ls	0x4740 <.text+0x3740>
    4934:      	b	0x49e4 <.text+0x39e4>
    4938:      	ldr	x3, [sp, #0xb8]
    493c:      	add	x2, x3, x11
    4940:      	b	0x48c8 <.text+0x38c8>
    4944:      	ldr	x6, [sp, #0xb8]
    4948:      	add	x1, x6, x12
    494c:      	b	0x4898 <.text+0x3898>
    4950:      	ldr	x23, [sp, #0xb8]
    4954:      	add	x0, x23, x12
    4958:      	b	0x48f4 <.text+0x38f4>
    495c:      	ldr	x1, [sp, #0xb8]
    4960:      	add	x3, x1, x15
    4964:      	b	0x4848 <.text+0x3848>
    4968:      	ldr	x4, [sp, #0xb8]
    496c:      	add	x4, x4, x16
    4970:      	b	0x4924 <.text+0x3924>
    4974:      	adrp	x0, 0x7000 <.text+0x6000>
    4978:      	adrp	x2, 0x7000 <.text+0x6000>
    497c:      	add	x0, x0, #0xc88
    4980:      	mov	w1, #0x44               // =68
    4984:      	add	x2, x2, #0xc93
    4988:      	bl	0x4a00 <.text+0x3a00>
    498c:      	b	0x498c <.text+0x398c>
    4990:      	bl	0x5e70 <.text+0x4e70>
    4994:      	bl	0x5e80 <.text+0x4e80>
    4998:      	bl	0x5e90 <.text+0x4e90>
    499c:      	and	w8, w0, #0xff
    49a0:      	cbz	w8, 0x49c8 <.text+0x39c8>
    49a4:      	adrp	x4, 0xa000
    49a8:      	mov	w2, wzr
    49ac:      	mov	x3, xzr
    49b0:      	mov	w1, #0x3050000          // =50659328
    49b4:      	add	x4, x4, #0x60
    49b8:      	orr	w0, wzr, #0x3
    49bc:      	mov	x5, x20
    49c0:      	mov	x6, x19
    49c4:      	bl	0x5ea0 <.text+0x4ea0>
    49c8:      	sub	sp, x29, #0x40
    49cc:      	ldp	x29, x30, [sp, #0x40]
    49d0:      	ldp	x20, x19, [sp, #0x30]
    49d4:      	ldp	x22, x21, [sp, #0x20]
    49d8:      	ldp	x24, x23, [sp, #0x10]
    49dc:      	ldp	x28, x27, [sp], #0x50
    49e0:      	ret
    49e4:      	adrp	x0, 0x7000 <.text+0x6000>
    49e8:      	adrp	x2, 0x7000 <.text+0x6000>
    49ec:      	add	x0, x0, #0xc88
    49f0:      	mov	w1, #0xce               // =206
    49f4:      	add	x2, x2, #0xcaa
    49f8:      	bl	0x4a00 <.text+0x3a00>
    49fc:      	b	0x49fc <.text+0x39fc>
    4a00:      	stp	x28, x27, [sp, #-0x60]!
    4a04:      	stp	x26, x25, [sp, #0x10]
    4a08:      	stp	x24, x23, [sp, #0x20]
    4a0c:      	stp	x22, x21, [sp, #0x30]
    4a10:      	stp	x20, x19, [sp, #0x40]
    4a14:      	stp	x29, x30, [sp, #0x50]
    4a18:      	add	x29, sp, #0x50
    4a1c:      	sub	sp, sp, #0xd0
    4a20:      	adrp	x28, 0xa000
    4a24:      	mov	x22, x0
    4a28:      	mov	x20, x2
    4a2c:      	ldr	x8, [x28, #0x18]
    4a30:      	mov	x24, x1
    4a34:      	mov	x0, x8
    4a38:      	bl	0x5480 <.text+0x4480>
    4a3c:      	mov	x26, x0
    4a40:      	mov	x0, x22
    4a44:      	bl	0x5480 <.text+0x4480>
    4a48:      	mov	x19, x0
    4a4c:      	mov	x0, x20
    4a50:      	bl	0x5480 <.text+0x4480>
    4a54:      	mov	x21, x0
    4a58:      	add	x9, x26, x19
    4a5c:      	add	x9, x9, x21
    4a60:      	add	x8, x9, #0x2a
    4a64:      	cmp	x8, #0xc9
    4a68:      	b.lo	0x4aac <.text+0x3aac>
    4a6c:      	add	x8, x19, #0x28
    4a70:      	add	x10, x8, x21
    4a74:      	cmp	x10, #0xc9
    4a78:      	b.lo	0x4a98 <.text+0x3a98>
    4a7c:      	mov	w12, #0xa0              // =160
    4a80:      	cmp	x8, #0xc8
    4a84:      	mov	w14, #0x9f              // =159
    4a88:      	sub	x15, x12, x19
    4a8c:      	orr	w16, wzr, #0x1
    4a90:      	csel	x19, x19, x14, lo
    4a94:      	csel	x21, x15, x16, lo
    4a98:      	add	x23, sp, #0x8
    4a9c:      	str	w24, [sp, #0x1c]
    4aa0:      	mov	x27, xzr
    4aa4:      	add	x25, x23, #0x28
    4aa8:      	b	0x4b04 <.text+0x3b04>
    4aac:      	add	x23, sp, #0x8
    4ab0:      	str	w24, [sp, #0x1c]
    4ab4:      	add	x27, x26, #0x2
    4ab8:      	add	x25, x23, #0x28
    4abc:      	cmn	x26, #0x2
    4ac0:      	b.eq	0x4b04 <.text+0x3b04>
    4ac4:      	adrp	x1, 0x7000 <.text+0x6000>
    4ac8:      	add	x1, x1, #0xcd2
    4acc:      	orr	w2, wzr, #0x1
    4ad0:      	mov	x0, x25
    4ad4:      	add	x23, sp, #0x8
    4ad8:      	bl	0x4c10 <.text+0x3c10>
    4adc:      	ldr	x1, [x28, #0x18]
    4ae0:      	add	x0, x25, #0x1
    4ae4:      	sub	x2, x26, #0x1
    4ae8:      	bl	0x4c10 <.text+0x3c10>
    4aec:      	add	x11, x25, x27
    4af0:      	adrp	x1, 0x7000 <.text+0x6000>
    4af4:      	sub	x0, x11, #0x2
    4af8:      	add	x1, x1, #0xcd4
    4afc:      	orr	w2, wzr, #0x2
    4b00:      	bl	0x4c10 <.text+0x3c10>
    4b04:      	add	x0, x25, x27
    4b08:      	mov	x1, x22
    4b0c:      	mov	x2, x19
    4b10:      	bl	0x4c10 <.text+0x3c10>
    4b14:      	add	x0, x0, x19
    4b18:      	mov	x1, x20
    4b1c:      	mov	x2, x21
    4b20:      	sturb	wzr, [x0, #-0x1]
    4b24:      	bl	0x4c10 <.text+0x3c10>
    4b28:      	add	x12, x21, x0
    4b2c:      	sturb	wzr, [x12, #-0x1]
    4b30:      	bl	0x5e70 <.text+0x4e70>
    4b34:      	bl	0x5e80 <.text+0x4e80>
    4b38:      	and	w8, w0, #0xff
    4b3c:      	cbz	w8, 0x4b74 <.text+0x3b74>
    4b40:      	add	x2, x21, x19
    4b44:      	add	x13, x2, x27
    4b48:      	mov	w0, #-0x70000000        // =-1879048192
    4b4c:      	mov	w1, #0x3050000          // =50659328
    4b50:      	add	x6, x13, #0x28
    4b54:      	mov	w2, wzr
    4b58:      	mov	x3, xzr
    4b5c:      	mov	x4, xzr
    4b60:      	movk	w0, #0x2
    4b64:      	movk	w1, #0x7
    4b68:      	mov	x5, x23
    4b6c:      	bl	0x5ea0 <.text+0x4ea0>
    4b70:      	b	0x4b78 <.text+0x3b78>
    4b74:      	bl	0x5e90 <.text+0x4e90>
    4b78:      	adrp	x14, 0x6000 <.text+0x5000>
    4b7c:      	ldrb	w8, [x14, #0x4b4]
    4b80:      	tbnz	w8, #0x4, 0x4b90 <.text+0x3b90>
    4b84:      	tbz	w8, #0x5, 0x4b94 <.text+0x3b94>
    4b88:      	bl	0x50a8 <.text+0x40a8>
    4b8c:      	b	0x4b94 <.text+0x3b94>
    4b90:      	bl	0x5514 <.text+0x4514>
    4b94:      	sub	sp, x29, #0x50
    4b98:      	ldp	x29, x30, [sp, #0x50]
    4b9c:      	ldp	x20, x19, [sp, #0x40]
    4ba0:      	ldp	x22, x21, [sp, #0x30]
    4ba4:      	ldp	x24, x23, [sp, #0x20]
    4ba8:      	ldp	x26, x25, [sp, #0x10]
    4bac:      	ldp	x28, x27, [sp], #0x60
    4bb0:      	ret
    4bb4:      	stp	x29, x30, [sp, #-0x10]!
    4bb8:      	mov	x29, sp
    4bbc:      	cbnz	x0, 0x4be0 <.text+0x3be0>
    4bc0:      	cbz	x1, 0x4be0 <.text+0x3be0>
    4bc4:      	adrp	x0, 0x7000 <.text+0x6000>
    4bc8:      	adrp	x2, 0x7000 <.text+0x6000>
    4bcc:      	add	x0, x0, #0xcd7
    4bd0:      	mov	w1, #0x31               // =49
    4bd4:      	add	x2, x2, #0xce8
    4bd8:      	bl	0x4a00 <.text+0x3a00>
    4bdc:      	b	0x4bdc <.text+0x3bdc>
    4be0:      	neg	x8, x0
    4be4:      	cmp	x1, x8
    4be8:      	b.ls	0x4c08 <.text+0x3c08>
    4bec:      	adrp	x0, 0x7000 <.text+0x6000>
    4bf0:      	adrp	x2, 0x7000 <.text+0x6000>
    4bf4:      	add	x0, x0, #0xcd7
    4bf8:      	mov	w1, #0x32               // =50
    4bfc:      	add	x2, x2, #0xd10
    4c00:      	bl	0x4a00 <.text+0x3a00>
    4c04:      	b	0x4c04 <.text+0x3c04>
    4c08:      	ldp	x29, x30, [sp], #0x10
    4c0c:      	b	0x4cb4 <.text+0x3cb4>
    4c10:      	cbz	x2, 0x4c80 <.text+0x3c80>
    4c14:      	stp	x29, x30, [sp, #-0x10]!
    4c18:      	mov	x29, sp
    4c1c:      	sub	x8, x2, #0x1
    4c20:      	mvn	x9, x0
    4c24:      	cmp	x8, x9
    4c28:      	ldp	x29, x30, [sp], #0x10
    4c2c:      	b.ls	0x4c4c <.text+0x3c4c>
    4c30:      	adrp	x0, 0x7000 <.text+0x6000>
    4c34:      	adrp	x2, 0x7000 <.text+0x6000>
    4c38:      	add	x0, x0, #0xd46
    4c3c:      	add	x2, x2, #0xd57
    4c40:      	orr	w1, wzr, #0x38
    4c44:      	bl	0x4a00 <.text+0x3a00>
    4c48:      	b	0x4c48 <.text+0x3c48>
    4c4c:      	mvn	x11, x1
    4c50:      	cmp	x8, x11
    4c54:      	b.ls	0x4c74 <.text+0x3c74>
    4c58:      	adrp	x0, 0x7000 <.text+0x6000>
    4c5c:      	adrp	x2, 0x7000 <.text+0x6000>
    4c60:      	add	x0, x0, #0xd46
    4c64:      	mov	w1, #0x39               // =57
    4c68:      	add	x2, x2, #0xd9a
    4c6c:      	bl	0x4a00 <.text+0x3a00>
    4c70:      	b	0x4c70 <.text+0x3c70>
    4c74:      	cmp	x0, x1
    4c78:      	b.eq	0x4c80 <.text+0x3c80>
    4c7c:      	b	0x4ffc <.text+0x3ffc>
    4c80:      	ret
		...
    4c90:      	dup	v0.8h, w2
    4c94:      	lsl	x1, x1, #1
    4c98:      	b	0x4cc0 <.text+0x3cc0>
    4c9c:      	dup	v0.4s, w2
    4ca0:      	lsl	x1, x1, #2
    4ca4:      	b	0x4cc0 <.text+0x3cc0>
    4ca8:      	dup	v0.2d, x2
    4cac:      	lsl	x1, x1, #3
    4cb0:      	b	0x4cc0 <.text+0x3cc0>
    4cb4:      	movi	v0.16b, #0x0
    4cb8:      	b	0x4cc0 <.text+0x3cc0>
    4cbc:      	dup	v0.16b, w2
    4cc0:      	add	x4, x0, x1
    4cc4:      	mov	x2, v0.d[0]
    4cc8:      	cmp	x1, #0x60
    4ccc:      	b.hi	0x4d44 <.text+0x3d44>
    4cd0:      	cmp	x1, #0x10
    4cd4:      	b.hs	0x4d10 <.text+0x3d10>
    4cd8:      	tbz	w1, #0x3, 0x4cec <.text+0x3cec>
    4cdc:      	str	x2, [x0]
    4ce0:      	stur	x2, [x4, #-0x8]
    4ce4:      	ret
    4ce8:      	nop
    4cec:      	tbz	w1, #0x2, 0x4cfc <.text+0x3cfc>
    4cf0:      	str	w2, [x0]
    4cf4:      	stur	w2, [x4, #-0x4]
    4cf8:      	ret
    4cfc:      	cbz	x1, 0x4d0c <.text+0x3d0c>
    4d00:      	strb	w2, [x0]
    4d04:      	tbz	w1, #0x1, 0x4d0c <.text+0x3d0c>
    4d08:      	sturh	w2, [x4, #-0x2]
    4d0c:      	ret
    4d10:      	str	q0, [x0]
    4d14:      	tbnz	w1, #0x6, 0x4d30 <.text+0x3d30>
    4d18:      	stur	q0, [x4, #-0x10]
    4d1c:      	tbz	w1, #0x5, 0x4d28 <.text+0x3d28>
    4d20:      	str	q0, [x0, #0x10]
    4d24:      	stur	q0, [x4, #-0x20]
    4d28:      	ret
    4d2c:      	nop
    4d30:      	str	q0, [x0, #0x10]
    4d34:      	stp	q0, q0, [x0, #0x20]
    4d38:      	stp	q0, q0, [x4, #-0x20]
    4d3c:      	ret
    4d40:      	nop
    4d44:      	and	x3, x0, #0xfffffffffffffff0
    4d48:      	str	q0, [x0]
    4d4c:      	cmp	x1, #0x100
    4d50:      	ccmp	x2, #0x0, #0x0, hs
    4d54:      	b.eq	0x4d80 <.text+0x3d80>
    4d58:      	sub	x1, x4, x3
    4d5c:      	add	x3, x3, #0x10
    4d60:      	sub	x1, x1, #0x50
    4d64:      	stp	q0, q0, [x3], #0x40
    4d68:      	stp	q0, q0, [x3, #-0x20]
    4d6c:      	subs	x1, x1, #0x40
    4d70:      	b.hi	0x4d64 <.text+0x3d64>
    4d74:      	stp	q0, q0, [x4, #-0x40]
    4d78:      	stp	q0, q0, [x4, #-0x20]
    4d7c:      	ret
    4d80:      	mrs	x5, DCZID_EL0
    4d84:      	tbnz	w5, #0x4, 0x4d58 <.text+0x3d58>
    4d88:      	and	w5, w5, #0xf
    4d8c:      	cmp	w5, #0x4
    4d90:      	b.ne	0x4de0 <.text+0x3de0>
    4d94:      	str	q0, [x3, #0x10]
    4d98:      	stp	q0, q0, [x3, #0x20]
    4d9c:      	and	x3, x3, #0xffffffffffffffc0
    4da0:      	stp	q0, q0, [x3, #0x40]
    4da4:      	stp	q0, q0, [x3, #0x60]
    4da8:      	sub	x1, x4, x3
    4dac:      	sub	x1, x1, #0x100
    4db0:      	add	x3, x3, #0x80
    4db4:      	nop
    4db8:      	dc	zva, x3
    4dbc:      	add	x3, x3, #0x40
    4dc0:      	subs	x1, x1, #0x40
    4dc4:      	b.hi	0x4db8 <.text+0x3db8>
    4dc8:      	stp	q0, q0, [x3]
    4dcc:      	stp	q0, q0, [x3, #0x20]
    4dd0:      	stp	q0, q0, [x4, #-0x40]
    4dd4:      	stp	q0, q0, [x4, #-0x20]
    4dd8:      	ret
    4ddc:      	nop
    4de0:      	cmp	w5, #0x5
    4de4:      	b.ne	0x4e2c <.text+0x3e2c>
    4de8:      	str	q0, [x3, #0x10]
    4dec:      	stp	q0, q0, [x3, #0x20]
    4df0:      	stp	q0, q0, [x3, #0x40]
    4df4:      	stp	q0, q0, [x3, #0x60]
    4df8:      	and	x3, x3, #0xffffffffffffff80
    4dfc:      	sub	x1, x4, x3
    4e00:      	sub	x1, x1, #0x100
    4e04:      	add	x3, x3, #0x80
    4e08:      	dc	zva, x3
    4e0c:      	add	x3, x3, #0x80
    4e10:      	subs	x1, x1, #0x80
    4e14:      	b.hi	0x4e08 <.text+0x3e08>
    4e18:      	stp	q0, q0, [x4, #-0x80]
    4e1c:      	stp	q0, q0, [x4, #-0x60]
    4e20:      	stp	q0, q0, [x4, #-0x40]
    4e24:      	stp	q0, q0, [x4, #-0x20]
    4e28:      	ret
    4e2c:      	mov	w6, #0x4                // =4
    4e30:      	lsl	w7, w6, w5
    4e34:      	add	x5, x7, #0x40
    4e38:      	cmp	x1, x5
    4e3c:      	b.lo	0x4d58 <.text+0x3d58>
    4e40:      	sub	x6, x7, #0x1
    4e44:      	add	x5, x3, x7
    4e48:      	add	x3, x3, #0x10
    4e4c:      	subs	x1, x5, x3
    4e50:      	bic	x5, x5, x6
    4e54:      	b.eq	0x4e68 <.text+0x3e68>
    4e58:      	stp	q0, q0, [x3], #0x40
    4e5c:      	stp	q0, q0, [x3, #-0x20]
    4e60:      	subs	x1, x1, #0x40
    4e64:      	b.hi	0x4e58 <.text+0x3e58>
    4e68:      	mov	x3, x5
    4e6c:      	sub	x1, x4, x5
    4e70:      	subs	x1, x1, x7
    4e74:      	b.lo	0x4e88 <.text+0x3e88>
    4e78:      	dc	zva, x3
    4e7c:      	add	x3, x3, x7
    4e80:      	subs	x1, x1, x7
    4e84:      	b.hs	0x4e78 <.text+0x3e78>
    4e88:      	add	x1, x1, x7
    4e8c:      	b	0x4d6c <.text+0x3d6c>
    4e90:      	prfm	pldl1keep, [x1]
    4e94:      	add	x4, x1, x2
    4e98:      	add	x5, x0, x2
    4e9c:      	cmp	x2, #0x10
    4ea0:      	b.ls	0x4ee0 <.text+0x3ee0>
    4ea4:      	cmp	x2, #0x60
    4ea8:      	b.hi	0x4f70 <.text+0x3f70>
    4eac:      	sub	x9, x2, #0x1
    4eb0:      	ldp	x6, x7, [x1]
    4eb4:      	tbnz	w9, #0x6, 0x4f40 <.text+0x3f40>
    4eb8:      	ldp	x12, x13, [x4, #-0x10]
    4ebc:      	tbz	w9, #0x5, 0x4ed0 <.text+0x3ed0>
    4ec0:      	ldp	x8, x9, [x1, #0x10]
    4ec4:      	ldp	x10, x11, [x4, #-0x20]
    4ec8:      	stp	x8, x9, [x0, #0x10]
    4ecc:      	stp	x10, x11, [x5, #-0x20]
    4ed0:      	stp	x6, x7, [x0]
    4ed4:      	stp	x12, x13, [x5, #-0x10]
    4ed8:      	ret
    4edc:      	nop
    4ee0:      	cmp	x2, #0x8
    4ee4:      	b.lo	0x4f00 <.text+0x3f00>
    4ee8:      	ldr	x6, [x1]
    4eec:      	ldur	x7, [x4, #-0x8]
    4ef0:      	str	x6, [x0]
    4ef4:      	stur	x7, [x5, #-0x8]
    4ef8:      	ret
    4efc:      	nop
    4f00:      	tbz	w2, #0x2, 0x4f18 <.text+0x3f18>
    4f04:      	ldr	w6, [x1]
    4f08:      	ldur	w7, [x4, #-0x4]
    4f0c:      	str	w6, [x0]
    4f10:      	stur	w7, [x5, #-0x4]
    4f14:      	ret
    4f18:      	cbz	x2, 0x4f38 <.text+0x3f38>
    4f1c:      	lsr	x9, x2, #1
    4f20:      	ldrb	w6, [x1]
    4f24:      	ldurb	w7, [x4, #-0x1]
    4f28:      	ldrb	w8, [x1, x9]
    4f2c:      	strb	w6, [x0]
    4f30:      	strb	w8, [x0, x9]
    4f34:      	sturb	w7, [x5, #-0x1]
    4f38:      	ret
    4f3c:      	nop
    4f40:      	ldp	x8, x9, [x1, #0x10]
    4f44:      	ldp	x10, x11, [x1, #0x20]
    4f48:      	ldp	x12, x13, [x1, #0x30]
    4f4c:      	ldp	x14, x15, [x4, #-0x20]
    4f50:      	ldp	x4, x3, [x4, #-0x10]
    4f54:      	stp	x6, x7, [x0]
    4f58:      	stp	x8, x9, [x0, #0x10]
    4f5c:      	stp	x10, x11, [x0, #0x20]
    4f60:      	stp	x12, x13, [x0, #0x30]
    4f64:      	stp	x14, x15, [x5, #-0x20]
    4f68:      	stp	x4, x3, [x5, #-0x10]
    4f6c:      	ret
    4f70:      	and	x9, x0, #0xf
    4f74:      	and	x3, x0, #0xfffffffffffffff0
    4f78:      	ldp	x12, x13, [x1]
    4f7c:      	sub	x1, x1, x9
    4f80:      	add	x2, x2, x9
    4f84:      	ldp	x6, x7, [x1, #0x10]
    4f88:      	stp	x12, x13, [x0]
    4f8c:      	ldp	x8, x9, [x1, #0x20]
    4f90:      	ldp	x10, x11, [x1, #0x30]
    4f94:      	ldp	x12, x13, [x1, #0x40]!
    4f98:      	subs	x2, x2, #0x90
    4f9c:      	b.ls	0x4fc8 <.text+0x3fc8>
    4fa0:      	stp	x6, x7, [x3, #0x10]
    4fa4:      	ldp	x6, x7, [x1, #0x10]
    4fa8:      	stp	x8, x9, [x3, #0x20]
    4fac:      	ldp	x8, x9, [x1, #0x20]
    4fb0:      	stp	x10, x11, [x3, #0x30]
    4fb4:      	ldp	x10, x11, [x1, #0x30]
    4fb8:      	stp	x12, x13, [x3, #0x40]!
    4fbc:      	ldp	x12, x13, [x1, #0x40]!
    4fc0:      	subs	x2, x2, #0x40
    4fc4:      	b.hi	0x4fa0 <.text+0x3fa0>
    4fc8:      	ldp	x14, x15, [x4, #-0x40]
    4fcc:      	stp	x6, x7, [x3, #0x10]
    4fd0:      	ldp	x6, x7, [x4, #-0x30]
    4fd4:      	stp	x8, x9, [x3, #0x20]
    4fd8:      	ldp	x8, x9, [x4, #-0x20]
    4fdc:      	stp	x10, x11, [x3, #0x30]
    4fe0:      	ldp	x10, x11, [x4, #-0x10]
    4fe4:      	stp	x12, x13, [x3, #0x40]
    4fe8:      	stp	x14, x15, [x5, #-0x40]
    4fec:      	stp	x6, x7, [x5, #-0x30]
    4ff0:      	stp	x8, x9, [x5, #-0x20]
    4ff4:      	stp	x10, x11, [x5, #-0x10]
    4ff8:      	ret
    4ffc:      	sub	x3, x0, x1
    5000:      	cmp	x2, #0x60
    5004:      	ccmp	x3, x2, #0x2, hi
    5008:      	b.hs	0x4e90 <.text+0x3e90>
    500c:      	cbz	x3, 0x50a4 <.text+0x40a4>
    5010:      	add	x5, x0, x2
    5014:      	add	x4, x1, x2
    5018:      	and	x3, x5, #0xf
    501c:      	ldp	x12, x13, [x4, #-0x10]
    5020:      	sub	x4, x4, x3
    5024:      	sub	x2, x2, x3
    5028:      	ldp	x6, x7, [x4, #-0x10]
    502c:      	stp	x12, x13, [x5, #-0x10]
    5030:      	ldp	x8, x9, [x4, #-0x20]
    5034:      	ldp	x10, x11, [x4, #-0x30]
    5038:      	ldp	x12, x13, [x4, #-0x40]!
    503c:      	sub	x5, x5, x3
    5040:      	subs	x2, x2, #0x80
    5044:      	b.ls	0x5074 <.text+0x4074>
    5048:      	nop
    504c:      	stp	x6, x7, [x5, #-0x10]
    5050:      	ldp	x6, x7, [x4, #-0x10]
    5054:      	stp	x8, x9, [x5, #-0x20]
    5058:      	ldp	x8, x9, [x4, #-0x20]
    505c:      	stp	x10, x11, [x5, #-0x30]
    5060:      	ldp	x10, x11, [x4, #-0x30]
    5064:      	stp	x12, x13, [x5, #-0x40]!
    5068:      	ldp	x12, x13, [x4, #-0x40]!
    506c:      	subs	x2, x2, #0x40
    5070:      	b.hi	0x504c <.text+0x404c>
    5074:      	ldp	x14, x15, [x1, #0x30]
    5078:      	stp	x6, x7, [x5, #-0x10]
    507c:      	ldp	x6, x7, [x1, #0x20]
    5080:      	stp	x8, x9, [x5, #-0x20]
    5084:      	ldp	x8, x9, [x1, #0x10]
    5088:      	stp	x10, x11, [x5, #-0x30]
    508c:      	ldp	x10, x11, [x1]
    5090:      	stp	x12, x13, [x5, #-0x40]
    5094:      	stp	x14, x15, [x0, #0x30]
    5098:      	stp	x6, x7, [x0, #0x20]
    509c:      	stp	x8, x9, [x0, #0x10]
    50a0:      	stp	x10, x11, [x0]
    50a4:      	ret
    50a8:      	sub	sp, sp, #0x10
    50ac:      	str	xzr, [sp, #0x8]
    50b0:      	ldr	x8, [sp, #0x8]
    50b4:      	cbz	x8, 0x50b0 <.text+0x40b0>
    50b8:      	add	sp, sp, #0x10
    50bc:      	ret
    50c0:      	stp	x29, x30, [sp, #-0x10]!
    50c4:      	mov	x29, sp
    50c8:      	cbz	x0, 0x510c <.text+0x410c>
    50cc:      	ldr	x9, [x0]
    50d0:      	cbz	x9, 0x5128 <.text+0x4128>
    50d4:      	ldr	x10, [x0, #0x8]
    50d8:      	cbz	x10, 0x5144 <.text+0x4144>
    50dc:      	cbz	x1, 0x5160 <.text+0x4160>
    50e0:      	adrp	x8, 0x6000 <.text+0x5000>
    50e4:      	mov	x10, xzr
    50e8:      	and	w11, w2, #0xff
    50ec:      	ldr	w8, [x8, #0x4b8]
    50f0:      	cbz	w11, 0x51b4 <.text+0x41b4>
    50f4:      	adrp	x14, 0x6000 <.text+0x5000>
    50f8:      	mov	x11, x0
    50fc:      	ldrb	w12, [x14, #0x4b5]
    5100:      	cbz	w12, 0x51b8 <.text+0x41b8>
    5104:      	mov	x10, xzr
    5108:      	b	0x5180 <.text+0x4180>
    510c:      	adrp	x0, 0x7000 <.text+0x6000>
    5110:      	adrp	x2, 0x8000 <.text+0x7000>
    5114:      	add	x0, x0, #0xdd8
    5118:      	add	x2, x2, #0xad4
    511c:      	orr	w1, wzr, #0x3c
    5120:      	bl	0x4a00 <.text+0x3a00>
    5124:      	b	0x5124 <.text+0x4124>
    5128:      	adrp	x0, 0x7000 <.text+0x6000>
    512c:      	adrp	x2, 0x7000 <.text+0x6000>
    5130:      	add	x0, x0, #0xdd8
    5134:      	mov	w1, #0x3d               // =61
    5138:      	add	x2, x2, #0xde5
    513c:      	bl	0x4a00 <.text+0x3a00>
    5140:      	b	0x5140 <.text+0x4140>
    5144:      	adrp	x0, 0x7000 <.text+0x6000>
    5148:      	adrp	x2, 0x7000 <.text+0x6000>
    514c:      	add	x0, x0, #0xdd8
    5150:      	add	x2, x2, #0xe07
    5154:      	orr	w1, wzr, #0x3e
    5158:      	bl	0x4a00 <.text+0x3a00>
    515c:      	b	0x515c <.text+0x415c>
    5160:      	adrp	x0, 0x7000 <.text+0x6000>
    5164:      	adrp	x2, 0x7000 <.text+0x6000>
    5168:      	add	x0, x0, #0xdd8
    516c:      	add	x2, x2, #0xe26
    5170:      	orr	w1, wzr, #0x3f
    5174:      	bl	0x4a00 <.text+0x3a00>
    5178:      	b	0x5178 <.text+0x4178>
    517c:      	ldr	x9, [x9]
    5180:      	mov	w11, w8
    5184:      	cbz	w11, 0x5194 <.text+0x4194>
    5188:      	add	x10, x10, #0x1
    518c:      	cmp	x10, x8
    5190:      	b.hs	0x5208 <.text+0x4208>
    5194:      	cmp	x9, x0
    5198:      	ccmp	x9, x1, #0x4, ne
    519c:      	b.ne	0x517c <.text+0x417c>
    51a0:      	cmp	x9, x1
    51a4:      	mov	x11, x1
    51a8:      	b.eq	0x51b8 <.text+0x41b8>
    51ac:      	mov	w0, wzr
    51b0:      	b	0x51e4 <.text+0x41e4>
    51b4:      	mov	x11, x0
    51b8:      	cbz	w8, 0x51e0 <.text+0x41e0>
    51bc:      	add	x12, x10, #0x1
    51c0:      	ldr	x11, [x11]
    51c4:      	mov	x13, x12
    51c8:      	add	x12, x13, #0x1
    51cc:      	cmp	x11, x0
    51d0:      	ccmp	x13, x8, #0x2, ne
    51d4:      	b.lo	0x51c0 <.text+0x41c0>
    51d8:      	cmp	x13, x8
    51dc:      	b.hs	0x51ec <.text+0x41ec>
    51e0:      	orr	w0, wzr, #0x1
    51e4:      	ldp	x29, x30, [sp], #0x10
    51e8:      	ret
    51ec:      	adrp	x0, 0x7000 <.text+0x6000>
    51f0:      	adrp	x2, 0x7000 <.text+0x6000>
    51f4:      	add	x0, x0, #0xdd8
    51f8:      	mov	w1, #0x6d               // =109
    51fc:      	add	x2, x2, #0xe3b
    5200:      	bl	0x4a00 <.text+0x3a00>
    5204:      	b	0x5204 <.text+0x4204>
    5208:      	adrp	x0, 0x7000 <.text+0x6000>
    520c:      	adrp	x2, 0x7000 <.text+0x6000>
    5210:      	add	x0, x0, #0xdd8
    5214:      	mov	w1, #0x50               // =80
    5218:      	add	x2, x2, #0xe3b
    521c:      	bl	0x4a00 <.text+0x3a00>
    5220:      	b	0x5220 <.text+0x4220>
    5224:      	stp	x20, x19, [sp, #-0x20]!
    5228:      	stp	x29, x30, [sp, #0x10]
    522c:      	add	x29, sp, #0x10
    5230:      	mov	x19, x0
    5234:      	mov	w2, wzr
    5238:      	mov	x1, x19
    523c:      	bl	0x50c0 <.text+0x40c0>
    5240:      	and	w8, w0, #0xff
    5244:      	cbz	w8, 0x5260 <.text+0x4260>
    5248:      	ldr	x8, [x19]
    524c:      	ldp	x29, x30, [sp, #0x10]
    5250:      	cmp	x8, x19
    5254:      	cset	w0, eq
    5258:      	ldp	x20, x19, [sp], #0x20
    525c:      	ret
    5260:      	adrp	x0, 0x7000 <.text+0x6000>
    5264:      	adrp	x2, 0x7000 <.text+0x6000>
    5268:      	add	x0, x0, #0xdd8
    526c:      	mov	w1, #0x169              // =361
    5270:      	add	x2, x2, #0xf43
    5274:      	bl	0x4a00 <.text+0x3a00>
    5278:      	b	0x5278 <.text+0x4278>
    527c:      	stp	x20, x19, [sp, #-0x20]!
    5280:      	stp	x29, x30, [sp, #0x10]
    5284:      	add	x29, sp, #0x10
    5288:      	mov	x19, x0
    528c:      	bl	0x5224 <.text+0x4224>
    5290:      	and	w8, w0, #0xff
    5294:      	cbz	w8, 0x52b4 <.text+0x42b4>
    5298:      	adrp	x0, 0x7000 <.text+0x6000>
    529c:      	adrp	x2, 0x7000 <.text+0x6000>
    52a0:      	add	x0, x0, #0xdd8
    52a4:      	mov	w1, #0x221              // =545
    52a8:      	add	x2, x2, #0xfd0
    52ac:      	bl	0x4a00 <.text+0x3a00>
    52b0:      	b	0x52b0 <.text+0x42b0>
    52b4:      	ldp	x8, x9, [x19]
    52b8:      	str	x9, [x8, #0x8]
    52bc:      	ldp	x8, x9, [x19]
    52c0:      	str	x8, [x9]
    52c4:      	ldr	x0, [x19]
    52c8:      	ldp	x29, x30, [sp, #0x10]
    52cc:      	ldp	x20, x19, [sp], #0x20
    52d0:      	ret
    52d4:      	add	x8, x2, x3
    52d8:      	cmp	x0, x2
    52dc:      	ccmp	x0, x8, #0x2, hs
    52e0:      	b.lo	0x52fc <.text+0x42fc>
    52e4:      	add	x10, x0, x1
    52e8:      	cmp	x2, x0
    52ec:      	ccmp	x2, x10, #0x2, hs
    52f0:      	b.lo	0x52fc <.text+0x42fc>
    52f4:      	mov	w0, wzr
    52f8:      	ret
    52fc:      	orr	w0, wzr, #0x1
    5300:      	ret
    5304:      	stp	x22, x21, [sp, #-0x30]!
    5308:      	stp	x20, x19, [sp, #0x10]
    530c:      	stp	x29, x30, [sp, #0x20]
    5310:      	add	x29, sp, #0x20
    5314:      	mov	x20, x2
    5318:      	mov	x19, x0
    531c:      	cbz	x19, 0x5354 <.text+0x4354>
    5320:      	cbz	x20, 0x5370 <.text+0x4370>
    5324:      	adrp	x9, 0x6000 <.text+0x5000>
    5328:      	ldr	w8, [x9, #0x4bc]
    532c:      	cbz	w8, 0x53b0 <.text+0x43b0>
    5330:      	cmp	x8, x1
    5334:      	b.hs	0x538c <.text+0x438c>
    5338:      	adrp	x0, 0x7000 <.text+0x6000>
    533c:      	adrp	x2, 0x8000 <.text+0x7000>
    5340:      	add	x0, x0, #0xfe5
    5344:      	mov	w1, #0x2a5              // =677
    5348:      	add	x2, x2, #0x1b7
    534c:      	bl	0x4a00 <.text+0x3a00>
    5350:      	b	0x5350 <.text+0x4350>
    5354:      	adrp	x0, 0x7000 <.text+0x6000>
    5358:      	adrp	x2, 0x8000 <.text+0x7000>
    535c:      	add	x0, x0, #0xfe5
    5360:      	mov	w1, #0x29e              // =670
    5364:      	add	x2, x2, #0x60
    5368:      	bl	0x4a00 <.text+0x3a00>
    536c:      	b	0x536c <.text+0x436c>
    5370:      	adrp	x0, 0x7000 <.text+0x6000>
    5374:      	adrp	x2, 0x8000 <.text+0x7000>
    5378:      	add	x0, x0, #0xfe5
    537c:      	mov	w1, #0x29f              // =671
    5380:      	add	x2, x2, #0x7e
    5384:      	bl	0x4a00 <.text+0x3a00>
    5388:      	b	0x5388 <.text+0x4388>
    538c:      	cmp	x8, x3
    5390:      	b.hs	0x53b0 <.text+0x43b0>
    5394:      	adrp	x0, 0x7000 <.text+0x6000>
    5398:      	adrp	x2, 0x8000 <.text+0x7000>
    539c:      	add	x0, x0, #0xfe5
    53a0:      	mov	w1, #0x2a6              // =678
    53a4:      	add	x2, x2, #0x250
    53a8:      	bl	0x4a00 <.text+0x3a00>
    53ac:      	b	0x53ac <.text+0x43ac>
    53b0:      	cbz	x1, 0x53d4 <.text+0x43d4>
    53b4:      	mov	x8, xzr
    53b8:      	b	0x53c0 <.text+0x43c0>
    53bc:      	add	x8, x8, #0x1
    53c0:      	cmp	x8, x1
    53c4:      	b.hs	0x53f0 <.text+0x43f0>
    53c8:      	ldrb	w9, [x20, x8]
    53cc:      	cbnz	w9, 0x53bc <.text+0x43bc>
    53d0:      	b	0x53f8 <.text+0x43f8>
    53d4:      	adrp	x0, 0x7000 <.text+0x6000>
    53d8:      	adrp	x2, 0x8000 <.text+0x7000>
    53dc:      	add	x0, x0, #0xfe5
    53e0:      	mov	w1, #0x2ac              // =684
    53e4:      	add	x2, x2, #0xd7
    53e8:      	bl	0x4a00 <.text+0x3a00>
    53ec:      	b	0x53ec <.text+0x43ec>
    53f0:      	cmp	x3, x1
    53f4:      	b.hs	0x5464 <.text+0x4464>
    53f8:      	cmp	x8, x3
    53fc:      	csel	x21, x3, x8, hi
    5400:      	add	x3, x21, #0x1
    5404:      	mov	x0, x19
    5408:      	mov	x2, x20
    540c:      	bl	0x52d4 <.text+0x42d4>
    5410:      	and	w8, w0, #0xff
    5414:      	cbz	w8, 0x5440 <.text+0x4440>
    5418:      	adrp	x0, 0x7000 <.text+0x6000>
    541c:      	adrp	x2, 0x8000 <.text+0x7000>
    5420:      	add	x0, x0, #0xfe5
    5424:      	mov	w1, #0x2bc              // =700
    5428:      	add	x2, x2, #0x1f5
    542c:      	bl	0x4a00 <.text+0x3a00>
    5430:      	b	0x5430 <.text+0x4430>
    5434:      	add	x20, x20, #0x1
    5438:      	strb	w8, [x19], #0x1
    543c:      	sub	x21, x21, #0x1
    5440:      	cbz	x21, 0x544c <.text+0x444c>
    5444:      	ldrb	w8, [x20]
    5448:      	cbnz	w8, 0x5434 <.text+0x4434>
    544c:      	strb	wzr, [x19]
    5450:      	mov	x0, xzr
    5454:      	ldp	x29, x30, [sp, #0x20]
    5458:      	ldp	x20, x19, [sp, #0x10]
    545c:      	ldp	x22, x21, [sp], #0x30
    5460:      	ret
    5464:      	adrp	x0, 0x7000 <.text+0x6000>
    5468:      	adrp	x2, 0x8000 <.text+0x7000>
    546c:      	add	x0, x0, #0xfe5
    5470:      	mov	w1, #0x2b3              // =691
    5474:      	add	x2, x2, #0xe6
    5478:      	bl	0x4a00 <.text+0x3a00>
    547c:      	b	0x547c <.text+0x447c>
    5480:      	stp	x29, x30, [sp, #-0x10]!
    5484:      	mov	x29, sp
    5488:      	bl	0x5498 <.text+0x4498>
    548c:      	add	x0, x0, #0x1
    5490:      	ldp	x29, x30, [sp], #0x10
    5494:      	ret
    5498:      	stp	x29, x30, [sp, #-0x10]!
    549c:      	mov	x29, sp
    54a0:      	cbz	x0, 0x54ec <.text+0x44ec>
    54a4:      	adrp	x9, 0x6000 <.text+0x5000>
    54a8:      	mov	x8, xzr
    54ac:      	ldr	w9, [x9, #0x4bc]
    54b0:      	b	0x54bc <.text+0x44bc>
    54b4:      	add	x0, x0, #0x1
    54b8:      	add	x8, x8, #0x1
    54bc:      	ldrb	w10, [x0]
    54c0:      	cbz	w10, 0x5508 <.text+0x4508>
    54c4:      	cbz	w9, 0x54b4 <.text+0x44b4>
    54c8:      	cmp	x8, x9
    54cc:      	b.lo	0x54b4 <.text+0x44b4>
    54d0:      	adrp	x0, 0x7000 <.text+0x6000>
    54d4:      	adrp	x2, 0x8000 <.text+0x7000>
    54d8:      	add	x0, x0, #0xfe9
    54dc:      	mov	w1, #0x516              // =1302
    54e0:      	add	x2, x2, #0x6bc
    54e4:      	bl	0x4a00 <.text+0x3a00>
    54e8:      	b	0x54e8 <.text+0x44e8>
    54ec:      	adrp	x0, 0x7000 <.text+0x6000>
    54f0:      	adrp	x2, 0x8000 <.text+0x7000>
    54f4:      	add	x0, x0, #0xfe9
    54f8:      	mov	w1, #0x50e              // =1294
    54fc:      	add	x2, x2, #0x3b9
    5500:      	bl	0x4a00 <.text+0x3a00>
    5504:      	b	0x5504 <.text+0x4504>
    5508:      	mov	x0, x8
    550c:      	ldp	x29, x30, [sp], #0x10
    5510:      	ret
    5514:      	svc	#0xdbdb
    5518:      	ret
    551c:      	stp	x29, x30, [sp, #-0x10]!
    5520:      	mov	x29, sp
    5524:      	adrp	x8, 0xa000
    5528:      	str	x0, [x8, #0x448]
    552c:      	cbz	x0, 0x5558 <.text+0x4558>
    5530:      	adrp	x9, 0xa000
    5534:      	str	x1, [x9, #0x450]
    5538:      	cbz	x1, 0x5574 <.text+0x4574>
    553c:      	ldr	x8, [x1, #0x60]
    5540:      	adrp	x10, 0xa000
    5544:      	str	x8, [x10, #0x458]
    5548:      	cbz	x8, 0x5590 <.text+0x4590>
    554c:      	mov	x0, xzr
    5550:      	ldp	x29, x30, [sp], #0x10
    5554:      	ret
    5558:      	adrp	x0, 0x8000 <.text+0x7000>
    555c:      	adrp	x2, 0x8000 <.text+0x7000>
    5560:      	add	x0, x0, #0x87a
    5564:      	mov	w1, #0x33               // =51
    5568:      	add	x2, x2, #0x895
    556c:      	bl	0x4a00 <.text+0x3a00>
    5570:      	b	0x5570 <.text+0x4570>
    5574:      	adrp	x0, 0x8000 <.text+0x7000>
    5578:      	adrp	x2, 0x8000 <.text+0x7000>
    557c:      	add	x0, x0, #0x87a
    5580:      	mov	w1, #0x39               // =57
    5584:      	add	x2, x2, #0x8b2
    5588:      	bl	0x4a00 <.text+0x3a00>
    558c:      	b	0x558c <.text+0x458c>
    5590:      	adrp	x0, 0x8000 <.text+0x7000>
    5594:      	adrp	x2, 0x8000 <.text+0x7000>
    5598:      	add	x0, x0, #0x87a
    559c:      	add	x2, x2, #0x8c6
    55a0:      	orr	w1, wzr, #0x3f
    55a4:      	bl	0x4a00 <.text+0x3a00>
    55a8:      	b	0x55a8 <.text+0x45a8>
    55ac:      	stp	x22, x21, [sp, #-0x30]!
    55b0:      	stp	x20, x19, [sp, #0x10]
    55b4:      	stp	x29, x30, [sp, #0x20]
    55b8:      	add	x29, sp, #0x20
    55bc:      	adrp	x20, 0xa000
    55c0:      	adrp	x19, 0xa000
    55c4:      	ldr	w8, [x20, #0x460]
    55c8:      	ldr	x2, [x19, #0x468]
    55cc:      	add	w9, w8, #0x10
    55d0:      	lsl	x0, x8, #4
    55d4:      	lsl	x1, x9, #4
    55d8:      	bl	0x4654 <.text+0x3654>
    55dc:      	str	x0, [x19, #0x468]
    55e0:      	cbz	x0, 0x564c <.text+0x464c>
    55e4:      	ldr	w10, [x20, #0x460]
    55e8:      	adrp	x21, 0xa000
    55ec:      	ldr	x2, [x21, #0x470]
    55f0:      	add	w11, w10, #0x10
    55f4:      	lsl	x0, x10, #3
    55f8:      	lsl	x1, x11, #3
    55fc:      	bl	0x4654 <.text+0x3654>
    5600:      	str	x0, [x21, #0x470]
    5604:      	cbz	x0, 0x5640 <.text+0x4640>
    5608:      	ldr	w12, [x20, #0x460]
    560c:      	adrp	x21, 0xa000
    5610:      	ldr	x2, [x21, #0x478]
    5614:      	add	w13, w12, #0x10
    5618:      	lsl	x0, x12, #3
    561c:      	lsl	x1, x13, #3
    5620:      	bl	0x4654 <.text+0x3654>
    5624:      	str	x0, [x21, #0x478]
    5628:      	cbz	x0, 0x5640 <.text+0x4640>
    562c:      	ldr	w8, [x20, #0x460]
    5630:      	mov	x19, xzr
    5634:      	add	w9, w8, #0x10
    5638:      	str	w9, [x20, #0x460]
    563c:      	b	0x5674 <.text+0x4674>
    5640:      	ldr	x0, [x19, #0x468]
    5644:      	cbz	x0, 0x564c <.text+0x464c>
    5648:      	bl	0x45fc <.text+0x35fc>
    564c:      	adrp	x14, 0xa000
    5650:      	ldr	x0, [x14, #0x470]
    5654:      	cbz	x0, 0x565c <.text+0x465c>
    5658:      	bl	0x45fc <.text+0x35fc>
    565c:      	adrp	x15, 0xa000
    5660:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    5664:      	movk	x19, #0x9
    5668:      	ldr	x0, [x15, #0x478]
    566c:      	cbz	x0, 0x5674 <.text+0x4674>
    5670:      	bl	0x45fc <.text+0x35fc>
    5674:      	mov	x0, x19
    5678:      	ldp	x29, x30, [sp, #0x20]
    567c:      	ldp	x20, x19, [sp, #0x10]
    5680:      	ldp	x22, x21, [sp], #0x30
    5684:      	ret
    5688:      	b	0x55ac <.text+0x45ac>
    568c:      	ldr	x8, [x1, #0x58]
    5690:      	adrp	x9, 0xa000
    5694:      	str	x8, [x9, #0x480]
    5698:      	cbz	x8, 0x56a4 <.text+0x46a4>
    569c:      	mov	x0, xzr
    56a0:      	ret
    56a4:      	stp	x29, x30, [sp, #-0x10]!
    56a8:      	mov	x29, sp
    56ac:      	adrp	x0, 0x8000 <.text+0x7000>
    56b0:      	adrp	x2, 0x8000 <.text+0x7000>
    56b4:      	add	x0, x0, #0x8da
    56b8:      	mov	w1, #0x2f               // =47
    56bc:      	add	x2, x2, #0x8f8
    56c0:      	bl	0x4a00 <.text+0x3a00>
    56c4:      	ldp	x29, x30, [sp], #0x10
    56c8:      	b	0x56c8 <.text+0x46c8>
    56cc:      	mov	x0, xzr
    56d0:      	ret
    56d4:      	stp	x26, x25, [sp, #-0x50]!
    56d8:      	stp	x24, x23, [sp, #0x10]
    56dc:      	stp	x22, x21, [sp, #0x20]
    56e0:      	stp	x20, x19, [sp, #0x30]
    56e4:      	stp	x29, x30, [sp, #0x40]
    56e8:      	add	x29, sp, #0x40
    56ec:      	mov	x19, x1
    56f0:      	mov	x20, x0
    56f4:      	cbz	x20, 0x5778 <.text+0x4778>
    56f8:      	cbz	x19, 0x5794 <.text+0x4794>
    56fc:      	adrp	x8, 0xa000
    5700:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    5704:      	mov	x25, xzr
    5708:      	ldr	x21, [x8, #0x450]
    570c:      	mov	x22, #-0x1              // =-1
    5710:      	movk	x23, #0xe
    5714:      	str	xzr, [x19]
    5718:      	ldr	x8, [x21, #0x68]
    571c:      	mov	x24, x25
    5720:      	add	x22, x22, #0x1
    5724:      	mov	x0, x23
    5728:      	cmp	x22, x8
    572c:      	b.hs	0x5760 <.text+0x4760>
    5730:      	ldr	x10, [x21, #0x70]
    5734:      	mov	x0, x20
    5738:      	add	x25, x24, #0x18
    573c:      	add	x1, x10, x24
    5740:      	bl	0x60c0 <.text+0x50c0>
    5744:      	and	w8, w0, #0xff
    5748:      	cbz	w8, 0x5718 <.text+0x4718>
    574c:      	ldr	x11, [x21, #0x70]
    5750:      	mov	x0, xzr
    5754:      	add	x9, x11, x24
    5758:      	ldr	x12, [x9, #0x10]
    575c:      	str	x12, [x19]
    5760:      	ldp	x29, x30, [sp, #0x40]
    5764:      	ldp	x20, x19, [sp, #0x30]
    5768:      	ldp	x22, x21, [sp, #0x20]
    576c:      	ldp	x24, x23, [sp, #0x10]
    5770:      	ldp	x26, x25, [sp], #0x50
    5774:      	ret
    5778:      	adrp	x0, 0x8000 <.text+0x7000>
    577c:      	adrp	x2, 0x8000 <.text+0x7000>
    5780:      	add	x0, x0, #0x90c
    5784:      	mov	w1, #0x61               // =97
    5788:      	add	x2, x2, #0x916
    578c:      	bl	0x4a00 <.text+0x3a00>
    5790:      	b	0x5790 <.text+0x4790>
    5794:      	adrp	x0, 0x8000 <.text+0x7000>
    5798:      	adrp	x2, 0x8000 <.text+0x7000>
    579c:      	add	x0, x0, #0x90c
    57a0:      	mov	w1, #0x62               // =98
    57a4:      	add	x2, x2, #0x930
    57a8:      	bl	0x4a00 <.text+0x3a00>
    57ac:      	b	0x57ac <.text+0x47ac>
    57b0:      	stp	x20, x19, [sp, #-0x20]!
    57b4:      	stp	x29, x30, [sp, #0x10]
    57b8:      	add	x29, sp, #0x10
    57bc:      	adrp	x0, 0xa000
    57c0:      	adrp	x1, 0xa000
    57c4:      	add	x0, x0, #0x70
    57c8:      	add	x1, x1, #0x488
    57cc:      	bl	0x56d4 <.text+0x46d4>
    57d0:      	mov	x19, x0
    57d4:      	tbz	x19, #0x3f, 0x5804 <.text+0x4804>
    57d8:      	adrp	x1, 0x6000 <.text+0x5000>
    57dc:      	add	x1, x1, #0x454
    57e0:      	orr	w0, wzr, #0x80000000
    57e4:      	mov	x2, x19
    57e8:      	bl	0x4674 <.text+0x3674>
    57ec:      	adrp	x0, 0x8000 <.text+0x7000>
    57f0:      	adrp	x2, 0x6000 <.text+0x5000>
    57f4:      	add	x0, x0, #0xac7
    57f8:      	mov	w1, #0x31               // =49
    57fc:      	add	x2, x2, #0x488
    5800:      	bl	0x4a00 <.text+0x3a00>
    5804:      	adrp	x8, 0xa000
    5808:      	ldr	x8, [x8, #0x488]
    580c:      	cbz	x8, 0x5820 <.text+0x4820>
    5810:      	ldp	x29, x30, [sp, #0x10]
    5814:      	mov	x0, x19
    5818:      	ldp	x20, x19, [sp], #0x20
    581c:      	ret
    5820:      	adrp	x0, 0x8000 <.text+0x7000>
    5824:      	adrp	x2, 0x8000 <.text+0x7000>
    5828:      	add	x0, x0, #0xac7
    582c:      	mov	w1, #0x32               // =50
    5830:      	add	x2, x2, #0xad0
    5834:      	bl	0x4a00 <.text+0x3a00>
    5838:      	b	0x5838 <.text+0x4838>
    583c:      	adrp	x8, 0xa000
    5840:      	ldr	x0, [x8, #0x488]
    5844:      	cbz	x0, 0x584c <.text+0x484c>
    5848:      	ret
    584c:      	stp	x29, x30, [sp, #-0x10]!
    5850:      	mov	x29, sp
    5854:      	adrp	x0, 0x8000 <.text+0x7000>
    5858:      	adrp	x2, 0x8000 <.text+0x7000>
    585c:      	add	x0, x0, #0xac7
    5860:      	mov	w1, #0x4d               // =77
    5864:      	add	x2, x2, #0xad0
    5868:      	bl	0x4a00 <.text+0x3a00>
    586c:      	ldp	x29, x30, [sp], #0x10
    5870:      	b	0x5870 <.text+0x4870>
    5874:      	cbz	x1, 0x58a4 <.text+0x48a4>
    5878:      	orr	w8, wzr, #0xffff
    587c:      	b	0x5884 <.text+0x4884>
    5880:      	add	x1, x1, x10
    5884:      	ldr	w10, [x1]
    5888:      	and	w9, w10, #0xffff
    588c:      	lsr	w10, w10, #16
    5890:      	cmp	w9, w8
    5894:      	b.eq	0x58cc <.text+0x48cc>
    5898:      	cmp	w9, w0, uxth
    589c:      	b.ne	0x5880 <.text+0x4880>
    58a0:      	b	0x58d0 <.text+0x48d0>
    58a4:      	stp	x29, x30, [sp, #-0x10]!
    58a8:      	mov	x29, sp
    58ac:      	adrp	x0, 0x8000 <.text+0x7000>
    58b0:      	adrp	x2, 0x8000 <.text+0x7000>
    58b4:      	add	x0, x0, #0xac7
    58b8:      	mov	w1, #0x6b               // =107
    58bc:      	add	x2, x2, #0xae9
    58c0:      	bl	0x4a00 <.text+0x3a00>
    58c4:      	ldp	x29, x30, [sp], #0x10
    58c8:      	b	0x58c8 <.text+0x48c8>
    58cc:      	mov	x1, xzr
    58d0:      	mov	x0, x1
    58d4:      	ret
    58d8:      	stp	x20, x19, [sp, #-0x20]!
    58dc:      	stp	x29, x30, [sp, #0x10]
    58e0:      	add	x29, sp, #0x10
    58e4:      	mov	x19, x0
    58e8:      	b	0x58f4 <.text+0x48f4>
    58ec:      	ldrh	w8, [x20, #0x2]
    58f0:      	add	x1, x20, x8
    58f4:      	orr	w0, wzr, #0x4
    58f8:      	bl	0x5874 <.text+0x4874>
    58fc:      	mov	x20, x0
    5900:      	cbz	x20, 0x591c <.text+0x491c>
    5904:      	add	x1, x20, #0x8
    5908:      	mov	x0, x19
    590c:      	bl	0x60c0 <.text+0x50c0>
    5910:      	and	w8, w0, #0xff
    5914:      	cbz	w8, 0x58ec <.text+0x48ec>
    5918:      	b	0x5920 <.text+0x4920>
    591c:      	mov	x20, xzr
    5920:      	ldp	x29, x30, [sp, #0x10]
    5924:      	mov	x0, x20
    5928:      	ldp	x20, x19, [sp], #0x20
    592c:      	ret
    5930:      	stp	x20, x19, [sp, #-0x20]!
    5934:      	stp	x29, x30, [sp, #0x10]
    5938:      	add	x29, sp, #0x10
    593c:      	mov	x19, x0
    5940:      	bl	0x583c <.text+0x483c>
    5944:      	ldp	x29, x30, [sp, #0x10]
    5948:      	mov	x1, x0
    594c:      	mov	x0, x19
    5950:      	ldp	x20, x19, [sp], #0x20
    5954:      	b	0x58d8 <.text+0x48d8>
    5958:      	cbz	x1, 0x5970 <.text+0x4970>
    595c:      	adrp	x8, 0xa000
    5960:      	mov	x0, xzr
    5964:      	ldr	w8, [x8, #0x494]
    5968:      	str	x8, [x1]
    596c:      	ret
    5970:      	mov	x0, #-0x8000000000000000 // =-9223372036854775808
    5974:      	movk	x0, #0x2
    5978:      	ret
    597c:      	adrp	x8, 0xa000
    5980:      	mov	x0, xzr
    5984:      	str	w1, [x8, #0x494]
    5988:      	ret
    598c:      	stp	x20, x19, [sp, #-0x20]!
    5990:      	stp	x29, x30, [sp, #0x10]
    5994:      	add	x29, sp, #0x10
    5998:      	sub	sp, sp, #0x10
    599c:      	adrp	x8, 0xa000
    59a0:      	str	x0, [sp, #0x8]
    59a4:      	adrp	x9, 0x6000 <.text+0x5000>
    59a8:      	adrp	x2, 0xa000
    59ac:      	str	x1, [x8, #0x498]
    59b0:      	adrp	x10, 0xa000
    59b4:      	ldr	x11, [x1, #0x60]
    59b8:      	adrp	x1, 0xa000
    59bc:      	ldr	w8, [x9, #0x4c0]
    59c0:      	add	x1, x1, #0xe0
    59c4:      	add	x2, x2, #0x3e8
    59c8:      	add	x0, sp, #0x8
    59cc:      	ldr	x9, [x11, #0x148]
    59d0:      	mov	x3, xzr
    59d4:      	str	w8, [x10, #0x494]
    59d8:      	blr	x9
    59dc:      	mov	x19, x0
    59e0:      	bl	0x59f8 <.text+0x49f8>
    59e4:      	mov	x0, x19
    59e8:      	sub	sp, x29, #0x10
    59ec:      	ldp	x29, x30, [sp, #0x10]
    59f0:      	ldp	x20, x19, [sp], #0x20
    59f4:      	ret
    59f8:      	stp	x22, x21, [sp, #-0x30]!
    59fc:      	stp	x20, x19, [sp, #0x10]
    5a00:      	stp	x29, x30, [sp, #0x20]
    5a04:      	add	x29, sp, #0x20
    5a08:      	sub	sp, sp, #0x10
    5a0c:      	adrp	x21, 0xa000
    5a10:      	ldr	x9, [x21, #0x498]
    5a14:      	cbz	x9, 0x5ad8 <.text+0x4ad8>
    5a18:      	adrp	x20, 0xa000
    5a1c:      	ldrb	w8, [x20, #0x490]
    5a20:      	cbnz	w8, 0x5acc <.text+0x4acc>
    5a24:      	ldr	x10, [x9, #0x60]
    5a28:      	orr	w0, wzr, #0x1f
    5a2c:      	ldr	x8, [x10, #0x18]
    5a30:      	blr	x8
    5a34:      	ldr	x11, [x21, #0x498]
    5a38:      	mov	x19, x0
    5a3c:      	ldr	x12, [x11, #0x60]
    5a40:      	ldr	x9, [x12, #0x20]
    5a44:      	blr	x9
    5a48:      	cmp	x19, #0x8
    5a4c:      	b.hi	0x5acc <.text+0x4acc>
    5a50:      	orr	w11, wzr, #0x8
    5a54:      	ldr	x13, [x21, #0x498]
    5a58:      	adrp	x0, 0x8000 <.text+0x7000>
    5a5c:      	adrp	x1, 0xa000
    5a60:      	str	x11, [sp, #0x8]
    5a64:      	add	x0, x0, #0xb14
    5a68:      	ldr	x14, [x13, #0x58]
    5a6c:      	add	x1, x1, #0x80
    5a70:      	add	x3, sp, #0x8
    5a74:      	mov	x4, sp
    5a78:      	mov	x2, xzr
    5a7c:      	ldr	x12, [x14, #0x48]
    5a80:      	blr	x12
    5a84:      	mov	x13, #-0x6000000000000000 // =-6917529027641081856
    5a88:      	movk	x13, #0x2
    5a8c:      	cmp	x0, x13
    5a90:      	b.ne	0x5af8 <.text+0x4af8>
    5a94:      	adrp	x0, 0xa000
    5a98:      	add	x0, x0, #0x80
    5a9c:      	bl	0x5930 <.text+0x4930>
    5aa0:      	cbz	x0, 0x5acc <.text+0x4acc>
    5aa4:      	ldrh	w8, [x0, #0x2]
    5aa8:      	cmp	w8, #0x1c
    5aac:      	adrp	x8, 0xa000
    5ab0:      	add	x8, x8, #0x494
    5ab4:      	b.ne	0x5ae0 <.text+0x4ae0>
    5ab8:      	ldr	w11, [x0, #0x18]
    5abc:      	orr	w12, wzr, #0x1
    5ac0:      	strb	w12, [x20, #0x490]
    5ac4:      	str	w11, [x8]
    5ac8:      	b	0x5ae0 <.text+0x4ae0>
    5acc:      	adrp	x8, 0xa000
    5ad0:      	add	x8, x8, #0x494
    5ad4:      	b	0x5ae0 <.text+0x4ae0>
    5ad8:      	adrp	x8, 0x6000 <.text+0x5000>
    5adc:      	add	x8, x8, #0x4c0
    5ae0:      	ldr	w0, [x8]
    5ae4:      	sub	sp, x29, #0x20
    5ae8:      	ldp	x29, x30, [sp, #0x20]
    5aec:      	ldp	x20, x19, [sp, #0x10]
    5af0:      	ldp	x22, x21, [sp], #0x30
    5af4:      	ret
    5af8:      	adrp	x8, 0xa000
    5afc:      	orr	w9, wzr, #0x1
    5b00:      	add	x8, x8, #0x494
    5b04:      	strb	w9, [x20, #0x490]
    5b08:      	tbnz	x0, #0x3f, 0x5ae0 <.text+0x4ae0>
    5b0c:      	ldr	x15, [sp]
    5b10:      	str	w15, [x8]
    5b14:      	b	0x5ae0 <.text+0x4ae0>
    5b18:      	ldr	x8, [x1, #0x60]
    5b1c:      	adrp	x1, 0xa000
    5b20:      	adrp	x2, 0xa000
    5b24:      	mov	x3, xzr
    5b28:      	add	x1, x1, #0xe0
    5b2c:      	ldr	x4, [x8, #0x150]
    5b30:      	add	x2, x2, #0x3e8
    5b34:      	br	x4
    5b38:      	stp	x29, x30, [sp, #-0x10]!
    5b3c:      	mov	x29, sp
    5b40:      	bl	0x44e4 <.text+0x34e4>
    5b44:      	cbz	x0, 0x5b78 <.text+0x4b78>
    5b48:      	adrp	x8, 0x6000 <.text+0x5000>
    5b4c:      	ldr	w8, [x8, #0x4c4]
    5b50:      	sub	w9, w8, #0x1
    5b54:      	mov	w8, #0xf0000            // =983040
    5b58:      	movk	w8, #0x423e
    5b5c:      	cmp	w9, w8
    5b60:      	b.ls	0x5ba4 <.text+0x4ba4>
    5b64:      	bl	0x6140 <.text+0x5140>
    5b68:      	cbz	x0, 0x5bc0 <.text+0x4bc0>
    5b6c:      	mov	x0, xzr
    5b70:      	ldp	x29, x30, [sp], #0x10
    5b74:      	ret
    5b78:      	adrp	x1, 0x8000 <.text+0x7000>
    5b7c:      	add	x1, x1, #0xb92
    5b80:      	orr	w0, wzr, #0x80000000
    5b84:      	bl	0x4674 <.text+0x3674>
    5b88:      	adrp	x0, 0x8000 <.text+0x7000>
    5b8c:      	adrp	x2, 0x8000 <.text+0x7000>
    5b90:      	add	x0, x0, #0xb26
    5b94:      	mov	w1, #0x50               // =80
    5b98:      	add	x2, x2, #0xb90
    5b9c:      	bl	0x4a00 <.text+0x3a00>
    5ba0:      	b	0x5ba0 <.text+0x4ba0>
    5ba4:      	adrp	x0, 0x8000 <.text+0x7000>
    5ba8:      	adrp	x2, 0x8000 <.text+0x7000>
    5bac:      	add	x0, x0, #0xb26
    5bb0:      	add	x2, x2, #0xb38
    5bb4:      	orr	w1, wzr, #0x38
    5bb8:      	bl	0x4a00 <.text+0x3a00>
    5bbc:      	b	0x5bbc <.text+0x4bbc>
    5bc0:      	adrp	x0, 0x8000 <.text+0x7000>
    5bc4:      	adrp	x2, 0x8000 <.text+0x7000>
    5bc8:      	add	x0, x0, #0xb26
    5bcc:      	mov	w1, #0x4c               // =76
    5bd0:      	add	x2, x2, #0xb6e
    5bd4:      	bl	0x4a00 <.text+0x3a00>
    5bd8:      	b	0x5bd8 <.text+0x4bd8>
    5bdc:      	stp	x20, x19, [sp, #-0x20]!
    5be0:      	stp	x29, x30, [sp, #0x10]
    5be4:      	add	x29, sp, #0x10
    5be8:      	adrp	x0, 0xa000
    5bec:      	adrp	x1, 0xa000
    5bf0:      	add	x0, x0, #0x90
    5bf4:      	add	x1, x1, #0x4a0
    5bf8:      	bl	0x56d4 <.text+0x46d4>
    5bfc:      	mov	x19, x0
    5c00:      	tbz	x19, #0x3f, 0x5c30 <.text+0x4c30>
    5c04:      	adrp	x1, 0x6000 <.text+0x5000>
    5c08:      	add	x1, x1, #0x454
    5c0c:      	orr	w0, wzr, #0x80000000
    5c10:      	mov	x2, x19
    5c14:      	bl	0x4674 <.text+0x3674>
    5c18:      	adrp	x0, 0x8000 <.text+0x7000>
    5c1c:      	adrp	x2, 0x6000 <.text+0x5000>
    5c20:      	add	x0, x0, #0xbeb
    5c24:      	add	x2, x2, #0x488
    5c28:      	orr	w1, wzr, #0x40
    5c2c:      	bl	0x4a00 <.text+0x3a00>
    5c30:      	adrp	x8, 0xa000
    5c34:      	ldr	x8, [x8, #0x4a0]
    5c38:      	cbz	x8, 0x5c4c <.text+0x4c4c>
    5c3c:      	ldp	x29, x30, [sp, #0x10]
    5c40:      	mov	x0, x19
    5c44:      	ldp	x20, x19, [sp], #0x20
    5c48:      	ret
    5c4c:      	adrp	x0, 0x8000 <.text+0x7000>
    5c50:      	adrp	x2, 0x8000 <.text+0x7000>
    5c54:      	add	x0, x0, #0xbeb
    5c58:      	mov	w1, #0x41               // =65
    5c5c:      	add	x2, x2, #0xc01
    5c60:      	bl	0x4a00 <.text+0x3a00>
    5c64:      	b	0x5c64 <.text+0x4c64>
    5c68:      	stp	x29, x30, [sp, #-0x10]!
    5c6c:      	mov	x29, sp
    5c70:      	adrp	x8, 0x5000 <.text+0x4000>
    5c74:      	adrp	x0, 0x5000 <.text+0x4000>
    5c78:      	add	x0, x0, #0xc90
    5c7c:      	ldr	w1, [x8, #0xd50]
    5c80:      	bl	0x4464 <.text+0x3464>
    5c84:      	mov	x0, xzr
    5c88:      	ldp	x29, x30, [sp], #0x10
    5c8c:      	ret
    5c90:      	mrs	x2, DAIF
    5c94:      	msr	DAIFSet, #0xf
    5c98:      	isb
    5c9c:      	dc	civac, x0
    5ca0:      	dsb	ish
    5ca4:      	mrs	x3, CurrentEL
    5ca8:      	cmp	x3, #0x8
    5cac:      	b.gt	0x5d1c <.text+0x4d1c>
    5cb0:      	b.eq	0x5cec <.text+0x4cec>
    5cb4:      	cbnz	x3, 0x5cbc <.text+0x4cbc>
    5cb8:      	b	0x5cb8 <.text+0x4cb8>
    5cbc:      	mrs	x8, SCTLR_EL1
    5cc0:      	and	x9, x8, #0xfffffffffffffffe
    5cc4:      	msr	SCTLR_EL1, x9
    5cc8:      	isb
    5ccc:      	str	x1, [x0]
    5cd0:      	dmb	sy
    5cd4:      	dc	ivac, x0
    5cd8:      	tlbi	vmalle1
    5cdc:      	dsb	sy
    5ce0:      	msr	SCTLR_EL1, x8
    5ce4:      	isb
    5ce8:      	b	0x5d48 <.text+0x4d48>
    5cec:      	mrs	x8, SCTLR_EL2
    5cf0:      	and	x9, x8, #0xfffffffffffffffe
    5cf4:      	msr	SCTLR_EL2, x9
    5cf8:      	isb
    5cfc:      	str	x1, [x0]
    5d00:      	dmb	sy
    5d04:      	dc	ivac, x0
    5d08:      	tlbi	alle2
    5d0c:      	dsb	sy
    5d10:      	msr	SCTLR_EL2, x8
    5d14:      	isb
    5d18:      	b	0x5d48 <.text+0x4d48>
    5d1c:      	mrs	x8, SCTLR_EL3
    5d20:      	and	x9, x8, #0xfffffffffffffffe
    5d24:      	msr	SCTLR_EL3, x9
    5d28:      	isb
    5d2c:      	str	x1, [x0]
    5d30:      	dmb	sy
    5d34:      	dc	ivac, x0
    5d38:      	tlbi	alle3
    5d3c:      	dsb	sy
    5d40:      	msr	SCTLR_EL3, x8
    5d44:      	isb
    5d48:      	msr	DAIF, x2
    5d4c:      	ret
    5d50:      	udf	#0xc0
    5d54:      	b	0x621c <.text+0x521c>
    5d58:      	stp	x20, x19, [sp, #-0x20]!
    5d5c:      	stp	x29, x30, [sp, #0x10]
    5d60:      	add	x29, sp, #0x10
    5d64:      	adrp	x19, 0xa000
    5d68:      	ldr	x9, [x19, #0x4a8]
    5d6c:      	cbnz	x9, 0x5da4 <.text+0x4da4>
    5d70:      	adrp	x9, 0xa000
    5d74:      	ldr	x8, [x9, #0x458]
    5d78:      	cbz	x8, 0x5da4 <.text+0x4da4>
    5d7c:      	ldr	x8, [x8, #0x140]
    5d80:      	cbz	x8, 0x5da4 <.text+0x4da4>
    5d84:      	adrp	x0, 0xa000
    5d88:      	adrp	x2, 0xa000
    5d8c:      	mov	x1, xzr
    5d90:      	add	x0, x0, #0xd0
    5d94:      	add	x2, x2, #0x4a8
    5d98:      	blr	x8
    5d9c:      	tbz	x0, #0x3f, 0x5da4 <.text+0x4da4>
    5da0:      	str	xzr, [x19, #0x4a8]
    5da4:      	ldp	x29, x30, [sp, #0x10]
    5da8:      	ldp	x20, x19, [sp], #0x20
    5dac:      	ret
    5db0:      	stp	x24, x23, [sp, #-0x40]!
    5db4:      	stp	x22, x21, [sp, #0x10]
    5db8:      	stp	x20, x19, [sp, #0x20]
    5dbc:      	stp	x29, x30, [sp, #0x30]
    5dc0:      	add	x29, sp, #0x30
    5dc4:      	adrp	x9, 0x6000 <.text+0x5000>
    5dc8:      	mov	w21, w0
    5dcc:      	mov	x19, x4
    5dd0:      	ldrb	w8, [x9, #0x4b3]
    5dd4:      	mov	x20, x3
    5dd8:      	mov	w22, w2
    5ddc:      	mov	w23, w1
    5de0:      	and	w9, w21, #0xff
    5de4:      	cmp	w9, #0x1
    5de8:      	b.ne	0x5df4 <.text+0x4df4>
    5dec:      	and	w10, w8, #0x1
    5df0:      	cbnz	w10, 0x5e1c <.text+0x4e1c>
    5df4:      	cmp	w9, #0x2
    5df8:      	b.ne	0x5e08 <.text+0x4e08>
    5dfc:      	and	w11, w8, #0x2
    5e00:      	and	w12, w11, #0xff
    5e04:      	cbnz	w12, 0x5e1c <.text+0x4e1c>
    5e08:      	cmp	w9, #0x3
    5e0c:      	b.ne	0x5e58 <.text+0x4e58>
    5e10:      	and	w8, w8, #0x4
    5e14:      	and	w9, w8, #0xff
    5e18:      	cbz	w9, 0x5e58 <.text+0x4e58>
    5e1c:      	bl	0x5d58 <.text+0x4d58>
    5e20:      	adrp	x10, 0xa000
    5e24:      	ldr	x8, [x10, #0x4a8]
    5e28:      	cbz	x8, 0x5e58 <.text+0x4e58>
    5e2c:      	ldr	x5, [x8]
    5e30:      	mov	w0, w21
    5e34:      	mov	w2, w22
    5e38:      	mov	x3, x20
    5e3c:      	mov	x4, x19
    5e40:      	ldp	x29, x30, [sp, #0x30]
    5e44:      	mov	w1, w23
    5e48:      	ldp	x20, x19, [sp, #0x20]
    5e4c:      	ldp	x22, x21, [sp, #0x10]
    5e50:      	ldp	x24, x23, [sp], #0x40
    5e54:      	br	x5
    5e58:      	ldp	x29, x30, [sp, #0x30]
    5e5c:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    5e60:      	ldp	x20, x19, [sp, #0x20]
    5e64:      	ldp	x22, x21, [sp, #0x10]
    5e68:      	ldp	x24, x23, [sp], #0x40
    5e6c:      	ret
    5e70:      	adrp	x8, 0x6000 <.text+0x5000>
    5e74:      	ldrb	w8, [x8, #0x4b3]
    5e78:      	and	w0, w8, #0x1
    5e7c:      	ret
    5e80:      	adrp	x8, 0x6000 <.text+0x5000>
    5e84:      	ldrb	w8, [x8, #0x4b3]
    5e88:      	ubfx	w0, w8, #1, #1
    5e8c:      	ret
    5e90:      	adrp	x8, 0x6000 <.text+0x5000>
    5e94:      	ldrb	w8, [x8, #0x4b3]
    5e98:      	ubfx	w0, w8, #2, #1
    5e9c:      	ret
    5ea0:      	stp	x28, x27, [sp, #-0x60]!
    5ea4:      	stp	x26, x25, [sp, #0x10]
    5ea8:      	stp	x24, x23, [sp, #0x20]
    5eac:      	stp	x22, x21, [sp, #0x30]
    5eb0:      	stp	x20, x19, [sp, #0x40]
    5eb4:      	stp	x29, x30, [sp, #0x50]
    5eb8:      	add	x29, sp, #0x50
    5ebc:      	sub	sp, sp, #0x210
    5ec0:      	mov	x23, x6
    5ec4:      	mov	x24, x5
    5ec8:      	mov	x25, x4
    5ecc:      	mov	x21, x3
    5ed0:      	mov	w19, w2
    5ed4:      	mov	w20, w1
    5ed8:      	mov	w22, w0
    5edc:      	cbnz	x24, 0x5f00 <.text+0x4f00>
    5ee0:      	cbz	x23, 0x5f00 <.text+0x4f00>
    5ee4:      	adrp	x0, 0x8000 <.text+0x7000>
    5ee8:      	adrp	x2, 0x8000 <.text+0x7000>
    5eec:      	add	x0, x0, #0xc15
    5ef0:      	add	x2, x2, #0xd14
    5ef4:      	orr	w1, wzr, #0x1f0
    5ef8:      	bl	0x4a00 <.text+0x3a00>
    5efc:      	b	0x5efc <.text+0x4efc>
    5f00:      	cbz	x24, 0x5f24 <.text+0x4f24>
    5f04:      	cbnz	x23, 0x5f24 <.text+0x4f24>
    5f08:      	adrp	x0, 0x8000 <.text+0x7000>
    5f0c:      	adrp	x2, 0x8000 <.text+0x7000>
    5f10:      	add	x0, x0, #0xc15
    5f14:      	mov	w1, #0x1f1              // =497
    5f18:      	add	x2, x2, #0xd51
    5f1c:      	bl	0x4a00 <.text+0x3a00>
    5f20:      	b	0x5f20 <.text+0x4f20>
    5f24:      	adrp	x27, 0xa000
    5f28:      	ldr	x9, [x27, #0x458]
    5f2c:      	cbz	x9, 0x5fac <.text+0x4fac>
    5f30:      	ldr	x10, [x9, #0x40]
    5f34:      	cbz	x10, 0x5fac <.text+0x4fac>
    5f38:      	ldr	x11, [x9, #0x48]
    5f3c:      	cbz	x11, 0x5fac <.text+0x4fac>
    5f40:      	ldr	x9, [x9, #0x18]
    5f44:      	orr	w0, wzr, #0x1f
    5f48:      	blr	x9
    5f4c:      	ldr	x10, [x27, #0x458]
    5f50:      	mov	x26, x0
    5f54:      	ldr	x12, [x10, #0x20]
    5f58:      	blr	x12
    5f5c:      	cmp	x26, #0x10
    5f60:      	stur	xzr, [x29, #-0x58]
    5f64:      	b.hi	0x5f88 <.text+0x4f88>
    5f68:      	ldr	x11, [x27, #0x458]
    5f6c:      	add	x1, x23, #0x14
    5f70:      	orr	w0, wzr, #0x4
    5f74:      	sub	x2, x29, #0x58
    5f78:      	ldr	x14, [x11, #0x40]
    5f7c:      	blr	x14
    5f80:      	ldur	x8, [x29, #-0x58]
    5f84:      	cbnz	x8, 0x5fdc <.text+0x4fdc>
    5f88:      	cmp	x23, #0x1ed
    5f8c:      	b.lo	0x5fd4 <.text+0x4fd4>
    5f90:      	adrp	x1, 0x8000 <.text+0x7000>
    5f94:      	add	x1, x1, #0xd8e
    5f98:      	orr	w0, wzr, #0x80000000
    5f9c:      	bl	0x4674 <.text+0x3674>
    5fa0:      	mov	x24, #-0x8000000000000000 // =-9223372036854775808
    5fa4:      	movk	x24, #0x9
    5fa8:      	b	0x5fb0 <.text+0x4fb0>
    5fac:      	mov	x24, #-0x7ffffffffffffffd // =-9223372036854775805
    5fb0:      	mov	x0, x24
    5fb4:      	sub	sp, x29, #0x50
    5fb8:      	ldp	x29, x30, [sp, #0x50]
    5fbc:      	ldp	x20, x19, [sp, #0x40]
    5fc0:      	ldp	x22, x21, [sp, #0x30]
    5fc4:      	ldp	x24, x23, [sp, #0x20]
    5fc8:      	ldp	x26, x25, [sp, #0x10]
    5fcc:      	ldp	x28, x27, [sp], #0x60
    5fd0:      	ret
    5fd4:      	mov	x8, sp
    5fd8:      	stur	x8, [x29, #-0x58]
    5fdc:      	mov	w9, #0x14               // =20
    5fe0:      	adrp	x16, 0xa000
    5fe4:      	add	x16, x16, #0x50
    5fe8:      	strh	w9, [x8]
    5fec:      	cmp	x25, #0x0
    5ff0:      	ldur	x12, [x29, #-0x58]
    5ff4:      	csel	x1, x16, x25, eq
    5ff8:      	strh	w23, [x12, #0x2]
    5ffc:      	ldur	x13, [x29, #-0x58]
    6000:      	add	x0, x13, #0x4
    6004:      	bl	0x606c <.text+0x506c>
    6008:      	cbz	x24, 0x6020 <.text+0x5020>
    600c:      	ldur	x14, [x29, #-0x58]
    6010:      	mov	x1, x24
    6014:      	mov	x2, x23
    6018:      	add	x0, x14, #0x14
    601c:      	bl	0x4c10 <.text+0x3c10>
    6020:      	adrp	x5, 0xa000
    6024:      	ldur	x4, [x29, #-0x58]
    6028:      	add	x5, x5, #0x8
    602c:      	cmp	x21, #0x0
    6030:      	csel	x3, x5, x21, eq
    6034:      	mov	w0, w22
    6038:      	mov	w1, w20
    603c:      	mov	w2, w19
    6040:      	bl	0x5db0 <.text+0x4db0>
    6044:      	ldur	x8, [x29, #-0x58]
    6048:      	mov	x24, x0
    604c:      	mov	x15, sp
    6050:      	cmp	x8, x15
    6054:      	b.eq	0x5fb0 <.text+0x4fb0>
    6058:      	ldr	x16, [x27, #0x458]
    605c:      	mov	x0, x8
    6060:      	ldr	x2, [x16, #0x48]
    6064:      	blr	x2
    6068:      	b	0x5fb0 <.text+0x4fb0>
    606c:      	stp	x29, x30, [sp, #-0x10]!
    6070:      	mov	x29, sp
    6074:      	cbz	x0, 0x6088 <.text+0x5088>
    6078:      	cbz	x1, 0x60a4 <.text+0x50a4>
    607c:      	orr	w2, wzr, #0x10
    6080:      	ldp	x29, x30, [sp], #0x10
    6084:      	b	0x4ffc <.text+0x3ffc>
    6088:      	adrp	x0, 0x8000 <.text+0x7000>
    608c:      	adrp	x2, 0x8000 <.text+0x7000>
    6090:      	add	x0, x0, #0xdc6
    6094:      	mov	w1, #0x2f               // =47
    6098:      	add	x2, x2, #0xdd3
    609c:      	bl	0x4a00 <.text+0x3a00>
    60a0:      	b	0x60a0 <.text+0x50a0>
    60a4:      	adrp	x0, 0x8000 <.text+0x7000>
    60a8:      	adrp	x2, 0x8000 <.text+0x7000>
    60ac:      	add	x0, x0, #0xdc6
    60b0:      	add	x2, x2, #0xdf3
    60b4:      	orr	w1, wzr, #0x30
    60b8:      	bl	0x4a00 <.text+0x3a00>
    60bc:      	b	0x60bc <.text+0x50bc>
    60c0:      	stp	x29, x30, [sp, #-0x10]!
    60c4:      	mov	x29, sp
    60c8:      	cbz	x0, 0x60d8 <.text+0x50d8>
    60cc:      	cbz	x1, 0x60f4 <.text+0x50f4>
    60d0:      	ldp	x29, x30, [sp], #0x10
    60d4:      	b	0x6120 <.text+0x5120>
    60d8:      	adrp	x0, 0x8000 <.text+0x7000>
    60dc:      	adrp	x2, 0x8000 <.text+0x7000>
    60e0:      	add	x0, x0, #0xdc6
    60e4:      	mov	w1, #0x4c               // =76
    60e8:      	add	x2, x2, #0xe0e
    60ec:      	bl	0x4a00 <.text+0x3a00>
    60f0:      	b	0x60f0 <.text+0x50f0>
    60f4:      	adrp	x0, 0x8000 <.text+0x7000>
    60f8:      	adrp	x2, 0x8000 <.text+0x7000>
    60fc:      	add	x0, x0, #0xdc6
    6100:      	mov	w1, #0x4d               // =77
    6104:      	add	x2, x2, #0xe24
    6108:      	bl	0x4a00 <.text+0x3a00>
    610c:      	b	0x610c <.text+0x510c>
		...
    6120:      	mov	x2, xzr
    6124:      	ldp	x3, x4, [x0]
    6128:      	cbz	x1, 0x6130 <.text+0x5130>
    612c:      	ldp	x1, x2, [x1]
    6130:      	cmp	x1, x3
    6134:      	ccmp	x2, x4, #0x0, eq
    6138:      	cset	w0, eq
    613c:      	ret
    6140:      	stp	x29, x30, [sp, #-0x10]!
    6144:      	mov	x29, sp
    6148:      	sub	sp, sp, #0x10
    614c:      	add	x1, sp, #0x8
    6150:      	str	xzr, [sp, #0x8]
    6154:      	mov	w0, wzr
    6158:      	bl	0x6300 <.text+0x5300>
    615c:      	ldr	x0, [sp, #0x8]
    6160:      	mov	sp, x29
    6164:      	ldp	x29, x30, [sp], #0x10
    6168:      	ret
    616c:      	udf	#0x0
    6170:      	ldr	x0, 0x6290 <.text+0x5290>
    6174:      	str	xzr, [x0]
    6178:      	bl	0x44cc <.text+0x34cc>
    617c:      	dsb	sy
    6180:      	isb
    6184:      	ldr	x0, 0x6298 <.text+0x5298>
    6188:      	ldr	x2, 0x62a0 <.text+0x52a0>
    618c:      	mov	x3, #0x8                // =8
    6190:      	smc	#0
    6194:      	cmp	w0, #0x0
    6198:      	b.gt	0x6190 <.text+0x5190>
    619c:      	cmp	w0, #0x0
    61a0:      	b.ne	0x61bc <.text+0x51bc>
    61a4:      	ldr	x0, 0x62a8 <.text+0x52a8>
    61a8:      	bl	0x44c4 <.text+0x34c4>
    61ac:      	dsb	sy
    61b0:      	isb
    61b4:      	ldr	x1, 0x62b0 <.text+0x52b0>
    61b8:      	ldr	x0, [x1]
    61bc:      	ldp	x29, x30, [sp], #0x10
    61c0:      	ret
    61c4:      	ldr	x0, 0x62b8 <.text+0x52b8>
    61c8:      	str	xzr, [x0]
    61cc:      	bl	0x44cc <.text+0x34cc>
    61d0:      	dsb	sy
    61d4:      	isb
    61d8:      	ldr	x0, 0x62c0 <.text+0x52c0>
    61dc:      	mov	x1, #0x22               // =34
    61e0:      	ldr	x2, 0x62c8 <.text+0x52c8>
    61e4:      	mov	x3, #0x8                // =8
    61e8:      	smc	#0
    61ec:      	cmp	w0, #0x0
    61f0:      	b.gt	0x61e8 <.text+0x51e8>
    61f4:      	cmp	w0, #0x0
    61f8:      	b.ne	0x6214 <.text+0x5214>
    61fc:      	ldr	x0, 0x62d0 <.text+0x52d0>
    6200:      	bl	0x44c4 <.text+0x34c4>
    6204:      	dsb	sy
    6208:      	isb
    620c:      	ldr	x1, 0x62d8 <.text+0x52d8>
    6210:      	ldr	x0, [x1]
    6214:      	ldp	x29, x30, [sp], #0x10
    6218:      	ret
    621c:      	stp	x29, x30, [sp, #-0x10]!
    6220:      	mov	x29, sp
    6224:      	ldr	x0, 0x62e0 <.text+0x52e0>
    6228:      	ldr	x0, [x0]
    622c:      	adr	x1, 0x6238 <.text+0x5238>
    6230:      	ldr	x2, [x1, x0]
    6234:      	br	x2
    6238:      	udf	#0x6250
    623c:      	udf	#0x0
    6240:      	udf	#0x6170
    6244:      	udf	#0x0
    6248:      	udf	#0x61c4
    624c:      	udf	#0x0
    6250:      	ldr	x0, 0x62e8 <.text+0x52e8>
    6254:      	mov	x1, #0x1                // =1
    6258:      	ldr	x2, 0x62f0 <.text+0x52f0>
    625c:      	smc	#0
    6260:      	cmp	w0, #0x0
    6264:      	b.gt	0x625c <.text+0x525c>
    6268:      	cmp	w0, #0x0
    626c:      	ldr	x1, 0x62f8 <.text+0x52f8>
    6270:      	b.ne	0x6280 <.text+0x5280>
    6274:      	mov	x0, #0x10               // =16
    6278:      	str	x0, [x1]
    627c:      	b	0x61c4 <.text+0x51c4>
    6280:      	mov	x0, #0x8                // =8
    6284:      	str	x0, [x1]
    6288:      	b	0x6170 <.text+0x5170>
    628c:      	nop
    6290:      	udf	#0xa400
    6294:      	udf	#0x0
    6298:      	<unknown>
    629c:      	udf	#0x0
    62a0:      	udf	#0xa400
    62a4:      	udf	#0x0
    62a8:      	udf	#0xa400
    62ac:      	udf	#0x0
    62b0:      	udf	#0xa400
    62b4:      	udf	#0x0
    62b8:      	udf	#0xa400
    62bc:      	udf	#0x0
    62c0:      	<unknown>
    62c4:      	udf	#0x0
    62c8:      	udf	#0xa400
    62cc:      	udf	#0x0
    62d0:      	udf	#0xa400
    62d4:      	udf	#0x0
    62d8:      	udf	#0xa400
    62dc:      	udf	#0x0
    62e0:      	udf	#0xa408
    62e4:      	udf	#0x0
    62e8:      	<unknown>
    62ec:      	udf	#0x0
    62f0:      	<unknown>
    62f4:      	udf	#0x0
    62f8:      	udf	#0xa408
    62fc:      	udf	#0x0
    6300:      	stp	x20, x19, [sp, #-0x20]!
    6304:      	stp	x29, x30, [sp, #0x10]
    6308:      	add	x29, sp, #0x10
    630c:      	mov	x19, x1
    6310:      	mov	w20, w0
    6314:      	bl	0x44e4 <.text+0x34e4>
    6318:      	cbz	x0, 0x6350 <.text+0x5350>
    631c:      	mov	w8, w20
    6320:      	cmp	w20, #0xe
    6324:      	b.hi	0x637c <.text+0x537c>
    6328:      	adrp	x9, 0x8000 <.text+0x7000>
    632c:      	add	x9, x9, #0xe98
    6330:      	ldr	x9, [x9, x8, lsl #3]
    6334:      	br	x9
    6338:      	ldp	x29, x30, [sp, #0x10]
    633c:      	adrp	x1, 0x8000 <.text+0x7000>
    6340:      	add	x1, x1, #0xf10
    6344:      	orr	w0, wzr, #0x80000000
    6348:      	ldp	x20, x19, [sp], #0x20
    634c:      	b	0x4674 <.text+0x3674>
    6350:      	adrp	x1, 0x8000 <.text+0x7000>
    6354:      	add	x1, x1, #0xf8a
    6358:      	orr	w0, wzr, #0x80000000
    635c:      	bl	0x4674 <.text+0x3674>
    6360:      	adrp	x0, 0x8000 <.text+0x7000>
    6364:      	adrp	x2, 0x8000 <.text+0x7000>
    6368:      	add	x0, x0, #0xfed
    636c:      	mov	w1, #0x5e               // =94
    6370:      	add	x2, x2, #0xb90
    6374:      	bl	0x4a00 <.text+0x3a00>
    6378:      	b	0x6378 <.text+0x5378>
    637c:      	ldp	x29, x30, [sp, #0x10]
    6380:      	adrp	x1, 0x8000 <.text+0x7000>
    6384:      	add	x1, x1, #0xf60
    6388:      	orr	w0, wzr, #0x80000000
    638c:      	mov	w2, w20
    6390:      	ldp	x20, x19, [sp], #0x20
    6394:      	b	0x4674 <.text+0x3674>
    6398:      	bl	0x63fc <.text+0x53fc>
    639c:      	b	0x63ec <.text+0x53ec>
    63a0:      	bl	0x6404 <.text+0x5404>
    63a4:      	b	0x63ec <.text+0x53ec>
    63a8:      	bl	0x640c <.text+0x540c>
    63ac:      	b	0x63ec <.text+0x53ec>
    63b0:      	bl	0x6414 <.text+0x5414>
    63b4:      	b	0x63ec <.text+0x53ec>
    63b8:      	bl	0x641c <.text+0x541c>
    63bc:      	b	0x63ec <.text+0x53ec>
    63c0:      	bl	0x6424 <.text+0x5424>
    63c4:      	b	0x63ec <.text+0x53ec>
    63c8:      	bl	0x642c <.text+0x542c>
    63cc:      	b	0x63ec <.text+0x53ec>
    63d0:      	bl	0x6434 <.text+0x5434>
    63d4:      	b	0x63ec <.text+0x53ec>
    63d8:      	bl	0x643c <.text+0x543c>
    63dc:      	b	0x63ec <.text+0x53ec>
    63e0:      	bl	0x6444 <.text+0x5444>
    63e4:      	b	0x63ec <.text+0x53ec>
    63e8:      	bl	0x644c <.text+0x544c>
    63ec:      	str	x0, [x19]
    63f0:      	ldp	x29, x30, [sp, #0x10]
    63f4:      	ldp	x20, x19, [sp], #0x20
    63f8:      	ret
    63fc:      	mrs	x0, CNTFRQ_EL0
    6400:      	ret
    6404:      	mrs	x0, CNTPCT_EL0
    6408:      	ret
    640c:      	mrs	x0, CNTKCTL_EL1
    6410:      	ret
    6414:      	mrs	x0, CNTP_TVAL_EL0
    6418:      	ret
    641c:      	mrs	x0, CNTP_CTL_EL0
    6420:      	ret
    6424:      	mrs	x0, CNTV_TVAL_EL0
    6428:      	ret
    642c:      	mrs	x0, CNTV_CTL_EL0
    6430:      	ret
    6434:      	mrs	x0, CNTVCT_EL0
    6438:      	ret
    643c:      	mrs	x0, CNTP_CVAL_EL0
    6440:      	ret
    6444:      	mrs	x0, CNTV_CVAL_EL0
    6448:      	ret
    644c:      	mrs	x0, CNTVOFF_EL2
    6450:      	ret
    6454:      	<unknown>
    6458:      	<unknown>
    645c:      	<unknown>
    6460:      	<unknown>
    6464:      	<unknown>
    6468:      	<unknown>
    646c:      	<unknown>
    6470:      	bic	w5, w17, w9, lsl #28
    6474:      	ldpsw	x0, x17, [x0, #-0x70]
    6478:      	addhnt	z22.b, z11.h, z18.h
    647c:      	ldrh	w14, [x3, #0x193a]
    6480:      	umin	v16.8h, v26.8h, v9.8h
    6484:      	<unknown>
    6488:      	<unknown>
    648c:      	<unknown>
    6490:      	stnp	w15, w20, [x18, #-0x100]
    6494:      	<unknown>
    6498:      	<unknown>
    649c:      	<unknown>
    64a0:      	<unknown>
    64a4:      	fnmla	z5.h, p1/m, z3.h, z24.h
    64a8:      	<unknown>
    64ac:      	ushl	v15.8h, v27.8h, v5.8h
    64b0:      	<unknown>
    64b4:      	udf	#0x2b
    64b8:      	<unknown>
    64bc:      	<unknown>
    64c0:      	<unknown>
    64c4:      	<unknown>
    64c8:      	udf	#0x0
    64cc:      	<unknown>
    64d0:      	<unknown>
    64d4:      	<unknown>
    64d8:      	<unknown>
    64dc:      	<unknown>
    64e0:      	<unknown>
    64e4:      	<unknown>
    64e8:      	fnmla	z5.h, p6/m, z3.h, z6.h
    64ec:      	<unknown>
    64f0:      	<unknown>
    64f4:      	<unknown>
    64f8:      	<unknown>
    64fc:      	adr	x14, 0x9090a
    6500:      	whilewr	p0.h, x1, x24
    6504:      	<unknown>
    6508:      	ldpsw	x1, x24, [x27, #-0x60]
    650c:      	<unknown>
    6510:      	<unknown>
    6514:      	ldp	d19, d29, [x11, #-0x1e0]
    6518:      	ldpsw	x9, x29, [x3, #-0x60]
    651c:      	<unknown>
    6520:      	<unknown>
    6524:      	ldnp	d6, d24, [x10, #-0x170]
    6528:      	<unknown>
    652c:      	<unknown>
    6530:      	<unknown>
    6534:      	<unknown>
    6538:      	fnmls	z14.h, p4/m, z27.h, z6.h
    653c:      	usubl2	v18.4s, v3.8h, v15.8h
    6540:      	<unknown>
    6544:      	adr	x16, 0x51449
    6548:      	<unknown>
    654c:      	<unknown>
    6550:      	<unknown>
    6554:      	ldnp	d6, d24, [x10, #-0x170]
    6558:      	<unknown>
    655c:      	<unknown>
    6560:      	<unknown>
    6564:      	uabdl2	v20.4s, v19.8h, v1.8h
    6568:      	<unknown>
    656c:      	<unknown>
    6570:      	adr	x5, 0x46f79
    6574:      	orr	w24, w11, #0x3ff0000
    6578:      	<unknown>
    657c:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    6580:      	<unknown>
    6584:      	<unknown>
    6588:      	<unknown>
    658c:      	fnmls	z15.h, p3/m, z3.h, z12.h
    6590:      	<unknown>
    6594:      	<unknown>
    6598:      	bic	w0, w9, w18, lsr #9
    659c:      	<unknown>
    65a0:      	ldpsw	x4, x25, [x10, #-0x50]
    65a4:      	<unknown>
    65a8:      	and	p15.b, p12/z, p3.b, p0.b
    65ac:      	<unknown>
    65b0:      	fcmne	p3.h, p0/z, z19.h, z4.h
    65b4:      	<unknown>
    65b8:      	fnmla	z3.h, p1/m, z19.h, z18.h
    65bc:      	<unknown>
    65c0:      	adr	x3, 0xd940f
    65c4:      	<unknown>
    65c8:      	ldpsw	x0, x25, [x17, #-0xf8]
    65cc:      	<unknown>
    65d0:      	<unknown>
    65d4:      	<unknown>
    65d8:      	<unknown>
    65dc:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    65e0:      	<unknown>
    65e4:      	fcmeq	p5.h, p1/z, z11.h, z4.h
    65e8:      	<unknown>
    65ec:      	<unknown>
    65f0:      	<unknown>
    65f4:      	bic	w0, w9, w18, lsr #9
    65f8:      	<unknown>
    65fc:      	ldpsw	x0, x17, [x17, #-0xf8]
    6600:      	<unknown>
    6604:      	<unknown>
    6608:      	ldpsw	x21, x24, [x19, #-0x98]
    660c:      	<unknown>
    6610:      	<unknown>
    6614:      	<unknown>
    6618:      	<unknown>
    661c:      	bic	w0, w9, w18, lsr #9
    6620:      	<unknown>
    6624:      	ldpsw	x4, x25, [x10, #-0x50]
    6628:      	fcmeq	p3.h, p1/z, z11.h, z19.h
    662c:      	<unknown>
    6630:      	fcmne	p3.h, p0/z, z19.h, z4.h
    6634:      	fnmls	z22.h, p2/m, z11.h, z3.h
    6638:      	<unknown>
    663c:      	fnmla	z20.h, p6/m, z3.h, z6.h
    6640:      	<unknown>
    6644:      	<unknown>
    6648:      	ldpsw	x22, x24, [x11, #-0xa0]
    664c:      	<unknown>
    6650:      	fnmls	z18.h, p0/m, z11.h, z13.h
    6654:      	bic	w20, w11, w18, lsr #25
    6658:      	<unknown>
    665c:      	ldpsw	x4, x25, [x10, #-0x50]
    6660:      	<unknown>
    6664:      	fnmls	z14.h, p1/m, z3.h, z12.h
    6668:      	uabd	v5.8h, v18.8h, v5.8h
    666c:      	<unknown>
    6670:      	<unknown>
    6674:      	<unknown>
    6678:      	<unknown>
    667c:      	<unknown>
    6680:      	ldnp	d1, d27, [x19, #-0x1c0]
    6684:      	<unknown>
    6688:      	fnmls	z1.h, p2/m, z11.h, z12.h
    668c:      	<unknown>
    6690:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    6694:      	<unknown>
    6698:      	fnmls	z20.h, p0/m, z11.h, z20.h
    669c:      	<unknown>
    66a0:      	fnmls	z8.h, p2/m, z11.h, z14.h
    66a4:      	ldpsw	x0, x25, [x17, #-0xf8]
    66a8:      	<unknown>
    66ac:      	adr	x20, 0x4749b
    66b0:      	fnmls	z18.h, p3/m, z27.h, z3.h
    66b4:      	<unknown>
    66b8:      	<unknown>
    66bc:      	ands	w26, w1, #0xf800000f
    66c0:      	<unknown>
    66c4:      	fminv	h26, p0, z1.h
    66c8:      	fdot	z20.s, z11.b, z6.b[1]
    66cc:      	umin	v16.8h, v27.8h, v9.8h
    66d0:      	<unknown>
    66d4:      	<unknown>
    66d8:      	ldpsw	x5, x29, [x3, #0x98]
    66dc:      	<unknown>
    66e0:      	fnmls	z1.h, p2/m, z11.h, z12.h
    66e4:      	<unknown>
    66e8:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    66ec:      	<unknown>
    66f0:      	fnmls	z1.h, p2/m, z11.h, z12.h
    66f4:      	umlal2	v4.4s, v3.8h, v4.h[3]
    66f8:      	<unknown>
    66fc:      	<unknown>
    6700:      	<unknown>
    6704:      	<unknown>
    6708:      	fnmls	z15.h, p3/m, z3.h, z12.h
    670c:      	<unknown>
    6710:      	<unknown>
    6714:      	fcmne	p3.h, p0/z, z19.h, z4.h
    6718:      	fnmls	z22.h, p2/m, z11.h, z3.h
    671c:      	<unknown>
    6720:      	<unknown>
    6724:      	<unknown>
    6728:      	<unknown>
    672c:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    6730:      	<unknown>
    6734:      	fcmeq	p9.h, p5/z, z3.h, z4.h
    6738:      	ldpsw	x19, x24, [x27, #-0x70]
    673c:      	<unknown>
    6740:      	<unknown>
    6744:      	<unknown>
    6748:      	ands	w26, w1, #0xf800000f
    674c:      	<unknown>
    6750:      	<unknown>
    6754:      	<unknown>
    6758:      	<unknown>
    675c:      	<unknown>
    6760:      	ldpsw	x9, x24, [x11, #-0xa0]
    6764:      	<unknown>
    6768:      	fnmls	z20.h, p0/m, z11.h, z20.h
    676c:      	<unknown>
    6770:      	fnmls	z8.h, p2/m, z11.h, z14.h
    6774:      	ands	w26, w1, #0xf800000f
    6778:      	<unknown>
    677c:      	<unknown>
    6780:      	<unknown>
    6784:      	<unknown>
    6788:      	<unknown>
    678c:      	<unknown>
    6790:      	usubl2	v5.4s, v3.8h, v1.8h
    6794:      	usubl2	v4.4s, v3.8h, v5.8h
    6798:      	fnmls	z1.h, p0/m, z19.h, z12.h
    679c:      	<unknown>
    67a0:      	umin	v16.8h, v27.8h, v9.8h
    67a4:      	<unknown>
    67a8:      	<unknown>
    67ac:      	<unknown>
    67b0:      	<unknown>
    67b4:      	<unknown>
    67b8:      	bic	p2.b, p13/z, p3.b, p0.b
    67bc:      	<unknown>
    67c0:      	<unknown>
    67c4:      	b.ne	0xd1650
    67c8:      	<unknown>
    67cc:      	<unknown>
    67d0:      	fnmls	z21.h, p1/m, z19.h, z6.h
    67d4:      	<unknown>
    67d8:      	<unknown>
    67dc:      	ands	w26, w1, #0xf800000f
    67e0:      	<unknown>
    67e4:      	<unknown>
    67e8:      	<unknown>
    67ec:      	<unknown>
    67f0:      	<unknown>
    67f4:      	fnmls	z21.h, p1/m, z19.h, z6.h
    67f8:      	<unknown>
    67fc:      	<unknown>
    6800:      	<unknown>
    6804:      	<unknown>
    6808:      	<unknown>
    680c:      	<unknown>
    6810:      	ldpsw	x0, x25, [x17, #-0xf8]
    6814:      	<unknown>
    6818:      	bic	w0, w9, w18, lsr #9
    681c:      	<unknown>
    6820:      	ldpsw	x4, x25, [x10, #-0x50]
    6824:      	<unknown>
    6828:      	<unknown>
    682c:      	<unknown>
    6830:      	<unknown>
    6834:      	<unknown>
    6838:      	<unknown>
    683c:      	<unknown>
    6840:      	adr	x5, 0xcf60b
    6844:      	<unknown>
    6848:      	ldnp	d19, d29, [x2, #-0x1f0]
    684c:      	<unknown>
    6850:      	<unknown>
    6854:      	fnmls	z1.h, p2/m, z11.h, z12.h
    6858:      	<unknown>
    685c:      	<unknown>
    6860:      	fcmne	p3.h, p0/z, z19.h, z4.h
    6864:      	fnmls	z22.h, p2/m, z11.h, z3.h
    6868:      	addhnt	z19.b, z10.h, z20.h
    686c:      	sqshlu	v14.2d, v3.2d, #0x30
    6870:      	<unknown>
    6874:      	ldnp	d20, d24, [x11, #-0x140]
    6878:      	<unknown>
    687c:      	<unknown>
    6880:      	<unknown>
    6884:      	<unknown>
    6888:      	<unknown>
    688c:      	<unknown>
    6890:      	<unknown>
    6894:      	<unknown>
    6898:      	<unknown>
    689c:      	<unknown>
    68a0:      	<unknown>
    68a4:      	<unknown>
    68a8:      	<unknown>
    68ac:      	<unknown>
    68b0:      	<unknown>
    68b4:      	ldpsw	x5, x17, [x3, #-0x70]
    68b8:      	addhnt	z22.b, z11.h, z18.h
    68bc:      	ldrh	w14, [x3, #0x193a]
    68c0:      	umin	v16.8h, v26.8h, v9.8h
    68c4:      	<unknown>
    68c8:      	<unknown>
    68cc:      	<unknown>
    68d0:      	<unknown>
    68d4:      	<unknown>
    68d8:      	<unknown>
    68dc:      	<unknown>
    68e0:      	smlal2	v14.4s, v2.8h, v9.h[0]
    68e4:      	fcmla	v0.8h, v1.8h, v18.h[1], #270
    68e8:      	<unknown>
    68ec:      	<unknown>
    68f0:      	<unknown>
    68f4:      	fcmne	p3.h, p0/z, z19.h, z4.h
    68f8:      	fnmls	z22.h, p2/m, z11.h, z3.h
    68fc:      	uabdl2	v15.4s, v2.8h, v5.8h
    6900:      	<unknown>
    6904:      	ldnp	d15, d24, [x27, #-0x110]
    6908:      	udf	#0x73
    690c:      	udf	#0x0
    6910:      	udf	#0x3
    6914:      	udf	#0x1
    6918:      	udf	#0x2
    691c:      	udf	#0x0
    6920:      	udf	#0x3
    6924:      	<unknown>
    6928:      	bc.lo	0x893b0
    692c:      	usubwt	z5.h, z26.h, z4.b
    6930:      	ldxrh	w20, [x10]
    6934:      	<unknown>
    6938:      	<unknown>
    693c:      	saddwb	z20.h, z10.h, z20.b
    6940:      	bc.nv	0xaf168
    6944:      	saddwb	z1.h, z26.h, z8.b
    6948:      	saddlb	z4.h, z2.b, z4.b
    694c:      	bc.vs	0xad534
    6950:      	shl	d1, d2, #0x5
    6954:      	<unknown>
    6958:      	<unknown>
    695c:      	<unknown>
    6960:      	ssubwb	z5.h, z26.h, z19.b
    6964:      	saddlb	z4.h, z2.b, z4.b
    6968:      	bc.vs	0xad550
    696c:      	shl	d1, d2, #0x5
    6970:      	<unknown>
    6974:      	<unknown>
    6978:      	<unknown>
    697c:      	<unknown>
    6980:      	saddwb	z20.h, z10.h, z20.b
    6984:      	<unknown>
    6988:      	smlalt	z16.h, z10.b, z14.b
    698c:      	and	p5.b, p1/z, p2.b, p0.b
    6990:      	stgp	x1, x14, [x19, #-0x400]
    6994:      	ldnp	d14, d29, [x19, #-0x1f0]
    6998:      	adr	x9, 0x47627
    699c:      	ldp	d1, d28, [x19, #-0x1f0]
    69a0:      	<unknown>
    69a4:      	fadd	z10.h, z0.h, z4.h
    69a8:      	<unknown>
    69ac:      	ldpsw	x14, x26, [x11, #-0x60]
    69b0:      	<unknown>
    69b4:      	<unknown>
    69b8:      	<unknown>
    69bc:      	<unknown>
    69c0:      	<unknown>
    69c4:      	<unknown>
    69c8:      	fnmls	z3.h, p0/m, z11.h, z20.h
    69cc:      	rsubhn2	v0.8h, v25.4s, v15.4s
    69d0:      	ldnp	d20, d28, [x19, #-0x110]
    69d4:      	<unknown>
    69d8:      	fnmls	z14.h, p4/m, z27.h, z6.h
    69dc:      	<unknown>
    69e0:      	<unknown>
    69e4:      	ands	w26, w1, #0xf800000f
    69e8:      	<unknown>
    69ec:      	<unknown>
    69f0:      	<unknown>
    69f4:      	<unknown>
    69f8:      	<unknown>
    69fc:      	umlal2	v20.4s, v3.8h, v3.h[2]
    6a00:      	uqshl	v14.2d, v3.2d, #0x32
    6a04:      	<unknown>
    6a08:      	<unknown>
    6a0c:      	<unknown>
    6a10:      	<unknown>
    6a14:      	<unknown>
    6a18:      	fnmla	z13.h, p0/m, z27.h, z12.h
    6a1c:      	adr	x1, 0xf17eb
    6a20:      	<unknown>
    6a24:      	ldpsw	x0, x17, [x17, #-0xf8]
    6a28:      	<unknown>
    6a2c:      	<unknown>
    6a30:      	<unknown>
    6a34:      	<unknown>
    6a38:      	<unknown>
    6a3c:      	uabdl2	v20.4s, v19.8h, v1.8h
    6a40:      	<unknown>
    6a44:      	<unknown>
    6a48:      	<unknown>
    6a4c:      	bic	w0, w9, w18, lsr #9
    6a50:      	<unknown>
    6a54:      	<unknown>
    6a58:      	<unknown>
    6a5c:      	fnmla	z19.h, p1/m, z11.h, z22.h
    6a60:      	and	p14.b, p13/z, p3.b, p0.b
    6a64:      	b.ne	0x471b0
    6a68:      	<unknown>
    6a6c:      	<unknown>
    6a70:      	<unknown>
    6a74:      	<unknown>
    6a78:      	luti4	v16.8h, { v2.8h, v3.8h }, v5[2]
    6a7c:      	<unknown>
    6a80:      	<unknown>
    6a84:      	<unknown>
    6a88:      	<unknown>
    6a8c:      	<unknown>
    6a90:      	<unknown>
    6a94:      	<unknown>
    6a98:      	<unknown>
    6a9c:      	<unknown>
    6aa0:      	<unknown>
    6aa4:      	<unknown>
    6aa8:      	<unknown>
    6aac:      	<unknown>
    6ab0:      	ands	w20, w11, #0x3ffffff
    6ab4:      	<unknown>
    6ab8:      	ldnp	s14, s25, [x11, #-0xe0]
    6abc:      	<unknown>
    6ac0:      	<unknown>
    6ac4:      	umax	v14.8h, v27.8h, v9.8h
    6ac8:      	<unknown>
    6acc:      	<unknown>
    6ad0:      	<unknown>
    6ad4:      	<unknown>
    6ad8:      	sabdl2	v13.4s, v26.8h, v7.8h
    6adc:      	<unknown>
    6ae0:      	<unknown>
    6ae4:      	<unknown>
    6ae8:      	<unknown>
    6aec:      	<unknown>
    6af0:      	<unknown>
    6af4:      	ldpsw	x0, x17, [x8, #-0xd0]
    6af8:      	<unknown>
    6afc:      	<unknown>
    6b00:      	ldpsw	x4, x28, [x3, #-0x88]
    6b04:      	<unknown>
    6b08:      	<unknown>
    6b0c:      	fcvtxn2	v3.4s, v2.2d
    6b10:      	<unknown>
    6b14:      	<unknown>
    6b18:      	<unknown>
    6b1c:      	subhnb	z13.b, z26.h, z7.h
    6b20:      	sqshlu	v14.2d, v3.2d, #0x30
    6b24:      	<unknown>
    6b28:      	<unknown>
    6b2c:      	<unknown>
    6b30:      	<unknown>
    6b34:      	<unknown>
    6b38:      	<unknown>
    6b3c:      	<unknown>
    6b40:      	subhnt	z2.b, z10.h, z19.h
    6b44:      	<unknown>
    6b48:      	<unknown>
    6b4c:      	pmullb	z3.q, z3.d, z0.d
    6b50:      	<unknown>
    6b54:      	<unknown>
    6b58:      	subhnt	z2.b, z10.h, z19.h
    6b5c:      	<unknown>
    6b60:      	<unknown>
    6b64:      	pmullb	z3.q, z3.d, z0.d
    6b68:      	<unknown>
    6b6c:      	<unknown>
    6b70:      	subhnt	z2.b, z10.h, z19.h
    6b74:      	<unknown>
    6b78:      	fnmls	z18.h, p1/m, z10.h, z19.h
    6b7c:      	<unknown>
    6b80:      	<unknown>
    6b84:      	<unknown>
    6b88:      	<unknown>
    6b8c:      	<unknown>
    6b90:      	fnmls	z21.h, p4/m, z27.h, z16.h
    6b94:      	<unknown>
    6b98:      	<unknown>
    6b9c:      	<unknown>
    6ba0:      	subhnt	z2.b, z10.h, z19.h
    6ba4:      	<unknown>
    6ba8:      	<unknown>
    6bac:      	<unknown>
    6bb0:      	<unknown>
    6bb4:      	<unknown>
    6bb8:      	subhnt	z2.b, z10.h, z19.h
    6bbc:      	<unknown>
    6bc0:      	fnmls	z19.h, p4/m, z2.h, z5.h
    6bc4:      	<unknown>
    6bc8:      	<unknown>
    6bcc:      	<unknown>
    6bd0:      	<unknown>
    6bd4:      	<unknown>
    6bd8:      	<unknown>
    6bdc:      	udf	#0x0
    6be0:      	udf	#0x6ad2
    6be4:      	udf	#0x0
    6be8:      	udf	#0x6ae0
    6bec:      	udf	#0x0
    6bf0:      	udf	#0x6af5
    6bf4:      	udf	#0x0
    6bf8:      	udf	#0x6b16
    6bfc:      	udf	#0x0
    6c00:      	udf	#0x6b37
    6c04:      	udf	#0x0
    6c08:      	udf	#0x6b4f
    6c0c:      	udf	#0x0
    6c10:      	udf	#0x6b67
    6c14:      	udf	#0x0
    6c18:      	udf	#0x6b7e
    6c1c:      	udf	#0x0
    6c20:      	udf	#0x6b97
    6c24:      	udf	#0x0
    6c28:      	udf	#0x6baf
    6c2c:      	udf	#0x0
    6c30:      	udf	#0x272c
    6c34:      	udf	#0x0
    6c38:      	udf	#0x275c
    6c3c:      	udf	#0x0
    6c40:      	udf	#0x2750
    6c44:      	udf	#0x0
    6c48:      	udf	#0x2764
    6c4c:      	udf	#0x0
    6c50:      	udf	#0x2750
    6c54:      	udf	#0x0
    6c58:      	udf	#0x2780
    6c5c:      	udf	#0x0
    6c60:      	udf	#0x2794
    6c64:      	udf	#0x0
    6c68:      	udf	#0x2750
    6c6c:      	udf	#0x0
    6c70:      	udf	#0x2808
    6c74:      	udf	#0x0
    6c78:      	udf	#0x2828
    6c7c:      	udf	#0x0
    6c80:      	udf	#0x2844
    6c84:      	udf	#0x0
    6c88:      	udf	#0x2854
    6c8c:      	udf	#0x0
    6c90:      	udf	#0x27c4
    6c94:      	udf	#0x0
    6c98:      	udf	#0x28b4
    6c9c:      	udf	#0x0
    6ca0:      	udf	#0x28dc
    6ca4:      	udf	#0x0
    6ca8:      	udf	#0x293c
    6cac:      	udf	#0x0
    6cb0:      	udf	#0x293c
    6cb4:      	udf	#0x0
    6cb8:      	udf	#0x2904
    6cbc:      	udf	#0x0
    6cc0:      	udf	#0x2914
    6cc4:      	udf	#0x0
    6cc8:      	udf	#0x293c
    6ccc:      	udf	#0x0
    6cd0:      	udf	#0x293c
    6cd4:      	udf	#0x0
    6cd8:      	udf	#0x293c
    6cdc:      	udf	#0x0
    6ce0:      	udf	#0x293c
    6ce4:      	udf	#0x0
    6ce8:      	udf	#0x293c
    6cec:      	udf	#0x0
    6cf0:      	udf	#0x293c
    6cf4:      	udf	#0x0
    6cf8:      	udf	#0x293c
    6cfc:      	udf	#0x0
    6d00:      	udf	#0x2954
    6d04:      	udf	#0x0
    6d08:      	<unknown>
    6d0c:      	<unknown>
    6d10:      	bc.lo	0x89798
    6d14:      	<unknown>
    6d18:      	ldnp	d23, d21, [x19, #-0x1f0]
    6d1c:      	stgp	x21, x25, [x11, #-0x400]
    6d20:      	fmul	z19.h, z3.h, z5.h[0]
    6d24:      	<unknown>
    6d28:      	<unknown>
    6d2c:      	<unknown>
    6d30:      	<unknown>
    6d34:      	sqshlu	v26.2d, v11.2d, #0x32
    6d38:      	fadd	z10.h, z0.h, z22.h
    6d3c:      	ldrh	w18, [x11, #0x1334]
    6d40:      	<unknown>
    6d44:      	<unknown>
    6d48:      	<unknown>
    6d4c:      	<unknown>
    6d50:      	bc.mi	0xad938
    6d54:      	<unknown>
    6d58:      	<unknown>
    6d5c:      	<unknown>
    6d60:      	<unknown>
    6d64:      	ldnp	s0, s9, [x9, #-0xe0]
    6d68:      	<unknown>
    6d6c:      	fcmla	v0.8h, v25.8h, v8.h[1], #270
    6d70:      	<unknown>
    6d74:      	<unknown>
    6d78:      	<unknown>
    6d7c:      	<unknown>
    6d80:      	<unknown>
    6d84:      	bc.lo	0x8980c
    6d88:      	<unknown>
    6d8c:      	<unknown>
    6d90:      	stgp	x5, x30, [x3, #-0x400]
    6d94:      	fmul	z19.h, z3.h, z5.h[0]
    6d98:      	<unknown>
    6d9c:      	<unknown>
    6da0:      	<unknown>
    6da4:      	<unknown>
    6da8:      	sqshlu	v26.2d, v11.2d, #0x32
    6dac:      	<unknown>
    6db0:      	<unknown>
    6db4:      	<unknown>
    6db8:      	<unknown>
    6dbc:      	<unknown>
    6dc0:      	subs	w0, w17, #0x95c, lsl #12 // =0x95c000
    6dc4:      	<unknown>
    6dc8:      	<unknown>
    6dcc:      	<unknown>
    6dd0:      	<unknown>
    6dd4:      	<unknown>
    6dd8:      	<unknown>
    6ddc:      	stgp	x5, x28, [x19, #-0x400]
    6de0:      	<unknown>
    6de4:      	<unknown>
    6de8:      	uabdl2	v0.4s, v17.8h, v1.8h
    6dec:      	<unknown>
    6df0:      	<unknown>
    6df4:      	ldpsw	x4, x25, [x10, #-0x50]
    6df8:      	stgp	x3, x25, [x11, #-0x400]
    6dfc:      	umlal2	v19.4s, v3.8h, v14.h[2]
    6e00:      	usubl2	v20.4s, v3.8h, v9.8h
    6e04:      	raddhn2	v0.8h, v25.4s, v15.4s
    6e08:      	<unknown>
    6e0c:      	<unknown>
    6e10:      	<unknown>
    6e14:      	cmpge	p5.b, p2/z, z19.b, #0x0
    6e18:      	<unknown>
    6e1c:      	<unknown>
    6e20:      	<unknown>
    6e24:      	<unknown>
    6e28:      	<unknown>
    6e2c:      	fnmls	z1.h, p2/m, z11.h, z12.h
    6e30:      	<unknown>
    6e34:      	stxrh	w0, w18, [x19]
    6e38:      	ldnp	d1, d27, [x19, #-0x1c0]
    6e3c:      	<unknown>
    6e40:      	<unknown>
    6e44:      	sel	p5.b, p12, p11.b, p0.b
    6e48:      	<unknown>
    6e4c:      	<unknown>
    6e50:      	ldpsw	x4, x28, [x3, #-0x88]
    6e54:      	<unknown>
    6e58:      	<unknown>
    6e5c:      	fnmls	z20.h, p0/m, z11.h, z20.h
    6e60:      	ldpsw	x0, x25, [x17, #-0xf8]
    6e64:      	<unknown>
    6e68:      	bic	w0, w9, w18, lsr #9
    6e6c:      	<unknown>
    6e70:      	<unknown>
    6e74:      	<unknown>
    6e78:      	<unknown>
    6e7c:      	<unknown>
    6e80:      	<unknown>
    6e84:      	fnmls	z20.h, p0/m, z11.h, z20.h
    6e88:      	bic	w0, w9, w1, lsr #9
    6e8c:      	<unknown>
    6e90:      	fnmla	z31.h, p1/m, z10.h, z22.h
    6e94:      	<unknown>
    6e98:      	<unknown>
    6e9c:      	<unknown>
    6ea0:      	ldnp	d19, d29, [x2, #-0x1f0]
    6ea4:      	<unknown>
    6ea8:      	<unknown>
    6eac:      	<unknown>
    6eb0:      	adr	x5, 0xf1d3f
    6eb4:      	<unknown>
    6eb8:      	bic	w5, w3, w26, lsl #29
    6ebc:      	<unknown>
    6ec0:      	ldp	d31, d16, [x26, #-0x110]
    6ec4:      	<unknown>
    6ec8:      	<unknown>
    6ecc:      	<unknown>
    6ed0:      	<unknown>
    6ed4:      	<unknown>
    6ed8:      	subs	w13, w19, #0x954, lsl #12 // =0x954000
    6edc:      	<unknown>
    6ee0:      	fnmls	z20.h, p6/m, z10.h, z16.h
    6ee4:      	ldeorh	w16, w26, [x1]
    6ee8:      	ldseth	w18, w5, [x1]
    6eec:      	<unknown>
    6ef0:      	<unknown>
    6ef4:      	subs	w2, w19, #0x954, lsl #12 // =0x954000
    6ef8:      	<unknown>
    6efc:      	<unknown>
    6f00:      	adr	x0, 0x47305
    6f04:      	orr	w24, w11, #0x3ff0000
    6f08:      	cmpgt	p8.b, p2/z, z19.b, #0x0
    6f0c:      	<unknown>
    6f10:      	<unknown>
    6f14:      	<unknown>
    6f18:      	<unknown>
    6f1c:      	<unknown>
    6f20:      	adr	x16, 0x51e25
    6f24:      	<unknown>
    6f28:      	<unknown>
    6f2c:      	<unknown>
    6f30:      	<unknown>
    6f34:      	<unknown>
    6f38:      	<unknown>
    6f3c:      	whilewr	p0.h, x1, x24
    6f40:      	bic	w16, w1, w24, lsr #13
    6f44:      	<unknown>
    6f48:      	<unknown>
    6f4c:      	<unknown>
    6f50:      	<unknown>
    6f54:      	<unknown>
    6f58:      	ldeorh	w16, w0, [x1]
    6f5c:      	ldseth	w20, w5, [x1]
    6f60:      	<unknown>
    6f64:      	<unknown>
    6f68:      	ssubwb	z1.h, z26.h, z19.b
    6f6c:      	<unknown>
    6f70:      	<unknown>
    6f74:      	fnmls	z19.h, p0/m, z11.h, z7.h
    6f78:      	<unknown>
    6f7c:      	<unknown>
    6f80:      	<unknown>
    6f84:      	fdot	z7.s, z11.b, z6.b[1]
    6f88:      	umin	v16.8h, v27.8h, v9.8h
    6f8c:      	<unknown>
    6f90:      	<unknown>
    6f94:      	<unknown>
    6f98:      	ldrh	w5, [x3], #-0xda
    6f9c:      	<unknown>
    6fa0:      	<unknown>
    6fa4:      	ldp	d15, d26, [x1, #-0x110]
    6fa8:      	fmls	z5.h, p3/m, z27.h, z10.h
    6fac:      	<unknown>
    6fb0:      	tbz	w19, #0x6, 0x959c <.text+0x859c>
    6fb4:      	<unknown>
    6fb8:      	<unknown>
    6fbc:      	sub	w5, w18, #0x7d3, lsl #12 // =0x7d3000
    6fc0:      	<unknown>
    6fc4:      	<unknown>
    6fc8:      	<unknown>
    6fcc:      	uaddwt	z13.h, z26.h, z4.b
    6fd0:      	<unknown>
    6fd4:      	strb	w13, [x2, #0xe4e]
    6fd8:      	<unknown>
    6fdc:      	strb	w13, [x3, #0xe4e]
    6fe0:      	<unknown>
    6fe4:      	ldpsw	x15, x29, [x3, #0xf8]
    6fe8:      	fnmls	z13.h, p0/m, z11.h, z7.h
    6fec:      	<unknown>
    6ff0:      	subs	w15, w11, w16, lsr #27
    6ff4:      	<unknown>
    6ff8:      	<unknown>
    6ffc:      	<unknown>
    7000:      	<unknown>
    7004:      	<unknown>
    7008:      	<unknown>
    700c:      	fcmne	p3.h, p0/z, z19.h, z4.h
    7010:      	<unknown>
    7014:      	uabdl	v13.4s, v3.4h, v12.4h
    7018:      	<unknown>
    701c:      	<unknown>
    7020:      	<unknown>
    7024:      	<unknown>
    7028:      	<unknown>
    702c:      	<unknown>
    7030:      	<unknown>
    7034:      	<unknown>
    7038:      	<unknown>
    703c:      	<unknown>
    7040:      	bic	w0, w9, w18, lsr #9
    7044:      	<unknown>
    7048:      	ldp	d31, d16, [x26, #-0x110]
    704c:      	<unknown>
    7050:      	<unknown>
    7054:      	<unknown>
    7058:      	fcvtxn2	v3.4s, v2.2d
    705c:      	<unknown>
    7060:      	<unknown>
    7064:      	<unknown>
    7068:      	ssubwb	z1.h, z26.h, z19.b
    706c:      	<unknown>
    7070:      	<unknown>
    7074:      	fnmls	z19.h, p0/m, z11.h, z7.h
    7078:      	<unknown>
    707c:      	<unknown>
    7080:      	<unknown>
    7084:      	fdot	z7.s, z11.b, z6.b[1]
    7088:      	umin	v16.8h, v27.8h, v9.8h
    708c:      	<unknown>
    7090:      	<unknown>
    7094:      	<unknown>
    7098:      	ldrh	w5, [x3], #-0xba
    709c:      	<unknown>
    70a0:      	<unknown>
    70a4:      	<unknown>
    70a8:      	adr	x14, 0x91c97
    70ac:      	<unknown>
    70b0:      	<unknown>
    70b4:      	fnmls	z1.h, p3/m, z19.h, z7.h
    70b8:      	<unknown>
    70bc:      	psel	p5, p8, p9.h[w14, 1]
    70c0:      	<unknown>
    70c4:      	bc.lo	0xab96c
    70c8:      	<unknown>
    70cc:      	<unknown>
    70d0:      	str	b7, [x11, #0x819]
    70d4:      	<unknown>
    70d8:      	<unknown>
    70dc:      	<unknown>
    70e0:      	<unknown>
    70e4:      	<unknown>
    70e8:      	<unknown>
    70ec:      	<unknown>
    70f0:      	<unknown>
    70f4:      	<unknown>
    70f8:      	adr	x14, 0xadce7
    70fc:      	<unknown>
    7100:      	<unknown>
    7104:      	ldnp	d6, d24, [x10, #-0x170]
    7108:      	<unknown>
    710c:      	fmls	z15.h, p0/m, z3.h, z4.h
    7110:      	<unknown>
    7114:      	<unknown>
    7118:      	ldrh	w20, [x3, #0x1a10]
    711c:      	<unknown>
    7120:      	<unknown>
    7124:      	<unknown>
    7128:      	<unknown>
    712c:      	<unknown>
    7130:      	<unknown>
    7134:      	bic	p2.b, p14/z, p11.b, p0.b
    7138:      	suqadd	v1.16b, v19.16b
    713c:      	<unknown>
    7140:      	ldnp	d1, d27, [x19, #-0x1c0]
    7144:      	<unknown>
    7148:      	ldp	s14, s27, [x27, #-0x90]
    714c:      	uabd	v19.8h, v3.8h, v1.8h
    7150:      	<unknown>
    7154:      	subs	w0, w17, #0x95c, lsl #12 // =0x95c000
    7158:      	<unknown>
    715c:      	whilewr	p0.h, x1, x24
    7160:      	bic	w16, w17, w24, lsr #12
    7164:      	<unknown>
    7168:      	<unknown>
    716c:      	<unknown>
    7170:      	<unknown>
    7174:      	<unknown>
    7178:      	fnmls	z5.h, p4/m, z11.h, z21.h
    717c:      	sqrdmlsh	z19.b, z3.b, z0.b
    7180:      	<unknown>
    7184:      	ldpsw	x15, x27, [x19, #-0xd0]
    7188:      	fnmls	z7.h, p5/m, z11.h, z18.h
    718c:      	fcmge	p4.h, p7/z, z27.h, z19.h
    7190:      	adr	x20, 0xe803e
    7194:      	and	p11.b, p13/z, p3.b, p0.b
    7198:      	<unknown>
    719c:      	smlalb	z19.h, z18.b, z31.b
    71a0:      	<unknown>
    71a4:      	usubwb	z20.h, z10.h, z16.b
    71a8:      	ldxrh	wzr, [x26]
    71ac:      	<unknown>
    71b0:      	smlalt	z16.h, z10.b, z5.b
    71b4:      	<unknown>
    71b8:      	<unknown>
    71bc:      	<unknown>
    71c0:      	stgp	x15, x19, [x18, #-0x400]
    71c4:      	umlal2	v19.4s, v3.8h, v14.h[2]
    71c8:      	umlal2	v20.4s, v3.8h, v6.h[2]
    71cc:      	fmls	z18.h, p0/m, z3.h, z4.h
    71d0:      	fnmls	z22.h, p2/m, z11.h, z3.h
    71d4:      	usubl2	v19.4s, v3.8h, v9.8h
    71d8:      	and	w0, w25, w19, lsr #20
    71dc:      	fcmla	v0.8h, v0.8h, v18.h[1], #180
    71e0:      	<unknown>
    71e4:      	<unknown>
    71e8:      	fnmls	z5.h, p4/m, z11.h, z21.h
    71ec:      	bic	p3.b, p13/z, p3.b, p0.b
    71f0:      	<unknown>
    71f4:      	<unknown>
    71f8:      	<unknown>
    71fc:      	<unknown>
    7200:      	<unknown>
    7204:      	<unknown>
    7208:      	umlsl2	v14.4s, v27.8h, v14.h[6]
    720c:      	<unknown>
    7210:      	<unknown>
    7214:      	<unknown>
    7218:      	<unknown>
    721c:      	<unknown>
    7220:      	usubwt	z2.h, z26.h, z18.b
    7224:      	usubwt	z17.h, z26.h, z19.b
    7228:      	<unknown>
    722c:      	<unknown>
    7230:      	<unknown>
    7234:      	umlal2	v23.4s, v3.8h, v3.h[2]
    7238:      	<unknown>
    723c:      	bfmul	z0.h, z1.h, z5.h[0]
    7240:      	<unknown>
    7244:      	<unknown>
    7248:      	fnmls	z0.h, p5/m, z1.h, z8.h
    724c:      	uabdl2	v0.4s, v17.8h, v1.8h
    7250:      	<unknown>
    7254:      	<unknown>
    7258:      	<unknown>
    725c:      	<unknown>
    7260:      	<unknown>
    7264:      	<unknown>
    7268:      	ldnp	s12, s25, [x11, #-0xe0]
    726c:      	whilewr	p0.h, x1, x24
    7270:      	cmpgt	p8.b, p2/z, z19.b, #0x0
    7274:      	<unknown>
    7278:      	<unknown>
    727c:      	ccmn	w18, w20, #0x5, pl
    7280:      	fmaxnmv	h0, p2, z1.h
    7284:      	ldp	s22, s20, [x27, #-0x98]
    7288:      	<unknown>
    728c:      	fnmla	z12.h, p6/m, z3.h, z6.h
    7290:      	<unknown>
    7294:      	<unknown>
    7298:      	<unknown>
    729c:      	ldr	x29, 0x47a40
    72a0:      	<unknown>
    72a4:      	ssubwb	z6.h, z18.h, z5.b
    72a8:      	cmpge	p9.b, p2/z, z17.b, #0x0
    72ac:      	suqadd	v1.16b, v19.16b
    72b0:      	<unknown>
    72b4:      	<unknown>
    72b8:      	umlal2	v8.4s, v3.8h, v2.h[3]
    72bc:      	<unknown>
    72c0:      	<unknown>
    72c4:      	<unknown>
    72c8:      	<unknown>
    72cc:      	<unknown>
    72d0:      	bic	w6, w11, w18, lsr #25
    72d4:      	uqxtn2	v0.8h, v0.4s
    72d8:      	<unknown>
    72dc:      	fcmeq	p5.h, p5/z, z3.h, z6.h
    72e0:      	<unknown>
    72e4:      	<unknown>
    72e8:      	<unknown>
    72ec:      	ldpsw	x3, x26, [x11, #-0x80]
    72f0:      	<unknown>
    72f4:      	<unknown>
    72f8:      	<unknown>
    72fc:      	fadd	z10.h, z0.h, z22.h
    7300:      	ldrh	w18, [x11, #0x1334]
    7304:      	<unknown>
    7308:      	<unknown>
    730c:      	<unknown>
    7310:      	<unknown>
    7314:      	<unknown>
    7318:      	<unknown>
    731c:      	<unknown>
    7320:      	uabdl2	v9.8h, v27.16b, v0.16b
    7324:      	stgp	x15, x29, [x3, #-0x400]
    7328:      	fcmla	z14.h, p0/m, z3.h, z1.h, #90
    732c:      	<unknown>
    7330:      	<unknown>
    7334:      	bic	w1, w3, w5, lsr #29
    7338:      	<unknown>
    733c:      	<unknown>
    7340:      	fnmls	z9.h, p4/m, z3.h, z9.h
    7344:      	stgp	x14, x29, [x3, #-0x400]
    7348:      	fmaxnmv	h19, p0, z3.h
    734c:      	fnmls	z22.h, p2/m, z11.h, z3.h
    7350:      	<unknown>
    7354:      	<unknown>
    7358:      	fnmls	z14.h, p1/m, z3.h, z15.h
    735c:      	<unknown>
    7360:      	<unknown>
    7364:      	<unknown>
    7368:      	<unknown>
    736c:      	<unknown>
    7370:      	<unknown>
    7374:      	ldpsw	x18, x25, [x10, #-0xe8]
    7378:      	<unknown>
    737c:      	<unknown>
    7380:      	<unknown>
    7384:      	<unknown>
    7388:      	<unknown>
    738c:      	<unknown>
    7390:      	<unknown>
    7394:      	fcmne	p2.h, p1/z, z11.h, z19.h
    7398:      	<unknown>
    739c:      	<unknown>
    73a0:      	<unknown>
    73a4:      	<unknown>
    73a8:      	ldnp	d0, d29, [x17, #-0x1f0]
    73ac:      	<unknown>
    73b0:      	<unknown>
    73b4:      	ldpsw	x18, x25, [x10, #-0xe8]
    73b8:      	<unknown>
    73bc:      	<unknown>
    73c0:      	<unknown>
    73c4:      	<unknown>
    73c8:      	<unknown>
    73cc:      	<unknown>
    73d0:      	<unknown>
    73d4:      	fcmne	p2.h, p1/z, z11.h, z19.h
    73d8:      	<unknown>
    73dc:      	<unknown>
    73e0:      	<unknown>
    73e4:      	<unknown>
    73e8:      	ldnp	d0, d29, [x17, #-0x1f0]
    73ec:      	<unknown>
    73f0:      	<unknown>
    73f4:      	<unknown>
    73f8:      	<unknown>
    73fc:      	<unknown>
    7400:      	fnmls	z9.h, p1/m, z27.h, z8.h
    7404:      	ldrh	w18, [x3, #0x1110]
    7408:      	sqshlu	v20.4s, v11.4s, #0x0
    740c:      	<unknown>
    7410:      	<unknown>
    7414:      	fcmla	v0.8h, v25.8h, v8.h[1], #270
    7418:      	<unknown>
    741c:      	<unknown>
    7420:      	<unknown>
    7424:      	whilewr	p8.h, x1, x24
    7428:      	<unknown>
    742c:      	<unknown>
    7430:      	ldpsw	x18, x25, [x10, #-0xe8]
    7434:      	<unknown>
    7438:      	<unknown>
    743c:      	<unknown>
    7440:      	fnmls	z6.h, p0/m, z11.h, z3.h
    7444:      	<unknown>
    7448:      	<unknown>
    744c:      	fmls	z12.h, p0/m, z1.h, z6.h
    7450:      	<unknown>
    7454:      	ldnp	d5, d20, [x27, #-0x1b0]
    7458:      	umlsl2	v5.4s, v27.8h, v4.h[3]
    745c:      	fmul	z18.h, z3.h, z5.h[0]
    7460:      	<unknown>
    7464:      	<unknown>
    7468:      	ldpsw	x22, x24, [x11, #-0xa0]
    746c:      	cmpge	p4.b, p2/z, z19.b, #0x0
    7470:      	eor	w1, w19, #0x7fff
    7474:      	adr	x5, 0xda0e3
    7478:      	<unknown>
    747c:      	<unknown>
    7480:      	<unknown>
    7484:      	ldnp	s1, s24, [x27, #-0xd8]
    7488:      	<unknown>
    748c:      	stnp	s0, s21, [x17, #-0x70]
    7490:      	<unknown>
    7494:      	fnmls	z20.h, p5/m, z11.h, z18.h
    7498:      	fnmls	z19.h, p1/m, z10.h, z12.h
    749c:      	<unknown>
    74a0:      	<unknown>
    74a4:      	uabdl2	v9.8h, v27.16b, v0.16b
    74a8:      	<unknown>
    74ac:      	<unknown>
    74b0:      	<unknown>
    74b4:      	<unknown>
    74b8:      	ldpsw	x3, x26, [x11, #-0x80]
    74bc:      	<unknown>
    74c0:      	fdot	z0.s, z9.b, z6.b[1]
    74c4:      	umin	v16.8h, v27.8h, v9.8h
    74c8:      	<unknown>
    74cc:      	<unknown>
    74d0:      	fcmne	p2.h, p1/z, z11.h, z19.h
    74d4:      	<unknown>
    74d8:      	<unknown>
    74dc:      	<unknown>
    74e0:      	<unknown>
    74e4:      	ldnp	d0, d29, [x17, #-0x1f0]
    74e8:      	<unknown>
    74ec:      	<unknown>
    74f0:      	adr	x20, 0x9219f
    74f4:      	adr	x13, 0xf811e
    74f8:      	ldpsw	x11, x29, [x3, #0x98]
    74fc:      	udf	#0x657a
    7500:      	<unknown>
    7504:      	<unknown>
    7508:      	<unknown>
    750c:      	fnmls	z6.h, p4/m, z18.h, z5.h
    7510:      	<unknown>
    7514:      	<unknown>
    7518:      	<unknown>
    751c:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    7520:      	<unknown>
    7524:      	<unknown>
    7528:      	<unknown>
    752c:      	<unknown>
    7530:      	<unknown>
    7534:      	fmaxnmv	h26, p0, z1.h
    7538:      	fnmls	z22.h, p2/m, z11.h, z3.h
    753c:      	<unknown>
    7540:      	stnp	s3, s14, [x19, #0x50]
    7544:      	uqshl	v0.8h, v1.8h, v5.8h
    7548:      	<unknown>
    754c:      	stnp	s5, s25, [x1, #0x50]
    7550:      	adr	x0, 0xf9fd7
    7554:      	fmul	z5.h, z3.h, z5.h[0]
    7558:      	<unknown>
    755c:      	<unknown>
    7560:      	ldeorh	w16, w2, [x2]
    7564:      	stnp	s5, s30, [x1, #0x50]
    7568:      	ldp	d0, d19, [x17, #-0xb0]
    756c:      	<unknown>
    7570:      	and	w5, w1, w10, lsl #25
    7574:      	<unknown>
    7578:      	<unknown>
    757c:      	<unknown>
    7580:      	stnp	s3, s14, [x19, #0x50]
    7584:      	uqshl	v0.8h, v1.8h, v5.8h
    7588:      	<unknown>
    758c:      	stnp	s5, s25, [x1, #0x50]
    7590:      	adr	x0, 0xfa017
    7594:      	fmul	z5.h, z3.h, z5.h[0]
    7598:      	<unknown>
    759c:      	<unknown>
    75a0:      	fmul	z8.h, z3.h, z5.h[0]
    75a4:      	st4	{ v10.b, v11.b, v12.b, v13.b }[11], [x0]
    75a8:      	fcmla	v1.8h, v3.8h, v16.h[2], #270
    75ac:      	<unknown>
    75b0:      	and	w5, w1, w10, lsl #25
    75b4:      	<unknown>
    75b8:      	<unknown>
    75bc:      	<unknown>
    75c0:      	stnp	s3, s14, [x19, #0x50]
    75c4:      	uqshl	v0.8h, v1.8h, v5.8h
    75c8:      	<unknown>
    75cc:      	stnp	s5, s25, [x1, #0x50]
    75d0:      	adr	x0, 0xfa057
    75d4:      	fmul	z5.h, z3.h, z5.h[0]
    75d8:      	<unknown>
    75dc:      	<unknown>
    75e0:      	fmul	z13.h, z3.h, z5.h[0]
    75e4:      	<unknown>
    75e8:      	<unknown>
    75ec:      	ldrh	w18, [x11, w4, uxtw]
    75f0:      	bic	w0, w9, w4, lsr #9
    75f4:      	<unknown>
    75f8:      	adr	x26, 0x919ff
    75fc:      	<unknown>
    7600:      	stnp	s3, s14, [x19, #0x50]
    7604:      	uqshl	v0.8h, v1.8h, v5.8h
    7608:      	<unknown>
    760c:      	stnp	s5, s25, [x1, #0x50]
    7610:      	adr	x0, 0xfa097
    7614:      	fmul	z5.h, z3.h, z5.h[0]
    7618:      	<unknown>
    761c:      	bfdot	z16.s, z11.h, z4.h[0]
    7620:      	ldeorh	w16, w18, [x3]
    7624:      	stnp	s5, s30, [x1, #0x50]
    7628:      	<unknown>
    762c:      	<unknown>
    7630:      	ldpsw	x5, x29, [x3, #0x98]
    7634:      	whilele	pn10.b, x11, x0, vlx4
    7638:      	<unknown>
    763c:      	fnmls	z9.h, p3/m, z18.h, z20.h
    7640:      	ldnp	d18, d29, [x19, #-0x1f0]
    7644:      	bic	w0, w9, w4, lsr #9
    7648:      	<unknown>
    764c:      	<unknown>
    7650:      	<unknown>
    7654:      	uabdl2	v16.4s, v18.8h, v9.8h
    7658:      	<unknown>
    765c:      	<unknown>
    7660:      	<unknown>
    7664:      	uqshl	v1.2d, v3.2d, #0x29
    7668:      	eor	p14.b, p12/z, p11.b, p0.b
    766c:      	<unknown>
    7670:      	fmaxnmv	h19, p0, z2.h
    7674:      	fnmls	z22.h, p2/m, z11.h, z3.h
    7678:      	<unknown>
    767c:      	stnp	s3, s14, [x19, #0x50]
    7680:      	uqshl	v0.8h, v1.8h, v5.8h
    7684:      	<unknown>
    7688:      	stnp	s5, s25, [x1, #0x50]
    768c:      	adr	x0, 0xfa113
    7690:      	fmul	z5.h, z3.h, z5.h[0]
    7694:      	<unknown>
    7698:      	<unknown>
    769c:      	ldeorh	w16, w2, [x2]
    76a0:      	stnp	s5, s30, [x1, #0x50]
    76a4:      	ldp	d0, d19, [x17, #-0xb0]
    76a8:      	<unknown>
    76ac:      	and	w5, w1, w10, lsl #25
    76b0:      	<unknown>
    76b4:      	<unknown>
    76b8:      	ldpsw	x4, x25, [x10, #-0x50]
    76bc:      	<unknown>
    76c0:      	<unknown>
    76c4:      	<unknown>
    76c8:      	<unknown>
    76cc:      	fmul	z8.h, z3.h, z5.h[0]
    76d0:      	b.ge	0x47c50
    76d4:      	<unknown>
    76d8:      	stnp	s5, s25, [x1, #0x50]
    76dc:      	bfdot	z0.s, z17.h, z3.h[0]
    76e0:      	<unknown>
    76e4:      	strh	w16, [x1, x5, lsl #1]
    76e8:      	sqsub	v10.16b, v0.16b, v0.16b
    76ec:      	<unknown>
    76f0:      	fmul	z7.h, z3.h, z5.h[0]
    76f4:      	<unknown>
    76f8:      	fcmne	p3.h, p0/z, z19.h, z4.h
    76fc:      	<unknown>
    7700:      	ldpsw	x3, x18, [x11, #-0x90]
    7704:      	<unknown>
    7708:      	adr	x3, 0xda557
    770c:      	<unknown>
    7710:      	<unknown>
    7714:      	<unknown>
    7718:      	<unknown>
    771c:      	<unknown>
    7720:      	<unknown>
    7724:      	fcmla	v9.8h, v3.8h, v20.h[1], #270
    7728:      	ldurh	w18, [x27, #0x57]
    772c:      	<unknown>
    7730:      	<unknown>
    7734:      	<unknown>
    7738:      	<unknown>
    773c:      	<unknown>
    7740:      	fcmla	v9.8h, v3.8h, v20.h[1], #270
    7744:      	<unknown>
    7748:      	fcmne	p3.h, p0/z, z19.h, z4.h
    774c:      	<unknown>
    7750:      	fnmla	z3.h, p1/m, z19.h, z18.h
    7754:      	raddhn2	v5.8h, v27.4s, v15.4s
    7758:      	<unknown>
    775c:      	<unknown>
    7760:      	<unknown>
    7764:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    7768:      	<unknown>
    776c:      	<unknown>
    7770:      	<unknown>
    7774:      	<unknown>
    7778:      	<unknown>
    777c:      	<unknown>
    7780:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    7784:      	<unknown>
    7788:      	<unknown>
    778c:      	ldpsw	x4, x28, [x3, #-0x88]
    7790:      	fcmeq	p14.h, p5/z, z3.h, z4.h
    7794:      	ldpsw	x19, x24, [x27, #-0x70]
    7798:      	<unknown>
    779c:      	ldnp	d20, d24, [x10, #-0x1e0]
    77a0:      	<unknown>
    77a4:      	<unknown>
    77a8:      	<unknown>
    77ac:      	<unknown>
    77b0:      	<unknown>
    77b4:      	<unknown>
    77b8:      	<unknown>
    77bc:      	ldpsw	x4, x25, [x10, #-0x50]
    77c0:      	fcmeq	p3.h, p1/z, z11.h, z4.h
    77c4:      	ldpsw	x19, x24, [x27, #-0x70]
    77c8:      	<unknown>
    77cc:      	<unknown>
    77d0:      	<unknown>
    77d4:      	<unknown>
    77d8:      	<unknown>
    77dc:      	<unknown>
    77e0:      	<unknown>
    77e4:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    77e8:      	<unknown>
    77ec:      	uqshl	v9.2d, v3.2d, #0x3
    77f0:      	<unknown>
    77f4:      	<unknown>
    77f8:      	ldnp	d20, d24, [x10, #-0x1e0]
    77fc:      	<unknown>
    7800:      	umlal2	v26.4s, v1.8h, v3.h[0]
    7804:      	<unknown>
    7808:      	<unknown>
    780c:      	ldnp	d20, d24, [x10, #-0x1e0]
    7810:      	<unknown>
    7814:      	uqshl	v21.4s, v3.4s, #0x0
    7818:      	fcmeq	p6.h, p0/z, z3.h, #0.0
    781c:      	<unknown>
    7820:      	bic	w3, w11, w19, lsr #25
    7824:      	<unknown>
    7828:      	<unknown>
    782c:      	<unknown>
    7830:      	<unknown>
    7834:      	ldpsw	x15, x27, [x19, #-0xd0]
    7838:      	<unknown>
    783c:      	<unknown>
    7840:      	umlal2	v26.4s, v1.8h, v3.h[0]
    7844:      	<unknown>
    7848:      	<unknown>
    784c:      	<unknown>
    7850:      	<unknown>
    7854:      	<unknown>
    7858:      	<unknown>
    785c:      	<unknown>
    7860:      	<unknown>
    7864:      	<unknown>
    7868:      	<unknown>
    786c:      	<unknown>
    7870:      	<unknown>
    7874:      	fcmeq	p9.h, p1/z, z27.h, z4.h
    7878:      	ldpsw	x19, x24, [x27, #-0x70]
    787c:      	<unknown>
    7880:      	<unknown>
    7884:      	<unknown>
    7888:      	<unknown>
    788c:      	<unknown>
    7890:      	<unknown>
    7894:      	<unknown>
    7898:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    789c:      	<unknown>
    78a0:      	<unknown>
    78a4:      	<unknown>
    78a8:      	<unknown>
    78ac:      	b.al	0xe6578
    78b0:      	fnmls	z1.h, p0/m, z19.h, z12.h
    78b4:      	<unknown>
    78b8:      	<unknown>
    78bc:      	ldnp	d20, d24, [x10, #-0x1e0]
    78c0:      	<unknown>
    78c4:      	uqshl	v21.4s, v3.4s, #0x0
    78c8:      	fcmeq	p6.h, p0/z, z3.h, #0.0
    78cc:      	<unknown>
    78d0:      	bic	w3, w11, w19, lsr #25
    78d4:      	<unknown>
    78d8:      	<unknown>
    78dc:      	<unknown>
    78e0:      	<unknown>
    78e4:      	<unknown>
    78e8:      	fnmls	z6.h, p0/m, z11.h, z3.h
    78ec:      	<unknown>
    78f0:      	<unknown>
    78f4:      	<unknown>
    78f8:      	<unknown>
    78fc:      	<unknown>
    7900:      	<unknown>
    7904:      	<unknown>
    7908:      	<unknown>
    790c:      	<unknown>
    7910:      	<unknown>
    7914:      	<unknown>
    7918:      	ldp	s14, s25, [x19, #-0x88]
    791c:      	<unknown>
    7920:      	<unknown>
    7924:      	fcmeq	p3.h, p1/z, z11.h, z4.h
    7928:      	ldpsw	x19, x24, [x27, #-0x70]
    792c:      	<unknown>
    7930:      	<unknown>
    7934:      	<unknown>
    7938:      	<unknown>
    793c:      	<unknown>
    7940:      	<unknown>
    7944:      	<unknown>
    7948:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    794c:      	<unknown>
    7950:      	<unknown>
    7954:      	ldpsw	x4, x28, [x3, #-0x88]
    7958:      	fcmeq	p14.h, p5/z, z3.h, z4.h
    795c:      	ldpsw	x19, x24, [x27, #-0x70]
    7960:      	<unknown>
    7964:      	ldnp	d20, d24, [x10, #-0x1e0]
    7968:      	<unknown>
    796c:      	adr	x26, 0x91d73
    7970:      	ldnp	d20, d24, [x10, #-0x1e0]
    7974:      	<unknown>
    7978:      	uqshl	v21.4s, v3.4s, #0x0
    797c:      	fcmeq	p6.h, p0/z, z3.h, #0.0
    7980:      	<unknown>
    7984:      	bic	w3, w11, w19, lsr #25
    7988:      	<unknown>
    798c:      	<unknown>
    7990:      	<unknown>
    7994:      	<unknown>
    7998:      	<unknown>
    799c:      	adr	x3, 0xda7eb
    79a0:      	<unknown>
    79a4:      	umlsl2	v12.4s, v11.8h, v9.h[3]
    79a8:      	<unknown>
    79ac:      	<unknown>
    79b0:      	<unknown>
    79b4:      	<unknown>
    79b8:      	<unknown>
    79bc:      	<unknown>
    79c0:      	<unknown>
    79c4:      	sqshlu	v18.2d, v10.2d, #0x33
    79c8:      	fnmls	z21.h, p4/m, z19.h, z3.h
    79cc:      	cmpgt	p3.b, p2/z, z19.b, #0x0
    79d0:      	<unknown>
    79d4:      	<unknown>
    79d8:      	<unknown>
    79dc:      	<unknown>
    79e0:      	<unknown>
    79e4:      	eor	w15, w19, #0x3ffffff
    79e8:      	<unknown>
    79ec:      	<unknown>
    79f0:      	sqshrnb	z14.s, z1.d, #0x10
    79f4:      	<unknown>
    79f8:      	<unknown>
    79fc:      	<unknown>
    7a00:      	<unknown>
    7a04:      	<unknown>
    7a08:      	<unknown>
    7a0c:      	<unknown>
    7a10:      	<unknown>
    7a14:      	<unknown>
    7a18:      	<unknown>
    7a1c:      	<unknown>
    7a20:      	<unknown>
    7a24:      	<unknown>
    7a28:      	<unknown>
    7a2c:      	fnmls	z13.h, p1/m, z11.h, z20.h
    7a30:      	<unknown>
    7a34:      	<unknown>
    7a38:      	fcmeq	p5.h, p5/z, z19.h, z4.h
    7a3c:      	<unknown>
    7a40:      	uqshl	v9.2d, v3.2d, #0x3
    7a44:      	<unknown>
    7a48:      	<unknown>
    7a4c:      	<unknown>
    7a50:      	<unknown>
    7a54:      	<unknown>
    7a58:      	<unknown>
    7a5c:      	sqshlu	v18.2d, v10.2d, #0x33
    7a60:      	fnmls	z21.h, p4/m, z19.h, z3.h
    7a64:      	cmpgt	p3.b, p2/z, z19.b, #0x0
    7a68:      	<unknown>
    7a6c:      	ldpsw	x15, x27, [x19, #-0xd0]
    7a70:      	<unknown>
    7a74:      	<unknown>
    7a78:      	fmlalb	z19.h, z27.b, z5.b[2]
    7a7c:      	<unknown>
    7a80:      	uqshl	v21.4s, v3.4s, #0x0
    7a84:      	fcmeq	p6.h, p0/z, z3.h, #0.0
    7a88:      	<unknown>
    7a8c:      	bic	w3, w11, w19, lsr #25
    7a90:      	<unknown>
    7a94:      	<unknown>
    7a98:      	<unknown>
    7a9c:      	<unknown>
    7aa0:      	fcmne	p4.h, p4/z, z19.h, z4.h
    7aa4:      	ldpsw	x19, x24, [x27, #-0x70]
    7aa8:      	<unknown>
    7aac:      	<unknown>
    7ab0:      	fmaxnmv	h26, p0, z1.h
    7ab4:      	<unknown>
    7ab8:      	<unknown>
    7abc:      	<unknown>
    7ac0:      	<unknown>
    7ac4:      	sqshlu	v18.2d, v10.2d, #0x33
    7ac8:      	fnmls	z21.h, p4/m, z19.h, z3.h
    7acc:      	<unknown>
    7ad0:      	fcmne	p3.h, p0/z, z19.h, z4.h
    7ad4:      	<unknown>
    7ad8:      	ldpsw	x3, x18, [x11, #-0x90]
    7adc:      	<unknown>
    7ae0:      	<unknown>
    7ae4:      	<unknown>
    7ae8:      	<unknown>
    7aec:      	<unknown>
    7af0:      	<unknown>
    7af4:      	<unknown>
    7af8:      	<unknown>
    7afc:      	<unknown>
    7b00:      	<unknown>
    7b04:      	<unknown>
    7b08:      	<unknown>
    7b0c:      	fcmla	v9.8h, v3.8h, v20.h[1], #270
    7b10:      	<unknown>
    7b14:      	st3	{ v1.h, v2.h, v3.h }[7], [x11]
    7b18:      	<unknown>
    7b1c:      	ldnp	d25, d16, [x11, #-0x140]
    7b20:      	<unknown>
    7b24:      	<unknown>
    7b28:      	<unknown>
    7b2c:      	<unknown>
    7b30:      	<unknown>
    7b34:      	<unknown>
    7b38:      	ldpsw	x8, x16, [x9, #-0xa0]
    7b3c:      	fnmls	z7.h, p3/m, z19.h, z13.h
    7b40:      	<unknown>
    7b44:      	ldnp	d0, d10, [x1, #0x10]
    7b48:      	ldp	d9, d25, [x27, #-0x120]
    7b4c:      	<unknown>
    7b50:      	stp	w13, w8, [x1, #-0x78]
    7b54:      	str	b9, [x1, #0xf48]
    7b58:      	eor	w0, w1, #0x1fff
    7b5c:      	adr	x5, 0xe078a
    7b60:      	<unknown>
    7b64:      	adr	x0, 0x4832a
    7b68:      	<unknown>
    7b6c:      	<unknown>
    7b70:      	<unknown>
    7b74:      	stnp	w1, w15, [x9, #-0x100]
    7b78:      	ldpsw	x8, x29, [x17, #-0x88]
    7b7c:      	stp	w4, w8, [x3, #-0xb0]
    7b80:      	<unknown>
    7b84:      	<unknown>
    7b88:      	ldpsw	x3, x24, [x11, #-0x60]
    7b8c:      	ldpsw	x15, x27, [x19, #0x98]
    7b90:      	<unknown>
    7b94:      	adr	x29, 0x57f99
    7b98:      	<unknown>
    7b9c:      	<unknown>
    7ba0:      	<unknown>
    7ba4:      	<unknown>
    7ba8:      	<unknown>
    7bac:      	stnp	w0, w11, [x9, #-0x100]
    7bb0:      	bc.pl	0xa44d8
    7bb4:      	<unknown>
    7bb8:      	fnmls	z21.h, p1/m, z19.h, z6.h
    7bbc:      	<unknown>
    7bc0:      	udf	#0x2931
    7bc4:      	udf	#0x0
    7bc8:      	udf	#0x48a4
    7bcc:      	udf	#0x0
    7bd0:      	udf	#0x492c
    7bd4:      	udf	#0x0
    7bd8:      	udf	#0x4824
    7bdc:      	udf	#0x0
    7be0:      	udf	#0x4864
    7be4:      	udf	#0x0
    7be8:      	udf	#0x492c
    7bec:      	udf	#0x0
    7bf0:      	udf	#0x492c
    7bf4:      	udf	#0x0
    7bf8:      	udf	#0x48a4
    7bfc:      	udf	#0x0
    7c00:      	udf	#0x492c
    7c04:      	udf	#0x0
    7c08:      	udf	#0x492c
    7c0c:      	udf	#0x0
    7c10:      	udf	#0x492c
    7c14:      	udf	#0x0
    7c18:      	udf	#0x492c
    7c1c:      	udf	#0x0
    7c20:      	udf	#0x492c
    7c24:      	udf	#0x0
    7c28:      	udf	#0x492c
    7c2c:      	udf	#0x0
    7c30:      	udf	#0x492c
    7c34:      	udf	#0x0
    7c38:      	udf	#0x492c
    7c3c:      	udf	#0x0
    7c40:      	udf	#0x4864
    7c44:      	udf	#0x0
    7c48:      	udf	#0x492c
    7c4c:      	udf	#0x0
    7c50:      	udf	#0x4900
    7c54:      	udf	#0x0
    7c58:      	udf	#0x48a4
    7c5c:      	udf	#0x0
    7c60:      	udf	#0x48a4
    7c64:      	udf	#0x0
    7c68:      	udf	#0x4864
    7c6c:      	udf	#0x0
    7c70:      	udf	#0x492c
    7c74:      	udf	#0x0
    7c78:      	udf	#0x492c
    7c7c:      	udf	#0x0
    7c80:      	udf	#0x4864
    7c84:      	udf	#0x0
    7c88:      	<unknown>
    7c8c:      	<unknown>
    7c90:      	<unknown>
    7c94:      	<unknown>
    7c98:      	str	b20, [x3, #0x848]
    7c9c:      	<unknown>
    7ca0:      	<unknown>
    7ca4:      	adr	x10, 0x481c9
    7ca8:      	<unknown>
    7cac:      	ldurb	w8, [x10, #-0xdc]
    7cb0:      	<unknown>
    7cb4:      	<unknown>
    7cb8:      	<unknown>
    7cbc:      	fnmls	z1.h, p4/m, z19.h, z11.h
    7cc0:      	str	b18, [x3, #0xf08]
    7cc4:      	<unknown>
    7cc8:      	<unknown>
    7ccc:      	uabdl2	v20.4s, v19.8h, v9.8h
    7cd0:      	<unknown>
    7cd4:      	<unknown>
    7cd8:      	<unknown>
    7cdc:      	<unknown>
    7ce0:      	fnmls	z1.h, p4/m, z3.h, z16.h
    7ce4:      	<unknown>
    7ce8:      	<unknown>
    7cec:      	<unknown>
    7cf0:      	<unknown>
    7cf4:      	umlal2	v8.4s, v1.8h, v6.h[7]
    7cf8:      	orn	w9, w3, w0, lsl #25
    7cfc:      	stp	w9, w8, [x1, #-0x80]
    7d00:      	<unknown>
    7d04:      	<unknown>
    7d08:      	<unknown>
    7d0c:      	<unknown>
    7d10:      	<unknown>
    7d14:      	str	b20, [x3, x0]
    7d18:      	adr	x29, 0x5811d
    7d1c:      	<unknown>
    7d20:      	<unknown>
    7d24:      	<unknown>
    7d28:      	<unknown>
    7d2c:      	<unknown>
    7d30:      	stnp	w0, w11, [x9, #-0x100]
    7d34:      	bc.pl	0xa465c
    7d38:      	<unknown>
    7d3c:      	<unknown>
    7d40:      	adds	w0, w25, #0x80a
    7d44:      	mla	v9.8h, v1.8h, v3.h[0]
    7d48:      	fcmne	p0.h, p6/z, z11.h, z13.h
    7d4c:      	<unknown>
    7d50:      	<unknown>
    7d54:      	stnp	w14, w24, [x25]
    7d58:      	<unknown>
    7d5c:      	stp	s20, s26, [x3, #-0x100]
    7d60:      	<unknown>
    7d64:      	stnp	w28, w15, [x9, #-0x100]
    7d68:      	<unknown>
    7d6c:      	<unknown>
    7d70:      	<unknown>
    7d74:      	<unknown>
    7d78:      	<unknown>
    7d7c:      	<unknown>
    7d80:      	<unknown>
    7d84:      	<unknown>
    7d88:      	ldpsw	x5, x28, [x27, #-0x60]
    7d8c:      	ldpsw	x14, x24, [x11, #-0x60]
    7d90:      	<unknown>
    7d94:      	<unknown>
    7d98:      	<unknown>
    7d9c:      	<unknown>
    7da0:      	<unknown>
    7da4:      	<unknown>
    7da8:      	adr	x29, 0x581ad
    7dac:      	<unknown>
    7db0:      	<unknown>
    7db4:      	<unknown>
    7db8:      	<unknown>
    7dbc:      	<unknown>
    7dc0:      	stnp	w0, w11, [x9, #-0x100]
    7dc4:      	bc.pl	0xa46ec
    7dc8:      	umlal2	v14.4s, v10.8h, v3.h[5]
    7dcc:      	fnmls	z21.h, p4/m, z19.h, z3.h
    7dd0:      	<unknown>
    7dd4:      	<unknown>
    7dd8:      	<unknown>
    7ddc:      	ldpsw	x5, x25, [x3, #0x60]
    7de0:      	<unknown>
    7de4:      	<unknown>
    7de8:      	<unknown>
    7dec:      	<unknown>
    7df0:      	ldpsw	x18, x25, [x3, #0x60]
    7df4:      	<unknown>
    7df8:      	stnp	w29, w8, [x1, #-0xc0]
    7dfc:      	<unknown>
    7e00:      	<unknown>
    7e04:      	st1	{ v16.4s, v17.4s, v18.4s, v19.4s }, [x9]
    7e08:      	ldp	s9, s28, [x27, #-0x60]
    7e0c:      	<unknown>
    7e10:      	uqshl	v11.8h, v3.8h, v9.8h
    7e14:      	str	b11, [x3, #0x848]
    7e18:      	<unknown>
    7e1c:      	<unknown>
    7e20:      	adr	x10, 0x48345
    7e24:      	mla	v9.8h, v1.8h, v14.h[0]
    7e28:      	<unknown>
    7e2c:      	stnp	w29, w8, [x1, #-0xc0]
    7e30:      	<unknown>
    7e34:      	<unknown>
    7e38:      	<unknown>
    7e3c:      	<unknown>
    7e40:      	<unknown>
    7e44:      	<unknown>
    7e48:      	<unknown>
    7e4c:      	<unknown>
    7e50:      	ldnp	d2, d29, [x10, #-0x170]
    7e54:      	<unknown>
    7e58:      	<unknown>
    7e5c:      	ldp	d9, d27, [x11, #-0xb0]
    7e60:      	<unknown>
    7e64:      	ldpsw	x5, x25, [x3, #0x60]
    7e68:      	fcmne	p3.h, p5/z, z3.h, z12.h
    7e6c:      	<unknown>
    7e70:      	<unknown>
    7e74:      	<unknown>
    7e78:      	str	b4, [x3, #0x848]
    7e7c:      	<unknown>
    7e80:      	<unknown>
    7e84:      	adr	x10, 0x483a9
    7e88:      	<unknown>
    7e8c:      	umax	v20.8h, v11.8h, v18.8h
    7e90:      	<unknown>
    7e94:      	ldpsw	x19, x25, [x11, #0x60]
    7e98:      	<unknown>
    7e9c:      	<unknown>
    7ea0:      	<unknown>
    7ea4:      	<unknown>
    7ea8:      	<unknown>
    7eac:      	ldnp	s5, s24, [x11, #-0xe0]
    7eb0:      	<unknown>
    7eb4:      	<unknown>
    7eb8:      	smlal2	v8.4s, v1.8h, v2.h[4]
    7ebc:      	<unknown>
    7ec0:      	adr	x14, 0x583e9
    7ec4:      	stp	w29, w15, [x9, #-0x78]
    7ec8:      	<unknown>
    7ecc:      	<unknown>
    7ed0:      	<unknown>
    7ed4:      	<unknown>
    7ed8:      	<unknown>
    7edc:      	fnmls	z14.h, p3/m, z26.h, z4.h
    7ee0:      	ldpsw	x9, x27, [x18, #0x60]
    7ee4:      	stnp	w19, w29, [x3, #-0x100]
    7ee8:      	<unknown>
    7eec:      	ldpsw	x12, x8, [x1, #0x60]
    7ef0:      	<unknown>
    7ef4:      	smlal2	v8.4s, v1.8h, v2.h[4]
    7ef8:      	<unknown>
    7efc:      	adr	x14, 0x58425
    7f00:      	stp	w29, w15, [x9, #-0x78]
    7f04:      	<unknown>
    7f08:      	<unknown>
    7f0c:      	<unknown>
    7f10:      	<unknown>
    7f14:      	<unknown>
    7f18:      	fnmls	z14.h, p3/m, z26.h, z4.h
    7f1c:      	ldpsw	x9, x27, [x18, #0x60]
    7f20:      	stnp	w19, w29, [x3, #-0x100]
    7f24:      	<unknown>
    7f28:      	umlal2	v12.4s, v1.8h, v14.h[0]
    7f2c:      	<unknown>
    7f30:      	smlal2	v8.4s, v1.8h, v2.h[4]
    7f34:      	<unknown>
    7f38:      	adds	w14, w10, #0xa0a
    7f3c:      	stp	w29, w15, [x9, #-0x78]
    7f40:      	<unknown>
    7f44:      	<unknown>
    7f48:      	<unknown>
    7f4c:      	<unknown>
    7f50:      	<unknown>
    7f54:      	fnmls	z14.h, p3/m, z26.h, z4.h
    7f58:      	ldpsw	x9, x27, [x18, #0x60]
    7f5c:      	stnp	w19, w29, [x3, #-0x100]
    7f60:      	<unknown>
    7f64:      	<unknown>
    7f68:      	ldpsw	x12, x8, [x1, #0x60]
    7f6c:      	fcmne	p3.h, p5/z, z3.h, z8.h
    7f70:      	<unknown>
    7f74:      	smlal2	v8.4s, v1.8h, v2.h[4]
    7f78:      	<unknown>
    7f7c:      	adr	x14, 0x584a5
    7f80:      	stp	w29, w15, [x9, #-0x78]
    7f84:      	<unknown>
    7f88:      	<unknown>
    7f8c:      	<unknown>
    7f90:      	<unknown>
    7f94:      	<unknown>
    7f98:      	fnmls	z14.h, p3/m, z26.h, z4.h
    7f9c:      	ldpsw	x9, x27, [x18, #0x60]
    7fa0:      	stnp	w19, w29, [x3, #-0x100]
    7fa4:      	<unknown>
    7fa8:      	<unknown>
    7fac:      	<unknown>
    7fb0:      	sqshlu	v19.2d, v10.2d, #0x23
    7fb4:      	<unknown>
    7fb8:      	ldnp	s20, s28, [x19, #-0x38]
    7fbc:      	<unknown>
    7fc0:      	uaddwt	z15.h, z26.h, z12.b
    7fc4:      	stnp	w1, w19, [x18, #-0xb8]
    7fc8:      	adds	w17, w9, #0xf4f
    7fcc:      	<unknown>
    7fd0:      	<unknown>
    7fd4:      	subhnb	z9.b, z27.h, z20.h
    7fd8:      	ldrh	w13, [x3, #0x1a38]
    7fdc:      	<unknown>
    7fe0:      	ldp	w20, w28, [x19, #-0x38]
    7fe4:      	<unknown>
    7fe8:      	<unknown>
    7fec:      	umin	v9.4h, v19.4h, v7.4h
    7ff0:      	stnp	w3, w0, [x3, #-0xc0]
    7ff4:      	bc.pl	0xa491c
    7ff8:      	<unknown>
    7ffc:      	uabdl2	v20.4s, v19.8h, v9.8h
    8000:      	<unknown>
    8004:      	adr	x16, 0x68f09
    8008:      	adr	x16, 0x6860d
    800c:      	<unknown>
    8010:      	adr	x29, 0x487b5
    8014:      	<unknown>
    8018:      	<unknown>
    801c:      	fmaxnmv	h9, p0, z1.h
    8020:      	uabd	v19.8h, v3.8h, v9.8h
    8024:      	uqshl	v1.2d, v3.2d, #0x29
    8028:      	<unknown>
    802c:      	adr	x16, 0x68f31
    8030:      	adr	x16, 0x68635
    8034:      	<unknown>
    8038:      	adr	x29, 0x487dd
    803c:      	<unknown>
    8040:      	<unknown>
    8044:      	umlal2	v9.4s, v1.8h, v3.h[1]
    8048:      	fnmls	z21.h, p4/m, z19.h, z3.h
    804c:      	adr	x0, 0x48511
    8050:      	adr	x24, 0x6865d
    8054:      	adr	x16, 0x68659
    8058:      	str	b17, [x9, #0x80a]
    805c:      	<unknown>
    8060:      	<unknown>
    8064:      	<unknown>
    8068:      	<unknown>
    806c:      	<unknown>
    8070:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8074:      	orn	w9, w3, w0, lsl #25
    8078:      	stp	w9, w8, [x1, #-0x80]
    807c:      	<unknown>
    8080:      	<unknown>
    8084:      	str	b5, [x3, #0x848]
    8088:      	<unknown>
    808c:      	<unknown>
    8090:      	adr	x10, 0x485b5
    8094:      	stnp	w9, w10, [x9]
    8098:      	<unknown>
    809c:      	<unknown>
    80a0:      	stnp	w28, w15, [x9, #-0x100]
    80a4:      	<unknown>
    80a8:      	ldpsw	x4, x23, [x27, #0x30]
    80ac:      	<unknown>
    80b0:      	ldpsw	x20, x16, [x19, #-0x58]
    80b4:      	adr	x12, 0xc6d42
    80b8:      	<unknown>
    80bc:      	<unknown>
    80c0:      	ldpsw	x13, x21, [x11, #-0x90]
    80c4:      	fnmls	z3.h, p3/m, z27.h, z4.h
    80c8:      	ldpsw	x19, x29, [x2, #-0x70]
    80cc:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    80d0:      	<unknown>
    80d4:      	stnp	w9, w10, [x9]
    80d8:      	<unknown>
    80dc:      	<unknown>
    80e0:      	adr	x1, 0x48885
    80e4:      	<unknown>
    80e8:      	<unknown>
    80ec:      	<unknown>
    80f0:      	<unknown>
    80f4:      	<unknown>
    80f8:      	<unknown>
    80fc:      	fnmls	z9.h, p3/m, z18.h, z20.h
    8100:      	ldnp	d18, d27, [x19, #-0x1f0]
    8104:      	fnmls	z19.h, p0/m, z10.h, z6.h
    8108:      	ldpsw	x19, x29, [x2, #-0x70]
    810c:      	sqshlu	v14.2d, v27.2d, #0xe
    8110:      	sqshl	v19.2d, v2.2d, #0x32
    8114:      	ldnp	d22, d25, [x11, #-0xe0]
    8118:      	stnp	w1, w28, [x3, #-0x100]
    811c:      	<unknown>
    8120:      	<unknown>
    8124:      	ldnp	s9, s27, [x27, #-0x90]
    8128:      	<unknown>
    812c:      	<unknown>
    8130:      	<unknown>
    8134:      	adds	w8, w10, #0x490, lsl #12 // =0x490000
    8138:      	stp	w22, w8, [x1, #-0xb0]
    813c:      	<unknown>
    8140:      	<unknown>
    8144:      	<unknown>
    8148:      	fcmeq	p3.h, p1/z, z11.h, z12.h
    814c:      	<unknown>
    8150:      	stnp	w17, w10, [x9]
    8154:      	<unknown>
    8158:      	str	b20, [x3, x0]
    815c:      	<unknown>
    8160:      	<unknown>
    8164:      	<unknown>
    8168:      	<unknown>
    816c:      	ldnp	d2, d29, [x10, #-0x170]
    8170:      	<unknown>
    8174:      	<unknown>
    8178:      	ldp	d9, d27, [x11, #-0xb0]
    817c:      	<unknown>
    8180:      	<unknown>
    8184:      	uabdl2	v20.4s, v19.8h, v9.8h
    8188:      	uqshl	v7.8h, v3.8h, v5.8h
    818c:      	ldp	w7, w29, [x3, #-0xc0]
    8190:      	<unknown>
    8194:      	<unknown>
    8198:      	<unknown>
    819c:      	stp	w29, w8, [x1, #-0x80]
    81a0:      	umlal2	v0.4s, v0.8h, v3.h[4]
    81a4:      	fcmne	p0.h, p6/z, z11.h, z12.h
    81a8:      	<unknown>
    81ac:      	<unknown>
    81b0:      	fcmeq	p3.h, p1/z, z11.h, z12.h
    81b4:      	stnp	w14, w10, [x11]
    81b8:      	<unknown>
    81bc:      	<unknown>
    81c0:      	stnp	w28, w15, [x9, #-0x100]
    81c4:      	<unknown>
    81c8:      	ldpsw	x4, x23, [x27, #0x30]
    81cc:      	<unknown>
    81d0:      	ldpsw	x20, x16, [x19, #-0x58]
    81d4:      	adr	x12, 0xc6e62
    81d8:      	<unknown>
    81dc:      	<unknown>
    81e0:      	<unknown>
    81e4:      	<unknown>
    81e8:      	<unknown>
    81ec:      	<unknown>
    81f0:      	stp	w20, w26, [x3, #-0xb8]
    81f4:      	<unknown>
    81f8:      	<unknown>
    81fc:      	<unknown>
    8200:      	<unknown>
    8204:      	smin	v9.8h, v19.8h, v7.8h
    8208:      	<unknown>
    820c:      	<unknown>
    8210:      	fnmla	z18.h, p3/m, z27.h, z22.h
    8214:      	adr	x18, 0xcafa3
    8218:      	fmaxnmv	h0, p2, z1.h
    821c:      	uabd	v19.8h, v3.8h, v9.8h
    8220:      	uqshl	v1.2d, v3.2d, #0x29
    8224:      	<unknown>
    8228:      	<unknown>
    822c:      	<unknown>
    8230:      	<unknown>
    8234:      	orn	w18, w2, w0, lsl #14
    8238:      	<unknown>
    823c:      	ldnp	s18, s24, [x27, #-0xd8]
    8240:      	<unknown>
    8244:      	<unknown>
    8248:      	adds	w5, w19, w0, uxtx #3
    824c:      	<unknown>
    8250:      	uqshl	v8.8h, v1.8h, v5.8h
    8254:      	<unknown>
    8258:      	stnp	w28, w15, [x9, #-0x100]
    825c:      	<unknown>
    8260:      	ldpsw	x4, x23, [x27, #0x30]
    8264:      	<unknown>
    8268:      	ldpsw	x20, x16, [x19, #-0x58]
    826c:      	adr	x12, 0xc6efa
    8270:      	<unknown>
    8274:      	<unknown>
    8278:      	<unknown>
    827c:      	<unknown>
    8280:      	<unknown>
    8284:      	<unknown>
    8288:      	stp	w20, w26, [x3, #-0xb8]
    828c:      	<unknown>
    8290:      	<unknown>
    8294:      	<unknown>
    8298:      	<unknown>
    829c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    82a0:      	orn	w9, w3, w0, lsl #25
    82a4:      	stp	w9, w8, [x1, #-0x80]
    82a8:      	<unknown>
    82ac:      	<unknown>
    82b0:      	<unknown>
    82b4:      	ldpsw	x5, x28, [x27, #-0x60]
    82b8:      	ldpsw	x14, x24, [x11, #-0x60]
    82bc:      	stnp	w15, w27, [x19]
    82c0:      	bc.pl	0xa4be8
    82c4:      	stnp	w14, w10, [x10, #-0x100]
    82c8:      	fmaxnmv	h0, p2, z1.h
    82cc:      	uabd	v19.8h, v3.8h, v9.8h
    82d0:      	uqshl	v1.2d, v3.2d, #0x29
    82d4:      	<unknown>
    82d8:      	<unknown>
    82dc:      	adds	w20, w3, w0, uxtx #2
    82e0:      	<unknown>
    82e4:      	umlal2	v28.4s, v1.8h, v3.h[1]
    82e8:      	fnmls	z21.h, p4/m, z19.h, z3.h
    82ec:      	stnp	w0, w10, [x9]
    82f0:      	bc.pl	0xa4c18
    82f4:      	stnp	w14, w10, [x10, #-0x100]
    82f8:      	umlal2	v0.4s, v1.8h, v3.h[5]
    82fc:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8300:      	<unknown>
    8304:      	<unknown>
    8308:      	<unknown>
    830c:      	<unknown>
    8310:      	<unknown>
    8314:      	<unknown>
    8318:      	<unknown>
    831c:      	stnp	w0, w10, [x9]
    8320:      	bc.pl	0xa4c48
    8324:      	stnp	w14, w10, [x10, #-0x100]
    8328:      	fmaxnmv	h0, p2, z1.h
    832c:      	uabd	v19.8h, v3.8h, v9.8h
    8330:      	uqshl	v1.2d, v3.2d, #0x29
    8334:      	<unknown>
    8338:      	<unknown>
    833c:      	<unknown>
    8340:      	umlal2	v28.4s, v1.8h, v3.h[1]
    8344:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8348:      	<unknown>
    834c:      	<unknown>
    8350:      	<unknown>
    8354:      	<unknown>
    8358:      	<unknown>
    835c:      	<unknown>
    8360:      	uqshl	v18.8h, v3.8h, v5.8h
    8364:      	<unknown>
    8368:      	ldp	w18, w24, [x27, #-0xd8]
    836c:      	<unknown>
    8370:      	<unknown>
    8374:      	<unknown>
    8378:      	<unknown>
    837c:      	fadd	z9.h, z1.h, z12.h
    8380:      	<unknown>
    8384:      	<unknown>
    8388:      	<unknown>
    838c:      	ldpsw	x4, x23, [x27, #0x30]
    8390:      	<unknown>
    8394:      	ldpsw	x20, x16, [x19, #-0x58]
    8398:      	adr	x12, 0xc7026
    839c:      	<unknown>
    83a0:      	<unknown>
    83a4:      	ldpsw	x13, x21, [x11, #-0x90]
    83a8:      	fnmls	z3.h, p3/m, z27.h, z4.h
    83ac:      	ldpsw	x19, x29, [x2, #-0x70]
    83b0:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    83b4:      	<unknown>
    83b8:      	<unknown>
    83bc:      	<unknown>
    83c0:      	stnp	w1, w15, [x9, #-0x100]
    83c4:      	ldpsw	x8, x29, [x17, #-0x88]
    83c8:      	stp	w4, w8, [x3, #-0xb0]
    83cc:      	<unknown>
    83d0:      	<unknown>
    83d4:      	str	b20, [x3, x0]
    83d8:      	adr	x0, 0xd6fbe
    83dc:      	<unknown>
    83e0:      	<unknown>
    83e4:      	<unknown>
    83e8:      	<unknown>
    83ec:      	<unknown>
    83f0:      	ldp	d1, d30, [x3, #-0x170]
    83f4:      	<unknown>
    83f8:      	<unknown>
    83fc:      	<unknown>
    8400:      	<unknown>
    8404:      	<unknown>
    8408:      	<unknown>
    840c:      	<unknown>
    8410:      	<unknown>
    8414:      	<unknown>
    8418:      	ldpsw	x19, x29, [x2, #-0x70]
    841c:      	<unknown>
    8420:      	adr	x1, 0x48bc5
    8424:      	<unknown>
    8428:      	fnmls	z19.h, p2/m, z10.h, z26.h
    842c:      	fcmne	p0.h, p2/z, z1.h, #0.0
    8430:      	<unknown>
    8434:      	ldpsw	x19, x29, [x2, #-0x70]
    8438:      	<unknown>
    843c:      	adr	x1, 0x48be1
    8440:      	<unknown>
    8444:      	<unknown>
    8448:      	stnp	w28, w15, [x9, #-0x100]
    844c:      	<unknown>
    8450:      	<unknown>
    8454:      	adr	x9, 0x104859
    8458:      	<unknown>
    845c:      	<unknown>
    8460:      	<unknown>
    8464:      	<unknown>
    8468:      	stp	w7, w12, [x1, #-0xc8]
    846c:      	<unknown>
    8470:      	<unknown>
    8474:      	<unknown>
    8478:      	<unknown>
    847c:      	ldpsw	x29, x8, [x1, #0x20]
    8480:      	cbz	w22, 0x74f2c
    8484:      	<unknown>
    8488:      	<unknown>
    848c:      	tbz	w9, #0xa, 0xe54
    8490:      	<unknown>
    8494:      	stp	s16, s10, [x9, #-0x100]
    8498:      	<unknown>
    849c:      	uabdl2	v20.4s, v19.8h, v9.8h
    84a0:      	<unknown>
    84a4:      	<unknown>
    84a8:      	<unknown>
    84ac:      	<unknown>
    84b0:      	<unknown>
    84b4:      	<unknown>
    84b8:      	stnp	w29, w8, [x1, #-0xc0]
    84bc:      	<unknown>
    84c0:      	ldp	w14, w21, [x2, #0x70]
    84c4:      	stp	w0, wzr, [x17, #-0x80]
    84c8:      	<unknown>
    84cc:      	<unknown>
    84d0:      	<unknown>
    84d4:      	<unknown>
    84d8:      	fcmla	v1.8h, v19.8h, v20.h[0], #270
    84dc:      	<unknown>
    84e0:      	orn	w14, w3, w8, lsl #8
    84e4:      	ldpsw	x19, x29, [x2, #-0x70]
    84e8:      	stp	w14, w25, [x27, #-0xb8]
    84ec:      	<unknown>
    84f0:      	orr	w20, w9, w0, lsl #10
    84f4:      	<unknown>
    84f8:      	<unknown>
    84fc:      	stp	w13, w8, [x1, #-0x78]
    8500:      	<unknown>
    8504:      	<unknown>
    8508:      	<unknown>
    850c:      	<unknown>
    8510:      	eor	w28, w9, #0xffff
    8514:      	<unknown>
    8518:      	cbz	w20, 0x74fc4
    851c:      	stnp	w0, w10, [x1, #-0xc0]
    8520:      	bc.pl	0xa4e48
    8524:      	<unknown>
    8528:      	<unknown>
    852c:      	<unknown>
    8530:      	umax	v20.8h, v11.8h, v18.8h
    8534:      	fcmeq	p1.h, p3/z, z3.h, z8.h
    8538:      	<unknown>
    853c:      	<unknown>
    8540:      	umin	v9.8h, v19.8h, v20.8h
    8544:      	<unknown>
    8548:      	uabdl2	v20.4s, v19.8h, v9.8h
    854c:      	stnp	s7, s10, [x11, #-0x100]
    8550:      	<unknown>
    8554:      	<unknown>
    8558:      	<unknown>
    855c:      	ldxrh	w8, [x1]
    8560:      	orn	w1, w18, w24, lsl #20
    8564:      	umlal2	v9.4s, v1.8h, v3.h[1]
    8568:      	fnmls	z21.h, p4/m, z19.h, z3.h
    856c:      	<unknown>
    8570:      	<unknown>
    8574:      	stp	w18, w14, [x2, #-0xb0]
    8578:      	<unknown>
    857c:      	<unknown>
    8580:      	<unknown>
    8584:      	<unknown>
    8588:      	<unknown>
    858c:      	<unknown>
    8590:      	<unknown>
    8594:      	<unknown>
    8598:      	<unknown>
    859c:      	<unknown>
    85a0:      	<unknown>
    85a4:      	<unknown>
    85a8:      	<unknown>
    85ac:      	stnp	w0, w10, [x1, #-0x100]
    85b0:      	<unknown>
    85b4:      	<unknown>
    85b8:      	<unknown>
    85bc:      	<unknown>
    85c0:      	<unknown>
    85c4:      	<unknown>
    85c8:      	<unknown>
    85cc:      	<unknown>
    85d0:      	stp	w18, w14, [x2, #-0xb0]
    85d4:      	umlal2	v0.4s, v1.8h, v3.h[5]
    85d8:      	fnmls	z21.h, p4/m, z19.h, z3.h
    85dc:      	<unknown>
    85e0:      	<unknown>
    85e4:      	<unknown>
    85e8:      	<unknown>
    85ec:      	<unknown>
    85f0:      	<unknown>
    85f4:      	<unknown>
    85f8:      	orr	w0, w9, w0, lsl #10
    85fc:      	<unknown>
    8600:      	<unknown>
    8604:      	adds	w0, w1, #0xe0c, lsl #12 // =0xe0c000
    8608:      	<unknown>
    860c:      	ldpsw	x19, x24, [x27, #-0xb8]
    8610:      	<unknown>
    8614:      	<unknown>
    8618:      	<unknown>
    861c:      	<unknown>
    8620:      	fnmls	z1.h, p3/m, z3.h, z21.h
    8624:      	str	b9, [x1, #0x848]
    8628:      	stnp	w0, w12, [x1]
    862c:      	bc.pl	0xa4f54
    8630:      	stnp	w14, w10, [x10, #-0x100]
    8634:      	fmaxnmv	h0, p2, z1.h
    8638:      	uabd	v19.8h, v3.8h, v9.8h
    863c:      	uqshl	v1.2d, v3.2d, #0x29
    8640:      	<unknown>
    8644:      	<unknown>
    8648:      	<unknown>
    864c:      	umlal2	v28.4s, v1.8h, v3.h[1]
    8650:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8654:      	stnp	w0, w10, [x9]
    8658:      	bc.pl	0xa4f80
    865c:      	stnp	w14, w10, [x10, #-0x100]
    8660:      	umlal2	v0.4s, v1.8h, v3.h[5]
    8664:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8668:      	<unknown>
    866c:      	<unknown>
    8670:      	<unknown>
    8674:      	<unknown>
    8678:      	<unknown>
    867c:      	<unknown>
    8680:      	st1	{ v0.4s, v1.4s, v2.4s, v3.4s }, [x9]
    8684:      	<unknown>
    8688:      	str	b8, [x3, #0xf08]
    868c:      	adr	x0, 0xd7272
    8690:      	<unknown>
    8694:      	<unknown>
    8698:      	<unknown>
    869c:      	<unknown>
    86a0:      	<unknown>
    86a4:      	ldp	d1, d30, [x3, #-0x170]
    86a8:      	<unknown>
    86ac:      	<unknown>
    86b0:      	uabdl2	v20.4s, v19.8h, v9.8h
    86b4:      	uqshl	v7.8h, v3.8h, v5.8h
    86b8:      	<unknown>
    86bc:      	<unknown>
    86c0:      	str	b20, [x3, x0]
    86c4:      	adr	x0, 0xd72aa
    86c8:      	<unknown>
    86cc:      	<unknown>
    86d0:      	<unknown>
    86d4:      	<unknown>
    86d8:      	<unknown>
    86dc:      	ldp	d1, d30, [x3, #-0x170]
    86e0:      	<unknown>
    86e4:      	<unknown>
    86e8:      	uabdl2	v20.4s, v19.8h, v9.8h
    86ec:      	uqshl	v7.8h, v3.8h, v5.8h
    86f0:      	<unknown>
    86f4:      	ldpsw	x1, x28, [x26, #-0xe8]
    86f8:      	<unknown>
    86fc:      	fnmls	z19.h, p2/m, z10.h, z26.h
    8700:      	ldpsw	x0, x10, [x1, #0x30]
    8704:      	<unknown>
    8708:      	uabdl2	v20.4s, v19.8h, v9.8h
    870c:      	<unknown>
    8710:      	ldpsw	x19, x24, [x27, #-0xb8]
    8714:      	<unknown>
    8718:      	<unknown>
    871c:      	<unknown>
    8720:      	<unknown>
    8724:      	uabdl2	v20.4s, v19.8h, v9.8h
    8728:      	<unknown>
    872c:      	ldpsw	x19, x24, [x27, #-0xb8]
    8730:      	<unknown>
    8734:      	<unknown>
    8738:      	<unknown>
    873c:      	<unknown>
    8740:      	<unknown>
    8744:      	str	b9, [x1, #0x848]
    8748:      	<unknown>
    874c:      	ldpsw	x19, x24, [x27, #-0xb8]
    8750:      	<unknown>
    8754:      	<unknown>
    8758:      	<unknown>
    875c:      	ldp	w9, w27, [x19, #-0xc8]
    8760:      	<unknown>
    8764:      	<unknown>
    8768:      	<unknown>
    876c:      	ldpsw	x20, x28, [x19, #0x98]
    8770:      	stnp	w26, w25, [x11, #-0x100]
    8774:      	<unknown>
    8778:      	<unknown>
    877c:      	<unknown>
    8780:      	str	b9, [x1, #0x848]
    8784:      	orr	w0, w1, w0, lsl #12
    8788:      	<unknown>
    878c:      	<unknown>
    8790:      	stp	w13, w8, [x1, #-0x78]
    8794:      	<unknown>
    8798:      	<unknown>
    879c:      	ldpsw	x1, x28, [x26, #-0xe8]
    87a0:      	<unknown>
    87a4:      	fnmls	z19.h, p2/m, z10.h, z26.h
    87a8:      	umlal2	v0.4s, v1.8h, v3.h[5]
    87ac:      	fnmls	z21.h, p4/m, z19.h, z3.h
    87b0:      	str	b9, [x1, #0x848]
    87b4:      	stnp	w0, w12, [x1]
    87b8:      	bc.pl	0xa50e0
    87bc:      	stnp	w14, w10, [x10, #-0x100]
    87c0:      	<unknown>
    87c4:      	orn	w18, w2, w0, lsl #14
    87c8:      	fmaxnmv	h9, p0, z1.h
    87cc:      	uabd	v19.8h, v3.8h, v9.8h
    87d0:      	uqshl	v1.2d, v3.2d, #0x29
    87d4:      	<unknown>
    87d8:      	<unknown>
    87dc:      	<unknown>
    87e0:      	<unknown>
    87e4:      	<unknown>
    87e8:      	fcmne	p4.h, p4/z, z19.h, z12.h
    87ec:      	<unknown>
    87f0:      	<unknown>
    87f4:      	stnp	w5, w10, [x11]
    87f8:      	bc.pl	0xa5120
    87fc:      	stnp	w14, w10, [x10, #-0x100]
    8800:      	<unknown>
    8804:      	stp	s3, s25, [x11, #-0x100]
    8808:      	ldxrh	w0, [x1]
    880c:      	<unknown>
    8810:      	<unknown>
    8814:      	ldpsw	x5, x28, [x27, #-0x60]
    8818:      	ldpsw	x14, x24, [x11, #-0x60]
    881c:      	<unknown>
    8820:      	stnp	w30, w15, [x9, #-0x100]
    8824:      	ldpsw	x1, x28, [x26, #-0xe8]
    8828:      	<unknown>
    882c:      	fnmls	z19.h, p2/m, z10.h, z26.h
    8830:      	umlal2	v0.4s, v1.8h, v3.h[5]
    8834:      	fnmls	z21.h, p4/m, z19.h, z3.h
    8838:      	<unknown>
    883c:      	fnmls	z19.h, p2/m, z11.h, z26.h
    8840:      	stnp	w15, w25, [x19, #-0x100]
    8844:      	<unknown>
    8848:      	stp	w17, w13, [x17, #-0xb8]
    884c:      	ldnp	d0, d21, [x16, #-0x1f0]
    8850:      	<unknown>
    8854:      	adr	x0, 0x68e79
    8858:      	ldnp	d0, d21, [x16, #-0x1f0]
    885c:      	<unknown>
    8860:      	<unknown>
    8864:      	<unknown>
    8868:      	fnmls	z1.h, p3/m, z3.h, z21.h
    886c:      	adr	x0, 0x48d31
    8870:      	<unknown>
    8874:      	ldeorh	w16, w28, [x1]
    8878:      	fadd	z1.h, z3.h, z21.h
    887c:      	umlsl2	v6.4s, v11.8h, v2.h[4]
    8880:      	fcmeq	p15.h, p5/z, z3.h, z19.h
    8884:      	<unknown>
    8888:      	<unknown>
    888c:      	<unknown>
    8890:      	<unknown>
    8894:      	ldp	d0, d25, [x24, #0x90]
    8898:      	<unknown>
    889c:      	ldnp	d1, d27, [x19, #-0x1c0]
    88a0:      	str	b5, [x3, #0x848]
    88a4:      	<unknown>
    88a8:      	<unknown>
    88ac:      	adr	x10, 0x48dd1
    88b0:      	<unknown>
    88b4:      	str	b20, [x2, #0x848]
    88b8:      	<unknown>
    88bc:      	<unknown>
    88c0:      	adr	x10, 0x48de5
    88c4:      	<unknown>
    88c8:      	str	b19, [x2, #0x848]
    88cc:      	<unknown>
    88d0:      	<unknown>
    88d4:      	adr	x10, 0x48df9
    88d8:      	fadd	z9.h, z1.h, z21.h
    88dc:      	<unknown>
    88e0:      	ldp	d14, d29, [x3, #-0x170]
    88e4:      	<unknown>
    88e8:      	fnmls	z22.h, p2/m, z11.h, z3.h
    88ec:      	<unknown>
    88f0:      	ldpsw	x12, x25, [x11, #0x60]
    88f4:      	<unknown>
    88f8:      	<unknown>
    88fc:      	stnp	w1, w15, [x9, #-0x100]
    8900:      	ldpsw	x8, x29, [x17, #-0x88]
    8904:      	stp	w4, w8, [x3, #-0xb0]
    8908:      	<unknown>
    890c:      	ldpsw	x21, x25, [x10, #-0xd0]
    8910:      	<unknown>
    8914:      	<unknown>
    8918:      	<unknown>
    891c:      	<unknown>
    8920:      	stnp	w1, w15, [x9, #-0x100]
    8924:      	ldpsw	x8, x29, [x17, #-0x88]
    8928:      	stp	w4, w8, [x3, #-0xb0]
    892c:      	<unknown>
    8930:      	ldnp	d20, d24, [x10, #-0x1e0]
    8934:      	str	b5, [x3, #0x848]
    8938:      	<unknown>
    893c:      	<unknown>
    8940:      	adr	x10, 0x48e65
    8944:      	<unknown>
    8948:      	<unknown>
    894c:      	<unknown>
    8950:      	<unknown>
    8954:      	stnp	w29, w8, [x1, #-0xc0]
    8958:      	<unknown>
    895c:      	<unknown>
    8960:      	trn1	v16.16b, v9.16b, v0.16b
    8964:      	<unknown>
    8968:      	ushl	v25.8h, v19.8h, v21.8h
    896c:      	uqshl	v3.2d, v3.2d, #0x29
    8970:      	str	b14, [x3, #0x848]
    8974:      	<unknown>
    8978:      	<unknown>
    897c:      	adr	x10, 0x48ea1
    8980:      	fadd	z9.h, z1.h, z18.h
    8984:      	<unknown>
    8988:      	ldpsw	x18, x24, [x11, #-0x60]
    898c:      	<unknown>
    8990:      	stnp	w29, w8, [x1, #-0xc0]
    8994:      	<unknown>
    8998:      	<unknown>
    899c:      	trn1	v16.16b, v9.16b, v0.16b
    89a0:      	<unknown>
    89a4:      	stnp	w1, w15, [x9, #-0x100]
    89a8:      	ldpsw	x8, x29, [x17, #-0x88]
    89ac:      	stp	w4, w8, [x3, #-0xb0]
    89b0:      	<unknown>
    89b4:      	ldpsw	x14, x27, [x26, #-0x60]
    89b8:      	adr	x6, 0xb18e7
    89bc:      	str	b12, [x3, #0xf08]
    89c0:      	<unknown>
    89c4:      	<unknown>
    89c8:      	<unknown>
    89cc:      	umlal2	v8.4s, v1.8h, v6.h[7]
    89d0:      	orn	w9, w3, w0, lsl #25
    89d4:      	stp	w9, w8, [x1, #-0x80]
    89d8:      	ldpsw	x0, x20, [x0, #-0x70]
    89dc:      	<unknown>
    89e0:      	str	b25, [x3, #0xf08]
    89e4:      	<unknown>
    89e8:      	<unknown>
    89ec:      	<unknown>
    89f0:      	str	b3, [x27, #0x81a]
    89f4:      	<unknown>
    89f8:      	<unknown>
    89fc:      	ldnp	d11, d20, [x19, #-0x1b0]
    8a00:      	fnmls	z5.h, p0/m, z11.h, z19.h
    8a04:      	mla	v4.8h, v3.8h, v12.h[0]
    8a08:      	<unknown>
    8a0c:      	<unknown>
    8a10:      	<unknown>
    8a14:      	<unknown>
    8a18:      	<unknown>
    8a1c:      	ldpsw	x14, x26, [x11, #-0x90]
    8a20:      	ldnp	d20, d26, [x11, #-0x1f0]
    8a24:      	<unknown>
    8a28:      	<unknown>
    8a2c:      	<unknown>
    8a30:      	<unknown>
    8a34:      	<unknown>
    8a38:      	umlsl2	v6.4s, v11.8h, v12.h[4]
    8a3c:      	<unknown>
    8a40:      	<unknown>
    8a44:      	<unknown>
    8a48:      	<unknown>
    8a4c:      	stnp	w1, w15, [x9, #-0x100]
    8a50:      	ldpsw	x8, x29, [x17, #-0x88]
    8a54:      	stp	w4, w8, [x3, #-0xb0]
    8a58:      	<unknown>
    8a5c:      	<unknown>
    8a60:      	<unknown>
    8a64:      	stnp	w1, w15, [x9, #-0x100]
    8a68:      	ldpsw	x8, x29, [x17, #-0x88]
    8a6c:      	stp	w4, w8, [x3, #-0xb0]
    8a70:      	<unknown>
    8a74:      	<unknown>
    8a78:      	fnmls	z1.h, p3/m, z3.h, z21.h
    8a7c:      	<unknown>
    8a80:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8a84:      	orn	w9, w3, w0, lsl #25
    8a88:      	stp	w9, w8, [x1, #-0x80]
    8a8c:      	<unknown>
    8a90:      	<unknown>
    8a94:      	stnp	w1, w15, [x9, #-0x100]
    8a98:      	ldpsw	x8, x29, [x17, #-0x88]
    8a9c:      	stp	w4, w8, [x3, #-0xb0]
    8aa0:      	<unknown>
    8aa4:      	adr	x19, 0xe994f
    8aa8:      	fnmls	z15.h, p4/m, z19.h, z20.h
    8aac:      	uqshl	v4.8h, v3.8h, v1.8h
    8ab0:      	<unknown>
    8ab4:      	<unknown>
    8ab8:      	stnp	w29, w8, [x1, #-0xc0]
    8abc:      	<unknown>
    8ac0:      	<unknown>
    8ac4:      	stxrh	w0, w16, [x9]
    8ac8:      	ldpsw	x15, x24, [x19, #0x60]
    8acc:      	<unknown>
    8ad0:      	<unknown>
    8ad4:      	<unknown>
    8ad8:      	<unknown>
    8adc:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8ae0:      	orn	w9, w3, w0, lsl #25
    8ae4:      	stp	w9, w8, [x1, #-0x80]
    8ae8:      	<unknown>
    8aec:      	<unknown>
    8af0:      	str	b20, [x3, #0x848]
    8af4:      	<unknown>
    8af8:      	<unknown>
    8afc:      	adr	x10, 0x49021
    8b00:      	stnp	w9, w0, [x1, #-0xc0]
    8b04:      	<unknown>
    8b08:      	ldp	w5, w16, [x10, #0x70]
    8b0c:      	str	b8, [x1, #0xf4c]
    8b10:      	<unknown>
    8b14:      	<unknown>
    8b18:      	<unknown>
    8b1c:      	<unknown>
    8b20:      	<unknown>
    8b24:      	<unknown>
    8b28:      	<unknown>
    8b2c:      	ldp	d8, d21, [x3, #-0x170]
    8b30:      	ldpsw	x5, x28, [x19, #0x60]
    8b34:      	<unknown>
    8b38:      	adr	x8, 0xd771e
    8b3c:      	<unknown>
    8b40:      	<unknown>
    8b44:      	<unknown>
    8b48:      	<unknown>
    8b4c:      	<unknown>
    8b50:      	<unknown>
    8b54:      	ldpsw	x3, x26, [x3, #0xa0]
    8b58:      	<unknown>
    8b5c:      	<unknown>
    8b60:      	mls	v14.4h, v3.4h, v10.h[7]
    8b64:      	adr	x17, 0x69169
    8b68:      	<unknown>
    8b6c:      	<unknown>
    8b70:      	ushl	v13.8h, v27.8h, v5.8h
    8b74:      	<unknown>
    8b78:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8b7c:      	<unknown>
    8b80:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8b84:      	fnmla	z18.h, p1/m, z19.h, z18.h
    8b88:      	stp	w17, w8, [x3, #-0xc0]
    8b8c:      	<unknown>
    8b90:      	<unknown>
    8b94:      	<unknown>
    8b98:      	<unknown>
    8b9c:      	<unknown>
    8ba0:      	<unknown>
    8ba4:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8ba8:      	<unknown>
    8bac:      	<unknown>
    8bb0:      	<unknown>
    8bb4:      	<unknown>
    8bb8:      	stgp	x12, x25, [x11, #-0x400]
    8bbc:      	<unknown>
    8bc0:      	adr	x5, 0x8efce
    8bc4:      	<unknown>
    8bc8:      	fnmls	z5.h, p3/m, z19.h, z3.h
    8bcc:      	ldpsw	x0, x29, [x1, #-0xc0]
    8bd0:      	ldpsw	x19, x8, [x3, #-0xa0]
    8bd4:      	<unknown>
    8bd8:      	<unknown>
    8bdc:      	<unknown>
    8be0:      	<unknown>
    8be4:      	<unknown>
    8be8:      	<unknown>
    8bec:      	fcmne	p8.h, p1/z, z11.h, z19.h
    8bf0:      	<unknown>
    8bf4:      	<unknown>
    8bf8:      	<unknown>
    8bfc:      	<unknown>
    8c00:      	<unknown>
    8c04:      	<unknown>
    8c08:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8c0c:      	orn	w9, w3, w0, lsl #25
    8c10:      	stp	w9, w8, [x1, #-0x80]
    8c14:      	adr	x0, 0xd3657
    8c18:      	<unknown>
    8c1c:      	<unknown>
    8c20:      	bfdot	z19.s, z27.h, z7.h[1]
    8c24:      	<unknown>
    8c28:      	adr	x14, 0x988e <.text+0x888e>
    8c2c:      	<unknown>
    8c30:      	<unknown>
    8c34:      	stnp	w1, w15, [x9, #-0x100]
    8c38:      	ldpsw	x8, x29, [x17, #-0x88]
    8c3c:      	stp	w4, w8, [x3, #-0xb0]
    8c40:      	<unknown>
    8c44:      	fnmls	z6.h, p2/m, z10.h, z12.h
    8c48:      	fnmls	z14.h, p0/m, z11.h, z13.h
    8c4c:      	<unknown>
    8c50:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8c54:      	orn	w9, w3, w0, lsl #25
    8c58:      	stp	w9, w8, [x1, #-0x80]
    8c5c:      	<unknown>
    8c60:      	adr	x3, 0xdbaaf
    8c64:      	<unknown>
    8c68:      	<unknown>
    8c6c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8c70:      	orn	w9, w3, w0, lsl #25
    8c74:      	stp	w9, w8, [x1, #-0x80]
    8c78:      	uqshl	v0.8h, v0.8h, v9.8h
    8c7c:      	ldp	d5, d19, [x19, #-0xb0]
    8c80:      	<unknown>
    8c84:      	stnp	w1, w15, [x9, #-0x100]
    8c88:      	ldpsw	x8, x29, [x17, #-0x88]
    8c8c:      	stp	w4, w8, [x3, #-0xb0]
    8c90:      	<unknown>
    8c94:      	fcmla	v5.8h, v18.8h, v18.h[1], #270
    8c98:      	<unknown>
    8c9c:      	<unknown>
    8ca0:      	stnp	w29, w8, [x1, #-0xc0]
    8ca4:      	<unknown>
    8ca8:      	<unknown>
    8cac:      	st3	{ v16.b, v17.b, v18.b }[10], [x9]
    8cb0:      	fnmls	z1.h, p4/m, z19.h, z11.h
    8cb4:      	str	b18, [x3, #0x848]
    8cb8:      	<unknown>
    8cbc:      	<unknown>
    8cc0:      	adr	x10, 0x491e5
    8cc4:      	fadd	z9.h, z1.h, z4.h
    8cc8:      	fnmls	z22.h, p2/m, z11.h, z3.h
    8ccc:      	<unknown>
    8cd0:      	<unknown>
    8cd4:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8cd8:      	orn	w9, w3, w0, lsl #25
    8cdc:      	stp	w9, w8, [x1, #-0x80]
    8ce0:      	<unknown>
    8ce4:      	fnmls	z5.h, p3/m, z19.h, z4.h
    8ce8:      	<unknown>
    8cec:      	str	b1, [x3, #0x848]
    8cf0:      	<unknown>
    8cf4:      	<unknown>
    8cf8:      	adr	x10, 0x4921d
    8cfc:      	ldurh	w9, [x1, #0x50]
    8d00:      	<unknown>
    8d04:      	<unknown>
    8d08:      	ldpsw	x20, x24, [x11, #0x98]
    8d0c:      	<unknown>
    8d10:      	<unknown>
    8d14:      	sqrshrnb	z1.b, z1.h, #0x8
    8d18:      	uabd	v24.8h, v3.8h, v5.8h
    8d1c:      	<unknown>
    8d20:      	<unknown>
    8d24:      	stnp	w29, w15, [x9, #-0x100]
    8d28:      	ldpsw	x8, x29, [x17, #-0x88]
    8d2c:      	stp	w4, w8, [x3, #-0xb0]
    8d30:      	stp	w0, w12, [x1, #-0xb8]
    8d34:      	<unknown>
    8d38:      	<unknown>
    8d3c:      	fnmls	z5.h, p3/m, z19.h, z4.h
    8d40:      	<unknown>
    8d44:      	<unknown>
    8d48:      	str	b5, [x3, #0x848]
    8d4c:      	stp	w0, w12, [x1, #-0xb8]
    8d50:      	stnp	w0, w8, [x8, #-0xc0]
    8d54:      	fnmls	z5.h, p6/m, z2.h, z20.h
    8d58:      	<unknown>
    8d5c:      	<unknown>
    8d60:      	<unknown>
    8d64:      	umlal2	v8.4s, v1.8h, v6.h[7]
    8d68:      	orn	w9, w3, w0, lsl #25
    8d6c:      	stp	w9, w8, [x1, #-0x80]
    8d70:      	<unknown>
    8d74:      	ldtrh	w0, [x1, #0x52]
    8d78:      	<unknown>
    8d7c:      	<unknown>
    8d80:      	ldpsw	x20, x24, [x11, #0x98]
    8d84:      	str	b26, [x11, #0x819]
    8d88:      	stp	w29, w8, [x1, #-0x80]
    8d8c:      	<unknown>
    8d90:      	<unknown>
    8d94:      	<unknown>
    8d98:      	ldeorlh	w5, w5, [x3]
    8d9c:      	<unknown>
    8da0:      	<unknown>
    8da4:      	<unknown>
    8da8:      	<unknown>
    8dac:      	stnp	d15, d27, [x27, #-0x200]
    8db0:      	fnmls	z1.h, p4/m, z19.h, z7.h
    8db4:      	<unknown>
    8db8:      	ands	w2, w11, #0x3ffffff
    8dbc:      	<unknown>
    8dc0:      	<unknown>
    8dc4:      	fadd	z10.h, z0.h, z13.h
    8dc8:      	<unknown>
    8dcc:      	<unknown>
    8dd0:      	<unknown>
    8dd4:      	ldpsw	x5, x28, [x27, #-0x60]
    8dd8:      	ldpsw	x14, x24, [x11, #-0x60]
    8ddc:      	<unknown>
    8de0:      	<unknown>
    8de4:      	stnp	w29, w8, [x1, #-0xc0]
    8de8:      	<unknown>
    8dec:      	<unknown>
    8df0:      	ubfx	w16, w9, #0, #11
    8df4:      	<unknown>
    8df8:      	ldpsw	x5, x17, [x27, #-0x58]
    8dfc:      	str	b4, [x3, #0x848]
    8e00:      	<unknown>
    8e04:      	<unknown>
    8e08:      	adr	x10, 0x4932d
    8e0c:      	<unknown>
    8e10:      	<unknown>
    8e14:      	stnp	w1, w15, [x9, #-0x100]
    8e18:      	ldpsw	x8, x29, [x17, #-0x88]
    8e1c:      	stp	w4, w8, [x3, #-0xb0]
    8e20:      	<unknown>
    8e24:      	<unknown>
    8e28:      	str	b18, [x1, #0x848]
    8e2c:      	<unknown>
    8e30:      	<unknown>
    8e34:      	adr	x10, 0x49359
    8e38:      	stnp	w9, w0, [x1, #-0xc0]
    8e3c:      	bc.pl	0xa5764
    8e40:      	<unknown>
    8e44:      	<unknown>
    8e48:      	stnp	w0, w9, [x17, #-0x100]
    8e4c:      	fnmls	z19.h, p2/m, z11.h, z26.h
    8e50:      	stnp	w15, w25, [x19, #-0x100]
    8e54:      	<unknown>
    8e58:      	<unknown>
    8e5c:      	stp	w20, w24, [x11, #-0x78]
    8e60:      	adds	w0, w9, #0x80b
    8e64:      	str	b9, [x9, #0x80a]
    8e68:      	<unknown>
    8e6c:      	uqshl	v8.8h, v1.8h, v5.8h
    8e70:      	<unknown>
    8e74:      	<unknown>
    8e78:      	fcmla	v9.8h, v19.8h, v5.h[3], #270
    8e7c:      	orn	w6, w3, w8, lsl #8
    8e80:      	<unknown>
    8e84:      	ldp	w16, w29, [x2, #-0x70]
    8e88:      	adds	w0, w9, #0x80b
    8e8c:      	str	b9, [x9, #0x80a]
    8e90:      	<unknown>
    8e94:      	udf	#0x0
    8e98:      	udf	#0x6398
    8e9c:      	udf	#0x0
    8ea0:      	udf	#0x63a0
    8ea4:      	udf	#0x0
    8ea8:      	udf	#0x63a8
    8eac:      	udf	#0x0
    8eb0:      	udf	#0x63b0
    8eb4:      	udf	#0x0
    8eb8:      	udf	#0x63b8
    8ebc:      	udf	#0x0
    8ec0:      	udf	#0x63c0
    8ec4:      	udf	#0x0
    8ec8:      	udf	#0x63c8
    8ecc:      	udf	#0x0
    8ed0:      	udf	#0x63d0
    8ed4:      	udf	#0x0
    8ed8:      	udf	#0x63d8
    8edc:      	udf	#0x0
    8ee0:      	udf	#0x63e0
    8ee4:      	udf	#0x0
    8ee8:      	udf	#0x63e8
    8eec:      	udf	#0x0
    8ef0:      	udf	#0x6338
    8ef4:      	udf	#0x0
    8ef8:      	udf	#0x6338
    8efc:      	udf	#0x0
    8f00:      	udf	#0x6338
    8f04:      	udf	#0x0
    8f08:      	udf	#0x6338
    8f0c:      	udf	#0x0
    8f10:      	<unknown>
    8f14:      	ldpsw	x18, x25, [x11, #-0xc8]
    8f18:      	<unknown>
    8f1c:      	<unknown>
    8f20:      	<unknown>
    8f24:      	<unknown>
    8f28:      	<unknown>
    8f2c:      	<unknown>
    8f30:      	umlsl2	v22.4s, v11.8h, v3.h[7]
    8f34:      	umlal2	v18.4s, v3.8h, v13.h[0]
    8f38:      	<unknown>
    8f3c:      	<unknown>
    8f40:      	fmls	z20.h, p0/m, z3.h, z16.h
    8f44:      	<unknown>
    8f48:      	fmls	z13.h, p0/m, z3.h, z18.h
    8f4c:      	<unknown>
    8f50:      	<unknown>
    8f54:      	<unknown>
    8f58:      	uqshl	v1.2d, v3.2d, #0x29
    8f5c:      	<unknown>
    8f60:      	umin	v21.8h, v18.8h, v11.8h
    8f64:      	<unknown>
    8f68:      	<unknown>
    8f6c:      	fnmls	z7.h, p1/m, z10.h, z14.h
    8f70:      	<unknown>
    8f74:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8f78:      	fmls	z18.h, p0/m, z3.h, z18.h
    8f7c:      	<unknown>
    8f80:      	<unknown>
    8f84:      	bic	w24, w19, w0, lsl #11
    8f88:      	<unknown>
    8f8c:      	adr	x20, 0xe3c3b
    8f90:      	umlal2	v20.4s, v3.8h, v4.h[3]
    8f94:      	<unknown>
    8f98:      	<unknown>
    8f9c:      	fminv	h13, p0, z2.h
    8fa0:      	ldpsw	x14, x25, [x11, #-0x70]
    8fa4:      	ldpsw	x3, x8, [x3, #0xa0]
    8fa8:      	<unknown>
    8fac:      	ldpsw	x18, x25, [x11, #-0xc8]
    8fb0:      	<unknown>
    8fb4:      	<unknown>
    8fb8:      	<unknown>
    8fbc:      	<unknown>
    8fc0:      	<unknown>
    8fc4:      	b.ls	0x49c30
    8fc8:      	<unknown>
    8fcc:      	<unknown>
    8fd0:      	ldpsw	x5, x27, [x19, #-0x68]
    8fd4:      	stgp	x15, x27, [x19, #-0x400]
    8fd8:      	umlal2	v19.4s, v3.8h, v14.h[2]
    8fdc:      	ldp	d20, d8, [x3, #-0x170]
    8fe0:      	ldp	d16, d27, [x3, #-0x1b0]
    8fe4:      	fnmls	z5.h, p3/m, z19.h, z20.h
    8fe8:      	<unknown>
    8fec:      	<unknown>
    8ff0:      	cbz	w3, 0x75cfc
    8ff4:      	<unknown>
    8ff8:      	fnmls	z20.h, p2/m, z10.h, z13.h
    8ffc:      	<unknown>
    9000:      	<unknown>
    9004:      	<unknown>
    9008:      	<unknown>
    900c:      	eor	w20, w27, #0xfffffff
    9010:      	<unknown>
    9014:      	ldrh	w15, [x18, #0x1636]
    9018:      	<unknown>
    901c:      	fnmls	z9.h, p4/m, z27.h, z20.h
    9020:      	<unknown>
    9024:      	<unknown>
    9028:      	<unknown>
    902c:      	<unknown>
    9030:      	<unknown>
    9034:      	<unknown>
    9038:      	eor	w20, w27, #0xfffffff
    903c:      	<unknown>
    9040:      	ldrh	w15, [x18, #0x1636]
    9044:      	<unknown>
    9048:      	fnmls	z9.h, p4/m, z27.h, z20.h
    904c:      	<unknown>
    9050:      	<unknown>
    9054:      	<unknown>
    9058:      	fnmls	z1.h, p5/m, z2.h, z20.h
    905c:      	<unknown>
    9060:      	<unknown>
    9064:      	fnmls	z18.h, p2/m, z11.h, z20.h
    9068:      	<unknown>
    906c:      	<unknown>
    9070:      	fnmls	z7.h, p1/m, z10.h, z14.h
    9074:      	<unknown>
    9078:      	fnmls	z20.h, p2/m, z10.h, z13.h
    907c:      	fmls	z18.h, p0/m, z3.h, z18.h
    9080:      	<unknown>
    9084:      	uabdl	v5.4s, v19.4h, v19.4h
    9088:      	<unknown>
    908c:      	<unknown>
    9090:      	ushl	v0.8h, v25.8h, v5.8h
    9094:      	<unknown>
    9098:      	ldp	d0, d21, [x1, #-0x170]
    909c:      	<unknown>
    90a0:      	uabd	v24.8h, v3.8h, v5.8h
    90a4:      	<unknown>
    90a8:      	<unknown>
    90ac:      	<unknown>
    90b0:      	ldnp	d9, d27, [x11, #-0x100]
    90b4:      	umin	v5.8h, v11.8h, v5.8h
    90b8:      	<unknown>
    90bc:      	udf	#0x200a
		...
