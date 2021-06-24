Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2503B2425
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 02:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFXAGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 20:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhFXAGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 20:06:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AD9C061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 17:03:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51DBA17BB;
        Thu, 24 Jun 2021 02:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624493020;
        bh=7vpAmbY8TgK2fPF9LkRN+lXfMSXtvodDbFWNWnOBudU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rsaKqxbqIUsfT1Ztf4aORVCJeNBPl9uio/MRYq2iD7tBALYrf9z+5DHE7HPYPc8nC
         KjRUE6YBiOqPsJYFbD930p9Fae9n2ob5o42j9AngJQfS1AmdjoMrLH41nWMdoJO1JM
         hex3/29ynXV6zyVi8O051F+tnIjo0UvbBLDzyK9M=
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
Subject: [PATCH v2 2/6] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
Date:   Thu, 24 Jun 2021 03:03:00 +0300
Message-Id: <20210624000304.16281-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The enable signal may not be controllable by the kernel. Make it
optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5d712c8c3c3b..f0c7c6d4b2c1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1459,7 +1459,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return dev_err_probe(dev, PTR_ERR(pdata->regmap),
 				     "regmap i2c init failed\n");
 
-	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	pdata->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio))
 		return dev_err_probe(dev, PTR_ERR(pdata->enable_gpio),
 				     "failed to get enable gpio from DT\n");
-- 
Regards,

Laurent Pinchart

