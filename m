Return-Path: <linux-renesas-soc+bounces-12662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0698A20B4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812603A51BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887461A7249;
	Tue, 28 Jan 2025 13:25:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED801A83E8;
	Tue, 28 Jan 2025 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738070751; cv=none; b=lfLYO9b+7oy/4zPoqt//1xaZwUoc9L7ebNn8YVyFJsZQ1LeyMtHSAoYnkYswWlgMgS/5LZRePQoqH5tTBkfCLB5kAPt9tD9ZaDhyeSxKEKx4yOiYNH+sxAfZAPd+gYfxAGdWcg1FZTLoOjIMyt6RfE9C0UdpI1T24PMbCvBEQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738070751; c=relaxed/simple;
	bh=ITKNwZOu2Ci8P1AH7v6RrtJZbNdqPzCvLxC4Tv3dPhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3mVImFjLRKjXc1nqf8E6m4h/0Dlm/khi8qT0Fsx1N+FNZNWOtvYtPzezG7g3x+w3UyXZyG8mhBSJ7vQ4GHrx2Q4nbkjExs8EIvHMckPNk930Rbom5oOIh0udDMGJuUimvlhEHGyEDZ5sMrSTmwtm2LSCn6POwf5DOZcnyt5JmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-518a52c8b5aso1826004e0c.2;
        Tue, 28 Jan 2025 05:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738070747; x=1738675547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQh42kwO/Q8WqPipAdjbuwV6bQtvBK7FPDsCLzw5wC4=;
        b=cWuRyiBawzrf/hmVFZi7Ki81gmFe1XIrpUWsmjmqM0DJySF3hWaoOBi6OemzEHog8X
         urH2cXzQLUU0u4gSfriXpQ9pgB6b5wmYorFMZvjOaURmozgRXCyRCesJLYLRgZztqxhm
         XoGKitVJvEWEmEdHEFnE3ZDiYgskAzyQILD8G05jbrx3iKGuqZEfWpZikRC46iwcI1pn
         zYLGe+/NoxQjWTxNW4MlPMazWuovAm8dVad34T+xCglfgrqE41OrVoYqfqbueOpFpjLV
         zEQ/mygt4C9hA7k6yrGQOrWeyy5UtgkRt4b664UfBKmR8Am6/mlgOeES0DEFUaepfHbC
         ibsw==
X-Forwarded-Encrypted: i=1; AJvYcCWS6Av8ke/766uXLtUhI4RKY/j/NSbO2H3TCABcod7t9s4g5L++BwpKgAk/mggguTdNvow4Zuw1awoXxL8c2r/HHOo=@vger.kernel.org, AJvYcCXI2T0bCWJUO7y1mkQO4R0tuKVh3n4lcakiqyfoROS4gqFDScq5Y20Ve2DB8hoDi4icRjEHdhYqwABL@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCjPbhalMROG0RX29pqzwFNFL+kBKy+S2mA9FXty+dqLf6eTo
	Kqu595sFr2LiyU+8uKp4vlwe0L6gvESogzWV2b5GgiUxmut6DQbY3HRDM9YF
X-Gm-Gg: ASbGncuDsRaVdN28u6qQcikZAcpS7mZdyNY09al2kaCiBesQKVZrKHnBTllbIgKBaDX
	DQdLRD/5coR2YhGXHanw77kzFLMcSx2/EHByhBg70bMk7KN8v4VS3WlVmRXkjW6dNmmT/XAQXoV
	dI6SzjygTfjuVEy2Vz/x641v4mL4wZ8fWPH6o/OGnhWQMiG603FVs+EQmg5i/Vy5jQnEYxFQMVb
	1E2pMWG8jUVgUGq9WFezLKVZsTmp8Y8cdkXKyTKPGh2PXp0FjVqeg/wvdC23+O3oJaBesBjDDKS
	RjAKrZWzSlkeBnprEUrwZeogS5w7D4cFtkXkmkwo1E0Wq8XLj3qTjg==
X-Google-Smtp-Source: AGHT+IFyEyuJrPPCo68Gk6x9b9lHW9br9DxnKV0w8X2MabvyARMcpEzq4GQyb+RGq95WDUqXC0OacA==
X-Received: by 2002:a05:6122:2396:b0:518:78c7:9b4f with SMTP id 71dfb90a1353d-51d59d54caamr38519307e0c.3.1738070746807;
        Tue, 28 Jan 2025 05:25:46 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4eaae615sm1774459e0c.23.2025.01.28.05.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:25:46 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso932752241.2;
        Tue, 28 Jan 2025 05:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9YUyf+341ippQHY3B2YPXD/8ACY54Kl418J/NFnjWphgOp2njQyNRpdh0XTQ6PMGmi7FyRrP38LHyINcTdHc5xUg=@vger.kernel.org, AJvYcCV/AFB7X+my0fxZOCjCa1JmEgWug8jvsktG5NdIKzbsqbVASl3zRY5E0jGbX/qH5puIzpM6BHOoffNI@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:4b2:bc9f:3f91 with SMTP id
 ada2fe7eead31-4b690cd510bmr34681722137.21.1738070746178; Tue, 28 Jan 2025
 05:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-6-biju.das.jz@bp.renesas.com> <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
 <TY3PR01MB11346016CB4B1414521B66F1F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346016CB4B1414521B66F1F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 14:25:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
X-Gm-Features: AWEUYZnyCJ8rD2ZF4AE8C4U3hXQqOTcg-GBrbLO7SFcf4hO591V8s69Ko4g5LfU
Message-ID: <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jan 2025 at 13:11, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 28 January 2025 11:33
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> > biju.das.au <biju.das.au@gmail.com>
> > Subject: Re: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
> >
> > On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > > @@ -518,6 +518,63 @@ gic: interrupt-controller@14900000 {
> > >                         interrupt-controller;
> > >                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> > >                 };
> > > +
> > > +               sdhi0: mmc@15c00000  {
> > > +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> > > +                       reg = <0x0 0x15c00000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
> > > +                                <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
> > > +                       clock-names = "core", "clkh", "cd", "aclk";
> > > +                       resets = <&cpg 0xa7>;
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +
> > > +                       vqmmc_sdhi0: vqmmc-regulator {
> > > +                               regulator-name = "SDHI0-VQMMC";
> > > +                               regulator-min-microvolt = <1800000>;
> > > +                               regulator-max-microvolt = <3300000>;
> > > +                       };
> > > +               };
> > > +
> > > +               sdhi1: mmc@15c10000 {
> > > +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> > > +                       reg = <0x0 0x15c10000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
> > > +                                <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
> > > +                       clock-names = "core", "clkh", "cd", "aclk";
> > > +                       resets = <&cpg 0xa8>;
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +
> > > +                       vqmmc_sdhi1: vqmmc-regulator {
> > > +                               regulator-name = "SDHI1-VQMMC";
> > > +                               regulator-min-microvolt = <1800000>;
> > > +                               regulator-max-microvolt = <3300000>;
> > > +                       };
> > > +               };
> > > +
> > > +               sdhi2: mmc@15c20000 {
> > > +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> > > +                       reg = <0x0 0x15c20000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
> > > +                                <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
> > > +                       clock-names = "core", "clkh", "cd", "aclk";
> > > +                       resets = <&cpg 0xa9>;
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +
> > > +                       vqmmc_sdhi2: vqmmc-regulator {
> > > +                               regulator-name = "SDHI2-VQMMC";
> > > +                               regulator-min-microvolt = <1800000>;
> > > +                               regulator-max-microvolt = <3300000>;
> > > +                       };
> > > +               };
> > >         };
> > >
> > >         timer {
> >
> > Shouldn't the vqmmc-regulator subnodes be added in the board DTS, when needed (i.e. at least for
> > SDHI[12])? Or do you expect the board DTS to /delete-node/ them when they are not needed?
>
> I agree.
>
> I have provided an example in next patch using /delete-node/ to use gpio-regulator.

Ah, my fault trying to get my reviews out sooner rather than later ;-)

> I am ok for moving it to the board DTS as well. When I sent patch, I am not sure which
> is the best in terms of user point of view?
>
> Now I got the answer to move vqmmc-regulator subnodes to add in the board DTS for
> atleast SDHI[12]. I will address this in next version.
>
> Even for SDHI0 fix type, if we plan to use fixed regulator for eMMC?
>
> >
> > Is it possible that SDHI0 does not need the regulator control, e.g.
> > in case of a fixed voltage?
>
> Yes, for eMMC(fixed case) it is not needed.

Upon second thought: as the internal regulator is always present, what
about setting its status to disabled in the SoC .dtsi, and changing
it to okay in the board DTS when needed, like done for other
components?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

