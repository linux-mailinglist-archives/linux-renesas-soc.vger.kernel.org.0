Return-Path: <linux-renesas-soc+bounces-9362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49E98F294
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 17:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7FE1C21BA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 15:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CDF1A3AA7;
	Thu,  3 Oct 2024 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuMVv3oV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5561A256F;
	Thu,  3 Oct 2024 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969360; cv=none; b=udTAWKA3JyyOQ1D4UjzI9sTT72DlFWaszGU1zvNwmcrLlNoaMZuWwNhTeP6PAEJjXskAwQO6bpzuCLOobD36hzWhstVt8hMl3JEO4z+Qw3xwQZ6h/91sPONEe7AT+VHd1N4aQynK/dLDpzoawV3BWa001TgUAj5yv9kdYiXWdKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969360; c=relaxed/simple;
	bh=YvquIwwg5/j4zuorAq7NmB4oxpw4k5D2MxcNq7+7jVA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+SmgcoAVVrWJnrPK79M4QVcNO4CYtGJ1UtdnyQx2lw883bXuiWAbRs5NMw7443QHcLwA1iBWNDQiZoWY1D0G3MWg7znmogxT+IBr0uH5jX5utjU8ECD8/GYoacKe5DD5axcOywIefuC0E6F0OT5+0MBOtLsKlyEAunDNoX1ioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuMVv3oV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727969359; x=1759505359;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=YvquIwwg5/j4zuorAq7NmB4oxpw4k5D2MxcNq7+7jVA=;
  b=kuMVv3oV8G7edPznipQyHxg75FCx3GOh4uL/DIomV8EC1LroedBsnAxe
   RP3fUHZIo8HskIcqa3ta1Xpg0Atly9UGs1Sr8igfWCyrxRNqXCTJkZQ7n
   peglNbDgp/edKzSttcbyJ4mT6sBFNyiionHVLQDVbrQqMpXieLSohwNAj
   64G4lqR0tArBBad10HGKHKs8UQjnwDdGNdGabycRlq/4ofE+pLi1KOeLu
   3kp8pwupgpcWuLE0jxhL6qn3El7GozCWyUadc1H+YbU6FSlghT0wsPmnO
   3YlQLnp6ydfMybYst1E96AvZgHYAgNElRk0nEvRsBS4568Dh0TleNeAmz
   A==;
X-CSE-ConnectionGUID: W+6UmqV5TRCRGVQo68zmQQ==
X-CSE-MsgGUID: sqhbJhLoRxW0rFwOW0vNAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26680400"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26680400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:29:18 -0700
X-CSE-ConnectionGUID: R4ZdAm2cSWCWdcBvo+HW5w==
X-CSE-MsgGUID: Rg93cpzSR3e/8YcpWOq3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74496623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 08:29:11 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 18:29:10 +0300
Date: Thu, 3 Oct 2024 18:29:10 +0300
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
Message-ID: <Zv64RktMPv2rpCZf@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
X-Patchwork-Hint: comment

On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index a40295c18b48..780681ea77e4 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > >  
> > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > 
> > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > 
> > This one doesn't look safe. You want to call that during your atomic
> > commit already.
> > 
> 
> This was already not safe with the previous implementation? Or it is only 
> unsafe because now I use state->mode instead of legacy.mode?

Yeah, if you want to look at obj->state then you need the corresponding
lock.

obj->state is also not necessarily the correct state you want because
a parallel commit could have already swapped in a new state but the
hardware is still on the old state.

Basically 99.9% of code should never even look at obj->state, and
instead should always use the for_each_new_<obj>_in_state()
and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
pipe dream though because a lot of drivers haven't been fixed to
do things properly. If we ever manage to fix everything then we
could remove the stall hacks from drm_atomic_helper_swap_state()
and allow a commit pipeline of arbitrary length.

> 
> After inspecting the code, I think I don't need to call it as:
> 
> In `vkms_atomic_commit_tail` (used in 
> `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> `drm_atomic_helper_commit_modeset_disables`, which call 
> `drm_atomic_helper_calc_timestamping_constants` which call 
> `drm_calc_timestamping_constants` for every CRTC.

Slightly odd place for it, but I think that's just because it was
originally part of drm_atomic_helper_update_legacy_modeset_state()
and I didn't bother looking for a better home for it when I split
it out. But seems like it should work fine as is.

> 
> I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> that can trigger bugs?

You would explicitly have to race commits against vblank_enable.
Could of course sprinkle sleep()s around to widen the race window
if you're really keen to hit it.

-- 
Ville Syrjälä
Intel

