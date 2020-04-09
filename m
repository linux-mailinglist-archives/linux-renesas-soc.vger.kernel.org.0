Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5511A2D09
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDIAq1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:46:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39626 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgDIAq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:46:26 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05E3E59E;
        Thu,  9 Apr 2020 02:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586393185;
        bh=THgS6ompmbCcbOymwXgyTL9vzsbVUkrnPkhqAxNyHS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oB+6OF6Ii2HDmYpqW+a+IqsRm9a9rKRx4eEO/7GXqoIm1rLi4ilRwO5ES08Q69ok6
         pjU1PKVEW7HM3/tVp/fcS8gBuhA33c++ZglzAIDwcVnvPLA8B/yCPtzx6UiPqzSgTV
         9kp3h8tdeSkW2a3x11waNhgjhiMLsmuers291puA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/4] drm: bridge: adv7511: Split EDID read to a separate function
Date:   Thu,  9 Apr 2020 03:46:07 +0300
Message-Id: <20200409004610.12346-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
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

