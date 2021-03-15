Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DC633BFB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCOP3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhCOP3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 11:29:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796AFC06174A;
        Mon, 15 Mar 2021 08:29:04 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0D09556;
        Mon, 15 Mar 2021 16:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615822143;
        bh=JftYtn6eS1Bel0BSeL+IPZ40USl4otVnwyv2aWIzRjg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=g47MtynHxRaXz3KADyU5UVBtdcwdYVwaVb9htbQQI2zCLSGYahJ4k/KXH3Gn8rcVE
         J9CGMfjM+mN81pTd6V011gPaWzmjeS7/mOXyLLRW1MGSMpUcYDbALTnX7rM5ywRJaq
         Jy7dCe+er6Bt1/IyN50QW6cR3ItPA+KMFrwMlsGU=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 03/18] media: i2c: rdacm20: Embedded 'serializer' field
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <51366161-1cec-f9be-7774-5bd2ef320d85@ideasonboard.com>
Date:   Mon, 15 Mar 2021 15:29:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

in $SUBJECT s/Embedded/Embed/

But it's trivial so no worries unless there's another iteration.


On 15/03/2021 13:14, Jacopo Mondi wrote:
> There's no reason to allocate dynamically the 'serializer' field in
> the driver structure.
> 
> Embed the field and adjust all its users in the driver.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Still holds ;-)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 38 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index f7fd5ae955d0..4d9bac87cba8 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -312,7 +312,7 @@ static const struct ov10635_reg {
>  
>  struct rdacm20_device {
>  	struct device			*dev;
> -	struct max9271_device		*serializer;
> +	struct max9271_device		serializer;
>  	struct i2c_client		*sensor;
>  	struct v4l2_subdev		sd;
>  	struct media_pad		pad;
> @@ -399,7 +399,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rdacm20_device *dev = sd_to_rdacm20(sd);
>  
> -	return max9271_set_serial_link(dev->serializer, enable);
> +	return max9271_set_serial_link(&dev->serializer, enable);
>  }
>  
>  static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -456,11 +456,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	int ret;
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
> -	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
> -	i2c_smbus_read_byte(dev->serializer->client);
> +	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> +	i2c_smbus_read_byte(dev->serializer.client);
>  
>  	/* Serial link disabled during config as it needs a valid pixel clock. */
> -	ret = max9271_set_serial_link(dev->serializer, false);
> +	ret = max9271_set_serial_link(&dev->serializer, false);
>  	if (ret)
>  		return ret;
>  
> @@ -468,35 +468,35 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	 *  Ensure that we have a good link configuration before attempting to
>  	 *  identify the device.
>  	 */
> -	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> -					       MAX9271_I2CSLVTO_1024US |
> -					       MAX9271_I2CMSTBT_105KBPS);
> +	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> +						MAX9271_I2CSLVTO_1024US |
> +						MAX9271_I2CMSTBT_105KBPS);
>  
> -	max9271_configure_gmsl_link(dev->serializer);
> +	max9271_configure_gmsl_link(&dev->serializer);
>  
> -	ret = max9271_verify_id(dev->serializer);
> +	ret = max9271_verify_id(&dev->serializer);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> +	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
>  	if (ret < 0)
>  		return ret;
> -	dev->serializer->client->addr = dev->addrs[0];
> +	dev->serializer.client->addr = dev->addrs[0];
>  
>  	/*
>  	 * Reset the sensor by cycling the OV10635 reset signal connected to the
>  	 * MAX9271 GPIO1 and verify communication with the OV10635.
>  	 */
> -	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  
> -	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  	usleep_range(10000, 15000);
>  
> -	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  	usleep_range(10000, 15000);
> @@ -560,13 +560,7 @@ static int rdacm20_probe(struct i2c_client *client)
>  	if (!dev)
>  		return -ENOMEM;
>  	dev->dev = &client->dev;
> -
> -	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
> -				       GFP_KERNEL);
> -	if (!dev->serializer)
> -		return -ENOMEM;
> -
> -	dev->serializer->client = client;
> +	dev->serializer.client = client;
>  
>  	ret = of_property_read_u32_array(client->dev.of_node, "reg",
>  					 dev->addrs, 2);
> 

