Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 242079A085
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 21:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730986AbfHVTyR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 15:54:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50732 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfHVTyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 15:54:17 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CC8C2B2;
        Thu, 22 Aug 2019 21:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566503654;
        bh=GHCA3gkwB4RNKsfkuiYa//90I1sQp0GbRnug/PQKMuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FdbAKJGU0PAGTJJ+3FUf2mZfUKKsADKgnVPfWCsjSgjgW8GbyBxNCS46RRYy2FRbm
         asG6pEl8oQNjGBRvEv73m3+dT/Zn4Y0xQxQ7TR5aig7k5ocPn+gNtEAf1HJrfFAG0G
         sg0AQ5sWUKh5Il1ccVxw6hQC/7g8swIGeA5PmaXs=
Date:   Thu, 22 Aug 2019 22:54:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190822195407.GL5027@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
 <20190820184215.GM10820@pendragon.ideasonboard.com>
 <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Aug 22, 2019 at 09:19:25PM +0200, Jacopo Mondi wrote:
> On Tue, Aug 20, 2019 at 09:42:15PM +0300, Laurent Pinchart wrote:
> > On Sat, Jul 06, 2019 at 04:07:46PM +0200, Jacopo Mondi wrote:
> > > Update CMM settings at in the atomic commit tail helper method.
> > >
> > > The CMM is updated with new gamma values provided to the driver
> > > in the GAMMA_LUT blob property.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > index b79cda2f5531..f9aece78ca5f 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > @@ -21,6 +21,7 @@
> > >  #include <linux/of_platform.h>
> > >  #include <linux/wait.h>
> > >
> > > +#include "rcar_cmm.h"
> > >  #include "rcar_du_crtc.h"
> > >  #include "rcar_du_drv.h"
> > >  #include "rcar_du_encoder.h"
> > > @@ -287,6 +288,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > >   * Atomic Check and Update
> > >   */
> > >
> > > +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> > > +					     struct drm_crtc_state *old_state)
> > > +{
> > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > +	struct rcar_cmm_config cmm_config = {};
> > > +
> > > +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> > > +		return;
> > > +
> > > +	if (!crtc->state->gamma_lut) {
> > > +		cmm_config.lut.enable = false;
> > > +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > > +
> > > +		return;
> > > +	}
> > > +
> > > +	cmm_config.lut.enable = true;
> > > +	cmm_config.lut.table = (struct drm_color_lut *)
> > > +			       crtc->state->gamma_lut->data;
> > > +
> > > +	/* Set LUT table size to 0 if entries should not be updated. */
> > > +	if (!old_state->gamma_lut ||
> > > +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> > > +		cmm_config.lut.size = crtc->state->gamma_lut->length
> > > +				    / sizeof(cmm_config.lut.table[0]);
> > > +	else
> > > +		cmm_config.lut.size = 0;
> > > +
> > > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > > +}
> > > +
> > >  static int rcar_du_atomic_check(struct drm_device *dev,
> > >  				struct drm_atomic_state *state)
> > >  {
> > > @@ -329,6 +361,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> > >  			rcdu->dpad1_source = rcrtc->index;
> > >  	}
> > >
> > > +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> > > +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> > > +
> >
> > I think this looks good overall, but I wonder if we couldn't simplify
> > the CMM driver suspend/resume and LUT caching due to config while not
> > enabled by handling it on the DU side. I have a rework on the commit
> > tail handler in progress, I'll think how this could be done. For now I
> > think you can leave it as is.
> 
> Does this mean I have your R-b tag ? :)

I'd like to review this in the context of v3 :-)

> > >  	/* Apply the atomic update. */
> > >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > >  	drm_atomic_helper_commit_planes(dev, old_state,

-- 
Regards,

Laurent Pinchart
