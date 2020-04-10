Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB7A1A4310
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgDJHlW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:41:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgDJHlW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:41:22 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 694FB329;
        Fri, 10 Apr 2020 09:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586504481;
        bh=4GT661EECnMlobc3ABy4n4858h1gqqiXAO1SAkG1AsU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pQGgIZ+3pAODXpDy1TGgb97Hob2mwIFRpdoj/9isQDgUJGQEh9OwhNbAX3xA7xgRc
         tg4ZVM4MPaV20QCI4wROV8VKLwTwMEEc6FRW//e+ptJeA9TSjlCx4xCcHfeOVpCvZi
         OVZ4MCzfdNYbJA/umH73W63FuScjM5NO0z4E/Ti8=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO
 powerdown
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
 <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
 <CAMuHMdUYk92CX7NDNA3QEFG7fPC0Gwu702A9RU26fQGpBu=ugA@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <58c87cbf-cc94-996f-3abc-2c13ef9c6eb1@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUYk92CX7NDNA3QEFG7fPC0Gwu702A9RU26fQGpBu=ugA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/04/2020 08:34, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Thu, Apr 9, 2020 at 7:07 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>> On Thu, Apr 09, 2020 at 01:11:52PM +0100, Kieran Bingham wrote:
>>>  - Fix up cleanup path from GPIO PowerDown registration
>>> ---
>>>  drivers/media/i2c/max9286.c | 14 ++++++++------
>>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>> index 0a43137b8112..cc99740b34c5 100644
>>> --- a/drivers/media/i2c/max9286.c
>>> +++ b/drivers/media/i2c/max9286.c
>>> @@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
>>>
>>>       priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>>>                                                  GPIOD_OUT_HIGH);
>>> -     if (IS_ERR(priv->gpiod_pwdn))
>>> -             return PTR_ERR(priv->gpiod_pwdn);
>>> +     if (IS_ERR(priv->gpiod_pwdn)) {
>>> +             ret = PTR_ERR(priv->gpiod_pwdn);
>>> +             goto err_cleanup_dt;
>>> +     }
>>>
>>>       gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
>>>       gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
>>
>> As we get_optional(), shouldn't this be protected by an
>>         if (priv->gpiod_pwdn)
>>
>>  ?
> 
> When passed a NULL desc, validate_desc() just returns 0, without printing
> an error message, so both functions become no-ops.

Aha! I knew I'd tested that code path :-)

Thanks for highlighting that, I missed it just 10 minutes ago when I
rechecked because:

 	VALIDATE_DESC(desc);

has a *HIDDEN RETURN* dammit:

	if (__valid <= 0) \
		return __valid; \
	} while (0)

Honestly - I thought we didn't do that in the kernel for exactly this
reason. Grrrrrrrrrr ... oh and grrrrr again !

They could have at least named it:

 VALIDATE_DESC_OR_RETURN(desc)



> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

