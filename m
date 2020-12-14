Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3DD2D98ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 14:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439514AbgLNNdh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 08:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407989AbgLNNdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 08:33:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4948AC0611CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 05:32:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC6396;
        Mon, 14 Dec 2020 14:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607952738;
        bh=7uPN78gUBN976E36K1+ZwSOH/i/5MHty604a4tvSbH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EYhrqNBhMDEWrT3PtskjQS/V6p2ZkI10V8XhISkgDWwE34l6oTWA4A5g4L7ls2D6G
         oTKObytOhgSzgMP2/pNa/eYvVubhh0N9kAf+FiwIbbGqYZtzqJkDg3Zl3Vn+fGBXWZ
         gxbCSTkp+ibG2RizUbLPRjRha98DZAZlU/1BTeDI=
Date:   Mon, 14 Dec 2020 15:32:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 8/9] drm: rcar-du: Skip encoder allocation for LVDS1 in
 dual-link mode
Message-ID: <X9dpXD89dWa0tDVZ@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-9-laurent.pinchart+renesas@ideasonboard.com>
 <20201214110449.sjeixugm2ap2wfsj@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214110449.sjeixugm2ap2wfsj@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Mon, Dec 14, 2020 at 12:04:49PM +0100, Jacopo Mondi wrote:
> On Sat, Dec 05, 2020 at 12:01:38AM +0200, Laurent Pinchart wrote:
> > The rcar-du driver skips registration of the encoder for the LVDS1
> > output when LVDS is used in dual-link mode, as the LVDS0 and LVDS1 links
> > are bundled and handled through the LVDS0 output. It however still
> > allocates the encoder and immediately destroys it, which is pointless.
> > Skip allocation of the encoder altogether in that case.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 51 ++++++++++-------------
> >  1 file changed, 22 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index e4f35a88d00f..49c0b27e2f5a 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -65,17 +65,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	struct drm_bridge *bridge;
> >  	int ret;
> >
> > -	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> > -	if (renc == NULL)
> > -		return -ENOMEM;
> > -
> > -	rcdu->encoders[output] = renc;
> > -	renc->output = output;
> > -	encoder = rcar_encoder_to_drm_encoder(renc);
> > -
> > -	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> > -		enc_node, output);
> > -
> >  	/*
> >  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> >  	 * DT node has a single port, assume that it describes a panel and
> > @@ -86,23 +75,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	    rcar_du_encoder_count_ports(enc_node) == 1) {
> >  		struct drm_panel *panel = of_drm_find_panel(enc_node);
> >
> > -		if (IS_ERR(panel)) {
> > -			ret = PTR_ERR(panel);
> > -			goto error;
> > -		}
> > +		if (IS_ERR(panel))
> > +			return PTR_ERR(panel);
> >
> >  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> >  							 DRM_MODE_CONNECTOR_DPI);
> > -		if (IS_ERR(bridge)) {
> > -			ret = PTR_ERR(bridge);
> > -			goto error;
> > -		}
> > +		if (IS_ERR(bridge))
> > +			return PTR_ERR(bridge);
> >  	} else {
> >  		bridge = of_drm_find_bridge(enc_node);
> > -		if (!bridge) {
> > -			ret = -EPROBE_DEFER;
> > -			goto error;
> > -		}
> > +		if (!bridge)
> > +			return -EPROBE_DEFER;
> >
> >  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> >  		    output == RCAR_DU_OUTPUT_LVDS1)
> > @@ -110,16 +93,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	}
> >
> >  	/*
> > -	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> > -	 * companion for LVDS0 in dual-link mode.
> > +	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
> > +	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
> > +	 * mode.
> 
> Oh, here's the answer to my question on 1/9, I should have not looked
> at DTS but to the driver
> 
> >  	 */
> >  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> > -		if (rcar_lvds_dual_link(bridge)) {
> > -			ret = -ENOLINK;
> > -			goto error;
> > -		}
> > +		if (rcar_lvds_dual_link(bridge))
> > +			return -ENOLINK;
> >  	}
> >
> > +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> > +	if (renc == NULL)
> > +		return -ENOMEM;
> > +
> > +	rcdu->encoders[output] = renc;
> > +	renc->output = output;
> > +	encoder = rcar_encoder_to_drm_encoder(renc);
> > +
> > +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> > +		enc_node, output);
> > +
> >  	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> >  			       DRM_MODE_ENCODER_NONE, NULL);
> >  	if (ret < 0)
> 
> Do you have any other caller of the 'done:' label left apart from the
> one after this last line ? In case you don't you can call devm_kfree()
> here

That would be kfree(), not devm_kfree(). I'll do so.

> With or without this addressed:
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

-- 
Regards,

Laurent Pinchart
