Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FC66759F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 17:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjATQ3u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 11:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjATQ3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 11:29:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BB030D6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 08:29:08 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9EB7514;
        Fri, 20 Jan 2023 17:28:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674232139;
        bh=b5TSktyW/JZVaTJkSYhT5pSt/QVS8djp6D04H5pA/nI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VD9vCbuDXLYTW+X4iE13ixw7Iu9LOEh30yUtq4ecG/mX9OJUHOs+vn4By4JG3CBTI
         YWWhJbvYRvTKDI6mnZDKLXqjnXvQLn8TKLDdNxRmee9KlOxwswnikA8Ty9qY7RTyyl
         WEeNrJP41IPxOwoqcdi9rRd4ZxuFHBCxd2o9Dktk=
Message-ID: <8c2eb463-5987-156f-f4c2-fb5ae578ce52@ideasonboard.com>
Date:   Fri, 20 Jan 2023 18:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Stop accessing non-existant
 registers on gen4
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q/mNA4gZ/n0tlR@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8q/mNA4gZ/n0tlR@pendragon.ideasonboard.com>
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

On 20/01/2023 18:21, Laurent Pinchart wrote:
> On Fri, Jan 20, 2023 at 10:50:09AM +0200, Tomi Valkeinen wrote:
>> The following registers do not exist on gen4, so we should not write
>> them: DEF6Rm, DEF7Rm, DEF8Rm, ESCRn, OTARn.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  8 +++++---
>>   drivers/gpu/drm/rcar-du/rcar_du_group.c | 11 ++++++++---
>>   2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> index b7dd59fe119e..008e172ed43b 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -298,10 +298,12 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>>   		escr = params.escr;
>>   	}
>>   
>> -	dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>> +	if (rcdu->info->gen < 4) {
>> +		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>>   
>> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
>> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
>> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
>> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
>> +	}
>>   
>>   	/* Signal polarities */
>>   	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> index 6da01760ede5..c2209d427bb7 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> @@ -148,7 +148,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>>   	}
>>   	rcar_du_group_write(rgrp, DEFR5, DEFR5_CODE | DEFR5_DEFE5);
>>   
>> -	rcar_du_group_setup_pins(rgrp);
>> +	if (rcdu->info->gen < 4)
>> +		rcar_du_group_setup_pins(rgrp);
>>   
>>   	/*
>>   	 * TODO: Handle routing of the DU output to CMM dynamically, as we
>> @@ -160,7 +161,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>>   	rcar_du_group_write(rgrp, DEFR7, defr7);
>>   
>>   	if (rcdu->info->gen >= 2) {
>> -		rcar_du_group_setup_defr8(rgrp);
>> +		if (rcdu->info->gen < 4)
>> +			rcar_du_group_setup_defr8(rgrp);
>>   		rcar_du_group_setup_didsr(rgrp);
>>   	}
>>   
>> @@ -192,10 +194,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>>    */
>>   int rcar_du_group_get(struct rcar_du_group *rgrp)
>>   {
>> +	struct rcar_du_device *rcdu = rgrp->dev;
>> +
>>   	if (rgrp->use_count)
>>   		goto done;
>>   
>> -	rcar_du_group_setup(rgrp);
>> +	if (rcdu->info->gen < 4)
>> +		rcar_du_group_setup(rgrp);
> 
> This doesn't look right, you're disabling way more than necessary.

You're right, doesn't look even remotely correct. A morning patch, 
obviously.

  Tomi

