Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F161A3816
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 18:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDIQdp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 12:33:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50606 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgDIQdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 12:33:45 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC1072C;
        Thu,  9 Apr 2020 18:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586450024;
        bh=1TUMqJKhBAOKvfcP3ShZLw36os3ERuBc/qpJk2r5f5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m0bHmXQqxGcr0mpJedCqkkzESaRp4DIW8OGHj3XymBA8U4Bs47PBtjdPnyyXVbG2P
         aOogA4K+uX7KjTE9u5JVvC14dHsOGlHRxiD6kpCkF7zcQeEg/+M8HjulY8n9l1kcZH
         ExsDEseEH3ZUyU1cd1sQAlp3MA6emqJuhTKxk2PA=
Date:   Thu, 9 Apr 2020 19:33:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 02/13] squash! max9286: convert probe kzalloc
Message-ID: <20200409163333.GA25086@pendragon.ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thu, Apr 09, 2020 at 01:11:51PM +0100, Kieran Bingham wrote:
> v8:
>  - Convert probe kzalloc usage to devm_ variant

This isn't worse than the existing code, but are you aware that devm_*
should not be used in this case ? The memory should be allocated with
kzalloc() and freed in the .release() operation.

> ---
>  drivers/media/i2c/max9286.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index b84d2daa6561..0a43137b8112 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1155,7 +1155,7 @@ static int max9286_probe(struct i2c_client *client)
>  	unsigned int i;
>  	int ret;
>  
> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> @@ -1232,7 +1232,6 @@ static int max9286_probe(struct i2c_client *client)
>  	max9286_configure_i2c(priv, false);
>  err_free:
>  	max9286_cleanup_dt(priv);
> -	kfree(priv);
>  
>  	return ret;
>  }
> @@ -1253,8 +1252,6 @@ static int max9286_remove(struct i2c_client *client)
>  
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>  
> -	kfree(priv);
> -
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
