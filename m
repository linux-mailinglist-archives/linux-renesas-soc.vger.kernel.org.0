Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3CAB114177
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfLENbY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:31:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbfLENbY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:31:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89BB72E5;
        Thu,  5 Dec 2019 14:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575552682;
        bh=xcgXt5UQtGbiHPz67BkPZ7M96OJxHolQhsjenNkfL8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=efI1kCK5aRPeq9tcnwg9U5YxHGLjSIyEWjWfWjTfI5q65MAZYohq/HgIV89tl3g00
         +3etPp0UGjyyvzot0ymIp2+Tu97Wn87KUpVjvUfRedjw/yaqMb9Weww5+bGK64RjOQ
         /Dkln2nq/Itzr9Oc+5VIkpV+vAd/PByjerEI6vLg=
Date:   Thu, 5 Dec 2019 15:31:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mihail Atanassov <Mihail.Atanassov@arm.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        nd <nd@arm.com>
Subject: Re: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge
 private pointer
Message-ID: <20191205133115.GC16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-27-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-27-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mihail,

Thank you for the patch.

On Wed, Dec 04, 2019 at 11:48:24AM +0000, Mihail Atanassov wrote:
> No functional change: it's not used anywhere.
> 
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index ac1f29bacfcb..168a718cbcbd 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -882,7 +882,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	drm_bridge_init(&lvds->bridge, &pdev->dev, &rcar_lvds_bridge_ops,
> -			NULL, lvds);
> +			NULL, NULL);

You can squash this with 25/28.

>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);

-- 
Regards,

Laurent Pinchart
