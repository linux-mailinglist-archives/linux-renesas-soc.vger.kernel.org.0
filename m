Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202A6660173
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jan 2023 14:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbjAFNmE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Jan 2023 08:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjAFNmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2023 08:42:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49953E64
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Jan 2023 05:42:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7F514AE;
        Fri,  6 Jan 2023 14:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673012520;
        bh=TFKO243S5cdWk8cJhAo/G01vhGF5iH7WAOLMKpQA2m4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s0i7lv9c+ILnVELrMmVq35QC/XH4DWDLeL2lQkvFAEh6GCxe88FlVlpiLO62xfYDN
         oRg1hVq22Tuu1oNJsr/Fp4ecuZZU3gZEg0PoVple8F1ocECm4xVF0B3ZPyJoyM9PbP
         T5XB8+8Un/U0XM8QYz/wv+kMKx3JG1fQDaRpsHXE=
Date:   Fri, 6 Jan 2023 15:41:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v6.1-rc5
Message-ID: <Y7glIwlrJknBOfCo@pendragon.ideasonboard.com>
References: <4f7757bd700edff487df387ca40ffb1524d688a4.1672744302.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f7757bd700edff487df387ca40ffb1524d688a4.1672744302.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jan 03, 2023 at 12:13:54PM +0100, Geert Uytterhoeven wrote:
> Refresh the defconfig for Renesas ARM systems:
>   - Disable CONFIG_DRM_RCAR_USE_MIPI_DSI (defaults to yes since commit
>     a830a15678593948 ("drm: rcar-du: Fix Kconfig dependency between
>     RCAR_DU and RCAR_MIPI_DSI"), but only used on R-Car V3U).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.3, unless someone plans to fix the
> default?

Patches are welcome :-)

> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 452aef74cc5c1256..751d939fcb761b31 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -136,6 +136,7 @@ CONFIG_VIDEO_ADV7604_CEC=y
>  CONFIG_VIDEO_ML86V7667=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RCAR_DU=y
> +# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_PANEL_EDP=y
>  CONFIG_DRM_DISPLAY_CONNECTOR=y

-- 
Regards,

Laurent Pinchart
