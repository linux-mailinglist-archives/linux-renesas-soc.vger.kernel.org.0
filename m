Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113471A33EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDIMPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:15:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDIMPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:15:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB4772C;
        Thu,  9 Apr 2020 14:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434534;
        bh=IVhsGzmGMtA+3IbyTmLrPrAN8pyG/mCCgRelZLijsC8=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=VxoHcWgunsOawk2YhXR7BlJSxDuaHegATKIGE9e9Tj9U1UngCmsk4f/ODys8k1ntG
         /tWtKlxlOzB/c++pbEDS222kDdeFWIbauDZFFxGxY4v0Ks1+lw/T6zjFJBqxQi+HjA
         0SH7re06sxVNnc1vwAJStrWIfadYxlj+qlhj/+7I=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 05/13] squash! max9286: Convert to use
 devm_regulator_get()
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-6-kieran.bingham+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <96e84d37-edd6-b1e9-383c-8a9c462e2d34@ideasonboard.com>
Date:   Thu, 9 Apr 2020 13:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409121202.11130-6-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/04/2020 13:11, Kieran Bingham wrote:
>  - Convert to use devm_regulator_get()

Oh dear, Sometimes things are just easier to see when they're in my inbox.

This is missing the removal of the regulator_puts() which are no longer
required ;-)

--
Kieran


> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d0749c537152..c374078c7001 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1187,7 +1187,7 @@ static int max9286_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_powerdown;
>  
> -	priv->regulator = regulator_get(&client->dev, "poc");
> +	priv->regulator = devm_regulator_get(&client->dev, "poc");
>  	if (IS_ERR(priv->regulator)) {
>  		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
>  			dev_err(&client->dev,
> 

