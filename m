Return-Path: <linux-renesas-soc+bounces-14330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21482A5EE27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 09:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3847F3A3918
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75DA1FAC57;
	Thu, 13 Mar 2025 08:37:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5F26136A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Mar 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855039; cv=none; b=h3zubEC0U540Bj7zpmXE4fEQ8WnDC+zho2RxGSZvabPSGebo5RzvKljx3r0R3/C/YFcve0XNEcZqLzFPCOqBqucSD190rJWFZfL9HYKmKWxwMi7WXf7WmYmZZKKFV2UMCw+3oCdHsWllr0zLnN19uCJixXdXYiR4nWZhgqDcEio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855039; c=relaxed/simple;
	bh=HZEIsCns7sqTp7Ma0UvCw0qlrrLhGqA4e7H2SdN/8+c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cnV4lFybu4a11w3zgnl3fKUXyY9LIMDBkNoY5HouRT+hmzcS6qQqx0mxqwtqJ7jJ0+tV34oRVAbbQB0gIKviCdWSy/hEdXhJPVNR8aw7kX/A7vUmXFIqRU36EqQy28acHSrniipI8JgdNeO9BluDkO6uGRlsau23D3+4+530XrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse3r-0007kx-Fj; Thu, 13 Mar 2025 09:37:03 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse3q-005VPv-1G;
	Thu, 13 Mar 2025 09:37:02 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse3q-0003Jw-1B;
	Thu, 13 Mar 2025 09:37:02 +0100
Message-ID: <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 13 Mar 2025 09:37:02 +0100
In-Reply-To: <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Mi, 2025-03-05 at 12:39 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for the USB2PHY control driver on the Renesas RZ/V2H(P) SoC.
> Make the driver handle reset and power-down operations for the USB2PHY.
>=20
> Pass OF data to support future SoCs with similar USB2PHY hardware but
> different register configurations. Define device-specific initialization
> values and control register settings in OF data to ensure flexibility
> for upcoming SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/reset/Kconfig                    |   7 +
>  drivers/reset/Makefile                   |   1 +
>  drivers/reset/reset-rzv2h-usb2phy-ctrl.c | 223 +++++++++++++++++++++++
>  3 files changed, 231 insertions(+)
>  create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5b3abb6db248..bac08dae8905 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -218,6 +218,13 @@ config RESET_RZG2L_USBPHY_CTRL
>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>  	  controls reset and power down of the USB/PHY.
> =20
> +config RESET_RZV2H_USB2PHY_CTRL
> +	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY control driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Support for USB2PHY Control found on the RZ/V2H(P) SoC (and similar S=
oCs).
> +	  It mainly controls reset and power down of the USB2 PHY.
> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 677c4d1e2632..3cb3df018cf8 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
>  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> +obj-$(CONFIG_RESET_RZV2H_USB2PHY_CTRL) +=3D reset-rzv2h-usb2phy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> diff --git a/drivers/reset/reset-rzv2h-usb2phy-ctrl.c b/drivers/reset/res=
et-rzv2h-usb2phy-ctrl.c
> new file mode 100644
> index 000000000000..a6daeaf37e1c
> --- /dev/null
> +++ b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB2PHY control driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +struct rzv2h_usb2phy_regval {
> +	u16 reg;
> +	u16 val;
> +};
> +
> +struct rzv2h_usb2phy_data {
> +	const struct rzv2h_usb2phy_regval *init_vals;
> +	unsigned int init_val_count;
> +
> +	u16 ctrl_reg;
> +	u16 ctrl_assert_val;
> +	u16 ctrl_deassert_val;
> +	u16 ctrl_status_bits;
> +	u16 ctrl_release_val;
> +
> +	u16 ctrl2_reg;
> +	u16 ctrl2_acquire_val;
> +	u16 ctrl2_release_val;
> +};
> +
> +struct rzv2h_usb2phy_ctrl_priv {
> +	const struct rzv2h_usb2phy_data *data;
> +	void __iomem *base;
> +	struct device *dev;
> +	struct reset_controller_dev rcdev;
> +	spinlock_t lock;

Lock without comment.

> +};
> +
> +#define rcdev_to_priv(x) container_of(x, struct rzv2h_usb2phy_ctrl_priv,=
 rcdev)

I'd prefer this to be an inline function.

> +
> +static int rzv2h_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	const struct rzv2h_usb2phy_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->ctrl2_acquire_val, priv->base + data->ctrl2_reg);

Comparing to deassert, I wonder why is there no ctrl_acquire_val?

> +		writel(data->ctrl_assert_val, priv->base + data->ctrl_reg);
> +	}
> +
> +	/* The reset line needs to be asserted for more than 10 microseconds. *=
/
> +	udelay(11);

Could this be usleep_range() instead?

> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	const struct rzv2h_usb2phy_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->ctrl_deassert_val, priv->base + data->ctrl_reg);
> +		writel(data->ctrl2_release_val, priv->base + data->ctrl2_reg);
> +		writel(data->ctrl_release_val, priv->base + data->ctrl_reg);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock)
> +		reg =3D readl(priv->base + priv->data->ctrl_reg);
> +
> +	pm_runtime_put(dev);
> +
> +	return (reg & priv->data->ctrl_status_bits) =3D=3D priv->data->ctrl_sta=
tus_bits;
> +}
> +
> +static const struct reset_control_ops rzv2h_usbphy_ctrl_reset_ops =3D {
> +	.assert =3D rzv2h_usbphy_ctrl_assert,
> +	.deassert =3D rzv2h_usbphy_ctrl_deassert,
> +	.status =3D rzv2h_usbphy_ctrl_status,
> +};
> +
> +static int rzv2h_reset_of_xlate(struct reset_controller_dev *rcdev,
> +				const struct of_phandle_args *reset_spec)
> +{
> +	/* No special handling needed, we have only one reset line per device *=
/
> +	return 0;
> +}
> +
> +static int rzv2h_usb2phy_ctrl_probe(struct platform_device *pdev)
> +{
> +	const struct rzv2h_usb2phy_data *data;
> +	struct rzv2h_usb2phy_ctrl_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rstc;
> +	int error;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to match device\n");
> +
> +	priv->data =3D data;
> +	priv->dev =3D dev;
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get deasserted reset\n");
> +
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	error =3D devm_pm_runtime_enable(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
> +
> +	error =3D pm_runtime_resume_and_get(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n")=
;
> +
> +	for (unsigned int i =3D 0; i < data->init_val_count; i++)
> +		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +
> +	pm_runtime_put(dev);
> +
> +	priv->rcdev.ops =3D &rzv2h_usbphy_ctrl_reset_ops;
> +	priv->rcdev.of_reset_n_cells =3D 0;
> +	priv->rcdev.nr_resets =3D 1;
> +	priv->rcdev.of_xlate =3D rzv2h_reset_of_xlate;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.dev =3D dev;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
> +	{ .reg =3D 0xc10, .val =3D 0x67c },
> +	{ .reg =3D 0xc14, .val =3D 0x1f },
> +	{ .reg =3D 0x600, .val =3D 0x909 },

What are these registers and what are those values doing?

> +};
> +
> +static const struct rzv2h_usb2phy_data rzv2h_of_data =3D {
> +	.init_vals =3D rzv2h_init_vals,
> +	.init_val_count =3D ARRAY_SIZE(rzv2h_init_vals),
> +	.ctrl_reg =3D 0,
> +	.ctrl_assert_val =3D 0x206,
> +	.ctrl_status_bits =3D BIT(2),
> +	.ctrl_deassert_val =3D 0x200,
> +	.ctrl_release_val =3D 0x0,
> +	.ctrl2_reg =3D 0xb04,
> +	.ctrl2_acquire_val =3D 0x303,
> +	.ctrl2_release_val =3D 0x3,

This is really opaque. I would have expected some defines for the
register bits (or fields?) at least.

> +};
> +
> +static const struct of_device_id rzv2h_usb2phy_ctrl_match_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-usb2phy-ctrl", .data =3D &rzv2h_of=
_data },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_ctrl_match_table);
> +
> +static struct platform_driver rzv2h_usb2phy_ctrl_driver =3D {
> +	.driver =3D {
> +		.name		=3D "rzv2h_usb2phy_ctrl",
> +		.of_match_table	=3D rzv2h_usb2phy_ctrl_match_table,
> +	},
> +	.probe =3D rzv2h_usb2phy_ctrl_probe,
> +};
> +module_platform_driver(rzv2h_usb2phy_ctrl_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>")=
;
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");

regards
Philipp


