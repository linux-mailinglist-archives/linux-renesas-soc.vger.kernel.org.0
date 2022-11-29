Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC3963C83F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Nov 2022 20:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbiK2TXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 14:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236931AbiK2TWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 14:22:41 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D26F82F;
        Tue, 29 Nov 2022 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1669749598; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=93KzSvS5igs3S+cAbvCYD4WLcuFTokGvoynUcK5Icnw=;
        b=vF6P0PbFzl3XQTIIeBBWk33b7nBsalJsw5sWVgBOpfAglBFB67FxzQSWsQwUrn2sbPwcof
        PDY5kynsihQ8MxQeQgm+f5SiDXDvYvV/eVpATZ8/VubDNplHqon2MmXPAUM8vuVxOUCMkq
        AZkSjDXGGJMWeM8hlCJbk6T5DeNVhzY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 19/26] drm: shmobile: Remove #ifdef guards for PM related functions
Date:   Tue, 29 Nov 2022 19:19:35 +0000
Message-Id: <20221129191942.138244-6-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 3d511fa38913..337040fa6438 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -143,7 +143,6 @@ static const struct drm_driver shmob_drm_driver = {
  * Power management
  */
 
-#ifdef CONFIG_PM_SLEEP
 static int shmob_drm_pm_suspend(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
@@ -165,11 +164,9 @@ static int shmob_drm_pm_resume(struct device *dev)
 	drm_kms_helper_poll_enable(sdev->ddev);
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops shmob_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
+				shmob_drm_pm_suspend, shmob_drm_pm_resume);
 
 /* -----------------------------------------------------------------------------
  * Platform driver
@@ -292,7 +289,7 @@ static struct platform_driver shmob_drm_platform_driver = {
 	.remove		= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
-		.pm	= &shmob_drm_pm_ops,
+		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
 	},
 };
 
-- 
2.35.1

