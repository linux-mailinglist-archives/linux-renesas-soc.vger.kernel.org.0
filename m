Return-Path: <linux-renesas-soc+bounces-5317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4418C2895
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 18:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6741288A14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3BB172793;
	Fri, 10 May 2024 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OEz5YnCK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101714A4FB;
	Fri, 10 May 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715357797; cv=none; b=bMaryMVChWxQt+Kit3H4WifGYRleFxGMMUbfP54/p11JtJH6bQZuTKs+5P21o+GxJUvgssaKql4PUpXZMV07VeJmr3TGgfFOxkzU3rJCSIAFlRSW/w2A1tdpP1gvYNAImDUatqlg9S2HkCjuq8ec4g6goXc1X/hFcc8eYbovSlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715357797; c=relaxed/simple;
	bh=ng23M4txMAr5jjfNXLtcHDNSs63AIbIxgxzdKZPyfVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mso3SqDFfg5yE1baPRDRnAudmp/K/W0RVjn9ubpZSo8TYp8qpfwEsKRme2pZnHPOIPjlVAPIr5zNHOfF7uFdh96XTe0hyYUOBC3gc01hU7aqbgIYDCQLV5QKnFUsvwOrR0BIYmXNLly2b4ns3DCRjUZIZ8FQ196Pk/n+FzS02f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OEz5YnCK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A552B0B;
	Fri, 10 May 2024 18:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715357789;
	bh=ng23M4txMAr5jjfNXLtcHDNSs63AIbIxgxzdKZPyfVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEz5YnCKXL8HwRLtrPMYtTOuoXs5KbIBG05v88kSvor77/6wD3Rm3CM9+Fg6JV3fn
	 VaUrGY9BLL3iokNYWgZMxpKTaeKP8K3n6YY4PfNqx1cBsX7OjtaXXOJdlfp8L1TpA7
	 fG2Yxr3LTt38P0fjr+Ps2+bFK9HOm5J7Ax5D7hq0=
Date: Fri, 10 May 2024 19:16:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: max96712: Store format in subdev
 active state
Message-ID: <20240510161625.GC17158@pendragon.ideasonboard.com>
References: <20240510155606.317507-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510155606.317507-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, May 10, 2024 at 05:56:06PM +0200, Niklas Söderlund wrote:
> Create and store the subdevice format in the subdevices active state.
> This change do not have a huge effect on the driver as it do not yet
> support changing the format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Hello,
> 
> This change is mostly to align all driver used in the R-Car VIN pipeline
> to use the same set of API and to make it easier to extend them in
> tandem going forward.
> 
> This should be seen as a compliment to Jacopo's larger work in "[PATCH
> v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
> updates other drivers in the VIN pipeline to use the active state.
> 
> * Changes since v1
> - Use the control handler lock as the active state lock.
> ---
>  drivers/staging/media/max96712/max96712.c | 37 +++++++++++++++++------
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..3b302547aa4b 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
>  	.s_stream = max96712_s_stream,
>  };
>  
> -static int max96712_get_pad_format(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *sd_state,
> -				   struct v4l2_subdev_format *format)
> +static int max96712_init_state(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state)
>  {
> -	format->format.width = 1920;
> -	format->format.height = 1080;
> -	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> -	format->format.field = V4L2_FIELD_NONE;
> +	static const struct v4l2_mbus_framefmt default_fmt = {
> +		.width          = 1920,
> +		.height         = 1080,
> +		.code           = MEDIA_BUS_FMT_RGB888_1X24,
> +		.colorspace     = V4L2_COLORSPACE_SRGB,
> +		.field          = V4L2_FIELD_NONE,
> +		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization   = V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
> +	};
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	*fmt = default_fmt;
>  
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
> +	.init_state = max96712_init_state,
> +};
> +
>  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> -	.get_fmt = max96712_get_pad_format,
> -	.set_fmt = max96712_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops max96712_subdev_ops = {
> @@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>  	long pixel_rate;
>  	int ret;
>  
> +	priv->sd.internal_ops = &max96712_internal_ops;
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> @@ -324,6 +338,11 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>  
>  	v4l2_set_subdevdata(&priv->sd, priv);
>  
> +	priv->sd.state_lock = priv->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> +	if (ret)
> +		goto error;
> +
>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
>  		dev_err(&priv->client->dev, "Unable to register subdevice\n");

-- 
Regards,

Laurent Pinchart

