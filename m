Return-Path: <linux-renesas-soc+bounces-22734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A6BC0414
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 07:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9ED13C575D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 05:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7989E21CA00;
	Tue,  7 Oct 2025 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTGCqIic"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1D31DB154;
	Tue,  7 Oct 2025 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815999; cv=none; b=mbfBfEJsNnkfQauUProN+HxXtTwopKvcWF7GJJPwiCn5YZabHhq4wuqNtUP0ThceEZO2hqvX3dMh3Ba5OcKim5guxVqC0Sl5j028u+JRariu88SKjbbXnduZHkn9YTNi3wtTgwvv7/aeq9WsmQ0jJ5wp1ZaRe/9arFJJZ5FZuvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815999; c=relaxed/simple;
	bh=sfdHKHKE8aJQSbt6YTQHJT6N3AnLF3LOg9V21AwRg5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PV2wsbm8kBIuajoKjR/w/dmZDWdnNwN7GFsvd04iPCE75M1fdTpAmj5UZJidhTzTZXjHzlcUOMzizBEgN5sRAoHxnWWx+PhdBA3uf8ZIgFHaEI4h8PDRnr8ga7ckvjZxjPzNDBS85mmDAoz03HffPKITL5Zp7ywjpW8Ny/O/ofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTGCqIic; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759815998; x=1791351998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfdHKHKE8aJQSbt6YTQHJT6N3AnLF3LOg9V21AwRg5k=;
  b=hTGCqIic8BDUqyp+0xWuJhyivuSaekzcu+b2NNb9diSRG1n3VsqDAWFM
   cv3HRzNs2qQ5NCU97o7BGaECt+qwLnmiJ/DucDgFbjwiNyf1ofQO6TY0c
   Q3qATBGB0DYiiSsf7P2+QSpQuVz6+WBTy6iI/V74GdMccvfZEe0QWNChF
   6ggYH08oLw+KLzSRDviP07k+57C3zC2dgmuRqGm6tH/c4RZhzzAkWDtxA
   hHXuh9ioCCuEOeAhsWKrqoiGjsVfv7EeRJPna7Zri5r28HE3xPSoN0ZQC
   SCX2Llald2gaLPpZMgzJGX9jbip+sJVqL4Ti7J1HtWf9gSYXwmsP79dHm
   w==;
X-CSE-ConnectionGUID: qxQJy0LGTvODxB/PKt2nrQ==
X-CSE-MsgGUID: 77ghZzxbQ5SB7S1PgXw5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61027991"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="61027991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 22:46:37 -0700
X-CSE-ConnectionGUID: Q3Zmr/y+RXKKOK6p/BWrpg==
X-CSE-MsgGUID: b1Xg8XO1Qw6eHyzu8W7GWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="180479480"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2025 22:46:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	kernel-list@raspberrypi.com,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	ankit.k.nautiyal@intel.com,
	arun.r.murthy@intel.com,
	uma.shankar@intel.com,
	jani.nikula@intel.com,
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
Subject: [PATCH v2 5/7] drm: writeback: Modify params for drm_writeback_get_out_fence
Date: Tue,  7 Oct 2025 11:15:27 +0530
Message-Id: <20251007054528.2900905-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007054528.2900905-1-suraj.kandpal@intel.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use drm_connector instead of drm_writeback_connector since it now
resides within drm_connector and also helps make sure
drm_wrtieback_connector is being modified mostly by drm core
provided helpers.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
V1 -> V2: Use &connector->writeback (Dmitry)
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 +---
 drivers/gpu/drm/drm_writeback.c   | 6 +++---
 include/drm/drm_writeback.h       | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a102738a8733..c38dfc61fb88 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1271,7 +1271,6 @@ static int prepare_signaling(struct drm_device *dev,
 	}
 
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
-		struct drm_writeback_connector *wb_conn;
 		struct drm_out_fence_state *f;
 		struct dma_fence *fence;
 		s32 __user *fence_ptr;
@@ -1293,8 +1292,7 @@ static int prepare_signaling(struct drm_device *dev,
 		f[*num_fences].out_fence_ptr = fence_ptr;
 		*fence_state = f;
 
-		wb_conn = &conn->writeback;
-		fence = drm_writeback_get_out_fence(wb_conn);
+		fence = drm_writeback_get_out_fence(conn);
 		if (!fence)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index da7be54f5b13..da2acb932ac0 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -529,11 +529,11 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_writeback_signal_completion);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
+drm_writeback_get_out_fence(struct drm_connector *connector)
 {
 	struct dma_fence *fence;
-	struct drm_connector *connector =
-		drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector =
+		&connector->writeback;
 
 	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 5e8ab51c2da4..2afa48ea7c00 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -104,5 +104,5 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 				int status);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector);
+drm_writeback_get_out_fence(struct drm_connector *connector);
 #endif
-- 
2.34.1


