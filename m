Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69AC78DC85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242454AbjH3Sp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245045AbjH3OYX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:24:23 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AB4612F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:24:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="174486533"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A106B42170F5;
        Wed, 30 Aug 2023 23:24:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 2/8] drm: adv7511: Add max_mode_clock_khz variable to struct adv7511_chip_info
Date:   Wed, 30 Aug 2023 15:23:52 +0100
Message-Id: <20230830142358.275459-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
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

The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MHz
for ADV7535. Add max_mode_clock_khz variable to struct adv7511_chip_info to
handle this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Adam Ford <aford173@gmail.com>
Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 * Added Rb tag from Adam and Laurent
 * Added tested by tag from Adam.
 * Replaced max_mode_clock->max_mode_clock_khz in struct adv7511_chip_info
 * Replaced variable type from unsigned int->unsigned long.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 59e8ef10d72e..b9c6c1e8a353 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -335,6 +335,7 @@ enum adv7511_type {
 
 struct adv7511_chip_info {
 	enum adv7511_type type;
+	unsigned int max_mode_clock_khz;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index d869dbe41873..12ceffd6a9eb 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1369,10 +1369,12 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
+	.max_mode_clock_khz = 80000,
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
+	.max_mode_clock_khz = 148500,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index c452c4dc1c3f..1d113489754c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
 	/* Check max clock for either 7533 or 7535 */
-	if (mode->clock > (adv->info->type == ADV7533 ? 80000 : 148500))
+	if (mode->clock > adv->info->max_mode_clock_khz)
 		return MODE_CLOCK_HIGH;
 
 	/* Check max clock for each lane */
-- 
2.25.1

