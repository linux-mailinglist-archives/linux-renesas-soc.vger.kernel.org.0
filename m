Return-Path: <linux-renesas-soc+bounces-12932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 872AFA2BCE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 08:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E31160C51
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E103A1A3A94;
	Fri,  7 Feb 2025 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q5aa2etM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+NPum2S2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBEB1A4E70;
	Fri,  7 Feb 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914571; cv=none; b=FpvPV1kOhVuV3RccZm1qeexadsklPQZma26TzbbrAqIQcfGMY5+elBVpdGQQZOQjllJvnGCjlceVJtwNUizAAB3YbIWKAFRbsF/j4SaE4MYLMR1zP/ubyf6D/yTzTbgmMweQrIe5rsBx0zHkHPCRjelheUYpnqXb9ziTATdzBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914571; c=relaxed/simple;
	bh=Bje5bojcRM8J4jR5HPNaqNStWU0axgYTUejPVJig7EU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sDrJIuflqA27JSN21y36E1zb3Pxga5OVSwoygaGtGl8tjCxFmLjGpbmlkoX91I26G5VdNk9msuhMw6Im2lMHJUpfo1lS72uOSypJtmAw2RkuZ1UqgFJJMb5C0AXdQ0DMt3FxWp+CjrOv1obuxvUHzuLDzM/xIfvm/OjHJIXZjjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q5aa2etM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+NPum2S2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738914567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2f8vfzWNSnHoscologJ/G9sN68QvAuR2/hQ39ggmHe4=;
	b=q5aa2etMX90igNKwS1KcBtWR/FJmkrr9JNZCjM+W+3Az5GrMQQz2HKNYg1rDKcWn1CtFB2
	rPehQGSvoI7b/4JT1EL2zkdlgL5aHkWPBv74bOT6J6Ko60M3PsEHby0gUNLa62C6UEd1rC
	fqD8M58pcXUJtp/RDqOnwHDybPHQQAsoGzQLKFGaRigO/Vn0lROkVtaOUrKc0Ci82AIVrI
	/pMZ3ywPEp6UzyVmnokVfRmeyHyqWIA8izOUYMOWLbskQ7l9KKY6fp5l2b8mglaS5iCRhX
	VRU7W+IjPocAYfcKojMFTgHYCbOxUtQ5wBq0ulHJVunJCNn/CRbsi9sy75ZbuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738914567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2f8vfzWNSnHoscologJ/G9sN68QvAuR2/hQ39ggmHe4=;
	b=+NPum2S23nHQ50f22LhjHCI0twVdcSnghFuXP40PeEMPDLzfPJJmHB97jhwaXUyTIr9KsU
	8pidCWl7h7cmrHCw==
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
In-Reply-To: <20250206220308.76669-5-fabrizio.castro.jz@renesas.com>
References: <20250206220308.76669-1-fabrizio.castro.jz@renesas.com>
 <20250206220308.76669-5-fabrizio.castro.jz@renesas.com>
Date: Fri, 07 Feb 2025 08:49:27 +0100
Message-ID: <87ed0amby0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 06 2025 at 22:03, Fabrizio Castro wrote:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> +#define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
> +#define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
>  
>  /* NMI */
>  #define ICU_NMI_EDGE_FALLING			0
> @@ -80,6 +83,19 @@
>  #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
>  #define ICU_PB5_TINT				0x55
>  
> +/* DMAC */
> +#define ICU_DMAC_DkSEL_CLRON_MASK		BIT(15)
> +#define ICU_DMAC_DkRQ_SEL_MASK			GENMASK(9, 0)
> +#define ICU_DMAC_DMAREQ_MASK			(ICU_DMAC_DkRQ_SEL_MASK | \
> +						 ICU_DMAC_DkSEL_CLRON_MASK)
> +
> +#define ICU_DMAC_PREP_DkSEL_CLRON(x)		FIELD_PREP(ICU_DMAC_DkSEL_CLRON_MASK, (x))
> +#define ICU_DMAC_PREP_DkRQ_SEL(x)		FIELD_PREP(ICU_DMAC_DkRQ_SEL_MASK, (x))
> +#define ICU_DMAC_PREP_DMAREQ(sel, clr)		(ICU_DMAC_PREP_DkRQ_SEL(sel) | \
> +						ICU_DMAC_PREP_DkSEL_CLRON(clr))

That's a pretty convoluted way to create a mask whihc has the CLRON bit
always set to 0 according to the only usage site.

> +#define ICU_DMAC_DACK_SEL_MASK			GENMASK(6, 0)

> +void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
> +				    u16 req_no, u8 ack_no)
> +{
> +	struct rzv2h_icu_priv *priv = platform_get_drvdata(icu_dev);
> +	u32 icu_dmackselk, dmaack, dmaack_mask;
> +	u32 icu_dmksely, dmareq, dmareq_mask;
> +	u8 k, field_no;
> +	u8 y, upper;
> +
> +	if (req_no >= 0x1b5)

In the DMA part you use proper defines for this, but here you put magic
numbers into the code. Please share the defines and use them consistently.

> +		req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT;
> +
> +	if (ack_no >= 0x50)
> +		ack_no = RZV2H_ICU_DMAC_ACK_NO_DEFAULT;
> +
> +	y = dmac_channel / 2;
> +	upper = dmac_channel % 2;
> +
> +	dmareq = ICU_DMAC_PREP_DMAREQ(req_no, 0);
> +	dmareq_mask = ICU_DMAC_DMAREQ_MASK;
> +
> +	if (upper) {
> +		dmareq <<= 16;
> +		dmareq_mask <<= 16;
> +	}

You already have macros for this, so the obvious thing to do is to put
the shift magic into them:

/* Two 16 bit fields per register */
#define ICU_DMAC_DMAREQ_SHIFT(ch)		((ch & 0x01) * 16)

#define ICU_DMAC_PREP_DMAREQ(sel, ch)		(ICU_DMAC_PREP_DkRQ_SEL(sel)	\
                                                 << ICU_DMAC_DMAREQ_SHIFT(ch))
#define ICU_DMAC_DMAREQ_MASK(ch)		(ICU_DMAC_DkRQ_SEL_MASK		\
                                                 << ICU_DMAC_DMAREQ_SHIFT(ch))

        dmareq = ICU_DMAC_PREP_DMAREQ(req_no, ch);
        dmareq_mask = ICU_DMAC_DMAREQ_MASK(ch);

> +	k  = ack_no / 4;
> +	field_no = ack_no % 4;
> +
> +	dmaack_mask = ICU_DMAC_DACK_SEL_MASK << (field_no * 8);
> +	dmaack = ack_no << (field_no * 8);

Same here.

> +	guard(raw_spinlock_irqsave)(&priv->lock);
> +
> +	icu_dmksely = readl(priv->base + ICU_DMkSELy(dmac_index, y));
> +	icu_dmksely = (icu_dmksely & ~dmareq_mask) | dmareq;
> +	writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
> +
> +	icu_dmackselk = readl(priv->base + ICU_DMACKSELk(k));
> +	icu_dmackselk = (icu_dmackselk & ~dmaack_mask) | dmaack;
> +	writel(icu_dmackselk, priv->base + ICU_DMACKSELk(k));

Thanks,

        tglx

