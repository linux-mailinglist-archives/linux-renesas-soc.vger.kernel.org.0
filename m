Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BEE66DF7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjAQNxw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjAQNxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:53:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505F22B627
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 05:52:17 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 464FE7F8;
        Tue, 17 Jan 2023 14:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673963534;
        bh=L99YGDzzTbqbieWnC8cqQjbsz6I2by92epxdF6ewtvg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ztc73Q/CiFlMxpPJLagAtwFUiilyMmBfMOaPY85ZDErmrTBNAK+L1pQ0stkP2qhna
         890W2NrHxyFaYVj1sSMoP7rpdGIO+FPzKi1OzQEg9Zu+dgZnRSwgBD8IwrNqG2mjYu
         gzivRXnU1b/PfYKBMwqVFO/ftxn6BHq+EBbmqUoQ=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Date:   Tue, 17 Jan 2023 15:51:51 +0200
Message-Id: <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
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

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to H/W manual, LVDCR0 register must be cleared bit by bit when
disabling LVDS.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
[tomi.valkeinen: simplified the code a bit]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 674b727cdaa2..01800cef1c33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 	iowrite32(data, lvds->mmio + reg);
 }
 
+static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
+{
+	return ioread32(lvds->mmio + reg);
+}
+
 /* -----------------------------------------------------------------------------
  * PLL Setup
  */
@@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	u32 lvdcr0;
+
+	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
+
+	lvdcr0 &= ~LVDCR0_LVRES;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
+		lvdcr0 &= ~LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
+		lvdcr0 &= ~LVDCR0_PWD;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
+		lvdcr0 &= ~LVDCR0_PLLON;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
 
-	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
-- 
2.34.1

