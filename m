Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD21E4153CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238417AbhIVXRw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232883AbhIVXRw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:17:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812B2C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Sep 2021 16:16:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1636CE52;
        Thu, 23 Sep 2021 01:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632352580;
        bh=njl27l0XJYpzFgkSv7Y03dBDS1qGBBIxxBHe8LR/EcQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zbtr3WL61e66pfmzT/X5IerZaatyQzXp1WwFltBdhjCwmGyzvKoP2iYQfvh/Ug+3H
         gKnD1VWDoenOxAwtR1WH9qVQ7YYQ9mYxJa1cQEjoFlH02RKugcv+ApcQq8cqKnbui0
         zKN7LGIErdfP8L0ItEl67e6mjXHi7OEy6OaQtOl0=
Date:   Thu, 23 Sep 2021 02:16:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YUu5Qv0isQU+Dv2+@pendragon.ideasonboard.com>
References: <20210831075442.698-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831075442.698-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Tue, Aug 31, 2021 at 03:54:42PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 4 +---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c   | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 4ac26d08ebb4..ebec4b7269d1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -570,7 +570,6 @@ static void rcar_du_shutdown(struct platform_device *pdev)
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu;
> -	struct resource *mem;
>  	int ret;
>  
>  	/* Allocate and initialize the R-Car device structure. */
> @@ -585,8 +584,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, rcdu);
>  
>  	/* I/O resources */
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	rcdu->mmio = devm_ioremap_resource(&pdev->dev, mem);
> +	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rcdu->mmio))
>  		return PTR_ERR(rcdu->mmio);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index d061b8de748f..a64d910b0500 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -802,7 +802,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *attr;
>  	struct rcar_lvds *lvds;
> -	struct resource *mem;
>  	int ret;
>  
>  	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> @@ -825,8 +824,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
>  	lvds->bridge.of_node = pdev->dev.of_node;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);
> +	lvds->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lvds->mmio))
>  		return PTR_ERR(lvds->mmio);
>  

-- 
Regards,

Laurent Pinchart
