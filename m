Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6E575F93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jul 2022 12:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbiGOK5h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jul 2022 06:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiGOK5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jul 2022 06:57:36 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD0CA85D71
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jul 2022 03:57:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="127981317"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jul 2022 19:57:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 003B14251BF2;
        Fri, 15 Jul 2022 19:57:28 +0900 (JST)
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
Subject: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date:   Fri, 15 Jul 2022 11:57:16 +0100
Message-Id: <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
$ xxd -p sfdp 
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

$ md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
23e3ec56b5b8f986d0488ba4727239dd  /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f4218
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
at25ql128a
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
atmel
v2->v1:
 * Added flash definitions into Atmel table.
RFC->v1:
 * Moved the flash definitions to atmel.c
 * Remove macro related to locking as it is untested.
 * Replaced INFO macro with SNOR_ID3
 
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/spi-nor/atmel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..80c24d138b27 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -186,6 +186,7 @@ static const struct flash_info atmel_nor_parts[] = {
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "at25ql128a", SNOR_ID3(0x1f4218) },
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
-- 
2.25.1

