Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DE3789435
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 09:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjHZHUA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 03:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjHZHTZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 03:19:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 314452136
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 00:19:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="174025565"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2023 16:19:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDACC4167444;
        Sat, 26 Aug 2023 16:19:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node pointers
Date:   Sat, 26 Aug 2023 08:19:01 +0100
Message-Id: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Having conditional around the of_node pointers turns out to make driver
code use ugly #ifdef and #if blocks. So drop the conditionals.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
 include/drm/drm_bridge.h                           | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 6169db73d2fe..ad8241758896 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&anx78xx->lock);
 
-#if IS_ENABLED(CONFIG_OF)
 	anx78xx->bridge.of_node = client->dev.of_node;
-#endif
 
 	anx78xx->client = client;
 	i2c_set_clientdata(client, anx78xx);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c339fc85fd07..d49d5c03df3e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -716,10 +716,8 @@ struct drm_bridge {
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
 	struct list_head chain_node;
-#ifdef CONFIG_OF
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
-#endif
 	/** @list: to keep track of all added bridges */
 	struct list_head list;
 	/**
-- 
2.25.1

