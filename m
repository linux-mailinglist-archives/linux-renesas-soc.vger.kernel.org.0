Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FADF343713
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCVDC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhCVDC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:29 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E09710D2;
        Mon, 22 Mar 2021 04:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382142;
        bh=tKObpVU+HZGmT+ktY1Or1lY75NR7AlArdmRjpXdcfb4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ta3b1Qvy4gJRxy9vFiCrcxJQAVQF/wO6IFvyX3D8uW1SA7xiMEsoxDo+WZJBV3Knv
         5pKUS+9AzQYzhfL+8QNmAdcj5GlxXocHOFHLhxwHY6RFdLB12ds0YDu1fWRSnxhGEM
         wIsIHVZ05ppQlBrxye6qOVn6gzSciBjG+sROedqE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector creation to a function
Date:   Mon, 22 Mar 2021 05:01:24 +0200
Message-Id: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To prepare for making connector creation option, move connector creation
out of ti_sn_bridge_attach to a separate function.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 7f5d53c74978..dc300fab4319 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -331,6 +331,25 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ti_sn_bridge_connector_init(struct ti_sn_bridge *pdata)
+{
+	int ret;
+
+	ret = drm_connector_init(pdata->bridge.dev, &pdata->connector,
+				 &ti_sn_bridge_connector_funcs,
+				 DRM_MODE_CONNECTOR_eDP);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(&pdata->connector,
+				 &ti_sn_bridge_connector_helper_funcs);
+	drm_connector_attach_encoder(&pdata->connector, pdata->bridge.encoder);
+
+	return 0;
+}
+
 /*------------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -357,17 +376,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	ret = drm_connector_init(bridge->dev, &pdata->connector,
-				 &ti_sn_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = ti_sn_bridge_connector_init(pdata);
+	if (ret < 0)
 		return ret;
-	}
-
-	drm_connector_helper_add(&pdata->connector,
-				 &ti_sn_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&pdata->connector, bridge->encoder);
 
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
-- 
Regards,

Laurent Pinchart

