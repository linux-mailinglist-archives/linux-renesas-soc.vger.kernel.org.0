Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83677343707
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCVDCu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhCVDCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:22 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92507FC8;
        Mon, 22 Mar 2021 04:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382138;
        bh=I+85KhafwVI6ERxd+f/9ohhx8hzHjaZJe5z54ZV7NoU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JdOSgViLxm9doSuwCtbTDbsi49R6R6+eD+Dt/7lVj7FHjCPoeJfWdWByT+Y/NZyOm
         rfnUtbtTfANavYlID0zPe4gbbQf/YFBYoxT2ihTCv5ZexYnDE/l8sFQ5KchykF0NJv
         Zcgyg3/S717MV/oyaBGF2gFY9H2LB7gaUXAvt01k=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
Date:   Mon, 22 Mar 2021 05:01:19 +0200
Message-Id: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The enable signal may not be controllable by the kernel. Make it
optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..da78a12e58b5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1245,8 +1245,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	dev_set_drvdata(&client->dev, pdata);
 
-	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
-					    GPIOD_OUT_LOW);
+	pdata->enable_gpio = devm_gpiod_get_optional(pdata->dev, "enable",
+						     GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
 		ret = PTR_ERR(pdata->enable_gpio);
-- 
Regards,

Laurent Pinchart

