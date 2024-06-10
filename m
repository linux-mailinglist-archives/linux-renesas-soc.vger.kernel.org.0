Return-Path: <linux-renesas-soc+bounces-6025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30414902B5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 00:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D81F1C21D80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 22:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EC714E2E2;
	Mon, 10 Jun 2024 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9JaGbSf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060639FD9;
	Mon, 10 Jun 2024 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057188; cv=none; b=pDrNM6K2ii2W1337WclfRb9IjUwancAy3guuVhHN8fqqJ5SIO22/vOWZWoWCUJuNTEaek51598Fds5As19W7epnSxHefJ++M3ICLV1o2cGrfB1U0RmyB8BBpZH2aPVIMz0Aj+PmftzluD3aKLEksNzK27DHQBJiv9mxGwZ/EH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057188; c=relaxed/simple;
	bh=Z2skBdO+Rk+2ZKK68wWpaiysJ+e8RiK0YNwzM6Zc4ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvnLESGKaPA3UnoJOIW/2daUYhwMIAoKH7kyk9o8VyaL+0GOqEM2HBPHL1pFN5Tfe6Zw6uP5fihD4nDbFkbhKmQt3HuZog/vGhDnG/pOXj0LmeeDzUCPRWJQYQNoaFRdQadZjg7yS/pQ7qyJMqaERLC4beJ9PgiBUDNUSKQSmtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9JaGbSf; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-627f3265898so52103327b3.3;
        Mon, 10 Jun 2024 15:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718057186; x=1718661986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBpmt0UUe0IDdz+uq5+x8bMJuxB4OAyzK/tZ+2sJtqM=;
        b=f9JaGbSfgEtWgecbgAweSqc1mgXPwQwFI3WCZjEB7O9W847up8X5iMocO9K1tyd6c+
         qhZmkwCUAEsotUHClGXCGG5IUhxlJwa/SNgYzA7IeA5YT5raBY596sSpZ7NjNoeJVVkG
         K4e4q+u81c9lM8zRv7TfyvNawl1bYlh5U7irFBIrbUbey2g88cqtyD9YLOYJp4wKqG3I
         /WbDi99AffjKzzdf1JAKWXfYLDzWVLpM7AH5/xL2dqTJeOmcjxmLolTO1Wvu1w6Tx5jh
         HJ+pgnI+4+LKZ9Gs8sLAVuH+8DkNL54w38uRfpV2Bi31+Ssm7dm94EHLqlFrGnLTNIB7
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718057186; x=1718661986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBpmt0UUe0IDdz+uq5+x8bMJuxB4OAyzK/tZ+2sJtqM=;
        b=DDZSk08G+qkNF23x2NVs7uiUhdyxTpIzI6EH73n8x1ugqCDppFKgl1/x62IgAfSP/i
         7S327kqWNjhXQ0Do6dN8CVUusRGmfImSAZZXE9yX84Cue/Uyt9S1uYLgd/Me+SI0/aXX
         HhTBSZYJCYSGk/DHel13/+uuhHBwGuhdNVVKUyzt15OZXj5/Gy0BWbFYUwOW5LOojojf
         EgvNnYnNQjRl7XMSUFDAWBwpUmLy4mrE/XOYmJN5pAj8sAOXuK+4WpNV3Mm/u0NvgXsO
         Wb7n62ors7c3HSDhMjxoOWFjmNJzbu4b3w4/GfyfwjcULyEXTB+DeDhktYDVwX4XEEcZ
         1Fzw==
X-Forwarded-Encrypted: i=1; AJvYcCUMk1n0aF0x2/FF7WdK50QdLTO/cS2HgHiJz/wtudUaibobPc6xOQabGZLu+Dt2nC4204M+2dUzhTYxxIyFP/FkXT7xQCGoAotWTPCeAoe/3pem08VjEdhCSrLXy2w28CNoHjyxFrC5FXcx3as5nu+i9OcNUX9IWwjnS+Q4pWM5wUO5aNKfu0/q1rIS5k5iN+gQWQg2ZR3yiWnf75PgsBdm3c7efdyb
X-Gm-Message-State: AOJu0YwAcMlNvlhwS9rbnyftUCc8g+jE42f8i556hnwJsissk8/vWPvf
	/RIXSKQBdTXRclkMvKJ6iuczImcm/oWhHb7FB5u5bEi0yUF+KuKCOsbz/EpZel2wiKapNV8Evxn
	jz3FmXWyqidWvFUuggSpPyz62N4lKRqEC
X-Google-Smtp-Source: AGHT+IEoGjevIcs0e5raKRY3pcu97412fw9FCoLjA1oIhCy5VuQUI1DALfKHRv76gTrg8wuEordKIwWCQ9dUXVsm6XY=
X-Received: by 2002:a81:6c82:0:b0:627:7e65:979 with SMTP id
 00721157ae682-62cd55f2838mr101338397b3.24.1718057186371; Mon, 10 Jun 2024
 15:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXk+u0J9GQrGHa_yMgBtkrhCNtGXdWmfsmVt3UskNMMug@mail.gmail.com>
In-Reply-To: <CAMuHMdXk+u0J9GQrGHa_yMgBtkrhCNtGXdWmfsmVt3UskNMMug@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Jun 2024 23:05:59 +0100
Message-ID: <CA+V-a8st5i+P4MyAifvXu2QmH089faAe+r0GaHpWaJ38Xzeciw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: Add RZ/V2H(P) CPG helper driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 5, 2024 at 8:06=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hii Prabhakar,
>
> Thanks for your patch!
>
> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RZ/V2H(P) CPG helper driver.
>
> Drop "helper"?
>
OK.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -0,0 +1,112 @@
>
> > +static int pll_clk1_offset[] =3D { -EINVAL, -EINVAL, -EINVAL, 0x64, -E=
INVAL,
> > +                              -EINVAL, 0xC4, -EINVAL, -EINVAL, 0x124, =
0x144 };
> > +static int pll_clk2_offset[] =3D { -EINVAL, -EINVAL, -EINVAL, 0x68, -E=
INVAL,
> > +                              -EINVAL, 0xC8, -EINVAL, -EINVAL, 0x128, =
0x148 };
>
> const (both)
>
> Both arrays are very similar: all valid values differ by an offset of 4.
> If that is universal, perhaps the second one can be dropped, and
> the offset can be handled by the user?
>
Agreed.

> > +static struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {
>
> const
>
Ok (and below)

> > +       DEF_MOD("scif_0_clk_pck",               R9A09G057_SCIF_0_CLK_PC=
K, CLK_PLLCM33_DIV16,
> > +                                               0x620, 15, 0x810, 15),
> > +};
> > +
> > +static struct rzv2h_reset r9a09g057_resets[] =3D {
>
> const
>
> > +       DEF_RST(R9A09G057_SCIF_0_RST_SYSTEM_N,          0x924,  5, 0xA1=
0, 6),
> > +};
>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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

