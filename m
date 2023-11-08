Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9A07E5C0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Nov 2023 18:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjKHRMH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Nov 2023 12:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjKHRMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 12:12:06 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44D9A1FFC
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Nov 2023 09:12:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="182203715"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2023 02:12:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DA3F2402E576;
        Thu,  9 Nov 2023 02:11:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Walle <michael@walle.cc>,
        Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 2/4] mtd: spi-nor: Add post_sfdp() callback
Date:   Wed,  8 Nov 2023 17:11:47 +0000
Message-Id: <20231108171149.258656-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some generic flash devices such as Renesas AT25QL128A serial nor
flash requires the IO pins must be in high-impedance before the
falling edge of the first data out clock for the Fast Read Quad
IO.

Add post_sfdp() callback for generic flash devices and then call
spi_mem_set_iofv() to configure IO fixed value to control the pin
state.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mtd/spi-nor/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..eef3c286b174 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1997,6 +1997,21 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
+static int spi_nor_generic_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_device *spi = nor->spimem->spi;
+	const u8 *id = nor->id;
+
+	if (spi->mode & SPI_TX_QUAD && nor->spimem) {
+		const struct spi_nor_id *at25ql128a_id = SNOR_ID(0x1f, 0x42, 0x18);
+
+		if (!memcmp(id, at25ql128a_id->bytes, at25ql128a_id->len))
+			return spi_mem_set_iofv(nor->spimem, 0xff);
+	}
+
+	return 0;
+}
+
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
 	&spi_nor_eon,
@@ -2015,8 +2030,13 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_xmc,
 };
 
+static const struct spi_nor_fixups spi_nor_generic_fixups = {
+	.post_sfdp = spi_nor_generic_post_sfdp_fixup,
+};
+
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
+	.fixups = &spi_nor_generic_fixups,
 };
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-- 
2.25.1

