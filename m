Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26F1DB70A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 21:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439261AbfJQTL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Oct 2019 15:11:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439259AbfJQTL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 15:11:29 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1BC6500;
        Thu, 17 Oct 2019 21:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571339486;
        bh=cLv6dvX62jsIe0ZT/xHTokp//1tjeM6yUQFaK10EMNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FapWaoM5128lf2nDfYZ00G8jEaN6dF7g7kqRsUiLMUEnATBtr/hZEHok1e3lVnRaW
         DAbC82fOE6uZ55LuJg+jR3BAJKWNoTCze0ZhJEhsnW5mF5Wx18PtlUJSl46Bkg08b5
         LXCkmLEhUaAtHrutmDyuahU9+U1DdXRPQm4wlMDk=
Date:   Thu, 17 Oct 2019 22:11:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1 3/8] drm: rcar-du: Add support for CMM
Message-ID: <20191017191122.GF4901@pendragon.ideasonboard.com>
References: <20191016085548.105703-4-jacopo+renesas@jmondi.org>
 <20191017134332.535677-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191017134332.535677-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Oct 17, 2019 at 03:43:32PM +0200, Jacopo Mondi wrote:
> Add a driver for the R-Car Display Unit Color Correction Module.
> 
> In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> to perform image enhancement and color correction.
> 
> Add support for CMM through a driver that supports configuration of
> the 1-dimensional LUT table. More advanced CMM features will be
> implemented on top of this initial one.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> v6 -> v6.1
> - Expand rcar_cmm_setup() function documentation to detail its relationship
>   with rcar_cmm_enable() and their call order precedence.
> ---
> 
>  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
>  drivers/gpu/drm/rcar-du/Makefile   |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c | 217 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h |  58 ++++++++
>  4 files changed, 283 insertions(+)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 1529849e217e..539d232790d1 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -13,6 +13,13 @@ config DRM_RCAR_DU
>  	  Choose this option if you have an R-Car chipset.
>  	  If M is selected the module will be called rcar-du-drm.
> 
> +config DRM_RCAR_CMM
> +	bool "R-Car DU Color Management Module (CMM) Support"
> +	depends on DRM && OF
> +	depends on DRM_RCAR_DU
> +	help
> +	  Enable support for R-Car Color Management Module (CMM).
> +
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car DU Gen3 HDMI Encoder Support"
>  	depends on DRM && OF
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 6c2ed9c46467..4d1187ccc3e5 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
> 
> +obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> new file mode 100644
> index 000000000000..952316eb202b
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> + *
> + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_color_mgmt.h>
> +
> +#include "rcar_cmm.h"
> +
> +#define CM2_LUT_CTRL		0x0000
> +#define CM2_LUT_CTRL_LUT_EN	BIT(0)
> +#define CM2_LUT_TBL_BASE	0x0600
> +#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
> +
> +struct rcar_cmm {
> +	void __iomem *base;
> +
> +	/*
> +	 * @lut:		1D-LUT state
> +	 * @lut.enabled:	1D-LUT enabled flag
> +	 */
> +	struct {
> +		bool enabled;
> +	} lut;
> +};
> +
> +static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> +{
> +	return ioread32(rcmm->base + reg);
> +}
> +
> +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
> +{
> +	iowrite32(data, rcmm->base + reg);
> +}
> +
> +/*
> + * rcar_cmm_lut_write() - Scale the DRM LUT table entries to hardware precision
> + *			  and write to the CMM registers
> + * @rcmm: Pointer to the CMM device
> + * @drm_lut: Pointer to the DRM LUT table
> + */
> +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
> +			       const struct drm_color_lut *drm_lut)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < CM2_LUT_SIZE; ++i) {
> +		u32 entry = drm_color_lut_extract(drm_lut[i].red, 8) << 16
> +			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
> +			  | drm_color_lut_extract(drm_lut[i].blue, 8);
> +
> +		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> +	}
> +}
> +
> +/*
> + * rcar_cmm_setup() - Configure the CMM unit
> + * @pdev: The platform device associated with the CMM instance
> + * @config: The CMM unit configuration
> + *
> + * Configure the CMM unit with the given configuration. Currently enabling,
> + * disabling and programming of the 1-D LUT unit is supported.
> + *
> + * As rcar_cmm_setup() accesses the CMM registers the unit should be powered
> + * and its functional clock enabled. To guarantee this, before any call to
> + * this function is made, the CMM unit has to be enabled by calling
> + * rcar_cmm_enable() first.

We seem to have trouble agreeing on the right level of detail :-) It's
no big deal, and I'll take this patch in my tree, but I'd like to
explain my rationale, hoping that you'll prove me wrong or I'll convince
you :-)

Documenting a public API (this function is exported) is making a
contract. The documentation should state what the contract is, in order
for the caller to know how to use it. That's the level of detail I think
we need : anything that's part of the contract should be documented
(hence my review of the previous version). On the other hand, how the
function operates internally isn't part of the contract. The fact that
it accesses registers is internal implementation, as is the fact that
the functional clock should be enabled. That part thus isn't something
that needs to be documented externally, doing so would expand the API
contract, and the caller may rely on it. It's not a concern here, but in
general, if you document in a public API a side effect of a function,
then you won't be able to modify that function later in a way that would
modify that side effect. Of course, here we're dealing with an internal
API and we can modify both the CMM and the DU side in any case. Striking
the right level of details in documentation is not easy, and I hope that
this explanation can be of general usefulness.

This being said,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
> + * TODO: Add support for LUT double buffer operations to avoid updating the
> + * LUT table entries while a frame is being displayed.
> + */
> +int rcar_cmm_setup(struct platform_device *pdev,
> +		   const struct rcar_cmm_config *config)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +
> +	/* Disable LUT if no table is provided. */
> +	if (!config->lut.table) {
> +		if (rcmm->lut.enabled) {
> +			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> +			rcmm->lut.enabled = false;
> +		}
> +
> +		return 0;
> +	}
> +
> +	/* Enable LUT and program the new gamma table values. */
> +	if (!rcmm->lut.enabled) {
> +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> +		rcmm->lut.enabled = true;
> +	}
> +
> +	rcar_cmm_lut_write(rcmm, config->lut.table);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> +
> +/*
> + * rcar_cmm_enable() - Enable the CMM unit
> + * @pdev: The platform device associated with the CMM instance
> + *
> + * When the output of the corresponding DU channel is routed to the CMM unit,
> + * the unit shall be enabled before the DU channel is started, and remain
> + * enabled until the channel is stopped. The CMM unit shall be disabled with
> + * rcar_cmm_disable().
> + *
> + * Calls to rcar_cmm_enable() and rcar_cmm_disable() are not reference-counted.
> + * It is an error to attempt to enable an already enabled CMM unit, or to
> + * attempt to disable a disabled unit.
> + */
> +int rcar_cmm_enable(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_enable);
> +
> +/*
> + * rcar_cmm_disable() - Disable the CMM unit
> + * @pdev: The platform device associated with the CMM instance
> + *
> + * See rcar_cmm_enable() for usage information.
> + *
> + * Disabling the CMM unit disable all the internal processing blocks. The CMM
> + * state shall thus be restored with rcar_cmm_setup() when re-enabling the CMM
> + * unit after the next rcar_cmm_enable() call.
> + */
> +void rcar_cmm_disable(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +
> +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> +	rcmm->lut.enabled = false;
> +
> +	pm_runtime_put(&pdev->dev);
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> +
> +/*
> + * rcar_cmm_init() - Initialize the CMM unit
> + * @pdev: The platform device associated with the CMM instance
> + *
> + * Return: 0 on success, -EPROBE_DEFER if the CMM is not available yet,
> + *         -ENODEV if the DRM_RCAR_CMM config option is disabled
> + */
> +int rcar_cmm_init(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +
> +	if (!rcmm)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_init);
> +
> +static int rcar_cmm_probe(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm;
> +
> +	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> +	if (!rcmm)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, rcmm);
> +
> +	rcmm->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rcmm->base))
> +		return PTR_ERR(rcmm->base);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int rcar_cmm_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcar_cmm_of_table[] = {
> +	{ .compatible = "renesas,rcar-gen3-cmm", },
> +	{ .compatible = "renesas,rcar-gen2-cmm", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> +
> +static struct platform_driver rcar_cmm_platform_driver = {
> +	.probe		= rcar_cmm_probe,
> +	.remove		= rcar_cmm_remove,
> +	.driver		= {
> +		.name	= "rcar-cmm",
> +		.of_match_table = rcar_cmm_of_table,
> +	},
> +};
> +
> +module_platform_driver(rcar_cmm_platform_driver);
> +
> +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org>");
> +MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> new file mode 100644
> index 000000000000..b5f7ec6db04a
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rcar_cmm.h -- R-Car Display Unit Color Management Module
> + *
> + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#ifndef __RCAR_CMM_H__
> +#define __RCAR_CMM_H__
> +
> +#define CM2_LUT_SIZE		256
> +
> +struct drm_color_lut;
> +struct platform_device;
> +
> +/**
> + * struct rcar_cmm_config - CMM configuration
> + *
> + * @lut:	1D-LUT configuration
> + * @lut.table:	1D-LUT table entries. Disable LUT operations when NULL
> + */
> +struct rcar_cmm_config {
> +	struct {
> +		struct drm_color_lut *table;
> +	} lut;
> +};
> +
> +#if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> +int rcar_cmm_init(struct platform_device *pdev);
> +
> +int rcar_cmm_enable(struct platform_device *pdev);
> +void rcar_cmm_disable(struct platform_device *pdev);
> +
> +int rcar_cmm_setup(struct platform_device *pdev,
> +		   const struct rcar_cmm_config *config);
> +#else
> +static inline int rcar_cmm_init(struct platform_device *pdev)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int rcar_cmm_enable(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static inline void rcar_cmm_disable(struct platform_device *pdev)
> +{
> +}
> +
> +static inline int rcar_cmm_setup(struct platform_device *pdev,
> +				 const struct rcar_cmm_config *config)
> +{
> +	return 0;
> +}
> +#endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
> +
> +#endif /* __RCAR_CMM_H__ */

-- 
Regards,

Laurent Pinchart
