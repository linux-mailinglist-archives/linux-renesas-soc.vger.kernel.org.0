Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926B86A3954
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 04:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjB0DMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Feb 2023 22:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjB0DMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Feb 2023 22:12:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94113D300;
        Sun, 26 Feb 2023 19:12:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 973BB60C90;
        Mon, 27 Feb 2023 02:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC2EC4339B;
        Mon, 27 Feb 2023 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677463604;
        bh=l4zo8mrJ2tQ7qSfJQ+Bufn/YJ2QzWpT6UCjRWBqEGQ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N5kfr2NYqLl2tqI44yrcaPH8lS53p1Ny0stvE5F8Niw+efnSf9D1NNTYjKF13qWle
         afz6vrtcyEEzE+vGr9ECr0r+I//z0OzklWTyaksJc0FMNVoyM1JLPgV+BTQnP+7gbI
         2NbGCVRdE8abe2rtmCk96hidCXTcYDIbrNoXdbfRmRBQYw3DI3LRv9FrnmrawZRufW
         cin+qW5TIDxQ6pVfO1UnwxvbkFUjswimpGX5e5+73iMroLXE0zg1oVgjEZL4Ljj7FD
         I+azQtIVmi409jKNwZn5GFy9pJ8YB3+QAqDmtsgvz9gxg+sWAlumPZbB3nvBKAwahG
         9L9sENPqdlnyw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sasha Levin <sashal@kernel.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@gmail.com,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 26/58] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Date:   Sun, 26 Feb 2023 21:04:24 -0500
Message-Id: <20230227020457.1048737-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

[ Upstream commit 5fbc2f3b91d27e12b614947048764099570cbb55 ]

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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h |  8 ++------
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f2d3266509cc1..b7dd59fe119e6 100644
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
index 0dada0646b2eb..6381578c4db58 100644
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
index df87ccab146f4..acc3673fefe18 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -35,6 +35,7 @@ struct rcar_du_device;
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
+#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index c1bcb0e8b5b4e..789ae9285108e 100644
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
2.39.0

