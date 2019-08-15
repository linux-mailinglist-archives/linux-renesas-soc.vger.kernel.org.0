Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE918EC64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 15:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbfHONIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 09:08:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfHONIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 09:08:39 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B21D62AF;
        Thu, 15 Aug 2019 15:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565874517;
        bh=iOl9vdZWwb3pmPhXE+c/ONYigaVBjZyvxKktrbLhX+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PGjxuD0LyhUf6bRXF08/KhE0BuW9AhtMv8AqAY8j2xpfQ1HO72V81YZq7RfFjuRHA
         Ouu8vjBoQHcf6yAjtwkGBZKy65cbZV2K3u2AwRYo9yBTtLOBGJWFaaFXI5cz40vgyO
         +enVVk/Te5jVaLOnNf8KdhBHnM6g2BoFmL56kuxI=
Date:   Thu, 15 Aug 2019 16:08:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 7/9] drm: rcar-du: lvds: Add dual-LVDS panels support
Message-ID: <20190815130834.GM5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Aug 15, 2019 at 12:04:31PM +0100, Fabrizio Castro wrote:
> This patch adds support for dual-LVDS panels.
> 
> It's very important that we coordinate the efforts of both the
> primary encoder and the companion encoder to get the right
> picture on the panel, therefore this patch adds some code
> to work out if even and odd pixels need swapping.
> When the encoders are connected to a LVDS panel, the assumption
> is that by default the panel expects even pixels (0, 2, 4, etc.)
> on the first input port, and odd pixels (1, 3, 5, etc.) on the
> seconds port. When DRM_LINK_DUAL_LVDS_ODD_EVEN is found among the
> link flags, the display expects odd pixels on the first input
> port, and even pixels on the second port. As a result, the way
> the encoders are connected to the panel may trigger pixel (data)
> swapping.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * new patch, resulting from Laurent's feedback
> 
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 121 ++++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 41d28f4..5c24884 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -22,6 +22,8 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_timings.h>
> +#include <drm/drm_of.h>

Please keep the headers alphabetically sorted.

>  
>  #include "rcar_lvds.h"
>  #include "rcar_lvds_regs.h"
> @@ -69,6 +71,7 @@ struct rcar_lvds {
>  
>  	struct drm_bridge *companion;
>  	bool dual_link;
> +	bool stripe_swap_data;
>  };
>  
>  #define bridge_to_rcar_lvds(b) \
> @@ -439,12 +442,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
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
> +			 *
> +			 * ST_SWAP from LVD1STRIPE is reserved, do not set
> +			 * in the companion LVDS
> +			 */
> +			lvdstripe = LVDSTRIPE_ST_ON |
> +				(lvds->companion && lvds->stripe_swap_data ?
> +				 LVDSTRIPE_ST_SWAP : 0);

Let's sort out the alignment.

			lvdstripe = LVDSTRIPE_ST_ON
				  | (lvds->companion && lvds->stripe_swap_data ?
				     LVDSTRIPE_ST_SWAP : 0);

> +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
>  	}
>  
>  	/*
> @@ -706,13 +717,31 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  	return ret;
>  }
>  
> +static int rcar_lvds_get_remote_port_reg(struct device_node *np)
> +{
> +	struct device_node *endpoint_node, *remote_endpoint;
> +	struct of_endpoint endpoint;
> +
> +	endpoint_node = of_graph_get_endpoint_by_regs(np, 1, 0);
> +	if (!endpoint_node)
> +		return -ENODEV;
> +	remote_endpoint = of_graph_get_remote_endpoint(endpoint_node);
> +	if (!remote_endpoint) {
> +		of_node_put(endpoint_node);
> +		return -ENODEV;
> +	}
> +	of_graph_parse_endpoint(remote_endpoint, &endpoint);
> +	of_node_put(endpoint_node);
> +	of_node_put(remote_endpoint);
> +
> +	return endpoint.port;
> +}
> +
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
>  	struct device_node *local_output = NULL;
> -	struct device_node *remote_input = NULL;
>  	struct device_node *remote = NULL;
> -	struct device_node *node;
> -	bool is_bridge = false;
> +	const struct drm_timings *timings = NULL;
>  	int ret = 0;
>  
>  	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
> @@ -740,45 +769,57 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  		goto done;
>  	}
>  
> -	remote_input = of_graph_get_remote_endpoint(local_output);
> +	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
> +					  &lvds->panel, &lvds->next_bridge);
> +	if (ret) {
> +		ret = -EPROBE_DEFER;
> +		goto done;
> +	}
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> +		if (lvds->next_bridge)
> +			timings = lvds->next_bridge->timings;
> +		else
> +			timings = lvds->panel->timings;

I wonder if we should use devm_drm_panel_bridge_add() (or
drm_panel_bridge_add()) and use the bridge API only. It would require a
small change in the drm_panel_bridge to copy the timings pointer, but
apart from that I think it should be fine. If it creates too much churn
due to connector handling then we can skip it for now and I'll handle it
later (but I'd appreciate if you could copy the timings pointer in
drm_panel_bridge already).

> +		if (timings)
> +			lvds->dual_link = timings->dual_link;
> +	}
>  
> -	for_each_endpoint_of_node(remote, node) {
> -		if (node != remote_input) {
> +	if (lvds->dual_link) {
> +		ret = rcar_lvds_parse_dt_companion(lvds);
> +		if (lvds->companion && timings) {
> +			int our_port, comp_port;
> +			bool odd_even_flag = timings->link_flags &
> +						DRM_LINK_DUAL_LVDS_ODD_EVEN;
> +			our_port = rcar_lvds_get_remote_port_reg(
> +						lvds->dev->of_node);
> +			if (our_port < 0) {
> +				ret = our_port;
> +				goto done;
> +			}
> +			comp_port = rcar_lvds_get_remote_port_reg(
> +						lvds->companion->of_node);
> +			if (comp_port < 0) {
> +				ret = comp_port;
> +				goto done;
> +			}
>  			/*
> -			 * We've found one endpoint other than the input, this
> -			 * must be a bridge.
> +			 * We need to match the port where we generate even
> +			 * pixels (0, 2, 4, etc.) to the port where the sink
> +			 * expects to receive even pixels, same thing for the
> +			 * odd pixels. Swap the generation of even and odd
> +			 * pixels if the connection requires it.
> +			 * By default (when DRM_LINK_DUAL_LVDS_ODD_EVEN is not
> +			 * specified) the sink expects even pixels on the
> +			 * first input port, and odd pixels on the second port.

I see what you're trying to do, but I'm not sure I like it much :-S

Peeking into the remove DT node like that creates a dependency between
this driver and the DT bindings of all possible remote nodes. For this
to work, you would need to ensure that the odd/even mapping to ports is
common to all dual-link devices, and thus document that globally in the
DT bindings. I'm not sure if there's a way around it as hardware
connections could indeed switch the two lanes, so we need to model that
somehow. It could be modelled with a swap property in DT, but that would
still require a standard mapping of odd-even pixels to ports, so maybe
the easiest option is to document globally that port 0 on the sink is
for even pixels, and port 1 for odd pixels, and remove the
DRM_LINK_DUAL_LVDS_ODD_EVEN flag completely. But what will then happen
if you panel has more than two ports (for audio for instance, or for
other types of video links) ? It may not be possible to always use port
0 and 1 for the LVDS even and odd pixels in DT bindings of a particular
panel or bridge.

A creative solution is needed here.

>  			 */
> -			is_bridge = true;
> -			of_node_put(node);
> -			break;
> +			if (((comp_port - our_port > 0) &&  odd_even_flag) ||
> +			    ((comp_port - our_port < 0) && !odd_even_flag))
> +				lvds->stripe_swap_data = true;
>  		}
>  	}
>  
> -	if (is_bridge) {
> -		lvds->next_bridge = of_drm_find_bridge(remote);
> -		if (!lvds->next_bridge) {
> -			ret = -EPROBE_DEFER;
> -			goto done;
> -		}
> -
> -		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> -			lvds->dual_link = lvds->next_bridge->timings
> -					? lvds->next_bridge->timings->dual_link
> -					: false;
> -	} else {
> -		lvds->panel = of_drm_find_panel(remote);
> -		if (IS_ERR(lvds->panel)) {
> -			ret = PTR_ERR(lvds->panel);
> -			goto done;
> -		}
> -	}
> -
> -	if (lvds->dual_link)
> -		ret = rcar_lvds_parse_dt_companion(lvds);
> -
>  done:
>  	of_node_put(local_output);
> -	of_node_put(remote_input);
>  	of_node_put(remote);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
