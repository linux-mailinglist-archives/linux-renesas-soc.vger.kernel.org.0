Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE97E45EA88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 10:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347772AbhKZJnV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 04:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359378AbhKZJlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 04:41:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88F4C0613F2;
        Fri, 26 Nov 2021 01:35:20 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BDEF340;
        Fri, 26 Nov 2021 10:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637919318;
        bh=Kb1OjapeoZTA+Iy4gBvfvPpWnG0GA3u3IPVikYIXN7E=;
        h=From:To:Cc:Subject:Date:From;
        b=ZNti6pkY7q/Z8RUd2JtDrlhrCBvhQ47Hps5L/L7Ilw+YL6zLAG+FLdzhCKhyzC9AB
         FCcBZQFMTxBpkz6eIdtgMwxMwOo3aUfSkxa/sSD5ErlOPQrIiOjTacVGbpuE/IwQTb
         dMYHu52u/YhMK3aaYpVipEuPfSPnkY8mDEK3fjRY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: rcar-du: crtc: Support external DSI dot clock
Date:   Fri, 26 Nov 2021 09:35:14 +0000
Message-Id: <20211126093514.927340-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On platforms with an external clock, both the group and crtc must be
handled accordingly to correctly pass through the external clock and
configure the DU to use the external rate.

The CRTC support was missed while adding the DSI support on the r8a779a0
which led to the output clocks being incorrectly determined.

Ensure that when a CRTC is routed through the DSI encoder, the external
clock is used without any further divider being applied.

Fixes: b291fdcf5114 ("drm: rcar-du: Add r8a779a0 device support")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5672830ca184..5236f917cc68 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -261,12 +261,13 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
 		escr = ESCR_DCLKSEL_DCLKIN | div;
-	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
+	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) ||
+		   rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) {
 		/*
-		 * Use the LVDS PLL output as the dot clock when outputting to
-		 * the LVDS encoder on an SoC that supports this clock routing
-		 * option. We use the clock directly in that case, without any
-		 * additional divider.
+		 * Use the external LVDS or DSI PLL output as the dot clock when
+		 * outputting to the LVDS or DSI encoder on an SoC that supports
+		 * this clock routing option. We use the clock directly in that
+		 * case, without any additional divider.
 		 */
 		escr = ESCR_DCLKSEL_DCLKIN;
 	} else {
-- 
2.30.2

