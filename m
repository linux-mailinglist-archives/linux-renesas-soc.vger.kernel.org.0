Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F6747831D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 03:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhLQCYP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 21:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhLQCYO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 21:24:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6822DC061574;
        Thu, 16 Dec 2021 18:24:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A614892A;
        Fri, 17 Dec 2021 03:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639707852;
        bh=g1NattYSTBOm9ai3I46TKneqQKn6vTfscoPw1dvgyTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eBUgqHwJVeQZ1q0nqIivTxYkJR2Altef0MPdGPpfTV/FDZz28EWA6kTqFg57QN0et
         /6t3Lp/Nccpdqqw0hF0hhAUnrLKl4KVdKkvJCmAauO4PL2+nfLOQuk7lZ7po3SduD8
         LgNiKiYHeZL3e3tvlxn0RCPepZ1n7FFSP2Dz6SyY=
Date:   Fri, 17 Dec 2021 04:24:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/6] media: max9286: Implement set_routing
Message-ID: <Ybv0yYau//LuiqYd@pendragon.ideasonboard.com>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
 <20211216174746.147233-3-jacopo+renesas@jmondi.org>
 <YbvuYIQJ6kDxDhHA@pendragon.ideasonboard.com>
 <Ybvziu4AAaaSSSIs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ybvziu4AAaaSSSIs@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 17, 2021 at 04:18:51AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Another comment.
> 
> On Fri, Dec 17, 2021 at 03:56:48AM +0200, Laurent Pinchart wrote:
> > On Thu, Dec 16, 2021 at 06:47:42PM +0100, Jacopo Mondi wrote:
> > > Add the set_routing() subdev operation to allow userspace to configure
> > > routing on the max9286 deserializer.
> > > 
> > > Implement route verification but do not take routing into consideration
> > > when configuring the CSI-2 output and pixel rate yet.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/max9286.c | 89 ++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 87 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 1b9ff537d08e..eb76acdb2cd9 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -832,6 +832,91 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >  
> > > +static int max9286_routing_validate(struct max9286_priv *priv,
> > > +				    struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_subdev_routing_validate_1_to_1(routing);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Make sure all routes points to the single source pad which can have
> > > +	 * up to 4 streams. All routes shall start from a sink pad and shall not
> > > +	 * have more than one sink stream. The GMSL link for the sink has to be
> > > +	 * enabled.
> > > +	 */
> > > +	for (i = 0; i < routing->num_routes; ++i) {
> > > +		const struct v4l2_subdev_route *route = &routing->routes[i];
> > > +		struct max9286_source *source = &priv->sources[i];
> 
> There's no need to initialize source here.
> 
> > > +
> > > +		if (route->source_pad != MAX9286_SRC_PAD ||
> > > +		    route->source_stream > 4) {
> > > +			dev_err(&priv->client->dev,
> > > +				"Invalid (%u,%u) source in route %u\n",
> > > +				route->source_pad, route->source_stream, i);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		if (route->sink_pad >= MAX9286_N_SINKS ||
> > > +		    route->sink_stream != 0) {
> > > +			dev_err(&priv->client->dev,
> > > +				"Invalid (%u,%u) sink in route %u\n",
> > > +				route->sink_pad, route->sink_stream, i);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		source = &priv->sources[route->sink_pad];
> > > +		if (!source->fwnode) {
> > > +			dev_err(&priv->client->dev,
> > > +				"Cannot set route for non-active source %u\n",
> > > +				route->sink_pad);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > 
> > Apart from from possibly using the new helper I've submitted, this looks
> > fine.
> 
> The helper should allow to drop the source_pad and sink_pad checks, but
> the source_stream and sink_stream checks are still needed. This may be
> possible to factorize in the helper too, let's see when we'll have more
> use cases.
> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int _max9286_set_routing(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *state,
> > > +				struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	struct max9286_priv *priv = sd_to_max9286(sd);
> > > +	int ret;
> > > +
> > > +	ret = max9286_routing_validate(priv, routing);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Re-initialize the format on a routing change. */
> > > +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> > > +					       &max9286_default_format);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int max9286_set_routing(struct v4l2_subdev *sd,
> > > +			       struct v4l2_subdev_state *state,
> > > +			       enum v4l2_subdev_format_whence which,
> > > +			       struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	struct max9286_priv *priv = sd_to_max9286(sd);
> > > +	unsigned int i;

priv and i are not used (they will be used in a patch later in the
series, so should be moved there).

> > > +	int ret;
> > > +
> > > +	v4l2_subdev_lock_state(state);
> > > +
> > 
> > I'd drop the blank line, or add one before the unlock call.
> > 
> > > +	ret = _max9286_set_routing(sd, state, routing);
> > > +	v4l2_subdev_unlock_state(state);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static int max9286_init_cfg(struct v4l2_subdev *sd,
> > >  			    struct v4l2_subdev_state *state)
> > >  {
> > > @@ -858,8 +943,7 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
> > >  	routing.routes = routes;
> > >  
> > >  	v4l2_subdev_lock_state(state);
> > > -	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> > > -					       &max9286_default_format);
> > > +	ret = _max9286_set_routing(sd, state, &routing);
> > >  	v4l2_subdev_unlock_state(state);

This is identical to max9286_set_routing(), you could call it directly,
and then merge _max9286_set_routing() and max9286_set_routing().

> > >  
> > >  	return ret;
> > > @@ -874,6 +958,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> > >  	.enum_mbus_code = max9286_enum_mbus_code,
> > >  	.get_fmt	= max9286_get_fmt,
> > >  	.set_fmt	= max9286_set_fmt,
> > > +	.set_routing	= max9286_set_routing,
> > >  };
> > >  
> > >  static const struct v4l2_subdev_ops max9286_subdev_ops = {

-- 
Regards,

Laurent Pinchart
