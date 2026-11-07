
UsbInitDxe.efi:	file format coff-arm64

Disassembly of section .text:

0000000000001000 <.text>:
    1000:      	stp	x20, x19, [sp, #-0x20]!
    1004:      	stp	x29, x30, [sp, #0x10]
    1008:      	add	x29, sp, #0x10
    100c:      	mov	x20, x0
    1010:      	bl	0x1438 <.text+0x438>
    1014:      	mov	x19, x0
    1018:      	tbnz	x19, #0x3f, 0x102c <.text+0x2c>
    101c:      	adrp	x8, 0x5000
    1020:      	mov	x0, x20
    1024:      	ldr	x1, [x8, #0xe0]
    1028:      	bl	0x1430 <.text+0x430>
    102c:      	ldp	x29, x30, [sp, #0x10]
    1030:      	mov	x0, x19
    1034:      	ldp	x20, x19, [sp], #0x20
    1038:      	ret
    103c:      	stp	x22, x21, [sp, #-0x30]!
    1040:      	stp	x20, x19, [sp, #0x10]
    1044:      	stp	x29, x30, [sp, #0x20]
    1048:      	add	x29, sp, #0x20
    104c:      	sub	sp, sp, #0x10
    1050:      	adrp	x8, 0x3000 <.text+0x2000>
    1054:      	mov	x19, x1
    1058:      	mov	x20, x0
    105c:      	ldr	w8, [x8, #0x9fc]
    1060:      	cbz	w8, 0x107c <.text+0x7c>
    1064:      	ldr	w9, [x19, #0x8]
    1068:      	cmp	w9, w8
    106c:      	b.hs	0x107c <.text+0x7c>
    1070:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    1074:      	movk	x21, #0x19
    1078:      	b	0x1140 <.text+0x140>
    107c:      	mov	x0, x20
    1080:      	mov	x1, x19
    1084:      	bl	0x11a4 <.text+0x1a4>
    1088:      	adrp	x9, 0x3000 <.text+0x2000>
    108c:      	ldrb	w11, [x9, #0xa00]
    1090:      	cbz	w11, 0x1120 <.text+0x120>
    1094:      	adrp	x10, 0x5000
    1098:      	adrp	x1, 0x5000
    109c:      	add	x1, x1, #0x90
    10a0:      	ldr	x11, [x10, #0xe8]
    10a4:      	add	x2, sp, #0x8
    10a8:      	mov	x0, x20
    10ac:      	ldr	x8, [x11, #0x98]
    10b0:      	blr	x8
    10b4:      	mov	x21, x0
    10b8:      	bl	0x23f0 <.text+0x13f0>
    10bc:      	tbz	x21, #0x3f, 0x1110 <.text+0x110>
    10c0:      	and	w8, w0, #0xff
    10c4:      	cbz	w8, 0x1110 <.text+0x110>
    10c8:      	bl	0x2400 <.text+0x1400>
    10cc:      	and	w9, w0, #0xff
    10d0:      	cbz	w9, 0x10f8 <.text+0xf8>
    10d4:      	orr	w0, wzr, #0x80000000
    10d8:      	bl	0x2410 <.text+0x1410>
    10dc:      	and	w10, w0, #0xff
    10e0:      	cbz	w10, 0x10f8 <.text+0xf8>
    10e4:      	adrp	x1, 0x3000 <.text+0x2000>
    10e8:      	add	x1, x1, #0x988
    10ec:      	orr	w0, wzr, #0x80000000
    10f0:      	mov	x2, x21
    10f4:      	bl	0x1eb0 <.text+0xeb0>
    10f8:      	adrp	x0, 0x3000 <.text+0x2000>
    10fc:      	adrp	x2, 0x3000 <.text+0x2000>
    1100:      	add	x0, x0, #0x9a9
    1104:      	add	x2, x2, #0x9bc
    1108:      	orr	w1, wzr, #0x7e
    110c:      	bl	0x223c <.text+0x123c>
    1110:      	ldr	x12, [sp, #0x8]
    1114:      	adrp	x9, 0x1000 <.text>
    1118:      	add	x9, x9, #0x0
    111c:      	str	x9, [x12, #0x58]
    1120:      	mov	x0, x20
    1124:      	mov	x1, x19
    1128:      	bl	0x1434 <.text+0x434>
    112c:      	mov	x21, x0
    1130:      	tbz	x21, #0x3f, 0x1140 <.text+0x140>
    1134:      	mov	x0, x20
    1138:      	mov	x1, x19
    113c:      	bl	0x1430 <.text+0x430>
    1140:      	mov	x0, x21
    1144:      	sub	sp, x29, #0x20
    1148:      	ldp	x29, x30, [sp, #0x20]
    114c:      	ldp	x20, x19, [sp, #0x10]
    1150:      	ldp	x22, x21, [sp], #0x30
    1154:      	ret
    1158:      	cmp	x0, #0x0
    115c:      	b.eq	0x1184 <.text+0x184>
    1160:      	stp	x3, x2, [sp, #-0x10]!
    1164:      	stp	x1, x0, [sp, #-0x10]!
    1168:      	stp	x9, x8, [sp, #-0x10]!
    116c:      	stp	x30, x29, [sp, #-0x10]!
    1170:      	bl	0x1188 <.text+0x188>
    1174:      	ldp	x30, x29, [sp], #0x10
    1178:      	ldp	x9, x8, [sp], #0x10
    117c:      	ldp	x1, x0, [sp], #0x10
    1180:      	ldp	x3, x2, [sp], #0x10
    1184:      	b	0x103c <.text+0x3c>
    1188:      	stp	x29, x30, [sp, #-0x10]!
    118c:      	mov	x29, sp
    1190:      	bl	0x2b10 <.text+0x1b10>
    1194:      	adrp	x8, 0x5000
    1198:      	str	x0, [x8]
    119c:      	ldp	x29, x30, [sp], #0x10
    11a0:      	ret
    11a4:      	stp	x22, x21, [sp, #-0x30]!
    11a8:      	stp	x20, x19, [sp, #0x10]
    11ac:      	stp	x29, x30, [sp, #0x20]
    11b0:      	add	x29, sp, #0x20
    11b4:      	mov	x19, x1
    11b8:      	mov	x20, x0
    11bc:      	bl	0x26fc <.text+0x16fc>
    11c0:      	mov	x21, x0
    11c4:      	bl	0x23f0 <.text+0x13f0>
    11c8:      	tbz	x21, #0x3f, 0x121c <.text+0x21c>
    11cc:      	and	w8, w0, #0xff
    11d0:      	cbz	w8, 0x121c <.text+0x21c>
    11d4:      	bl	0x2400 <.text+0x1400>
    11d8:      	and	w9, w0, #0xff
    11dc:      	cbz	w9, 0x1204 <.text+0x204>
    11e0:      	orr	w0, wzr, #0x80000000
    11e4:      	bl	0x2410 <.text+0x1410>
    11e8:      	and	w10, w0, #0xff
    11ec:      	cbz	w10, 0x1204 <.text+0x204>
    11f0:      	adrp	x1, 0x3000 <.text+0x2000>
    11f4:      	add	x1, x1, #0x988
    11f8:      	orr	w0, wzr, #0x80000000
    11fc:      	mov	x2, x21
    1200:      	bl	0x1eb0 <.text+0xeb0>
    1204:      	adrp	x0, 0x3000 <.text+0x2000>
    1208:      	adrp	x2, 0x3000 <.text+0x2000>
    120c:      	add	x0, x0, #0x9db
    1210:      	mov	w1, #0x113              // =275
    1214:      	add	x2, x2, #0x9bc
    1218:      	bl	0x223c <.text+0x123c>
    121c:      	mov	x0, x20
    1220:      	mov	x1, x19
    1224:      	bl	0x273c <.text+0x173c>
    1228:      	mov	x21, x0
    122c:      	bl	0x23f0 <.text+0x13f0>
    1230:      	tbz	x21, #0x3f, 0x1284 <.text+0x284>
    1234:      	and	w11, w0, #0xff
    1238:      	cbz	w11, 0x1284 <.text+0x284>
    123c:      	bl	0x2400 <.text+0x1400>
    1240:      	and	w12, w0, #0xff
    1244:      	cbz	w12, 0x126c <.text+0x26c>
    1248:      	orr	w0, wzr, #0x80000000
    124c:      	bl	0x2410 <.text+0x1410>
    1250:      	and	w13, w0, #0xff
    1254:      	cbz	w13, 0x126c <.text+0x26c>
    1258:      	adrp	x1, 0x3000 <.text+0x2000>
    125c:      	add	x1, x1, #0x988
    1260:      	orr	w0, wzr, #0x80000000
    1264:      	mov	x2, x21
    1268:      	bl	0x1eb0 <.text+0xeb0>
    126c:      	adrp	x0, 0x3000 <.text+0x2000>
    1270:      	adrp	x2, 0x3000 <.text+0x2000>
    1274:      	add	x0, x0, #0x9db
    1278:      	mov	w1, #0x116              // =278
    127c:      	add	x2, x2, #0x9bc
    1280:      	bl	0x223c <.text+0x123c>
    1284:      	mov	x0, x20
    1288:      	mov	x1, x19
    128c:      	bl	0x27cc <.text+0x17cc>
    1290:      	mov	x21, x0
    1294:      	bl	0x23f0 <.text+0x13f0>
    1298:      	tbz	x21, #0x3f, 0x12ec <.text+0x2ec>
    129c:      	and	w14, w0, #0xff
    12a0:      	cbz	w14, 0x12ec <.text+0x2ec>
    12a4:      	bl	0x2400 <.text+0x1400>
    12a8:      	and	w15, w0, #0xff
    12ac:      	cbz	w15, 0x12d4 <.text+0x2d4>
    12b0:      	orr	w0, wzr, #0x80000000
    12b4:      	bl	0x2410 <.text+0x1410>
    12b8:      	and	w16, w0, #0xff
    12bc:      	cbz	w16, 0x12d4 <.text+0x2d4>
    12c0:      	adrp	x1, 0x3000 <.text+0x2000>
    12c4:      	add	x1, x1, #0x988
    12c8:      	orr	w0, wzr, #0x80000000
    12cc:      	mov	x2, x21
    12d0:      	bl	0x1eb0 <.text+0xeb0>
    12d4:      	adrp	x0, 0x3000 <.text+0x2000>
    12d8:      	adrp	x2, 0x3000 <.text+0x2000>
    12dc:      	add	x0, x0, #0x9db
    12e0:      	mov	w1, #0x119              // =281
    12e4:      	add	x2, x2, #0x9bc
    12e8:      	bl	0x223c <.text+0x123c>
    12ec:      	mov	x0, x20
    12f0:      	mov	x1, x19
    12f4:      	bl	0x28b0 <.text+0x18b0>
    12f8:      	mov	x19, x0
    12fc:      	bl	0x23f0 <.text+0x13f0>
    1300:      	tbz	x19, #0x3f, 0x1354 <.text+0x354>
    1304:      	and	w17, w0, #0xff
    1308:      	cbz	w17, 0x1354 <.text+0x354>
    130c:      	bl	0x2400 <.text+0x1400>
    1310:      	and	w0, w0, #0xff
    1314:      	cbz	w0, 0x133c <.text+0x33c>
    1318:      	orr	w0, wzr, #0x80000000
    131c:      	bl	0x2410 <.text+0x1410>
    1320:      	and	w1, w0, #0xff
    1324:      	cbz	w1, 0x133c <.text+0x33c>
    1328:      	adrp	x1, 0x3000 <.text+0x2000>
    132c:      	add	x1, x1, #0x988
    1330:      	orr	w0, wzr, #0x80000000
    1334:      	mov	x2, x19
    1338:      	bl	0x1eb0 <.text+0xeb0>
    133c:      	adrp	x0, 0x3000 <.text+0x2000>
    1340:      	adrp	x2, 0x3000 <.text+0x2000>
    1344:      	add	x0, x0, #0x9db
    1348:      	mov	w1, #0x11c              // =284
    134c:      	add	x2, x2, #0x9bc
    1350:      	bl	0x223c <.text+0x123c>
    1354:      	bl	0x2964 <.text+0x1964>
    1358:      	mov	x20, x0
    135c:      	bl	0x23f0 <.text+0x13f0>
    1360:      	tbz	x20, #0x3f, 0x13b4 <.text+0x3b4>
    1364:      	and	w2, w0, #0xff
    1368:      	cbz	w2, 0x13b4 <.text+0x3b4>
    136c:      	bl	0x2400 <.text+0x1400>
    1370:      	and	w3, w0, #0xff
    1374:      	cbz	w3, 0x139c <.text+0x39c>
    1378:      	orr	w0, wzr, #0x80000000
    137c:      	bl	0x2410 <.text+0x1410>
    1380:      	and	w4, w0, #0xff
    1384:      	cbz	w4, 0x139c <.text+0x39c>
    1388:      	adrp	x1, 0x3000 <.text+0x2000>
    138c:      	add	x1, x1, #0x988
    1390:      	orr	w0, wzr, #0x80000000
    1394:      	mov	x2, x20
    1398:      	bl	0x1eb0 <.text+0xeb0>
    139c:      	adrp	x0, 0x3000 <.text+0x2000>
    13a0:      	adrp	x2, 0x3000 <.text+0x2000>
    13a4:      	add	x0, x0, #0x9db
    13a8:      	mov	w1, #0x11f              // =287
    13ac:      	add	x2, x2, #0x9bc
    13b0:      	bl	0x223c <.text+0x123c>
    13b4:      	bl	0x2a50 <.text+0x1a50>
    13b8:      	mov	x21, x0
    13bc:      	bl	0x23f0 <.text+0x13f0>
    13c0:      	tbz	x21, #0x3f, 0x1420 <.text+0x420>
    13c4:      	and	w5, w0, #0xff
    13c8:      	cbz	w5, 0x1420 <.text+0x420>
    13cc:      	bl	0x2400 <.text+0x1400>
    13d0:      	and	w6, w0, #0xff
    13d4:      	cbz	w6, 0x13fc <.text+0x3fc>
    13d8:      	orr	w0, wzr, #0x80000000
    13dc:      	bl	0x2410 <.text+0x1410>
    13e0:      	and	w7, w0, #0xff
    13e4:      	cbz	w7, 0x13fc <.text+0x3fc>
    13e8:      	adrp	x1, 0x3000 <.text+0x2000>
    13ec:      	add	x1, x1, #0x988
    13f0:      	orr	w0, wzr, #0x80000000
    13f4:      	mov	x2, x21
    13f8:      	bl	0x1eb0 <.text+0xeb0>
    13fc:      	ldp	x29, x30, [sp, #0x20]
    1400:      	adrp	x0, 0x3000 <.text+0x2000>
    1404:      	ldp	x20, x19, [sp, #0x10]
    1408:      	adrp	x2, 0x3000 <.text+0x2000>
    140c:      	add	x0, x0, #0x9db
    1410:      	mov	w1, #0x122              // =290
    1414:      	add	x2, x2, #0x9bc
    1418:      	ldp	x22, x21, [sp], #0x30
    141c:      	b	0x223c <.text+0x123c>
    1420:      	ldp	x29, x30, [sp, #0x20]
    1424:      	ldp	x20, x19, [sp, #0x10]
    1428:      	ldp	x22, x21, [sp], #0x30
    142c:      	ret
    1430:      	ret
    1434:      	b	0x1b04 <.text+0xb04>
    1438:      	mov	x0, xzr
    143c:      	ret
    1440:      	stp	x20, x19, [sp, #-0x20]!
    1444:      	stp	x29, x30, [sp, #0x10]
    1448:      	add	x29, sp, #0x10
    144c:      	mov	x19, x1
    1450:      	bl	0x2400 <.text+0x1400>
    1454:      	and	w8, w0, #0xff
    1458:      	cbz	w8, 0x1484 <.text+0x484>
    145c:      	orr	w0, wzr, #0x40
    1460:      	bl	0x2410 <.text+0x1410>
    1464:      	and	w9, w0, #0xff
    1468:      	cbz	w9, 0x1484 <.text+0x484>
    146c:      	adrp	x1, 0x3000 <.text+0x2000>
    1470:      	adrp	x2, 0x3000 <.text+0x2000>
    1474:      	add	x1, x1, #0xa01
    1478:      	add	x2, x2, #0xa09
    147c:      	orr	w0, wzr, #0x40
    1480:      	bl	0x1eb0 <.text+0xeb0>
    1484:      	cbz	x19, 0x14a8 <.text+0x4a8>
    1488:      	adrp	x8, 0x5000
    148c:      	ldr	x0, [x19, #0x38]
    1490:      	ldr	x9, [x8, #0xe8]
    1494:      	ldr	x8, [x9, #0x70]
    1498:      	blr	x8
    149c:      	mov	x0, x19
    14a0:      	bl	0x1e24 <.text+0xe24>
    14a4:      	b	0x14dc <.text+0x4dc>
    14a8:      	bl	0x2400 <.text+0x1400>
    14ac:      	and	w10, w0, #0xff
    14b0:      	cbz	w10, 0x14dc <.text+0x4dc>
    14b4:      	orr	w0, wzr, #0x80000000
    14b8:      	bl	0x2410 <.text+0x1410>
    14bc:      	and	w11, w0, #0xff
    14c0:      	cbz	w11, 0x14dc <.text+0x4dc>
    14c4:      	adrp	x1, 0x3000 <.text+0x2000>
    14c8:      	adrp	x2, 0x3000 <.text+0x2000>
    14cc:      	add	x1, x1, #0xa20
    14d0:      	add	x2, x2, #0xa09
    14d4:      	orr	w0, wzr, #0x80000000
    14d8:      	bl	0x1eb0 <.text+0xeb0>
    14dc:      	bl	0x2400 <.text+0x1400>
    14e0:      	and	w12, w0, #0xff
    14e4:      	cbz	w12, 0x1518 <.text+0x518>
    14e8:      	orr	w0, wzr, #0x40
    14ec:      	bl	0x2410 <.text+0x1410>
    14f0:      	and	w13, w0, #0xff
    14f4:      	cbz	w13, 0x1518 <.text+0x518>
    14f8:      	ldp	x29, x30, [sp, #0x10]
    14fc:      	adrp	x1, 0x3000 <.text+0x2000>
    1500:      	adrp	x2, 0x3000 <.text+0x2000>
    1504:      	add	x1, x1, #0xa37
    1508:      	add	x2, x2, #0xa09
    150c:      	orr	w0, wzr, #0x40
    1510:      	ldp	x20, x19, [sp], #0x20
    1514:      	b	0x1eb0 <.text+0xeb0>
    1518:      	ldp	x29, x30, [sp, #0x10]
    151c:      	ldp	x20, x19, [sp], #0x20
    1520:      	ret
    1524:      	stp	x20, x19, [sp, #-0x20]!
    1528:      	stp	x29, x30, [sp, #0x10]
    152c:      	add	x29, sp, #0x10
    1530:      	mov	x19, x1
    1534:      	mov	x20, x0
    1538:      	bl	0x2400 <.text+0x1400>
    153c:      	and	w8, w0, #0xff
    1540:      	cbz	w8, 0x156c <.text+0x56c>
    1544:      	orr	w0, wzr, #0x40
    1548:      	bl	0x2410 <.text+0x1410>
    154c:      	and	w9, w0, #0xff
    1550:      	cbz	w9, 0x156c <.text+0x56c>
    1554:      	adrp	x1, 0x3000 <.text+0x2000>
    1558:      	adrp	x2, 0x3000 <.text+0x2000>
    155c:      	add	x1, x1, #0xa01
    1560:      	add	x2, x2, #0xa3f
    1564:      	orr	w0, wzr, #0x40
    1568:      	bl	0x1eb0 <.text+0xeb0>
    156c:      	cbz	x20, 0x159c <.text+0x59c>
    1570:      	cbz	x19, 0x159c <.text+0x59c>
    1574:      	bl	0x23f0 <.text+0x13f0>
    1578:      	and	w12, w0, #0xff
    157c:      	cbz	w12, 0x1594 <.text+0x594>
    1580:      	ldur	x8, [x20, #-0x8]
    1584:      	mov	w9, #0x69620000         // =1768030208
    1588:      	movk	w9, #0x7375
    158c:      	cmp	x8, x9
    1590:      	b.ne	0x15dc <.text+0x5dc>
    1594:      	sub	x20, x20, #0x8
    1598:      	b	0x15f4 <.text+0x5f4>
    159c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    15a0:      	movk	x19, #0x2
    15a4:      	bl	0x2400 <.text+0x1400>
    15a8:      	and	w10, w0, #0xff
    15ac:      	cbz	w10, 0x1608 <.text+0x608>
    15b0:      	orr	w0, wzr, #0x80000000
    15b4:      	bl	0x2410 <.text+0x1410>
    15b8:      	and	w11, w0, #0xff
    15bc:      	cbz	w11, 0x1608 <.text+0x608>
    15c0:      	adrp	x1, 0x3000 <.text+0x2000>
    15c4:      	adrp	x2, 0x3000 <.text+0x2000>
    15c8:      	add	x1, x1, #0xa20
    15cc:      	add	x2, x2, #0xa3f
    15d0:      	orr	w0, wzr, #0x80000000
    15d4:      	bl	0x1eb0 <.text+0xeb0>
    15d8:      	b	0x1608 <.text+0x608>
    15dc:      	adrp	x0, 0x3000 <.text+0x2000>
    15e0:      	adrp	x2, 0x3000 <.text+0x2000>
    15e4:      	add	x0, x0, #0xa55
    15e8:      	mov	w1, #0xa6               // =166
    15ec:      	add	x2, x2, #0xa62
    15f0:      	bl	0x223c <.text+0x123c>
    15f4:      	ldr	x0, [x20, #0x30]
    15f8:      	mov	x1, x19
    15fc:      	ldr	x11, [x0, #0x78]
    1600:      	blr	x11
    1604:      	mov	x19, x0
    1608:      	bl	0x2400 <.text+0x1400>
    160c:      	and	w13, w0, #0xff
    1610:      	cbz	w13, 0x163c <.text+0x63c>
    1614:      	orr	w0, wzr, #0x40
    1618:      	bl	0x2410 <.text+0x1410>
    161c:      	and	w14, w0, #0xff
    1620:      	cbz	w14, 0x163c <.text+0x63c>
    1624:      	adrp	x1, 0x3000 <.text+0x2000>
    1628:      	adrp	x2, 0x3000 <.text+0x2000>
    162c:      	add	x1, x1, #0xa37
    1630:      	add	x2, x2, #0xa3f
    1634:      	orr	w0, wzr, #0x40
    1638:      	bl	0x1eb0 <.text+0xeb0>
    163c:      	ldp	x29, x30, [sp, #0x10]
    1640:      	mov	x0, x19
    1644:      	ldp	x20, x19, [sp], #0x20
    1648:      	ret
    164c:      	stp	x22, x21, [sp, #-0x30]!
    1650:      	stp	x20, x19, [sp, #0x10]
    1654:      	stp	x29, x30, [sp, #0x20]
    1658:      	add	x29, sp, #0x20
    165c:      	sub	sp, sp, #0x10
    1660:      	mov	x19, x2
    1664:      	mov	x21, x1
    1668:      	mov	x20, x0
    166c:      	bl	0x2400 <.text+0x1400>
    1670:      	and	w8, w0, #0xff
    1674:      	cbz	w8, 0x16a0 <.text+0x6a0>
    1678:      	orr	w0, wzr, #0x40
    167c:      	bl	0x2410 <.text+0x1410>
    1680:      	and	w9, w0, #0xff
    1684:      	cbz	w9, 0x16a0 <.text+0x6a0>
    1688:      	adrp	x1, 0x3000 <.text+0x2000>
    168c:      	adrp	x2, 0x3000 <.text+0x2000>
    1690:      	add	x1, x1, #0xa01
    1694:      	add	x2, x2, #0xa77
    1698:      	orr	w0, wzr, #0x40
    169c:      	bl	0x1eb0 <.text+0xeb0>
    16a0:      	cbz	x20, 0x16d0 <.text+0x6d0>
    16a4:      	cbz	x19, 0x16d0 <.text+0x6d0>
    16a8:      	bl	0x23f0 <.text+0x13f0>
    16ac:      	and	w12, w0, #0xff
    16b0:      	cbz	w12, 0x16c8 <.text+0x6c8>
    16b4:      	ldur	x8, [x20, #-0x8]
    16b8:      	mov	w9, #0x69620000         // =1768030208
    16bc:      	movk	w9, #0x7375
    16c0:      	cmp	x8, x9
    16c4:      	b.ne	0x1710 <.text+0x710>
    16c8:      	sub	x20, x20, #0x8
    16cc:      	b	0x1728 <.text+0x728>
    16d0:      	mov	x20, #-0x8000000000000000 // =-9223372036854775808
    16d4:      	movk	x20, #0x2
    16d8:      	bl	0x2400 <.text+0x1400>
    16dc:      	and	w10, w0, #0xff
    16e0:      	cbz	w10, 0x1778 <.text+0x778>
    16e4:      	orr	w0, wzr, #0x80000000
    16e8:      	bl	0x2410 <.text+0x1410>
    16ec:      	and	w11, w0, #0xff
    16f0:      	cbz	w11, 0x1778 <.text+0x778>
    16f4:      	adrp	x1, 0x3000 <.text+0x2000>
    16f8:      	adrp	x2, 0x3000 <.text+0x2000>
    16fc:      	add	x1, x1, #0xa20
    1700:      	add	x2, x2, #0xa77
    1704:      	orr	w0, wzr, #0x80000000
    1708:      	bl	0x1eb0 <.text+0xeb0>
    170c:      	b	0x1778 <.text+0x778>
    1710:      	adrp	x0, 0x3000 <.text+0x2000>
    1714:      	adrp	x2, 0x3000 <.text+0x2000>
    1718:      	add	x0, x0, #0xa55
    171c:      	mov	w1, #0xcd               // =205
    1720:      	add	x2, x2, #0xa62
    1724:      	bl	0x223c <.text+0x123c>
    1728:      	cbz	x21, 0x1734 <.text+0x734>
    172c:      	ldrb	w1, [x21]
    1730:      	b	0x1738 <.text+0x738>
    1734:      	mov	w1, wzr
    1738:      	strb	w1, [x19]
    173c:      	add	x2, sp, #0xc
    1740:      	ldr	x0, [x20, #0x30]
    1744:      	ldr	x11, [x0, #0x80]
    1748:      	blr	x11
    174c:      	mov	x20, x0
    1750:      	tbnz	x20, #0x3f, 0x1778 <.text+0x778>
    1754:      	ldr	w9, [sp, #0xc]
    1758:      	ubfx	w8, w9, #3, #2
    175c:      	str	w8, [x19, #0x4]
    1760:      	tbnz	w9, #0x5, 0x176c <.text+0x76c>
    1764:      	mov	x20, xzr
    1768:      	b	0x1778 <.text+0x778>
    176c:      	orr	w13, w8, #0x4
    1770:      	mov	x20, xzr
    1774:      	str	w13, [x19, #0x4]
    1778:      	bl	0x2400 <.text+0x1400>
    177c:      	and	w14, w0, #0xff
    1780:      	cbz	w14, 0x17ac <.text+0x7ac>
    1784:      	orr	w0, wzr, #0x40
    1788:      	bl	0x2410 <.text+0x1410>
    178c:      	and	w15, w0, #0xff
    1790:      	cbz	w15, 0x17ac <.text+0x7ac>
    1794:      	adrp	x1, 0x3000 <.text+0x2000>
    1798:      	adrp	x2, 0x3000 <.text+0x2000>
    179c:      	add	x1, x1, #0xa37
    17a0:      	add	x2, x2, #0xa77
    17a4:      	orr	w0, wzr, #0x40
    17a8:      	bl	0x1eb0 <.text+0xeb0>
    17ac:      	mov	x0, x20
    17b0:      	sub	sp, x29, #0x20
    17b4:      	ldp	x29, x30, [sp, #0x20]
    17b8:      	ldp	x20, x19, [sp, #0x10]
    17bc:      	ldp	x22, x21, [sp], #0x30
    17c0:      	ret
    17c4:      	stp	x22, x21, [sp, #-0x30]!
    17c8:      	stp	x20, x19, [sp, #0x10]
    17cc:      	stp	x29, x30, [sp, #0x20]
    17d0:      	add	x29, sp, #0x20
    17d4:      	sub	sp, sp, #0x10
    17d8:      	mov	w21, w2
    17dc:      	mov	w19, w1
    17e0:      	mov	x20, x0
    17e4:      	bl	0x2400 <.text+0x1400>
    17e8:      	and	w8, w0, #0xff
    17ec:      	cbz	w8, 0x1818 <.text+0x818>
    17f0:      	orr	w0, wzr, #0x40
    17f4:      	bl	0x2410 <.text+0x1410>
    17f8:      	and	w9, w0, #0xff
    17fc:      	cbz	w9, 0x1818 <.text+0x818>
    1800:      	adrp	x1, 0x3000 <.text+0x2000>
    1804:      	adrp	x2, 0x3000 <.text+0x2000>
    1808:      	add	x1, x1, #0xa01
    180c:      	add	x2, x2, #0xa8c
    1810:      	orr	w0, wzr, #0x40
    1814:      	bl	0x1eb0 <.text+0xeb0>
    1818:      	cbz	x20, 0x1844 <.text+0x844>
    181c:      	bl	0x23f0 <.text+0x13f0>
    1820:      	and	w12, w0, #0xff
    1824:      	cbz	w12, 0x183c <.text+0x83c>
    1828:      	ldur	x8, [x20, #-0x8]
    182c:      	mov	w9, #0x69620000         // =1768030208
    1830:      	movk	w9, #0x7375
    1834:      	cmp	x8, x9
    1838:      	b.ne	0x1884 <.text+0x884>
    183c:      	sub	x20, x20, #0x8
    1840:      	b	0x189c <.text+0x89c>
    1844:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    1848:      	movk	x21, #0x2
    184c:      	bl	0x2400 <.text+0x1400>
    1850:      	and	w10, w0, #0xff
    1854:      	cbz	w10, 0x18c8 <.text+0x8c8>
    1858:      	orr	w0, wzr, #0x80000000
    185c:      	bl	0x2410 <.text+0x1410>
    1860:      	and	w11, w0, #0xff
    1864:      	cbz	w11, 0x18c8 <.text+0x8c8>
    1868:      	adrp	x1, 0x3000 <.text+0x2000>
    186c:      	adrp	x2, 0x3000 <.text+0x2000>
    1870:      	add	x1, x1, #0xa20
    1874:      	add	x2, x2, #0xa8c
    1878:      	orr	w0, wzr, #0x80000000
    187c:      	bl	0x1eb0 <.text+0xeb0>
    1880:      	b	0x18c8 <.text+0x8c8>
    1884:      	adrp	x0, 0x3000 <.text+0x2000>
    1888:      	adrp	x2, 0x3000 <.text+0x2000>
    188c:      	add	x0, x0, #0xa55
    1890:      	add	x2, x2, #0xa62
    1894:      	orr	w1, wzr, #0xfe
    1898:      	bl	0x223c <.text+0x123c>
    189c:      	add	x1, sp, #0xc
    18a0:      	mov	w0, w21
    18a4:      	bl	0x1914 <.text+0x914>
    18a8:      	mov	x21, x0
    18ac:      	tbnz	x21, #0x3f, 0x18c8 <.text+0x8c8>
    18b0:      	ldr	x0, [x20, #0x30]
    18b4:      	and	w1, w19, #0xff
    18b8:      	ldr	w2, [sp, #0xc]
    18bc:      	ldr	x11, [x0, #0x50]
    18c0:      	blr	x11
    18c4:      	mov	x21, x0
    18c8:      	bl	0x2400 <.text+0x1400>
    18cc:      	and	w13, w0, #0xff
    18d0:      	cbz	w13, 0x18fc <.text+0x8fc>
    18d4:      	orr	w0, wzr, #0x40
    18d8:      	bl	0x2410 <.text+0x1410>
    18dc:      	and	w14, w0, #0xff
    18e0:      	cbz	w14, 0x18fc <.text+0x8fc>
    18e4:      	adrp	x1, 0x3000 <.text+0x2000>
    18e8:      	adrp	x2, 0x3000 <.text+0x2000>
    18ec:      	add	x1, x1, #0xa37
    18f0:      	add	x2, x2, #0xa8c
    18f4:      	orr	w0, wzr, #0x40
    18f8:      	bl	0x1eb0 <.text+0xeb0>
    18fc:      	mov	x0, x21
    1900:      	sub	sp, x29, #0x20
    1904:      	ldp	x29, x30, [sp, #0x20]
    1908:      	ldp	x20, x19, [sp, #0x10]
    190c:      	ldp	x22, x21, [sp], #0x30
    1910:      	ret
    1914:      	stp	x20, x19, [sp, #-0x20]!
    1918:      	stp	x29, x30, [sp, #0x10]
    191c:      	add	x29, sp, #0x10
    1920:      	cbz	x1, 0x1948 <.text+0x948>
    1924:      	tbnz	w0, #0x2, 0x1988 <.text+0x988>
    1928:      	tbnz	w0, #0x1, 0x1998 <.text+0x998>
    192c:      	tst	w0, #0x1
    1930:      	orr	w11, wzr, #0x10000
    1934:      	orr	w12, wzr, #0x8
    1938:      	csel	w13, w12, w11, ne
    193c:      	mov	x19, xzr
    1940:      	str	w13, [x1]
    1944:      	b	0x19a4 <.text+0x9a4>
    1948:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    194c:      	movk	x19, #0x2
    1950:      	bl	0x2400 <.text+0x1400>
    1954:      	and	w8, w0, #0xff
    1958:      	cbz	w8, 0x19a4 <.text+0x9a4>
    195c:      	orr	w0, wzr, #0x80000000
    1960:      	bl	0x2410 <.text+0x1410>
    1964:      	and	w9, w0, #0xff
    1968:      	cbz	w9, 0x19a4 <.text+0x9a4>
    196c:      	adrp	x1, 0x3000 <.text+0x2000>
    1970:      	adrp	x2, 0x3000 <.text+0x2000>
    1974:      	add	x1, x1, #0xa20
    1978:      	add	x2, x2, #0xafa
    197c:      	orr	w0, wzr, #0x80000000
    1980:      	bl	0x1eb0 <.text+0xeb0>
    1984:      	b	0x19a4 <.text+0x9a4>
    1988:      	orr	w8, wzr, #0x20
    198c:      	mov	x19, xzr
    1990:      	str	w8, [x1]
    1994:      	b	0x19a4 <.text+0x9a4>
    1998:      	orr	w9, wzr, #0x10
    199c:      	mov	x19, xzr
    19a0:      	str	w9, [x1]
    19a4:      	ldp	x29, x30, [sp, #0x10]
    19a8:      	mov	x0, x19
    19ac:      	ldp	x20, x19, [sp], #0x20
    19b0:      	ret
    19b4:      	stp	x22, x21, [sp, #-0x30]!
    19b8:      	stp	x20, x19, [sp, #0x10]
    19bc:      	stp	x29, x30, [sp, #0x20]
    19c0:      	add	x29, sp, #0x20
    19c4:      	sub	sp, sp, #0x10
    19c8:      	mov	w21, w2
    19cc:      	mov	w19, w1
    19d0:      	mov	x20, x0
    19d4:      	bl	0x2400 <.text+0x1400>
    19d8:      	and	w8, w0, #0xff
    19dc:      	cbz	w8, 0x1a08 <.text+0xa08>
    19e0:      	orr	w0, wzr, #0x40
    19e4:      	bl	0x2410 <.text+0x1410>
    19e8:      	and	w9, w0, #0xff
    19ec:      	cbz	w9, 0x1a08 <.text+0xa08>
    19f0:      	adrp	x1, 0x3000 <.text+0x2000>
    19f4:      	adrp	x2, 0x3000 <.text+0x2000>
    19f8:      	add	x1, x1, #0xa01
    19fc:      	add	x2, x2, #0xaa3
    1a00:      	orr	w0, wzr, #0x40
    1a04:      	bl	0x1eb0 <.text+0xeb0>
    1a08:      	cbz	x20, 0x1a34 <.text+0xa34>
    1a0c:      	bl	0x23f0 <.text+0x13f0>
    1a10:      	and	w12, w0, #0xff
    1a14:      	cbz	w12, 0x1a2c <.text+0xa2c>
    1a18:      	ldur	x8, [x20, #-0x8]
    1a1c:      	mov	w9, #0x69620000         // =1768030208
    1a20:      	movk	w9, #0x7375
    1a24:      	cmp	x8, x9
    1a28:      	b.ne	0x1a74 <.text+0xa74>
    1a2c:      	sub	x20, x20, #0x8
    1a30:      	b	0x1a8c <.text+0xa8c>
    1a34:      	mov	x21, #-0x8000000000000000 // =-9223372036854775808
    1a38:      	movk	x21, #0x2
    1a3c:      	bl	0x2400 <.text+0x1400>
    1a40:      	and	w10, w0, #0xff
    1a44:      	cbz	w10, 0x1ab8 <.text+0xab8>
    1a48:      	orr	w0, wzr, #0x80000000
    1a4c:      	bl	0x2410 <.text+0x1410>
    1a50:      	and	w11, w0, #0xff
    1a54:      	cbz	w11, 0x1ab8 <.text+0xab8>
    1a58:      	adrp	x1, 0x3000 <.text+0x2000>
    1a5c:      	adrp	x2, 0x3000 <.text+0x2000>
    1a60:      	add	x1, x1, #0xa20
    1a64:      	add	x2, x2, #0xaa3
    1a68:      	orr	w0, wzr, #0x80000000
    1a6c:      	bl	0x1eb0 <.text+0xeb0>
    1a70:      	b	0x1ab8 <.text+0xab8>
    1a74:      	adrp	x0, 0x3000 <.text+0x2000>
    1a78:      	adrp	x2, 0x3000 <.text+0x2000>
    1a7c:      	add	x0, x0, #0xa55
    1a80:      	mov	w1, #0x12a              // =298
    1a84:      	add	x2, x2, #0xa62
    1a88:      	bl	0x223c <.text+0x123c>
    1a8c:      	add	x1, sp, #0xc
    1a90:      	mov	w0, w21
    1a94:      	bl	0x1914 <.text+0x914>
    1a98:      	mov	x21, x0
    1a9c:      	tbnz	x21, #0x3f, 0x1ab8 <.text+0xab8>
    1aa0:      	ldr	x0, [x20, #0x30]
    1aa4:      	and	w1, w19, #0xff
    1aa8:      	ldr	w2, [sp, #0xc]
    1aac:      	ldr	x11, [x0, #0x58]
    1ab0:      	blr	x11
    1ab4:      	mov	x21, x0
    1ab8:      	bl	0x2400 <.text+0x1400>
    1abc:      	and	w13, w0, #0xff
    1ac0:      	cbz	w13, 0x1aec <.text+0xaec>
    1ac4:      	orr	w0, wzr, #0x40
    1ac8:      	bl	0x2410 <.text+0x1410>
    1acc:      	and	w14, w0, #0xff
    1ad0:      	cbz	w14, 0x1aec <.text+0xaec>
    1ad4:      	adrp	x1, 0x3000 <.text+0x2000>
    1ad8:      	adrp	x2, 0x3000 <.text+0x2000>
    1adc:      	add	x1, x1, #0xa37
    1ae0:      	add	x2, x2, #0xaa3
    1ae4:      	orr	w0, wzr, #0x40
    1ae8:      	bl	0x1eb0 <.text+0xeb0>
    1aec:      	mov	x0, x21
    1af0:      	sub	sp, x29, #0x20
    1af4:      	ldp	x29, x30, [sp, #0x20]
    1af8:      	ldp	x20, x19, [sp, #0x10]
    1afc:      	ldp	x22, x21, [sp], #0x30
    1b00:      	ret
    1b04:      	stp	x20, x19, [sp, #-0x20]!
    1b08:      	stp	x29, x30, [sp, #0x10]
    1b0c:      	add	x29, sp, #0x10
    1b10:      	sub	sp, sp, #0x20
    1b14:      	str	x0, [sp, #0x18]
    1b18:      	bl	0x2400 <.text+0x1400>
    1b1c:      	and	w8, w0, #0xff
    1b20:      	cbz	w8, 0x1b4c <.text+0xb4c>
    1b24:      	orr	w0, wzr, #0x40
    1b28:      	bl	0x2410 <.text+0x1410>
    1b2c:      	and	w9, w0, #0xff
    1b30:      	cbz	w9, 0x1b4c <.text+0xb4c>
    1b34:      	adrp	x1, 0x3000 <.text+0x2000>
    1b38:      	adrp	x2, 0x3000 <.text+0x2000>
    1b3c:      	add	x1, x1, #0xa01
    1b40:      	add	x2, x2, #0xab9
    1b44:      	orr	w0, wzr, #0x40
    1b48:      	bl	0x1eb0 <.text+0xeb0>
    1b4c:      	bl	0x2400 <.text+0x1400>
    1b50:      	and	w10, w0, #0xff
    1b54:      	cbz	w10, 0x1b80 <.text+0xb80>
    1b58:      	orr	w0, wzr, #0x40
    1b5c:      	bl	0x2410 <.text+0x1410>
    1b60:      	and	w11, w0, #0xff
    1b64:      	cbz	w11, 0x1b80 <.text+0xb80>
    1b68:      	adrp	x1, 0x3000 <.text+0x2000>
    1b6c:      	adrp	x2, 0x3000 <.text+0x2000>
    1b70:      	add	x1, x1, #0xa01
    1b74:      	add	x2, x2, #0xb17
    1b78:      	orr	w0, wzr, #0x40
    1b7c:      	bl	0x1eb0 <.text+0xeb0>
    1b80:      	orr	w0, wzr, #0x40
    1b84:      	bl	0x1e14 <.text+0xe14>
    1b88:      	mov	x19, x0
    1b8c:      	cbz	x19, 0x1c38 <.text+0xc38>
    1b90:      	adrp	x9, 0x1000 <.text>
    1b94:      	add	x9, x9, #0x7c4
    1b98:      	adrp	x11, 0x1000 <.text>
    1b9c:      	add	x11, x11, #0x9b4
    1ba0:      	fmov	d0, x9
    1ba4:      	mov	w8, #0x69620000         // =1768030208
    1ba8:      	adrp	x12, 0x1000 <.text>
    1bac:      	adrp	x13, 0x1000 <.text>
    1bb0:      	movk	w8, #0x7375
    1bb4:      	orr	w10, wzr, #0x10000
    1bb8:      	add	x12, x12, #0x524
    1bbc:      	mov	v0.d[1], x11
    1bc0:      	add	x13, x13, #0x64c
    1bc4:      	stp	x8, x10, [x19]
    1bc8:      	adrp	x20, 0x5000
    1bcc:      	adrp	x0, 0x5000
    1bd0:      	stp	x12, x13, [x19, #0x10]
    1bd4:      	add	x2, x19, #0x30
    1bd8:      	mov	x1, xzr
    1bdc:      	add	x0, x0, #0x70
    1be0:      	str	q0, [sp]
    1be4:      	ldr	x14, [sp, #0x8]
    1be8:      	str	x14, [x19, #0x28]
    1bec:      	ldr	x15, [sp]
    1bf0:      	str	x15, [x19, #0x20]
    1bf4:      	ldr	x8, [x20, #0xe8]
    1bf8:      	ldr	x16, [x8, #0x140]
    1bfc:      	blr	x16
    1c00:      	tbnz	x0, #0x3f, 0x1c70 <.text+0xc70>
    1c04:      	ldr	x9, [x20, #0xe8]
    1c08:      	adrp	x2, 0x1000 <.text>
    1c0c:      	adrp	x4, 0x5000
    1c10:      	add	x5, x19, #0x38
    1c14:      	add	x2, x2, #0x440
    1c18:      	ldr	x17, [x9, #0x170]
    1c1c:      	add	x4, x4, #0x20
    1c20:      	orr	w0, wzr, #0x200
    1c24:      	orr	w1, wzr, #0x8
    1c28:      	mov	x3, x19
    1c2c:      	blr	x17
    1c30:      	tbz	x0, #0x3f, 0x1cb0 <.text+0xcb0>
    1c34:      	b	0x1ca4 <.text+0xca4>
    1c38:      	bl	0x2400 <.text+0x1400>
    1c3c:      	and	w12, w0, #0xff
    1c40:      	cbz	w12, 0x1cb0 <.text+0xcb0>
    1c44:      	orr	w0, wzr, #0x80000000
    1c48:      	bl	0x2410 <.text+0x1410>
    1c4c:      	and	w13, w0, #0xff
    1c50:      	cbz	w13, 0x1cb0 <.text+0xcb0>
    1c54:      	adrp	x1, 0x3000 <.text+0x2000>
    1c58:      	adrp	x2, 0x3000 <.text+0x2000>
    1c5c:      	add	x1, x1, #0xb2c
    1c60:      	add	x2, x2, #0xb17
    1c64:      	orr	w0, wzr, #0x80000000
    1c68:      	bl	0x1eb0 <.text+0xeb0>
    1c6c:      	b	0x1cb0 <.text+0xcb0>
    1c70:      	bl	0x2400 <.text+0x1400>
    1c74:      	and	w14, w0, #0xff
    1c78:      	cbz	w14, 0x1ca4 <.text+0xca4>
    1c7c:      	orr	w0, wzr, #0x80000000
    1c80:      	bl	0x2410 <.text+0x1410>
    1c84:      	and	w15, w0, #0xff
    1c88:      	cbz	w15, 0x1ca4 <.text+0xca4>
    1c8c:      	adrp	x1, 0x3000 <.text+0x2000>
    1c90:      	adrp	x2, 0x3000 <.text+0x2000>
    1c94:      	add	x1, x1, #0xb55
    1c98:      	add	x2, x2, #0xb17
    1c9c:      	orr	w0, wzr, #0x80000000
    1ca0:      	bl	0x1eb0 <.text+0xeb0>
    1ca4:      	mov	x0, x19
    1ca8:      	bl	0x1e24 <.text+0xe24>
    1cac:      	mov	x19, xzr
    1cb0:      	bl	0x2400 <.text+0x1400>
    1cb4:      	and	w16, w0, #0xff
    1cb8:      	cbz	w16, 0x1ce4 <.text+0xce4>
    1cbc:      	orr	w0, wzr, #0x40
    1cc0:      	bl	0x2410 <.text+0x1410>
    1cc4:      	and	w17, w0, #0xff
    1cc8:      	cbz	w17, 0x1ce4 <.text+0xce4>
    1ccc:      	adrp	x1, 0x3000 <.text+0x2000>
    1cd0:      	adrp	x2, 0x3000 <.text+0x2000>
    1cd4:      	add	x1, x1, #0xa37
    1cd8:      	add	x2, x2, #0xb17
    1cdc:      	orr	w0, wzr, #0x40
    1ce0:      	bl	0x1eb0 <.text+0xeb0>
    1ce4:      	cbz	x19, 0x1d4c <.text+0xd4c>
    1ce8:      	adrp	x10, 0x5000
    1cec:      	adrp	x1, 0x5000
    1cf0:      	add	x2, x19, #0x8
    1cf4:      	ldr	x11, [x10, #0xe8]
    1cf8:      	add	x1, x1, #0x60
    1cfc:      	add	x0, sp, #0x18
    1d00:      	mov	x3, xzr
    1d04:      	ldr	x5, [x11, #0x148]
    1d08:      	blr	x5
    1d0c:      	mov	x19, x0
    1d10:      	tbz	x19, #0x3f, 0x1d54 <.text+0xd54>
    1d14:      	bl	0x2400 <.text+0x1400>
    1d18:      	and	w0, w0, #0xff
    1d1c:      	cbz	w0, 0x1d54 <.text+0xd54>
    1d20:      	orr	w0, wzr, #0x80000000
    1d24:      	bl	0x2410 <.text+0x1410>
    1d28:      	and	w1, w0, #0xff
    1d2c:      	cbz	w1, 0x1d54 <.text+0xd54>
    1d30:      	adrp	x1, 0x3000 <.text+0x2000>
    1d34:      	adrp	x2, 0x3000 <.text+0x2000>
    1d38:      	add	x1, x1, #0xad1
    1d3c:      	add	x2, x2, #0xab9
    1d40:      	orr	w0, wzr, #0x80000000
    1d44:      	bl	0x1eb0 <.text+0xeb0>
    1d48:      	b	0x1d54 <.text+0xd54>
    1d4c:      	mov	x19, #-0x8000000000000000 // =-9223372036854775808
    1d50:      	movk	x19, #0x9
    1d54:      	bl	0x2400 <.text+0x1400>
    1d58:      	and	w2, w0, #0xff
    1d5c:      	cbz	w2, 0x1d88 <.text+0xd88>
    1d60:      	orr	w0, wzr, #0x40
    1d64:      	bl	0x2410 <.text+0x1410>
    1d68:      	and	w3, w0, #0xff
    1d6c:      	cbz	w3, 0x1d88 <.text+0xd88>
    1d70:      	adrp	x1, 0x3000 <.text+0x2000>
    1d74:      	adrp	x2, 0x3000 <.text+0x2000>
    1d78:      	add	x1, x1, #0xa37
    1d7c:      	add	x2, x2, #0xab9
    1d80:      	orr	w0, wzr, #0x40
    1d84:      	bl	0x1eb0 <.text+0xeb0>
    1d88:      	mov	x0, x19
    1d8c:      	sub	sp, x29, #0x10
    1d90:      	ldp	x29, x30, [sp, #0x10]
    1d94:      	ldp	x20, x19, [sp], #0x20
    1d98:      	ret
    1d9c:      	stp	x29, x30, [sp, #-0x10]!
    1da0:      	mov	x29, sp
    1da4:      	sub	sp, sp, #0x10
    1da8:      	adrp	x8, 0x5000
    1dac:      	add	x2, sp, #0x8
    1db0:      	ldr	x9, [x8, #0xe8]
    1db4:      	ldr	x8, [x9, #0x40]
    1db8:      	blr	x8
    1dbc:      	tbnz	x0, #0x3f, 0x1dc8 <.text+0xdc8>
    1dc0:      	ldr	x0, [sp, #0x8]
    1dc4:      	b	0x1dd0 <.text+0xdd0>
    1dc8:      	mov	x0, xzr
    1dcc:      	str	xzr, [sp, #0x8]
    1dd0:      	mov	sp, x29
    1dd4:      	ldp	x29, x30, [sp], #0x10
    1dd8:      	ret
    1ddc:      	stp	x20, x19, [sp, #-0x20]!
    1de0:      	stp	x29, x30, [sp, #0x10]
    1de4:      	add	x29, sp, #0x10
    1de8:      	mov	x19, x1
    1dec:      	bl	0x1d9c <.text+0xd9c>
    1df0:      	cbz	x0, 0x1e04 <.text+0xe04>
    1df4:      	ldp	x29, x30, [sp, #0x10]
    1df8:      	mov	x1, x19
    1dfc:      	ldp	x20, x19, [sp], #0x20
    1e00:      	b	0x2e50 <.text+0x1e50>
    1e04:      	ldp	x29, x30, [sp, #0x10]
    1e08:      	mov	x0, xzr
    1e0c:      	ldp	x20, x19, [sp], #0x20
    1e10:      	ret
    1e14:      	mov	x8, x0
    1e18:      	orr	w0, wzr, #0x4
    1e1c:      	mov	x1, x8
    1e20:      	b	0x1ddc <.text+0xddc>
    1e24:      	stp	x20, x19, [sp, #-0x20]!
    1e28:      	stp	x29, x30, [sp, #0x10]
    1e2c:      	add	x29, sp, #0x10
    1e30:      	adrp	x8, 0x5000
    1e34:      	ldr	x9, [x8, #0xe8]
    1e38:      	ldr	x8, [x9, #0x48]
    1e3c:      	blr	x8
    1e40:      	mov	x19, x0
    1e44:      	bl	0x23f0 <.text+0x13f0>
    1e48:      	tbz	x19, #0x3f, 0x1ea4 <.text+0xea4>
    1e4c:      	and	w8, w0, #0xff
    1e50:      	cbz	w8, 0x1ea4 <.text+0xea4>
    1e54:      	bl	0x2400 <.text+0x1400>
    1e58:      	and	w9, w0, #0xff
    1e5c:      	cbz	w9, 0x1e84 <.text+0xe84>
    1e60:      	orr	w0, wzr, #0x80000000
    1e64:      	bl	0x2410 <.text+0x1410>
    1e68:      	and	w10, w0, #0xff
    1e6c:      	cbz	w10, 0x1e84 <.text+0xe84>
    1e70:      	adrp	x1, 0x3000 <.text+0x2000>
    1e74:      	add	x1, x1, #0x988
    1e78:      	orr	w0, wzr, #0x80000000
    1e7c:      	mov	x2, x19
    1e80:      	bl	0x1eb0 <.text+0xeb0>
    1e84:      	ldp	x29, x30, [sp, #0x10]
    1e88:      	adrp	x0, 0x3000 <.text+0x2000>
    1e8c:      	adrp	x2, 0x3000 <.text+0x2000>
    1e90:      	add	x0, x0, #0xb83
    1e94:      	mov	w1, #0x333              // =819
    1e98:      	add	x2, x2, #0x9bc
    1e9c:      	ldp	x20, x19, [sp], #0x20
    1ea0:      	b	0x223c <.text+0x123c>
    1ea4:      	ldp	x29, x30, [sp, #0x10]
    1ea8:      	ldp	x20, x19, [sp], #0x20
    1eac:      	ret
    1eb0:      	stp	x28, x27, [sp, #-0x50]!
    1eb4:      	stp	x24, x23, [sp, #0x10]
    1eb8:      	stp	x22, x21, [sp, #0x20]
    1ebc:      	stp	x20, x19, [sp, #0x30]
    1ec0:      	stp	x29, x30, [sp, #0x40]
    1ec4:      	add	x29, sp, #0x40
    1ec8:      	sub	sp, sp, #0x1a0
    1ecc:      	mov	x21, x1
    1ed0:      	stp	q6, q7, [sp, #0x60]
    1ed4:      	mov	x23, x0
    1ed8:      	stp	q4, q5, [sp, #0x40]
    1edc:      	stp	q2, q3, [sp, #0x20]
    1ee0:      	stp	q0, q1, [sp]
    1ee4:      	stp	x6, x7, [sp, #0xa0]
    1ee8:      	stp	x4, x5, [sp, #0x90]
    1eec:      	stp	x2, x3, [sp, #0x80]
    1ef0:      	cbz	x21, 0x21b0 <.text+0x11b0>
    1ef4:      	bl	0x2b14 <.text+0x1b14>
    1ef8:      	mov	w10, w0
    1efc:      	and	x11, x10, x23
    1f00:      	cbz	x11, 0x2204 <.text+0x1204>
    1f04:      	mov	x0, x21
    1f08:      	bl	0x25e8 <.text+0x15e8>
    1f0c:      	add	x19, x0, #0x68
    1f10:      	cmp	x19, #0xd0
    1f14:      	b.hi	0x2204 <.text+0x1204>
    1f18:      	add	x8, sp, #0xd0
    1f1c:      	str	w23, [sp, #0xd4]
    1f20:      	add	x22, x8, #0x68
    1f24:      	mov	w1, #0x68               // =104
    1f28:      	mov	x0, x22
    1f2c:      	mov	x2, x21
    1f30:      	mov	x3, x1
    1f34:      	orr	x20, x8, #0x4
    1f38:      	add	x24, x8, #0x8
    1f3c:      	bl	0x246c <.text+0x146c>
    1f40:      	mov	x10, sp
    1f44:      	add	x11, sp, #0x80
    1f48:      	orr	w8, wzr, #0xffffff80
    1f4c:      	mov	w9, #-0x30              // =-48
    1f50:      	add	x6, x10, #0x80
    1f54:      	add	x7, x11, #0x30
    1f58:      	add	x10, x29, #0x10
    1f5c:      	stp	w9, w8, [sp, #0xc8]
    1f60:      	orr	w8, wzr, #0x1
    1f64:      	stp	x7, x6, [sp, #0xb8]
    1f68:      	mov	x9, #0x680100000000     // =114353504256000
    1f6c:      	str	x10, [sp, #0xb0]
    1f70:      	adrp	x10, 0x3000 <.text+0x2000>
    1f74:      	add	x10, x10, #0xc30
    1f78:      	b	0x1f80 <.text+0xf80>
    1f7c:      	add	x21, x21, #0x1
    1f80:      	ldrb	w11, [x21]
    1f84:      	cmp	w11, #0x25
    1f88:      	b.eq	0x1f94 <.text+0xf94>
    1f8c:      	cbnz	w11, 0x1f7c <.text+0xf7c>
    1f90:      	b	0x21cc <.text+0x11cc>
    1f94:      	mov	w14, wzr
    1f98:      	b	0x1fa8 <.text+0xfa8>
    1f9c:      	ldr	x16, [x17]
    1fa0:      	mov	w14, w11
    1fa4:      	str	x16, [x24], #0x8
    1fa8:      	mov	x12, x21
    1fac:      	ldrb	w13, [x21, #0x1]!
    1fb0:      	mov	w11, w14
    1fb4:      	cmp	w13, #0x2e
    1fb8:      	b.hi	0x1fcc <.text+0xfcc>
    1fbc:      	lsl	x14, x8, x13
    1fc0:      	and	x15, x14, x9
    1fc4:      	mov	w14, w11
    1fc8:      	cbnz	x15, 0x1fa8 <.text+0xfa8>
    1fcc:      	sub	w14, w13, #0x30
    1fd0:      	cmp	w14, #0xa
    1fd4:      	mov	w14, w11
    1fd8:      	b.lo	0x1fa8 <.text+0xfa8>
    1fdc:      	cmp	w13, #0x4b
    1fe0:      	b.gt	0x2014 <.text+0x1014>
    1fe4:      	cmp	w13, #0x2a
    1fe8:      	b.ne	0x2038 <.text+0x1038>
    1fec:      	ldrsw	x14, [sp, #0xc8]
    1ff0:      	tbz	w14, #0x1f, 0x2004 <.text+0x1004>
    1ff4:      	add	w12, w14, #0x8
    1ff8:      	cmp	w12, #0x0
    1ffc:      	str	w12, [sp, #0xc8]
    2000:      	b.le	0x202c <.text+0x102c>
    2004:      	ldr	x17, [sp, #0xb0]
    2008:      	add	x13, x17, #0x8
    200c:      	str	x13, [sp, #0xb0]
    2010:      	b	0x1f9c <.text+0xf9c>
    2014:      	orr	w14, wzr, #0x1
    2018:      	cmp	w13, #0x4c
    201c:      	b.eq	0x1fa8 <.text+0xfa8>
    2020:      	cmp	w13, #0x6c
    2024:      	b.eq	0x1fa8 <.text+0xfa8>
    2028:      	b	0x2044 <.text+0x1044>
    202c:      	ldr	x13, [sp, #0xb8]
    2030:      	add	x17, x13, x14
    2034:      	b	0x1f9c <.text+0xf9c>
    2038:      	cbnz	w13, 0x2044 <.text+0x1044>
    203c:      	mov	x21, x12
    2040:      	b	0x2048 <.text+0x1048>
    2044:      	add	x21, x12, #0x1
    2048:      	ldrb	w13, [x21]
    204c:      	sub	w5, w13, #0x61
    2050:      	cmp	w5, #0x17
    2054:      	b.hi	0x2090 <.text+0x1090>
    2058:      	ldr	x17, [x10, x5, lsl #3]
    205c:      	br	x17
    2060:      	ldrsw	x15, [sp, #0xc8]
    2064:      	tbz	w15, #0x1f, 0x2078 <.text+0x1078>
    2068:      	add	w1, w15, #0x8
    206c:      	cmp	w1, #0x0
    2070:      	str	w1, [sp, #0xc8]
    2074:      	b.le	0x2198 <.text+0x1198>
    2078:      	ldr	x3, [sp, #0xb0]
    207c:      	add	x15, x3, #0x8
    2080:      	str	x15, [sp, #0xb0]
    2084:      	ldr	x2, [x3]
    2088:      	str	x2, [x24], #0x8
    208c:      	b	0x2168 <.text+0x1168>
    2090:      	cmp	w13, #0x53
    2094:      	b.eq	0x20e0 <.text+0x10e0>
    2098:      	cmp	w13, #0x58
    209c:      	b.ne	0x2168 <.text+0x1168>
    20a0:      	ldrsw	x12, [sp, #0xc8]
    20a4:      	and	w15, w11, #0xff
    20a8:      	cbnz	w15, 0x2110 <.text+0x1110>
    20ac:      	cmp	w13, #0x70
    20b0:      	b.eq	0x2110 <.text+0x1110>
    20b4:      	tbz	w12, #0x1f, 0x20c8 <.text+0x10c8>
    20b8:      	add	w17, w12, #0x8
    20bc:      	cmp	w17, #0x0
    20c0:      	str	w17, [sp, #0xc8]
    20c4:      	b.le	0x2180 <.text+0x1180>
    20c8:      	ldr	x1, [sp, #0xb0]
    20cc:      	add	x14, x1, #0x8
    20d0:      	str	x14, [sp, #0xb0]
    20d4:      	ldr	x5, [x1]
    20d8:      	str	w5, [x24], #0x8
    20dc:      	b	0x2168 <.text+0x1168>
    20e0:      	ldrsw	x11, [sp, #0xc8]
    20e4:      	tbz	w11, #0x1f, 0x20f8 <.text+0x10f8>
    20e8:      	add	w0, w11, #0x8
    20ec:      	cmp	w0, #0x0
    20f0:      	str	w0, [sp, #0xc8]
    20f4:      	b.le	0x2174 <.text+0x1174>
    20f8:      	ldr	x2, [sp, #0xb0]
    20fc:      	add	x11, x2, #0x8
    2100:      	str	x11, [sp, #0xb0]
    2104:      	ldr	x0, [x2]
    2108:      	str	x0, [x24], #0x8
    210c:      	b	0x2168 <.text+0x1168>
    2110:      	tbz	w12, #0x1f, 0x2124 <.text+0x1124>
    2114:      	add	w16, w12, #0x8
    2118:      	cmp	w16, #0x0
    211c:      	str	w16, [sp, #0xc8]
    2120:      	b.le	0x218c <.text+0x118c>
    2124:      	ldr	x0, [sp, #0xb0]
    2128:      	add	x12, x0, #0x8
    212c:      	str	x12, [sp, #0xb0]
    2130:      	ldr	x7, [x0]
    2134:      	str	x7, [x24], #0x8
    2138:      	b	0x2168 <.text+0x1168>
    213c:      	ldrsw	x16, [sp, #0xc8]
    2140:      	tbz	w16, #0x1f, 0x2154 <.text+0x1154>
    2144:      	add	w2, w16, #0x8
    2148:      	cmp	w2, #0x0
    214c:      	str	w2, [sp, #0xc8]
    2150:      	b.le	0x21a4 <.text+0x11a4>
    2154:      	ldr	x4, [sp, #0xb0]
    2158:      	add	x16, x4, #0x8
    215c:      	str	x16, [sp, #0xb0]
    2160:      	ldr	x11, [x4]
    2164:      	str	x11, [x24], #0x8
    2168:      	cmp	x24, x22
    216c:      	b.ls	0x1f7c <.text+0xf7c>
    2170:      	b	0x2220 <.text+0x1220>
    2174:      	ldr	x3, [sp, #0xb8]
    2178:      	add	x2, x3, x11
    217c:      	b	0x2104 <.text+0x1104>
    2180:      	ldr	x6, [sp, #0xb8]
    2184:      	add	x1, x6, x12
    2188:      	b	0x20d4 <.text+0x10d4>
    218c:      	ldr	x23, [sp, #0xb8]
    2190:      	add	x0, x23, x12
    2194:      	b	0x2130 <.text+0x1130>
    2198:      	ldr	x1, [sp, #0xb8]
    219c:      	add	x3, x1, x15
    21a0:      	b	0x2084 <.text+0x1084>
    21a4:      	ldr	x4, [sp, #0xb8]
    21a8:      	add	x4, x4, x16
    21ac:      	b	0x2160 <.text+0x1160>
    21b0:      	adrp	x0, 0x3000 <.text+0x2000>
    21b4:      	adrp	x2, 0x3000 <.text+0x2000>
    21b8:      	add	x0, x0, #0xcf0
    21bc:      	mov	w1, #0x44               // =68
    21c0:      	add	x2, x2, #0xcfb
    21c4:      	bl	0x223c <.text+0x123c>
    21c8:      	b	0x21c8 <.text+0x11c8>
    21cc:      	bl	0x2c38 <.text+0x1c38>
    21d0:      	bl	0x2c48 <.text+0x1c48>
    21d4:      	bl	0x2c58 <.text+0x1c58>
    21d8:      	and	w8, w0, #0xff
    21dc:      	cbz	w8, 0x2204 <.text+0x1204>
    21e0:      	adrp	x4, 0x5000
    21e4:      	mov	w2, wzr
    21e8:      	mov	x3, xzr
    21ec:      	mov	w1, #0x3050000          // =50659328
    21f0:      	add	x4, x4, #0x40
    21f4:      	orr	w0, wzr, #0x3
    21f8:      	mov	x5, x20
    21fc:      	mov	x6, x19
    2200:      	bl	0x2c68 <.text+0x1c68>
    2204:      	sub	sp, x29, #0x40
    2208:      	ldp	x29, x30, [sp, #0x40]
    220c:      	ldp	x20, x19, [sp, #0x30]
    2210:      	ldp	x22, x21, [sp, #0x20]
    2214:      	ldp	x24, x23, [sp, #0x10]
    2218:      	ldp	x28, x27, [sp], #0x50
    221c:      	ret
    2220:      	adrp	x0, 0x3000 <.text+0x2000>
    2224:      	adrp	x2, 0x3000 <.text+0x2000>
    2228:      	add	x0, x0, #0xcf0
    222c:      	mov	w1, #0xce               // =206
    2230:      	add	x2, x2, #0xd12
    2234:      	bl	0x223c <.text+0x123c>
    2238:      	b	0x2238 <.text+0x1238>
    223c:      	stp	x28, x27, [sp, #-0x60]!
    2240:      	stp	x26, x25, [sp, #0x10]
    2244:      	stp	x24, x23, [sp, #0x20]
    2248:      	stp	x22, x21, [sp, #0x30]
    224c:      	stp	x20, x19, [sp, #0x40]
    2250:      	stp	x29, x30, [sp, #0x50]
    2254:      	add	x29, sp, #0x50
    2258:      	sub	sp, sp, #0xd0
    225c:      	adrp	x28, 0x5000
    2260:      	mov	x22, x0
    2264:      	mov	x20, x2
    2268:      	ldr	x8, [x28, #0x18]
    226c:      	mov	x24, x1
    2270:      	mov	x0, x8
    2274:      	bl	0x25e8 <.text+0x15e8>
    2278:      	mov	x26, x0
    227c:      	mov	x0, x22
    2280:      	bl	0x25e8 <.text+0x15e8>
    2284:      	mov	x19, x0
    2288:      	mov	x0, x20
    228c:      	bl	0x25e8 <.text+0x15e8>
    2290:      	mov	x21, x0
    2294:      	add	x9, x26, x19
    2298:      	add	x9, x9, x21
    229c:      	add	x8, x9, #0x2a
    22a0:      	cmp	x8, #0xc9
    22a4:      	b.lo	0x22e8 <.text+0x12e8>
    22a8:      	add	x8, x19, #0x28
    22ac:      	add	x10, x8, x21
    22b0:      	cmp	x10, #0xc9
    22b4:      	b.lo	0x22d4 <.text+0x12d4>
    22b8:      	mov	w12, #0xa0              // =160
    22bc:      	cmp	x8, #0xc8
    22c0:      	mov	w14, #0x9f              // =159
    22c4:      	sub	x15, x12, x19
    22c8:      	orr	w16, wzr, #0x1
    22cc:      	csel	x19, x19, x14, lo
    22d0:      	csel	x21, x15, x16, lo
    22d4:      	add	x23, sp, #0x8
    22d8:      	str	w24, [sp, #0x1c]
    22dc:      	mov	x27, xzr
    22e0:      	add	x25, x23, #0x28
    22e4:      	b	0x2340 <.text+0x1340>
    22e8:      	add	x23, sp, #0x8
    22ec:      	str	w24, [sp, #0x1c]
    22f0:      	add	x27, x26, #0x2
    22f4:      	add	x25, x23, #0x28
    22f8:      	cmn	x26, #0x2
    22fc:      	b.eq	0x2340 <.text+0x1340>
    2300:      	adrp	x1, 0x3000 <.text+0x2000>
    2304:      	add	x1, x1, #0xd3a
    2308:      	orr	w2, wzr, #0x1
    230c:      	mov	x0, x25
    2310:      	add	x23, sp, #0x8
    2314:      	bl	0x2eac <.text+0x1eac>
    2318:      	ldr	x1, [x28, #0x18]
    231c:      	add	x0, x25, #0x1
    2320:      	sub	x2, x26, #0x1
    2324:      	bl	0x2eac <.text+0x1eac>
    2328:      	add	x11, x25, x27
    232c:      	adrp	x1, 0x3000 <.text+0x2000>
    2330:      	sub	x0, x11, #0x2
    2334:      	add	x1, x1, #0xd3c
    2338:      	orr	w2, wzr, #0x2
    233c:      	bl	0x2eac <.text+0x1eac>
    2340:      	add	x0, x25, x27
    2344:      	mov	x1, x22
    2348:      	mov	x2, x19
    234c:      	bl	0x2eac <.text+0x1eac>
    2350:      	add	x0, x0, x19
    2354:      	mov	x1, x20
    2358:      	mov	x2, x21
    235c:      	sturb	wzr, [x0, #-0x1]
    2360:      	bl	0x2eac <.text+0x1eac>
    2364:      	add	x12, x21, x0
    2368:      	sturb	wzr, [x12, #-0x1]
    236c:      	bl	0x2c38 <.text+0x1c38>
    2370:      	bl	0x2c48 <.text+0x1c48>
    2374:      	and	w8, w0, #0xff
    2378:      	cbz	w8, 0x23b0 <.text+0x13b0>
    237c:      	add	x2, x21, x19
    2380:      	add	x13, x2, x27
    2384:      	mov	w0, #-0x70000000        // =-1879048192
    2388:      	mov	w1, #0x3050000          // =50659328
    238c:      	add	x6, x13, #0x28
    2390:      	mov	w2, wzr
    2394:      	mov	x3, xzr
    2398:      	mov	x4, xzr
    239c:      	movk	w0, #0x2
    23a0:      	movk	w1, #0x7
    23a4:      	mov	x5, x23
    23a8:      	bl	0x2c68 <.text+0x1c68>
    23ac:      	b	0x23b4 <.text+0x13b4>
    23b0:      	bl	0x2c58 <.text+0x1c58>
    23b4:      	adrp	x14, 0x3000 <.text+0x2000>
    23b8:      	ldrb	w8, [x14, #0x9ed]
    23bc:      	tbnz	w8, #0x4, 0x23cc <.text+0x13cc>
    23c0:      	tbz	w8, #0x5, 0x23d0 <.text+0x13d0>
    23c4:      	bl	0x2424 <.text+0x1424>
    23c8:      	b	0x23d0 <.text+0x13d0>
    23cc:      	bl	0x267c <.text+0x167c>
    23d0:      	sub	sp, x29, #0x50
    23d4:      	ldp	x29, x30, [sp, #0x50]
    23d8:      	ldp	x20, x19, [sp, #0x40]
    23dc:      	ldp	x22, x21, [sp, #0x30]
    23e0:      	ldp	x24, x23, [sp, #0x20]
    23e4:      	ldp	x26, x25, [sp, #0x10]
    23e8:      	ldp	x28, x27, [sp], #0x60
    23ec:      	ret
    23f0:      	adrp	x8, 0x3000 <.text+0x2000>
    23f4:      	ldrb	w8, [x8, #0x9ed]
    23f8:      	and	w0, w8, #0x1
    23fc:      	ret
    2400:      	adrp	x8, 0x3000 <.text+0x2000>
    2404:      	ldrb	w8, [x8, #0x9ed]
    2408:      	ubfx	w0, w8, #1, #1
    240c:      	ret
    2410:      	adrp	x8, 0x3000 <.text+0x2000>
    2414:      	ldr	w8, [x8, #0x9f0]
    2418:      	tst	x8, x0
    241c:      	cset	w0, ne
    2420:      	ret
    2424:      	sub	sp, sp, #0x10
    2428:      	str	xzr, [sp, #0x8]
    242c:      	ldr	x8, [sp, #0x8]
    2430:      	cbz	x8, 0x242c <.text+0x142c>
    2434:      	add	sp, sp, #0x10
    2438:      	ret
    243c:      	add	x8, x2, x3
    2440:      	cmp	x0, x2
    2444:      	ccmp	x0, x8, #0x2, hs
    2448:      	b.lo	0x2464 <.text+0x1464>
    244c:      	add	x10, x0, x1
    2450:      	cmp	x2, x0
    2454:      	ccmp	x2, x10, #0x2, hs
    2458:      	b.lo	0x2464 <.text+0x1464>
    245c:      	mov	w0, wzr
    2460:      	ret
    2464:      	orr	w0, wzr, #0x1
    2468:      	ret
    246c:      	stp	x22, x21, [sp, #-0x30]!
    2470:      	stp	x20, x19, [sp, #0x10]
    2474:      	stp	x29, x30, [sp, #0x20]
    2478:      	add	x29, sp, #0x20
    247c:      	mov	x20, x2
    2480:      	mov	x19, x0
    2484:      	cbz	x19, 0x24bc <.text+0x14bc>
    2488:      	cbz	x20, 0x24d8 <.text+0x14d8>
    248c:      	adrp	x9, 0x3000 <.text+0x2000>
    2490:      	ldr	w8, [x9, #0x9f4]
    2494:      	cbz	w8, 0x2518 <.text+0x1518>
    2498:      	cmp	x8, x1
    249c:      	b.hs	0x24f4 <.text+0x14f4>
    24a0:      	adrp	x0, 0x3000 <.text+0x2000>
    24a4:      	adrp	x2, 0x3000 <.text+0x2000>
    24a8:      	add	x0, x0, #0xd3f
    24ac:      	mov	w1, #0x2ad              // =685
    24b0:      	add	x2, x2, #0xf11
    24b4:      	bl	0x223c <.text+0x123c>
    24b8:      	b	0x24b8 <.text+0x14b8>
    24bc:      	adrp	x0, 0x3000 <.text+0x2000>
    24c0:      	adrp	x2, 0x3000 <.text+0x2000>
    24c4:      	add	x0, x0, #0xd3f
    24c8:      	mov	w1, #0x2a6              // =678
    24cc:      	add	x2, x2, #0xdba
    24d0:      	bl	0x223c <.text+0x123c>
    24d4:      	b	0x24d4 <.text+0x14d4>
    24d8:      	adrp	x0, 0x3000 <.text+0x2000>
    24dc:      	adrp	x2, 0x3000 <.text+0x2000>
    24e0:      	add	x0, x0, #0xd3f
    24e4:      	mov	w1, #0x2a7              // =679
    24e8:      	add	x2, x2, #0xdd8
    24ec:      	bl	0x223c <.text+0x123c>
    24f0:      	b	0x24f0 <.text+0x14f0>
    24f4:      	cmp	x8, x3
    24f8:      	b.hs	0x2518 <.text+0x1518>
    24fc:      	adrp	x0, 0x3000 <.text+0x2000>
    2500:      	adrp	x2, 0x3000 <.text+0x2000>
    2504:      	add	x0, x0, #0xd3f
    2508:      	mov	w1, #0x2ae              // =686
    250c:      	add	x2, x2, #0xf4f
    2510:      	bl	0x223c <.text+0x123c>
    2514:      	b	0x2514 <.text+0x1514>
    2518:      	cbz	x1, 0x253c <.text+0x153c>
    251c:      	mov	x8, xzr
    2520:      	b	0x2528 <.text+0x1528>
    2524:      	add	x8, x8, #0x1
    2528:      	cmp	x8, x1
    252c:      	b.hs	0x2558 <.text+0x1558>
    2530:      	ldrb	w9, [x20, x8]
    2534:      	cbnz	w9, 0x2524 <.text+0x1524>
    2538:      	b	0x2560 <.text+0x1560>
    253c:      	adrp	x0, 0x3000 <.text+0x2000>
    2540:      	adrp	x2, 0x3000 <.text+0x2000>
    2544:      	add	x0, x0, #0xd3f
    2548:      	mov	w1, #0x2b4              // =692
    254c:      	add	x2, x2, #0xe31
    2550:      	bl	0x223c <.text+0x123c>
    2554:      	b	0x2554 <.text+0x1554>
    2558:      	cmp	x3, x1
    255c:      	b.hs	0x25cc <.text+0x15cc>
    2560:      	cmp	x8, x3
    2564:      	csel	x21, x3, x8, hi
    2568:      	add	x3, x21, #0x1
    256c:      	mov	x0, x19
    2570:      	mov	x2, x20
    2574:      	bl	0x243c <.text+0x143c>
    2578:      	and	w8, w0, #0xff
    257c:      	cbz	w8, 0x25a8 <.text+0x15a8>
    2580:      	adrp	x0, 0x3000 <.text+0x2000>
    2584:      	adrp	x2, 0x3000 <.text+0x2000>
    2588:      	add	x0, x0, #0xd3f
    258c:      	mov	w1, #0x2c4              // =708
    2590:      	add	x2, x2, #0xf8c
    2594:      	bl	0x223c <.text+0x123c>
    2598:      	b	0x2598 <.text+0x1598>
    259c:      	add	x20, x20, #0x1
    25a0:      	strb	w8, [x19], #0x1
    25a4:      	sub	x21, x21, #0x1
    25a8:      	cbz	x21, 0x25b4 <.text+0x15b4>
    25ac:      	ldrb	w8, [x20]
    25b0:      	cbnz	w8, 0x259c <.text+0x159c>
    25b4:      	strb	wzr, [x19]
    25b8:      	mov	x0, xzr
    25bc:      	ldp	x29, x30, [sp, #0x20]
    25c0:      	ldp	x20, x19, [sp, #0x10]
    25c4:      	ldp	x22, x21, [sp], #0x30
    25c8:      	ret
    25cc:      	adrp	x0, 0x3000 <.text+0x2000>
    25d0:      	adrp	x2, 0x3000 <.text+0x2000>
    25d4:      	add	x0, x0, #0xd3f
    25d8:      	mov	w1, #0x2bb              // =699
    25dc:      	add	x2, x2, #0xe40
    25e0:      	bl	0x223c <.text+0x123c>
    25e4:      	b	0x25e4 <.text+0x15e4>
    25e8:      	stp	x29, x30, [sp, #-0x10]!
    25ec:      	mov	x29, sp
    25f0:      	bl	0x2600 <.text+0x1600>
    25f4:      	add	x0, x0, #0x1
    25f8:      	ldp	x29, x30, [sp], #0x10
    25fc:      	ret
    2600:      	stp	x29, x30, [sp, #-0x10]!
    2604:      	mov	x29, sp
    2608:      	cbz	x0, 0x2654 <.text+0x1654>
    260c:      	adrp	x9, 0x3000 <.text+0x2000>
    2610:      	mov	x8, xzr
    2614:      	ldr	w9, [x9, #0x9f4]
    2618:      	b	0x2624 <.text+0x1624>
    261c:      	add	x0, x0, #0x1
    2620:      	add	x8, x8, #0x1
    2624:      	ldrb	w10, [x0]
    2628:      	cbz	w10, 0x2670 <.text+0x1670>
    262c:      	cbz	w9, 0x261c <.text+0x161c>
    2630:      	cmp	x8, x9
    2634:      	b.lo	0x261c <.text+0x161c>
    2638:      	adrp	x0, 0x3000 <.text+0x2000>
    263c:      	adrp	x2, 0x4000 <.text+0x3000>
    2640:      	add	x0, x0, #0xd43
    2644:      	mov	w1, #0x516              // =1302
    2648:      	add	x2, x2, #0x416
    264c:      	bl	0x223c <.text+0x123c>
    2650:      	b	0x2650 <.text+0x1650>
    2654:      	adrp	x0, 0x3000 <.text+0x2000>
    2658:      	adrp	x2, 0x4000 <.text+0x3000>
    265c:      	add	x0, x0, #0xd43
    2660:      	mov	w1, #0x50e              // =1294
    2664:      	add	x2, x2, #0x113
    2668:      	bl	0x223c <.text+0x123c>
    266c:      	b	0x266c <.text+0x166c>
    2670:      	mov	x0, x8
    2674:      	ldp	x29, x30, [sp], #0x10
    2678:      	ret
    267c:      	svc	#0xdbdb
    2680:      	ret
    2684:      	cmp	x1, #0x40
    2688:      	b.hs	0x2690 <.text+0x1690>
    268c:      	b	0x26f4 <.text+0x16f4>
    2690:      	stp	x29, x30, [sp, #-0x10]!
    2694:      	mov	x29, sp
    2698:      	adrp	x0, 0x4000 <.text+0x3000>
    269c:      	adrp	x2, 0x4000 <.text+0x3000>
    26a0:      	add	x0, x0, #0x5d4
    26a4:      	mov	w1, #0x27               // =39
    26a8:      	add	x2, x2, #0x5e0
    26ac:      	bl	0x223c <.text+0x123c>
    26b0:      	ldp	x29, x30, [sp], #0x10
    26b4:      	b	0x26b4 <.text+0x16b4>
    26b8:      	cmp	x1, #0x40
    26bc:      	b.hs	0x26c4 <.text+0x16c4>
    26c0:      	b	0x26ec <.text+0x16ec>
    26c4:      	stp	x29, x30, [sp, #-0x10]!
    26c8:      	mov	x29, sp
    26cc:      	adrp	x0, 0x4000 <.text+0x3000>
    26d0:      	adrp	x2, 0x4000 <.text+0x3000>
    26d4:      	add	x0, x0, #0x5eb
    26d8:      	mov	w1, #0x27               // =39
    26dc:      	add	x2, x2, #0x5e0
    26e0:      	bl	0x223c <.text+0x123c>
    26e4:      	ldp	x29, x30, [sp], #0x10
    26e8:      	b	0x26e8 <.text+0x16e8>
    26ec:      	lsl	x0, x0, x1
    26f0:      	ret
    26f4:      	lsr	x0, x0, x1
    26f8:      	ret
    26fc:      	ldr	x8, [x1, #0x58]
    2700:      	adrp	x9, 0x5000
    2704:      	str	x8, [x9, #0xd0]
    2708:      	cbz	x8, 0x2714 <.text+0x1714>
    270c:      	mov	x0, xzr
    2710:      	ret
    2714:      	stp	x29, x30, [sp, #-0x10]!
    2718:      	mov	x29, sp
    271c:      	adrp	x0, 0x4000 <.text+0x3000>
    2720:      	adrp	x2, 0x4000 <.text+0x3000>
    2724:      	add	x0, x0, #0x5f7
    2728:      	mov	w1, #0x2f               // =47
    272c:      	add	x2, x2, #0x615
    2730:      	bl	0x223c <.text+0x123c>
    2734:      	ldp	x29, x30, [sp], #0x10
    2738:      	b	0x2738 <.text+0x1738>
    273c:      	stp	x29, x30, [sp, #-0x10]!
    2740:      	mov	x29, sp
    2744:      	adrp	x8, 0x5000
    2748:      	str	x0, [x8, #0xd8]
    274c:      	cbz	x0, 0x2778 <.text+0x1778>
    2750:      	adrp	x9, 0x5000
    2754:      	str	x1, [x9, #0xe0]
    2758:      	cbz	x1, 0x2794 <.text+0x1794>
    275c:      	ldr	x8, [x1, #0x60]
    2760:      	adrp	x10, 0x5000
    2764:      	str	x8, [x10, #0xe8]
    2768:      	cbz	x8, 0x27b0 <.text+0x17b0>
    276c:      	mov	x0, xzr
    2770:      	ldp	x29, x30, [sp], #0x10
    2774:      	ret
    2778:      	adrp	x0, 0x4000 <.text+0x3000>
    277c:      	adrp	x2, 0x4000 <.text+0x3000>
    2780:      	add	x0, x0, #0x629
    2784:      	mov	w1, #0x33               // =51
    2788:      	add	x2, x2, #0x644
    278c:      	bl	0x223c <.text+0x123c>
    2790:      	b	0x2790 <.text+0x1790>
    2794:      	adrp	x0, 0x4000 <.text+0x3000>
    2798:      	adrp	x2, 0x4000 <.text+0x3000>
    279c:      	add	x0, x0, #0x629
    27a0:      	mov	w1, #0x39               // =57
    27a4:      	add	x2, x2, #0x661
    27a8:      	bl	0x223c <.text+0x123c>
    27ac:      	b	0x27ac <.text+0x17ac>
    27b0:      	adrp	x0, 0x4000 <.text+0x3000>
    27b4:      	adrp	x2, 0x4000 <.text+0x3000>
    27b8:      	add	x0, x0, #0x629
    27bc:      	add	x2, x2, #0x675
    27c0:      	orr	w1, wzr, #0x3f
    27c4:      	bl	0x223c <.text+0x123c>
    27c8:      	b	0x27c8 <.text+0x17c8>
    27cc:      	mov	x0, xzr
    27d0:      	ret
    27d4:      	stp	x26, x25, [sp, #-0x50]!
    27d8:      	stp	x24, x23, [sp, #0x10]
    27dc:      	stp	x22, x21, [sp, #0x20]
    27e0:      	stp	x20, x19, [sp, #0x30]
    27e4:      	stp	x29, x30, [sp, #0x40]
    27e8:      	add	x29, sp, #0x40
    27ec:      	mov	x19, x1
    27f0:      	mov	x20, x0
    27f4:      	cbz	x20, 0x2878 <.text+0x1878>
    27f8:      	cbz	x19, 0x2894 <.text+0x1894>
    27fc:      	adrp	x8, 0x5000
    2800:      	mov	x23, #-0x8000000000000000 // =-9223372036854775808
    2804:      	mov	x25, xzr
    2808:      	ldr	x21, [x8, #0xe0]
    280c:      	mov	x22, #-0x1              // =-1
    2810:      	movk	x23, #0xe
    2814:      	str	xzr, [x19]
    2818:      	ldr	x8, [x21, #0x68]
    281c:      	mov	x24, x25
    2820:      	add	x22, x22, #0x1
    2824:      	mov	x0, x23
    2828:      	cmp	x22, x8
    282c:      	b.hs	0x2860 <.text+0x1860>
    2830:      	ldr	x10, [x21, #0x70]
    2834:      	mov	x0, x20
    2838:      	add	x25, x24, #0x18
    283c:      	add	x1, x10, x24
    2840:      	bl	0x2fc4 <.text+0x1fc4>
    2844:      	and	w8, w0, #0xff
    2848:      	cbz	w8, 0x2818 <.text+0x1818>
    284c:      	ldr	x11, [x21, #0x70]
    2850:      	mov	x0, xzr
    2854:      	add	x9, x11, x24
    2858:      	ldr	x12, [x9, #0x10]
    285c:      	str	x12, [x19]
    2860:      	ldp	x29, x30, [sp, #0x40]
    2864:      	ldp	x20, x19, [sp, #0x30]
    2868:      	ldp	x22, x21, [sp, #0x20]
    286c:      	ldp	x24, x23, [sp, #0x10]
    2870:      	ldp	x26, x25, [sp], #0x50
    2874:      	ret
    2878:      	adrp	x0, 0x4000 <.text+0x3000>
    287c:      	adrp	x2, 0x4000 <.text+0x3000>
    2880:      	add	x0, x0, #0x689
    2884:      	mov	w1, #0x61               // =97
    2888:      	add	x2, x2, #0x693
    288c:      	bl	0x223c <.text+0x123c>
    2890:      	b	0x2890 <.text+0x1890>
    2894:      	adrp	x0, 0x4000 <.text+0x3000>
    2898:      	adrp	x2, 0x4000 <.text+0x3000>
    289c:      	add	x0, x0, #0x689
    28a0:      	mov	w1, #0x62               // =98
    28a4:      	add	x2, x2, #0x6ad
    28a8:      	bl	0x223c <.text+0x123c>
    28ac:      	b	0x28ac <.text+0x18ac>
    28b0:      	stp	x20, x19, [sp, #-0x20]!
    28b4:      	stp	x29, x30, [sp, #0x10]
    28b8:      	add	x29, sp, #0x10
    28bc:      	adrp	x0, 0x5000
    28c0:      	adrp	x1, 0x5000
    28c4:      	add	x0, x0, #0x50
    28c8:      	add	x1, x1, #0xf0
    28cc:      	bl	0x27d4 <.text+0x17d4>
    28d0:      	mov	x19, x0
    28d4:      	bl	0x23f0 <.text+0x13f0>
    28d8:      	tbz	x19, #0x3f, 0x292c <.text+0x192c>
    28dc:      	and	w8, w0, #0xff
    28e0:      	cbz	w8, 0x292c <.text+0x192c>
    28e4:      	bl	0x2400 <.text+0x1400>
    28e8:      	and	w9, w0, #0xff
    28ec:      	cbz	w9, 0x2914 <.text+0x1914>
    28f0:      	orr	w0, wzr, #0x80000000
    28f4:      	bl	0x2410 <.text+0x1410>
    28f8:      	and	w10, w0, #0xff
    28fc:      	cbz	w10, 0x2914 <.text+0x1914>
    2900:      	adrp	x1, 0x3000 <.text+0x2000>
    2904:      	add	x1, x1, #0x988
    2908:      	orr	w0, wzr, #0x80000000
    290c:      	mov	x2, x19
    2910:      	bl	0x1eb0 <.text+0xeb0>
    2914:      	adrp	x0, 0x4000 <.text+0x3000>
    2918:      	adrp	x2, 0x3000 <.text+0x2000>
    291c:      	add	x0, x0, #0x844
    2920:      	mov	w1, #0x31               // =49
    2924:      	add	x2, x2, #0x9bc
    2928:      	bl	0x223c <.text+0x123c>
    292c:      	adrp	x8, 0x5000
    2930:      	ldr	x8, [x8, #0xf0]
    2934:      	cbz	x8, 0x2948 <.text+0x1948>
    2938:      	ldp	x29, x30, [sp, #0x10]
    293c:      	mov	x0, x19
    2940:      	ldp	x20, x19, [sp], #0x20
    2944:      	ret
    2948:      	adrp	x0, 0x4000 <.text+0x3000>
    294c:      	adrp	x2, 0x4000 <.text+0x3000>
    2950:      	add	x0, x0, #0x844
    2954:      	mov	w1, #0x32               // =50
    2958:      	add	x2, x2, #0x84d
    295c:      	bl	0x223c <.text+0x123c>
    2960:      	b	0x2960 <.text+0x1960>
    2964:      	stp	x29, x30, [sp, #-0x10]!
    2968:      	mov	x29, sp
    296c:      	adrp	x8, 0x2000 <.text+0x1000>
    2970:      	adrp	x0, 0x2000 <.text+0x1000>
    2974:      	add	x0, x0, #0x98c
    2978:      	ldr	w1, [x8, #0xa4c]
    297c:      	bl	0x3358 <.text+0x2358>
    2980:      	mov	x0, xzr
    2984:      	ldp	x29, x30, [sp], #0x10
    2988:      	ret
    298c:      	mrs	x2, DAIF
    2990:      	msr	DAIFSet, #0xf
    2994:      	isb
    2998:      	dc	civac, x0
    299c:      	dsb	ish
    29a0:      	mrs	x3, CurrentEL
    29a4:      	cmp	x3, #0x8
    29a8:      	b.gt	0x2a18 <.text+0x1a18>
    29ac:      	b.eq	0x29e8 <.text+0x19e8>
    29b0:      	cbnz	x3, 0x29b8 <.text+0x19b8>
    29b4:      	b	0x29b4 <.text+0x19b4>
    29b8:      	mrs	x8, SCTLR_EL1
    29bc:      	and	x9, x8, #0xfffffffffffffffe
    29c0:      	msr	SCTLR_EL1, x9
    29c4:      	isb
    29c8:      	str	x1, [x0]
    29cc:      	dmb	sy
    29d0:      	dc	ivac, x0
    29d4:      	tlbi	vmalle1
    29d8:      	dsb	sy
    29dc:      	msr	SCTLR_EL1, x8
    29e0:      	isb
    29e4:      	b	0x2a44 <.text+0x1a44>
    29e8:      	mrs	x8, SCTLR_EL2
    29ec:      	and	x9, x8, #0xfffffffffffffffe
    29f0:      	msr	SCTLR_EL2, x9
    29f4:      	isb
    29f8:      	str	x1, [x0]
    29fc:      	dmb	sy
    2a00:      	dc	ivac, x0
    2a04:      	tlbi	alle2
    2a08:      	dsb	sy
    2a0c:      	msr	SCTLR_EL2, x8
    2a10:      	isb
    2a14:      	b	0x2a44 <.text+0x1a44>
    2a18:      	mrs	x8, SCTLR_EL3
    2a1c:      	and	x9, x8, #0xfffffffffffffffe
    2a20:      	msr	SCTLR_EL3, x9
    2a24:      	isb
    2a28:      	str	x1, [x0]
    2a2c:      	dmb	sy
    2a30:      	dc	ivac, x0
    2a34:      	tlbi	alle3
    2a38:      	dsb	sy
    2a3c:      	msr	SCTLR_EL3, x8
    2a40:      	isb
    2a44:      	msr	DAIF, x2
    2a48:      	ret
    2a4c:      	udf	#0xc0
    2a50:      	stp	x29, x30, [sp, #-0x10]!
    2a54:      	mov	x29, sp
    2a58:      	bl	0x33d8 <.text+0x23d8>
    2a5c:      	cbz	x0, 0x2a90 <.text+0x1a90>
    2a60:      	adrp	x8, 0x3000 <.text+0x2000>
    2a64:      	ldr	w8, [x8, #0x9f8]
    2a68:      	sub	w9, w8, #0x1
    2a6c:      	mov	w8, #0xf0000            // =983040
    2a70:      	movk	w8, #0x423e
    2a74:      	cmp	w9, w8
    2a78:      	b.ls	0x2ad8 <.text+0x1ad8>
    2a7c:      	bl	0x3624 <.text+0x2624>
    2a80:      	cbz	x0, 0x2af4 <.text+0x1af4>
    2a84:      	mov	x0, xzr
    2a88:      	ldp	x29, x30, [sp], #0x10
    2a8c:      	ret
    2a90:      	bl	0x2400 <.text+0x1400>
    2a94:      	and	w10, w0, #0xff
    2a98:      	cbz	w10, 0x2abc <.text+0x1abc>
    2a9c:      	orr	w0, wzr, #0x80000000
    2aa0:      	bl	0x2410 <.text+0x1410>
    2aa4:      	and	w11, w0, #0xff
    2aa8:      	cbz	w11, 0x2abc <.text+0x1abc>
    2aac:      	adrp	x1, 0x4000 <.text+0x3000>
    2ab0:      	add	x1, x1, #0x8fd
    2ab4:      	orr	w0, wzr, #0x80000000
    2ab8:      	bl	0x1eb0 <.text+0xeb0>
    2abc:      	adrp	x0, 0x4000 <.text+0x3000>
    2ac0:      	adrp	x2, 0x4000 <.text+0x3000>
    2ac4:      	add	x0, x0, #0x891
    2ac8:      	mov	w1, #0x50               // =80
    2acc:      	add	x2, x2, #0x8fb
    2ad0:      	bl	0x223c <.text+0x123c>
    2ad4:      	b	0x2ad4 <.text+0x1ad4>
    2ad8:      	adrp	x0, 0x4000 <.text+0x3000>
    2adc:      	adrp	x2, 0x4000 <.text+0x3000>
    2ae0:      	add	x0, x0, #0x891
    2ae4:      	add	x2, x2, #0x8a3
    2ae8:      	orr	w1, wzr, #0x38
    2aec:      	bl	0x223c <.text+0x123c>
    2af0:      	b	0x2af0 <.text+0x1af0>
    2af4:      	adrp	x0, 0x4000 <.text+0x3000>
    2af8:      	adrp	x2, 0x4000 <.text+0x3000>
    2afc:      	add	x0, x0, #0x891
    2b00:      	mov	w1, #0x4c               // =76
    2b04:      	add	x2, x2, #0x8d9
    2b08:      	bl	0x223c <.text+0x123c>
    2b0c:      	b	0x2b0c <.text+0x1b0c>
    2b10:      	b	0x36fc <.text+0x26fc>
    2b14:      	adrp	x8, 0x3000 <.text+0x2000>
    2b18:      	ldr	w0, [x8, #0x9e8]
    2b1c:      	ret
    2b20:      	stp	x20, x19, [sp, #-0x20]!
    2b24:      	stp	x29, x30, [sp, #0x10]
    2b28:      	add	x29, sp, #0x10
    2b2c:      	adrp	x19, 0x5000
    2b30:      	ldr	x9, [x19, #0xf8]
    2b34:      	cbnz	x9, 0x2b6c <.text+0x1b6c>
    2b38:      	adrp	x9, 0x5000
    2b3c:      	ldr	x8, [x9, #0xe8]
    2b40:      	cbz	x8, 0x2b6c <.text+0x1b6c>
    2b44:      	ldr	x8, [x8, #0x140]
    2b48:      	cbz	x8, 0x2b6c <.text+0x1b6c>
    2b4c:      	adrp	x0, 0x5000
    2b50:      	adrp	x2, 0x5000
    2b54:      	mov	x1, xzr
    2b58:      	add	x0, x0, #0x80
    2b5c:      	add	x2, x2, #0xf8
    2b60:      	blr	x8
    2b64:      	tbz	x0, #0x3f, 0x2b6c <.text+0x1b6c>
    2b68:      	str	xzr, [x19, #0xf8]
    2b6c:      	ldp	x29, x30, [sp, #0x10]
    2b70:      	ldp	x20, x19, [sp], #0x20
    2b74:      	ret
    2b78:      	stp	x24, x23, [sp, #-0x40]!
    2b7c:      	stp	x22, x21, [sp, #0x10]
    2b80:      	stp	x20, x19, [sp, #0x20]
    2b84:      	stp	x29, x30, [sp, #0x30]
    2b88:      	add	x29, sp, #0x30
    2b8c:      	adrp	x9, 0x3000 <.text+0x2000>
    2b90:      	mov	w21, w0
    2b94:      	mov	x19, x4
    2b98:      	ldrb	w8, [x9, #0x9ec]
    2b9c:      	mov	x20, x3
    2ba0:      	mov	w22, w2
    2ba4:      	mov	w23, w1
    2ba8:      	and	w9, w21, #0xff
    2bac:      	cmp	w9, #0x1
    2bb0:      	b.ne	0x2bbc <.text+0x1bbc>
    2bb4:      	and	w10, w8, #0x1
    2bb8:      	cbnz	w10, 0x2be4 <.text+0x1be4>
    2bbc:      	cmp	w9, #0x2
    2bc0:      	b.ne	0x2bd0 <.text+0x1bd0>
    2bc4:      	and	w11, w8, #0x2
    2bc8:      	and	w12, w11, #0xff
    2bcc:      	cbnz	w12, 0x2be4 <.text+0x1be4>
    2bd0:      	cmp	w9, #0x3
    2bd4:      	b.ne	0x2c20 <.text+0x1c20>
    2bd8:      	and	w8, w8, #0x4
    2bdc:      	and	w9, w8, #0xff
    2be0:      	cbz	w9, 0x2c20 <.text+0x1c20>
    2be4:      	bl	0x2b20 <.text+0x1b20>
    2be8:      	adrp	x10, 0x5000
    2bec:      	ldr	x8, [x10, #0xf8]
    2bf0:      	cbz	x8, 0x2c20 <.text+0x1c20>
    2bf4:      	ldr	x5, [x8]
    2bf8:      	mov	w0, w21
    2bfc:      	mov	w2, w22
    2c00:      	mov	x3, x20
    2c04:      	mov	x4, x19
    2c08:      	ldp	x29, x30, [sp, #0x30]
    2c0c:      	mov	w1, w23
    2c10:      	ldp	x20, x19, [sp, #0x20]
    2c14:      	ldp	x22, x21, [sp, #0x10]
    2c18:      	ldp	x24, x23, [sp], #0x40
    2c1c:      	br	x5
    2c20:      	ldp	x29, x30, [sp, #0x30]
    2c24:      	mov	x0, #-0x7ffffffffffffffd // =-9223372036854775805
    2c28:      	ldp	x20, x19, [sp, #0x20]
    2c2c:      	ldp	x22, x21, [sp, #0x10]
    2c30:      	ldp	x24, x23, [sp], #0x40
    2c34:      	ret
    2c38:      	adrp	x8, 0x3000 <.text+0x2000>
    2c3c:      	ldrb	w8, [x8, #0x9ec]
    2c40:      	and	w0, w8, #0x1
    2c44:      	ret
    2c48:      	adrp	x8, 0x3000 <.text+0x2000>
    2c4c:      	ldrb	w8, [x8, #0x9ec]
    2c50:      	ubfx	w0, w8, #1, #1
    2c54:      	ret
    2c58:      	adrp	x8, 0x3000 <.text+0x2000>
    2c5c:      	ldrb	w8, [x8, #0x9ec]
    2c60:      	ubfx	w0, w8, #2, #1
    2c64:      	ret
    2c68:      	stp	x28, x27, [sp, #-0x60]!
    2c6c:      	stp	x26, x25, [sp, #0x10]
    2c70:      	stp	x24, x23, [sp, #0x20]
    2c74:      	stp	x22, x21, [sp, #0x30]
    2c78:      	stp	x20, x19, [sp, #0x40]
    2c7c:      	stp	x29, x30, [sp, #0x50]
    2c80:      	add	x29, sp, #0x50
    2c84:      	sub	sp, sp, #0x210
    2c88:      	mov	x23, x6
    2c8c:      	mov	x24, x5
    2c90:      	mov	x25, x4
    2c94:      	mov	x21, x3
    2c98:      	mov	w19, w2
    2c9c:      	mov	w20, w1
    2ca0:      	mov	w22, w0
    2ca4:      	cbnz	x24, 0x2cc8 <.text+0x1cc8>
    2ca8:      	cbz	x23, 0x2cc8 <.text+0x1cc8>
    2cac:      	adrp	x0, 0x4000 <.text+0x3000>
    2cb0:      	adrp	x2, 0x4000 <.text+0x3000>
    2cb4:      	add	x0, x0, #0x956
    2cb8:      	add	x2, x2, #0xa55
    2cbc:      	orr	w1, wzr, #0x1f0
    2cc0:      	bl	0x223c <.text+0x123c>
    2cc4:      	b	0x2cc4 <.text+0x1cc4>
    2cc8:      	cbz	x24, 0x2cec <.text+0x1cec>
    2ccc:      	cbnz	x23, 0x2cec <.text+0x1cec>
    2cd0:      	adrp	x0, 0x4000 <.text+0x3000>
    2cd4:      	adrp	x2, 0x4000 <.text+0x3000>
    2cd8:      	add	x0, x0, #0x956
    2cdc:      	mov	w1, #0x1f1              // =497
    2ce0:      	add	x2, x2, #0xa92
    2ce4:      	bl	0x223c <.text+0x123c>
    2ce8:      	b	0x2ce8 <.text+0x1ce8>
    2cec:      	adrp	x27, 0x5000
    2cf0:      	ldr	x9, [x27, #0xe8]
    2cf4:      	cbz	x9, 0x2d90 <.text+0x1d90>
    2cf8:      	ldr	x10, [x9, #0x40]
    2cfc:      	cbz	x10, 0x2d90 <.text+0x1d90>
    2d00:      	ldr	x11, [x9, #0x48]
    2d04:      	cbz	x11, 0x2d90 <.text+0x1d90>
    2d08:      	ldr	x9, [x9, #0x18]
    2d0c:      	orr	w0, wzr, #0x1f
    2d10:      	blr	x9
    2d14:      	ldr	x10, [x27, #0xe8]
    2d18:      	mov	x26, x0
    2d1c:      	ldr	x12, [x10, #0x20]
    2d20:      	blr	x12
    2d24:      	cmp	x26, #0x10
    2d28:      	stur	xzr, [x29, #-0x58]
    2d2c:      	b.hi	0x2d50 <.text+0x1d50>
    2d30:      	ldr	x11, [x27, #0xe8]
    2d34:      	add	x1, x23, #0x14
    2d38:      	orr	w0, wzr, #0x4
    2d3c:      	sub	x2, x29, #0x58
    2d40:      	ldr	x14, [x11, #0x40]
    2d44:      	blr	x14
    2d48:      	ldur	x8, [x29, #-0x58]
    2d4c:      	cbnz	x8, 0x2dc0 <.text+0x1dc0>
    2d50:      	cmp	x23, #0x1ed
    2d54:      	b.lo	0x2db8 <.text+0x1db8>
    2d58:      	mov	x24, #-0x8000000000000000 // =-9223372036854775808
    2d5c:      	movk	x24, #0x9
    2d60:      	bl	0x2400 <.text+0x1400>
    2d64:      	and	w8, w0, #0xff
    2d68:      	cbz	w8, 0x2d94 <.text+0x1d94>
    2d6c:      	orr	w0, wzr, #0x80000000
    2d70:      	bl	0x2410 <.text+0x1410>
    2d74:      	and	w9, w0, #0xff
    2d78:      	cbz	w9, 0x2d94 <.text+0x1d94>
    2d7c:      	adrp	x1, 0x4000 <.text+0x3000>
    2d80:      	add	x1, x1, #0xacf
    2d84:      	orr	w0, wzr, #0x80000000
    2d88:      	bl	0x1eb0 <.text+0xeb0>
    2d8c:      	b	0x2d94 <.text+0x1d94>
    2d90:      	mov	x24, #-0x7ffffffffffffffd // =-9223372036854775805
    2d94:      	mov	x0, x24
    2d98:      	sub	sp, x29, #0x50
    2d9c:      	ldp	x29, x30, [sp, #0x50]
    2da0:      	ldp	x20, x19, [sp, #0x40]
    2da4:      	ldp	x22, x21, [sp, #0x30]
    2da8:      	ldp	x24, x23, [sp, #0x20]
    2dac:      	ldp	x26, x25, [sp, #0x10]
    2db0:      	ldp	x28, x27, [sp], #0x60
    2db4:      	ret
    2db8:      	mov	x8, sp
    2dbc:      	stur	x8, [x29, #-0x58]
    2dc0:      	mov	w9, #0x14               // =20
    2dc4:      	adrp	x16, 0x5000
    2dc8:      	add	x16, x16, #0x30
    2dcc:      	strh	w9, [x8]
    2dd0:      	cmp	x25, #0x0
    2dd4:      	ldur	x12, [x29, #-0x58]
    2dd8:      	csel	x1, x16, x25, eq
    2ddc:      	strh	w23, [x12, #0x2]
    2de0:      	ldur	x13, [x29, #-0x58]
    2de4:      	add	x0, x13, #0x4
    2de8:      	bl	0x2f28 <.text+0x1f28>
    2dec:      	cbz	x24, 0x2e04 <.text+0x1e04>
    2df0:      	ldur	x14, [x29, #-0x58]
    2df4:      	mov	x1, x24
    2df8:      	mov	x2, x23
    2dfc:      	add	x0, x14, #0x14
    2e00:      	bl	0x2eac <.text+0x1eac>
    2e04:      	adrp	x5, 0x5000
    2e08:      	ldur	x4, [x29, #-0x58]
    2e0c:      	add	x5, x5, #0x8
    2e10:      	cmp	x21, #0x0
    2e14:      	csel	x3, x5, x21, eq
    2e18:      	mov	w0, w22
    2e1c:      	mov	w1, w20
    2e20:      	mov	w2, w19
    2e24:      	bl	0x2b78 <.text+0x1b78>
    2e28:      	ldur	x8, [x29, #-0x58]
    2e2c:      	mov	x24, x0
    2e30:      	mov	x15, sp
    2e34:      	cmp	x8, x15
    2e38:      	b.eq	0x2d94 <.text+0x1d94>
    2e3c:      	ldr	x16, [x27, #0xe8]
    2e40:      	mov	x0, x8
    2e44:      	ldr	x2, [x16, #0x48]
    2e48:      	blr	x2
    2e4c:      	b	0x2d94 <.text+0x1d94>
    2e50:      	stp	x29, x30, [sp, #-0x10]!
    2e54:      	mov	x29, sp
    2e58:      	cbnz	x0, 0x2e7c <.text+0x1e7c>
    2e5c:      	cbz	x1, 0x2e7c <.text+0x1e7c>
    2e60:      	adrp	x0, 0x4000 <.text+0x3000>
    2e64:      	adrp	x2, 0x4000 <.text+0x3000>
    2e68:      	add	x0, x0, #0xb07
    2e6c:      	mov	w1, #0x31               // =49
    2e70:      	add	x2, x2, #0xb18
    2e74:      	bl	0x223c <.text+0x123c>
    2e78:      	b	0x2e78 <.text+0x1e78>
    2e7c:      	neg	x8, x0
    2e80:      	cmp	x1, x8
    2e84:      	b.ls	0x2ea4 <.text+0x1ea4>
    2e88:      	adrp	x0, 0x4000 <.text+0x3000>
    2e8c:      	adrp	x2, 0x4000 <.text+0x3000>
    2e90:      	add	x0, x0, #0xb07
    2e94:      	mov	w1, #0x32               // =50
    2e98:      	add	x2, x2, #0xb40
    2e9c:      	bl	0x223c <.text+0x123c>
    2ea0:      	b	0x2ea0 <.text+0x1ea0>
    2ea4:      	ldp	x29, x30, [sp], #0x10
    2ea8:      	b	0x2f20 <.text+0x1f20>
    2eac:      	cbz	x2, 0x2f1c <.text+0x1f1c>
    2eb0:      	stp	x29, x30, [sp, #-0x10]!
    2eb4:      	mov	x29, sp
    2eb8:      	sub	x8, x2, #0x1
    2ebc:      	mvn	x9, x0
    2ec0:      	cmp	x8, x9
    2ec4:      	ldp	x29, x30, [sp], #0x10
    2ec8:      	b.ls	0x2ee8 <.text+0x1ee8>
    2ecc:      	adrp	x0, 0x4000 <.text+0x3000>
    2ed0:      	adrp	x2, 0x4000 <.text+0x3000>
    2ed4:      	add	x0, x0, #0xb76
    2ed8:      	add	x2, x2, #0xb87
    2edc:      	orr	w1, wzr, #0x38
    2ee0:      	bl	0x223c <.text+0x123c>
    2ee4:      	b	0x2ee4 <.text+0x1ee4>
    2ee8:      	mvn	x11, x1
    2eec:      	cmp	x8, x11
    2ef0:      	b.ls	0x2f10 <.text+0x1f10>
    2ef4:      	adrp	x0, 0x4000 <.text+0x3000>
    2ef8:      	adrp	x2, 0x4000 <.text+0x3000>
    2efc:      	add	x0, x0, #0xb76
    2f00:      	mov	w1, #0x39               // =57
    2f04:      	add	x2, x2, #0xbca
    2f08:      	bl	0x223c <.text+0x123c>
    2f0c:      	b	0x2f0c <.text+0x1f0c>
    2f10:      	cmp	x0, x1
    2f14:      	b.eq	0x2f1c <.text+0x1f1c>
    2f18:      	b	0x3028 <.text+0x2028>
    2f1c:      	ret
    2f20:      	mov	w2, wzr
    2f24:      	b	0x323c <.text+0x223c>
    2f28:      	stp	x22, x21, [sp, #-0x30]!
    2f2c:      	stp	x20, x19, [sp, #0x10]
    2f30:      	stp	x29, x30, [sp, #0x20]
    2f34:      	add	x29, sp, #0x20
    2f38:      	mov	x20, x1
    2f3c:      	mov	x19, x0
    2f40:      	cbz	x19, 0x2f8c <.text+0x1f8c>
    2f44:      	cbz	x20, 0x2fa8 <.text+0x1fa8>
    2f48:      	mov	x0, x20
    2f4c:      	bl	0x3554 <.text+0x2554>
    2f50:      	mov	x1, x0
    2f54:      	mov	x0, x19
    2f58:      	bl	0x35b8 <.text+0x25b8>
    2f5c:      	add	x0, x20, #0x8
    2f60:      	add	x21, x19, #0x8
    2f64:      	bl	0x3554 <.text+0x2554>
    2f68:      	mov	x2, x0
    2f6c:      	mov	x0, x21
    2f70:      	mov	x1, x2
    2f74:      	bl	0x35b8 <.text+0x25b8>
    2f78:      	mov	x0, x19
    2f7c:      	ldp	x29, x30, [sp, #0x20]
    2f80:      	ldp	x20, x19, [sp, #0x10]
    2f84:      	ldp	x22, x21, [sp], #0x30
    2f88:      	ret
    2f8c:      	adrp	x0, 0x4000 <.text+0x3000>
    2f90:      	adrp	x2, 0x4000 <.text+0x3000>
    2f94:      	add	x0, x0, #0xc08
    2f98:      	mov	w1, #0x32               // =50
    2f9c:      	add	x2, x2, #0xc15
    2fa0:      	bl	0x223c <.text+0x123c>
    2fa4:      	b	0x2fa4 <.text+0x1fa4>
    2fa8:      	adrp	x0, 0x4000 <.text+0x3000>
    2fac:      	adrp	x2, 0x4000 <.text+0x3000>
    2fb0:      	add	x0, x0, #0xc08
    2fb4:      	mov	w1, #0x33               // =51
    2fb8:      	add	x2, x2, #0xc35
    2fbc:      	bl	0x223c <.text+0x123c>
    2fc0:      	b	0x2fc0 <.text+0x1fc0>
    2fc4:      	stp	x22, x21, [sp, #-0x30]!
    2fc8:      	stp	x20, x19, [sp, #0x10]
    2fcc:      	stp	x29, x30, [sp, #0x20]
    2fd0:      	add	x29, sp, #0x20
    2fd4:      	mov	x19, x1
    2fd8:      	mov	x20, x0
    2fdc:      	bl	0x3554 <.text+0x2554>
    2fe0:      	mov	x21, x0
    2fe4:      	mov	x0, x19
    2fe8:      	bl	0x3554 <.text+0x2554>
    2fec:      	mov	x22, x0
    2ff0:      	add	x0, x20, #0x8
    2ff4:      	bl	0x3554 <.text+0x2554>
    2ff8:      	mov	x20, x0
    2ffc:      	add	x0, x19, #0x8
    3000:      	bl	0x3554 <.text+0x2554>
    3004:      	cmp	x21, x22
    3008:      	cset	w8, eq
    300c:      	cmp	x20, x0
    3010:      	ldp	x29, x30, [sp, #0x20]
    3014:      	cset	w9, eq
    3018:      	ldp	x20, x19, [sp, #0x10]
    301c:      	and	w0, w8, w9
    3020:      	ldp	x22, x21, [sp], #0x30
    3024:      	ret
    3028:      	and	x3, x0, #0x7
    302c:      	cbnz	x3, 0x30a4 <.text+0x20a4>
    3030:      	cmp	x2, #0x8
    3034:      	b.lo	0x30a4 <.text+0x20a4>
    3038:      	and	x5, x1, #0x7
    303c:      	cbnz	x5, 0x30a4 <.text+0x20a4>
    3040:      	cmp	x1, x0
    3044:      	b.ls	0x316c <.text+0x216c>
    3048:      	cmp	x2, #0x7
    304c:      	orr	w15, wzr, #0x7
    3050:      	csel	x16, x2, x15, lo
    3054:      	mvn	x17, x16
    3058:      	add	x6, x2, x17
    305c:      	add	x7, x6, #0x8
    3060:      	and	x16, x7, #0xfffffffffffffff8
    3064:      	mov	x13, x2
    3068:      	add	x10, x1, x16
    306c:      	add	x12, x0, x16
    3070:      	mov	x9, x0
    3074:      	b	0x3080 <.text+0x2080>
    3078:      	ldr	x3, [x1], #0x8
    307c:      	str	x3, [x9], #0x8
    3080:      	subs	x13, x13, #0x8
    3084:      	b.hs	0x3078 <.text+0x2078>
    3088:      	sub	x6, x2, x16
    308c:      	b	0x309c <.text+0x209c>
    3090:      	ldrb	w8, [x10], #0x1
    3094:      	sub	x6, x6, #0x1
    3098:      	strb	w8, [x12], #0x1
    309c:      	cbnz	x6, 0x3090 <.text+0x2090>
    30a0:      	b	0x3238 <.text+0x2238>
    30a4:      	and	x11, x0, #0x3
    30a8:      	cbnz	x11, 0x3120 <.text+0x2120>
    30ac:      	cmp	x2, #0x4
    30b0:      	b.lo	0x3120 <.text+0x2120>
    30b4:      	and	x8, x1, #0x3
    30b8:      	cbnz	x8, 0x3120 <.text+0x2120>
    30bc:      	cmp	x1, x0
    30c0:      	b.ls	0x31d4 <.text+0x21d4>
    30c4:      	cmp	x2, #0x3
    30c8:      	orr	w9, wzr, #0x3
    30cc:      	csel	x8, x2, x9, lo
    30d0:      	mvn	x10, x8
    30d4:      	add	x9, x2, x10
    30d8:      	add	x10, x9, #0x4
    30dc:      	and	x15, x10, #0xfffffffffffffffc
    30e0:      	mov	x14, x2
    30e4:      	add	x11, x1, x15
    30e8:      	add	x13, x0, x15
    30ec:      	mov	x10, x0
    30f0:      	b	0x30fc <.text+0x20fc>
    30f4:      	ldr	w9, [x1], #0x4
    30f8:      	str	w9, [x10], #0x4
    30fc:      	subs	x14, x14, #0x4
    3100:      	b.hs	0x30f4 <.text+0x20f4>
    3104:      	sub	x2, x2, x15
    3108:      	b	0x3118 <.text+0x2118>
    310c:      	ldrb	w12, [x11], #0x1
    3110:      	sub	x2, x2, #0x1
    3114:      	strb	w12, [x13], #0x1
    3118:      	cbnz	x2, 0x310c <.text+0x210c>
    311c:      	b	0x3238 <.text+0x2238>
    3120:      	cmp	x1, x0
    3124:      	b.ls	0x3144 <.text+0x2144>
    3128:      	mov	x8, x0
    312c:      	b	0x313c <.text+0x213c>
    3130:      	ldrb	w14, [x1], #0x1
    3134:      	sub	x2, x2, #0x1
    3138:      	strb	w14, [x8], #0x1
    313c:      	cbnz	x2, 0x3130 <.text+0x2130>
    3140:      	b	0x3238 <.text+0x2238>
    3144:      	b.hs	0x3238 <.text+0x2238>
    3148:      	sub	x12, x2, #0x1
    314c:      	add	x5, x0, x12
    3150:      	add	x9, x1, x12
    3154:      	b	0x3164 <.text+0x2164>
    3158:      	ldrb	w15, [x9], #-0x1
    315c:      	sub	x2, x2, #0x1
    3160:      	strb	w15, [x5], #-0x1
    3164:      	cbnz	x2, 0x3158 <.text+0x2158>
    3168:      	b	0x3238 <.text+0x2238>
    316c:      	b.hs	0x3238 <.text+0x2238>
    3170:      	add	x10, x0, x2
    3174:      	add	x8, x1, x2
    3178:      	and	x15, x2, #0x7
    317c:      	cbz	x15, 0x31b4 <.text+0x21b4>
    3180:      	neg	x11, x15
    3184:      	sub	x9, x10, x15
    3188:      	sub	x16, x10, #0x1
    318c:      	sub	x7, x8, #0x1
    3190:      	mov	x17, x15
    3194:      	b	0x31a4 <.text+0x21a4>
    3198:      	ldrb	w10, [x7], #-0x1
    319c:      	sub	x17, x17, #0x1
    31a0:      	strb	w10, [x16], #-0x1
    31a4:      	cbnz	x17, 0x3198 <.text+0x2198>
    31a8:      	add	x8, x8, x11
    31ac:      	sub	x2, x2, x15
    31b0:      	mov	x10, x9
    31b4:      	sub	x17, x10, #0x8
    31b8:      	sub	x1, x8, #0x8
    31bc:      	b	0x31cc <.text+0x21cc>
    31c0:      	ldr	x4, [x1], #-0x8
    31c4:      	sub	x2, x2, #0x8
    31c8:      	str	x4, [x17], #-0x8
    31cc:      	cbnz	x2, 0x31c0 <.text+0x21c0>
    31d0:      	b	0x3238 <.text+0x2238>
    31d4:      	b.hs	0x3238 <.text+0x2238>
    31d8:      	add	x12, x0, x2
    31dc:      	add	x9, x1, x2
    31e0:      	and	x14, x2, #0x3
    31e4:      	cbz	x14, 0x321c <.text+0x221c>
    31e8:      	neg	x10, x14
    31ec:      	sub	x8, x12, x14
    31f0:      	sub	x3, x12, #0x1
    31f4:      	sub	x11, x9, #0x1
    31f8:      	mov	x4, x14
    31fc:      	b	0x320c <.text+0x220c>
    3200:      	ldrb	w13, [x11], #-0x1
    3204:      	sub	x4, x4, #0x1
    3208:      	strb	w13, [x3], #-0x1
    320c:      	cbnz	x4, 0x3200 <.text+0x2200>
    3210:      	add	x9, x9, x10
    3214:      	sub	x2, x2, x14
    3218:      	mov	x12, x8
    321c:      	sub	x4, x12, #0x4
    3220:      	sub	x8, x9, #0x4
    3224:      	b	0x3234 <.text+0x2234>
    3228:      	ldr	w11, [x8], #-0x4
    322c:      	sub	x2, x2, #0x4
    3230:      	str	w11, [x4], #-0x4
    3234:      	cbnz	x2, 0x3228 <.text+0x2228>
    3238:      	ret
    323c:      	stp	x22, x21, [sp, #-0x30]!
    3240:      	stp	x20, x19, [sp, #0x10]
    3244:      	stp	x29, x30, [sp, #0x20]
    3248:      	add	x29, sp, #0x20
    324c:      	mov	w19, w2
    3250:      	mov	x21, x1
    3254:      	mov	x20, x0
    3258:      	cmp	x21, #0x8
    325c:      	b.lo	0x32cc <.text+0x22cc>
    3260:      	and	x10, x20, #0x7
    3264:      	cbnz	x10, 0x32cc <.text+0x22cc>
    3268:      	and	w8, w19, #0xff
    326c:      	mov	w22, w8
    3270:      	orr	w1, wzr, #0x20
    3274:      	bfi	w22, w22, #16, #8
    3278:      	bfi	w22, w8, #24, #8
    327c:      	bfi	w22, w8, #8, #8
    3280:      	mov	x0, x22
    3284:      	bl	0x26b8 <.text+0x16b8>
    3288:      	cmp	x21, #0x7
    328c:      	orr	w10, wzr, #0x7
    3290:      	csel	x12, x21, x10, lo
    3294:      	mvn	x13, x12
    3298:      	add	x14, x21, x13
    329c:      	add	x15, x14, #0x8
    32a0:      	and	x9, x15, #0xfffffffffffffff8
    32a4:      	mov	x10, x20
    32a8:      	orr	x11, x0, x22
    32ac:      	add	x8, x20, x9
    32b0:      	mov	x12, x21
    32b4:      	b	0x32bc <.text+0x22bc>
    32b8:      	str	x11, [x10], #0x8
    32bc:      	subs	x12, x12, #0x8
    32c0:      	b.hs	0x32b8 <.text+0x22b8>
    32c4:      	sub	x21, x21, x9
    32c8:      	b	0x3340 <.text+0x2340>
    32cc:      	cmp	x21, #0x4
    32d0:      	b.lo	0x3330 <.text+0x2330>
    32d4:      	and	x16, x20, #0x3
    32d8:      	cbnz	x16, 0x3330 <.text+0x2330>
    32dc:      	cmp	x21, #0x3
    32e0:      	orr	w16, wzr, #0x3
    32e4:      	and	w12, w19, #0xff
    32e8:      	csel	x17, x21, x16, lo
    32ec:      	mvn	x1, x17
    32f0:      	mov	w10, w12
    32f4:      	add	x17, x21, x1
    32f8:      	add	x0, x17, #0x4
    32fc:      	and	x11, x0, #0xfffffffffffffffc
    3300:      	bfi	w10, w10, #16, #8
    3304:      	mov	x9, x20
    3308:      	add	x8, x20, x11
    330c:      	bfi	w10, w12, #24, #8
    3310:      	mov	x13, x21
    3314:      	bfi	w10, w12, #8, #8
    3318:      	b	0x3320 <.text+0x2320>
    331c:      	str	w10, [x9], #0x4
    3320:      	subs	x13, x13, #0x4
    3324:      	b.hs	0x331c <.text+0x231c>
    3328:      	sub	x21, x21, x11
    332c:      	b	0x3340 <.text+0x2340>
    3330:      	mov	x8, x20
    3334:      	b	0x3340 <.text+0x2340>
    3338:      	strb	w19, [x8], #0x1
    333c:      	sub	x21, x21, #0x1
    3340:      	cbnz	x21, 0x3338 <.text+0x2338>
    3344:      	mov	x0, x20
    3348:      	ldp	x29, x30, [sp, #0x20]
    334c:      	ldp	x20, x19, [sp, #0x10]
    3350:      	ldp	x22, x21, [sp], #0x30
    3354:      	ret
    3358:      	stp	x22, x21, [sp, #-0x30]!
    335c:      	stp	x20, x19, [sp, #0x10]
    3360:      	stp	x29, x30, [sp, #0x20]
    3364:      	add	x29, sp, #0x20
    3368:      	mov	x22, x1
    336c:      	mov	x19, x0
    3370:      	bl	0x33e8 <.text+0x23e8>
    3374:      	mov	x20, x0
    3378:      	neg	x8, x20
    337c:      	and	x21, x19, x8
    3380:      	add	x22, x19, x22
    3384:      	b	0x3394 <.text+0x2394>
    3388:      	mov	x0, x21
    338c:      	bl	0x33c0 <.text+0x23c0>
    3390:      	add	x21, x21, x20
    3394:      	cmp	x21, x22
    3398:      	b.lo	0x3388 <.text+0x2388>
    339c:      	bl	0x33c8 <.text+0x23c8>
    33a0:      	bl	0x33d0 <.text+0x23d0>
    33a4:      	mov	x0, x19
    33a8:      	ldp	x29, x30, [sp, #0x20]
    33ac:      	ldp	x20, x19, [sp, #0x10]
    33b0:      	ldp	x22, x21, [sp], #0x30
    33b4:      	ret
    33b8:      	dc	ivac, x0
    33bc:      	ret
    33c0:      	dc	cvac, x0
    33c4:      	ret
    33c8:      	dsb	sy
    33cc:      	ret
    33d0:      	isb
    33d4:      	ret
    33d8:      	mov	x0, #0x1                // =1
    33dc:      	ret
    33e0:      	mrs	x0, CTR_EL0
    33e4:      	ret
    33e8:      	stp	x29, x30, [sp, #-0x10]!
    33ec:      	mov	x29, sp
    33f0:      	bl	0x33e0 <.text+0x23e0>
    33f4:      	ubfx	w8, w0, #16, #4
    33f8:      	orr	w9, wzr, #0x4
    33fc:      	lsl	w0, w9, w8
    3400:      	ldp	x29, x30, [sp], #0x10
    3404:      	ret
    3408:      	stp	x29, x30, [sp, #-0x10]!
    340c:      	mov	x29, sp
    3410:      	sub	sp, sp, #0x10
    3414:      	cbz	x0, 0x3440 <.text+0x2440>
    3418:      	ldrb	w8, [x0]
    341c:      	sturb	w8, [x29, #-0x1]
    3420:      	ldrb	w9, [x0, #0x1]
    3424:      	sturb	w9, [x29, #-0x2]
    3428:      	ldurb	w0, [x29, #-0x1]
    342c:      	ldurb	w10, [x29, #-0x2]
    3430:      	bfi	w0, w10, #8, #24
    3434:      	mov	sp, x29
    3438:      	ldp	x29, x30, [sp], #0x10
    343c:      	ret
    3440:      	adrp	x0, 0x4000 <.text+0x3000>
    3444:      	adrp	x2, 0x3000 <.text+0x2000>
    3448:      	add	x0, x0, #0xcaa
    344c:      	mov	w1, #0x2a               // =42
    3450:      	add	x2, x2, #0xbd9
    3454:      	bl	0x223c <.text+0x123c>
    3458:      	b	0x3458 <.text+0x2458>
    345c:      	mov	x8, x0
    3460:      	cbz	x8, 0x3478 <.text+0x2478>
    3464:      	mov	w0, w1
    3468:      	strb	w1, [x8]
    346c:      	lsr	w9, w1, #8
    3470:      	strb	w9, [x8, #0x1]
    3474:      	ret
    3478:      	stp	x29, x30, [sp, #-0x10]!
    347c:      	mov	x29, sp
    3480:      	adrp	x0, 0x4000 <.text+0x3000>
    3484:      	adrp	x2, 0x3000 <.text+0x2000>
    3488:      	add	x0, x0, #0xcaa
    348c:      	mov	w1, #0x48               // =72
    3490:      	add	x2, x2, #0xbd9
    3494:      	bl	0x223c <.text+0x123c>
    3498:      	ldp	x29, x30, [sp], #0x10
    349c:      	b	0x349c <.text+0x249c>
    34a0:      	stp	x20, x19, [sp, #-0x20]!
    34a4:      	stp	x29, x30, [sp, #0x10]
    34a8:      	add	x29, sp, #0x10
    34ac:      	mov	x19, x0
    34b0:      	cbz	x19, 0x34dc <.text+0x24dc>
    34b4:      	mov	x0, x19
    34b8:      	bl	0x3408 <.text+0x2408>
    34bc:      	mov	w20, w0
    34c0:      	add	x0, x19, #0x2
    34c4:      	bl	0x3408 <.text+0x2408>
    34c8:      	ldp	x29, x30, [sp, #0x10]
    34cc:      	bfi	w20, w0, #16, #16
    34d0:      	mov	w0, w20
    34d4:      	ldp	x20, x19, [sp], #0x20
    34d8:      	ret
    34dc:      	adrp	x0, 0x4000 <.text+0x3000>
    34e0:      	adrp	x2, 0x3000 <.text+0x2000>
    34e4:      	add	x0, x0, #0xcaa
    34e8:      	mov	w1, #0x9e               // =158
    34ec:      	add	x2, x2, #0xbd9
    34f0:      	bl	0x223c <.text+0x123c>
    34f4:      	b	0x34f4 <.text+0x24f4>
    34f8:      	stp	x20, x19, [sp, #-0x20]!
    34fc:      	stp	x29, x30, [sp, #0x10]
    3500:      	add	x29, sp, #0x10
    3504:      	mov	w19, w1
    3508:      	mov	x20, x0
    350c:      	cbz	x20, 0x3538 <.text+0x2538>
    3510:      	mov	x0, x20
    3514:      	mov	w1, w19
    3518:      	bl	0x345c <.text+0x245c>
    351c:      	add	x0, x20, #0x2
    3520:      	lsr	w1, w19, #16
    3524:      	bl	0x345c <.text+0x245c>
    3528:      	ldp	x29, x30, [sp, #0x10]
    352c:      	mov	w0, w19
    3530:      	ldp	x20, x19, [sp], #0x20
    3534:      	ret
    3538:      	adrp	x0, 0x4000 <.text+0x3000>
    353c:      	adrp	x2, 0x3000 <.text+0x2000>
    3540:      	add	x0, x0, #0xcaa
    3544:      	mov	w1, #0xbc               // =188
    3548:      	add	x2, x2, #0xbd9
    354c:      	bl	0x223c <.text+0x123c>
    3550:      	b	0x3550 <.text+0x2550>
    3554:      	stp	x20, x19, [sp, #-0x20]!
    3558:      	stp	x29, x30, [sp, #0x10]
    355c:      	add	x29, sp, #0x10
    3560:      	mov	x19, x0
    3564:      	cbz	x19, 0x359c <.text+0x259c>
    3568:      	mov	x0, x19
    356c:      	bl	0x34a0 <.text+0x24a0>
    3570:      	mov	w20, w0
    3574:      	add	x0, x19, #0x4
    3578:      	bl	0x34a0 <.text+0x24a0>
    357c:      	mov	w0, w0
    3580:      	orr	w1, wzr, #0x20
    3584:      	mov	w19, w20
    3588:      	bl	0x26b8 <.text+0x16b8>
    358c:      	ldp	x29, x30, [sp, #0x10]
    3590:      	orr	x0, x0, x19
    3594:      	ldp	x20, x19, [sp], #0x20
    3598:      	ret
    359c:      	adrp	x0, 0x4000 <.text+0x3000>
    35a0:      	adrp	x2, 0x3000 <.text+0x2000>
    35a4:      	add	x0, x0, #0xcaa
    35a8:      	mov	w1, #0xd9               // =217
    35ac:      	add	x2, x2, #0xbd9
    35b0:      	bl	0x223c <.text+0x123c>
    35b4:      	b	0x35b4 <.text+0x25b4>
    35b8:      	stp	x20, x19, [sp, #-0x20]!
    35bc:      	stp	x29, x30, [sp, #0x10]
    35c0:      	add	x29, sp, #0x10
    35c4:      	mov	x19, x1
    35c8:      	mov	x20, x0
    35cc:      	cbz	x20, 0x3608 <.text+0x2608>
    35d0:      	mov	x0, x20
    35d4:      	mov	w1, w19
    35d8:      	bl	0x34f8 <.text+0x24f8>
    35dc:      	orr	w1, wzr, #0x20
    35e0:      	mov	x0, x19
    35e4:      	add	x20, x20, #0x4
    35e8:      	bl	0x2684 <.text+0x1684>
    35ec:      	mov	x1, x0
    35f0:      	mov	x0, x20
    35f4:      	bl	0x34f8 <.text+0x24f8>
    35f8:      	ldp	x29, x30, [sp, #0x10]
    35fc:      	mov	x0, x19
    3600:      	ldp	x20, x19, [sp], #0x20
    3604:      	ret
    3608:      	adrp	x0, 0x4000 <.text+0x3000>
    360c:      	adrp	x2, 0x3000 <.text+0x2000>
    3610:      	add	x0, x0, #0xcaa
    3614:      	mov	w1, #0xf7               // =247
    3618:      	add	x2, x2, #0xbd9
    361c:      	bl	0x223c <.text+0x123c>
    3620:      	b	0x3620 <.text+0x2620>
    3624:      	stp	x29, x30, [sp, #-0x10]!
    3628:      	mov	x29, sp
    362c:      	sub	sp, sp, #0x10
    3630:      	add	x1, sp, #0x8
    3634:      	str	xzr, [sp, #0x8]
    3638:      	mov	w0, wzr
    363c:      	bl	0x37e0 <.text+0x27e0>
    3640:      	ldr	x0, [sp, #0x8]
    3644:      	mov	sp, x29
    3648:      	ldp	x29, x30, [sp], #0x10
    364c:      	ret
    3650:      	ldr	x0, 0x3770 <.text+0x2770>
    3654:      	str	xzr, [x0]
    3658:      	bl	0x33c0 <.text+0x23c0>
    365c:      	dsb	sy
    3660:      	isb
    3664:      	ldr	x0, 0x3778 <.text+0x2778>
    3668:      	ldr	x2, 0x3780 <.text+0x2780>
    366c:      	mov	x3, #0x8                // =8
    3670:      	smc	#0
    3674:      	cmp	w0, #0x0
    3678:      	b.gt	0x3670 <.text+0x2670>
    367c:      	cmp	w0, #0x0
    3680:      	b.ne	0x369c <.text+0x269c>
    3684:      	ldr	x0, 0x3788 <.text+0x2788>
    3688:      	bl	0x33b8 <.text+0x23b8>
    368c:      	dsb	sy
    3690:      	isb
    3694:      	ldr	x1, 0x3790 <.text+0x2790>
    3698:      	ldr	x0, [x1]
    369c:      	ldp	x29, x30, [sp], #0x10
    36a0:      	ret
    36a4:      	ldr	x0, 0x3798 <.text+0x2798>
    36a8:      	str	xzr, [x0]
    36ac:      	bl	0x33c0 <.text+0x23c0>
    36b0:      	dsb	sy
    36b4:      	isb
    36b8:      	ldr	x0, 0x37a0 <.text+0x27a0>
    36bc:      	mov	x1, #0x22               // =34
    36c0:      	ldr	x2, 0x37a8 <.text+0x27a8>
    36c4:      	mov	x3, #0x8                // =8
    36c8:      	smc	#0
    36cc:      	cmp	w0, #0x0
    36d0:      	b.gt	0x36c8 <.text+0x26c8>
    36d4:      	cmp	w0, #0x0
    36d8:      	b.ne	0x36f4 <.text+0x26f4>
    36dc:      	ldr	x0, 0x37b0 <.text+0x27b0>
    36e0:      	bl	0x33b8 <.text+0x23b8>
    36e4:      	dsb	sy
    36e8:      	isb
    36ec:      	ldr	x1, 0x37b8 <.text+0x27b8>
    36f0:      	ldr	x0, [x1]
    36f4:      	ldp	x29, x30, [sp], #0x10
    36f8:      	ret
    36fc:      	stp	x29, x30, [sp, #-0x10]!
    3700:      	mov	x29, sp
    3704:      	ldr	x0, 0x37c0 <.text+0x27c0>
    3708:      	ldr	x0, [x0]
    370c:      	adr	x1, 0x3718 <.text+0x2718>
    3710:      	ldr	x2, [x1, x0]
    3714:      	br	x2
    3718:      	udf	#0x3730
    371c:      	udf	#0x0
    3720:      	udf	#0x3650
    3724:      	udf	#0x0
    3728:      	udf	#0x36a4
    372c:      	udf	#0x0
    3730:      	ldr	x0, 0x37c8 <.text+0x27c8>
    3734:      	mov	x1, #0x1                // =1
    3738:      	ldr	x2, 0x37d0 <.text+0x27d0>
    373c:      	smc	#0
    3740:      	cmp	w0, #0x0
    3744:      	b.gt	0x373c <.text+0x273c>
    3748:      	cmp	w0, #0x0
    374c:      	ldr	x1, 0x37d8 <.text+0x27d8>
    3750:      	b.ne	0x3760 <.text+0x2760>
    3754:      	mov	x0, #0x10               // =16
    3758:      	str	x0, [x1]
    375c:      	b	0x36a4 <.text+0x26a4>
    3760:      	mov	x0, #0x8                // =8
    3764:      	str	x0, [x1]
    3768:      	b	0x3650 <.text+0x2650>
    376c:      	nop
    3770:      	udf	#0x50c0
    3774:      	udf	#0x0
    3778:      	<unknown>
    377c:      	udf	#0x0
    3780:      	udf	#0x50c0
    3784:      	udf	#0x0
    3788:      	udf	#0x50c0
    378c:      	udf	#0x0
    3790:      	udf	#0x50c0
    3794:      	udf	#0x0
    3798:      	udf	#0x50c0
    379c:      	udf	#0x0
    37a0:      	<unknown>
    37a4:      	udf	#0x0
    37a8:      	udf	#0x50c0
    37ac:      	udf	#0x0
    37b0:      	udf	#0x50c0
    37b4:      	udf	#0x0
    37b8:      	udf	#0x50c0
    37bc:      	udf	#0x0
    37c0:      	udf	#0x50c8
    37c4:      	udf	#0x0
    37c8:      	<unknown>
    37cc:      	udf	#0x0
    37d0:      	<unknown>
    37d4:      	udf	#0x0
    37d8:      	udf	#0x50c8
    37dc:      	udf	#0x0
    37e0:      	stp	x20, x19, [sp, #-0x20]!
    37e4:      	stp	x29, x30, [sp, #0x10]
    37e8:      	add	x29, sp, #0x10
    37ec:      	mov	x19, x1
    37f0:      	mov	w20, w0
    37f4:      	bl	0x33d8 <.text+0x23d8>
    37f8:      	cbz	x0, 0x384c <.text+0x284c>
    37fc:      	mov	w8, w20
    3800:      	cmp	w20, #0xe
    3804:      	b.hi	0x3894 <.text+0x2894>
    3808:      	adrp	x9, 0x4000 <.text+0x3000>
    380c:      	add	x9, x9, #0xcb8
    3810:      	ldr	x9, [x9, x8, lsl #3]
    3814:      	br	x9
    3818:      	bl	0x2400 <.text+0x1400>
    381c:      	and	w8, w0, #0xff
    3820:      	cbz	w8, 0x3924 <.text+0x2924>
    3824:      	orr	w0, wzr, #0x80000000
    3828:      	bl	0x2410 <.text+0x1410>
    382c:      	and	w9, w0, #0xff
    3830:      	cbz	w9, 0x3924 <.text+0x2924>
    3834:      	ldp	x29, x30, [sp, #0x10]
    3838:      	adrp	x1, 0x4000 <.text+0x3000>
    383c:      	add	x1, x1, #0xd30
    3840:      	orr	w0, wzr, #0x80000000
    3844:      	ldp	x20, x19, [sp], #0x20
    3848:      	b	0x1eb0 <.text+0xeb0>
    384c:      	bl	0x2400 <.text+0x1400>
    3850:      	and	w12, w0, #0xff
    3854:      	cbz	w12, 0x3878 <.text+0x2878>
    3858:      	orr	w0, wzr, #0x80000000
    385c:      	bl	0x2410 <.text+0x1410>
    3860:      	and	w13, w0, #0xff
    3864:      	cbz	w13, 0x3878 <.text+0x2878>
    3868:      	adrp	x1, 0x4000 <.text+0x3000>
    386c:      	add	x1, x1, #0xdaa
    3870:      	orr	w0, wzr, #0x80000000
    3874:      	bl	0x1eb0 <.text+0xeb0>
    3878:      	adrp	x0, 0x4000 <.text+0x3000>
    387c:      	adrp	x2, 0x4000 <.text+0x3000>
    3880:      	add	x0, x0, #0xe0d
    3884:      	mov	w1, #0x5e               // =94
    3888:      	add	x2, x2, #0x8fb
    388c:      	bl	0x223c <.text+0x123c>
    3890:      	b	0x3890 <.text+0x2890>
    3894:      	bl	0x2400 <.text+0x1400>
    3898:      	and	w10, w0, #0xff
    389c:      	cbz	w10, 0x3924 <.text+0x2924>
    38a0:      	orr	w0, wzr, #0x80000000
    38a4:      	bl	0x2410 <.text+0x1410>
    38a8:      	and	w11, w0, #0xff
    38ac:      	cbz	w11, 0x3924 <.text+0x2924>
    38b0:      	ldp	x29, x30, [sp, #0x10]
    38b4:      	adrp	x1, 0x4000 <.text+0x3000>
    38b8:      	add	x1, x1, #0xd80
    38bc:      	orr	w0, wzr, #0x80000000
    38c0:      	mov	w2, w20
    38c4:      	ldp	x20, x19, [sp], #0x20
    38c8:      	b	0x1eb0 <.text+0xeb0>
    38cc:      	bl	0x3930 <.text+0x2930>
    38d0:      	b	0x3920 <.text+0x2920>
    38d4:      	bl	0x3938 <.text+0x2938>
    38d8:      	b	0x3920 <.text+0x2920>
    38dc:      	bl	0x3940 <.text+0x2940>
    38e0:      	b	0x3920 <.text+0x2920>
    38e4:      	bl	0x3948 <.text+0x2948>
    38e8:      	b	0x3920 <.text+0x2920>
    38ec:      	bl	0x3950 <.text+0x2950>
    38f0:      	b	0x3920 <.text+0x2920>
    38f4:      	bl	0x3958 <.text+0x2958>
    38f8:      	b	0x3920 <.text+0x2920>
    38fc:      	bl	0x3960 <.text+0x2960>
    3900:      	b	0x3920 <.text+0x2920>
    3904:      	bl	0x3968 <.text+0x2968>
    3908:      	b	0x3920 <.text+0x2920>
    390c:      	bl	0x3970 <.text+0x2970>
    3910:      	b	0x3920 <.text+0x2920>
    3914:      	bl	0x3978 <.text+0x2978>
    3918:      	b	0x3920 <.text+0x2920>
    391c:      	bl	0x3980 <.text+0x2980>
    3920:      	str	x0, [x19]
    3924:      	ldp	x29, x30, [sp, #0x10]
    3928:      	ldp	x20, x19, [sp], #0x20
    392c:      	ret
    3930:      	mrs	x0, CNTFRQ_EL0
    3934:      	ret
    3938:      	mrs	x0, CNTPCT_EL0
    393c:      	ret
    3940:      	mrs	x0, CNTKCTL_EL1
    3944:      	ret
    3948:      	mrs	x0, CNTP_TVAL_EL0
    394c:      	ret
    3950:      	mrs	x0, CNTP_CTL_EL0
    3954:      	ret
    3958:      	mrs	x0, CNTV_TVAL_EL0
    395c:      	ret
    3960:      	mrs	x0, CNTV_CTL_EL0
    3964:      	ret
    3968:      	mrs	x0, CNTVCT_EL0
    396c:      	ret
    3970:      	mrs	x0, CNTP_CVAL_EL0
    3974:      	ret
    3978:      	mrs	x0, CNTV_CVAL_EL0
    397c:      	ret
    3980:      	mrs	x0, CNTVOFF_EL2
    3984:      	ret
    3988:      	<unknown>
    398c:      	<unknown>
    3990:      	<unknown>
    3994:      	<unknown>
    3998:      	<unknown>
    399c:      	<unknown>
    39a0:      	<unknown>
    39a4:      	bic	w5, w17, w9, lsl #28
    39a8:      	ldpsw	x0, x17, [x0, #-0x70]
    39ac:      	addhnt	z22.b, z11.h, z18.h
    39b0:      	ldrh	w14, [x3, #0x193a]
    39b4:      	umin	v16.8h, v26.8h, v9.8h
    39b8:      	<unknown>
    39bc:      	<unknown>
    39c0:      	<unknown>
    39c4:      	stnp	w15, w20, [x18, #-0x100]
    39c8:      	<unknown>
    39cc:      	<unknown>
    39d0:      	<unknown>
    39d4:      	<unknown>
    39d8:      	<unknown>
    39dc:      	<unknown>
    39e0:      	<unknown>
    39e4:      	udf	#0x0
    39e8:      	<unknown>
    39ec:      	udf	#0x2b07
    39f0:      	<unknown>
    39f4:      	<unknown>
    39f8:      	<unknown>
    39fc:      	udf	#0x0
    3a00:      	<unknown>
    3a04:      	bic	w0, w25, w11, lsl #10
    3a08:      	<unknown>
    3a0c:      	<unknown>
    3a10:      	<unknown>
    3a14:      	<unknown>
    3a18:      	<unknown>
    3a1c:      	<unknown>
    3a20:      	<unknown>
    3a24:      	<unknown>
    3a28:      	<unknown>
    3a2c:      	<unknown>
    3a30:      	fnmls	z13.h, p1/m, z11.h, z20.h
    3a34:      	cmpgt	p2.b, p2/z, z19.b, #0x0
    3a38:      	stp	s1, s14, [x19, #-0x100]
    3a3c:      	<unknown>
    3a40:      	<unknown>
    3a44:      	<unknown>
    3a48:      	<unknown>
    3a4c:      	<unknown>
    3a50:      	<unknown>
    3a54:      	<unknown>
    3a58:      	<unknown>
    3a5c:      	<unknown>
    3a60:      	<unknown>
    3a64:      	<unknown>
    3a68:      	bfdot	z0.s, z17.h, z1.h[0]
    3a6c:      	<unknown>
    3a70:      	<unknown>
    3a74:      	<unknown>
    3a78:      	<unknown>
    3a7c:      	<unknown>
    3a80:      	<unknown>
    3a84:      	<unknown>
    3a88:      	<unknown>
    3a8c:      	<unknown>
    3a90:      	<unknown>
    3a94:      	<unknown>
    3a98:      	<unknown>
    3a9c:      	ldnp	d18, d27, [x27, #-0x140]
    3aa0:      	<unknown>
    3aa4:      	<unknown>
    3aa8:      	<unknown>
    3aac:      	fcmla	v15.8h, v3.8h, v3.h[0], #270
    3ab0:      	uqshl	v14.2d, v3.2d, #0x32
    3ab4:      	<unknown>
    3ab8:      	<unknown>
    3abc:      	<unknown>
    3ac0:      	<unknown>
    3ac4:      	<unknown>
    3ac8:      	adr	x20, 0xf6916
    3acc:      	<unknown>
    3ad0:      	<unknown>
    3ad4:      	<unknown>
    3ad8:      	<unknown>
    3adc:      	stgp	x20, x27, [x27, #-0x400]
    3ae0:      	<unknown>
    3ae4:      	<unknown>
    3ae8:      	<unknown>
    3aec:      	<unknown>
    3af0:      	<unknown>
    3af4:      	ldnp	d15, d24, [x27, #-0x110]
    3af8:      	<unknown>
    3afc:      	ldpsw	x2, x18, [x11, #-0x90]
    3b00:      	fnmla	z20.h, p4/m, z3.h, z18.h
    3b04:      	<unknown>
    3b08:      	adr	x5, 0xf6597
    3b0c:      	<unknown>
    3b10:      	fnmls	z3.h, p3/m, z26.h, z18.h
    3b14:      	<unknown>
    3b18:      	<unknown>
    3b1c:      	<unknown>
    3b20:      	<unknown>
    3b24:      	<unknown>
    3b28:      	<unknown>
    3b2c:      	<unknown>
    3b30:      	sqshlu	v13.2d, v11.2d, #0x2d
    3b34:      	<unknown>
    3b38:      	<unknown>
    3b3c:      	uqshl	v1.2d, v3.2d, #0x29
    3b40:      	<unknown>
    3b44:      	<unknown>
    3b48:      	<unknown>
    3b4c:      	<unknown>
    3b50:      	and	w0, w17, w14, lsr #17
    3b54:      	<unknown>
    3b58:      	ldpsw	x0, x17, [x17, #-0xf8]
    3b5c:      	<unknown>
    3b60:      	<unknown>
    3b64:      	<unknown>
    3b68:      	ldp	d17, d24, [x26, #-0x110]
    3b6c:      	<unknown>
    3b70:      	ldpsw	x15, x27, [x19, #-0xd0]
    3b74:      	fcmla	v7.8h, v3.8h, v18.h[1], #180
    3b78:      	<unknown>
    3b7c:      	ldpsw	x12, x17, [x27, #-0x58]
    3b80:      	st1	{ v4.b }[10], [x19]
    3b84:      	<unknown>
    3b88:      	ldnp	d25, d16, [x11, #-0x140]
    3b8c:      	<unknown>
    3b90:      	<unknown>
    3b94:      	<unknown>
    3b98:      	<unknown>
    3b9c:      	<unknown>
    3ba0:      	<unknown>
    3ba4:      	ldpsw	x8, x16, [x9, #-0xa0]
    3ba8:      	fnmls	z7.h, p3/m, z19.h, z13.h
    3bac:      	<unknown>
    3bb0:      	ldnp	d0, d10, [x1, #0x10]
    3bb4:      	ldp	d9, d25, [x27, #-0x120]
    3bb8:      	<unknown>
    3bbc:      	stp	w13, w8, [x1, #-0x78]
    3bc0:      	str	b9, [x1, #0xf48]
    3bc4:      	eor	w0, w1, #0x1fff
    3bc8:      	adr	x5, 0xdc7f6
    3bcc:      	<unknown>
    3bd0:      	adr	x0, 0x44396
    3bd4:      	<unknown>
    3bd8:      	<unknown>
    3bdc:      	<unknown>
    3be0:      	stnp	w1, w15, [x9, #-0x100]
    3be4:      	ldpsw	x8, x29, [x17, #-0x88]
    3be8:      	stp	w4, w8, [x3, #-0xb0]
    3bec:      	<unknown>
    3bf0:      	<unknown>
    3bf4:      	ldpsw	x3, x24, [x11, #-0x60]
    3bf8:      	ldpsw	x15, x27, [x19, #0x98]
    3bfc:      	<unknown>
    3c00:      	adr	x29, 0x54005
    3c04:      	<unknown>
    3c08:      	<unknown>
    3c0c:      	<unknown>
    3c10:      	<unknown>
    3c14:      	<unknown>
    3c18:      	stnp	w0, w11, [x9, #-0x100]
    3c1c:      	bc.pl	0xa0544
    3c20:      	<unknown>
    3c24:      	fnmls	z21.h, p1/m, z19.h, z6.h
    3c28:      	<unknown>
    3c2c:      	udf	#0x2931
    3c30:      	udf	#0x20e0
    3c34:      	udf	#0x0
    3c38:      	udf	#0x2168
    3c3c:      	udf	#0x0
    3c40:      	udf	#0x2060
    3c44:      	udf	#0x0
    3c48:      	udf	#0x20a0
    3c4c:      	udf	#0x0
    3c50:      	udf	#0x2168
    3c54:      	udf	#0x0
    3c58:      	udf	#0x2168
    3c5c:      	udf	#0x0
    3c60:      	udf	#0x20e0
    3c64:      	udf	#0x0
    3c68:      	udf	#0x2168
    3c6c:      	udf	#0x0
    3c70:      	udf	#0x2168
    3c74:      	udf	#0x0
    3c78:      	udf	#0x2168
    3c7c:      	udf	#0x0
    3c80:      	udf	#0x2168
    3c84:      	udf	#0x0
    3c88:      	udf	#0x2168
    3c8c:      	udf	#0x0
    3c90:      	udf	#0x2168
    3c94:      	udf	#0x0
    3c98:      	udf	#0x2168
    3c9c:      	udf	#0x0
    3ca0:      	udf	#0x2168
    3ca4:      	udf	#0x0
    3ca8:      	udf	#0x20a0
    3cac:      	udf	#0x0
    3cb0:      	udf	#0x2168
    3cb4:      	udf	#0x0
    3cb8:      	udf	#0x213c
    3cbc:      	udf	#0x0
    3cc0:      	udf	#0x20e0
    3cc4:      	udf	#0x0
    3cc8:      	udf	#0x20e0
    3ccc:      	udf	#0x0
    3cd0:      	udf	#0x20a0
    3cd4:      	udf	#0x0
    3cd8:      	udf	#0x2168
    3cdc:      	udf	#0x0
    3ce0:      	udf	#0x2168
    3ce4:      	udf	#0x0
    3ce8:      	udf	#0x20a0
    3cec:      	udf	#0x0
    3cf0:      	<unknown>
    3cf4:      	<unknown>
    3cf8:      	<unknown>
    3cfc:      	<unknown>
    3d00:      	str	b20, [x3, #0x848]
    3d04:      	<unknown>
    3d08:      	<unknown>
    3d0c:      	adr	x10, 0x44231
    3d10:      	<unknown>
    3d14:      	ldurb	w8, [x10, #-0xdc]
    3d18:      	<unknown>
    3d1c:      	<unknown>
    3d20:      	<unknown>
    3d24:      	fnmls	z1.h, p4/m, z19.h, z11.h
    3d28:      	str	b18, [x3, #0xf08]
    3d2c:      	<unknown>
    3d30:      	<unknown>
    3d34:      	uabdl2	v20.4s, v19.8h, v9.8h
    3d38:      	<unknown>
    3d3c:      	ubfx	w29, w2, #0, #9
    3d40:      	<unknown>
    3d44:      	uabdl2	v20.4s, v19.8h, v9.8h
    3d48:      	<unknown>
    3d4c:      	<unknown>
    3d50:      	ldp	w14, w21, [x2, #0x70]
    3d54:      	<unknown>
    3d58:      	<unknown>
    3d5c:      	ldeorh	w16, w6, [x1]
    3d60:      	adr	x16, 0x64365
    3d64:      	adds	w16, w1, #0xc0c
    3d68:      	str	b9, [x1, #0xf48]
    3d6c:      	stnp	w0, w12, [x1]
    3d70:      	<unknown>
    3d74:      	<unknown>
    3d78:      	<unknown>
    3d7c:      	<unknown>
    3d80:      	<unknown>
    3d84:      	ldeorh	w16, w6, [x1]
    3d88:      	adr	x16, 0x6438d
    3d8c:      	adds	w16, w1, #0xc0c
    3d90:      	str	b9, [x1, #0xf48]
    3d94:      	stnp	w0, w12, [x1]
    3d98:      	<unknown>
    3d9c:      	<unknown>
    3da0:      	<unknown>
    3da4:      	<unknown>
    3da8:      	adr	x0, 0xf43ad
    3dac:      	adr	x16, 0x643b1
    3db0:      	stp	w16, w12, [x1, #-0x78]
    3db4:      	<unknown>
    3db8:      	<unknown>
    3dbc:      	ldpsw	x5, x28, [x27, #-0x60]
    3dc0:      	ldpsw	x14, x24, [x11, #-0x60]
    3dc4:      	<unknown>
    3dc8:      	stnp	w29, w8, [x1, #-0xc0]
    3dcc:      	<unknown>
    3dd0:      	<unknown>
    3dd4:      	<unknown>
    3dd8:      	<unknown>
    3ddc:      	<unknown>
    3de0:      	stnp	w1, w15, [x9, #-0x100]
    3de4:      	ldpsw	x8, x29, [x17, #-0x88]
    3de8:      	stp	w4, w8, [x3, #-0xb0]
    3dec:      	stp	w0, w12, [x1, #-0xb8]
    3df0:      	fmaxnmv	h0, p2, z0.h
    3df4:      	<unknown>
    3df8:      	str	b24, [x3, #0xf08]
    3dfc:      	<unknown>
    3e00:      	<unknown>
    3e04:      	fnmls	z6.h, p2/m, z10.h, z24.h
    3e08:      	<unknown>
    3e0c:      	<unknown>
    3e10:      	<unknown>
    3e14:      	ldpsw	x13, x24, [x10, #-0x40]
    3e18:      	<unknown>
    3e1c:      	umlsl2	v14.4s, v11.8h, v3.h[6]
    3e20:      	<unknown>
    3e24:      	<unknown>
    3e28:      	<unknown>
    3e2c:      	stp	w20, w26, [x3, #-0xb8]
    3e30:      	fmaxnmv	h0, p2, z0.h
    3e34:      	<unknown>
    3e38:      	str	b24, [x3, #0x848]
    3e3c:      	<unknown>
    3e40:      	<unknown>
    3e44:      	<unknown>
    3e48:      	<unknown>
    3e4c:      	<unknown>
    3e50:      	uqshl	v5.8h, v3.8h, v5.8h
    3e54:      	<unknown>
    3e58:      	umax	v20.8h, v11.8h, v18.8h
    3e5c:      	<unknown>
    3e60:      	<unknown>
    3e64:      	<unknown>
    3e68:      	<unknown>
    3e6c:      	fnmla	z18.h, p3/m, z27.h, z22.h
    3e70:      	adr	x18, 0xc6bff
    3e74:      	fmaxnmv	h0, p2, z1.h
    3e78:      	uabd	v19.8h, v3.8h, v9.8h
    3e7c:      	uqshl	v1.2d, v3.2d, #0x29
    3e80:      	<unknown>
    3e84:      	<unknown>
    3e88:      	<unknown>
    3e8c:      	<unknown>
    3e90:      	<unknown>
    3e94:      	umlal2	v10.4s, v9.8h, v3.h[5]
    3e98:      	fnmls	z21.h, p4/m, z19.h, z3.h
    3e9c:      	umlal2	v12.4s, v1.8h, v3.h[1]
    3ea0:      	fnmls	z21.h, p4/m, z19.h, z3.h
    3ea4:      	<unknown>
    3ea8:      	stp	w11, w8, [x1, #-0x78]
    3eac:      	<unknown>
    3eb0:      	<unknown>
    3eb4:      	<unknown>
    3eb8:      	adr	x8, 0xd2a9e
    3ebc:      	<unknown>
    3ec0:      	<unknown>
    3ec4:      	<unknown>
    3ec8:      	<unknown>
    3ecc:      	<unknown>
    3ed0:      	ldp	d1, d30, [x3, #-0x170]
    3ed4:      	<unknown>
    3ed8:      	<unknown>
    3edc:      	<unknown>
    3ee0:      	<unknown>
    3ee4:      	<unknown>
    3ee8:      	<unknown>
    3eec:      	adr	x8, 0xe2753
    3ef0:      	uqshl	v25.8h, v3.8h, v5.8h
    3ef4:      	<unknown>
    3ef8:      	stnp	w16, w10, [x9]
    3efc:      	ldrh	w3, [x26, #0x1836]
    3f00:      	<unknown>
    3f04:      	umlal2	v30.4s, v1.8h, v3.h[1]
    3f08:      	fnmls	z21.h, p4/m, z19.h, z3.h
    3f0c:      	ldp	w12, w25, [x10, #-0x90]
    3f10:      	fmaxnmv	h0, p2, z0.h
    3f14:      	<unknown>
    3f18:      	str	b24, [x3, #0xf08]
    3f1c:      	<unknown>
    3f20:      	<unknown>
    3f24:      	fnmls	z6.h, p2/m, z10.h, z24.h
    3f28:      	<unknown>
    3f2c:      	<unknown>
    3f30:      	<unknown>
    3f34:      	ldpsw	x13, x24, [x10, #-0x40]
    3f38:      	<unknown>
    3f3c:      	ldpsw	x19, x24, [x27, #-0xb8]
    3f40:      	ldpsw	x19, x29, [x2, #-0x70]
    3f44:      	fcmeq	p14.h, p1/z, z27.h, z12.h
    3f48:      	<unknown>
    3f4c:      	stnp	w9, w10, [x9]
    3f50:      	<unknown>
    3f54:      	str	b20, [x3, x0]
    3f58:      	<unknown>
    3f5c:      	<unknown>
    3f60:      	<unknown>
    3f64:      	<unknown>
    3f68:      	ldnp	d2, d29, [x10, #-0x170]
    3f6c:      	<unknown>
    3f70:      	<unknown>
    3f74:      	ldp	d9, d27, [x11, #-0xb0]
    3f78:      	ldpsw	x1, x28, [x26, #-0xe8]
    3f7c:      	<unknown>
    3f80:      	<unknown>
    3f84:      	<unknown>
    3f88:      	<unknown>
    3f8c:      	fnmls	z9.h, p3/m, z18.h, z20.h
    3f90:      	ldnp	d18, d27, [x19, #-0x1f0]
    3f94:      	fnmls	z19.h, p0/m, z10.h, z6.h
    3f98:      	ldpsw	x19, x29, [x2, #-0x70]
    3f9c:      	sqshlu	v14.2d, v27.2d, #0xe
    3fa0:      	ldpsw	x1, x28, [x26, #-0xe8]
    3fa4:      	<unknown>
    3fa8:      	<unknown>
    3fac:      	<unknown>
    3fb0:      	<unknown>
    3fb4:      	<unknown>
    3fb8:      	<unknown>
    3fbc:      	fmaxnmv	h12, p0, z1.h
    3fc0:      	<unknown>
    3fc4:      	stnp	w24, w11, [x3, #-0x100]
    3fc8:      	<unknown>
    3fcc:      	stp	w24, w8, [x1, #-0xb0]
    3fd0:      	<unknown>
    3fd4:      	<unknown>
    3fd8:      	<unknown>
    3fdc:      	fcmeq	p3.h, p1/z, z11.h, z12.h
    3fe0:      	<unknown>
    3fe4:      	cmla	z17.b, z9.b, z0.b, #180
    3fe8:      	ldpsw	x5, x28, [x27, #-0x60]
    3fec:      	ldpsw	x14, x24, [x11, #-0x60]
    3ff0:      	<unknown>
    3ff4:      	stnp	w29, w8, [x1, #-0xc0]
    3ff8:      	<unknown>
    3ffc:      	<unknown>
    4000:      	ubfx	w16, w9, #0, #11
    4004:      	<unknown>
    4008:      	str	b5, [x3, #0x848]
    400c:      	<unknown>
    4010:      	<unknown>
    4014:      	<unknown>
    4018:      	<unknown>
    401c:      	ldp	w14, w21, [x2, #0x70]
    4020:      	stnp	w0, w10, [x1, #-0x100]
    4024:      	<unknown>
    4028:      	<unknown>
    402c:      	<unknown>
    4030:      	<unknown>
    4034:      	<unknown>
    4038:      	adds	w0, w25, #0x80a
    403c:      	<unknown>
    4040:      	<unknown>
    4044:      	stp	w3, w25, [x11, #-0x100]
    4048:      	<unknown>
    404c:      	ldp	w14, w21, [x2, #0x70]
    4050:      	stnp	w0, w10, [x1, #-0x100]
    4054:      	<unknown>
    4058:      	adds	w3, w11, w0, uxtx #1
    405c:      	uqshl	v0.8h, v1.8h, v5.8h
    4060:      	<unknown>
    4064:      	stp	w11, w8, [x1, #-0x78]
    4068:      	<unknown>
    406c:      	ldpsw	x5, x28, [x27, #-0x60]
    4070:      	ldpsw	x14, x24, [x11, #-0x60]
    4074:      	stp	w15, w27, [x19, #-0x100]
    4078:      	<unknown>
    407c:      	ldp	w14, w21, [x2, #0x70]
    4080:      	stnp	w0, w10, [x1, #-0x100]
    4084:      	<unknown>
    4088:      	<unknown>
    408c:      	<unknown>
    4090:      	<unknown>
    4094:      	<unknown>
    4098:      	<unknown>
    409c:      	<unknown>
    40a0:      	<unknown>
    40a4:      	<unknown>
    40a8:      	<unknown>
    40ac:      	<unknown>
    40b0:      	<unknown>
    40b4:      	<unknown>
    40b8:      	<unknown>
    40bc:      	<unknown>
    40c0:      	<unknown>
    40c4:      	<unknown>
    40c8:      	fmaxnmv	h28, p0, z1.h
    40cc:      	uabd	v19.8h, v3.8h, v9.8h
    40d0:      	uqshl	v1.2d, v3.2d, #0x29
    40d4:      	<unknown>
    40d8:      	<unknown>
    40dc:      	str	b20, [x3, x0]
    40e0:      	<unknown>
    40e4:      	<unknown>
    40e8:      	fnmls	z6.h, p2/m, z10.h, z24.h
    40ec:      	<unknown>
    40f0:      	<unknown>
    40f4:      	<unknown>
    40f8:      	ldpsw	x13, x24, [x10, #-0x40]
    40fc:      	<unknown>
    4100:      	umlsl2	v14.4s, v11.8h, v3.h[6]
    4104:      	<unknown>
    4108:      	<unknown>
    410c:      	<unknown>
    4110:      	ubfx	w20, w3, #0, #27
    4114:      	uabdl2	v20.4s, v19.8h, v9.8h
    4118:      	str	b7, [x3, #0x848]
    411c:      	<unknown>
    4120:      	<unknown>
    4124:      	adr	x10, 0x44649
    4128:      	fadd	z9.h, z1.h, z12.h
    412c:      	<unknown>
    4130:      	<unknown>
    4134:      	<unknown>
    4138:      	<unknown>
    413c:      	<unknown>
    4140:      	ldnp	d2, d29, [x10, #-0x170]
    4144:      	<unknown>
    4148:      	<unknown>
    414c:      	ldp	d9, d27, [x11, #-0xb0]
    4150:      	<unknown>
    4154:      	<unknown>
    4158:      	uabdl2	v20.4s, v19.8h, v9.8h
    415c:      	uqshl	v7.8h, v3.8h, v5.8h
    4160:      	<unknown>
    4164:      	<unknown>
    4168:      	<unknown>
    416c:      	<unknown>
    4170:      	<unknown>
    4174:      	<unknown>
    4178:      	str	b9, [x1, #0x848]
    417c:      	ubfx	w0, w1, #0, #13
    4180:      	ldpsw	x20, x28, [x19, #0x98]
    4184:      	stnp	w26, w25, [x11, #-0x100]
    4188:      	sqshlu	v19.2d, v10.2d, #0x23
    418c:      	<unknown>
    4190:      	<unknown>
    4194:      	str	b9, [x1, #0x848]
    4198:      	eor	w0, w1, #0x1fff
    419c:      	ldnp	d5, d28, [x27, #-0xb0]
    41a0:      	str	b20, [x3, #0xf08]
    41a4:      	stnp	w0, w10, [x1, #-0xc0]
    41a8:      	<unknown>
    41ac:      	<unknown>
    41b0:      	<unknown>
    41b4:      	orn	w13, w1, w8, lsl #8
    41b8:      	ldpsw	x19, x29, [x2, #-0x70]
    41bc:      	stp	s14, s25, [x27, #-0x100]
    41c0:      	adr	x0, 0x52b45
    41c4:      	<unknown>
    41c8:      	adr	x15, 0x665cd
    41cc:      	fadd	z9.h, z1.h, z18.h
    41d0:      	<unknown>
    41d4:      	<unknown>
    41d8:      	<unknown>
    41dc:      	<unknown>
    41e0:      	stnp	w18, w8, [x1, #-0xc0]
    41e4:      	<unknown>
    41e8:      	stp	w20, w13, [x18, #-0x60]
    41ec:      	stp	w0, wzr, [x17, #-0x80]
    41f0:      	stnp	w0, w11, [x9, #-0x100]
    41f4:      	<unknown>
    41f8:      	<unknown>
    41fc:      	<unknown>
    4200:      	<unknown>
    4204:      	adr	x12, 0x66609
    4208:      	fadd	z9.h, z1.h, z18.h
    420c:      	<unknown>
    4210:      	<unknown>
    4214:      	stnp	w8, w10, [x1, #-0xc0]
    4218:      	bc.pl	0xa0b40
    421c:      	<unknown>
    4220:      	stp	s16, s10, [x9, #-0x100]
    4224:      	<unknown>
    4228:      	<unknown>
    422c:      	ldrh	w12, [x3, w5, uxtw]
    4230:      	<unknown>
    4234:      	ldpsw	x20, x27, [x26, #0xa8]
    4238:      	<unknown>
    423c:      	<unknown>
    4240:      	<unknown>
    4244:      	<unknown>
    4248:      	stp	w30, w8, [x1, #-0x60]
    424c:      	<unknown>
    4250:      	uabdl2	v20.4s, v19.8h, v9.8h
    4254:      	<unknown>
    4258:      	str	b17, [x9, #0x80a]
    425c:      	<unknown>
    4260:      	eor	w16, w25, #0x3ff
    4264:      	ldnp	d5, d28, [x27, #-0xb0]
    4268:      	str	b20, [x3, #0xf08]
    426c:      	<unknown>
    4270:      	<unknown>
    4274:      	stnp	w22, w13, [x1, #-0x100]
    4278:      	<unknown>
    427c:      	cbz	w14, 0x70d04
    4280:      	adr	x9, 0x100685
    4284:      	<unknown>
    4288:      	fnmls	z9.h, p3/m, z18.h, z20.h
    428c:      	ldnp	d18, d27, [x19, #-0x1f0]
    4290:      	<unknown>
    4294:      	b.hi	0xe8ec0
    4298:      	urshl	v15.8h, v11.8h, v9.8h
    429c:      	stnp	w20, w27, [x19, #-0x100]
    42a0:      	<unknown>
    42a4:      	ldp	w9, w27, [x19, #-0xc8]
    42a8:      	cbz	w0, 0x4482c
    42ac:      	<unknown>
    42b0:      	<unknown>
    42b4:      	stnp	w9, w8, [x1, #-0xc0]
    42b8:      	<unknown>
    42bc:      	<unknown>
    42c0:      	<unknown>
    42c4:      	<unknown>
    42c8:      	<unknown>
    42cc:      	ldurb	w8, [x10, #-0xdc]
    42d0:      	<unknown>
    42d4:      	ldpsw	x5, x28, [x27, #-0x60]
    42d8:      	ldpsw	x14, x24, [x11, #-0x60]
    42dc:      	<unknown>
    42e0:      	<unknown>
    42e4:      	<unknown>
    42e8:      	<unknown>
    42ec:      	ldpsw	x5, x28, [x27, #-0x60]
    42f0:      	ldpsw	x14, x24, [x11, #-0x60]
    42f4:      	adds	w15, w19, w0, uxtx #3
    42f8:      	uqshl	v0.8h, v1.8h, v5.8h
    42fc:      	<unknown>
    4300:      	stp	w11, w8, [x1, #-0x78]
    4304:      	stnp	w0, w15, [x1, #-0x100]
    4308:      	ldxrh	w0, [x1]
    430c:      	orn	w1, w18, w24, lsl #20
    4310:      	<unknown>
    4314:      	<unknown>
    4318:      	<unknown>
    431c:      	<unknown>
    4320:      	<unknown>
    4324:      	<unknown>
    4328:      	ldurb	w8, [x10, #-0xdc]
    432c:      	stnp	w10, w10, [x9, #-0x100]
    4330:      	<unknown>
    4334:      	adds	w3, w11, w0, uxtx #1
    4338:      	uqshl	v0.8h, v1.8h, v5.8h
    433c:      	<unknown>
    4340:      	stp	w11, w8, [x1, #-0x78]
    4344:      	<unknown>
    4348:      	ldpsw	x5, x28, [x27, #-0x60]
    434c:      	ldpsw	x14, x24, [x11, #-0x60]
    4350:      	stp	w15, w27, [x19, #-0x100]
    4354:      	umlal2	v0.4s, v16.8h, v3.h[5]
    4358:      	fnmls	z21.h, p4/m, z19.h, z3.h
    435c:      	adr	x0, 0x44ae1
    4360:      	adr	x24, 0x6498d
    4364:      	<unknown>
    4368:      	<unknown>
    436c:      	<unknown>
    4370:      	eor	w5, w3, #0xff000001
    4374:      	<unknown>
    4378:      	ldnp	d14, d21, [x19, #-0x1f0]
    437c:      	<unknown>
    4380:      	adr	x1, 0x44b25
    4384:      	<unknown>
    4388:      	ldp	w14, w21, [x2, #0x70]
    438c:      	stnp	w0, w10, [x1, #-0x100]
    4390:      	<unknown>
    4394:      	<unknown>
    4398:      	<unknown>
    439c:      	<unknown>
    43a0:      	<unknown>
    43a4:      	<unknown>
    43a8:      	<unknown>
    43ac:      	stp	w3, w25, [x11, #-0x100]
    43b0:      	<unknown>
    43b4:      	ldp	w14, w21, [x2, #0x70]
    43b8:      	stnp	w0, w10, [x1, #-0x100]
    43bc:      	<unknown>
    43c0:      	adds	w3, w11, w0, uxtx #1
    43c4:      	uqshl	v0.8h, v1.8h, v5.8h
    43c8:      	ldp	w7, w29, [x3, #-0xc0]
    43cc:      	<unknown>
    43d0:      	ldpsw	x5, x28, [x27, #-0x60]
    43d4:      	ldpsw	x14, x24, [x11, #-0x60]
    43d8:      	stp	w15, w27, [x19, #-0x100]
    43dc:      	uqshl	v0.8h, v0.8h, v5.8h
    43e0:      	<unknown>
    43e4:      	<unknown>
    43e8:      	<unknown>
    43ec:      	<unknown>
    43f0:      	<unknown>
    43f4:      	ldnp	d2, d29, [x10, #-0x170]
    43f8:      	<unknown>
    43fc:      	<unknown>
    4400:      	ldp	d9, d27, [x11, #-0xb0]
    4404:      	ldpsw	x1, x28, [x26, #-0xe8]
    4408:      	<unknown>
    440c:      	<unknown>
    4410:      	<unknown>
    4414:      	fadd	z8.h, z3.h, z12.h
    4418:      	<unknown>
    441c:      	<unknown>
    4420:      	<unknown>
    4424:      	<unknown>
    4428:      	<unknown>
    442c:      	ldnp	d2, d29, [x10, #-0x170]
    4430:      	<unknown>
    4434:      	<unknown>
    4438:      	ldp	d9, d27, [x11, #-0xb0]
    443c:      	ldpsw	x1, x28, [x26, #-0xe8]
    4440:      	<unknown>
    4444:      	<unknown>
    4448:      	<unknown>
    444c:      	<unknown>
    4450:      	<unknown>
    4454:      	ldpsw	x20, x28, [x19, #0x98]
    4458:      	stnp	w26, w25, [x11, #-0x100]
    445c:      	<unknown>
    4460:      	<unknown>
    4464:      	ldp	w9, w27, [x19, #-0xc8]
    4468:      	<unknown>
    446c:      	<unknown>
    4470:      	<unknown>
    4474:      	<unknown>
    4478:      	rsubhn2	v5.8h, v27.4s, v15.4s
    447c:      	<unknown>
    4480:      	ldp	w9, w27, [x19, #-0xc8]
    4484:      	<unknown>
    4488:      	<unknown>
    448c:      	<unknown>
    4490:      	<unknown>
    4494:      	ldpsw	x5, x28, [x27, #-0x60]
    4498:      	ldpsw	x14, x24, [x11, #-0x60]
    449c:      	<unknown>
    44a0:      	adr	x1, 0x44c45
    44a4:      	<unknown>
    44a8:      	<unknown>
    44ac:      	<unknown>
    44b0:      	<unknown>
    44b4:      	uabdl2	v20.4s, v19.8h, v9.8h
    44b8:      	<unknown>
    44bc:      	<unknown>
    44c0:      	ldpsw	x1, x28, [x26, #-0xe8]
    44c4:      	<unknown>
    44c8:      	fnmls	z19.h, p2/m, z10.h, z26.h
    44cc:      	fcmne	p0.h, p2/z, z1.h, #0.0
    44d0:      	<unknown>
    44d4:      	ldpsw	x19, x29, [x2, #-0x70]
    44d8:      	<unknown>
    44dc:      	adr	x1, 0x44c81
    44e0:      	<unknown>
    44e4:      	uabdl2	v20.4s, v19.8h, v9.8h
    44e8:      	<unknown>
    44ec:      	str	b17, [x9, #0x80a]
    44f0:      	adr	x29, 0x528f5
    44f4:      	<unknown>
    44f8:      	<unknown>
    44fc:      	ldpsw	x20, x28, [x19, #0x98]
    4500:      	stnp	w26, w25, [x11, #-0x100]
    4504:      	<unknown>
    4508:      	<unknown>
    450c:      	adr	x1, 0x44cb1
    4510:      	<unknown>
    4514:      	ldp	w14, w21, [x2, #0x70]
    4518:      	<unknown>
    451c:      	ldurb	w8, [x10, #-0xdc]
    4520:      	<unknown>
    4524:      	<unknown>
    4528:      	<unknown>
    452c:      	<unknown>
    4530:      	umlal2	v13.4s, v1.8h, v3.h[1]
    4534:      	fnmls	z21.h, p4/m, z19.h, z3.h
    4538:      	<unknown>
    453c:      	ldpsw	x1, x28, [x26, #-0xe8]
    4540:      	<unknown>
    4544:      	<unknown>
    4548:      	<unknown>
    454c:      	ldp	w18, w24, [x27, #-0xd8]
    4550:      	<unknown>
    4554:      	ldp	w14, w21, [x2, #0x70]
    4558:      	umlal2	v0.4s, v1.8h, v3.h[5]
    455c:      	fnmls	z21.h, p4/m, z19.h, z3.h
    4560:      	stnp	w0, w11, [x9, #-0x100]
    4564:      	<unknown>
    4568:      	stp	w24, w8, [x1, #-0xb0]
    456c:      	<unknown>
    4570:      	<unknown>
    4574:      	<unknown>
    4578:      	str	b9, [x1, #0xf88]
    457c:      	<unknown>
    4580:      	<unknown>
    4584:      	ldpsw	x20, x28, [x19, #0x98]
    4588:      	stnp	w26, w25, [x11, #-0x100]
    458c:      	<unknown>
    4590:      	<unknown>
    4594:      	ldpsw	x10, x8, [x1, #-0x68]
    4598:      	<unknown>
    459c:      	ldxrh	w0, [x1]
    45a0:      	tbz	w1, #0x6, 0x6fe8
    45a4:      	<unknown>
    45a8:      	fnmls	z1.h, p3/m, z3.h, z21.h
    45ac:      	adds	w0, w1, #0x80f
    45b0:      	<unknown>
    45b4:      	fnmls	z1.h, p3/m, z3.h, z21.h
    45b8:      	adr	x0, 0x44d3d
    45bc:      	<unknown>
    45c0:      	ldnp	d8, d21, [x17, #-0x1f0]
    45c4:      	<unknown>
    45c8:      	<unknown>
    45cc:      	<unknown>
    45d0:      	<unknown>
    45d4:      	ldpsw	x18, x20, [x26, #-0xc0]
    45d8:      	tbz	w6, #0xa, 0xfffffffffffff464
    45dc:      	<unknown>
    45e0:      	umin	v3.8h, v26.8h, v21.8h
    45e4:      	<unknown>
    45e8:      	<unknown>
    45ec:      	<unknown>
    45f0:      	cbz	w20, 0x7109c
    45f4:      	<unknown>
    45f8:      	<unknown>
    45fc:      	ldpsw	x21, x27, [x19, #-0x60]
    4600:      	fcmeq	p13.h, p1/z, z11.h, z19.h
    4604:      	<unknown>
    4608:      	<unknown>
    460c:      	<unknown>
    4610:      	<unknown>
    4614:      	b.eq	0xa92f4
    4618:      	<unknown>
    461c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4620:      	orn	w9, w3, w0, lsl #25
    4624:      	stp	w9, w8, [x1, #-0x80]
    4628:      	<unknown>
    462c:      	mls	v9.8h, v19.8h, v15.h[2]
    4630:      	<unknown>
    4634:      	fnmls	z22.h, p2/m, z11.h, z3.h
    4638:      	<unknown>
    463c:      	ldpsw	x12, x25, [x11, #0x60]
    4640:      	<unknown>
    4644:      	<unknown>
    4648:      	<unknown>
    464c:      	fnmls	z14.h, p1/m, z3.h, z12.h
    4650:      	<unknown>
    4654:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4658:      	orn	w9, w3, w0, lsl #25
    465c:      	stp	w9, w8, [x1, #-0x80]
    4660:      	b.eq	0xab340
    4664:      	<unknown>
    4668:      	umlal2	v8.4s, v1.8h, v6.h[7]
    466c:      	orn	w9, w3, w0, lsl #25
    4670:      	stp	w9, w8, [x1, #-0x80]
    4674:      	<unknown>
    4678:      	<unknown>
    467c:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4680:      	orn	w9, w3, w0, lsl #25
    4684:      	stp	w9, w8, [x1, #-0x80]
    4688:      	<unknown>
    468c:      	<unknown>
    4690:      	b.al	0x52f4
    4694:      	fnmls	z1.h, p0/m, z19.h, z12.h
    4698:      	<unknown>
    469c:      	<unknown>
    46a0:      	umlal2	v8.4s, v1.8h, v6.h[7]
    46a4:      	orn	w9, w3, w0, lsl #25
    46a8:      	stp	w9, w8, [x1, #-0x80]
    46ac:      	<unknown>
    46b0:      	<unknown>
    46b4:      	stnp	w29, w8, [x1, #-0xc0]
    46b8:      	<unknown>
    46bc:      	<unknown>
    46c0:      	adr	x16, 0x4be6 <.text+0x3be6>
    46c4:      	<unknown>
    46c8:      	<unknown>
    46cc:      	<unknown>
    46d0:      	stnp	w1, w15, [x9, #-0x100]
    46d4:      	ldpsw	x8, x29, [x17, #-0x88]
    46d8:      	stp	w4, w8, [x3, #-0xb0]
    46dc:      	<unknown>
    46e0:      	ldpsw	x14, x27, [x26, #-0x60]
    46e4:      	<unknown>
    46e8:      	ldpsw	x14, x24, [x27, #-0x60]
    46ec:      	<unknown>
    46f0:      	stnp	w29, w8, [x1, #-0xc0]
    46f4:      	<unknown>
    46f8:      	<unknown>
    46fc:      	eor	w16, w9, #0x7ff
    4700:      	<unknown>
    4704:      	<unknown>
    4708:      	<unknown>
    470c:      	stnp	w1, w15, [x9, #-0x100]
    4710:      	ldpsw	x8, x29, [x17, #-0x88]
    4714:      	stp	w4, w8, [x3, #-0xb0]
    4718:      	<unknown>
    471c:      	fnmls	z14.h, p0/m, z10.h, z13.h
    4720:      	<unknown>
    4724:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4728:      	orn	w9, w3, w0, lsl #25
    472c:      	stp	w9, w8, [x1, #-0x80]
    4730:      	<unknown>
    4734:      	b.ls	0xf7400
    4738:      	<unknown>
    473c:      	adds	w29, w1, #0xcc8
    4740:      	<unknown>
    4744:      	str	b11, [x3, #0x848]
    4748:      	<unknown>
    474c:      	<unknown>
    4750:      	adr	x10, 0x44c75
    4754:      	<unknown>
    4758:      	ldpsw	x9, x27, [x27, #-0x70]
    475c:      	str	b20, [x11, x0, lsl #0]
    4760:      	adds	w29, w1, #0xcc8
    4764:      	<unknown>
    4768:      	<unknown>
    476c:      	<unknown>
    4770:      	<unknown>
    4774:      	umlsl2	v6.4s, v11.8h, v12.h[4]
    4778:      	fcmeq	p3.h, p2/z, z27.h, z18.h
    477c:      	<unknown>
    4780:      	st1	{ v5.8h, v6.8h, v7.8h }, [x3]
    4784:      	ldp	s15, s24, [x27, #-0xa8]
    4788:      	<unknown>
    478c:      	str	b11, [x3, #0x848]
    4790:      	ldpsw	x0, x17, [x9, #-0xd0]
    4794:      	<unknown>
    4798:      	umin	v21.8h, v18.8h, v9.8h
    479c:      	<unknown>
    47a0:      	fnmls	z12.h, p2/m, z11.h, z26.h
    47a4:      	mla	v4.8h, v3.8h, v12.h[0]
    47a8:      	<unknown>
    47ac:      	<unknown>
    47b0:      	<unknown>
    47b4:      	<unknown>
    47b8:      	<unknown>
    47bc:      	ldpsw	x3, x28, [x11, #-0x58]
    47c0:      	<unknown>
    47c4:      	fnmls	z14.h, p0/m, z10.h, z13.h
    47c8:      	<unknown>
    47cc:      	umlal2	v8.4s, v1.8h, v6.h[7]
    47d0:      	orn	w9, w3, w0, lsl #25
    47d4:      	stp	w9, w8, [x1, #-0x80]
    47d8:      	<unknown>
    47dc:      	<unknown>
    47e0:      	<unknown>
    47e4:      	umlal2	v8.4s, v1.8h, v6.h[7]
    47e8:      	orn	w9, w3, w0, lsl #25
    47ec:      	stp	w9, w8, [x1, #-0x80]
    47f0:      	<unknown>
    47f4:      	<unknown>
    47f8:      	str	b5, [x3, #0x848]
    47fc:      	<unknown>
    4800:      	<unknown>
    4804:      	adr	x10, 0x44d29
    4808:      	<unknown>
    480c:      	fnmls	z1.h, p3/m, z3.h, z21.h
    4810:      	<unknown>
    4814:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4818:      	orn	w9, w3, w0, lsl #25
    481c:      	stp	w9, w8, [x1, #-0x80]
    4820:      	adr	x0, 0xef283
    4824:      	<unknown>
    4828:      	<unknown>
    482c:      	<unknown>
    4830:      	<unknown>
    4834:      	stnp	w1, w15, [x9, #-0x100]
    4838:      	ldpsw	x8, x29, [x17, #-0x88]
    483c:      	stp	w4, w8, [x3, #-0xb0]
    4840:      	<unknown>
    4844:      	<unknown>
    4848:      	<unknown>
    484c:      	<unknown>
    4850:      	<unknown>
    4854:      	str	b20, [x3, #0x848]
    4858:      	<unknown>
    485c:      	<unknown>
    4860:      	adr	x10, 0x44d85
    4864:      	mla	v9.8h, v1.8h, v8.h[0]
    4868:      	<unknown>
    486c:      	<unknown>
    4870:      	stnp	w29, w8, [x1, #-0xc0]
    4874:      	<unknown>
    4878:      	<unknown>
    487c:      	stnp	w16, w10, [x9]
    4880:      	<unknown>
    4884:      	<unknown>
    4888:      	str	b9, [x1, #0xc0a]
    488c:      	stp	w29, w12, [x9, #-0xb8]
    4890:      	ldp	d0, d16, [x8, #-0xe0]
    4894:      	<unknown>
    4898:      	fnmls	z20.h, p2/m, z10.h, z13.h
    489c:      	<unknown>
    48a0:      	stnp	w14, w24, [x25]
    48a4:      	<unknown>
    48a8:      	ldpsw	x4, x23, [x27, #0x30]
    48ac:      	<unknown>
    48b0:      	ldpsw	x20, x16, [x19, #-0x58]
    48b4:      	adr	x12, 0xc3542
    48b8:      	<unknown>
    48bc:      	<unknown>
    48c0:      	ldp	d8, d21, [x3, #-0x170]
    48c4:      	<unknown>
    48c8:      	<unknown>
    48cc:      	adds	w8, w18, #0xbde
    48d0:      	adr	x16, 0x64ed5
    48d4:      	ldp	w16, w12, [x1, #0xa8]
    48d8:      	ldp	d0, d16, [x8, #-0xe0]
    48dc:      	fnmls	z7.h, p1/m, z10.h, z14.h
    48e0:      	bc.hs	0xcb60c
    48e4:      	<unknown>
    48e8:      	b.vc	0xed590
    48ec:      	<unknown>
    48f0:      	subs	w6, w18, #0x95c, lsl #12 // =0x95c000
    48f4:      	<unknown>
    48f8:      	adr	x1, 0x4509d
    48fc:      	<unknown>
    4900:      	<unknown>
    4904:      	fnmls	z8.h, p2/m, z11.h, z20.h
    4908:      	<unknown>
    490c:      	b.ne	0x45698
    4910:      	<unknown>
    4914:      	<unknown>
    4918:      	<unknown>
    491c:      	ldpsw	x1, x29, [x19, #-0xf8]
    4920:      	ldnp	d12, d24, [x11, #-0x1e0]
    4924:      	usubl2	v5.4s, v3.8h, v9.8h
    4928:      	fnmls	z0.h, p5/m, z1.h, z8.h
    492c:      	<unknown>
    4930:      	fmls	z12.h, p0/m, z1.h, z8.h
    4934:      	<unknown>
    4938:      	<unknown>
    493c:      	<unknown>
    4940:      	ldrh	w18, [x11, #0x1930]
    4944:      	rsubhn2	v0.8h, v25.4s, v1.4s
    4948:      	<unknown>
    494c:      	<unknown>
    4950:      	umax	v19.4h, v11.4h, v4.4h
    4954:      	fadd	z10.h, z0.h, z18.h
    4958:      	<unknown>
    495c:      	<unknown>
    4960:      	fcmla	v21.8h, v27.8h, v3.h[0], #270
    4964:      	ldpsw	x4, x25, [x11, #0x60]
    4968:      	<unknown>
    496c:      	<unknown>
    4970:      	fnmls	z3.h, p3/m, z26.h, z4.h
    4974:      	<unknown>
    4978:      	umlal2	v8.4s, v1.8h, v6.h[7]
    497c:      	orn	w9, w3, w0, lsl #25
    4980:      	stp	w9, w8, [x1, #-0x80]
    4984:      	ldnp	d0, d17, [x16, #-0x170]
    4988:      	ldp	d5, d27, [x19, #-0x1f0]
    498c:      	str	b5, [x3, #0x848]
    4990:      	<unknown>
    4994:      	<unknown>
    4998:      	adr	x10, 0x44ebd
    499c:      	fadd	z9.h, z1.h, z4.h
    49a0:      	ldpsw	x19, x24, [x27, #-0x70]
    49a4:      	uqshl	v16.2d, v3.2d, #0x29
    49a8:      	str	b14, [x3, #0x848]
    49ac:      	<unknown>
    49b0:      	<unknown>
    49b4:      	adr	x10, 0x44ed9
    49b8:      	ldpsw	x9, x0, [x1, #0x60]
    49bc:      	<unknown>
    49c0:      	<unknown>
    49c4:      	<unknown>
    49c8:      	umlal2	v8.4s, v1.8h, v6.h[7]
    49cc:      	orn	w9, w3, w0, lsl #25
    49d0:      	stp	w9, w8, [x1, #-0x80]
    49d4:      	<unknown>
    49d8:      	fcmeq	p15.h, p4/z, z19.h, z12.h
    49dc:      	<unknown>
    49e0:      	stnp	w1, w15, [x9, #-0x100]
    49e4:      	ldpsw	x8, x29, [x17, #-0x88]
    49e8:      	stp	w4, w8, [x3, #-0xb0]
    49ec:      	<unknown>
    49f0:      	<unknown>
    49f4:      	<unknown>
    49f8:      	stnp	w29, w8, [x1, #-0xc0]
    49fc:      	<unknown>
    4a00:      	<unknown>
    4a04:      	cmla	z16.b, z9.b, z0.b, #180
    4a08:      	<unknown>
    4a0c:      	<unknown>
    4a10:      	str	b8, [x3, #0x848]
    4a14:      	<unknown>
    4a18:      	<unknown>
    4a1c:      	adr	x10, 0x44f41
    4a20:      	ldurh	w9, [x1, #0x50]
    4a24:      	<unknown>
    4a28:      	<unknown>
    4a2c:      	<unknown>
    4a30:      	stnp	w29, w8, [x1, #-0xc0]
    4a34:      	<unknown>
    4a38:      	<unknown>
    4a3c:      	<unknown>
    4a40:      	uabd	v24.8h, v3.8h, v5.8h
    4a44:      	<unknown>
    4a48:      	<unknown>
    4a4c:      	<unknown>
    4a50:      	adr	x1, 0x451f5
    4a54:      	stnp	w0, w8, [x8, #-0xc0]
    4a58:      	fnmls	z5.h, p6/m, z2.h, z20.h
    4a5c:      	<unknown>
    4a60:      	<unknown>
    4a64:      	<unknown>
    4a68:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4a6c:      	orn	w9, w3, w0, lsl #25
    4a70:      	stp	w9, w8, [x1, #-0x80]
    4a74:      	<unknown>
    4a78:      	ldtrh	w0, [x1, #0x52]
    4a7c:      	<unknown>
    4a80:      	<unknown>
    4a84:      	ldpsw	x20, x24, [x11, #0x98]
    4a88:      	<unknown>
    4a8c:      	stp	w29, w8, [x1, #-0x80]
    4a90:      	stnp	w9, w0, [x1, #-0xf8]
    4a94:      	<unknown>
    4a98:      	fnmls	z5.h, p3/m, z19.h, z4.h
    4a9c:      	<unknown>
    4aa0:      	str	b1, [x3, #0x848]
    4aa4:      	<unknown>
    4aa8:      	<unknown>
    4aac:      	adr	x10, 0x44fd1
    4ab0:      	<unknown>
    4ab4:      	sqshrnb	z6.b, z1.h, #0x8
    4ab8:      	uabd	v24.8h, v3.8h, v5.8h
    4abc:      	<unknown>
    4ac0:      	<unknown>
    4ac4:      	<unknown>
    4ac8:      	adr	x29, 0x4526d
    4acc:      	ubfx	w9, w9, #0, #11
    4ad0:      	<unknown>
    4ad4:      	umlal2	v19.4s, v3.8h, v3.h[2]
    4ad8:      	<unknown>
    4adc:      	uabd	v24.8h, v3.8h, v5.8h
    4ae0:      	<unknown>
    4ae4:      	<unknown>
    4ae8:      	<unknown>
    4aec:      	<unknown>
    4af0:      	<unknown>
    4af4:      	umlal2	v5.4s, v3.8h, v4.h[3]
    4af8:      	<unknown>
    4afc:      	sqshlu	v18.2d, v11.2d, #0x30
    4b00:      	<unknown>
    4b04:      	<unknown>
    4b08:      	<unknown>
    4b0c:      	<unknown>
    4b10:      	fnmls	z1.h, p4/m, z3.h, z16.h
    4b14:      	<unknown>
    4b18:      	<unknown>
    4b1c:      	<unknown>
    4b20:      	<unknown>
    4b24:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4b28:      	orn	w9, w3, w0, lsl #25
    4b2c:      	stp	w9, w8, [x1, #-0x80]
    4b30:      	<unknown>
    4b34:      	<unknown>
    4b38:      	<unknown>
    4b3c:      	<unknown>
    4b40:      	<unknown>
    4b44:      	str	b20, [x3, x0]
    4b48:      	adr	x29, 0x54f4d
    4b4c:      	<unknown>
    4b50:      	<unknown>
    4b54:      	<unknown>
    4b58:      	<unknown>
    4b5c:      	<unknown>
    4b60:      	stnp	w0, w11, [x9, #-0x100]
    4b64:      	bc.pl	0xa148c
    4b68:      	<unknown>
    4b6c:      	<unknown>
    4b70:      	adds	w0, w25, #0x80a
    4b74:      	mla	v9.8h, v1.8h, v3.h[0]
    4b78:      	fcmne	p0.h, p6/z, z11.h, z13.h
    4b7c:      	<unknown>
    4b80:      	<unknown>
    4b84:      	stnp	w14, w24, [x25]
    4b88:      	<unknown>
    4b8c:      	stp	s20, s26, [x3, #-0x100]
    4b90:      	<unknown>
    4b94:      	stnp	w28, w15, [x9, #-0x100]
    4b98:      	<unknown>
    4b9c:      	<unknown>
    4ba0:      	<unknown>
    4ba4:      	<unknown>
    4ba8:      	<unknown>
    4bac:      	<unknown>
    4bb0:      	<unknown>
    4bb4:      	<unknown>
    4bb8:      	ldpsw	x5, x28, [x27, #-0x60]
    4bbc:      	ldpsw	x14, x24, [x11, #-0x60]
    4bc0:      	<unknown>
    4bc4:      	<unknown>
    4bc8:      	<unknown>
    4bcc:      	<unknown>
    4bd0:      	<unknown>
    4bd4:      	<unknown>
    4bd8:      	adr	x29, 0x54fdd
    4bdc:      	<unknown>
    4be0:      	<unknown>
    4be4:      	<unknown>
    4be8:      	<unknown>
    4bec:      	<unknown>
    4bf0:      	stnp	w0, w11, [x9, #-0x100]
    4bf4:      	bc.pl	0xa151c
    4bf8:      	umlal2	v14.4s, v10.8h, v3.h[5]
    4bfc:      	fnmls	z21.h, p4/m, z19.h, z3.h
    4c00:      	<unknown>
    4c04:      	<unknown>
    4c08:      	<unknown>
    4c0c:      	<unknown>
    4c10:      	<unknown>
    4c14:      	<unknown>
    4c18:      	<unknown>
    4c1c:      	<unknown>
    4c20:      	<unknown>
    4c24:      	<unknown>
    4c28:      	umlal2	v8.4s, v1.8h, v6.h[7]
    4c2c:      	orn	w9, w3, w0, lsl #25
    4c30:      	stp	w9, w8, [x1, #-0x80]
    4c34:      	<unknown>
    4c38:      	<unknown>
    4c3c:      	<unknown>
    4c40:      	stnp	w1, w15, [x9, #-0x100]
    4c44:      	ldpsw	x8, x29, [x17, #-0x88]
    4c48:      	stp	w4, w8, [x3, #-0xb0]
    4c4c:      	<unknown>
    4c50:      	<unknown>
    4c54:      	ldp	w14, w21, [x2, #0x70]
    4c58:      	<unknown>
    4c5c:      	<unknown>
    4c60:      	ldpsw	x0, x10, [x1, #-0x68]
    4c64:      	<unknown>
    4c68:      	<unknown>
    4c6c:      	<unknown>
    4c70:      	<unknown>
    4c74:      	stp	s17, s10, [x9, #-0x100]
    4c78:      	stp	w0, w12, [x9, #-0xb8]
    4c7c:      	<unknown>
    4c80:      	<unknown>
    4c84:      	<unknown>
    4c88:      	<unknown>
    4c8c:      	<unknown>
    4c90:      	<unknown>
    4c94:      	<unknown>
    4c98:      	<unknown>
    4c9c:      	stp	s18, s10, [x11, #-0x100]
    4ca0:      	stp	w0, w12, [x9, #-0xb8]
    4ca4:      	<unknown>
    4ca8:      	<unknown>
    4cac:      	<unknown>
    4cb0:      	umax	v14.4h, v11.4h, v4.4h
    4cb4:      	udf	#0x63
    4cb8:      	udf	#0x38cc
    4cbc:      	udf	#0x0
    4cc0:      	udf	#0x38d4
    4cc4:      	udf	#0x0
    4cc8:      	udf	#0x38dc
    4ccc:      	udf	#0x0
    4cd0:      	udf	#0x38e4
    4cd4:      	udf	#0x0
    4cd8:      	udf	#0x38ec
    4cdc:      	udf	#0x0
    4ce0:      	udf	#0x38f4
    4ce4:      	udf	#0x0
    4ce8:      	udf	#0x38fc
    4cec:      	udf	#0x0
    4cf0:      	udf	#0x3904
    4cf4:      	udf	#0x0
    4cf8:      	udf	#0x390c
    4cfc:      	udf	#0x0
    4d00:      	udf	#0x3914
    4d04:      	udf	#0x0
    4d08:      	udf	#0x391c
    4d0c:      	udf	#0x0
    4d10:      	udf	#0x3818
    4d14:      	udf	#0x0
    4d18:      	udf	#0x3818
    4d1c:      	udf	#0x0
    4d20:      	udf	#0x3818
    4d24:      	udf	#0x0
    4d28:      	udf	#0x3818
    4d2c:      	udf	#0x0
    4d30:      	<unknown>
    4d34:      	ldpsw	x18, x25, [x11, #-0xc8]
    4d38:      	<unknown>
    4d3c:      	<unknown>
    4d40:      	<unknown>
    4d44:      	<unknown>
    4d48:      	<unknown>
    4d4c:      	<unknown>
    4d50:      	umlsl2	v22.4s, v11.8h, v3.h[7]
    4d54:      	umlal2	v18.4s, v3.8h, v13.h[0]
    4d58:      	<unknown>
    4d5c:      	<unknown>
    4d60:      	fmls	z20.h, p0/m, z3.h, z16.h
    4d64:      	<unknown>
    4d68:      	fmls	z13.h, p0/m, z3.h, z18.h
    4d6c:      	<unknown>
    4d70:      	<unknown>
    4d74:      	<unknown>
    4d78:      	uqshl	v1.2d, v3.2d, #0x29
    4d7c:      	<unknown>
    4d80:      	umin	v21.8h, v18.8h, v11.8h
    4d84:      	<unknown>
    4d88:      	<unknown>
    4d8c:      	fnmls	z7.h, p1/m, z10.h, z14.h
    4d90:      	<unknown>
    4d94:      	fnmls	z20.h, p2/m, z10.h, z13.h
    4d98:      	fmls	z18.h, p0/m, z3.h, z18.h
    4d9c:      	<unknown>
    4da0:      	<unknown>
    4da4:      	bic	w24, w19, w0, lsl #11
    4da8:      	<unknown>
    4dac:      	adr	x20, 0xdfa5b
    4db0:      	umlal2	v20.4s, v3.8h, v4.h[3]
    4db4:      	<unknown>
    4db8:      	<unknown>
    4dbc:      	fminv	h13, p0, z2.h
    4dc0:      	ldpsw	x14, x25, [x11, #-0x70]
    4dc4:      	ldpsw	x3, x8, [x3, #0xa0]
    4dc8:      	<unknown>
    4dcc:      	ldpsw	x18, x25, [x11, #-0xc8]
    4dd0:      	<unknown>
    4dd4:      	<unknown>
    4dd8:      	<unknown>
    4ddc:      	<unknown>
    4de0:      	<unknown>
    4de4:      	b.ls	0x45a50
    4de8:      	<unknown>
    4dec:      	<unknown>
    4df0:      	ldpsw	x5, x27, [x19, #-0x68]
    4df4:      	stgp	x15, x27, [x19, #-0x400]
    4df8:      	umlal2	v19.4s, v3.8h, v14.h[2]
    4dfc:      	ldp	d20, d8, [x3, #-0x170]
    4e00:      	ldp	d16, d27, [x3, #-0x1b0]
    4e04:      	fnmls	z5.h, p3/m, z19.h, z20.h
    4e08:      	<unknown>
    4e0c:      	<unknown>
    4e10:      	cbz	w3, 0x71b1c
    4e14:      	<unknown>
    4e18:      	fnmls	z20.h, p2/m, z10.h, z13.h
    4e1c:      	<unknown>
    4e20:      	<unknown>
    4e24:      	<unknown>
    4e28:      	<unknown>
    4e2c:      	eor	w20, w27, #0xfffffff
    4e30:      	<unknown>
    4e34:      	ldrh	w15, [x18, #0x1636]
    4e38:      	<unknown>
    4e3c:      	fnmls	z9.h, p4/m, z27.h, z20.h
    4e40:      	<unknown>
    4e44:      	<unknown>
    4e48:      	<unknown>
    4e4c:      	<unknown>
    4e50:      	<unknown>
    4e54:      	<unknown>
    4e58:      	eor	w20, w27, #0xfffffff
    4e5c:      	<unknown>
    4e60:      	ldrh	w15, [x18, #0x1636]
    4e64:      	<unknown>
    4e68:      	fnmls	z9.h, p4/m, z27.h, z20.h
    4e6c:      	<unknown>
    4e70:      	<unknown>
    4e74:      	<unknown>
    4e78:      	fnmls	z1.h, p5/m, z2.h, z20.h
    4e7c:      	<unknown>
    4e80:      	<unknown>
    4e84:      	fnmls	z18.h, p2/m, z11.h, z20.h
    4e88:      	<unknown>
    4e8c:      	<unknown>
    4e90:      	fnmls	z7.h, p1/m, z10.h, z14.h
    4e94:      	<unknown>
    4e98:      	fnmls	z20.h, p2/m, z10.h, z13.h
    4e9c:      	fmls	z18.h, p0/m, z3.h, z18.h
    4ea0:      	<unknown>
    4ea4:      	uabdl	v5.4s, v19.4h, v19.4h
    4ea8:      	<unknown>
    4eac:      	<unknown>
    4eb0:      	ushl	v0.8h, v25.8h, v5.8h
    4eb4:      	<unknown>
    4eb8:      	ldp	d0, d21, [x1, #-0x170]
    4ebc:      	<unknown>
    4ec0:      	uabd	v24.8h, v3.8h, v5.8h
    4ec4:      	<unknown>
    4ec8:      	<unknown>
    4ecc:      	<unknown>
    4ed0:      	ldnp	d9, d27, [x11, #-0x100]
    4ed4:      	umin	v5.8h, v11.8h, v5.8h
    4ed8:      	<unknown>
    4edc:      	udf	#0x200a
		...
