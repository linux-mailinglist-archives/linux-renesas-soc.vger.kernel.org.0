Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EB673A48D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 17:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjFVPP4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 11:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjFVPPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 11:15:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F794C2;
        Thu, 22 Jun 2023 08:15:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1025C905;
        Thu, 22 Jun 2023 17:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687446916;
        bh=syM2lf6xc0TcjGpjcQcGu7POjghphMWF206glBGE4HU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pdFBVFslugx/27dksYElGUWjRn6H00aKtQdKs87vIYeqSRfRzHxWkU4IX5nnICUho
         4u6pvMREeC45QsobW/X5ZDrSQf0slqkbDxCLDKKlAZuF0NbwXS2tPxy0/p1WaM74Yy
         NCIeNLVZP5myvbSZPEU/goKxFBYCekAfl5PUUWR4=
Date:   Thu, 22 Jun 2023 18:15:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo
Message-ID: <20230622151550.GB950@pendragon.ideasonboard.com>
References: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:28:48AM +0200, Geert Uytterhoeven wrote:
> When configurating a CHn Source Image Format Register (LDBBSIFR), one
> should use the corresponding LDBBSIFR_RPKF_* definition for overlay
> planes, not the DDFR_PKF_* definition for the primary plane.
> 
> Fortunately both definitions resolve to the same value, so this bug did
> not cause any harm.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index 093f035d12463a80..0adb2ba965e7120d 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -824,7 +824,7 @@ static void sh_mobile_lcdc_overlay_setup(struct sh_mobile_lcdc_overlay *ovl)
>  		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
>  		break;
>  	case V4L2_PIX_FMT_BGR32:
> -		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
> +		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		break;
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:

-- 
Regards,

Laurent Pinchart
