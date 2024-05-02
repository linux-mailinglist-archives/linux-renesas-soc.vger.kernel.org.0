Return-Path: <linux-renesas-soc+bounces-5062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9628BA0AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 20:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6235B20F7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 18:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573F0174ED3;
	Thu,  2 May 2024 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lq1JzQqR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92845172BC1;
	Thu,  2 May 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714675294; cv=none; b=bAmWJ/fomib8vx24Hht0wHMnCTncztj+CM2WmE/XNiFEp6Xghr/+LULvq84nRc+ahU7AshpSLmhXBDMJ+TPjVR878rjnEfWewFqUqbDmp09k3KySnzjG7ohQIYrmyc3SjhAmpvj0OzKEDljdBJWY3qSAxRqss8KXsPC7V+zcOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714675294; c=relaxed/simple;
	bh=ROSRsvERE3/131+nHKcffiamrweACozoifEOHp9KoDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfFdrdiQgQP7LfhPsoVh+e1QEqr1u4kXJ1Yf+dXfi+0w5yf3AV2mnlBXxasntfUBncJx1nr07WAYNTTSXD+Av/4SC2l/voRy7QSEc6b1R7XEg6hpfS14+q+m6ZTbYYUoplZzc0LPv+9V1CSo3qz2UlfkT2oPu5OyIhCdHuwkDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lq1JzQqR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3062163B;
	Thu,  2 May 2024 20:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714675233;
	bh=ROSRsvERE3/131+nHKcffiamrweACozoifEOHp9KoDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lq1JzQqRhHvAHtilz+jBZ/zoQpGa6wtovTWQSmjNdGBkXBlczi1yNqj55J9admbPM
	 M9OYWzvDlnvI/3LUvKOpCTIFhFtpEZpf/b3mUjTsE72xtDeBsTYHs7wORunsgMOWnX
	 N2IQzxwingQnZkDxnyYCGYTEwQW12dM8/gnI6sGw=
Date: Thu, 2 May 2024 21:41:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 15/19] media: rcar-csi2: Add support for multiplexed
 streams
Message-ID: <20240502184124.GV15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-16-jacopo.mondi@ideasonboard.com>
 <20240502142316.GA3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502142316.GA3927860@ragnatech.se>

On Thu, May 02, 2024 at 04:23:16PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
> 
> Thanks for your work.
> 
> On 2024-04-30 12:39:51 +0200, Jacopo Mondi wrote:
> > Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
> > in order to prepare to support multiplexed transmitters.
> > 
> > Create the subdevice state with v4l2_subdev_init_finalize() and
> > implement the init_state() operation to guarantee the state is initialized.
> > 
> > The routing table within the R-Car CSI-2 receiver is fixed, streams
> > received on source_stream X will be directed to pad (X + 1) by default.
> > Initialize a static routing table with such routes set as active.
> > 
> > While at it, disable runtime_pm() in the probe() function error path.

s/runtime_pm()/runtime PM/

> Can we break this out in a separate patch? As the multiplexed stream 
> work will not be ready for v6.10 if I understood the tendencies 
> correctly (?), we can at least fix this issue before that.

Agreed, the fix should be a separate patch, with a Fixes: tag.

> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 74 +++++++++++++++++++++-
> >  1 file changed, 72 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 582d5e35db0e..82dc0b92b8d3 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -1226,6 +1226,65 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >  	.pad	= &rcar_csi2_pad_ops,
> >  };
> >  
> > +static int rcsi2_init_state(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *state)
> > +{
> > +	/*
> > +	 * Routing is fixed for this device: streams sent on sink_stream X
> > +	 * are directed to pad (X + 1). Which streams goes to the next
> > +	 * processing block (VIN) is controlled by link enablement between the
> > +	 * CSI-2 and the VIN itself and not by the CSI-2 routing table.
> > +	 *
> > +	 * The routing table is then fixed, as stream X will be directed to
> > +	 * csi:(X + 1)/0 and will be transmitted to VINs the on media link
> > +	 * csi2:(x + 1)->vin:0.
> > +	 *
> > +	 * For example, to route stream #3 to VIN #1 : "csi2:4/0 -> vin1:0" and
> > +	 * to route stream #2 to VIN #4 : "csi2:3/0 -> vin4:0".
> > +	 */
> > +	struct v4l2_subdev_route routes[] = {
> > +		{
> > +			.sink_pad = RCAR_CSI2_SINK,
> > +			.sink_stream = 0,
> > +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +		{
> > +			.sink_pad = RCAR_CSI2_SINK,
> > +			.sink_stream = 1,
> > +			.source_pad = RCAR_CSI2_SOURCE_VC1,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +		{
> > +			.sink_pad = RCAR_CSI2_SINK,
> > +			.sink_stream = 2,
> > +			.source_pad = RCAR_CSI2_SOURCE_VC2,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +		{
> > +			.sink_pad = RCAR_CSI2_SINK,
> > +			.sink_stream = 3,
> > +			.source_pad = RCAR_CSI2_SOURCE_VC3,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +	};
> > +
> > +	struct v4l2_subdev_krouting routing = {
> > +		.num_routes = ARRAY_SIZE(routes),
> > +		.routes = routes,
> > +	};
> 
> Should not the two structs above be static const as you return a pointer 
> to them?

v4l2_subdev_set_routing() takes a non-const v4l2_subdev_krouting
argument. Unless I'm missing something, this function doesn't return a
pointer to the local structures.

> > +
> > +	return v4l2_subdev_set_routing(sd, state, &routing);
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> > +	.init_state = rcsi2_init_state,
> > +};
> > +
> >  static irqreturn_t rcsi2_irq(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > @@ -1887,11 +1946,13 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  
> >  	priv->subdev.owner = THIS_MODULE;
> >  	priv->subdev.dev = &pdev->dev;
> > +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
> >  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
> >  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> >  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> >  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> > -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +			     V4L2_SUBDEV_FL_STREAMS;
> >  
> >  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> > @@ -1912,14 +1973,22 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  
> >  	pm_runtime_enable(&pdev->dev);
> >  
> > +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> > +	if (ret)
> > +		goto error_pm_runtime;
> > +
> >  	ret = v4l2_async_register_subdev(&priv->subdev);
> >  	if (ret < 0)
> > -		goto error_async;
> > +		goto error_subdev;
> >  
> >  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
> >  
> >  	return 0;
> >  
> > +error_subdev:
> > +	v4l2_subdev_cleanup(&priv->subdev);
> > +error_pm_runtime:
> > +	pm_runtime_disable(&pdev->dev);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > @@ -1936,6 +2005,7 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> >  	v4l2_async_unregister_subdev(&priv->subdev);
> > +	v4l2_subdev_cleanup(&priv->subdev);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> >  

-- 
Regards,

Laurent Pinchart

