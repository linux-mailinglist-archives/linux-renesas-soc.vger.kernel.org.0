Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51D91ABF3B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 13:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633322AbgDPLbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 07:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632945AbgDPLbh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 07:31:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D15FC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 04:31:37 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4399597D;
        Thu, 16 Apr 2020 13:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587036696;
        bh=vVpTDWfk6NlYR1BWIEz6lC6wpwTy6+SLg7Rc3hUG2+w=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DI750Ofr4CGTs4R0eHNwYiyay7rz/P5iTDmXdINMHXUViTPNv2frsMdb+G3N97axe
         0RO+PhbQcPgp/jdx3zr4PzS4/Kbk/QjjG+MF5vUUV9q9vgJsdMluV90B7FzohtdInO
         Viui8YGKcUAzytzcCLt72JyHqlzYhrAy6cpjQG94=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [v8-rc1 15/20] squash! max9286: Disable overlap window
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
 <20200416104052.2643098-16-jacopo+renesas@jmondi.org>
 <f5b02b7e-4479-c6ea-1318-ff5bfd1d816b@ideasonboard.com>
 <20200416113108.2t5dfemqgxo5q77j@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <5b36845b-5433-4b34-b40a-913482e5fd8c@ideasonboard.com>
Date:   Thu, 16 Apr 2020 12:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200416113108.2t5dfemqgxo5q77j@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16/04/2020 12:31, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Thu, Apr 16, 2020 at 11:50:07AM +0100, Kieran Bingham wrote:
>> Hi Jacopo,
>>
>> On 16/04/2020 11:40, Jacopo Mondi wrote:
>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> ---
>>> v2:
>>>   [Jacopo]
>>>   - Write register 0x63 and 0x64 directly as going through the function
>>>     breaks RDACM21 operations
>>> ---
>>>  drivers/media/i2c/max9286.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>> index 3ef74ba10074..e0c637d4a7de 100644
>>> --- a/drivers/media/i2c/max9286.c
>>> +++ b/drivers/media/i2c/max9286.c
>>> @@ -966,6 +966,18 @@ static int max9286_setup(struct max9286_priv *priv)
>>>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
>>>  		      MAX9286_HVSRC_D14);
>>>
>>> +	/*
>>> +	 * The overlap window seems to provide additional validation by tracking
>>> +	 * the delay between vsync and frame sync, generating an error if the
>>> +	 * delay is bigger than the programmed window, though it's not yet clear
>>> +	 * what value should be set.
>>> +	 *
>>> +	 * As it's an optional value and can be disabled, we do so by setting
>>> +	 * a 0 overlap value.
>>
>> Are you happy to add the following as part of the removal of the function?
>>
>> 	 *
>> 	 * The overlap window is a 13 bit value, and register 0x64 is
>> 	 * shared with ENFSINLAST in BIT(5) which is also set zero.
>> 	 *
> 
> Not sure, as I noticed failres for RDACM21 when not writing the
> supposidely reserved bits.
> 
> As we blindly write the full registers I would leave details out until
> we figure out what's happening.

But that's precisely why I think we should document it :-) Otherwise -
some other person could hit this issue in a different way...

> 
>>
>>> +	 */
>>> +	max9286_write(priv, 0x63, 0);
>>> +	max9286_write(priv, 0x64, 0);
>>> +
>>>  	/*
>>>  	 * Wait for 2ms to allow the link to resynchronize after the
>>>  	 * configuration change.
>>>
>>

