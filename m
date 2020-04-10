Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E361A464F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgDJMck (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 08:32:40 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34665 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgDJMck (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 08:32:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8580EFF804;
        Fri, 10 Apr 2020 12:32:36 +0000 (UTC)
Date:   Fri, 10 Apr 2020 14:35:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
Message-ID: <20200410123539.lbufkjjmzrhqnsmw@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
 <20200409162956.xz3ykjl5sgwkwbnx@uno.localdomain>
 <bdb73234-7ef1-dd66-0393-5317688b7c63@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdb73234-7ef1-dd66-0393-5317688b7c63@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Apr 10, 2020 at 08:51:21AM +0100, Kieran Bingham wrote:
> On 09/04/2020 17:29, Jacopo Mondi wrote:
> > Hi Kieran,
> >
> > On Thu, Apr 09, 2020 at 01:11:59PM +0100, Kieran Bingham wrote:
> >> Determine the (CSI2) pixel rate control by providing a control to read,
> >> and checking the rate from the upstream camera sensors, and their
> >> appropriate formats.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> ---
> >>  drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
> >>  1 file changed, 38 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >> index 17830c362a50..008a93910300 100644
> >> --- a/drivers/media/i2c/max9286.c
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -155,6 +155,7 @@ struct max9286_priv {
> >>  	bool mux_open;
> >>
> >>  	struct v4l2_ctrl_handler ctrls;
> >> +	struct v4l2_ctrl *pixelrate;
> >>
> >>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> >>
> >> @@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>  	return 0;
> >>  }
> >>
> >> +static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
> >> +{
> >> +	if (!priv->pixelrate)
> >> +		return -EINVAL;
> >
> > Can this happen ?
>
> Hrm ... no because the control is registered when we register the V4L2
> device, - so there can't be an occasion where we don't have it :-)
>
> Removing and simplifying.
>
> >
> >> +
> >> +	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
> >
> > Is this an error ?
>
>
> Oops - debug print failure :-)
>
> I can just drop this line.
>
>
> >> +
> >> +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
> >> +}
> >> +
> >>  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> >>  				  struct v4l2_subdev_pad_config *cfg,
> >>  				  struct v4l2_subdev_mbus_code_enum *code)
> >> @@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >>  {
> >>  	struct max9286_priv *priv = sd_to_max9286(sd);
> >>  	struct v4l2_mbus_framefmt *cfg_fmt;
> >> +	s64 pixelrate;
> >>
> >>  	if (format->pad >= MAX9286_SRC_PAD)
> >>  		return -EINVAL;
> >> @@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >>  	*cfg_fmt = format->format;
> >>  	mutex_unlock(&priv->mutex);
> >>
> >> +	/* Update pixel rate for the CSI2 receiver */
> >> +	pixelrate = cfg_fmt->width * cfg_fmt->height
> >> +		  * priv->nsources * 30 /*FPS*/;
> >> +
> >> +	max9286_set_pixelrate(priv, pixelrate);
> >> +
> >>  	return 0;
> >>  }
> >>
> >> @@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> >>  	.open = max9286_open,
> >>  };
> >>
> >> +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +	switch (ctrl->id) {
> >> +	case V4L2_CID_PIXEL_RATE:
> >> +		return 0;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >> +}
> >> +
> >> +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
> >> +	.s_ctrl	= max9286_s_ctrl,
> >> +};
> >> +
> >
> > After -years- I still don't get controls fully... Where is get? that's
> > the whole point of calculating the pixel rate to report it to the
> > receiver... I would not allow setting this from the extern but just
> > retrieve it after it has been updated by a set_format().
> >
> > Am I getting controls wrong again ?
>
> The control framework handles get. The value is stored in the
> priv->pixelrate control structure or managed by the core.

Ok, I keep being confused on which part are handled by the core for
controls...

>
> The CSI2 receiver calls the get operation on this subdev to know what
> the rate is for the CSI2 link, see:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/tree/drivers/media/platform/rcar-vin/rcar-csi2.c?h=gmsl/dev#n449
>

Yeah that part's clear!

Thanks for clarifying this

> >
> >>  static int max9286_v4l2_register(struct max9286_priv *priv)
> >>  {
> >>  	struct device *dev = &priv->client->dev;
> >> @@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> >>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>
> >>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> >> -	/*
> >> -	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
> >> -	 * hardcoded frequency in the BSP CSI-2 receiver driver.
> >> -	 */
> >> -	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> >> -			  50000000, 50000000, 1, 50000000);
> >> +
> >> +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> >> +					    &max9286_ctrl_ops,
> >> +					    V4L2_CID_PIXEL_RATE,
> >> +					    1, INT_MAX, 1, 50000000);
> >> +
> >>  	priv->sd.ctrl_handler = &priv->ctrls;
> >>  	ret = priv->ctrls.error;
> >>  	if (ret)
> >> --
> >> 2.20.1
> >>
>
