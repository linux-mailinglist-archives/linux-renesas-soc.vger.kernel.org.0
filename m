Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBF2D1A37E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDIQTJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 12:19:09 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33741 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgDIQTJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 12:19:09 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D78CD100002;
        Thu,  9 Apr 2020 16:19:04 +0000 (UTC)
Date:   Thu, 9 Apr 2020 18:22:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO
 powerdown
Message-ID: <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,
  slightly unrelated on this patch but

On Thu, Apr 09, 2020 at 01:11:52PM +0100, Kieran Bingham wrote:
>  - Fix up cleanup path from GPIO PowerDown registration
> ---
>  drivers/media/i2c/max9286.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 0a43137b8112..cc99740b34c5 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
>
>  	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>  						   GPIOD_OUT_HIGH);
> -	if (IS_ERR(priv->gpiod_pwdn))
> -		return PTR_ERR(priv->gpiod_pwdn);
> +	if (IS_ERR(priv->gpiod_pwdn)) {
> +		ret = PTR_ERR(priv->gpiod_pwdn);
> +		goto err_cleanup_dt;
> +	}
>
>  	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);

As we get_optional(), shouldn't this be protected by an
        if (priv->gpiod_pwdn)

 ?


Another point (sorry, I'm looking at gpio handling only now) we have
        ret = max9286_gpio(priv);
        if (ret)
                return ret;

That's not really a descriptive function name.. Could this be
        max9286_register_gpiochip()
?

One last point and then I'll stop.

We currently do

probe() {
        parse_dt()

        pwdn = devm_get_gpio_optional()
        if (err)
                goto err_cleanup_dt()
        set(pwdn, 1);

        register_gpiochip(); //uses devm
                goto err_cleanup_dt()

        get_regulator()
                goto err_cleanup_dt()

        ret = init()
        if (ret)
                goto err_regulator();

        return 0

err_regulator:
        regulator_put()
        mux_close()
        i2c_ack_disable()
err_cleanup_dt:
       cleanup_dt()

}

With patch 5 of this series this becomes

probe() {
        parse_dt()

        pwdn = devm_get_gpio_optional()
        if (err)
                goto err_cleanup_dt()
        set(pwdn, 1);

        register_gpiochip(); //uses devm
                goto err_cleanup_dt()

        devm_get_regulator()
                goto err_cleanup_dt()

        ret = init()
        if (ret)
                goto err_regulator();

        return 0

err_regulator:
        mux_close()
        i2c_ack_disable()
err_cleanup_dt:
       cleanup_dt()
}

as the i2c_mux is already closed at the end of init() (or never open
if we fail earlier) and i2c_ack can be disabled at the end of
max9286_setup() and in the error path there (as there are no more i2c
writes after that function returns), I think we could simplify all of
thise even more to:

probe() {
        pwdn = devm_get_gpio_optional()
        if (err)
                return;

        set(pwdn, 1);

        register_gpiochip(); //uses devm
                return;

        devm_get_regulator()
                return;

        parse_dt()

        ret = init()
        if (ret)
                goto cleanup_dt();

        return 0

err_cleanup_dt:
       cleanup_dt()
}

This could be done after 5/5 in this series if you want to keep fixups
separate for another review round.

What do you think ?

Thanks
   j



> @@ -1193,7 +1195,7 @@ static int max9286_probe(struct i2c_client *client)
>  				PTR_ERR(priv->regulator));
>  		ret = PTR_ERR(priv->regulator);
>  		priv->regulator = NULL;
> -		goto err_free;
> +		goto err_cleanup_dt;
>  	}
>
>  	/*
> @@ -1230,7 +1232,7 @@ static int max9286_probe(struct i2c_client *client)
>  	regulator_put(priv->regulator);
>  	max9286_i2c_mux_close(priv);
>  	max9286_configure_i2c(priv, false);
> -err_free:
> +err_cleanup_dt:
>  	max9286_cleanup_dt(priv);
>
>  	return ret;
> @@ -1248,10 +1250,10 @@ static int max9286_remove(struct i2c_client *client)
>  		regulator_disable(priv->regulator);
>  	regulator_put(priv->regulator);
>
> -	max9286_cleanup_dt(priv);
> -
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>
> +	max9286_cleanup_dt(priv);
> +
>  	return 0;
>  }
>
> --
> 2.20.1
>
