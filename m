Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1C11A919
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfEKSpg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:45:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKSpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:45:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F72DD5;
        Sat, 11 May 2019 20:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557600333;
        bh=QL8CUPjQyX2TVbUxcISOZ2ZVI6ceCTExDCrNecUfuHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e+l/LZQVlh9OH+uVKP3CCBcave0j7fmD4ZF48QI7DMV7uYL906T+HbKndt0I0th9M
         gCTZ5ETzzDS5sHNcfufrmgXp24mKlsYbA76jwQniyrkhtLiQu83fsfdt7eY97y4+Ks
         QO9iqWQm/aDtCO4f0EYOuHmxCZtHiy5STtXT7Ys8=
Date:   Sat, 11 May 2019 21:45:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 3/9] [TODO] drm: rcar-du: Add basic support for CMM
Message-ID: <20190511184517.GH13043@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:22PM +0200, Jacopo Mondi wrote:
> Add a driver skeleton for the R-Car Display Unit Color Correction
> Module.
> 
> Each DU output channel is provided with a CMM unit to perform image
> enhancement and color correction.
> 
> Add support for CMM through a skeleton driver to be later expanded to
> support setting color correction tables through the DRM/KMS properties
> framework.
> 
> As of now, the driver is only useful to demonstrate the integration with
> the DU driver.
> 
> Not-Yet-Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig       |  7 +++
>  drivers/gpu/drm/rcar-du/Makefile      |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_cmm.c | 78 +++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_cmm.h | 23 ++++++++

Please rename these files to rcar_cmm.c and rcar_cmm.h, as they're not
part of the DU driver. This will allow adding rcar_du_cmm.[ch] files if
needed for the CMM integration code in the DU driver.

>  4 files changed, 109 insertions(+)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 1529849e217e..820f2b85a073 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -13,6 +13,13 @@ config DRM_RCAR_DU
>  	  Choose this option if you have an R-Car chipset.
>  	  If M is selected the module will be called rcar-du-drm.
>  
> +config DRM_RCAR_CMM
> +	bool "R-Car DU Color Correction Module Support"
> +	depends on DRM && OF
> +	depends on DRM_RCAR_DU && ARCH_RCAR_GEN3

You can remove ARCH_RCAR_GEN3, CMM is also available on Gen2, and even
if we don't support this yet, there's no reason to deny compilation of
the module on Gen2 platforms.

> +	help
> +	  Enable support for R-Car Gen3 Color Correction Module (CMM).

Gen2 and Gen3.

> +
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car DU Gen3 HDMI Encoder Support"
>  	depends on DRM && OF
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 6c2ed9c46467..ae26d465d421 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
>  
> +obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_du_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> new file mode 100644
> index 000000000000..63f545830bb9
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_cmm.c -- R-Car Display Unit Color Management Module
> + *
> + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "rcar_du_cmm.h"
> +#include "rcar_du_crtc.h"
> +
> +struct rcar_cmm {
> +	struct clk *clk;
> +	void __iomem *base;
> +};
> +
> +int rcar_du_cmm_setup(struct platform_device *pdev, struct rcar_du_crtc *rcrtc)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(rcmm->clk);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

I'd name this function rcar_cmm_enable(), and add a rcar_cmm_disable().
There's no need to pass the CRTC pointer. You will also need an
rcar_cmm_setup() function that will take a data structure with
configuration parameters. I propose implementing LUT support already, so
the structure could look like

struct rcar_cmm_configuration {
	struct {
		bool enable;
		u32 *lut;
	} lut;
};

The enable flag shall program the LUT_EN bit in CM2_LUT_CTRL, and the
lut pointer, if present, shall point to 256 32-bit entries to be written
to the LUT through CM2_LUT_TBL (you can ignore double-buffering for
now). The LUT shall be initialised with an identity table at probe time:

	for (i = 0; i < 256; ++i)
		CM2_LUT_TBL[i] = (i << 16) | (i << 8) | i;

(using the appropriate I/O write function of course).

> +
> +static int rcar_cmm_probe(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm;
> +	struct resource *res;
> +
> +	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> +	if (!rcmm)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rcmm);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rcmm->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rcmm->base))
> +		return PTR_ERR(rcmm->base);
> +
> +	rcmm->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(rcmm->clk)) {
> +		dev_err(&pdev->dev, "Failed to get CMM clock");
> +		return PTR_ERR(rcmm->clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcar_cmm_of_table[] = {
> +	{ .compatible = "renesas,cmm" },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> +
> +static struct platform_driver rcar_cmm_platform_driver = {
> +	.probe		= rcar_cmm_probe,
> +	.driver		= {
> +		.name	= "rcar-cmm",
> +		.of_match_table = rcar_cmm_of_table,
> +	},
> +};
> +
> +module_platform_driver(rcar_cmm_platform_driver);
> +
> +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
> +MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.h b/drivers/gpu/drm/rcar-du/rcar_du_cmm.h
> new file mode 100644
> index 000000000000..be9ac1a091b0
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rcar_du_cmm.c -- R-Car Display Unit Color Management Module
> + *
> + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#ifndef __RCAR_DU_CMM_H_
> +#define __RCAR_DU_CMM_H_
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

You can instead add forward declarations of struct device_node and
struct platform_device.

> +
> +struct rcar_du_crtc;
> +
> +struct rcar_du_cmm {
> +	struct device_node *np;
> +	unsigned int crtc;
> +};

This structure is only used in the DU driver and should thus not be
declared here.

> +
> +int rcar_du_cmm_setup(struct platform_device *, struct rcar_du_crtc *);
> +
> +#endif /* __RCAR_DU_CMM_H_ */

-- 
Regards,

Laurent Pinchart
