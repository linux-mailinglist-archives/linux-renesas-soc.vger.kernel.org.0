Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4172205E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 09:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgGOHJ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 03:09:59 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51307 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbgGOHJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 03:09:58 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3FDC01C000C;
        Wed, 15 Jul 2020 07:09:52 +0000 (UTC)
Date:   Wed, 15 Jul 2020 09:13:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        dave.stevenson@raspberrypi.com, hyun.kwon@xilinx.com,
        jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200715071325.epyuci3urjqoex4m@uno.localdomain>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
 <20200714135812.55158-10-jacopo+renesas@jmondi.org>
 <20200715065538.GI3051471@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715065538.GI3051471@oden.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Jul 15, 2020 at 08:55:38AM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2020-07-14 15:58:12 +0200, Jacopo Mondi wrote:
> > Use the newly introduced get_mbus_config() subdevice pad operation to
> > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > the number of active data lanes accordingly.
> >
> > In order to be able to call the remote subdevice operation cache the
> > index of the remote pad connected to the single CSI-2 input port.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
> >  1 file changed, 67 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index c6cc4f473a07..d39f312ebff9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -364,6 +364,7 @@ struct rcar_csi2 {
> >  	struct v4l2_async_notifier notifier;
> >  	struct v4l2_async_subdev asd;
> >  	struct v4l2_subdev *remote;
> > +	unsigned int remote_pad;
> >
> >  	struct v4l2_mbus_framefmt mf;
> >
> > @@ -409,13 +410,14 @@ static void rcsi2_exit_standby(struct rcar_csi2 *priv)
> >  	reset_control_deassert(priv->rstc);
> >  }
> >
> > -static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > +static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
> > +				unsigned int active_lanes)
>
> Maybe s/active_lanes/lanes/ here and below?
>

ok, I guess it's not important to convey the distinction between
active and available lanes here.

> >  {
> >  	unsigned int timeout;
> >
> >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> >  	for (timeout = 0; timeout <= 20; timeout++) {
> > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > +		const u32 lane_mask = (1 << active_lanes) - 1;
> >
> >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > @@ -447,7 +449,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> > +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > +			   unsigned int active_lanes)
> >  {
> >  	struct v4l2_subdev *source;
> >  	struct v4l2_ctrl *ctrl;
> > @@ -472,15 +475,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> >  	 * bps = link_freq * 2
> >  	 */
> >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > -	do_div(mbps, priv->lanes * 1000000);
> > +	do_div(mbps, active_lanes * 1000000);
> >
> >  	return mbps;
> >  }
> >
> > +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv,
> > +				     unsigned int *active_lanes)
>
> I would name this rcsi2_get_active_lanes() as it does not configure
> anything just queries the subdevice for information.
>

ack

> > +{
> > +	struct v4l2_mbus_config mbus_config = { 0 };
> > +	unsigned int num_lanes = (-1U);
>
> This looks odd and could just be set 0 with the same effect but clearer
> to read.
>

Not really.

Have a look at this part:

	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
		num_lanes = 1;
	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
		num_lanes = 2;
	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
		num_lanes = 3;
	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
		num_lanes = 4;

	if (num_lanes > priv->lanes) {

        ^^ I should then change this one to:

        if (!num_lanes)

But this does not protect against the case num_lanes is actually set
to a meaningful value, but it's larger than the number of actually
available lanes (which is held by priv->lanes).

I would keep this one as it is.

Thanks
  j

> > +	int ret;
> > +
> > +	*active_lanes = priv->lanes;
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
> > +
> > +	if (num_lanes > priv->lanes) {
> > +		dev_err(priv->dev,
> > +			"Unsupported mbus config: too many data lanes %u\n",
> > +			num_lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*active_lanes = num_lanes;
> > +
> > +	return 0;
> > +}
> > +
> >  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  {
> >  	const struct rcar_csi2_format *format;
> >  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> > +	unsigned int active_lanes;
> >  	unsigned int i;
> >  	int mbps, ret;
> >
> > @@ -522,10 +573,18 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  			fld |= FLD_FLD_NUM(1);
> >  	}
> >
> > +	/*
> > +	 * Get the number of active data lanes inspecting the remote mbus
> > +	 * configuration.
> > +	 */
> > +	ret = rcsi2_config_active_lanes(priv, &active_lanes);
> > +	if (ret)
> > +		return ret;
> > +
> >  	phycnt = PHYCNT_ENABLECLK;
> > -	phycnt |= (1 << priv->lanes) - 1;
> > +	phycnt |= (1 << active_lanes) - 1;
> >
> > -	mbps = rcsi2_calc_mbps(priv, format->bpp);
> > +	mbps = rcsi2_calc_mbps(priv, format->bpp, active_lanes);
> >  	if (mbps < 0)
> >  		return mbps;
> >
> > @@ -572,7 +631,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
> >  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);
> >
> > -	ret = rcsi2_wait_phy_start(priv);
> > +	ret = rcsi2_wait_phy_start(priv, active_lanes);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -749,6 +808,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
> >  	}
> >
> >  	priv->remote = subdev;
> > +	priv->remote_pad = pad;
> >
> >  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
> >
> > --
> > 2.27.0
> >
>
> --
> Regards,
> Niklas Söderlund
