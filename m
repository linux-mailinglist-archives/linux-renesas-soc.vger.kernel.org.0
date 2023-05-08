Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C356F9DC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 04:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjEHCkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 22:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEHCkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 22:40:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160783A87
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 May 2023 19:40:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net [126.90.219.15])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 811DB814;
        Mon,  8 May 2023 04:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683513636;
        bh=8cljPFuI1JkrTqDhhztblXvmvJz+dW8VJylJZ3dVGVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FEIWyKC91QEdrKH5i9nLRuNZK8bOtyhtSwEqTjIcAv7BHAWSev98BapA7ZMztsQz5
         8oyUFjVYGdnRQ0COLH9SW+WejO/tJ+xVRkMGwwB/ua3EdE46NsGSdVUPdIazMOjT2q
         lzDNzoZ61P/6K3McrWm/w5JtxpdnLDg0vIoiK1uM=
Date:   Mon, 8 May 2023 05:40:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 39/53] drm/shmobile: Convert to platform remove callback
 returning void
Message-ID: <20230508024054.GF23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:26:02PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index faacfee24763..fa32115320ca 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -171,7 +171,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
>   * Platform driver
>   */
>  
> -static int shmob_drm_remove(struct platform_device *pdev)
> +static void shmob_drm_remove(struct platform_device *pdev)
>  {
>  	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = sdev->ddev;
> @@ -180,8 +180,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  	free_irq(sdev->irq, ddev);
>  	drm_dev_put(ddev);
> -
> -	return 0;
>  }
>  
>  static int shmob_drm_probe(struct platform_device *pdev)
> @@ -285,7 +283,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  static struct platform_driver shmob_drm_platform_driver = {
>  	.probe		= shmob_drm_probe,
> -	.remove		= shmob_drm_remove,
> +	.remove_new	= shmob_drm_remove,
>  	.driver		= {
>  		.name	= "shmob-drm",
>  		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
