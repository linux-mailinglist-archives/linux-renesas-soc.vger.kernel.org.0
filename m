Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1351E18B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388233AbgEZBPb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388169AbgEZBPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8728BC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2020 18:15:30 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615F1814;
        Tue, 26 May 2020 03:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455725;
        bh=kf4EJmTwgc32zxKqxdC4W0sDrp/0RuppckiLOUzdao4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vhADncQwBofeKK03SOLt/bwsSNnOj2B0H6SwPj7J9rgiZ/qyHNxyc4UBY3Cx1CsX6
         lcSUnuQGW9lSDKZ7uiCAhinK/BPEGHImFCd38lvogLG6XU8gBRpQxblzXfgRSpbWo2
         LV8yb4ePf3prsopgd+kRg38iqz/fJqsqWVtJ4xeg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 01/27] drm: bridge: adv7511: Split EDID read to a separate function
Date:   Tue, 26 May 2020 04:14:39 +0300
Message-Id: <20200526011505.31884-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To prepare for the implementation of the DRM bridge connector
operations, move EDID read out of adv7511_get_modes() to a separate
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 23 ++++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 87b58c1acff4..58d02e92b6b9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -589,11 +589,10 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
  * ADV75xx helpers
  */
 
-static int adv7511_get_modes(struct adv7511 *adv7511,
-			     struct drm_connector *connector)
+static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
+				     struct drm_connector *connector)
 {
 	struct edid *edid;
-	unsigned int count;
 
 	/* Reading the EDID only works if the device is powered */
 	if (!adv7511->powered) {
@@ -612,15 +611,25 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
 	if (!adv7511->powered)
 		__adv7511_power_off(adv7511);
 
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-
 	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
 			       drm_detect_hdmi_monitor(edid));
 
 	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
 
+	return edid;
+}
+
+static int adv7511_get_modes(struct adv7511 *adv7511,
+			     struct drm_connector *connector)
+{
+	struct edid *edid;
+	unsigned int count;
+
+	edid = adv7511_get_edid(adv7511, connector);
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+
 	kfree(edid);
 
 	return count;
-- 
Regards,

Laurent Pinchart

