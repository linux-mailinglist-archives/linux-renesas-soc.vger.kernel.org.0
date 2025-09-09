Return-Path: <linux-renesas-soc+bounces-21625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0523B4A96F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C1A3440DB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694333191BC;
	Tue,  9 Sep 2025 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/LUUO8n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03C31812C;
	Tue,  9 Sep 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412457; cv=none; b=C0cPEGB+okkhW16PTpU6WgpM61c2NsBlPjuTgu/wTEvkf/CTv2yzhj8Kfr5ykeHW9/zPAhP+SKsl0pDVGY/yDcn27wNYBMsZB5g3LOdBO12FPhX5XcUgTP7bLhlNDQZOXbETZ+6B+r7Jkv0g01juqegklJd9XMw78Uzj7h86yS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412457; c=relaxed/simple;
	bh=kAHzqBWs57x1zqCtgtn5EIT4rdB2eYLh4+g/CF9id6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2SMOZYw/zL9aRx+WUur3P6TlKaGGVapIDX+SWauSrFmx74+y0CS1C8m09yCwhN4U9cX7c1hDywgYzRbPfIsDXs9igsOAqQlsFaaCMEs0eJiPB+rwq21X5O643Zz3MPT32cAl71SgajvTfdTGUBVVqvfkkowND3YaIpE4U6Jw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/LUUO8n; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412455; x=1788948455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kAHzqBWs57x1zqCtgtn5EIT4rdB2eYLh4+g/CF9id6Q=;
  b=Y/LUUO8n+LC+woYbLz61HIvGPxEYNbzKZNzRe4A9MQJUUlgW1FgslItN
   P9KIHLPho9hvsXBCk9vXjR0/Viyw5ZBucFgILZDMxwW2eo7QYvIgxRa7d
   izpNcDsZIBFXl6vMF0qZuDFxD8/ZJOV2A/gx/UpZF3H04USgnhn/2AWsr
   4i1NS+sqpt4ZtXMJEV2hD0TeA7zVNiXydlKTExOiyzoxPQIXDw30mDWlE
   SQcBoRtcK9zq//ckIecNFrH8lee/P2GP77pB4Z0w7j4cTYpKdl4aALbq7
   GjAqxYnBJLcRuXWWxQtnYGGHhek++fodMjn30dJj/TnIRpA1biP4K1VWm
   g==;
X-CSE-ConnectionGUID: Vdk/G9ExSuy4AQnvNmFLJg==
X-CSE-MsgGUID: D2J/pi+mRyi8xfOgFo1JnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58730164"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="58730164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:07:33 -0700
X-CSE-ConnectionGUID: xHEVuOXiTzSUcbW6ppK6pQ==
X-CSE-MsgGUID: jx6YrBl1RYiOaDLXtUbOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172915407"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 03:07:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: kernel-list@raspberrypi.com,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	arun.r.murthy@intel.com,
	uma.shankar@intel.com,
	jani.nikula@intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	harry.wentland@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robin.clark@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	tzimmermann@suse.de,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	laurent.pinchart+renesas@ideasonboard.com,
	mcanal@igalia.com,
	dave.stevenson@raspberrypi.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	louis.chauvet@bootlin.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Date: Tue,  9 Sep 2025 15:36:44 +0530
Message-Id: <20250909100649.1509696-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909100649.1509696-1-suraj.kandpal@intel.com>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now with drm_writeback_connector moved to drm_connector it makes
more sense use drm_connector as an argument rather than drm_connector.
The writeback connector can easily be derived from drm_connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c |  2 +-
 .../drm/arm/display/komeda/komeda_wb_connector.c |  5 +----
 drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
 drivers/gpu/drm/drm_writeback.c                  | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    |  2 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c  |  3 +--
 drivers/gpu/drm/vc4/vc4_txp.c                    |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c            |  4 ++--
 include/drm/drm_writeback.h                      |  4 ++--
 9 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 8fea29720989..84a9c1d2bd8e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -204,7 +204,7 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	drm_connector_helper_add(&wbcon->base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base.writeback,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
 					    encoder,
 					    amdgpu_dm_wb_formats,
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 69822b9be574..d3dd07491630 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -135,7 +135,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 {
 	struct komeda_dev *mdev = kms->base.dev_private;
 	struct komeda_wb_connector *kwb_conn;
-	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
 	struct drm_encoder *encoder;
 
@@ -151,8 +150,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
-	wb_conn = &kwb_conn->base.writeback;
-
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       kwb_conn->wb_layer->layer_type,
 					       &n_formats);
@@ -170,7 +167,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 
 	encoder->possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
 
-	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+	err = drmm_writeback_connector_init(&kms->base, &kwb_conn->base,
 					    &komeda_wb_connector_funcs,
 					    encoder,
 					    formats, n_formats);
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index ea03cb98bfb4..a36a4c86a99e 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -228,7 +228,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
 
-	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector.writeback,
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
 					    &malidp_mw_connector_funcs,
 					    encoder,
 					    formats, n_formats);
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 7d6410b5b48d..c7cb4673eedb 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -242,7 +242,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  * a custom encoder
  *
  * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
+ * @connector: Drm connector which contains the writeback connector to initialize
  * @enc: handle to the already initialized drm encoder
  * @con_funcs: Connector funcs vtable
  * @formats: Array of supported pixel formats for the writeback engine
@@ -267,13 +267,13 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  * Returns: 0 on success, or a negative error code
  */
 int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
+				 struct drm_connector *connector,
 				 const struct drm_connector_funcs *con_funcs,
 				 struct drm_encoder *enc,
 				 const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector =
-		drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	int ret;
 
 	ret = drm_connector_init(dev, connector, con_funcs,
@@ -322,7 +322,7 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
  * a custom encoder
  *
  * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
+ * @connector: Drm connector containing the writeback connector to initialize
  * @con_funcs: Connector funcs vtable
  * @enc: Encoder to connect this writeback connector
  * @formats: Array of supported pixel formats for the writeback engine
@@ -338,13 +338,13 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
  * Returns: 0 on success, or a negative error code
  */
 int drmm_writeback_connector_init(struct drm_device *dev,
-				  struct drm_writeback_connector *wb_connector,
+				  struct drm_connector *connector,
 				  const struct drm_connector_funcs *con_funcs,
 				  struct drm_encoder *enc,
 				  const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector =
-		drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	int ret;
 
 	ret = drmm_connector_init(dev, connector, con_funcs,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 49412d2ed9aa..8d29e09952c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -132,7 +132,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	drm_connector_helper_add(&dpu_wb_conn->base, &dpu_wb_conn_helper_funcs);
 
-	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base.writeback,
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
 					   &dpu_wb_conn_funcs, enc,
 					   format_list, num_formats);
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 186efe019891..fe6764620739 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -203,7 +203,6 @@ static const u32 writeback_formats[] = {
 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
-	struct drm_writeback_connector *wb_conn = &rcrtc->writeback.writeback;
 	struct drm_encoder *encoder;
 
 	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
@@ -218,7 +217,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 	drm_connector_helper_add(&rcrtc->writeback,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+	return drmm_writeback_connector_init(&rcdu->ddev, &rcrtc->writeback,
 					     &rcar_du_wb_conn_funcs,
 					     encoder,
 					     writeback_formats,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 2428807e9714..a53e3aa41f63 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -600,7 +600,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drmm_writeback_connector_init(drm, &txp->connector.writeback,
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
 					    &vc4_txp_connector_funcs,
 					    encoder,
 					    drm_fmts, ARRAY_SIZE(drm_fmts));
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 6b4d1c4a1830..d897a83e3b36 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -169,7 +169,6 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 				    struct vkms_output *vkms_output)
 {
-	struct drm_writeback_connector *wb = &vkms_output->wb_connector.writeback;
 	int ret;
 
 	ret = drmm_encoder_init(&vkmsdev->drm, &vkms_output->wb_encoder,
@@ -182,7 +181,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 
 	drm_connector_helper_add(&vkms_output->wb_connector, &vkms_wb_conn_helper_funcs);
 
-	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+	return drmm_writeback_connector_init(&vkmsdev->drm,
+					     &vkms_output->wb_connector,
 					     &vkms_wb_connector_funcs,
 					     &vkms_output->wb_encoder,
 					     vkms_wb_formats,
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 2a52b6761797..f789aa773616 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -84,13 +84,13 @@ drm_connector_to_writeback(struct drm_connector *connector)
 }
 
 int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
+				 struct drm_connector *connector,
 				 const struct drm_connector_funcs *con_funcs,
 				 struct drm_encoder *enc,
 				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
-				  struct drm_writeback_connector *wb_connector,
+				  struct drm_connector *connector,
 				  const struct drm_connector_funcs *con_funcs,
 				  struct drm_encoder *enc,
 				  const u32 *formats, int n_formats);
-- 
2.34.1


