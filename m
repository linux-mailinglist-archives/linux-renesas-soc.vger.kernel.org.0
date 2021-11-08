Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B948D449BE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 19:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbhKHSpp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 13:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbhKHSpl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 13:45:41 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C951C061570
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 10:42:56 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so9511396pjc.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6vpn1QBh4JUsvkVX/vyhhORqWxD/TkuBknE6CGGsOPc=;
        b=nG0FeAuYu8QZvM57tWMXYgihc5ZZe9GJRcQPJ+JVUXLP7SInNybyl55j2N5/bqmuTA
         ekjqK2fYktoqApyuXK13bYecO4g7yr3RpucjPoU6jVsj9uEPFd3Eau1Ihr+vnzcMvQLK
         3qD8QI9G3+16C9ECdlsd9euUnmUTztvQZpE46aGOoEX2x/fwrPNnctEJbpRDkHsB7pMV
         CkQAH14uXdTmKnsqgj+i1kNbZjN7Epnm0/HZ136aEX7sn/UZnmFlFe15Kn4bdIZZQjX/
         PuHfsychrFe7J/4zJG15Gpay3wb+ONglMVzBh4A/DJGFbqj+2EGV2gnQXtJ66hZrZ1+D
         qefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6vpn1QBh4JUsvkVX/vyhhORqWxD/TkuBknE6CGGsOPc=;
        b=mwk6mLDmMxL7o15T0Xwu9t3oUYmYjGUdc0zvs2rg3o1KeeAgmlHEhZga1V4fSKwhgF
         pUiiQoyTcovvu5hkPMXsgh0zyH6KMDtPKm/a8q30DB3W5g6A82ZfSxOmP2/QtkRqzIwT
         ZQ1K1yR19Fy2mmLKmLeqarXUojt4wA2qFHo6ygkSzZBz+qwOxn5cUNqSA+Funz8jGVmJ
         sqUQXrqAGtaJFKyz9P4SdA+ByA4zkKNnKNR5l3gxeMRSIjZgB8JXbrvpQ+lC3cw4CqVU
         k/0JjwOsFNploLH7yQd7nlGLkISuFfLczR4l183HniNKu9A5VBv3Wj0PetsT9P0v9ui4
         Sf6A==
X-Gm-Message-State: AOAM530EaXh/RfiVF4TNdjkZZ3XZabUSmJXO5vZayRoR9yANJHuLLuKk
        a1gwU8FWnrfBWLHtV9LKVP7v5Q==
X-Google-Smtp-Source: ABdhPJwLlGXFweXwwDpJrdMmjX2Udz+xmBSSfeOaRtl+CMlK/wRDhcA+RrAJxccU/YxF5Be/sty2Ug==
X-Received: by 2002:a17:903:1207:b0:13d:b9b1:ead7 with SMTP id l7-20020a170903120700b0013db9b1ead7mr1289720plh.63.1636396975824;
        Mon, 08 Nov 2021 10:42:55 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 11sm15804657pfl.41.2021.11.08.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 10:42:54 -0800 (PST)
Date:   Mon, 8 Nov 2021 11:42:52 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] remoteproc: Add Renesas rcar driver
Message-ID: <20211108184252.GA1971795@p14s>
References: <20211027073020.17055-1-julien.massot@iot.bzh>
 <20211027073020.17055-4-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027073020.17055-4-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Good morning Julien,

On Wed, Oct 27, 2021 at 09:30:20AM +0200, Julien Massot wrote:
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
>  drivers/remoteproc/Kconfig      |  11 ++
>  drivers/remoteproc/Makefile     |   1 +
>  drivers/remoteproc/rcar_rproc.c | 229 ++++++++++++++++++++++++++++++++
>  3 files changed, 241 insertions(+)
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9a6eedc3994a..3e87eadbaf59 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -261,6 +261,17 @@ config QCOM_WCNSS_PIL
>  	  verified and booted with the help of the Peripheral Authentication
>  	  System (PAS) in TrustZone.
>  
> +config RCAR_REMOTEPROC
> +	tristate "Renesas RCAR remoteproc support"

It is probably a good idea to include the type of SoC being supported, something
like:

        tristate "Renesas Gen3 RCAR remoteproc support"

That will make it easier to support future RCAR processors that may not share
the same architecture.


> +	depends on ARCH_RENESAS
> +	depends on REMOTEPROC
> +	help
> +	  Say y here to support R-Car realtime processor via the
> +	  remote processor framework. An elf firmware can be loaded
> +	  thanks to sysfs remoteproc entries. The remote processor
> +	  can be started and stopped.
> +	  This can be either built-in or a loadable module.  

Please add the name of the module when compiled as such.

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
> index 000000000000..ae0bfc8d4e85
> --- /dev/null
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -0,0 +1,229 @@
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
> +	struct device			*dev;
> +	struct rproc			*rproc;
> +	struct reset_control            *rst;
> +};
> +
> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
> +				 struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);

I think this should be "map memory: %pa+%lx\n" to be consistent with dev_err()
below and the original implementation in stm32_rproc.c.

> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%lx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_mem_release(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
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
> +			dev_err(dev, "unable to acquire memory-region\n");
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

In the above functions rproc->dev.parent is used for output.  I don't have a
strong opinion on which of rproc->dev or rproc->dev.parent is used but I would
like to see consistency throughout the driver.

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

Same comment as above.

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
> +	priv->rproc = rproc;

I don't see rcar_rproc::rproc being used anywhere.

> +	priv->dev = dev;
> +
> +	priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rst)) {
> +		ret = PTR_ERR(priv->rst);
> +		dev_err(dev, "fail to acquire rproc reset\n");
> +		goto free_rproc;
> +	}
> +
> +	pm_runtime_enable(priv->dev);
> +	ret = pm_runtime_get_sync(priv->dev);

There is no dev_pm_ops for the platform driver nor clocks to manage for this
device - is there something that requires pm_runtime operations to be called?

> +	if (ret) {
> +		dev_err(&rproc->dev, "failed to power up\n");
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
> +	pm_runtime_disable(priv->dev);
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static int rcar_rproc_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct rcar_rproc *priv = rproc->priv;
> +
> +	rproc_del(rproc);
> +	pm_runtime_disable(priv->dev);

As far as I can tell rcar_rproc::dev is not required.  It is only used in
rproc_probe() and rproc_remove() where pdev->dev is available.

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
