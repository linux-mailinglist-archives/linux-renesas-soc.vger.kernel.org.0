Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5461A4374
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 10:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgDJIUa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 04:20:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDJIUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 04:20:30 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0650A329;
        Fri, 10 Apr 2020 10:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586506829;
        bh=roAWbtluHsT87liLV8XRSGZUgZ9inQvmlxDjRpzH7pA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ewOvNKO6lbFS9SU0k+0J+bbHBmucg08c5sGX7mDNiClMhQ0ZOasgkBR7byNMcP8PV
         QD2pWZsaZDrPrC7JBAx3I2exCj/qvSIzwI+iA/KtKW9UBvn3+dkMCaKAY7tyIXQiQ2
         RA1RDjTDmLSgW/+19YP8uL/h7XLqqZSC3MgPw0mk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 02/13] squash! max9286: convert probe kzalloc
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
 <20200409163333.GA25086@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ef7fc3df-c84f-0c3d-a34f-73460a9c1478@ideasonboard.com>
Date:   Fri, 10 Apr 2020 09:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409163333.GA25086@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

(+Sakari)

On 09/04/2020 17:33, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Apr 09, 2020 at 01:11:51PM +0100, Kieran Bingham wrote:
>> v8:
>>  - Convert probe kzalloc usage to devm_ variant
> 
> This isn't worse than the existing code, but are you aware that devm_*
> should not be used in this case ? The memory should be allocated with
> kzalloc() and freed in the .release() operation.

This change was at the request of a review comment from Sakari.

From:
https://lore.kernel.org/linux-media/4139f241-2fde-26ad-fe55-dcaeb76ad6cc@ideasonboard.com/
> 
>>> +
>>> +static int max9286_probe(struct i2c_client *client)
>>> +{
>>> +	struct max9286_priv *priv;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>> 
>> You won't lose anything by using the devm_ variant here.
> 
> Indeed,
> 
>> 
>>> +
>>> +	priv->client = client;
>>> +	i2c_set_clientdata(client, priv);
>>> +
>>> +	for (i = 0; i < MAX9286_N_SINKS; i++)
>>> +		max9286_init_format(&priv->fmt[i]);
>>> +
>>> +	ret = max9286_parse_dt(priv);
>>> +	if (ret)
>>> +		return ret;
>> 
>> But you can avoid accidental memory leaks for nothing. :-)
> 
> It would be good not to leak indeed!


I understand that there are lifetime issues in V4L2 - but in my opinion
that needs to be handled by core V4l2 (and or support from driver core
framework).

Also - isn't it highly unlikely to affect the max9286? Isn't the
lifetime issue that the device can be unplugged while the file handle is
open?

I don't think anyone is going to 'unplug' the max9286 while it's active :-)



>> ---
>>  drivers/media/i2c/max9286.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index b84d2daa6561..0a43137b8112 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -1155,7 +1155,7 @@ static int max9286_probe(struct i2c_client *client)
>>  	unsigned int i;
>>  	int ret;
>>  
>> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>> @@ -1232,7 +1232,6 @@ static int max9286_probe(struct i2c_client *client)
>>  	max9286_configure_i2c(priv, false);
>>  err_free:
>>  	max9286_cleanup_dt(priv);
>> -	kfree(priv);
>>  
>>  	return ret;
>>  }
>> @@ -1253,8 +1252,6 @@ static int max9286_remove(struct i2c_client *client)
>>  
>>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>>  
>> -	kfree(priv);
>> -
>>  	return 0;
>>  }
>>  
> 

