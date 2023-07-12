Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00E775038F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jul 2023 11:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbjGLJr3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jul 2023 05:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjGLJr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2023 05:47:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF8E1720
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2023 02:47:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRG-0001T8-59; Wed, 12 Jul 2023 11:47:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRE-00Dr5W-53; Wed, 12 Jul 2023 11:47:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRD-004GTw-79; Wed, 12 Jul 2023 11:47:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Danilo Krummrich <dakr@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH RFC v1 32/52] drm/renesas: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date:   Wed, 12 Jul 2023 11:46:42 +0200
Message-Id: <20230712094702.1770121-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7041; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rvD96XbdBL6dKQrbQL3vz3RiCRw+PJFbU7/3CIM1UTA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ77ZImmQM0yi2NLAcKnvPslQjI1rAO95VRO vggh4/6ZP+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ewAKCRCPgPtYfRL+ TrV5B/0fPnNudIu8OQs7JTizQ6ozJE3SdZw03Qpw5OWOJxbYJ3EWbcRGTgM0EKBv1U1d1QRsxAW DgBrMFG01pGJVoMILh4QRu6oGRunhL6wkfnefSYOsY8e9fGYnQ0UWdoEDfkyeYsgPvFH8qICuzU M3pLhrlvN7atB7GOUIsM/IhUeEoSha9PTnteoTJhvLXHKaTDeeBmlci6vrQRhytkUc2ni6d/LGq z/9PcKzPPP29+RL7mXs9VX/tYptsuOeVcUxpuQrR2GsSzQWiG7MjjFj55ZKSPOD5guntwNNTRBA B/LsRiJOw7hMVphD168NjxlYIJV90SFSE4Hadyi9/y+Cq49V
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    | 14 ++++++-------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 20 +++++++++----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..8de7e697b430 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -436,7 +436,7 @@ static void rcar_du_crtc_update_planes(struct rcar_du_crtc *rcrtc)
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
 {
 	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -457,7 +457,7 @@ void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
 
 static bool rcar_du_crtc_page_flip_pending(struct rcar_du_crtc *rcrtc)
 {
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm_dev;
 	unsigned long flags;
 	bool pending;
 
@@ -703,7 +703,7 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	/* Store the routes from the CRTC output to the DU outputs. */
 	rstate->outputs = 0;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
 				  crtc_state->encoder_mask) {
 		struct rcar_du_encoder *renc;
 
@@ -802,12 +802,12 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 		rcar_mipi_dsi_pclk_disable(bridge);
 	}
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -843,7 +843,7 @@ static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm_dev;
 	unsigned long flags;
 
 	rcar_du_crtc_update_planes(rcrtc);
@@ -1116,7 +1116,7 @@ static int rcar_du_crtc_set_crc_source(struct drm_crtc *crtc,
 	/* Perform an atomic commit to set the CRC source. */
 	drm_modeset_acquire_init(&ctx, 0);
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm_dev);
 	if (!state) {
 		ret = -ENOMEM;
 		goto unlock;
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 11dd2bc803e7..4d25dbf4f58b 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -64,7 +64,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
 static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct drm_display_mode *mode = &crtc->mode;
 	u32 value;
@@ -121,7 +121,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 
 static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 {
-	struct shmob_drm_device *sdev = scrtc->crtc.dev->dev_private;
+	struct shmob_drm_device *sdev = scrtc->crtc.drm_dev->dev_private;
 	u32 value;
 
 	value = lcdc_read(sdev, LDCNT2R);
@@ -155,7 +155,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct shmob_drm_format_info *format;
 	struct drm_device *dev = sdev->ddev;
@@ -257,7 +257,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 
 	if (!scrtc->started)
 		return;
@@ -312,7 +312,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 
 	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
 
@@ -352,7 +352,7 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
 				   struct drm_framebuffer *old_fb)
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 	const struct shmob_drm_format_info *format;
 
 	format = shmob_drm_format_info(crtc->primary->fb->format->format);
@@ -394,7 +394,7 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->crtc.drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -414,7 +414,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->crtc.drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -457,7 +457,7 @@ static void shmob_drm_crtc_enable_vblank(struct shmob_drm_device *sdev,
 
 static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 
 	shmob_drm_crtc_enable_vblank(sdev, true);
 
@@ -466,7 +466,7 @@ static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 
 static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm_dev->dev_private;
 
 	shmob_drm_crtc_enable_vblank(sdev, false);
 }
-- 
2.39.2

