Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF7AF7EF13
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfHBIWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:22:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfHBIWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:22:13 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D4CCC;
        Fri,  2 Aug 2019 10:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564734131;
        bh=VgdL0PFfWAynREcrc/v61AFgKdHD544UedHtCeN9bZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLdvB3uy+1uzNO8J9YA5iR7kxx0IWo1rTINLSEmUQ30eeqchNTDSt5ogc2k+VDQDP
         I/8yjwzd20GMDpmyRP48GAOZE+DUKa3EtR9s6C1yHageiAp/F660EPmnZ6POXu7Jge
         UHGKOxlfvqY8yBRgMNfA/HqiGtPvnmtNFQ6yqu34=
Date:   Fri, 2 Aug 2019 11:22:09 +0300
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
Subject: Re: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Message-ID: <20190802082209.GI5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:05AM +0100, Fabrizio Castro wrote:
> Using name "bridge" for macro bridge_to_rcar_lvds argument doesn't
> work when the pointer name used by the caller is not "bridge".
> Rename the argument to "bridge_ptr" to allow for any pointer
> name.
> 
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 97c51c2..edd63f5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -72,8 +72,8 @@ struct rcar_lvds {
>  	bool stripe_swap_data;
>  };
>  
> -#define bridge_to_rcar_lvds(bridge) \
> -	container_of(bridge, struct rcar_lvds, bridge)
> +#define bridge_to_rcar_lvds(bridge_ptr) \
> +	container_of(bridge_ptr, struct rcar_lvds, bridge)

How about just 'b' instead of 'bridge_ptr' ? If that's fine with you
I'll take the modified patch in my tree, no need to resubmit.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  #define connector_to_rcar_lvds(connector) \
>  	container_of(connector, struct rcar_lvds, connector)

-- 
Regards,

Laurent Pinchart
