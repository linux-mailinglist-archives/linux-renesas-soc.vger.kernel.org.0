Return-Path: <linux-renesas-soc+bounces-5855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A068FC82D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 11:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00B51F26046
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906C418FDB6;
	Wed,  5 Jun 2024 09:42:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0518FC95;
	Wed,  5 Jun 2024 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717580575; cv=none; b=kgg55ZrqZOoWWDte8tnweJ7U8vIqNgdLMkgnu/oPTMC4p6ZYea673YfNZg/JOLwSoBh9njglIBxJRb2/XhdEgaezyRmWE97dnz7E+eth/0hMY7U9v1CtrBL3+qRsJ1Y/rcdrTT7M2y+y5o6VULuIFcOz+3mXEZei1+pKskdYL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717580575; c=relaxed/simple;
	bh=bpuw88h7/ULwUncE97Dy+1F31l30KUzHngnfz7u0Tpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ36QZrDxWU65HwDywFQ5IQjiCZMU5740Bw2Ox1R9WdurUFy6+/249Dq1yJ00CLH+EYFV0bsEJ4kVZ/DGW6HWTQ6Ll5m8z3sImVHU4CEU8z99xswybOC81x4K6aGMHV4XNdgnaYZL0Pud7qxONGh9KNmhJaBxWza2mvhAr3aiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa8427f22dso4837950276.0;
        Wed, 05 Jun 2024 02:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580572; x=1718185372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftRQbH4WicPUfKz854Xb+Om1FETcdEVVljV/Kl9PKnI=;
        b=jYuP8QDvKvsL1D+fA8KXM4RKotM7Z6uBMljnpu0kHRtTBnaT+oOjYuest54w/BzcS2
         jKG4xMsMSr30qDb3tjbT2IAAagZz88PodUdCQkSbmU1F2x/ZoactMgJRDNDatp3KYR6H
         h4mZWdKuGz/TlFQEWcuNmNJccuEdUvbt1s3PEZKqB9x39A3x7jmqpApmA4qMqT03S6JU
         ZLi1KPGLw32tPXYTb8Va+rGfdKquphLhGJhq0pwnzTkCLsQBJpPTAbPvO7OCHJoSQCSi
         O4WlOLZM4G2x7XW13idBjD4TSJerpkuCasSaHg6Ir40SzSu+32NnrzcFDB+QHy8pgpvF
         9BlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNgrCVXKndsGZtG1LizbHoazfV9wcecKtZ3SPR7QhrJA/DsipjA84bNq1BJONaNCbh/aGqRYn8gH3/yVqMQUHo+J0DV9qfuz8cr2KAvqw1NjadWpjQ2Ownk6YcHHEMzf+zEafuf7oPwRStq4F30gMAbLqbEq3ZN0rtDu1zvJAPRQmVRKIr724zc/T3dKZ1phfnJ+NiJFoOYJUiDVOhDglDrtxq90S7
X-Gm-Message-State: AOJu0YwFkyu/+SemEtYaTqh6b9EQADVORIFH1l+Dl/Na1UBOdVFT4NIu
	ysfHP2vVc+eE11LcbbogFJ8W4qRcSyIvzBVpBD9y8SwFATWbDpStEcUjxO2q
X-Google-Smtp-Source: AGHT+IEEpcP0qTLSOLsIdmNVvxBgot+xPcQQOBEurRGYHFnjsCOq1BVn98z6tEw/K0QEMwvSlVlUTg==
X-Received: by 2002:a25:902:0:b0:dfa:6c81:acd0 with SMTP id 3f1490d57ef6-dfacad25f21mr1814224276.60.1717580572063;
        Wed, 05 Jun 2024 02:42:52 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa76af2e49sm2448613276.23.2024.06.05.02.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 02:42:51 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso7170589276.2;
        Wed, 05 Jun 2024 02:42:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKpeev8nQQeuuirugjBNac6bAsnnLMOH1KPz7xfd1Jdgo/0AFH6Qllf2PUNeqdQxkPNs+6C+o8SD8bUqxjZr1k2dlU5i2+fBa5Ly5fWm8PzQxb8xX+ugmx9goIw6SrdnBkzBQCfsm/dqQAHWVcuxcnQCLL3AmtRFljMXodaiDqbGlLvW/E38NXtIgnpv+erdcyKRsRK+pKH9thkEyDEDAT/nvZkDji
X-Received: by 2002:a25:ac09:0:b0:df4:eb0b:8fc with SMTP id
 3f1490d57ef6-dfacacff985mr2036937276.43.1717580571709; Wed, 05 Jun 2024
 02:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
In-Reply-To: <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 11:42:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdFM2u5TjRQZCSiigC=uBk1kz6aW6hYTy5Wa=PCgX7yQ@mail.gmail.com>
Message-ID: <CAMuHMdXdFM2u5TjRQZCSiigC=uBk1kz6aW6hYTy5Wa=PCgX7yQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC
 CPG driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jun 4, 2024 at 5:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the device tree bindings of the Renesas RZ/V2H(P) SoC
> > Clock Pulse Generator (CPG).
> >
> > CPG block handles the below operations:
> > - Handles the generation and control of clock signals for the IP module=
s
> > - The generation and control of resets
> > - Control over booting
> > - Low power consumption and the power supply domains
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > +
> > +  '#clock-cells':
> > +    description: |
> > +      - For CPG core clocks, the two clock specifier cells must be "CP=
G_CORE"
> > +        and a core clock reference, as defined in
> > +        <dt-bindings/clock/r9a09g057-cpg.h>,
> > +      - For module clocks, the two clock specifier cells must be "CPG_=
MOD" and
> > +        a module number, as defined in <dt-bindings/clock/r9a09g057-cp=
g.h>.
> > +    const: 2
>
> I understand this will be changed to 1, the clock number?

We typically come up with our own definitions in header files if there
are no suitable module numbers listed in the hardware documentation.

For RZ/V2H, you could use a combination (e.g. concatenation) of the
column (register) and row (bit) numbers from Tables 4.4-14-19
("Specifications of the CPG_CLKON_m Registers") and Tables 4.4-22-25
("Specifications of the CPG_RST_m Registers") as the clock resp. reset
number, like is done on R-Car Gen2+ SoCs (see MOD_CLK_PACK() for
conversion from sparse to packed module numbers).

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

