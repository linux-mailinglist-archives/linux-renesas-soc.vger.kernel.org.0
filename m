Return-Path: <linux-renesas-soc+bounces-3385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65086E481
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5E51F26482
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE441C33;
	Fri,  1 Mar 2024 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q1L+hSjD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8PU8kGKh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525439FCF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307378; cv=none; b=RsyXFTS/3LUYjGBb+2Z8SxDOaQdy6wAEUsge/eeJPJJ7fzj/0QRTqz7sE7tADDWE2Nwr4gmH0IcFlU6jN7p25u/lv3uHRtBfuMCUS6YnWRPOtbLYNwAg0YmAFQvTQqRPHnIuKme3j9WoP/oq7DDUUBEw5LFmbJIgPx8AeF7YWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307378; c=relaxed/simple;
	bh=I4fFFyyYJkuhnK8+GPfaqXonmDqZZwcNjgIWqOJ4OTw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D0Z6dh5GGHP8PFm1lI4ulrbk3XHm9x9YSlcrsV+GDmJm+ly1SF2YMEovZkbrwrUoJG9dHtOfwn3DcUpYkul9BFR+S0YNCBdHXrFNLCHiDFRWIx3A6w7I2OmyMQc2sUsU4XCCYx47kltzZ8kAXvYS6axWhpTBrs6cZQeYMSvSOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q1L+hSjD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8PU8kGKh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709307374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hcitAI3v8f3eGTwuj1qUxc+mdgsfvKBqDk5tvvAPqXM=;
	b=q1L+hSjDvbnV2BSLN2YG8cWxvdW61TmuVhZazOx+qY1V9QoJKgUFtCrpYeUnZ2d6nQ7mZj
	ZRq25Js5H5hDiSC/G153dggZtAbsdErecZ43w9/8Z8vdmu3NdsNrltU7BRYjBk2ouqjxtx
	F2dVKdYVxZivRS9Zq67OyUxFR4hpYj6OrnSf2n6mjpm8KJASEnTP5tyeHDwoxwAcwsbslS
	mM1KU4EH7lP8oZerAGBXsHXgmPRtUt1SZnNDBXi67l2OrSqfMsVMkfXv6xNuy3ewUpXI40
	GUaD6iq9Kxx9+HzERVpN0Au9p/u9KUcdn+gulze0Vv05cvt0BPWWBDi9viyrsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709307374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hcitAI3v8f3eGTwuj1qUxc+mdgsfvKBqDk5tvvAPqXM=;
	b=8PU8kGKhADLARkZeF+QS6X56KFAIMq9FA66anIP9DBFAWq+EEBtwWrCFWws0A77FgEUZ5K
	emCmWkFtnG5ULKBg==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] irqchip/renesas-rzg2l: Fix spurious TINT IRQ
In-Reply-To: <20240212113712.71878-4-biju.das.jz@bp.renesas.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-4-biju.das.jz@bp.renesas.com>
Date: Fri, 01 Mar 2024 16:36:14 +0100
Message-ID: <8734tax8up.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> As per RZ/G2L hardware manual Rev.1.45 section 8.8.3 Precaution when
> changing interrupt settings, we need to mask the interrupts while
> setting the interrupt detection method. Apart from this we need to clear
> interrupt status after setting TINT interrupt detection method to the
> edge type.

No 'we|us|...' please. See:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> First disable TINT enable and then set TINT source. After that set edge
> type and then clear the interrupt status register.

Again the above novel about the manual really does not explain what the
actual problem is. I can crystal ball it out from what the patch does,
but that really wants to be written out here.


> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 46 ++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
> index 74c8cbb790e9..c48c8e836dd1 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -117,6 +117,40 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv,
>  	}
>  }
>  
> +static void rzg2l_tint_endisable(struct rzg2l_irqc_priv *priv, u32 reg,
> +				 u32 tssr_offset, u32 tssr_index,
> +				 bool enable)

The 80 character limit does not exist anymore. It's 100 today. Please
get rid of the extra line breaks when adding new code.

> +{
> +	if (enable)
> +		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
> +	else
> +		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
> +
> +	writel_relaxed(reg, priv->base + TSSR(tssr_index));
> +}
> +
> +static void rzg2l_disable_tint_and_set_tint_source(struct irq_data *d,
> +						   struct rzg2l_irqc_priv *priv,
> +						   u32 reg, u32 tssr_offset,
> +						   u8 tssr_index)
> +{
> +	unsigned long tint = (uintptr_t)irq_data_get_irq_chip_data(d);
> +	u32 val;
> +
> +	rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, false);
> +	val = (reg >> TSSEL_SHIFT(tssr_offset)) & ~TIEN;

So this shifts the byte which contains the control bit for the interrupt
down to bit 0-7 and clears the TIEN bit (7).

> +	if (tint != val) {

And now it compares it to the TINT value which was associated when the
interrupt was allocated. How is this correct?

Depending on tssr_offset reg is shifted right by tssr_offset * 8. Right?

So the comparison is only valid when tssr_offset == 3 because otherwise
bit 8-31 contain uncleared values, no?

> +		reg |= tint << TSSEL_SHIFT(tssr_offset);
> +		writel_relaxed(reg, priv->base + TSSR(tssr_index));

So this writes again to the same register as the unconditional write via
rzg2l_tint_endisable(). What is all this conditional voodoo for? 

	u32 tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);

        /* Clear the relevant byte in reg */
        reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
        /* Set TINT and leave TIEN clear */
        reg |= tint << TSSEL_SHIFT(tssr_offset);
	writel_relaxed(reg, priv->base + TSSR(tssr_index));
        
Does exactly the correct thing without any conditional in a
comprehensible way, no?

> +	}
> +}
> +
> +static bool rzg2l_is_tint_enabled(struct rzg2l_irqc_priv *priv, u32 reg,
> +				  u32 tssr_offset)
> +{

The 'priv' argument is unused.

> +	return !!(reg & (TIEN << TSSEL_SHIFT(tssr_offset)));
> +}


> +
>  static void rzg2l_irqc_eoi(struct irq_data *d)
>  {
>  	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> @@ -214,8 +248,11 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
>  	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
>  	unsigned int hwirq = irqd_to_hwirq(d);
>  	u32 titseln = hwirq - IRQC_TINT_START;
> +	u32 tssr_offset = TSSR_OFFSET(titseln);
> +	u8 tssr_index = TSSR_INDEX(titseln);
> +	bool tint_enable;
>  	u8 index, sense;
> -	u32 reg;
> +	u32 reg, tssr;
>  
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_RISING:
> @@ -237,10 +274,17 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
>  	}
>  
>  	raw_spin_lock(&priv->lock);
> +	tssr = readl_relaxed(priv->base + TSSR(tssr_index));
> +	tint_enable = rzg2l_is_tint_enabled(priv, tssr, tssr_offset);
> +	rzg2l_disable_tint_and_set_tint_source(d, priv, tssr,
> +					       tssr_offset, tssr_index);
>  	reg = readl_relaxed(priv->base + TITSR(index));
>  	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
>  	reg |= sense << (titseln * TITSEL_WIDTH);
>  	writel_relaxed(reg, priv->base + TITSR(index));
> +	rzg2l_clear_tint_int(priv, hwirq);
> +	if (tint_enable)
> +		rzg2l_tint_endisable(priv, tssr, tssr_offset, tssr_index, true);
>  	raw_spin_unlock(&priv->lock);

This whole tint_enable logic is overly complex.

  	raw_spin_lock(&priv->lock);
	tssr = readl_relaxed(priv->base + TSSR(tssr_index));
	tssr = rzg2l_disable_tint_and_set_tint_source(d, priv, tssr, tssr_offset, tssr_index);
  	reg = readl_relaxed(priv->base + TITSR(index));
  	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
  	reg |= sense << (titseln * TITSEL_WIDTH);
  	writel_relaxed(reg, priv->base + TITSR(index));
	rzg2l_clear_tint_int(priv, hwirq);
	writel_relaxed(tssr, priv->base + TSSR(tssr_index));
 	raw_spin_unlock(&priv->lock);

All it needs is to let rzg2l_disable_tint_and_set_tint_source() return
the proper value for writing back.

	u32 tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
        u32 tien = reg & (TIEN << TSSEL_SHIFT(tssr_offset));

        /* Clear the relevant byte in reg */
        reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
        /* Set TINT and leave TIEN clear */
        reg |= tint << TSSEL_SHIFT(tssr_offset);
	writel_relaxed(reg, priv->base + TSSR(tssr_index));
        return reg | tien;

The extra unconditional TSSR write at the end of rzg2l_tint_set_edge()
is really not worth to optimize for.

Keep it simple and comprehensible. That's not a hotpath.

Thanks,

        tglx

