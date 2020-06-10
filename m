Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313851F5756
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 17:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgFJPKs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 11:10:48 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38371 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFJPKs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 11:10:48 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 72B8710001A;
        Wed, 10 Jun 2020 15:10:45 +0000 (UTC)
Date:   Wed, 10 Jun 2020 17:14:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v9.2 3/9] fixes! [max9286]: Use single sample per pixel
Message-ID: <20200610151408.3dj6qfzb4xdg5pbr@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-4-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610124623.51085-4-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 10, 2020 at 01:46:17PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> MBUS formats for a serial bus should be specified as a single sample
> point.
>
> This change requires updating user-space test scripts to configure as
> 1x16 accordingly:
>
> -    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_2X8/1280x800 field:none]"
> +    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_1X16/1280x800 field:none]"
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

FWIW I just sent a patch to update vin tests to use the new format.

Patch is fine, please squash in.

Thanks
  j

> ---
>  drivers/media/i2c/max9286.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7e59391a5736..807024a9a149 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -684,7 +684,7 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->pad || code->index > 0)
>  		return -EINVAL;
>
> -	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>
>  	return 0;
>  }
> @@ -720,13 +720,13 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>
>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
>  	switch (format->format.code) {
> -	case MEDIA_BUS_FMT_UYVY8_2X8:
> -	case MEDIA_BUS_FMT_VYUY8_2X8:
> -	case MEDIA_BUS_FMT_YUYV8_2X8:
> -	case MEDIA_BUS_FMT_YVYU8_2X8:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
>  		break;
>  	default:
> -		format->format.code = MEDIA_BUS_FMT_UYVY8_2X8;
> +		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
>  		break;
>  	}
>
> @@ -788,7 +788,7 @@ static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
>  {
>  	fmt->width		= 1280;
>  	fmt->height		= 800;
> -	fmt->code		= MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
>  	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
>  	fmt->field		= V4L2_FIELD_NONE;
>  	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> --
> 2.25.1
>
