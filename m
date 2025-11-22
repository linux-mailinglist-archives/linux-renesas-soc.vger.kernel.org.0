Return-Path: <linux-renesas-soc+bounces-25030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F51C7D389
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 16:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C613134E60D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 15:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0F2279DA2;
	Sat, 22 Nov 2025 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3XBz4G8r";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d+HZboQh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D91339B1;
	Sat, 22 Nov 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763826940; cv=none; b=fFu+HwIiY8Q+ennuyL84Q0tQEDhheJR6qFSm1ZHzwNRaX+9jSU57VH9belcEAlkjvC6Puv5858eC7mIAdTNUPnwxEaoF4l87gZHht/LLxjpTf9bjzPWL3L0b+YI6kcsJtsTP3uL6pZcPJCyotYnJrCYdXRoRMcAzc54J+Mw6woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763826940; c=relaxed/simple;
	bh=4F0RLGXGVZNBKJQgx7rSVLSWpBP22I5UFF3NMs3DPOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TU+nO3Ug+KoQcCRsgPhrk7qlQam+bFMF+BwA+twCnlCoeSniNLPqO7mZsfxYi9aPQCQ9ddvuiCt/jhCEv7G0IYAcgC9NgQJVPsK63I6JkYXLVTGXZ9XI/kwCu1I9+weAeDp797DsS9pr8jCC/2OopWjuG/NmQ9jVBI5Fw2n5qm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3XBz4G8r; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d+HZboQh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763826937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coh1QvNpPmWIwyhgk4wCBXFx35kiHw9SUZC1Mr1XAIo=;
	b=3XBz4G8rzX3Eryp/1W0biyeEg22tZna4H7KI5QvXWew/0CJIrSfAbzvFQZemsPl+04a9Ib
	zngdbJmPK47RqnMslE/3jFH48vaU8Xme3BJGoI/46rqkRf3elX1POEbunBHpyx6JdFFnqr
	9jAXXGDLzK6J9XcldwsUVqv/BoukZNBjNhjKmL+kdOtkbRDkcr9SqA1TXXYKYwZ6imUOtn
	uF3om5rixqnzG93RwNcVYl+Imd18uhNzld+ADN8pXfGr65cI3pDRxb5Mk1EYO8oC7NCDL3
	6UWYfs+N1btZaX2Dwd+2lDloSO+5JCucit5IcRPiQge1NjFb2QtASiuMPaDmEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763826937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coh1QvNpPmWIwyhgk4wCBXFx35kiHw9SUZC1Mr1XAIo=;
	b=d+HZboQhFgr4R6CTCfvy181ue7LxDhcEkm7/7m2yJ5sAL3YSvWavgGi4trahGta6FBofdR
	1dyIKFX0GpleSeDw==
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Cosmin Tanislav
 <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
In-Reply-To: <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
Date: Sat, 22 Nov 2025 16:55:36 +0100
Message-ID: <87see6hxjb.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 21 2025 at 13:14, Cosmin Tanislav wrote:
> +static inline int rzt2h_icu_irq_to_offset(struct irq_data *d, void __iomem **base,
> +					  unsigned int *offset)
> +{
> +	struct rzt2h_icu_priv *priv = irq_data_to_priv(d);
> +	unsigned int hwirq = irqd_to_hwirq(d);
> +
> +	if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
> +		*offset = hwirq - RZT2H_ICU_IRQ_NS_START;
> +		*base = priv->base_ns;
> +	} else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
> +		   /* SEI follows safety IRQs in registers and in IRQ numbers. */
> +		   RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {

This nested commend in the condition is really unreadable.

> +		*offset = hwirq - RZT2H_ICU_IRQ_S_START;
> +		*base = priv->base_s;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rzt2h_icu_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct rzt2h_icu_priv *priv = irq_data_to_priv(d);
> +	unsigned int parent_type;
> +	unsigned int offset;

Combine same data types into one line please.

> +	void __iomem *base;
> +	u32 val, md;
> +	int ret;


> +	guard(raw_spinlock)(&priv->lock);
> +	val = readl_relaxed(base + RZT2H_ICU_PORTNF_MD);
> +	val &= ~RZT2H_ICU_PORTNF_MDi_MASK(offset);
> +	val |= RZT2H_ICU_PORTNF_MDi_PREP(offset, md);
> +	writel_relaxed(val, base + RZT2H_ICU_PORTNF_MD);
> +

This looks wrong. guard() holds the lock across the set_parent()
call. If you really need that then this needs a comment explaining the
why. Otherwise use scoped_guard().

> +	return irq_chip_set_type_parent(d, parent_type);
> +}
> +static const struct irq_chip rzt2h_icu_chip = {
> +	.name = "rzt2h-icu",
> +	.irq_mask = irq_chip_mask_parent,
> +	.irq_unmask = irq_chip_unmask_parent,
> +	.irq_eoi = irq_chip_eoi_parent,
> +	.irq_set_type = rzt2h_icu_set_type,
> +	.irq_set_wake = irq_chip_set_wake_parent,
> +	.irq_set_affinity = irq_chip_set_affinity_parent,
> +	.irq_retrigger = irq_chip_retrigger_hierarchy,
> +	.irq_get_irqchip_state = irq_chip_get_parent_state,
> +	.irq_set_irqchip_state = irq_chip_set_parent_state,
> +	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SET_TYPE_MASKED |
> +		 IRQCHIP_SKIP_SET_WAKE,

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

And please read and follow the rest of the documentation too.

> +};
> +
> +static int rzt2h_icu_alloc(struct irq_domain *domain, unsigned int virq,
> +			   unsigned int nr_irqs, void *arg)
> +{
> +	struct rzt2h_icu_priv *priv = domain->host_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type;
> +	int ret;
> +
> +	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzt2h_icu_chip,
> +					    NULL);

Get rid of the line breaks all over the place. You have 100 characters.

> +	if (ret)
> +		return ret;
> +
> +	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
> +					    &priv->fwspec[hwirq]);
> +}


> +static int rzt2h_icu_init(struct platform_device *pdev,
> +			  struct device_node *parent)
> +{
> +	struct irq_domain *irq_domain, *parent_domain;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct rzt2h_icu_priv *priv;
> +	int ret;
> +
> +	parent_domain = irq_find_host(parent);
> +	if (!parent_domain)
> +		return dev_err_probe(dev, -ENODEV, "cannot find parent domain\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base_ns = devm_of_iomap(dev, dev->of_node, 0, NULL);
> +	if (IS_ERR(priv->base_ns))
> +		return PTR_ERR(priv->base_ns);
> +
> +	priv->base_s = devm_of_iomap(dev, dev->of_node, 1, NULL);
> +	if (IS_ERR(priv->base_s))
> +		return PTR_ERR(priv->base_s);
> +
> +	ret = rzt2h_icu_parse_interrupts(priv, node);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "cannot parse interrupts: %d\n", ret);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "devm_pm_runtime_enable failed: %d\n", ret);
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "pm_runtime_resume_and_get failed: %d\n", ret);
> +
> +	raw_spin_lock_init(&priv->lock);
> +
> +	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, RZT2H_ICU_NUM_IRQ,
> +						 dev_fwnode(dev),
> +						 &rzt2h_icu_domain_ops, priv);
> +	if (!irq_domain) {
> +		pm_runtime_put(dev);
> +		return -ENOMEM;
> +	}

The mix of 'return $ERR' and 'return dev_err_probe()' is confusing at best.

Thanks,

        tglx

