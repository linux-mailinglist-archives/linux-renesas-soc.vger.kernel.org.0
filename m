Return-Path: <linux-renesas-soc+bounces-12994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A34A2EE7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9122D1613AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3977230984;
	Mon, 10 Feb 2025 13:39:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2335222FF37;
	Mon, 10 Feb 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194791; cv=none; b=Y78EbI54KsTnriSpSdoIgR5nHk7fMrnKJdIybrqsCL4+hdGqRUlsydo5Dq7L4Vaj+tN+6Yg4/0/ioRC6gBItVvIkhY5kYzLYfvfP4hQoTbF0hwe563Nk04pRe4ZioKLVVY6WyyZSjCJxkqwi+efbRpoIygyYNzAnAfsBVNF57Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194791; c=relaxed/simple;
	bh=bvgKcF/zsPsZW1pYAnIB1W+ArRQZobLALphZkahUOcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qyw9FtFKv23lr/0r+7tJW7MoNLNXZUB0Rh/Z1YVJMZX1sY6LBmx5dC03BLqFopXbTG+Y53LbDwCyjREiRpHpMYQr5OqgWONU+YMSNWsYzfZ5F1ZB9GpQD47jJbOgjRSXpSFjPEPROlHjwHuSy/4IDnSEZ7+4ccgaLkGh6wsd4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2726674e0c.3;
        Mon, 10 Feb 2025 05:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739194788; x=1739799588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cMEUxxIiVjhSag/1DMe0EfQjJIVo434JzDuK6UAnU8=;
        b=g+BlbQM7nsHAZdfAaTnt95ZHytLvUcPBkcVp86t7YKEL8TonkEEJuP3YB2T0zrK63E
         vXSRYy9snd4u6xxAucD8tTAaEdwqk0J+fLGledEx8mQkzK9SfYFoJZX+aT9ydxXlIFvv
         WyU6ZgXyLhNuNYFzGTWCfZaXHggTjtaiS8EFLSuq6UYyvY6/2c0VqTNyqZHAw0dWcNbA
         HZkXLPaI6WVXrLWEozfNIFdWUslesf4jNlHpjW1QiYA8L11VsYMdhdNfAIOZC8qynwxA
         oXO+TD1BFW4lwFCKzXP9fLMvM8y9hMfZ7V8RKxDExMuTqZXc5aYqzHc4WMVLorIQvXJE
         svFw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Lglj7zU7LMjpgEtfbacFVO1AWZdgmlLvjKeEQpgLzss5lWxnhxyPZeq1hJBd3HkzpzNTCkpGbWHyoSZAfnXiGOQ=@vger.kernel.org, AJvYcCUBy3VEVztXHOdedBaRP/CHAUmWAWLN58q40o+ud/VT4g8fMW4AZnqr/5yE3oluzIbsS9ByFibVbmgk@vger.kernel.org, AJvYcCUJwWG/qhek9OnGQQHunAOHYn/y3mtfBKb99vgqXN+JtKi0cF3yi8uocANtXEP/4smo3d/+Ug1DOwiZ@vger.kernel.org, AJvYcCVBJPifwm50rhqLbbIQfpQSIOLI2lKK52iUYdYQoXdGwFKPecRFcW6NSTL3BHwCTPm8UtfpA2o4hLAQxmcs@vger.kernel.org
X-Gm-Message-State: AOJu0YwCuEEqsPnziX5NxZGVg899mO6DMl0B7eAh6lYIeGK0jTmIIbJF
	bGru5nKfsQ9q9AcGyZEcs18FS9OsYyQE8KaLl2FPVCdkZB7v7tKzjbOD6CPD
X-Gm-Gg: ASbGncspaL+A0MD1wzq2WAcHsRkvDHn+xY5E3ap1p0SOatGJM8Qze+JYiV9tnFxma/W
	pMmY+XZpw4N3f9f9vk+wYSiONoZoFBPnAkaevJksny0dJFM9rAYYf8ZmoPBp9EXOFB7qF+P8kL8
	ybt0n9JN1e0bVnZEZfKh5QvCQAs97MR1luV44rOHsJmDgMoyrRJpfBXX1izIhr8axcEpC0x6zi7
	k9cnqQSzN0BdYXLOzDlhe9w3bzbBffh/YDBe3kr+2skhCmQEZlv4IK0thwBoMZgRyq1ohLnM6gV
	OkIxb/aHGzlgweug16xO8w8AV7//sDuL5t9TCGBWe+PIoDBH4wQJsw==
X-Google-Smtp-Source: AGHT+IGPtN83FakRFO5HUE7kQGUQ+JmavU4Q5MDms4m3T7gkh1q7lJuK+nlzEpznNZPZ2jfp8PUvOw==
X-Received: by 2002:a05:6122:c9d:b0:51e:9efb:a23a with SMTP id 71dfb90a1353d-51f2e105cbfmr8950592e0c.5.1739194787361;
        Mon, 10 Feb 2025 05:39:47 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52050a2c061sm81485e0c.32.2025.02.10.05.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:39:46 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbd3cff198so453576137.2;
        Mon, 10 Feb 2025 05:39:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5PAe8RouCNGEeY99ygw5C8pJ6BVmdUG/j3yHWaKZJrZ0EyK6PvOgy3FW7XaT0bc7gJJH3yF+zdftl3+hq@vger.kernel.org, AJvYcCWhEcy4rZQ++0zU0MpqIoXzpiQqx24IowxLYNe75/TmLeRt9gm16Aa/gwvZpBfx82BXvSt8fGx2kSdyvt+Vew6Paog=@vger.kernel.org, AJvYcCWhddMV/BI9Z8Z02o//vJWbPiR/X62Qz9Sro7oRo2npBN2IzYdjJX3u/T5rSMgzX84tBgFAGlbLoG6T@vger.kernel.org, AJvYcCWxZE7RAdq5rohSZqPnPr/vt7hY+7WZKk+t+FQqqXVitg0L35w6+fnMCV5AkazOaTpQ+/rZVQjFHxKR@vger.kernel.org
X-Received: by 2002:a05:6102:b14:b0:4af:f8b9:bea3 with SMTP id
 ada2fe7eead31-4ba85e5e938mr9199396137.15.1739194786481; Mon, 10 Feb 2025
 05:39:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-5-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-5-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 14:39:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU782OZcug9DJnnm6Yz3gTJfjaz3_wbRVUDg334dkVrJA@mail.gmail.com>
X-Gm-Features: AWEUYZmn9YNCQWAsUIaaP9A_bpMkZmF0h5OLfC9QOl_Iy3p8mjd3hchwtHUxn-o
Message-ID: <CAMuHMdU782OZcug9DJnnm6Yz3gTJfjaz3_wbRVUDg334dkVrJA@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: clock: Document cpg bindings for the
 Renesas RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) CPG (Clock Pulse Generator) binding.
> Add the header file for the resets and clocks definitions.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,rzt2h-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H(P) Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> +
> +description:
> +  On Renesas RZ/T2H SoCs, the CPG (Clock Pulse Generator) handles generation
> +  and control of clock signals for the IP modules, generation and control of resets,
> +  and control over booting, low power consumption and power supply domains.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g077-cpg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: EXTAL clock input
> +      - description: LOCO clock input
> +
> +  clock-names:
> +    items:
> +      - const: extal
> +      - const: loco
> +
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/renesas,r9a09g077-cpg.h>,
> +      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
> +        a module number, also defined <dt-bindings/clock/r9a09g077-cpg.h>,

As there is a set of 32-bit Module Stop Control Registers (albeit
inconveniently named A, B, C, and so on (including some gaps)),
the hardware documentation does provide you with a number space like
on R-Car.  Hence I think you're better off without defining module numbers
in the DT bindings header file.

> +    const: 2
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the reset number, as defined in
> +      <dt-bindings/clock/r9a09g077-cpg.h>.

Likewise for the Module Reset Control Registers and the reset numbers.

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
> +    clock-controller@10420000 {

That address can't be right ;-)

> +        compatible = "renesas,r9a09g077-cpg";
> +        reg = <0x10420000 0x10000>;
> +        clocks = <&extal>, <&loco>;
> +        clock-names = "extal", "loco";
> +        #clock-cells = <2>;
> +        #power-domain-cells = <0>;
> +        #reset-cells = <1>;
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

