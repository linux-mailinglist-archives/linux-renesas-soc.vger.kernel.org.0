Return-Path: <linux-renesas-soc+bounces-25074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FCC80D7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7823A5CEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883B730B515;
	Mon, 24 Nov 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tIrDCgKH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eSXH4BtR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24426FDB2;
	Mon, 24 Nov 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992172; cv=none; b=fxgoBi1DKuczL4BQPL39ID9VUhM9Ol7DghF7Q/B6NC//wFUwNT6eIkAU0K7AKU0ER5LE2BGaJ/GCvYbmPi5oPVN3xfMfz1qVr5HK73XSiK0u2G1sw1o5PISWoap952r85pvJprgkjfC/mSwrghxTJsrwfj8FtwcXyZjZqvEnj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992172; c=relaxed/simple;
	bh=zwdEtHzrVZnifmjxyDWGtPKkMrErGrW+cDEcONyxQik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qgCLBTHO97+XTM0+fWMqNo8YDu1iU5SLutj1z83VF+vc+FuMKQB5tfr1EZBNCXv/kTRIQKIfOXbfaLv19L69D2+qKm/NgAiGX7LsFClE9CvsCTY2+OCPHuMtIjNyVEkwDsbbsYX4Ygmgt0eqV6jk+hN5tQa5ZvteR6VB/ruekys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tIrDCgKH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eSXH4BtR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763992168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+fzxGnwwr/l7wvCtxcTwrR7zYqdvjf2vitkjEWTOOg=;
	b=tIrDCgKHjy1eri2H1Pk336hpFqOH7hMGk8ieCW4529vBvpRs2da6shYJvVlw7x3/4CM+3K
	a4Wzz0rCg1YqSBqs9S+JI4WaBhteX0w3WZjXgSZ91SlhssbB0nxkGYgCxkdO/S4h/FY6Gx
	M4MHjLFbRslXXG4HrxkFwte+EL6l0Yk5Pk/DuBkqIFx1h4gI3984Ls9QG31KQXHneAtDZn
	o8NnRkk/GAK7Zwn8QRNlBhRS7LFSEemGU+uDExg02eBKwg2c52Hgaf3AwA7jRjCuTDt5Tj
	tw4/fTi2QkMBLPABfdC4oOHN/20aW8lj9rdFLxiogTxWyXCnU0CqYEcugHh5Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763992168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+fzxGnwwr/l7wvCtxcTwrR7zYqdvjf2vitkjEWTOOg=;
	b=eSXH4BtR6vUJNSkaYKGrCkuFbcUnsr3eKfg/JBoxVcCYws/wk5NndTJp+E+moUW1j8wDR9
	wewweHgLzjESu9Dg==
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
In-Reply-To: <TYYPR01MB139556A313B1377F9306A7F6485D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <87see6hxjb.ffs@tglx>
 <TYYPR01MB139556A313B1377F9306A7F6485D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
Date: Mon, 24 Nov 2025 14:49:27 +0100
Message-ID: <87ecpnilqw.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 24 2025 at 12:50, Cosmin-Gabriel Tanislav wrote:
>> -----Original Message-----
>> From: Thomas Gleixner <tglx@linutronix.de>
>> Sent: Saturday, November 22, 2025 5:56 PM
>> To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>; Rob Herring <robh@kernel.org>;
>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Geert Uytterhoeven
>> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; Cosmin-Gabriel Tanislav <cosmin-
>> gabriel.tanislav.xa@renesas.com>
>> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org
>> Subject: Re: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU) driver

Can you please fix your mail-client not to copy the whole header into
the reply?

>> On Fri, Nov 21 2025 at 13:14, Cosmin Tanislav wrote:
>> > +static inline int rzt2h_icu_irq_to_offset(struct irq_data *d, void __iomem **base,
>> > +                                     unsigned int *offset)
>> > +{
>> > +   struct rzt2h_icu_priv *priv = irq_data_to_priv(d);
>> > +   unsigned int hwirq = irqd_to_hwirq(d);
>> > +
>> > +   if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
>> > +           *offset = hwirq - RZT2H_ICU_IRQ_NS_START;
>> > +           *base = priv->base_ns;
>> > +   } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
>> > +              /* SEI follows safety IRQs in registers and in IRQ numbers. */
>> > +              RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
>>
>> This nested commend in the condition is really unreadable.
>>
>
> Would this read better in your opinion?
>
>         /*
>          * Safety IRQs and SEI use a separate register space from the non-safety IRQs.
>          * SEI interrupt number follows immediately after the safety IRQs.
>          */
>         if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
>                 *offset = hwirq - RZT2H_ICU_IRQ_NS_START;
>                 *base = priv->base_ns;
>         } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
>                    RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
>                 *offset = hwirq - RZT2H_ICU_IRQ_S_START;
>                 *base = priv->base_s;
>         } else {
>                 return -EINVAL;
>         }

Yes. Way better.

> One more thing, for the above cases where the same macro is used twice
> in a condition, is it okay to keep it split across two lines to align
> them with each other, or do you want them on a single line up to 100
> columns?

Usually single line, but in this case it might be more readable. Up to you.

>> > +   if (!irq_domain) {
>> > +           pm_runtime_put(dev);
>> > +           return -ENOMEM;
>> > +   }
>>
>> The mix of 'return $ERR' and 'return dev_err_probe()' is confusing at best.
>>
>
> For ENOMEM, dev_err_probe() doesn't really print anything. ENOMEM is
> what other drivers seem to use for a NULL irq_domain_create_hierarchy()
> result.

That's what I was missing. Now it makes sense.

Thanks,

        tglx


