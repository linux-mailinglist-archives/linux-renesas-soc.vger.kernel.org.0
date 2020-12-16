Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECE02DB827
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 02:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgLPBBn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 20:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgLPBBa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 20:01:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA20C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 17:00:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9BFF593;
        Wed, 16 Dec 2020 02:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608080449;
        bh=BpD9yvELgRke6zwYTRe95qIDDUllDO2mddkQNltqIFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cvD7unDSyM1jk1L5ajG6/pZI9zdnvCOT3LK04R+RxQ2AK/i9ha9DAK+WIIjZSMoL4
         0jIZTcqXu1zqcKBqn6FvHc99TGW8Qo4j17V0CIu5hmF59Wk8ud8Uqa00+HxdLf3NsU
         hObcRYVPc6dYtI45S9nRRdm+hQTvlHE03oUavo0A=
Date:   Wed, 16 Dec 2020 03:00:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Fix the return check of of_parse_phandle
 and of_find_device_by_node
Message-ID: <X9lcOpl2IN/EVL9+@pendragon.ideasonboard.com>
References: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wang,

Thank you for the patch.

On Wed, Nov 11, 2020 at 11:14:52AM +0800, Wang Xiaojun wrote:
> of_parse_phandle and of_find_device_by_node may return NULL
> which cannot be checked by IS_ERR.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued in my tree for v5.12.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..fcfddf7ad3f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -700,10 +700,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		int ret;
>  
>  		cmm = of_parse_phandle(np, "renesas,cmms", i);
> -		if (IS_ERR(cmm)) {
> +		if (!cmm) {
>  			dev_err(rcdu->dev,
>  				"Failed to parse 'renesas,cmms' property\n");
> -			return PTR_ERR(cmm);
> +			return -ENODEV;
>  		}
>  
>  		if (!of_device_is_available(cmm)) {
> @@ -713,10 +713,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		}
>  
>  		pdev = of_find_device_by_node(cmm);
> -		if (IS_ERR(pdev)) {
> +		if (!pdev) {
>  			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
>  			of_node_put(cmm);
> -			return PTR_ERR(pdev);
> +			return -ENODEV;
>  		}
>  
>  		of_node_put(cmm);

-- 
Regards,

Laurent Pinchart
