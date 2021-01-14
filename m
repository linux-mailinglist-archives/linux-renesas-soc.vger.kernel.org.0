Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A764D2F65D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 17:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbhANQYt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 11:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbhANQYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 11:24:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CE5C061575;
        Thu, 14 Jan 2021 08:24:08 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17DBE8D7;
        Thu, 14 Jan 2021 17:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610641446;
        bh=2CrI55V+CC0flZtb85RcD+t2O3kw9X2bl5LDnO6fxNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tIQJv3ciWLBICW1quW5Kdf34vBaHwL3dK+X8I/HIOAnsb0q4DPp55cDqNrKG2OQQD
         TM4ExWkziXtQPqZmLjaJnENsHh9fXcCDt5Ojx9t1IcbA8uGDEvUOt0iNzRkQ0xYtPc
         NkDO3t/79ZLxO6J3k2FBpQJKAGYHsXE7ALyom0u8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 01/10] media: vsp1: drm: Split vsp1_du_setup_lif()
Date:   Thu, 14 Jan 2021 16:22:46 +0000
Message-Id: <20210114162255.705868-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Break vsp1_du_setup_lif() into components more suited to the DRM Atomic
API. The existing vsp1_du_setup_lif() API call is maintained as it is
still used from the DU.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:
- Minor formatting updates to fix checkpatch.pl --strict
- Spelling correction.

Changes since v2:

- Minor formatting changes
- Fix NULL pointer dereference in vsp1_du_setup_lif()

 drivers/media/platform/vsp1/vsp1_drm.c | 219 ++++++++++++++++++-------
 include/media/vsp1.h                   |  31 +++-
 2 files changed, 187 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 86d5e3f4b1ff..2bac80014bf4 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -616,10 +616,10 @@ int vsp1_du_init(struct device *dev)
 EXPORT_SYMBOL_GPL(vsp1_du_init);
 
 /**
- * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
+ * vsp1_du_atomic_modeset - Configure the mode as part of an atomic update
  * @dev: the VSP device
  * @pipe_index: the DRM pipeline index
- * @cfg: the LIF configuration
+ * @cfg: the mode configuration
  *
  * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
  * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
@@ -636,14 +636,12 @@ EXPORT_SYMBOL_GPL(vsp1_du_init);
  *
  * Return 0 on success or a negative error code on failure.
  */
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg)
+int vsp1_du_atomic_modeset(struct device *dev, unsigned int pipe_index,
+			   const struct vsp1_du_modeset_config *cfg)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe;
 	struct vsp1_pipeline *pipe;
-	unsigned long flags;
-	unsigned int i;
 	int ret;
 
 	if (pipe_index >= vsp1->info->lif_count)
@@ -652,60 +650,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	drm_pipe = &vsp1->drm->pipe[pipe_index];
 	pipe = &drm_pipe->pipe;
 
-	if (!cfg) {
-		struct vsp1_brx *brx;
-
-		mutex_lock(&vsp1->drm->lock);
-
-		brx = to_brx(&pipe->brx->subdev);
-
-		/*
-		 * NULL configuration means the CRTC is being disabled, stop
-		 * the pipeline and turn the light off.
-		 */
-		ret = vsp1_pipeline_stop(pipe);
-		if (ret == -ETIMEDOUT)
-			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
-
-		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
-			struct vsp1_rwpf *rpf = pipe->inputs[i];
-
-			if (!rpf)
-				continue;
-
-			/*
-			 * Remove the RPF from the pipe and the list of BRx
-			 * inputs.
-			 */
-			WARN_ON(!rpf->entity.pipe);
-			rpf->entity.pipe = NULL;
-			list_del(&rpf->entity.list_pipe);
-			pipe->inputs[i] = NULL;
-
-			brx->inputs[rpf->brx_input].rpf = NULL;
-		}
-
-		drm_pipe->du_complete = NULL;
-		pipe->num_inputs = 0;
-
-		dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
-			__func__, pipe->lif->index,
-			BRX_NAME(pipe->brx));
-
-		list_del(&pipe->brx->list_pipe);
-		pipe->brx->pipe = NULL;
-		pipe->brx = NULL;
-
-		mutex_unlock(&vsp1->drm->lock);
-
-		vsp1_dlm_reset(pipe->output->dlm);
-		vsp1_device_put(vsp1);
-
-		dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
-
-		return 0;
-	}
-
 	drm_pipe->width = cfg->width;
 	drm_pipe->height = cfg->height;
 	pipe->interlaced = cfg->interlaced;
@@ -722,8 +666,43 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		goto unlock;
 
 	ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
-	if (ret < 0)
-		goto unlock;
+
+unlock:
+	mutex_unlock(&vsp1->drm->lock);
+
+	return ret;
+}
+
+/**
+ * vsp1_du_atomic_enable - Enable and start a DU pipeline
+ * @dev: the VSP device
+ * @pipe_index: the DRM pipeline index
+ * @cfg: the enablement configuration
+ *
+ * The @pipe_index argument selects which DRM pipeline to enable. The number of
+ * available pipelines depends on the VSP instance.
+ *
+ * The configuration passes a callback function to register notification of
+ * frame completion events.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
+			  const struct vsp1_du_enable_config *cfg)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_drm_pipeline *drm_pipe;
+	struct vsp1_pipeline *pipe;
+	unsigned long flags;
+	int ret;
+
+	if (pipe_index >= vsp1->info->lif_count)
+		return -EINVAL;
+
+	drm_pipe = &vsp1->drm->pipe[pipe_index];
+	pipe = &drm_pipe->pipe;
+
+	mutex_lock(&vsp1->drm->lock);
 
 	/* Enable the VSP1. */
 	ret = vsp1_device_get(vsp1);
@@ -759,6 +738,122 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vsp1_du_atomic_enable);
+
+/**
+ * vsp1_du_atomic_disable - Disable and stop a DU pipeline
+ * @dev: the VSP device
+ * @pipe_index: the DRM pipeline index
+ *
+ * The @pipe_index argument selects which DRM pipeline to disable. The number
+ * of available pipelines depend on the VSP instance.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_drm_pipeline *drm_pipe;
+	struct vsp1_pipeline *pipe;
+	struct vsp1_brx *brx;
+	unsigned int i;
+	int ret;
+
+	if (pipe_index >= vsp1->info->lif_count)
+		return -EINVAL;
+
+	drm_pipe = &vsp1->drm->pipe[pipe_index];
+	pipe = &drm_pipe->pipe;
+
+	mutex_lock(&vsp1->drm->lock);
+
+	brx = to_brx(&pipe->brx->subdev);
+
+	/* Stop the pipeline and turn the light off. */
+	ret = vsp1_pipeline_stop(pipe);
+	if (ret == -ETIMEDOUT)
+		dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
+
+	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
+		struct vsp1_rwpf *rpf = pipe->inputs[i];
+
+		if (!rpf)
+			continue;
+
+		/* Remove the RPF from the pipe and the list of BRx inputs. */
+		WARN_ON(!rpf->entity.pipe);
+		rpf->entity.pipe = NULL;
+		list_del(&rpf->entity.list_pipe);
+		pipe->inputs[i] = NULL;
+
+		brx->inputs[rpf->brx_input].rpf = NULL;
+	}
+
+	drm_pipe->du_complete = NULL;
+	pipe->num_inputs = 0;
+
+	dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n", __func__,
+		pipe->lif->index, BRX_NAME(pipe->brx));
+
+	list_del(&pipe->brx->list_pipe);
+	pipe->brx->pipe = NULL;
+	pipe->brx = NULL;
+
+	mutex_unlock(&vsp1->drm->lock);
+
+	vsp1_dlm_reset(pipe->output->dlm);
+	vsp1_device_put(vsp1);
+
+	dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
+
+/**
+ * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
+ * @dev: the VSP device
+ * @pipe_index: the DRM pipeline index
+ * @cfg: the LIF configuration
+ *
+ * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
+ * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
+ * source pads, and the LIF sink pad.
+ *
+ * The @pipe_index argument selects which DRM pipeline to setup. The number of
+ * available pipelines depend on the VSP instance.
+ *
+ * As the media bus code on the blend unit source pad is conditioned by the
+ * configuration of its sink 0 pad, we also set up the formats on all blend unit
+ * sinks, even if the configuration will be overwritten later by
+ * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
+ * a well defined state.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
+		      const struct vsp1_du_lif_config *cfg)
+{
+	struct vsp1_du_modeset_config modes;
+	struct vsp1_du_enable_config enable;
+	int ret;
+
+	if (!cfg)
+		return vsp1_du_atomic_disable(dev, pipe_index);
+
+	modes.width = cfg->width;
+	modes.height = cfg->height;
+	modes.interlaced = cfg->interlaced;
+
+	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
+	if (ret)
+		return ret;
+
+	enable.callback = cfg->callback;
+	enable.callback_data = cfg->callback_data;
+
+	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
+}
 EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
 
 /**
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index cc1b0d42ce95..253db8029752 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -21,7 +21,7 @@ int vsp1_du_init(struct device *dev);
 #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
 
 /**
- * struct vsp1_du_lif_config - VSP LIF configuration
+ * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
  * @width: output frame width
  * @height: output frame height
  * @interlaced: true for interlaced pipelines
@@ -42,6 +42,30 @@ struct vsp1_du_lif_config {
 int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		      const struct vsp1_du_lif_config *cfg);
 
+/**
+ * struct vsp1_du_modeset_config - VSP display mode configuration
+ * @width: output frame width
+ * @height: output frame height
+ * @interlaced: true for interlaced pipelines
+ */
+struct vsp1_du_modeset_config {
+	unsigned int width;
+	unsigned int height;
+	bool interlaced;
+};
+
+/**
+ * struct vsp1_du_enable_config - VSP enable configuration
+ * @callback: frame completion callback function (optional). When a callback
+ *	      is provided, the VSP driver guarantees that it will be called once
+ *	      and only once for each vsp1_du_atomic_flush() call.
+ * @callback_data: data to be passed to the frame completion callback
+ */
+struct vsp1_du_enable_config {
+	void (*callback)(void *data, unsigned int status, u32 crc);
+	void *callback_data;
+};
+
 /**
  * struct vsp1_du_atomic_config - VSP atomic configuration parameters
  * @pixelformat: plane pixel format (V4L2 4CC)
@@ -106,6 +130,11 @@ struct vsp1_du_atomic_pipe_config {
 	struct vsp1_du_writeback_config writeback;
 };
 
+int vsp1_du_atomic_modeset(struct device *dev, unsigned int pipe_index,
+			   const struct vsp1_du_modeset_config *cfg);
+int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
+			  const struct vsp1_du_enable_config *cfg);
+int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index);
 void vsp1_du_atomic_begin(struct device *dev, unsigned int pipe_index);
 int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 			  unsigned int rpf,
-- 
2.25.1

