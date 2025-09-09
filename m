Return-Path: <linux-renesas-soc+bounces-21626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D92B4A977
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E6D1892B7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEF031812C;
	Tue,  9 Sep 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfwsI6ZH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6B2F3C30;
	Tue,  9 Sep 2025 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412465; cv=none; b=IJMDd9IqLeFJy/Lf/jw3kyiyFLW9zDk92ZVEjcWC5f5gOxJVfV6U9zn5ZpKiSbc3ugy6RiPleo1a/uXb/Aor/qT/SbszLfR5cWyUOZFBnQDUJKZxpuaNyJ3nCVM6f6iHSIgxocWpboi94wijUG6M3N5lFw4F9b81wj9RNb3Cfv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412465; c=relaxed/simple;
	bh=mxwlnKRfsYwmrttvfnUC36y7M5y4JSvpLuDNPSeGJFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6hN0zBqxC/t5CwPq9XrNaQFl6P8rW5dTo7rAfRlzpeGM87QqfFYuf1MgyZb+9eIDn+O9zI98yFzRAUfYb4zF/AoSOxm390CtYZ9mlL6cQJKQJ+5elT161IDS4WsWAq4Onqx+5voJlWwseMdXq8ALGmj6rLV6uFiYDGEC5unEas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfwsI6ZH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412463; x=1788948463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mxwlnKRfsYwmrttvfnUC36y7M5y4JSvpLuDNPSeGJFQ=;
  b=GfwsI6ZHUSS4MjIRO0s++bazmE2DlQ63sDoeQXP6zVA5xdn3sfLyxfXM
   GvL5UuwW5RqdHWkc4JQJgbHdG7+T57CKa/b/6bWg7AG/Lrb0QhVXdwCXX
   eQTgTCWTWMEw4L0KLHgRMUuHplVLjyD+8euiab/0u42KztrMEnBIAQu8T
   hsTQHH/gEyUxmOfU2SsEALFoSrhWPHnnVc9tDKfJiv6nYhCEV/aZ1BoYl
   vJt2ONvj4scC5Sa0t9hiBZVZh8ys7g9LS1kE4dHKE323CAoEm8YpFjdcI
   JkCDje0aHui1kLoh5jzBjYUQEDxb15l6/ba/qqLahdGzaFQWYNTkFje0z
   Q==;
X-CSE-ConnectionGUID: F74YPLmLSu6dOwS4rsOmxA==
X-CSE-MsgGUID: 3aywOnn3Rm2C2F1xJnu9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58730181"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="58730181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:07:42 -0700
X-CSE-ConnectionGUID: h/qB4lPeSF20iM1EQfQCjg==
X-CSE-MsgGUID: JcHth2VqRn6ckRKEmayY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172915431"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 03:07:33 -0700
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
Subject: [PATCH 3/7] drm: writeback: Modify drm_writeback_queue_job params
Date: Tue,  9 Sep 2025 15:36:45 +0530
Message-Id: <20250909100649.1509696-4-suraj.kandpal@intel.com>
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

Move to using drm_connector structure instead of drm_writeback_connector
since this now writeback resides within drm_connector.
This helps make sure drivers change drm_writeback_connector
using helpers provided by drm core.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 5 ++---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c    | 2 +-
 drivers/gpu/drm/arm/malidp_mw.c                     | 3 +--
 drivers/gpu/drm/drm_writeback.c                     | 7 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                       | 2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c               | 3 +--
 include/drm/drm_writeback.h                         | 2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d4628dadf55a..4aaa7d233f4a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9990,7 +9990,6 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 			      struct drm_connector *connector,
 			      struct drm_connector_state *new_con_state)
 {
-	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
 	struct amdgpu_device *adev = dm->adev;
 	struct amdgpu_crtc *acrtc;
 	struct dc_writeback_info *wb_info;
@@ -10080,8 +10079,8 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 	dc_stream_add_writeback(dm->dc, crtc_state->stream, wb_info);
 
 	acrtc->wb_pending = true;
-	acrtc->wb_conn = wb_conn;
-	drm_writeback_queue_job(wb_conn, new_con_state);
+	acrtc->wb_conn = drm_connector_to_writeback(connector);
+	drm_writeback_queue_job(connector, new_con_state);
 }
 
 /**
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 1c2ba6eeb0e5..b3f1d3ca23aa 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -268,7 +268,7 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
 
 	conn_st = wb_conn ? wb_conn->base.state : NULL;
 	if (conn_st && conn_st->writeback_job)
-		drm_writeback_queue_job(&wb_conn->base.writeback, conn_st);
+		drm_writeback_queue_job(&wb_conn->base, conn_st);
 
 	/* step 2: notify the HW to kickoff the update */
 	mdev->funcs->flush(mdev, master->id, kcrtc_st->active_pipes);
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index a36a4c86a99e..5d3eceae4651 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -243,7 +243,6 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
 			     struct drm_atomic_state *old_state)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
-	struct drm_writeback_connector *mw_conn = &malidp->mw_connector.writeback;
 	struct drm_connector_state *conn_state = malidp->mw_connector.state;
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct malidp_mw_connector_state *mw_state;
@@ -263,7 +262,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
 				     &mw_state->addrs[0],
 				     mw_state->format);
 
-		drm_writeback_queue_job(mw_conn, conn_state);
+		drm_writeback_queue_job(&malidp->mw_connector, conn_state);
 		hwdev->hw->enable_memwrite(hwdev, mw_state->addrs,
 					   mw_state->pitches, mw_state->n_planes,
 					   fb->width, fb->height, mw_state->format,
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index c7cb4673eedb..02c8bffcca11 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -407,7 +407,8 @@ EXPORT_SYMBOL(drm_writeback_prepare_job);
 
 /**
  * drm_writeback_queue_job - Queue a writeback job for later signalling
- * @wb_connector: The writeback connector to queue a job on
+ * @connector: The drm connector  which contains the writeback connector to
+ * queue a job on
  * @conn_state: The connector state containing the job to queue
  *
  * This function adds the job contained in @conn_state to the job_queue for a
@@ -424,9 +425,11 @@ EXPORT_SYMBOL(drm_writeback_prepare_job);
  *
  * See also: drm_writeback_signal_completion()
  */
-void drm_writeback_queue_job(struct drm_writeback_connector *wb_connector,
+void drm_writeback_queue_job(struct drm_connector *connector,
 			     struct drm_connector_state *conn_state)
 {
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	struct drm_writeback_job *job;
 	unsigned long flags;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 0e60c1ac07c5..32db3e248a4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -485,11 +485,11 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
 	}
 
 	drm_conn =
-		container_of(wb_enc->wb_conn, struct drm_connector, writeback);
+		drm_writeback_to_connector(wb_enc->wb_conn);
 	state = drm_conn->state;
 
 	if (wb_enc->wb_conn && wb_enc->wb_job)
-		drm_writeback_queue_job(wb_enc->wb_conn, state);
+		drm_writeback_queue_job(drm_conn, state);
 
 	dpu_encoder_phys_wb_setup(phys_enc);
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index fe6764620739..4e8fa7a5bc32 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -248,7 +248,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
 			    + fb->offsets[i];
 
-	drm_writeback_queue_job(&rcrtc->writeback.writeback, state);
+	drm_writeback_queue_job(&rcrtc->writeback, state);
 }
 
 void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index a53e3aa41f63..8afd1a50ab98 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -356,7 +356,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 
-	drm_writeback_queue_job(&txp->connector.writeback, conn_state);
+	drm_writeback_queue_job(&txp->connector, conn_state);
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d897a83e3b36..28d361517a55 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -130,7 +130,6 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
 	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
-	struct drm_writeback_connector *wb_conn = &output->wb_connector.writeback;
 	struct drm_connector_state *conn_state = output->wb_connector.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
@@ -152,7 +151,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
-	drm_writeback_queue_job(wb_conn, connector_state);
+	drm_writeback_queue_job(&output->wb_connector, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
 	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index f789aa773616..a814b33cbb53 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -100,7 +100,7 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 
 int drm_writeback_prepare_job(struct drm_writeback_job *job);
 
-void drm_writeback_queue_job(struct drm_writeback_connector *wb_connector,
+void drm_writeback_queue_job(struct drm_connector *wb_connector,
 			     struct drm_connector_state *conn_state);
 
 void drm_writeback_cleanup_job(struct drm_writeback_job *job);
-- 
2.34.1


