Return-Path: <linux-renesas-soc+bounces-24698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F78C6461E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 14:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3179E365553
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 13:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8616A33291C;
	Mon, 17 Nov 2025 13:28:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CC32E6AB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386107; cv=none; b=OiFhAXGLxD0dV6gV/AvtkO7yFZNN4K8WAIreYYgUPwQLhZaDFAqzR0kYJsz/Xf8UOuK6W2DvUj1Vk6M20c0wEptYZNQdW0DMU0aZoUk6311u1tL1MuMJCXn4+p1aiWc1POxvjUOzW/nnp4NYARXx+O8mZFiMuyhlbCXr57c1bSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386107; c=relaxed/simple;
	bh=1z5P7Ct1dCApMV5cMidEWuBnENLPxUcSA3NHYJ2QfjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MED9JCqACRk8e3dVdMKM+IGiSTEk0O6YQid9Ay5Dk5M2auaR5pS7VI+4Kkb4I1g7AnNWqvpEsP1IUZgzaxyrvL2R33fgSjAZ8WyLfNm7UY/A18NCoiNMJSiHLEPWPxUnnrepVqwCmyVevfLn2mcTawTnXJ56vvsN6wDxZQouZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5e18598b9b1so243572137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 05:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386104; x=1763990904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRNOO2D8P1AP0B+8HOigZ1hD5IUxtuvnBzacX9Ugwh0=;
        b=pBwv+iN73cTLDXaahhNkm3OgEbHdCChfDQZoBOUOtJ+R45WpGO/c10toggUH1WCW6M
         kosFlzMnMkiwO1KU0qXi532ty1Esru70N037hWXCKiLFFLoCe6tp2h36uw5FBhhT8NoX
         FM36QAwMf5If5RPSJmrdTs97jx1D9Sw0Wob/kubEaEDMPicAjiqRb9Cy4ESSErE4ddfs
         pwek6ppB+2Pp4pfsNDyeIQDLLKuIKHavn1Yo30UGTp1L7xhx1tlPVADdBitOqbiw7OQQ
         P+h2iOFcMXv3Tz6pufYysEicUyjVeUFx/ROcmvHsDXOE4Q0jLk6+fC3rL+PyC3EmMj5E
         5l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlG64Z6kRjjR2gA2+/i83HpCAZH5c6z8nlOAemRXaXEI2V1vvt3PalHzBdDl7CwXA336OHwaY7AvuzJOCRcYFjUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0JkSSaoPdpABnEYy16SvVbwA6W4FlOCoWam5aHLg8Iod3j/4J
	zToDJ42bq9PGfq9iMHq0ixo8BShNaSU0fyh6+9oOs0ITcu9XvJjFpN0Wg9bBwwmGwLA=
X-Gm-Gg: ASbGnctk2h600PNI4WxNl8wD70Y7O4iFjDRNY/dzBh3VoVfZ0uqzVpPWyalm9F8dXD6
	hBSz4Ev+e4KBJUtbzb0+fFmH6sGmLroqm25lqJ0G+/Zdf6Vri5Rhf7/TSZdMz3bnUGw98Q5o5sZ
	4sIA2j+TJJ98exxhEry1ToYuyfeJLmZKSIQk0uolWcocv25MGeqb/0W68viShvoXpM7Mgyu73mr
	t6HCkgPF5sLrY9Q9N4Is8TFbvxjNRXwr/EDmBiO51vznteAv9Fq0Kp5Ezt1oXsm0CrrnwI79RKE
	ewVu70dC3WBXZxFPT+mSu0kyJcWAbdoc1twWI1SVWTPk1iSqzr9gK9+NHMF/KNI13sznIMOtHQg
	kCRizSZ9PDaaieZEXcovB7KlFFaw14C1v9XwRTNBKEjqO+RuazX+OzLJkC/8BKkqR3aoEgsiVrY
	b6tkRHpt8/VqPAm/xfPns/JBR1sQjcDYNPrXLjlxxvuWw1b8go
X-Google-Smtp-Source: AGHT+IEcTFoy+ODeQesl7mXxDiIzUaDzUtVliVTDGU2LZGa6UbhiBFUuHo7WAPzYNqvsIqijCAR6Vw==
X-Received: by 2002:a05:6102:4189:b0:5db:d60a:6b13 with SMTP id ada2fe7eead31-5dfc5b94384mr4288728137.21.1763386103950;
        Mon, 17 Nov 2025 05:28:23 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb726d37fsm4384153137.13.2025.11.17.05.28.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:28:23 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93729793469so2661178241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 05:28:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoU4YuVdP4DU/c4O9cTlcjhEcj6DxjPDLhqgNtOaopGwPlUyqH7XoMydrKR+FJ0Z4XMeJRXuil3zIzcKx1MSzomw==@vger.kernel.org
X-Received: by 2002:a05:6102:d89:b0:5de:736:71d9 with SMTP id
 ada2fe7eead31-5dfc5b9440emr4348291137.28.1763386103237; Mon, 17 Nov 2025
 05:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com> <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 14:28:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
X-Gm-Features: AWmQ_bn5dkinW3o6sLUPnioziluAG20e1jQ8jExDV1eY758BmsHmrWuqLGXTcCQ
Message-ID: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 10 Nov 2025 at 22:38, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Nov 10, 2025 at 1:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add core clocks and module clock definitions required by the xSPI
> > > (Expanded SPI) IP on the R9A09G077 SoC.
> > >
> > > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 an=
d
> > > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> > > PCLKH as its bus clock (use as module clock parent) while the operati=
on
> > > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > > provide mux/div selectors and divider tables for the supported
> > > XSPI operating rates.
> > >
> > > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > > where the determine_rate() callback enforces the hardware constraint:
> > > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > > whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> > > be used. The custom determine_rate() picks the best parent/divider pa=
ir
> > > to match the requested rate and programs the appropriate SCKCR fields=
.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2:
> > > - Added custom divider clock type for XSPI clocks to enforce hardware
> > >   constraints on supported operating rates.

> > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> > > @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device *d=
ev,
> > >         return clk_hw->clk;
> > >  }
> > >
> > > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> > > +                                                struct clk_rate_requ=
est *req)
> > > +{
> > > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > > +       unsigned long parent_rate, best =3D 0, now;
> > > +       const struct clk_div_table *clkt;
> > > +       unsigned long rate =3D req->rate;
> > > +       int div =3D 0;
> > > +
> > > +       if (!rate)
> > > +               rate =3D 1;
> > > +
> > > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > > +               parent_rate =3D clk_hw_round_rate(req->best_parent_hw=
, rate * clkt->div);
> >
> > I had expected the use of some *_determinate_rate_*() helper, as the
> > parent can be changed to find a better clock rate?
> > Perhaps you should use a composite clock for that?

OK, so per your test results, the core clock code does try
various parents.

> >
> > > +               /*
> > > +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> > > +                * When the parent_rate is 600MHz, only dividers of 8=
 and 16
> > > +                * are supported otherwise dividers of 6, 8, 16, 32, =
64 are supported.
> > > +                * This check ensures that FSELXSPIx is set correctly=
.
> > > +                */
> > > +               if (parent_rate =3D=3D DIVSELXSPI_RATE_600MHZ &&
> >
> > Does this actually work as expected? I doubt parent_rate is guaranteed
> > to be exactly 600 or 800 MHz, and expect it can differ slightly due
> > to rounding.  Hence I would look at clk_fixed_factor.div instead.
> >
> With below diff, Ive got the below results for the various freqs
> requested where appropriate parent and divider clocks are picked.
>
> @@ -317,6 +317,7 @@ static int
> r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
>
>         for (clkt =3D divider->table; clkt->div; clkt++) {
>                 parent_rate =3D clk_hw_round_rate(req->best_parent_hw,
> rate * clkt->div);
> +               pr_err("parent_rate=3D%lu, req-rate=3D%lu div=3D%u\n",
> parent_rate, rate, clkt->div);
>                 /*
>                  * DIVSELXSPIx supports 800MHz and 600MHz operation.
>                  * When the parent_rate is 600MHz, only dividers of 8 and=
 16

> Case 2# assigned-clock-rates =3D <75000000>;
> [   12.288507] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> [   12.310528] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> [   12.318426] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> [   12.326361] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> [   12.341540] parent_rate=3D0, req-rate=3D75000000 div=3D6
> [   12.347546] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> [   12.357593] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> [   12.367148] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> [   12.418871] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> [   12.433560] parent_rate=3D0, req-rate=3D75000000 div=3D6
[...]

Thanks for checking!

> Looking at the logs I think I could optimize the code to continue when
>  parent_rate =3D=3D 0

Do you know why it gets called with parent_rate =3D=3D 0?

> Based on the above logs, would you prefer me to represent it as a
> composite clock?

Given the core code does try the various parent clocks, there is
no need to model it as a composite clock.

However, I still think you should look at the parent's divider value
(clk_fixed_factor.div) instead of at the actual clock rate, as that
may not be 600 or 800 MHz exactly (e.g. when underclocking the SoC
on a custom board using a 24 instead of a 25 MHz crystal).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

