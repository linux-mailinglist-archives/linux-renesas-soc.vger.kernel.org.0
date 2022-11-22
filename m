Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB8C63313E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 01:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiKVASb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 19:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbiKVASO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 19:18:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9A417882
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 16:18:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 290CD88F;
        Tue, 22 Nov 2022 01:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669076284;
        bh=YuSo/Ps3qDTVswLN7zb1jfKqaQh26L/2bAiMA1FHZ/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C+8I7eHgYU/w+XI/CNRqtyNFp/Rj4nvWUred9CWJW73wk0kjZJhjQYERrrDZsQdQm
         PKKhX/JcJCIRdF1rQsQb+4nPzcgIH5+aNbhUzt/r0v1oBm7MfhFKgMskqmdySrCSw6
         Ia9jJV4ty5liHbnnFXsEXZQqLpb4z9g75/bQVnMA=
Date:   Tue, 22 Nov 2022 02:17:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between DRM and
 RZG2L_MIPI_DSI
Message-ID: <Y3wVLU01mHp2zozI@pendragon.ideasonboard.com>
References: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Nov 21, 2022 at 06:11:21PM +0000, Biju Das wrote:
> When CONFIG_DRM=m and CONFIG_DRM_RZG2L_MIPI_DSI=y, it results in a
> build failure. This patch fixes the build issue by adding dependency
> to DRM.
> 
> Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Ref:
>  * https://lore.kernel.org/linux-renesas-soc/OS0PR01MB592298E75153A52245D789D4860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#u
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 1065dca885ef..b2bddbeca878 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -56,7 +56,7 @@ config DRM_RCAR_MIPI_DSI
>  
>  config DRM_RZG2L_MIPI_DSI
>  	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM_BRIDGE && OF
> +	depends on DRM && DRM_BRIDGE && OF
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select DRM_MIPI_DSI
>  	help

-- 
Regards,

Laurent Pinchart
