Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0C03B242A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 02:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhFXAGE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 20:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhFXAGE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 20:06:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B47C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 17:03:46 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB9118C1;
        Thu, 24 Jun 2021 02:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624493024;
        bh=oFPwlxYSCOaEjFtXxkzhNK7EAUyIs+bxdI9mliV3g6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CH0W7oh0jaqHktfgILapuzHm6aWO/mTMDIJ+3U9+RKSjpx306691U4v7WT5BR9g54
         g7rdVbvlqcaU+HWSId3n/jor29wca99UK1Ii6jAyXcQTnu0nSorgOO0oMNsDWYcL85
         6d4MC8LTORqtAhsXid5dkRH2xFYmSmY8+gr+FLbI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 6/6] drm/bridge: ti-sn65dsi86: Split connector creation to a function
Date:   Thu, 24 Jun 2021 03:03:04 +0300
Message-Id: <20210624000304.16281-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To prepare for making connector creation option, move connector creation
out of ti_sn_bridge_attach to a separate function.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index feeda88c4ef0..9bf889302bcc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -636,6 +636,25 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ti_sn_bridge_connector_init(struct ti_sn65dsi86 *pdata)
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
  * DRM Bridge
  */
@@ -669,17 +688,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = drm_connector_init(bridge->dev, &pdata->connector,
-				 &ti_sn_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = ti_sn_bridge_connector_init(pdata);
+	if (ret < 0)
 		goto err_conn_init;
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

