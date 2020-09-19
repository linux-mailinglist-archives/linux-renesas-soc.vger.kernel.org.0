Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14528270CDF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 12:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgISKRP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 06:17:15 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:27649 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISKRP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 06:17:15 -0400
X-Greylist: delayed 3654 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 06:17:13 EDT
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw8JAHC6BG
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 19 Sep 2020 12:17:12 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:17:12 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1218972192.1109884.1600510632282@webmail.strato.com>
In-Reply-To: <20200915230140.1201187-3-niklas.soderlund+renesas@ragnatech.se>
References: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
 <20200915230140.1201187-3-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/2] rcar-vin: Extend RAW8 support to all RGB layouts
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 09/16/2020 1:01 AM Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se> wrote:
> 
>  
> Extend the list of supported formats to include all RGB layouts of RAW8.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 28 ++++++++++++++++++++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 27 ++++++++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index a5dbb90c5210bae7..7f8997536aba6f0b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -598,8 +598,16 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	/* For RAW8 format bpp is 1, but the hardware process RAW8
>  	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
>  	 */
> -	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
> +	switch (vin->format.pixelformat) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		stride /= 2;
> +		break;
> +	default:
> +		break;
> +	}
>  
>  	rvin_write(vin, stride, VNIS_REG);
>  }
> @@ -683,6 +691,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  		input_is_yuv = true;
>  		break;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		vnmc |= VNMC_INF_RAW8;
>  		break;
> @@ -747,6 +758,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_ABGR32:
>  		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
>  		break;
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
>  	case V4L2_PIX_FMT_SRGGB8:
>  		dmr = 0;
>  		break;
> @@ -1124,6 +1138,18 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
>  		break;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_SBGGR8)
> +			return -EPIPE;
> +		break;
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_SGBRG8)
> +			return -EPIPE;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_SGRBG8)
> +			return -EPIPE;
> +		break;
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
>  			return -EPIPE;
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0e066bba747e0b73..4071d9bd554ab88f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -66,6 +66,18 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_ABGR32,
>  		.bpp			= 4,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_SBGGR8,
> +		.bpp			= 1,
> +	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_SGBRG8,
> +		.bpp			= 1,
> +	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_SGRBG8,
> +		.bpp			= 1,
> +	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_SRGGB8,
>  		.bpp			= 1,
> @@ -366,6 +378,21 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
>  		break;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		if (f->index)
> +			return -EINVAL;
> +		f->pixelformat = V4L2_PIX_FMT_SBGGR8;
> +		return 0;
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +		if (f->index)
> +			return -EINVAL;
> +		f->pixelformat = V4L2_PIX_FMT_SGBRG8;
> +		return 0;
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +		if (f->index)
> +			return -EINVAL;
> +		f->pixelformat = V4L2_PIX_FMT_SGRBG8;
> +		return 0;
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		if (f->index)
>  			return -EINVAL;
> -- 
> 2.28.0

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
