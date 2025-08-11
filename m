Return-Path: <linux-renesas-soc+bounces-20213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD5B203A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 308701894B9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13EA2DEA8D;
	Mon, 11 Aug 2025 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2xTZUcS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8062DCF71;
	Mon, 11 Aug 2025 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904537; cv=none; b=iZTYfQKCurrVjhrFbPcZpt9r0gdiV2liBanVQV1ZMVbzFusV82i3kVBxRq8UqD9IBtKnnqHpNcUqiO7mt9AfmEGxHJuR8mTqhqO7VRMI2cNwEB1WyFvhEijOEgFgEQt5kQNCBFdsqAQCtmBELfmvCdeYOoeHpwvqegIUAbl3F/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904537; c=relaxed/simple;
	bh=E9jJ7k+W5lYtaJfmW3MRFOz2vsWiO/oCqhsJwrE+o9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aKYZt4dD8/h9yH3ajNKvizC+ZIA+5308NXqfxarI+uEz0vULIt3HrhoBJNN7wD/0UEcPzcSjw+TJEftnG2CGe1O6hoMyeMS/QTSVZtYQ9sbKZhkS76eIBM3RJhqme71li0u8YXIkd4mioCAHnBoBWbB9y35/dATa4UQWYzZ9sko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2xTZUcS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904536; x=1786440536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E9jJ7k+W5lYtaJfmW3MRFOz2vsWiO/oCqhsJwrE+o9M=;
  b=B2xTZUcSZKwx/tXHdwqUXxioizTh8SU2ztg9jLg6m03rm0fhMlox6XxX
   WG+sN6rBZWjfKDBpOhu/NAVvi1O0jChxfRGOJhH5uKbKUtb4dH9I1fYYs
   MVUgfkEP+8gL1ejUbQqp7sH7Kh/mnFgA5Y7Gy8tL2i0XHrJWJ0PYYHDYW
   oZh7ELiwB/+4r/S6wrqV9aNWo2kB/AKW+iVFm1oA2VX/7O1B9fLKT9Aw4
   iaiSTYW+Fzb/WkE5clMUn/dj9grMNaA2pCx5tXH9e4f3071eqnytGXaTH
   DS8rmaMIdk49M25zvq+c3UOs6sY4rmn2WmnH/eNazCG7IOo+n+KqH+jLY
   g==;
X-CSE-ConnectionGUID: LN+O7PGzTZOEKy2BYj1X9A==
X-CSE-MsgGUID: Mq9sXuYHRuSBBnQT5ckHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218148"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57218148"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:28:54 -0700
X-CSE-ConnectionGUID: m++gpaQhTSyyfUEMSVtS4g==
X-CSE-MsgGUID: jzzzCi5SRLaGogjsG3FvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860518"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:45 -0700
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
Subject: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:07 +0530
Message-Id: <20250811092707.3986802-9-suraj.kandpal@intel.com>
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
adapt the dpu writeback functionality to this changes. This
includes changing the drm_writeback_connector to be changed to
drm_connector within the dpu_wb_connector.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 56a5b596554d..0e60c1ac07c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
 		return;
 	}
 
-	drm_conn = &wb_enc->wb_conn->base;
+	drm_conn =
+		container_of(wb_enc->wb_conn, struct drm_connector, writeback);
 	state = drm_conn->state;
 
 	if (wb_enc->wb_conn && wb_enc->wb_job)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index cd73468e369a..49412d2ed9aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -28,8 +28,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
-	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
-	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_crtc *crtc;
@@ -84,10 +83,11 @@ static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
+static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *wb_conn,
 		struct drm_writeback_job *job)
 {
-
+	struct drm_connector *connector =
+		container_of(wb_conn, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
@@ -98,9 +98,11 @@ static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
 	return 0;
 }
 
-static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *wb_connector,
 		struct drm_writeback_job *job)
 {
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
@@ -128,9 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	dpu_wb_conn->maxlinewidth = maxlinewidth;
 
-	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
+	drm_connector_helper_add(&dpu_wb_conn->base, &dpu_wb_conn_helper_funcs);
 
-	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base.writeback,
 					   &dpu_wb_conn_funcs, enc,
 					   format_list, num_formats);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 4b11cca8014c..9ebf15392b20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -16,12 +16,12 @@
 #include "dpu_encoder_phys.h"
 
 struct dpu_wb_connector {
-	struct drm_writeback_connector base;
+	struct drm_connector base;
 	struct drm_encoder *wb_enc;
 	u32 maxlinewidth;
 };
 
-static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
+static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_connector *conn)
 {
 	return container_of(conn, struct dpu_wb_connector, base);
 }
-- 
2.34.1


