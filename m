Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949513997E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 01:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731683AbfFGXLS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 19:11:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35716 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731572AbfFGXLR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 19:11:17 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 405F431A;
        Sat,  8 Jun 2019 01:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559949075;
        bh=O1d4fI2hjcFUdAePFcb3X1l70C+/J97TPij48Fbmu0o=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lQeAnQyw+NZUXEp3SNli2CfSOI32W87OVdGK+NF6ugDWoCNxwS4ZnN1H+stSh8w1O
         0fpaYfGpoZZJnBDfbTwy38f2hLXY2JaF6tCBAAu5CL1gjYgfDPH1O00+3ATIRVxuWe
         ua2ygYwpZv5JmInRJtNHR3xG4PU/T3tj38iRAuTE=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 06/10] drm: rcar-du: lvds: Add support for dual-link
 mode
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-7-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <15bbaede-8e2f-c192-81cd-dd0a55fa0822@ideasonboard.com>
Date:   Sat, 8 Jun 2019 00:11:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-7-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 28/05/2019 15:12, Laurent Pinchart wrote:
> In dual-link mode the LVDS0 encoder transmits even-numbered pixels, and
> sends odd-numbered pixels to the LVDS1 encoder for transmission on a
> separate link.
> 
> To implement support for this mode of operation, determine if the LVDS
> connection operates in dual-link mode by querying the next device in the
> pipeline, locate the companion encoder, and control it directly through
> its bridge operations.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Looks good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
> Changes since v2:
> 
> - Fail probe if the companion controller can't be found or is invalid
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 107 ++++++++++++++++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
>  2 files changed, 99 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index a331f0c32187..d090191e858e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -66,6 +66,9 @@ struct rcar_lvds {
>  
>  	struct drm_display_mode display_mode;
>  	enum rcar_lvds_mode mode;
> +
> +	struct drm_bridge *companion;
> +	bool dual_link;
>  };
>  
>  #define bridge_to_rcar_lvds(bridge) \
> @@ -400,11 +403,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  	const struct drm_display_mode *mode = &lvds->display_mode;
> -	/*
> -	 * FIXME: We should really retrieve the CRTC through the state, but how
> -	 * do we get a state pointer?
> -	 */
> -	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
>  	u32 lvdhcr;
>  	u32 lvdcr0;
>  	int ret;
> @@ -413,6 +411,10 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	if (ret < 0)
>  		return;
>  
> +	/* Enable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->enable(lvds->companion);
> +
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
>  	 *
> @@ -435,17 +437,33 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>  
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> -		/* Disable dual-link mode. */
> -		rcar_lvds_write(lvds, LVDSTRIPE, 0);
> +		/*
> +		 * Configure vertical stripe based on the mode of operation of
> +		 * the connected device.
> +		 */
> +		rcar_lvds_write(lvds, LVDSTRIPE,
> +				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
>  	}
>  
> -	/* PLL clock configuration. */
> -	lvds->info->pll_setup(lvds, mode->clock * 1000);
> +	/*
> +	 * PLL clock configuration on all instances but the companion in
> +	 * dual-link mode.
> +	 */
> +	if (!lvds->dual_link || lvds->companion)
> +		lvds->info->pll_setup(lvds, mode->clock * 1000);
>  
>  	/* Set the LVDS mode and select the input. */
>  	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> -	if (drm_crtc_index(crtc) == 2)
> -		lvdcr0 |= LVDCR0_DUSEL;
> +
> +	if (lvds->bridge.encoder) {
> +		/*
> +		 * FIXME: We should really retrieve the CRTC through the state,
> +		 * but how do we get a state pointer?
> +		 */
> +		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
> +			lvdcr0 |= LVDCR0_DUSEL;
> +	}
> +
>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>  
>  	/* Turn all the channels on. */
> @@ -512,6 +530,10 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
> +	/* Disable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->disable(lvds->companion);
> +
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
>  
> @@ -628,10 +650,57 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.mode_set = rcar_lvds_mode_set,
>  };
>  
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	return lvds->dual_link;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
> +
>  /* -----------------------------------------------------------------------------
>   * Probe & Remove
>   */
>  
> +static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *companion;
> +	struct device *dev = lvds->dev;
> +	int ret = 0;
> +
> +	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> +	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
> +	if (!companion) {
> +		dev_err(dev, "Companion LVDS encoder not found\n");
> +		return -ENXIO;
> +	}
> +
> +	/*
> +	 * Sanity check: the companion encoder must have the same compatible
> +	 * string.
> +	 */
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!of_device_is_compatible(companion, match->compatible)) {
> +		dev_err(dev, "Companion LVDS encoder is invalid\n");
> +		ret = -ENXIO;
> +		goto done;
> +	}
> +
> +	lvds->companion = of_drm_find_bridge(companion);
> +	if (!lvds->companion) {
> +		ret = -EPROBE_DEFER;
> +		goto done;
> +	}
> +
> +	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> +
> +done:
> +	of_node_put(companion);
> +
> +	return ret;
> +}
> +
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
>  	struct device_node *local_output = NULL;
> @@ -682,14 +751,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  
>  	if (is_bridge) {
>  		lvds->next_bridge = of_drm_find_bridge(remote);
> -		if (!lvds->next_bridge)
> +		if (!lvds->next_bridge) {
>  			ret = -EPROBE_DEFER;
> +			goto done;
> +		}
> +
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			lvds->dual_link = lvds->next_bridge->timings
> +					? lvds->next_bridge->timings->dual_link
> +					: false;
>  	} else {
>  		lvds->panel = of_drm_find_panel(remote);
> -		if (IS_ERR(lvds->panel))
> +		if (IS_ERR(lvds->panel)) {
>  			ret = PTR_ERR(lvds->panel);
> +			goto done;
> +		}
>  	}
>  
> +	if (lvds->dual_link)
> +		ret = rcar_lvds_parse_dt_companion(lvds);
> +
>  done:
>  	of_node_put(local_output);
>  	of_node_put(remote_input);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> index a709cae1bc32..222ec0e60785 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -15,6 +15,7 @@ struct drm_bridge;
>  #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge);
>  #else
>  static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  				       unsigned long freq)
> @@ -22,6 +23,10 @@ static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  	return -ENOSYS;
>  }
>  static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
> +static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_DRM_RCAR_LVDS */
>  
>  #endif /* __RCAR_LVDS_H__ */
> 

-- 
Regards
--
Kieran
