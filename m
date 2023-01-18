Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925D2672AA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 22:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjARVjV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 16:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjARViw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 16:38:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B219F37558
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 13:38:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EBEB1056;
        Wed, 18 Jan 2023 22:38:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674077930;
        bh=g4a61xo/wohp0jeCGl3XfewXzV5bJcwU2f3bGmMmiXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3owK3PAGGzFiaUwCOboE3YdAtQVqpHeqYxZc2LmseIWPE4iXDw+AEiALy6Sto+np
         pK+LN41hs6kPdCiLeL6jpvliofFtynjPOcTs74ca9IBMnY/pvb3VzMVvMUHz+Uxkck
         TIqKz5Nl5mviTKZXsMNeq4YFBk2VXXVXcExhhjRE=
Date:   Wed, 18 Jan 2023 23:38:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Message-ID: <Y8hm54mvZEcBaBo8@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-6-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-6-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:53PM +0200, Tomi Valkeinen wrote:
> On H3 ES1 two bits in DPLLCR are used to select the DU input dot clock

s/ES1/ES1.x/

Same below.

> source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
> non-ES1, only the higher bits are used (bits 21 and 23), and the lower
> bits are reserved and should be set to 0 (or not set at all).

How do you not set a bit ? :-)

> The current code always sets the lower bits, even on non-ES1.

I think that's harmless, and not worth making the driver more complex,
but I'll stop fighting.

> For both DU1 and DU2, on all SoC versions, when writing zeroes to those
> bits the input clock is DCLKIN, and thus there's no difference between
> ES1 and non-ES1.
> 
> For DU1, writing 0b10 to the bits (or only writing the higher bit)
> results in using PLL0 as the input clock, so in this case there's also
> no difference between ES1 and non-ES1.
> 
> However, for DU2, writing 0b10 to the bits results in using PLL0 as the
> input clock on ES1, whereas on non-ES1 it results in using PLL1. On ES1
> you need to write 0b11 to select PLL1.
> 
> The current code always writes 0b11 to PLCS0 field to select PLL1 on all
> SoC versions, which works but causes an illegal (in the sense of not
> allowed by the documentation) write to a reserved bit field.
> 
> To remove the illegal bit write on PLSC0 we need to handle the input dot
> clock selection differently for ES1 and non-ES1.
> 
> Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this, and a new
> rcar_du_device_info entry for the ES1 SoC. Using these, we can always

The new entry was added in the previous patch already.

> set the bit 21 on PLSC0 when choosing the PLL as the source clock, and
> additionally set the bit 20 when on ES1.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 ++-
>  4 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index f2d3266509cc..8d660a6141bf 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -245,12 +245,20 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
>  		       | DPLLCR_STBY;
>  
> -		if (rcrtc->index == 1)
> +		if (rcrtc->index == 1) {
>  			dpllcr |= DPLLCR_PLCS1
>  			       |  DPLLCR_INCS_DOTCLKIN1;
> -		else
> +		} else {
>  			dpllcr |= DPLLCR_PLCS0
>  			       |  DPLLCR_INCS_DOTCLKIN0;
> +			/*
> +			 * On H3 ES1.x, in addition to setting bit 21 (PLCS0),
> +			 * also bit 20 has to be set to select PLL1 as the
> +			 * clock source.

I'd add "On ES2 and newer, PLL1 is selected unconditionally.".

> +			 */
> +			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
> +				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1_SEL;
> +		}
>  
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index ba2e069fc0f7..d689f2510081 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -394,7 +394,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> -	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
> +	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
> +		| RCAR_DU_QUIRK_H3_ES1_PLL,
>  	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index df87ccab146f..acc3673fefe1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -35,6 +35,7 @@ struct rcar_du_device;
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
> +#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
>  
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index c1bcb0e8b5b4..94d913f66c8f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -288,7 +288,8 @@
>   * isn't implemented by other SoC in the Gen3 family it can safely be set
>   * unconditionally.
>   */

This comment should be dropped.

> -#define DPLLCR_PLCS0		(3 << 20)
> +#define DPLLCR_PLCS0		(1 << 21)
> +#define DPLLCR_PLCS0_H3ES1X_PLL1_SEL	(1 << 20)

Bit 21 selects between DCLKIN (when 0) and PLL (when 1). On ES1.x, bit
20 selects between PLL0 (when 0) and PLL1 (when 1), while on ES2 and
newer, PLL1 is selected unconditionally. Could we name the two bits
accodingly ? Maybe

#define DPLLCR_PLCS0_PLL	(1 << 21)
#define DPLLCR_PLCS0_PLL1	(1 << 20)

>  #define DPLLCR_CLKE		(1 << 18)
>  #define DPLLCR_FDPLL(n)		((n) << 12)
>  #define DPLLCR_N(n)		((n) << 5)

-- 
Regards,

Laurent Pinchart
