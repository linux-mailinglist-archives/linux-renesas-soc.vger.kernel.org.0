Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790EEE03F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 12:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfD2KG7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 06:06:59 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:52446 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727470AbfD2KG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 06:06:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B89CA80D;
        Mon, 29 Apr 2019 03:06:57 -0700 (PDT)
Received: from [10.1.196.92] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865073F5AF;
        Mon, 29 Apr 2019 03:06:55 -0700 (PDT)
Subject: Re: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-3-geert+renesas@glider.be>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 mQINBE6Jf0UBEADLCxpix34Ch3kQKA9SNlVQroj9aHAEzzl0+V8jrvT9a9GkK+FjBOIQz4KE
 g+3p+lqgJH4NfwPm9H5I5e3wa+Scz9wAqWLTT772Rqb6hf6kx0kKd0P2jGv79qXSmwru28vJ
 t9NNsmIhEYwS5eTfCbsZZDCnR31J6qxozsDHpCGLHlYym/VbC199Uq/pN5gH+5JHZyhyZiNW
 ozUCjMqC4eNW42nYVKZQfbj/k4W9xFfudFaFEhAf/Vb1r6F05eBP1uopuzNkAN7vqS8XcgQH
 qXI357YC4ToCbmqLue4HK9+2mtf7MTdHZYGZ939OfTlOGuxFW+bhtPQzsHiW7eNe0ew0+LaL
 3wdNzT5abPBscqXWVGsZWCAzBmrZato+Pd2bSCDPLInZV0j+rjt7MWiSxEAEowue3IcZA++7
 ifTDIscQdpeKT8hcL+9eHLgoSDH62SlubO/y8bB1hV8JjLW/jQpLnae0oz25h39ij4ijcp8N
 t5slf5DNRi1NLz5+iaaLg4gaM3ywVK2VEKdBTg+JTg3dfrb3DH7ctTQquyKun9IVY8AsxMc6
 lxl4HxrpLX7HgF10685GG5fFla7R1RUnW5svgQhz6YVU33yJjk5lIIrrxKI/wLlhn066mtu1
 DoD9TEAjwOmpa6ofV6rHeBPehUwMZEsLqlKfLsl0PpsJwov8TQARAQABtCNNYXJjIFp5bmdp
 ZXIgPG1hcmMuenluZ2llckBhcm0uY29tPokCOwQTAQIAJQIbAwYLCQgHAwIGFQgCCQoLBBYC
 AwECHgECF4AFAk6NvYYCGQEACgkQI9DQutE9ekObww/+NcUATWXOcnoPflpYG43GZ0XjQLng
 LQFjBZL+CJV5+1XMDfz4ATH37cR+8gMO1UwmWPv5tOMKLHhw6uLxGG4upPAm0qxjRA/SE3LC
 22kBjWiSMrkQgv5FDcwdhAcj8A+gKgcXBeyXsGBXLjo5UQOGvPTQXcqNXB9A3ZZN9vS6QUYN
 TXFjnUnzCJd+PVI/4jORz9EUVw1q/+kZgmA8/GhfPH3xNetTGLyJCJcQ86acom2liLZZX4+1
 6Hda2x3hxpoQo7pTu+XA2YC4XyUstNDYIsE4F4NVHGi88a3N8yWE+Z7cBI2HjGvpfNxZnmKX
 6bws6RQ4LHDPhy0yzWFowJXGTqM/e79c1UeqOVxKGFF3VhJJu1nMlh+5hnW4glXOoy/WmDEM
 UMbl9KbJUfo+GgIQGMp8mwgW0vK4HrSmevlDeMcrLdfbbFbcZLNeFFBn6KqxFZaTd+LpylIH
 bOPN6fy1Dxf7UZscogYw5Pt0JscgpciuO3DAZo3eXz6ffj2NrWchnbj+SpPBiH4srfFmHY+Y
 LBemIIOmSqIsjoSRjNEZeEObkshDVG5NncJzbAQY+V3Q3yo9og/8ZiaulVWDbcpKyUpzt7pv
 cdnY3baDE8ate/cymFP5jGJK++QCeA6u6JzBp7HnKbngqWa6g8qDSjPXBPCLmmRWbc5j0lvA
 6ilrF8m5Ag0ETol/RQEQAM/2pdLYCWmf3rtIiP8Wj5NwyjSL6/UrChXtoX9wlY8a4h3EX6E3
 64snIJVMLbyr4bwdmPKULlny7T/R8dx/mCOWu/DztrVNQiXWOTKJnd/2iQblBT+W5W8ep/nS
 w3qUIckKwKdplQtzSKeE+PJ+GMS+DoNDDkcrVjUnsoCEr0aK3cO6g5hLGu8IBbC1CJYSpple
 VVb/sADnWF3SfUvJ/l4K8Uk4B4+X90KpA7U9MhvDTCy5mJGaTsFqDLpnqp/yqaT2P7kyMG2E
 w+eqtVIqwwweZA0S+tuqput5xdNAcsj2PugVx9tlw/LJo39nh8NrMxAhv5aQ+JJ2I8UTiHLX
 QvoC0Yc/jZX/JRB5r4x4IhK34Mv5TiH/gFfZbwxd287Y1jOaD9lhnke1SX5MXF7eCT3cgyB+
 hgSu42w+2xYl3+rzIhQqxXhaP232t/b3ilJO00ZZ19d4KICGcakeiL6ZBtD8TrtkRiewI3v0
 o8rUBWtjcDRgg3tWx/PcJvZnw1twbmRdaNvsvnlapD2Y9Js3woRLIjSAGOijwzFXSJyC2HU1
 AAuR9uo4/QkeIrQVHIxP7TJZdJ9sGEWdeGPzzPlKLHwIX2HzfbdtPejPSXm5LJ026qdtJHgz
 BAb3NygZG6BH6EC1NPDQ6O53EXorXS1tsSAgp5ZDSFEBklpRVT3E0NrDABEBAAGJAh8EGAEC
 AAkFAk6Jf0UCGwwACgkQI9DQutE9ekMLBQ//U+Mt9DtFpzMCIHFPE9nNlsCm75j22lNiw6mX
 mx3cUA3pl+uRGQr/zQC5inQNtjFUmwGkHqrAw+SmG5gsgnM4pSdYvraWaCWOZCQCx1lpaCOl
 MotrNcwMJTJLQGc4BjJyOeSH59HQDitKfKMu/yjRhzT8CXhys6R0kYMrEN0tbe1cFOJkxSbV
 0GgRTDF4PKyLT+RncoKxQe8lGxuk5614aRpBQa0LPafkirwqkUtxsPnarkPUEfkBlnIhAR8L
 kmneYLu0AvbWjfJCUH7qfpyS/FRrQCoBq9QIEcf2v1f0AIpA27f9KCEv5MZSHXGCdNcbjKw1
 39YxYZhmXaHFKDSZIC29YhQJeXWlfDEDq6nIhvurZy3mSh2OMQgaIoFexPCsBBOclH8QUtMk
 a3jW/qYyrV+qUq9Wf3SKPrXf7B3xB332jFCETbyZQXqmowV+2b3rJFRWn5hK5B+xwvuxKyGq
 qDOGjof2dKl2zBIxbFgOclV7wqCVkhxSJi/QaOj2zBqSNPXga5DWtX3ekRnJLa1+ijXxmdjz
 hApihi08gwvP5G9fNGKQyRETePEtEAWt0b7dOqMzYBYGRVr7uS4uT6WP7fzOwAJC4lU7ZYWZ
 yVshCa0IvTtp1085RtT3qhh9mobkcZ+7cQOY+Tx2RGXS9WeOh2jZjdoWUv6CevXNQyOUXMM=
Organization: ARM Ltd
Message-ID: <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
Date:   Mon, 29 Apr 2019 11:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429093631.10799-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 29/04/2019 10:36, Geert Uytterhoeven wrote:
> Add a driver for the Renesas RZ/A1 Interrupt Controller.
> 
> This supports using up to 8 external interrupts on RZ/A1, with
> configurable sense select.
> 
> NMI edge select is not yet supported.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/irqchip/Kconfig            |   4 +
>  drivers/irqchip/Makefile           |   1 +
>  drivers/irqchip/irq-renesas-rza1.c | 238 +++++++++++++++++++++++++++++
>  3 files changed, 243 insertions(+)
>  create mode 100644 drivers/irqchip/irq-renesas-rza1.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 5438abb1babaf042..cd5b9bbf6122afce 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -221,6 +221,10 @@ config RENESAS_IRQC
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN
>  
> +config RENESAS_RZA1_IRQC
> +	bool
> +	select IRQ_DOMAIN_HIERARCHY
> +
>  config ST_IRQCHIP
>  	bool
>  	select REGMAP
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 85972ae1bd7f978b..c0e23ce9f2619de3 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_JCORE_AIC)			+= irq-jcore-aic.o
>  obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
>  obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
>  obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
> +obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
>  obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
>  obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
>  obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
> diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
> new file mode 100644
> index 0000000000000000..65110019adda5a8f
> --- /dev/null
> +++ b/drivers/irqchip/irq-renesas-rza1.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/A1 IRQC Driver
> + *
> + * Copyright (C) 2019 Glider bvba
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#define IRQC_NUM_IRQ		8
> +
> +#define ICR0			0	/* Interrupt Control Register 0 */
> +
> +#define ICR0_NMIL		BIT(15)	/* NMI Input Level (0=low, 1=high) */
> +#define ICR0_NMIE		BIT(8)	/* Edge Select (0=falling, 1=rising) */
> +#define ICR0_NMIF		BIT(1)	/* NMI Interrupt Request */
> +
> +#define ICR1			2	/* Interrupt Control Register 1 */
> +
> +#define ICR1_IRQS(n, sense)	((sense) << ((n) * 2))	/* IRQ Sense Select */
> +#define ICR1_IRQS_LEVEL_LOW	0
> +#define ICR1_IRQS_EDGE_FALLING	1
> +#define ICR1_IRQS_EDGE_RISING	2
> +#define ICR1_IRQS_EDGE_BOTH	3
> +#define ICR1_IRQS_MASK(n)	ICR1_IRQS((n), 3)
> +
> +#define IRQRR			4	/* IRQ Interrupt Request Register */
> +
> +
> +struct rza1_irqc_info {
> +	unsigned int gic_spi_base;
> +};
> +
> +struct rza1_irqc_priv {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct irq_chip chip;
> +	struct irq_domain *irq_domain;
> +	unsigned int gic_spi_base;
> +};
> +
> +static struct rza1_irqc_priv *irq_data_to_priv(struct irq_data *data)
> +{
> +	return data->domain->host_data;
> +}
> +
> +static void rza1_irqc_eoi(struct irq_data *d)
> +{
> +	struct rza1_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int bit = BIT(irqd_to_hwirq(d));

Please use u32 instead of "unsigned int" for something that operates on
HW registers.

> +	u16 tmp;
> +
> +	tmp = readw(priv->base + IRQRR);

Same thing here. It's less confusing to use a u32 and mask out the top
bits if needed rather than having this implicit cast (applies all over
the code).

> +	if (tmp & bit)
> +		writew(GENMASK(IRQC_NUM_IRQ - 1, 0) & ~bit, priv->base + IRQRR);

Please use the _relaxed accessors all over the driver, you really do not
need a DSB on each of these accesses.

> +
> +	irq_chip_eoi_parent(d);
> +}
> +
> +static int rza1_irqc_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct rza1_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +	u16 sense, tmp;
> +
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_LEVEL_LOW:
> +		sense = ICR1_IRQS_LEVEL_LOW;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		sense = ICR1_IRQS_EDGE_FALLING;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		sense = ICR1_IRQS_EDGE_RISING;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_BOTH:
> +		sense = ICR1_IRQS_EDGE_BOTH;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	tmp = readw(priv->base + ICR1);
> +	tmp &= ~ICR1_IRQS_MASK(hw_irq);
> +	tmp |= ICR1_IRQS(hw_irq, sense);
> +	writew(tmp, priv->base + ICR1);
> +	return 0;

Don't you need to propagate the trigger configuration to the parent irqchip?

> +}
> +
> +static int rza1_irqc_alloc(struct irq_domain *domain, unsigned int virq,
> +			   unsigned int nr_irqs, void *arg)
> +{
> +	struct rza1_irqc_priv *priv = domain->host_data;
> +	struct irq_fwspec *fwspec = arg;
> +	struct irq_fwspec spec;
> +	int ret;
> +
> +	ret = irq_domain_set_hwirq_and_chip(domain, virq, fwspec->param[0],
> +					    &priv->chip, priv);
> +	if (ret)
> +		return ret;
> +
> +	spec.fwnode = &priv->dev->of_node->fwnode;
> +	spec.param_count = 3;
> +	spec.param[0] = GIC_SPI;
> +	spec.param[1] = priv->gic_spi_base + fwspec->param[0];
> +	spec.param[2] = IRQ_TYPE_LEVEL_HIGH;

This is related to my earlier question: Does this block turn everything
into level interrupts?

> +
> +	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &spec);
> +}
> +
> +static int rza1_irqc_translate(struct irq_domain *domain,
> +			       struct irq_fwspec *fwspec, unsigned long *hwirq,
> +			       unsigned int *type)
> +{
> +	if (fwspec->param_count != 2 || fwspec->param[0] >= IRQC_NUM_IRQ)
> +		return -EINVAL;
> +
> +	*hwirq = fwspec->param[0];
> +	*type = fwspec->param[1];
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops rza1_irqc_domain_ops = {
> +	.alloc = rza1_irqc_alloc,
> +	.translate = rza1_irqc_translate,
> +};
> +
> +static int rza1_irqc_probe(struct platform_device *pdev)
> +{
> +	const struct rza1_irqc_info *info;
> +	struct irq_domain *parent = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *gic_node;
> +	struct rza1_irqc_priv *priv;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	info = of_device_get_match_data(dev);
> +	priv->gic_spi_base = info->gic_spi_base;
> +	platform_set_drvdata(pdev, priv);
> +	priv->dev = dev;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	gic_node = of_irq_find_parent(dev->of_node);
> +	if (gic_node) {
> +		parent = irq_find_host(gic_node);
> +		of_node_put(gic_node);
> +	}
> +
> +	if (!parent) {
> +		dev_err(dev, "cannot find parent domain\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->chip.name = dev_name(dev);

name should normally be used to identify the overall "class" of
interrupt. .device is what should be used for the device itself.

> +	priv->chip.irq_mask = irq_chip_mask_parent,
> +	priv->chip.irq_unmask = irq_chip_unmask_parent,
> +	priv->chip.irq_eoi = rza1_irqc_eoi,
> +	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy,
> +	priv->chip.irq_set_type = rza1_irqc_set_type,
> +	priv->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
> +
> +	priv->irq_domain = irq_domain_add_hierarchy(parent, 0, IRQC_NUM_IRQ,
> +						    dev->of_node,
> +						    &rza1_irqc_domain_ops,
> +						    priv);
> +	if (!priv->irq_domain) {
> +		dev_err(dev, "cannot initialize irq domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rza1_irqc_remove(struct platform_device *pdev)
> +{
> +	struct rza1_irqc_priv *priv = platform_get_drvdata(pdev);
> +
> +	irq_domain_remove(priv->irq_domain);
> +	return 0;
> +}
> +
> +struct rza1_irqc_info rza1_irqc_info = {
> +	.gic_spi_base = 0,
> +};

To answer your question in the cover letter, I'd rather this came from
DT. And otherwise, it should be be static.

> +
> +static const struct of_device_id rza1_irqc_dt_ids[] = {
> +	{ .compatible = "renesas,rza1-irqc", &rza1_irqc_info },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rza1_irqc_dt_ids);
> +
> +static struct platform_driver rza1_irqc_device_driver = {
> +	.probe		= rza1_irqc_probe,
> +	.remove		= rza1_irqc_remove,
> +	.driver		= {
> +		.name	= "renesas_rza1_irqc",
> +		.of_match_table	= rza1_irqc_dt_ids,
> +	}
> +};
> +
> +static int __init rza1_irqc_init(void)
> +{
> +	return platform_driver_register(&rza1_irqc_device_driver);
> +}
> +postcore_initcall(rza1_irqc_init);
> +
> +static void __exit rza1_irqc_exit(void)
> +{
> +	platform_driver_unregister(&rza1_irqc_device_driver);
> +}
> +module_exit(rza1_irqc_exit);
> +
> +MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
> +MODULE_DESCRIPTION("Renesas RZ/A1 IRQC Driver");
> +MODULE_LICENSE("GPL v2");
> 

It otherwise looks good to me. If you respin it quickly enough, I'm
happy to take it for 5.2.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
