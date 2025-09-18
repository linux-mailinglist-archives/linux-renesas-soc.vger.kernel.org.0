Return-Path: <linux-renesas-soc+bounces-22037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB5B857B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 17:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 243A07BEB84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 15:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423BB1607AC;
	Thu, 18 Sep 2025 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ornbj1t4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3841C5F10
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207956; cv=none; b=Fnebs59PBDi5ZGpBM0TdZiuy9ZG4kg17vQArFU52uiaIxgkbFgdSylzseNhTZ1ikGH6Mxk3mkVWlLk4ghQQ3zCvsDCbQb8vpmfHzr4kXiPsnH2RUI+FCoJZDimDZ/q4J+CwGjEmDgeG0hvIZMsMZf9Rh5PxQhujPzj5BelAYmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207956; c=relaxed/simple;
	bh=tn9oW2weBTiuh+fe4Hz258WQPC+0fvyj5weHPIU7zcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFrphvybLvh/OsX+E8NwZLLu2ex2jo9nzw86/Q66kNOi67VL4rINUYoScVNO20WiJbX6JYyIDsPE4eTpHLBZT/rbXoXWr9FxwnPGKzWn3OyEY5ZeJz0S5GiiCpQBNTgUDHzix70ExCLbAZw3qNE528XNY8Gl5b5xum3XdvyLC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ornbj1t4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee12807d97so700051f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758207953; x=1758812753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewj8l+hIr3uNhs1w28ZaX8/owmCfl59xjD467sLeY0Q=;
        b=Ornbj1t452Rs3QROXq+pFG0qgUDwd/okxtJdOE5t9ECTgac9Dr3Q2ajU93R13k0iL2
         FznCm0Q0NtftDXyZrYkHA2bMQl28UvZDZPStr6HwTHZY/ppzAfvWa1nMhqSr/6V2r/2X
         7wXqvcyBplCPiz6mC/0UO1DTBHtjPV8H27UIalC0hyFlP2LAxavyEg+jxW62dVL/FEhk
         e0bENPhcTPj6iP6JxGmAl1NoYbXGiJMrDHzRc3osAVuMcxR38CBDW0j+596o46+zrur7
         t8UdzyBstIjZLWWEnxvgtzGBPAgccJ/MGjXQPUhpN+sk6IOga7Mvq1s0hVgEHAIlTkWs
         P0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207953; x=1758812753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ewj8l+hIr3uNhs1w28ZaX8/owmCfl59xjD467sLeY0Q=;
        b=FEYAyq+XlXKStGwBNbi7zbQuuraMEAYU/C+X3DNbzyuBlU77cUhvseMAY0UtStM0RA
         m3QVblkHwMD8Om5ab7nTbuLXeZehiSlNukuP99lvz1x4xXHGT25Bd92LszvkZO6Kt+yQ
         rCj43WiLjyL6rMVk3HDrmjJ08hHZHrcZQd5dFfvLPwuB4EeYs7lWYnVUpzeI+6DudxvP
         R1omwrxMQp4RUNs143RtktBfZGTAUinS2PocFxN2G+wds1qlQWzgvrfF+GOVUCWw7brt
         aWmMIQz2uMyHzwQmlke+pbjFZuEbnkG7eKhZZqcrjgK9KLP9LZDiAuMFHi53dwhpl88x
         B5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZybJk6Iq9cZw0cmdLIlKiUTFtgCJEYRzwAhzBVmrNnjDjrsnJpWrWobxSTWCtKGCBqgkKuf0+cj5ZDQCclydxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKLo43XVrR3edFiQI5ZOnejhCol6PcJdas8noLekjajIpk9hv
	EohOu6OEAf71mhknayY3shxQFvvZi2McrN4fsotDyF4FqrRSeeI7/7t1LLDSv+4Q+UfAke7PS7E
	2yBhqg/55a0JSi1xTUFuRIl5XXO4hBoA=
X-Gm-Gg: ASbGnctUikEPly8xMMdy68pTu6jgeGR3CW5HUFr9ltuF193EvPNhEq90xavVDJVP2o6
	Ja7v0gS9xAvoUQ0mj/IVm5ZOIQhxohSCUPAx02VEzJNetV9FG4ZwiEI5P8C5VKC0X75zbOafDx6
	hENo7D2Y3qI0boEzrPGZO2kHC96u14YE6He3kNdlxKiXLf2xg8yJc4hktJsMj/je6p1zUREYzyU
	cLUZPNj+GsxaGwfigp1tsW5dgA=
X-Google-Smtp-Source: AGHT+IFIpnAfWYBWC8/4He5hc0khqVIj9hQPJlI0L/TtRX7Oz0fi+5FvZGrToUW2nAYqq8wXZUyNg0HA+lD87ghtD6U=
X-Received: by 2002:a5d:5f42:0:b0:3ec:4fe:860 with SMTP id ffacd0b85a97d-3ecdfa2b563mr6291885f8f.46.1758207952491;
 Thu, 18 Sep 2025 08:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com> <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
In-Reply-To: <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Sep 2025 16:05:25 +0100
X-Gm-Features: AS18NWCC5xVX8IjDI7XHBdGHA0Pjuo6KvfUX2GcAPVjF4qUsRR9KD7_P8G6nqx8
Message-ID: <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
>
> Hello Prabhakar,
>
> >> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/rene=
sas/renesas-cpg-mssr.c
> >> index 65dfaceea71f..7b52e8235984 100644
> >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_=
dev *rcdev,
> >>
> >>          /* Reset module */
> >>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> > Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> > to read the reset register `7` times and confirm [0] (as mentioned in
> > the HW manual). So after reading do we want to confirm the bit is
> > set/clear?
> This is interesting, I wonder if the readback is something more common
> to this reset controller.
>
> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> public and can you share a link to them , with the specific chapter or
> page I should read about this 7 times read requirement ?
>
Yes this is documented in the HW manual [0] section 6.5.1 Notes on
Module Reset Control Register Operation:

1. To secure processing after release from a module reset, dummy read
the same register at least seven times except RTC
and LCDC after writing to initiate release from the module reset, and
only then proceed with the subsequent processing.
For RTC, dummy read the same register at least 300 times and for LCDC,
at least 100 times.

2. When module is reset once and released again, make sure that the
target bit of module reset control register is set to 1 by
reading the register before releasing from a module reset. Then
release from a module reset


[0] https://www.renesas.com/en/document/mah/rzt2h-and-rzn2h-groups-users-ma=
nual-hardware?r=3D25567515

Cheers,
Prabhakar

