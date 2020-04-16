Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8611ABF38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 13:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633309AbgDPLbT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 07:31:19 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:35649 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505842AbgDPLbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 07:31:13 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5559E40009;
        Thu, 16 Apr 2020 11:31:08 +0000 (UTC)
Date:   Thu, 16 Apr 2020 13:34:12 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: Re: [v8-rc1 14/20] squash! max9286: Calculate pixel rate
Message-ID: <20200416113412.65dejeqovtfv7re6@uno.localdomain>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
 <20200416104052.2643098-15-jacopo+renesas@jmondi.org>
 <cd8509c1-2a4a-83fb-b2df-c142ff1e587d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd8509c1-2a4a-83fb-b2df-c142ff1e587d@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Apr 16, 2020 at 11:45:27AM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> There we go - looks like a viable solution to me.
>
> I wonder/suspect if this is the issue the BSP team were having some
> weeks ago too?

Could be. Let's revive the thread once we get this sent to linux-media

>
> Anyway, I'm certainly happy with this.
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
>
> On 16/04/2020 11:40, Jacopo Mondi wrote:
> > Calculate the CSI-2 transmitter pixel rate using the one reported from
> > sources.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 50 +++++++++++++++++++++++++++++--------
> >  1 file changed, 40 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 2d71205a1aad..3ef74ba10074 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -430,9 +430,46 @@ static int max9286_check_config_link(struct max9286_priv *priv,
> >   * V4L2 Subdev
> >   */
> >
> > -static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
> > +static int max9286_set_pixelrate(struct max9286_priv *priv)
> >  {
> > -	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
> > +	struct max9286_source *source = NULL;
> > +	u64 pixelrate = 0;
> > +
> > +	for_each_source(priv, source) {
> > +		struct v4l2_ctrl *ctrl;
> > +		u64 source_rate = 0;
> > +
> > +		/* Pixel rate is mandatory to be reported by sources. */
> > +		ctrl = v4l2_ctrl_find(source->sd->ctrl_handler,
> > +				      V4L2_CID_PIXEL_RATE);
> > +		if (!ctrl) {
> > +			pixelrate = 0;
> > +			break;
> > +		}
> > +
> > +		/* All source must report the same pixel rate. */
> > +		source_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
> > +		if (!pixelrate) {
> > +			pixelrate = source_rate;
> > +		} else if (pixelrate != source_rate) {
> > +			dev_err(&priv->client->dev,
> > +				"Unable to calculate pixel rate\n");
>
> Hrm ... I would report "Source pixel rates are different\n"
>  ... but I don't think that's a big deal.

That's fine, as you wish :)

>
>
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	if (!pixelrate) {
> > +		dev_err(&priv->client->dev,
> > +			"No pixel rate control available in sources\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The CSI-2 transmitter pixel rate is the single source rate multiplied
> > +	 * by the number of available sources.
> > +	 */
> > +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
> > +				      pixelrate * priv->nsources);
> >  }
> >
> >  static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> > @@ -496,7 +533,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >  	 */
> >  	max9286_configure_i2c(priv, false);
> >
> > -	return 0;
> > +	return max9286_set_pixelrate(priv);
>
> Aha - at first I thought this would call for every bind event, but we
> already filter so this tail end of the function only executes on the
> last bind :-)

Yes, we get there only when all remotes have been bound.
I wonder what happens though if something goes wrong and we end up returning
an error from _bound(). I assume the media graph won't complete and
that's desirable, so this should be enough


>
>
>
> >  }
> >
> >  static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
> > @@ -670,7 +707,6 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(sd);
> >  	struct v4l2_mbus_framefmt *cfg_fmt;
> > -	s64 pixelrate;
> >
> >  	if (format->pad >= MAX9286_SRC_PAD)
> >  		return -EINVAL;
> > @@ -695,12 +731,6 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  	*cfg_fmt = format->format;
> >  	mutex_unlock(&priv->mutex);
> >
> > -	/* Update pixel rate for the CSI2 receiver */
> > -	pixelrate = cfg_fmt->width * cfg_fmt->height
> > -		  * priv->nsources * 30 /*FPS*/;
> > -
> > -	max9286_set_pixelrate(priv, pixelrate);
> > -
> >  	return 0;
> >  }
> >
> >
>
