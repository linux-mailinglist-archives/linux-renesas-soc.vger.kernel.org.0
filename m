Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091EA1A62B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 07:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgDMFn5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 01:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgDMFn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 01:43:57 -0400
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85191C008676
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2020 22:43:56 -0700 (PDT)
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2B27F80487;
        Mon, 13 Apr 2020 07:43:54 +0200 (CEST)
Date:   Mon, 13 Apr 2020 07:43:52 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm: bridge: simple-bridge: Make connector creation
 optional
Message-ID: <20200413054352.GB6324@ravnborg.org>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=FLFezM2ub9r-TSLOdQ0A:9
        a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 09, 2020 at 03:36:36AM +0300, Laurent Pinchart wrote:
> Make the connector creation optional to enable usage of the
> simple-bridge with the DRM bridge connector helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looks straightforward.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Some rambling below you can ignore.

	Sam

> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index bac223d0430d..bad638088029 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -101,16 +101,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);

The code below uses both sbridge-> and bridge->
It confused me that we access via bridge-> when possilbe and only
reverts to the "upper" sbridge when needed.
This is unrelated to this patch - just an observation.
It makes code shorter so I can see why it is done.

>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
>  	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret < 0)
>  		return ret;
>  
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Missing encoder\n");
>  		return -ENODEV;
> @@ -127,8 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	drm_connector_attach_encoder(&sbridge->connector,
> -					  bridge->encoder);
> +	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
Unrelated change, but patch is trivial...

>  
>  	return 0;
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
