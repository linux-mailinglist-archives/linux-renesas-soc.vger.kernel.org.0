Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1E7698359
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 19:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjBOSdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 13:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjBOSdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 13:33:23 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5616438EB6;
        Wed, 15 Feb 2023 10:33:21 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id br9so28735012lfb.4;
        Wed, 15 Feb 2023 10:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwK1CeQcD7PTyPEtUw2+TbbavrmUSLqpBoRr08x6cQE=;
        b=oacW80ocmEAaWKH48jK70lqSp92o2dWvZ59R6yee/LIhjXWnKx9LgEJpFWvRM8SkzH
         HW59ZuKnWQeNf3lj8kfxBCYjlgDpfneqKBcyN+hDldLLREg7kFmSHXVpD5NcpY4TcKor
         EFel36lwNCTCKtDt/loS621Sm+nPNWEfwXI2Pdccko8TOMm4hZqgVttgFzyzYGYxZxiU
         mQRQPaxETdWcRPoSti9Hqtvy8rUxHxhWsf/+d8gw8gZVDWXpLZUtG2XC+NoR+4n1PoLy
         M937y0os/fH27eDnIOC2S3V4Pc+qsQ2zSZqq8F6BuEUnfXYNUkH5EIopa+2Jc9Eh4iBF
         +t6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwK1CeQcD7PTyPEtUw2+TbbavrmUSLqpBoRr08x6cQE=;
        b=AV9XWYdM2QHJPOr8Qz50l3acI6yfX3kKkeFLubtDqGc4hiC9o1aFmyyYxhqysAhcyM
         G0HAyIK3e3HQBtZ17OPPKpqOMOGLpukkuf9iBU9hYEhWO6qPh63rBNaZjTYQc7tuH568
         uE+bPoiTvxjyFW+bjtlSuET9pWIBK8hR/8cPUTgCFwfH4lzSiItsDxreKppYOvzWGCjJ
         Y5ZIvETQAYf31djVtyFosg2V8x6Dw5KU5UY4Hf/z2ZXZDYiqGyEQlnzktMIgw0OHqkCG
         BoC6/zLYIyw5/w3E1js1d354sBFMXt8G6emzsGaFF+Ol1d7DZEyBvPbq7BABLh9V5YH7
         1Saw==
X-Gm-Message-State: AO0yUKVjutVWxipDU29fkJnBpSaZep8k4jfqE9cWeQR6o08yYTG5sw5n
        TJppTfDEL4cl+aJtkK7YyMYTpYAaTvk=
X-Google-Smtp-Source: AK7set8B0aswM+CSTlLzsD2838yzpFrINZA0I9mFhXpQg4yS1xq9l7bBScUw7QPHZA2JAZ3qZ3IneQ==
X-Received: by 2002:a05:6512:924:b0:4d8:8273:ec with SMTP id f4-20020a056512092400b004d8827300ecmr715403lft.20.1676485999418;
        Wed, 15 Feb 2023 10:33:19 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id y22-20020ac24476000000b004dc12a7e03bsm160224lfl.222.2023.02.15.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 10:33:18 -0800 (PST)
Date:   Wed, 15 Feb 2023 21:33:16 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, Sergey.Semin@baikalelectronics.ru,
        marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 6/8] PCI: rcar-gen4: Add R-Car Gen4 PCIe Host support
Message-ID: <20230215183316.smkcg3qli4savkks@mobilestation>
References: <20230210134917.2909314-1-yoshihiro.shimoda.uh@renesas.com>
 <20230210134917.2909314-7-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210134917.2909314-7-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 10:49:15PM +0900, Yoshihiro Shimoda wrote:
> Add R-Car Gen4 PCIe Host support. This controller is based on
> Synopsys DesignWare PCIe.
> 
> This controller doesn't support MSI-X interrupt. So, introduce
> no_msix flag in struct dw_pcie_host_ops to clear MSI_FLAG_PCI_MSIX
> from dw_pcie_msi_domain_info.
> 

> Note that this controller on R-Car S4-8 has an unexpected register
> value on the dbi+0x97b register. So, add a new capability flag
> which would force the unrolled eDMA mapping for the problematic
> device, as suggested by Serge Semin.

Please move the noted fix to a separate pre-requisite patch seeing your
update depends on it. Thus this patch will be a bit simpler to review
with no harm to the changes atomicity.

> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pci/controller/dwc/Kconfig            |   9 +
>  drivers/pci/controller/dwc/Makefile           |   2 +
>  .../pci/controller/dwc/pcie-designware-host.c |   3 +
>  drivers/pci/controller/dwc/pcie-designware.c  |   8 +-
>  drivers/pci/controller/dwc/pcie-designware.h  |   6 +-
>  .../pci/controller/dwc/pcie-rcar-gen4-host.c  | 165 +++++++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 166 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.h   |  63 +++++++
>  8 files changed, 419 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.h
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 434f6a4f4041..94805ec31a8f 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -414,4 +414,13 @@ config PCIE_FU740
>  	  Say Y here if you want PCIe controller support for the SiFive
>  	  FU740.
>  
> +config PCIE_RCAR_GEN4
> +	tristate "Renesas R-Car Gen4 PCIe Host controller"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on PCI_MSI
> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here if you want PCIe host controller support on R-Car Gen4 SoCs.
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
>  
>  # The following drivers are for devices that use the generic ACPI
>  # pci_root.c driver but don't support standard ECAM config access.
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 9952057c8819..5aefeec15c9b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -242,6 +242,9 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
>  
>  	irq_domain_update_bus_token(pp->irq_domain, DOMAIN_BUS_NEXUS);
>  

> +	if (pp->no_msix)
> +		dw_pcie_msi_domain_info.flags &= ~MSI_FLAG_PCI_MSIX;

Changing static data field in the probe path doesn't seem like
correct. Is it really that necessary to clear out that flag? The rest
of the LLDDs don't seem to be bothered with that (mine included). On
the other hand it seems to me that the iMSI-RX engine doesn't really
support true MSI-X messages. It always stick to a single base address
with up to 256 IRQs in total and up to 32 IRQs per function. Do you
suggest to drop that flag then for all DW PCIe hosts or just for ones
with iMSI-RX engine in-use or just forget about it?

@Rob, @Bjorn?

> +
>  	pp->msi_domain = pci_msi_create_irq_domain(fwnode,
>  						   &dw_pcie_msi_domain_info,
>  						   pp->irq_domain);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index b4315cf84340..7d649ba387f8 100644

> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -847,8 +847,14 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
>  	 * Indirect eDMA CSRs access has been completely removed since v5.40a
>  	 * thus no space is now reserved for the eDMA channels viewport and
>  	 * former DMA CTRL register is no longer fixed to FFs.
> +	 *
> +	 * Note some devices for unknown reason may have zeros in the eDMA CTRL
> +	 * register even though the HW-manual explicitly states there must FFs
> +	 * if the unrolled mapping is enabled. For such cases the low-level
> +	 * drivers are supposed to manually activate the unrolled mapping to
> +	 * bypass the auto-detection procedure.
>  	 */
> -	if (dw_pcie_ver_is_ge(pci, 540A))
> +	if (dw_pcie_ver_is_ge(pci, 540A) || dw_pcie_cap_is(pci, EDMA_UNROLL))
>  		val = 0xFFFFFFFF;
>  	else
>  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);

As I suggested in the head of this message please move this to a
separate pre-requisite patch.

> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 1a6e7e9489ee..1b1af514b849 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -51,8 +51,9 @@
>  
>  /* DWC PCIe controller capabilities */
>  #define DW_PCIE_CAP_REQ_RES		0

> -#define DW_PCIE_CAP_IATU_UNROLL		1
> -#define DW_PCIE_CAP_CDM_CHECK		2
> +#define DW_PCIE_CAP_EDMA_UNROLL		1
> +#define DW_PCIE_CAP_IATU_UNROLL		2
> +#define DW_PCIE_CAP_CDM_CHECK		3

ditto

>  
>  #define dw_pcie_cap_is(_pci, _cap) \
>  	test_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
> @@ -303,6 +304,7 @@ struct dw_pcie_host_ops {
>  struct dw_pcie_rp {
>  	bool			has_msi_ctrl:1;
>  	bool			cfg0_io_shared:1;
> +	bool			no_msix:1;
>  	u64			cfg0_base;
>  	void __iomem		*va_cfg0_base;
>  	u32			cfg0_size;
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
> new file mode 100644
> index 000000000000..d60f4895ffe9
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PCIe host controller driver for Renesas R-Car Gen4 Series SoCs
> + * Copyright (C) 2022-2023 Renesas Electronics Corporation
> + */
> +
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
> +	ret = rcar_gen4_pcie_set_device_type(rcar, true, dw->num_lanes);
> +	if (ret < 0)
> +		return ret;
> +
> +	dw_pcie_dbi_ro_wr_en(dw);
> +
> +	rcar_gen4_pcie_disable_bar(dw, BAR0MASKF);
> +	rcar_gen4_pcie_disable_bar(dw, BAR1MASKF);
> +
> +	dw_pcie_dbi_ro_wr_dis(dw);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +		/* Enable MSI interrupt signal */
> +		val = readl(rcar->base + PCIEINTSTS0EN);
> +		val |= MSI_CTRL_INT;
> +		writel(val, rcar->base + PCIEINTSTS0EN);
> +	}
> +
> +	gpiod_set_value_cansleep(dw->pe_rst, 0);
> +

> +	dw_pcie_setup_rc(pp);
> +
> +	dw_pcie_dbi_ro_wr_en(dw);
> +	rcar_gen4_pcie_set_max_link_width(dw, dw->num_lanes);
> +	dw_pcie_dbi_ro_wr_dis(dw);
> +
> +	if (!dw_pcie_link_up(dw)) {
> +		ret = dw->ops->start_link(dw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Ignore errors, the link may come up later */
> +	if (dw_pcie_wait_for_link(dw))
> +		dev_info(dw->dev, "PCIe link down\n");

This whole procedure is done in the dw_pcie_host_init() method (@Rob
already noted that a bit earlier). The only exception is the
rcar_gen4_pcie_set_max_link_width() method, which I suggest to move
the generic code (see further for more details).

> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops rcar_gen4_pcie_host_ops = {
> +	.host_init = rcar_gen4_pcie_host_init,
> +};
> +
> +static int rcar_gen4_add_dw_pcie_rp(struct rcar_gen4_pcie *rcar,
> +				   struct platform_device *pdev)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +	struct dw_pcie_rp *pp = &dw->pp;
> +	int ret;
> +
> +	pp->ops = &rcar_gen4_pcie_host_ops;
> +	pp->no_msix = true;
> +	dw_pcie_cap_set(dw, REQ_RES);
> +
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
> +{
> +	dw_pcie_host_deinit(&rcar->dw.pp);
> +	gpiod_set_value_cansleep(rcar->dw.pe_rst, 1);
> +}
> +

> +static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar,
> +					struct platform_device *pdev)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +
> +	/* Renesas-specific registers */
> +	rcar->base = devm_platform_ioremap_resource_byname(pdev, "app");
> +	if (IS_ERR(rcar->base))
> +		return PTR_ERR(rcar->base);
> +
> +	return rcar_gen4_pcie_devm_reset_get(rcar, dw->dev);
> +}

Please note that after fixing the RCAR PCIe EP DT-bindings to permit
the "app" instead of "appl" named reg property (see my note the RCAR
PCie EP DT-bindings patch) the method above will be identical in the
RCAR RP and EP driver implementations. So you'll be able to move it
to the pcie-rcar-gen4.c driver.

> +
> +static int rcar_gen4_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rcar_gen4_pcie *rcar;
> +	int err;
> +
> +	rcar = rcar_gen4_pcie_devm_alloc(dev);
> +	if (!rcar)
> +		return -ENOMEM;
> +
> +	err = rcar_gen4_pcie_get_resources(rcar, pdev);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to request resource: %d\n", err);
> +		return err;
> +	}
> +
> +	platform_set_drvdata(pdev, rcar);
> +
> +	err = rcar_gen4_pcie_prepare(rcar);
> +	if (err < 0)
> +		return err;
> +
> +	err = rcar_gen4_add_dw_pcie_rp(rcar, pdev);
> +	if (err < 0)
> +		goto err_add;
> +
> +	return 0;
> +
> +err_add:
> +	rcar_gen4_pcie_unprepare(rcar);
> +
> +	return err;
> +}
> +
> +static int rcar_gen4_pcie_remove(struct platform_device *pdev)
> +{
> +	struct rcar_gen4_pcie *rcar = platform_get_drvdata(pdev);
> +
> +	rcar_gen4_remove_dw_pcie_rp(rcar);
> +	rcar_gen4_pcie_unprepare(rcar);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcar_gen4_pcie_of_match[] = {
> +	{ .compatible = "renesas,rcar-gen4-pcie", },
> +	{},
> +};
> +
> +static struct platform_driver rcar_gen4_pcie_driver = {
> +	.driver = {
> +		.name = "pcie-rcar-gen4",
> +		.of_match_table = rcar_gen4_pcie_of_match,
> +	},
> +	.probe = rcar_gen4_pcie_probe,
> +	.remove = rcar_gen4_pcie_remove,
> +};
> +module_platform_driver(rcar_gen4_pcie_driver);
> +
> +MODULE_DESCRIPTION("Renesas R-Car Gen4 PCIe host controller driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> new file mode 100644
> index 000000000000..a6a29d6125c8
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PCIe host/endpoint controller driver for Renesas R-Car Gen4 Series SoCs
> + * Copyright (C) 2022-2023 Renesas Electronics Corporation
> + */
> +
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
> +#define  APP_LTSSM_ENABLE	BIT(0)
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
> +		val &= ~APP_LTSSM_ENABLE;
> +		val |= APP_HOLD_PHY_RST;
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
> +static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
> +{
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +
> +	rcar_gen4_pcie_ltssm_enable(rcar, true);
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
> +int rcar_gen4_pcie_set_device_type(struct rcar_gen4_pcie *rcar, bool rc,
> +				   int num_lanes)
> +{
> +	u32 val;
> +
> +	/* Note: Assume the reset is asserted here */
> +	val = readl(rcar->base + PCIEMSR0);
> +	if (rc)
> +		val |= DEVICE_TYPE_RC;
> +	else
> +		val |= DEVICE_TYPE_EP;
> +	if (num_lanes < 4)
> +		val |= BIFUR_MOD_SET_ON;
> +	writel(val, rcar->base + PCIEMSR0);
> +
> +	return reset_control_deassert(rcar->rst);
> +}
> +

> +void rcar_gen4_pcie_disable_bar(struct dw_pcie *dw, u32 bar_mask_reg)
> +{
> +	dw_pcie_writel_dbi(dw, SHADOW_REG(bar_mask_reg), 0x0);
> +}
> +

Hm, this seems like a DBI2/DBI_CS2 CSRs. By default the DW PCIe core
driver assumes that the DBI2 is defined within the 0x1000 offset with
respect to the DBI space (see dw_pcie_get_resources()). In your case
it must be within 0x2000 offset (judging by the SHADOW_REG() macro).
What about either defining the "dbi2" reg-named DT-property in the
DT-bindings (see DW PCIe RP/EP generic DT-bindings) or re-defining
the dw_pcie.dbi_base2 field in your LLDD?

Note the dbi_cs2 space is currently utilized in the DW PCIe EP driver
only in the framework of the BARs mapping setup procedure. Are you
sure it's working well in your case seeing the DBI2 base address is
most likely incorrectly initialized? Anyway if you get to define the
dbi_base2 field properly you'll be able to use the
dw_pcie_ep_reset_bar() method in the EP driver instead of the function
above (please see the way it's utilized in the rest of the DW PCIe EP
low-level drivers).

Another question. Are you sure the method above is relevant to the DW
PCIe Root Port controller? I don't see any shadow registers defined
for the host BARs in any HW-manual I've got (4.60, 4.70, 4.90, 5.20,
5.30, 5.40). What are they used for anyway?

> +void rcar_gen4_pcie_set_max_link_width(struct dw_pcie *dw, int num_lanes)
> +{
> +	u32 val = dw_pcie_readl_dbi(dw, EXPCAP(PCI_EXP_LNKCAP));
> +
> +	val &= ~PCI_EXP_LNKCAP_MLW;
> +	switch (num_lanes) {
> +	case 1:
> +		val |= PCI_EXP_LNKCAP_MLW_X1;
> +		break;
> +	case 2:
> +		val |= PCI_EXP_LNKCAP_MLW_X2;
> +		break;
> +	case 4:
> +		val |= PCI_EXP_LNKCAP_MLW_X4;
> +		break;
> +	default:
> +		dev_info(dw->dev, "Invalid num-lanes %d\n", num_lanes);
> +		val |= PCI_EXP_LNKCAP_MLW_X1;
> +		break;
> +	}
> +	dw_pcie_writel_dbi(dw, EXPCAP(PCI_EXP_LNKCAP), val);
> +}

This seems to be a generic action. What about moving it to 
pcie-designware.c implementing a function similar to
dw_pcie_link_set_max_speed(), which would be called in
dw_pcie_setup()?
It could be named as dw_pcie_link_set_max_(link_)?width() and besides
of the code above would consist of the PCIE_PORT_LINK_CONTROL and
PCIE_LINK_WIDTH_SPEED_CONTROL CSR initializations performed in
dw_pcie_setup().

* Please do that in a separate pre-requisite patch.

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
> +	if (!reset_control_status(rcar->rst))
> +		reset_control_assert(rcar->rst);
> +	pm_runtime_put(dev);
> +	pm_runtime_disable(dev);
> +}
> +
> +int rcar_gen4_pcie_devm_reset_get(struct rcar_gen4_pcie *rcar,
> +				  struct device *dev)
> +{
> +	rcar->rst = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(rcar->rst)) {
> +		dev_err(dev, "Failed to get Cold-reset\n");
> +		return PTR_ERR(rcar->rst);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = rcar_gen4_pcie_start_link,
> +	.stop_link = rcar_gen4_pcie_stop_link,
> +	.link_up = rcar_gen4_pcie_link_up,
> +};
> +
> +struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct device *dev)
> +{
> +	struct rcar_gen4_pcie *rcar;
> +
> +	rcar = devm_kzalloc(dev, sizeof(*rcar), GFP_KERNEL);
> +	if (!rcar)
> +		return NULL;
> +
> +	rcar->dw.dev = dev;
> +	rcar->dw.ops = &dw_pcie_ops;
> +	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
> +
> +	return rcar;
> +}
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.h b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
> new file mode 100644
> index 000000000000..1cdce0cf7dac
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
> @@ -0,0 +1,63 @@
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
> +#include <linux/reset.h>
> +
> +#include "pcie-designware.h"
> +

> +/* PCI Express capability */
> +#define EXPCAP(x)		(0x0070 + (x))
> +/* ASPM L1 PM Substates */
> +#define L1PSCAP(x)		(0x01bc + (x))
> +/* PCI Shadow offset */
> +#define SHADOW_REG(x)		(0x2000 + (x))
> +/* BAR Mask registers */
> +#define BAR0MASKF		0x0010
> +#define BAR1MASKF		0x0014
> +#define BAR2MASKF		0x0018
> +#define BAR3MASKF		0x001c
> +#define BAR4MASKF		0x0020
> +#define BAR5MASKF		0x0024
> +

* If you get to take some of my notes above into account you'll be able to
drop these macros...

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

Vendor-specific prefix would make the code using these macros much
more readable.

> +
> +struct rcar_gen4_pcie {
> +	struct dw_pcie		dw;
> +	void __iomem		*base;
> +	struct reset_control	*rst;
> +};
> +#define to_rcar_gen4_pcie(x)	dev_get_drvdata((x)->dev)
> +

> +u32 rcar_gen4_pcie_readl(struct rcar_gen4_pcie *pcie, u32 reg);
> +void rcar_gen4_pcie_writel(struct rcar_gen4_pcie *pcie, u32 reg, u32 val);

I don't see these two methods being defined in your driver. Are these
artefacts from the previous patch revisions?

-Serge(y)

> +int rcar_gen4_pcie_set_device_type(struct rcar_gen4_pcie *rcar, bool rc,
> +				   int num_lanes);

> +void rcar_gen4_pcie_disable_bar(struct dw_pcie *dw, u32 bar_mask_reg);
> +void rcar_gen4_pcie_set_max_link_width(struct dw_pcie *pci, int num_lanes);
> +int rcar_gen4_pcie_prepare(struct rcar_gen4_pcie *pcie);
> +void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *pcie);
> +int rcar_gen4_pcie_devm_reset_get(struct rcar_gen4_pcie *pcie,
> +				  struct device *dev);
> +struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct device *dev);
> +
> +#endif /* _PCIE_RCAR_GEN4_H_ */
> -- 
> 2.25.1
> 
> 
