Return-Path: <linux-renesas-soc+bounces-9348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31A98F0BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 15:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D612810E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356C01991AC;
	Thu,  3 Oct 2024 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoSJx8J+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB1154C12;
	Thu,  3 Oct 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727963218; cv=none; b=SzbBORq/g6ERzdxpxYL4IBsnagAkqBb8tgOlOnTRZIQO3nvYACpkata0qR5g9MPqng+K4QN75KIHKKEJm4N1uX8SIlb/zobT43J5C+GBEY+gqmnMZ5BDOVIkCEdcsF/HXzIK6bplwC7fmBY4v1N8FAU6s19cm8E1ZSoRr8OFXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727963218; c=relaxed/simple;
	bh=n5OHn3QUdpat2aC/O/iKVjfoE6iGTaPoN/6J8frtUYg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlZYBYD33wx0FCf3hpmQraHMEP6XkMalZg/xHehRLPvOmhWWOg3hQei+Ef3xjzlvzn1Y1pWnRCnbhDMhSU03y4YGbbM68UKhKPfm+ZGCkAPWoNaaOI+nqdxfGL0pJu7kh0badvv47y41FQyqUYiE9vhWoBV0UUhsUiREPvzWP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoSJx8J+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727963217; x=1759499217;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=n5OHn3QUdpat2aC/O/iKVjfoE6iGTaPoN/6J8frtUYg=;
  b=YoSJx8J+nOAGpupUZE+M60XfDzYhATyBDvLh1Pyt7oWYpE7QcdXGuwzz
   FLhuhYWSxZ1RGCaVw9uOQnYJ6qPpA+QUo6zvwzn8pMShC/OpcqiHsCbuT
   CfNXnZbq9kjilvnWBNfJD9oiWUO+LkDipWrN95v08e+Ji9T7OKabsytCt
   RG/PXL+y71c7SUWfkZvUlGHLDvWTn5c1URim4E0rKm0ne8hbIpQfn6Bda
   g8WxF4JZUD9Kgl7Xs30/ew7IP+YdudA3aVD+lBBy0hlJxSbFlDboEX+bq
   iKcdKnzzEpv/bV1XKZ0MfakioZ5uXigMQNsE32lU19HGXFw+UJJS260x7
   Q==;
X-CSE-ConnectionGUID: OcD+5CZvQpex/qRT40oiZg==
X-CSE-MsgGUID: B9rD4x7wR/KqUXEwrDH67w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27286661"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27286661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:46:56 -0700
X-CSE-ConnectionGUID: H7+f/vSCTa27grfFf3KfqQ==
X-CSE-MsgGUID: dSiUo7Y0SbyaiImM3Q2NMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74451391"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 06:46:50 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 16:46:48 +0300
Date: Thu, 3 Oct 2024 16:46:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: Move crtc->{x, y, mode, enabled} to legacy
 sub-structure
Message-ID: <Zv6gSGMXZZARf3oV@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
X-Patchwork-Hint: comment

On Thu, Oct 03, 2024 at 02:38:35PM +0200, Louis Chauvet wrote:
> Le 02/10/24 - 21:22, Ville Syrjala a écrit :
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Atomic drivers shouldn't be using the legacy state stored
> > directly under drm_crtc. Move that junk into a 'legacy' sub
> > structure to highlight the offenders, of which there are
> > quite a few unfortunately.
> 
> Hi,
> 
> Do we need to do something particular in an atomic driver except using
> state content?
> 
> I proposed some modifications for VKMS bellow. If you think this is good,
> I can send a patch to avoid being an offender :-) I just tested it, and it
> seems to work.
> 
> > I'm hoping we could get all these fixed and then declare
> > the legacy state off limits for atomic drivers (which is
> > what did long ago for plane->fb/etc). And maybe eventually
> > turn crtc->legacy into a pointer and only allocate it on
> > legacy drivers.
> > 
> > TODO: hwmode should probably go there too but it probably
> >       needs a closer look, maybe other stuff too...
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 57a5769fc994..a7f8b1da6e85 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> >  
> > -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	size_t crtc_y_limit = crtc_state->base.crtc->legacy.mode.vdisplay;
> 
> 	size_t crtc_y_limit = crtc_state->base.mode.vdisplay;
> 
> >  	/*
> >  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> > @@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
> >  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> >  		return -EINVAL;
> >  
> > -	line_width = crtc_state->base.crtc->mode.hdisplay;
> > +	line_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	line_width = crtc_state->base.mode.hdisplay;
> 
> >  	stage_buffer.n_pixels = line_width;
> >  	output_buffer.n_pixels = line_width;
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index a40295c18b48..780681ea77e4 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> >  
> > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> 
> 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);

This one doesn't look safe. You want to call that during your atomic
commit already.

The rest look reasonable.

> 
> >  	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index bc724cbd5e3a..27164cddb94d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	struct drm_connector_state *conn_state = wb_conn->base.state;
> >  	struct vkms_crtc_state *crtc_state = output->composer_state;
> >  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> > -	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> > -	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> > +	u16 crtc_height = crtc_state->base.crtc->legacy.mode.vdisplay;
> > +	u16 crtc_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	u16 crtc_height = crtc_state->base.mode.vdisplay;
> 	u16 crtc_width = crtc_state->base.mode.hdisplay;
> 
> >  	struct vkms_writeback_job *active_wb;
> >  	struct vkms_frame_info *wb_frame_info;
> >  	u32 wb_format = fb->format->format;
> 
> [...]
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Ville Syrjälä
Intel

