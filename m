Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A4C343712
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhCVDC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35480 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhCVDCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:30 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AAC41447;
        Mon, 22 Mar 2021 04:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382143;
        bh=bWH9PqcLmDc3qsB9InG1ANF+YPQcTF0rlE7JQYiNZRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tqKp/OLmBu41sgeeuYoOhBF4mIw0FUd7og6h6dF9Dw/i/5315TNB7CUWCBzLR7g4p
         JQUfNWTeX6x/7Qy/uOjcb7ZEA2FcF1F1LI7iev5/581jcAmcmj8QE//HLucq0ytH2j
         P1crAUkw4aInVlbOYdLB70WaP02anr3Np2/22U9U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional
Date:   Mon, 22 Mar 2021 05:01:26 +0200
Message-Id: <20210322030128.2283-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that the driver supports the connector-related bridge operations,
make the connector creation optional. This enables usage of the
sn65dsi86 with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6f6e075544e8..e2527d597ccb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -380,15 +380,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 						   .node = NULL,
 						 };
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = ti_sn_bridge_connector_init(pdata);
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		return ret;
-
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
 	 * to be done in bridge probe. But some existing DSI host drivers will
-- 
Regards,

Laurent Pinchart

