Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682263AA7B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 01:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbhFPXtv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 19:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbhFPXtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 19:49:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E607C061574;
        Wed, 16 Jun 2021 16:47:44 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AC0AE53;
        Thu, 17 Jun 2021 01:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623887260;
        bh=IS0q+M3hWc7M1JZSrutIxVUhjhUtPGpGzVZceEQYkIA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IFoKq4dXc50CqvijCEGfwTbelpg2qKjnVOEEHHNGiuOooGN4zqP5rtDl9Gkqeb1jw
         n4KTn6QZsO//wNEXXmjTOaULgfqNy/6eNj6P7ltQlnawfWLhda4XMXdxb8O4tVF+Nb
         sdpZqng2WUqml5JgSPBiVwT4KS1Vy76Lor+6ZdxI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 10/15] media: i2c: rdacm21: Power up OV10640 before
 OV490
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
 <20210616124616.49249-11-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <75213041-b4d3-2760-6b21-460ca7885574@ideasonboard.com>
Date:   Thu, 17 Jun 2021 00:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616124616.49249-11-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Hrm - this seems to be the only one in this series without my RB tag, so
lets take a look.


On 16/06/2021 13:46, Jacopo Mondi wrote:
> The current RDACM21 initialization routine powers up the OV10640 image
> sensor after the OV490 ISP. The ISP is programmed with a firmare loaded

s/firmare/firmware/

> from an embedded serial flash that (most probably) tries to interact and
> program also the image sensor connected to the ISP.
> 
> As described in commit "media: i2c: rdacm21: Fix OV10640 powerup" the
> image sensor powerdown signal is kept high by an internal pull up
> resistor and occasionally fails to startup correctly if the powerdown
> line is not asserted explicitely. Failures in the OV10640 startup causes

s/explicitely/explicitly/


> the OV490 firmware to fail to boot correctly resulting in the camera
> module initialization to fail consequentially.
> 
> Fix this by powering up the OV10640 image sensor before testing the
> OV490 firmware boot completion, by splitting the ov10640_initialize()
> function in an ov10640_power_up() one and an ov10640_check_id() one.
> 
> Also make sure the OV10640 identification procedure gives enough time to
> the image sensor to resume after the programming phase performed by the
> OV490 firmware by repeating the ID read procedure.
> 
> This commit fixes a sporadic start-up error triggered by a failure to
> detect the OV490 firmware boot completion:
> rdacm21 8-0054: Timeout waiting for firmware boot
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/rdacm21.c | 46 ++++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 7c0a4a84340a..43c41cb800a4 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -69,6 +69,7 @@
>  #define OV490_ISP_VSIZE_LOW		0x80820062
>  #define OV490_ISP_VSIZE_HIGH		0x80820063
>  
> +#define OV10640_PID_TIMEOUT		20
>  #define OV10640_ID_HIGH			0xa6
>  #define OV10640_CHIP_ID			0x300a
>  #define OV10640_PIXEL_RATE		55000000
> @@ -329,10 +330,8 @@ static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
>  	.pad		= &rdacm21_subdev_pad_ops,
>  };
>  
> -static int ov10640_initialize(struct rdacm21_device *dev)
> +static void ov10640_power_up(struct rdacm21_device *dev)
>  {
> -	u8 val;
> -
>  	/* Enable GPIO0#0 (reset) and GPIO1#0 (pwdn) as output lines. */
>  	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
>  	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
> @@ -347,18 +346,35 @@ static int ov10640_initialize(struct rdacm21_device *dev)
>  	usleep_range(1500, 3000);
>  	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
>  	usleep_range(3000, 5000);
> +}
>  
> -	/* Read OV10640 ID to test communications. */
> -	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
> -	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
> -	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
> -
> -	/* Trigger SCCB slave transaction and give it some time to complete. */
> -	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
> -	usleep_range(1000, 1500);
> +static int ov10640_check_id(struct rdacm21_device *dev)
> +{
> +	unsigned int i;
> +	u8 val;
>  
> -	ov490_read_reg(dev, OV490_SCCB_SLAVE0_DIR, &val);
> -	if (val != OV10640_ID_HIGH) {
> +	/* Read OV10640 ID to test communications. */
> +	for (i = 0; i < OV10640_PID_TIMEOUT; ++i) {
> +		ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR,
> +				OV490_SCCB_SLAVE_READ);
> +		ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH,
> +				OV10640_CHIP_ID >> 8);
> +		ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW,
> +				OV10640_CHIP_ID & 0xff);
> +
> +		/*
> +		 * Trigger SCCB slave transaction and give it some time
> +		 * to complete.
> +		 */
> +		ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
> +		usleep_range(1000, 1500);
> +
> +		ov490_read_reg(dev, OV490_SCCB_SLAVE0_DIR, &val);
> +		if (val == OV10640_ID_HIGH)
> +			break;
> +		usleep_range(1000, 1500);
> +	}
> +	if (i == OV10640_PID_TIMEOUT) {
>  		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
>  		return -ENODEV;
>  	}
> @@ -374,6 +390,8 @@ static int ov490_initialize(struct rdacm21_device *dev)
>  	unsigned int i;
>  	int ret;
>  
> +	ov10640_power_up(dev);
> +
>  	/*
>  	 * Read OV490 Id to test communications. Give it up to 40msec to
>  	 * exit from reset.
> @@ -411,7 +429,7 @@ static int ov490_initialize(struct rdacm21_device *dev)
>  		return -ENODEV;
>  	}
>  
> -	ret = ov10640_initialize(dev);
> +	ret = ov10640_check_id(dev);
>  	if (ret)
>  		return ret;
>  
> 

