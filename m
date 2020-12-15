Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC4E2DAC30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 12:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgLOLjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 06:39:35 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:39095 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgLOLjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 06:39:25 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2020D200005;
        Tue, 15 Dec 2020 11:38:34 +0000 (UTC)
Date:   Tue, 15 Dec 2020 12:38:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: fix reference leak in rcar_cmm_enable
Message-ID: <20201215113845.zy4keqwnk3kgw2z2@uno.localdomain>
References: <20201127094444.121186-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201127094444.121186-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Qinglang,

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

I -think- you can break this line. Anyway, maintainers can fix when
applying if they feel to.

>
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Seems fair!
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

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
> --
> 2.23.0
>
