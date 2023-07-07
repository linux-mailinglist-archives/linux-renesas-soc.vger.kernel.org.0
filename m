Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBED74AECC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jul 2023 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjGGKgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jul 2023 06:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGKgy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jul 2023 06:36:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43391725
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jul 2023 03:36:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi [85.76.32.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEBEF558;
        Fri,  7 Jul 2023 12:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688726167;
        bh=qbmSaQUymFJ9LS/n80xV3TXnTAQeqGluWo1pJjavueE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qjWxGwNH9zHsw3KNX95DnuiAjLU3zrph+McZOiQYxJzxQFphFty67LqrioFAX7cMX
         bT2PJkhdamUEkfscSBuv3CznZheFzwkLiTKAzSKVRx4ProH9uFLzNBEhXKrfZi+Dtx
         go2nY0Cw2wntWzR8h5cXSvrc5fiERlVdk0iCcBZA=
Date:   Fri, 7 Jul 2023 13:36:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH libdrm 2/3] util: Add pattern support for
 DRM_FORMAT_NV{24,42}
Message-ID: <20230707103649.GB15801@pendragon.ideasonboard.com>
References: <cover.1688570702.git.geert+renesas@glider.be>
 <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, Jul 05, 2023 at 05:26:16PM +0200, Geert Uytterhoeven wrote:
> Add support for drawing the SMPTE and tiles patterns in buffers using
> semi-planar YUV formats with non-subsampled chroma planes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/util/pattern.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 158c0b160a2ee870..f45a26ccec38f202 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -698,6 +698,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
>  		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
>  		return fill_smpte_yuv_planar(&info->yuv, planes[0], u, v,
> @@ -1023,6 +1025,8 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
>  		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
>  		return fill_tiles_yuv_planar(info, planes[0], u, v,

-- 
Regards,

Laurent Pinchart
