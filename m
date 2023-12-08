Return-Path: <linux-renesas-soc+bounces-858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3280A80C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 17:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF97F1C208DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC334CEC;
	Fri,  8 Dec 2023 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F6b04T2c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/Egalgir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D070B1732;
	Fri,  8 Dec 2023 08:01:38 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702051297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvRAzOC1s8CTEnsQtk9rLB7j6MoLVbJs1vS74413VOI=;
	b=F6b04T2civNLQw/P6s4AjzqPlLxejEuPzBLrsl+3EDPegBJH2cSw9MQ1smQ5Sw29sgPJQu
	ITzGSWkzHF9HDteBgxCvuKiCROwKwUayT0g5XTT0TV2meAB/hQMDJfPOy5+E6qhvuVdcxz
	F5h4rv9IjyTf01PH68AhJNVMolCVgX+T9+lF4iqo2ogmyFISaR7ZE58c/FEgr0Ldvm88wA
	fuJ03avfwq9fqVlsu1VqdbvDFc5IfzeriRwuH5YnME0j4+rgIUvo8xzAw6YYf6aCuz5A6R
	svKmtinn9ugY0gdh0PrRE0i22zRIx+ijyF9odKxUwrPUGDVK2RqBrnq/aSrTlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702051297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvRAzOC1s8CTEnsQtk9rLB7j6MoLVbJs1vS74413VOI=;
	b=/EgalgirjNm9ep45ZEQnecmn1UAJ6YqdDBfC+cG20lSeVMQLVO8XCGc5FYnuScjwlSzGAe
	kBHD3v0GQNt+fqCQ==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
 geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
 irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
 mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, peterlin@andestech.com,
 peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org,
 sunilvl@ventanamicro.com, tim609@andestech.com, uwu@icenowy.me,
 wens@csie.org, will@kernel.org, ycliang@andestech.com,
 inochiama@outlook.com
Subject: Re: [PATCH v4 03/13] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
In-Reply-To: <20231122121235.827122-4-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-4-peterlin@andestech.com>
Date: Fri, 08 Dec 2023 17:01:36 +0100
Message-ID: <87y1e4r8db.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> To share the riscv_intc_domain_map() with the generic RISC-V INTC and
> ACPI, we add a chip parameter to riscv_intc_init_common(), so it can be

s/we//

See: Documentation/process/

> passed to the irq_domain_set_info() as private data.
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 2fdd40f2a791..30f0036c8978 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/smp.h>
> +#include <linux/soc/andes/irq.h>
>  
>  static struct irq_domain *intc_domain;
>  
> @@ -46,6 +47,31 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
>  	csr_set(CSR_IE, BIT(d->hwirq));
>  }
>  
> +static void andes_intc_irq_mask(struct irq_data *d)
> +{
> +	/*
> +	 * Andes specific S-mode local interrupt causes (hwirq)
> +	 * are defined as (256 + n) and controlled by n-th bit
> +	 * of SLIE.
> +	 */
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);

How is this supposed to be correct with BITS_PER_LONG == 64?

> +
> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> +		csr_clear(CSR_IE, mask);
> +	else
> +		csr_clear(ANDES_CSR_SLIE, mask);
> +}
> +
> +static void andes_intc_irq_unmask(struct irq_data *d)
> +{
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);

Ditto.

> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> +		csr_set(CSR_IE, mask);
> +	else
> +		csr_set(ANDES_CSR_SLIE, mask);
> +}

>  static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
>  				 irq_hw_number_t hwirq)
>  {
> +	struct irq_chip *chip = d->host_data;
> +
>  	irq_set_percpu_devid(irq);
> -	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
> +	irq_domain_set_info(d, irq, hwirq, chip, d->host_data,

So this sets 'chip_data' to the chip itself. What's the point? Just set
it to NULL as the chip obviously does not need chip_data at all.

>  			    handle_percpu_devid_irq, NULL, NULL);
>  
>  	return 0;
> @@ -112,11 +147,12 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
>  	return intc_domain->fwnode;
>  }
>  
> -static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> +static int __init riscv_intc_init_common(struct fwnode_handle *fn,
> +					 struct irq_chip *chip)
>  {
>  	int rc;
>  
> -	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, NULL);
> +	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, chip);
>  	if (!intc_domain) {
>  		pr_err("unable to add IRQ domain\n");
>  		return -ENXIO;
> @@ -138,6 +174,7 @@ static int __init riscv_intc_init(struct device_node *node,
>  {
>  	int rc;
>  	unsigned long hartid;
> +	struct irq_chip *chip = &riscv_intc_chip;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Thanks

        tglx

