Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0C86A962
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 15:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfGPNR1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 09:17:27 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35311 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGPNR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 09:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563283042;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OS2v6I9JcXOokb1wPv5qJe7kCP2KgZTfl6ZryXOWzjM=;
        b=J8qGddnH3tHJh03+MH6H8AgAKvPbWSfGaUGVgIpG5tVXVpMyshrk+M9VhIQ+epL3vF
        rBahUWk60Pw1Md0WWzzKaQfC/XnGjFfbXzU6nOThgjFuGhwQUOlSy62CGZCfBGrR3wfk
        cHZMNBM4GRWdZxylVKdW9Pjx9PiYBkuHV1KQtqIstgAl49yzyJWVJVkJojTX8846O9fR
        GXC2RjKeEowuhNJhpgsNHGmvBX7zXvZIhFH7xBkejzUPYo485HYLIl8JFqpTJjZyyrhg
        hDPXwohIJh46yBkYgR3uGzSZW5w0PtoiRnkF3Z+UOjI3EaLm4qvJJyiMWjJQjKNce6xG
        ohMw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6GDH4cPK
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 15:17:04 +0200 (CEST)
Date:   Tue, 16 Jul 2019 15:17:04 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Message-ID: <898081800.61387.1563283024145@webmail.strato.com>
In-Reply-To: <20190706140746.29132-15-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-15-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 14/19] drm: rcar-du: Add support for CMM
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks for your patch!

> On July 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> 
> 
> Add a driver for the R-Car Display Unit Color Correction Module.
> 
> In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> to perform image enhancement and color correction.
> 
> Add support for CMM through a driver that supports configuration of
> the 1-dimensional LUT table. More advanced CMM feature will be
> implemented on top of this basic one.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
>  drivers/gpu/drm/rcar-du/Makefile   |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c | 292 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 ++++
>  4 files changed, 338 insertions(+)
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
> index 000000000000..76ed3fce2b33
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> + *
> + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +
> +#include <drm/drm_atomic.h>
> +
> +#include "rcar_cmm.h"
> +
> +#define CM2_LUT_CTRL		0x0000
> +#define CM2_LUT_CTRL_EN		BIT(0)
> +#define CM2_LUT_TBLA_BASE	0x0600
> +#define CM2_LUT_TBLA(__i)	(CM2_LUT_TBLA_BASE + (__i) * 4)
> +
> +struct rcar_cmm {
> +	struct clk *clk;
> +	void __iomem *base;
> +	bool enabled;
> +
> +	/*
> +	 * restore: LUT restore flag
> +	 * running: LUT operating flag
> +	 * size: Number of programmed entries in the LUT table
> +	 * table: Scratch buffer where to store the LUT table entries to be
> +	 *	  later restored.
> +	 */
> +	struct {
> +		bool restore;
> +		bool running;
> +		unsigned int size;
> +		struct drm_color_lut table[CMM_GAMMA_LUT_SIZE];
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
> +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm, unsigned int size,
> +			       struct drm_color_lut *lut)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < size; ++i) {
> +		struct drm_color_lut *entry = &lut[i];
> +
> +		u32 val = (entry->red & 0xff) << 16 |
> +			  (entry->green & 0xff) << 8 |
> +			  (entry->blue & 0xff);

I don't think it's correct to cut off the high bits here. There is a function "drm_color_lut_extract()" for converting drm_color_lut values to hardware precision.

> +		rcar_cmm_write(rcmm, CM2_LUT_TBLA(i), val);
> +	}
> +}
> +
> +/**
> + * rcar_cmm_setup() - configure the CMM unit
> + *
> + * @pdev: The platform device associated with the CMM instance
> + * @config: The CRTC provided configuration.
> + *
> + * Configure the CMM unit with the CRTC provided configuration.
> + * Currently enabling, disabling and programming of the 1-D LUT unit is
> + * supported.
> + */
> +int rcar_cmm_setup(struct platform_device *pdev,
> +		   const struct rcar_cmm_config *config)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +	unsigned int i;
> +
> +	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
> +		return -EINVAL;
> +
> +	/*
> +	 * As cmm_setup is called by atomic commit tail helper, it might be
> +	 * called before enabling the CRTC (which calls cmm_enable()).
> +	 */
> +	if (!rcmm->enabled) {
> +		if (!config->lut.enable)
> +			return 0;
> +
> +		/*
> +		 * Store the LUT table entries in the scratch buffer to be later
> +		 * programmed at enable time.
> +		 */
> +		for (i = 0; i < config->lut.size; ++i)
> +			rcmm->lut.table[i] = config->lut.table[i];
> +
> +		rcmm->lut.size = config->lut.size;
> +		rcmm->lut.restore = true;
> +
> +		return 0;
> +	}
> +
> +	/* Stop LUT operations, if requested. */
> +	if (rcmm->lut.running && !config->lut.enable) {
> +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> +		rcmm->lut.running = 0;
> +		rcmm->lut.size = 0;
> +
> +		return 0;
> +	}
> +
> +	/* Enable LUT and program the new gamma table values. */
> +	if (!rcmm->lut.running) {
> +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> +		rcmm->lut.running = true;
> +	}
> +
> +	rcar_cmm_lut_write(rcmm, config->lut.size, config->lut.table);
> +	rcmm->lut.size = config->lut.size;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> +
> +/**
> + * rcar_cmm_enable - enable the CMM unit
> + *
> + * @pdev: The platform device associated with the CMM instance
> + *
> + * Enable the CMM unit by enabling the parent clock and enabling the CMM
> + * components, such as 1-D LUT, if requested.
> + */
> +int rcar_cmm_enable(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!rcmm)
> +		return -EPROBE_DEFER;
> +
> +	ret = clk_prepare_enable(rcmm->clk);
> +	if (ret)
> +		return ret;
> +
> +	/* Apply the LUT table values saved at cmm_setup time. */
> +	if (rcmm->lut.restore) {
> +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> +		rcar_cmm_lut_write(rcmm, rcmm->lut.size, rcmm->lut.table);
> +
> +		rcmm->lut.restore = false;
> +		rcmm->lut.running = true;
> +	}
> +
> +	rcmm->enabled = true;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_enable);
> +
> +/**
> + * rcar_cmm_disable() - disable the CMM unit
> + *
> + * Disable the CMM unit by stopping the parent clock.
> + *
> + * @pdev: The platform device associated with the CMM instance
> + */
> +void rcar_cmm_disable(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> +
> +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> +
> +	clk_disable_unprepare(rcmm->clk);
> +
> +	rcmm->lut.restore = false;
> +	rcmm->lut.running = false;
> +	rcmm->lut.size = 0;
> +
> +	rcmm->enabled = false;
> +}
> +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int rcar_cmm_pm_suspend(struct device *dev)
> +{
> +	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
> +	unsigned int i;
> +
> +	if (!(rcmm->lut.running || rcmm->lut.restore))
> +		return 0;
> +
> +	/* Save the LUT table entries in the scratch buffer table. */
> +	for (i = 0; i < rcmm->lut.size; ++i) {
> +		int entry = rcar_cmm_read(rcmm, CM2_LUT_TBLA(i));
> +		struct drm_color_lut *lut = &rcmm->lut.table[i];
> +
> +		lut->blue = entry & 0xff;
> +		lut->green = (entry >> 8) & 0xff;
> +		lut->red = (entry >> 16) & 0xff;

Need to convert the values back to drm_color_lut scale here. I could not find a counterpart to drm_color_lut_extract(), though...

> +	}
> +
> +	rcmm->lut.restore = true;
> +	rcmm->lut.running = false;
> +
> +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> +
> +	return 0;
> +}
> +
> +static int rcar_cmm_pm_resume(struct device *dev)
> +{
> +	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
> +
> +	if (!rcmm->lut.restore)
> +		return 0;
> +
> +	/* Program the LUT entries saved at suspend time. */
> +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> +	rcar_cmm_lut_write(rcmm, rcmm->lut.size, rcmm->lut.table);
> +	rcmm->lut.running = true;
> +	rcmm->lut.restore = false;
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops rcar_cmm_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(rcar_cmm_pm_suspend, rcar_cmm_pm_resume)
> +};
> +
> +static int rcar_cmm_probe(struct platform_device *pdev)
> +{
> +	struct rcar_cmm *rcmm;
> +	struct resource *res;
> +	resource_size_t size;
> +
> +	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> +	if (!rcmm)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rcmm);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	size = resource_size(res);
> +	if (!devm_request_mem_region(&pdev->dev, res->start, size,
> +				     dev_name(&pdev->dev))) {
> +		dev_err(&pdev->dev,
> +			"can't request region for resource %pR\n", res);
> +		return -EBUSY;
> +	}
> +
> +	rcmm->base = devm_ioremap_nocache(&pdev->dev, res->start, size);
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
> +	{ .compatible = "renesas,rcar-gen3-cmm", },
> +	{ .compatible = "renesas,rcar-gen2-cmm", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> +
> +static struct platform_driver rcar_cmm_platform_driver = {
> +	.probe		= rcar_cmm_probe,
> +	.driver		= {
> +		.name	= "rcar-cmm",
> +		.pm	= &rcar_cmm_pm_ops,
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
> index 000000000000..8744e72f32cd
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> @@ -0,0 +1,38 @@
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
> +#define CMM_GAMMA_LUT_SIZE		256
> +
> +struct platform_device;
> +struct drm_color_lut;
> +
> +/**
> + * struct rcar_cmm_config - CMM configuration
> + *
> + * @lut:	1D-LUT configuration
> + * @lut.enable:	1D-LUT enable flag
> + * @lut.table:	1D-LUT table entries.
> + * @lut.size	1D-LUT number of entries. Max is 256.
> + */
> +struct rcar_cmm_config {
> +	struct {
> +		bool enable;
> +		struct drm_color_lut *table;
> +		unsigned int size;
> +	} lut;
> +};
> +
> +int rcar_cmm_enable(struct platform_device *pdev);
> +void rcar_cmm_disable(struct platform_device *pdev);
> +
> +int rcar_cmm_setup(struct platform_device *pdev,
> +		   const struct rcar_cmm_config *config);
> +
> +#endif /* __RCAR_CMM_H__ */
> -- 
> 2.21.0
>

CU
Uli
