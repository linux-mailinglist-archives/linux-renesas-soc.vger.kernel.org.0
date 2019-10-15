Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA8EAD808F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 21:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732568AbfJOTxS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 15:53:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732360AbfJOTxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 15:53:18 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35A75324;
        Tue, 15 Oct 2019 21:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571169195;
        bh=AXnSfoAUPw7k65nBdJ9ShK9DA3Tijo7S+tapv/YFv28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rQGmLZeKxHahA0+LB5QWwgU+eg8N2m5Y8MekRWnUR6r6GCU3ZfKL4tSPqIaRHYn1B
         /E4SacalqpKBM7frFyg5pkEu7uGE40YUsDauDghfbYLsZ0RG5w+8nuSWOab4jjLBTu
         L2No+ahlCfRKDLzBQhY01tSRnYkOEiQFVA11dA4o=
Date:   Tue, 15 Oct 2019 22:53:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] drm: rcar-du: crtc: Control CMM operations
Message-ID: <20191015195312.GC19403@pendragon.ideasonboard.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-6-jacopo+renesas@jmondi.org>
 <42ae76b8-c65f-8c5e-e83a-fc6a422d2624@ideasonboard.com>
 <20191015133752.oyb3p6iyr3ekjxic@uno.localdomain>
 <20191015175422.GN4875@pendragon.ideasonboard.com>
 <20191015191754.hil5xc45lbzn3226@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191015191754.hil5xc45lbzn3226@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, Oct 15, 2019 at 09:17:54PM +0200, Jacopo Mondi wrote:
> On Tue, Oct 15, 2019 at 08:54:22PM +0300, Laurent Pinchart wrote:
> > On Tue, Oct 15, 2019 at 03:37:52PM +0200, Jacopo Mondi wrote:
> >> On Tue, Oct 15, 2019 at 02:15:35PM +0100, Kieran Bingham wrote:
> >>> On 15/10/2019 11:46, Jacopo Mondi wrote:
> >>>> Implement CMM handling in the crtc begin and enable atomic callbacks,
> >>>> and enable CMM unit through the Display Extensional Functions
> >>>
> >>> Extensional ?
> >>>
> >>> Perhaps this should just be Display Extension Functions?
> >>> Wow - that's actually what they call it in the data-sheet.
> >>>
> >>>> register at group setup time.
> >>>
> >>> Only a trivial extra blank line below that I can find... so
> >>>
> >>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> ---
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 79 +++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_group.c |  5 ++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  5 ++
> >>>>  3 files changed, 89 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >>>> index 23f1d6cc1719..4bc50a3f4a00 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >>>> @@ -21,6 +21,7 @@
> >>>>  #include <drm/drm_plane_helper.h>
> >>>>  #include <drm/drm_vblank.h>
> >>>>
> >>>> +#include "rcar_cmm.h"
> >>>>  #include "rcar_du_crtc.h"
> >>>>  #include "rcar_du_drv.h"
> >>>>  #include "rcar_du_encoder.h"
> >>>> @@ -474,6 +475,70 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
> >>>>  	rcar_du_crtc_finish_page_flip(rcrtc);
> >>>>  }
> >>>>
> >>>> +/* -----------------------------------------------------------------------------
> >>>> + * Color Management Module (CMM)
> >>>> + */
> >
> > Missing blank line.
> >
> >>>> +static int rcar_du_cmm_enable(struct drm_crtc *crtc)
> >>>> +{
> >>>> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >>>> +
> >>>> +	if (!rcrtc->cmm)
> >>>> +		return 0;
> >>>> +
> >>>> +	return rcar_cmm_enable(rcrtc->cmm);
> >>>> +}
> >>>> +
> >>>> +static void rcar_du_cmm_disable(struct drm_crtc *crtc)
> >>>> +{
> >>>> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >>>> +
> >>>> +	if (!rcrtc->cmm)
> >>>> +		return;
> >>>> +
> >>>> +	rcar_cmm_disable(rcrtc->cmm);
> >>>> +}
> >
> > I think I would have inlined those two functions in their only call site
> > as
> >
> > 	if (rcrtc->cmm)
> > 		rcar_cmm_enable(rcrtc->cmm);
> >
> > but that's up to you.
> 
> Mmm, I preferred to avoid if() in the caller, but as this is a small
> increment to an existing big driver, I'll go for the most consistent
> way
> 
> >>>> +
> >>>> +static int rcar_du_cmm_check(struct drm_crtc *crtc,
> >>>> +			     struct drm_crtc_state *state)
> >>>> +{
> >>>> +	struct drm_property_blob *drm_lut = state->gamma_lut;
> >>>> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >>>> +	struct device *dev = rcrtc->dev->dev;
> >>>> +
> >>>> +	if (!rcrtc->cmm || !drm_lut)
> >>>> +		return 0;
> >>>> +
> >>>> +	/* We only accept fully populated LUT tables. */
> >>>> +	if (CM2_LUT_SIZE * sizeof(struct drm_color_lut) !=
> >>>> +	    drm_lut->length) {
> >
> > How about
> >
> > 	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE)
> >
> > ?
> 
> Better :)
> 
> >>>> +		dev_err(dev, "invalid gamma lut size: %lu bytes\n",
> >>>> +			drm_lut->length);
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static void rcar_du_cmm_setup(struct drm_crtc *crtc)
> >>>> +{
> >>>> +	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
> >>>> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >>>> +	struct rcar_cmm_config cmm_config = {};
> >>>> +
> >>>> +	if (!rcrtc->cmm)
> >>>> +		return;
> >>>> +
> >>>> +	if (drm_lut) {
> >>>> +		cmm_config.lut.enable = true;
> >>>> +		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> >>>> +
> >>>> +	} else {
> >>>> +		cmm_config.lut.enable = false;
> >>>> +	}
> >
> > This could be changed to
> >
> > 	if (drm_lut)
> > 		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> >
> > if we dropped the enable field.
> 
> Dropping enable seems good
> 
> >>>> +
> >>>> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> >>>> +}
> >>>> +
> >>>>  /* -----------------------------------------------------------------------------
> >>>>   * Start/Stop and Suspend/Resume
> >>>>   */
> >>>> @@ -619,6 +684,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> >>>>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >>>>  		rcar_du_vsp_disable(rcrtc);
> >>>>
> >>>> +	rcar_du_cmm_disable(crtc);
> >>>> +
> >>>>  	/*
> >>>>  	 * Select switch sync mode. This stops display operation and configures
> >>>>  	 * the HSYNC and VSYNC signals as inputs.
> >>>> @@ -631,6 +698,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> >>>>  					   DSYSR_TVM_SWITCH);
> >>>>
> >>>>  	rcar_du_group_start_stop(rcrtc->group, false);
> >>>> +
> >>>
> >>> Extra blank line...
> >>
> >> Thanks for spotting this. I'm quite sure I run checkpatch (I just
> >> re-did) and not warnings for the extra white space in the previous
> >> patch, or this extra blank line o_0
> >>
> >>>>  }
> >>>>
> >>>>  /* -----------------------------------------------------------------------------
> >>>> @@ -642,6 +710,11 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
> >>>>  {
> >>>>  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
> >>>>  	struct drm_encoder *encoder;
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = rcar_du_cmm_check(crtc, state);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>>
> >>>>  	/* Store the routes from the CRTC output to the DU outputs. */
> >>>>  	rstate->outputs = 0;
> >>>> @@ -667,6 +740,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> >>>>  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
> >>>>  	struct rcar_du_device *rcdu = rcrtc->dev;
> >>>>
> >>>> +	rcar_du_cmm_enable(crtc);
> >>>>  	rcar_du_crtc_get(rcrtc);
> >>>>
> >>>>  	/*
> >>>> @@ -686,6 +760,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> >>>>  	}
> >>>>
> >>>>  	rcar_du_crtc_start(rcrtc);
> >>>> +	rcar_du_cmm_setup(crtc);
> >
> > This is the only part that really bothers me, we setup the LUT after
> > starting the CRTC, so the first frame will be output with a disabled
> > LUT, or possibly even with the LUT enabled in the middle of the frame.
> 
> I tested by programming a gamma_table to the very first frame, and the
> table gets set. I cannot tell at the naked eye if it actually takes effect
> on the first one though :)
> 
> > Do I recall correctly that moving setup before start causes issues ?
> > Could you explain what happens ?
> 
> Simply, the machine hangs :0
> 
> The chip manual prescribes to ("35A.3.2 CMM Setting")
> 
> 4) LUT Activation: Set LUT_EN bit of CMM_LUT_CTRL register to 1
> 5) DU Activation
> 6) LUT updates: (In case of single buffer mode)
>         Any accesses to update LUT table after next frame start,
>         output value from CMM is not guaranteed.
> 
> What we do is actually
> 5) 4) 6) as 4 and 6 happens in cmm_setup()
> 
> It seems anyway from point 6 description that there are not many ways
> to programm a LUT table -before- DU activation, but it might depends
> if DU activation implies only clock and power activation, or the
> actual routing and compositor activation as it happens in
> rcar_du_crtc_start().
> 
> I could actually try to program the CMM just before the VSP compositor
> is activated... Is it worth it ?

Whatever could give us a better understanding of the problem could be
useful I think. Maybe you could send this question to Renesas, to figure
out what the recommended way to program the LUT for the first frame is ?
Maybe we'll be told it's not possible for some reason, but at least we
will then know for sure.

I'm fine doing so on top of this series, but then I'd like a TODO item
here to explain the problem (and of course I'd like you to ask Renesas
about it :-)).

> >>>>  }
> >>>>
> >>>>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> >>>> @@ -739,6 +814,10 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
> >>>>  	 */
> >>>>  	rcar_du_crtc_get(rcrtc);
> >>>>
> >>>> +	/* If the active state changed, we let .atomic_enable handle CMM. */
> >>>> +	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
> >>>> +		rcar_du_cmm_setup(crtc);
> >>>
> >>> Aha, this is quite neat for handling the timings.
> >>
> >> Yes, much more streamlined than what we had. Thanks Sean and Ezequiel :)
> >
> > Yes, it guarantees that the CRTC is enabled, so we should be safe with
> > the assumption from patch 3/8 that rcar_du_cmm_setup() is always called
> > with the CMM enabled.
> >
> > Interestingly though, this doesn't implement atomicity. That will be a
> > very interesting challenge. We should use double buffering of the LUT in
> > the CMM to avoid it being modified in the middle of the frame, but how
> > to update it in sync with the commit, and thus the VSP, remains to be
> > researched.
> >
> > Could you maybe add a TODO comment in patch 3/8 to mention that we
> > should use double buffering ?
> 
> Yes, that should probably be supported
> 
> >>>> +
> >>>>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >>>>  		rcar_du_vsp_atomic_begin(rcrtc);
> >>>>  }
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >>>> index 9eee47969e77..583de800a66d 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >>>> @@ -135,6 +135,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> >>>>  static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>>>  {
> >>>>  	struct rcar_du_device *rcdu = rgrp->dev;
> >>>> +	u32 defr7 = DEFR7_CODE;
> >>>>
> >>>>  	/* Enable extended features */
> >>>>  	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
> >>>> @@ -147,6 +148,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>>>
> >>>>  	rcar_du_group_setup_pins(rgrp);
> >>>>
> >
> > Could you please add a comment here to mention that we shouldn't route
> > through CMM if no color management feature is used ?
> >
> > 	/*
> > 	 * TODO: Handling routing the DU output to CMM dynamically, as we should
> > 	 * bypass CMM completely when no color management feature is used.
> > 	 */
> 
> I'm not sure I get what you mean. If CMM is not enabled we do not
> enable the corresponding DEFR7_CMMEx
> 
> Or do you mean we should disable CMM if not gamma_table (or CLU table,
> or other CMM functions) is provided ? I assume if any of those
> functions is not enabled the pixels are not routed through the CMM (in
> example if LUT_EN is not set, not lookup is performed). Am I wrong ?

If the LUT is disabled then the CMM will by pass the LUT, but pixels
will still go through the CMM. We could, when all color correction is
disabled, disable CMM completely, which would require controlling DEFR7
dynamically. This should save a bit of power.

> >>>> +	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> >>>> +		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> >>>> +	rcar_du_group_write(rgrp, DEFR7, defr7);
> >>>> +
> >>>>  	if (rcdu->info->gen >= 2) {
> >>>>  		rcar_du_group_setup_defr8(rgrp);
> >>>>  		rcar_du_group_setup_didsr(rgrp);
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >>>> index bc87f080b170..fb9964949368 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >>>> @@ -197,6 +197,11 @@
> >>>>  #define DEFR6_MLOS1		(1 << 2)
> >>>>  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
> >>>>
> >>>> +#define DEFR7			0x000ec
> >>>> +#define DEFR7_CODE		(0x7779 << 16)
> >>>> +#define DEFR7_CMME1		BIT(6)
> >>>> +#define DEFR7_CMME0		BIT(4)
> >>>> +
> >>>>  /* -----------------------------------------------------------------------------
> >>>>   * R8A7790-only Control Registers
> >>>>   */

-- 
Regards,

Laurent Pinchart
