Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7035028D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 13:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbiDOLYz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 07:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352663AbiDOLYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 07:24:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4673289CE8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Apr 2022 04:22:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-129-nat.elisa-mobile.fi [85.76.5.129])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68178482;
        Fri, 15 Apr 2022 13:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650021742;
        bh=Uw/I9NYsIHkJe6uU5cma0+hCru7dJSvzEM/mupnu7G8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FnINJodcP1zqa3/BH1t2nlCmibGdhDhg5rcpc7nRkbeccAoa5dn4mEv/21iEiV3/Y
         Srg98RYF8TZguDq+Bu8j3RSbdMTmw6i0IvIIGKlL4SLG+J/HlLwcf3liFDSnVXnvZb
         Y2fM8Tir6efVj+LwQDrYNy8Nc/zNPcINIpAfd3bI=
Date:   Fri, 15 Apr 2022 14:22:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/7] drm: rcar-du: Move rcar_du_output_name() to
 rcar_du_common.c
Message-ID: <YllVa2xL9s3c5xWt@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:57PM +0000, Biju Das wrote:
> RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
> needs a different CRTC implementation.
> 
> Move rcar_du_output_name() to a new common file rcar_du_common.c, So that
> the same function can be reused by RZ/G2L SoC later.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> RFC->v1:
>  New patch
> ---
>  drivers/gpu/drm/rcar-du/Makefile         |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_common.c | 30 ++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 20 ----------------
>  3 files changed, 31 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c
> 
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index e7275b5e7ec8..331e12d65a6b 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  rcar-du-drm-y := rcar_du_crtc.o \
> +		 rcar_du_common.o \
>  		 rcar_du_drv.o \
>  		 rcar_du_encoder.o \
>  		 rcar_du_group.o \
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_common.c b/drivers/gpu/drm/rcar-du/rcar_du_common.c
> new file mode 100644
> index 000000000000..f9f9908cda6d
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_common.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rcar_du_common.c  --  R-Car Display Unit Common
> + *
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
> + *
> + * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> + */
> +
> +#include "rcar_du_drv.h"
> +
> +const char *rcar_du_output_name(enum rcar_du_output output)
> +{
> +	static const char * const names[] = {
> +		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
> +		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> +		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
> +		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
> +		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
> +		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> +		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> +		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> +		[RCAR_DU_OUTPUT_TCON] = "TCON",
> +	};
> +
> +	if (output >= ARRAY_SIZE(names) || !names[output])
> +		return "UNKNOWN";
> +
> +	return names[output];
> +}

As we have nothing else than this function in this file, how about
moving it to rcar_du_drv.c instead, to avoid adding a new file ?

You also need to add a declaration for rcar_du_output_name() in the
appropriate header.

> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 4640c356a532..f6e234dafb72 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -591,26 +591,6 @@ static const struct of_device_id rcar_du_of_table[] = {
>  
>  MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  
> -const char *rcar_du_output_name(enum rcar_du_output output)
> -{
> -	static const char * const names[] = {
> -		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
> -		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> -		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
> -		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
> -		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
> -		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> -		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> -		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> -		[RCAR_DU_OUTPUT_TCON] = "TCON",
> -	};
> -
> -	if (output >= ARRAY_SIZE(names) || !names[output])
> -		return "UNKNOWN";
> -
> -	return names[output];
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * DRM operations
>   */

-- 
Regards,

Laurent Pinchart
