Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7674AEC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jul 2023 12:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjGGKg3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jul 2023 06:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGKg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jul 2023 06:36:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EFDE53
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jul 2023 03:36:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi [85.76.32.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C31F1558;
        Fri,  7 Jul 2023 12:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688726140;
        bh=XrAelEmKYU1LywRgRBFa+g4zvjeXC8hhsR0Jo5yRvQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lld2azexr204bn9dbMtJoDCaBnhME8UDSf+ZOGNzsE3aIXmjuEoC6c5GIo4EDoGDb
         94kip/UlIwRNVMBmeyClrA3+EUY7h48b3x4HHHsWUpJaI0S1Xysvmg0VHCjpfEV43h
         eH0GsK6aeZhOlN4iGveAoKramBXhTFEPpa6lucv0=
Date:   Fri, 7 Jul 2023 13:36:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH libdrm 1/3] util: Add NV24 and NV42 frame buffer formats
Message-ID: <20230707103621.GA15801@pendragon.ideasonboard.com>
References: <cover.1688570702.git.geert+renesas@glider.be>
 <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
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

On Wed, Jul 05, 2023 at 05:26:15PM +0200, Geert Uytterhoeven wrote:
> Add the missing entries for semi-planar YUV formats with
> non-subsampled chroma planes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  tests/util/format.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/util/format.c b/tests/util/format.c
> index 1ca1b82ce947b2f4..f825027227ddba24 100644
> --- a/tests/util/format.c
> +++ b/tests/util/format.c
> @@ -51,6 +51,8 @@ static const struct util_format_info format_info[] = {
>  	{ DRM_FORMAT_NV21, "NV21", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 2) },
>  	{ DRM_FORMAT_NV16, "NV16", MAKE_YUV_INFO(YUV_YCbCr, 2, 1, 2) },
>  	{ DRM_FORMAT_NV61, "NV61", MAKE_YUV_INFO(YUV_YCrCb, 2, 1, 2) },
> +	{ DRM_FORMAT_NV24, "NV24", MAKE_YUV_INFO(YUV_YCbCr, 1, 1, 2) },
> +	{ DRM_FORMAT_NV42, "NV42", MAKE_YUV_INFO(YUV_YCrCb, 1, 1, 2) },
>  	/* YUV planar */
>  	{ DRM_FORMAT_YUV420, "YU12", MAKE_YUV_INFO(YUV_YCbCr, 2, 2, 1) },
>  	{ DRM_FORMAT_YVU420, "YV12", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 1) },

-- 
Regards,

Laurent Pinchart
