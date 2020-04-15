Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CACD1AABE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 17:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390526AbgDOP25 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 11:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389666AbgDOP2y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 11:28:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83242C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 08:28:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF6362D1;
        Wed, 15 Apr 2020 17:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586964529;
        bh=CFTZ83I24uYcnT4KXzcJ50AU249t06FC5TKYJ4eDJJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RFuW7uRdgJwXLfE9jMlq7ykk3v/HxthlGm+v6aK7RgvZYtLG5CYnYNzBivd98bczU
         /rHUOITl/e3lqnuAcHxt3J+dDmJChFSU1hxQjGZUfXBjA8CORPzpnP+YopVNVHlQ5s
         jJF9hzuAGo9Trm39kP5cGaLqwuUMO8RWrvbZv+JY=
Date:   Wed, 15 Apr 2020 18:28:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
Message-ID: <20200415152836.GH4758@pendragon.ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
 <20200414105057.m4o3iejlbjivjyes@uno.localdomain>
 <20200414211002.GP19819@pendragon.ideasonboard.com>
 <20200415091357.ikmba3gipsj6i4dt@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415091357.ikmba3gipsj6i4dt@uno.localdomain>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Apr 15, 2020 at 11:13:57AM +0200, Jacopo Mondi wrote:
> On Wed, Apr 15, 2020 at 12:10:02AM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 14, 2020 at 12:50:57PM +0200, Jacopo Mondi wrote:
> >> Hi Kieran,
> >>    +Niklas and Laurent for R-Car CSI-2 question
> >>
> >> sorry I now had the time to have a proper look to this one
> >>
> >> On Thu, Apr 09, 2020 at 01:11:59PM +0100, Kieran Bingham wrote:
> >>> Determine the (CSI2) pixel rate control by providing a control to read,
> >>> and checking the rate from the upstream camera sensors, and their
> >>> appropriate formats.
> >>>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
> >>>  1 file changed, 38 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >>> index 17830c362a50..008a93910300 100644
> >>> --- a/drivers/media/i2c/max9286.c
> >>> +++ b/drivers/media/i2c/max9286.c
> >>> @@ -155,6 +155,7 @@ struct max9286_priv {
> >>>  	bool mux_open;
> >>>
> >>>  	struct v4l2_ctrl_handler ctrls;
> >>> +	struct v4l2_ctrl *pixelrate;
> >>>
> >>>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> >>>
> >>> @@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>>  	return 0;
> >>>  }
> >>>
> >>> +static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
> >>> +{
> >>> +	if (!priv->pixelrate)
> >>> +		return -EINVAL;
> >>> +
> >>> +	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
> >>> +
> >>> +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
> >>> +}
> >>> +
> >>>  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> >>>  				  struct v4l2_subdev_pad_config *cfg,
> >>>  				  struct v4l2_subdev_mbus_code_enum *code)
> >>> @@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >>>  {
> >>>  	struct max9286_priv *priv = sd_to_max9286(sd);
> >>>  	struct v4l2_mbus_framefmt *cfg_fmt;
> >>> +	s64 pixelrate;
> >>>
> >>>  	if (format->pad >= MAX9286_SRC_PAD)
> >>>  		return -EINVAL;
> >>> @@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >>>  	*cfg_fmt = format->format;
> >>>  	mutex_unlock(&priv->mutex);
> >>>
> >>> +	/* Update pixel rate for the CSI2 receiver */
> >>> +	pixelrate = cfg_fmt->width * cfg_fmt->height
> >>> +		  * priv->nsources * 30 /*FPS*/;
> >>
> >> I would have calculated this differently, as this to me should come from
> >> the CSI-2 link frequency.
> >>
> >> In case of 4 * RDACM20 (1280*800, YUYV8_2X8, 30 FPS)
> >>
> >> Tot Bandwidht = 4 * (1280 * 800 * 16 * 30) = 1,966,080,000 bits
> >
> > You're forgetting the blanking here.
> 
> Am I ? I understand the full line lenght should be taken into account
> when programming the PLL cirtcuitry of a sensor to tune it's CSI-2
> transmitter output, but, being the CSI-2 transmission happening after
> several translations, I am not sure about it.
> 
> The serializer receives frames on a serial bus, driven by the sensor
> reference signals (HREF, VSYNC and PCLK). As in regular parallel capture
> operations (if I'm not mistaken), data are sampled during the active HREF
> periods, so either the serializer sends active data to be scrambled
> and encoded on the GMSL bus, or it does the same transmitting
> 'blankings' perdiods as specially encoded packets on the GSML bus.
> 
> I'm actually not sure how what happens there, and I assumed only valid
> data gets decoded and sent but the fact that we enable HS/VS encoding
> in the GMSL stream makes me wonder if blankings are not actually sent
> and then encoded in the output CSI-2 stream as well.

I would be surprised if the serializer or deserializer performed any
kind of clock adaptation to drop the blanking. That would require
spreading the active data across the duration of a whole line, requiring
an internal line buffer, and circuitry to handle the spreading. As the
serializer or deserializer are not programmed with the line length, they
would have to detect it automatically, which I really don't think they
do.

This is even more improbable for vertical blanking, as the lines would
need to be spread over the whole image, requiring an internal buffer of
multiple lines.

> >> CSI-2 Link Freq = TotBandwidth / lanes / DDR =
> >>                 = 1,966,080,000 / 4 / 2 = 245,760,000 Mhz
> >
> > And here you're not taking protocol overhead into account. You'll end up
> > with a too low frequency (and when I say you, it equally applies to this
> > patch).
> >
> > The pixel rate should be computed based on the CSI-2 link frequency
> > instead, which itself should be based on the GMSL link frequency (unless
> > my understanding is wrong, the MAX9286 doesn't support retiming the
> > video signal to reduce or increase the clock frequency through increase
> > or reduction of horizontal blanking), itself based on the pixel clock
> > input of the serializer (with a few parameters taken into account, such
> > as double-input mode, high data-rate mode and 24-/32-bit mode).
> 
> The deserializer manual presents formulas to calculate the CSI-2
> output bit rate per lane unrelated to the GMSL link frequency at page
> 47 of the manual.
> 
> Could the deserializer be capable of deducing the frequency to program its
> CSI-2 transmitter to using the GSML link frequency, knowing the GMSL bus
> protocol overheads?

I expect the MAX9286 to slave its PLLs to the incoming clock (recovered
from the signal on the coax cable), with divisors and multipliers to
take DDR, the number of lanes, the number of channels and similar
parameters into account, but without any kind of protocol overhead
calculation.

> I think we could do the same and deduce the CSI-2 frequency from the
> sensor's pixel rate leaving the GMSL link overhead out of the picture.

The CSI-2 bandwidth should be equal to the bandwidth per camera
multiplied by the number of cameras. The bandwidth per camera is equal
to the camera pixel rate multiplied by the number of bits per pixel. It
shouldn't need to be more complicated than that. If you need the pixel
rate on the CSI-2 bus, it's the pixel rate per camera multipled by the
number of cameras. There's no need to perform any calculation here that
would take the width and height into account, just get the pixel rate
from the serializer, which should get it from the camera, and multiply
it by the number of active channels. You may want, as a sanity check, to
verify that all serializers report the same pixel rate.

> >> CSI-2 Lane Bandw = TotBandwith / lanes
> >>                  = 491,520,00 Mbps
> >> Pixel Rate = LaneBandwidth * lanes / BPP
> >>            =  122,880,000 pixel/second
> >>
> >> Which matches your calculation of
> >>         (width * height * channesl * FPS)
> >>         1280 * 800 * 4 * 30 = 122880000
> >>
> >> So I think all of this just serves as validation of the above part.
> >>
> >> Now, the PIXEL_RATE ctrl is queried by the CSI-2 receiver which use it
> >> to compute again the bandwidth per lane in Mbps, in order to set the
> >> PHTW value, but for H3 those values are available only up to 250Mbps,
> >> while here we get a 491Mbps (and the CSI-2 driver which re-does the
> >> calculations gets the same value).
> >>
> >> Might this be because the total bandwidths of CSI-2 is 1Gbps ? (but in
> >> that case the PHTW value should be calculated depending on the lane
> >> nunmbers), so is our calculation of pixel rate in max9286 off ?
> >>
> >> Also consider that the original value was set to 50MPixel/second, less
> >> than the half of our calculation..
> >>
> >> What do you think ?
> >>
> >>> +
> >>> +	max9286_set_pixelrate(priv, pixelrate);
> >>> +
> >>>  	return 0;
> >>>  }
> >>>
> >>> @@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> >>>  	.open = max9286_open,
> >>>  };
> >>>
> >>> +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +	switch (ctrl->id) {
> >>> +	case V4L2_CID_PIXEL_RATE:
> >>> +		return 0;
> >>> +	default:
> >>> +		return -EINVAL;
> >>> +	}
> >>> +}
> >>> +
> >>> +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
> >>> +	.s_ctrl	= max9286_s_ctrl,
> >>> +};
> >>> +
> >>>  static int max9286_v4l2_register(struct max9286_priv *priv)
> >>>  {
> >>>  	struct device *dev = &priv->client->dev;
> >>> @@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> >>>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>>
> >>>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> >>> -	/*
> >>> -	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
> >>> -	 * hardcoded frequency in the BSP CSI-2 receiver driver.
> >>> -	 */
> >>> -	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> >>> -			  50000000, 50000000, 1, 50000000);
> >>> +
> >>> +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> >>> +					    &max9286_ctrl_ops,
> >>> +					    V4L2_CID_PIXEL_RATE,
> >>> +					    1, INT_MAX, 1, 50000000);
> >>> +
> >>>  	priv->sd.ctrl_handler = &priv->ctrls;
> >>>  	ret = priv->ctrls.error;
> >>>  	if (ret)

-- 
Regards,

Laurent Pinchart
