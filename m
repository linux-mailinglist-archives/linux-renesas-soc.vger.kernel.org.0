Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715AC677609
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 09:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjAWIFw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 03:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbjAWIFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 03:05:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6E5125A1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 00:05:50 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E2B52B3;
        Mon, 23 Jan 2023 09:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674461149;
        bh=eif4ALjXn4Xg3gNkN0qiznal4u/c3NCcB3pOWqLEf1w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AnW7FGX9mvBzUq71bCTU4tT6Fw6pmL5BtX6V5cQgG8W2WI3B3pcP4OxEkBQR0uckH
         XBdfLxI6Moyrvks3wp7YF5O2Is54/S5b0NinX4Z9FzS8IeFtgVzn3aPqJHIqkOi+Lm
         Bpgj5HkeC+jBBJajv6pvfz2XVbzkWZEKRSY5fhHE=
Message-ID: <e89fefcb-1628-ea85-f3a6-10c4377db244@ideasonboard.com>
Date:   Mon, 23 Jan 2023 10:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/7] drm: rcar-du: lvds: Add runtime PM
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-3-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/01/2023 18:16, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Jan 20, 2023 at 10:50:04AM +0200, Tomi Valkeinen wrote:
>> Add simple runtime PM suspend and resume functionality.
> 
> I think you need to depend on PM in Kconfig. That's not a compile-time
> dependency but a runtime-dependency, with runtime PM support the
> suspend/resume handler will never be called.

Yes, LVDS won't work without runtime PM after this patch.

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 43 +++++++++++++++++++++++++----
>>   1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 81a060c2fe3f..8e1be51fbee6 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>   #include <linux/sys_soc.h>
>>   
>> @@ -316,8 +317,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>>   
>>   	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>>   
>> -	ret = clk_prepare_enable(lvds->clocks.mod);
>> -	if (ret < 0)
>> +	ret = pm_runtime_resume_and_get(lvds->dev);
>> +	if (ret)
>>   		return ret;
>>   
>>   	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
>> @@ -337,7 +338,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
>>   
>>   	rcar_lvds_write(lvds, LVDPLLCR, 0);
>>   
>> -	clk_disable_unprepare(lvds->clocks.mod);
>> +	pm_runtime_put(lvds->dev);
> 
> Should we use pm_runtime_put_sync() here, to make sure the clock gets
> disabled right away ? The DU hardware may depend on the exact sequencing
> of events. I would then do the same in rcar_lvds_atomic_disable().

That's perhaps a good idea. I think I saw some of the docs saying that 
startup sequences must begin with the reset. If we don't use _sync, we 
could end up not resetting at all.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

  Tomi

