Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E711E18D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388428AbgEZBPu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388402AbgEZBPu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:50 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 294A5814;
        Tue, 26 May 2020 03:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455746;
        bh=Jnis+1eMQ8Txh73mB2sEA5R5j94S/v85zLBpr06Q/pk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mBT5lm8BVOzMr/p2Xvp7VOlOj8n74GjMZTBj9mWaI1UD3yCrvW2iXLlEzl92acx3V
         p525zImaS3rZrz9FeaT/KUm5SRQD0eyTcYhLBt/M5wYs6Ns56Fq5DAwR7XZhYU2/Bp
         a2lEBGLHF/HPdCSp/+DBaJENGCsTL6rFwWMhDQPk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 21/27] drm: bridge: dw-hdmi: Pass drm_connector to internal functions as needed
Date:   Tue, 26 May 2020 04:14:59 +0300
Message-Id: <20200526011505.31884-22-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To prepare for making connector creation optional in the driver, pass
the drm_connector explicitly to the internal functions that require it.
The functions that still access the connector from the dw_hdmi structure
are dw_hdmi_connector_create() and __dw_hdmi_probe(). The former access
is expected, as that's where the internal connector is created. The
latter will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 31 +++++++++++++----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 16bffedb4715..b69c14b9de62 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1632,18 +1632,17 @@ static void hdmi_tx_hdcp_config(struct dw_hdmi *hdmi)
 }
 
 static void hdmi_config_AVI(struct dw_hdmi *hdmi,
+			    const struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	struct hdmi_avi_infoframe frame;
 	u8 val;
 
 	/* Initialise info frame from DRM mode */
-	drm_hdmi_avi_infoframe_from_display_mode(&frame,
-						 &hdmi->connector, mode);
+	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
 
 	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
-		drm_hdmi_avi_infoframe_quant_range(&frame, &hdmi->connector,
-						   mode,
+		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
 						   hdmi->hdmi_data.rgb_limited_range ?
 						   HDMI_QUANTIZATION_RANGE_LIMITED :
 						   HDMI_QUANTIZATION_RANGE_FULL);
@@ -1760,14 +1759,14 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
 }
 
 static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
+						  const struct drm_connector *connector,
 						  const struct drm_display_mode *mode)
 {
 	struct hdmi_vendor_infoframe frame;
 	u8 buffer[10];
 	ssize_t err;
 
-	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame,
-							  &hdmi->connector,
+	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame, connector,
 							  mode);
 	if (err < 0)
 		/*
@@ -1813,9 +1812,10 @@ static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
 			HDMI_FC_DATAUTO0_VSD_MASK);
 }
 
-static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi)
+static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi,
+				      const struct drm_connector *connector)
 {
-	const struct drm_connector_state *conn_state = hdmi->connector.state;
+	const struct drm_connector_state *conn_state = connector->state;
 	struct hdmi_drm_infoframe frame;
 	u8 buffer[30];
 	ssize_t err;
@@ -2118,9 +2118,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 }
 
 static int dw_hdmi_setup(struct dw_hdmi *hdmi,
+			 const struct drm_connector *connector,
 			 const struct drm_display_mode *mode)
 {
-	struct drm_connector *connector = &hdmi->connector;
 	int ret;
 
 	hdmi_disable_overflow_interrupts(hdmi);
@@ -2192,9 +2192,9 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 		dev_dbg(hdmi->dev, "%s HDMI mode\n", __func__);
 
 		/* HDMI Initialization Step F - Configure AVI InfoFrame */
-		hdmi_config_AVI(hdmi, mode);
-		hdmi_config_vendor_specific_infoframe(hdmi, mode);
-		hdmi_config_drm_infoframe(hdmi);
+		hdmi_config_AVI(hdmi, connector, mode);
+		hdmi_config_vendor_specific_infoframe(hdmi, connector, mode);
+		hdmi_config_drm_infoframe(hdmi, connector);
 	} else {
 		dev_dbg(hdmi->dev, "%s DVI mode\n", __func__);
 	}
@@ -2263,7 +2263,12 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
 {
 	hdmi->bridge_is_on = true;
-	dw_hdmi_setup(hdmi, &hdmi->previous_mode);
+
+	/*
+	 * The curr_conn field is guaranteed to be valid here, as this function
+	 * is only be called when !hdmi->disabled.
+	 */
+	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
 }
 
 static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
-- 
Regards,

Laurent Pinchart

