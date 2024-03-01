Return-Path: <linux-renesas-soc+bounces-3372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6B86E38F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53181B240CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 14:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC0C20E4;
	Fri,  1 Mar 2024 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TdcOI8Ru";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="53PMr6/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12D23DE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709304084; cv=none; b=dita2HC1yttWzlScL3DnHj0H1YP8RFmpcC3XfAR6DXnSrt/HUlS/ejmDkKyJYYvngCscJPW8q6DNssU7A9WOxjWtjNzdUGfMWRUuuvdrphA+Cp9MMrCr3e5yzmsBPnrDUEohmwkpR0n5zm/vlPVo3y6bRr1rXcBlZ3ap/D95XOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709304084; c=relaxed/simple;
	bh=v+9ktj9cXESCfh0rkxySWPRTmyTtDhYBUYAdGnb8ZYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WyMGloStMo1erslOT/u4Wnj2IHkLu/U6ybORV2wL2rmvvz3J+mvTtl25/TPpLN0P7U2farLJ3lX1jzSB5anAqwEGDwxJ/5z6C0FWPGXuaZXNDdmu5Ac3rByiniUK0naHgEXO7yxy2e3+zk9tPjQ3c3LGFSe3Cwd4IQ4uSY8doOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TdcOI8Ru; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=53PMr6/7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709304080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YgvrlnhYEWcishxY6ecweEK6wxvu3RMQf0pXiUCSGiM=;
	b=TdcOI8Ru4KITNaPBHc8sN2mtOoEuwnwVPjSk91Ea3SuYtYGQUJ3ODUXH22GH7nKLtYNDqI
	aFMp3QRWFiYjf3fR8JrpCvZT3JeM8rJWAcymhrTG9/IazewIWqDstHpItSDslP1hkJV8vb
	tQzZSRn7zzhjq0nlLhnTjowsW3aKKqd2/rq12edAfpgc53PrBv/VkyVJjEDAAC06nVuA17
	YTcu3se2ld1rcV5bY4ltsv9Lyru+LGJdvaSMBms2uI1LAdjLIzI0c8juAGMl0VxpxGVxgI
	80Q0S5olvvlc2sz/hYHHA0UJB1zh/Fw8WZeOwereUA4T+V4oNawEMVzld9ffsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709304080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YgvrlnhYEWcishxY6ecweEK6wxvu3RMQf0pXiUCSGiM=;
	b=53PMr6/7eXjn5le2NHAwmXacxHpJVHLAWeAO31MQxkqPWxC/K5bUJ7kjtX2ql+YsH/NlLS
	HcndtL4Gx0ROYYBw==
To: Geert Uytterhoeven <geert@linux-m68k.org>, Biju Das
 <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier
 <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
In-Reply-To: <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
Date: Fri, 01 Mar 2024 15:41:20 +0100
Message-ID: <877cimxbe7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 12 2024 at 17:38, Geert Uytterhoeven wrote:
>> -static void rzg2l_tint_eoi(struct irq_data *d)
>> +static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv,
>> +                                unsigned int hwirq)
>>  {
>> -       unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_TINT_START;
>> -       struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
>> -       u32 bit = BIT(hw_irq);
>> +       u32 bit = BIT(hwirq - IRQC_TINT_START);
>>         u32 reg;
>>
>>         reg = readl_relaxed(priv->base + TSCR);
>> @@ -127,7 +126,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
>>         if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
>>                 rzg2l_irq_eoi(d);
>>         else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
>> -               rzg2l_tint_eoi(d);
>> +               rzg2l_clear_tint_int(priv, hw_irq);
>
> Perhaps pass the tint number (i.e. "hw_irq - IRQC_TINT_START")
> instead?

No. You have to do that on all call sites then. There is another coming
in the next patch AFAICT.

Thanks,

        tglx

