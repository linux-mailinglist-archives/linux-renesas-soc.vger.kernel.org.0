Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8615D575F92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jul 2022 12:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiGOK5a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jul 2022 06:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiGOK53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jul 2022 06:57:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2777885F88
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jul 2022 03:57:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="126292367"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jul 2022 19:57:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 820E34251BF2;
        Fri, 15 Jul 2022 19:57:24 +0900 (JST)
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
Subject: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
Date:   Fri, 15 Jul 2022 11:57:15 +0100
Message-Id: <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
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

Add SNOR_ID3 macro to get chip info by parsing sfdp.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/mtd/spi-nor/core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 61886868cd02..153c1a0b2eda 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -548,6 +548,15 @@ struct flash_info {
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
 
+#define SNOR_ID3(_jedec_id)						\
+	.id = {								\
+		((_jedec_id) >> 16) & 0xff,				\
+		((_jedec_id) >> 8) & 0xff,				\
+		(_jedec_id) & 0xff,					\
+	},								\
+	.id_len = 3,							\
+	.parse_sfdp = true,						\
+
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
-- 
2.25.1

