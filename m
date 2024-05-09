Return-Path: <linux-renesas-soc+bounces-5245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C68C0BF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 09:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5939C1C2132E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 07:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4B813D270;
	Thu,  9 May 2024 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ui+boyiD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0F130AC3;
	Thu,  9 May 2024 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715239528; cv=none; b=jG0y2AEfu/+U02OQWV5PpHNsinHqs0eErVnULlVRh24PCanvGcLDG+fMzcIsghRczkfdRbxGSGgRDDWdzc8dm9PQdbHo9kHBz10bn8NcsLrgfcLJPptdFSr2KehHPXpM1JDLf+oFTPHNzkjpLZBFupMuidLjY4USORh6Bq1iO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715239528; c=relaxed/simple;
	bh=MCH0XWRFPfobQ8bj2MS+ZKMGS/uDOZNUbukLBN4hGas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHAFANP+y6EYcP9aY1XCIHoq7qY7FcFykeWnxIjAd19Gw3pxKOxyBPf9E0gHgEzB6VgKUJ9C1pHiDvaMJrgvXUqCxbV1PZWxc1q7HSWB1+L1AWVjtHU45yZ/oqH35qayoKswwNZYGqcpiCJ8p9Iawr3q3WzF/FXdWAMJJiiHc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ui+boyiD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3B9FFD6;
	Thu,  9 May 2024 09:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715239520;
	bh=MCH0XWRFPfobQ8bj2MS+ZKMGS/uDOZNUbukLBN4hGas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ui+boyiDr9ahuD9NrYGsrHNKk6t7DFFqkiq8MqsOKTs1fIFBAzN2crXK3valgHy6v
	 0V6Lnzqumu7/KTqQVGdDEgw+8VPpvRwq9wPLyee2L5XLAZ0HLOJTPvBKtGUgtt8wma
	 gNSqF2SFh810VzYfZajsLDuxVXIu70p3UCJoYp3w=
Date: Thu, 9 May 2024 09:25:19 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <7straemwatm7zetxy4gvqseyoig7ugrknpzeoqex24r5m5c7i7@eac5irt5kwqy>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-5-jacopo.mondi@ideasonboard.com>
 <20240508161853.GB2573154@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508161853.GB2573154@ragnatech.se>

Hi Niklas

On Wed, May 08, 2024 at 06:18:53PM GMT, Niklas Söderlund wrote:
> Hi Jacopo,
>
> I really like this patch, the active state is a nice idea. It works as
> expected on Gen3, but produces a NULL pointer dereference when booted on
> Gen4.

Thanks for testing on Gen4, I don't have an hw setup to test with

>
> [    0.547783] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010

I read in probe()

	num_pads = priv->info->use_isp ? 2 : NR_OF_RCAR_CSI2_PAD;
	ret = media_entity_pads_init(&priv->subdev.entity, num_pads,
				     priv->pads);

I presume in gen4 "use_isp = true" and in init_state

	for (unsigned int i = RCAR_CSI2_SINK; i < NR_OF_RCAR_CSI2_PAD; i++)
		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;

NR_OF_RCAR_CSI2_PAD should be replaced with the "num_pads" as well.

> [    0.548942] Mem abort info:
> [    0.549328]   ESR = 0x0000000096000044
> [    0.549813]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.550495]   SET = 0, FnV = 0
> [    0.550889]   EA = 0, S1PTW = 0
> [    0.551294]   FSC = 0x04: level 0 translation fault
> [    0.551919] Data abort info:
> [    0.552291]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> [    0.552993]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [    0.553660]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.554342] [0000000000000010] user address but active_mm is swapper
> [    0.555178] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> [    0.555976] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc2-arm64-renesas-00321-gfba919e351c6 #123
> [    0.557150] Hardware name: Renesas White Hawk Single board based on r8a779g2 (DT)
> [    0.558093] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.558971] pc : rcsi2_init_state+0x40/0x74
> [    0.559513] lr : rcsi2_init_state+0x40/0x74
> [    0.560043] sp : ffff80008258ba60
> [    0.560461] x29: ffff80008258ba60 x28: 0000000000000000 x27: ffff0006bf007538
> [    0.561365] x26: ffff000440cd54a0 x25: ffff000440cd5758 x24: ffff8000812dff08
> [    0.562265] x23: 0000043800000780 x22: 000000010000100a x21: 0000000000000008
> [    0.563166] x20: ffff000440924e00 x19: 0000000000000002 x18: ffffffffffffffff
> [    0.564066] x17: ffff00044244bc00 x16: 0000000000000100 x15: 0000000000000028
> [    0.564966] x14: 0000000000002104 x13: 0000000000000001 x12: 0000000000000001
> [    0.565866] x11: ffff800081af8390 x10: ffff800081a41808 x9 : ffff800082157000
> [    0.566766] x8 : 0000000000000004 x7 : ffff800081a41340 x6 : ffff80008210e110
> [    0.567667] x5 : ffff0004409d58f8 x4 : ffff800081ae3808 x3 : 0000000000000000
> [    0.568567] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
> [    0.569467] Call trace:
> [    0.569778]  rcsi2_init_state+0x40/0x74
> [    0.570264]  __v4l2_subdev_state_alloc+0x8c/0x110
> [    0.570862]  __v4l2_subdev_init_finalize+0x14/0x34
> [    0.571467]  rcsi2_probe+0x370/0x508
> [    0.571921]  platform_probe+0x64/0xbc
> [    0.572389]  really_probe+0xb8/0x294
> [    0.572843]  __driver_probe_device+0x74/0x124
> [    0.573394]  driver_probe_device+0x3c/0x15c
> [    0.573923]  __driver_attach+0xec/0x1c4
> [    0.574408]  bus_for_each_dev+0x74/0xcc
> [    0.574894]  driver_attach+0x20/0x28
> [    0.575347]  bus_add_driver+0xe0/0x1e0
> [    0.575821]  driver_register+0x58/0x114
> [    0.576307]  __platform_driver_register+0x24/0x2c
> [    0.576902]  rcar_csi2_pdrv_init+0x18/0x20
> [    0.577425]  do_one_initcall+0x80/0x2e8
> [    0.577912]  kernel_init_freeable+0x238/0x34c
> [    0.578462]  kernel_init+0x20/0x1c8
> [    0.578907]  ret_from_fork+0x10/0x20
> [    0.579366] Code: 2a1303e1 aa1403e0 52800002 97ff22d0 (a9017c1f)
> [    0.580136] ---[ end trace 0000000000000000 ]---
> [    0.580736] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.581705] SMP: stopping secondary CPUs
> [    0.582205] Kernel Offset: disabled
> [    0.582645] CPU features: 0x0,00000003,80100528,4200700b
> [    0.583316] Memory Limit: none
> [    0.583703] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> On 2024-05-06 18:49:32 +0200, Jacopo Mondi wrote:
> > Create the subdevice state with v4l2_subdev_init_finalize() and
> > implement the init_state() operation to guarantee the state is initialized.
> >
> > Store the current image format in the subdev active state and remove it
> > from the driver private structure.
> >
> > To guarantee the same image format is applied to all 4 source pads,
> > propagate the format from the sink pad to the sources, disallowing
> > changing format on a source pad.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 138 +++++++++++----------
> >  1 file changed, 75 insertions(+), 63 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 2d464e43a5be..7a9c4007386f 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -587,7 +587,8 @@ enum rcar_csi2_pads {
> >  struct rcar_csi2_info {
> >  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
> >  	int (*phy_post_init)(struct rcar_csi2 *priv);
> > -	int (*start_receiver)(struct rcar_csi2 *priv);
> > +	int (*start_receiver)(struct rcar_csi2 *priv,
> > +			      struct v4l2_subdev_state *state);
> >  	void (*enter_standby)(struct rcar_csi2 *priv);
> >  	const struct rcsi2_mbps_reg *hsfreqrange;
> >  	unsigned int csi0clkfreqrange;
> > @@ -613,8 +614,6 @@ struct rcar_csi2 {
> >
> >  	int channel_vc[4];
> >
> > -	struct mutex lock; /* Protects mf and stream_count. */
> > -	struct v4l2_mbus_framefmt mf;
> >  	int stream_count;
> >
> >  	bool cphy;
> > @@ -808,20 +807,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> > +				     struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> >  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> > +	const struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	unsigned int i;
> >  	int mbps, ret;
> >
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +
> >  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> > -		priv->mf.width, priv->mf.height,
> > -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> > +		fmt->width, fmt->height,
> > +		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
> >
> >  	/* Code is validated in set_fmt. */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -849,11 +853,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> >  			vcdt2 |= vcdt_part << ((i % 2) * 16);
> >  	}
> >
> > -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> > +	if (fmt->field == V4L2_FIELD_ALTERNATE) {
> >  		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> >  			| FLD_FLD_EN;
> >
> > -		if (priv->mf.height == 240)
> > +		if (fmt->height == 240)
> >  			fld |= FLD_FLD_NUM(0);
> >  		else
> >  			fld |= FLD_FLD_NUM(1);
> > @@ -1049,15 +1053,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > +				    struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> > +	const struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	int msps;
> >  	int ret;
> >
> > -	/* Calculate parameters */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -1114,7 +1121,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start(struct rcar_csi2 *priv)
> > +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> >  {
> >  	int ret;
> >
> > @@ -1122,7 +1129,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	ret = priv->info->start_receiver(priv);
> > +	ret = priv->info->start_receiver(priv, state);
> >  	if (ret) {
> >  		rcsi2_enter_standby(priv);
> >  		return ret;
> > @@ -1146,17 +1153,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
> >  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > +	struct v4l2_subdev_state *state;
> >  	int ret = 0;
> >
> > -	mutex_lock(&priv->lock);
> > +	if (!priv->remote)
> > +		return -ENODEV;
> >
> > -	if (!priv->remote) {
> > -		ret = -ENODEV;
> > -		goto out;
> > -	}
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> >
> >  	if (enable && priv->stream_count == 0) {
> > -		ret = rcsi2_start(priv);
> > +		ret = rcsi2_start(priv, state);
> >  		if (ret)
> >  			goto out;
> >  	} else if (!enable && priv->stream_count == 1) {
> > @@ -1165,49 +1171,26 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >  	priv->stream_count += enable ? 1 : -1;
> >  out:
> > -	mutex_unlock(&priv->lock);
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return ret;
> >  }
> >
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > +				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	struct v4l2_mbus_framefmt *framefmt;
> > -
> > -	mutex_lock(&priv->lock);
> > +	if (format->pad > RCAR_CSI2_SINK)
> > +		return v4l2_subdev_get_fmt(sd, state, format);
> >
> >  	if (!rcsi2_code_to_fmt(format->format.code))
> >  		format->format.code = rcar_csi2_formats[0].code;
> >
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		priv->mf = format->format;
> > -	} else {
> > -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> > -		*framefmt = format->format;
> > -	}
> > -
> > -	mutex_unlock(&priv->lock);
> > -
> > -	return 0;
> > -}
> > -
> > -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > -				struct v4l2_subdev_format *format)
> > -{
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -
> > -	mutex_lock(&priv->lock);
> > -
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		format->format = priv->mf;
> > -	else
> > -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> > +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> >
> > -	mutex_unlock(&priv->lock);
> > +	/* Propagate the format to the source pads. */
> > +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < NR_OF_RCAR_CSI2_PAD; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = format->format;
> >
> >  	return 0;
> >  }
> > @@ -1218,7 +1201,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> >
> >  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> >  	.set_fmt = rcsi2_set_pad_format,
> > -	.get_fmt = rcsi2_get_pad_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> >  };
> >
> >  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> > @@ -1226,6 +1209,30 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >  	.pad	= &rcar_csi2_pad_ops,
> >  };
> >
> > +static int rcsi2_init_state(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *state)
> > +{
> > +	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> > +		.width		= 1920,
> > +		.height		= 1080,
> > +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.field		= V4L2_FIELD_NONE,
> > +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> > +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> > +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> > +	};
> > +
> > +	for (unsigned int i = RCAR_CSI2_SINK; i < NR_OF_RCAR_CSI2_PAD; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> > +	.init_state = rcsi2_init_state,
> > +};
> > +
> >  static irqreturn_t rcsi2_irq(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > @@ -1251,14 +1258,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> > +	struct v4l2_subdev_state *state;
> >  	struct rcar_csi2 *priv = data;
> >
> > -	mutex_lock(&priv->lock);
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> > +
> >  	rcsi2_stop(priv);
> >  	usleep_range(1000, 2000);
> > -	if (rcsi2_start(priv))
> > +	if (rcsi2_start(priv, state))
> >  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> > -	mutex_unlock(&priv->lock);
> > +
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return IRQ_HANDLED;
> >  }
> > @@ -1870,23 +1880,23 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	priv->dev = &pdev->dev;
> >
> > -	mutex_init(&priv->lock);
> >  	priv->stream_count = 0;
> >
> >  	ret = rcsi2_probe_resources(priv, pdev);
> >  	if (ret) {
> >  		dev_err(priv->dev, "Failed to get resources\n");
> > -		goto error_mutex;
> > +		return ret;
> >  	}
> >
> >  	platform_set_drvdata(pdev, priv);
> >
> >  	ret = rcsi2_parse_dt(priv);
> >  	if (ret)
> > -		goto error_mutex;
> > +		return ret;
> >
> >  	priv->subdev.owner = THIS_MODULE;
> >  	priv->subdev.dev = &pdev->dev;
> > +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
> >  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
> >  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> >  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> > @@ -1912,21 +1922,25 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	pm_runtime_enable(&pdev->dev);
> >
> > +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> > +	if (ret)
> > +		goto error_pm_runtime;
> > +
> >  	ret = v4l2_async_register_subdev(&priv->subdev);
> >  	if (ret < 0)
> > -		goto error_pm_runtime;
> > +		goto error_subdev;
> >
> >  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
> >
> >  	return 0;
> >
> > +error_subdev:
> > +	v4l2_subdev_cleanup(&priv->subdev);
> >  error_pm_runtime:
> >  	pm_runtime_disable(&pdev->dev);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > -error_mutex:
> > -	mutex_destroy(&priv->lock);
> >
> >  	return ret;
> >  }
> > @@ -1941,8 +1955,6 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	mutex_destroy(&priv->lock);
> >  }
> >
> >  static struct platform_driver rcar_csi2_pdrv = {
> > --
> > 2.44.0
> >
>
> --
> Kind Regards,
> Niklas Söderlund
>

