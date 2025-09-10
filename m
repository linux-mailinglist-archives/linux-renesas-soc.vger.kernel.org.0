Return-Path: <linux-renesas-soc+bounces-21724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B502BB5191C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD057188C28C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0B323507C;
	Wed, 10 Sep 2025 14:19:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760DE1F3BAC;
	Wed, 10 Sep 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513945; cv=none; b=qvje0sJ7S9T4MHgsE8ltQQmQyPFK735ggDMlgXNezygeFf/oUZeAcor7TkfgeW/DOPZRiJRO+wXZUQnf6UWY81INZr5YlwkMV7dBUmE+2Lhp6+gSMiA8iMHOkqGgkZy5hQSCJ7Ps8eByGK4hR7KeTemY6Zh6kj167kb35nIWVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513945; c=relaxed/simple;
	bh=IEXO0ieIiVHuQ9yIVaCY0Rp/VRoxd2AGbEMnZGmT/hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueFR9+BP5YY5pCJBr2EJkwUdTadpGk2xS/MrbPWbEts27721VrJXS/vQH/pt63wj9Pn4brG5f9oUdxfAq6RXk71h6WNphFSRhBV2KTMQuiDvykBsFmvl1t5svSGiesLkjDxjdhq+zytUIqGjzat0p2+Qs9sYmK759QZkCOZbpMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-545df2bb95dso3107141e0c.0;
        Wed, 10 Sep 2025 07:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513942; x=1758118742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqARIgzNgRRqB4bGKr4xQDPB4kRwfIXG8r9cjQp0qlk=;
        b=lQSCWrzCidArdJUh8beMZJAZvHw+8f58rXoNPyRxkJwLqh/9Q9ThdtGj82ah5Fdpgl
         Jfq/swLBL6Hjybvn8XmKxgbnq9/lHmbtwVM4LGfHvnBtOjR5/ayIvK+C6ZqiYRAUE/gO
         it46xfNt/JJjZjimGZMppAK0ZehKKRurpyhj4KabWhZDuF77JA+q4J2lhXUmbtD5+Eik
         beNcQZG/eSj43KI3bi+kDND5sk5rpxQlDIbGixFlzD7Y0EN+HiIlgSzYH9AYP5Napd/O
         mhysyWJOrNSK+2fWeASU+h4TivkCV2gADEQuOTaDY+oIQnLX5TzaIA0onPXp5mfj052T
         FhZg==
X-Forwarded-Encrypted: i=1; AJvYcCUYD74Dh14zJEub3SLu05cKxdDOkivg/rZJbPMnlEYvYmfPjpZaAW6fqNMjsjzzbUM+H7Egdscddxrl@vger.kernel.org, AJvYcCWGI3ocIOLUM72YCSvbIlZSCkOyS0c1ZA3xO/qYPBBtl9h0+/Tbm/wXg2oO9pFiHmne/UnXf66to4c1bouv/GVrPdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+gonz8kWnHCwuIE84jQkwdFXnnkE+8XmRkSqWGuE8kSlukXY
	at5YYjGZA8YOE5a4BrdnsFgJyWmH0TpZbZVhgxLY5u44AHiDzASWUGJESSkSqF9U
X-Gm-Gg: ASbGncuEzjcEG0/jSlwtwlfk+ZD5KYtalT6AVNYt8KPUOI1gBFuNbJscLs4/Lo6+vlu
	5uzQub8NVMAir/8Qj8cGO0eUoggCq7XF49ccY+s5Ac0zr4k6MxUgPL3jwPDR5mZOYoxhmIcvyPr
	vUxGEsJGgPh6OUju/YpKFvNISfDfwS37Tr8HluzjqVTLQ25AoLKI0StiXhbuhNEYGR9p+sw92Hf
	6iVoRS21Kpmi9p34oIm9TPYK+mfNsTAH7vGEEGy/Uym/pChFn3O074PDzUqqnXuShGy02b4ueCw
	sMGlUEef8QEA3gsMiCzMPoCxuRhvzkeDLkjklPJ/fwA1vidUekeXEZEVR5UTW2X/Dg0/K85VKWd
	0ZeV+I7b3uzp9tuPlWYZ2JBNNDY08uhckEYBSrfXrk60xWM5EY4FpQzK0ZIwbRr98rAjBTzc=
X-Google-Smtp-Source: AGHT+IEh50pQuUs8x8FEe8gkapcAACjxseSHcHLKeBTZ944IZ8UvHUcmGY63z6ywhHLkHX6+0mBp2Q==
X-Received: by 2002:a05:6102:808f:b0:523:95bb:b63a with SMTP id ada2fe7eead31-53d1376b8demr4710972137.21.1757513942013;
        Wed, 10 Sep 2025 07:19:02 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af214ea0esm12098633137.16.2025.09.10.07.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:19:01 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52a80b778e7so2147782137.1;
        Wed, 10 Sep 2025 07:19:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVE6FMaEZ2TWh576A5MX5ieL20mslC/+i5DxKth1Eea0HnpwguWoRRwQ5grLj+vszZCa2FqZ1zAeDlSd/ELkpx+f5M=@vger.kernel.org, AJvYcCVRekiRBJVoxm9bzzQ6Z+qcXhKt4YIx9WG82P/jdqcRg0lkZJc5/KvgWyxZbHRDg0x9ICxg4eqJMyjj@vger.kernel.org
X-Received: by 2002:a05:6102:5114:b0:52a:ef9a:cbef with SMTP id
 ada2fe7eead31-53d162c0ddfmr5454694137.35.1757513941167; Wed, 10 Sep 2025
 07:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com> <87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 16:18:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
X-Gm-Features: AS18NWB5ZbRYOQNXMfBZ0XBpEyOe37_5a6ML1OKvAik19oOXwDMTmOk3fDfNglA
Message-ID: <CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 10 Sept 2025 at 04:01, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add initial DT support for R8A78000 (R-Car X5H) SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi

> +/ {

> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;

> +               a720_0: cpu@0 {
> +                       compatible = "arm,cortex-a720";

"arm,cortex-a720ae"?

> +                       reg = <0x0 0x0>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L1_CA720_0>;
> +                       enable-method = "psci";

Please drop this line, as there is no psci node yet.

> +
> +                       L1_CA720_0: controller-0 {

cache-controller (lots of places).

> +                               compatible = "cache";
> +                               cache-unified;

The L1 cache is not unified, according to the documentation?

> +                               cache-level = <1>;

dtschema/schemas/cache-controller.yaml says valid values are 2..32,
so I think you just have to ignore the L1 cache.
I.e. drop it from DTS, and let the CPU's next-level-cache point to
the L2 cache.

> +                               next-level-cache = <&L2_CA720_0>;
> +                       };
> +
> +                       L2_CA720_0: controller-1 {
> +                               compatible = "cache";
> +                               cache-unified;
> +                               cache-level = <2>;
> +                               next-level-cache = <&L3_CA720_0>;
> +                       };

Shouldn't this node be located outside the cpu@0 node?

> +               };

> +
> +       extal_clk: clock-extal {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* clock-frequency must be set on board */
> +       };
> +
> +       extalr_clk: clock-extalr {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* clock-frequency must be set on board */
> +       };
> +
> +       /*
> +        * In the early phase, there is no clock control support,
> +        * so assume that the clocks are enabled by default.
> +        * Therefore, dummy clocks are used.
> +        */
> +       dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {

Perhaps use clock-*, for consistency with extal(r)?
However, please note that so far no Renesas DTS files use "clock-*"
as a node name, but "*-clk" is in active use. Krzysztof?

And don't forget to say "Thank you!" to our SCMI overlords ;-)

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <266660000>;
> +       };
> +
> +       /* External SCIF clock - to be overridden by boards that provide it */
> +       scif_clk: clock-scif {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* clock-frequency must be set on board */

This clock is optional, and thus may be left unpopulated on a board,
so please (re-)add "clock-frequency = <0>;".

> +       };
> +
> +       soc: soc {

> +               /* The Arm GIC-700AE - View 1 */

s/700/720/

> +               gic: interrupt-controller@39000000 {
> +                       compatible = "arm,gic-v3";

The documentation states it is compliant with GICv4.1?

> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       redistributor-stride = <0x0 0x40000>;
> +                       #redistributor-regions = <32>;
> +                       reg = <0 0x39000000 0 0x20000>, // GICD

The base address is 0x38000000, according to the docs?

> +                             <0 0x39080000 0 0x40000>, // GICR Core0
> +                             <0 0x390C0000 0 0x40000>, // GICR Core1
> +                             <0 0x39100000 0 0x40000>, // GICR Core2
> +                             <0 0x39140000 0 0x40000>, // GICR Core3
> +                             <0 0x39180000 0 0x40000>, // GICR Core4
> +                             <0 0x391C0000 0 0x40000>, // GICR Core5
> +                             <0 0x39200000 0 0x40000>, // GICR Core6
> +                             <0 0x39240000 0 0x40000>, // GICR Core7
> +                             <0 0x39280000 0 0x40000>, // GICR Core8
> +                             <0 0x392C0000 0 0x40000>, // GICR Core9
> +                             <0 0x39300000 0 0x40000>, // GICR Core10
> +                             <0 0x39340000 0 0x40000>, // GICR Core11
> +                             <0 0x39380000 0 0x40000>, // GICR Core12
> +                             <0 0x393C0000 0 0x40000>, // GICR Core13
> +                             <0 0x39400000 0 0x40000>, // GICR Core14
> +                             <0 0x39440000 0 0x40000>, // GICR Core15
> +                             <0 0x39480000 0 0x40000>, // GICR Core16
> +                             <0 0x394C0000 0 0x40000>, // GICR Core17
> +                             <0 0x39500000 0 0x40000>, // GICR Core18
> +                             <0 0x39540000 0 0x40000>, // GICR Core19
> +                             <0 0x39580000 0 0x40000>, // GICR Core20
> +                             <0 0x395C0000 0 0x40000>, // GICR Core21
> +                             <0 0x39600000 0 0x40000>, // GICR Core22
> +                             <0 0x39640000 0 0x40000>, // GICR Core23
> +                             <0 0x39680000 0 0x40000>, // GICR Core24
> +                             <0 0x396C0000 0 0x40000>, // GICR Core25
> +                             <0 0x39700000 0 0x40000>, // GICR Core26
> +                             <0 0x39740000 0 0x40000>, // GICR Core27
> +                             <0 0x39780000 0 0x40000>, // GICR Core28
> +                             <0 0x397C0000 0 0x40000>, // GICR Core29
> +                             <0 0x39800000 0 0x40000>, // GICR Core30
> +                             <0 0x39840000 0 0x40000>; // GICR Core31

No GICC, GICH, and GICV?

> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               scif0: serial@c0700000 {
> +                       compatible = "renesas,rcar-gen5-scif", "renesas,scif";

Missing "renesas,scif-r8a78000" (everywhere)
("make dtbs_check" would have told you).

> +                       reg = <0 0xc0700000 0 0x40>;
> +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";

"fck" on SCIF should be (derived from) SGASYNCD16 (66.666 MHz).

According to the DT bindings, "power-domains" and "resets" are missing.

> +                       status = "disabled";
> +               };

> +               hscif0: serial@c0710000 {
> +                       compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";

Missing "renesas,hscif-r8a78000".

> +                       reg = <0 0xc0710000 0 0x60>;
> +                       interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";

"fck" on HSCIF should be (derived from) SGASYNCD8 (133.33 MHz).

According to the DT bindings, "power-domains" and "resets" are missing.

> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

