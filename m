Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C597A2DC1AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 14:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgLPNzg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 08:55:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgLPNzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 08:55:36 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02A812CF;
        Wed, 16 Dec 2020 14:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608126893;
        bh=CxD6e4x60PgGXKkzVKWTYFHx3whsnMhCg7hpTadifsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j+dvUmul+zqSfn9XfbNJNwaavrgAT89siC7uFjhc46NngM3pog9TFEyn+A012CJbr
         94ZKsilDie6XM0t23I26ki8Yja6pKEtxdSwWkLIQ4CUXpVZWwR9uMy724ZNAMbdhsC
         YUK0LceGthCw4J1ckSN1TjFf0U2EKd+Dy7iCGdhY=
Date:   Wed, 16 Dec 2020 15:54:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Use drm_bridge_connector_init()
 helper
Message-ID: <X9oRpcPLzZTxb/mT@pendragon.ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
 <20201216115319.weukihjt3mrl7gnx@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216115319.weukihjt3mrl7gnx@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Dec 16, 2020 at 12:53:19PM +0100, Jacopo Mondi wrote:
> On Wed, Dec 16, 2020 at 02:50:21AM +0200, Laurent Pinchart wrote:
> > Use the drm_bridge_connector_init() helper to create a drm_connector for
> > each output, instead of relying on the bridge drivers doing so. Attach
> > the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
> > them not to create a connector.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 25 ++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index ba8c6038cd63..10a66091391a 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/slab.h>
> >
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > @@ -61,6 +62,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  			 struct device_node *enc_node)
> >  {
> >  	struct rcar_du_encoder *renc;
> > +	struct drm_connector *connector;
> >  	struct drm_bridge *bridge;
> >  	int ret;
> >
> > @@ -122,9 +124,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	if (ret)
> >  		return ret;
> >
> > -	/*
> > -	 * Attach the bridge to the encoder. The bridge will create the
> > -	 * connector.
> > -	 */
> > -	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
> > +	/* Attach the bridge to the encoder. */
> > +	ret = drm_bridge_attach(&renc->base, bridge, NULL,
> > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +	if (ret) {
> > +		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
> > +			output);
> > +		return ret;
> > +	}
> > +
> > +	/* Create the connector for the chain of bridges. */
> > +	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> > +	if (IS_ERR(connector)) {
> > +		dev_err(rcdu->dev,
> > +			"failed to created connector for output %u\n", output);
> > +		return PTR_ERR(connector);
> > +	}
> > +
> > +	return drm_connector_attach_encoder(connector, &renc->base);
> 
> Looks good
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> I'm trying to figure out how deferred probe of a panel directly
> connected to the lvds encoder work. I assume there's no risk of
> creating the connector before the panel is probed, or this is not an
> issue.

If the panel isn't probed yet, the call to drm_of_find_panel_or_bridge()
in rcar_lvds_parse_dt() will defer probing of the LVDS encoder, which in
turn will defer probind of the DU as the LVDS bridge won't be
registered.

> >  }

-- 
Regards,

Laurent Pinchart
