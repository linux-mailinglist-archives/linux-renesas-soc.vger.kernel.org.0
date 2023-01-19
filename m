Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BFE6733FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 09:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjASIti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 03:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjASItg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 03:49:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470DD47432
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 00:49:34 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397267EC;
        Thu, 19 Jan 2023 09:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674118171;
        bh=J23izYBcvCMQej7kG7YCu/n9+2PG1tMQWi/kC6w/aMU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KHjNfYrHmiw/xNTiML/XRVYPoiHOFr5ACwG7/WsRRCR0B+1kGNQbNG4OJHfe4YyXc
         twc93EJitmPColvkR8wwHfVzTDz0/F5xZEh7TKNPubpjnfsjmr4n66tBjpeN1WYhzR
         ElQcgwyXlO3/Qg1ypFYc5NRVHVcZV1HmdD+ii+oQ=
Message-ID: <5e0fea45-0e5c-ef7c-007e-69ba69d2b08c@ideasonboard.com>
Date:   Thu, 19 Jan 2023 10:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
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

On 18/01/2023 23:12, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:51PM +0200, Tomi Valkeinen wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> According to H/W manual, LVDCR0 register must be cleared bit by bit when
> 
> s@H/W@the hardware/
> 
>> disabling LVDS.
> 
> I don't like this much, but I think I'll stop fighting :-)
> 
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: simplified the code a bit]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 674b727cdaa2..01800cef1c33 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>>   	iowrite32(data, lvds->mmio + reg);
>>   }
>>   
>> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
>> +{
>> +	return ioread32(lvds->mmio + reg);
>> +}
> 
> Could you please move read before write ?

Sure.

>> +
>>   /* -----------------------------------------------------------------------------
>>    * PLL Setup
>>    */
>> @@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>>   				     struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>> +	u32 lvdcr0;
>> +
>> +	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
>> +
>> +	lvdcr0 &= ~LVDCR0_LVRES;
>> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +
>> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
>> +		lvdcr0 &= ~LVDCR0_LVEN;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
>> +		lvdcr0 &= ~LVDCR0_PWD;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
>> +		lvdcr0 &= ~LVDCR0_PLLON;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
> 
> This will leave LVDCR0_BEN and LVDCR0_LVEN on Gen2. Is that fine ?

I don't know, I don't have the manuals or HW. But your point is a bit 
worrying.

I think we can just do a rcar_lvds_write(lvds, LVDCR0, 0) after the 
above shenanigans, to make sure everything is disabled. The HW manual 
doesn't tell us to do that, though, on gen3. Do you think that will be a 
problem?

And I'm not fully serious with the last sentence...

  Tomi

