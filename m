Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB89C1F572B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 16:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgFJO71 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 10:59:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35153 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgFJO70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 10:59:26 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 022CCFF80B;
        Wed, 10 Jun 2020 14:59:23 +0000 (UTC)
Date:   Wed, 10 Jun 2020 17:02:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v9.2 2/9] fixes! [max9286]: Validate link formats
Message-ID: <20200610150246.ovw6n2amobg5ynmm@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-3-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610124623.51085-3-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,
  a few small nits.

The patch is fine, feel free to squash it in v10.

On Wed, Jun 10, 2020 at 01:46:16PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Disallow setting a format on the source link, but enable link validation
> by returning the format of the first bound source when getting the
> format of the source pad.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index ef824d2b26b8..7e59391a5736 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -711,7 +711,11 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
>
> -	if (format->pad >= MAX9286_SRC_PAD)
> +	/* TODO:
> +	 * Multiplexed Stream Support: Prevent setting the format on the shared
> +	 * multiplexed bus.
> +	 */

I am not sure I would mention multiplexed stream support, and this is
not a TODO item. Simply, max9286 does not allow any format conversion
on its source pad, so the format is propagated from one of its sink to
the source (assuming all sinks have the same format applied).

Quite a common thing, isn't it ?

> +	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;
>
>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> @@ -743,11 +747,18 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
> +	unsigned int pad = format->pad;
>
> -	if (format->pad >= MAX9286_SRC_PAD)

I was about to comment we'ra nowe allowing pads > MAX9286_SRC_PAD, but the
core actually checks that for us.

> -		return -EINVAL;
> +	/* TODO:
> +	 * Multiplexed Stream Support: Support link validation by returning the
> +	 * format of the first bound link. All links must have the same format,
> +	 * as we do not support mixing, and matching of cameras connected to

nit: is the comma in 'mixing,' intentional ?
Same comment about multiplexed stream support in comment.

Theoretically, a set_fmt on a sink should propagate the format to the
source pad, and you could access it through
priv->fmts[MAX9286_SRC_PAD] and drop this check.

The result is actually the same, so it's up to you.

Thanks
  j

> +	 * the max9286.
> +	 */
> +	if (pad == MAX9286_SRC_PAD)
> +		pad = __ffs(priv->bound_sources);
>
> -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
>  	if (!cfg_fmt)
>  		return -EINVAL;
>
> --
> 2.25.1
>
