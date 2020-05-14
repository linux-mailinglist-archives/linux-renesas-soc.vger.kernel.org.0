Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E9B1D248F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 03:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgENBR2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 21:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbgENBR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 21:17:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD16C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2020 18:17:27 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5452151F;
        Thu, 14 May 2020 03:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589419043;
        bh=6OA8NJ5Rmmwpb3l8gUZ3Xp629PcHZ50oODtwGfXW9k0=;
        h=From:To:Cc:Subject:Date:From;
        b=oOGLUV/ydDBk2Rhjvleo2m3Y1cow8Y6E9X4MVeK2CWchacc0Z+JKswIu0dvI4/d6J
         jqJ9wh3ZLIP9acJMQ3f1/dzXkZch+i5NVZP0cuh42XKK5M33EPFetUOntB1qxweEEj
         pNgDuGpu/fOhP7YGI1eB4lwUuU0nvjg4GpLHRT6U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] drm: bridge: dw-hdmi: Pass dw_hdmi pointer to .mode_valid() operation
Date:   Thu, 14 May 2020 04:17:06 +0300
Message-Id: <20200514011707.6512-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
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

Pass the dw_hdmi pointer to .mode_valid() in order give context
information to drivers, and add a dw_hdmi_device() to retrieve the
struct device related to the context.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 13 ++++++++++++-
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |  4 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  6 ++++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  3 ++-
 include/drm/bridge/dw_hdmi.h                |  4 +++-
 8 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 30681398cfb0..97c7a9a4983c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2778,7 +2778,8 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_BAD;
 
 	if (hdmi->plat_data->mode_valid)
-		mode_status = hdmi->plat_data->mode_valid(connector, mode);
+		mode_status = hdmi->plat_data->mode_valid(hdmi, connector,
+							  mode);
 
 	return mode_status;
 }
@@ -3395,6 +3396,16 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 		i2c_put_adapter(hdmi->ddc);
 }
 
+/*
+ * Retrieve the device passed to the dw_hdmi_probe() or dw_hdmi_bind()
+ * functions.
+ */
+struct device *dw_hdmi_device(struct dw_hdmi *hdmi)
+{
+	return hdmi->dev;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_device);
+
 /* -----------------------------------------------------------------------------
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index ba4ca17fd4d8..ff5b03a4a86a 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -145,7 +145,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
 };
 
 static enum drm_mode_status
-imx6q_hdmi_mode_valid(struct drm_connector *con,
+imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
 		      const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
@@ -158,7 +158,7 @@ imx6q_hdmi_mode_valid(struct drm_connector *con,
 }
 
 static enum drm_mode_status
-imx6dl_hdmi_mode_valid(struct drm_connector *con,
+imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
 		       const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5be963e9db05..174d45ecdeda 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -630,7 +630,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 }
 
 static enum drm_mode_status
-dw_hdmi_mode_valid(struct drm_connector *connector,
+dw_hdmi_mode_valid(struct dw_hdmi *hdmi,
+		   struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 452461dc96f2..3d2fdbeeb82d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -38,7 +38,7 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
 };
 
 static enum drm_mode_status
-rcar_hdmi_mode_valid(struct drm_connector *connector,
+rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *connector,
 		     const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 121aa8a63a76..32acfe2c3f58 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -220,7 +220,8 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 }
 
 static enum drm_mode_status
-dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
+dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi,
+			    struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 972682bb8000..055ffefd1b60 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -31,7 +31,8 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
 };
 
 static enum drm_mode_status
-sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
+sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi,
+			      struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	if (mode->clock > 297000)
@@ -41,7 +42,8 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
 }
 
 static enum drm_mode_status
-sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
+sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi,
+			    struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 8e64945167e9..f831cb351d72 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -176,7 +176,8 @@ struct sun8i_hdmi_phy {
 };
 
 struct sun8i_dw_hdmi_quirks {
-	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
+					   struct drm_connector *connector,
 					   const struct drm_display_mode *mode);
 	unsigned int set_rate : 1;
 	unsigned int use_drm_infoframe : 1;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 0b34a12c4a1c..c98010a53683 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -124,7 +124,8 @@ struct dw_hdmi_phy_ops {
 
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
-	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
+					   struct drm_connector *connector,
 					   const struct drm_display_mode *mode);
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
@@ -153,6 +154,7 @@ void dw_hdmi_unbind(struct dw_hdmi *hdmi);
 struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 			     struct drm_encoder *encoder,
 			     const struct dw_hdmi_plat_data *plat_data);
+struct device *dw_hdmi_device(struct dw_hdmi *hdmi);
 
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
-- 
Regards,

Laurent Pinchart

