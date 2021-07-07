Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4CF3BEA31
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 17:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbhGGPEM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 11:04:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36191 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbhGGPEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 11:04:08 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EF615C000E;
        Wed,  7 Jul 2021 14:59:04 +0000 (UTC)
Date:   Wed, 7 Jul 2021 16:59:52 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] media: i2c: max9286: Use "maxim,gpio-poc" property
Message-ID: <20210707145952.74dlual3zzwk3wow@uno.localdomain>
References: <20210419142345.53152-1-jacopo+renesas@jmondi.org>
 <20210419142345.53152-4-jacopo+renesas@jmondi.org>
 <fea0f6e4-cd24-4c2e-1470-d86957408254@ideasonboard.com>
 <20210617081906.7g32j7bh6wletvet@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617081906.7g32j7bh6wletvet@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Jun 17, 2021 at 10:19:06AM +0200, Jacopo Mondi wrote:
> Hi Kieran
>
> On Thu, Jun 17, 2021 at 01:02:36AM +0100, Kieran Bingham wrote:
> > Hi Jacopo,
> >
> > On 19/04/2021 15:23, Jacopo Mondi wrote:
> > > The 'maxim,gpio-poc' property is used when the remote camera
> > > power-over-coax is controlled by one of the MAX9286 gpio lines,
> > > to instruct the driver about which line to use and what the line
> > > polarity is.
> > >
> > > Add to the max9286 driver support for parsing the newly introduced
> > > property and use it if available in place of the usual supply, as it is
> > > not possible to establish one as consumer of the max9286 gpio
> > > controller.
> > >
> > > If the new property is present, no gpio controller is registered and
> > > 'poc-supply' is ignored.
> > >
> > > In order to maximize code re-use, break out the max9286 gpio handling
> > > function so that they can be used by the gpio controller through the
> > > gpio-consumer API, or directly by the driver code.
> > >
> > > Wrap the power up and power down routines to their own function to
> > > be able to use either the gpio line directly or the supply. This will
> > > make it easier to control the remote camera power at run time.
> >
> > I think I've seen Laurent's despair at the auxillary device bus already,
> > but I can't help but feel it might be a way to register the gpio and
> > regulator fully without having to handle any probe deferrals and allow
> > the GPIO chip to be used as it's own regulator. (I.e. solve the issues I
> > was facing last time I looked at it)
> >
> > But that said however, it's only a hypothesis having not yet fully
> > investigated the option. It seems a shame to have to expose multiple
> > ways of powering up the cameras, but I guess ultimately it's how the
> > hardware is connected.
>
> I can't really comment as I don't know what auxillary bus is, but I
> guess this simple solution is enough to unblock eagle upstreaming and
> doesn't tie our hands if we want to switch to something completely
> different in future.
>
> >
> > Have we confirmed that the start up delays are no longer needed for the
> > RDACM20 cameras? (which we've previously exposed as a regulator power up
> > delay?)
>
> Yes, not delay needed as long as
> https://patchwork.linuxtv.org/project/linux-media/patch/20210616124616.49249-12-jacopo+renesas@jmondi.org/
> is applied
>

Let me (again) correct myself about the RDACM20.

While the above mentioned patch solves all issues at boot time, it still
doesn't guarantee stability of the capture operations.

I blame write collision or rather the MCU changing our programming
after the boot phase. I get an error when accessing the max9271 at
s_stream() time, while during boot I can read its id consistently.

I'm afraid we somehow need that delay to let the MCU boot complete and
overwrite its settings, in this way I get a 100% success of the
capture operations.

> >
> > How would this handle those delays if required?
> >
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/max9286.c | 125 +++++++++++++++++++++++++++---------
> > >  1 file changed, 94 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 6fd4d59fcc72..99160aa68a5f 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/fwnode.h>
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio/machine.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/i2c-mux.h>
> > >  #include <linux/module.h>
> > > @@ -165,6 +166,9 @@ struct max9286_priv {
> > >
> > >  	u32 reverse_channel_mv;
> > >
> > > +	u32 gpio_poc;
> > > +	u32 gpio_poc_flags;
> > > +
> > >  	struct v4l2_ctrl_handler ctrls;
> > >  	struct v4l2_ctrl *pixelrate;
> > >
> > > @@ -1022,20 +1026,27 @@ static int max9286_setup(struct max9286_priv *priv)
> > >  	return 0;
> > >  }
> > >
> > > -static void max9286_gpio_set(struct gpio_chip *chip,
> > > -			     unsigned int offset, int value)
> > > +static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
> > > +			    int value)
> > >  {
> > > -	struct max9286_priv *priv = gpiochip_get_data(chip);
> > > -
> > >  	if (value)
> > >  		priv->gpio_state |= BIT(offset);
> > >  	else
> > >  		priv->gpio_state &= ~BIT(offset);
> > >
> > > -	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
> > > +	return max9286_write(priv, 0x0f,
> > > +			     MAX9286_0X0F_RESERVED | priv->gpio_state);
> > > +}
> > > +
> > > +static void max9286_gpiochip_set(struct gpio_chip *chip,
> > > +				 unsigned int offset, int value)
> > > +{
> > > +	struct max9286_priv *priv = gpiochip_get_data(chip);
> > > +
> > > +	max9286_gpio_set(priv, offset, value);
> > >  }
> > >
> > > -static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
> > > +static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
> > >  {
> > >  	struct max9286_priv *priv = gpiochip_get_data(chip);
> > >
> > > @@ -1055,16 +1066,81 @@ static int max9286_register_gpio(struct max9286_priv *priv)
> > >  	gpio->of_node = dev->of_node;
> > >  	gpio->ngpio = 2;
> > >  	gpio->base = -1;
> > > -	gpio->set = max9286_gpio_set;
> > > -	gpio->get = max9286_gpio_get;
> > > +	gpio->set = max9286_gpiochip_set;
> > > +	gpio->get = max9286_gpiochip_get;
> > >  	gpio->can_sleep = true;
> > >
> > > +	ret = devm_gpiochip_add_data(dev, gpio, priv);
> > > +	if (ret)
> > > +		dev_err(dev, "Unable to create gpio_chip\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int max9286_parse_gpios(struct max9286_priv *priv)
> > > +{
> > > +	struct device *dev = &priv->client->dev;
> > > +	u32 gpio_poc[2];
> > > +	int ret;
> > > +
> > >  	/* GPIO values default to high */
> > >  	priv->gpio_state = BIT(0) | BIT(1);
> > >
> > > -	ret = devm_gpiochip_add_data(dev, gpio, priv);
> > > +	/*
> > > +	 * Parse the "gpio-poc" vendor property. If the camera power is
> > > +	 * controlled by one of the MAX9286 gpio lines, do not register
> > > +	 * the gpio controller and ignore 'poc-supply'.
> > > +	 */
> > > +	ret = of_property_read_u32_array(dev->of_node,
> > > +					 "maxim,gpio-poc", gpio_poc, 2);
> > > +	if (!ret) {
> > > +		priv->gpio_poc = gpio_poc[0];
> > > +		priv->gpio_poc_flags = gpio_poc[1];
> > > +		if (priv->gpio_poc > 1 ||
> > > +		    (priv->gpio_poc_flags != GPIO_ACTIVE_HIGH &&
> > > +		     priv->gpio_poc_flags != GPIO_ACTIVE_LOW)) {
> > > +			dev_err(dev, "Invalid 'gpio-poc': (%u %u)\n",
> > > +				priv->gpio_poc, priv->gpio_poc_flags);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = max9286_register_gpio(priv);
> > >  	if (ret)
> > > -		dev_err(dev, "Unable to create gpio_chip\n");
> > > +		return ret;
> > > +
> > > +	priv->regulator = devm_regulator_get(dev, "poc");
> > > +	if (IS_ERR(priv->regulator)) {
> > > +		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> > > +			dev_err(dev, "Unable to get PoC regulator (%ld)\n",
> > > +				PTR_ERR(priv->regulator));
> > > +		return PTR_ERR(priv->regulator);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
> > > +{
> > > +	int ret;
> > > +
> > > +	/* If "poc-gpio" is used, toggle the line and do not use regulator. */
> > > +	if (enable)
> > > +		ret = priv->regulator
> > > +		    ? regulator_enable(priv->regulator)
> > > +		    : max9286_gpio_set(priv, priv->gpio_poc,
> > > +				       enable ^ priv->gpio_poc_flags);
> > > +	else
> > > +		ret = priv->regulator
> > > +		    ? regulator_disable(priv->regulator)
> > > +		    : max9286_gpio_set(priv, priv->gpio_poc,
> > > +				       enable ^ priv->gpio_poc_flags);
> > > +
> > > +	if (ret < 0)
> > > +		dev_err(&priv->client->dev, "Unable to turn PoC %s\n",
> > > +			enable ? "on" : "off");
> > >
> > >  	return ret;
> > >  }
> > > @@ -1078,17 +1154,14 @@ static int max9286_init(struct device *dev)
> > >  	client = to_i2c_client(dev);
> > >  	priv = i2c_get_clientdata(client);
> > >
> > > -	/* Enable the bus power. */
> > > -	ret = regulator_enable(priv->regulator);
> > > -	if (ret < 0) {
> > > -		dev_err(&client->dev, "Unable to turn PoC on\n");
> > > +	ret = max9286_poc_enable(priv, true);
> > > +	if (ret)
> > >  		return ret;
> > > -	}
> > >
> > >  	ret = max9286_setup(priv);
> > >  	if (ret) {
> > >  		dev_err(dev, "Unable to setup max9286\n");
> > > -		goto err_regulator;
> > > +		goto err_poc_disable;
> > >  	}
> > >
> > >  	/*
> > > @@ -1098,7 +1171,7 @@ static int max9286_init(struct device *dev)
> > >  	ret = max9286_v4l2_register(priv);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to register with V4L2\n");
> > > -		goto err_regulator;
> > > +		goto err_poc_disable;
> > >  	}
> > >
> > >  	ret = max9286_i2c_mux_init(priv);
> > > @@ -1114,8 +1187,8 @@ static int max9286_init(struct device *dev)
> > >
> > >  err_v4l2_register:
> > >  	max9286_v4l2_unregister(priv);
> > > -err_regulator:
> > > -	regulator_disable(priv->regulator);
> > > +err_poc_disable:
> > > +	max9286_poc_enable(priv, false);
> > >
> > >  	return ret;
> > >  }
> > > @@ -1286,20 +1359,10 @@ static int max9286_probe(struct i2c_client *client)
> > >  	 */
> > >  	max9286_configure_i2c(priv, false);
> > >
> > > -	ret = max9286_register_gpio(priv);
> > > +	ret = max9286_parse_gpios(priv);
> > >  	if (ret)
> > >  		goto err_powerdown;
> > >
> > > -	priv->regulator = devm_regulator_get(&client->dev, "poc");
> > > -	if (IS_ERR(priv->regulator)) {
> > > -		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> > > -			dev_err(&client->dev,
> > > -				"Unable to get PoC regulator (%ld)\n",
> > > -				PTR_ERR(priv->regulator));
> > > -		ret = PTR_ERR(priv->regulator);
> > > -		goto err_powerdown;
> > > -	}
> > > -
> > >  	ret = max9286_parse_dt(priv);
> > >  	if (ret)
> > >  		goto err_powerdown;
> > > @@ -1326,7 +1389,7 @@ static int max9286_remove(struct i2c_client *client)
> > >
> > >  	max9286_v4l2_unregister(priv);
> > >
> > > -	regulator_disable(priv->regulator);
> > > +	max9286_poc_enable(priv, false);
> > >
> > >  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> > >
> > >
> >
> > --
> > Regards
> > --
> > Kieran
