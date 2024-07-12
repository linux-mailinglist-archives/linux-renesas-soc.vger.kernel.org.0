Return-Path: <linux-renesas-soc+bounces-7290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E992F9C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863B72848A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 11:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B141A16B751;
	Fri, 12 Jul 2024 11:58:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3622BB15;
	Fri, 12 Jul 2024 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785529; cv=none; b=KLdpN3c/kzJ3Ul0qVoEdwwNcaScdk3TaRZ634qeOAcXuTdxFDrO4PZo5SeBN0gCQXoFDWeDxwGrYXW5DFjIr4Shwu4uxUGcPaCDQiRfXGkYM80rpn/yIMslZ1lKjAe7sYql4Fv6Axf0w2ldwz87b1gPJVjiqFjmtiD9hNEK97BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785529; c=relaxed/simple;
	bh=F9LIx206GqB1O/IHrgKAvGrDiPGQHnkr1OLpiJmiLSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kModg7aQJ2c0TqoNhLp/ZmSJ6u5tgeCLm5HSsqVhzGEVXHSy40ruJ4XSygRX5T1wbu6y0jnXOy3ir7L59dFe8b1f6Dq3kzrEN/4ArV3vtBR8ZKO2jtUhJnbwUp4Wyv17XYBwPD9/Y7h0ZZZelF5J8Xv/nQjKDUgMmAMlm9LclWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-65011d9bd75so17727457b3.2;
        Fri, 12 Jul 2024 04:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720785525; x=1721390325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF2bMWPyZi6vd82Lf51WYkKA6W7bTYgSo8Lk2NaqG9s=;
        b=M/ouNSmAV72CKfWsHamOM9jJDvHg3Kp5DZkldCrMmnRAe7TRoJBQzFe72kxB5imWTd
         /aY1PgKkdXamAEyYwvGlbW588gkHLEbwqMgSeaV/PuPZGIQkWCejHZEexf530SdM5rT3
         GIgPEo1TG7j05ZgEhkqAXRodYy+o73e1SPN3EMSJgXaKQ2/fRnEu5RFYV+v+I1OBVXgU
         vG/WdFOREfcqQL5O+vaR+xaIbzmbdQR0nIA37YAi7qD4b2DhtXPv6MlxPmA8aRbA67qg
         Hyq2FwfLcnLb3EnWNsZ5fmtaH6W2TlOLQeSDR0AuxYCGvxt+AYqDnDJ5AuR2PVYY6ev7
         lPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIbGjewZ9a2T9Sxi0IhK+xPhUdZHfTwB1N/YWAT5Mg5KoKHpdTjZVqAGBvRaGOHvUGhid0h9//k4aPLMq43BevwnyZZ2vwvLdppT3ka87MHLtHdrOgdroybbmNhh77RxMx1VM+7aqdamtqGr6wy9R/tjskzMRKmOC2wZlZiO2uNgM0+iftAvE683qbSbNTVD9hXvAQZafngfAQetWhUVxdjXh9FIiH
X-Gm-Message-State: AOJu0YxiXjQvpulVX1yZr+ZLiaEnKN9UWfF/Kv6HN4hirHuHAijjL2x5
	uovjJh6cEzZMGnKUonpDG/zOUMEJODiR0Ks6tslBWFNxElId7RIBDAKqRoKb
X-Google-Smtp-Source: AGHT+IHMVexUihriVIjO5y24An32x9S5NmYPKOWAuIc8d4JSivrgTe8n5jyHkWUPr+3bIBtqICeOWA==
X-Received: by 2002:a0d:ea11:0:b0:648:1eca:9e15 with SMTP id 00721157ae682-658ef249b0dmr114783687b3.25.1720785525176;
        Fri, 12 Jul 2024 04:58:45 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ecf8asm14409917b3.100.2024.07.12.04.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 04:58:43 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65011d9bd75so17727067b3.2;
        Fri, 12 Jul 2024 04:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiOhWwic8clUzgEMX6WxFGHfTY1CguvZLe7EJh+k3DR1IPAqruaurCgmKlB7VTmkiMH9XQppYFLjKUTMmrlj6StcgTR/Cz2izkoxON0N6my4dHeEyxWUUhqVO1BqMDeDiVsDKMjIbeUYRiWoZ8vSPGBA/64qHSLHksGovfXPbmXnyAlIgRlgzaPiKMtYZhnKJCRGseiwbtP6iFctbn+6gQpOhM9Iqg
X-Received: by 2002:a81:fe0d:0:b0:63b:ce8d:c7db with SMTP id
 00721157ae682-658ebcad38emr108725057b3.0.1720785523575; Fri, 12 Jul 2024
 04:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240627161315.98143-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240627161315.98143-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 13:58:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4GUKc=LFStKHO47vPJLZs3Vmvz-L7L81bC5DmdK5ztA@mail.gmail.com>
Message-ID: <CAMuHMdV4GUKc=LFStKHO47vPJLZs3Vmvz-L7L81bC5DmdK5ztA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P)
 SoC CPG
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> Clock Pulse Generator (CPG).
>
> CPG block handles the below operations:
> - Generation and control of clock signals for the IP modules
> - Generation and control of resets
> - Control over booting
> - Low power consumption and power supply domains
>
> Also define constants for the core clocks of the RZ/V2H(P) SoC. Note the
> core clocks are a subset of the ones which are listed as part of section
> 4.4.2 of HW manual Rev.1.01 which cannot be controlled by CLKON register.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Dropped '|' for CPG description
> - Dropped description for '#power-domain-cells' property
> - Added 3 clock inputs for CPG
> - Dropped label in example node
> - Used 4 spaces for example node
> - Renamed r9a09g057-cpg.h -> renesas,r9a09g057-cpg.h
> - Merged adding renesas,r9a09g057-cpg.h in DT binding patch
> - Updated commit message

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/renesas,r9a09g057-cpg.h>,
> +      - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
> +        a module number.  The module number is calculated as the CLKON r=
egister
> +        offset index multiplied by 16, plus the actual bit in the regist=
er
> +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, the
> +        calculation is (1 * 16 + 3) =3D 19.

Using hexadecimal for the final number may be more readable,
also in the DTS?

(1 * 16 + 3) =3D 0x13?

> +    const: 2
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the reset number. The rese=
t number
> +      is calculated as the reset register offset index multiplied by 16,=
 plus the
> +      actual bit in the register used to reset the specific IP block. Fo=
r example,
> +      for SYS_0_PRESETN, the calculation is (3 * 16 + 0) =3D 48.

(3 * 16 + 0) =3D 0x30?

> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__

__DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__

[...]

> +#endif /* __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ */

__DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__

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

