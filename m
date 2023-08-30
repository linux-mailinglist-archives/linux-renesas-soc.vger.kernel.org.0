Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1379778DCB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243167AbjH3Sq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245264AbjH3O6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:58:44 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95F3BA3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:58:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="174488241"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Aug 2023 23:58:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3B0674218435;
        Wed, 30 Aug 2023 23:58:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
Date:   Wed, 30 Aug 2023 15:58:35 +0100
Message-Id: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, RZ/G2L-alike SoCs use 2 different SPI serial flash memories
 1) AT25QL128A  embedded in RZ/{G2UL,Five} SMARC EVKs
 2) MT25QU512AB embedded in RZ/{G2L,G2LC,V2L} SMARC EVKs

As per section 8.14 on the AT25QL128A hardware manual,
IO1..IO3 must be set to Hi-Z state for this flash for fast read quad IO.
Snippet from HW manual section 8.14:
The upper nibble of the Mode(M7-4) controls the length of the next FAST
Read Quad IO instruction through the inclusion or exclusion of the first
byte instruction code. The lower nibble bits of the Mode(M3-0) are don't
care. However, the IO pins must be high-impedance before the falling edge
of the first data out clock.

As per the Figure 20: QUAD INPUT/OUTPUT FAST READ on MT25QU512AB mentions
IO1..IO2 to be in Hi-Z state and IO3 in '1' state

Add a variable io3_fv to struct rpcif_priv and check the child
node compatible value to detect micron flash and set IO1..IO3 states
based on flash type.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 9695b2d3ae59..68f2bb3f8e61 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -189,6 +189,7 @@ struct rpcif_priv {
 	u32 enable;		/* DRENR or SMENR */
 	u32 dummy;		/* DRDMCR or SMDMCR */
 	u32 ddr;		/* DRDRENR or SMDRENR */
+	u32 io3_fv;
 };
 
 static const struct rpcif_info rpcif_info_r8a7796 = {
@@ -367,7 +368,8 @@ int rpcif_hw_init(struct device *dev, bool hyperflash)
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
 				   RPCIF_CMNCR_MOIIO(3) | RPCIF_CMNCR_IOFV(3) |
 				   RPCIF_CMNCR_BSZ(3),
-				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(2) |
+				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IO0FV(2) |
+				   RPCIF_CMNCR_IO2FV(3) | rpc->io3_fv |
 				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 	else
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
@@ -774,6 +776,12 @@ static int rpcif_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (rpc->info->type == RPCIF_RZ_G2L &&
+	    of_device_is_compatible(flash, "micron,mt25qu512a"))
+		rpc->io3_fv = RPCIF_CMNCR_IO3FV(1);
+	else
+		rpc->io3_fv = RPCIF_CMNCR_IO3FV(3);
+
 	return 0;
 }
 
-- 
2.25.1

