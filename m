Return-Path: <linux-renesas-soc+bounces-9322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB698E240
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 20:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA622283821
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 18:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7CD212F13;
	Wed,  2 Oct 2024 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+oVsbec"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1C1D1743;
	Wed,  2 Oct 2024 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727893334; cv=none; b=BnVoEQSUB6ilBhPxp1vHM9FXVmVruXrEnBN2rdwILRnF+OBUD1Y8WJXAJKxP7CC1H7dSgwIH//rye5I4mvTVNN5/Xsjrg7AQyj7uhjp7HNJGI/Zqrex4mv4lx4INt3AgRmW55VBFtPOfHhccIjlptXi7g4VQs8FjgntDlBzK6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727893334; c=relaxed/simple;
	bh=t01JDmHT3zLNfz8gKoJAfjyhjpNElz/ODXlRagJHKXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QoxfiYNG7LiZ6iE4CFrOXz0u7XN6/qaE2es5HqGgrNegeV4+y91Bsd9qXH98Sak45QPQj5zF+cBFn5Diw/BS6YDpR8Njxmkq51/Z3JmPTKf04vVeC/gyKJwj2LhrFaT06wz4s/A4h4Q1q9S+V7pdXN00ynObgaRLC0rMqrA8tsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+oVsbec; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727893333; x=1759429333;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t01JDmHT3zLNfz8gKoJAfjyhjpNElz/ODXlRagJHKXg=;
  b=W+oVsbecELrw+JdrnSLA7fIdfKSBS6h7nz+mm3cR0FPmpJkNkz1eDQfj
   XCDV5iwwetZriklnKQq/EIiWdWcg4MY49PykcreDpdYxeJ+2UthOcZW6a
   86F3pvUNjnK4Z4dsQaIUzPYwDP9M985g5AdyFQmF2r9cWPYjcEi++y9X0
   VBuybdtrofwGDxaEPN8orMo52jhcXzr0bXY0kUDXMAf5i5X1ZsvSwTpa4
   W9c+axJ25Eg+rnF2KLVDGjXGm5moNuSp0ey/+kzp+2NB75wR8TjNW8CKM
   7yMO3kV0AEazTGk12Xs+XLSoqZTUGOs1fhDgZ8tf0bM7zXyp2QipqVrOX
   w==;
X-CSE-ConnectionGUID: 9bcXrjYoSbaCoDVYsohqkg==
X-CSE-MsgGUID: TT0GbwF2S7SCKVKx77NTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26957540"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26957540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 11:22:11 -0700
X-CSE-ConnectionGUID: RuSvj+gXSm+hT8AukyUnKw==
X-CSE-MsgGUID: k8M7o8nlSyG/VQl44AXurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74202322"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 11:22:01 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 02 Oct 2024 21:22:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	amd-gfx@lists.freedesktop.org,
	Andy Yan <andy.yan@rock-chips.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Inki Dae <inki.dae@samsung.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Karol Herbst <kherbst@redhat.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-msm@vger.kernel.orga,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	nouveau@lists.freedesktop.org,
	nouveau@lists.freedesktop.orga,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sandy Huang <hjc@rock-chips.com>,
	Sean Paul <sean@poorly.run>,
	spice-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
Date: Wed,  2 Oct 2024 21:21:58 +0300
Message-ID: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

An attempt to hide the drm_plane/crtc legacy state better.

This also highlights the fact that a lot of supposedly
atomic drivers are poking around in the legacy crtc state,
which is rather questionable. For planes we did force the
legacy state to NULL already to force drivers to behave.
But even then it seems capable of confusing people with
its high profile location directly under drm_plane.

This might end up as some kind of conflict
galore, but the alternative would involve trying
to wean the atomic drivers off one by one,
which would probably take forever. At least with
this the issue becomes visible and shouldn't be
forgotten as easily.

The cc list was getting way out of hand, so I had
to trim it a bit. Hopefully I didn't chop off too
many names...

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.orga
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: nouveau@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.orga
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sean Paul <sean@poorly.run>
Cc: spice-devel@lists.freedesktop.org
Cc: virtualization@lists.linux.dev
Cc: xen-devel@lists.xenproject.org
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>

Ville Syrjälä (2):
  drm: Move plane->{fb,old_fb,crtc} to legacy sub-structure
  drm: Move crtc->{x,y,mode,enabled} to legacy sub-structure

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 20 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 35 ++++----
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 35 ++++----
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 37 ++++-----
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 35 ++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_hw.c               |  2 +-
 drivers/gpu/drm/armada/armada_crtc.c          | 12 ++-
 drivers/gpu/drm/ast/ast_dp.c                  |  8 +-
 drivers/gpu/drm/drm_atomic.c                  |  6 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  8 +-
 drivers/gpu/drm/drm_client_modeset.c          | 10 +--
 drivers/gpu/drm/drm_crtc.c                    | 31 +++----
 drivers/gpu/drm/drm_crtc_helper.c             | 80 ++++++++++---------
 drivers/gpu/drm/drm_fb_helper.c               | 12 +--
 drivers/gpu/drm/drm_framebuffer.c             |  4 +-
 drivers/gpu/drm/drm_plane.c                   | 69 ++++++++--------
 drivers/gpu/drm/drm_plane_helper.c            |  6 +-
 drivers/gpu/drm/drm_vblank.c                  |  2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c    |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  6 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  3 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  6 +-
 drivers/gpu/drm/gma500/gma_display.c          | 22 ++---
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |  2 +-
 drivers/gpu/drm/gma500/psb_intel_display.c    |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  6 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  8 +-
 drivers/gpu/drm/i2c/ch7006_drv.c              |  7 +-
 drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
 .../drm/i915/display/intel_modeset_setup.c    |  4 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 31 ++++---
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  6 +-
 drivers/gpu/drm/meson/meson_overlay.c         |  2 +-
 drivers/gpu/drm/meson/meson_plane.c           |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 18 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       | 25 +++---
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  4 +-
 .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  7 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  6 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        | 28 +++----
 drivers/gpu/drm/radeon/cik.c                  | 12 +--
 drivers/gpu/drm/radeon/evergreen.c            | 16 ++--
 drivers/gpu/drm/radeon/r100.c                 | 16 ++--
 drivers/gpu/drm/radeon/r600_cs.c              |  2 +-
 drivers/gpu/drm/radeon/r600_dpm.c             |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  7 +-
 drivers/gpu/drm/radeon/radeon_cursor.c        | 29 +++----
 drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_display.c       | 26 +++---
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   | 16 ++--
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c            |  2 +-
 drivers/gpu/drm/radeon/rs600.c                | 10 +--
 drivers/gpu/drm/radeon/rs690.c                | 22 ++---
 drivers/gpu/drm/radeon/rs780_dpm.c            |  6 +-
 drivers/gpu/drm/radeon/rv515.c                | 30 +++----
 drivers/gpu/drm/radeon/rv770.c                |  2 +-
 drivers/gpu/drm/radeon/si.c                   | 14 ++--
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  6 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  4 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c               |  6 +-
 drivers/gpu/drm/sti/sti_vid.c                 |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          | 10 +--
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  4 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  4 +-
 drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           | 18 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  9 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
 include/drm/drm_crtc.h                        | 75 ++++++++---------
 include/drm/drm_plane.h                       | 52 ++++++------
 100 files changed, 599 insertions(+), 547 deletions(-)

-- 
2.45.2


