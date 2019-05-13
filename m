Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914721B56A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 14:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfEMMBb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 08:01:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57236 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfEMMBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 08:01:31 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9E70B25AD63;
        Mon, 13 May 2019 22:01:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 26C44E22B88; Mon, 13 May 2019 14:01:25 +0200 (CEST)
Date:   Mon, 13 May 2019 14:01:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Message-ID: <20190513120124.72pyg5hileurtkry@verge.net.au>
References: <1557715229-13102-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557715229-13102-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 13, 2019 at 11:40:29AM +0900, Yoshihiro Shimoda wrote:
> This patch adds a specific struct "usbhs_of_data" to add a new SoC
> data easily instead of code basis in the future.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Shimoda-san,

the minor suggestion below not withstanding this looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Changes from v1 [1]:
>  - Use sizeof(variable) instead of sizeof(type).
>  - Add Geert-san's reviewed-by (thanks!).
> 
> [1]
> https://patchwork.kernel.org/patch/10938575/
> 
>  drivers/usb/renesas_usbhs/common.c | 112 +++++++++++++++++++++----------------
>  drivers/usb/renesas_usbhs/common.h |   5 ++
>  2 files changed, 70 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 249fbee..0ca89de 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -535,53 +535,92 @@ static int usbhsc_drvcllbck_notify_hotplug(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct usbhs_of_data rcar_gen2_data = {
> +	.platform_callback = &usbhs_rcar2_ops,
> +	.param = {
> +		.type = USBHS_TYPE_RCAR_GEN2,
> +		.has_usb_dmac = 1,
> +		.pipe_configs = usbhsc_new_pipe,
> +		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
> +	}
> +};
> +
> +static const struct usbhs_of_data rcar_gen3_data = {
> +	.platform_callback = &usbhs_rcar3_ops,
> +	.param = {
> +		.type = USBHS_TYPE_RCAR_GEN3,
> +		.has_usb_dmac = 1,
> +		.pipe_configs = usbhsc_new_pipe,
> +		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
> +	}
> +};
> +
> +static const struct usbhs_of_data rcar_gen3_with_pll_data = {
> +	.platform_callback = &usbhs_rcar3_with_pll_ops,
> +	.param = {
> +		.type = USBHS_TYPE_RCAR_GEN3_WITH_PLL,
> +		.has_usb_dmac = 1,
> +		.pipe_configs = usbhsc_new_pipe,
> +		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
> +	}
> +};
> +
> +static const struct usbhs_of_data rza1_data = {
> +	.platform_callback = &usbhs_rza1_ops,
> +	.param = {
> +		.type = USBHS_TYPE_RZA1,
> +		.pipe_configs = usbhsc_new_pipe,
> +		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
> +	}
> +};
> +
>  /*
>   *		platform functions
>   */
>  static const struct of_device_id usbhs_of_match[] = {
>  	{
>  		.compatible = "renesas,usbhs-r8a774c0",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
> +		.data = &rcar_gen3_with_pll_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a7790",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN2,
> +		.data = &rcar_gen2_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a7791",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN2,
> +		.data = &rcar_gen2_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a7794",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN2,
> +		.data = &rcar_gen2_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a7795",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3,
> +		.data = &rcar_gen3_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a7796",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3,
> +		.data = &rcar_gen3_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a77990",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
> +		.data = &rcar_gen3_with_pll_data,
>  	},
>  	{
>  		.compatible = "renesas,usbhs-r8a77995",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
> +		.data = &rcar_gen3_with_pll_data,
>  	},
>  	{
>  		.compatible = "renesas,rcar-gen2-usbhs",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN2,
> +		.data = &rcar_gen2_data,
>  	},
>  	{
>  		.compatible = "renesas,rcar-gen3-usbhs",
> -		.data = (void *)USBHS_TYPE_RCAR_GEN3,
> +		.data = &rcar_gen3_data,
>  	},
>  	{
>  		.compatible = "renesas,rza1-usbhs",
> -		.data = (void *)USBHS_TYPE_RZA1,
> +		.data = &rza1_data,
>  	},
>  	{ },
>  };
> @@ -591,6 +630,7 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>  {
>  	struct renesas_usbhs_platform_info *info;
>  	struct renesas_usbhs_driver_param *dparam;
> +	const struct usbhs_of_data *data;
>  	u32 tmp;
>  	int gpio;
>  
> @@ -598,8 +638,15 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>  	if (!info)
>  		return NULL;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return NULL;
> +
>  	dparam = &info->driver_param;
> -	dparam->type = (uintptr_t)of_device_get_match_data(dev);
> +	memcpy(dparam, &data->param, sizeof(data->param));
> +	memcpy(&info->platform_callback, data->platform_callback,
> +	       sizeof(*data->platform_callback));

Can we avoid the error-proneness of calls to sizeof() as follows?

        *dparam = data->param;
        info->platform_callback = *data->platform_callback;

> +
>  	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
>  		dparam->buswait_bwait = tmp;
>  	gpio = of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio", 0,
> @@ -607,19 +654,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>  	if (gpio > 0)
>  		dparam->enable_gpio = gpio;
>  
> -	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
> -	    dparam->type == USBHS_TYPE_RCAR_GEN3 ||
> -	    dparam->type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
> -		dparam->has_usb_dmac = 1;
> -		dparam->pipe_configs = usbhsc_new_pipe;
> -		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
> -	}
> -
> -	if (dparam->type == USBHS_TYPE_RZA1) {
> -		dparam->pipe_configs = usbhsc_new_pipe;
> -		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
> -	}
> -
>  	return info;
>  }
>  
> @@ -676,29 +710,13 @@ static int usbhs_probe(struct platform_device *pdev)
>  	       &info->driver_param,
>  	       sizeof(struct renesas_usbhs_driver_param));

Likewise in the (otherwise unchanged) use of memcpy above.

>  
> -	switch (priv->dparam.type) {
> -	case USBHS_TYPE_RCAR_GEN2:
> -		priv->pfunc = usbhs_rcar2_ops;
> -		break;
> -	case USBHS_TYPE_RCAR_GEN3:
> -		priv->pfunc = usbhs_rcar3_ops;
> -		break;
> -	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
> -		priv->pfunc = usbhs_rcar3_with_pll_ops;
> -		break;
> -	case USBHS_TYPE_RZA1:
> -		priv->pfunc = usbhs_rza1_ops;
> -		break;
> -	default:
> -		if (!info->platform_callback.get_id) {
> -			dev_err(&pdev->dev, "no platform callbacks");
> -			return -EINVAL;
> -		}
> -		memcpy(&priv->pfunc,
> -		       &info->platform_callback,
> -		       sizeof(struct renesas_usbhs_platform_callback));
> -		break;
> +	if (!info->platform_callback.get_id) {
> +		dev_err(&pdev->dev, "no platform callbacks");
> +		return -EINVAL;
>  	}
> +	memcpy(&priv->pfunc,
> +	       &info->platform_callback,
> +	       sizeof(struct renesas_usbhs_platform_callback));

And here too.

>  
>  	/* set driver callback functions for platform */
>  	dfunc			= &info->driver_callback;
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
> index 3777af8..de1a663 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -282,6 +282,11 @@ struct usbhs_priv {
>  	struct clk *clks[2];
>  };
>  
> +struct usbhs_of_data {
> +	const struct renesas_usbhs_platform_callback	*platform_callback;
> +	const struct renesas_usbhs_driver_param		param;
> +};
> +
>  /*
>   * common
>   */
> -- 
> 2.7.4
> 
