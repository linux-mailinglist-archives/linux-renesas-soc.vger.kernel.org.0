Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E19A67EE4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403849AbfHBIGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:06:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42266 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403767AbfHBIGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:06:17 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F01EDCC;
        Fri,  2 Aug 2019 10:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564733175;
        bh=9+kza4VDTl+eEJMeGT4Xr32idlzQYUeiiTC1I338XCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HaPxzE3tcMpwuIKBEDqz5x+O0u37NVXKCuNIZj19qLZjuEznLp/d2GRe7HikZT/Ht
         TKgUIGn+TiSOxzUebfB2WAA0sfY7sbMQhnGsbv8zZE694/vOEL4YU+MqvLB9MgBRqd
         FkxeHYl5hmdVK2HI3a39AXL4Kug+n6l2TdBN6KAg=
Date:   Fri, 2 Aug 2019 11:06:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Message-ID: <20190802080613.GF5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:02AM +0100, Fabrizio Castro wrote:
> When in vertical stripe mode of operation, there is the option
> of swapping even data and odd data on the two LVDS interfaces
> used to drive the video output.
> Add data swap support by exposing a new DT property named
> "renesas,swap-data".
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3aeaf9e..c306fab 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -69,6 +69,7 @@ struct rcar_lvds {
>  
>  	struct drm_bridge *companion;
>  	bool dual_link;
> +	bool stripe_swap_data;
>  };
>  
>  #define bridge_to_rcar_lvds(bridge) \
> @@ -439,12 +440,16 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>  
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> -		/*
> -		 * Configure vertical stripe based on the mode of operation of
> -		 * the connected device.
> -		 */
> -		rcar_lvds_write(lvds, LVDSTRIPE,
> -				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> +		u32 lvdstripe = 0;
> +
> +		if (lvds->dual_link)
> +			/*
> +			 * Configure vertical stripe based on the mode of
> +			 * operation of the connected device.
> +			 */
> +			lvdstripe = LVDSTRIPE_ST_ON | (lvds->stripe_swap_data ?
> +						       LVDSTRIPE_ST_SWAP : 0);

Would the following be simpler ?

		lvdstripe = (lvds->dual_link ? LVDSTRIPE_ST_ON : 0)
			  | (lvds->stripe_swap_data ? LVDSTRIPE_ST_SWAP : 0);

> +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
>  	}
>  
>  	/*
> @@ -770,8 +775,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  		}
>  	}
>  
> -	if (lvds->dual_link)
> +	if (lvds->dual_link) {
> +		lvds->stripe_swap_data = of_property_read_bool(
> +						lvds->dev->of_node,
> +						"renesas,swap-data");
>  		ret = rcar_lvds_parse_dt_companion(lvds);
> +	}

As explained in the review of the corresponding DT bindings, I think
this should be queried from the remote device rather than specified in
DT.

>  
>  done:
>  	of_node_put(local_output);

-- 
Regards,

Laurent Pinchart
