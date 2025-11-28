Return-Path: <linux-renesas-soc+bounces-25323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D05CFC9206B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 13:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C062B3AD24F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 12:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA80032B98F;
	Fri, 28 Nov 2025 12:53:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB72DF141
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334428; cv=none; b=vC12t3kjAsD2YctcEB370BsO2E5rgKO+KVci734HoQ6y1u7FdXNo/g1rjEG+CR3Lp2GNaHYUy3ESofeZphlKpn9Jk6UTQxKXmJxHckjGzzSQliee5P1MJkRVwuXNaL16vbe2CQcf3S/nZxyLWJH/jaU9jaB/JZ8wyV3duNZup+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334428; c=relaxed/simple;
	bh=UPOcep9n81xsv668vSa9PNoqgPqmlBy5Zw/nNjOG7e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQozKyfCTI6nO0mFOkKG9hqR5ceDJIywIj6diPaWTBA7nXwIXdVOx5vz0E3bnmM7IIxWMHgzo/yxi1OPl0CRntBpgmjHEngzEOIyko46gqFJCapZ1Ozlx8krK3H9klm/umhASBO+Fy1tofjGyosPUplerW5vbinUWxcwBV/vHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9372164d768so1794262241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 04:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764334425; x=1764939225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDseQkJisg4CVIxAT/T+T8CEfU/6CIXfQEhtmLfidg4=;
        b=C8A/KWgOQfQfB8KymkrWjCeZ3jxO7m5nSEp83YTcKH2GPDcbqpS9ASppqdu8XOBb/L
         F8gAaR812puAFvqlAptb/6hVFKQxxtbitK3gnrsCkYf1j/hwRsBK8CPA5KWwIRMV9qY5
         jkrlUWacKLr3Wnf00WIFJi5vObDPFk8fUvUkB+Ry/J2fjFJZATClu2F8hFdq0QBBIGcW
         Jl1NLKVjRvNCxF73kwH+BsQY08W8wT/XGrbwpIBN9cbyXT3uwJgoh+kPNvY+wpEIyNEo
         cvEVjcQUAdeHjkSGiujhn/0FR88Lw5xO6NyWWrvyl6dmFRcO2u+ToRiNgPP5OuTosCnB
         HB/g==
X-Forwarded-Encrypted: i=1; AJvYcCWQyf6tuZYG2567wuJ3cj/shGbiaUgQg+I1uT9Vdt0R01c0mPW89sp2cyhIB1gBsVe0uHRmaysP/I/mrderOg/Ozg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5f/Q13k1HidyHOL9oL9NwUTd2L2QwXq51JfAHWoN1yBgVTr3A
	fLNp+Sycbme7C7PpNB4G5WCEtrQddVnSEoASbSp1qJr5NnpX4GiERiD9UBdyDpjo
X-Gm-Gg: ASbGncsKbM/qJPk0eF6Db4wagFkmzVdWCIlZ7u/0cM//La3H+WUOqFP8XqDDksF4uFs
	tlfVjL9qHX+2Bm/oN0b6tlUHIY0tfmRDW/rB3sytnYlmai2a5eDuswSVU/TPy4FtjxPbetWgitu
	RJ5Of6110S0skc5C3yZJVkSoxrj4VaaAIOF1gxqa50Kd1d5Y+HOqApuZF0HOzEz0blJbnQp3VaJ
	SKI8WEFT/GdpSN+7/oAxrYvJsVoa74oESMEzr3ZVB+15CZ0FCGh0rRYa238aacStKC9r6aoSgpo
	Y5Up5AoEPy/MaY1So9tVTEVyRdLdX2gPGfpBL62yEfvGbUYYHE7DqHkQ+qUi2u77vqGo4ftR/1+
	Kx1ZDG3UFj3bODJSOFu3/1QXgl4E7I1GwRdi/MXYfNBWEmaugYrJu5Ts9irNjooEzUk8tZ5o9zO
	+Iqb9XxEPvYKnaBIn2i+ALV88hqSa07XONIw0G3XT7rsafRjQ+
X-Google-Smtp-Source: AGHT+IHLF2TRjrvDhku1xAxHsVolpgHM6eWrmQMvYHOx/K+IXmLDh8ph95zraypJlfVRmOgjaEPD5w==
X-Received: by 2002:a05:6102:2c85:b0:5df:d4c5:15ee with SMTP id ada2fe7eead31-5e1c3c1b875mr12988587137.9.1764334424850;
        Fri, 28 Nov 2025 04:53:44 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd768450csm1808240241.14.2025.11.28.04.53.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:53:43 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso1463029137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 04:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr+wIaFgMavWKYT44qcsI1/snIkWrppXp12LjnVyiP2Pp8Lb4taC/6C7jdnu2tDdUZ8bOG+HOkqMY99VPgCwXY8w==@vger.kernel.org
X-Received: by 2002:a05:6102:6444:b0:5d5:f6ae:3903 with SMTP id
 ada2fe7eead31-5e1c41bae5fmr14290159137.20.1764334422864; Fri, 28 Nov 2025
 04:53:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com> <20251125150632.299890-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251125150632.299890-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 13:53:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaqnCmHBk+Zxo23KU7e+GuH022nDgpR59dH6K8Ei9O4Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmgULqFLeFRcycOL4pCRTkS5R6pidDFCRXPqROfRT1ZMmUGtqRK8msYPEk
Message-ID: <CAMuHMdVaqnCmHBk+Zxo23KU7e+GuH022nDgpR59dH6K8Ei9O4Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 25 Nov 2025 at 16:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped separate compatible for non-FIFO mode and instead using single
>    compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
>    by software configuration.
>  * Renamed clock-names bus->pclk
>  * Rearranged clock-names tclk{4, 16, 64}
>  * Retained the tag as the changes are trivial.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml

> @@ -62,6 +82,46 @@ required:
>    - clock-names
>    - power-domains
>
> +allOf:
> +  - $ref: serial.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-rsci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 3
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-rsci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 6
> +
> +        clock-names:
> +          minItems: 5
> +          maxItems: 6
> +
> +      required:
> +        - resets
> +        - reset-names
> +    else:
> +      properties:
> +        resets: false

While technically correct, please move the contents of the "else" branch
to the "if ... renesas,r9a09g077-rsci" above, to increase uniformity.

Also, RZ/G3E RSCI has two more interrupts: AED (active edge detection)
and BFD (bus collision detection).  Sorry for missing that before.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

