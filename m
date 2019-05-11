Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E118D1A982
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfEKVHi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfEKVHi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:38 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96F5F592;
        Sat, 11 May 2019 23:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608853;
        bh=dB76op1mzWO6EKW52D0E/JeVc7EJSQd8SxSYSpftUSE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U4jSV+8agVMtSoAbq44v2RsZE5cl0TMXvFmy18v21hGM9kniQfPRld8jJm/npaTr+
         z9d8QYmJbjMW/3IkcKwWDdvc5Pu1yPZ+TiKf4zrC3LDOK2KDFN6ZGJL+JrP2ULdVPm
         TUYU68g+QVZjhOWEYpEldMWBDCZ6m2A/2fLlmT6w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 05/10] drm: rcar-du: lvds: Remove LVDS double-enable checks
Date:   Sun, 12 May 2019 00:06:57 +0300
Message-Id: <20190511210702.18394-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DRM core and DU driver guarantee that the LVDS bridge will not be
double-enabled or double-disabled. Remove the corresponding unnecessary
checks.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 620b51aab291..a331f0c32187 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -63,7 +63,6 @@ struct rcar_lvds {
 		struct clk *extal;		/* External clock */
 		struct clk *dotclkin[2];	/* External DU clocks */
 	} clocks;
-	bool enabled;
 
 	struct drm_display_mode display_mode;
 	enum rcar_lvds_mode mode;
@@ -368,15 +367,12 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
 
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
-	WARN_ON(lvds->enabled);
-
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return ret;
 
 	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
 
-	lvds->enabled = true;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
@@ -390,13 +386,9 @@ void rcar_lvds_clk_disable(struct drm_bridge *bridge)
 
 	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
 
-	WARN_ON(!lvds->enabled);
-
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clocks.mod);
-
-	lvds->enabled = false;
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
 
@@ -417,8 +409,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	u32 lvdcr0;
 	int ret;
 
-	WARN_ON(lvds->enabled);
-
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return;
@@ -507,16 +497,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 		drm_panel_prepare(lvds->panel);
 		drm_panel_enable(lvds->panel);
 	}
-
-	lvds->enabled = true;
 }
 
 static void rcar_lvds_disable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	WARN_ON(!lvds->enabled);
-
 	if (lvds->panel) {
 		drm_panel_disable(lvds->panel);
 		drm_panel_unprepare(lvds->panel);
@@ -527,8 +513,6 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clocks.mod);
-
-	lvds->enabled = false;
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -592,8 +576,6 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	WARN_ON(lvds->enabled);
-
 	lvds->display_mode = *adjusted_mode;
 
 	rcar_lvds_get_lvds_mode(lvds);
@@ -793,7 +775,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 
 	lvds->dev = &pdev->dev;
 	lvds->info = of_device_get_match_data(&pdev->dev);
-	lvds->enabled = false;
 
 	ret = rcar_lvds_parse_dt(lvds);
 	if (ret < 0)
-- 
Regards,

Laurent Pinchart

