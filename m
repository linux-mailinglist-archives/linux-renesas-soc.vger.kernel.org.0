Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F01C1A2D0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgDIAq3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:46:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDIAq3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:46:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3322A12F4;
        Thu,  9 Apr 2020 02:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586393187;
        bh=KvlEoTqDsceeRsDIOpS4xbDfUkQa8m5bmFsUPlHMw9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gaWM0F7CZGzbx3NvHUbGWn9UsyqfKdaz8QNM18hpj89iYk2O1RvCDHcuBBIWLdw2a
         AvpIGbcyX5xG3ldUBZLRV/T6Sxd7zzqh91+e6CWZUEU9fmVi0+Ur42B6WzhKjG3DpT
         1XdTCrxXUgRTcHZTGVCGSDe3Xargign6gY3nPBc0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 4/4] drm: bridge: adv7511: Make connector creation optional
Date:   Thu,  9 Apr 2020 03:46:10 +0300
Message-Id: <20200409004610.12346-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that the driver supports all the connector-related bridge
operations, make the connector creation optional. This enables usage of
the adv7511 with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 723560b36ee0..60efd19fa4df 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -902,17 +902,14 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
-	int ret;
+	int ret = 0;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = adv7511_connector_init(adv);
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = adv7511_connector_init(adv);
-	if (ret < 0)
-		return ret;
-
 	if (adv->type == ADV7533 || adv->type == ADV7535)
 		ret = adv7533_attach_dsi(adv);
 
-- 
Regards,

Laurent Pinchart

