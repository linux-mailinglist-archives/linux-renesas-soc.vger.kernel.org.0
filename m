Return-Path: <linux-renesas-soc+bounces-22791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1D6BC44DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC4A8350A3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAC62F60AD;
	Wed,  8 Oct 2025 10:26:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987B2F5A3D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759919162; cv=none; b=TxdmkshcbHpK2Tt3FB5RgiBIy2+sh+jM0BoJYuLhjjpKF/ai30ETT3Md+gHY4b12MfMb5Y4eq5Wnwbr78kyM75peQnOHI9LeTshIuZ+sAxd78s/atjcUC/nwbt37SRvjXHYq8QkxT+1XCwGPuCbR0/UdUajsNaeNEIojPl9FQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759919162; c=relaxed/simple;
	bh=OXSpHYjCFeAW1bnTUQJIYsMTnFikBWZCXE15rVM8+54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1ly1SDjNvjZjW1ORS1EOl+xymfIo/XcEDoVS6wodLK8ga2yaBSC39YsYqpoy0KpgdAOrBnvZAHoNYZCzxt4d0I7OXZaetlIOWTpvLViqfRtMTZOPyTq+RJ+8qnSu974D7KOp+YdDCkkk7AIPSXhPY5otkrQPCv88xb/j5YRDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54c0a10990fso2448320e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759919159; x=1760523959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P51hehgBHthh05rneSfzMskbp21c3potJuyyZ4GFVHY=;
        b=g+D7AU+5OD1T2CW8vtCstCy2wZ3fz71BE1lJZWY2oSHoajVEJt2/0d38u7P9SlEg/K
         fNLGl1VjPM/gFeZCkYTfiaiwPC/gC+SMjKjeed1o55MZehprrE2fxEDMS4Y6pGFUi54u
         3BZI6jBR6h4PIMl/00daCH8K//fHhbHH1AL7/t9DMjNHt6i1FctLAOCJ/iMrM7EG20ji
         LeEu9/69yKknUzSHTZebU9Zdd2BL+uNGBGjYmxy+FiXnINZcViesAJXz7EatB3ajqzD2
         FJZYuhhFbkUpiiS1hLUDWLwdKUhxdKJbeIv+arxblHBZYGDCTDmpExvUc71kZCwDCnr7
         i9hg==
X-Gm-Message-State: AOJu0YzW632Y54BLj0nB7SDgV9pDhMz3AbK9kLZ4RH/db824bsbt883x
	Ry1ApIQNLpYogt2iZOCEKOt5J+2/avjOFdvJ7P0u/2kxTmTU5Hy4HHkI9vZI9XpP
X-Gm-Gg: ASbGncuNm7QX15xEGuQVLyRFdWlJ5M4avOUhqMAxi/RWeIo7qWTCJPpW+xqXKK7ZMFB
	C/Gy60Ys5oZA++U8JWxT7bZXytZ2fYIvkuDd4Z6O0QjZdykb0vK9sZsUiOq66ZV0DrurFFQZyqd
	9uJc9sO2CoUwTCD3OEEhVwqUwlnyA5RCJeapGuzG1o9PwYaMZKLG4EuwSOmkCNY7Kn+lJIX4FuY
	X0Gf4IOGy6kwf686dr1mgM4NWC0CZxFFsgImeZrrbnI6LqwE7NixfeCcRu2sufHJHrBgJZzfPcJ
	S7b1tmgKnujyHyjgh5O82BJ45ICP859u35e0a6pQpQu+7hlQ9W/yBpWGu22LWWif5nJXEWh4sfZ
	0Z/CZDQede+5jk/0wot5UBKYP7j5byN+xhiTBjsAVYbcUhXfeyjQgYWiKUwYOJqXPsbHymoK94I
	zpX8TkdlukTsKg6dsV/cg=
X-Google-Smtp-Source: AGHT+IEJnZ0BK+OA3zA0fud8HxaMrBSZAYj43Es1hm7JhN9xAUGYOO9zXNYOln03wRwQWPA2N2gRxw==
X-Received: by 2002:a05:6122:2228:b0:54c:da0:f708 with SMTP id 71dfb90a1353d-554b8bb8c55mr855202e0c.9.1759919159270;
        Wed, 08 Oct 2025 03:25:59 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf65458sm4381789e0c.24.2025.10.08.03.25.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:25:58 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-930ae1c6d05so31559241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:25:57 -0700 (PDT)
X-Received: by 2002:a05:6102:fa0:b0:5d4:1e69:fda4 with SMTP id
 ada2fe7eead31-5d5e2375b8cmr814639137.21.1759919157025; Wed, 08 Oct 2025
 03:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:25:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP5nLSu4PDVO5LLFodgPvbYBZ9-Oyh6Ap101ukaGp4pg@mail.gmail.com>
X-Gm-Features: AS18NWDJs2ffomK6k-23MtOzRWpeHmLjXjjd7OOOXX1Fs-JbyrmQo7Z86oHzZmc
Message-ID: <CAMuHMdVP5nLSu4PDVO5LLFodgPvbYBZ9-Oyh6Ap101ukaGp4pg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: watchdog: factor out RZ/G2L watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/G2L watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +              - renesas,r9a07g054-wdt    # RZ/V2L
> +              - renesas,r9a08g045-wdt    # RZ/G3S
> +          - const: renesas,rzg2l-wdt
> +
> +      - items:
> +          - const: renesas,r9a09g011-wdt # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
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
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false

I am not a big fan of explicitly forbidding *-names in case
there is just one, if the first name still makes sense.

Regardless:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

