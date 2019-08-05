Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75A816C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 12:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHEKRO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 06:17:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEKRO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 06:17:14 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 563172F9;
        Mon,  5 Aug 2019 12:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565000232;
        bh=mqdLCGTLZQXDGi/vqwQcb5FtYFpqzjRn/gvCjgjqTpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TQS2PEoqz/2A5ipX9abBLnHS2NgeDYXB4szYFKtJdcGYGAVCbxnFzktMTN1ytxHNq
         yVFH01E3YnWw5VX7PLGKLqQkSn70ZspAv3SO0RYcj3fJBSga3EtKgkQ22pZ2RaywVw
         wJeJwfxaASprD0t+6iDPfdeu2lD//OnaUNre6aVI=
Date:   Mon, 5 Aug 2019 13:17:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Message-ID: <20190805101710.GD29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080613.GF5008@pendragon.ideasonboard.com>
 <TY1PR01MB1770F1B00FEA431E43978FD9C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F1B00FEA431E43978FD9C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Aug 05, 2019 at 09:32:42AM +0000, Fabrizio Castro wrote:
> On 02 August 2019 09:06 Laurent Pinchart wrote:
> > On Fri, Aug 02, 2019 at 08:34:02AM +0100, Fabrizio Castro wrote:
> > > When in vertical stripe mode of operation, there is the option
> > > of swapping even data and odd data on the two LVDS interfaces
> > > used to drive the video output.
> > > Add data swap support by exposing a new DT property named
> > > "renesas,swap-data".
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 23 ++++++++++++++++-------
> > >  1 file changed, 16 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > index 3aeaf9e..c306fab 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > @@ -69,6 +69,7 @@ struct rcar_lvds {
> > >
> > >  	struct drm_bridge *companion;
> > >  	bool dual_link;
> > > +	bool stripe_swap_data;
> > >  };
> > >
> > >  #define bridge_to_rcar_lvds(bridge) \
> > > @@ -439,12 +440,16 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> > >  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> > >
> > >  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> > > -		/*
> > > -		 * Configure vertical stripe based on the mode of operation of
> > > -		 * the connected device.
> > > -		 */
> > > -		rcar_lvds_write(lvds, LVDSTRIPE,
> > > -				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> > > +		u32 lvdstripe = 0;
> > > +
> > > +		if (lvds->dual_link)
> > > +			/*
> > > +			 * Configure vertical stripe based on the mode of
> > > +			 * operation of the connected device.
> > > +			 */
> > > +			lvdstripe = LVDSTRIPE_ST_ON | (lvds->stripe_swap_data ?
> > > +						       LVDSTRIPE_ST_SWAP : 0);
> > 
> > Would the following be simpler ?
> > 
> > 		lvdstripe = (lvds->dual_link ? LVDSTRIPE_ST_ON : 0)
> > 			  | (lvds->stripe_swap_data ? LVDSTRIPE_ST_SWAP : 0);
> > 
> > > +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
> 
> I actually think I need to rework this patch slightly, because the user manual
> says that ST_SWAP is reserved for LVD1STRIPE, so I need to make sure we
> don't set it for LVDS1.
> 
> So perhaps, this could translate to something like:
> If (lvds->dual_link)
> 	lvdstripe = LVDSTRIPE_ST_ON | (<swap-whatever> && lvds->companion) ? LVDSTRIPE_ST_SWAP : 0);
> 
> I don't think we should be setting LVDSTRIPE_ST_SWAP without LVDSTRIPE_ST_ON, this solution
> would allow us to test lvds->dual_link only once, and will prevent us from setting LVDSTRIPE_ST_SWAP if
> LVDSTRIPE_ST_ON is not set or if we are touching LVDS1.
> 
> What do you think?

I was thinking that lvds->stripe_swap_data should only be set when
lvds->dual_link is set and lvds->companion is non-NULL, so both are
roughly equivalent. It's a detail anyway, it doesn't matter too much.

> > >  	}
> > >
> > >  	/*
> > > @@ -770,8 +775,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> > >  		}
> > >  	}
> > >
> > > -	if (lvds->dual_link)
> > > +	if (lvds->dual_link) {
> > > +		lvds->stripe_swap_data = of_property_read_bool(
> > > +						lvds->dev->of_node,
> > > +						"renesas,swap-data");
> > >  		ret = rcar_lvds_parse_dt_companion(lvds);
> > > +	}
> > 
> > As explained in the review of the corresponding DT bindings, I think
> > this should be queried from the remote device rather than specified in
> > DT.
> > 
> > >
> > >  done:
> > >  	of_node_put(local_output);

-- 
Regards,

Laurent Pinchart
