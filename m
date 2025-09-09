Return-Path: <linux-renesas-soc+bounces-21630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C9B4A9A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A453BCB53
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6206531CA63;
	Tue,  9 Sep 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2ghhF4K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705C31B83E;
	Tue,  9 Sep 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412503; cv=none; b=amxYwLiMaiCwu1lYmxWEL6E3HnwKt5COqMfULuRGTBV35a1DvAW5b60ktWlhjtx0Uz9ieg51P9KpxgtWzifM4kANR52Q7vdTQ3PjafHNFHfWAYgKRBa+DbkmYggKjyAmLn5ThMlaozglHo3sGej2mdLuQiVOodSAouZ005FH1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412503; c=relaxed/simple;
	bh=TTPMXjY8qFzobtrZBfLA9XlG3M7qUX9ujzgR0RrUWoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPIh7ZvPhOUcazE/XfaZvETJwe2AHyv21MVkmtlsoIAfiJ/A7fKvpXMsV447U02idJHUus66vl7S4sDex/PqWq9LjQB7kkDO4vsd7yZQBwHPozqtdULICjwZx3Jpbxnp1eAvJQq4MZDfjP12L579B044lnAlkoWnAdQhVjvg7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2ghhF4K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412501; x=1788948501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TTPMXjY8qFzobtrZBfLA9XlG3M7qUX9ujzgR0RrUWoA=;
  b=P2ghhF4KhnNDBC2kFgTB9aOzuogtckIZnaSC6/4ZjRuXM1MGqOPSFlaG
   GIbIpab3OhAWIS2oTmrjZaVFynIC4C0aIFvMHAy/w6EP6AgvDz6vXI9UV
   lJLgdfPy8DLv7mubuiQnqDfKmRPudAvBmD/4YTBCl3xDsvWTm6kYBqptG
   MFk6KaFB1vl3DbbFLqtZZGlP2N11esMjQZ66akmUFq3oSRMtvZ+M/NEk+
   bGSQ1FmShwyc0FBg73F9gV3cU6jyPRno2n2RrU59IAje7dkTv3hNDaDPH
   1FoMf1DSTFbcUWK9QHiq7fM6m6DqkEQLyo58LmDLAyQJO5YCAhgh1f/XV
   Q==;
X-CSE-ConnectionGUID: jgQPxthhSFe3GHvQsufhaQ==
X-CSE-MsgGUID: uxektMJGTA64KYjAVGS6oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58730358"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="58730358"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:08:20 -0700
X-CSE-ConnectionGUID: buH9qxfYSd25Ewe3+SdWfQ==
X-CSE-MsgGUID: TlN6UXqfRYeNAAiFbBfcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172915539"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 03:08:11 -0700
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
Subject: [PATCH 7/7] drm/connector: Modify cleanup_writeback_job helper
Date: Tue,  9 Sep 2025 15:36:49 +0530
Message-Id: <20250909100649.1509696-8-suraj.kandpal@intel.com>
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

Lets now pass drm_connector to prepare_writeback_job since
drm_writeback_connector now resides within drm_connector.
It also make it uniform with params passed to other
drm_connector_helper_funcs.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 4 ++--
 drivers/gpu/drm/drm_writeback.c                      | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c        | 4 +---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c  | 6 ++----
 drivers/gpu/drm/vkms/vkms_writeback.c                | 5 +----
 include/drm/drm_modeset_helper_vtables.h             | 2 +-
 6 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d02f5d20f3b1..bf1ecf5d3027 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -144,8 +144,8 @@ static int amdgpu_dm_wb_prepare_job(struct drm_connector *connector,
 	return r;
 }
 
-static void amdgpu_dm_wb_cleanup_job(struct drm_writeback_connector *connector,
-				struct drm_writeback_job *job)
+static void amdgpu_dm_wb_cleanup_job(struct drm_connector *connector,
+				     struct drm_writeback_job *job)
 {
 	struct amdgpu_bo *rbo;
 	int r;
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 32a8e6498585..a2cb66f70ed1 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -451,7 +451,7 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
 		connector->helper_private;
 
 	if (job->prepared && funcs->cleanup_writeback_job)
-		funcs->cleanup_writeback_job(wb_connector, job);
+		funcs->cleanup_writeback_job(connector, job);
 
 	if (job->fb)
 		drm_framebuffer_put(job->fb);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 26a93c3cc454..03e63b6c5351 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -96,11 +96,9 @@ static int dpu_wb_conn_prepare_job(struct drm_connector *connector,
 	return 0;
 }
 
-static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *wb_connector,
+static void dpu_wb_conn_cleanup_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)
 {
-	struct drm_connector *connector =
-		container_of(wb_connector, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 725981cc1d0c..e3aab132ded1 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -72,12 +72,10 @@ static int rcar_du_wb_prepare_job(struct drm_connector *connector,
 	return 0;
 }
 
-static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
+static void rcar_du_wb_cleanup_job(struct drm_connector *connector,
 				   struct drm_writeback_job *job)
 {
-	struct drm_connector *conn =
-		drm_writeback_to_connector(connector);
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(conn);
+	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob = job->priv;
 
 	if (!job->fb)
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 032896fb5c5b..320d553f5f1f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -102,13 +102,10 @@ static int vkms_wb_prepare_job(struct drm_connector *connector,
 	return ret;
 }
 
-static void vkms_wb_cleanup_job(struct drm_writeback_connector *wb_conn,
+static void vkms_wb_cleanup_job(struct drm_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct drm_connector *connector = container_of(wb_conn,
-						       struct drm_connector,
-						       writeback);
 	struct vkms_output *vkms_output = container_of(connector,
 						       struct vkms_output,
 						       wb_connector);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f6a14f396c40..483de9978e0c 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1145,7 +1145,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 * This callback is used by the atomic modeset helpers.
 	 */
-	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
+	void (*cleanup_writeback_job)(struct drm_connector *connector,
 				      struct drm_writeback_job *job);
 
 	/**
-- 
2.34.1


