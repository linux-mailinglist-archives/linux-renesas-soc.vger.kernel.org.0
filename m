Return-Path: <linux-renesas-soc+bounces-22304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B908DB98B39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 09:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2769E7A20D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 07:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107E5280308;
	Wed, 24 Sep 2025 07:51:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03E2877E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758700295; cv=none; b=nKUXZVVFK1sKIflHNFO0S2N+TgQcyK2qOKdizY+xK2LAaHvaikPyV37jt3KEZ0Rm9EYQb7dpXb6Hvn9Qg2eJWHTgPzfGIb7pvLvRJtaxwJJeTgyiRYiKP6Sz/jLL/izVKpGqtcayQLYlwCMEYQUnorU8PAC7488d5WsihXGJSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758700295; c=relaxed/simple;
	bh=aWLfvJIhJGUp5ivux4F05IzZUz29wUscuHa27oPNgME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhGobhI4GHVT71PCoVgr4iDd7iyJv18f1DWs7ceYKWXMQMVIkplm0eS1wUnMAfWW4bnR7xEZKVgAbF0w8AQnvVqnYtKkuU4HhOoZ3jQgWAckmroMKOCy1Nm6jeNGLfa7G+M3qSqfHcNAJcHkQURvGcP8exITnalUDgt+0MbGrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90dd3b43f8eso621480241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700292; x=1759305092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh+Khf6unZqbzxNHEU+Ts8bq4BIxlEWA7Rzthe6aDww=;
        b=FwFnUAMibE5TAoenyGCMV9bp8gLoVhDd5+KhwblPWarO778AveCqCytNQlsTXkIjTX
         Em+3kaVo/Ip0tFy4ZDloCOUj26BvPkHjYzl/TBcKF1Ua0L9o9hz7dHnCBE4clmY9qoLu
         rIGrs2tqj4iHEac++zle+MsDNY8YxApkT2sSj2LkOazZh1+IMa9kk0oO29XiGQCdWPOt
         AzAm26qzgCwNUlp92k6zAlGv3pOdVa+Le7dCWOYSUxoTdwqCvGIp5PLt5uO7soacI2Ar
         b2rLNXx+Y7pnfiqPAcQjRAf6hAC4SHz08ZW+AXMmIgbSoXo6ltRUgAwPsyC01s9hHmra
         Yh4w==
X-Forwarded-Encrypted: i=1; AJvYcCVrV8kJGJwTPshy+EaXz8KWAxzgGbIZD3ny6GkiTg3YedCX5W8LTv6OGwr00om9JYCTi00s2S0bj6AOlzd3uXmWcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+lAjohUP8X2SXOAq4AidDDUA7VsICa/txo8SL5Xv1PnFXsBj
	IxZBmq6Lv/fUjct8xq9IY8iV3697KHNmhM9oIc0yUhqiODjrUZdCMYwsGUsPu72X
X-Gm-Gg: ASbGncsoe6NXm3la2Bc/nqkOkgo0V9Lr3BZ3pJJ94GjXh/vcCV9PoaFkbYJJCvTpIo9
	FGmuX7HJLI5DSngOXowF0+F9h4plCztVU7RjJ2MvxEUhMFwhJkCZ/dOryTiMTqqD15xJrk3/Z07
	6kXWu09rrPQ9VPJZfqB/E45E1QZoNu1DCgxaUDq9+9ssQssSI2i0tHBt25C7nsNZ6z4DajHFdSW
	QLpykhLEJ+pUV9mwyh0OOe/Jd/8kxigZLI2frbI50/SYUAM3NXQbY//Z81Ku9RbctwmOjvcbzyF
	WsakSgvHk1oQS9O7weGKI4AvKtI1sqUige1iFgxKUf/wzkgooOcYcLdsXYIYBr5i63Hw5fnhM4N
	R6PqpbEjnA0xmMUbIMYJCuHQSUTuQetx8pcx5VvG8uHJCmkBM3UA9eWeWNI4sUAx79kiImvw=
X-Google-Smtp-Source: AGHT+IHWrtWebxGDs2I3eYBoq8V+uet/FBO94327WsZFZC/iEWITxW0GgaFH5k2UZ3P+jsxaa/fV9g==
X-Received: by 2002:a67:e70f:0:b0:586:a135:746e with SMTP id ada2fe7eead31-5a579d1d767mr1936967137.28.1758700291926;
        Wed, 24 Sep 2025 00:51:31 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e75254casm2792368241.11.2025.09.24.00.51.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 00:51:30 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-583a520bd81so2153308137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp50Xe9NTJKtKeh8EcXagNz4ZyBl953lmORUgDM9K7PJYr7I6kaPxQso5My68pb5LeWsJGNWJOFG1ijH+4VhsSdw==@vger.kernel.org
X-Received: by 2002:a05:6102:6884:b0:569:93c9:b572 with SMTP id
 ada2fe7eead31-5a57695d27dmr1659602137.9.1758700290135; Wed, 24 Sep 2025
 00:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923160524.1096720-1-cosmin-gabriel.tanislav.xa@renesas.com> <20250923160524.1096720-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923160524.1096720-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 09:51:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEDJZ6wdGZs_CDs=jLPV1u382o6=cZ1HfKQOffGf7jGw@mail.gmail.com>
X-Gm-Features: AS18NWCUnOtI9sni6QIPbp0MqkmfhYYAKBnwNUuJbeyYXQXVL2FCMeoJiSjFxRk
Message-ID: <CAMuHMdVEDJZ6wdGZs_CDs=jLPV1u382o6=cZ1HfKQOffGf7jGw@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 23 Sept 2025 at 18:06, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Document the A/D 12-Bit successive approximation converters found in the
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H / RZ/N2H ADC12
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> +
> +description: |
> +  A/D Converter block is a successive approximation analog-to-digital converter
> +  with a 12-bit accuracy. Up to 15 analog input channels can be selected.

The documentation for several registers talks about bitmasks for ch0-ch15,
so the actual hardware block supports up to 16 channels.

> +  Conversions can be performed in single or continuous mode. Result of the ADC
> +  is stored in a 16-bit data register corresponding to each channel.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a09g077-adc # RZ/T2H
> +      - renesas,r9a09g087-adc # RZ/N2H
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: A/D scan end interrupt
> +      - description: A/D scan end interrupt for Group B
> +      - description: A/D scan end interrupt for Group C
> +      - description: Window A compare match
> +      - description: Window B compare match
> +      - description: Compare match
> +      - description: Compare mismatch
> +
> +  interrupt-names:
> +    items:
> +      - const: adi
> +      - const: gbadi
> +      - const: gcadi
> +      - const: cmpai
> +      - const: cmpbi
> +      - const: wcmpm
> +      - const: wcmpum
> +
> +  clocks:
> +    items:
> +      - description: converter clock

Converter

> +      - description: peripheral clock

Peripheral

> +
> +  clock-names:
> +    items:
> +      - const: adclk
> +      - const: pclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,max-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Maximum number of channels supported by the ADC.
> +      RZ/T2H has two ADCs with 4 channels and one with 6 channels.
> +      RZ/N2H has two ADCs with 4 channels and one with 15 channels.

According to the documentation, both SoCs have three instances?

I agree with Connor that this should be dropped: the same information
is available from the channel@N subnodes, and future SoCs could have
gaps in the numbering.

FTR, from a quick glance, it looks like this module is very similar
to the ADC on RZ/A2M, so I hope we can reuse the driver for that SoC.

> +patternProperties:
> +  "^channel@[0-9a-e]$":

0-9a-f

> +    $ref: adc.yaml
> +    type: object
> +    description: The external channels which are connected to the ADC.
> +
> +    properties:
> +      reg:
> +        description: The channel number.
> +        maximum: 14

15
But I don't think it is needed, as the dtc check for non-matching unit
addresses and reg properties should already enforce this.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-adc
> +    then:
> +      properties:
> +        renesas,max-channels:
> +          enum: [4, 6]
> +
> +      patternProperties:
> +        "^channel@[6-9a-e]$": false

6-9a-f

> +        "^channel@[0-5]$":
> +          properties:
> +            reg:
> +              maximum: 5

Not needed as per above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

