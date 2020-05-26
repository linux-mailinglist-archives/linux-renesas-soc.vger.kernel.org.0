Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623F71E18B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388360AbgEZBPc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388169AbgEZBPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0469C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2020 18:15:31 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4557DA3;
        Tue, 26 May 2020 03:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455727;
        bh=T2J/CjXdF0pDtiWg7+InLPWDIjinTatIFxORGzzwJ28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V9Vxs7NMftfUZCbHGdHVw5QrBqSMb8Fj8eyJy+AsgLE0z0FXgXaX0F90tSIJ5pss8
         5uTZwlkZyDdc+/FwElTGWJrM4z6LAT/83VZkm9nUU7SS55otW0LVsfhQiWwb4f0c4F
         JHjTGAUhxffTl1kqEhJtDR5B4swcfGc+0buDqE24=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 03/27] drm: bridge: adv7511: Implement bridge connector operations
Date:   Tue, 26 May 2020 04:14:41 +0300
Message-Id: <20200526011505.31884-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement the bridge connector-related .get_edid(), .detect() and
.hpd_notify() operations, and report the related bridge capabilities.

Output status detection is implemented using the same backend as for the
DRM connector, but requires making mode retrieval at detection time
optional as no pointer to the connector is available to the bridge
.detect() operation. The reason for the need to retrieve modes at
detection time is unclear to me, and this may benefit from further
refactoring of hot plug handling code.

Hot plug detection is notified through the bridge HPD notification
framework when the bridge is used without creating a connector, and
falls back to the existing implementation otherwise. CEC handling of
disconnection is handled in the new .hpd_notify() operation in the new
code path.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 43 ++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f0992b6d654f..2662f28f8007 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -443,9 +443,14 @@ static void adv7511_hpd_work(struct work_struct *work)
 
 	if (adv7511->connector.status != status) {
 		adv7511->connector.status = status;
-		if (status == connector_status_disconnected)
-			cec_phys_addr_invalidate(adv7511->cec_adap);
-		drm_kms_helper_hotplug_event(adv7511->connector.dev);
+
+		if (adv7511->connector.dev) {
+			if (status == connector_status_disconnected)
+				cec_phys_addr_invalidate(adv7511->cec_adap);
+			drm_kms_helper_hotplug_event(adv7511->connector.dev);
+		} else {
+			drm_bridge_hpd_notify(&adv7511->bridge, status);
+		}
 	}
 }
 
@@ -661,7 +666,8 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
-		adv7511_get_modes(adv7511, connector);
+		if (connector)
+			adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
 	} else {
@@ -917,11 +923,38 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
+static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	return adv7511_detect(adv, NULL);
+}
+
+static struct edid *adv7511_bridge_get_edid(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	return adv7511_get_edid(adv, connector);
+}
+
+static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
+				      enum drm_connector_status status)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	if (status == connector_status_disconnected)
+		cec_phys_addr_invalidate(adv->cec_adap);
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.enable = adv7511_bridge_enable,
 	.disable = adv7511_bridge_disable,
 	.mode_set = adv7511_bridge_mode_set,
 	.attach = adv7511_bridge_attach,
+	.detect = adv7511_bridge_detect,
+	.get_edid = adv7511_bridge_get_edid,
+	.hpd_notify = adv7511_bridge_hpd_notify,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1250,6 +1283,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		goto err_unregister_cec;
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
+	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			    | DRM_BRIDGE_OP_HPD;
 	adv7511->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&adv7511->bridge);
-- 
Regards,

Laurent Pinchart

