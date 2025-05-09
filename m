Return-Path: <linux-renesas-soc+bounces-16862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC1AB1536
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B169178C68
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AFA226D04;
	Fri,  9 May 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOE4/cEU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F441F5EA;
	Fri,  9 May 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797373; cv=none; b=OHDyN6vxQJTIehd0BfJE5aMxOwLIDqd3fmglYmJ9v6YV+P5iBQr5tY2JYYCLR0IRmbi6TghNkYYvf0WSu7tsJTVcqZYihBPjpFV8jLzicECFQ+rftR4eACtIdR3uaLPyb12Tnc3ykpFz++9SInYXY8P0cOX7b4RV98VJMxNGAjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797373; c=relaxed/simple;
	bh=VTUhwyCFVJHXbPOiVHuMR6HLMB9i1XE3aN5p4N741Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+vauySYlzDShVHrKHi6zC0mJLi+cEgQJmhroM9z/u0+kCLy6eUq6mZ+X5Eq9oiyPTYlgQOlBfQoqGe5C5/nufJbeK5UCl7PYr3SoQ/blkb5C2JWd81Y9PMY9tFAfWm1fgcfPoukgrw5Q7yO3zQFd5YuLnqLSNAfUmD6mQCRanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOE4/cEU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso16402585e9.2;
        Fri, 09 May 2025 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746797369; x=1747402169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAjcyLLUHHoKLlLAz4gIt49fi1TRIPxU/0xocMT17i4=;
        b=dOE4/cEUTnaSxhr6KLTspJeyKq+NHX9IviL1yww+eUC9ZnTxgyGWq3R02PSHj4pWbZ
         YuF2EybAZPqLMwxzgycYPng6sKp9/qEsx1HdFCh0lQea6VsvNw8xb8ZjraGMD1B5Tybr
         bFdklDtfrQUcd9pdSOVpsVeogRIT2Yb63b6zJuRKs0mxwI3OjAaOUuWAcHkPMnjtntxg
         DHgwl6fQZ1jifdqazT7oweUIzR4BMKHSCAxyggkpbk2CN2o6GT4OBRWhOTS2thoe7QEH
         GVb1c5N8/kXOSFmdSwIiPk4HWP9u9Vc0keswAsutzpNbLzeO5X1Ipr1UAt82VzGctda2
         EuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797369; x=1747402169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAjcyLLUHHoKLlLAz4gIt49fi1TRIPxU/0xocMT17i4=;
        b=JyreMMix8Vm0yECTzLmXvk6GQ9BLp4mbA/sXJhKww83bfthHEpZWyesJbQilS0AuBd
         qG+eigEbcL+lmgsj1TMkRqhZUMmYlVKnRCyWDAcQcXxZ3kwWV+N83XrwOVGeFPwdhq6h
         IqXJ/J3Hf5xofaigIIkUlghj+/62g5yzIidZZqI6RLkNg2i7vKWoqaVA8va34vs6COv3
         4WxWNaYe5ngbY1tueYia45t9K/g9PAEMgGLGgkPxaTt6RZYNFkzyDTXIYuESQ13SCb9g
         Nh1IE3rzJpDaR7I9JJX0glNJ0lEE3xV149szelNT3B7Cv5xFvJIeE+IFmVkKZSLvqdBE
         f2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlRqcV5rMjpbOuROxGyrWSjvD4BraIeMV29NbnvK2UxnfIZpcpeFibuDGg2ifz3Uz0bwTTXvo8kNV/VlB/5bIBMOE=@vger.kernel.org, AJvYcCVKftQrAey1QOWpLiw3s+dWqw7zqzdTfbkZAgmOwQ2EUhXpujjt2VFAhVJFNoaO8fHUmOpnj2QHvqo=@vger.kernel.org, AJvYcCWE55HrhK5bHh0shh7t+VYVsuuxrYR9Ko0k8PQ8Av+PSGHPmZmDJeqtMUlnL4psAAjmwt4m3TbaOyGz2XXg@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdeQQe2DCrrO6WhYHZcZ1MnQwt/3RC4ZHs4FahWb1+NEXXUvh
	fvoq5Ol9GcYNLcavitcv6Ob+DWLh0sVwL7kawnAzZganFLyAmnywuLj+yPfKH3aO8j7qYjyQZYC
	IFl4hxVSZcgMuVSqZyokM66aUGgk=
X-Gm-Gg: ASbGncut5Xa2aSN0aR5yx5O5vr8ZC2VB/KNECGlMCByXqT8BsbEEM19kE5LoQI9tHeB
	ZyoxrU2leMTSNypQMBJY3JgzSKPmyxsBY1lsym1GEFgqpNSJKSZJEoAa+jsyGH86JyE279VKqIr
	zNC3358ZNVekBVSmrAXcBT/A==
X-Google-Smtp-Source: AGHT+IHtVI2pyoRAO5lIPxueecpsNEKA+L1sFo0+6wNlyN8kBVMW7vgJLsD0ozHvFJYSp0dgBbvzHAKcfZrL/y/+yd4=
X-Received: by 2002:a05:600c:548d:b0:43d:ea:51d2 with SMTP id
 5b1f17b1804b1-442d6d44918mr28228735e9.14.1746797369209; Fri, 09 May 2025
 06:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com>
In-Reply-To: <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 May 2025 14:29:02 +0100
X-Gm-Features: AX0GCFvQg2K352ydidoNWkyE3_L_e7L1lUvhobbGKCoG86SY7RJWT89lXaip14g
Message-ID: <CA+V-a8ukvn_K69h_COXS6JCqZbqXPQG1L9UAnm-gYQk7PTzb_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, May 8, 2025 at 5:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GBETH instances. Include core clocks fo=
r
> > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> > used as clock sources for the GBETH IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
> > - Renamed gbe0/1 external mux clock names
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =3D =
{
> >         {0, 0},
> >  };
> >
> > +static const struct clk_div_table dtable_2_100[] =3D {
> > +       {0, 2},
> > +       {1, 10},
> > +       {2, 100},
> > +       {0, 0},
> > +};
> > +
> > +/* Mux clock tables */
> > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0", "et=
0_rxclk" };
> > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0", "et=
0_txclk" };
> > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "et=
1_rxclk" };
> > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "et=
1_txclk" };
> > +
> >  static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D=
 {
> >         /* External Clock Inputs */
> >         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
>
> This patch starts to LGTM.  The only outstanding issue is how the
> et*_[rt]xclk will be provided.  I have read your comments on v2,
> and am eagerly awaiting the full patch set (CPG binding update, PHY
> updates, ...) to get this all to work.
>
My intention here is to get these initial patches in so that we have
Ethernet working on RZ/V2H (G3E/V2N) so that we have these boards on
LAVA and tackle et*_[rt]xclk clocks for the next cycle as this will
have to be discussed the -net maintainers. Are you OK with this
approach.

Cheers,
Prabhakar

