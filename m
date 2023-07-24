Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B3975F64D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jul 2023 14:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjGXM2q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jul 2023 08:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjGXM2c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2023 08:28:32 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D6CE67
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jul 2023 05:28:28 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6687446eaccso4051225b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jul 2023 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690201708; x=1690806508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5ozJZv+ZHqM9kINn5bRsqhkicjxCccr58G153M0VKk=;
        b=IhFSYBRumsFAvKhM0LlcvIDIwbp2M2uFaJrHqfIpykLVdHclu7WL3N/Op/vuM54EjB
         5DaaI2/EUpEnZxz20ZtGSL/GGndifNLDn4gV0cArSHgJ/oZivPbLBlLHhXrHCoBj2NxU
         beOE8hn506pd7yPY7hcaJQseZl62oHhikl3mr7dnqNBTo63EEScOoMethf2SNJ66UKIV
         wPSZyRE6h0gbjmg4FXI1kAQaPT+I+FCj+gQ5bUx/QdD+W690DOSkZ/udKL5hl335g+NP
         Xe5SQZQRRMkAvmZ8Exz6OTPTcugd4thAXv7SWrRXwYfKq/t+kdr5uc8V3jTdvVdKTqn0
         0L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690201708; x=1690806508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5ozJZv+ZHqM9kINn5bRsqhkicjxCccr58G153M0VKk=;
        b=G9TsZv1L0Dhv9PZ10TUjm7EXn+VdW+XcXbvIh7wvUbOBkSHP0lvk3utGeZax5ZFlI4
         Fm9C3nDwBfMLSGJm4M68mqnPcvLK4tkscqWgu4DFgGo+NJ/5e1Wem5cKuBe+Kd0g3+s8
         qRivu5Imi+XdnKjlqFttzXqiUenBOCwxweJT5NCW77lSPARLiPF0HEJqI/AFPUgDuzyO
         Kadig15mhR4I2/NacaBqJ2ttbi2IM72zKF4JePCb8IlMfuW60Z5iN7p8WRN7rS6mu5m3
         wzi4yJffAj6SzoHP1CrmC/rWb0YxOjXwqY9hdXyGcD6+cOtnG4/NQBQppwO8HfBAjDyp
         ULtA==
X-Gm-Message-State: ABy/qLYrvyrmo00PZqlutUccdctOkvoVt6vEr6Va8MdUz80KoTZV3W5J
        Dua3D5QhTGLDFy4mRpUcC90g
X-Google-Smtp-Source: APBJJlHh8XNEzC9/dk0yH06gQR22dN4LKfLpX97zWE8JG1NNCZ9pZgURaD0J+f9lK2rYehPyFL1TBQ==
X-Received: by 2002:a05:6a20:26a5:b0:105:6d0e:c046 with SMTP id h37-20020a056a2026a500b001056d0ec046mr10509464pze.26.1690201708209;
        Mon, 24 Jul 2023 05:28:28 -0700 (PDT)
Received: from thinkpad ([117.206.118.29])
        by smtp.gmail.com with ESMTPSA id g8-20020aa78188000000b00682a908949bsm7814123pfi.92.2023.07.24.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 05:28:27 -0700 (PDT)
Date:   Mon, 24 Jul 2023 17:58:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
        lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        marek.vasut+renesas@gmail.com, fancer.lancer@gmail.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v18 17/20] PCI: rcar-gen4: Add R-Car Gen4 PCIe Host
 support
Message-ID: <20230724122820.GM6291@thinkpad>
References: <20230721074452.65545-1-yoshihiro.shimoda.uh@renesas.com>
 <20230721074452.65545-18-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721074452.65545-18-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 21, 2023 at 04:44:49PM +0900, Yoshihiro Shimoda wrote:
> Add R-Car Gen4 PCIe Host support. This controller is based on
> Synopsys DesignWare PCIe, but this controller has vendor-specific
> registers so that requires initialization code like mode setting
> and retraining and so on.
> 
> To reduce code delta, adds some helper functions which are used by
> both the host driver and the endpoint driver (which is added
> immediately afterwards) into a separate file.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pci/controller/dwc/Kconfig            |   9 +
>  drivers/pci/controller/dwc/Makefile           |   2 +
>  .../pci/controller/dwc/pcie-rcar-gen4-host.c  | 149 +++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 200 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.h   |  44 ++++
>  5 files changed, 404 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.h
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index ab96da43e0c2..64d4d37bc891 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -415,4 +415,13 @@ config PCIE_VISCONTI_HOST
>  	  Say Y here if you want PCIe controller support on Toshiba Visconti SoC.
>  	  This driver supports TMPV7708 SoC.
>  
> +config PCIE_RCAR_GEN4
> +	tristate "Renesas R-Car Gen4 PCIe Host controller"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on PCI_MSI
> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here if you want PCIe host controller support on R-Car Gen4 SoCs.

Add a line about module option and specify the module name. Like,

To compile this driver as a module, choose M here: the module will be called
pcie-rcar-gen4-host-drv.ko.

I have a suggestion for module name change below...

> +	  This uses the DesignWare core.
> +
>  endmenu
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index bf5c311875a1..486cf706b53d 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -26,6 +26,8 @@ obj-$(CONFIG_PCIE_TEGRA194) += pcie-tegra194.o
>  obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
>  obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
>  obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
> +pcie-rcar-gen4-host-drv-objs := pcie-rcar-gen4.o pcie-rcar-gen4-host.o
> +obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4-host-drv.o

It'd be better to call the module as pcie-rcar-gen4-host and the file as
pcie-rcar-gen4-host-drv.c

Also, move the goal definition first.

>  
>  # The following drivers are for devices that use the generic ACPI
>  # pci_root.c driver but don't support standard ECAM config access.
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
> new file mode 100644
> index 000000000000..3168f5d98a79
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PCIe host controller driver for Renesas R-Car Gen4 Series SoCs
> + * Copyright (C) 2022-2023 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +
> +#include "pcie-rcar-gen4.h"
> +#include "pcie-designware.h"
> +
> +static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	int ret;
> +	u32 val;
> +
> +	gpiod_set_value_cansleep(dw->pe_rst, 1);
> +
> +	ret = clk_bulk_prepare_enable(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
> +	if (ret) {
> +		dev_err(dw->dev, "Failed to enable ref clocks\n");
> +		return ret;
> +	}
> +
> +	ret = rcar_gen4_pcie_basic_init(rcar);
> +	if (ret < 0) {

Use "if (ret)" for consistency.

> +		clk_bulk_disable_unprepare(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
> +		return ret;
> +	}
> +
> +	/*
> +	 * According to the section 3.5.7.2 "RC Mode" in DWC PCIe Dual Mode
> +	 * Rev.5.20a, we should disable two BARs to avoid unnecessary memory
> +	 * assignment during device enumeration.
> +	 */
> +	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
> +	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {

Driver depends on PCI_MSI, so there is no need of this check.

> +		/* Enable MSI interrupt signal */
> +		val = readl(rcar->base + PCIEINTSTS0EN);
> +		val |= MSI_CTRL_INT;
> +		writel(val, rcar->base + PCIEINTSTS0EN);
> +	}
> +
> +	msleep(100);	/* pe_rst requires 100msec delay */
> +
> +	gpiod_set_value_cansleep(dw->pe_rst, 0);
> +
> +	return 0;
> +}
> +
> +static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +
> +	gpiod_set_value_cansleep(dw->pe_rst, 1);
> +	rcar_gen4_pcie_basic_deinit(rcar);
> +	clk_bulk_disable_unprepare(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
> +}
> +
> +static const struct dw_pcie_host_ops rcar_gen4_pcie_host_ops = {
> +	.host_init = rcar_gen4_pcie_host_init,
> +	.host_deinit = rcar_gen4_pcie_host_deinit,
> +};
> +
> +static int rcar_gen4_add_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
> +{
> +	struct dw_pcie_rp *pp = &rcar->dw.pp;
> +
> +	pp->num_vectors = MAX_MSI_IRQS;
> +	pp->ops = &rcar_gen4_pcie_host_ops;
> +	rcar->mode = DW_PCIE_RC_TYPE;
> +
> +	return dw_pcie_host_init(pp);
> +}
> +
> +static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
> +{
> +	dw_pcie_host_deinit(&rcar->dw.pp);
> +	gpiod_set_value_cansleep(rcar->dw.pe_rst, 1);
> +}
> +
> +static int rcar_gen4_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rcar_gen4_pcie *rcar;
> +	int err;
> +
> +	rcar = rcar_gen4_pcie_devm_alloc(pdev);
> +	if (!rcar)
> +		return -ENOMEM;
> +
> +	err = rcar_gen4_pcie_get_resources(rcar);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to request resource: %d\n", err);

Use dev_err_probe().

> +		return err;
> +	}
> +
> +	err = rcar_gen4_pcie_prepare(rcar);
> +	if (err < 0)
> +		return err;
> +
> +	err = rcar_gen4_add_dw_pcie_rp(rcar);
> +	if (err < 0)
> +		goto err_add;
> +
> +	return 0;
> +
> +err_add:

err_prepare

> +	rcar_gen4_pcie_unprepare(rcar);
> +
> +	return err;
> +}
> +
> +static void rcar_gen4_pcie_remove(struct platform_device *pdev)
> +{
> +	struct rcar_gen4_pcie *rcar = platform_get_drvdata(pdev);
> +
> +	rcar_gen4_remove_dw_pcie_rp(rcar);
> +	rcar_gen4_pcie_unprepare(rcar);
> +}
> +
> +static const struct of_device_id rcar_gen4_pcie_of_match[] = {
> +	{ .compatible = "renesas,rcar-gen4-pcie", },
> +	{},
> +};

Missing MODULE_DEVICE_TABLE since this driver can be built as a module.

> +
> +static struct platform_driver rcar_gen4_pcie_driver = {
> +	.driver = {
> +		.name = "pcie-rcar-gen4",
> +		.of_match_table = rcar_gen4_pcie_of_match,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe = rcar_gen4_pcie_probe,
> +	.remove_new = rcar_gen4_pcie_remove,
> +};
> +module_platform_driver(rcar_gen4_pcie_driver);
> +
> +MODULE_DESCRIPTION("Renesas R-Car Gen4 PCIe host controller driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> new file mode 100644
> index 000000000000..a5fb9aae0a6f
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PCIe host/endpoint controller driver for Renesas R-Car Gen4 Series SoCs
> + * Copyright (C) 2022-2023 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/pci.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include "pcie-rcar-gen4.h"
> +#include "pcie-designware.h"
> +
> +/* Renesas-specific */
> +#define PCIERSTCTRL1		0x0014
> +#define  APP_HOLD_PHY_RST	BIT(16)

Spacing is not consistent.

> +#define  APP_LTSSM_ENABLE	BIT(0)
> +
> +#define RCAR_NUM_SPEED_CHANGE_RETRIES	10
> +#define RCAR_MAX_LINK_SPEED		4
> +
> +static void rcar_gen4_pcie_ltssm_enable(struct rcar_gen4_pcie *rcar,
> +					bool enable)
> +{
> +	u32 val;
> +
> +	val = readl(rcar->base + PCIERSTCTRL1);
> +	if (enable) {
> +		val |= APP_LTSSM_ENABLE;
> +		val &= ~APP_HOLD_PHY_RST;
> +	} else {
> +		/*
> +		 * Since the datasheet of R-Car doesn't mention how to assert
> +		 * the APP_HOLD_PHY_RST, don't assert it again. Otherwise,
> +		 * hang-up issue happened in the dw_edma_core_off() when
> +		 * the controller didn't detect a PCI device.
> +		 */
> +		val &= ~APP_LTSSM_ENABLE;
> +	}
> +	writel(val, rcar->base + PCIERSTCTRL1);
> +}
> +
> +static int rcar_gen4_pcie_link_up(struct dw_pcie *dw)
> +{
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	u32 val, mask;
> +
> +	val = readl(rcar->base + PCIEINTSTS0);
> +	mask = RDLH_LINK_UP | SMLH_LINK_UP;
> +
> +	return (val & mask) == mask;
> +}
> +
> +static bool rcar_gen4_pcie_speed_change(struct dw_pcie *dw)

It'd be good to add a comment for this function.

> +{
> +	u32 val;
> +	int i;
> +
> +	val = dw_pcie_readl_dbi(dw, PCIE_LINK_WIDTH_SPEED_CONTROL);
> +	val &= ~PORT_LOGIC_SPEED_CHANGE;
> +	dw_pcie_writel_dbi(dw, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
> +
> +	val = dw_pcie_readl_dbi(dw, PCIE_LINK_WIDTH_SPEED_CONTROL);
> +	val |= PORT_LOGIC_SPEED_CHANGE;
> +	dw_pcie_writel_dbi(dw, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
> +
> +	for (i = 0; i < RCAR_NUM_SPEED_CHANGE_RETRIES; i++) {
> +		val = dw_pcie_readl_dbi(dw, PCIE_LINK_WIDTH_SPEED_CONTROL);
> +		if (!(val & PORT_LOGIC_SPEED_CHANGE))
> +			return true;
> +		usleep_range(10000, 11000);
> +	}
> +
> +	return false;
> +}
> +
> +static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)

For this one too.

> +{
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	int i, changes;
> +
> +	rcar_gen4_pcie_ltssm_enable(rcar, true);
> +
> +	/*
> +	 * Require direct speed change with retrying here if the link_gen is
> +	 * PCIe Gen2 or higher.
> +	 */
> +	changes = min_not_zero(dw->link_gen, RCAR_MAX_LINK_SPEED) - 1;
> +
> +	/*
> +	 * Since dw_pcie_setup_rc() sets it once, PCIe Gen2 will be trained.
> +	 * So, this needs remaining times for up to PCIe Gen4 if RC mode.
> +	 */
> +	if (changes && rcar->mode == DW_PCIE_RC_TYPE)
> +		changes--;
> +
> +	for (i = 0; i < changes; i++) {
> +		if (!rcar_gen4_pcie_speed_change(dw))
> +			break;	/* No error because possible disconnected here if EP mode */
> +	}
> +
> +	return 0;
> +}
> +
> +static void rcar_gen4_pcie_stop_link(struct dw_pcie *dw)
> +{
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +
> +	rcar_gen4_pcie_ltssm_enable(rcar, false);
> +}
> +
> +int rcar_gen4_pcie_basic_init(struct rcar_gen4_pcie *rcar)

s/basic/common

- Mani

> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +	u32 val;
> +
> +	if (!reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc))
> +		reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
> +
> +	val = readl(rcar->base + PCIEMSR0);
> +	if (rcar->mode == DW_PCIE_RC_TYPE)
> +		val |= DEVICE_TYPE_RC;
> +	else if (rcar->mode == DW_PCIE_EP_TYPE)
> +		val |= DEVICE_TYPE_EP;
> +	else
> +		return -EINVAL;
> +
> +	if (dw->num_lanes < 4)
> +		val |= BIFUR_MOD_SET_ON;
> +
> +	writel(val, rcar->base + PCIEMSR0);
> +
> +	return reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
> +}
> +
> +void rcar_gen4_pcie_basic_deinit(struct rcar_gen4_pcie *rcar)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +
> +	reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
> +}
> +
> +int rcar_gen4_pcie_prepare(struct rcar_gen4_pcie *rcar)
> +{
> +	struct device *dev = rcar->dw.dev;
> +	int err;
> +
> +	pm_runtime_enable(dev);
> +	err = pm_runtime_resume_and_get(dev);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to resume/get Runtime PM\n");
> +		pm_runtime_disable(dev);
> +	}
> +
> +	return err;
> +}
> +
> +void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
> +{
> +	struct device *dev = rcar->dw.dev;
> +
> +	pm_runtime_put(dev);
> +	pm_runtime_disable(dev);
> +}
> +
> +int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
> +{
> +	/* Renesas-specific registers */
> +	rcar->base = devm_platform_ioremap_resource_byname(rcar->pdev, "app");
> +
> +	return IS_ERR(rcar->base) ? PTR_ERR(rcar->base) : 0;
> +}
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = rcar_gen4_pcie_start_link,
> +	.stop_link = rcar_gen4_pcie_stop_link,
> +	.link_up = rcar_gen4_pcie_link_up,
> +};
> +
> +struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rcar_gen4_pcie *rcar;
> +
> +	rcar = devm_kzalloc(dev, sizeof(*rcar), GFP_KERNEL);
> +	if (!rcar)
> +		return NULL;
> +
> +	rcar->dw.dev = dev;
> +	rcar->dw.ops = &dw_pcie_ops;
> +	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
> +	dw_pcie_cap_set(&rcar->dw, REQ_RES);
> +	rcar->pdev = pdev;
> +	platform_set_drvdata(pdev, rcar);
> +
> +	return rcar;
> +}
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.h b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
> new file mode 100644
> index 000000000000..781165422739
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * PCIe host/endpoint controller driver for Renesas R-Car Gen4 Series SoCs
> + * Copyright (C) 2022-2023 Renesas Electronics Corporation
> + */
> +
> +#ifndef _PCIE_RCAR_GEN4_H_
> +#define _PCIE_RCAR_GEN4_H_
> +
> +#include <linux/io.h>
> +#include <linux/pci.h>
> +
> +#include "pcie-designware.h"
> +
> +/* Renesas-specific */
> +#define PCIEMSR0		0x0000
> +#define  BIFUR_MOD_SET_ON	BIT(0)
> +#define  DEVICE_TYPE_EP		0
> +#define  DEVICE_TYPE_RC		BIT(4)
> +
> +#define PCIEINTSTS0		0x0084
> +#define PCIEINTSTS0EN		0x0310
> +#define  MSI_CTRL_INT		BIT(26)
> +#define  SMLH_LINK_UP		BIT(7)
> +#define  RDLH_LINK_UP		BIT(6)
> +#define PCIEDMAINTSTSEN		0x0314
> +#define  PCIEDMAINTSTSEN_INIT	GENMASK(15, 0)
> +
> +struct rcar_gen4_pcie {
> +	struct dw_pcie dw;
> +	void __iomem *base;
> +	struct platform_device *pdev;
> +	enum dw_pcie_device_mode mode;
> +};
> +#define to_rcar_gen4_pcie(_dw)	container_of(_dw, struct rcar_gen4_pcie, dw)
> +
> +int rcar_gen4_pcie_basic_init(struct rcar_gen4_pcie *rcar);
> +void rcar_gen4_pcie_basic_deinit(struct rcar_gen4_pcie *rcar);
> +int rcar_gen4_pcie_prepare(struct rcar_gen4_pcie *rcar);
> +void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar);
> +int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar);
> +struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct platform_device *pdev);
> +
> +#endif /* _PCIE_RCAR_GEN4_H_ */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
