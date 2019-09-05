Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2242AA146
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 13:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388392AbfIEL0E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 07:26:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732580AbfIEL0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 07:26:04 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB06126D;
        Thu,  5 Sep 2019 13:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567682761;
        bh=PDM2yg84iLZxQ9w4hCMgxPNjGc9GtOUOGtLLgc+7y2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f+Hpg8NSUg1iGUf3k42bWXSJbLsMLp6/KZKiry+7CLg0Kil9hX+LlHRrMHKteTgDq
         xESEcAnQjuF0Y8cy/KfKZ8tfYzI+Vn6/nI/uXJsiMB2g0n6FqA18hvlizMnIxbXsk8
         pgHr0nJvYMV27Ysa2JcCE65YJT167kPsP585+iY0=
Date:   Thu, 5 Sep 2019 14:25:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Message-ID: <20190905112554.GH5035@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-15-jacopo+renesas@jmondi.org>
 <20190827000517.GC5274@pendragon.ideasonboard.com>
 <20190905105809.iguzoqenlcriqegk@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190905105809.iguzoqenlcriqegk@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Sep 05, 2019 at 12:58:09PM +0200, Jacopo Mondi wrote:
> On Tue, Aug 27, 2019 at 03:05:17AM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > (Question for Daniel below)
> >
> > Thank you for the patch.
> >
> > On Sun, Aug 25, 2019 at 03:51:54PM +0200, Jacopo Mondi wrote:
> >> When resuming from system suspend, the DU driver is responsible for
> >> reprogramming and enabling the CMM unit if it was in use at the time
> >> the system entered the suspend state.
> >>
> >> Force the color_mgmt_changed flag to true if any of the DRM color
> >> transformation properties was set in the CRTC state duplicated at
> >> suspend time, as the CMM gets reprogrammed only if said flag is active in
> >> the rcar_du_atomic_commit_update_cmm() method.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> index 018480a8f35c..6e38495fb78f 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/slab.h>
> >>  #include <linux/wait.h>
> >>
> >> +#include <drm/drm_atomic.h>
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <drm/drm_fb_cma_helper.h>
> >>  #include <drm/drm_fb_helper.h>
> >> @@ -482,6 +483,26 @@ static int rcar_du_pm_suspend(struct device *dev)
> >>  static int rcar_du_pm_resume(struct device *dev)
> >>  {
> >>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> >> +	struct drm_atomic_state *state = rcdu->ddev->mode_config.suspend_state;
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < rcdu->num_crtcs; ++i) {
> >> +		struct drm_crtc *crtc = &rcdu->crtcs[i].crtc;
> >> +		struct drm_crtc_state *crtc_state;
> >> +
> >> +		crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
> >> +		if (!crtc_state)
> >> +			continue;
> >
> > Shouldn't you get the new state here ?
> 
> I have followed the drm_atomic_helper_suspend() call stack, that calls
> drm_atomic_helper_duplicate_state() which then assign the crtct state
> with drm_atomic_get_crtc_state(), where I read:
> 
>        	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
>         ...
> 	state->crtcs[index].state = crtc_state;
> 	state->crtcs[index].old_state = crtc->state;
> 	state->crtcs[index].new_state = crtc_state;
> 
> So state or new_state for the purpose of getting back the crtc state
> are the same if I'm not mistaken.

It seems to be the case, but the documentation of
drm_atomic_get_existing_crtc_state() states

 * This function is deprecated, @drm_atomic_get_old_crtc_state or
 * @drm_atomic_get_new_crtc_state should be used instead.

I would thus use drm_atomic_get_new_crtc_state().

> >> +
> >> +		/*
> >> +		 * Force re-enablement of CMM after system resume if any
> >> +		 * of the DRM color transformation properties was set in
> >> +		 * the state saved at system suspend time.
> >> +		 */
> >> +		if (crtc_state->gamma_lut || crtc_state->degamma_lut ||
> >> +		    crtc_state->ctm)
> >
> > We don't support degamma_lut or crm, so I would drop those.
> 
> yeah, I added them as it was less code to change when we'll support
> them. But for now they could be removed.
> 
> > With these small issues addressed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Shouldn't we however squash this with the previous patch to avoid
> > bisection issues ?
> 
> Which one in your opinion?
> "drm: rcar-du: kms: Update CMM in atomic commit tail" ?
> It seems to me they do quite different things though..

Yes, but suspend/resume will be broken after 13/14 without 14/14. Not
the end of the world, but not really nice if we need to bisect
suspend/resume issues.

> >> +			crtc_state->color_mgmt_changed = true;
> >
> > Daniel, is this something that would make sense in the KMS core (or
> > helpers) ?
> >
> >> +	}
> >>
> >>  	return drm_mode_config_helper_resume(rcdu->ddev);
> >>  }

-- 
Regards,

Laurent Pinchart
