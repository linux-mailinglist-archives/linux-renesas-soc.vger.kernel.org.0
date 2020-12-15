Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDC62DB40D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 19:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731764AbgLOSw2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 13:52:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33106 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731748AbgLOSwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 13:52:19 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D605D593;
        Tue, 15 Dec 2020 19:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608058294;
        bh=CX19z2xhCWPnBJt/UfsNscnL+UtMH1/Faxi7jyzarwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gv0NOM/zNituv2OO8aeHLIFlpSHjwSOuyFonMWxqgNryPKEh7ifrZ9vuIJi0qs04H
         WO+lJvGsW9krNboPZkiZpnntdYJMpnwvz61OgOoPVCFJ6w564kDpt1DzlJLoZjR57A
         NZyOQG+OmyGuDMnXb8KmGRGitauOKFm/xWv88l2M=
Date:   Tue, 15 Dec 2020 20:51:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: fix reference leak in rcar_cmm_enable
Message-ID: <X9kFryFOEfl5+S3B@pendragon.ideasonboard.com>
References: <20201127094444.121186-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201127094444.121186-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Qinglang,

Thank you for the patch.

On Fri, Nov 27, 2020 at 05:44:44PM +0800, Qinglang Miao wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
> 
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
> 
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
> 
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And queued for v5.11.

> ---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> index c578095b0..382d53f8a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -122,7 +122,7 @@ int rcar_cmm_enable(struct platform_device *pdev)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret < 0)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
