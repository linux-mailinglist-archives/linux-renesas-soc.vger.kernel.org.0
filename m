Return-Path: <linux-renesas-soc+bounces-20205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3BB2035F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333EF3BB501
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC0E2DE6F6;
	Mon, 11 Aug 2025 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTYs4AVA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5572DCF6B;
	Mon, 11 Aug 2025 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904460; cv=none; b=KkDgJ11OeGjnQfviKUfDBPkghDKD4EWydOyBl00AtMpWgE6KM57Xh2nckadxNoxex64ovffy3vf5rR8D2o2C4Ptk0/nArXIlEnmKo4lopNLuznVwWH1imKeLvLLG0rZh4wGx73MHpkZTfJ3KhwnjhtizsKIHgi+c1OMTKlX7aos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904460; c=relaxed/simple;
	bh=Z1SyJgR0AtiZ9X/pQ4mumLbUzdXK/ttulk6jcc2Jf54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J9wdy+J4fbIeViBHZ76hn6S8CSXuDzh18WuVS83nbsx4Vi+bazLMPfcVXKxeFUlAxLyEyWbAhk8wVEl98c2K+Af7rAB9yR9PqLLJsBlp0TInD7oCXpDBuRdTX7yM58U9jVgruRO72s43Xuersped1G31zQ53CtEl46skupA0Fdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTYs4AVA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904459; x=1786440459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z1SyJgR0AtiZ9X/pQ4mumLbUzdXK/ttulk6jcc2Jf54=;
  b=QTYs4AVADOtn/MIm3dsnDhq7DOTTmmqdriFuY2C2/bLQEes7lXHJVw8c
   fe1AvXHaLRYRkFKmj5lKD29Pmv4X3SpRC/Pk6B5QwNx6M+qXkMtB08miU
   w8tdEvBXVPyycLUUkj0W3IiOEbqCDw8ma91w8os7nnsUR8EAzS7hRKE6i
   5f/5zSK0gh7KoyZcVhn9wm8jB9l8w9E3F94zbayAfgZmqb5rxj80szUVx
   i//1Cl8djkX1UvAPk+X/KGkkYwekCsLR/cJ8HXZuEPZEmG8fHXlRI44S7
   Mf6mL1OvIKj7g6bD4ZOqUrI0wvmDMHP3YAaMFmwzGLTOiLm29O/zXQmRT
   Q==;
X-CSE-ConnectionGUID: aSTu1ZFIRzGCMwif8zi26Q==
X-CSE-MsgGUID: r3pjT1lPTK27YS0KvK5CUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57217883"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57217883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:27:37 -0700
X-CSE-ConnectionGUID: TAeCBx1TT56ATbcgaIbc3w==
X-CSE-MsgGUID: zYc+WjGwQ3yJQu9skQVhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165860258"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:27:28 -0700
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
Subject: [RFC PATCH 0/8] Refactor drm_writeback_connector structure
Date: Mon, 11 Aug 2025 14:56:59 +0530
Message-Id: <20250811092707.3986802-1-suraj.kandpal@intel.com>
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
This series intends to solve it by moving the drm_writeback_connector
within the drm_connector and remove the drm_connector base which was in
drm_writeback_connector. A Proposal suggested by Dmitry.
We want to get an Ack from all drivers whom are affected by these
changes.
 We do all other required modifications that come with these changes
along with addition of new function which returns the drm_connector when
drm_writeback_connector is present.
All drivers will be expected to allocate the drm_connector.
This discussion was tiggered from [1] and sits on top of Dmitry's series
see [2].

[1] https://patchwork.freedesktop.org/series/152106/
[2] https://patchwork.freedesktop.org/series/152420/

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (8):
  drm: writeback: Refactor drm_writeback_connector structure
  drm/amd/display: Adapt amd writeback to new drm_writeback_connector
  drm/arm/komeda: Adapt komeda writeback to new drm_writeback_connector
  drm/arm/mali: Adapt mali writeback to new drm_writeback_connector
  drm/vc4: Adapt vc4 writeback to new drm_writeback_connector
  drm/vkms: Adapt vkms writeback to new drm_writeback_connector
  drm/rcar_du: Adapt vkms writeback to new drm_writeback_connector
  drm/msm/dpu: Adapt dpu writeback to new drm_writeback_connector

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  6 +-
 drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++---
 drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
 drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 15 ++--
 include/drm/drm_connector.h                   | 60 ++++++++++++++++
 include/drm/drm_writeback.h                   | 68 ++-----------------
 20 files changed, 155 insertions(+), 130 deletions(-)

-- 
2.34.1


