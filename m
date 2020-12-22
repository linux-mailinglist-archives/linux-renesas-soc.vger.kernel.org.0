Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC152DC246
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgLPOdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:33:00 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51075 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgLPOc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:32:59 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C38FAFF802;
        Wed, 16 Dec 2020 14:32:16 +0000 (UTC)
Date:   Wed, 16 Dec 2020 15:32:26 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: rcar-du: Fix leak of CMM platform device
 reference
Message-ID: <20201216143226.mj2k3k7vwv6rmqjo@uno.localdomain>
References: <20201216140836.31328-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216141628.wxh2zwkgevkh7as3@uno.localdomain>
 <X9oYi7+1Bc4NN/m0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X9oYi7+1Bc4NN/m0@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent
On Wed, Dec 16, 2020 at 04:24:11PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Dec 16, 2020 at 03:16:28PM +0100, Jacopo Mondi wrote:
> > On Wed, Dec 16, 2020 at 04:08:36PM +0200, Laurent Pinchart wrote:
> > > The device references acquired by of_find_device_by_node() are not
> > > released by the driver. Fix this by registering a cleanup action.
> > >
> > > Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - Only set rcdu->cmms[] if the CMM config option is enabled
> > > - Use platform_device_put()
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 22 +++++++++++++++++++---
> > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > index 92dfa3d4c011..fdb8a0d127ad 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > @@ -14,6 +14,7 @@
> > >  #include <drm/drm_fb_cma_helper.h>
> > >  #include <drm/drm_gem_cma_helper.h>
> > >  #include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_managed.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/drm_vblank.h>
> > >
> > > @@ -726,8 +727,12 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
> > >  		 * disabled: return 0 and let the DU continue probing.
> > >  		 */
> > >  		ret = rcar_cmm_init(pdev);
> > > -		if (ret)
> > > +		if (ret) {
> > > +			platform_device_put(pdev);
> > >  			return ret == -ENODEV ? 0 : ret;
> > > +		}
> > > +
> > > +		rcdu->cmms[i] = pdev;
> > >
> > >  		/*
> > >  		 * Enforce suspend/resume ordering by making the CMM a provider
> >
> > Sorry but don't we have an error path here below too, and if it fails
> > -EINVAL is returned and the whole modeset_init() bails out without
> > having put the platform device.
>
> There's an error path below, but in that case rcdu->cmms[i] will be set
> and the cleanup action will take care of it.
>

Right, the helper is registered before the init() function eventually
bails out. Sorry for being unnecessarily picky.

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j


> > > @@ -739,13 +744,20 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
> > >  				"Failed to create device link to CMM%u\n", i);
> > >  			return -EINVAL;
> > >  		}
> > > -
> > > -		rcdu->cmms[i] = pdev;
> > >  	}
> > >
> > >  	return 0;
> > >  }
> > >
> > > +static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
> > > +{
> > > +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
> > > +		platform_device_put(rcdu->cmms[i]);
> > > +}
> > > +
> > >  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > >  {
> > >  	static const unsigned int mmio_offsets[] = {
> > > @@ -766,6 +778,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	dev->mode_config.min_width = 0;
> > >  	dev->mode_config.min_height = 0;
> > >  	dev->mode_config.normalize_zpos = true;
>
> --
> Regards,
>
> Laurent Pinchart
