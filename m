Return-Path: <linux-renesas-soc+bounces-27313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TTYDOjuIcmn7lwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 21:27:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0B6D67C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 21:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3279300BDB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 20:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0BD3A2AC4;
	Thu, 22 Jan 2026 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca8IFNa6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C6394466
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769113655; cv=none; b=uXpsiQ1yRkFS1WOgeS2331ffG54bv1+if7rUOUAU1TFo1w0csQkZKxrSQDprl4IXEME3AGua5u0GiXHMdejdSrlCKQauDbnCN/toBYydL67sfC/fj1I3+of3+l7kbyx+4/vTUaKPYUFkarjwuqrUdztzZYbeh60BD6Y9Rh/bT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769113655; c=relaxed/simple;
	bh=NKKxp8XslWhqHgE40+VZpWgrnehA4xyD/dkaXnrk8dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdosBPZ/Cx/VXwQ57OxgS2BSKKZ4N9CML3P6vnsDhY6sH2XSfC0YIMsH+Iz52RU39DIUkkTfmt04epp+ufc1rAvCF2XDOwQPp27TKuO2jQy2ZugEukt9D0P4bnM5Yb+eaEcoafakHr0r61XFcRwIrs7ZFGyojJx4J8CjyNI1hBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca8IFNa6; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c69ffb226eso188194585a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769113648; x=1769718448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTNx2TZxkL4VnUPzuBRv8diBN0csSmN/zfw5ymS8riM=;
        b=ca8IFNa6V1den1JYVCwzvzBaRZ9sA6y3oHGXjZXRmpgBuSJZH8uhtQJ/8WNEzd1lHJ
         eisU+WhhwyJ3UD9iuKupPY4xI2Yhi1P9dlB1f6qSlFXE0BHb+ulYqLldWoP1Bwai6Dyu
         z1E9RZcDgAhA0gq1lLM2cz0231JlEWKmw9zzTeK7fT7q/vZ9cQwJiiSHuFOW+4KeKYpY
         UIc7gL0oAJTMQteIruXYm4cZeupiRo7lbe5cupsrV/cD7LhfOBVscwKwniRHx25O7qf7
         +XL8K0nngRC/HNwQEtq4OWWkMvfjon786wnD1aJ70q25vF6iOqjnqyXywCdyOHQIIdgU
         FKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769113648; x=1769718448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTNx2TZxkL4VnUPzuBRv8diBN0csSmN/zfw5ymS8riM=;
        b=P/P6SRGLE294TMQKtcTfeqoy04TcfZX8YoqrdoA1GlpO6kA26zHszM86YScKC41Q5m
         qKdnFsA7FlfACFVLXg4Wj6Af8SNuJz61Xs+9VYd8Audb/FGb5LxAzDUzbN9fUQ28rL/Q
         ZYY2aW4KyDpLU1iOojLAhbjK3lwSq2fYsFrERuoa3UgJilCCSpkdk6H0fOE1em+/2lqG
         JKnturpVLVJffLfF9hj2Mg1U1jxTFqgqN0p8DgLMKYeCC4V1D74caTmYRWLbrdXgbXov
         WueffDfImrAl7HfWutAv3xGnQiyMlLo6OvBvQQlbcHRfMzKp4+osfLrjrIf1Z29Lrwh6
         Y3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVV+LfEJvUafiSa3R7YELD5GSJgoEzLJB2fPVRjceo5ERq/NWeFyUIivlEa0U3bAOAAbnlBaDIsFjf+9n7Jkr4nRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26QN/vccXltlLkJb/0fXDZruK9kHG/SxiBodX0Yf2SnSVJ/GM
	CbA0dEnsbaumDhbaMoRoPXgzg80vZ8iesZ3BvNOaJvl8QmYeIQ1fHtJZIl6XwA==
X-Gm-Gg: AZuq6aK7UUECB6VaU4TILu55vSWb46+XMxfm1Q7iggjHio8H1FvaoLU8gNaxGMTan/8
	QMk6odqoKEexlodv58cwhYjAoXXGFmMHIjsgVGqWVa8ZWyhFfjiseYLSkBqsSlfAEnqL/XRWLhO
	ky+a/u7PJ6jMdvx6q9s18eaNuao3iS82jNFvlU6ooaG5hW8316eC3pifNWBrOpFjyPpsUrhrUhW
	fp+NR//A6waAen2mS7CVHKk69lV2Qf6BgZCAVMUM8CusGv4/f4n9P+WArjdA9NpOJBgb59lLi/7
	zC8b+pqBI06tkl6935RUzavTl7k1MxgzfuwfFdxkVXBIG4T7F5Ee+I50Qp9HaBD6ttg4F/AwNVK
	BxX27kzSzpW01sSWlV0KPggVJUAdPUwaGUIMFRw8DYpP8J48ppM46EY793RjflSSPGydv63jbFC
	+x7DZuTZfJGxLI1X8Xu2yoGH+ZeSoO4zaU26CkqlIhpvFY2U2uz7c=
X-Received: by 2002:a05:693c:3116:b0:2b7:134b:fd47 with SMTP id 5a478bee46e88-2b739994e28mr134644eec.16.1769107103324;
        Thu, 22 Jan 2026 10:38:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:777f:716:9c18:5588])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa2a3c0sm136300eec.31.2026.01.22.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:38:22 -0800 (PST)
Date: Thu, 22 Jan 2026 10:38:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
Message-ID: <x5h55qxfl4yrkhgwmijf37zfwqt52pmsts6whewniukbhcatbn@6mo3dytswd5f>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <20260122162206.9wrHkrTZ@linutronix.de>
 <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27313-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linutronix.de,mailbox.org,vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41F0B6D67C
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:31:42PM +0100, Geert Uytterhoeven wrote:
> Hi Sebastian,
> 
> On Thu, 22 Jan 2026 at 17:22, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> > On 2026-01-22 00:23:47 [+0100], Marek Vasut wrote:
> > > @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
> > >  DEFINE_LOCK_GUARD_1(disable_irq, int,
> > >                   disable_irq(*_T->lock), enable_irq(*_T->lock))
> > >
> > > +static inline void disable_valid_irq(unsigned int irq)
> > > +{
> > > +     if (irq > 0)
> > > +             disable_irq(irq);
> > > +}
> >
> > | $ grep " 0:" /proc/interrupts
> > |    0:         43          0          IO-APIC  2-edge      timer
> >
> > in other words, interrupt 0 is valid.
> 
> AFAIK, the x86 legacy timer interrupt is the sole remaining valid user
> of interrupt number zero.
> Nowadays lots of code assumes valid interrupt numbers are non-zero
> positive numbers.

Quoting an oldie but goodie:

"This has come up before. For example: for an IRQ, 0 means "does not
exist", it does _not_ mean "physical irq 0", and we test for whether a
device has a valid irq by doing "if (dev->irq)" rather than having some
insane architecture-specific "IRQ_NONE". And if you validly really have an
irq at the hardware level that is zero, then that just means that the irq
numbers you should tell the kernel should be translated some way.

(On a PC, hardware irq 0 is a real irq too, but it's a _special_ irq, and
it is set up by architecture-specific code. So as far as the generic
kernel and all devices are concerned, "!dev->irq" means that the irq
doesn't exist or hasn't been mapped for that device yet)."

https://lore.kernel.org/all/Pine.LNX.4.64.0701250940220.25027@woody.linux-foundation.org/

Thanks.

-- 
Dmitry

