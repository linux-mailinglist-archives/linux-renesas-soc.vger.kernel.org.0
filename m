Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736FB1E18CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388412AbgEZBPp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388402AbgEZBPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:45 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4874CE28;
        Tue, 26 May 2020 03:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455743;
        bh=Onc2Aey+F57jx6Zo7KZGar40NeL9Xogccx5D+2gUZV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pkNOGtHzgrbqla4CYKmxH2RHAGf57zaKp+031f5qvVErC6JJd28LHH0D8kXZC4ts0
         rxS322WcAh2zuAtW9DVviD/d4UXjp8ljqcx9SmzXfoHsnSFxOxEyx+tKQedd1LwFJ6
         KeVcflfhaDEPa7l7IE+AyWHhH/knBSDX9hRiwhWA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-amlogic@lists.infradead.org
Subject: [PATCH 16/27] drm: bridge: dw-hdmi: Constify mode argument to dw_hdmi_phy_ops .init()
Date:   Tue, 26 May 2020 04:14:54 +0300
Message-Id: <20200526011505.31884-17-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The PHY .init() must not modify the mode it receives. Make the pointer
const to enfore that.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c       | 4 ++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      | 2 +-
 include/drm/bridge/dw_hdmi.h                | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 23650e69604c..6e6a3d95e68e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1531,7 +1531,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 }
 
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
-			    struct drm_display_mode *mode)
+			    const struct drm_display_mode *mode)
 {
 	int i, ret;
 
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 71d599970ec7..757c17fbb29f 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -297,7 +297,7 @@ static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
 
 /* Setup PHY bandwidth modes */
 static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
-				      struct drm_display_mode *mode)
+				      const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
@@ -427,7 +427,7 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 }
 
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
-			    struct drm_display_mode *mode)
+			    const struct drm_display_mode *mode)
 {
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
 	struct meson_drm *priv = dw_hdmi->priv;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index d286751bb333..10e210f6455d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -312,7 +312,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_fun
 };
 
 static int dw_hdmi_rockchip_genphy_init(struct dw_hdmi *dw_hdmi, void *data,
-			     struct drm_display_mode *mode)
+					const struct drm_display_mode *mode)
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 43643ad31730..8e078cacf063 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -341,7 +341,7 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
 }
 
 static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
 	u32 val = 0;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index fec293b21c2e..f930d218cc6b 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -114,7 +114,7 @@ struct dw_hdmi_phy_config {
 
 struct dw_hdmi_phy_ops {
 	int (*init)(struct dw_hdmi *hdmi, void *data,
-		    struct drm_display_mode *mode);
+		    const struct drm_display_mode *mode);
 	void (*disable)(struct dw_hdmi *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void *data);
 	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
-- 
Regards,

Laurent Pinchart

