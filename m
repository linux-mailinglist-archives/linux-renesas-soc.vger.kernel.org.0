Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8E121E32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 23:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbfLPWew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 17:34:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfLPWev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 17:34:51 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5764BA34;
        Mon, 16 Dec 2019 23:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576535686;
        bh=UmkVKrD5vFjPQyDe8Wb2iS8VOZpam+YrC/wSO2lV+k8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LHZx+AwH82V95MvSQzUm56tSmubx18uJcLS++RmgUhqUP2Zj7KbomXDuHGRwSpaF7
         Aorc/1/vryK8AH7OKjl3FwGuxRipO52fL0FK5cRsI8nyzcam4qMn7Qtp5x56gHc+zt
         /EP+EFAACuQd4tjqhNIG/jhlIX7fcF9Wltalc9uk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC 01/11] fixup! DNI: Debug
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
 <20191216171620.372683-2-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <00210953-8af3-37ec-cb75-1bfaf820b0db@ideasonboard.com>
Date:   Mon, 16 Dec 2019 22:34:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216171620.372683-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/12/2019 17:16, Jacopo Mondi wrote:
> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, I've squashed this onto my branch.
--
Kieran

> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index cb327c030081..ab84f0fa66dc 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -912,7 +912,7 @@ static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	struct max9286_priv *priv = gpiochip_get_data(chip);
>  
>  	dev_err(&priv->client->dev,
> -		"GPIOSET: Offset %d, Value %d gpio_state = 0x%lx",
> +		"GPIOSET: Offset %d, Value %ld gpio_state = 0x%lx",
>  		offset, priv->gpio_state & BIT(offset),
>  		MAX9286_0X0F_RESERVED | priv->gpio_state);
>  
> 

