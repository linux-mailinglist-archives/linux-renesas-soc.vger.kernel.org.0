Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3CB475631
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236546AbhLOKYe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbhLOKYe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:24:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336BCC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:24:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7060292;
        Wed, 15 Dec 2021 11:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639563873;
        bh=4g2mn2I5Vuf+M4ULqrRTf1ix167MP5AovRDWSM6vWdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hYc7IL/Ryo4b3RizgsZGK0HuKYBskoaqVfLBbSMp6Rrm9z2o9Pz6rArzdnG9pfXXS
         13Xfd3Hgcqx6WMcHUt+ZU9Gq1ENNgclQ794Sw1uSabXns3S2X/yDOaxOiKbP5p+k+M
         sfA1tKgOONxFJakcUyXdAo8XLvXj+87s1PA1A7GA=
Date:   Wed, 15 Dec 2021 12:24:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: rcar-du: DRM_RCAR_DW_HDMI should depend on
 ARCH_RENESAS
Message-ID: <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, Dec 15, 2021 at 10:27:45AM +0100, Geert Uytterhoeven wrote:
> The Renesas R-Car Gen3 and RZ/G2 internal HDMI encoder is only present
> on Renesas R-Car Gen3 and RZ/G2 SoCs.  Hence add a dependency on
> ARCH_RENESAS, to prevent asking the user about this driver when
> configuring a kernel without Renesas SoC support.
> 
> Fixes: 40d0fa7095d06c73 ("drm: rcar-du: Add Gen3 HDMI encoder support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index f6e6a6d5d987bf95..65d72be50f46f19e 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST

Let's move this entry first to keep alphabetical order.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.

-- 
Regards,

Laurent Pinchart
