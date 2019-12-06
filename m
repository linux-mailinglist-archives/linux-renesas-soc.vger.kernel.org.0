Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902D9115203
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfLFOIu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:08:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42938 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfLFOIu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:08:50 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3D82E5;
        Fri,  6 Dec 2019 15:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575641327;
        bh=GDkTs3n1qcQISR/c6xpjMyWUhzrKF4S7na4S6XDJWTk=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=pGXYLyuljS9uYf9H5HcG4oxFRjS2SxliDuu2UOb89lnhIfjx7jIVFN9HEY36u5Hra
         jNGeW1D6ZJJ6ifgkimCUe2tcGEIKFDgvIR5WbnXf6tcgTjdnCevD88kJNt4HJ6MWNQ
         ayAptBbsHUvZbjXgozlbmuxjG940KTjsGhcuwElk=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/3] media: i2c: max9286: Add GPIO chip controller
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
 <20191206140520.10457-2-kieran.bingham@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <318ef28f-08fa-cded-965f-ecdfa62dcbb7@ideasonboard.com>
Date:   Fri, 6 Dec 2019 14:08:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206140520.10457-2-kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello me,

On 06/12/2019 14:05, Kieran Bingham wrote:
> Provide a GPIO chip to control the two output lines available on the
> MAX9286.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 68 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 6ea08fd87811..c34e7b5c7447 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/fwnode.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/module.h>
> @@ -58,6 +59,8 @@
>  #define MAX9286_HVSRC_D0		(2 << 0)
>  #define MAX9286_HVSRC_D14		(1 << 0)
>  #define MAX9286_HVSRC_D18		(0 << 0)
> +/* Register 0x0f */
> +#define MAX9286_0X0F_RESERVED		BIT(3)
>  /* Register 0x12 */
>  #define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
>  #define MAX9286_CSIDBL			BIT(5)
> @@ -145,6 +148,9 @@ struct max9286_priv {
>  	struct regulator *regulator;
>  	bool poc_enabled;
>  
> +	struct gpio_chip gpio;
> +	u8 gpio_state;
> +
>  	struct i2c_mux_core *mux;
>  	unsigned int mux_channel;
>  	bool mux_open;
> @@ -712,6 +718,60 @@ static const struct of_device_id max9286_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, max9286_dt_ids);
>  
> +static void max9286_gpio_set(struct gpio_chip *chip,
> +			     unsigned int offset, int value)
> +{
> +	struct max9286_priv *priv = gpiochip_get_data(chip);
> +
> +	if (value)
> +		priv->gpio_state |= BIT(offset);
> +	else
> +		priv->gpio_state &= ~BIT(offset);
> +
> +	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
> +}
> +
> +static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct max9286_priv *priv = gpiochip_get_data(chip);
> +
> +	return priv->gpio_state & BIT(offset);
> +}
> +
> +static int max9286_gpio(struct max9286_priv *priv)
> +{
> +	struct device *dev = &priv->client->dev;
> +	struct gpio_chip *gpio = &priv->gpio;
> +	int ret;
> +
> +	static const char * const names[] = {
> +		"GPIO0OUT",
> +		"GPIO1OUT",
> +	};
> +
> +	/* Configure the GPIO */
> +	gpio->label = dev_name(dev);
> +	gpio->parent = dev;
> +	gpio->owner = THIS_MODULE;
> +	gpio->of_node = dev->of_node;
> +	gpio->ngpio = 2;
> +	gpio->set = max9286_gpio_set;
> +	gpio->get = max9286_gpio_get;
> +	gpio->can_sleep = true;
> +	gpio->names = names;
> +
> +	/* GPIO values default to high */
> +	priv->gpio_state = BIT(0) | BIT(1);
> +
> +	ret = devm_gpiochip_add_data(dev, gpio, priv);
> +	if (ret)
> +		dev_err(dev, "Unable to create gpio_chip\n");
> +
> +	dev_err(dev, "Created gpio_chip for MAX9286\n");

This debug line should be removed of course.

Now removed.

> +
> +	return ret;
> +}
> +
>  static int max9286_init(struct device *dev)
>  {
>  	struct max9286_priv *priv;
> @@ -984,6 +1044,14 @@ static int max9286_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * It is possible to set up the power regulator from the GPIO lines,
> +	 * so it needs to be set up early.
> +	 */
> +	ret = max9286_gpio(priv);
> +	if (ret)
> +		return ret;
> +
>  	priv->regulator = regulator_get(&client->dev, "poc");
>  	if (IS_ERR(priv->regulator)) {
>  		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> 

-- 
Regards
--
Kieran
