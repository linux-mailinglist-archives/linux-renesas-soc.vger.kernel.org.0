Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EE5516738
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 20:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242069AbiEAS6t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 14:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbiEAS6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 14:58:47 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B036213CF9
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 11:55:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,190,1647270000"; 
   d="scan'208";a="118526525"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 May 2022 03:55:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2ED124006181;
        Mon,  2 May 2022 03:55:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date:   Sun,  1 May 2022 19:55:12 +0100
Message-Id: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for Renesas AT25QL128A serial nor flash.
Details of flash chip can be found here [1]

[1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,
 AT25QL128A serial nor flash is connected to RZ/G2UL SMARC EVK.
But with the current mtd support in mainline, I get the below error
[    3.928906] spi-nor spi1.0: unrecognized JEDEC id bytes: 1f 42 18 1f 42 18
[    3.937312] spi-nor: probe of spi1.0 failed with error -2

Then, I created a patch and the issue gone, It can detect the flash
[    3.937168] spi-nor spi1.0: at25ql128a (16384 Kbytes)
[    3.942902] 2 fixed-partitions partitions found on MTD device spi1.0
[    3.949459] Creating 2 MTD partitions on "spi1.0":
[    3.957540] 0x000000000000-0x000000200000 : "boot"
[    3.973740] 0x000000200000-0x000001000000 : "user"


Able to do read/write/format the partition with this patch.
So please provide your feedback on this patch.

&sbc {
	pinctrl-0 = <&qspi0_pins>;
	pinctrl-names = "default";
	status = "okay";

	flash@0 {
		compatible = "jedec,spi-nor";
		reg = <0>;
		spi-max-frequency = <50000000>;
		spi-tx-bus-width = <1>;
		spi-rx-bus-width = <4>;

		spi-cpol;
		spi-cpha;
		m25p,fast-read;

		partitions {
			compatible = "fixed-partitions";
			#address-cells = <1>;
			#size-cells = <1>;

			boot@0 {
				reg = <0x00000000 0x200000>;
				read-only;
			};
			user@200000 {
				reg = <0x200000 0xE00000>;
			};
		};
	};
};
---
 drivers/mtd/spi-nor/Makefile  |  1 +
 drivers/mtd/spi-nor/core.c    |  1 +
 drivers/mtd/spi-nor/core.h    |  1 +
 drivers/mtd/spi-nor/renesas.c | 57 +++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/renesas.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6b904e439372..2c2fce8e6132 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -12,6 +12,7 @@ spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
+spi-nor-objs			+= renesas.o
 spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b4f141ad9c9c..ba9f222da00b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1621,6 +1621,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_issi,
 	&spi_nor_macronix,
 	&spi_nor_micron,
+	&spi_nor_renesas,
 	&spi_nor_st,
 	&spi_nor_spansion,
 	&spi_nor_sst,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..3d2e39329079 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -511,6 +511,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_renesas;
 extern const struct spi_nor_manufacturer spi_nor_st;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
diff --git a/drivers/mtd/spi-nor/renesas.c b/drivers/mtd/spi-nor/renesas.c
new file mode 100644
index 000000000000..091542c8c088
--- /dev/null
+++ b/drivers/mtd/spi-nor/renesas.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info renesas_nor_parts[] = {
+	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+};
+
+/**
+ * renesas_nor_set_4byte_addr_mode() - Set 4-byte address mode for Renesas
+ * flashes.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
+ *		address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int renesas_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	if (ret)
+		return ret;
+
+	return spi_nor_write_disable(nor);
+}
+
+static void renesas_nor_default_init(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_HAS_LOCK;
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->quad_enable = NULL;
+	nor->params->set_4byte_addr_mode = renesas_nor_set_4byte_addr_mode;
+}
+
+static const struct spi_nor_fixups renesas_nor_fixups = {
+	.default_init = renesas_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_renesas = {
+	.name = "renesas",
+	.parts = renesas_nor_parts,
+	.nparts = ARRAY_SIZE(renesas_nor_parts),
+	.fixups = &renesas_nor_fixups,
+};
-- 
2.25.1

