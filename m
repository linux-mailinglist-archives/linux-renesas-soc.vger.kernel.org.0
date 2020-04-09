Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADA01A380F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 18:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgDIQay (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 12:30:54 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60271 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgDIQay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 12:30:54 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 94830C0006;
        Thu,  9 Apr 2020 16:30:51 +0000 (UTC)
Date:   Thu, 9 Apr 2020 18:33:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 13/13] sqaush! max9286: Remove poc_enabled workaround
Message-ID: <20200409163354.cuxwucnkudy673de@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-14-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200409121202.11130-14-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Apr 09, 2020 at 01:12:02PM +0100, Kieran Bingham wrote:
> This boolean is a flag used to handle the regulator when our
> multi-max9286 workaround is in place.  It shouldn't be in the upstream
> driver, and is moved out.
>

For this and all the other patches where I didn't have comments on,
please consider Acked-by: Jacopo Mondi <jacopo@jmondi.org> and feel
free to squash!

Thanks, this is looking much better now!


> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 6f114756a1e2..022f4cfaf294 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -152,7 +152,6 @@ struct max9286_priv {
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[MAX9286_N_PADS];
>  	struct regulator *regulator;
> -	bool poc_enabled;
>
>  	struct gpio_chip gpio;
>  	u8 gpio_state;
> @@ -1066,8 +1065,6 @@ static int max9286_init(struct device *dev)
>  		return ret;
>  	}
>
> -	priv->poc_enabled = true;
> -
>  	ret = max9286_setup(priv);
>  	if (ret) {
>  		dev_err(dev, "Unable to setup max9286\n");
> @@ -1099,7 +1096,6 @@ static int max9286_init(struct device *dev)
>  	max9286_v4l2_unregister(priv);
>  err_regulator:
>  	regulator_disable(priv->regulator);
> -	priv->poc_enabled = false;
>
>  	return ret;
>  }
> @@ -1324,8 +1320,7 @@ static int max9286_remove(struct i2c_client *client)
>
>  	max9286_v4l2_unregister(priv);
>
> -	if (priv->poc_enabled)
> -		regulator_disable(priv->regulator);
> +	regulator_disable(priv->regulator);
>  	regulator_put(priv->regulator);
>
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> --
> 2.20.1
>
