Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B276411CA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Dec 2022 01:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbiLCABf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 19:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiLCABe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 19:01:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9F8C869F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 16:01:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F13711B4;
        Sat,  3 Dec 2022 01:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670025692;
        bh=UizTvTqxKXw5ALcpzhBY1VoFAbJBTHMtM+lEZdJfVzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vuxrhomdO3WUq+xX5ce20jBCsMAd/GkhMXNhZ1b9ngAOIelCapQlvFxXew5Ons8yG
         tBUzqMXT07U4/YOgU2GYcu4k9QfQaL1UsUbSUNoRss+2zi/BIbqJ8HXgPL0OoSuchi
         v37npjxDnmpDMc3AR8Hb6c/fPmn3jkbjsQM7JaPU=
Date:   Sat, 3 Dec 2022 02:01:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ 4/4] kms++util: Add Y210 drawing support
Message-ID: <Y4qR2lAKELIOVcFQ@pendragon.ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202131658.434114-5-tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, Dec 02, 2022 at 03:16:58PM +0200, Tomi Valkeinen wrote:
> Add support for drawing Y210 pixels.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  kms++util/src/drawing.cpp | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
> index 79e0d90..7e1b40b 100644
> --- a/kms++util/src/drawing.cpp
> +++ b/kms++util/src/drawing.cpp
> @@ -3,6 +3,7 @@
>  
>  #include <kms++/kms++.h>
>  #include <kms++util/kms++util.h>
> +#include <kms++util/endian.h>
>  
>  using namespace std;
>  
> @@ -179,6 +180,32 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
>  	}
>  }
>  
> +static void draw_y2xx_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
> +					  YUV yuv1, YUV yuv2)
> +{
> +	const uint32_t macro_size = 4;
> +	uint16_t* p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * macro_size);
> +
> +	switch (buf.format()) {
> +	case PixelFormat::Y210: {
> +		// XXX naive shift left, similar to 10-bit funcs in class RGB

As mentioned in replies to the cover letter, values should be shifted by
6 bits.

> +		uint16_t y0 = yuv1.y << 2;
> +		uint16_t y1 = yuv2.y << 2;
> +		uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
> +		uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
> +
> +		write16le(y0, &p[0]);
> +		write16le(cb, &p[1]);
> +		write16le(y1, &p[2]);
> +		write16le(cr, &p[3]);

If x is odd, won't this swap cb and cr ? draw_yuv422_packed_macropixel()
seems to have the same possible issue, so I assume callers always pass
an even x value. If so,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And if not, draw_yuv422_packed_macropixel() will need to be fixed too,
so I'm fine with this patch and an additional fix to both functions on
top.

> +		break;
> +	}
> +
> +	default:
> +		throw std::invalid_argument("invalid pixelformat");
> +	}
> +}
> +
>  static void draw_yuv422_semiplanar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
>  					      YUV yuv1, YUV yuv2)
>  {
> @@ -257,6 +284,10 @@ void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1,
>  		draw_yuv422_packed_macropixel(buf, x, y, yuv1, yuv2);
>  		break;
>  
> +	case PixelFormat::Y210:
> +		draw_y2xx_packed_macropixel(buf, x, y, yuv1, yuv2);
> +		break;
> +
>  	case PixelFormat::NV16:
>  	case PixelFormat::NV61:
>  		draw_yuv422_semiplanar_macropixel(buf, x, y, yuv1, yuv2);

-- 
Regards,

Laurent Pinchart
