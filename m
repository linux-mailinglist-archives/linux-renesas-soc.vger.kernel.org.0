Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B6A9F063
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 18:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfH0Qit (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 12:38:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50728 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730333AbfH0Qij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 12:38:39 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1022454B;
        Tue, 27 Aug 2019 18:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566923917;
        bh=g/Tjvn2DJDTw4Wdp/39XvKehIUZyBqKZl1Ba/0TXUsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XqTQhyCP23qEfCucpDWRlBFXc/U9Ecjgx+lsHlQgdBro2Nu5KxYvl6FAqfG31IN+K
         WATOGrlFp4J1xl7q0TwTdNSAMrTNeMcRyHzpncX1phGKHqMUROxSyLy02r4+w9k8NP
         KqCAEkyNdge+qq7v5b/TqYOA/mekO/XmZMg9yHbs=
Date:   Tue, 27 Aug 2019 19:38:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v3 13/14] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190827163830.GC5054@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-14-jacopo+renesas@jmondi.org>
 <20190827000017.GB5274@pendragon.ideasonboard.com>
 <20190827001927.GA5926@pendragon.ideasonboard.com>
 <20190827144421.vbcoizfjxj5ashv2@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827144421.vbcoizfjxj5ashv2@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, Aug 27, 2019 at 04:44:21PM +0200, Jacopo Mondi wrote:
> On Tue, Aug 27, 2019 at 03:19:27AM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 27, 2019 at 03:00:17AM +0300, Laurent Pinchart wrote:
> >> On Sun, Aug 25, 2019 at 03:51:53PM +0200, Jacopo Mondi wrote:
> >>> Update CMM settings at in the atomic commit tail helper method.
> >>>
> >>> The CMM is updated with new gamma values provided to the driver
> >>> in the GAMMA_LUT blob property.
> >>>
> >>> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
> >>>  1 file changed, 35 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> index 61ca1d3c379a..047fdb982a11 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> @@ -22,6 +22,7 @@
> >>>  #include <linux/of_platform.h>
> >>>  #include <linux/wait.h>
> >>>
> >>> +#include "rcar_cmm.h"
> >>>  #include "rcar_du_crtc.h"
> >>>  #include "rcar_du_drv.h"
> >>>  #include "rcar_du_encoder.h"
> >>> @@ -368,6 +369,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >>>   * Atomic Check and Update
> >>>   */
> >>>
> >>> +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> >>> +					     struct drm_crtc_state *old_state)
> >>> +{
> >>> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >>> +	struct rcar_cmm_config cmm_config = {};
> >>> +
> >>> +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> >>> +		return;
> >>> +
> >>> +	if (!crtc->state->gamma_lut) {
> >>> +		cmm_config.lut.enable = false;
> >>> +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> >>> +
> >>> +		return;
> >>> +	}
> >>> +
> >>> +	cmm_config.lut.enable = true;
> >>> +	cmm_config.lut.table = (struct drm_color_lut *)
> >>> +			       crtc->state->gamma_lut->data;
> >>> +
> >>> +	/* Set LUT table size to 0 if entries should not be updated. */
> >>> +	if (!old_state->gamma_lut ||
> >>> +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> >>> +		cmm_config.lut.size = crtc->state->gamma_lut->length
> >>> +				    / sizeof(cmm_config.lut.table[0]);
> >>
> >> It has just occurred to me that the hardware only support LUTs of
> 
> Where did you find this strict requirement ? I have tried programming
> less than 256 entries in the 1-D LUT table, and it seems to me things
> are working fine (from a visual inspection of the output image, I
> don't see much differences from when I program the full table, maybe
> that's an indication something is bad?)

Or maybe a previous write of the full 256 entries has initialised the
LUT correctly ?

There's no hardware register telling how many LUT entries the hardware
should use, and the documentation makes it quite clear that the LUT
contains 256 entries. It is indexed by the values of the 8-bit pixel
components, so it has to be written fully.

> >> exactly 256 entries. Should we remove cmm_config.lut.size (simplifying
> >> the code in the CMM driver), and add a check to the CRTC .atomic_check()
> >> handler to reject invalid LUTs ? Sorry for not having caught this
> >> earlier.
> >
> > Just an additional comment, if we drop the size field, then the
> > cmm_config.lut.table pointer should be set to NULL when the LUT contents
> > don't need to be updated.
> >
> >>> +	else
> >>> +		cmm_config.lut.size = 0;
> >>> +
> >>> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> >>> +}
> >>> +
> >>>  static int rcar_du_atomic_check(struct drm_device *dev,
> >>>  				struct drm_atomic_state *state)
> >>>  {
> >>> @@ -410,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >>>  			rcdu->dpad1_source = rcrtc->index;
> >>>  	}
> >>>
> >>> +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> >>> +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> >>> +
> >>>  	/* Apply the atomic update. */
> >>>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >>>  	drm_atomic_helper_commit_planes(dev, old_state,

-- 
Regards,

Laurent Pinchart
