Return-Path: <linux-renesas-soc+bounces-9725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13399CD5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 16:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 429161C2213A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 14:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81724B34;
	Mon, 14 Oct 2024 14:32:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D34610B;
	Mon, 14 Oct 2024 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916327; cv=none; b=s467SCXr3LLB2RHmDLYfd4jokgiz6Q5GkooHiJf6PDOHqTImvflc5RcVtPA03lDk2e4C8CJfqI2Nu6tbflGr1FlZl0Kbl8h2nsoSsi69oiD/sJUWdBR5Z8ileaIVirmX+3L4R41fsdtrZq6c+AbyEIC+mUZCg4rSLiWRG5W+pN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916327; c=relaxed/simple;
	bh=xX2u1RXBfVEYfgRa2sXHuDDh6LmBRyfVEpxZYMlSiPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCAo+nrVClVqCKfVykF2AblaN6/X6KnJbGVoKbuFiek8cWFnpgP2mntDQ9kZOjUSswXFqma6946F5NcK0jMTxDN3BHCm8oeHZ7+SGdqmYOsnI8mzl4ULy9oFjjeM/VUTTStfUuDpvVa/pk1RJfmXbdHS3ZYsk7q05P3B9cDgSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso3432167276.0;
        Mon, 14 Oct 2024 07:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916323; x=1729521123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfSK6YpvwPKnZBgXNscdXduSki4zIpfqrIghKqHaqwo=;
        b=JZC/KhTW3pgyq+iYkuIAwie53Xg+kC00Rj1FU0kF2nzERwuaXPk9y94uaKnTMLm8dJ
         T35zgskrziSHUUhEuy77/GyM1lChG65drWyrQQ/3yT5TlRbURffpGOn9mvK7Y6o/kjnC
         snbHtRWWE0NOGai+q09w63V+89+C1tO8/SV/6IQ2X3I7Wrx1pX94RvLTaTcd+FLW+bBP
         z2LsNwysyVzcwhaH1aB5ChA3xXGbYsbKRwGHwzasv1c7XgbImK5RePQ+n9l7CMN7oxSe
         O17A3aOYtD4HTdXXCh8f13w+PEEpIWzt2R7yN/7Zg4ShvYgiLwwO8LjlmXHE/H6YoG4M
         gufw==
X-Forwarded-Encrypted: i=1; AJvYcCVWIF37PqIN/blF+LpjK4Wb1HKk73ZR1D37VQynD81Q/9IvWjMNVJ99zYOkqJTaMM/cCXqRcT7em8TfCG1NkxFb8Vs=@vger.kernel.org, AJvYcCX0LsCSDOSq/jozEYes3M1lv/iLKqnCRFbeCI9X870GkaRZaoWya2SgFUyA6XX/BNeQEZRa3mCnSDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KeLpDgCfxnEQ1c9/6V67aj7PZaAG1IYeIbnDIA8hT/vampjL
	KIUHaYN1BoBQrNCHyqOiyBxUo5+YgNovnkPrwICa+uuCqwit2qb6v2s5PLUR
X-Google-Smtp-Source: AGHT+IFjO9mHNWr74WOqMVardsGMl9uNGkGO/hk53cGA+tV/+qtgL9JHAPApn5XMchIOQ14XFsNxeA==
X-Received: by 2002:a05:6902:2683:b0:e22:5bd7:86b with SMTP id 3f1490d57ef6-e2931bd7666mr5129800276.37.1728916323315;
        Mon, 14 Oct 2024 07:32:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e292bf6f3b9sm1693915276.60.2024.10.14.07.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:32:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e29327636f3so1539180276.2;
        Mon, 14 Oct 2024 07:32:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOJ5DbYNEVSYWYbvmkQDWwX1YbuE+CO+ydTE8rCF6Pjl4JwZYzYHDsDbYWbKq3BR+mRmsO2k/idWI=@vger.kernel.org, AJvYcCXjNnZDL+4lX67xWr1yoG825LkLUJbj/AI8BJyzvCCk9u9RR4pw7SOpUrvTjoI+f2xnxmlzyZyEGvx8dQBVhghcVnY=@vger.kernel.org
X-Received: by 2002:a05:690c:61c2:b0:6db:3b2f:a18a with SMTP id
 00721157ae682-6e36413fbc2mr59380307b3.11.1728916322776; Mon, 14 Oct 2024
 07:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
 <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com> <TY3PR01MB113461894D98B0DEDC86FB81786442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113461894D98B0DEDC86FB81786442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Oct 2024 16:31:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0mzLJC7QGHx2cOXKA0Yh_Dez___x-Div3XKQCkVFH2g@mail.gmail.com>
Message-ID: <CAMuHMdU0mzLJC7QGHx2cOXKA0Yh_Dez___x-Div3XKQCkVFH2g@mail.gmail.com>
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

On Mon, Oct 14, 2024 at 12:37=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, Oct 14, 2024 at 11:55=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Fri, Oct 11, 202=
4
> > > > at 6:20=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > While computing foutpostdiv_rate, the value of params->pl5_fracin
> > > > > is discarded, which results in the wrong refresh rate. Fix the
> > > > > formula for computing foutpostdiv_rate.
> > > > >
> > > > > Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk
> > > > > support")
> > > > > Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > v1->v2:
> > > > >  * Improved the precision by division of params->pl5_refdiv
> > > > >    done after all multiplication.
> > > > > ---
> > > > >  drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++-----
> > > > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > b/drivers/clk/renesas/rzg2l-cpg.c index 88bf39e8c79c..a1e22d35368=
9
> > > > > 100644
> > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > > @@ -548,7 +548,7 @@ static unsigned long
> > > > > rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> > > > >                                unsigned long rate)  {
> > > > > -       unsigned long foutpostdiv_rate;
> > > > > +       unsigned long foutpostdiv_rate, foutvco_rate;
> > > >
> > > > While the resulting 64-bit value fits in foutvco_rate because
> > > > unsigned long is 64-bit on the target platform, I'd rather play it
> > > > safe
> > > > (reuse!) and use u64 explicitly.
> > >
> > > OK will use u64.
> > >
> > > > >         params->pl5_intin =3D rate / MEGA;
> > > > >         params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24,
> > > > > MEGA); @@ -557,10 +557,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struc=
t rzg2l_pll5_param *params,
> > > > >         params->pl5_postdiv2 =3D 1;
> > > > >         params->pl5_spread =3D 0x16;
> > > > >
> > > > > -       foutpostdiv_rate =3D
> > > > > -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv=
 *
> > > > > -               ((((params->pl5_intin << 24) + params->pl5_fracin=
)) >> 24) /
> > > > > -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> > > > > +       foutvco_rate =3D
> > > > > +               (EXTAL_FREQ_IN_MEGA_HZ * MEGA *
> > > > > +               ((params->pl5_intin << 24) + params->pl5_fracin) =
/
> > > > > +               params->pl5_refdiv) >> 24;
> > > >
> > > > Shouldn't this use mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> > > > ((params->pl5_intin << 24) + params->pl5_fracin)) instead of a plai=
n
> > > > multiplication?
> > > > See also the comment for mul_u32_u32() in <linux/math64.h>.
> > >
> > > OK. Will use mul_u32_u32().
> > >
> > > > > +       foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > > > > +
> > > > > + params->pl5_postdiv1 * params->pl5_postdiv2);
> > > >
> > > > Unfortunately we don't have a helper macro yet to round the result
> > > > of div_u64(), so you will have to open-code that (for now).
> > >
> > > As per [1], round_closest(x,y) where x is u64 and y is u32
> > >
> > > In this case max value of x is 3000MHz < 2^32
> >
> > But that is not obvious from the code (and foutvco_rate is u64 soon?).
> > Also, is that guaranteed? What if the user plugs in a 4K or 8K HDMI dis=
play?
>
> 1080p@60Hz-->148.5MHz --> this is the max dot clock frequency supported[1=
].
>
> 3000MHz is the reset values of the pll.
>
> 4k@60-->594 MHz and 8k@60-->2856MHz

OK, if you're sure it can never exceed 32-bit, then keep
on using unsigned long for foutvco_rate is fine, and using
DIV_ROUND_CLOSEST_ULL() is fine, too.
But the "EXTAL_FREQ_IN_MEGA_HZ * MEGA * ((params->pl5_intin << 24) +
 params->pl5_fracin)" intermediate definitely needs to use mul_u32_u32().

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

