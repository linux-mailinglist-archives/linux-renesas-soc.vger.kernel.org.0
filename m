Return-Path: <linux-renesas-soc+bounces-3371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C186E37A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FDCB1F22749
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93C169E18;
	Fri,  1 Mar 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f4PY3Gws";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g7O8mLTj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8823AC12
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709303958; cv=none; b=F83509KFCKTeJAdTmFg7tW9JjoHrTlS+UiU/Ow1CTG4HdHVVEJkle+7IF//PjfPb55uPvcgWMOmND8u6KxlA4IjSP+j1Td/8SITkgpJa9lBRh2a9XvmsmVWch//6X8XEMvyupHInDywewlKcWl85qaqv/vGXAODC2UW+Uuer/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709303958; c=relaxed/simple;
	bh=Ywr/jtMjiZvpwcFqrOxh79CAJORAsZiqdrFXNQujTV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UU/RfCF+nK3LDc1XiiPInVJGjFKnVmK+nK8MzlskDMfz1uxX+SjqmWrzd7ciWxdjTyeHfpZpngmHqlV5cvErvITsvD8zmTfg4WpJKlNY+pAbca/L+RAHIGTD1KUJ//nHBub+gaVNdeuEkco5pySQ/FdAnrpu5mFUHb/jcAmcrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f4PY3Gws; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g7O8mLTj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709303954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PdFEoY/p2fxSHCK4MMCckbmDjHrlE5XDvAWYwGq1z5w=;
	b=f4PY3GwsogiAd234nnKbbCNxiYQDrI8XdZYTYuxo41KPAIif+xQHJRJo4fBs2HqWS9sLgN
	Wdqd7uqQXiKhrPCAomJZw1hKn5mbIZn85S+Xoz3jJQX6DUgVx62uumpli3hDX0t4bBXSFM
	lQD+SCbHe1n5KA4h0ZHzPJ3HKNn/AaTQWXbvMXN9NpVYBHqDNFLPUBUnlbpOYfj9BIYR0T
	yk/z1pPW/v45kGl+7Bdue8zfCWB552C+yc/lfMAtaZXN2FZXcZqSDsSkqkNHRJ4sY3uNb/
	UrISwMTgZ54Kplq9zHneK+h5sNIMi7te/lsuTALn3qPtSX581dBItsD9YsSZog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709303954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PdFEoY/p2fxSHCK4MMCckbmDjHrlE5XDvAWYwGq1z5w=;
	b=g7O8mLTjmsac66/a4ouBiweGZVq7v00zTskWbrts5OUlv0Vxv2Xt7dDwefBAQbmWzSuu2j
	QwPvS+nMkjiFwBDg==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] irqchip/renesas-rzg2l: Prevent IRQ HW race
In-Reply-To: <20240212113712.71878-2-biju.das.jz@bp.renesas.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-2-biju.das.jz@bp.renesas.com>
Date: Fri, 01 Mar 2024 15:39:14 +0100
Message-ID: <87a5nixbhp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> As per section "8.8.2 Clear Timing of Interrupt Cause" of the RZ/G2L
> hardware manual (Rev.1.45 Jan, 2024), it is mentioned that we need to
> clear the interrupt cause flag in the isr.

We need to clear? Please write changelogs in neutral tone. Also use
proper words instead of acronyms, this is not twatter.

I'm also failing to see the value of above sentence other that it
occupies space. The code already does that, no?

> It takes some time for the cpu to clear the interrupt cause
> flag. Therefore, to prevent another occurrence of interrupt due to
> this delay, the interrupt cause flag is read after clearing.

You really want to explain explicitely what the problem is. The above is
a novel 

Something like this:

  The irq_eoi() callback of the RX/G2L interrupt chip clears the
  relevant interrupt cause bit in the TSCR register.

  This write is not sufficient because the write is posted and therefore
  not guaranteed to immediately clear the bit. Due to that delay the CPU
  can raise the just handled interrupt again.

  Prevent this by reading the register back which causes the posted
  write to be flushed to the hardware before the read completes.

This uses the proper technical term 'posted write' which is well defined
and exactly the cause of the problem, no?

> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
> index 9494fc26259c..46f9b07e0e8a 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -111,8 +111,11 @@ static void rzg2l_tint_eoi(struct irq_data *d)
>  	u32 reg;
>  
>  	reg = readl_relaxed(priv->base + TSCR);
> -	if (reg & bit)
> +	if (reg & bit) {
>  		writel_relaxed(reg & ~bit, priv->base + TSCR);
> +		/* Read to avoid irq generation due to irq clearing delay */

		/*
                 * Enforce that the posted write is flushed to prevent
                 * that the just handled interrupt is raised again.
                 */

Hmm?

> +		readl_relaxed(priv->base + TSCR);

Thanks,

        tglx

