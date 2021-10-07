Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8473425C23
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 21:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242253AbhJGTlK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 15:41:10 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:40125 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233375AbhJGTlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 15:41:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 48A172B00A30;
        Thu,  7 Oct 2021 15:39:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 07 Oct 2021 15:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=PuRwF9Ft3UyWB
        Jf64PRaXhYohKvgAVW28ATMLUMmKjo=; b=RQaXP9AJfoxFuuCucBricZK745w40
        j5CfjH6wCS0XmUYiX2oN2ydxw4D3fwqUG4KA52QhPeBPolakM5o+f8TpBRdxz5jW
        aav708HsrH8B78ZbaQzK0n44wjfMYxgBZGUi9nTZYM60+tLO4y4F5lh4DUHLHIQs
        961Ebmv8GPzpVmrAFXXzfzrkNZnEhANl8CGB8PkyMicBYxSr3NhJyIYGlXC+bIbm
        vI8w3zNrpcrADoG8BUNTITSq6g32NF5qzTW/e7Jhb7YiLvBFuBqvnCgyR+7ieGmt
        8FMaHtuQgnDeuj7ma0hgQEjvKe7/xCzQ8djoSi0sfODsHlQHZYtITmfZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=PuRwF9Ft3UyWBJf64PRaXhYohKvgAVW28ATMLUMmKjo=; b=QXXR69v0
        TraYz6G6LdNnWh2H0LSPzFQUcCwTWPnkHZrtZIlEhU4QkpTcEZ+Ct0BIwRwcdjJq
        klukbQdRSjPpV11/Dn7oAH/uDx/6M4u+ZHZV7auKlC3ksjTOLtHegbBOYf7y8Tdx
        yQmljP7it90zk0uMCpsyCKr/dx0JD531qySW97bzYIW0Ehm3a/PTfV5aKeE0OPrt
        uJOBlWtkMBn98lCCIwPHUbHPJxrrLc9RCk/3YOjJ1MFqq8cdQvcb2rMvLm9gliuF
        nSSId5LoqPJpkfwWZS0btGfRFKNHEPDJL2/aRiDawwUkUga/aClr9jEFoFSQ8YqE
        EA3X/9Ek7MGmKQ==
X-ME-Sender: <xms:2UxfYagTBBR2PW3nboM5OWWJ7cDltzIhixgw7-4y00zjXWlM7Qtleg>
    <xme:2UxfYbBqO0ZzUBLIQ3aw4y07HnIxgjC-FUvb5sdE7qXI9DrIuE-ipVxZvjL7-7Bw3
    un-Y_4E8Lpz4cbrog>
X-ME-Received: <xmr:2UxfYSHlxjrRiptWd6OGLxDY1Jwu7qy4plXvIt-QHoFyRCjJzwKv5wYF-mtGEz1rNOx6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:2UxfYTSh2tVT5dnivLQvOa8_3umFABtiNjC_LrTYXlFuLxHqZNFVCQ>
    <xmx:2UxfYXwfH2ulFFaxEbMbqGO5RFMsdX_QX7ErSE5Pde-t7_VIOVgZXw>
    <xmx:2UxfYR5swKEfbrqYRbb-bd7dDDJTLXgzqQrzY0SrLsDjgKYRfR-NYQ>
    <xmx:2UxfYfd2aqrmQCwY6hzPspiYfyZYqVwibOxO3LawMJJfkKMLxzLKnUrWdfI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:02 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 15/20] drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Thu,  7 Oct 2021 21:37:50 +0200
Message-Id: <20211007193755.29579-16-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/gma500/psb_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 3030f18ba022..021a7238508f 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -8,6 +8,7 @@
 #include <linux/backlight.h>
 
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
 
 #include "gma_device.h"
 #include "intel_bios.h"
@@ -169,8 +170,10 @@ static int psb_save_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration control + watermarks */
 	regs->saveDSPARB = PSB_RVDC32(DSPARB);
@@ -183,7 +186,7 @@ static int psb_save_display_registers(struct drm_device *dev)
 	regs->saveCHICKENBIT = PSB_RVDC32(DSPCHICKENBIT);
 
 	/* Save crtc and output state */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->save_crtc(crtc);
@@ -193,8 +196,9 @@ static int psb_save_display_registers(struct drm_device *dev)
 		if (connector->save)
 			connector->save(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	return ret;
 }
 
 /**
@@ -207,8 +211,10 @@ static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration + watermarks */
 	PSB_WVDC32(regs->saveDSPARB, DSPARB);
@@ -223,7 +229,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
 	/*make sure VGA plane is off. it initializes to on after reset!*/
 	PSB_WVDC32(0x80000000, VGACNTRL);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->restore_crtc(crtc);
@@ -232,8 +238,8 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (connector->restore)
 			connector->restore(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	return ret;
 }
 
 static int psb_power_down(struct drm_device *dev)
-- 
2.33.0

