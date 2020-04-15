Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEDC1A980B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 11:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408343AbgDOJLB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 05:11:01 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:58173 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408295AbgDOJK6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 05:10:58 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D872140002;
        Wed, 15 Apr 2020 09:10:52 +0000 (UTC)
Date:   Wed, 15 Apr 2020 11:13:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
Message-ID: <20200415091357.ikmba3gipsj6i4dt@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
 <20200414105057.m4o3iejlbjivjyes@uno.localdomain>
 <20200414211002.GP19819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200414211002.GP19819@pendragon.ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Apr 15, 2020 at 12:10:02AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Tue, Apr 14, 2020 at 12:50:57PM +0200, Jacopo Mondi wrote:
> > Hi Kieran,
> >    +Niklas and Laurent for R-Car CSI-2 question
> >
> > sorry I now had the time to have a proper look to this one
> >
> > On Thu, Apr 09, 2020 at 01:11:59PM +0100, Kieran Bingham wrote:
> > > Determine the (CSI2) pixel rate control by providing a control to read,
> > > and checking the rate from the upstream camera sensors, and their
> > > appropriate formats.
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
> > >  1 file changed, 38 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 17830c362a50..008a93910300 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -155,6 +155,7 @@ struct max9286_priv {
> > >  	bool mux_open;
> > >
> > >  	struct v4l2_ctrl_handler ctrls;
> > > +	struct v4l2_ctrl *pixelrate;
> > >
> > >  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > >
> > > @@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	return 0;
> > >  }
> > >
> > > +static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
> > > +{
> > > +	if (!priv->pixelrate)
> > > +		return -EINVAL;
> > > +
> > > +	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
> > > +
> > > +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
> > > +}
> > > +
> > >  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> > >  				  struct v4l2_subdev_pad_config *cfg,
> > >  				  struct v4l2_subdev_mbus_code_enum *code)
> > > @@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> > >  {
> > >  	struct max9286_priv *priv = sd_to_max9286(sd);
> > >  	struct v4l2_mbus_framefmt *cfg_fmt;
> > > +	s64 pixelrate;
> > >
> > >  	if (format->pad >= MAX9286_SRC_PAD)
> > >  		return -EINVAL;
> > > @@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> > >  	*cfg_fmt = format->format;
> > >  	mutex_unlock(&priv->mutex);
> > >
> > > +	/* Update pixel rate for the CSI2 receiver */
> > > +	pixelrate = cfg_fmt->width * cfg_fmt->height
> > > +		  * priv->nsources * 30 /*FPS*/;
> >
> > I would have calculated this differently, as this to me should come from
> > the CSI-2 link frequency.
> >
> > In case of 4 * RDACM20 (1280*800, YUYV8_2X8, 30 FPS)
> >
> > Tot Bandwidht = 4 * (1280 * 800 * 16 * 30) = 1,966,080,000 bits
>
> You're forgetting the blanking here.
>

Am I ? I understand the full line lenght should be taken into account
when programming the PLL cirtcuitry of a sensor to tune it's CSI-2
transmitter output, but, being the CSI-2 transmission happening after
several translations, I am not sure about it.

The serializer receives frames on a serial bus, driven by the sensor
reference signals (HREF, VSYNC and PCLK). As in regular parallel capture
operations (if I'm not mistaken), data are sampled during the active HREF
periods, so either the serializer sends active data to be scrambled
and encoded on the GMSL bus, or it does the same transmitting
'blankings' perdiods as specially encoded packets on the GSML bus.

I'm actually not sure how what happens there, and I assumed only valid
data gets decoded and sent but the fact that we enable HS/VS encoding
in the GMSL stream makes me wonder if blankings are not actually sent
and then encoded in the output CSI-2 stream as well.


> > CSI-2 Link Freq = TotBandwidth / lanes / DDR =
> >                 = 1,966,080,000 / 4 / 2 = 245,760,000 Mhz
>
> And here you're not taking protocol overhead into account. You'll end up
> with a too low frequency (and when I say you, it equally applies to this
> patch).
>
> The pixel rate should be computed based on the CSI-2 link frequency
> instead, which itself should be based on the GMSL link frequency (unless
> my understanding is wrong, the MAX9286 doesn't support retiming the
> video signal to reduce or increase the clock frequency through increase
> or reduction of horizontal blanking), itself based on the pixel clock
> input of the serializer (with a few parameters taken into account, such
> as double-input mode, high data-rate mode and 24-/32-bit mode).
>

The deserializer manual presents formulas to calculate the CSI-2
output bit rate per lane unrelated to the GMSL link frequency at page
47 of the manual.

Could the deserializer be capable of deducing the frequency to program its
CSI-2 transmitter to using the GSML link frequency, knowing the GMSL bus
protocol overheads?

I think we could do the same and deduce the CSI-2 frequency from the
sensor's pixel rate leaving the GMSL link overhead out of the picture.


> > CSI-2 Lane Bandw = TotBandwith / lanes
> >                  = 491,520,00 Mbps
> > Pixel Rate = LaneBandwidth * lanes / BPP
> >            =  122,880,000 pixel/second
> >
> > Which matches your calculation of
> >         (width * height * channesl * FPS)
> >         1280 * 800 * 4 * 30 = 122880000
> >
> > So I think all of this just serves as validation of the above part.
> >
> > Now, the PIXEL_RATE ctrl is queried by the CSI-2 receiver which use it
> > to compute again the bandwidth per lane in Mbps, in order to set the
> > PHTW value, but for H3 those values are available only up to 250Mbps,
> > while here we get a 491Mbps (and the CSI-2 driver which re-does the
> > calculations gets the same value).
> >
> > Might this be because the total bandwidths of CSI-2 is 1Gbps ? (but in
> > that case the PHTW value should be calculated depending on the lane
> > nunmbers), so is our calculation of pixel rate in max9286 off ?
> >
> > Also consider that the original value was set to 50MPixel/second, less
> > than the half of our calculation..
> >
> > What do you think ?
> >
> > > +
> > > +	max9286_set_pixelrate(priv, pixelrate);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> > >  	.open = max9286_open,
> > >  };
> > >
> > > +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_PIXEL_RATE:
> > > +		return 0;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
> > > +	.s_ctrl	= max9286_s_ctrl,
> > > +};
> > > +
> > >  static int max9286_v4l2_register(struct max9286_priv *priv)
> > >  {
> > >  	struct device *dev = &priv->client->dev;
> > > @@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> > >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > >
> > >  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> > > -	/*
> > > -	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
> > > -	 * hardcoded frequency in the BSP CSI-2 receiver driver.
> > > -	 */
> > > -	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> > > -			  50000000, 50000000, 1, 50000000);
> > > +
> > > +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> > > +					    &max9286_ctrl_ops,
> > > +					    V4L2_CID_PIXEL_RATE,
> > > +					    1, INT_MAX, 1, 50000000);
> > > +
> > >  	priv->sd.ctrl_handler = &priv->ctrls;
> > >  	ret = priv->ctrls.error;
> > >  	if (ret)
>
> --
> Regards,
>
> Laurent Pinchart
