Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCC1736BAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jun 2023 14:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjFTMML (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jun 2023 08:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjFTMMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 08:12:07 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B505F109
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 05:12:06 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 474801F37C;
        Tue, 20 Jun 2023 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687263125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6XkXAfdTUAGyLfwxszMC+bPXZ6kElStSDtG0UQxN1E=;
        b=A6beC6BVgirwu2Nw6CAZoiZ+VtfjqlphCPYhDWtl086Q2zysAjHpUJR52bxGml3sE/LPtP
        fC/Q9d8KdGkR4PrsuycQq34ZK9WEf24S6Glm5hnKGjNKK2tBclijN2Ro50jfnloE7G/SFp
        4GZSglu94+iYKv4/Pr6MJBbr5gXwMI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687263125;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6XkXAfdTUAGyLfwxszMC+bPXZ6kElStSDtG0UQxN1E=;
        b=ddLksiyxF2xqH1d02sVvi1XsKFHI/V32xC1Bne50Xs5i2I3cUnMz8dHj0IMYK3dvKj+7X8
        be2p7SWOimda1cAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04C8B133A9;
        Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IFqQO5SXkWSwEQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:04 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
Date:   Tue, 20 Jun 2023 14:03:22 +0200
Message-ID: <20230620121202.28263-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620121202.28263-1-tzimmermann@suse.de>
References: <20230620121202.28263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove the dependency on the GEM DMA helper library. Rockchip comes
with its own implementation of the GEM interface. It only uses the VM
callbacks in drm_gem_dma_vm_ops from the GEM DMA helpers. These are
not DMA specific.

Duplicate drm_gem_dma_vm_ops in rockchip and remove all dependencies on
the GEM DMA helper library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/rockchip/Kconfig            | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 8 ++++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 1bf3e2829cd07..5f49cd0210e6b 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -2,7 +2,6 @@
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
 	depends on DRM && ROCKCHIP_IOMMU
-	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index b8cf89f0cc566..b090b8abb6637 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
-#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b8f8b45ebf594..acb6f122a2dca 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -11,13 +11,17 @@
 #include <drm/drm.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 
+static const struct vm_operations_struct rockchip_gem_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 {
 	struct drm_device *drm = rk_obj->base.dev;
@@ -276,7 +280,7 @@ static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
 	.vmap = rockchip_gem_prime_vmap,
 	.vunmap	= rockchip_gem_prime_vunmap,
 	.mmap = rockchip_drm_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
+	.vm_ops = &rockchip_gem_vm_ops,
 };
 
 static struct rockchip_gem_object *
-- 
2.41.0

