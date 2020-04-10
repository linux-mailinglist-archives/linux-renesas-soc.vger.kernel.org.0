Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA481A4311
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDJHmr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:42:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34728 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgDJHmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:42:47 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CC53329;
        Fri, 10 Apr 2020 09:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586504566;
        bh=TMYT/AW+0isNqeV5JFyIUxn40xEZs2ZBRbR34VMsxK8=;
        h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=AvbnQl8TtYjbgA9v2NbKssFCDTM0UqHH8f01w9djB+X71I0J4/W/EVyCM3FSTti6Y
         kQXqceNmESLX3jxdFvc1F9lCTd2kyArv2opwBSkNKpKduMiEMJf1siVk98vIryqG2G
         4YrnXsCnqKbYkxruBbv1/NN6B0BrlXbhbQc/d4hA=
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO
 powerdown
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
 <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
 <cd95d4b1-b390-cb0e-d105-b7d91d9e47af@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <3f4d7e6f-32f4-9c7c-f9b2-c08ab88a914e@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:42:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cd95d4b1-b390-cb0e-d105-b7d91d9e47af@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/04/2020 08:38, Kieran Bingham wrote:
> Hi Jacopo,
>>>
>>>  	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>>>  						   GPIOD_OUT_HIGH);
>>> -	if (IS_ERR(priv->gpiod_pwdn))
>>> -		return PTR_ERR(priv->gpiod_pwdn);
>>> +	if (IS_ERR(priv->gpiod_pwdn)) {
>>> +		ret = PTR_ERR(priv->gpiod_pwdn);
>>> +		goto err_cleanup_dt;
>>> +	}
>>>
>>>  	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
>>>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
>>
>> As we get_optional(), shouldn't this be protected by an
>>         if (priv->gpiod_pwdn)
>>
>>  ?
>>
> 
> Err - yes! That's odd - I was sure I had tested this without a gpio
> specifier, and I thought those functions were null-safe, and were a
> no-op if there was no desc. Clearly some wire got crossed in my head -
> because I see no such null-checks now!


Ahem, ok - so as highlighted by Geert, - these *are* NULL safe...

> 
> 
> I've added a new squash patch on top to correct for this (including
> checking priv->gpiod_pwdn on all uses).

now dropped :-)

