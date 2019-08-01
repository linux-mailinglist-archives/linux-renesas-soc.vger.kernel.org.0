Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C79697DE7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 17:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732352AbfHAPLe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 11:11:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbfHAPLe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 11:11:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9740ACC;
        Thu,  1 Aug 2019 17:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564672291;
        bh=vt6Ktjk94ec1H6hufUnNflRQrJSB88KbpfXxlHfnRKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ilJgHqVmCANyv1bVzbJWbOqH+FJvEwfI+a8Dc6Lj4+LvDruwo5Tv+HlLwjsLlK6s+
         f3NlqMceQJErBx2u4YHuIBEDH3iLriggbNaaJyjkjcgm1OM4BmiVIIuqom7k/5IjPq
         Qhl3kFsOFtFnW8bqI9hXItXcivySMiGneLVNiAZs=
Date:   Thu, 1 Aug 2019 18:11:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        fabrizio.castro@bp.renesas.com,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190801151129.GF5024@pendragon.ideasonboard.com>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Jacopo,

Thank you for the patch.

On Tue, Jul 23, 2019 at 06:57:00PM +0200, Jacopo Mondi wrote:
> The R-Car LVDS encoder units support dual-link operations by splitting
> the pixel output between the primary encoder and the companion one.

s/the companion one/its companion/

> 
> In order for the primary encoder to succesfully control the companion's
> operations this should not fail at probe time and register itself its
> associated drm bridge so that the primary one can find it.

This is hard to parse.

> Currently the companion encoder fails at probe time, causing the
> registration of the primary to fail preventing the whole DU unit to be
> registered correctly.
> 
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> The "Fixes" tag refers to a patch currently part of the
> renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.
> 
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 31 +++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index bada7ee98544..8b015ba95895 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -767,14 +767,29 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  	of_node_put(remote_input);
>  	of_node_put(remote);
> 
> -	/*
> -	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
> -	 * used for the DPAD output even when the LVDS output is not connected.
> -	 * Don't fail probe in that case as the DU will need the bridge to
> -	 * control the clock.
> -	 */
> -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> -		return ret == -ENODEV ? 0 : ret;
> +	switch (ret) {
> +	case -ENODEV:
> +		/*
> +		 * On D3/E3 the LVDS encoder provides a clock to the DU, which
> +		 * can be used for the DPAD output even when the LVDS output is
> +		 * not connected. Don't fail probe in that case as the DU will
> +		 * need the bridge to control the clock.
> +		 */
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> +			ret = 0;
> +		break;
> +	case -ENXIO:
> +		/*
> +		 * When the LVDS output is used in dual link mode, the
> +		 * companion encoder fails at
> +		 * 'rcar_lvds_parse_dt_companion()'. Don't fail probe in
> +		 * that case as the master encoder will need the companion's
> +		 * bridge to control its operations.
> +		 */
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			ret = 0;

As -ENXIO can only be returned by rcar_lvds_parse_dt_companion(), and
rcar_lvds_parse_dt_companion() is only called when the
RCAR_LVDS_QUIRK_DUAL_LINK flag is set, this essentially means that you
always zero the error returned from rcar_lvds_parse_dt_companion(). This
is both complicated and too drastic as the second -ENXIO error case
shouldn't be ignored. It would be better and simpler to return 0 from
rcar_lvds_parse_dt_companion() when the renesas,companion property can't
be found.

> +		break;
> +	}
> 
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
