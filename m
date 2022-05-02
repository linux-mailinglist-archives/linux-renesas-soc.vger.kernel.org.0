Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4F5176FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 20:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbiEBS7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 14:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiEBS7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 14:59:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B14EF6467
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 11:56:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,192,1647270000"; 
   d="scan'208";a="119809059"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 May 2022 03:56:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1E0A940CB0B7;
        Tue,  3 May 2022 03:56:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Walle <michael@walle.cc>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date:   Mon,  2 May 2022 19:56:13 +0100
Message-Id: <20220502185613.83483-1-biju.das.jz@bp.renesas.com>
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
$  xxd -p sfdp 
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

:~# md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
23e3ec56b5b8f986d0488ba4727239dd

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f4218

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
at25ql128a

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
renesas

RFC->v1:
 * Moved the flash definitions to atmel.c
 * Remove macro related to locking as it is untested.
 * Replaced INFO macro with SNOR_ID3
 
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/spi-nor/atmel.c | 55 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c  |  1 +
 drivers/mtd/spi-nor/core.h  |  1 +
 3 files changed, 57 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..61cff6de7db2 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -10,6 +10,15 @@
 
 #define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
 
+#define SNOR_ID3(_jedec_id) \
+	.id = { \
+		((_jedec_id) >> 16) & 0xff, \
+		((_jedec_id) >> 8) & 0xff, \
+		(_jedec_id) & 0xff, \
+	}, \
+	.id_len = 3, \
+	.parse_sfdp = true
+
 /*
  * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
  * block protection bits. We don't support them. But legacy behavior in linux
@@ -204,6 +213,52 @@ static const struct flash_info atmel_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K) },
 };
 
+static const struct flash_info renesas_nor_parts[] = {
+	{ "at25ql128a", SNOR_ID3(0x1f4218) },
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
+
 const struct spi_nor_manufacturer spi_nor_atmel = {
 	.name = "atmel",
 	.parts = atmel_nor_parts,
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
-- 
2.25.1

