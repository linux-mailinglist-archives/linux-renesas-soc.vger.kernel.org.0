Return-Path: <linux-renesas-soc+bounces-14076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC0A54C12
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A68189254E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D297A20E315;
	Thu,  6 Mar 2025 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ5mqzPr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31020E037;
	Thu,  6 Mar 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267509; cv=none; b=d0tTLc/h8GlHohsODcKsLj1W675L7z3cA99dcKdvmOgo2Pzas54haaBF0OTNj0UnIBSnebcyNxRP1fzDlS31PgNv0gPOHAvdhtqdg8Kr4exvHdKelBa/3nJkW7lFI+3B+Rb2qqnH5Ho+X/z8pHGhhnQMhWgWR1K7BvXKCtnl73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267509; c=relaxed/simple;
	bh=hFWuuPdbuYxcb+LTn5HhjxwnaOnWLb+LGyugAIBeud4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8gibK0fdveCdiWE1uPwva32I9wrwR7DpzoyxCu4crTh/+DCsfHtCMgJ4pzKpZb+aZX5VW/ObQ4ItwkdFhCVFP92D2VTstv3GubhtI+zDnRt/J6kb8p140tw3rvGMuR2mni5QBbKtx6w1mtNinfZ2AevittaQkOc2IqrvJn66VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ5mqzPr; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5237c18a97eso222833e0c.2;
        Thu, 06 Mar 2025 05:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741267507; x=1741872307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pczLQVMYKQNjopy0MycJrlivlSAhMtMp/TTkHXcLHZw=;
        b=fJ5mqzPrLwuD6gjTJ3d4L2HrAE64bH89pLqeNHJ7YV3ffTpCH4xRzsYro1QdvpAxZy
         pfSlx1+aqUMZwr/UYAxiQ2Bd9ViyBB/oMDNLwcqnY9kJtTafvBpw+31uX+wRluKLIxoN
         xvwRPQ5W23W75WBrf3jHF50rCSt9HraNq7sGfHCjYMi8LvSyOSj5AiwgneUYvJ7S0gwl
         gmM3vdpr7a9oEI0aQwTov7BlmYsLnWhRs13N/cdpw+LKz8+j/jolmlU0J3ccYg0RonwP
         Vw1cK0N2KM1VpAzyItY5dUSqeXhoDJmG8HXxUybtKtvgQ/W9IIkHogWKGdgXDM8IyoBw
         FTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267507; x=1741872307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pczLQVMYKQNjopy0MycJrlivlSAhMtMp/TTkHXcLHZw=;
        b=edckGIrDFmrbeFgWD5vU0YvL+51awJC/ncqtxeVihDR+RI4YKVx6zKeTGvqMZkk7cA
         jjCPYXX9hf2FleMY4ryrlgegiBZpQO7TLGlawk/eh4Lpgc8Bh/9jaP1vpy3WaVcPaRlP
         TJ5Vp5sPb0fSuiM3GH3VfGJNYAtd34t1KXhO+qiMcQOKoW0LWzcxRdee5VpUC3k0myrN
         QvwzU8ZLAsl+Ty+Zw8R9sE4DBgpX95LaHtZRH9KeIkLogPGxsmrwB8wdiTn7jHJIsGYP
         XF+h9ZL0JLYH2kRVQCIjpYmsSoG7SZzpYLLyA+vqGtXrXm9Fpc9uIRUk1lHoZxpiGS8e
         vA7A==
X-Forwarded-Encrypted: i=1; AJvYcCVaf8dAil7I1D7TOooMeDeUl5eKpLnTVabw2uwiMgeCQ5/jxgAnz4c40y49PorjeNqvzcfpbQkXRbS3xRWz@vger.kernel.org, AJvYcCVt6XZVXdmWKQ3PH66jfja7Wlv9sYLrGJem8Y04s52tpkJ2EFiLY+9JQfGZDV410BSoe8vTCbJX/2A=@vger.kernel.org, AJvYcCWXELQmbfq5OsK8yoEvMatNeJJsOWsKwchDWaPo/YZgmJESSP4Ct+Zw0HgHyZM3WlqZutPo7nEuJpKcLr/xoGY4yjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYhB5BaVv08BTgEj2uKhgAuiPUHmuVKrQLXvUehbesbIoClaZI
	HpcQpYh/cjsJki97rMA23ECCP9ZCJ2FpVYq1RB6uW51AXiiUXKLGAY7i4eZLGDqPAOfZpJNZQWF
	ClKcP9COssVIYm/Tr+jp0XrvdrkY=
X-Gm-Gg: ASbGncsQk6btX+NyFCs3e7sF8rc84Bq3/xH4QM1Nks4mG+nhL6vd49TU3eQPm5AMWlq
	D4IixpEIdj1r8AWeUATO5GllYIkdizHIJXJnajNavJ7t8I2yLnsX44fer7Qd4CXAzKIAFqw2ZNU
	/sEHAQVdrA3LS317JriEAMjMOJ8w==
X-Google-Smtp-Source: AGHT+IHgiM4ICdjafzmTABqUctgFSAnbeftgAaTIqLRQol12JOmBumy+PQVI/b3uj4OJSh5eWKjsIrneXRlQI/vMI3s=
X-Received: by 2002:a05:6122:1d55:b0:520:652b:cdf9 with SMTP id
 71dfb90a1353d-523c617d306mr4101936e0c.5.1741267506786; Thu, 06 Mar 2025
 05:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com>
 <CA+V-a8uvfb=a=K1YzGNeZdiAzeXWMpdbxj=6UuL_xQfxKmOBZA@mail.gmail.com> <CAMuHMdXermXD2yCJxYjw-bmWKiazF5LVJ8PHoELKEdp_q2UnfQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXermXD2yCJxYjw-bmWKiazF5LVJ8PHoELKEdp_q2UnfQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Mar 2025 13:24:40 +0000
X-Gm-Features: AQ5f1JrbmqE4Ljn85aeM0u0c_u1ndtYdv9GmzW5Js2FPoUxJ69rtGqH1qcFxjY0
Message-ID: <CA+V-a8tRptyKJ2fmawvyN89bEMeN==7EeA7VXW24EpXenkUK_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert

On Thu, Mar 6, 2025 at 1:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 6 Mar 2025 at 14:04, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Mar 5, 2025 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU =
being
> > > > disabled by default in TF-A. Add support for enabling PLL clocks in=
 the
> > > > RZ/V2H(P) CPG driver to manage this.
> > >
> > > Does it make sense to enable the GPU PLL if no GPU is present?
> > >
> > No it doesn't,  PLLGPU is enabled on needs basis ie if GPU node is
> > enabled the PLLGPU is enabled, if GPU is disabled the PLLGPU will be
> > untouched and will remain OFF. Note I also have a patch which does
> > disable the PLL's but I have not added as this isn't tested with the
> > full system running and I'm not sure if there will be any radiation if
> > we turn ON/OFF PLLs (Im discussing this internally once approved I
> > will add support to disable PLLs too).
>
> OK. It just sounded a bit strange in the patch description,
>
I'll reword it to make it clear.

> > > > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > > > transitions. With the `enable` callback, PLLGPU will be turned ON o=
nly
> > > > when the GPU node is enabled; otherwise, it will remain off. Define=
 new
> > > > macros for PLL standby and monitor registers to facilitate this pro=
cess.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  drivers/clk/renesas/rzv2h-cpg.c | 57 +++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 57 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/=
rzv2h-cpg.c
> > > > index 1ebaefb36133..d7230a7e285c 100644
> > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > > >  #define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
> > > >  #define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> > > >  #define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
> > > > +#define PLL_STBY_OFFSET(n)     (PLL_CLK1_OFFSET(n) - (0x4))
> > >
> > > Let's subtract 4...
> > >
> > > > +#define PLL_MON_OFFSET(n)      (PLL_STBY_OFFSET(n) + (0x10))
> > >
> > > ... and add 0x10. Where are we now? ;-)
> > >
> > > I think it would be better to store the PLL base offset instead of th=
e
> > > PLL CLK1 offset in cpg_core_clk.cfg.conf, and define offsets
> > > relative to that:
> > >
> > You mean PLL_STBY offset in cpg_core_clk.cfg.conf and have the below
> > CPG_PLL_XX macros.
>
> Exactly, the PLL_STBY offset is the "base offset" of the various
> CPG_PLL_* registers.
>
> > Or maybe instead of using a conf can I add the below?
>
> Sure, sounds fine!
>
Thanks.

> > +/**
> > + * struct pll - Structure for PLL configuration
> > + *
> > + * @offset: STBY register offset
> > + * @clk: Flag to indicate if CLK1/2 are accessible or not
> > + * @sscen: Flag to indicate if SSCEN bit needs enabling/disabling
> > + */
> > +struct pll {
> > +    unsigned int offset:8;
> > +    unsigned int clk:1;
> > +    unsigned int sscen:1;
>
> This is a new flag?
>
I was experimenting with this so just included this hunk but I wont
add it as part of the current submission.

> > +};
> > +
> > +#define PLL_PACK(_offset, _clk, _sscen) \
> > +    ((struct pll){ \
> > +        .offset =3D _offset, \
> > +        .clk =3D _clk \
> > +        .sscen =3D _sscen \
> > +    })
> > +
> > +#define PLLCA55        PLL_PACK(0x64, 1, 0)
>
> 0x60
Ouch.

Cheers,
Prabhakar

