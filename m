Return-Path: <linux-renesas-soc+bounces-9382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B6990128
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE8A1C2120D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 10:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E2A155A5D;
	Fri,  4 Oct 2024 10:26:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7E155753;
	Fri,  4 Oct 2024 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037583; cv=none; b=oaexK4ntRNdWq4LiQ++DOAn2eJ/Q7n8kb7dK3oJZLtBap5d3sYlC5OmJ8mSZCriTOTXkRM62TxdNPIlc3rhIEwBDW9SRj3sQF31rgCJu8JpVb7tCPplP82KzdckP4l7S0xpz6vuoMoTYTwnTuCpDTJENRFJEvXMCcHgYaIKshlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037583; c=relaxed/simple;
	bh=e52eoWf7N3dvIOdGrBitFmcw0yUrL4qgU6pNsk4c95Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l59PXeMFS+0HdAXssjEMr9gVcsRX80fbFRlKB9n+T3VgqNkVGBRw2fWUkNnDG4LZyZCxzO7aZKfqP8buwbgdc8ixia47nX+gKGhrE9H40efOkFLMT0h6TMhV3kvvvx1zKNL8oEW4UjuxI7q0KMK/hwB/04nAgFPtBoZAPdnMsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e252d1c5b25so1621167276.3;
        Fri, 04 Oct 2024 03:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728037579; x=1728642379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdfJS9HKwQvXD1Y4tgaSbkhrZsV+Ih0nT0QvGrBwjdM=;
        b=fyMDPskYvR/ZxYYKTXlAgnXl6mowcC3C/bJP9zCwbOdlLelA1v5V1XV/B2k4nSmeyo
         kCveyD95pK4uRZgKqDhG047zbXX9vjicEffCWizwju0EuaL7Zzt2r4i6gn2e64YUUG07
         hoLTF9G6/vwBaiF7TXXzmh/JbjZwFajsX+9I2vvVaIt7UhBlEpkLcWIibbWulKnIkpsn
         wvByjR/IahBXNlfwEap1Vhm8ZStHuHsNJ1eQzymvCJQfckq5ub9WuMERNlN1PhQKlBCj
         EgjJym9nf/HetY937ZJtq7XqctNcm+ajA086S6hbGCSwT+0VwHs28UcoJifPKCyDziNw
         wuUA==
X-Forwarded-Encrypted: i=1; AJvYcCV+VsWzdkyVSehH6Co/oBR+GW3IwytCA0MQSdrzR1SvNMZUKdAMqsyoYFbkrbDdulXn56OJSk00W9pJJ7PIlio3v2s=@vger.kernel.org, AJvYcCW6qLMWtUnuEwdDWU+QYn0Nq4+OhvTl/pENX09vwclqU9iHylMP041iHAbrIaB93VUXYZAqeh22GzAT@vger.kernel.org, AJvYcCWF3kK0etBKyAF41H6YbhXrwyCUSF9WvBlXJ/eR8g2RaXsTb6L6t+9DSCkJo5BJaunKAHDed8CEnLMvRdLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAB8uiAzPmNA7sWZ70/YVTJCIkI5PukOUBP0/KzzBv4kIpwbJ
	NMkiNBR8dlFWAqEKJS11UclE1GLIKhgosx8twd+7FbtfV4kwPN7BlRn5HUHM
X-Google-Smtp-Source: AGHT+IEmHt1bynH9g8h69vI7d0szltnb8oJ4PCW7rkmytpGsBdJTjA7/SO/nMHGFePZvWqigs/HVeA==
X-Received: by 2002:a05:6902:2b8e:b0:e26:11ae:6de9 with SMTP id 3f1490d57ef6-e28939561eemr1301989276.52.1728037579432;
        Fri, 04 Oct 2024 03:26:19 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d73203sm547930276.39.2024.10.04.03.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 03:26:18 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e20a8141c7so17998737b3.0;
        Fri, 04 Oct 2024 03:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+DuTEllewD0pv3QiV+w/XYIjd9XpIpzLL6V+Nuo2aSG6FDXdKjSxFTO0Q0f9+pj6mRp5bJyralG8K@vger.kernel.org, AJvYcCVUEJutsA0BaRWqjQTPSTuBp4hvlo8oMMLTLNxATvt4KCrc/GCkyLLDhoKOhVRGfVxNmIJpyCNvewWNrh+mHEoXwLg=@vger.kernel.org, AJvYcCVuoiZ/JLcoxEoOTRbk7pD45HQtWTL+O4n/ByRQbpH9OcsQQEdgwTyLyzjHffMLCm5FMOOtx8uoFYarrDHy@vger.kernel.org
X-Received: by 2002:a05:690c:4b08:b0:6e2:1c53:7918 with SMTP id
 00721157ae682-6e2c726e433mr20876817b3.14.1728037578509; Fri, 04 Oct 2024
 03:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com> <20240930145244.356565-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20240930145244.356565-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 12:26:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWp7MyqT4LtNna+kOCpMpXvMKxcFuqsm6vuPgUVuvBGAA@mail.gmail.com>
Message-ID: <CAMuHMdWp7MyqT4LtNna+kOCpMpXvMKxcFuqsm6vuPgUVuvBGAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

On Mon, Sep 30, 2024 at 4:53=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add DT bindings for the Renesas RZ/V2H(P) Interrupt Controller.
>
> Also add macros for the NMI and IRQ0-15 interrupts which map the
> SPI0-16 interrupts on the RZ/V2H(P) SoC so that they can be
> used in the first cell of the interrupt specifiers.
>
> For the second cell of the interrupt specifier, since NMI, IRQn
> and TINTn support different types of interrupts between themselves,
> add helper macros to make it easier for the user to work out what's
> available.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Removed '|' from main description
> * Reworked main description
> * Fixed indentation of #interrupt-cells
> * Reworked description of #interrupt-cells
> * Dropped file include/dt-bindings/interrupt-controller/icu-rzv2h.h

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2=
h-icu.yaml

> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-icu          # RZ/V2H(P)

Too many spaces before "#"?

> +
> +  '#interrupt-cells':
> +    description: The first cell is the SPI number of the NMI or the
> +      PORT_IRQ[0-15] interrupt, as per user manual. The second cell is u=
sed to
> +      specify the flag.
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 58
> +    items:
> +      - description: NMI interrupt
> +      - description: IRQ0 interrupt
> +      - description: IRQ1 interrupt
> +      - description: IRQ2 interrupt
> +      - description: IRQ3 interrupt
> +      - description: IRQ4 interrupt
> +      - description: IRQ5 interrupt
> +      - description: IRQ6 interrupt
> +      - description: IRQ7 interrupt
> +      - description: IRQ8 interrupt
> +      - description: IRQ9 interrupt
> +      - description: IRQ10 interrupt
> +      - description: IRQ11 interrupt
> +      - description: IRQ12 interrupt
> +      - description: IRQ13 interrupt
> +      - description: IRQ14 interrupt
> +      - description: IRQ15 interrupt

"PORT_IRQ<n>", to match Table 4.6-22 ("List of Input Events")
and '#interrupt-cells' above.

> +      - description: GPIO interrupt, TINT0
> +      - description: GPIO interrupt, TINT1
> +      - description: GPIO interrupt, TINT2
> +      - description: GPIO interrupt, TINT3
> +      - description: GPIO interrupt, TINT4
> +      - description: GPIO interrupt, TINT5
> +      - description: GPIO interrupt, TINT6
> +      - description: GPIO interrupt, TINT7
> +      - description: GPIO interrupt, TINT8
> +      - description: GPIO interrupt, TINT9
> +      - description: GPIO interrupt, TINT10
> +      - description: GPIO interrupt, TINT11
> +      - description: GPIO interrupt, TINT12
> +      - description: GPIO interrupt, TINT13
> +      - description: GPIO interrupt, TINT14
> +      - description: GPIO interrupt, TINT15
> +      - description: GPIO interrupt, TINT16
> +      - description: GPIO interrupt, TINT17
> +      - description: GPIO interrupt, TINT18
> +      - description: GPIO interrupt, TINT19
> +      - description: GPIO interrupt, TINT20
> +      - description: GPIO interrupt, TINT21
> +      - description: GPIO interrupt, TINT22
> +      - description: GPIO interrupt, TINT23
> +      - description: GPIO interrupt, TINT24
> +      - description: GPIO interrupt, TINT25
> +      - description: GPIO interrupt, TINT26
> +      - description: GPIO interrupt, TINT27
> +      - description: GPIO interrupt, TINT28
> +      - description: GPIO interrupt, TINT29
> +      - description: GPIO interrupt, TINT30
> +      - description: GPIO interrupt, TINT31
> +      - description: Software interrupt, INTA55_0
> +      - description: Software interrupt, INTA55_1
> +      - description: Software interrupt, INTA55_2
> +      - description: Software interrupt, INTA55_3
> +      - description: Error interrupt to CA55
> +      - description: GTCCRA compare match/input capture (U0)
> +      - description: GTCCRB compare match/input capture (U0)
> +      - description: GTCCRA compare match/input capture (U1)
> +      - description: GTCCRB compare match/input capture (U1)
> +
> +  interrupt-names:
> +    minItems: 58
> +    items:
> +      - const: nmi
> +      - const: irq0
> +      - const: irq1
> +      - const: irq2
> +      - const: irq3
> +      - const: irq4
> +      - const: irq5
> +      - const: irq6
> +      - const: irq7
> +      - const: irq8
> +      - const: irq9
> +      - const: irq10
> +      - const: irq11
> +      - const: irq12
> +      - const: irq13
> +      - const: irq14
> +      - const: irq15

port_irq<n>?

The rest LGTM, although I think you may want to add more interrupts
later, for various events? However, it's not really clear to me which
interrupts go through the ICU, and which go directly to the GIC.

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

