Return-Path: <linux-renesas-soc+bounces-20210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03FB20397
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5523A1888491
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DA52E03EF;
	Mon, 11 Aug 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+sDAHEd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1E2DECCB;
	Mon, 11 Aug 2025 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904507; cv=none; b=JLZ8j2AErlbab91+NgfAyQaSdqnnhruLPRpAhEnHzutOKeEmZ1X1pWCX7GXWCmcPEMtimAaX/KRyszVb5Kp9whqumllG3vc9KPglrxL7sLyVt9R+Uq5KzIwLJ9Ugt8fBVHDHCoXeFoyQIGi1Bz/CDzeXWohTRcFIMqiFxFXOEFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904507; c=relaxed/simple;
	bh=Ki1GGkw71tIKyIVaIjMUwdhb3Let70cJ4O4/ULs294k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y1+rLcE/yh5UePce1Tv8E1iHN6TFdRwSwEDn39NsWtr2nDSrptqfhY1N9pRGv2s49WqZT7MWqJc3HZ2glgPn9tn1rgnbJyKlUBAI6UbVovhgnnznfskwBeeKdlLY6e1ovcH+VMxhAPCERHyb/AVqHuDU/3oP9ddYYfVDeQkOBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+sDAHEd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904506; x=1786440506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ki1GGkw71tIKyIVaIjMUwdhb3Let70cJ4O4/ULs294k=;
  b=d+sDAHEdkeG0W/DggRXO8Ohlo7GwJ4Dm5N320OBi8YJUDofJAZxEcOKW
   ckj43bmEK5xv+q7BhfBcLOMVCxRkXsK5/NXrxfYdHrblutxFODxAgbRPY
   JREVqM8xkpqzLe4ti4fOocUQ9NFyAeDu7UytsYMAsf6y11TzvxGLAkbjP
   gNF4UIWMAp8xnyPOsR+cUB64dWkX1QkMRqVbKPnCWa1/3y4yUqHi686v0
   N2+HyYCWsiCPm6SWmYiSgg9/OSH1Ea0PIZ1yTYzMGY/Jds13V+AxPdW/W
   5t0DRXMW3OvT/3wLIV59L10Ym+mEdXq7i6D/i3uzNkBDa5d+4ZmY62gB5
   Q==;
X-CSE-ConnectionGUID: w0s7HI06Th6yAjBU7szfSg==
X-CSE-MsgGUID: ZlfP+5HMQjyY+JUvd/MOOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218051"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57218051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:28:25 -0700
X-CSE-ConnectionGUID: hSQMHheTT5eQzr4ASK6TyQ==
X-CSE-MsgGUID: s4igVi6RSW6SQ+NVnHFQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860428"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:16 -0700
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
Subject: [RFC PATCH 5/8] drm/vc4: Adapt vc4 writeback to new drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:04 +0530
Message-Id: <20250811092707.3986802-6-suraj.kandpal@intel.com>
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
adapt the vc4 writeback functionality to this changes. This
includes changing the drm_writeback_connector to be changed to drm_connector
within the vc4_txp.Some other changes are done which are a
result of the all the above changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index fef4e4ee47cf..2428807e9714 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -167,7 +167,7 @@ struct vc4_txp {
 	struct platform_device *pdev;
 
 	struct vc4_encoder encoder;
-	struct drm_writeback_connector connector;
+	struct drm_connector connector;
 
 	void __iomem *regs;
 };
@@ -176,7 +176,7 @@ struct vc4_txp {
 	container_of_const(_encoder, struct vc4_txp, encoder.base)
 
 #define connector_to_vc4_txp(_connector)				\
-	container_of_const(_connector, struct vc4_txp, connector.base)
+	container_of_const(_connector, struct vc4_txp, connector)
 
 static const struct debugfs_reg32 txp_regs[] = {
 	VC4_REG32(TXP_DST_PTR),
@@ -356,7 +356,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 
-	drm_writeback_queue_job(&txp->connector, conn_state);
+	drm_writeback_queue_job(&txp->connector.writeback, conn_state);
 
 	drm_dev_exit(idx);
 }
@@ -504,7 +504,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	 */
 	TXP_WRITE(TXP_DST_CTRL, TXP_READ(TXP_DST_CTRL) & ~TXP_EI);
 	vc4_crtc_handle_vblank(vc4_crtc);
-	drm_writeback_signal_completion(&txp->connector, 0);
+	drm_writeback_signal_completion(&txp->connector.writeback, 0);
 
 	return IRQ_HANDLED;
 }
@@ -598,9 +598,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_connector_helper_add(&txp->connector.base,
+	drm_connector_helper_add(&txp->connector,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drmm_writeback_connector_init(drm, &txp->connector,
+	ret = drmm_writeback_connector_init(drm, &txp->connector.writeback,
 					    &vc4_txp_connector_funcs,
 					    encoder,
 					    drm_fmts, ARRAY_SIZE(drm_fmts));
@@ -622,7 +622,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	drm_connector_cleanup(&txp->connector.base);
+	drm_connector_cleanup(&txp->connector);
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.34.1


