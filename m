Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7157B16B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 01:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfILXjg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 19:39:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfILXjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 19:39:36 -0400
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B6333A;
        Fri, 13 Sep 2019 01:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568331573;
        bh=rSB3fRu2IlFPBSvlPy+jtq6mdxKXzyTDfvAcmWR2amA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NlwWdHC6oAJq+tTeowWPPu0lEG2J+OP6al+AgFQGa4UHzKvrXG9rc4FkwgFbJLCq4
         JA2B1Jol/lB1mWkso2d3OwTMWJIrSyZlAqsbimb+Ojb0q3Nr9F0eV2M63aRtnlWpxv
         mMUG3mdmUW/8iCcz0PXUKf7ft2rxEnbmGWuiacwM=
Date:   Fri, 13 Sep 2019 02:39:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20190912233926.GE6006@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-21-jacopo+renesas@jmondi.org>
 <20190607120633.GI7593@pendragon.ideasonboard.com>
 <20190614081913.n5yxpotto5fzl7sh@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614081913.n5yxpotto5fzl7sh@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Jun 14, 2019 at 10:19:13AM +0200, Jacopo Mondi wrote:
> On Fri, Jun 07, 2019 at 03:06:33PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 06, 2019 at 04:22:20PM +0200, Jacopo Mondi wrote:
> >> Update CMM settings at in the atomic commit tail helper method.
> >>
> >> The CMM is updated with new gamma values provided to the driver
> >> in the GAMMA_LUT blob property.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 36 +++++++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> index 5a910a04e1d9..29a2020a46b5 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> @@ -21,6 +21,7 @@
> >>  #include <linux/of_platform.h>
> >>  #include <linux/wait.h>
> >>
> >> +#include "rcar_cmm.h"
> >>  #include "rcar_du_crtc.h"
> >>  #include "rcar_du_drv.h"
> >>  #include "rcar_du_encoder.h"
> >> @@ -367,6 +368,38 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >>   * Atomic Check and Update
> >>   */
> >>
> >> +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> >> +					     struct drm_crtc_state *old_state)
> >> +{
> >> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >> +	struct rcar_cmm_config cmm_config = {};
> >> +
> >> +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> >> +		return;
> >> +
> >> +	if (!crtc->state->gamma_lut) {
> >> +		cmm_config.lut.enable = false;
> >> +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> >> +
> >> +		return;
> >> +	}
> >> +
> >> +	cmm_config.lut.enable = true;
> >> +	cmm_config.lut.table = (struct drm_color_lut *)
> >> +			       crtc->state->gamma_lut->data;
> >> +
> >> +	/* Set LUT table size to 0 if entries should not be updated. */
> >> +	if (!old_state->gamma_lut ||
> >> +	    (old_state->gamma_lut->base.id !=
> >> +	    crtc->state->gamma_lut->base.id))
> >> +		cmm_config.lut.size = crtc->state->gamma_lut->length
> >> +				    / sizeof(cmm_config.lut.table[0]);
> >
> > Do you need to call rcar_cmm_setup() at all in this case ?
> 
> Do you mean in case the lut.size field is set to 0 ?
> I considered it useful when the CMM has to be re-enabled without
> updateing the LUT table entries? It is not required in your opinion?

You're right, I thought userspace couldn't do this, but it actually can.

> >> +	else
> >> +		cmm_config.lut.size = 0;
> >> +
> >> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> >> +}
> >> +
> >>  static int rcar_du_atomic_check(struct drm_device *dev,
> >>  				struct drm_atomic_state *state)
> >>  {
> >> @@ -409,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >>  			rcdu->dpad1_source = rcrtc->index;
> >>  	}
> >>
> >> +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> >> +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> >> +
> >>  	/* Apply the atomic update. */
> >>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >>  	drm_atomic_helper_commit_planes(dev, old_state,

-- 
Regards,

Laurent Pinchart
