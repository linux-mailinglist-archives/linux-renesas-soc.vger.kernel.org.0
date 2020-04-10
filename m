Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9811A430D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgDJHiY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:38:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgDJHiX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:38:23 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D2F7329;
        Fri, 10 Apr 2020 09:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586504302;
        bh=FBz2fQ1Zofn3OsLZxCopTR5BFKwCwhkPLqXMgqpYZZE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lrdqQS4QAaEY/2rmp+hJwSsbuO8QmqsNOLL92tMz327krcWeurdq8CxmpKbAhN23O
         gD5CGi15zYUyTXzUqUQ5le3zzf2phDMJAuhm/cytU5UAUCvZHZmrS6TQ+09qW0Vo7Q
         pNz9o+bF0h3H/kDNHYxD1JYOCUfPtMu9BuqcC4fk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO
 powerdown
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
 <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cd95d4b1-b390-cb0e-d105-b7d91d9e47af@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 09/04/2020 17:22, Jacopo Mondi wrote:
> Hi Kieran,
>   slightly unrelated on this patch but

Everything's related :-) All comments welcome!

> 
> On Thu, Apr 09, 2020 at 01:11:52PM +0100, Kieran Bingham wrote:
>>  - Fix up cleanup path from GPIO PowerDown registration
>> ---
>>  drivers/media/i2c/max9286.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 0a43137b8112..cc99740b34c5 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
>>
>>  	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>>  						   GPIOD_OUT_HIGH);
>> -	if (IS_ERR(priv->gpiod_pwdn))
>> -		return PTR_ERR(priv->gpiod_pwdn);
>> +	if (IS_ERR(priv->gpiod_pwdn)) {
>> +		ret = PTR_ERR(priv->gpiod_pwdn);
>> +		goto err_cleanup_dt;
>> +	}
>>
>>  	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
>>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> 
> As we get_optional(), shouldn't this be protected by an
>         if (priv->gpiod_pwdn)
> 
>  ?
> 

Err - yes! That's odd - I was sure I had tested this without a gpio
specifier, and I thought those functions were null-safe, and were a
no-op if there was no desc. Clearly some wire got crossed in my head -
because I see no such null-checks now!


I've added a new squash patch on top to correct for this (including
checking priv->gpiod_pwdn on all uses).


> Another point (sorry, I'm looking at gpio handling only now) we have
>         ret = max9286_gpio(priv);
>         if (ret)
>                 return ret;
> 
> That's not really a descriptive function name.. Could this be
>         max9286_register_gpiochip()

Yup, I'm happy enough to rename that.

Patch added on top.



> ?
> 
> One last point and then I'll stop.
> 
> We currently do
> 
> probe() {
>         parse_dt()
> 
>         pwdn = devm_get_gpio_optional()
>         if (err)
>                 goto err_cleanup_dt()
>         set(pwdn, 1);
> 
>         register_gpiochip(); //uses devm
>                 goto err_cleanup_dt()
> 
>         get_regulator()
>                 goto err_cleanup_dt()
> 
>         ret = init()
>         if (ret)
>                 goto err_regulator();
> 
>         return 0
> 
> err_regulator:
>         regulator_put()
>         mux_close()
>         i2c_ack_disable()
> err_cleanup_dt:
>        cleanup_dt()
> 
> }
> 
> With patch 5 of this series this becomes
> 
> probe() {
>         parse_dt()
> 
>         pwdn = devm_get_gpio_optional()
>         if (err)
>                 goto err_cleanup_dt()
>         set(pwdn, 1);
> 
>         register_gpiochip(); //uses devm
>                 goto err_cleanup_dt()
> 
>         devm_get_regulator()
>                 goto err_cleanup_dt()
> 
>         ret = init()
>         if (ret)
>                 goto err_regulator();
> 
>         return 0
> 
> err_regulator:
>         mux_close()
>         i2c_ack_disable()
> err_cleanup_dt:
>        cleanup_dt()
> }
> 
> as the i2c_mux is already closed at the end of init() (or never open
> if we fail earlier) and i2c_ack can be disabled at the end of
> max9286_setup() and in the error path there (as there are no more i2c
> writes after that function returns), I think we could simplify all of
> thise even more to:
> 
> probe() {
>         pwdn = devm_get_gpio_optional()
>         if (err)
>                 return;
> 
>         set(pwdn, 1);
> 
>         register_gpiochip(); //uses devm
>                 return;
> 
>         devm_get_regulator()
>                 return;
> 
>         parse_dt()
> 
>         ret = init()
>         if (ret)
>                 goto cleanup_dt();
> 
>         return 0
> 
> err_cleanup_dt:
>        cleanup_dt()
> }
> 
> This could be done after 5/5 in this series if you want to keep fixups
> separate for another review round.
> 

Yes, indeed - it would make sense where possible to have the devm_
handled constructions before the manually managed ones.

I'll add a patch on top.


> What do you think ?
> 
> Thanks
>    j
> 
> 
> 
>> @@ -1193,7 +1195,7 @@ static int max9286_probe(struct i2c_client *client)
>>  				PTR_ERR(priv->regulator));
>>  		ret = PTR_ERR(priv->regulator);
>>  		priv->regulator = NULL;
>> -		goto err_free;
>> +		goto err_cleanup_dt;
>>  	}
>>
>>  	/*
>> @@ -1230,7 +1232,7 @@ static int max9286_probe(struct i2c_client *client)
>>  	regulator_put(priv->regulator);
>>  	max9286_i2c_mux_close(priv);
>>  	max9286_configure_i2c(priv, false);
>> -err_free:
>> +err_cleanup_dt:
>>  	max9286_cleanup_dt(priv);
>>
>>  	return ret;
>> @@ -1248,10 +1250,10 @@ static int max9286_remove(struct i2c_client *client)
>>  		regulator_disable(priv->regulator);
>>  	regulator_put(priv->regulator);
>>
>> -	max9286_cleanup_dt(priv);
>> -
>>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>>
>> +	max9286_cleanup_dt(priv);
>> +
>>  	return 0;
>>  }
>>
>> --
>> 2.20.1
>>

