Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3C5121BAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 22:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfLPV05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 16:26:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfLPV05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 16:26:57 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02BE3A34;
        Mon, 16 Dec 2019 22:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576531615;
        bh=u6AKnb9RxX7LrFz0jDhHWJdyKjpKN1JFXyhyFMwnbzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l/2KjOhHMpijQV2NznKXNmeE7DjR0flAO2qMLXY1bHQ4bRD8ALKYXLnIeBCVFq1O4
         NeOcZLg/tZ7ud0wkW66hYgicJFX3eRIoIOImsKB8xLaY9zVeXMhPoFKp+zJMhgtxhS
         8ANr/80jTodVdRe1EQhGLhm2OqhPxUReIA2BKkP0=
Date:   Mon, 16 Dec 2019 23:26:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v5 2/6] drm: rcar-du: lvds: Improve identification of
 panels
Message-ID: <20191216212645.GG4856@pendragon.ideasonboard.com>
References: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576527154-18391-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576527154-18391-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Mon, Dec 16, 2019 at 08:12:30PM +0000, Fabrizio Castro wrote:
> Dual-LVDS panels are mistakenly identified as bridges, this
> commit replaces the current logic with a call to
> drm_of_find_panel_or_bridge to sort that out.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v4->v5:
> * Addressed comments from Laurent's review
> 
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 75 +++++--------------------------------
>  1 file changed, 10 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index b03b7cd..4d038bd 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -716,79 +717,23 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
> -	struct device_node *local_output = NULL;
> -	struct device_node *remote_input = NULL;
> -	struct device_node *remote = NULL;
> -	struct device_node *node;
> -	bool is_bridge = false;
> -	int ret = 0;
> -
> -	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
> -	if (!local_output) {
> -		dev_dbg(lvds->dev, "unconnected port@1\n");
> -		ret = -ENODEV;
> -		goto done;
> -	}
> -
> -	/*
> -	 * Locate the connected entity and infer its type from the number of
> -	 * endpoints.
> -	 */
> -	remote = of_graph_get_remote_port_parent(local_output);
> -	if (!remote) {
> -		dev_dbg(lvds->dev, "unconnected endpoint %pOF\n", local_output);
> -		ret = -ENODEV;
> -		goto done;
> -	}
> +	int ret;
>  
> -	if (!of_device_is_available(remote)) {
> -		dev_dbg(lvds->dev, "connected entity %pOF is disabled\n",
> -			remote);
> -		ret = -ENODEV;
> +	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
> +					  &lvds->panel, &lvds->next_bridge);
> +	if (ret)
>  		goto done;
> -	}
>  
> -	remote_input = of_graph_get_remote_endpoint(local_output);
> -
> -	for_each_endpoint_of_node(remote, node) {
> -		if (node != remote_input) {
> -			/*
> -			 * We've found one endpoint other than the input, this
> -			 * must be a bridge.
> -			 */
> -			is_bridge = true;
> -			of_node_put(node);
> -			break;
> -		}
> -	}
> -
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
> +	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
> +	    lvds->next_bridge)
> +		lvds->dual_link = lvds->next_bridge->timings
> +				? lvds->next_bridge->timings->dual_link
> +				: false;
>  
>  	if (lvds->dual_link)
>  		ret = rcar_lvds_parse_dt_companion(lvds);
>  
>  done:
> -	of_node_put(local_output);
> -	of_node_put(remote_input);
> -	of_node_put(remote);
> -
>  	/*
>  	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
>  	 * used for the DPAD output even when the LVDS output is not connected.

-- 
Regards,

Laurent Pinchart
