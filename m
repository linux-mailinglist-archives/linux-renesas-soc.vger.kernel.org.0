Return-Path: <linux-renesas-soc+bounces-17062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C495AB5FBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 01:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934564618CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 23:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310A41F16B;
	Tue, 13 May 2025 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBA6BTiq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D3136337
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177219; cv=none; b=c4pD0KWIL3Db1weTVz1Q3i7R1St0BFzfnb8ZFFWzqApxpKk5eAfGNddXG8QwhSV7uIXPAWlYrA09odNc4drUV4ltsNinmg2YJH562f6O8SJ/SuM6/+YkOCqfnbxqK+yimMQxwrEH+6HJxu8daDwP9viBdFdoP3mtela+GxDiOug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177219; c=relaxed/simple;
	bh=AZttWyih/SSLb55sqpPRyTxy9mSfFBF5e5eIZ/CnWhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=df6lzo2Ryz7iiJu8A/5DGZOZAR3fcYDMfWbcD5eYuXefkT8e5rea4Q9WhSgX5eGrEGGNM+S2l8+JlfLXuUapNBNy9CNs/2eoxej78GF89oWOFjaMrna1AMH9LA95d6N356lfF4PKwcAQXJssWda9bPSvA5QvrkIV1OVVDjyKKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBA6BTiq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747177217; x=1778713217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZttWyih/SSLb55sqpPRyTxy9mSfFBF5e5eIZ/CnWhM=;
  b=UBA6BTiqyFUQpVzmCuEhIfsdLFKtN+WhKGBbpxVOcHNmmf58VDw5nL78
   OgnyZLE/17mxwhG2ZSZOsaJ+Yzt3iCozR2+bsSgkhi5WLAXTXWyI4M0kt
   mbfriGqTHAbIeXKxnJpVE1i/3kwJmEUUe4NqXaK1yPv5qkq3GpVjzBjBs
   jKAyb01/+mPw6KAFhyq4v10v/6KPnH26aUTXOstAN+mqj/uhaiThil42P
   AfGZPymGBPB6XzhCzBEvQRt+H0a+2HGh4TadnC6ytF+kIo5BbjGPA3cBN
   3iIZpla3qAFGFXuba1Tk8tQrUjllRfoK2TJuetbTyxU5ZqHup6Y0TR2tP
   Q==;
X-CSE-ConnectionGUID: UZjxN6bYQ/eocT1G8t71Eg==
X-CSE-MsgGUID: y5ilqE+CSTmWrhdWWlxQYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52856873"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="52856873"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 16:00:16 -0700
X-CSE-ConnectionGUID: YxqnVIIJSj+vZyZV1TKoLQ==
X-CSE-MsgGUID: v/2JF9HBRxW3yp41ZZ8lGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137720686"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2025 16:00:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEybc-000GTf-29;
	Tue, 13 May 2025 23:00:12 +0000
Date: Wed, 14 May 2025 07:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/msiof-fifo 25/25]
 drivers/spi/spi-sh-msiof.c:1285:35: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202505140608.WAS0ac0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/msiof-fifo
head:   ea0b0c13af38da57a973b3c0f37e54595546ea2d
commit: ea0b0c13af38da57a973b3c0f37e54595546ea2d [25/25] [TEST] spi: sh-msiof: Add FIFO test code
config: arm64-randconfig-r112-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140608.WAS0ac0x-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505140608.WAS0ac0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140608.WAS0ac0x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-sh-msiof.c:1285:35: sparse: sparse: Using plain integer as NULL pointer

vim +1285 drivers/spi/spi-sh-msiof.c

  1279	
  1280	static void sh_msiof_test(struct sh_msiof_spi_priv *p)
  1281	{
  1282		unsigned int bitlen, wdlen1, wdlen2, words, tx_fifo_size, rx_fifo_size;
  1283		u32 tmdr2, tmdr3, rmdr2, rmdr3, fctr, fctr0, str, str0;
  1284		struct device *dev = &p->pdev->dev;
> 1285		struct spi_transfer t = { 0, };
  1286		void *dummy_tx = (void *)1;
  1287		void *dummy_rx = (void *)1;
  1288		static char buf[160];
  1289		unsigned int i, j;
  1290		u32 x, y;
  1291		int ret;
  1292	
  1293		sh_msiof_test_reset();
  1294	
  1295		pm_runtime_get_sync(dev);
  1296	
  1297		pr_info("--- Initial BITLEN / WDLEN / FUA values ---\n");
  1298		// BITLEN = 16
  1299		// WDLEN = 1
  1300		// TFUA = TX FIFO size (i.e. 256 on R-Car V4H/V4M, 64 everywhere else?)
  1301		// RFUA = 0
  1302	
  1303		fctr = sh_msiof_read(p, SIFCTR);
  1304		tmdr2 = sh_msiof_read(p, SITMDR2);
  1305		tmdr3 = sh_msiof_read(p, SITMDR3);
  1306		pr_info("TX: BITLEN1 %lu WDLEN1 %lu BITLEN2 %lu WDLEN2 %lu FUA %lu\n",
  1307			FIELD_GET(SIMDR2_BITLEN1, tmdr2) + 1,
  1308			FIELD_GET(SIMDR2_WDLEN1, tmdr2) + 1,
  1309			FIELD_GET(SIMDR3_BITLEN2, tmdr3) + 1,
  1310			FIELD_GET(SIMDR3_WDLEN2, tmdr3) + 1,
  1311			FIELD_GET(SIFCTR_TFUA, fctr));
  1312		rmdr2 = sh_msiof_read(p, SITMDR2);
  1313		rmdr3 = sh_msiof_read(p, SITMDR3);
  1314		pr_info("RX: BITLEN1 %lu WDLEN1 %lu BITLEN2 %lu WDLEN2 %lu FUA %lu\n",
  1315			FIELD_GET(SIMDR2_BITLEN1, rmdr2) + 1,
  1316			FIELD_GET(SIMDR2_WDLEN1, rmdr2) + 1,
  1317			FIELD_GET(SIMDR3_BITLEN2, rmdr3) + 1,
  1318			FIELD_GET(SIMDR3_WDLEN2, rmdr3) + 1,
  1319			FIELD_GET(SIFCTR_RFUA, fctr));
  1320	
  1321		tx_fifo_size = FIELD_GET(SIFCTR_TFUA, fctr);
  1322	
  1323		pr_info("--- WDLEN valid values test ---\n");
  1324		// => Everything sticks, no conclusion
  1325	
  1326		for (wdlen1 = 1; wdlen1 <= 256; wdlen1 *= 2) {
  1327			static const struct {
  1328				unsigned int offset;
  1329				const char *name;
  1330			} sixmdrx[] = {
  1331				{ SITMDR2, "SITMDR2" },
  1332				{ SITMDR3, "SITMDR3" },
  1333				{ SIRMDR2, "SIRMDR2" },
  1334				{ SIRMDR3, "SIRMDR3" },
  1335			};
  1336	
  1337			pr_info("WDLEN %u\n", wdlen1);
  1338	
  1339			for (i = 0; i < ARRAY_SIZE(sixmdrx); i++) {
  1340				x = sh_msiof_read(p, sixmdrx[i].offset);
  1341				x &= ~SIMDR2_WDLEN1;
  1342				x |= FIELD_PREP(SIMDR2_WDLEN1, wdlen1 - 1);
  1343				sh_msiof_write(p, sixmdrx[i].offset, x);
  1344	
  1345				y = sh_msiof_read(p, sixmdrx[i].offset);
  1346				if (x != y)
  1347					pr_info("%s: expected 0x%08x got 0x%08x\n",
  1348						sixmdrx[i].name, x, y);
  1349			}
  1350		}
  1351	
  1352		pr_info("--- Setup ---\n");
  1353	
  1354		sh_msiof_spi_reset_regs(p);
  1355	
  1356		sh_msiof_spi_set_pin_regs(p, /* ss */ 0, /* cpol */ false,
  1357					  /* cpha */ false, /* tx_hi_z */ false,
  1358					  /* lsb_first */ false, /* cs_high */ false);
  1359	
  1360		t.speed_hz = 100000;
  1361		sh_msiof_spi_set_clk_regs(p, &t);
  1362	
  1363		sh_msiof_write(p, SIFCTR, 0);
  1364	
  1365		bitlen = FIELD_MAX(SIMDR2_BITLEN1) + 1;
  1366		wdlen1 = FIELD_MAX(SIMDR2_WDLEN1) + 1;
  1367		wdlen2 = 0;
  1368		words = FIELD_MAX(SIMDR2_WDLEN1) + 1;
  1369		pr_info("Using word size %u and counts %u+%u to transfer %u words\n",
  1370			bitlen, wdlen1, wdlen2, words);
  1371		sh_msiof_spi_set_mode_regs(p, dummy_tx, dummy_rx, bitlen, wdlen1,
  1372					   wdlen2);
  1373	
  1374		pr_info("--- Fill TX FIFO ---\n");
  1375	
  1376		fctr0 = sh_msiof_read(p, SIFCTR);
  1377	
  1378		for (i = 0; i < 1024; i++) {
  1379			x = sh_msiof_write_word(p);
  1380	
  1381			for (j = 0; j < 10000; j++) {
  1382				fctr = sh_msiof_read(p, SIFCTR);
  1383				if (fctr != fctr0)
  1384					break;
  1385				udelay(1);
  1386			}
  1387	
  1388			pr_info("Wrote word %u (0x%08x): TFUA %lu RFUA %lu\n",
  1389				words_written, x, FIELD_GET(SIFCTR_TFUA, fctr),
  1390				FIELD_GET(SIFCTR_RFUA, fctr));
  1391	
  1392			if (fctr == fctr0) {
  1393				pr_info("No change in FCTR, aborting\n");
  1394				break;
  1395			}
  1396	
  1397			if (FIELD_GET(SIFCTR_TFUA, fctr) == 0) {
  1398				pr_info("TX FIFO full\n");
  1399				break;
  1400			}
  1401	
  1402			fctr0 = fctr;
  1403		}
  1404	
  1405		if (words_written != tx_fifo_size)
  1406			pr_err("Wrote %u words != TX fifo size %u\n", words_written,
  1407			       tx_fifo_size);
  1408	
  1409		pr_info("--- Start transmission ---\n");
  1410	
  1411		ret = sh_msiof_modify_ctr_wait(p, 0, SICTR_TSCKE);
  1412		pr_info("TSCKE enable: %pe\n", ERR_PTR(ret));
  1413	
  1414		ret = sh_msiof_modify_ctr_wait(p, 0, SICTR_RXE);
  1415		pr_info("RXE enable: %pe\n", ERR_PTR(ret));
  1416	
  1417		ret = sh_msiof_modify_ctr_wait(p, 0, SICTR_TXE);
  1418		pr_info("TXE enable: %pe\n", ERR_PTR(ret));
  1419	
  1420		str0 = sh_msiof_read(p, SISTR);
  1421		pr_info("STR 0x%x%s\n", str0, str_name(buf, str0));
  1422	
  1423		ret = sh_msiof_modify_ctr_wait(p, 0, SICTR_TFSE);
  1424		pr_info("TFSE enable: %pe\n", ERR_PTR(ret));
  1425	
  1426		pr_info("--- Wait for full RX FIFO, refill TX FIFO ---\n");
  1427	
  1428		for (i = 0; i < 1024; i++) {
  1429			for (j = 0; j < 10000; j++) {
  1430				fctr = sh_msiof_read(p, SIFCTR);
  1431				str = sh_msiof_read(p, SISTR);
  1432				if (fctr != fctr0 || str != str0)
  1433					break;
  1434				udelay(1);
  1435			}
  1436	
  1437			pr_info("TFUA %lu RFUA %lu STR 0x%x%s\n",
  1438				FIELD_GET(SIFCTR_TFUA, fctr),
  1439				FIELD_GET(SIFCTR_RFUA, fctr), str,
  1440				str_name(buf, str));
  1441	
  1442			if (fctr == fctr0 && str == str0) {
  1443				pr_info("No change in FCTR/STR, aborting\n");
  1444				break;
  1445			}
  1446	
  1447			if (str & SISTR_RFFUL) {
  1448				pr_info("RX FIFO full\n");
  1449				break;
  1450			}
  1451	
  1452			if (words_written < words && FIELD_GET(SIFCTR_TFUA, fctr)) {
  1453				for (j = 0; words_written < words &&
  1454					    FIELD_GET(SIFCTR_TFUA, fctr); j++) {
  1455					x = sh_msiof_write_word(p);
  1456					fctr = sh_msiof_read(p, SIFCTR);
  1457				}
  1458				pr_info("Wrote words %u-%u\n", words_written - j + 1,
  1459					words_written);
  1460			}
  1461	
  1462			fctr0 = fctr;
  1463			str0 = str;
  1464		}
  1465	
  1466		rx_fifo_size = FIELD_GET(SIFCTR_RFUA, fctr);
  1467	
  1468		pr_info("--- Empty RX FIFO ---\n");
  1469	
  1470		for (i = 0; i < 1024; i++) {
  1471			if (FIELD_GET(SIFCTR_RFUA, fctr) == 0) {
  1472				pr_info("RX FIFO empty\n");
  1473				break;
  1474			}
  1475	
  1476			x = sh_msiof_read_word(p);
  1477	
  1478			fctr = sh_msiof_read(p, SIFCTR);
  1479			str = sh_msiof_read(p, SISTR);
  1480			pr_info("Read word %u (0x%02x): TFUA %lu RFUA %lu STR 0x%x%s\n",
  1481				words_read, x, FIELD_GET(SIFCTR_TFUA, fctr),
  1482				FIELD_GET(SIFCTR_RFUA, fctr), str, str_name(buf, str));
  1483		}
  1484	
  1485		if (words_read != rx_fifo_size)
  1486			pr_err("Read %u words != RX fifo size %u\n", words_read,
  1487			       rx_fifo_size);
  1488	
  1489		pr_info("--- Shutdown ---\n");
  1490	
  1491		ret = sh_msiof_modify_ctr_wait(p, SICTR_TFSE, 0);
  1492		pr_info("TFSE disable: %pe\n", ERR_PTR(ret));
  1493	
  1494		ret = sh_msiof_modify_ctr_wait(p, SICTR_RXE, 0);
  1495		pr_info("RXE disable: %pe\n", ERR_PTR(ret));
  1496	
  1497		ret = sh_msiof_modify_ctr_wait(p, SICTR_TXE, 0);
  1498		pr_info("TXE disable: %pe\n", ERR_PTR(ret));
  1499	
  1500		ret = sh_msiof_modify_ctr_wait(p, 0, SICTR_TSCKE);
  1501		pr_info("TSCKE disable: %pe\n", ERR_PTR(ret));
  1502	
  1503		pr_info("--- Test summary ---\n");
  1504	
  1505		pr_info("FIFO can hold %u TX words and %u RX words\n", tx_fifo_size,
  1506			rx_fifo_size);
  1507		if (loopback)
  1508			pr_info("Wrote %u words, read %u words, %u mismatches\n",
  1509				words_written, words_read, mismatches);
  1510		else
  1511			pr_info("Wrote %u words, read %u words (no loopback)\n",
  1512				words_written, words_read);
  1513	
  1514		pr_info("--- Done ---\n");
  1515	
  1516		pm_runtime_put(dev);
  1517	}
  1518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

