Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA016733DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 09:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjASIjC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 03:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjASIjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 03:39:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0545273B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 00:38:59 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 384D57EC;
        Thu, 19 Jan 2023 09:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674117538;
        bh=DeiHX1qNbCKawlrBL7AbCC2x+6+M3rF4fH3NawDfTNs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=H4af+7Zu21Ff10xfIqRiUEiXZ+Q6l8zJKFt1q5YrFpdrutqC9nRtjqIrZGJN94vzV
         XXd17SwIoEiQE006TYEQjgbajPSlxXmrxT931qmARD1Xl7zZ631p5r/r3chNIg0VQr
         A+krJlQc4g3W1gvjYT4lDMJq9OxAFhwy8r0EWQ2k=
Message-ID: <664db873-6bdf-c3d3-cc69-bca5521e29a7@ideasonboard.com>
Date:   Thu, 19 Jan 2023 10:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hfQy9zp9WKluq/@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hfQy9zp9WKluq/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/01/2023 23:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:50PM +0200, Tomi Valkeinen wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> Reset LVDS using the reset control as CPG reset/release is required in
>> H/W manual sequence.
> 
> s@H/W@the hardware@
> 
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: Rewrite the patch description]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/Kconfig     |  1 +
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>> index a8f862c68b4f..151e400b996d 100644
>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>> @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
>>   	select DRM_PANEL
>>   	select OF_FLATTREE
>>   	select OF_OVERLAY
>> +	select RESET_CONTROLLER
>>   
>>   config DRM_RCAR_USE_MIPI_DSI
>>   	bool "R-Car DU MIPI DSI Encoder Support"
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 81a060c2fe3f..674b727cdaa2 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/sys_soc.h>
>>   
>> @@ -60,6 +61,7 @@ struct rcar_lvds_device_info {
>>   struct rcar_lvds {
>>   	struct device *dev;
>>   	const struct rcar_lvds_device_info *info;
>> +	struct reset_control *rstc;
>>   
>>   	struct drm_bridge bridge;
>>   
>> @@ -316,6 +318,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>>   
>>   	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>>   
>> +	reset_control_deassert(lvds->rstc);
> 
> Can this fail ? Same in __rcar_lvds_atomic_enable().

Yes. Too hasty in picking a patch from the BSP =).

>> +
>>   	ret = clk_prepare_enable(lvds->clocks.mod);
> 
> It would be nice to switch this driver to runtime PM and move reset and
> clock handling to the suspend/resume handlers. A candidate for a future
> patch.

I have the runtime PM patch in my work branch, but on top. I'll pick 
that into this series, before adding the reset control. Makes error 
handling a bit simpler.

>>   	if (ret < 0)
> 
> Missing reset_control_assert(). Same in other error paths if applicable,
> here and in __rcar_lvds_atomic_enable().

Yep.

  Tomi

