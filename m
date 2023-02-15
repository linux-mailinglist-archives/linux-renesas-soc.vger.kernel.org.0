Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03269766F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 07:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBOGaq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 01:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbjBOGan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 01:30:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E8134304
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 22:30:10 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEF5C27C;
        Wed, 15 Feb 2023 07:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676442591;
        bh=982HL0JAcbrCCMkrW+g/7f/6fcMA0cjB70nL+GwpWEs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gJ7ruzb6ytl9IjBcQU4S+T6HNJn6gII+akNhtahuwg/aDIpwWBNRjcnl+saD61XJt
         g9JOuP5qapZZ5rndrZzPkFZ8e45v2USMh9gkhwW2xbbTOVeEmCZk5d5FlX95v/bAB8
         Ovl4JaxYeY7qxgDGKDFIe96X8+8bvlhBYlyDZUNI=
Message-ID: <d910efcb-e910-d506-88e0-08186d3ab3f2@ideasonboard.com>
Date:   Wed, 15 Feb 2023 08:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230214003736.18871-4-laurent.pinchart+renesas@ideasonboard.com>
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
> On R-Car D3 and E3, the LVDS encoder provides the dot (pixel) clock to
> the DU, regardless of whether the LVDS output is used or not. When using
> the DPAD (RGB) output, the DU driver thus enables and disables the LVDS
> PLL manually, while when using the LVDS output, it lets the LVDS bridge
> driver handle the PLL configuration internally as part of the atomic
> enable and disable operations.
> 
> This causes an issue when using the LVDS output. As bridges are disabled
> before CRTCs, the current implementation violates the enable/disable
> sequences documented in the hardware datasheet, which requires the dot
> clock to be enabled before the CRTC is started and disabled after it
> gets stopped.
> 
> Fix the problem by enabling/disabling the LVDS PLL manually from the DU
> regardless of which output is used, and skipping the PLL handling in the
> LVDS bridge atomic enable and disable operations.
> 
> This is however not enough. Disabling the LVDS encoder while leaving the
> PLL on still results in a vertical blanking wait timeout when disabling
> the DU. Investigation showed that the culprit is the LVEN bit. For an
> unclear reason, clearing the bit when disabling the LVDS encoder blocks
> vertical blanking interrupts. We thus have to delay disabling the whole
> LVDS encoder, not just disabling the PLL, until the DU is disabled.
> 
> We could split the LVDS disable sequence by clearing the LVRES bit in
> the LVDS bridge atomic disable handler, and delaying the rest of the
> operations, in order to disable the LVDS output at bridge atomic disable
> time, before stopping the CRTC. This would make the code more complex,
> without a clear benefit, so keep the implementation simple(r).

The asymmetry of all this makes me grit my teeth, but SW has to do what 
SW has to do... Just a minor comment below, other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  18 ++--
>   drivers/gpu/drm/rcar-du/rcar_lvds.c    | 114 +++++++++++++++----------
>   drivers/gpu/drm/rcar-du/rcar_lvds.h    |  12 ++-
>   3 files changed, 86 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 008e172ed43b..71e7fbace38d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -749,16 +749,17 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	/*
>   	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
> -	 * the DU channel. We need to enable its clock output explicitly if
> -	 * the LVDS output is disabled.
> +	 * the DU channel. We need to enable its clock output explicitly before
> +	 * starting the CRTC, as the bridge hasn't been enabled by the atomic
> +	 * helpers yet.
>   	 */
> -	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
> -	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
> +	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
> +		bool dot_clk_only = rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0);
>   		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
>   		const struct drm_display_mode *mode =
>   			&crtc->state->adjusted_mode;
>   
> -		rcar_lvds_pclk_enable(bridge, mode->clock * 1000);
> +		rcar_lvds_pclk_enable(bridge, mode->clock * 1000, dot_clk_only);
>   	}
>   
>   	/*
> @@ -795,15 +796,15 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>   	rcar_du_crtc_stop(rcrtc);
>   	rcar_du_crtc_put(rcrtc);
>   
> -	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
> -	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
> +	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
> +		bool dot_clk_only = rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0);
>   		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
>   
>   		/*
>   		 * Disable the LVDS clock output, see
>   		 * rcar_du_crtc_atomic_enable().
>   		 */

This could mention that when LVDS output is used, also the LVDS output 
is disabled here.

> -		rcar_lvds_pclk_disable(bridge);
> +		rcar_lvds_pclk_disable(bridge, dot_clk_only);
>   	}
>   
>   	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
> @@ -815,7 +816,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>   		 * Disable the DSI clock output, see
>   		 * rcar_du_crtc_atomic_enable().
>   		 */
> -
>   		rcar_mipi_dsi_pclk_disable(bridge);
>   	}
>   
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 70cdd5ec64d5..ca215b588fd7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -269,8 +269,8 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
>   		pll->pll_m, pll->pll_n, pll->pll_e, pll->div);
>   }
>   
> -static void __rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds,
> -					unsigned int freq, bool dot_clock_only)
> +static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds,
> +				      unsigned int freq, bool dot_clock_only)
>   {
>   	struct pll_info pll = { .diff = (unsigned long)-1 };
>   	u32 lvdpllcr;
> @@ -305,11 +305,6 @@ static void __rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds,
>   		rcar_lvds_write(lvds, LVDDIV, 0);
>   }
>   
> -static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
> -{
> -	__rcar_lvds_pll_setup_d3_e3(lvds, freq, false);
> -}
> -
>   /* -----------------------------------------------------------------------------
>    * Enable/disable
>    */
> @@ -425,8 +420,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge,
>   	/*
>   	 * PLL clock configuration on all instances but the companion in
>   	 * dual-link mode.
> +	 *
> +	 * The extended PLL has been turned on by an explicit call to
> +	 * rcar_lvds_pclk_enable() from the DU driver.
>   	 */
> -	if (lvds->link_type == RCAR_LVDS_SINGLE_LINK || lvds->companion) {
> +	if ((lvds->link_type == RCAR_LVDS_SINGLE_LINK || lvds->companion) &&
> +	    !(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
>   		const struct drm_crtc_state *crtc_state =
>   			drm_atomic_get_new_crtc_state(state, crtc);
>   		const struct drm_display_mode *mode =
> @@ -491,11 +490,56 @@ static void rcar_lvds_enable(struct drm_bridge *bridge,
>   	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>   }
>   
> +static void rcar_lvds_disable(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	u32 lvdcr0;
> +
> +	/*
> +	 * Clear the LVDCR0 bits in the order specified by the hardware
> +	 * documentation, ending with a write of 0 to the full register to
> +	 * clear all remaining bits.
> +	 */
> +	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +
> +	lvdcr0 &= ~LVDCR0_LVRES;
> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> +		lvdcr0 &= ~LVDCR0_LVEN;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> +		lvdcr0 &= ~LVDCR0_PWD;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> +		lvdcr0 &= ~LVDCR0_PLLON;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	rcar_lvds_write(lvds, LVDCR0, 0);
> +	rcar_lvds_write(lvds, LVDCR1, 0);
> +
> +	/* The extended PLL is turned off in rcar_lvds_pclk_disable(). */
> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL))
> +		rcar_lvds_write(lvds, LVDPLLCR, 0);
> +
> +	/* Disable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> +		rcar_lvds_disable(lvds->companion);
> +
> +	pm_runtime_put_sync(lvds->dev);
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * Clock - D3/E3 only
>    */
>   
> -int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
> +int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq,
> +			  bool dot_clk_only)
>   {
>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>   	int ret;
> @@ -509,13 +553,13 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>   	if (ret)
>   		return ret;
>   
> -	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> +	rcar_lvds_pll_setup_d3_e3(lvds, freq, dot_clk_only);
>   
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(rcar_lvds_pclk_enable);
>   
> -void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
> +void rcar_lvds_pclk_disable(struct drm_bridge *bridge, bool dot_clk_only)
>   {
>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>   
> @@ -524,6 +568,9 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
>   
>   	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
>   
> +	if (!dot_clk_only)
> +		rcar_lvds_disable(bridge);
> +
>   	rcar_lvds_write(lvds, LVDPLLCR, 0);
>   
>   	pm_runtime_put_sync(lvds->dev);
> @@ -552,42 +599,21 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>   				     struct drm_bridge_state *old_bridge_state)
>   {
>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -	u32 lvdcr0;
>   
>   	/*
> -	 * Clear the LVDCR0 bits in the order specified by the hardware
> -	 * documentation, ending with a write of 0 to the full register to
> -	 * clear all remaining bits.
> +	 * For D3 and E3, disabling the LVDS encoder before the DU would stall
> +	 * the DU, causing a vblank wait timeout when stopping the DU. This has
> +	 * been traced to clearing the LVEN bit, but the exact reason is
> +	 * unknown. Keep the encoder enabled, it will be disabled by an explicit
> +	 * call to rcar_lvds_pclk_disable() from the DU driver.
> +	 *
> +	 * We could clear the LVRES bit already to disable the LVDS output, but
> +	 * that's likely pointless.
>   	 */
> -	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> +		return;
>   
> -	lvdcr0 &= ~LVDCR0_LVRES;
> -	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> -
> -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> -		lvdcr0 &= ~LVDCR0_LVEN;
> -		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> -	}
> -
> -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> -		lvdcr0 &= ~LVDCR0_PWD;
> -		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> -	}
> -
> -	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> -		lvdcr0 &= ~LVDCR0_PLLON;
> -		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> -	}
> -
> -	rcar_lvds_write(lvds, LVDCR0, 0);
> -	rcar_lvds_write(lvds, LVDCR1, 0);
> -	rcar_lvds_write(lvds, LVDPLLCR, 0);
> -
> -	/* Disable the companion LVDS encoder in dual-link mode. */
> -	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> -		rcar_lvds_atomic_disable(lvds->companion, old_bridge_state);
> -
> -	pm_runtime_put_sync(lvds->dev);
> +	rcar_lvds_disable(bridge);
>   }
>   
>   static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> @@ -924,14 +950,12 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77990_info = {
>   	.gen = 3,
>   	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN | RCAR_LVDS_QUIRK_EXT_PLL
>   		| RCAR_LVDS_QUIRK_DUAL_LINK,
> -	.pll_setup = rcar_lvds_pll_setup_d3_e3,
>   };
>   
>   static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>   	.gen = 3,
>   	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN | RCAR_LVDS_QUIRK_PWD
>   		| RCAR_LVDS_QUIRK_EXT_PLL | RCAR_LVDS_QUIRK_DUAL_LINK,
> -	.pll_setup = rcar_lvds_pll_setup_d3_e3,
>   };
>   
>   static const struct of_device_id rcar_lvds_of_table[] = {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> index bee7033b60d6..887c63500000 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -13,17 +13,21 @@
>   struct drm_bridge;
>   
>   #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
> -int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq);
> -void rcar_lvds_pclk_disable(struct drm_bridge *bridge);
> +int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq,
> +			  bool dot_clk_only);
> +void rcar_lvds_pclk_disable(struct drm_bridge *bridge, bool dot_clk_only);
>   bool rcar_lvds_dual_link(struct drm_bridge *bridge);
>   bool rcar_lvds_is_connected(struct drm_bridge *bridge);
>   #else
>   static inline int rcar_lvds_pclk_enable(struct drm_bridge *bridge,
> -					unsigned long freq)
> +					unsigned long freq, bool dot_clk_only)
>   {
>   	return -ENOSYS;
>   }
> -static inline void rcar_lvds_pclk_disable(struct drm_bridge *bridge) { }
> +static inline void rcar_lvds_pclk_disable(struct drm_bridge *bridge,
> +					  bool dot_clock_only)
> +{
> +}
>   static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
>   {
>   	return false;

