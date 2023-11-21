Return-Path: <linux-renesas-soc+bounces-17-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1767F26DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5921C21004
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F2438DC8;
	Tue, 21 Nov 2023 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D4BC8;
	Tue, 21 Nov 2023 00:00:59 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso7399909e87.2;
        Tue, 21 Nov 2023 00:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553657; x=1701158457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAC7Wk7jAcTzX3Z+cItdgjy2XcXK1YIDP0sQ/+WmnbI=;
        b=Am0V53ZajU3DfDYq06HQNkCrM3AGVGgNMYG9xpzbndrvBQilRTYJww5otVRybqEMm4
         clXZkz/J6tMj6X5t58QhPZGk+loyJ9pmPQKZt2Tq+8bAdHS0h2JXsz6O/ORwcHvVbn0W
         hPU/QtHZGGtnUGBLwOIlyjhd7Z6R2txZWC8RMv49QSh3UZQJXX9ZOBLBd9kjKkkGFnhp
         2xCYgBccNMlnz6B3rzbwqTyMYS7qBP9sQebtAbM71tYm8CqG3bvwDPwk025wN1R1pLk7
         G3NzDMJtgyw4eJE9umu7l6eGPXySbh1tidnTdoGQeG2aG7Sm/6MRzhWIqaHci2CgqZ2v
         LfRQ==
X-Gm-Message-State: AOJu0Yxj2Rqr/aQAJWP2mPpkGKK231wN8LJybHscF7XwPGx9vmQBaFqS
	KRZriNVsuA7WO8v/7OvvKvIfRCFMbKr+lnra
X-Google-Smtp-Source: AGHT+IEMKGgIaZuugrDMZDvV7GnJywK/Yx77z4jGc7Rwz9WNq4IzHq7tt5PQ58SgYfPSHkLLZyHueQ==
X-Received: by 2002:a05:6512:983:b0:508:225e:e79f with SMTP id w3-20020a056512098300b00508225ee79fmr6014656lft.22.1700553656648;
        Tue, 21 Nov 2023 00:00:56 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id p15-20020a05651212cf00b0050810b0da0fsm1430948lfg.33.2023.11.21.00.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:00:56 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso65573181fa.3;
        Tue, 21 Nov 2023 00:00:56 -0800 (PST)
X-Received: by 2002:a05:651c:205e:b0:2c5:1075:5ec9 with SMTP id
 t30-20020a05651c205e00b002c510755ec9mr6793793ljo.13.1700553656042; Tue, 21
 Nov 2023 00:00:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se> <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
In-Reply-To: <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:00:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkfyJ9f22joXpAW1Gwk+zE9cqx+hbFqeK7Xc7ZTW1Faw@mail.gmail.com>
Message-ID: <CAMuHMdUkfyJ9f22joXpAW1Gwk+zE9cqx+hbFqeK7Xc7ZTW1Faw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 8:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 20/11/2023 17:07, Niklas S=C3=B6derlund wrote:
> > Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> > device provides Ethernet network.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/renesas,ethertsn.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas Ethernet TSN End-station
> > +
> > +maintainers:
> > +  - Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > +
> > +description:
> > +  The RTSN device provides Ethernet network using a 10 Mbps, 100 Mbps,=
 or 1
> > +  Gbps full-duplex link via MII/GMII/RMII/RGMII. Depending on the conn=
ected PHY.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
>
> Drop items.
>
> I assume you have oneOf above because you predict this will grow with
> entries with fallbacks? If not, drop.
>
> > +          - enum:
> > +              - renesas,ethertsn-r8a779g0      # R-Car V4H

renesas,r8a779g0-ethertsn

R-Car S4 also has EtherTSN.
Is it identical, so it makes sense to add a renesas,rcar-gen4-ethertsn
fallback?

> > +  renesas,rx-internal-delay:
> > +    type: boolean
> > +    description:
> > +      Enable internal Rx clock delay, typically 1.8ns.
>
> Why this is bool, not delay in ns?
> Why this is property of a board (not SoC)?

Standard property is rx-internal-delay-ps.

> > +
> > +  renesas,tx-internal-delay:
> > +    type: boolean
> > +    description:
> > +      Enable internal Tx clock delay, typically 2.0ns.
>
> Same questions.

Standard property is tx-internal-delay-ps.

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

