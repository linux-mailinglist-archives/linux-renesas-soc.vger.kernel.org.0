Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39447EED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfHBIUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:20:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbfHBIUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:20:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA4D2CC;
        Fri,  2 Aug 2019 10:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564734021;
        bh=pvbdZIWzjzR/LxKyDLxztUTUtujs0Qx/v3CAnr+6Zr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IHYpmQM8X1BQ3If4zZnaVavrylWcJsO7Q7Mj4RnoggvAyLn7DFA9j7FrYSuAVIgEB
         acgddoRooMGR6pU7/SIw571qLpE/NOhuBoJ0Zv2XFt+04jPWevQ9CMK3PnBGNrosCN
         bHAHKhXsiAinRECu0Ha7FRkCT6QRPl2yGRfOj1SI=
Date:   Fri, 2 Aug 2019 11:20:20 +0300
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
Subject: Re: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Message-ID: <20190802082020.GH5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:04AM +0100, Fabrizio Castro wrote:
> If the display comes with two ports, assume it supports dual
> link.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 2d54ae5..97c51c2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -751,6 +751,9 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  			ret = -EPROBE_DEFER;
>  			goto done;
>  		}
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			lvds->dual_link = of_graph_get_endpoint_count(remote)
> +					== 2;

This is a bit of a hack, as I think the information should be queried
from the panel, like we do for bridges. I'd say we can live with this
for now, but as the data swap flag should come from the panel as well,
we will need infrastructure for that, and we can as well through the
dual link flag there at the same time.

I think we should use the drm_bridge_timings structure for this purpose,
as it would make life more difficult for users of drm_bridge and
drm_panel to have two different structures (especially when wrapping a
drm_panel with drm_panel_bridge_add()). The structure could be renamed
if desired.

>  	}
>  
>  	if (lvds->dual_link) {

-- 
Regards,

Laurent Pinchart
