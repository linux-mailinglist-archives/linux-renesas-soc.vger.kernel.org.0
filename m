Return-Path: <linux-renesas-soc+bounces-22729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928BBC0380
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 07:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 086BD4E90E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 05:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244D41922FB;
	Tue,  7 Oct 2025 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGMf02Dz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A71C84BB;
	Tue,  7 Oct 2025 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815953; cv=none; b=OOgHSqbY2RAb7UdVaveulokx9QGp33LxoXzuSjxBwjVK6dI7awxlUC5nJL8R8iRGavp+6SIDIHUgmpSVNk2lSy19H0UKossJzIqZZ3cwGDc6eA4Ejb/mpRf4hJjQeaWRraihkG5GZ1FjUE3zngg1O/81OmKNy7OL1sY6hh/p99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815953; c=relaxed/simple;
	bh=aRM3qd+6F6N7GpoYtfIBeQSbvfWgtoGFVl5Adw4VJro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTVvwUvWXGSlN+lB9ck96FmnG55FudO4VV7H54kchJ1Jb+RkL3OhVGL7mEcxrmAJFZ8kOmsQSsHb/ZSuz/XT04mWr7YRlnrJ8VjO+mp6b06qNlhm/EJI8uEBDX9/70m7lmPumFrVamglBZ392IupkMUYbMYwj1uMiJU34H0Iwq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGMf02Dz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759815951; x=1791351951;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aRM3qd+6F6N7GpoYtfIBeQSbvfWgtoGFVl5Adw4VJro=;
  b=JGMf02DzGMSOeno+Ub/QUkKAXwM9RTbpncd+q1dsAieXtXqsvYvL68/Q
   RWodZ9NdH3HdagXEiMRGIBkVmQBp5Fr0q9Mus3CLxiuq1iySWl/Nhvkjo
   +lTemLxX9SmlrLjU/YS0BEGd/hRQBlijCqMddzITGSEKzV3r1/he/w3vU
   lnokvGQXkdJDUBcrbEbKWonLL7XDhqKhlJ+WykF+kybttKo5lyI3xg2cQ
   atWr4xEPoj9Sq8v882wyGms0mFD/+RqnDAfxOZdNjB6AqdrtsRgMUG3FD
   4+nXKv2CXr/No6w66RlwZCQ9EX4vS8AJoMksAC0gTHbuzmzd5pvJk1EIW
   A==;
X-CSE-ConnectionGUID: pqg0UwaySSefMrR/W/0W5g==
X-CSE-MsgGUID: AUokCAk1QNWiT5LJ8BbOGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61027898"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="61027898"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 22:45:50 -0700
X-CSE-ConnectionGUID: yVoRrmGNR8Sx0wUO6LVKnw==
X-CSE-MsgGUID: /dgv+ZRHR/COnS6B1I5Jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="180479325"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2025 22:45:41 -0700
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
Subject: [PATCH v2 0/7] Refactor drm_writeback_connector structure
Date: Tue,  7 Oct 2025 11:15:22 +0530
Message-Id: <20251007054528.2900905-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some drivers cannot work with the current design where the connector
is embedded within the drm_writeback_connector such as intel and
some drivers that can get it working end up adding a lot of checks
all around the code to check if it's a writeback conenctor or not.
This is due to the inheritance limitation in C.
This series intends to solve it by moving the drm_writeback_connector
within the drm_connector and remove the drm_connector base which was in
drm_writeback_connector. This is done in union with hdmi connector
within drm_connector to save memory and since drm_connector cannot be
both hdmi and writeback it serves is well.
A RFC version was floated and discussion had taken place at [1] which
kicked of this more cleaner series. 
We do all other required modifications that come with these changes
along with addition of new function which returns the drm_connector when
drm_writeback_connector is present.
This series also contains some writeback API cleanups as a consequence
of writeback connector moving into drm_connector
All drivers will be expected to allocate the drm_connector.
This discussion was tiggered from [2] and sits on top of Dmitry's series
see [3].

[1] https://patchwork.freedesktop.org/series/152758/
[2] https://patchwork.freedesktop.org/series/152106/
[3] https://patchwork.freedesktop.org/series/152420/

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (7):
  drm: writeback: Refactor drm_writeback_connector structure
  drm: writeback: Modify writeback init helpers
  drm: writeback: Modify drm_writeback_queue_job params
  drm: writeback: Modify drm_writeback_signal_completion param
  drm: writeback: Modify params for drm_writeback_get_out_fence
  drm/connector: Modify prepare_writeback_job helper
  drm/connector: Modify cleanup_writeback_job helper

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  | 12 +--
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  | 11 +--
 drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +-
 drivers/gpu/drm/drm_writeback.c               | 51 ++++++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 12 ++-
 drivers/gpu/drm/vc4/vc4_txp.c                 |  8 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 15 ++--
 include/drm/drm_connector.h                   | 69 ++++++++++++++++-
 include/drm/drm_modeset_helper_vtables.h      |  4 +-
 include/drm/drm_writeback.h                   | 76 ++-----------------
 22 files changed, 162 insertions(+), 160 deletions(-)

-- 
2.34.1


