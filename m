Return-Path: <linux-renesas-soc+bounces-9721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844F99C707
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 12:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A451F22FED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 10:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CBE15B111;
	Mon, 14 Oct 2024 10:21:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5412AAC6;
	Mon, 14 Oct 2024 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728901263; cv=none; b=ZM1uq/eAeArHzuUUV5pZvkU1rl4XpwGakQAIHzDgQAAb38futqX3MjeuuhXbuyCSL3RrY/l8oxRBzcIEj4ODFaJovtodiBPfO0uFgHU4pg7qy9VNXYJrFnUy7bUc62OJfqyXSu81w5CHDioALhogj8vPx1ZRuixGl/927GAipeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728901263; c=relaxed/simple;
	bh=cei6qgx2gRPvWgM3Qv9VmEMG1x/F/qkdC9P2OMaOpO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fvfzb/+tltEb+3+q9AoSxVGPv/UQch8jYtG+7/IWe7QBvn5OleUR6MnxAmtxZzzEJkeB8qSKrgP4LYLMb+BQN2hSrQGR6jlhIjdiIl8cY8u5LLqPy7n/4UHds0MzZoT0ihz7ziEJxs4PFNTAlC0NPBMyubzuBdYRaRNfnNn9gbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dfff346a83so37091597b3.2;
        Mon, 14 Oct 2024 03:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901259; x=1729506059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIbBw113nrvSovQnVHEi3VDiKk61FuDgU5wjYdCjytM=;
        b=oRDcg8d/Y7k0paxGGLOlG70D95K0qLQcT8CUarqPG+1z1ilwUoFhNz1DpzBYXw1PdT
         ZM+k1mSLL1xaGM/UDotDEH9BeriKSqRsMybIN1CiJ/pvWLaexaZRqkbMo4SPawmFLRLc
         BjhGj0L/hdHHeCN6QMWjuqQUDz15nxCRqoBjd4oU2QfepqQgOBzawDyE/Ld0Lmu2jhEQ
         ucFuT6gxVpMTtZchEDmylDAMVq1N+gJ8rxKZoh34XkDDE8uoCUsJYWRiWzX6ziZumXWk
         hZVnFMur5vHPNKmJVmvkqevB8Sk/8BDxHEtco0GAqA2eYgFt5VnKjmRieR9ZR2ozsGY3
         8jUA==
X-Forwarded-Encrypted: i=1; AJvYcCU2poWQTbzqQP6XulIfOHcSxf4BNRMQ15QEze8vowGg7I35HB0Elw568MuwHXig4IpB9plHEnshUGQ=@vger.kernel.org, AJvYcCWYwXJGQeTZrSQrdQmRzBoHv4d0AFAM4oSbm00lplGofbf8OM+CffLpc/ajN19rWH7RE0l4nyoEyFcfnXL+Hx/j2Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNiLKC6sQO9KvAtgYQe+UQDyxFBTZCc980vLiYkdqpxmmVd35D
	5LwtIxLvU+B/Azr9UMFpv9SS01HAR9r/p9zJLXzXrZcdXR1xY3vauzUV5Xg9
X-Google-Smtp-Source: AGHT+IHllDsti5ItOLHClnqBw58p/9vhezCipdGpEhwZslNoNruc98a2JUuNma5jBRuwShe5aAfbDA==
X-Received: by 2002:a05:690c:9c05:b0:6e2:2600:ed50 with SMTP id 00721157ae682-6e3479ca9dcmr89944417b3.21.1728901258580;
        Mon, 14 Oct 2024 03:20:58 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c6e5c2sm14925797b3.116.2024.10.14.03.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 03:20:57 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2f4c1f79bso34118667b3.1;
        Mon, 14 Oct 2024 03:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHqEcZ10zfBwjJW9DuoEsCK7mATnfnPgOFnmwJ6IFO5U/Vru0xe3/4nhDvp8PePMrm/AE6yY0b3kOdZXuJ/xUKvv0=@vger.kernel.org, AJvYcCWLQRutfILz5eyF/ggF+CSOyEFlCaBJ74GfLDjUPzbU7qDa1IPDfDCboJR13FISta8F720mPiA+zyg=@vger.kernel.org
X-Received: by 2002:a05:690c:2505:b0:6e3:21fa:e50f with SMTP id
 00721157ae682-6e3479b95bfmr84123727b3.13.1728901257494; Mon, 14 Oct 2024
 03:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com> <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Oct 2024 12:20:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
Message-ID: <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Oct 14, 2024 at 11:55=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Oct 11, 2024 at 6:20=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > While computing foutpostdiv_rate, the value of params->pl5_fracin is
> > > discarded, which results in the wrong refresh rate. Fix the formula
> > > for computing foutpostdiv_rate.
> > >
> > > Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk
> > > support")
> > > Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Improved the precision by division of params->pl5_refdiv
> > >    done after all multiplication.
> > > ---
> > >  drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/clk/renesas/rzg2l-cpg.c
> > > b/drivers/clk/renesas/rzg2l-cpg.c index 88bf39e8c79c..a1e22d353689
> > > 100644
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -548,7 +548,7 @@ static unsigned long
> > > rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> > >                                unsigned long rate)  {
> > > -       unsigned long foutpostdiv_rate;
> > > +       unsigned long foutpostdiv_rate, foutvco_rate;
> >
> > While the resulting 64-bit value fits in foutvco_rate because unsigned
> > long is 64-bit on the target platform, I'd rather play it safe
> > (reuse!) and use u64 explicitly.
>
> OK will use u64.
>
> >
> > >
> > >         params->pl5_intin =3D rate / MEGA;
> > >         params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24, MEGA=
);
> > > @@ -557,10 +557,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll=
5_param *params,
> > >         params->pl5_postdiv2 =3D 1;
> > >         params->pl5_spread =3D 0x16;
> > >
> > > -       foutpostdiv_rate =3D
> > > -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
> > > -               ((((params->pl5_intin << 24) + params->pl5_fracin)) >=
> 24) /
> > > -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> > > +       foutvco_rate =3D
> > > +               (EXTAL_FREQ_IN_MEGA_HZ * MEGA *
> > > +               ((params->pl5_intin << 24) + params->pl5_fracin) /
> > > +               params->pl5_refdiv) >> 24;
> >
> > Shouldn't this use mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> > ((params->pl5_intin << 24) + params->pl5_fracin)) instead of a plain
> > multiplication?
> > See also the comment for mul_u32_u32() in <linux/math64.h>.
>
> OK. Will use mul_u32_u32().
>
> >
> > > +       foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > > +                                                params->pl5_postdiv1=
 * params->pl5_postdiv2);
> >
> > Unfortunately we don't have a helper macro yet to round the result of
> > div_u64(), so you will have to open-code that (for now).
>
> As per [1], round_closest(x,y) where x is u64 and y is u32
>
> In this case max value of x is 3000MHz < 2^32

But that is not obvious from the code (and foutvco_rate is u64 soon?).
Also, is that guaranteed? What if the user plugs in a 4K or 8K HDMI display=
?

>
> and
>
> y < 50
>
>
> So, do we need open-code? Am I missing anything here?
>
>
> [1] https://elixir.bootlin.com/linux/v6.0-rc4/source/include/linux/math.h=
#L101

You mean
https://elixir.bootlin.com/linux/v6.0-rc4/source/drivers/gpu/ipu-v3/ipu-ima=
ge-convert.c#L477
?

    #define round_closest(x, y) round_down((x) + (y)/2, (y))

And round_down()"
 https://elixir.bootlin.com/linux/v6.0-rc4/source/include/linux/math.h#L35

which states that @y must be a power of 2:
https://elixir.bootlin.com/linux/v6.0-rc4/source/include/linux/math.h#L30

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

