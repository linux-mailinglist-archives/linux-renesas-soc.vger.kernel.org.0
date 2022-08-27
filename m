Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6265A3351
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Aug 2022 03:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiH0BHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 21:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiH0BHY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 21:07:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562FFAF4BA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 18:07:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 122C64A8;
        Sat, 27 Aug 2022 03:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661562441;
        bh=m8ksfH8nmGsyi5xEncklMbzTnnb0HB+1yaYcqVa1Zgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SgrV/ylf4F8lYCjmqYu7MUo/LM+lesZNHUMCUgNrb6+ulCA4JGN9E15ei6EBQFOlw
         BgCuJTWKegO9yKdVjG+85dVGytF1/enMCxew27lQtwU+fsCdNaRo6aoT6unZAsd0s/
         iJcVRMQNBqABrysRuJ/3q9rUoDFQ/T3eZoVeW5jk=
Date:   Sat, 27 Aug 2022 04:07:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
Message-ID: <YwluQWegvcoW3w/d@pendragon.ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 24, 2022 at 04:00:32PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The blanking related registers are 8 bits, so reject any modes
> with larger blanking periods.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba84215c1511..f085a037ff5b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->clock > 594000)
>  		return MODE_CLOCK_HIGH;
>  
> +	/*
> +	 * The blanking related registers are 8 bits, so reject any modes

s/blanking register/blanking-related/

> +	 * with larger blanking periods.
> +	 */
> +
> +	if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +		return MODE_HBLANK_WIDE;
> +
> +	if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +		return MODE_VBLANK_WIDE;
> +
> +	if ((mode->hsync_end - mode->hsync_start) > 0xff)
> +		return MODE_HSYNC_WIDE;
> +
> +	if ((mode->vsync_end - mode->vsync_start) > 0xff)
> +		return MODE_VSYNC_WIDE;
> +
> +	if ((mode->htotal - mode->hsync_end) > 0xff)
> +		return MODE_HBLANK_WIDE;
> +
> +	if ((mode->vtotal - mode->vsync_end) > 0xff)
> +		return MODE_VBLANK_WIDE;

You could drop all inner parentheses. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	return MODE_OK;
>  }
>  

-- 
Regards,

Laurent Pinchart
