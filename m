Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4332D11ED19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 22:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMVl5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 16:41:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59072 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLMVl5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 16:41:57 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C548A9D6;
        Fri, 13 Dec 2019 22:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576273316;
        bh=t5bAuI7IPLlm5mpJ9LwRwRzISVV2tE9EKaG7gmQn18Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JuOGdNKUkqakSrplVGU8RiV4mAjbKWhN1ZHLip3jTHCcSt7+2GN2Q3CiY95S71itP
         n4V35RY0bawu6dyICQUOm77xjaOMHEF2I/2yhMYNo9v8OCXdKvbQ+Jqx9TdCKyM799
         HdfhShv2YMrR2WQLYxQhmBzO9YwdVoaSpqfvPfTM=
Date:   Fri, 13 Dec 2019 23:41:46 +0200
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
Subject: Re: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Message-ID: <20191213214146.GP4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:52PM +0000, Fabrizio Castro wrote:
> Primary and companion encoders need to set the same mode for
> things to work properly.
> 
> rcar_lvds_mode_set gets called into for the primary encoder only,
> therefore initialize the companion encoder mode while sorting
> the primary encoder mode out.
> 
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Would you mind rebasing this on top of "drm: rcar-du: lvds: Get mode
from state" ?

> ---
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index cb2147c..eed5611 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -614,6 +614,18 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
>  	lvds->display_mode = *adjusted_mode;
>  
>  	rcar_lvds_get_lvds_mode(lvds);
> +	if (lvds->companion) {
> +		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
> +							lvds->companion);
> +
> +		/*
> +		 * FIXME: We should not be messing with the companion encoder
> +		 * private data from the primary encoder, but since
> +		 * rcar_lvds_mode_set gets called into for the primary encoder
> +		 * only, we don't have much of a choice for now.
> +		 */
> +		companion_lvds->mode = lvds->mode;
> +	}
>  }
>  
>  static int rcar_lvds_attach(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart
