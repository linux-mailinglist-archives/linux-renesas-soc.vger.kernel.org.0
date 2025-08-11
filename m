Return-Path: <linux-renesas-soc+bounces-20207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C523AB20371
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64B4189C6CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D5A2DE6FE;
	Mon, 11 Aug 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQeKudt9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A052DCF6B;
	Mon, 11 Aug 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904478; cv=none; b=Vhgd3ju/859Bdrwj2hmRCR+nSeittbc6SUdGN6S9GWasVZvH3qLp9OaBS/bqlGaPg7L2pWB/KiVbqoyHUn9Wlh79RiMs8o2iCyWDPYAqKesCz8JR512r4Rz9+1dbOIR40jiNVXw2ihl1n97gMajmjTeMSsWG3lb4n3sAEu3kEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904478; c=relaxed/simple;
	bh=G1V8plHg1BJ8oXiT7TSBNCbbRE6SOMQJZJHiO6f/pko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Alkpn8mOdyQWyzhIBFlGLZ+kmkrWI4BI5MZzZhFSVmbYqv4gjcSpeoZsQQrE880tnwnm7X5T9WvqaC1OvZdl2Ic4aCMd33uZXEAQ+4ywFd3vavJQEtcEGQrxASqYfC0/gS+583IMh3EQchOBemtA+dKxbpeumANgdpPGCLBnBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQeKudt9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904477; x=1786440477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1V8plHg1BJ8oXiT7TSBNCbbRE6SOMQJZJHiO6f/pko=;
  b=nQeKudt9YixOkR65YoN5VK7haU7XJMiGkPKeCsNuaqqcd3TYS8AruVZh
   lIG+0s23iJ3f9RCwsdwzQFITsJqX0vNjcvSsA/LBcs2GPmADTzXmKxesy
   5wplEVki7GFfW18UX5UL9YrOYpCTzinVJF2dnEFoDYhMbeDBjWEguB5bB
   +dUHbmInxcw52xo3sAueLC9jBBPUNmJHmKb0owmrKDDpvq5zzxcEiwFAq
   H/zKQthfq/tLkoe8zWILkE1snfD2+f6L3ORTEAiTVHjYTwbQYmriwqS1+
   wRAULO69Qwf6wqLg3A6HrV9R4X7B9WuDL3R4vWMez/udf1dkE0ghrKQBQ
   w==;
X-CSE-ConnectionGUID: FvtcOvbvT1Gxj9i5buFplw==
X-CSE-MsgGUID: CH8ZAObATFScdnSdu7mAAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57217949"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57217949"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:27:56 -0700
X-CSE-ConnectionGUID: iH4II6ZZRcmahcl0VlfUxA==
X-CSE-MsgGUID: Lt1mzx4cSZuWJ6bP8ZadDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860329"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:27:47 -0700
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
Subject: [RFC PATCH 2/8] drm/amd/display: Adapt amd writeback to new drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:01 +0530
Message-Id: <20250811092707.3986802-3-suraj.kandpal@intel.com>
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
adapt the amd writeback functionality to this changes. This includes
changing the drm_writeback_connector to be changed to drm_connector
within the amdgpu_dm_wb_connector. Some other changes are done which
are a result of the all the above changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 4 +---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h    | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 8 ++++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5e260b275082..d4628dadf55a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6915,11 +6915,9 @@ create_stream_for_sink(struct drm_connector *connector,
 		aconnector = to_amdgpu_dm_connector(connector);
 		link = aconnector->dc_link;
 	} else {
-		struct drm_writeback_connector *wbcon = NULL;
 		struct amdgpu_dm_wb_connector *dm_wbcon = NULL;
 
-		wbcon = drm_connector_to_writeback(connector);
-		dm_wbcon = to_amdgpu_dm_wb_connector(wbcon);
+		dm_wbcon = to_amdgpu_dm_wb_connector(connector);
 		link = dm_wbcon->link;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b937da0a4e4a..dbcdc8595e76 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -809,7 +809,7 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 #define to_amdgpu_dm_connector(x) container_of(x, struct amdgpu_dm_connector, base)
 
 struct amdgpu_dm_wb_connector {
-	struct drm_writeback_connector base;
+	struct drm_connector base;
 	struct dc_link *link;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 80c37487ca77..8fea29720989 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -202,9 +202,9 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	wbcon->link = link;
 
-	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
+	drm_connector_helper_add(&wbcon->base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base.writeback,
 					    &amdgpu_dm_wb_connector_funcs,
 					    encoder,
 					    amdgpu_dm_wb_formats,
@@ -216,8 +216,8 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	 * Some of the properties below require access to state, like bpc.
 	 * Allocate some default initial connector state with our reset helper.
 	 */
-	if (wbcon->base.base.funcs->reset)
-		wbcon->base.base.funcs->reset(&wbcon->base.base);
+	if (wbcon->base.funcs->reset)
+		wbcon->base.funcs->reset(&wbcon->base);
 
 	return 0;
 }
-- 
2.34.1


