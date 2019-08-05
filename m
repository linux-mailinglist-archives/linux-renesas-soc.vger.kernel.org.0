Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3140823D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbfHERRY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 13:17:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35370 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbfHERRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 13:17:24 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29DD32F9;
        Mon,  5 Aug 2019 19:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565025441;
        bh=yqTebMyCVqyE1EO2DbL4pb0qQVnsJgnd8Hudm4zbpI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KzhL5uP2lTRmeOD08ssZF8sSI8Mg9RYislg0FBa+9JrHroFxiuphxs5QPeA+kluDp
         W76dfIqlkutBAOqccjLBUYYqIHuE/JNH6jiJVMrELoaUqOLNMq3g5hL8p5PQtTGDEt
         gHbQUtRknGd/W6CCRNi1E2doOmMekIp2TCggA8DQ=
Date:   Mon, 5 Aug 2019 20:17:19 +0300
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
Subject: Re: [PATCH v2] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190805171719.GB13149@pendragon.ideasonboard.com>
References: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Aug 05, 2019 at 06:18:37PM +0200, Jacopo Mondi wrote:
> The R-Car LVDS encoder units support dual-link operations by splitting
> the pixel output between the primary encoder and the companion one.

s/companion one/companion encoder/

> Currently the companion encoder fails at probe time, causing the
> registration of the primary to fail as well, preventing the whole DU unit
> from being registered at all.
> 
> Fix this by not bailing out from probe with error if the
> "renesas,companion" property is not specified.
> 
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree, thank you.

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index bada7ee98544..0b872d00760b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -662,10 +662,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> 
>  	/* Locate the companion LVDS encoder for dual-link operation, if any. */
>  	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
> -	if (!companion) {
> -		dev_err(dev, "Companion LVDS encoder not found\n");
> -		return -ENXIO;
> -	}
> +	if (!companion)
> +		return 0;
> 
>  	/*
>  	 * Sanity check: the companion encoder must have the same compatible

-- 
Regards,

Laurent Pinchart
