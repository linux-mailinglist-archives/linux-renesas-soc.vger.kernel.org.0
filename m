Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF0911A4332
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgDJHv0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:51:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34782 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDJHvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:51:25 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19BD4329;
        Fri, 10 Apr 2020 09:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586505084;
        bh=utNapla2G11ca8bOZtlZdACRsvt7kM8wY1sNaSdAMlY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hsW8qvDZnjBJ9H4pxZJD1VIvsk6FD4o+LM8m8SQFxIJaAhBDyl1sYQN3fhgG7e3pV
         pO3plWKejPOCcMhjvrahvw+VYGIExwIq2PkXHTi6DVhe/2ObHDZl8cVQpcBgF0tjy7
         gUke3smDVFIKI/I7BCVYJw7LHvU4okW366H6/Kvk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
 <20200409162956.xz3ykjl5sgwkwbnx@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bdb73234-7ef1-dd66-0393-5317688b7c63@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409162956.xz3ykjl5sgwkwbnx@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/04/2020 17:29, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Thu, Apr 09, 2020 at 01:11:59PM +0100, Kieran Bingham wrote:
>> Determine the (CSI2) pixel rate control by providing a control to read,
>> and checking the rate from the upstream camera sensors, and their
>> appropriate formats.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
>>  1 file changed, 38 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 17830c362a50..008a93910300 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -155,6 +155,7 @@ struct max9286_priv {
>>  	bool mux_open;
>>
>>  	struct v4l2_ctrl_handler ctrls;
>> +	struct v4l2_ctrl *pixelrate;
>>
>>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
>>
>> @@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  	return 0;
>>  }
>>
>> +static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
>> +{
>> +	if (!priv->pixelrate)
>> +		return -EINVAL;
> 
> Can this happen ?

Hrm ... no because the control is registered when we register the V4L2
device, - so there can't be an occasion where we don't have it :-)

Removing and simplifying.

> 
>> +
>> +	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
> 
> Is this an error ?


Oops - debug print failure :-)

I can just drop this line.


>> +
>> +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
>> +}
>> +
>>  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>>  				  struct v4l2_subdev_pad_config *cfg,
>>  				  struct v4l2_subdev_mbus_code_enum *code)
>> @@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>>  {
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>>  	struct v4l2_mbus_framefmt *cfg_fmt;
>> +	s64 pixelrate;
>>
>>  	if (format->pad >= MAX9286_SRC_PAD)
>>  		return -EINVAL;
>> @@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>>  	*cfg_fmt = format->format;
>>  	mutex_unlock(&priv->mutex);
>>
>> +	/* Update pixel rate for the CSI2 receiver */
>> +	pixelrate = cfg_fmt->width * cfg_fmt->height
>> +		  * priv->nsources * 30 /*FPS*/;
>> +
>> +	max9286_set_pixelrate(priv, pixelrate);
>> +
>>  	return 0;
>>  }
>>
>> @@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
>>  	.open = max9286_open,
>>  };
>>
>> +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_PIXEL_RATE:
>> +		return 0;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
>> +	.s_ctrl	= max9286_s_ctrl,
>> +};
>> +
> 
> After -years- I still don't get controls fully... Where is get? that's
> the whole point of calculating the pixel rate to report it to the
> receiver... I would not allow setting this from the extern but just
> retrieve it after it has been updated by a set_format().
> 
> Am I getting controls wrong again ?

The control framework handles get. The value is stored in the
priv->pixelrate control structure or managed by the core.

The CSI2 receiver calls the get operation on this subdev to know what
the rate is for the CSI2 link, see:

https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/tree/drivers/media/platform/rcar-vin/rcar-csi2.c?h=gmsl/dev#n449

> 
>>  static int max9286_v4l2_register(struct max9286_priv *priv)
>>  {
>>  	struct device *dev = &priv->client->dev;
>> @@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>
>>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
>> -	/*
>> -	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
>> -	 * hardcoded frequency in the BSP CSI-2 receiver driver.
>> -	 */
>> -	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
>> -			  50000000, 50000000, 1, 50000000);
>> +
>> +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
>> +					    &max9286_ctrl_ops,
>> +					    V4L2_CID_PIXEL_RATE,
>> +					    1, INT_MAX, 1, 50000000);
>> +
>>  	priv->sd.ctrl_handler = &priv->ctrls;
>>  	ret = priv->ctrls.error;
>>  	if (ret)
>> --
>> 2.20.1
>>

