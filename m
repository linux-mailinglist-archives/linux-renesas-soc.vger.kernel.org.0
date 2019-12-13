Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358E911ECC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 22:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfLMVVt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 16:21:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58864 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfLMVVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 16:21:48 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7F5C9D6;
        Fri, 13 Dec 2019 22:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576272105;
        bh=kfljz9UZHB2pVP+kCoUQ3y5Cztkhg15tClYsPXtUXcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AZxve53FRBzZW/1Udzi2ofhnsnKHsYZnxUVGBBj4psMMKbqvaefNFyqcEnR/xl5Ql
         TZaM9TrZZYN+CwYi/GX9pbmVx5ietNZYFE+DhmlGZubnz0CVIzbgfkx9WR3e/58A4+
         ODBSS7HciOOon5ziAVJLEwdrNaXq2OEiQaNxSHPs=
Date:   Fri, 13 Dec 2019 23:21:35 +0200
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
Subject: Re: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of
 panels
Message-ID: <20191213212135.GM4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1575649974-31472-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:49PM +0000, Fabrizio Castro wrote:
> Dual-LVDS panels are mistakenly identified as bridges, this
> commit replaces the current logic with a call to
> drm_of_find_panel_or_bridge to sort that out.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 45 +++++++++----------------------------
>  1 file changed, 10 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 8c6c172..3cb0a83 100644
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
> @@ -705,10 +706,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
>  	struct device_node *local_output = NULL;
> -	struct device_node *remote_input = NULL;
>  	struct device_node *remote = NULL;
> -	struct device_node *node;
> -	bool is_bridge = false;
>  	int ret = 0;
>  
>  	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
> @@ -736,45 +734,22 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  		goto done;
>  	}

I think you can remove the calls above this too.
drm_of_find_panel_or_bridge() calls of_graph_get_remote_node(), which in
turn calls of_graph_get_endpoint_by_regs(),
of_graph_get_remote_port_parent() and checks the status of the remote
with of_device_is_available().

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
> +	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
> +					  &lvds->panel, &lvds->next_bridge);
> +	if (ret)
> +		goto done;
>  
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
>  	of_node_put(local_output);
> -	of_node_put(remote_input);
>  	of_node_put(remote);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
