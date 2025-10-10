Return-Path: <linux-renesas-soc+bounces-22867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A90BBCBF02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C5583C4E43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3109F227E83;
	Fri, 10 Oct 2025 07:37:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61091262FF3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081864; cv=none; b=OHiwLjRjhQr6QI4ydRzCIg2D4nyLGk4OtLHKQMP+8LWArSn2ZceukqOl9S1lThe/+HCsOdZF50S+YSgAWpIhj5GFF2YxyftHcASL2Mi8zoaSgZ5/HTNS5I016tA18tpvoc+Q/JzKV+mL31JiNd3uq7g+yyzrsmlpYDF/zs9QVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081864; c=relaxed/simple;
	bh=eST3ZT7rgB9R6WdFdGECdhPZDbsoewBoBABzcKzXuMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeTJk7zRwYRoY4liJejdKOV6rpDI5V+KflaUM6JJENIf9GhYYMzWEfARsEoNBrf3UVh7QbgyUmAZY+FT/1Pe35ZvpSCRST3fzpcsfHfubGrkmVQ302V22T8pt9W0O/nOh5Fz0fLVJ0ly1dDcDMG2AZdcRbaZw90ZJpBWBH1ikbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8e364003538so1318795241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081861; x=1760686661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyJ7Kpxwh9FSglSF6Jve2BNo88/F4JmGj75EOHjBoPk=;
        b=OBEjtwmCkca95i9IQ0LAhB6N3+X3NZVImn9rnw5U48J0hHbBLVa0cts1m1T8tJhAy3
         InJf/Mw6NJyH/v2cfRjvf9VX99MVR8C582HsNXrBOgEfa9qCRcc9xn12xspdxr0cDpca
         0Cc3Nb2vNJuUzlmHs7mAeUZIzae2NooC8IwPhWogzxDtoRYYe+EpVmnqdVHCUjrSR21D
         EYTQMN84B/w5gRgSmPHyfcrMb6DFveBYtiC/PciWcWT9xfQ29zn6fzXMS79qbdXDBMBs
         Ac051N8ak8X8cEzAXZ+309eIHtan2M8Z5eqkzCb7bBxRBOf5neSgG2OKLYTlr+OwoTim
         QxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/OCk/AWDnsOD0dlyPj8ZEdtZHXGXe9rWHt937rQu0EdMCu9vc38pVQJOGAa3yy4LNeIz1GGWmbMzVxx/lxNmnHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZGgidcPy8Ilw6Wrz8UkA63P4VVJ32QXaiwhv4iAS8W90d52u
	1ZjtOSRJBQkDhB5VjUC6IzFjqvmXgRm05DI6U6/j2uA0Qu+ekqFHwH1kiMiN5KhB
X-Gm-Gg: ASbGncsgvoR+/bkbuYUx4Y9iBReX8TyPad8cma2sQraQvj/+1O/uzvifdPDPt5OnL2g
	M9KHDZmJ7Hd3C1R6tI8/b3DQ73VEy3AST9PCBlNOOrL+Z7PBgRS/4NfzjVNMPdCxpYV6KfL0vDz
	iVcG0+eolmlxMNSAYR1blJoyFABKp1uila2BhL7Upb73bc3ZQzZ3qyOJlutrQ8q8LY7POC2yaYL
	/juafxKkIOE4a3QXbVgJwigi4keLu8HtBs4KCsDQBFshaRTSLDZK1JJ9hMpnjWb0xPmgHk+lW1I
	lOmzkoUmFBAv2wbLYUTGaKzriT4VtLglCatxHOikJenwDGIe3CF8XLBEq49My9ZB1gg8UxW1nc/
	7mB9RJJn3wy7wm+cEEx2bYSLwSR5q9wTrKxJ5+PolESGuKGY2YtUjwd3wuyut7LiCoJ0lo5md6B
	Ju9V4=
X-Google-Smtp-Source: AGHT+IEGsuLbc6VaEMBTBf7RQsjpukgkh49vmdUFZr8vGxDVN0Lq9I9hlllA3jRVA4M3l9AL3xbW6g==
X-Received: by 2002:a05:6102:e10:b0:5d3:fed9:4e72 with SMTP id ada2fe7eead31-5d5e23549ebmr5098337137.25.1760081860927;
        Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6b1248sm537433241.2.2025.10.10.00.37.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5b62ab6687dso1930728137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM2gpS25TXppxAJXpmTGZ9SqniSq6pvV7oRko5A98OxdpoOOa7Z9wqiFMkDUK3JJzS+NZGmXLesfM0uQ2Mvl2p6w==@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:528:92b8:6c3e with SMTP id
 ada2fe7eead31-5d5e21ce95amr5073612137.1.1760081860129; Fri, 10 Oct 2025
 00:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se> <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
 <20251006122338.GB1353934@ragnatech.se> <20251009181250.GB2550463@ragnatech.se>
In-Reply-To: <20251009181250.GB2550463@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:37:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ-5eL53xx0h0A951J-vU_vTbZtXksO3zai+qs3-hxOQ@mail.gmail.com>
X-Gm-Features: AS18NWAhg-eRKCHFk41jOIrVt9EBhsPvKCaPawOrsQMFS0mslGNWcDjWshSyeHE
Message-ID: <CAMuHMdUQ-5eL53xx0h0A951J-vU_vTbZtXksO3zai+qs3-hxOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 9 Oct 2025 at 20:12, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2025-10-06 14:23:42 +0200, Niklas S=C3=B6derlund wrote:
> > On 2025-10-06 13:53:34 +0200, Geert Uytterhoeven wrote:
> > > On Fri, 3 Oct 2025 at 17:08, Niklas S=C3=B6derlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025=
 page 583
> > > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C)=
 indicate
> > > > > after reset has been asserted by writing a matching reset bit int=
o register
> > > > > SRCR, it is mandatory to wait 1ms.
> > > > >
> > > > > This 1ms delay is documented on R-Car V4H and V4M, it is currentl=
y unclear
> > > > > whether S4 is affected as well. This patch does apply the extra d=
elay on
> > > > > R-Car S4 as well.
> > > > >
> > > > > Fix the reset driver to respect the additional delay when togglin=
g resets.
> > > > > Drivers which use separate reset_control_(de)assert() must assure=
 matching
> > > > > delay in their driver code.
> > > > >
> > > > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-C=
ar V4H")
> > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > >
> > > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_contr=
oller_dev *rcdev,
> > > > >       /* Reset module */
> > > > >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > > >
> > > > > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 =
kHz) */
> > > > > -     udelay(35);
> > > > > +     /*
> > > > > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > > +      * On older SoCs, delay after SRCR has been written is 35us
> > > > > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > > > +      */
> > > > > +     if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4)
> > > > > +             usleep_range(1000, 2000);
> > > > > +     else
> > > > > +             usleep_range(35, 1000);
> > > >
> > > > I rebased the R-Car ISP work to renesas-drivers today and it includ=
ed
> > > > this change, and I seem to have hit an issue with the switch form
> > > > udelay() to usleep_range() I'm afraid. I can't find any other good
> > > > reproducer of the issue however.
> > >
> > > Yeah, AFAIK we didn't have any callers of reset_control_assert() from
> > > atomic context, but I was already afraid one was going to pop up...
> > >
> > > > THe core of the issue seems to be that if a reset is issued from an
> > > > atomic context bad things happen if you try to sleep. I get this sp=
lat
> > > > and the board is completer dead after it, needing a power cycle to
> > > > recover.
> > > >
> > > > If I revert this patch things work as expected.
> > > >
> > > > [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002
> > >
> > > > [   29.265595]  reset_control_reset+0x4c/0x160
> > > > [   29.265604]  risp_core_start_streaming+0x100/0x440
> > > > [   29.265609]  risp_io_start_streaming+0x74/0x108
> > >
> > > The existing udelay(2000) after the call to reset_control_reset() is
> > > also a bit gross.
> >
> > Haha, I agree :-)
> >
> > > I understand you are using a spinlock because you
> > > need to synchronize with an interrupt handler.  Would converting to a
> > > threaded interrupt handler and using a mutex (which the code already
> > > uses) instead be an option?
> >
> > Yes and no. For the current use-case where the ISP is used in off-line
> > mode, that is userspace dequeue images from VIN and then queues them to
> > the ISP, it could work. But if we ever want to support the ISP in
> > in-line mode, that is the CSI-2 Rx queues the frames directly to the IS=
P
> > I think a threaded interrupt handler would be to slow to change ISP
> > parameters between each frame.
> >
> > But that can also be a future problem, I will see what I can do.
>
> With a bit of work I have reworked the ISP driver to reset the core from
> a context that can sleep. Without the need for a threaded interrupt
> handler. Thanks for all the tips shared on IRC Geert and Marek.
>
> I now have no known case where usleep_range() in cpg_mssr_reset() causes
> issues. If I trip any more I will let you guys know.

Thank you, I still have this v1 in renesas-clk-for-v6.19.

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

