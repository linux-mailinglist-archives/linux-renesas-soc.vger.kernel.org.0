Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D311E18C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388393AbgEZBPo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbgEZBPn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09AA81C63;
        Tue, 26 May 2020 03:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455740;
        bh=ItM32SvgQDcRmdwFE6OKK4+lXyHhqG0Vvzv5CWs4AlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vUn+ZjvFyPH6hR6AJmJ8XJoFAeMkcozS25iSEI4foC64vTiU+cy6bmXOW1Phn+T5Y
         ezLL8dQzxS6R3rspcv9Q4DhZOIUq7TKZnYlBwx4xb9+8nLL1CX57bSlcgDIUo/z6O4
         nHp0wmUv0OOqz3vdtqql67JK4XDp9LfR5M3dRvRo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-amlogic@lists.infradead.org
Subject: [PATCH 14/27] drm: meson: dw-hdmi: Use dw_hdmi context to replace hack
Date:   Tue, 26 May 2020 04:14:52 +0300
Message-Id: <20200526011505.31884-15-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The meson-dw-hdmi driver needs to access its own context from the
.mode_valid() operation. It currently gets it from the dev_private field
of the drm_device retrieved from the connector, which is a hack. Use the
private data passed to the .mode_valid() operation instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cc311c1b8e0..34ba94922605 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -634,7 +634,8 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 		   struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
-	struct meson_drm *priv = connector->dev->dev_private;
+	struct meson_dw_hdmi *dw_hdmi = data;
+	struct meson_drm *priv = dw_hdmi->priv;
 	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
@@ -693,7 +694,7 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+	dev_dbg(dw_hdmi->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
 		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
@@ -1068,6 +1069,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Bridge / Connector */
 
+	dw_plat_data->priv_data = meson_dw_hdmi;
 	dw_plat_data->mode_valid = dw_hdmi_mode_valid;
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
-- 
Regards,

Laurent Pinchart

