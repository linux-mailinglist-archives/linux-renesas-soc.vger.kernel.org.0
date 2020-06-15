Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5D11F91B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 10:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgFOIjr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 04:39:47 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45141 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFOIjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 04:39:47 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4DCD8E0009;
        Mon, 15 Jun 2020 08:39:41 +0000 (UTC)
Date:   Mon, 15 Jun 2020 10:43:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-10-jacopo+renesas@jmondi.org>
 <20200615083405.GP16711@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200615083405.GP16711@paasikivi.fi.intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sakari,

On Mon, Jun 15, 2020 at 11:34:06AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Jun 11, 2020 at 06:16:51PM +0200, Jacopo Mondi wrote:
> > Use the newly introduced get_mbus_config() subdevice pad operation to
> > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > the number of active data lanes accordingly.
> >
> > In order to be able to call the remote subdevice operation cache the
> > index of the remote pad connected to the single CSI-2 input port.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 61 ++++++++++++++++++++-
> >  1 file changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 151e6a90c5fb..11769f004fd8 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -363,6 +363,7 @@ struct rcar_csi2 {
> >  	struct v4l2_async_notifier notifier;
> >  	struct v4l2_async_subdev asd;
> >  	struct v4l2_subdev *remote;
> > +	unsigned int remote_pad;
> >
> >  	struct v4l2_mbus_framefmt mf;
> >
> > @@ -371,6 +372,7 @@ struct rcar_csi2 {
> >
> >  	unsigned short lanes;
> >  	unsigned char lane_swap[4];
> > +	unsigned short active_lanes;
>
> Do you need this? I.e. should you not always request this from the
> transmitter device?

It's actually the other way around. The receiver queries the
transmitter to know how many data lanes it intends to use and adjusts
its configuration to accommodate it.

>
> >  };
> >
> >  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> > @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> >
> >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> >  	for (timeout = 0; timeout <= 20; timeout++) {
> > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
> >
> >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > @@ -471,11 +473,57 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> >  	 * bps = link_freq * 2
> >  	 */
> >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > -	do_div(mbps, priv->lanes * 1000000);
> > +	do_div(mbps, priv->active_lanes * 1000000);
> >
> >  	return mbps;
> >  }
> >
> > +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv)
> > +{
> > +	struct v4l2_mbus_config mbus_config = { 0 };
> > +	unsigned int num_lanes = (-1U);
> > +	int ret;
> > +
> > +	priv->active_lanes = priv->lanes;
> > +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> > +			       priv->remote_pad, &mbus_config);
> > +	if (ret == -ENOIOCTLCMD) {
> > +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> > +		return 0;
> > +	}
> > +
> > +	if (ret) {
> > +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
> > +		return ret;
> > +	}
> > +
> > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > +		dev_err(priv->dev, "Unsupported media bus type %u\n",
> > +			mbus_config.type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> > +		num_lanes = 1;
> > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> > +		num_lanes = 2;
> > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> > +		num_lanes = 3;
> > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> > +		num_lanes = 4;
>
> This is the downside of using flags... Anyway, I guess this is certainly
> fine now.
>

Let's change this on top, if we like to (and I would like to :)

Thanks
  j

> > +
> > +	if (num_lanes > priv->lanes) {
> > +		dev_err(priv->dev,
> > +			"Unsupported mbus config: too many data lanes %u\n",
> > +			num_lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv->active_lanes = num_lanes;
> > +
> > +	return 0;
> > +}
> > +
> >  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  {
> >  	const struct rcar_csi2_format *format;
> > @@ -490,6 +538,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  	/* Code is validated in set_fmt. */
> >  	format = rcsi2_code_to_fmt(priv->mf.code);
> >
> > +	/* Get the remote mbus config to get the number of enabled lanes. */
> > +	ret = rcsi2_config_active_lanes(priv);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * Enable all supported CSI-2 channels with virtual channel and
> >  	 * data type matching.
> > @@ -522,7 +575,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  	}
> >
> >  	phycnt = PHYCNT_ENABLECLK;
> > -	phycnt |= (1 << priv->lanes) - 1;
> > +	phycnt |= (1 << priv->active_lanes) - 1;
> >
> >  	mbps = rcsi2_calc_mbps(priv, format->bpp);
> >  	if (mbps < 0)
> > @@ -748,6 +801,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
> >  	}
> >
> >  	priv->remote = subdev;
> > +	priv->remote_pad = pad;
> >
> >  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
> >
> > @@ -793,6 +847,7 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
> >  			priv->lanes);
> >  		return -EINVAL;
> >  	}
> > +	priv->active_lanes = priv->lanes;
> >
> >  	for (i = 0; i < ARRAY_SIZE(priv->lane_swap); i++) {
> >  		priv->lane_swap[i] = i < priv->lanes ?
>
> --
> Kind regards,
>
> Sakari Ailus
