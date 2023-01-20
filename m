Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA13674FCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjATIvF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 03:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjATIvC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 03:51:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894A58A711
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 00:50:53 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EED81356;
        Fri, 20 Jan 2023 09:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674204634;
        bh=oMDiphF1jl1T5vR30hK2QqcO4RPYassVOa9jn9YcbfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E4Wi+VMQL7hIJcFO4EVwwMav9qzhoas1p+YvudBHwVEhWqNbZ30fwIAF6+ebL3ple
         KADVtBH7l8RwUyr03jbs69nzcfAqo8teXMdh46bHiCLtU+BvZhCFqsSo9mww+eF+K7
         1lf+F29lFQlxz3PTzHmlDxHAaG++0/4HUhEAixhI=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 6/7] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Date:   Fri, 20 Jan 2023 10:50:08 +0200
Message-Id: <20230120085009.604797-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On H3 ES1.x two bits in DPLLCR are used to select the DU input dot clock
source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
non-ES1.x, only the higher bits are used (bits 21 and 23), and the lower
bits are reserved and should be set to 0.

The current code always sets the lower bits, even on non-ES1.x.

For both DU1 and DU2, on all SoC versions, when writing zeroes to those
bits the input clock is DCLKIN, and thus there's no difference between
ES1.x and non-ES1.x.

For DU1, writing 0b10 to the bits (or only writing the higher bit)
results in using PLL0 as the input clock, so in this case there's also
no difference between ES1.x and non-ES1.x.

However, for DU2, writing 0b10 to the bits results in using PLL0 as the
input clock on ES1.x, whereas on non-ES1.x it results in using PLL1. On
ES1.x you need to write 0b11 to select PLL1.

The current code always writes 0b11 to PLCS0 field to select PLL1 on all
SoC versions, which works but causes an illegal (in the sense of not
allowed by the documentation) write to a reserved bit field.

To remove the illegal bit write on PLSC0 we need to handle the input dot
clock selection differently for ES1.x and non-ES1.x.

Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this. This way we can
always set the bit 21 on PLSC0 when choosing the PLL as the source
clock, and additionally set the bit 20 when on ES1.x.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h |  8 ++------
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f2d3266509cc..b7dd59fe119e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -245,13 +245,30 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
 		       | DPLLCR_STBY;
 
-		if (rcrtc->index == 1)
+		if (rcrtc->index == 1) {
 			dpllcr |= DPLLCR_PLCS1
 			       |  DPLLCR_INCS_DOTCLKIN1;
-		else
-			dpllcr |= DPLLCR_PLCS0
+		} else {
+			dpllcr |= DPLLCR_PLCS0_PLL
 			       |  DPLLCR_INCS_DOTCLKIN0;
 
+			/*
+			 * On ES2.x we have a single mux controlled via bit 21,
+			 * which selects between DCLKIN source (bit 21 = 0) and
+			 * a PLL source (bit 21 = 1), where the PLL is always
+			 * PLL1.
+			 *
+			 * On ES1.x we have an additional mux, controlled
+			 * via bit 20, for choosing between PLL0 (bit 20 = 0)
+			 * and PLL1 (bit 20 = 1). We always want to use PLL1,
+			 * so on ES1.x, in addition to setting bit 21, we need
+			 * to set the bit 20.
+			 */
+
+			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
+				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1;
+		}
+
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
 		escr = ESCR_DCLKSEL_DCLKIN | div;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index ea3a8cff74b7..82f9718ff500 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -394,7 +394,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
-	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
+	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
+		| RCAR_DU_QUIRK_H3_ES1_PLL,
 	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index df87ccab146f..acc3673fefe1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -35,6 +35,7 @@ struct rcar_du_device;
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
+#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index c1bcb0e8b5b4..789ae9285108 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -283,12 +283,8 @@
 #define DPLLCR			0x20044
 #define DPLLCR_CODE		(0x95 << 24)
 #define DPLLCR_PLCS1		(1 << 23)
-/*
- * PLCS0 is bit 21, but H3 ES1.x requires bit 20 to be set as well. As bit 20
- * isn't implemented by other SoC in the Gen3 family it can safely be set
- * unconditionally.
- */
-#define DPLLCR_PLCS0		(3 << 20)
+#define DPLLCR_PLCS0_PLL	(1 << 21)
+#define DPLLCR_PLCS0_H3ES1X_PLL1	(1 << 20)
 #define DPLLCR_CLKE		(1 << 18)
 #define DPLLCR_FDPLL(n)		((n) << 12)
 #define DPLLCR_N(n)		((n) << 5)
-- 
2.34.1

