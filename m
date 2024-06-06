Return-Path: <linux-renesas-soc+bounces-5920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8208FE56D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 13:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EEE1C22291
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2AE19538A;
	Thu,  6 Jun 2024 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl+keaB8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78F3CF73;
	Thu,  6 Jun 2024 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673680; cv=none; b=tw8pON3X29K3Zqw083Qy2AszILdh7PTlieJ9E+JpeoSyON+7tsj3Ycjtwgjdz9dFN3VsXv4wjBKvr0wb0quk6cEodqIRQ+foIY0bKzyS7MBw11cCgZbIdBFoW5lqmbQtFxDW6wTf0h5kJDlkSljSgGLoTJWGLcJH8VF03kNXzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673680; c=relaxed/simple;
	bh=ji0O3bafr4zdbnu2gdsTOoeRTcjUtmPx7kAd6olwvOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJT+qklKRQxKi6WUJb4/7UIQ+QGZoYqYyJCm4Z198x/etjxPqZDBkRnIhjlR+nc8B8x8JvFqM6J4UQomjFZ9+n2XiMm16CkhMFjzuOaUbaAbQWqfj1cqS6tUivinLVvLD7XPgZOpIpgU+icn45PpNeyna8/9D6wwQR9815K+Ccg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl+keaB8; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4eb053d4ce6so293853e0c.1;
        Thu, 06 Jun 2024 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717673678; x=1718278478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR3wtEmu/0kWGkRRZIfJVa6Kg0da+ElPwHxtRViDIoc=;
        b=cl+keaB8dc21fr4pR4fkEKhj/7lZ2FffKYsNlRtGcKqVkVyziQ37IayVsVhpJW7Np8
         55Wlp8R+4aQoPLwuIILITITZiIG+pph3at7m6CLZXuFU6vadxHiuvD0EF+lT900OigqJ
         j1R9W6RvjHSGx7L7FiFWLmciIg4a31t3BiJ1nciBno7R+8U9xD0sjHvb3ZFKo87ZlIbN
         Rh2AXr1JD96VKQ54hLxeKLr7IEtWYS0zFI0UiBS2b0XLrOk62a8tgM8/zGLjsiKcPdSG
         goNJdvbYl/R8SSjfg59zVy1Sf4ZT+5epfRyqyieHznJrS6L46d7B2ZxX74yCD/FO9/EE
         EJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673678; x=1718278478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IR3wtEmu/0kWGkRRZIfJVa6Kg0da+ElPwHxtRViDIoc=;
        b=cL6Za1LPaKiVaFujDVHDsZwgoI0ENnt5r+lwru4m3xy98nq8kg6k5BuHRNYmVXpuCN
         upoTpQlGxW205/xqvz/oQUzaLNFcwg7kcTa79E/35bZpaOGDxCk13Fsp+mPbAdur2zXt
         ELzIHDI4XGPCK7m1+IpMeLP0VlGjBw5/+D72h84G1cITfV1j47JqMj6L8hxN0lOgQveH
         Lv+4eXX57EGNBeprWQkD69klchuufXYlbt/5fa4vNPkWgzZdzC570psDl6hTdNS/v7NW
         ccAdW1huEW0AvS/2TEbE4NOVJndWfPnMVl8Vx3nHH3AQboqVobeDjHPH4dgCTz9RLTcF
         HxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeHIHv9YBEwUShmvdVuE2TXUOKq3GMersVtkwteTZYWWmF8Jl9hs4MvMsxF8AYyh2O5+jm1z/HN6R9ZUOmWnX//818DKgeAnRaoLplPtvHjEjwrF62hiRcd7+PJ5VZd8ezKpd4F8DPPfyVkohQujRZtrD6wGHr2NQ76qg5YOkMjxn+23ntELI2jCJ4RHFgVhW0aG+8H921lETF8d4hqx053LxvDQLX
X-Gm-Message-State: AOJu0Yxh3rpw1jHTNC/97Yz+Lm45GhXeugxI8wa4j1QhFie0SjXF2YiU
	aHEipOvWOIk3GBdDMDNetTCD5/hCrj2NUyC3X75WwDgp3D+jeQDYLu+t6AqcYxaXqXGhoDdpp3v
	O3Iy2qUaRgknrS24mq6nAIAk0M4s=
X-Google-Smtp-Source: AGHT+IGXX7flWOLfX6OhUGVYsH8Bqm0m8ddy+ylq4RfpFyvRcOdVHaLB9wwOZ0UQUFeEkPvTC7fLucPK9mo2jdjovco=
X-Received: by 2002:a05:6122:2511:b0:4d4:21cc:5f4f with SMTP id
 71dfb90a1353d-4eb3a4df6b7mr6140080e0c.11.1717673677791; Thu, 06 Jun 2024
 04:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
In-Reply-To: <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 12:34:11 +0100
Message-ID: <CA+V-a8tVRJB0U-c4BNv-YxvW0ydcw2EqsRkBQvu_HscJvYuiRA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC
 CPG driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jun 4, 2024 at 4:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> Please drop "driver" from the one-line summary.
>
OK, I will drop it.

> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the device tree bindings of the Renesas RZ/V2H(P) SoC
>
> s/of/for/
>
OK.

> > Clock Pulse Generator (CPG).
> >
> > CPG block handles the below operations:
> > - Handles the generation and control of clock signals for the IP module=
s
>
> Please drop "Handles the"
>
OK.

> > - The generation and control of resets
>
> Please drop "The".
>
OK.

> > - Control over booting
> > - Low power consumption and the power supply domains
>
> Please drop "the".
>
OK.

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description: |
> > +  On Renesas RZ/V2H(P) SoC's, the CPG (Clock Pulse Generator) handles =
the generation
>
> SoCs
>
OK.

> > +  and control of clock signals for the IP modules, the generation and =
control of resets,
> > +  and control over booting, low power consumption and the power supply=
 domains.
>
> Please drop "the".
>
OK.

> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g057-cpg
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Clock source to CPG can be either from external clock input (EXC=
LK) or
> > +      crystal oscillator (XIN/XOUT).
> > +    const: extal
>
> According to Figure 4.4-1 ("CPG Functional Block Diagram"), there are 3
> (RTC, audio, main).
>
Agreed, I will add the below:
- QEXTAL
- RTXIN
- AUDIO_EXTAL
- AUDIO_CLKB
- AUDIO_CLKC

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
>
I'll keep this '2'. I will introduce core clocks (clocks which cannot
be controlled by  CLKON_m register) for example,
- SYS_0_PCLK
- CA55_0_CORE_CLK[x]
- IOTOP_0_SHCLK.

> > +  '#power-domain-cells':
> > +    description:
> > +      SoC devices that are part of the CPG/Module Standby Mode Clock D=
omain and
> > +      can be power-managed through Module Standby should refer to the =
CPG device
> > +      node in their "power-domains" property, as documented by the gen=
eric PM
> > +      Domain bindings in Documentation/devicetree/bindings/power/power=
-domain.yaml.
> > +      The power domain specifiers defined in <dt-bindings/clock/r9a09g=
057-cpg.h> could
> > +      be used to reference individual CPG power domains.
>
> The latter suggests "const: 1".
> But the example below uses zero, as does the code?
>
This should be '0' indeed.

> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number, as de=
fined in
>
> reset number (or index).
>
OK.

Cheers,
Prabhakar

