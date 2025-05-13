Return-Path: <linux-renesas-soc+bounces-17035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A42AB50F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 12:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7401717B603
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8071D23A989;
	Tue, 13 May 2025 10:01:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92C229B0B;
	Tue, 13 May 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130470; cv=none; b=hOifkipNRjbSZlwx8uQhT/ch3pqHo6KoHTV2Xu3MVQUjgO8VD9i7E+R8cxmqY9c5w53vjNrYr1mqG/72wyJv5egmc1U1C8yyOpukdyhepeXBqWz0LtWtYuL6NXHZKc/jD+PbK7Llqp4CKwXxdLTPHkNVABLhmmi1fJbEWZXmyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130470; c=relaxed/simple;
	bh=RS7eTKG/lNWnv1TIeBtG3liO88Q5zN8tKix0Z2f9z0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXFDyKkyFB0DTXYiJCwknNAxplzj7bUw09BYTpkdvsIAIVgtkdBA/7mEJwS04vixRqDAQbfolxgh+gDo7w/shQGgo2Wl/LQfduTfgLMLPgk4vk9WXI6w/U+HLsUyWuBJ//uwXyn09iQkHRaT08QoQRStawb0lcEVEm2b34M6Ry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52c55db3743so1427007e0c.1;
        Tue, 13 May 2025 03:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130467; x=1747735267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqOVh1MXYdCvcBVGgmchEBV/0MzXezH278Pk9og/LkI=;
        b=sB65gYmSscYx4mn2CW+STK2XI8ujnKaVvlAebD+VWSYLewu6h0W8qZ0ghmzsXjeZJ8
         sZIE1e3kOUFhOHtGldXf2/XN0CW4W/u+zZYxp2NhWy7QUwRKs9dVPSGr0TWLBwl238Tr
         YMDwFBiQNQyrHcHqa3gpCng6TK87YoOuqd5OV0hOQ3K/q54UD2A3k8GqflPJr8OPlV4U
         6TqKzTc3/yjtaxB5ORqH+UOth4D5AvstNB1D1Mst3K7eTVkHMx7u5kTy8Gn89D1kVlCs
         agvXeOPKYIamxa+aMdF8M/yo6AWsXg6dDIyXPQ7iI7i+9W3EyYFYkG1btw2uNn5aoLpi
         pDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/tUjZgbv4tjaIwGmC0ci3t4oJWcJbtm20hNQnBrSO9N/XksiUO2ZhKLTWsjKBkhTe85MDMV+xKVDs@vger.kernel.org, AJvYcCVkCJ6FvOXaD02fqglXV4jiGuAP2egiXuHNN0mwB2WHmbmqtCbAxFXC4e4ECrTaSX44/AYuw5XpM0WV@vger.kernel.org, AJvYcCW4q2FlYk4fy9zplkXW4DWQkKpTJ9QVx1JavS5cFaHzKoIsS+8V13k3Ca4c8j+ovPtSs/KzO1fHdyGvsphB@vger.kernel.org, AJvYcCWv1/eUQ3rWtgRuwW77rft/Bix/C19VqFn5E9HJYd6I7S32e/uUE9moU6/IZYz0xmw7AFkvUhbE9ciP7OrVqrCgnQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qyQojeerzeAOcCMqSKYEyzf/gi4W3dYEuw2LrNyjPaYqdI9S
	y65FOozTfGLv3s9dq79R3ub1VQKdxoXJBvIuyvv2acL/z+p7tlmEooX5nrTj
X-Gm-Gg: ASbGncumw8ygTpANelaCWuyb4qQLdGXqzRUwnpntN85uQJFLbyc3PXzcuS4k1khWbyC
	aLHghFoL91bErY4YijFGxkb0X2zCrHUgOgnxQxt0eiIrGKLaxbJmm3pnJoP/3zc6N+l51JicWq1
	E9nr/FbBjx7JWq8AlcvVlr3/zWBpa8wLH5ljQGJdLIn0x96EuLSQFfZzNI/GRBfdyBwtFZQg65L
	rJsP6jfruKLqVPHqWCEDYZKsawmtK7Yf36+ZR2RqeMR2MokU7Vm7GM+FfufcxXrZNG+1MfJhAbf
	9PA1cMtQt7fh5tbIpjqxQ+RLIHn+wiPVMYmmxOnsNKkwojFaCPmbJHXqSIxEajFEM8XL0uT9lpw
	2sZty+1rB48nqBg==
X-Google-Smtp-Source: AGHT+IHkGYEsxJdOlLeK+h572ZTKE0uZtzpXcV4lwF/Q5TxRPX5G9n8AGn6XO+bijR43QrW/Oi0vxA==
X-Received: by 2002:a05:6122:549:b0:52a:ee1a:50c9 with SMTP id 71dfb90a1353d-52c53c8ce1dmr12072046e0c.6.1747130462341;
        Tue, 13 May 2025 03:01:02 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375af9fsm7176614e0c.23.2025.05.13.03.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:01:02 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ddb03095d3so2211004137.0;
        Tue, 13 May 2025 03:01:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa/ykq5WLrbhBmInDHfYs1Rb+qxL2/QrQM7Jcz4lV4lKQUxMcCy+WzI+rs51gQnXmeSjdFKi/vNVZG2Snt@vger.kernel.org, AJvYcCUhtG6E6uPolKo4qRCeQ2DzO2Sh2kPyLH/wX9MzOo4SJILsPwERLc4UZ5sMEdeb0h2S79wDOFBjrnI61e1xHNpWFUo=@vger.kernel.org, AJvYcCVWF2hfkcPwFpMqxWKD4y8V5jsvpFITXr793w6I378mVdNvJilMYoGNxOmzQ/Lp6aDQGVRqVQXhItNL@vger.kernel.org, AJvYcCXt8BMDL67+lk76kUeS93L+lRqWbYdnJcdZmRrTgrF+R0kVqmOLUnh98aPhHyYrw7h1RZ32R7Vc5s2D@vger.kernel.org
X-Received: by 2002:a05:6102:4a8c:b0:4dd:b75f:2e82 with SMTP id
 ada2fe7eead31-4deed37841cmr12993084137.15.1747130461083; Tue, 13 May 2025
 03:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 12:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxBE+StNFBLmfjO9f3KGkouNDPMx5vYA8m8-Z1dPvyZg@mail.gmail.com>
X-Gm-Features: AX0GCFsbmfft1qmpDqFatnX0WKsuN6Cu2J3Q0vdW8CYUT38rfV65Kz4tYsVdSfw
Message-ID: <CAMuHMdXxBE+StNFBLmfjO9f3KGkouNDPMx5vYA8m8-Z1dPvyZg@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>   - extra parenthesis
>   - added loco
>   - renesas-cpg-mssr.h: removed unused clocks, added a macro for mstp

Thanks for the update!

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
> +      (like r9a09g077) use two blocks instead of a single one.
>
>    clocks:
>      minItems: 1
> @@ -63,11 +69,6 @@ properties:
>    clock-names:
>      minItems: 1
>      maxItems: 2
> -    items:
> -      enum:
> -        - extal     # All
> -        - extalr    # Most R-Car Gen3 and RZ/G2
> -        - usb_extal # Most R-Car Gen2 and RZ/G1

Please keep this list here, as the single RZ/T2H input clock is
just a subset.

>
>    '#clock-cells':
>      description: |
> @@ -92,16 +93,6 @@ properties:
>        the datasheet.
>      const: 1
>
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        items:
> -          enum:
> -            - renesas,r7s9210-cpg-mssr
> -then:
> -  required:
> -    - '#reset-cells'
>
>  required:
>    - compatible
> @@ -111,6 +102,41 @@ required:
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
> +        clock-names:
> +          items:
> +            - const: extal
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
> diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> new file mode 100644
> index 000000000000..d5b16d08e75d
> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> @@ -0,0 +1,48 @@
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
> +#define R9A09G077_CLK_CA55C0           0
> +#define R9A09G077_CLK_CA55C1           1
> +#define R9A09G077_CLK_CA55C2           2
> +#define R9A09G077_CLK_CA55C3           3
> +#define R9A09G077_CLK_CA55S            4
> +#define R9A09G077_CLK_CR52_CPU0                5
> +#define R9A09G077_CLK_CR52_CPU1                6
> +#define R9A09G077_CLK_BSC              7
> +#define R9A09G077_CLK_CKIO             R9A09G077_CLK_BSC

I would drop R9A09G077_CLK_BSC and only keep R9A09G077_CLK_CKIO,
as the documentation only lists consumers for the latter.

> +#define R9A09G077_CLK_PCLKAH           8
> +#define R9A09G077_CLK_PCLKAM           9
> +#define R9A09G077_CLK_PCLKAL           10
> +#define R9A09G077_CLK_PCLKGPTL         11
> +#define R9A09G077_CLK_PCLKH            12
> +#define R9A09G077_CLK_PCLKM            13
> +
> +
> +#define R9A09G077_MSTPCRA      0
> +#define R9A09G077_MSTPCRB      1
> +#define R9A09G077_MSTPCRC      2
> +#define R9A09G077_MSTPCRD      3
> +#define R9A09G077_MSTPCRE      4
> +#define R9A09G077_MSTPCRG      7

6...

> +#define R9A09G077_MSTPCRI      8
> +#define R9A09G077_MSTPCRJ      9
> +#define R9A09G077_MSTPCRK      10
> +#define R9A09G077_MSTPCRL      11
> +#define R9A09G077_MSTPCRM      12
> +#define R9A09G077_MSTPCRN      13
> +
> +#define R9A09G077_MSTP(mstp, idx) (100*(mstp)+(idx))
> +
> +/* R9A09G077 CPG Module Clocks */
> +#define R9A09G077_PCLK_SCI0    R9A09G077_MSTP(R9A09G077_MSTPCRA, 8)

... but please drop all the R9A09G077_MSTP* definitions and module
clocks.  There is a very simple formula to convert from register and
bit numbers in the documentation to MSTP numbers, so the DTS can
just use these numbers.

> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
> +

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

