Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFD81BC168
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 16:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgD1OfY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 10:35:24 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40365 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgD1OfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 10:35:24 -0400
Received: from uno.localdomain (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7E94710001C;
        Tue, 28 Apr 2020 14:35:17 +0000 (UTC)
Date:   Tue, 28 Apr 2020 16:38:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] drm/rcar-du: Fix return value check in
 rcar_du_cmm_init()
Message-ID: <20200428143828.j7y57ll5drvs2rer@uno.localdomain>
References: <20200428141716.87958-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428141716.87958-1-weiyongjun1@huawei.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wei,

On Tue, Apr 28, 2020 at 02:17:16PM +0000, Wei Yongjun wrote:
> In case of error, the function of_parse_phandle()/of_find_device_by_node()
> returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test
>
> Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Correct indeed! Also -ENODEV seems appropriate to me as return value.
Thanks!

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 482329102f19..0da711d9b2f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -650,10 +650,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
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
> @@ -663,10 +663,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
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
>
>
