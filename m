Return-Path: <linux-renesas-soc+bounces-7315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE192FD97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57448281993
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63101741C7;
	Fri, 12 Jul 2024 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs/ng3Sm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BD17085D;
	Fri, 12 Jul 2024 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798181; cv=none; b=ZG2UOqCOp+2pAyGEBGrCt2bm8hqbrICEFBmwRnEo+CzdBlNKDq+JobroMmenfPwlgD64QM2WUupDzJd791MqOqemaJioUaNjcw7RQDu2XJyi4DXvhIXdeLyTLNX5IjLX04/cWcmg6V70grp2G+6HJK5KZoDr0cLjpFVSzWAUtY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798181; c=relaxed/simple;
	bh=+IMZBOwNJ5AwNiX0hjiRah2gQJchIdnWIXPtSSevNfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDNx5UtgIzDxKaCWkeYPCigEpjqsD81yX6r8CLDqHOCVpmL+jys03WnBqT3LCOTcp/sgthkCF3TzgNbkjRwisPyZmccKdg4CKyVetln+hM2rKqDg2pO4N7C6ZjjDjKTzciLlcLpaOi6TM/mpBbdo5PuNIL0Ks7piDqjmG/wRlxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs/ng3Sm; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-447e1eb0117so11454851cf.3;
        Fri, 12 Jul 2024 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720798179; x=1721402979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve3CcOjeMtMU8bzJnjUvgQ5PtDwAZqsbHa46kIGMMDU=;
        b=Gs/ng3SmCWOHPfHf9Kx4U32hL24IXUw9X8PM/AxENhOrwkybRcT8uAb2L9aXZR2dAi
         pS0j1gm8oE0wy61CdzgIbufthnb+8iQFd3BhSgxHSuoC1Dm5vZz4u0BIirfN/y63Zk9t
         udEXZc311R3vXqNWd2lwMaH4c0kkdXq8FhiImutgrvp1EmIIddVeJ53+WD2zUb3hswgR
         kGbXbi1GGfvIKxTMWiEXwzusvAJYSzMAMT0bI5t9TeHCWjX75l+u3xJRVsXY5D1YJ9jo
         VGuH2uwJM8VCUEAMORHCEjl5GL0kHcPym4SfdLVIk+Q1T5UmN8Wv0U9SXe6ZWt7qfyva
         eT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798179; x=1721402979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ve3CcOjeMtMU8bzJnjUvgQ5PtDwAZqsbHa46kIGMMDU=;
        b=F85XHUhepzZqCV2QLPHeAOFb/M4Iag/AnY/TzDXsfVu0vxp/TSlgVNJ916VA4TuikR
         IzjNdTX7hPRiQp4pG2hHx49zcHi7dcDc2uZG+PVhD3+5yYdWS+cTPLYZQDk8EuUoUKAx
         jUPgkuIQiX1xJnsPH5WoaC7HVISxMmwougCCSYx4gv4ohbCVDdvVVwCqE+JTfiBgsVeV
         1t/ytZViUBmZOtf80EOGsYFtVlwXMsWaWpL9ghN9B1R5ORwVAP2ZJ7DnMz+E99bE7kC6
         ah/Ova79DiA/WFWnnuLY92QOKUxdEqDnAX8camHXSmZeTxid4nCd3fT9OexfeEkOvQVi
         K3sA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Qz3iabkSWcbTmnrdl3pGpkdhnvijJMhwPGgQUAXIUqfhSlGSVXIRUcHBhzB1Xbs8BXkVSazeGauamGHiBaNeV6n0qfJq7MjC7NcbgMk6iLIQ2+WNjHFTxBIewCACfIaFoTUdDO+Wv75ttNF3nyVBvhFvNpyUTDONuRPkbftsBENJj8x1vezAHSjlAg6bMPqPJEqO68vsXhR1W+gZhe8UGjTfSKlj
X-Gm-Message-State: AOJu0YwP/60a7lw7PNCn+CiV42nakblYO3IpBQwkFVPQz9dFx/zktrm1
	zBLRFGBTXKdZldoU9NALeFOC3ADD0+nw0yaMptzN3AQ96JsxZbMnEATQ1M0pI1UfSaNcQKnSUWJ
	29Z9qSGgBRIwRPQp6cIgCx1Qbn4bg5sKl
X-Google-Smtp-Source: AGHT+IHedDfgr4oxy9l8g1SV0quzS/13qgZuFj80DhQ5BESrPL+1aCpiI5uk0XVyzQs7IElyHA+EFOWUbNnnwSnOSC8=
X-Received: by 2002:a05:622a:3c9:b0:446:49f1:79a with SMTP id
 d75a77b69052e-447fa89dfc5mr148250941cf.24.1720798178892; Fri, 12 Jul 2024
 08:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
 <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com> <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com>
In-Reply-To: <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jul 2024 16:28:08 +0100
Message-ID: <CA+V-a8ui9AKDOZzg_dgPXeGhGE-+rBHU8O1tpdb8w8myo-1p5Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jul 12, 2024 at 4:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jul 12, 2024 at 5:14=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
> > > On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v2->v3
> > > > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > > > - Dropped range_check for module clocks
> > > > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > > > - Added support for critical module clocks with DEF_MOD_CRITICAL
> > > > - Added check for mon_index in rzv2h_mod_clock_endisable and
> > > >   rzv2h_mod_clock_is_enabled()
>
> > > > --- /dev/null
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > > > +/**
> > > > + * struct rzv2h_reset - Reset definitions
> > > > + *
> > > > + * @reset_index: reset register index
> > > > + * @reset_bit: reset bit
> > > > + * @mon_index: monitor register index
> > > > + * @mon_bit: monitor bit
> > > > + */
> > > > +struct rzv2h_reset {
> > > > +       u8 reset_index;
> > > > +       u8 reset_bit;
> > > > +       u8 mon_index;
> > > > +       u8 mon_bit;
> > > > +};
> > > > +
> > > > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > > > +
> > > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit) =
     \
> > > > +       [_id] =3D { \
> > >
> > > Indexing by _id means the reset array will be very sparse.  E.g. the
> > > innocent-looking r9a09g057_resets[] with only a single entry takes
> > > 600 bytes.
> > >
> > > If you do need the full array for indexing, please allocate and
> > > populate it at runtime.
> > >
> > OK, I will use the radix tree for resets (is that OK)?
>
> You mean XArray? include/linux/radix-tree.h has:
>
>     /* Keep unconverted code working */
>     #define radix_tree_root         xarray
>     #define radix_tree_node         xa_node
>
Yes, I meant the above.

> Given a single xa_node is already 576 bytes, just allocating the full
> linear reset array at runtime is probably better.
>
Agreed, I will create a linear reset array and loop through the array
based on reset index and reset bit to match with id whenever required.

Cheers,
Prabhakar

