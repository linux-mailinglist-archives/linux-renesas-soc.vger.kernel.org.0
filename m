Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9DA1E18C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbgEZBPl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388402AbgEZBPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 023EA1314;
        Tue, 26 May 2020 03:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455735;
        bh=ngk1Waix5Zpn+HT6o76C7ZdVINWe1mFIPSqyGvKJb74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pKs/y5cInnTQYQvl9AEHmIrXJGEycV9un4aM7e0Nd7f9ExxYJBg6OVFz8LRpGSihV
         EhKHwir7TTZDPhOgOwfFu8XjZ/MTEHcbyxUiQwB67iwJ9Q9rCgreWmVrI3aWg8K6V4
         McvGO2H2qVuCL/TjUYHUqUcqGhj6V1SnenxJCdJc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-amlogic@lists.infradead.org
Subject: [PATCH 11/27] drm: bridge: dw-hdmi: Pass private data pointer to .mode_valid()
Date:   Tue, 26 May 2020 04:14:49 +0300
Message-Id: <20200526011505.31884-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Platform glue drivers for dw_hdmi may need to access device-specific
data from their .mode_valid() implementation. They currently have no
clean way to do so, and one driver hacks around it by accessing the
dev_private data of the drm_device retrieved from the connector.

Add a priv_data void pointer to the dw_hdmi_plat_data structure, and
pass it to the .mode_valid() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  6 ++++--
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |  6 ++++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  3 ++-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  6 ++++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  3 ++-
 include/drm/bridge/dw_hdmi.h                | 14 ++++++++++++--
 8 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b535354150db..2b3f203cf467 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2771,6 +2771,7 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
 	struct drm_connector *connector = &hdmi->connector;
 	enum drm_mode_status mode_status = MODE_OK;
 
@@ -2778,8 +2779,9 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	if (hdmi->plat_data->mode_valid)
-		mode_status = hdmi->plat_data->mode_valid(connector, mode);
+	if (pdata->mode_valid)
+		mode_status = pdata->mode_valid(hdmi, pdata->priv_data,
+						connector, mode);
 
 	return mode_status;
 }
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index ba4ca17fd4d8..95aed4666c95 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -145,7 +145,8 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
 };
 
 static enum drm_mode_status
-imx6q_hdmi_mode_valid(struct drm_connector *con,
+imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		      struct drm_connector *con,
 		      const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
@@ -158,7 +159,8 @@ imx6q_hdmi_mode_valid(struct drm_connector *con,
 }
 
 static enum drm_mode_status
-imx6dl_hdmi_mode_valid(struct drm_connector *con,
+imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		       struct drm_connector *con,
 		       const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5be963e9db05..5cc311c1b8e0 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -630,7 +630,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 }
 
 static enum drm_mode_status
-dw_hdmi_mode_valid(struct drm_connector *connector,
+dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		   struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 452461dc96f2..4d837a4d302d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -38,7 +38,8 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
 };
 
 static enum drm_mode_status
-rcar_hdmi_mode_valid(struct drm_connector *connector,
+rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		     struct drm_connector *connector,
 		     const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 121aa8a63a76..d08f86783a28 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -220,7 +220,8 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 }
 
 static enum drm_mode_status
-dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
+dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
+			    struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 972682bb8000..0a3637442ba6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -31,7 +31,8 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
 };
 
 static enum drm_mode_status
-sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
+sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
+			      struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	if (mode->clock > 297000)
@@ -41,7 +42,8 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
 }
 
 static enum drm_mode_status
-sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
+sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi, void *data,
+			    struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 8e64945167e9..8587b8d2590e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -176,7 +176,8 @@ struct sun8i_hdmi_phy {
 };
 
 struct sun8i_dw_hdmi_quirks {
-	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
+					   struct drm_connector *connector,
 					   const struct drm_display_mode *mode);
 	unsigned int set_rate : 1;
 	unsigned int use_drm_infoframe : 1;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 0b34a12c4a1c..66a811f75b91 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -124,13 +124,23 @@ struct dw_hdmi_phy_ops {
 
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
-	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
-					   const struct drm_display_mode *mode);
+
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
 	bool ycbcr_420_allowed;
 
+	/*
+	 * Private data passed to all the .mode_valid() and .configure_phy()
+	 * callback functions.
+	 */
+	void *priv_data;
+
+	/* Platform-specific mode validation (optional). */
+	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
+					   struct drm_connector *connector,
+					   const struct drm_display_mode *mode);
+
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
 	const char *phy_name;
-- 
Regards,

Laurent Pinchart

