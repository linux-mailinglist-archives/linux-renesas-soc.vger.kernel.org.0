Return-Path: <linux-renesas-soc+bounces-20212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E737AB203A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0EE518C249C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF96A2E0936;
	Mon, 11 Aug 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYu9/02T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE923223DF5;
	Mon, 11 Aug 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904526; cv=none; b=c1so21sx5EbfV/Qtks8Ze00ZWN9j//6KiLd8mLN1U/M2PdUdc/YUDUtLy97xMvnkcQ1TKjPp1sIawdWexveeMQB4oShufIMUVGRAH7tL8A3PyiaJ97fP6BSPO0ea3AUzHPPldKMqF3eMfMrCXi7FXmKJTdmu7r6KPJLR60JeEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904526; c=relaxed/simple;
	bh=dttlg+vgcxiB2RBGfwux8lXZdUR9YBGtB6WAMZ1/WfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kC+jn767f1iQ5vOyTizlR8+Lsp1R2csJhs6xYATP71hAp8Hi3NQV9lL1tYIx2aaZzPSpgU4s5ZOu9lbpJkCVBqlRNVajUpyOhz5E4vWtcapqCYvmFLmY9mbqUkixAcY9ZuSRe3jdtuQioGkwUq6Rn4VYbAGvMxz6kbVlzI+2Vos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYu9/02T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904525; x=1786440525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dttlg+vgcxiB2RBGfwux8lXZdUR9YBGtB6WAMZ1/WfI=;
  b=XYu9/02T5oxQrm0S/I+OsaAGQ4Rzu/pbr9LT9zCR+bDzUTkeUixPJLu1
   uXjkvjR15GPyoTdPLS5tHas0QeWkj0XMG1slv+G35oIHAGuT9FEY5Wfk7
   RzCzfXmUFSZr3KuhElmscZvBFykNPruPX9ekkZVLIoYlzUMJWWY09XdZB
   QdgFlOPty+AuNNtPWuW3jlTVF9Rv7YuQJw7mNbdx1LvqEjKB+uaEt+dUO
   35zKNr2LXkxA0N9ZQROVUUYjx28fz5SNrTdccsjjXpCbABb/GJ2t0iklm
   UDSMl4A7BjnL6BoTWaFnyCnKxrh9cA7Os60LFgHuLx+AWv1/srcR8JzFT
   w==;
X-CSE-ConnectionGUID: icebc2gWTh+fbOfOwK5VCg==
X-CSE-MsgGUID: olX/a0qyQLiEy+LgLgwwhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218121"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57218121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:28:44 -0700
X-CSE-ConnectionGUID: BDq5bjwtSguuy60OrkqfTQ==
X-CSE-MsgGUID: lmOp1g74QUunVyQmQQWBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860505"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:35 -0700
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
Subject: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:06 +0530
Message-Id: <20250811092707.3986802-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811092707.3986802-1-suraj.kandpal@intel.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that drm_writeback_connector is embedded with the drm_connector
adapt the rcar-du writeback functionality to this changes. This
includes changing the drm_writeback_connector to be changed to drm_connector
within the rcar_du_crtc.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 ++--
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..457c803d75bc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -72,11 +72,11 @@ struct rcar_du_crtc {
 	const char *const *sources;
 	unsigned int sources_count;
 
-	struct drm_writeback_connector writeback;
+	struct drm_connector connector;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
-#define wb_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, writeback)
+#define connector_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, connector)
 
 /**
  * struct rcar_du_crtc_state - Driver-specific CRTC state
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 9986a10e8114..95e6810612c2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -47,10 +47,12 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
+static int rcar_du_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 				  struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
+	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob;
 	int ret;
 
@@ -72,10 +74,12 @@ static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
 	return 0;
 }
 
-static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
+static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *wb_connector,
 				   struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
+	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob = job->priv;
 
 	if (!job->fb)
@@ -199,7 +203,7 @@ static const u32 writeback_formats[] = {
 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
-	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_writeback_connector *wb_conn = &rcrtc->connector.writeback;
 
 	struct drm_encoder *encoder;
 
@@ -212,7 +216,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
 
-	drm_connector_helper_add(&wb_conn->base,
+	drm_connector_helper_add(&rcrtc->connector,
 				 &rcar_du_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
@@ -231,7 +235,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 	struct drm_framebuffer *fb;
 	unsigned int i;
 
-	state = rcrtc->writeback.base.state;
+	state = rcrtc->connector.state;
 	if (!state || !state->writeback_job)
 		return;
 
@@ -246,10 +250,10 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
 			    + fb->offsets[i];
 
-	drm_writeback_queue_job(&rcrtc->writeback, state);
+	drm_writeback_queue_job(&rcrtc->connector.writeback, state);
 }
 
 void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
 {
-	drm_writeback_signal_completion(&rcrtc->writeback, 0);
+	drm_writeback_signal_completion(&rcrtc->connector.writeback, 0);
 }
-- 
2.34.1


