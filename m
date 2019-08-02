Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27F47EF30
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404120AbfHBI0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:26:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfHBI0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:26:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81181CC;
        Fri,  2 Aug 2019 10:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564734374;
        bh=aXNoGd0TIT84e+iwneFaYQWdhIReu4dkQnr3NUBLRCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nZ+shzg3mcQSFxFZwnqlvNLlnhfbaRE3XAmO8zsEreBXfQu8PqTmKQ5oU163razhL
         gn2rDMncaNtYUnm+5ymz+/pl6CeXmBsbjvqsDkOF2Vqb+znPLbQGT1Uec/8Kn3Ogx0
         QR7QGGr6JFBrXWl6HRO5c01rdOTwj8UZYL1rE9zo=
Date:   Fri, 2 Aug 2019 11:26:13 +0300
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
Subject: Re: [PATCH/RFC 09/12] drm: rcar-du: lvds: Fix companion's mode
Message-ID: <20190802082613.GJ5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:06AM +0100, Fabrizio Castro wrote:
> The companion encoder needs to be told to use the same
> mode as the primary encoder.
> 
> Fixes: e9e8798ab7b8 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index edd63f5..7944ae9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -415,8 +415,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  		return;
>  
>  	/* Enable the companion LVDS encoder in dual-link mode. */
> -	if (lvds->dual_link && lvds->companion)
> +	if (lvds->dual_link && lvds->companion) {
> +		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
> +							lvds->companion);
> +		companion_lvds->mode = lvds->mode;
>  		lvds->companion->funcs->enable(lvds->companion);
> +	}

Would it make sense to do this in rcar_lvds_mode_set() instead, to keep
the mode set code grouped in a single place ?

>  
>  	/*
>  	 * Hardcode the channels and control signals routing for now.

-- 
Regards,

Laurent Pinchart
