Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00C511417A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfLENbx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:31:53 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfLENbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:31:53 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C2A2E5;
        Thu,  5 Dec 2019 14:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575552712;
        bh=OlzJQeXceRJgsnnh77/SjoLKrK5XCVPM7Hy9RbqiHdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CKTeE0NQKD4ShPu2jMegLlRN8NZ2Qc30giL23qsV/HqkNxN/YTrB2XvHTcoCFqev0
         CCSZUP9t2snzW6bXKoGDrx5OIiooulNkJg7jj6rgKU1dVjwBOcDx3Hb21cTvM7HfBr
         TlT+2JlwdjOxiwrBpM0IRBQicYG4U/5Zex3vU7rY=
Date:   Thu, 5 Dec 2019 15:31:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mihail Atanassov <Mihail.Atanassov@arm.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        nd <nd@arm.com>
Subject: Re: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Message-ID: <20191205133144.GD16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-26-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-26-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mihail,

Thank you for the patch.

On Wed, Dec 04, 2019 at 11:48:23AM +0000, Mihail Atanassov wrote:
> No functional change.
> 
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>

If you squash this with 26/28,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 8c6c172bbf2e..ac1f29bacfcb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -881,9 +881,8 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	lvds->bridge.driver_private = lvds;
> -	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
> -	lvds->bridge.of_node = pdev->dev.of_node;
> +	drm_bridge_init(&lvds->bridge, &pdev->dev, &rcar_lvds_bridge_ops,
> +			NULL, lvds);
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);

-- 
Regards,

Laurent Pinchart
