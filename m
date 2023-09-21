Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCD27A9DCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 21:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjIUTsl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 15:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjIUTsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 15:48:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8DE83D2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:28:49 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf55a81eeaso11224395ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695324529; x=1695929329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yWq/C0tGEFLQw6PZcuzFNMM1hDy2t48whBia8F49Jg=;
        b=hxwGXiYb4PM04EE74siGDJwQX0yEZrnJ1g7ZxEaC1XmHA8FSHr5IWWQuQ3KyIueDBO
         1xH8dUw35rP3xosg/qTRmsRnVEO792m61KxNhpyRukmmOrRA/PQ2wZrE26LMV96yuWTU
         3B1UBS9/LlKbvQtWtt0zP96Tulxt9Pw+F/Xmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695324529; x=1695929329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yWq/C0tGEFLQw6PZcuzFNMM1hDy2t48whBia8F49Jg=;
        b=NCnsyPdtWPWmbMSXjEWNGSGN+7fFNdetUGlFlytSB68I5vy1P/Io4AA6J4pz3IQ4zC
         04ZevowC2OZoMXBYxPPeNBYriRJFCgJdtUnuEAjVHB9ZhKHzShCjvbgKkh2b2hbINAFI
         cAnwYno2eS1IqVSXhw95PnRIQtPPbHhwzQ55ZfPcTLBc7gPabVpMSGBDnKNIPyXtAyUt
         f0lwEcFpT8uv0SSewVc8PIA1Xy/iDnzoL7FNkXXXpf2ZIR7zFoqXENbF4S3yyNsu9mag
         EBip7v/NM0TpBjYJRFAnfCpIYKuG0yRki5YXQ249kUTpnpKaCeX0aRRMiWPYjiLixtrJ
         78Yg==
X-Gm-Message-State: AOJu0Yx/UL/4N9m4YwWUqLu4DM7Gw1IgABprc++etyO8OQxF/SUb53r8
        9qqIdLiGlGwETFNHF5AHjxYGHg==
X-Google-Smtp-Source: AGHT+IG2w0WDLRZHyuJ2LAJ89ZhWzmeDvnFDIDFpOKHgPfnwnQMLnbx8TB6Jh7P+yKBv1bgwE5yOVg==
X-Received: by 2002:a17:902:c409:b0:1c4:4a4d:cda with SMTP id k9-20020a170902c40900b001c44a4d0cdamr7404355plk.15.1695324528913;
        Thu, 21 Sep 2023 12:28:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e6ed:6d49:f262:8041])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 12:28:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        airlied@gmail.com, biju.das.jz@bp.renesas.com, daniel@ffwll.ch,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, paul@crapouillou.net,
        sam@ravnborg.org, tzimmermann@suse.de
Subject: [RFT PATCH v2 12/12] drm/renesas/shmobile: Call drm_helper_force_disable_all() at shutdown/remove time
Date:   Thu, 21 Sep 2023 12:26:55 -0700
Message-ID: <20230921122641.RFT.v2.12.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown(), or in this case the
non-atomic equivalent drm_helper_force_disable_all(), at system
shutdown time and at driver remove time. This is important because
drm_helper_force_disable_all() will cause panels to get disabled
cleanly which may be important for their power sequencing. Future
changes will remove any custom powering off in individual panel
drivers so the DRM drivers need to start getting this right.

The fact that we should call drm_atomic_helper_shutdown(), or in this
case the non-atomic equivalent drm_helper_force_disable_all(), in the
case of OS shutdown/restart comes straight out of the kernel doc
"driver instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

As Geert pointed out in response to v1 [1], this patch conflicts with
the patches doing atomic conversion [2]. Since those patches don't
appear to be landed yet, I'm simply reposting v1. If those patches
land, I'm more than happy to re-post this one. I'm also more than
happy if someone wants to incorporate these changes into a different
patch.

[1] https://lore.kernel.org/r/CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com
[2] https://lore.kernel.org/dri-devel/fd7a6702490bd431f314d6591551bb39e77e3304.1692178020.git.geert+renesas@glider.be/

Changes in v2:
- Rebased and resolved conflicts.

 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index e5db4e0095ba..8c4c9d17a79e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -15,6 +15,7 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -179,10 +180,18 @@ static void shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
+	drm_helper_force_disable_all(ddev);
 	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 }
 
+static void shmob_drm_shutdown(struct platform_device *pdev)
+{
+	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+
+	drm_helper_force_disable_all(sdev->ddev);
+}
+
 static int shmob_drm_probe(struct platform_device *pdev)
 {
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
@@ -287,6 +296,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
-- 
2.42.0.515.g380fc7ccd1-goog

