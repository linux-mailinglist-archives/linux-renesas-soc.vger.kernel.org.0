Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05D260A09C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 13:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiJXLUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 07:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiJXLUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 07:20:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6113D399F3;
        Mon, 24 Oct 2022 04:20:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AF02F220D3;
        Mon, 24 Oct 2022 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666610404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3lFh5py/uuejzjrH4enP5SeVdkJcqJZSxlFS1c3b9pk=;
        b=k6It662NZs3cD8nSbsDZ9BGpRjKZDpKVcubBKXjkRJVoui0QiU026gLrP8f7rlVYBato0s
        nacdaR3D/MXdBCJm7viFNbCfA8OukdE0H1eGgdIZmSCLNalfPQ+l9VLhpARBdFO2X4+VPc
        eTMg8K2IR63AKFnwaeA9H+VWINKHqpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666610404;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3lFh5py/uuejzjrH4enP5SeVdkJcqJZSxlFS1c3b9pk=;
        b=2SB6K3jJHZtY19hgfQ5A4Ljs4ZF+k1F52aepwcfvGlybtt6uR2xd7x4h8XMmJVjEkiVJ6c
        9wjuOHpEDp6k1iAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3060213A98;
        Mon, 24 Oct 2022 11:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id II3yCuR0VmOYMgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:04 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
        javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/21] drm/fb_helper: Rename field fbdev to info in struct drm_fb_helper
Date:   Mon, 24 Oct 2022 13:19:44 +0200
Message-Id: <20221024111953.24307-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename struct drm_fb_helper.fbdev to info. The current name is
misleading as it overlaps with generic fbdev naming conventions.
Adapt to the usual naming in fbdev drivers by calling the field
'info'. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c            | 40 +++++++++++-----------
 drivers/gpu/drm/i915/display/intel_fbdev.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c    | 23 ++++++-------
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 +-
 drivers/gpu/drm/tegra/fb.c                 |  2 +-
 include/drm/drm_fb_helper.h                |  4 +--
 6 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 71edb80fe0fb9..480bf4f568b7b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -368,7 +368,7 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 						    resume_work);
 
 	console_lock();
-	fb_set_suspend(helper->fbdev, 0);
+	fb_set_suspend(helper->info, 0);
 	console_unlock();
 }
 
@@ -401,7 +401,7 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 		break;
 	}
 
-	src = fb_helper->fbdev->screen_buffer + offset;
+	src = fb_helper->info->screen_buffer + offset;
 	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
 
 	for (y = clip->y1; y < clip->y2; y++) {
@@ -598,7 +598,7 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 		goto err_free_cmap;
 	}
 
-	fb_helper->fbdev = info;
+	fb_helper->info = info;
 	info->skip_vt_switch = true;
 
 	return info;
@@ -621,8 +621,8 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
  */
 void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
 {
-	if (fb_helper && fb_helper->fbdev)
-		unregister_framebuffer(fb_helper->fbdev);
+	if (fb_helper && fb_helper->info)
+		unregister_framebuffer(fb_helper->info);
 }
 EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
 
@@ -647,13 +647,13 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	cancel_work_sync(&fb_helper->resume_work);
 	cancel_work_sync(&fb_helper->damage_work);
 
-	info = fb_helper->fbdev;
+	info = fb_helper->info;
 	if (info) {
 		if (info->cmap.len)
 			fb_dealloc_cmap(&info->cmap);
 		framebuffer_release(info);
 	}
-	fb_helper->fbdev = NULL;
+	fb_helper->info = NULL;
 
 	mutex_lock(&kernel_fb_helper_lock);
 	if (!list_empty(&fb_helper->kernel_fb_list)) {
@@ -914,8 +914,8 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
  */
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
 {
-	if (fb_helper && fb_helper->fbdev)
-		fb_set_suspend(fb_helper->fbdev, suspend);
+	if (fb_helper && fb_helper->info)
+		fb_set_suspend(fb_helper->info, suspend);
 }
 EXPORT_SYMBOL(drm_fb_helper_set_suspend);
 
@@ -938,20 +938,20 @@ EXPORT_SYMBOL(drm_fb_helper_set_suspend);
 void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 					bool suspend)
 {
-	if (!fb_helper || !fb_helper->fbdev)
+	if (!fb_helper || !fb_helper->info)
 		return;
 
 	/* make sure there's no pending/ongoing resume */
 	flush_work(&fb_helper->resume_work);
 
 	if (suspend) {
-		if (fb_helper->fbdev->state != FBINFO_STATE_RUNNING)
+		if (fb_helper->info->state != FBINFO_STATE_RUNNING)
 			return;
 
 		console_lock();
 
 	} else {
-		if (fb_helper->fbdev->state == FBINFO_STATE_RUNNING)
+		if (fb_helper->info->state == FBINFO_STATE_RUNNING)
 			return;
 
 		if (!console_trylock()) {
@@ -960,7 +960,7 @@ void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 		}
 	}
 
-	fb_set_suspend(fb_helper->fbdev, suspend);
+	fb_set_suspend(fb_helper->info, suspend);
 	console_unlock();
 }
 EXPORT_SYMBOL(drm_fb_helper_set_suspend_unlocked);
@@ -1850,7 +1850,7 @@ EXPORT_SYMBOL(drm_fb_helper_fill_info);
 /*
  * This is a continuation of drm_setup_crtcs() that sets up anything related
  * to the framebuffer. During initialization, drm_setup_crtcs() is called before
- * the framebuffer has been allocated (fb_helper->fb and fb_helper->fbdev).
+ * the framebuffer has been allocated (fb_helper->fb and fb_helper->info).
  * So, any setup that touches those fields needs to be done here instead of in
  * drm_setup_crtcs().
  */
@@ -1858,7 +1858,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper *fb_helper)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_connector_list_iter conn_iter;
-	struct fb_info *info = fb_helper->fbdev;
+	struct fb_info *info = fb_helper->info;
 	unsigned int rotation, sw_rotations = 0;
 	struct drm_connector *connector;
 	struct drm_mode_set *modeset;
@@ -1942,7 +1942,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 
 	fb_helper->deferred_setup = false;
 
-	info = fb_helper->fbdev;
+	info = fb_helper->info;
 	info->var.pixclock = 0;
 	/* Shamelessly allow physical address leaking to userspace */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
@@ -2077,7 +2077,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	drm_setup_crtcs_fb(fb_helper);
 	mutex_unlock(&fb_helper->lock);
 
-	drm_fb_helper_set_par(fb_helper->fbdev);
+	drm_fb_helper_set_par(fb_helper->info);
 
 	return 0;
 }
@@ -2135,7 +2135,7 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 
 static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 {
-	struct fb_info *fbi = fb_helper->fbdev;
+	struct fb_info *fbi = fb_helper->info;
 	void *shadow = NULL;
 
 	if (!fb_helper->dev)
@@ -2495,7 +2495,7 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (fb_helper->fbdev)
+	if (fb_helper->info)
 		/* drm_fbdev_fb_destroy() takes care of cleanup */
 		drm_fb_helper_unregister_fbi(fb_helper);
 	else
@@ -2546,7 +2546,7 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	drm_fbdev_cleanup(fb_helper);
 err:
 	fb_helper->dev = NULL;
-	fb_helper->fbdev = NULL;
+	fb_helper->info = NULL;
 
 	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index ab385d18ddcc3..d533ecd451025 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -627,7 +627,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	if (!ifbdev || !ifbdev->vma)
 		goto set_suspend;
 
-	info = ifbdev->helper.fbdev;
+	info = ifbdev->helper.info;
 
 	if (synchronous) {
 		/* Flush any pending work to turn the console on, and then
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 3c7e0c9d6baf1..ac4bd529ae2e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -231,9 +231,9 @@ void
 nouveau_fbcon_accel_save_disable(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	if (drm->fbcon && drm->fbcon->helper.fbdev) {
-		drm->fbcon->saved_flags = drm->fbcon->helper.fbdev->flags;
-		drm->fbcon->helper.fbdev->flags |= FBINFO_HWACCEL_DISABLED;
+	if (drm->fbcon && drm->fbcon->helper.info) {
+		drm->fbcon->saved_flags = drm->fbcon->helper.info->flags;
+		drm->fbcon->helper.info->flags |= FBINFO_HWACCEL_DISABLED;
 	}
 }
 
@@ -241,9 +241,8 @@ void
 nouveau_fbcon_accel_restore(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	if (drm->fbcon && drm->fbcon->helper.fbdev) {
-		drm->fbcon->helper.fbdev->flags = drm->fbcon->saved_flags;
-	}
+	if (drm->fbcon && drm->fbcon->helper.info)
+		drm->fbcon->helper.info->flags = drm->fbcon->saved_flags;
 }
 
 static void
@@ -253,8 +252,8 @@ nouveau_fbcon_accel_fini(struct drm_device *dev)
 	struct nouveau_fbdev *fbcon = drm->fbcon;
 	if (fbcon && drm->channel) {
 		console_lock();
-		if (fbcon->helper.fbdev)
-			fbcon->helper.fbdev->flags |= FBINFO_HWACCEL_DISABLED;
+		if (fbcon->helper.info)
+			fbcon->helper.info->flags |= FBINFO_HWACCEL_DISABLED;
 		console_unlock();
 		nouveau_channel_idle(drm->channel);
 		nvif_object_dtor(&fbcon->twod);
@@ -272,7 +271,7 @@ nouveau_fbcon_accel_init(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_fbdev *fbcon = drm->fbcon;
-	struct fb_info *info = fbcon->helper.fbdev;
+	struct fb_info *info = fbcon->helper.info;
 	int ret;
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA)
@@ -290,7 +289,7 @@ nouveau_fbcon_accel_init(struct drm_device *dev)
 static void
 nouveau_fbcon_zfill(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 {
-	struct fb_info *info = fbcon->helper.fbdev;
+	struct fb_info *info = fbcon->helper.info;
 	struct fb_fillrect rect;
 
 	/* Clear the entire fbcon.  The drm will program every connector
@@ -586,8 +585,8 @@ nouveau_fbcon_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
-	if (fbcon->helper.fbdev)
-		fbcon->helper.fbdev->pixmap.buf_align = 4;
+	if (fbcon->helper.info)
+		fbcon->helper.info->pixmap.buf_align = 4;
 	return 0;
 
 fini:
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index ed67dd25794c8..92d505be53e06 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -38,7 +38,7 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi);
 static void pan_worker(struct work_struct *work)
 {
 	struct omap_fbdev *fbdev = container_of(work, struct omap_fbdev, work);
-	struct fb_info *fbi = fbdev->base.fbdev;
+	struct fb_info *fbi = fbdev->base.info;
 	int npages;
 
 	/* DMM roll shifts in 4K pages: */
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index bce71c0ccc9ef..6fe24535d0e43 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -261,7 +261,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 
 	fb = fbdev->fb;
 	helper->fb = fb;
-	helper->fbdev = info;
+	helper->info = info;
 
 	info->fbops = &tegra_fb_ops;
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index e923089522896..d83e2d8e92eb9 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -96,7 +96,7 @@ struct drm_fb_helper_funcs {
  * @fb: Scanout framebuffer object
  * @dev: DRM device
  * @funcs: driver callbacks for fb helper
- * @fbdev: emulated fbdev device info struct
+ * @info: emulated fbdev device info struct
  * @pseudo_palette: fake palette of 16 colors
  * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
  *                the screen buffer
@@ -127,7 +127,7 @@ struct drm_fb_helper {
 	struct drm_framebuffer *fb;
 	struct drm_device *dev;
 	const struct drm_fb_helper_funcs *funcs;
-	struct fb_info *fbdev;
+	struct fb_info *info;
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
 	spinlock_t damage_lock;
-- 
2.38.0

