Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C774543D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 10:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhKQJkV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 04:40:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:57394 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235152AbhKQJkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 04:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FYUeK2JdrU/rAWh4/4QkV2cW9d6
        JzIm6PfHQdMILjT4=; b=IVU+geOLyX4mJ8TDuiC6Wrb2wtz8IUV3a5Mu2trNrBG
        eUevbfUsmZLQmzv/o2Dl8ElDGmvLvm1RhUUi1UTfCfQ1YHYrgkl+8mZDiMdQzaOl
        Iric4Vd9vNSq6eL4CWBl9PiobySlnhVQZnvb6RnzgkD+4IA9RjnOFaViM7rN0J6g
        =
Received: (qmail 3038911 invoked from network); 17 Nov 2021 10:37:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2021 10:37:19 +0100
X-UD-Smtp-Session: l3s3148p1@60NkyfjQtusgAwDPXwoaAHKn46ZTsFWo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
Date:   Wed, 17 Nov 2021 10:37:10 +0100
Message-Id: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of writing fixed values with undocumented bits which happen to
be set on some SoCs, better switch to read-modify-write operations
changing only bits which are documented. This is way more future-proof
as we don't know yet how these bits may be on upcoming SoCs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch is based on the Krzysztof's for-next branch as it depends on
Prabhakar's G2L additions.

Tested on a V3U with some debug code verifying that the same values are
written before and after the patch.

@Prabhakar: would you be so kind and test this patch on G2L?

 drivers/memory/renesas-rpc-if.c | 58 +++++++++++++--------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 8c51145c0f5c..a9f3e7bdddf8 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -20,7 +20,6 @@
 
 #define RPCIF_CMNCR		0x0000	/* R/W */
 #define RPCIF_CMNCR_MD		BIT(31)
-#define RPCIF_CMNCR_SFDE	BIT(24) /* undocumented but must be set */
 #define RPCIF_CMNCR_MOIIO3(val)	(((val) & 0x3) << 22)
 #define RPCIF_CMNCR_MOIIO2(val)	(((val) & 0x3) << 20)
 #define RPCIF_CMNCR_MOIIO1(val)	(((val) & 0x3) << 18)
@@ -290,49 +289,36 @@ int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 		rpcif_rzg2l_timing_adjust_sdr(rpc);
 	}
 
-	/*
-	 * NOTE: The 0x260 are undocumented bits, but they must be set.
-	 *	 RPCIF_PHYCNT_STRTIM is strobe timing adjustment bits,
-	 *	 0x0 : the delay is biggest,
-	 *	 0x1 : the delay is 2nd biggest,
-	 *	 On H3 ES1.x, the value should be 0, while on others,
-	 *	 the value should be 7.
-	 */
-	if (rpc->type == RPCIF_RCAR_GEN3) {
-		regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
-			     RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
-	} else {
-		regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
-		dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
-		dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
-		regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
-	}
+	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_PHYMEM_MASK,
+			   RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0));
+
+	if (rpc->type == RPCIF_RCAR_GEN3)
+		regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
+				   RPCIF_PHYCNT_STRTIM(7), RPCIF_PHYCNT_STRTIM(7));
 
-	/*
-	 * NOTE: The 0x1511144 are undocumented bits, but they must be set
-	 *       for RPCIF_PHYOFFSET1.
-	 *	 The 0x31 are undocumented bits, but they must be set
-	 *	 for RPCIF_PHYOFFSET2.
-	 */
-	regmap_write(rpc->regmap, RPCIF_PHYOFFSET1, 0x1511144 |
-		     RPCIF_PHYOFFSET1_DDRTMG(3));
-	regmap_write(rpc->regmap, RPCIF_PHYOFFSET2, 0x31 |
-		     RPCIF_PHYOFFSET2_OCTTMG(4));
+	regmap_update_bits(rpc->regmap, RPCIF_PHYOFFSET1, RPCIF_PHYOFFSET1_DDRTMG(3),
+			   RPCIF_PHYOFFSET1_DDRTMG(3));
+	regmap_update_bits(rpc->regmap, RPCIF_PHYOFFSET2, RPCIF_PHYOFFSET2_OCTTMG(7),
+			   RPCIF_PHYOFFSET2_OCTTMG(4));
 
 	if (hyperflash)
 		regmap_update_bits(rpc->regmap, RPCIF_PHYINT,
 				   RPCIF_PHYINT_WPVAL, 0);
 
 	if (rpc->type == RPCIF_RCAR_GEN3)
-		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
-			     RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
-			     RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
+		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
+				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_BSZ(3),
+				   RPCIF_CMNCR_MOIIO_HIZ |
+				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 	else
-		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
-			     RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
-			     RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
-			     RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
-			     RPCIF_CMNCR_IO0FV(2) | RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
+		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
+				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
+				   RPCIF_CMNCR_BSZ(3),
+				   RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
+				   RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
+				   RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
+				   RPCIF_CMNCR_IO0FV(2) |
+				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 
 	/* Set RCF after BSZ update */
 	regmap_write(rpc->regmap, RPCIF_DRCR, RPCIF_DRCR_RCF);
-- 
2.30.2

