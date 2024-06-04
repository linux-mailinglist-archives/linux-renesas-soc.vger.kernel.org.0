Return-Path: <linux-renesas-soc+bounces-5825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABB8FB7FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402B81C242DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC6C14658E;
	Tue,  4 Jun 2024 15:50:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705B946C;
	Tue,  4 Jun 2024 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516205; cv=none; b=fwyaWSBWkdb5AwCG1G5QwSu91j9h8kpzA6DLh4zaOHGWBncPkAcTzZgprA050/o1xvZenHELDD2kjBxcJqR0qCs2J/UYVf7RlJGdbGSXe7hs0EDzBguFJBzDtzyfHK9OjjeWl8qRElPIxRKJgmi40NguFMP7D9lIjXvRJMoUVOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516205; c=relaxed/simple;
	bh=H7+KBIj+XhYX0G3IfUFHqSGj8MwKV6m8R2fUal8uXJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvJzJCzyX95MSadzRp3grrJZR0bH4+JFdXmkb1eSB8Kg8JEsNQR6I/FgHdUZAqYYhd+iDS5p6rE1/Mu1EbxG8PQXj/4xoFG5jYY84SAssnjYut/iq8D6n2d5Cc7TEz726ekivz1nZ3CILpWfebTxuU8D6FpoyhVomlTt/JhucZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a145e0bb2so56137007b3.0;
        Tue, 04 Jun 2024 08:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516202; x=1718121002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdl8ZvZjrswfXtiaYupkzfGxYwNns5foQkdy/ZL8qPo=;
        b=wYmhmGyGGWLq/08/gzR88hN5vIX3yc0dZeh/7xQ7oYOByUsUX9kbmsj7g1Tlm+J1kz
         vnBKAnCGp4MrUCsuURXioZ7CUGF+ojcwaOuTgqG+SudP4f7fdOGwRm7zlprQGMgySfzf
         v6yIX1mfikQTe2k6VU7PM+WsFzE/r8qVJIdLKLOoh3an7jW5D98X36DWYUtGmb92Ve4A
         np/HLmnqYKxLHvquZfbBRtxVNxGeUzwcGi6I6CnhtRncQ59Q3wavSTZk9nMnbXiXg9Eq
         L51h/f9xkWVMLfj2hDv+2Yoxl72KDDi8twC/wu2k2MCrTQ6hHGuzxULQvp9kNbN0Wqhl
         b+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVCygffeyO6x3p7bO5RVtv/FQ0yXTR49d0SOWQO86YRfsAmpvfjoCMsEadSEFhawmUxdp31+T4ofz+on1ybetiVfuPfh0H7MVkpn7OAPh7N3+mwi6cy12ss3t87S5swtyouz7duASfkntWZAnu2yOdI+N5C/TY39DmZDzF+KTPAdrIunCDGtAJ30zbruYFGgd4TMookiuJvsauSlHZKUp0WdOxAFLC
X-Gm-Message-State: AOJu0YzWUWeE+kIHgU/2oUnDsw6q4V9nsrtQbYfMDkFhcnCQ4DLWIHKt
	WDIv9ASGRu7JazSrFvpI5WOs1ebUvnjol2qxjFjNCrvTYuOK62TZga7JF8+N
X-Google-Smtp-Source: AGHT+IFCgbSmnuaH8FTde07Q4cJUUU9SXFffH8ErkByzRf0oazsc+zwvRaDkMe4pQnOVTk0qG/CpxA==
X-Received: by 2002:a0d:c3c4:0:b0:61b:69f:4c24 with SMTP id 00721157ae682-62c796c3d61mr129326827b3.20.1717516201571;
        Tue, 04 Jun 2024 08:50:01 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766b42b3sm18788207b3.111.2024.06.04.08.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 08:50:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa72c9d426so4642166276.3;
        Tue, 04 Jun 2024 08:50:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL8XHXNeK2j1xUeCJRtS3mY7ARhyo6C99yw8V+WJUFhLvXt2dOIKj+bxMs8QcbElG5N/ASsZI/YvLWuP3zb2IwE5RAv3OV7Lv+ZNF3s/vAYJIN1TEnffG215iN0OYqciIdjYUCfR5AJ5Bnj59qu9T6Ep+HYy5sStym2L1hYXfQMh/nIHgRWxhwaLAzmSiiVtm9fYDPbOLQw1fzM9e6KFXUycfN1LPC
X-Received: by 2002:a25:c794:0:b0:df7:c087:579b with SMTP id
 3f1490d57ef6-dfa73ddb7famr12853703276.58.1717516200826; Tue, 04 Jun 2024
 08:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 17:49:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
Message-ID: <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com>
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

Thanks for your patch!

Please drop "driver" from the one-line summary.

On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings of the Renesas RZ/V2H(P) SoC

s/of/for/

> Clock Pulse Generator (CPG).
>
> CPG block handles the below operations:
> - Handles the generation and control of clock signals for the IP modules

Please drop "Handles the"

> - The generation and control of resets

Please drop "The".

> - Control over booting
> - Low power consumption and the power supply domains

Please drop "the".

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description: |
> +  On Renesas RZ/V2H(P) SoC's, the CPG (Clock Pulse Generator) handles th=
e generation

SoCs

> +  and control of clock signals for the IP modules, the generation and co=
ntrol of resets,
> +  and control over booting, low power consumption and the power supply d=
omains.

Please drop "the".

> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-cpg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Clock source to CPG can be either from external clock input (EXCLK=
) or
> +      crystal oscillator (XIN/XOUT).
> +    const: extal

According to Figure 4.4-1 ("CPG Functional Block Diagram"), there are 3
(RTC, audio, main).

> +
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/r9a09g057-cpg.h>,
> +      - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
> +        a module number, as defined in <dt-bindings/clock/r9a09g057-cpg.=
h>.
> +    const: 2

I understand this will be changed to 1, the clock number?

> +  '#power-domain-cells':
> +    description:
> +      SoC devices that are part of the CPG/Module Standby Mode Clock Dom=
ain and
> +      can be power-managed through Module Standby should refer to the CP=
G device
> +      node in their "power-domains" property, as documented by the gener=
ic PM
> +      Domain bindings in Documentation/devicetree/bindings/power/power-d=
omain.yaml.
> +      The power domain specifiers defined in <dt-bindings/clock/r9a09g05=
7-cpg.h> could
> +      be used to reference individual CPG power domains.

The latter suggests "const: 1".
But the example below uses zero, as does the code?

> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number, as defi=
ned in

reset number (or index).

> +      <dt-bindings/clock/r9a09g057-cpg.h>.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpg: clock-controller@10420000 {
> +            compatible =3D "renesas,r9a09g057-cpg";
> +            reg =3D <0x10420000 0x10000>;
> +            clocks =3D <&extal_clk>;
> +            clock-names =3D "extal";
> +            #clock-cells =3D <2>;
> +            #power-domain-cells =3D <0>;
> +            #reset-cells =3D <1>;
> +    };

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

