Return-Path: <linux-renesas-soc+bounces-24402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9239C46B23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D6CE347F6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF95630CD99;
	Mon, 10 Nov 2025 12:49:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753530E0E6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762778991; cv=none; b=G2WNIme5MZbw9qCjBHIMGuog7gLdE+fsp4ZdfBXl+BJdhs6qmb6+KX88E4OVzvTDkkA7hPSSeeR9b+2ZCrPtXBnKO/kFqJ0dmVYp/iAz1xXcFuOO+BA2elxVHVnINE/FbKIgl4fGAc8czSQxkyPv+0ihvJlR+XytBegLD9+n16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762778991; c=relaxed/simple;
	bh=cAw6KDVicFMiZpuDduunfg3+w/yg4gN+HRNZWYDOi/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCK+K5AAhyGkb9zaSyetAbHUxhS/eoePpXIxNDTATbqY1tlTWSVEazeSGZjXm9xVck2YgCltL6xAN1J4hB+UzDByXW08wGjTSJBXm/hhJSsbpt/OBxiWZNDbv8vbqbT8qZPEME3fNrJHDILABv+mxMHO6lKfq3aHB0RYBJZfi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55965c96fd7so729799e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778988; x=1763383788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh17CiieclZAsVeAhUA/WaKqsZ8PVmhh++ya3iPI2Ik=;
        b=aYFRK6qDESUGDEVskCRrAGTcaRNnEbKszcfCUzVFxBA8i1gqfv3eM3weJKY9j9ruMW
         ATGi3zrxlVHMQMUFCbUzdMTULYRGheZ22PFAYoqEuMl0d2ZYDM4KnUrhIHoLD5nTJo1V
         JgfEhPIhLljbBq7EbzfKyHR7WHyPU/DI75qAptoTgODwaRzIgxHavw1+5Y29V+0GWTxI
         AHm9SX0LPOJPZ8M5ScDaa3eFBv5oyZJx2g996R0NWosiSKROgarZXdMRiXw2D8DrhVYU
         Rq3ERy6E2J9jgiDXdigikYSERbpWStJ5sTo0ewcS/qemOePd6ovufjlajgJDY+hcqZZ/
         otgg==
X-Forwarded-Encrypted: i=1; AJvYcCVmd11gifoIK+9jh9MQC8j6RreU8QyHCQE9uBTjvmjOvocmKOdefD2L4LZRlw7f/GtIb8N3WoM2Vvc54zR8anZohQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVmKyoAfj5SV4Rt9/w5p1UevGjjSdtbAptC9IuxK3kRwFPw7YR
	zjzl5BrBeW5ZERctxsmDGXd3TKOQ7PMPVcPQRjaPnN75rUeqOALTGG9dn1UPRr6j
X-Gm-Gg: ASbGncvfCUn7GlbfgLGUiirb2lIW/MhVg05DxeJZaeXTFYuWF53od8yKTPXW3JFaXgf
	nudiD/UeB1QpxYAPI3fXdgXit1Nxw2kSntlmyAaEZ3LWfvW5jyGLYoK8oc+Qvay6GcqGXVsuzD5
	jM5rF0oDeKAxW2UjREx3cGvUnO4hMHD/V4Lc1xbn0WdgCMOjwePGNxtncXPDndUSIPg2nNwrHPi
	mQE6kIA6pK1G5OYY8e/U0Ms0h+CucUmsgmG7mv9iqF/yQLt/01er8i/Yo7fK3bAkLSShd0EGKo1
	98uzHU32kS6Ettjf0SS62EkIrYkst5evEJRVnzqoC4hHn2qqJV4zqHF1nUOdJHvq+z29lyPZ285
	ECWMOuWasw3G9Rpd3xNVno2CYimCL7xJuDk1XNq5Lu3ZmioMhYPzELS4fZ+LvZui1S2ic6VJ+Sl
	2LkAsyJXEcP7apv6HRRA0gJJVukG7Cp2tVL0s7cA==
X-Google-Smtp-Source: AGHT+IEg3ZqNxrTet65tHiU78QOIEshvh6jyVowQhPiVIa03x4N32VmYLKRhGZcrMVzk+3DCpzbBoA==
X-Received: by 2002:a05:6102:44c1:10b0:5dd:c529:5bbb with SMTP id ada2fe7eead31-5ddc5295dffmr1672776137.19.1762778988433;
        Mon, 10 Nov 2025 04:49:48 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda205c0efsm5686257137.13.2025.11.10.04.49.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:49:47 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93526e2842dso663445241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:49:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY/3lczDZ0SDIqadTos5KzItap1Y4AjbHIdHSV6j98HMKonzcOEfPJUWGTg2l2OHkjlCZXy7PNztckC+LAv5DWBw==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5db:f352:afbd with SMTP id
 ada2fe7eead31-5ddc467ebffmr2222725137.3.1762778986813; Mon, 10 Nov 2025
 04:49:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105104151.1489281-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251105104151.1489281-12-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251105104151.1489281-12-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 13:49:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTH_uuQURgqQrg1RGDMwzdDAWFk__mS9+Gc8mcESfUyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkfRzk8FN2qNNCBLlLG0XaTRUdRgwFG7IJoHivC4Q2Ld9wLwHCuz85ymR8
Message-ID: <CAMuHMdWTH_uuQURgqQrg1RGDMwzdDAWFk__mS9+Gc8mcESfUyA@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] dt-bindings: spi: renesas,rzv2h-rspi: document
 RZ/T2H and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 5 Nov 2025 at 11:44, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have four SPI
> peripherals.
>
> Compared to the previously supported RZ/V2H, these SoCs have a smaller
> FIFO, no resets, and only two clocks: PCLKSPIn and PCLK. PCLKSPIn,
> being the clock from which the SPI transfer clock is generated, is the
> equivalent of the TCLK from V2H.
>
> Document them, and use RZ/T2H as a fallback for RZ/N2H as the SPIs are
> entirely compatible.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> @@ -9,12 +9,15 @@ title: Renesas RZ/V2H(P) Renesas Serial Peripheral Interface (RSPI)
>  maintainers:
>    - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> -allOf:
> -  - $ref: spi-controller.yaml#
> -
>  properties:
>    compatible:
> -    const: renesas,r9a09g057-rspi # RZ/V2H(P)
> +    oneOf:
> +      - enum:
> +          - renesas,r9a09g057-rspi # RZ/V2H(P)
> +          - renesas,r9a09g077-rspi # RZ/T2H
> +      - items:
> +          - const: renesas,r9a09g087-rspi # RZ/N2H
> +          - const: renesas,r9a09g077-rspi # RZ/T2H
>
>    reg:
>      maxItems: 1
> @@ -36,13 +39,12 @@ properties:
>        - const: tx
>
>    clocks:
> +    minItems: 2
>      maxItems: 3
>
>    clock-names:
> -    items:
> -      - const: pclk
> -      - const: pclk_sfr
> -      - const: tclk
> +    minItems: 2
> +    maxItems: 3
>
>    resets:
>      maxItems: 2
> @@ -62,12 +64,55 @@ required:
>    - interrupt-names
>    - clocks
>    - clock-names
> -  - resets
> -  - reset-names
>    - power-domains
>    - '#address-cells'
>    - '#size-cells'
>
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-rspi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3

No need for maxItems here (already at 3 above).

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-rspi
> +              - renesas,r9a09g087-rspi

No need for renesas,r9a09g087-rspi, as it implies renesas,r9a09g077-rspi
is present, too.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2

No need for minItems.

> +          maxItems: 2

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

