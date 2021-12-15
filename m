Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6EF47563F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241630AbhLOKZ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhLOKZ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:25:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF191C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:25:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CDF0292;
        Wed, 15 Dec 2021 11:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639563927;
        bh=eSOvjdqAMMNapBW2a0BqxXK9VzoqIG8XnhpsscQbhAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjY204hilxOq2mpVtL1BoYOesgmRjz06vcw7UEl8ggQWsmFhyokmje6N++FB6rHLr
         khEeSlwO0xckUlZjeAHi8KBPwy1DdCx/0La41OrdvfR6rAfEurKEwJ/gtHQ9cQC6Xi
         DbrmBdVOLzzfJhauDb3Zei6BtiWgUji3S0ddSB+g=
Date:   Wed, 15 Dec 2021 12:25:25 +0200
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
Subject: Re: [PATCH 3/3] drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on
 ARCH_RENESAS
Message-ID: <YbnCldnKD7OK/jHi@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <c8599f5ba4f281a71240b3d6a8f27f450dfb5d17.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8599f5ba4f281a71240b3d6a8f27f450dfb5d17.1639559338.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, Dec 15, 2021 at 10:27:47AM +0100, Geert Uytterhoeven wrote:
> The Renesas R-Car Display Unit embedded MIPI DSI encoder is only present
> on Renesas R-Car V3U SoCs.  Hence add a dependency on ARCH_RENESAS, to
> prevent asking the user about this driver when configuring a kernel
> without Renesas SoC support.
> 
> Fixes: 155358310f013c23 ("drm: rcar-du: Add R-Car DSI driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index a7aa556e301d1087..2f4f6ac5fd4e66b1 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -48,6 +48,7 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_MIPI_DSI
>  	tristate "R-Car DU MIPI DSI Encoder Support"
>  	depends on DRM && DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST

Same as for 1/3, let's move this entry first. I can handle this when
applying the patches, I'll take 1/3 and 3/3 in my tree already.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	select DRM_MIPI_DSI
>  	help
>  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
