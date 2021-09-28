Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FF241AE4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbhI1L6x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 07:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240478AbhI1L6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 07:58:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCDBC061575
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 04:57:14 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0572B3F1;
        Tue, 28 Sep 2021 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632830232;
        bh=lanGYovgtfsarvaafXMDmZJdFykrXCkZrlFgEzJgq20=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=OMTmTQY4LCbfErKge3wwnwpD7/Li5FOycw7le+AMq/hyre7y91ZAUIiltgM8x/8NH
         DjNeBHZJaR1YZJzBQfDoKMPAUj8GP344BwOjPOEL+1wGn2IyiMrz04b1R92LWNHL4J
         aqvNvpKqN9c0e805uNfPnJIct2j/cfS0j9OPcFdc=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS
 outputs
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <bba07a35-4f33-c62e-ea26-6e3fafe79c13@ideasonboard.com>
Date:   Tue, 28 Sep 2021 12:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/08/2021 01:36, Laurent Pinchart wrote:
> On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> even when LVDS outputs are not used. For this reason, the rcar-lvds
> driver probes successfully on those platforms even if no further bridge
> or panel is connected to the LVDS output, in order to provide the
> rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> driver.
> 
> If an LVDS output isn't connected, trying to create a DRM connector for
> the output will fail. Fix this by skipping connector creation in that
> case, and also skip creation of the DRM encoder as there's no point in
> an encoder without a connector.
> 
> Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Perhaps this helps it get upstream...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 16 ++++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.c       | 11 +++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.h       |  5 +++++
>  3 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 0daa8bba50f5..4bf4e25d7f01 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -86,12 +86,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	}
>  
>  	/*
> -	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
> +	 * Create and initialize the encoder. On Gen3, skip the LVDS1 output if
>  	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
> -	 * mode.
> +	 * mode, or any LVDS output if it isn't connected. The latter may happen
> +	 * on D3 or E3 as the LVDS encoders are needed to provide the pixel
> +	 * clock to the DU, even when the LVDS outputs are not used.
>  	 */
> -	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> -		if (rcar_lvds_dual_link(bridge))
> +	if (rcdu->info->gen >= 3) {
> +		if (output == RCAR_DU_OUTPUT_LVDS1 &&
> +		    rcar_lvds_dual_link(bridge))
> +			return -ENOLINK;
> +
> +		if ((output == RCAR_DU_OUTPUT_LVDS0 ||
> +		     output == RCAR_DU_OUTPUT_LVDS1) &&
> +		    !rcar_lvds_is_connected(bridge))
>  			return -ENOLINK;
>  	}
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index d061b8de748f..b672c5bd72ee 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -576,6 +576,9 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  
> +	if (!lvds->next_bridge)
> +		return 0;
> +
>  	return drm_bridge_attach(bridge->encoder, lvds->next_bridge, bridge,
>  				 flags);
>  }
> @@ -598,6 +601,14 @@ bool rcar_lvds_dual_link(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
>  
> +bool rcar_lvds_is_connected(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	return lvds->next_bridge != NULL;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_is_connected);
> +
>  /* -----------------------------------------------------------------------------
>   * Probe & Remove
>   */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> index 222ec0e60785..eb7c6ef03b00 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -16,6 +16,7 @@ struct drm_bridge;
>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge);
> +bool rcar_lvds_is_connected(struct drm_bridge *bridge);
>  #else
>  static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  				       unsigned long freq)
> @@ -27,6 +28,10 @@ static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
>  {
>  	return false;
>  }
> +static inline bool rcar_lvds_is_connected(struct drm_bridge *bridge)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_DRM_RCAR_LVDS */
>  
>  #endif /* __RCAR_LVDS_H__ */
> 
