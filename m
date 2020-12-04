Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31482CF68F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgLDWD1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:03:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730288AbgLDWD1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:03:27 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9093D1828;
        Fri,  4 Dec 2020 23:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119308;
        bh=Bz4lp25BOuPRcY1GTpM5arN1X06adEO+L28VZgNyIrI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tpfJ5OoqdBpd5yA8K+DCkKXtnWuVCW6J1AFHd1Otpb7TrYJgMBbKQcoTS1X+MCfnV
         nn5OPgaQXPa2H1XGhhQO5MKgRtHBhgEih9o69wulqBIG+5Pk4DVGGll4DpHjEjMDJS
         upE7THtpeyJPAiS6M73rov4/JKbh6Q88xIVNlZhk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/9] drm: rcar-du: Replace dev_private with container_of
Date:   Sat,  5 Dec 2020 00:01:37 +0200
Message-Id: <20201204220139.15272-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that drm_device is embedded in rcar_du_device, we can use
container_of to get the rcar_du_device pointer from the drm_device,
instead of using the drm_device.dev_private field.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 8 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4ab99ac49891..d6a8b7899952 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -587,8 +587,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 		return PTR_ERR(rcdu->mmio);
 
 	/* DRM/KMS objects */
-	rcdu->ddev.dev_private = rcdu;
-
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index e5b6f456357e..98d6bac3f2fa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -102,6 +102,11 @@ struct rcar_du_device {
 	unsigned int vspd1_sink;
 };
 
+static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
+{
+	return container_of(dev, struct rcar_du_device, ddev);
+}
+
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
 			       unsigned int feature)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 57bb0dc22807..d6b71a9361ca 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -327,7 +327,7 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	unsigned int align;
 
@@ -349,7 +349,7 @@ static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	const struct rcar_du_format_info *format;
 	unsigned int chroma_pitch;
 	unsigned int max_pitch;
@@ -421,7 +421,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 static int rcar_du_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	int ret;
 
 	ret = drm_atomic_helper_check(dev, state);
@@ -437,7 +437,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5f69ff4502c1..02e5f11f38eb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -128,7 +128,7 @@ static int rcar_du_plane_hwalloc(struct rcar_du_plane *plane,
 int rcar_du_atomic_check_planes(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	unsigned int group_freed_planes[RCAR_DU_MAX_GROUPS] = { 0, };
 	unsigned int group_free_planes[RCAR_DU_MAX_GROUPS] = { 0, };
 	bool needs_realloc = false;
-- 
Regards,

Laurent Pinchart

