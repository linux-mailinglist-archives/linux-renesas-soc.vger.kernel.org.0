Return-Path: <linux-renesas-soc+bounces-18280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26081AD8B7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 13:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD0D1768A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4495275B11;
	Fri, 13 Jun 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUctGX6T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC602275AE6;
	Fri, 13 Jun 2025 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815904; cv=none; b=q5VwG3cOBPvDytclq5KDM90QtgweTg6n2xoSkInwX2VPhwCmt2Zn/ejWGgfWbpLsUBrpY0kwR2M9EmFptlcntP/7Dleb1/9eKAeOxdm5oFkPbn5OQ1y+8fcySAyfG7AqOU1CS5Dl1bxznP6zpgjA9wyjke4n7Wmnszj2ho6f/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815904; c=relaxed/simple;
	bh=kGmD8JB19m0HhUHQRBoezxXA2nIBVgQxsgwG2CF215E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcqDkKGHlFOEBw75n3t4ttlGrfAB4Eyg8DgfmSAzwMUU5BxBt8ohT3i/SUqiHHBURkMa72R240Bf9HizvlBZl5yFZlteKUWp4hjb9vBrdYV7EMPhawWDtu0ALlaSI5Vcf51/ijkf3lbVyZwOth6BtRcOdhFws6/FxywTiC578VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUctGX6T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450dd065828so16502325e9.2;
        Fri, 13 Jun 2025 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815901; x=1750420701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3eMhtTUTyut2nDlLIrWhDjg9MBYJFf+FAciQR/QagY=;
        b=hUctGX6TOPld5yq4sDC56XUYuv6hprinX3Xy9n0jjyXMutC4OKcSuN9xd3sdRfAkUL
         sJ6QFGAu73uvSJ5HhACIjnZhGUD8UCtQfVzvV10wvW7/AZwFuesoypLiqTiIegIrBM7b
         bZa0lI3GLa3p/Cfifvmu+w48XB9zB2spg9HPIZV4ko2YGkdywSkaKRpMtcb4TO2Q733r
         JmNDUG+nKj75lzyUNOCX/24AVpK6wPZZJ2zGErujDjkNpqf1cWdI4ltjRF5g8AOp02Kf
         09SeUPi4p6xkcIY7aZ2kfagAo5SRNIFGFGW0WTJKseP99lmsVGmiJT0G2KMhyAdm+wCs
         kRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815901; x=1750420701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3eMhtTUTyut2nDlLIrWhDjg9MBYJFf+FAciQR/QagY=;
        b=wdBFh0hoIgRd0heIigAHtwXRQ5+YVbRyApNDeVILa6UXKapVOV0qwpOt4XZtDF9yLD
         MpQf5hyUhrbh37BJ4v6PncK6AqHyMO3jGRGzYy8YdidLiW03WL8v1f+g/eM03XFBConB
         v3aE8WA/PuD/1+yaciHLWEdQ+PMRykFYFeUhwu0kKuSlf0rVf0eoEEH9TozfW35IXYtL
         8aB1Yo1El2YUcXByh2KKZBAcZ+a+UKzNsUsDkNUoxacM8acCrsMeLCmrJcQOlW1U6ogH
         XA9ryl4lYa8QgXy10EQJJ5U2VboNmbM9aKVrYVpivENHL4H3mNvvzdSfMJSOVA8cZVls
         4aDw==
X-Forwarded-Encrypted: i=1; AJvYcCVP7i7KoiU/4/eylXoyLHBQ4iEJ7MwHRa77vB5EdmnBQ8QA9hZse47k3kxeALHzdQH3uEJMqHWEM13dL5Fn@vger.kernel.org, AJvYcCVQDxNWRKpmzYMoWlPp+0MsUuryxHzvFbL3jItCr4llbVd1FCeNOduNGPcXoQDb04zQBQ+teHw0IT50@vger.kernel.org, AJvYcCVjuYKRcdFqHZkKsA91YKnPnRFOqMCn/uo5CEExvpSnDVGtKrhEx+VcfuMo5f66/Ikx3VcXFBehDMlbirTyeixP8xk=@vger.kernel.org, AJvYcCXbriV9PUbZ+UNAEIy+BGI4+DDrgpP29y9VNj9/ktnTvgcngAKbpgQYRT7oj/NQNef6Wfkkh/SKTDfy@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiIlz9i1EFmOYnVP5qdUzkkqzDB6BuUACrsNb2q1cBlxKnSFj
	/TfiBlbEW47VtZvQirO+nMYNTqTxzcquoWtcy/TSeZO0GOuQqcMeglFjMRsWoOsrhJpPte0YuYb
	n1vBJNQwdCBqjZPYnWv/FJY587N4flTM=
X-Gm-Gg: ASbGncsYoG7pgbKdv76m7HqShRKEer9pvJxvJjQ9lVz7GKIWPqjf6wXiyWAEMpNJuLF
	+MetWrcwTyiOB6DG+VmQwQ2+Ucu/bwvzHGcF5GJEW5vavhQJXvz8BBctposTEgazHxJULFX/3P5
	VJD0UUuUO6CUhJQIgLm5Y5ZzFid9YR5FIbUZsqPCPywXLEkX66L6ZBL4x0rtrX0LyTtiaELVQMX
	G0ORtbtvIRTog==
X-Google-Smtp-Source: AGHT+IG/7VJabrHQCjSUvresbYAtyJF2QCi65NJE/H8hpkv92Y0pDiB+ItmEawPO54iQKV9D7rQ5943HH+mWJ2mxCeM=
X-Received: by 2002:a05:600c:1c19:b0:43d:9d5:474d with SMTP id
 5b1f17b1804b1-4533499db1emr31423015e9.0.1749815900968; Fri, 13 Jun 2025
 04:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVvQEC9c9wHDrFiY6iixuP-JjOgHZQjfzOkAjvxs=LuqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVvQEC9c9wHDrFiY6iixuP-JjOgHZQjfzOkAjvxs=LuqQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 12:57:53 +0100
X-Gm-Features: AX0GCFtuTlsa4Ii84sW_lD7uEsQCXVKDSlUppMTz6suqDDVTRQMUqOTSl9D_r-M
Message-ID: <CA+V-a8vUdBwAx5x1FfWJZK0BeXQQqFeDRLtvyETiPDQc1Pftiw@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 3:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for Module Standby and Software Reset found on the
>
> the Clock Generator and Module Standby and Software Reset
>
Ok, I'll amend the commit message as above.

> > Renesas RZ/N2H (R9A09G087) SoC. The Module Standby and Software Reset I=
P
>
> Clock Generator and ...
>
Ok, I'll amend the commit message as above.

> > is similar to that found on the RZ/T2H SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> > +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +
> > +/* R9A09G087 CPG Core Clocks */
> > +#define R9A09G087_CLK_CA55C0           0
> > +#define R9A09G087_CLK_CA55C1           1
> > +#define R9A09G087_CLK_CA55C2           2
> > +#define R9A09G087_CLK_CA55C3           3
> > +#define R9A09G087_CLK_CA55S            4
> > +#define R9A09G087_CLK_CR52_CPU0                5
> > +#define R9A09G087_CLK_CR52_CPU1                6
> > +#define R9A09G087_CLK_CKIO             7
> > +#define R9A09G087_CLK_PCLKAH           8
> > +#define R9A09G087_CLK_PCLKAM           9
> > +#define R9A09G087_CLK_PCLKAL           10
> > +#define R9A09G087_CLK_PCLKGPTL         11
> > +#define R9A09G087_CLK_PCLKH            12
> > +#define R9A09G087_CLK_PCLKM            13
> > +#define R9A09G087_CLK_PCLKL            14
>
> The RZ/T2H DT bindings file lacks PCLKL, which was probably a harmless
> oversight (it can always be added later), as it does exist on RZ/T2H,
> too, according to the documentation.
>
> However, given drivers/clk/renesas/r9a09g077-cpg.c has
> LAST_DT_CORE_CLK =3D R9A09G077_CLK_PCLKM,
> using R9A09G087_CLK_PCLKL will lead to wrong results.
>
> So either you want to add R9A09G077_CLK_PCLKL and update
> LAST_DT_CORE_CLK first, or set LAST_DT_CORE_CLK to R9A09G087_CLK_PCLKL
> in this patch.
>
Actually I already have a patch which includes a couple of fixes and
to the orignal bring up series for T2H + I2C support which adds
R9A09G077_CLK_PCLKL and updates LAST_DT_CORE_CLK. I intend to send
them when the base patches are accepted. As there are no users for
PCLKL in the bringup series this won't cause any issues. Is that OK
with you?

Cheers,
Prabhakar

