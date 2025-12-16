Return-Path: <linux-renesas-soc+bounces-25827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FACC42C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 17:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA8E309E8FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 16:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366E533D4F5;
	Tue, 16 Dec 2025 16:08:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CE34845E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765901280; cv=none; b=oRkDsD0wjfvbqvTNZLpumjVwFp2VMS0YN7QpO9jW8zHb+2p2vOEEDIQFFHVgis7Xvt7qQd8iWVChaEAYfY41/MMJlzi9Y95ut4DrpZBojLoD9GLk/KWcXiwEBokQOpOlnTaqD8mlcwwSQWB7LGHBxjcT7a0l/DgNKXL5kXWZT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765901280; c=relaxed/simple;
	bh=Zfv7/J2HqBQJAWNtd3OPpdhXYiso4BIxRt28OG2jKaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c564+FTZ7Krjhp7Y7buNVkaYuDqs38ptqDjzqPOYXRakIZ6S5eJ2oleabXXblMt26/9ofASAh+l3r0H1VikUAFxzHXUPjMuMJkoVtATCg/ZFk3guZA+bWEarlDjO3hlNuFOlV6Uk9/GErXQgt32bBCCDHMj/fZFnV2KjrLEz17M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b219b2242so2332872e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 08:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765901275; x=1766506075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7a58Zap6AKD72x6a4wEmUngGW3Eh2V1b4GmMRFg1GY=;
        b=B77W0WjmCYQ6oz9dwbXwmOlV5/LPpwbCKxE2Rx1NLRl6Ai6CuzzXnds4lTc3oKRD7Z
         o0IiKpGsvvkcL2W62lzYOtrN+SCxe0O37k07a7cLzpKu7KC+yq3B08ndyrYEDL/ITvZ1
         loSRbtsvRvaUdYel3AweVz69FMa/qDto8s/6itupjvbR02y3oSha3v5D7AB0cJrYfYZH
         VX4ww7f1njPseSkuZCjhUFGVB9i16q6g5EEeWvM3qT/Lp57FWFHOFmI7VuPP+pq2RlWE
         gNt+Dy1XDdxL5u/IwSvxrLNW4cu5TeboiylFGsDI3rQsDUveFT2nmYvwTR3bWkueMvEc
         Rs7g==
X-Forwarded-Encrypted: i=1; AJvYcCUN1UG2eDqmBuCat6BzS5/hkCBSGMTZl+Iyd32BXkDQdeklaEp6EwEE3huIUV0CspaI9E7fB9jV7qySTYk4FMX/Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygxhWbBShuABal21QzgW07wyz4yw3WQiMFD/MJ0R4Q+ql2gXS9
	tiKy8dkrZ8Poe9wJPb64V/5sgoQmwyJiov8z6cKhfkFwqB7nKlTDKQf/6AZtqdV4
X-Gm-Gg: AY/fxX6X5hb+3MarlY562+JQMnHUactzvhD+WhD47R3FyVFBKq+j+BXQVcXWsbIkbC5
	/Qc/A6pzoFP1GnH4HcpJaaLUXpHlyOgnw12BNdZFZp5bMytXqoIKf1ypEqVuuEvIrbXUCG9wffs
	n7yJFFYdFCfoEvoqrMTuz/t/fspwU3am/Qt0XDOX6ToICRPfhqpHJm4YMgkEBL8Q4U6uhzjxI/D
	F6VqtX/oqzXsjdDGUIjKTnIP+DRquGfIWlOwIC718b9wvqnE2j0KM8kojTPbjfNBPYolSG3g9LN
	SS2/3bxPclkDIN9us+iIgR2Euppr/iUQsAuVXmbnQM9z1bjsX6IthOOoAow2R5mOs/ZphR5Vx9C
	Nb0BU1sWWVO/pFBPGfvq0dYybF+p7yhtbCBsjkcOqvKQK3Skmfkvo6CZurZAXfYs3oZl/nXWOO5
	D0TAo207lgl8etjwFpKGbtVBw1T40wr0WBaOwju83ZLFHBJtpfNc1L
X-Google-Smtp-Source: AGHT+IEKvzo23W+WN6Q9+MjS13r46k+sQgpfQ2IBZH1+32HCfJIBxNsLzFlDcdKPesAApT24rhYVAw==
X-Received: by 2002:a05:6122:328e:b0:55b:7494:383c with SMTP id 71dfb90a1353d-55fecbf6c15mr4874625e0c.7.1765901274985;
        Tue, 16 Dec 2025 08:07:54 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55fdc5f0fe5sm7401977e0c.1.2025.12.16.08.07.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 08:07:54 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so3122078e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 08:07:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVznDi6t0Y266X+VLvr6S5B6AcUiqEk8qPYR9WZJAUzKJV+SAW1LCR7SB/MI06vbyyym8Z9LCzaeJVtJwn0WJUZvQ==@vger.kernel.org
X-Received: by 2002:a05:6122:311c:b0:55b:9bf6:da7d with SMTP id
 71dfb90a1353d-55fec96569dmr4663674e0c.2.1765901273927; Tue, 16 Dec 2025
 08:07:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251201112933.488801-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWY7QLfag8szj24Oo8ghfZn84msRHREAvrB_A2inA7WrA@mail.gmail.com> <TYYPR01MB139550D01768B025E402B683D85AAA@TYYPR01MB13955.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB139550D01768B025E402B683D85AAA@TYYPR01MB13955.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 17:07:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJbdnqXpt4xJUuB5+0Xm+p==LR+z7umAEE2kv3B1_EOw@mail.gmail.com>
X-Gm-Features: AQt7F2rKCtXMxN22sJ0lYUtQ21UXUHEepLOts4Hc2w5dOJHNvmEqWhA4oFsXrtA
Message-ID: <CAMuHMdXJbdnqXpt4xJUuB5+0Xm+p==LR+z7umAEE2kv3B1_EOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 16 Dec 2025 at 13:27, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 1 Dec 2025 at 12:30, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> > > an Interrupt Controller (ICU) that supports interrupts from external
> > > pins IRQ0 to IRQ15, and SEI, and software-triggered interrupts INTCPU0
> > > to INTCPU15.
> > >
> > > INTCPU0 to INTCPU13, IRQ0 to IRQ13 are non-safety interrupts, while
> > > INTCPU14, INTCPU15, IRQ14, IRQ15 and SEI are safety interrupts, and are
> > > exposed via a separate register space.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> >
> > Thanks for your patch, which is now commit 13e7b3305b647cf5
> > ("irqchip: Add RZ/{T2H,N2H} Interrupt Controller (ICU) driver")
> > in irqchip/irq/drivers.
> >
> > > --- a/drivers/soc/renesas/Kconfig
> > > +++ b/drivers/soc/renesas/Kconfig
> > > @@ -423,6 +423,7 @@ config ARCH_R9A09G057
> > >  config ARCH_R9A09G077
> > >         bool "ARM64 Platform support for R9A09G077 (RZ/T2H)"
> > >         default y if ARCH_RENESAS
> > > +       select RENESAS_RZT2H_ICU
> > >         help
> > >           This enables support for the Renesas RZ/T2H SoC variants.
> > >
> >
> > This change should have been a separate patch, to be routed through the
> > renesas-devel tree.  In addition, you forgot to add the same select to the
> > ARCH_R9A09G087 entry below.
> >
>
> My bad, I did not think about that. Is there anything I should be doing now
> to fix the situation? Or is it just something to keep in mind for future
> patches?

It is something to keep in mind for future patches.

> I will submit another patch to add the select to ARCH_R9A09G087.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

