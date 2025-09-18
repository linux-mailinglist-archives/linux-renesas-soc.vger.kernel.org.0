Return-Path: <linux-renesas-soc+bounces-22017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D09B83F3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7541C031A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFBB2AD0D;
	Thu, 18 Sep 2025 10:02:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17A27D770
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189733; cv=none; b=UdfRHMOgPu34dnaJaLZRWwUPzn0STr3GBFNbBhrE9psUWJOXJ7S74OYV/k8SIzPSsUa6/BaQerIyZJmu4zZKNjA9ciyuiy2Ba7RU5bdZYLINGbnhAuqOuyN4tBS1xejGHhJxVzGvuJDvVML16Go/qaUSexO8NPwioNBH7gNibwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189733; c=relaxed/simple;
	bh=tJj9rQD66s1ZsqtyiQYDVNQ/XIehZY5bWaCYzk/MGHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaxCSoY4SVH09RbhOTY5C6WI+yQH+DUO7UayaTrThzLqNSkp3GUWgLXJBuRghr20bA6wNH/8IM8d1QaToBYkb+vJihgxW45CbDwnxwASokU1tzs6DHG5l6CZoeQ1V74LD5hm7+Kiy8kAq6TOhuvek8ROBCR7e6oCiH/2aVkFA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78defc1a2afso9511656d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189731; x=1758794531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAV6+U9ykOwvp8+2HatYYts2BEiZRGxqVQPDnpRww3U=;
        b=A+VlZJnfcThPNucMau48WPnRaj4LykKnsZSiIXanvGPsKUcGAHubsCg4hyBGOk/+in
         Pk3Tr6FbYXY4ENoRK98Z5Xffp+Ho9ytlsySYWTZQfeFxyLLKlPcV0Ov6J+24hgQ9G87A
         x1uwGWmswCWSa8eQkbjI2c7TimtPHdQ2f7j5VkmjUmx0LW8Zt8QX2m1Snjg0hkIm1DXw
         wxc44J1q6ccekqrv5AyBtCdwz0dnyWWZPciifqMK4VrbW2BvwpGFSBCUqAzfF2aq3UA6
         yWGjl0nrzGZLHxDuFUhMmwBDE7hxeNtHzEc2N3E9VYIi5cGD4H57RpYEPfaE7hJmA8eh
         vaJw==
X-Forwarded-Encrypted: i=1; AJvYcCW5POvwi7AIoT6K2eo63hmK8bwkP8+NhdiHNRUspvgz5gYZquuc2VaBDyMkcwxCAdXzuD06MeNZRBuHd1ZMtE9FOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsP1j7gZzbAqmkD1MuJiHPDAJRhPt3JzdooA/niK3TLIVlYBD
	AyKFJM3L1/ccHINVD+DphM2342b/hf7qEFZshegEOLHJojRSb93EkVfC+dCdJCpX
X-Gm-Gg: ASbGncsfnOJhWpIGo/eU90OScaBJfXgtdEKDZ2iSYkWnkhhWg8IwVyaGS8bKzdYOouo
	tElcx+kaGGgjNoZb33oksdOA2K9kHZqSlMsk4pPyTchQ7w40YBGeWehqJWvUGe1DHomchlQEjZs
	qsJlGZmmFEM6bakFWR0ykhpzJrA9pfqBC3p3m3bbGJjSHSQ5rjkp4+P5ku/XcpWu8U+Fw9s6S/d
	6m6FkROnFhVuiYQ8rN26nYQqJtWAQr/3AfIiYlKZ1o8Z8Iv3Ez3Z6FZmYcHmNNsXZyCo3z7cumm
	bW/kEVHBV7zkWFMB+qnZBfXtkZAB7Y9nDVTR7Ch04WRtxM7Nx4RZF9XtQ76x2Fgdk/+JvXpfgbn
	Y7EHcNjWBvMzvkOdjqzWLLxHYU04pB55/pClfPo68A4jJD+/ju7RLDRd8gT9ds0TJqnc5ZO0T69
	oklU85pdY=
X-Google-Smtp-Source: AGHT+IH1sn4lVEBgZ00/XRcRYO0GNC2Fqt3GSu5xob6rWBftGPCTxuOpO+AnH2QQqkVtZScyBZqkFg==
X-Received: by 2002:ad4:5cab:0:b0:709:c7de:ce70 with SMTP id 6a1803df08f44-78ecc43a332mr55200636d6.10.1758189730556;
        Thu, 18 Sep 2025 03:02:10 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793446ac604sm11070076d6.3.2025.09.18.03.02.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:02:10 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-80e4cb9d7ceso106148785a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:02:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCocct8Ug7jYTkULetUlFjb6cLZtaoEJ1ZIy62NHTjpg6DdjI8n0k5qpX99bP69lt8luRVyw53yATK66xP0V1kQw==@vger.kernel.org
X-Received: by 2002:a05:6102:f96:b0:524:5653:81aa with SMTP id
 ada2fe7eead31-56d6a96ba24mr1974782137.27.1758189231483; Thu, 18 Sep 2025
 02:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:53:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6KkM4+0tDzxNLQhWzBMs02vx=DTQ95D_-u+YYAcNgRg@mail.gmail.com>
X-Gm-Features: AS18NWC_4v91tXzLLOBSlDGTfgVal7mv5u3w5QpZG0TVZ1CRDcwzHECf6Dh9qXk
Message-ID: <CAMuHMdU6KkM4+0tDzxNLQhWzBMs02vx=DTQ95D_-u+YYAcNgRg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
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

On Thu, 18 Sept 2025 at 08:27, Kuninori Morimoto
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

> +       extalr_clk: extalr-clk {
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

Please keep nodes sorted (alphabetically, by node name).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <266660000>;
> +       };
> +
> +       dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <66666000>;
> +       };

> +       soc: soc {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               prr: chipid@189e0044 {
> +                       compatible = "renesas,prr";
> +                       reg = <0 0x189e0044 0 4>;
> +               };
> +
> +               /*
> +                * The ARM GIC-720AE - View 1
> +                *
> +                * see
> +                *      r19uh0244ej0052-r-carx5h.pdf
> +                *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> +                *       - sheet [RT]
> +                *        - line 619
> +                */
> +               gic: interrupt-controller@39000000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0 0x39000000 0 0x20000>,

The DT bindings say the first region should be GICD (no mention of
GICM), so shouldn't the size be 0x10000?
See Table 21.9 "GIC-720AE Base address".

> +                             <0 0x39080000 0 0x800000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               scif0: serial@c0700000 {
> +                       compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";

Some lines are getting a bit long, but that is not something I cannot
fix while applying...

> +                       reg = <0 0xc0700000 0 0x40>;
> +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

