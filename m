Return-Path: <linux-renesas-soc+bounces-19046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D5AF62BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 21:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473601677FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1E92E499E;
	Wed,  2 Jul 2025 19:38:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44B1EE019;
	Wed,  2 Jul 2025 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485085; cv=none; b=fV21fqhA3KxnAlZkmaoTeIAOmVogBp8JwqLwZRJfjrgjJBNEHnvdVfOy7G2GWGEZsaUmr4WcZ+T8Q2DJwCBTIoy6nrTpEloyTSEe8suKfWKrR6elZT782GWX4w4Uejln6a3fBOMZAdjHkozJCs1TXph2tIUl5bZZ6cv42UTKCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485085; c=relaxed/simple;
	bh=IVhkOaWSUTaZqjB0QGXKGMBcTybR/181Qpd5tcdnc3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9PC45G+kWXCfOeM9CVGNtg4m4Bur3uDfFk2H/iJeHygNfd3ukFl2CoLJTI+RuQZLGSrcOdjivCgIi7ETz7xCNsCNKvmD6PMwT/ZU+a1WXK/58XBbicdGmXJVfJQSqqUyUqB1V8hTfexaafNHX9LzGVLjB1mDC9as2nhisYvOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5314d78e74fso1344509e0c.3;
        Wed, 02 Jul 2025 12:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751485081; x=1752089881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtMKBOZ556aBvP2zcfMZQR1v98z+BxBM1OE31DhPt44=;
        b=wJC6NjOm8bGmmL6CZ7a92qmj5PuDJTUvGS9Fbs7i8r9fhTXmaKQJUc7lnIF/c8MilW
         DI1VRx5BmneGGTNCBVJyfcbUGuQRA3JIPUjjRzPpd9K0PBsuU5RUfJDivm5Lx84pAziq
         9nhUGPq86M6F+rA8S7BIXs0R8TBhXbKXWfWyjsao47qQkuFaTgfXSbK0CqEqfgYrmgEe
         mxSX8Mh/BNEOf40rKC1fiftp56JVIGMXD3J0v9+nqY8cSRnSCMOkl0n3yYkDloo5GCWf
         6yootpGphj9APAq3YndEdDWVeHkOfrHwj8au9YPoqwK27XXQE3lGOVhKiy330EMmncOM
         DrHA==
X-Forwarded-Encrypted: i=1; AJvYcCUTkRE7/9OIhc6427Q5BwVENtpLxg4lMoCKh03aZ+ZKpss+MZdagjLO1uvo4tqsD+FfF18IM+YUW1miambuET8Cst8=@vger.kernel.org, AJvYcCUaL8Sv1jRRlg1ONg5vsi/kkUGPDAvYHqzVnxgpFpaU1n94an2gmcEYGMbzPOk8XL/G1HP7GYR5QYlGt183@vger.kernel.org, AJvYcCW6WovdoviBmHhsbJSzMSr/QOxHeBdkPPWRcsi2yQnIG+jIcUB7iROnWbacKpolC8DP7XQSVeZgKzWb@vger.kernel.org, AJvYcCXZnlrTOgrGaVMAFMXOaL41f2auYa9onk5fwtmtF++Si+sgTBBUimL583nQ2vy1dx+L2SJfTp0dXek/@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgYW6XKCoI6n0Fvu64hIlhpCJYW1V6on8d/qe2RwFIAtltlfa
	2YBQyjThL3OTJkHwAw31SmRSS4wVNxevcgmQ1r2HLOL4PbXFJ+w2m3p4frzVqeTf
X-Gm-Gg: ASbGncsL2h1FFSdJsqjeEpwdXigOVQ0ar6Z9DnaDvIKqwzfMZfRlZeB0yaWrK3Kn9Ec
	+gdW56HgfVUkmxUJd4CaxwZKP37xJ/XFM6HUd1NVznwAtSHB1uRpEoFlJ2WcDmt0GUol20PZOYR
	38K6RcNNeASuB85sSUMF1lFcB/wXQehJsJES81tpJ+wGC2Ec8wl6RZOtaY0XL37BIkNGuS49nBi
	47+ggohRjCApmcST9UQxuaJwfcpYR5gQEk+vUf5Za87ynwLZ2AemZWcsNhpJ2FQMD03ILXNZXLN
	90HFfcbKqeFnubAR2Z9N8gUGznQaLVn9bQNh87f2/8x7Y6FEUnEyFC0i36tT7fUKqoHdFWc8cSe
	9SBHhYCUXiLrNY794JnwIaACX
X-Google-Smtp-Source: AGHT+IH1GcVByLGuwOLrnRZ5S0im5OXXJ+LXQWG1+zPEsClt1IYDg1kxJgzYve/uhtjwGZZolSNUbw==
X-Received: by 2002:a05:6122:2390:b0:531:2afc:462a with SMTP id 71dfb90a1353d-534580afb84mr3914178e0c.3.1751485081400;
        Wed, 02 Jul 2025 12:38:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090796e8sm2244540e0c.10.2025.07.02.12.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 12:38:00 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-880f92a63c7so963409241.1;
        Wed, 02 Jul 2025 12:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJsXHr5pm/2nQtt8Ztc+gdpHR6DASzPtm0ZLMYyWyia88P2tbQ2VTQK60pLdPyjoB9qNUObwcLGk3xam9T8r9zjNU=@vger.kernel.org, AJvYcCVt7T35F2dLDa/xX/ngjw4pFUZF52DH9D5IrnPBblUH0zaZNXe5O4K91LtIto1bwdf1K5/MMjHkB68MnEva@vger.kernel.org, AJvYcCW+bpUr2Ng+qcMCS7g21LWEr17M1QJ07BrmNc3zjfdDHvgLdkasz9GSWC4Kgx/PghvgbrWfWfsLmS64@vger.kernel.org, AJvYcCWjVwJzY6BDbsLtLSeJPnnkUo0LBtrMkm6ootPG5s5mOTMf4kT66Uep0qfU7OQO0guKMgnmhsE8dEeR@vger.kernel.org
X-Received: by 2002:a05:6102:5804:b0:4e2:df8d:dfeb with SMTP id
 ada2fe7eead31-4f16101c38cmr2310698137.6.1751485080433; Wed, 02 Jul 2025
 12:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625141705.151383-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWnDhhJ+G5GvMZw+7WGBdiMfWHPXSwkwOqnK5XtKdyS1A@mail.gmail.com> <CA+V-a8tMV+eHduBduu_xRYAo7m+AH3ttWBM+BCMAGzF8fzFJLQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tMV+eHduBduu_xRYAo7m+AH3ttWBM+BCMAGzF8fzFJLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 21:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMoC5_tHn9u0XKE_Sbu=LoiNt=H_CoQ_sYuD0KC07NgA@mail.gmail.com>
X-Gm-Features: Ac12FXwVxQN7L-649eS5lu85DAy8wwvO1IQX5bM3Tu7fQ_IW13GOgmihwuAkr9Y
Message-ID: <CAMuHMdUMoC5_tHn9u0XKE_Sbu=LoiNt=H_CoQ_sYuD0KC07NgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g077-cpg: Add RIIC module clocks
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

On Wed, 2 Jul 2025 at 21:30, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Jul 2, 2025 at 2:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add RIIC module clocks for: iic0, iic1, and iic2.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> > > @@ -154,6 +154,9 @@ static const struct cpg_core_clk r9a09g077_core_c=
lks[] __initconst =3D {
> > >
> > >  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =
=3D {
> > >         DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
> > > +       DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
> > > +       DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> > > +       DEF_MOD("iic2", 501, R9A09G077_CLK_PCLKL),
> >
> > Shouldn't that be 601?
> > (MSTPCRA =3D> xx, MSTPCRB =3D> 1xx, MSTPCRG =3D> 6xx)
> > If you agree, I can fix that while applying...
> >
> Agreed, thank you for taking care of it.

Thanks, queued in renesas-clk for v6.17, and pushed.

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

