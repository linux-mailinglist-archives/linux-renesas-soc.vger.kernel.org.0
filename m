Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C981D4153C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbhIVXRZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhIVXRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:17:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D341C061574;
        Wed, 22 Sep 2021 16:15:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A4BEE52;
        Thu, 23 Sep 2021 01:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632352552;
        bh=EhjsdaAZ3wq2Jvv0W+AfcSrgjMlFF23xTtV5z31k1lo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p0iHLCYId8tx/iYo120SxHKpzEbVJLBot1ZbdTQq9lvBiy4cIluk5ejuocw67chgI
         AIARYNucPMFzsZmjBlnevYHqZ/zkbdYm5laaaomOsf0hTIGc+wOwa6CGg8K3fwBDyc
         zWtLPB6DqGO1Sb7d42cZivttjLTk/SG4gX2sinAQ=
Date:   Thu, 23 Sep 2021 02:15:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/shmobile: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YUu5Jgem26uQFP7o@pendragon.ideasonboard.com>
References: <20210831135731.4776-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831135731.4776-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Tue, Aug 31, 2021 at 09:57:30PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 7db01904d18d..80078a9fd7f6 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -192,7 +192,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
>  	struct shmob_drm_device *sdev;
>  	struct drm_device *ddev;
> -	struct resource *res;
>  	unsigned int i;
>  	int ret;
>  
> @@ -215,8 +214,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sdev);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
> +	sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sdev->mmio))
>  		return PTR_ERR(sdev->mmio);
>  

-- 
Regards,

Laurent Pinchart
