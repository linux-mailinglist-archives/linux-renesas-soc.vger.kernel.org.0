Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F8AF38F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 20:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfKGTw1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 14:52:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33660 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfKGTw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 14:52:27 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 681F071D;
        Thu,  7 Nov 2019 20:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573156344;
        bh=kazRCQV5JWHrZPbNlTQFxg3ZB3fL5gW+pdi4x+nRfWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O5JEr6omSQikk2K3y0bWvRAqYz3kcAWskkk0TMSRebEr161BrNjX7tdR8E4tCSwZm
         FEaXYawQZCtuJ0iSB138PhoAZkBl17/d62qD8AKaG7dLWsezFfMNLChdtZNtNQZzIg
         jSv2423pD72PNcL+o2sEI5Ltiy4b4jiWpcMN4GNU=
Date:   Thu, 7 Nov 2019 21:52:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: Re: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode
 through bridge timings
Message-ID: <20191107195215.GJ24983@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Aug 28, 2019 at 07:36:39PM +0100, Fabrizio Castro wrote:
> No need to report the input bus mode through bridge timings
> anymore, that's now done through the DT, as specified by the
> dt-bindings.

Doesn't this break backward compatibility with older DT, as mentioned in
the review of 4/8 ?

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * new patch
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 9 ++++-----
>  include/drm/drm_bridge.h              | 8 --------
>  2 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 3d74129b..730f682 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -34,7 +34,7 @@ struct thc63_dev {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next;
>  
> -	struct drm_bridge_timings timings;
> +	bool dual_link;
>  };
>  
>  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> @@ -62,7 +62,7 @@ static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
>  	 * isn't supported by the driver yet, simply derive the limits from the
>  	 * input mode.
>  	 */
> -	if (thc63->timings.dual_link) {
> +	if (thc63->dual_link) {
>  		min_freq = 40000;
>  		max_freq = 150000;
>  	} else {
> @@ -157,13 +157,13 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>  
>  		if (remote) {
>  			if (of_device_is_available(remote))
> -				thc63->timings.dual_link = true;
> +				thc63->dual_link = true;
>  			of_node_put(remote);
>  		}
>  	}
>  
>  	dev_dbg(thc63->dev, "operating in %s-link mode\n",
> -		thc63->timings.dual_link ? "dual" : "single");
> +		thc63->dual_link ? "dual" : "single");
>  
>  	return 0;
>  }
> @@ -221,7 +221,6 @@ static int thc63_probe(struct platform_device *pdev)
>  	thc63->bridge.driver_private = thc63;
>  	thc63->bridge.of_node = pdev->dev.of_node;
>  	thc63->bridge.funcs = &thc63_bridge_func;
> -	thc63->bridge.timings = &thc63->timings;
>  
>  	drm_bridge_add(&thc63->bridge);
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7616f65..3228018 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -362,14 +362,6 @@ struct drm_bridge_timings {
>  	 * input signal after the clock edge.
>  	 */
>  	u32 hold_time_ps;
> -	/**
> -	 * @dual_link:
> -	 *
> -	 * True if the bus operates in dual-link mode. The exact meaning is
> -	 * dependent on the bus type. For LVDS buses, this indicates that even-
> -	 * and odd-numbered pixels are received on separate links.
> -	 */
> -	bool dual_link;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
