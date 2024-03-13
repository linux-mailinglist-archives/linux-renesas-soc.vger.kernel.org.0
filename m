Return-Path: <linux-renesas-soc+bounces-3741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4366F87A9A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 15:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1BF2868D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 14:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD46ABA;
	Wed, 13 Mar 2024 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DGkRXJKb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y4zD1xpZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F8610E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710340713; cv=none; b=ooS2O9gZLWAw+smePLnsVk3KIt8xp/L5TMHLcefV5z6GdMptD1wD2ic0EdJ0+QLUdjom5dRPDp6R295dx780l/Mdf+qdvw34uqN+2gc5zVre5ZmyppqRy+bFn1a7QwhVZmJSiQnCXnJQjrqgUHUSIWTMua75qIM1p9CE/JvUvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710340713; c=relaxed/simple;
	bh=wbghTZTHCNh7MqRPg2xzfZlz3aiDyufO9ZTI7mU7QZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HqPby543JRgneAVEDHrBv3mC9euMwId0Olz6qhoBhdLJR6UPsr8LuFFoaHdO6MD6P4ZF1lGxdyppzeR1Onirr1Jx2veittd2KHoiDDNezZexeN58ef/xolutJ8hK4bkZ8NwWGP9+r8gFtnFJR8rg7tEF9s59LxNQt9b+90RT/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DGkRXJKb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y4zD1xpZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710340710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbQLn94TtdGnfn9OmYQrtoQzijbgzdjFlTA4L6sHfRM=;
	b=DGkRXJKbqJEM3Rr9bV6fZqUHAXgK7I93p+imjgDp0r1CYNzdJlEiWEEQCFNhtW/R6HoclK
	4di3J+fHt9L/dR+6ataYCUYP3VhJII+1Ba/vgMm4UTA8B35uuEalrPZ8HhGwDjuEwnFGKB
	v215iwUJnCxswWQBGM+j599EeeVowgBXBRbhouCBB5FR5u39HvZ+y5y5Qp4EicTgsAvYwQ
	1AYLnc/XFbYWgaFAOOwAN86j4wWkfTtcvXG/k0hyj6+0dlfNM9eVJHFkXXsT8QhNLMpbyn
	zgee/LoOmO1v9ONteG84d45yZvhqOPHiwncEulUvGL7wSOWRLsqDSADiti6qIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710340710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbQLn94TtdGnfn9OmYQrtoQzijbgzdjFlTA4L6sHfRM=;
	b=Y4zD1xpZMDMDoFMhHtetauWupaYQbt7yIHpAd5YDnNn41EeTjkGimAmhtxuyM0JS4d89P7
	2RfhpPpmyECJa0Bg==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
In-Reply-To: <20240305183922.138727-5-biju.das.jz@bp.renesas.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-5-biju.das.jz@bp.renesas.com>
Date: Wed, 13 Mar 2024 15:38:29 +0100
Message-ID: <87msr2nqmy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 05 2024 at 18:39, Biju Das wrote:

Sorry. I just noticed that this series fell through the cracks.

>  static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
>  {
> -	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
>  	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hwirq = irqd_to_hwirq(d);
> +	u32 iitseln = hwirq - IRQC_IRQ_START;
> +	bool clear_irq_int = false;
> +	unsigned long flags;
>  	u16 sense, tmp;
>  
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
> @@ -192,37 +195,59 @@ static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
>  
>  	case IRQ_TYPE_EDGE_FALLING:
>  		sense = IITSR_IITSEL_EDGE_FALLING;
> +		clear_irq_int = true;
>  		break;
>  
>  	case IRQ_TYPE_EDGE_RISING:
>  		sense = IITSR_IITSEL_EDGE_RISING;
> +		clear_irq_int = true;
>  		break;
>  
>  	case IRQ_TYPE_EDGE_BOTH:
>  		sense = IITSR_IITSEL_EDGE_BOTH;
> +		clear_irq_int = true;
>  		break;
>  
>  	default:
>  		return -EINVAL;
>  	}
>  
> -	raw_spin_lock(&priv->lock);
> +	raw_spin_lock_irqsave(&priv->lock, flags);

irq_set_type() is always called with irq_desc::lock held and
interrupts disabled. What's exactly the point of this change?


