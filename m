Return-Path: <linux-renesas-soc+bounces-16120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC25A91E48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 15:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D545C19E4840
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 13:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D7324CED7;
	Thu, 17 Apr 2025 13:41:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C19024C096;
	Thu, 17 Apr 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897295; cv=none; b=OkRcLfFv853sDMLBNH206RhZKWHcaoBiqmjLl6adAkhWC1IsUt+jkCc8BNegcH6WQovyRghvNaVScl85w+eYaaLY7VnNUqdDnX6LplhCteeP1Efx9u8EixFY5A5TJNapGH0M7uLh5D6Bm0TUxxJ3APyQJDe3ORkb9B0LtSkPyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897295; c=relaxed/simple;
	bh=Eni2uQ1QUtIxJVKCl7zv1dn47Ml3VtbcK6525VGkFzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjbYRSj7IrXKqwrwSW+U/4Wb0y98Nv3ZYZ8LsS0ELTl2cBZzCKw/8dEJhK14EAw/0k5by+fnDHuR+frTf/if96gC+ZztwtN0on4H/cECpVFDmcxR80t4KDSfGAtlLM+Vx9tH92b3FUk9ogPuWGhhTnpC+1EoCYivntVhIMigS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf0e07954so11815296d6.1;
        Thu, 17 Apr 2025 06:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897290; x=1745502090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89yvXZcAA4UpJdbQP9LuA0mSQ0pNAEq8BrQ6+A2U/Q=;
        b=mLkYMtdMtfetfHdiy6/kwj8b9cfPj+UCQ2t1OFpsVoJMHFLgnfgd72rqEoeQlPw9k/
         oF3qksC+vh4m9BmmVPlkMMvETKDKEDJySz6bbIOCLDuD3hBeejbaijOSIIxAg8C7mERu
         jVTAyN27BCuEdVwAKWOHZnZsF+mAX0vFqiHSVpph2Dmr/qkpQbUWVstb4xTpKq/anwBO
         tGy7QcJ1By1H7WV8Hm++De93GeihSmz/eiicFTcLa0hxXLzP0WYuWafJhkY54fXT4EBc
         8iAZOmiOscLuUzhdFZlqy5ZGjscaZ6G8L0ViSY/vICcaFQpO7yaxVfJC4fKdnr3UEEJu
         3Hqw==
X-Forwarded-Encrypted: i=1; AJvYcCUBMK0WaeUkGKuoKdLbCQsvTytDavgxK4h2nBEXVpxxn6Fuhp+buIkhUjQ5g2501kfaiCAvec02j4IojP8KUX7y3ck=@vger.kernel.org, AJvYcCWmVyOgGVH2THJupKUT9ZMA+VgiOoZIIAwDnHyLNPYbK/oAQjSrHmNdIaFwsLBfQ60TSLn1RIvl2NUx/S0/@vger.kernel.org, AJvYcCWsFvaNk+ZRp5iB7pAIYfw6hRWCNg6abMyZDkuj51j21vVZwW7i47AX2CsNGQWW2WbP6J3P+85+fDzy@vger.kernel.org, AJvYcCXvPzg1/lZj/qDz9hW7FLbw55rMyBcX/W0RlUio4h2alvJnA5iQ+GSdHLBYqxdJjEaJSZXXhaKsAV14@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Fulf4BueyQBa+DQ4W+a5enuPOLLU+wt+w81Rcr0aGQEqkE9J
	FiSQ4tcki3Gt+5HC3+gDXlME//4srDEGs9/ez51cbdeMgIVm9qBZR6LXZFJS
X-Gm-Gg: ASbGncs2FlWkz2+P0ayaXEyp6BYiZY/QCMOPRi5mfFKDIj2TJ83ci+USLd/YwWha7qP
	a7rViBIYUofbFKd5UbVFppYTCLfKG1HOpkWiOw8S4bvyYIfpcVnYzUsMKfUjTzPrQTryRxYTkN/
	6EKZTWtnulyyH9kR53yMAJPaf8hFfoNA6P5ezXPBSwl3LLyj/6bg2R60cg5NetRgJelMrQ5jT6T
	49gc2ZcnFmVrbs98knp4phgyg5XB/Avn71F0B/CDzCNqHeYxDhy6YotxBcr2BYvXseGP194ZfNu
	LYWTfhN62g9DTInXZKsqioGwGTY9GUXOyR9BtiMO2XGYAmOquEQMNRBjWqB8EkYeIp/C1LhIcXN
	uJedib0w=
X-Google-Smtp-Source: AGHT+IFlTZkE7nmPdGjjticqoOBSRa9Q+dT1RWI/LhhrmqoIc05bMlsYOWgRZ/1+qyOX7J003ofE1Q==
X-Received: by 2002:ad4:5dcb:0:b0:6e8:f470:2b0d with SMTP id 6a1803df08f44-6f2b2f5750bmr87863906d6.19.1744897290599;
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de9734e4sm126855426d6.39.2025.04.17.06.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5aecec8f3so119147185a.1;
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvsxyzrtd/EEvY1bWKNXJ8evbMIStcTx1pqrvQrA51wMgUGc7y5mhiLLfjdIravEWfWkEUcqzqoSDP@vger.kernel.org, AJvYcCWCIVuSaHBkmKzO1TVdKhBtp6XgbMooH3ZFfJWHa6Xs5tSwzdlXjUCVePNsFqT8yhPaQ6W1gKl8RKxHlOri5nuwu+Y=@vger.kernel.org, AJvYcCXOG5ljZaaXkZaghkS9jWEe/O7a2SVVzRYxoV+gWJci7hO618leNYT/35GI2At/gRHNQF6ktRorPZKK@vger.kernel.org, AJvYcCXSiOdOZNN1YuYqt9ZuOrGtne4OvxK4wvKVZLumDIoJpBsl50TKdmWb9cUwCJny0vdVwqjKdMVAfdOqgm/2@vger.kernel.org
X-Received: by 2002:a05:620a:1a92:b0:7c5:4adb:781b with SMTP id
 af79cd13be357-7c918fcec52mr962526785a.7.1744897290119; Thu, 17 Apr 2025
 06:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 15:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9p9uwMUR59F+_fJiSU0b5vJWr4hHJmc4geos=48TndQ@mail.gmail.com>
X-Gm-Features: ATxdqUG-OT1eml1q2F61Eo10MAgqcchO8vfALF9gYmY508UbfRhkgJcSX3QHkl0
Message-ID: <CAMuHMdV9p9uwMUR59F+_fJiSU0b5vJWr4hHJmc4geos=48TndQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 3 Apr 2025 at 23:29, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,9 +52,15 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: base address of register block 0
> +      - description: base address of register block 1
> +    description: base addresses of clock controller. Some controllers
> +      (like r9a09g077) use two blocks instead of a single one).

Non-matching closing parenthesis at the end of the line.

> @@ -111,6 +102,44 @@ required:
>    - '#clock-cells'
>    - '#power-domain-cells'
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-cpg-mssr
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          items:
> +            - const: extal

There are actually two external clock inputs:
  1. Crystal resonator between XTAL and EXTAL pins,
  2. Clock signal input to the EXTCLKIN pin.
Given they are mutually-exclusive, and the choice is made by an
external input signal (XTALSEL) which cannot be read from software,
I think it is fine to model this as a single "extal" input clock.

> +            - const: loco

LOCO is the Low-Speed On-Chip Oscillator, i.e. on-chip, and thus
not an external clock input.

> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            enum:
> +              - extal     # All
> +              - extalr    # Most R-Car Gen3 and RZ/G2
> +              - usb_extal # Most R-Car Gen2 and RZ/G1
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              enum:
> +                - renesas,r7s9210-cpg-mssr
> +    then:
> +      required:
> +        - '#reset-cells'
> +
>  additionalProperties: false
>
>  examples:

> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A09G077 CPG Core Clocks */
> +#define R9A09G077_CA55C0               0
> +#define R9A09G077_CA55C1               1
> +#define R9A09G077_CA55C2               2
> +#define R9A09G077_CA55C3               3
> +#define R9A09G077_SDHIHS               4
> +#define R9A09G077_CLK_PLL1_ETH_PHY     5
> +#define R9A09G077_CLK_OSC_ETH_PHY      6
> +#define R9A09G077_CLK_ETHPHY           7

I can't find these 3 clocks?

Table 7.2 "Specifications of Clock Generation Circuit (internal clock)"
Figure 7.1" Block diagram of clock generation circuit"

> +#define R9A09G077_PCLKAH               8
> +#define R9A09G077_PCLKAM               9
> +#define R9A09G077_PCLKAL               10
> +#define R9A09G077_CLK_SEL_ETH_PHY      11

I can't find this clock?

> +#define R9A09G077_DFI                  12
> +#define R9A09G077_PCLKH                        13
> +#define R9A09G077_PCLKM                        14
> +#define R9A09G077_PCLKL                        15
> +#define R9A09G077_PCLKGPTL             16
> +#define R9A09G077_PCLKSHOST            17
> +#define R9A09G077_PCLKRTC              18
> +#define R9A09G077_USB                  19
> +#define R9A09G077_SPI0                 20
> +#define R9A09G077_SPI1                 21
> +#define R9A09G077_SPI2                 22
> +#define R9A09G077_SPI3                 23

R9A09G077_XSPI[0-3]?

> +#define R9A09G077_ETCLKA               24
> +#define R9A09G077_ETCLKB               25
> +#define R9A09G077_ETCLKC               26
> +#define R9A09G077_ETCLKD               27
> +#define R9A09G077_ETCLKE               28
> +#define R9A09G077_ETHCLKE              29

I can't find this clock?

> +#define R9A09G077_ETHCLK_EXTAL         30
> +#define R9A09G077_ETH_REFCLK           31

There are four of these? R9A09G077_ETH[0-3]_REFCLK?

> +#define R9A09G077_LCDC_CLKA            32
> +#define R9A09G077_LCDC_CLKP            33

I can't find these 2 clocks?

> +#define R9A09G077_CA55                 34

R9A09G077_CA55S?

> +#define R9A09G077_LCDC_CLKD            35

Some clocks seem to be missing, but you can always add them later
(this file is an ABI, i.e. append-only).

> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

