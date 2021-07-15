Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280363C9C45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 11:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240805AbhGOKA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 06:00:26 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58462 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240776AbhGOKAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 06:00:25 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D586222939;
        Thu, 15 Jul 2021 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626343051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=45c4rkKtav1lWZNdvAZWjveinipQsV5RWF5UbHCNdvw=;
        b=A2W+e38M9qfVOnPYaI9JlCYWgF0sKKaUJ+CPDCY/p06cXn1qw+RuEgczjU3hfDhTODCzsI
        /vtPtN4PIRprQIKNOWrFXKNn6zVp60iwGevBPzgmLF5sNoOXIQ+Ge9YKe64yEstDXQ5Cdk
        rAv2abs4/WkwvRKL4Zc7KVgKMQqz25o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626343051;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=45c4rkKtav1lWZNdvAZWjveinipQsV5RWF5UbHCNdvw=;
        b=SVECuLAEcY0aeLume9Gp1Ni2R+nejPiJuTVpQEZwHXRfLUjHfPqKnDxyNeCMwSoUX4Hhq1
        LcEUH3CZ+HgiNVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EEE613C31;
        Thu, 15 Jul 2021 09:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IkjDJYsG8GDnDwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 09:57:31 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, sam@ravnborg.org, geert@linux-m68k.org,
        sergei.shtylyov@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/shmobile: Convert to Linux IRQ interfaces
Date:   Thu, 15 Jul 2021 11:57:29 +0200
Message-Id: <20210715095729.6510-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

v2:
	* handle errors in platform_get_irq() (Geert, Sergei)
	* store IRQ number in struct shmob_drm_device (Laurent)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 16 +++++++++++-----
 drivers/gpu/drm/shmobile/shmob_drm_drv.h |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 0a02b7092c04..07878f4ef23e 100644
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
+	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 
 	return 0;
@@ -258,7 +256,15 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		goto err_modeset_cleanup;
 	}
 
-	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
+	ret = platform_get_irq(pdev, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get IRQ number\n");
+		goto err_modeset_cleanup;
+	}
+	sdev->irq = ret;
+
+	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
+			  ddev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to install IRQ handler\n");
 		goto err_modeset_cleanup;
@@ -275,7 +281,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	return 0;
 
 err_irq_uninstall:
-	drm_irq_uninstall(ddev);
+	free_irq(sdev->irq, ddev);
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
 err_free_drm_dev:
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
index 80dc4b1020aa..4964ddd5ab74 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
@@ -29,6 +29,7 @@ struct shmob_drm_device {
 	u32 lddckr;
 	u32 ldmt1r;
 
+	unsigned int irq;
 	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
 
 	struct drm_device *ddev;
-- 
2.32.0

