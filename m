Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 932C97EE64
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390712AbfHBII0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:08:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731650AbfHBIIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:08:25 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 712A4CC;
        Fri,  2 Aug 2019 10:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564733303;
        bh=2UaQPpKkx8OlEPlBRJ06lDq41qS+2VJC+5P6gozouMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KloZozCyzqkc0hzxknVEstKXIczl6U9AFfOAUh+7svdYW0s4VQjexe5c3rWasGri2
         AVoPS5T3qZdRMMr1CqQbEkS22Tnn+ojZG2A3v5vFwaWU1b9XTn3Q+JnsEWqHx4Q16o
         7MgdigP04BI6ubzm8UeExDmFx09kW/J8MYiTPnvE=
Date:   Fri, 2 Aug 2019 11:08:21 +0300
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
Subject: Re: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for
 identifying bridges
Message-ID: <20190802080821.GG5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:03AM +0100, Fabrizio Castro wrote:
> We may be connected to a dual LVDS display, therefore checking
> if node != remote_input for identifying bridges is not going to
> work anymore.
> We could try to match the ports on the remote end to the LVDS
> encoders, however the companion LVDS encoder instance doesn't
> hold a reference to the primary LVDS encoder instance.
> We know we could be connected to either a bridge, or a panel,
> therefore look through the registered bridges and panels, until
> we have a match.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 29 +++--------------------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index c306fab..2d54ae5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -711,10 +711,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
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
> @@ -742,27 +739,8 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  		goto done;
>  	}
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
> +	lvds->next_bridge = of_drm_find_bridge(remote);

How about using drm_of_find_panel_or_bridge() ?

> +	if (lvds->next_bridge) {
>  		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
>  			lvds->dual_link = lvds->next_bridge->timings
>  					? lvds->next_bridge->timings->dual_link
> @@ -770,7 +748,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  	} else {
>  		lvds->panel = of_drm_find_panel(remote);
>  		if (IS_ERR(lvds->panel)) {
> -			ret = PTR_ERR(lvds->panel);
> +			ret = -EPROBE_DEFER;
>  			goto done;
>  		}
>  	}
> @@ -784,7 +762,6 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  
>  done:
>  	of_node_put(local_output);
> -	of_node_put(remote_input);
>  	of_node_put(remote);
>  
>  	switch (ret) {

-- 
Regards,

Laurent Pinchart
