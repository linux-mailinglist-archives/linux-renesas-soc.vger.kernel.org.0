Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E56B674FC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 09:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjATIvC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 03:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjATIuw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 03:50:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B757E4BD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 00:50:51 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59CA612B9;
        Fri, 20 Jan 2023 09:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674204632;
        bh=q49VnqdzSqeyUciqub2Bzk/+Jyc9UdLTMu4zjTBdL6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=efjgPmV7aHC0Ex6ubEOccdRxErZE7coOsWFVjPi+eAy9c65xHWm5VOn7ur5n38rZc
         gUhDQCcJvf602Sou3X8n5fvIdOgZosvUw7bDwf5gTKcOJ8Bic/6J3gkNUlASSi46z1
         nhWqVbS8QVwX9lIPrxWBmQod0FpPNPGUPBvK3zEQ=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 4/7] drm: rcar-du: lvds: Fix stop sequence
Date:   Fri, 20 Jan 2023 10:50:06 +0200
Message-Id: <20230120085009.604797-5-tomi.valkeinen+renesas@ideasonboard.com>
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

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to hardware manual, LVDCR0 register must be cleared bit by bit
when disabling LVDS.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
[tomi.valkeinen: simplified the code a bit]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 668604616bfd..8fa5f7400179 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -83,6 +83,11 @@ struct rcar_lvds {
 #define bridge_to_rcar_lvds(b) \
 	container_of(b, struct rcar_lvds, bridge)
 
+static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
+{
+	return ioread32(lvds->mmio + reg);
+}
+
 static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 {
 	iowrite32(data, lvds->mmio + reg);
@@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
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
 
 	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
-- 
2.34.1

