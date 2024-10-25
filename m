Return-Path: <linux-renesas-soc+bounces-10125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F869AFB5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 09:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74DE21F23D45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 07:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE70418D64C;
	Fri, 25 Oct 2024 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKODa1Oi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2450285;
	Fri, 25 Oct 2024 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729842397; cv=none; b=ExDrFlpcQoJzNTPlkAnAX1YandoLPlDOcRlXicyJqUq1cAcJbPp4gM18E+xCgiW63ColzdzvLFehwxoALiZHLEv2iwM1EcAURwNcO6g64Lgm7rgxnm8vFvja98Ymv569VTELNCbpdEZGWZlF7IHBaJy0EadHX6gKTKQovlwFR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729842397; c=relaxed/simple;
	bh=Mzm/p9vp/1SxZYyxLUIAr3dK4m/QwRpy+mAy/vi+65A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvQuiRl/yZ12tVk1FDOhPsWdR1sClBiHzYunkcku3lhwZ+QlLUCLsyA5ykbdvIERCkM35tgzICzOcjq0ZKvvGaZqO0nqoVbSRoB9Qiquryqex/bpV2pHX4lEiSoba1r/A9+KgucnwwhnxiC05JWODSBUmIjy6Zi7MraBme82E2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKODa1Oi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729842395; x=1761378395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mzm/p9vp/1SxZYyxLUIAr3dK4m/QwRpy+mAy/vi+65A=;
  b=hKODa1Oi5vnZpADZqmlQaefcdi4vzZxWqD+KdBeJYCBVsDcc9z5bVBrx
   lm0lQByCRG/2WmaomLavVr3Uy72f8gUOLPfkCR73YMQ6OsoQFghTwJgCz
   LYBGCKFT5ac+rMubDD1v31DXUN2pFM9mLepSd2JEofG4qYWQw+mrzFram
   zpqKIP++x788gBHqpLPqcNb26SUA1pf2nK0L3y9KdwGcm5vZbhZDRlJW5
   H2vbldL1Q4Hqof/r5TaIALk8zX0SoZQk9FVje8pbXnrZ2l1EBvwQ1ljcm
   8ANB+a6Z92kWkHrCmaMH6vUSBZESOOgqsuGLpAEf2Ug6WJvU+9EXY8MDJ
   w==;
X-CSE-ConnectionGUID: rf6+BqFvQTKraflgJfbMyw==
X-CSE-MsgGUID: /kUl4867SPuoVlhw0NPF1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29446863"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29446863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 00:46:34 -0700
X-CSE-ConnectionGUID: 4NLKVHg9T6yFez9/u+3hfQ==
X-CSE-MsgGUID: 8E8OB6zhRpuvXvELpRP+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80948136"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 25 Oct 2024 00:46:24 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 25 Oct 2024 10:46:23 +0300
Date: Fri, 25 Oct 2024 10:46:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Karol Herbst <kherbst@redhat.com>,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-msm@vger.kernel.orga, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	nouveau@lists.freedesktop.org, nouveau@lists.freedesktop.orga,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
Message-ID: <ZxtMz8JP3DbzpMew@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment

On Wed, Oct 02, 2024 at 09:21:58PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> An attempt to hide the drm_plane/crtc legacy state better.
> 
> This also highlights the fact that a lot of supposedly
> atomic drivers are poking around in the legacy crtc state,
> which is rather questionable. For planes we did force the
> legacy state to NULL already to force drivers to behave.
> But even then it seems capable of confusing people with
> its high profile location directly under drm_plane.
> 
> This might end up as some kind of conflict
> galore, but the alternative would involve trying
> to wean the atomic drivers off one by one,
> which would probably take forever. At least with
> this the issue becomes visible and shouldn't be
> forgotten as easily.

Ping, anyone have thoughts on this? I'd like to get something
like this in at some point to make the legacy state (ab)users
easily visible...

> 
> The cc list was getting way out of hand, so I had
> to trim it a bit. Hopefully I didn't chop off too
> many names...
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: freedreno@lists.freedesktop.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.orga
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: "Maíra Canal" <mairacanal@riseup.net>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: nouveau@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.orga
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: spice-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux.dev
> Cc: xen-devel@lists.xenproject.org
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> 
> Ville Syrjälä (2):
>   drm: Move plane->{fb,old_fb,crtc} to legacy sub-structure
>   drm: Move crtc->{x,y,mode,enabled} to legacy sub-structure
> 
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 20 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 35 ++++----
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 35 ++++----
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 37 ++++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 35 ++++----
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  |  4 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  2 +-
>  drivers/gpu/drm/armada/armada_crtc.c          | 12 ++-
>  drivers/gpu/drm/ast/ast_dp.c                  |  8 +-
>  drivers/gpu/drm/drm_atomic.c                  |  6 +-
>  drivers/gpu/drm/drm_atomic_helper.c           |  8 +-
>  drivers/gpu/drm/drm_client_modeset.c          | 10 +--
>  drivers/gpu/drm/drm_crtc.c                    | 31 +++----
>  drivers/gpu/drm/drm_crtc_helper.c             | 80 ++++++++++---------
>  drivers/gpu/drm/drm_fb_helper.c               | 12 +--
>  drivers/gpu/drm/drm_framebuffer.c             |  4 +-
>  drivers/gpu/drm/drm_plane.c                   | 69 ++++++++--------
>  drivers/gpu/drm/drm_plane_helper.c            |  6 +-
>  drivers/gpu/drm/drm_vblank.c                  |  2 +-
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 +-
>  drivers/gpu/drm/gma500/cdv_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c         |  6 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  3 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  6 +-
>  drivers/gpu/drm/gma500/gma_display.c          | 22 ++---
>  drivers/gpu/drm/gma500/oaktrail_crtc.c        |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c       |  6 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  8 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c              |  7 +-
>  drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
>  .../drm/i915/display/intel_modeset_setup.c    |  4 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 31 ++++---
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  6 +-
>  drivers/gpu/drm/meson/meson_overlay.c         |  2 +-
>  drivers/gpu/drm/meson/meson_plane.c           |  8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 18 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       | 25 +++---
>  drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |  4 +-
>  .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  7 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  6 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        | 28 +++----
>  drivers/gpu/drm/radeon/cik.c                  | 12 +--
>  drivers/gpu/drm/radeon/evergreen.c            | 16 ++--
>  drivers/gpu/drm/radeon/r100.c                 | 16 ++--
>  drivers/gpu/drm/radeon/r600_cs.c              |  2 +-
>  drivers/gpu/drm/radeon/r600_dpm.c             |  4 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c    |  7 +-
>  drivers/gpu/drm/radeon/radeon_cursor.c        | 29 +++----
>  drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
>  drivers/gpu/drm/radeon/radeon_display.c       | 26 +++---
>  drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c   | 16 ++--
>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  2 +-
>  drivers/gpu/drm/radeon/radeon_pm.c            |  2 +-
>  drivers/gpu/drm/radeon/rs600.c                | 10 +--
>  drivers/gpu/drm/radeon/rs690.c                | 22 ++---
>  drivers/gpu/drm/radeon/rs780_dpm.c            |  6 +-
>  drivers/gpu/drm/radeon/rv515.c                | 30 +++----
>  drivers/gpu/drm/radeon/rv770.c                |  2 +-
>  drivers/gpu/drm/radeon/si.c                   | 14 ++--
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  2 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  6 +-
>  drivers/gpu/drm/sti/sti_crtc.c                |  4 +-
>  drivers/gpu/drm/sti/sti_cursor.c              |  2 +-
>  drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
>  drivers/gpu/drm/sti/sti_tvout.c               |  6 +-
>  drivers/gpu/drm/sti/sti_vid.c                 |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          | 10 +--
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_plane.c               |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  4 +-
>  drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           | 18 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  9 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
>  include/drm/drm_crtc.h                        | 75 ++++++++---------
>  include/drm/drm_plane.h                       | 52 ++++++------
>  100 files changed, 599 insertions(+), 547 deletions(-)
> 
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel

