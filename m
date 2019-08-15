Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3748EAC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfHOLza (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:55:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43836 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfHOLz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:55:29 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A71B2AF;
        Thu, 15 Aug 2019 13:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565870128;
        bh=vqMbITpf9KzS4gwgFJCKsDh23NfR9QNwQcN0V6Q3nwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S/i1hIqcO3oV535KDdJkR91ko/obz2wQ/pBBArzOrWf53Fd/L6T1xri1GZf7AL7rc
         AfG2VWOTt7oKwP3fOAOgbXgv3blvnFT9MORSYNegCitVxd2r0AdGLm29yC1y+HchNK
         77NcIoXfz+7zeiGZqIXQbXQhqnHYB3AP913y45Po=
Date:   Thu, 15 Aug 2019 14:55:17 +0300
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
Subject: Re: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Message-ID: <20190815115517.GJ5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Aug 15, 2019 at 12:04:30PM +0100, Fabrizio Castro wrote:
> The companion encoder needs to be told to use the same
> mode as the primary encoder.
> 
> Fixes: e9e8798ab7b8 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * reworked according to Laurent's feedback
> 
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3fe0b86..41d28f4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -603,6 +603,11 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
>  	lvds->display_mode = *adjusted_mode;
>  
>  	rcar_lvds_get_lvds_mode(lvds);
> +	if (lvds->companion) {
> +		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
> +							lvds->companion);
> +		companion_lvds->mode = lvds->mode;

How about calling rcar_lvds_mode_set() on the companion instead ?

> +	}
>  }
>  
>  static int rcar_lvds_attach(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart
