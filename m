Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F24488D5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 00:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiAIXdB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Jan 2022 18:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiAIXdA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Jan 2022 18:33:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689D8C06173F;
        Sun,  9 Jan 2022 15:33:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B97D5E2C;
        Mon, 10 Jan 2022 00:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641771178;
        bh=dMeO//Lq7TNKNhpZL+3f2ryyi9CA2R/f1XgLEHGgrlo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e/JkKQYbOZXAwIsAYKw9fU/S3YgPnamdQMgQDEdPxhgo6lsawyCemmpfAIsuuZ++6
         T0Sq+4KFwEbk4lH/q5+T08RZmY0eMm2RFGRBrcjrZJiHTc20JPPWB6kofRU4xnXaFf
         ukhwshz1wWQDB+EQ6AlxCAI7ivXleKn6xg99d5jQ=
Date:   Mon, 10 Jan 2022 01:32:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 10/11] media: i2c: max9286: Configure bus width from
 device tree
Message-ID: <YdtwobwT+7Zmk0Ct@pendragon.ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-11-laurent.pinchart+renesas@ideasonboard.com>
 <20220109105634.scups6r7wist3752@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220109105634.scups6r7wist3752@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sun, Jan 09, 2022 at 11:56:34AM +0100, Jacopo Mondi wrote:
> On Sat, Jan 01, 2022 at 08:28:05PM +0200, Laurent Pinchart wrote:
> > The GMSL serial data bus width is normally selected through the BWS pin.
> > On some systems, the pin may not be wired to the correct value. Support
> > overriding the bus width by software, using the value specified in the
> > device tree.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/i2c/max9286.c | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index d88a4d8e63ab..07ebb01640a1 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -90,6 +90,11 @@
> >  /* Register 0x1b */
> >  #define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
> >  #define MAX9286_ENEQ(n)			(1 << (n))
> > +/* Register 0x1c */
> > +#define MAX9286_HIGHIMM(n)		BIT((n) + 4)
> > +#define MAX9286_I2CSEL			BIT(2)
> > +#define MAX9286_HIBW			BIT(1)
> > +#define MAX9286_BWS			BIT(0)
> >  /* Register 0x27 */
> >  #define MAX9286_LOCKED			BIT(7)
> >  /* Register 0x31 */
> > @@ -182,6 +187,7 @@ struct max9286_priv {
> >  	u32 init_rev_chan_mv;
> >  	u32 rev_chan_mv;
> >  	u8 i2c_mstbt;
> > +	u32 bus_width;
> >
> >  	struct v4l2_ctrl_handler ctrls;
> >  	struct v4l2_ctrl *pixelrate_ctrl;
> > @@ -1159,6 +1165,23 @@ static int max9286_setup(struct max9286_priv *priv)
> >  	max9286_set_video_format(priv, &max9286_default_format);
> >  	max9286_set_fsync_period(priv);
> >
> > +	if (priv->bus_width) {
> > +		int val;
> > +
> > +		val = max9286_read(priv, 0x1c);
> > +		if (val < 0)
> > +			return val;
> > +
> > +		val &= ~(MAX9286_HIBW | MAX9286_BWS);
> > +
> > +		if (priv->bus_width == 27)
> > +			val |= MAX9286_HIBW;
> > +		else if (priv->bus_width == 32)
> > +			val |= MAX9286_BWS;
> > +
> > +		max9286_write(priv, 0x1c, val);
> > +	}
> > +
> >  	/*
> >  	 * The overlap window seems to provide additional validation by tracking
> >  	 * the delay between vsync and frame sync, generating an error if the
> > @@ -1429,6 +1452,19 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >  	}
> >  	of_node_put(node);
> >
> > +	of_property_read_u32(dev->of_node, "maxim,bus-width", &priv->bus_width);
> > +	switch (priv->bus_width) {
> > +	case 0:
> 
> Can you add a comment that in this case we rely on HW configuration ?
> Looking at this with the above function in the same patch makes it
> clear, but it might get lost when merged.

I'll add

		/*
		 * The property isn't specified in the device tree, the driver
		 * will keep the default value selected by the BWS pin.
		 */

> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > +	case 24:
> > +	case 27:
> > +	case 32:
> > +		break;
> > +	default:
> > +		dev_err(dev, "Invalid %s value %u\n", "maxim,bus-width",
> > +			priv->bus_width);
> > +		return -EINVAL;
> > +	}
> > +
> >  	of_property_read_u32(dev->of_node, "maxim,i2c-clock-frequency",
> >  			     &i2c_clk_freq);
> >  	for (i = 0; i < ARRAY_SIZE(max9286_i2c_speeds); ++i) {

-- 
Regards,

Laurent Pinchart
