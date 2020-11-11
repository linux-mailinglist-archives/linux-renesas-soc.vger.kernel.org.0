Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C3A2AF13C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 13:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgKKMvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 07:51:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgKKMvQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 07:51:16 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFC9CA19;
        Wed, 11 Nov 2020 13:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605099073;
        bh=03M0H/6Q0FicpBXAUeyVuY0edxiXRr6HBE6AiMF79ww=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ErHe2RL/x6Y/SPZxGetJaGeswP2lSlkaY4isAPzANK1DAIymBivHDOyzsuHP59fDZ
         sHd/cKPas4Hv3u2XzuJFSPt7896Z+LE9apQXOILg+13Q08uWmD9ikmuSIznDnEKS9u
         NFNOoqnq3djqrNj/ZFIjZgKwEitVGGPrcJeaXcIk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Fix the return check of of_parse_phandle
 and of_find_device_by_node
To:     Wang Xiaojun <wangxiaojun11@huawei.com>,
        laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <360b40b7-cc94-0665-be5f-b18d992100f5@ideasonboard.com>
Date:   Wed, 11 Nov 2020 12:51:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wang Xiaojun,

On 11/11/2020 03:14, Wang Xiaojun wrote:
> of_parse_phandle and of_find_device_by_node may return NULL
> which cannot be checked by IS_ERR.

Indeed, both of these functions return either NULL or the correct value,
and no an errno.

> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

