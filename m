Return-Path: <linux-renesas-soc+bounces-12654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01623A209C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301D218862CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E0019D88B;
	Tue, 28 Jan 2025 11:33:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028D199FA2;
	Tue, 28 Jan 2025 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064001; cv=none; b=anZ19HHaRsMa3zB6H9Q+Qz0Sfjh++gAKk/T+iohtaEbqes3YLNIQ+UZbZEDhtKwgxpGKn3s6p91U24IpYKeYSj9m25bcycYg+AvY5CbX7xZSmPjC0W6MCVN93HkwbY+Uu7nCJZ2ZXheCiKgda61hkOfD/cwGf/Yc8z2liCsl/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064001; c=relaxed/simple;
	bh=tnPANPQp/iMd7ygA5qHRfQpX/WHlo4nFKXP1SUwAJ38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2Milg1kprtqH5UhMnheIt8y7qBcK9BVbjWeAbVpOjt7qgN8PksPvtjfvceoSRZxgaHxXAR9caQWqnDhhhcVeya1w7vH0CCQKeMmM+G/FwAS+4eMLTnZghBddN1j3qDMquGY8yHe2wbj5yMz/2TVUTS7ghFBVoz1AzigbaTpmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso3056267241.0;
        Tue, 28 Jan 2025 03:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063997; x=1738668797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MqtICvzZgY6SSLmB9xB0fcdPuyJ3N2axr9vtSPs85Q=;
        b=OAGrbYRO7ZsJfTQtorlr5K3imCsBJrRZZEhlJcAdIpu9QU4y/Y3EnOJLzXljlVtFUr
         pN/Q0gJR70HHp3pdsyFXp5EDAbrFABeud4svgTW7Ps2LhARwuEsSGRbfVCbKu9zZviMJ
         6cXPVf3yPlqQE8vqYIPMg5uVaPWQjMxZVJqOKdDbPSoNeLg17BEy12k2+jJmvADD71Dn
         R9gyu7pQjbxrXurQ4geZ4RQJjr5J7KxKFGsBbMnjz/TIerROlNbeZh9YprasWSUrqti2
         TmTBnmBVEnn2QM9PphSqNyq6VHQYiMFqy6UCzWsQTG83UaXUrA/NpeXSekEEY9MdNZoM
         rdwA==
X-Forwarded-Encrypted: i=1; AJvYcCX8q/971MY632UILvsKZua7SiEi6JftgSZ82Vqkc6Ng4AiDaYn4w3w3rH8lq4mdWhzajdHy7Lib9tRH@vger.kernel.org, AJvYcCXSRypLuxFj+/Oiyt2tvrUebFNS4sFu46Mu6mdeXAxOI1NXCz/CQNA61zia6JbyW6QIrkw9yeOYel0WO0MD4c18OE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhZY0MTt7Cxnri+2/+KKOPc6miPj+iO91YpeQWtN4eYH5tquR
	BchzxP4vUtQa97O+A9QiXrtg1QZtzKT2ojNaMg5sJfASLcr0ASSva/tY3dnr
X-Gm-Gg: ASbGncvef/5C0VWcwHyj0PFQ0RmYcUSdmuq0qxfO6wUro3HuQ4ZAwn9OOxa7ToiPeV0
	Yw4s8wtici4rDE1SxOixPDE8nnFdMhHA3ZDXgfpWu0fO1ytA0A7yKWJlWSD6WUOWlcM9BWtj7yQ
	BS4Opu6GfumgRXu9zKwqd5j1stvw3Q5iyvXmoExZCOheoiYp6Rp+odt+eyKMsjaNZJp2BU7InaF
	HfY3uPCQUfZkz4IhY+OdbvU83XYRPdx2j9rG6jWg9XvCmZKQM7BYx1MXESIcE0yqU7MbqGmIDKX
	Q634jjjEhEXg1EqDYkG5In0+aI3xxw98gT5iQHt1HFtuGKD9tUESCA==
X-Google-Smtp-Source: AGHT+IG8zuJwiXxUoCXaBZxA1yZn8lvWTbG1Az+93DFBejIl669D8cGuN84wzS6irxt52ygfrRV7Ow==
X-Received: by 2002:a05:6102:3913:b0:4b6:8fc5:2e7c with SMTP id ada2fe7eead31-4b690be8eb5mr37966757137.12.1738063997386;
        Tue, 28 Jan 2025 03:33:17 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c17e31sm2282783241.22.2025.01.28.03.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:33:17 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso4517682137.0;
        Tue, 28 Jan 2025 03:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIA/JkwbUKKU0VhHW+GU+9OD1VfozRDnEOnBT4xIB4vPS/JC6ZgWu2JgyEOeoTrKK6h18MvQh6Si4/@vger.kernel.org, AJvYcCXjPMJuvhdlFlwJk11nY35DHoYL7ajV5ZW0OagwhaLVkHHuhSvh1b/T16EfJDtcLOH9E9HHr7TMoS9pv9ob65yAgYo=@vger.kernel.org
X-Received: by 2002:a05:6102:3f03:b0:4b2:7534:f26e with SMTP id
 ada2fe7eead31-4b690c77e52mr38354510137.16.1738063997008; Tue, 28 Jan 2025
 03:33:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 12:33:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
X-Gm-Features: AWEUYZmBCOQBBHpcl0geg1tLlT5Yz2FF6YuO09W2QfAWI0ZQOPy-AUT57-Wu4Xo
Message-ID: <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -518,6 +518,63 @@ gic: interrupt-controller@14900000 {
>                         interrupt-controller;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@15c00000  {
> +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x15c00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
> +                                <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
> +                       clock-names = "core", "clkh", "cd", "aclk";
> +                       resets = <&cpg 0xa7>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       vqmmc_sdhi0: vqmmc-regulator {
> +                               regulator-name = "SDHI0-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +               };
> +
> +               sdhi1: mmc@15c10000 {
> +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x15c10000 0 0x10000>;
> +                       interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
> +                                <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
> +                       clock-names = "core", "clkh", "cd", "aclk";
> +                       resets = <&cpg 0xa8>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       vqmmc_sdhi1: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +               };
> +
> +               sdhi2: mmc@15c20000 {
> +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x15c20000 0 0x10000>;
> +                       interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
> +                                <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
> +                       clock-names = "core", "clkh", "cd", "aclk";
> +                       resets = <&cpg 0xa9>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       vqmmc_sdhi2: vqmmc-regulator {
> +                               regulator-name = "SDHI2-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +               };
>         };
>
>         timer {

Shouldn't the vqmmc-regulator subnodes be added in the board DTS,
when needed (i.e. at least for SDHI[12])? Or do you expect the board DTS
to /delete-node/ them when they are not needed?

Is it possible that SDHI0 does not need the regulator control, e.g.
in case of a fixed voltage?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

