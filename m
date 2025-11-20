Return-Path: <linux-renesas-soc+bounces-24863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC0C71E26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 03:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86A0834EF53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 02:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ABC1A23A6;
	Thu, 20 Nov 2025 02:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hKhq+dNU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09711624C0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606753; cv=none; b=aBB5k38I1lupxfE83CGmylLPtMaAynhtz6kxBvJ6ksa+qX3gCZV0YBCMtE/+lEVQCCwD/YuB3VuTLb3Usgg6Ee8DXdZnLRaA7Lv/bnekvHZv07ZErczwWHAIXMxFihFTcN7TbkipzsLG0nTj7g2rpxfRE0EpRK5T3mNw+ZP7NNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606753; c=relaxed/simple;
	bh=pgDnyPCQ4kOR1m6vsWTDpXSA6ZeXyjGx2I/7FDoMTVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alQRH8lA3CBacxMIy3yYOEUvfzmaS7CQpdDTHLejeVZ7qPPmZZUIhougQBu37V2dYYAOOgFrPMz1dAQvmL79NQGxb6evcWDKVoISFMzKqHLi3QQMsXmdZc8ilUeZUATZq3ET4mbdwySAgx4qc3Q0NI6lm0AHa4usy8m98R+x/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hKhq+dNU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 165B46A8;
	Thu, 20 Nov 2025 03:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763606621;
	bh=pgDnyPCQ4kOR1m6vsWTDpXSA6ZeXyjGx2I/7FDoMTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKhq+dNUijD4c/HYvb7id4RDo3f2v9AwGz/QfwVnCVHx617S3njPxRV0RPH8/tRuf
	 RwO2CJXP5fXpnU8+boz5Vc0MNM/+uiafyhqILK4rM+QQoDGGQZ7CvL38COlC8WzxRQ
	 EDEPPHccSoDTVNeJC77HWCdHieb7xWt+5W3deAIQ=
Date: Thu, 20 Nov 2025 11:45:23 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <20251120024523.GI10711@pendragon.ideasonboard.com>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>

On Wed, Nov 19, 2025 at 12:41:52PM +0200, Tomi Valkeinen wrote:
> On 19/11/2025 11:19, Maxime Ripard wrote:
> > On Tue, Nov 18, 2025 at 07:10:47PM +0100, Linus Walleij wrote:
> >> On Tue, Nov 18, 2025 at 4:44 PM Maxime Ripard <mripard@kernel.org> wrote:
> >>> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> >>>> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> >>
> >>>>> +/**
> >>>>> + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
> >>>>
> >>>> Based on the function name, it feels that the nem commit tail and
> >>>> modeset enable/disable helpers reached a point where we may want to
> >>>> reconsider the design instead of adding new functions with small
> >>>> differences in behaviour that will end up confusing driver developers.
> >>>
> >>> Agreed, and I'd go even further than that: we don't want every odd order
> >>> in the core. And if some driver has to break the order we document in
> >>> some way it should be very obvious.
> >>
> >> Is this just a comment on this patch 3/3?
> >>
> >> Or do you mean that Mareks new callback
> >> drm_atomic_helper_commit_modeset_enables_crtc_early()
> >> from patch 1/2 should go straight into the R-Car driver as well
> >> and that
> >> drm_atomic_helper_commit_modeset_disables_crtc_late()
> >> patch 2/2 should also go into my driver, even if this
> >> is a comment on patch 3/3?
> >>
> >> Both patches 1 & 2 have a lot to do with ordering, this is
> >> why I ask.
> > 
> > I mean, it applies to all your three patches and Marek's: helpers are
> > here to provide a default implementation. We shouldn't provide a default
> > implementation for a single user. All your patches enable to create
> > defaults for a single user.
> 
> Two users so far: Renesas and ST-Ericsson.

Only MCDE uses the new drm_atomic_helper_commit_tail_crtc_early_late()
function, while the new
drm_atomic_helper_commit_modeset_enables_crtc_early() helper is used
directly by R-Car DU to implement its commit tail handler, and by
drm_atomic_helper_commit_tail_crtc_early_late().

> > So my point is that none of those functions should be helpers.
> > 
> >> We already have
> >> drm_atomic_helper_commit_tail()
> >> drm_atomic_helper_commit_tail_rpm()
> > 
> > The former has 5 users, the latter 13. And it's already confusing enough
> > and regression-prone as it is.
> > 
> >> Does one more or less really matter? Maybe, I'm not sure,
> >> but if it's just this one patch that is the problem I can surely
> >> do it that way since we're only calling public functions.
> >>
> >> Pushing the first two patches would be more problematic,
> >> because they call a lot of functions that are local to the
> >> drm atomic helpers.
> > 
> > I'm totally fine with making more internal functions public though.
> 
> While I generally agree with that, I still wonder if an implementation
> in the core is better here. Perhaps a flag in struct drm_driver, instead
> of new set of helpers.
> 
> Moving this to the driver would require (with a quick glance) exposing
> the following functions:
> 
> crtc_enable
> crtc_disable
> crtc_set_mode
> encoder_bridge_pre_enable
> encoder_bridge_enable
> encoder_bridge_disable
> encoder_bridge_post_disable
> 
> Not impossible to expose, but making a private function public does
> require work in validating the function for more general use, and adding
> kernel docs.
> 
> Handling this in the core would act as documentation too, so instead of
> the driver doing things in a different way "hidden" inside the driver,
> it would be a standard quirk, clearly documented.
> 
> Also, I'm also not sure how rare this quirk is. In fact, I feel we're
> missing ways to handle the enable/disable related issues in the core
> framework. In these patches we're talking about the case where the SoC's
> DSI host needs an incoming pclk to operate, and panels need to do
> configuration before the video stream is enabled. But the exact same
> problem could be present with an external DSI bridge, and then we can't
> fix it in the crtc driver.
> 
> So the question becomes "does any component in the pipeline need the
> video stream's clock to operate". But then, it doesn't help if the crtc
> output is enabled early if any bridge in between does not also enable
> its output early. So it all gets a bit complex.

Are we getting close to a point where we all know the bridge model will
need to be reworked extensively, and everybody hopes someone else will
do it ? :-)

> And sometimes the clocks go backward: the entity on the downstream side
> provides a clock backwards, to the source entity...
> 
> But I digress. I think initially we should just look for a clean fix for
> the platforms affected:
> 
> - Add the implementation into the drivers?
> - Add helpers to the core?
> - Add a flag of some kind so the core can do the right thing?

drm_atomic_helper_commit_modeset_enables_crtc_early() would be more
cumbersome to implement manually in drivers as most of the functions it
calls are not exported. drm_atomic_helper_commit_tail_crtc_early_late()
shouldn't be difficult to implement in the MCDE driver.

> I made a quick test with the flag approach, below. It's not many lines,
> but... Ugh, it does feel like a hack.

Without seeing the code I can already imagine how this would feel like a
hack, so I agree not to go that way.

> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index d5ebe6ea0acb..8225aae43e3b 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1341,9 +1341,13 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
> >  {
> >         encoder_bridge_disable(dev, state);
> >  
> > -       crtc_disable(dev, state);
> > +       if (!dev->driver->crtc_early_on)
> > +               crtc_disable(dev, state);
> >  
> >         encoder_bridge_post_disable(dev, state);
> > +
> > +       if (dev->driver->crtc_early_on)
> > +               crtc_disable(dev, state);
> >  }
> >  
> >  /**
> > @@ -1682,9 +1686,13 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
> >  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> >                                               struct drm_atomic_state *state)
> >  {
> > +       if (dev->driver->crtc_early_on)
> > +               crtc_enable(dev, state);
> > +
> >         encoder_bridge_pre_enable(dev, state);
> >  
> > -       crtc_enable(dev, state);
> > +       if (!dev->driver->crtc_early_on)
> > +               crtc_enable(dev, state);
> >  

-- 
Regards,

Laurent Pinchart

