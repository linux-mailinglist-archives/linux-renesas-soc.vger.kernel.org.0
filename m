Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5B5642459
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiLEISU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiLEISK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:18:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB427A1B3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:18:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EFA025B;
        Mon,  5 Dec 2022 09:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670228288;
        bh=4WDeu4NHY+PkIksNumuvL9ouo61DNn2xeb+bu1B8R2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bDkV1w7xzgE36d3Nuv9n+UD+1m6VJsFqhn0lwwvL7diQacmaomb7QzT28AXWjPt7T
         tf7NYj+6cOtP26rv+mwgQHEIAgbchnMkJKvGQ67m1/W7Q78Z3YExVqP2Das5hdRW92
         JD0dqRLN3lNwUryvtQEWetFVDp/V+iEZwIlagtSc=
Date:   Mon, 5 Dec 2022 10:18:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ v2 2/4] kms++: PixelFormats: Add Y21x formats
Message-ID: <Y42pPQ83uEI9gw+b@pendragon.ideasonboard.com>
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221205080339.12801-3-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205080339.12801-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Dec 05, 2022 at 10:03:37AM +0200, Tomi Valkeinen wrote:
> Add Y210, Y212, Y216 pixel formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  kms++/inc/kms++/pixelformats.h |  4 ++++
>  kms++/src/pixelformats.cpp     | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
> index 8ebb76b..e334ee6 100644
> --- a/kms++/inc/kms++/pixelformats.h
> +++ b/kms++/inc/kms++/pixelformats.h
> @@ -31,6 +31,10 @@ enum class PixelFormat : uint32_t {
>  	YVYU = MakeFourCC("YVYU"),
>  	VYUY = MakeFourCC("VYUY"),
>  
> +	Y210 = MakeFourCC("Y210"),
> +	Y212 = MakeFourCC("Y212"),
> +	Y216 = MakeFourCC("Y216"),
> +
>  	XRGB8888 = MakeFourCC("XR24"),
>  	XBGR8888 = MakeFourCC("XB24"),
>  	RGBX8888 = MakeFourCC("RX24"),
> diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
> index 1f10f3a..5f13ef4 100644
> --- a/kms++/src/pixelformats.cpp
> +++ b/kms++/src/pixelformats.cpp
> @@ -28,6 +28,22 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
>  				     1,
>  				     { { 16, 2, 1 } },
>  			     } },
> +	{ PixelFormat::Y210, {
> +				     PixelColorType::YUV,
> +				     1,
> +				     { { 32, 2, 1 } },
> +			     } },
> +	{ PixelFormat::Y212, {
> +				     PixelColorType::YUV,
> +				     1,
> +				     { { 32, 2, 1 } },
> +			     } },
> +	{ PixelFormat::Y216, {
> +				     PixelColorType::YUV,
> +				     1,
> +				     { { 32, 2, 1 } },
> +			     } },
> +
>  	/* YUV semi-planar */
>  	{ PixelFormat::NV12, {
>  				     PixelColorType::YUV,

-- 
Regards,

Laurent Pinchart
