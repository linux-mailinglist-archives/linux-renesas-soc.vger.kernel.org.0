Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35026411A9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Dec 2022 00:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiLBXuo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 18:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiLBXun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 18:50:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89279FA47E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 15:50:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3191325B;
        Sat,  3 Dec 2022 00:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670025040;
        bh=+76xynmh2IDvJjR99V4KXpYlV15H5qNSTl1I1XxY4Nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgmUp0XbZJB+JmFW/REkA1+TI7rgke67GxjKDS5jYW1HWvEwX1O9mZvO5FCLGf8/G
         DRjd2GcyHfcImrSKeWl3q6+U/wWw7pCOiuUGme4E70fUCkputkMZkroRdDGOzXczet
         hcusHQm14TaRVWrluFaeIqufe2O7eFr9sUgG7c80=
Date:   Sat, 3 Dec 2022 01:50:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ 1/4] kms++: PixelFormats: Fix formatting
Message-ID: <Y4qPTp71JISN4VUS@pendragon.ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-2-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202131658.434114-2-tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, Dec 02, 2022 at 03:16:55PM +0200, Tomi Valkeinen wrote:
> Fix formatting for some pixel formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  kms++/src/pixelformats.cpp | 60 +++++++-------------------------------
>  1 file changed, 10 insertions(+), 50 deletions(-)
> 
> diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
> index d739efd..7afbf09 100644
> --- a/kms++/src/pixelformats.cpp
> +++ b/kms++/src/pixelformats.cpp
> @@ -32,107 +32,67 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
>  	{ PixelFormat::NV12, {
>  				     PixelColorType::YUV,
>  				     2,
> -				     { {
> -					       8,
> -					       1,
> -					       1,
> -				       },
> +				     { { 8, 1, 1 },
>  				       { 8, 2, 2 } },
>  			     } },

While at it I would probably have reformated everything as

	{ PixelFormat::NV12, {
		PixelColorType::YUV,
		2,
		{
			{ 8, 1, 1 },
			{ 8, 2, 2 }
		},
	} },

or

	{ PixelFormat::NV12, {
		PixelColorType::YUV,
		2,
		{ { 8, 1, 1 }, { 8, 2, 2 } },
	} },

to make the table more compact (and I believe more readable), but that's
entirely up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	{ PixelFormat::NV21, {
>  				     PixelColorType::YUV,
>  				     2,
> -				     { {
> -					       8,
> -					       1,
> -					       1,
> -				       },
> +				     { { 8, 1, 1 },
>  				       { 8, 2, 2 } },
>  			     } },
>  	{ PixelFormat::NV16, {
>  				     PixelColorType::YUV,
>  				     2,
> -				     { {
> -					       8,
> -					       1,
> -					       1,
> -				       },
> +				     { { 8, 1, 1 },
>  				       { 8, 2, 1 } },
>  			     } },
>  	{ PixelFormat::NV61, {
>  				     PixelColorType::YUV,
>  				     2,
> -				     { {
> -					       8,
> -					       1,
> -					       1,
> -				       },
> +				     { { 8, 1, 1 },
>  				       { 8, 2, 1 } },
>  			     } },
>  	/* YUV planar */
>  	{ PixelFormat::YUV420, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 2, 2 },
>  					 { 8, 2, 2 } },
>  			       } },
>  	{ PixelFormat::YVU420, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 2, 2 },
>  					 { 8, 2, 2 } },
>  			       } },
>  	{ PixelFormat::YUV422, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 2, 1 },
>  					 { 8, 2, 1 } },
>  			       } },
>  	{ PixelFormat::YVU422, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 2, 1 },
>  					 { 8, 2, 1 } },
>  			       } },
>  	{ PixelFormat::YUV444, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 1, 1 },
>  					 { 8, 1, 1 } },
>  			       } },
>  	{ PixelFormat::YVU444, {
>  				       PixelColorType::YUV,
>  				       3,
> -				       { {
> -						 8,
> -						 1,
> -						 1,
> -					 },
> +				       { { 8, 1, 1 },
>  					 { 8, 1, 1 },
>  					 { 8, 1, 1 } },
>  			       } },

-- 
Regards,

Laurent Pinchart
