Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFDB6F9DCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 04:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjEHCm1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 22:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEHCm0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 22:42:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826A7E4A
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 May 2023 19:42:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net [126.90.219.15])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51F10814;
        Mon,  8 May 2023 04:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683513738;
        bh=2cDXoHG7W2F9D/NzYUBPDQBvIidC2pN5VEs0T/d9doA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p7tstKmL0aq+nEZAEZXwhtHnslCsz4QJEzD93RTkn2N1SCZE3sKbBlke8c5l53pD/
         ikvq/10bmhzgtpCbYKkCdHjClfLTir0oHvoLS42QdPPledd6hrHG0opUTTUJKlgHOB
         51H/ZMMSs9PSErG0a+TKmYlHLtjF5uuq6O+2WjFk=
Date:   Mon, 8 May 2023 05:42:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 37/53] drm/rcar-du: Convert to platform remove callback
 returning void
Message-ID: <20230508024237.GH23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:26:00PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the rcar-du drm driver from always returning zero in
> the remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c       | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c   | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.c      | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c  | 6 ++----
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c | 6 ++----
>  6 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> index e2a67dda4658..26a2f5ad8ee5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -187,11 +187,9 @@ static int rcar_cmm_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rcar_cmm_remove(struct platform_device *pdev)
> +static void rcar_cmm_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id rcar_cmm_of_table[] = {
> @@ -203,7 +201,7 @@ MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
>  
>  static struct platform_driver rcar_cmm_platform_driver = {
>  	.probe		= rcar_cmm_probe,
> -	.remove		= rcar_cmm_remove,
> +	.remove_new	= rcar_cmm_remove,
>  	.driver		= {
>  		.name	= "rcar-cmm",
>  		.of_match_table = rcar_cmm_of_table,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index b9a94c5260e9..4a6bf50b5c49 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -685,7 +685,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(rcar_du_pm_ops,
>   * Platform driver
>   */
>  
> -static int rcar_du_remove(struct platform_device *pdev)
> +static void rcar_du_remove(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = &rcdu->ddev;
> @@ -694,8 +694,6 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	drm_atomic_helper_shutdown(ddev);
>  
>  	drm_kms_helper_poll_fini(ddev);
> -
> -	return 0;
>  }
>  
>  static void rcar_du_shutdown(struct platform_device *pdev)
> @@ -776,7 +774,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  static struct platform_driver rcar_du_platform_driver = {
>  	.probe		= rcar_du_probe,
> -	.remove		= rcar_du_remove,
> +	.remove_new	= rcar_du_remove,
>  	.shutdown	= rcar_du_shutdown,
>  	.driver		= {
>  		.name	= "rcar-du",
> diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> index 18ed14911b98..119d69d20b23 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> @@ -93,13 +93,11 @@ static int rcar_dw_hdmi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rcar_dw_hdmi_remove(struct platform_device *pdev)
> +static void rcar_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
>  
>  	dw_hdmi_remove(hdmi);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id rcar_dw_hdmi_of_table[] = {
> @@ -110,7 +108,7 @@ MODULE_DEVICE_TABLE(of, rcar_dw_hdmi_of_table);
>  
>  static struct platform_driver rcar_dw_hdmi_platform_driver = {
>  	.probe		= rcar_dw_hdmi_probe,
> -	.remove		= rcar_dw_hdmi_remove,
> +	.remove_new	= rcar_dw_hdmi_remove,
>  	.driver		= {
>  		.name	= "rcar-dw-hdmi",
>  		.of_match_table = rcar_dw_hdmi_of_table,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 260ea5d8624e..86d2ac204568 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -890,15 +890,13 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rcar_lvds_remove(struct platform_device *pdev)
> +static void rcar_lvds_remove(struct platform_device *pdev)
>  {
>  	struct rcar_lvds *lvds = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&lvds->bridge);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
> @@ -994,7 +992,7 @@ static const struct dev_pm_ops rcar_lvds_pm_ops = {
>  
>  static struct platform_driver rcar_lvds_platform_driver = {
>  	.probe		= rcar_lvds_probe,
> -	.remove		= rcar_lvds_remove,
> +	.remove_new	= rcar_lvds_remove,
>  	.driver		= {
>  		.name	= "rcar-lvds",
>  		.pm	= &rcar_lvds_pm_ops,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index e10e4d4b89a2..305123a671c6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -1044,13 +1044,11 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rcar_mipi_dsi_remove(struct platform_device *pdev)
> +static void rcar_mipi_dsi_remove(struct platform_device *pdev)
>  {
>  	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
>  
>  	mipi_dsi_host_unregister(&dsi->host);
> -
> -	return 0;
>  }
>  
>  static const struct rcar_mipi_dsi_device_info v3u_data = {
> @@ -1093,7 +1091,7 @@ MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
>  
>  static struct platform_driver rcar_mipi_dsi_platform_driver = {
>  	.probe          = rcar_mipi_dsi_probe,
> -	.remove         = rcar_mipi_dsi_remove,
> +	.remove_new     = rcar_mipi_dsi_remove,
>  	.driver         = {
>  		.name   = "rcar-mipi-dsi",
>  		.of_match_table = rcar_mipi_dsi_of_table,
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> index aa95b85a2964..a97fc4c5d1c8 100644
> --- a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> @@ -782,14 +782,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int rzg2l_mipi_dsi_remove(struct platform_device *pdev)
> +static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  {
>  	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
>  
>  	mipi_dsi_host_unregister(&dsi->host);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
> @@ -801,7 +799,7 @@ MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
>  
>  static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
>  	.probe	= rzg2l_mipi_dsi_probe,
> -	.remove	= rzg2l_mipi_dsi_remove,
> +	.remove_new = rzg2l_mipi_dsi_remove,
>  	.driver	= {
>  		.name = "rzg2l-mipi-dsi",
>  		.pm = &rzg2l_mipi_pm_ops,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
