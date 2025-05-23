Return-Path: <linux-renesas-soc+bounces-17454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D8AC25E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B061BC0453
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA41293755;
	Fri, 23 May 2025 15:05:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F152145B27;
	Fri, 23 May 2025 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012715; cv=none; b=qMWKMOt8iGMvJizbrkiOLvvcmMulUGTEs+Wsj4DnvSl4RJpETqmNFmW1+GXCTn7qQ27fas4YOpqu8UaRzrSbFoUJ91EReJG19VbPUrZVJovPWtq1eIWiGzflO+ko8E92ON5LOBtxcb9xhufhbEo1Y05kQEaIWAbf+m1DibFX9kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012715; c=relaxed/simple;
	bh=IvZjz67TtM02MU3/MnsuVyjFE8j+g6IyR+ugdwoN3KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1JuygueEfM7DOAIIBVuLF2bHNgiDPEe98kr9JgE9jY2uMjlhtw0VtKm0PPIXxUCE5asZG96YBb2vq+11qyjEsb4M4eHVYmr7Z2iGJiNHOGqWKk5qf/1hqHujmF6wgUupZfXl4EldFE6/jSTtoF9FZCcwt3ItSumKnDJGu7Xtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87bf1348838so1754403241.2;
        Fri, 23 May 2025 08:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748012713; x=1748617513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7q5VOWPHTLyk2rAGQ6nFq+sdmA8F0+9sYOybYBqTFg=;
        b=OUzAWH2uYwf+9ikl9k+q8DuPD8aXNCIqJTajWTYXjBRmduQf/j+XjAx9DzewKAHFMm
         Kg1AoHCx4kng0kLRMn1mgU6vpIUI8csF7Pd5gZrusIJuByH/YQcgt76Igq1fPAwA1MY8
         ipo/ErX5oXNnmTK27rDzmLO0b2aEg5N0k+IDVKyjelA8Vygyzlq/mWnmjDDe0AU6Vrh1
         oROmcxyYTKEw2xfKtz159Mlmj8+LsFlAgA2wit2BT7FosZ8oyQKH6SjmOf+4IpGZThTg
         4HjaMN3qspdL/S4DzftESX971uhI4fEXvl8RaYsQXZhNq3on50jTi7degFFYw0tIfo+3
         QH+w==
X-Forwarded-Encrypted: i=1; AJvYcCUOV1j6dmx4txs5fXAOJVhC1+F9voa+YKW03VjNnFMt3PZ/Y5FjC1M+cVJ7VfodjRg5N4A5G44gxqUtTpHrWXnBrC4=@vger.kernel.org, AJvYcCV1UFkWpne6CyUkWeRL8P2iz6IDQZzB7ujqkMwnhlPtg0MK0FIm+txL0+osUT2GdHg+aHt3qbmXUs6FC5GX@vger.kernel.org, AJvYcCVSdFTRROZYdWOYgddoNOBOTWDzuqIHmaHtwveGzKxBbN4gB/RrK0F9pGDmCAThEmttY8yT+x17fStg@vger.kernel.org, AJvYcCW7sg1j46ZJR+CjTp96LklyCi/c0e4NmNJiyjC3n522aYT1I8QlM4XQI6yuhr3w/jLLBq/mBk2jSWGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw39HvHd1Onjav0cJyKUK77H+D8n3j5Mm2lS1GXAPZfy+zbRJZQ
	5gJLJz7cLup4vo6b/HaM5qlfGo38UWTWPPmqot/0YXpfbtfkUzYES8EHFnVeujWqViA=
X-Gm-Gg: ASbGnctjp3OdOIxWe2eyx3Pu/9SNmoRd9L7G0F2Tm703dzbRjlFAsbJZvNAT4BHuDCZ
	t8tYf+43vFt4BN+1V76kTbaIpUwmIEPm8RItKqfti+kfGPGI5R2uuNLM7ukN18KRerx63Dqd5PG
	LVdCmpBWrkJyZf2CWZa78SEhoo1JJyv01CDpxpEOsPUuP6r5MIGAoiDJZppsx+lTTdlVv66H4iI
	FXR1RBWC1Q8wDM8FZk+uKrz9kkzj+OrOM/PtC/z2pDaf34c+6f0dQYWuLjS5smPlp0ccckNyZgD
	c5k1vyc7VyChMIl9ZhWObGoRXEhAG7AEgM1SSiKDmO3jfeF4hp6SmpQasJd+HgDcJ/1KazB2sOe
	o6HGrlRCQ+t0P5g==
X-Google-Smtp-Source: AGHT+IGpTcQltr5JdidOWCx+aFZVnqU8+pIwt1rOvJNJGlxSQy2LIw9bd8arC40WmuYJzNqVVlUPHQ==
X-Received: by 2002:a05:6122:d19:b0:529:2644:8c with SMTP id 71dfb90a1353d-52dbcdfccb7mr23054062e0c.8.1748012712580;
        Fri, 23 May 2025 08:05:12 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52f19bb4c76sm2221857e0c.43.2025.05.23.08.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:05:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e2900db5f1so3319137.3;
        Fri, 23 May 2025 08:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4PQzaHN6hS+JeLbPQ7cC6h/b2VgZ6s2TxOF6++4767zj1AfPPffxEo+G4qYXKa1k9N7s+X/XNqqjZgnb2q1qibpM=@vger.kernel.org, AJvYcCWNVPjWL0Tnh1DYz7MFNo6LquFfw/aIwSveJInfM2Eew11Zpkm/sfMrfvrD9U+rmKhRvE7rMJBNMZknAJGP@vger.kernel.org, AJvYcCWS7cOPAbD0ojC38XjeY73zIuov0vjnoXhexj0Qs962+tW3R2rWBxDzyxwjad92enSrqTV0cf6zH0gr@vger.kernel.org, AJvYcCXRSRedHFSG4yMGgZtYRIrV1oQJOjDMiImGNaefp3ri6wHB1/O88pUeE2THM+k/ZhqOJXWhbjhA6aQR@vger.kernel.org
X-Received: by 2002:a05:6102:3f06:b0:4e2:bacd:9f02 with SMTP id
 ada2fe7eead31-4e2bacda0c0mr10649290137.16.1748012320563; Fri, 23 May 2025
 07:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 16:58:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
X-Gm-Features: AX0GCFt82q4LbUN8wOO1SOIRH6DyQiAH55lXfwgWzPo4hKmY_3p-dAhsTJpdcck
Message-ID: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
> the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
> D-PHY registers differ. Additionally, the number of resets for DSI on
> RZ/V2H(P) is two compared to three on the RZ/G2L.
>
> To accommodate these differences, a SoC-specific
> `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -14,16 +14,17 @@ description: |
>    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
>    up to four data lanes.
>
> -allOf:
> -  - $ref: /schemas/display/dsi-controller.yaml#
> -
>  properties:
>    compatible:
> -    items:
> +    oneOf:
>        - enum:
> -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> -      - const: renesas,rzg2l-mipi-dsi
> +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)

Nit: I would add the new entry after all the old entries, to preserve
sort order (by part number).

> +
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> +          - const: renesas,rzg2l-mipi-dsi
>
>    reg:
>      maxItems: 1

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

