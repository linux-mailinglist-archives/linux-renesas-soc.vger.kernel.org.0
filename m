Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC2A1A4F4B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2020 12:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgDKKQh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Apr 2020 06:16:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgDKKQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Apr 2020 06:16:37 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8088329;
        Sat, 11 Apr 2020 12:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586600196;
        bh=FyxrOg0ZBGFE0aRQs6C03IGsp1gYyyX9+BgzYUiODq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CO2rjS9kzrwVP7WutmtX0ZcazscQ73zAJDr6QHhpWPo16wBho7nY4bUxYowfPjl34
         8sqnNKKE8Ufn4HnQRQrZErj0YvAuwoSQFdBpMu9tdMeidbXZOkFWlch+Gt16rzWEEl
         4d6DPo62rvvIN0CULz6u1HngdHZ4dHVhJXVEN418=
Date:   Sat, 11 Apr 2020 13:16:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] rcar-vin: Add mbus_code filtering for format enumeration
Message-ID: <20200411101625.GA4871@pendragon.ideasonboard.com>
References: <20200410215412.1110161-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200410215412.1110161-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Fri, Apr 10, 2020 at 11:54:12PM +0200, Niklas Söderlund wrote:
> Add support to filter which pixel formats are supported by a mbus_code
> provided from user-space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> ---
> Hi Laurent,
> 
> I intend to squash this patch with the rcar-vin patch in the 
> V4L2_CAP_IO_MC series. As I hope we can merged that series soon so
> I wanted to get early feedback if possible on my take on ENUM_FMT.
> 
> // Niklas
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 96ddd36619167fd5..8c8866a8ee8dccfd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -343,6 +343,29 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  	unsigned int i;
>  	int matched;
>  
> +	/*
> +	 * If mbus_code is set only enumerate supported pixel formats for that
> +	 * bus code. Converting from YCbCr to RGB and RGB to YCbCr is possible
> +	 * with VIN, so all supported YCbCr and RBB media bus codes can produce

s/RBB/RGB/

> +	 * all of the related pixel formats. If mbus_code is not set enumerate
> +	 * all possible pixelformats.
> +	 *
> +	 * TODO: Once raw capture formats are added to the driver this needs
> +	 * to be extended so raw media bus codes only result in a raw pixel

s/a raw/raw/

> +	 * formats.
> +	 */
> +	switch (f->mbus_code) {
> +	case 0:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +	case MEDIA_BUS_FMT_UYVY10_2X10:
> +	case MEDIA_BUS_FMT_RGB888_1X24:

There are a few locations where you enumerate the supported media bus
formats (rvin_parallel_subdevice_attach(), rvin_mc_validate_format() and
rcar_csi2_formats[]), it could be nice to centralize this, at least for
the first two. Maybe a rvin_mbus_code_supported() function ? This isn't
mandatory and could be addressed later, and may actually get in the way
when we'll support additional media bus codes.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>  	matched = -1;
>  	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
>  		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))

-- 
Regards,

Laurent Pinchart
