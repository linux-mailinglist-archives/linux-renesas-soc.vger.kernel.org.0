Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6374594C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 19:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240336AbhKVSlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 13:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240360AbhKVSlJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 13:41:09 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A0DC061714
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 10:38:02 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id v19so14871923plo.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 10:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q44qTfCL003QIxVdFJavVZ/V1Wr6CUxLRZuT0XIxAvk=;
        b=t//ejUOEOhVp8CnCYQ4/up9uIrAhRILYeMrZqEXva/hAIJ6WV9sgs/SnuNtW06b3+i
         WG0VZfS9ANqvTsFl+afhNk/vytOOl6+9VnVEa61DezzYYaz5AZjhcSgQunlkhnXi9nMG
         HsGb7kF0j15DEYH9lGs1RMps+gEgj87ncsU0PynrXZWkijBUfubAPsnkC/iZIz0f1/rD
         buu4WSmWfdTi06sFep/pmipugmQlkTYrl6bGcH0y9qeOlkRvl71JSaRxhnArZp/JiS06
         zceWD3rWSMcct2ug0RphXMMLdYN528+72jsyXzuD65MkkM85jqLX9vVBSW4ok0hDi+F4
         AdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q44qTfCL003QIxVdFJavVZ/V1Wr6CUxLRZuT0XIxAvk=;
        b=LthDuUU6Om/eo4aHQh/XLW43WIHrnLlO10cE4ocnlZbUY7L+vILE/V0p6SjXLrLDC2
         tQTN7Xnb5HTAEHN12lxXeuxr9HNoB/Rx0wBQK4oyw9U5knaUBfH2wkIHS9jdscmKMdrD
         zh0bojTd9xVlkxaFym6kkRPInQXlgeH+p3WByJ2FAmTUSU4syghG9RkODz6ITOvut1YS
         ZWsOZ38uZqrEwpjSmMVeNneJNu7XAikmcoO3x65jzb7DFUHYYN0gl4Ceslw0NKCVDioo
         qGp8uzp5nrcCmtS0YwUZDSRX19vkWWBsojYR6Kk9uxCxFPzVsU/HWpz+1/k8GsjEpW1E
         XOrA==
X-Gm-Message-State: AOAM530WiyJaiV+1sJB9yoAJDkEt4iW9fWjTHNzdU/NZX4kfK+bLx0Qi
        8krLg9d70HE8trn/6l/MpMIwgw==
X-Google-Smtp-Source: ABdhPJzBnarocdpTkhiAEx/tE3WTQnb2pW49kJoN0ye8hJJxgSX/ZTmTgapbcMCF/6U3/+XJEFF+hw==
X-Received: by 2002:a17:90a:cb98:: with SMTP id a24mr34026003pju.153.1637606282155;
        Mon, 22 Nov 2021 10:38:02 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x18sm9920108pfh.210.2021.11.22.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:38:01 -0800 (PST)
Date:   Mon, 22 Nov 2021 11:37:58 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Message-ID: <20211122183758.GC2686563@p14s>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115135032.129227-4-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Nov 15, 2021 at 02:50:32PM +0100, Julien Massot wrote:
> Renesas Gen3 platform includes a Cortex-r7 processor.
> 
> Both: the application cores (A5x) and the realtime core (CR7)
> share access to the RAM and devices with the same address map,
> so device addresses are equal to the Linux physical addresses.
> 
> In order to initialize this remote processor we need to:
> - power on the realtime core
> - put the firmware in a ram area
> - set the boot address for this firmware (reset vector)
> - Deassert the reset
> 
> This initial driver allows to start and stop the Cortex R7
> processor.
> 
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> ---
> 
> Change since RFC:
> - Improve Kconfig description.
> - Use consistent device for pr_* messages.
> - Drop unused dev and rproc member of struct rcar_rproc.
> 
> ---
>  drivers/remoteproc/Kconfig      |  12 ++
>  drivers/remoteproc/Makefile     |   1 +
>  drivers/remoteproc/rcar_rproc.c | 226 ++++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+)
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9a6eedc3994a..5b0c617d45f6 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -261,6 +261,18 @@ config QCOM_WCNSS_PIL
>  	  verified and booted with the help of the Peripheral Authentication
>  	  System (PAS) in TrustZone.
>  
> +config RCAR_REMOTEPROC
> +	tristate "Renesas R-CAR Gen3 remoteproc support"
> +	depends on ARCH_RENESAS
> +	depends on REMOTEPROC

You should be able to remove the dependency on REMOTEPROC since this is already in
the "if REMOTEPROC" block.

> +	help
> +	  Say y here to support R-Car realtime processor via the
> +	  remote processor framework. An elf firmware can be loaded
> +	  thanks to sysfs remoteproc entries. The remote processor
> +	  can be started and stopped.
> +	  This can be either built-in or a loadable module.
> +	  If compiled as module (M), the module name is rcar_rproc.
> +
>  config ST_REMOTEPROC
>  	tristate "ST remoteproc support"
>  	depends on ARCH_STI
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9c..bb290cc08e99 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
>  qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
> +obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> new file mode 100644
> index 000000000000..795089dc4337
> --- /dev/null
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) IoT.bzh 2021
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/reset.h>
> +#include <linux/soc/renesas/rcar-rst.h>
> +
> +#include "remoteproc_internal.h"
> +
> +struct rcar_rproc {
> +	struct reset_control *rst;
> +};
> +
> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
> +				 struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = &rproc->dev;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %pa+%lx\n", &mem->dma, mem->len);
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%lx\n",

The sparse checker doesn't like %lx so probably be better to go with just %x.
Apologies for suggesting to use %lx.

> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;

Talking about the sparse checker, you will see complaints about @va not being of
type "void __iomem *".  You can ignore those as this would likely require to
refactor the rproc_mem_entry structure, which is outside the scope of this work.

> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_mem_release(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_prepare(struct rproc *rproc)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	u64 da;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(&rproc->dev,
> +				"unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		/* No need to translate pa to da, R-Car use same map */
> +		da = rmem->base;
> +
> +		mem = rproc_mem_entry_init(dev, NULL,
> +					   (dma_addr_t)rmem->base,
> +					   rmem->size, da,
> +					   rcar_rproc_mem_alloc,
> +					   rcar_rproc_mem_release,
> +					   it.node->name);
> +
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_start(struct rproc *rproc)
> +{
> +	struct rcar_rproc *priv = rproc->priv;
> +	int err;
> +
> +	if (!rproc->bootaddr)
> +		return -EINVAL;
> +
> +	err = rcar_rst_set_rproc_boot_addr(rproc->bootaddr);
> +	if (err) {
> +		dev_err(&rproc->dev, "failed to set rproc boot addr\n");
> +		return err;
> +	}
> +
> +	err = reset_control_deassert(priv->rst);
> +	if (err)
> +		dev_err(&rproc->dev, "failed to deassert reset\n");
> +
> +	return err;
> +}
> +
> +static int rcar_rproc_stop(struct rproc *rproc)
> +{
> +	struct rcar_rproc *priv = rproc->priv;
> +	int err;
> +
> +	err = reset_control_assert(priv->rst);
> +	if (err)
> +		dev_err(&rproc->dev, "failed to assert reset\n");
> +
> +	return err;
> +}
> +
> +static struct rproc_ops rcar_rproc_ops = {
> +	.prepare	= rcar_rproc_prepare,
> +	.start		= rcar_rproc_start,
> +	.stop		= rcar_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.parse_fw	= rcar_rproc_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +
> +};
> +
> +static int rcar_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct rcar_rproc *priv;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
> +			    NULL, sizeof(*priv));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	priv = rproc->priv;
> +
> +	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst)) {
> +		ret = PTR_ERR(priv->rst);
> +		dev_err(dev, "fail to acquire rproc reset\n");
> +		goto free_rproc;
> +	}
> +
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to power up\n");
> +		goto free_rproc;
> +	}
> +
> +	dev_set_drvdata(dev, rproc);
> +
> +	/* Manually start the rproc */
> +	rproc->auto_boot = false;
> +
> +	ret = rproc_add(rproc);
> +	if (ret) {
> +		dev_err(dev, "rproc_add failed\n");
> +		goto pm_disable;
> +	}
> +
> +	return 0;
> +
> +pm_disable:
> +	pm_runtime_disable(dev);
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static int rcar_rproc_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +
> +	rproc_del(rproc);
> +	pm_runtime_disable(dev);
> +	rproc_free(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcar_rproc_of_match[] = {
> +	{ .compatible = "renesas,rcar-cr7" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
> +
> +static struct platform_driver rcar_rproc_driver = {
> +	.probe = rcar_rproc_probe,
> +	.remove = rcar_rproc_remove,
> +	.driver = {
> +		.name = "rcar-rproc",
> +		.of_match_table = rcar_rproc_of_match,
> +	},
> +};

This set is just as clean as the RFC.  If it wasn't for the DTS bindings that
need to be ack'ed by Rob, I probably would have made the above modifications and
applied this patch.

Thanks,
Mathieu

> +
> +module_platform_driver(rcar_rproc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas Gen3 R-Car remote processor control driver");
> +MODULE_AUTHOR("Julien Massot <julien.massot@iot.bzh>");
> -- 
> 2.31.1
> 
> 
