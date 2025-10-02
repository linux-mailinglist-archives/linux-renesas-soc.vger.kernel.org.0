Return-Path: <linux-renesas-soc+bounces-22567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48433BB3A43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 12:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C990119C05CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 10:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B7A30ACEE;
	Thu,  2 Oct 2025 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY/9O9aF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0943D30B514
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401217; cv=none; b=SEQeQb98ZuFwdehjdmJ1oyAt/gi2+OuOG2XG2ZAI47P2p5e9gqzITT6fFwGZFCu7Ige4jvkXh/IkdUFHgPdGlgy7QxugyWmd5QuWWLx+uJrAU/1hY0OGZvlqZQKgjadH+i6yncYoEhBeFFNHex8N7Jp0d2YilMHNc+Emx0c5hJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401217; c=relaxed/simple;
	bh=iHz5DuFUuSRhhhMvqJmu2XdnOFnrd/+He8NnZr0fAEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kj0Fx2NwZabCm55Jm8KGD9cQBscQFoeDLeIhToI92em9GzceXarynZUKOX/MjibhvXlmKm9E17+zi8ZmSwNhn1Hc/Ei1FerVXt7bDdmN9+w7NxznHwlL3wX2aTG+oevYhebxP21brttgztnPzrrgtNsZSP6pAVxhBIJlRDtEzbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY/9O9aF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-414f48bd5a7so638447f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759401213; x=1760006013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBFQk+smj0luOQPvO8LJUySLK5ZYsAeSl494Q1YFpjQ=;
        b=LY/9O9aFFmfkat0QYgd9cM6oYZGJnl0L74XMp9JBDJvP1kuoon0Qxd1RvHcse60+wx
         WiNlu/i/Dme7Ma+xZiiWkWZImIK+EN4xPGUSykjKZbgI7+V92pG12Qmn/lYnIkyvdQ4j
         bHrMKrATIMPxtS+aJ7kKKD+QMnbgT/5qeuy0Fm2WfKPVje5vf1V1A1Vmnpqmydnx7zti
         lOPilocm5NHvv0wiCRQqFJRYhKolwu2IdhUWdWB/ehipui5b59w67tswDu5fckc9JSyY
         i8+CIo/b/JWl9x65c6wDsQkrLM2+2RejfPUXTdtn162pftGcnSPkMd3RaxA9UkLSa+8q
         +djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401213; x=1760006013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBFQk+smj0luOQPvO8LJUySLK5ZYsAeSl494Q1YFpjQ=;
        b=mSYi51G9aaXAqQ/74ZZrCWwIl/6QQ8oh3Oa5/yEpOjPAzqVSgLmrloSJOhJ+Np0Fzf
         7f2AIM5v+ES3H0jUs3iEcvC5gXLJqImKjFCoG5L86+1XZAWitRaoR2e11RIMv5+E2LzV
         R/pVKsgU81gvvqUKr98qnPIQ5NoT/lGWfHE/P0n39/AMwiNCv0I2/WXhYfX721NgTkeB
         K1jZpL0UdcqrDULm28XY5pVO6gJ2Bwuv4UE9qIxfRI71I5XjZ7RFnd8GkVALlqs5V5JR
         +QqsJSd0pjtFrkLmL60dVE6w0MFfM8iiZRV7OFEA7qHIdSTvALMVQoCuAL+UGJUQ6bNt
         aCPg==
X-Gm-Message-State: AOJu0Yza6S4QkrGCO3SKq4QsoVMxLAPKL1bfs54zdnb8xxl6wJiFYi7P
	RifVSyAwvPzmygP239xHvAC0LQqncSTyWYtQdUTpiU3MpyeZfQv9/HCJl/jnOFGxD5uCTBuzofZ
	idGDxbjw508zMS6PBlptz/kN1Lu6ZG6w=
X-Gm-Gg: ASbGncth4vXVUixVHq8e5k/eTIJEsn+12zJLQjJfgHRVyk1kCGrgVzLwUjYshEcAQYm
	QlKy5A/TCsK0t9PljehrpZ4bwBZLRPGXX5NsSKo/4+9oXcPgfJLKpwEj4tI2NUCFTVxjSLZ262F
	/EhKLAgQz3W67CboI1gTUGwvaAbCPSzI1xIdTP08qyjj/cKybI4yscevrA7gqrU2AfMVDiBEVCX
	za097GzVGMFUH0PNczo1vQD7KLAJQz7SXgXeU1W2/ACAi0R14H22fvVRZujelOp5oz/Onc45Lw=
X-Google-Smtp-Source: AGHT+IEgO+SNZ+oeRJMlwNL6de+h/EshFHSd5fTKNUIjP95JulowMk4ElQrLGV2GGoUIacRVcYCCL2vJDJNwiWdzG+U=
X-Received: by 2002:a05:6000:184e:b0:3ee:1118:df7d with SMTP id
 ffacd0b85a97d-425578192b4mr4578653f8f.47.1759401213120; Thu, 02 Oct 2025
 03:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com> <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Oct 2025 11:33:07 +0100
X-Gm-Features: AS18NWBWmT4dyEr42ezmAwsnmUR1Nru1ucjaPodumEJCIP0PRxOEk0DsyormBnY
Message-ID: <CA+V-a8tqOBz2i_7Nny488syuSXGBhe1japjX47hkN6_Ejge1ZQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the patch.

On Fri, Sep 26, 2025 at 12:22=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../watchdog/renesas,r9a09g057-wdt.yaml       | 113 ++++++++++++++++++
>  .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
>  2 files changed, 118 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9=
a09g057-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057=
-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wd=
t.yaml
> new file mode 100644
> index 000000000000..2450ac856783
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.ya=
ml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-wdt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clock-names
We could move this into the above required list as it is marked as
required for all the SoCs.

> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          maxItems: 1
> +        reg:
> +          minItems: 2
> +      required:
> +        - clock-names
> +        - power-domains
`power-domains` should be a required property for
`renesas,r9a09g057-wdt` case too. We can move this to the top level
required list as all the SoCs need it.

> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    wdt0: watchdog@11c00400 {

We can get rid of this label.

Rest LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar



> +            compatible =3D "renesas,r9a09g057-wdt";
> +            reg =3D <0x11c00400 0x400>;
> +            clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> +            clock-names =3D "pclk", "oscclk";
> +            resets =3D <&cpg 0x75>;
> +            power-domains =3D <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 2a15c012fd67..08ba128bf442 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -51,38 +51,14 @@ properties:
>                - renesas,r8a779h0-wdt     # R-Car V4M
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
>
> -      - items:
> -          - enum:
> -              - renesas,r9a09g047-wdt # RZ/G3E
> -              - renesas,r9a09g056-wdt # RZ/V2N
> -          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> -
> -      - enum:
> -          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> -          - renesas,r9a09g077-wdt    # RZ/T2H
> -
> -      - items:
> -          - const: renesas,r9a09g087-wdt # RZ/N2H
> -          - const: renesas,r9a09g077-wdt # RZ/T2H
> -
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    maxItems: 1
>
>    interrupts:
>      maxItems: 1
>
>    clocks:
> -    minItems: 1
> -    items:
> -      - description: Register access clock
> -      - description: Main clock
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: pclk
> -      - const: oscclk
> +    maxItems: 1
>
>    power-domains:
>      maxItems: 1
> @@ -96,76 +72,13 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - interrupts
> +  - power-domains
> +  - resets
>
>  allOf:
>    - $ref: watchdog.yaml#
>
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - renesas,r9a09g077-wdt
> -    then:
> -      required:
> -        - power-domains
> -        - resets
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -    then:
> -      properties:
> -        clocks:
> -          minItems: 2
> -        clock-names:
> -          minItems: 2
> -      required:
> -        - clock-names
> -    else:
> -      properties:
> -        clocks:
> -          maxItems: 1
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -              - renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        interrupts: false
> -        interrupt-names: false
> -    else:
> -      required:
> -        - interrupts
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        resets: false
> -        clock-names:
> -          maxItems: 1
> -        reg:
> -          minItems: 2
> -      required:
> -        - clock-names
> -        - power-domains
> -    else:
> -      properties:
> -        reg:
> -          maxItems: 1
> -
>  additionalProperties: false
>
>  examples:
> --
> 2.47.2
>
>

