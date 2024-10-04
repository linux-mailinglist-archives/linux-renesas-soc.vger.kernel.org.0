Return-Path: <linux-renesas-soc+bounces-9386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57B99027B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D351E281C12
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 11:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC86015855D;
	Fri,  4 Oct 2024 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc26v50q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3215B111;
	Fri,  4 Oct 2024 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042536; cv=none; b=E5MLhR3WUnRiUwKOaMN6sSkGPtZy3iM+ZMmPdA7cgKkDDi/2TTloZpQ45dq0Ze/5VHQ6YQt+NQnHELpCtBETLw4TzqRd1HfLqaLCUFoSpJgAeHuFehWQoP3kLXT+uNbtvIqA870kXYL9PvFiWj135Sx8TQMbmPbIwzxE42JFn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042536; c=relaxed/simple;
	bh=Ht0Mlml4UcuysDPVHCDVGvxn/tDaEANke7Vs8aKVFG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUTCAuOBxcF+zjolPuLk+EqF2z/Ed1Zy4TaBeTq8Ohi8bx/n0KES1u30JmTtaZHfPEf/4VamdTr5bJEl2jWD4dDnPQ/v2Fx1Ne/apLq8T5nPjNtWwGMCgcxp2Uea8QWg7+RQDhot6au5JiK+J5FP+W9BQd83IfhzSqVjL0sI54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc26v50q; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-502aeeb791eso1127131e0c.1;
        Fri, 04 Oct 2024 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728042534; x=1728647334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq2lzS46UFUr7C4ctAQHCLo6+Q0WwfTBQLO38QvWs/A=;
        b=Xc26v50qeW16sKxqd5gZ5rqDQSo2ezj6iw+8t6BBYLNBpQwAKGyH9/8bPQ7355rGH9
         0LUz/jNzX8TIzfOOXuq164vWBjiiHvEXix0K1TuMlATcrRNQmBuSy5W3bobGyP6lf3k4
         Fb5X3uDNjxQshULRBCl3mxvKArYBuTXNPYXGVIEGnrUG/VrkyFukF/re7a0uocmZey76
         TIvF3umj6m/k9UvFjsR5+9/fYyhFqGKvoS8qvlOEBUOfOxPecA7hNvqIvVNz02BybZ1z
         1c0hzk/OjflyCcgnlhqwbYw0tILiOoqwXQixezGRvoiNquqvL1r2R2gghaaLFNgffEKx
         aNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042534; x=1728647334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq2lzS46UFUr7C4ctAQHCLo6+Q0WwfTBQLO38QvWs/A=;
        b=R4I8N9qpPIRrAttcwLo+6OHSLuw4+wVZgy31iDaRj95TJaWcqDLnkJpPDQ+eCsKcQV
         18H5fohKQXAQYsl3/1KWe8VG1nRkC6FnvFLMwy+JZS3KKP74yDbvgn0t3WwlKeaWBO9W
         qnoX6MDA9TxW96o6v9+3jsCsor+VSWBQANxX/oRl7tGQzqjeM+9wOulj0CCjt9AenW65
         Uunt+VcJXABF4fGHNnWg6RWr7L38T4AKFY3VlXdtp99TEWEmXizKteOvn1dmgpZonfoV
         2xtADQRWmSIV4y7fjXyHlkYD6+KubGsKxpC+n82mr2arjgox624Tklg6N5C3D0UYpAeb
         v3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUTKKrPLBVp0uh+XnlmURT9nvl2FtXUpKGuYoYtNJAJ+qwICg8OU5eb+Wa9pDJpHt47mt+wRPpp5RAldfIB@vger.kernel.org, AJvYcCXKMKI8GfxA7A9xLmKFS0lvFhC7va13ZBGzVK+zc5c3BDu1vBV1S24vrIJ4KRkIfNbOQbUz9l6Eti3jPh7zSgqe6Ig=@vger.kernel.org, AJvYcCXKX0MggD9NNHjsfmzLLVeWXZpV2n9ZkonFFFt3tc9KI2TjaqcHIDxBRAx/cOA/jYSbKWZiQ1bzcaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxggR++0vhvc3HhfGmIHiS6uRZb/7SLpETkuehXiZZkqENOuXEM
	OFibqtTLQK4+l6fFTepbu4iKT0dH0z5sYfjGdiv9GQSj1TydEVQ1By7CswPXIEdNrxEjqmjWEYU
	MDK0xn53GNEvaFTTFPSWCCQxVZ+Q=
X-Google-Smtp-Source: AGHT+IFCzubwgGW2nqW/IcMXCQ2R93NjgQAx33rjNz5Zh89T0t4i2V7RdDiZOWyDi4kJ3U8gWAXvcQrwWak8M20arWw=
X-Received: by 2002:a05:6122:918:b0:502:b69c:b239 with SMTP id
 71dfb90a1353d-50c6d1ec152mr4725263e0c.4.1728042534070; Fri, 04 Oct 2024
 04:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918135957.290101-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUiGAo2jz5oeiYzzHMNaaDmpjUo7eR7F1i50iPXEv18MQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUiGAo2jz5oeiYzzHMNaaDmpjUo7eR7F1i50iPXEv18MQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Oct 2024 12:48:28 +0100
Message-ID: <CA+V-a8sBmELt7BGKuEnYeUPN-S+vQbL_SB7RUm-Ef4UNhh=a0w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g057: Add CA55 core clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Oct 4, 2024 at 10:22=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Sep 18, 2024 at 4:02=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add CA55 core clocks which are derived from PLLCA55.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.13.
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -74,6 +82,14 @@ static const struct cpg_core_clk r9a09g057_core_clks=
[] __initconst =3D {
> >
> >         /* Core Clocks */
> >         DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1)=
,
> > +       DEF_DDIV(".ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0,
> > +                CLK_PLLCA55, CDDIV1_DIVCTL0, dtable_1_8),
> > +       DEF_DDIV(".ca55_0_coreclk1", R9A09G057_CA55_0_CORE_CLK1,
> > +                CLK_PLLCA55, CDDIV1_DIVCTL1, dtable_1_8),
> > +       DEF_DDIV(".ca55_0_coreclk2", R9A09G057_CA55_0_CORE_CLK2,
> > +                CLK_PLLCA55, CDDIV1_DIVCTL2, dtable_1_8),
> > +       DEF_DDIV(".ca55_0_coreclk3", R9A09G057_CA55_0_CORE_CLK3,
> > +                CLK_PLLCA55, CDDIV1_DIVCTL3, dtable_1_8),
>
> I will drop the leading dots from the clocks' names while applying,
> as these are not internal clocks.
>
Agreed, thanks for taking care of this.

Cheers,
Prabhakar

> >         DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33=
_DIV16, 1, 1),
> >  };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

