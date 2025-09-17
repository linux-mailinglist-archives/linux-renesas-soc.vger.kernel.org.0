Return-Path: <linux-renesas-soc+bounces-21972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF62B807D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 17:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D042464FC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 15:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD7A335944;
	Wed, 17 Sep 2025 15:21:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2C333A9C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122506; cv=none; b=jha/GsAcj3huSep6F9srVqVphNEbq26FthZofqEjG3YGJJInM/qmz3+5HaXCruv2A2xLQRwjoabzVzsxy5DXO+rDyhdGn3pVOD8I6DBXDjTlZAPJnAVBHPFCnotKazd/dfEy9Teut+YN5cliR/AI6rbwy92zKJgPdc5JV8k5Mp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122506; c=relaxed/simple;
	bh=KSe+VQBHvW0n2Vmc15r/RkklfJ0UGB66cliG33ieqhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agZw0yBBkA8FuebjcA15sgolAmx6OCCMCK01s/z+o9NmMuv5lq5V9sE+PQIg9T7Fcd2CP4Kv/fYuswavXurLKVB2JEs0peIcVC4AycvnNKrLEGMYyL8QSYk3aI0+24PvBjwtPvWbMCkfXG4FgUVPi37fJImVlttzyZgrtNyLb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-757a43dbed1so2578713a34.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122504; x=1758727304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ6rxnhh7QouGGcSBJApcqvcuY+RYoCVy1LFm/ChHAI=;
        b=YoGlrz4imrJq6U2fbviAzOUVrATOYJUUfglS9l+vyh2UxikNMKZHB5nVBljLHqCD+G
         K3AlL1b2SD8WupFI9Zc8uxJPer6omof/HSYyTl2cTqjggVFGfd3gEtk/nLEX0H3qrBU/
         267H13GIGA4EyH155eH9hNm7rBMs5jDQzUlNEEtTs1v14G6WWsMA6hgku4UwGpjzpU78
         IcQZCfRG5fcB5KG2sUBafzIZFxKkxsKAJxdJujBbGMh1hgy/Rp1NFGAUXb7JqtZjY7JN
         0q+AmIFE8mPZVVEqL/7iRJp/oVMd8uh2IKWZAdjbZRZPi5FB6oNK5Z318DIEi7jP67Ik
         nh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1Z8AIwfrczlK9FbaaRjMxISvzce6jv/n0sa/fbL3IkZOeA3h8Qomp8ImXR/3yLcM23sOkNou+ChkKFgjeYh4clQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoR8TTeaLadoABf0y6eQUFccbBp4MjacC/Sy7xaTwL3A3zIaMr
	a78qTnJlur7sVtT/EcOUd7wAbzX9bDKNgT2ksg+vYXS92BnzG4BSNvZKB+zFLHn6va4=
X-Gm-Gg: ASbGnctgV34ZOQYHsihEZJDksNZfg1faMvdg/F4te5YL7DbWm4TkCespcJd8gB/yDVf
	IidwnG5og7ci6Jw/LpDcwQ/tC37VFr3xezNTGEl77wZFN2ODsl7/RSVdIosiR5WwdIfu8PPqXN3
	QTlTZxNNGdnWMWEV58V1oanOJrr14R1DZ36fFYjxG/tXmpMK+jRUosrTxNQH49BhhU2N6rqsf12
	6XCHyLDMolbbrq8RuU5ESUeYKt/dK/e5gU96tDgsQ9nQIwHEvuScc+MVpPK90u03qkLdmW6+cM0
	Z09ikDEGzMYvYKea1fgA/aXOu7jWbvTfefli0uw85ln6lnbaGeZ+/x++m6GaETtevB3HBKZFifX
	6tnL+fbzWdS1jHHYMfC/2bYpO4UoHOweI6RYZYc6+V1k8rkruZpEdUhjEjItE
X-Google-Smtp-Source: AGHT+IHXcMDwBBvqy+odAJKIpQgQLtKCBQ+OrW5NtNxhFlQ2lVZc7EQ0LqcSkFJvEUp1pI07KdMCzg==
X-Received: by 2002:a05:6830:6c14:b0:758:6251:2e5e with SMTP id 46e09a7af769-76327f2bad5mr1339797a34.35.1758122503927;
        Wed, 17 Sep 2025 08:21:43 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524b8a3b9esm5395400a34.26.2025.09.17.08.21.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:21:43 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30cce50dfb4so4766293fac.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:21:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW87r26//i1i2M1jgcpRa6rgRnqQv6oFzhoYCekWlLo2x38ME44pdkK8vOoSjEpeoJeC1Z17TeWgghnpGW2zI8DUA==@vger.kernel.org
X-Received: by 2002:a05:6102:4414:b0:4e6:ddd0:96ff with SMTP id
 ada2fe7eead31-56d63efa012mr900359137.16.1758122046543; Wed, 17 Sep 2025
 08:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com> <877bxxabmr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bxxabmr.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 17:13:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaoBP1ZtJqc7rfqLXGETXpVYNcFfJf5xFBFSHG9mSB8Q@mail.gmail.com>
X-Gm-Features: AS18NWDAtmJ2xaoQuGRsAt7Kwia2BPFHIJLsHQkXMzPf_Sxvg99Y761td_EKCiw
Message-ID: <CAMuHMdUaoBP1ZtJqc7rfqLXGETXpVYNcFfJf5xFBFSHG9mSB8Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 17 Sept 2025 at 07:31, Kuninori Morimoto
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

Thanks for the update!

> index 0000000000000..6445f05de0563
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -0,0 +1,755 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car X5H (R8A78000) SoC
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "renesas,r8a78000";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {

> +               a720_0: cpu@0 {
> +                       compatible = "arm,cortex-a720ae";
> +                       reg = <0x0 0x0>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L2_CA720_0>;
> +
> +                       L2_CA720_0: cache-controller {

As reported before, the cache nodes should be outside the CPU nodes.

"make dtbs_check" would have reminded you:

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0
(arm,cortex-a720ae): Unevaluated properties are not allowed
('cache-controller' was unexpected)
            from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

> +                               compatible = "cache";
> +                               cache-level = <2>;

Missing "cache-unified".

"make dtbs_check":

    arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller
(cache): 'cache-unified' is a required property
            from schema $id: http://devicetree.org/schemas/cache.yaml#

> +                               next-level-cache = <&L3_CA720_0>;
> +                       };

> +               };

> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;

Marc asked to move interrupt-parent to the top, i.e. one level up...

> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               timer {

... and please keep the timer node outside the soc node.

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: soc
(simple-bus): timer: 'ranges' is a required property
            from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

> +                       compatible = "arm,armv8-timer";
> +                       interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
> +               };

> +               scif0: serial@c0700000 {
> +                       compatible = "renesas,scif-r8a78000", "renesas,scif";

Missing "renesas,rcar-gen5-scif".

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000
(renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one
must be fixed:
            ...
            ['renesas,scif-r8a78000', 'renesas,scif'] is too short
            ...
            'renesas,rcar-gen5-scif' was expected
            ...
            from schema $id:
http://devicetree.org/schemas/serial/renesas,scif.yaml#

> +                       reg = <0 0xc0700000 0 0x40>;
> +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

> +               hscif0: serial@c0710000 {
> +                       compatible = "renesas,hscif-r8a78000", "renesas,hscif";

Missing "renesas,rcar-gen5-hscif".

"make dtbs_check":

arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000
(renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one
must be fixed:
        ['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
        ...
        'renesas,rcar-gen5-hscif' was expected
        from schema $id:
http://devicetree.org/schemas/serial/renesas,hscif.yaml#

> +                       reg = <0 0xc0710000 0 0x60>;
> +                       interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

