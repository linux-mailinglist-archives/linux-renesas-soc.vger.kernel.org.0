Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE42D6727F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 20:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjARTQc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 14:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjARTQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 14:16:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB41053571
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 11:16:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DF21056;
        Wed, 18 Jan 2023 20:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674069387;
        bh=bKeQLKeTTFxJ85OHKNUDvpsQe5WNpGmEl0k/cSrjlMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hPhtbm5YT6RiMFONRnNp+a0pPDkervaulIdbN2ddy3lcfq4xparm5S0LP+I/PmB6f
         6HFgRFkYfud1rV85NEQOhkKk99YzvXxaNmHCQFq6pJb7HWvc3CtWENQW/lkL2hwWGX
         DOX82DkGlueZzBI7JwMb7Eul9TsPMHs9sdaA5D98=
Date:   Wed, 18 Jan 2023 21:16:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on
 that SoC
Message-ID: <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
References: <20230108060401.391061-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230108060401.391061-1-pbrobinson@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Peter,

Thank you for the patch.

On Sun, Jan 08, 2023 at 06:04:01AM +0000, Peter Robinson wrote:
> There's a few components in the rcar-du drm directory that
> don't make sense to be selectable if DRM_RCAR_DU isn't because
> they are part of the IP block so add a dependency and add
> compile check to ensure they're still tested.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
> 
> v2:
> - typo fix in commit message
> - s/ARCH_RENESAS/DRM_RCAR_DU
> 
>  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index b2bddbeca878..362fb6099e9f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST

How about dropping COMPILE_TEST ? DRM_RCAR_DU itself has

	depends on ARCH_RENESAS || COMPILE_TEST

so if COMPILE_TEST is set we'll be able to test these drivers when
DRM_RCAR_DU is enabled. Same below.

I can update this when taking the patch in my tree, there's no need to
send a v3.

>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_USE_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded LVDS encoders.
> @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_USE_MIPI_DSI
>  	bool "R-Car DU MIPI DSI Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
