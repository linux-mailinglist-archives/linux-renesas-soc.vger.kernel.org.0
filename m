Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABC959C183
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbiHVOUD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbiHVOUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:20:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F502496F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:20:01 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 475542B3;
        Mon, 22 Aug 2022 16:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661177999;
        bh=N9+v+04BR2GabCbhhZbzp8aKPqznfsV19D+Jri7o/Go=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sluquKU9/W/POM/VTiCK9Ko7wYa6oc9Hdf7DHXcncXAPsJs5VaeVfx6aWahnY58nX
         k/uYEqm/Fx9mD/mXNSbYlcXddgj+eIiObBu7ZizjXvQzoVzERIteu1Tzl222war5VY
         BXHRGEFN8TMJdeI88bgK200LSGdEytsGfdGC+y3M=
Message-ID: <71457f76-9912-71c2-4aba-66ed5f88a648@ideasonboard.com>
Date:   Mon, 22 Aug 2022 17:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] drm: rcar-du: dsi: Improve DSI shutdown
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
 <YwOCmqcZfU4zfr3D@pendragon.ideasonboard.com>
 <38c3ce75-2dcd-38e4-0e05-151ac3faf24c@ideasonboard.com>
 <YwONHTkBjVSQ47ek@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YwONHTkBjVSQ47ek@pendragon.ideasonboard.com>
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

On 22/08/2022 17:05, Laurent Pinchart wrote:
> On Mon, Aug 22, 2022 at 04:49:02PM +0300, Tomi Valkeinen wrote:
>> On 22/08/2022 16:20, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Mon, Aug 22, 2022 at 04:05:10PM +0300, Tomi Valkeinen wrote:
>>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>>
>>>> Improve the DSI shutdown procedure by clearing various bits that were
>>>> set while enabling the DSI output. There has been no clear issues caused
>>>> by these, but it's safer to ensure that the features are disabled at the
>>>> start of the next DSI enable.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>>>> index 7f2be490fcf8..6a10a35f1122 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>>>> @@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>>>>    
>>>>    static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
>>>>    {
>>>> +	/* Disable VCLKEN */
>>>> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
>>>> +
>>>> +	/* Disable DOT clock */
>>>> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
>>>
>>> I think you can write 0 to those two registers, this will also be safer.
>>> With this,
>>
>> VCLKEN has only the single VCLKEN_CKEN bit and the rest of the bits are
>> reserved with default value of 0, however VCLKSET has other fields and
>> the default value of those fields is not 0.
> 
> But the two fields whose default value isn't 0 are set in the startup()
> function (albeit incorrectly as discussed below), so it should be fine.

That is true. But I'd rather write 0 to VCLKEN in the startup, before 
writing the configuration.

>> Why do you think it's safer to set the whole register to 0? Isn't it
>> better to just do what we want to do, which makes the purpose clear and,
>> I think, is safer as we don't touch bits we don't know about?
> 
> Because it will ensure that we don't get surprises when we later restart
> the device, such as mentioned below :-)

Well, but that's a bug in the startup code. I don't think the shutdown 
code should do things to make startup work better if the startup does 
something wrong. Nevertheless, while I slightly disagree, I'm fine with 
writing zero there in shutdown.

  Tomi
