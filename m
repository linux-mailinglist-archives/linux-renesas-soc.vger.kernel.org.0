Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024A1361ABE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Apr 2021 09:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239271AbhDPHm4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Apr 2021 03:42:56 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37685 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239124AbhDPHm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 03:42:56 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D166B1BF217;
        Fri, 16 Apr 2021 07:42:28 +0000 (UTC)
Date:   Fri, 16 Apr 2021 09:43:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: i2c: max9286: Use "maxim,gpio-poc" property
Message-ID: <20210416074307.mtd7bcv3yj6zekt6@uno.localdomain>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-3-jacopo+renesas@jmondi.org>
 <YHeCOCkn1YvYR09E@pendragon.ideasonboard.com>
 <20210415065848.xgisi5cpcxvnxzb4@uno.localdomain>
 <YHiQfcHoyyvSwFsp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YHiQfcHoyyvSwFsp@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Apr 15, 2021 at 10:14:05PM +0300, Laurent Pinchart wrote:
> > > > +		/* GPIO values default to high */
> > > > +		priv->gpio_state = BIT(0) | BIT(1);
> > >
> > > Why is that ?
> > >
> > As the set/get functions of gpiochip use the gpio_state and I wanted
> > to use the same functions for the internal gpio handling I used
> > gpio_state in gpio_set(). My thinking was that in this way altering
> > the gpio line would be visibile to gpio consumers... which we don't
> > have as I won't register the gpio-controller :)
>
> My question was why they default to high here, when they default to low
> when there's a gpio-controller property.
>

Oh, got it now... the two output lines are high by default :)
Why do you say "they default to low when there's a gpio-controller
property" ? When does that requirement come from ?

Thanks
   j

> > > > +		priv->regulator = NULL;
> > >
> > > As priv is initialized to 0, you can skip this.
> >
> > Yes, I liked it explicit as it is used as flag, but it is not
> > required...
> >
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	ret = max9286_register_gpio(priv);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	priv->regulator = devm_regulator_get(dev, "poc");
> > > > +	if (IS_ERR(priv->regulator)) {
> > > > +		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> > > > +			dev_err(dev, "Unable to get PoC regulator (%ld)\n",
> > > > +				PTR_ERR(priv->regulator));
> > > > +		return PTR_ERR(priv->regulator);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	/* If "poc-gpio" is used, toggle the line and do not use regulator. */
> > > > +	if (!priv->regulator)
> > > > +		return max9286_gpio_set(priv, priv->gpio_poc,
> > > > +					enable ^ priv->gpio_poc_flags);
> > > > +
> > > > +	/* Otherwise PoC is controlled using a regulator. */
> > > > +	if (enable) {
> > > > +		ret = regulator_enable(priv->regulator);
> > > > +		if (ret < 0) {
> > > > +			dev_err(&priv->client->dev, "Unable to turn PoC on\n");
> > >
> > > As error message when max9286_gpio_set() fails (at least in the enable
> > > case) would be good too. Bonus points if there's a single dev_err()
> > > call.
> >
> > I'll see how it looks like
> >
> > > > +			return ret;
> > > > +		}
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	return regulator_disable(priv->regulator);
> > > > +}
> > > > +
> > > >  static int max9286_init(struct device *dev)
> > > >  {
> > > >  	struct max9286_priv *priv;
> > > > @@ -1078,17 +1158,14 @@ static int max9286_init(struct device *dev)
> > > >  	client = to_i2c_client(dev);
> > > >  	priv = i2c_get_clientdata(client);
> > > >
> > > > -	/* Enable the bus power. */
> > > > -	ret = regulator_enable(priv->regulator);
> > > > -	if (ret < 0) {
> > > > -		dev_err(&client->dev, "Unable to turn PoC on\n");
> > > > +	ret = max9286_poc_enable(priv, true);
> > > > +	if (ret)
> > > >  		return ret;
> > > > -	}
> > > >
> > > >  	ret = max9286_setup(priv);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "Unable to setup max9286\n");
> > > > -		goto err_regulator;
> > > > +		goto err_poc_disable;
> > > >  	}
> > > >
> > > >  	/*
> > > > @@ -1098,7 +1175,7 @@ static int max9286_init(struct device *dev)
> > > >  	ret = max9286_v4l2_register(priv);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "Failed to register with V4L2\n");
> > > > -		goto err_regulator;
> > > > +		goto err_poc_disable;
> > > >  	}
> > > >
> > > >  	ret = max9286_i2c_mux_init(priv);
> > > > @@ -1114,8 +1191,8 @@ static int max9286_init(struct device *dev)
> > > >
> > > >  err_v4l2_register:
> > > >  	max9286_v4l2_unregister(priv);
> > > > -err_regulator:
> > > > -	regulator_disable(priv->regulator);
> > > > +err_poc_disable:
> > > > +	max9286_poc_enable(priv, false);
> > > >
> > > >  	return ret;
> > > >  }
> > > > @@ -1286,20 +1363,10 @@ static int max9286_probe(struct i2c_client *client)
> > > >  	 */
> > > >  	max9286_configure_i2c(priv, false);
> > > >
> > > > -	ret = max9286_register_gpio(priv);
> > > > +	ret = max9286_parse_gpios(priv);
> > > >  	if (ret)
> > > >  		goto err_powerdown;
> > > >
> > > > -	priv->regulator = devm_regulator_get(&client->dev, "poc");
> > > > -	if (IS_ERR(priv->regulator)) {
> > > > -		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> > > > -			dev_err(&client->dev,
> > > > -				"Unable to get PoC regulator (%ld)\n",
> > > > -				PTR_ERR(priv->regulator));
> > > > -		ret = PTR_ERR(priv->regulator);
> > > > -		goto err_powerdown;
> > > > -	}
> > > > -
> > > >  	ret = max9286_parse_dt(priv);
> > > >  	if (ret)
> > > >  		goto err_powerdown;
> > > > @@ -1326,7 +1393,7 @@ static int max9286_remove(struct i2c_client *client)
> > > >
> > > >  	max9286_v4l2_unregister(priv);
> > > >
> > > > -	regulator_disable(priv->regulator);
> > > > +	max9286_poc_enable(priv, false);
> > > >
> > > >  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> > > >
>
> --
> Regards,
>
> Laurent Pinchart
