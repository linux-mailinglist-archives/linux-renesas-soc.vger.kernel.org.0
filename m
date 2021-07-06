Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AC53BC774
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jul 2021 09:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhGFHvl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jul 2021 03:51:41 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49882 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhGFHvk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jul 2021 03:51:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DF1452267D;
        Tue,  6 Jul 2021 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1625557741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=hMCD4SrF11wn/3zJx4rk+ru6zq/5mGGlKZCtcE5ZiPQ=;
        b=GI38vsdEz6Zj57aXq9UByIGZ0g7aYBsXG/S8FqByHNdoyOMjOyKesF3vsos+EaA7KF+cf/
        NEhr/Z9SrnfPe+/OXEKRKdCXimNjugq2OeAToOgX0b5CnghC5UpwcoPanBrVw7QKxwGFdE
        z/ZiJWEIYF/43fF2tfPR3Dh6C2zNUSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1625557741;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=hMCD4SrF11wn/3zJx4rk+ru6zq/5mGGlKZCtcE5ZiPQ=;
        b=KTvh6ox9m7v5pFVLZarmvjfdunsN7BsbxJHuFubOkl0UJfJSD+VHCynHIDzocA+hCQEhV7
        PbjsoSnhOQP0pbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B25D313A42;
        Tue,  6 Jul 2021 07:49:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Y3twKu0K5GB2bgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:49:01 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
Date:   Tue,  6 Jul 2021 09:49:00 +0200
Message-Id: <20210706074900.8928-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 0a02b7092c04..032a2fff5efd 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -18,7 +18,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -130,7 +129,6 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
 
 static const struct drm_driver shmob_drm_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
-	.irq_handler		= shmob_drm_irq,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops			= &shmob_drm_fops,
 	.name			= "shmob-drm",
@@ -183,7 +181,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	drm_irq_uninstall(ddev);
+	free_irq(platform_get_irq(pdev, 0), ddev);
 	drm_dev_put(ddev);
 
 	return 0;
@@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		goto err_modeset_cleanup;
 	}
 
-	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
+	ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to install IRQ handler\n");
 		goto err_modeset_cleanup;
@@ -275,7 +273,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	return 0;
 
 err_irq_uninstall:
-	drm_irq_uninstall(ddev);
+	free_irq(platform_get_irq(pdev, 0), ddev);
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
 err_free_drm_dev:
-- 
2.32.0

