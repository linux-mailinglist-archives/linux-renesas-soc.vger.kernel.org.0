Return-Path: <linux-renesas-soc+bounces-20209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83184B2038B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 222117A3C94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAED92DEA98;
	Mon, 11 Aug 2025 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZWXQ4Qi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A962DCBFA;
	Mon, 11 Aug 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904497; cv=none; b=TOFsFxu+6VGU8ezdJzGoWykW2lipTeVscQd53nZJ7IAMu5mGKqQFjM6CMNRUptOO739aHMOMK6nV7tcrAtVcP+VT9gGjtNGMDuWWsNPtbdoIpH5bgJaHUqlnmsAC4cnzeS3i7c/FotyALBLQ3RmKbDMS/DTOdkrxiThbZmkLmCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904497; c=relaxed/simple;
	bh=sW0pbZhGyqJzRb3QXiwmUWJrqEuoCn6D3catOoa/X04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rXjFdM1gZmWSPqhETMAT5rhZz9gR3RzkYqL5h2u3zo+MAKdMYWQ2VVEcw3jX0EgGJv+uhAYUg8j3sMWws+u9MvRmCSHDzygIuuy9mxRdNKMAIw3563H7zi9E85ySyBjw4cOZuqGL08AnnBzcLZgtM54LiWoXKi2UYez6LxLYeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZWXQ4Qi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904496; x=1786440496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sW0pbZhGyqJzRb3QXiwmUWJrqEuoCn6D3catOoa/X04=;
  b=lZWXQ4QiZSVFt0iCUy5XNvO+Kl1Hf811YQ05JBRd2FQt7q8TlZOvkGaz
   S5ZoVzp2lDs0SPoABKh9OMOlP93CIHglLyzon6gb8iW7lCRVlbLhnFXIB
   nqVqNtIPzGyLeI67hJD/CK6Dlh5kXnahIoqdzvyRI2OVBEl9KrBBO2vnB
   uyZGXyLqqoxZEY8oTC+2JLSYXvkn/76BYnwCRNaccp+ngG8e3cfpUcNE/
   dQsI1xEdJL0FdPfv+fo1q1Wj/gCIGfuu0EpjHKIhkBbOOvQacJOu95yJf
   nzKKZbT3bRgNGSiteOFcjUgw2sQqcLEI60DERUfNh43on49AoNXrcQYkg
   Q==;
X-CSE-ConnectionGUID: tt92eoOAQeycNe5WTMXuqQ==
X-CSE-MsgGUID: gcJTLGnIQfS8LgFLLIn/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218013"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57218013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:28:15 -0700
X-CSE-ConnectionGUID: RTCPYg1MRleznPeX5+DalQ==
X-CSE-MsgGUID: yec1/0yPTzamL7fLQ6/Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860395"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:06 -0700
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
Subject: [RFC PATCH 4/8] drm/arm/mali: Adapt mali writeback to new drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:03 +0530
Message-Id: <20250811092707.3986802-5-suraj.kandpal@intel.com>
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
adapt the malidp writeback functionality to this changes. This includes
changing the drm_writeback_connector to be changed to drm_connector
within the malidp_drm.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/arm/malidp_drv.h | 2 +-
 drivers/gpu/drm/arm/malidp_mw.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index bc0387876dea..cc6d21aa5544 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -32,7 +32,7 @@ struct malidp_drm {
 	struct drm_device base;
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
-	struct drm_writeback_connector mw_connector;
+	struct drm_connector connector;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
 	atomic_t config_valid;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 182275c0c29c..67fcdc7b3669 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -212,7 +212,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!malidp->dev->hw->enable_memwrite)
 		return 0;
 
-	drm_connector_helper_add(&malidp->mw_connector.base,
+	drm_connector_helper_add(&malidp->connector,
 				 &malidp_mw_connector_helper_funcs);
 
 	formats = get_writeback_formats(malidp, &n_formats);
@@ -228,7 +228,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
 
-	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+	ret = drmm_writeback_connector_init(drm, &malidp->connector.writeback,
 					    &malidp_mw_connector_funcs,
 					    encoder,
 					    formats, n_formats);
@@ -243,7 +243,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
 			     struct drm_atomic_state *old_state)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
-	struct drm_writeback_connector *mw_conn = &malidp->mw_connector;
+	struct drm_writeback_connector *mw_conn = &malidp->connector.writeback;
 	struct drm_connector_state *conn_state = mw_conn->base.state;
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct malidp_mw_connector_state *mw_state;
-- 
2.34.1


