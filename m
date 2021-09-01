Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D4C3FD887
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 13:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhIALQO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 07:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbhIALQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 07:16:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483F6C061575
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Sep 2021 04:15:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 795C73D7;
        Wed,  1 Sep 2021 13:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630494911;
        bh=I6bL/jrUa40v6FHSPM1ROH3qD0JJHGoBLKOMhps3j3A=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=iVmGWFZhAvp+iPjYceqaqkaCTXLF8y9/dgw/nZhONHEnvL7d0fE0I2TfH6n/QrE4s
         CYd1ESv1u/zNeBKjlNY9XvVlEZkinznyad93BDr8K3UUo9fvAbwFR7yBsFw+uFCF/u
         6ANUr6OAYlI9rPMxgTwWplyo9mZBfCnP5auTU4Sg=
Subject: Re: [PATCH] drm: rcar-du: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20210831075442.698-1-caihuoqing@baidu.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ed03b733-74f4-f291-9780-d98e293b64a0@ideasonboard.com>
Date:   Wed, 1 Sep 2021 12:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831075442.698-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 31/08/2021 08:54, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

