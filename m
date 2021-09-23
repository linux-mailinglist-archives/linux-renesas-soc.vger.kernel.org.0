Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBEA4154A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 02:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbhIWAdv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 20:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238631AbhIWAdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 20:33:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24BDC061574;
        Wed, 22 Sep 2021 17:32:20 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BC26E52;
        Thu, 23 Sep 2021 02:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632357138;
        bh=Bk/Z84sp/VzbOFA+xPFH2aKt1Gvw4SeeCJH1l/8Vk1k=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=G3Zd9oZ0hydsWCLC4GaU7rmU4HuXMtmJwX2Xo1EN6Aj+lnREqDcX2LtTgKhDxlFRI
         Z96Wegfg2GYyJtay233sBtK3mMUjLok3LzdlvC0Zgj2o5Tmm4KEF7eFMaGR1+dRdgU
         jV9LBBaPWNHwyNtK5N2xE1Dj1QxE8xMKZCBzRRAQ=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 6/6] drm: rcar-du: Add r8a779a0 device support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
 <20210922234726.3337265-7-kieran.bingham@ideasonboard.com>
 <YUvDdFeD64+PuHSC@pendragon.ideasonboard.com>
Message-ID: <af5038de-6c0a-d05f-4608-1ce1ad6c65c4@ideasonboard.com>
Date:   Thu, 23 Sep 2021 01:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUvDdFeD64+PuHSC@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 23/09/2021 00:59, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Sep 23, 2021 at 12:47:26AM +0100, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Extend the rcar_du_device_info structure and rcar_du_output enum to
>> support DSI outputs and utilise these additions to provide support for
>> the R8A779A0 V3U platform.
>>
>> While the DIDSR register field is now named "DSI/CSI-2-TX-IF0 Dot Clock
>> Select" the existing define LVDS0 is used, and is directly compatible
>> from other DU variants.
> 
> That's not true anymore :-) The paragraph can simply be dropped.
> 

Agreed.

>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> ---
>>
>> v3:
>>  - Introduce DIDSR_LDCS_DSI macro
>>
>> v2:
>>  - No longer requires a direct interface with the DSI encoder
>>  - Use correct field naming (LDCS)
>>  - Remove per-crtc clock feature.
>>
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 ++
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 20 ++++++++++++++++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 ++
>>  drivers/gpu/drm/rcar-du/rcar_du_group.c |  2 ++
>>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  1 +
>>  5 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> index 440e6b4fbb58..26e79b74898c 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> @@ -96,6 +96,8 @@ struct rcar_du_crtc_state {
>>  enum rcar_du_output {
>>  	RCAR_DU_OUTPUT_DPAD0,
>>  	RCAR_DU_OUTPUT_DPAD1,
>> +	RCAR_DU_OUTPUT_DSI0,
>> +	RCAR_DU_OUTPUT_DSI1,
>>  	RCAR_DU_OUTPUT_HDMI0,
>>  	RCAR_DU_OUTPUT_HDMI1,
>>  	RCAR_DU_OUTPUT_LVDS0,
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> index 8a094d5b9c77..8b4c8851b6bc 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -489,6 +489,25 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>>  };
>>  
>> +static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>> +	.gen = 3,
>> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
>> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>> +	.channels_mask = BIT(1) | BIT(0),
>> +	.routes = {
>> +		/* R8A779A0 has two MIPI DSI outputs. */
>> +		[RCAR_DU_OUTPUT_DSI0] = {
>> +			.possible_crtcs = BIT(0),
>> +			.port = 0,
>> +		},
>> +		[RCAR_DU_OUTPUT_DSI1] = {
>> +			.possible_crtcs = BIT(1),
>> +			.port = 1,
>> +		},
>> +	},
>> +	.dsi_clk_mask =  BIT(1) | BIT(0),
>> +};
>> +
>>  static const struct of_device_id rcar_du_of_table[] = {
>>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>> @@ -513,6 +532,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>>  	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
>>  	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
>>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>> +	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>>  	{ }
>>  };
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> index 5fe9152454ff..cf98d43d72d0 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> @@ -57,6 +57,7 @@ struct rcar_du_output_routing {
>>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
>>   * @num_lvds: number of internal LVDS encoders
>>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
>> + * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
>>   */
>>  struct rcar_du_device_info {
>> @@ -67,6 +68,7 @@ struct rcar_du_device_info {
>>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>>  	unsigned int num_lvds;
>>  	unsigned int dpll_mask;
>> +	unsigned int dsi_clk_mask;
>>  	unsigned int lvds_clk_mask;
>>  };
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> index a984eef265d2..8665a1dd2186 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> @@ -124,6 +124,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>>  		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
>>  			didsr |= DIDSR_LDCS_LVDS0(i)
>>  			      |  DIDSR_PDCS_CLK(i, 0);
>> +		else if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index))
>> +			didsr |= DIDSR_LDCS_DSI(i);
>>  		else
>>  			didsr |= DIDSR_LDCS_DCLKIN(i)
>>  			      |  DIDSR_PDCS_CLK(i, 0);
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> index fb7c467aa484..9484215b51e2 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> @@ -258,6 +258,7 @@
>>  #define DIDSR			0x20028
>>  #define DIDSR_CODE		(0x7790 << 16)
>>  #define DIDSR_LDCS_DCLKIN(n)	(0 << (8 + (n) * 2))
>> +#define DIDSR_LDCS_DSI(n)	(2 << (8 + (n) * 2))
> 
> I'd add a /* V3U only */ comment at the end.
> 
> I can address those two small issues when applying.

Thanks

> 
>>  #define DIDSR_LDCS_LVDS0(n)	(2 << (8 + (n) * 2))
>>  #define DIDSR_LDCS_LVDS1(n)	(3 << (8 + (n) * 2))
>>  #define DIDSR_LDCS_MASK(n)	(3 << (8 + (n) * 2))
> 
