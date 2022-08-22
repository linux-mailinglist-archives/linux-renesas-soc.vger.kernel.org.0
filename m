Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F350259BC32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 11:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiHVJCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 05:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbiHVJCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 05:02:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C732E6A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 02:02:12 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53E1B2B3;
        Mon, 22 Aug 2022 11:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661158929;
        bh=l7c+TSJ1iBKKt9gfi1VQ28jwwX8hDAVmGrLnyE1ukT8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aZa+Z3MP/ooI3L5KZqanVwlmgylVyygVZszDynecHXKLWrvJ0vca/CQh7xa9eFLxR
         OYq3minerFlcw6S77vHkll4oOW8jCtzAvA9Vve+DCyCH7EDQqKGxQx66EpZv+hZDGn
         fPYBOipv8U9psNZ3RqTbu5bHBMOxIOQkRQV317KA=
Message-ID: <2fc7e0a5-95c7-55a2-1eb3-311e65cc02b6@ideasonboard.com>
Date:   Mon, 22 Aug 2022 12:02:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] drm: rcar-du: fix DSI enable & disable sequence
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
 <20220817132803.85373-3-tomi.valkeinen@ideasonboard.com>
 <Yv7owItpQ/OlpoWm@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yv7owItpQ/OlpoWm@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 19/08/2022 04:34, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 17, 2022 at 04:28:03PM +0300, Tomi Valkeinen wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The rcar crtc depends on the clock provided from the rcar DSI bridge.
>> When the DSI bridge is disabled, the clock is stopped, which causes the
>> crtc disable to timeout.
>>
>> Also, while I have no issue with the enable, the documentation suggests
>> to enable the DSI before the crtc so that the crtc has its clock enabled
>> at enable time. This is also not done by the current driver.
>>
>> To fix this, we need to keep the DSI bridge enabled until the crtc has
>> disabled itself, and enable the DSI bridge before crtc enables itself.
>>
>> Add functions (rcar_mipi_dsi_atomic_early_enable and
>> rcar_mipi_dsi_atomic_late_disable) to the rcar DSI bridge driver which
>> the rcar driver can use to enable/disable the DSI clock when needed.
>> This is similar to what is already done with the rcar LVDS bridge.
> 
> I had hoped we could avoid that :-(
> 
> I wonder if we could instead rely on the pre_enable/post_disable bridge
> operations, with a custom commit tail implementation to order those
> before/after the CRTC enable/disable respectively. That would be pretty
> complex though, so probably not worth it.

I think so, especially as we already have a similar case for LVDS, and 
these custom calls are quite simple to implement and understand. I fear 
a custom commit implementation would be a much bigger maintenance burden 
for little, if any, benefit.

> Thinking more about this, I wonder why pre_enable is not called before
> enabling the CRTC in the DRM atomic helpers. That would make more sense
> to me, but I suppose changing it would break too many things ? I think
> it should at least be discussed to figure out if it was a historical
> oversight or if there was a good reason. It's *really* not nice to poke
> holes through the abstraction layers like this.

Yes, I'll bring this question to #dri-devel. But I think it's better to 
get the issue fixed with a custom function call as done in this patch, 
and hope that we can do the work in a standard way in the future.

>> Also add a new function, rcar_mipi_dsi_stop_video(), called from
>> rcar_mipi_dsi_atomic_enable so that the DSI TX gets disabled at the
>> correct time, even if the clocks are still kept enabled.
> 
> I think this should be split to a separate patch, possibly before this
> one, it addresses a separate issue.

I agree.

>> And, while possibly not strictly needed, clear clock related enable bits
>> in rcar_mipi_dsi_atomic_late_disable to mirror the sequence done in
>> rcar_mipi_dsi_startup() (via rcar_mipi_dsi_atomic_early_enable).
> 
> And this too should be a separate patch, possibly bundled with
> rcar_mipi_dsi_stop_video().

Yep. I'll have it in a separate patch as they're somewhat different.

> Have you checked in the BSP code to see if they do the same at disable
> time ?

No, they don't seem to do this.

The steps for stopping of the video transmission is described in the 
doc, but there's no mention I can see of clearing those bits (or rather, 
making sure they are cleared before starting the next enable sequence).

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 +++++++++
>>   drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
>>   drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
>>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 63 +++++++++++++++++++++--
>>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 32 ++++++++++++
>>   5 files changed, 121 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> index fd3b94649a01..51fd1d99f4e8 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -29,6 +29,7 @@
>>   #include "rcar_du_regs.h"
>>   #include "rcar_du_vsp.h"
>>   #include "rcar_lvds.h"
>> +#include "rcar_mipi_dsi.h"
>>   
>>   static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>>   {
>> @@ -733,6 +734,18 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>>   		rcar_cmm_enable(rcrtc->cmm);
>>   	rcar_du_crtc_get(rcrtc);
>>   
> 
> A comment here similar to the LVDS case would be useful. I would
> actually move this below the LVDS code, and write
> 
> 	/*
> 	 * Similarly, on V3U, ...
> 	 */

Ok.

>> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
>> +	    (rstate->outputs &
>> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
>> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
>> +
>> +		/*
>> +		 * Enable the DSI clock output.
>> +		 */
>> +
>> +		rcar_mipi_dsi_atomic_early_enable(bridge, state);
>> +	}
> 
> I was wondering if we could merge the DSI and LVDS clock enabling code,
> including merging the lvds and dsi fields in rcar_du_device, but it
> doesn't seem it will be very clean here.

True, they are quite similar. I didn't want to mix them up as I don't 
have the means to test lvds, nor am I that familiar with the rcar du.

If I'm not mistaken, the difference is that LVDS clock is used for 
non-LVDS output, whereas here the DSI clock is used for DSI output.

>> +
>>   	/*
>>   	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
>>   	 * the DU channel. We need to enable its clock output explicitly if
>> @@ -769,6 +782,18 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>>   	rcar_du_crtc_stop(rcrtc);
>>   	rcar_du_crtc_put(rcrtc);
>>   
>> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
>> +	    (rstate->outputs &
>> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
>> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
>> +
>> +		/*
>> +		 * Disable the DSI clock output.
>> +		 */
>> +
>> +		rcar_mipi_dsi_atomic_late_disable(bridge);
>> +	}
>> +
>>   	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
>>   	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
>>   		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> index 712389c7b3d0..5cfa2bb7ad93 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> @@ -92,6 +92,7 @@ struct rcar_du_device_info {
>>   #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
>>   #define RCAR_DU_MAX_VSPS		4
>>   #define RCAR_DU_MAX_LVDS		2
>> +#define RCAR_DU_MAX_DSI			2
>>   
>>   struct rcar_du_device {
>>   	struct device *dev;
>> @@ -108,6 +109,7 @@ struct rcar_du_device {
>>   	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
>>   	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
>>   	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
>> +	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
>>   
>>   	struct {
>>   		struct drm_property *colorkey;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> index 60d6be78323b..ac93e08e8af4 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> @@ -84,6 +84,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>>   		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>>   		    output == RCAR_DU_OUTPUT_LVDS1)
>>   			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
>> +
>> +		if (output == RCAR_DU_OUTPUT_DSI0 ||
>> +		    output == RCAR_DU_OUTPUT_DSI1)
>> +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
>>   	}
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> index 62f7eb84ab01..1ec40e40fd08 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
>>   	return 0;
>>   }
>>   
>> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
>> +{
>> +	u32 status;
>> +	int ret;
>> +
>> +	/* Disable transmission in video mode. */
>> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_ACT),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
>> +		return;
>> +	}
>> +
>> +	/* Assert video FIFO clear. */
>> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_VFRDY),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
>> +		return;
>> +	}
>> +}
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Bridge
>>    */
>> @@ -558,7 +586,22 @@ static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
>>   static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>>   					struct drm_bridge_state *old_bridge_state)
>>   {
>> -	struct drm_atomic_state *state = old_bridge_state->base.state;
>> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>> +
>> +	rcar_mipi_dsi_start_video(dsi);
>> +}
>> +
>> +static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *old_bridge_state)
>> +{
>> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>> +
>> +	rcar_mipi_dsi_stop_video(dsi);
>> +}
>> +
>> +void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
>> +				       struct drm_atomic_state *state)
>> +{
>>   	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>>   	const struct drm_display_mode *mode;
>>   	struct drm_connector *connector;
>> @@ -586,8 +629,6 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>>   	if (ret < 0)
>>   		goto err_dsi_start_hs;
>>   
>> -	rcar_mipi_dsi_start_video(dsi);
>> -
>>   	return;
>>   
>>   err_dsi_start_hs:
>> @@ -595,15 +636,27 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>>   err_dsi_startup:
>>   	rcar_mipi_dsi_clk_disable(dsi);
>>   }
>> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_early_enable);
>>   
>> -static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>> -					 struct drm_bridge_state *old_bridge_state)
>> +void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge)
>>   {
>>   	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>>   
>> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
>> +
>> +	/* Disable DOT clock */
>> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
>> +
>> +	/* CFGCLK disable */
>> +	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
>> +
>> +	/* LPCLK disable */
>> +	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
>> +
>>   	rcar_mipi_dsi_shutdown(dsi);
>>   	rcar_mipi_dsi_clk_disable(dsi);
>>   }
>> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_late_disable);
>>   
>>   static enum drm_mode_status
>>   rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
>> new file mode 100644
>> index 000000000000..1764abf65a34
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * R-Car DSI Encoder
>> + *
>> + * Copyright (C) 2022 Renesas Electronics Corporation
>> + *
>> + * Contact: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> + */
>> +
>> +#ifndef __RCAR_MIPI_DSI_H__
>> +#define __RCAR_MIPI_DSI_H__
>> +
>> +struct drm_bridge;
>> +struct drm_atomic_state;
> 
> Alphabetical order please.

Ok.

>> +
>> +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
>> +void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
>> +				       struct drm_atomic_state *state);
>> +void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge);
> 
> It would be nice to have a naming scheme consistent with rcar_lvds.h.
> That would mean rcar_mipi_dsi_clk_{enable,disable}(), or renaming the
> LVDS functions to match whatever name would be picked here.
> 
> We could name the functions pre_enable/post_disable to show what they
> should really be, if it wasn't for the DRM atomic helpers calling the
> bridge operations at the wrong time.

DSI already has rcar_mipi_dsi_clk_enable(). I'll try to figure out a 
suitable common naming.

  Tomi
