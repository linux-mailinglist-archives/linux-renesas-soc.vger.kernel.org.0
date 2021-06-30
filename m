Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9743B8178
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 13:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbhF3LvA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 07:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbhF3Lu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 07:50:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1608C061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jun 2021 04:48:30 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lyYhY-00029u-DR; Wed, 30 Jun 2021 13:48:20 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lyYhX-0007KX-1V; Wed, 30 Jun 2021 13:48:19 +0200
Message-ID: <83276a09d6aea1b6e8ac4aa2bfef77ef99c2d76e.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/11] reset: renesas: Add RZ/G2L usbphy control
 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 30 Jun 2021 13:48:18 +0200
In-Reply-To: <20210630073013.22415-6-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
         <20210630073013.22415-6-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

thank you for the patch. I have a few questions below.

On Wed, 2021-06-30 at 08:30 +0100, Biju Das wrote:
> Add support for RZ/G2L USBPHY Control driver. It mainly controls
> reset and power down of the USB/PHY.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  v3:
>   * New driver. As per Rob's suggestion, Modelled IP as a reset driver,
>     since it mainly controls reset and power down of the PHY.
> ---
>  drivers/reset/Kconfig                   |   7 +
>  drivers/reset/Makefile                  |   1 +
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 195 ++++++++++++++++++++++++
>  3 files changed, 203 insertions(+)
>  create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 3e7f55e44d84..82a1de5a3711 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -170,6 +170,13 @@ config RESET_RASPBERRYPI
>  	  interfacing with RPi4's co-processor and model these firmware
>  	  initialization routines as reset lines.
>  
> +config RESET_RZG2L_USBPHY_CTRL
> +	tristate "Renesas RZ/G2L USBPHY control driver"
> +	depends on ARCH_R9A07G044 || COMPILE_TEST
> +	help
> +	  Support for USBPHY Control found on RZ/G2L family. It mainly
> +	  controls reset and power down of the USB/PHY.

What else does it control? Are we missing any functionality that would
have to be added later?

> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 65a118a91b27..e4a53224f432 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
>  obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
> +obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>  obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> new file mode 100644
> index 000000000000..4e6f2513e792
> --- /dev/null
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L USBPHY control driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>

What is this used for?

> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +#define RESET			0x000
> +
> +#define SEL_PLLRESET		BIT(12)
> +#define PLL_RESET		BIT(8)
> +
> +#define PHY_RESET_PORT2		(BIT(1) | BIT(5))
> +#define PHY_RESET_PORT1		(BIT(0) | BIT(4))

Why are these two bits each?

> +
> +#define NUM_PORTS		2
> +
> +struct rzg2l_usbphy_ctrl_priv {
> +	struct reset_controller_dev rcdev;
> +	struct reset_control *rstc;
> +	struct device *dev;

This can be dropped, rcdev already contains a dev pointer. Currently
this is just used to pass &pdev->dev into rzg2l_usbphy_ctrl_register(),
which then copies it over into rcdev->dev.

> +	void __iomem *base;
> +};
> +
> +#define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
> +
> +static void rzg2l_usbphy_ctrl_set_reset(struct reset_controller_dev *rcdev,
> +					unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
> +	void __iomem *base = priv->base;
> +	u32 val = readl(base + RESET);
> +
> +	val |= id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
> +	if ((val & 0xff) == (PHY_RESET_PORT1 | PHY_RESET_PORT2))
                   ^^^^
What is the significance of the magic 0xff?

> +		val |= PLL_RESET;
> +	writel(val, base + RESET);
> +}
> +
> +static void rzg2l_usbphy_ctrl_release_reset(struct reset_controller_dev *rcdev,
> +					    unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
> +	void __iomem *base = priv->base;
> +	u32 val = readl(base + RESET);
> +
> +	val |= SEL_PLLRESET;
> +	val &= ~(PLL_RESET | (id ? PHY_RESET_PORT2 : PHY_RESET_PORT1));
> +	writel(val, base + RESET);
> +}
> +
> +static int rzg2l_usbphy_ctrl_reset(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	rzg2l_usbphy_ctrl_set_reset(rcdev, id);
> +	rzg2l_usbphy_ctrl_release_reset(rcdev, id);
> +	return 0;
> +}

No delay is needed between assert and deassert to reset the PHY?
Is this used at all? The probe function putting everything into reset
makes it look like the USB drivers will only use reset_control_assert()
/ _deassert(), not _reset(). If not, I'd suggest dropping it and folding
the above set/release functions into assert/deassert below.

> +
> +static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	rzg2l_usbphy_ctrl_set_reset(rcdev, id);
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev,
> +				      unsigned long id)
> +{
> +	rzg2l_usbphy_ctrl_release_reset(rcdev, id);
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
> +	u32 port_mask;
> +
> +	port_mask = id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
> +
> +	return !!(readl(priv->base + RESET) & port_mask);

Should this check that both bits of the port_mask are set?

> +}
> +
> +static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
> +	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
> +	{ /* Sentinel */ }
> +};rzg2l_usbphy_ctrl_register
> +MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
> +
> +static const struct reset_control_ops rzg2l_usbphy_ctrl_reset_ops = {
> +	.reset = rzg2l_usbphy_ctrl_reset,
> +	.assert = rzg2l_usbphy_ctrl_assert,
> +	.deassert = rzg2l_usbphy_ctrl_deassert,
> +	.status = rzg2l_usbphy_ctrl_status,
> +};
> +
> +static int rzg2l_usbphy_ctrl_xlate(struct reset_controller_dev *rcdev,
> +				   const struct of_phandle_args *reset_spec)
> +{
> +	unsigned int id = reset_spec->args[0];
> +
> +	if (id >= NUM_PORTS) {
> +		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
> +		return -EINVAL;
> +	}
> +
> +	return id;
> +}

This can be dropped if you set rcdev->nr_resets = NUM_PORTS, see
of_reset_simple_xlate().

> +
> +static int rzg2l_usbphy_ctrl_register(struct rzg2l_usbphy_ctrl_priv *priv)
> +{
> +	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
> +	priv->rcdev.of_node = priv->dev->of_node;
> +	priv->rcdev.dev = priv->dev;
> +	priv->rcdev.of_reset_n_cells = 1;
> +	priv->rcdev.of_xlate = rzg2l_usbphy_ctrl_xlate;

Just set nr_resets instead of of_xlate, see above.

> +
> +	return devm_reset_controller_register(priv->dev, &priv->rcdev);
> +}
> +
> +static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg2l_usbphy_ctrl_priv *priv;
> +	int error;
> +	u32 val;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->dev = dev;
> +	error = rzg2l_usbphy_ctrl_register(priv);
> +	if (error)
> +		return error;

This should be done after requesting the reset.

> +
> +	dev_set_drvdata(dev, priv);
> +
> +	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

Does the <&cpg R9A07G044_USB_PRESETN> reset reset only the USBPHY
control?

> +	if (IS_ERR(priv->rstc)) {
> +		dev_err(&pdev->dev, "failed to get reset\n");
> +		return PTR_ERR(priv->rstc);

This could be simplified with

		return dev_err_probe(dev, PTR_ERR(priv->rstc), "failed to get reset\n");

> +	}
> +
> +	reset_control_deassert(priv->rstc);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_resume_and_get(&pdev->dev);

The &cpg power domain has to be kept enabled during the whole lifetime
of the reset controller?

> +
> +	/* put pll and phy into reset state */
> +	val = readl(priv->base + RESET);
> +	val |= SEL_PLLRESET | PLL_RESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
> +	writel(val, priv->base + RESET);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	reset_control_assert(priv->rstc);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver rzg2l_usbphy_ctrl_driver = {
> +	.driver = {
> +		.name		= "rzg2l_usbphy_ctrl",
> +		.of_match_table	= rzg2l_usbphy_ctrl_match_table,
> +	},
> +	.probe	=  rzg2l_usbphy_ctrl_probe,
> +	.remove	=  rzg2l_usbphy_ctrl_remove,
> +};
> +module_platform_driver(rzg2l_usbphy_ctrl_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
> +MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");

regards
Philipp
