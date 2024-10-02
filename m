Return-Path: <linux-renesas-soc+bounces-9315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C198D1B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 12:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A066E1C2238E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F2B1E766C;
	Wed,  2 Oct 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S6HLpR1o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lmdLYM+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D471E7676;
	Wed,  2 Oct 2024 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866291; cv=none; b=GRc+rhNX6+sUQIA1pRwZf7nP8NDzvI4r/iuX2h2zS5xI+7gRF5Ct3ewFtwL3IZQivNjc0Gk0RxfmKcHTydEj4CPVdyBU/XfXXSWv0Y9ePxkwrXrEYJALunoe/73KnBfFRyrf1r7XCsZiukZgWKuzc3yz5IxGRP5bRjzlv6LZOiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866291; c=relaxed/simple;
	bh=pKO8jwp3Xx6rtGW9VhFjgdjmRgs0GnhC06nvK4W4nCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pcyH6HPY1DGf99sqtlV0HJZakt17Usod4a8+owPxoMd+s41TMZWBw27K2rvNvBrkTvNVeiUVaqIdWJW4pqAwc4xkNjQizLMGYX+zP70EAm9NIYH0vcJpfUTDWl65y/b/i/vDEQ168Jxv0c4c2fZGrQp44KjAuMxm/QBJ8Z6R3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S6HLpR1o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lmdLYM+Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727866287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/SYdy35yyjQQZ2IKnIcimcBRkzzbCgDBichyKF03co=;
	b=S6HLpR1oRLURtweQzc03F+aXIw4vXSeXtXaQLvqkdmdc6esH56tKSg/R8ovOcNLUg9Fil+
	Z4LCT3wrdBPq9SqONpWLqySM6jrkKdtx+vvAze2vq2pc13hIdUaq0nMvxGySThRhE67BC/
	ynPITvpdGlxkYWY7e2caGhhjtpcktZlb4MOWPDOf4SEGTyVlhRjoxZ37UKBNtJenHX3uoa
	vwoUQNWPI5jJUA2HcwoHYopRYUlWWNaSStc4SLxLQ+NAH/aXgSjZxM6pm4HHScMa6yj60g
	yAosOB2GgCnCMtRV57QlperfyNCmL9lML1nen8PaM59kO6N2Owsi72fvz/dPtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727866287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/SYdy35yyjQQZ2IKnIcimcBRkzzbCgDBichyKF03co=;
	b=lmdLYM+Q/sKxSbmoc2yeHnEJRhfn+3SW4wx7f27q4PPq8VceA+YAVHW7sKzBClH42tYc2a
	6/DAtDPaMP6HETBg==
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Magnus Damm
 <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Paterson
 <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver
In-Reply-To: <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
Date: Wed, 02 Oct 2024 12:51:27 +0200
Message-ID: <87bk02ydzk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 17 2024 at 18:32, Fabrizio Castro wrote:
> +
> +/* DT "interrupts" indexes */
> +#define ICU_IRQ_START				1
> +#define ICU_IRQ_COUNT				16
> +#define ICU_TINT_START				(ICU_IRQ_START + ICU_IRQ_COUNT)
> +#define ICU_TINT_COUNT				32
> +#define ICU_NUM_IRQ				(ICU_TINT_START + ICU_TINT_COUNT)
> +
> +/* Registers */
> +#define ICU_NSCNT				0x00
> +#define ICU_NSCLR				0x04
> +#define ICU_NITSR				0x08
> +#define ICU_ISCTR				0x10
> +#define ICU_ISCLR				0x14
> +#define ICU_IITSR				0x18
> +#define ICU_TSCTR				0x20
> +#define ICU_TSCLR				0x24
> +#define ICU_TITSR(k)				(0x28 + (k) * 4)
> +#define ICU_TSSR(k)				(0x30 + (k) * 4)
> +
> +/* NMI */
> +#define ICU_NMI_EDGE_FALLING			0
> +#define ICU_NMI_EDGE_RISING			1
> +
> +#define ICU_NSCNT_NSTAT				BIT(0)
> +#define ICU_NSCNT_NSTAT_DETECTED		1
> +
> +#define ICU_NSCLR_NCLR				BIT(0)
> +
> +/* IRQ */
> +#define ICU_IRQ_LEVEL_LOW			0
> +#define ICU_IRQ_EDGE_FALLING			1
> +#define ICU_IRQ_EDGE_RISING			2
> +#define ICU_IRQ_EDGE_BOTH			3
> +
> +#define ICU_IITSR_IITSEL_PREP(iitsel, n)	((iitsel) << ((n) * 2))
> +#define ICU_IITSR_IITSEL_GET(iitsr, n)		(((iitsr) >> ((n) * 2)) & 0x03)
> +#define ICU_IITSR_IITSEL_MASK(n)		ICU_IITSR_IITSEL_PREP(0x03, n)
> +
> +/* TINT */
> +#define ICU_TINT_EDGE_RISING			0
> +#define ICU_TINT_EDGE_FALLING			1
> +#define ICU_TINT_LEVEL_HIGH			2
> +#define ICU_TINT_LEVEL_LOW			3
> +
> +#define ICU_TSSR_K(tint_nr)			((tint_nr) / 4)
> +#define ICU_TSSR_TSSEL_N(tint_nr)		((tint_nr) % 4)
> +#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
> +#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
> +#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
> +
> +#define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
> +#define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
> +#define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel, n)
> +#define ICU_TITSR_TITSEL_MASK(n)		ICU_IITSR_IITSEL_MASK(n)
> +#define ICU_TITSR_TITSEL_GET(titsr, n)		ICU_IITSR_IITSEL_GET(titsr, n)
> +
> +#define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
> +#define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
> +#define ICU_PB5_TINT				0x55
> +
> +/**
> + * struct rzv2h_icu_priv - Interrupt Control Unit controller private data
> + * structure.

If you need a line break, then please format it so:

 * struct rzv2h_icu_priv - Interrupt Control Unit controller private data
 *			   structure.

This makes it readable.

> +static void rzv2h_clear_nmi_int(struct rzv2h_icu_priv *priv)
> +{
> +	u32 nscnt = readl_relaxed(priv->base + ICU_NSCNT);
> +
> +	if ((nscnt & ICU_NSCNT_NSTAT) == ICU_NSCNT_NSTAT_DETECTED)
> +		writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> +}
> +
> +static void rzv2h_clear_irq_int(struct rzv2h_icu_priv *priv, unsigned int hwirq)
> +{
> +	unsigned int irq_nr = hwirq - ICU_IRQ_START;
> +	u32 isctr, iitsr, iitsel;
> +	u32 bit = BIT(irq_nr);
> +
> +	isctr = readl_relaxed(priv->base + ICU_ISCTR);
> +	iitsr = readl_relaxed(priv->base + ICU_IITSR);
> +	iitsel = ICU_IITSR_IITSEL_GET(iitsr, irq_nr);

Not that I care about the performance of your device, but why do you
need to read back the type configuration. It's known and cached in
irq_data, no?

Also this is invoked from eoi(), so why would the bit not be set when
the interrupt is type edge and has fired? It should be set which means
the ISCTR read is pointless too. Unless I'm missing something,

> +static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv,
> +				 unsigned int hwirq)

No line break required.

> +{
> +	unsigned int tint_nr = hwirq - ICU_TINT_START;
> +	int titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
> +	u32 tsctr, titsr, titsel;
> +	u32 bit = BIT(tint_nr);
> +	int k = tint_nr / 16;
> +
> +	tsctr = readl_relaxed(priv->base + ICU_TSCTR);
> +	titsr = readl_relaxed(priv->base + ICU_TITSR(k));
> +	titsel = ICU_TITSR_TITSEL_GET(titsr, titsel_n);

Same comment.

> +static void rzv2h_icu_eoi(struct irq_data *d)
> +{
> +	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +
> +	raw_spin_lock(&priv->lock);

  scoped_guard(raw_spinlock, ....) {

> +	if (hw_irq >= ICU_TINT_START)
> +		rzv2h_clear_tint_int(priv, hw_irq);
> +	else if (hw_irq >= ICU_IRQ_START)
> +		rzv2h_clear_irq_int(priv, hw_irq);
> +	else
> +		rzv2h_clear_nmi_int(priv);

Huch. Is NMI a real NMI or just some unmaskable regular interrupt?

If it's a real NMI, then you _cannot_ take the spinlock here.


> +	raw_spin_unlock(&priv->lock);
> +
> +	irq_chip_eoi_parent(d);
> +}
> +
> +static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
> +{
> +	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +	u32 tint_nr, tssel_n, k, tssr;
> +
> +	if (hw_irq < ICU_TINT_START)
> +		return;
> +
> +	tint_nr = hw_irq - ICU_TINT_START;
> +	k = ICU_TSSR_K(tint_nr);
> +	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
> +
> +	raw_spin_lock(&priv->lock);

guard()

> +	tssr = readl_relaxed(priv->base + ICU_TSSR(k));
> +	if (enable)
> +		tssr |= ICU_TSSR_TIEN(tssel_n);
> +	else
> +		tssr &= ~ICU_TSSR_TIEN(tssel_n);
> +	writel_relaxed(tssr, priv->base + ICU_TSSR(k));
> +	raw_spin_unlock(&priv->lock);
> +}

> +	raw_spin_lock(&priv->lock);

guard()

> +static const struct irq_domain_ops rzv2h_icu_domain_ops = {
> +	.alloc = rzv2h_icu_alloc,
> +	.free = irq_domain_free_irqs_common,
> +	.translate = irq_domain_translate_twocell,

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

> +};
> +
> +static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv,
> +				       struct device_node *np)

Please get rid of the line breaks. You have 100 characters.

Thanks,

        tglx

