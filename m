Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6BB615BEF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 14:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgBMNGg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 08:06:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45722 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgBMNGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 08:06:36 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C9CB504;
        Thu, 13 Feb 2020 14:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581599194;
        bh=uufcyY+MXm+dwvgLTn2ZwM8GBIrG5vVWcn4yUMcS2xk=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=T4fA7CQSWZY94KK9ifleoiBHVB/dUYE7R1VfwmdgfABVqc1B+moFifEheOOc0m/aF
         aVw1WVoSImfqfo6D49apmKYhfd+ayE5vY5ba2b3eO9lTefWjKN1YOO/8wTC8VN/qU3
         SuO4ocqVIHbs18VpdBrfNSgx+KXN6ehNNxChuocc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] max9286: balance v4l2_async refcnting
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
 <20200213102135.2179-1-kieran.bingham+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8636f540-91fc-19ae-3e6a-7a9253c3c802@ideasonboard.com>
Date:   Thu, 13 Feb 2020 13:06:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200213102135.2179-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/02/2020 10:21, Kieran Bingham wrote:
> When we add fwnodes to V4L2 notifiers through
> v4l2_async_notifier_add_subdev they are stored internally in V4L2 core,
> and have a reference count released upon any call to
> v4l2_async_notifier_cleanup().
> 
> Ensure that any source successfully added to a notifier gets its fwnode
> reference count increased accordingly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index f3311210a666..62615e6ab710 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -665,6 +665,11 @@ static int max9286_v4l2_async_register(struct max9286_priv *priv)
>  			v4l2_async_notifier_cleanup(&priv->notifier);
>  			return ret;
>  		}
> +
> +		/* Balance the refernce counting handled through

I've correctly moved this to a new line and fixed up the reference
spelling :)

> +		 * v4l2_async_notifier_cleanup()
> +		 */
> +		fwnode_handle_get(source->fwnode);
>  	}
>  
>  	priv->notifier.ops = &max9286_notify_ops;
> 

