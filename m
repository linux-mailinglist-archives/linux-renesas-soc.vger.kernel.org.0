Return-Path: <linux-renesas-soc+bounces-22698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D57BBDEBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 13:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7619118953CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 11:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99BB26A0F8;
	Mon,  6 Oct 2025 11:53:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D726A0AD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751629; cv=none; b=fg4mZaiF56QctC5SsA12/RenklZpDpwd46djMSRUk0BlDfvKB8DlZanwG5nLV7snfccY41nugYym0riR09ee6leghe5iKHYQ4ftBOk5b/yZbF9fMXcu+/NQxW9kz6SOZKIJGVe5vm5gtXxR2NF1vfKdYuk5exCHvCQ/M3m0Lld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751629; c=relaxed/simple;
	bh=nmucVonihOM1No6Rgw3JA096neGxM0Ok2zCGcjS9rrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JF3bjYoXSkv0Lw4t+e7P8Uy2QvmFYcmOkZMHrAxXG8B7bNHHIAbC5f5smfSYcuGn5YUM2E55Kfef1GOqSPcOSvFUafekizv2yqpv9yhYFwl6h+EruYymm+aiu9pYjzzv7LPXzRgRCVXwBb6+KqvyHbqoZZYVNoODT0QGDK0nfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso5966322137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 04:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751626; x=1760356426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAnFEXlq3ED3p75APIm7D4gfrJzhRabFp7PqS182e5g=;
        b=a2xaugH8US8jvEt4ajhqaXKbAm9sH1NrA6onomOOYjeFszRmlk2Dp5L4Jm7BPIpDu+
         A2En1nsaIGVxNTgk5Ev8etws45P9KtBJGmd+eZxbmSk+qODWI12ZJa1ISntGLivNdMq8
         8Sy54KXuKYgU5H3kpvPCbEukvKnCh9gv38tSaYMeq7unQxLxFgJxtmM3TGkXn1zT5PdT
         lNdynue8L7t9Ly4xHk2OgN2JS0fdXBzg11bC391xilbencnQiDta7u74rRcK8TSYZ+2g
         mXiDQ1aZdjB7VOb0xE5WYxJLU4aZWUpewQ/NPNrI3e8QLCq2aLry0FaImG4/RFRmhm7S
         8aRA==
X-Forwarded-Encrypted: i=1; AJvYcCVhijyPP0PYgtyiERQCSWX2DfV5WUg4a6h+K0CvPTLXDAWsxIgr3S+lpqEo9y5gbqtdE7pL4oa71jRpUW2gnnfRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrOaqlrBYiERfQUdWSMfOgmRzPAvqi9RC279UNjW9I0uq/PcJg
	SM/uH5SsHm4+BW+i1yWxLMCcpLJ0L6izFLclpJ52E3lbkGqBc3Zsnz+D1wBqlQTq
X-Gm-Gg: ASbGncs0BC5vyUilUkMCmchFvTpqlVLuGBIai8VwNq8bVfkw6nS3s6CyIGz+CIa2su1
	QHxJMj3q1J3t398XwbJdojEBvSh9oZE6WTeyGN8X+a5Ht2ENqjfSJiVSgCF25/1oQBhp+3lkBVw
	WhsjhTFd3mhmkI8/gJ+R+h7QAYVeRSNzLPIP2+WvPgOmxG1HgxtT3GmJXT9hrypSQlF9SfgNmGL
	P1nHiJ48ac5E7NPA6P29Ia9HCLoESmE/wLY2DL9pN2ZJEhDLVS3MhBbVLdYNoto5l8qUIKbOWus
	moA0dSZK2z/H6n5sANbsz/9BoMvKAXHueSuISz1UomyXmFdTDeyEmogHqCXgKI/7omAKs68Vgr7
	B5FGhJwch0OTbe3YyzqgnzTOYu8WKxhISjNB9HeR4xQPebrvcpfvFGAJBC+imQhmNnjJAzZdeI4
	yyFlgLcbplYETIimOqvQo=
X-Google-Smtp-Source: AGHT+IFnp6AN+vpFk9h2vcBzpxepAwgmyRlC/WbA39qCWSl2/puJQmXWEqkmPhjqD9Za9ki9nA8CMQ==
X-Received: by 2002:a05:6102:292b:b0:523:4360:2b86 with SMTP id ada2fe7eead31-5d41d179012mr4890128137.31.1759751626208;
        Mon, 06 Oct 2025 04:53:46 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4ea7e43sm2819667241.13.2025.10.06.04.53.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:53:45 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ce093debf6so4866380137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 04:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5ccws80bFS8V5oJKAYQYvoRfpTvub9htNAZXNeSiIjLt0ZoKtL3+DP1Kl9wmHw+azDo3Sk1R5nX36xElcJm2oVg==@vger.kernel.org
X-Received: by 2002:a05:6102:3754:b0:515:a84d:45a8 with SMTP id
 ada2fe7eead31-5d41d11ca0dmr4462571137.20.1759751625668; Mon, 06 Oct 2025
 04:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org> <20251003150819.GC344149@ragnatech.se>
In-Reply-To: <20251003150819.GC344149@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:53:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
X-Gm-Features: AS18NWCx5U4qop3kVkjDI967KSoG0Y63UyirUqb8qpDcG32DFYcK9VAMkRy561E
Message-ID: <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 3 Oct 2025 at 17:08, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page =
583
> > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indic=
ate
> > after reset has been asserted by writing a matching reset bit into regi=
ster
> > SRCR, it is mandatory to wait 1ms.
> >
> > This 1ms delay is documented on R-Car V4H and V4M, it is currently uncl=
ear
> > whether S4 is affected as well. This patch does apply the extra delay o=
n
> > R-Car S4 as well.
> >
> > Fix the reset driver to respect the additional delay when toggling rese=
ts.
> > Drivers which use separate reset_control_(de)assert() must assure match=
ing
> > delay in their driver code.
> >
> > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H=
")
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_=
dev *rcdev,
> >       /* Reset module */
> >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >
> > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) *=
/
> > -     udelay(35);
> > +     /*
> > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > +      * On older SoCs, delay after SRCR has been written is 35us
> > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > +      */
> > +     if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4)
> > +             usleep_range(1000, 2000);
> > +     else
> > +             usleep_range(35, 1000);
>
> I rebased the R-Car ISP work to renesas-drivers today and it included
> this change, and I seem to have hit an issue with the switch form
> udelay() to usleep_range() I'm afraid. I can't find any other good
> reproducer of the issue however.

Yeah, AFAIK we didn't have any callers of reset_control_assert() from
atomic context, but I was already afraid one was going to pop up...

> THe core of the issue seems to be that if a reset is issued from an
> atomic context bad things happen if you try to sleep. I get this splat
> and the board is completer dead after it, needing a power cycle to
> recover.
>
> If I revert this patch things work as expected.
>
> [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002

> [   29.265595]  reset_control_reset+0x4c/0x160
> [   29.265604]  risp_core_start_streaming+0x100/0x440
> [   29.265609]  risp_io_start_streaming+0x74/0x108

The existing udelay(2000) after the call to reset_control_reset() is
also a bit gross.  I understand you are using a spinlock because you
need to synchronize with an interrupt handler.  Would converting to a
threaded interrupt handler and using a mutex (which the code already
uses) instead be an option?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

