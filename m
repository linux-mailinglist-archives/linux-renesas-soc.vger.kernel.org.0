Return-Path: <linux-renesas-soc+bounces-21629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068DB4A98F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FF253BB312
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB4631B823;
	Tue,  9 Sep 2025 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oC6ide3j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB431AF06;
	Tue,  9 Sep 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412493; cv=none; b=gOQHR4BvXuIrxET4c/13EtH1c2VFZXDD+d3WHca9olQVpLFBXplwJaQ497qmXel88lDxubW6C4TZAakBqya84wVGO/JEhh83OyofMuKt5Z2NkClel8uVWaLMH7WMFVTxKDqf4Co4TUg7/deJSi/rF4kzO470QhHMlRccHwETf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412493; c=relaxed/simple;
	bh=5UV6m6/MyuA4L7mTMKAcPhVbY0r8n+54Q3q3VPuPHRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SD+geq1rwhtSDt1e5u50v/l3DbjCvlYNxvylyMxWBW7GsHZ8krc+KcHIN7fxUoC3n1IpGNG+D0/tDWzznULWDtd8MxYnIAP/xptpzejKt9deFHvRe5Et7kTiJG05c7xA+GMGccn4Iit8n7t0McuSszFStPZ6TIndFbLCTXa1+tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oC6ide3j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412492; x=1788948492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UV6m6/MyuA4L7mTMKAcPhVbY0r8n+54Q3q3VPuPHRU=;
  b=oC6ide3jowQpEj68jXIhTFZK5ZP6N0brENRhgtDsZO+0nG7QmNY2tCY4
   tgUgtTP6eNf7vCsySr5h+hPliu/0U87+CeAQehB8Vn3FbXIhN09D6oMba
   cNW4pJg8YhhMdxyRcJdlcY2ipqSwjoKA0hTdo2TnXKXHVoN1IGyKXH9E8
   kCQMcIoc4iBgWvjte3S2GizJPHrQRV4aDPi1Avs92SeF/xUxm62tFK5Km
   HDTelaBLqwdO74WSfgXnbKT1+5t9wKl+nM7ul8jhdGcpv/DKClLyLeJ4J
   dYTf4nZNsDdlK3I+DG9MXj7VdbdI7eROc0YzKbDJGfYJT1prfGL7jj1D/
   g==;
X-CSE-ConnectionGUID: nyLcZgjkSKexq68kf9LjAA==
X-CSE-MsgGUID: jBDuTXKBRVWzseGCP6HcxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58730302"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="58730302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:08:11 -0700
X-CSE-ConnectionGUID: 4P6EgBalTz646STQunfpvg==
X-CSE-MsgGUID: Lpo2CUh7QJ6wF9QgGOPMeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172915511"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 03:08:02 -0700
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
Subject: [PATCH 6/7] drm/connector: Modify prepare_writeback_job helper
Date: Tue,  9 Sep 2025 15:36:48 +0530
Message-Id: <20250909100649.1509696-7-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 2 +-
 drivers/gpu/drm/drm_writeback.c                      | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c        | 4 +---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c  | 6 ++----
 drivers/gpu/drm/vkms/vkms_writeback.c                | 2 +-
 include/drm/drm_modeset_helper_vtables.h             | 2 +-
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 84a9c1d2bd8e..d02f5d20f3b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -80,7 +80,7 @@ static int amdgpu_dm_wb_connector_get_modes(struct drm_connector *connector)
 	return drm_add_modes_noedid(connector, 3840, 2160);
 }
 
-static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector,
+static int amdgpu_dm_wb_prepare_job(struct drm_connector *connector,
 			       struct drm_writeback_job *job)
 {
 	struct amdgpu_framebuffer *afb;
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 569160ed713c..32a8e6498585 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -395,7 +395,7 @@ int drm_writeback_prepare_job(struct drm_writeback_job *job)
 	int ret;
 
 	if (funcs->prepare_writeback_job) {
-		ret = funcs->prepare_writeback_job(wb_connector, job);
+		ret = funcs->prepare_writeback_job(connector, job);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8d29e09952c5..26a93c3cc454 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -83,11 +83,9 @@ static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *wb_conn,
+static int dpu_wb_conn_prepare_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)
 {
-	struct drm_connector *connector =
-		container_of(wb_conn, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 1ec9b4242c39..725981cc1d0c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -47,12 +47,10 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
+static int rcar_du_wb_prepare_job(struct drm_connector *connector,
 				  struct drm_writeback_job *job)
 {
-	struct drm_connector *conn =
-		drm_writeback_to_connector(connector);
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(conn);
+	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob;
 	int ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 28d361517a55..032896fb5c5b 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -71,7 +71,7 @@ static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
+static int vkms_wb_prepare_job(struct drm_connector *connector,
 			       struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob;
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ce7c7aeac887..f6a14f396c40 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1130,7 +1130,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 * This callback is used by the atomic modeset helpers.
 	 */
-	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
+	int (*prepare_writeback_job)(struct drm_connector *connector,
 				     struct drm_writeback_job *job);
 	/**
 	 * @cleanup_writeback_job:
-- 
2.34.1


