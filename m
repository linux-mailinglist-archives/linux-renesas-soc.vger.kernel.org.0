Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B0869763A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 07:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjBOGU7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 01:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBOGU6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 01:20:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BCC2A9A0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 22:20:56 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05AD527C;
        Wed, 15 Feb 2023 07:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676442054;
        bh=/LST5Btzg0OoUoDYCh6nxRCPL83lIzlzxzll4jc+hBo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kAMcqyxXHEPNdxgtrWC4rXYjnP7O1WiC4jpQ5zlzqhINJi8vbFnv/UxY/WA0fjjE/
         +7q2PBbuK6tcuOcter/JWAMr1w+QcYos3luHIcJjj/kWqDaMEjgrQYeFpAGOIqF9FC
         9fXAbndeqf0bAKkobCwqH57pxlxO4Yub0VTCjSeo=
Message-ID: <97145393-8509-b5eb-0c1e-666179f3203f@ideasonboard.com>
Date:   Wed, 15 Feb 2023 08:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm: rcar-du: lvds: Move LVDS enable code to separate
 code section
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/02/2023 02:37, Laurent Pinchart wrote:
> To prepare for a rework of the LVDS disable code, which will need to be
> called from rcar_lvds_pclk_disable(), move the LVDS enable code,
> currently stored in the __rcar_lvds_atomic_enable() function, to a
> separate code section separate from bridge operations. It will be then
> extended with the LVDS disable code.
> 
> As part of this rework the __rcar_lvds_atomic_enable() function is
> renamed to rcar_lvds_enable() to more clearly indicate its purpose.
> 
> No functional change intended.

The desc is a bit confusing, as it talks about moving LVDS enable code, 
but the diff shows you moving the lvds pclk enable/disable code. Other 
than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 97 +++++++++++++++--------------
>   1 file changed, 50 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 61de18af62e6..70cdd5ec64d5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -311,46 +311,7 @@ static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
>   }
>   
>   /* -----------------------------------------------------------------------------
> - * Clock - D3/E3 only
> - */
> -
> -int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
> -{
> -	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -	int ret;
> -
> -	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> -		return -ENODEV;
> -
> -	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
> -
> -	ret = pm_runtime_resume_and_get(lvds->dev);
> -	if (ret)
> -		return ret;
> -
> -	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(rcar_lvds_pclk_enable);
> -
> -void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
> -{
> -	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -
> -	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> -		return;
> -
> -	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
> -
> -	rcar_lvds_write(lvds, LVDPLLCR, 0);
> -
> -	pm_runtime_put_sync(lvds->dev);
> -}
> -EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
> -
> -/* -----------------------------------------------------------------------------
> - * Bridge
> + * Enable/disable
>    */
>   
>   static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
> @@ -394,10 +355,10 @@ static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
>   	return mode;
>   }
>   
> -static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> -				      struct drm_atomic_state *state,
> -				      struct drm_crtc *crtc,
> -				      struct drm_connector *connector)
> +static void rcar_lvds_enable(struct drm_bridge *bridge,
> +			     struct drm_atomic_state *state,
> +			     struct drm_crtc *crtc,
> +			     struct drm_connector *connector)
>   {
>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>   	u32 lvdhcr;
> @@ -410,8 +371,7 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   
>   	/* Enable the companion LVDS encoder in dual-link mode. */
>   	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> -		__rcar_lvds_atomic_enable(lvds->companion, state, crtc,
> -					  connector);
> +		rcar_lvds_enable(lvds->companion, state, crtc, connector);
>   
>   	/*
>   	 * Hardcode the channels and control signals routing for now.
> @@ -531,6 +491,49 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>   }
>   
> +/* -----------------------------------------------------------------------------
> + * Clock - D3/E3 only
> + */
> +
> +int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	int ret;
> +
> +	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> +		return -ENODEV;
> +
> +	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
> +
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret)
> +		return ret;
> +
> +	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_pclk_enable);
> +
> +void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> +		return;
> +
> +	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
> +
> +	rcar_lvds_write(lvds, LVDPLLCR, 0);
> +
> +	pm_runtime_put_sync(lvds->dev);
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
>   static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   				    struct drm_bridge_state *old_bridge_state)
>   {
> @@ -542,7 +545,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   							     bridge->encoder);
>   	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>   
> -	__rcar_lvds_atomic_enable(bridge, state, crtc, connector);
> +	rcar_lvds_enable(bridge, state, crtc, connector);
>   }
>   
>   static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,

