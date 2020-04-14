Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAB41A78BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 12:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438493AbgDNKsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 06:48:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46919 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438612AbgDNKsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 06:48:05 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7EB0440003;
        Tue, 14 Apr 2020 10:47:52 +0000 (UTC)
Date:   Tue, 14 Apr 2020 12:50:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
Message-ID: <20200414105057.m4o3iejlbjivjyes@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,
   +Niklas and Laurent for R-Car CSI-2 question

sorry I now had the time to have a proper look to this one

On Thu, Apr 09, 2020 at 01:11:59PM +0100, Kieran Bingham wrote:
> Determine the (CSI2) pixel rate control by providing a control to read,
> and checking the rate from the upstream camera sensors, and their
> appropriate formats.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 17830c362a50..008a93910300 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -155,6 +155,7 @@ struct max9286_priv {
>  	bool mux_open;
>
>  	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *pixelrate;
>
>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
>
> @@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>
> +static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
> +{
> +	if (!priv->pixelrate)
> +		return -EINVAL;
> +
> +	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
> +
> +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
> +}
> +
>  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_pad_config *cfg,
>  				  struct v4l2_subdev_mbus_code_enum *code)
> @@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
> +	s64 pixelrate;
>
>  	if (format->pad >= MAX9286_SRC_PAD)
>  		return -EINVAL;
> @@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	*cfg_fmt = format->format;
>  	mutex_unlock(&priv->mutex);
>
> +	/* Update pixel rate for the CSI2 receiver */
> +	pixelrate = cfg_fmt->width * cfg_fmt->height
> +		  * priv->nsources * 30 /*FPS*/;

I would have calculated this differently, as this to me should come from
the CSI-2 link frequency.

In case of 4 * RDACM20 (1280*800, YUYV8_2X8, 30 FPS)

Tot Bandwidht = 4 * (1280 * 800 * 16 * 30) = 1,966,080,000 bits
CSI-2 Link Freq = TotBandwidth / lanes / DDR =
                = 1,966,080,000 / 4 / 2 = 245,760,000 Mhz
CSI-2 Lane Bandw = TotBandwith / lanes
                 = 491,520,00 Mbps
Pixel Rate = LaneBandwidth * lanes / BPP
           =  122,880,000 pixel/second

Which matches your calculation of
        (width * height * channesl * FPS)
        1280 * 800 * 4 * 30 = 122880000

So I think all of this just serves as validation of the above part.

Now, the PIXEL_RATE ctrl is queried by the CSI-2 receiver which use it
to compute again the bandwidth per lane in Mbps, in order to set the
PHTW value, but for H3 those values are available only up to 250Mbps,
while here we get a 491Mbps (and the CSI-2 driver which re-does the
calculations gets the same value).

Might this be because the total bandwidths of CSI-2 is 1Gbps ? (but in
that case the PHTW value should be calculated depending on the lane
nunmbers), so is our calculation of pixel rate in max9286 off ?

Also consider that the original value was set to 50MPixel/second, less
than the half of our calculation..

What do you think ?

Thanks
   j



> +
> +	max9286_set_pixelrate(priv, pixelrate);
> +
>  	return 0;
>  }
>
> @@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
>  	.open = max9286_open,
>  };
>
> +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	switch (ctrl->id) {
> +	case V4L2_CID_PIXEL_RATE:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
> +	.s_ctrl	= max9286_s_ctrl,
> +};
> +
>  static int max9286_v4l2_register(struct max9286_priv *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> @@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>
>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> -	/*
> -	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
> -	 * hardcoded frequency in the BSP CSI-2 receiver driver.
> -	 */
> -	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> -			  50000000, 50000000, 1, 50000000);
> +
> +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> +					    &max9286_ctrl_ops,
> +					    V4L2_CID_PIXEL_RATE,
> +					    1, INT_MAX, 1, 50000000);
> +
>  	priv->sd.ctrl_handler = &priv->ctrls;
>  	ret = priv->ctrls.error;
>  	if (ret)
> --
> 2.20.1
>
