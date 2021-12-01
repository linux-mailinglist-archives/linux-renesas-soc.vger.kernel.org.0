Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D20465015
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 15:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350832AbhLAOm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350796AbhLAOkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 09:40:40 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F63C0619F0;
        Wed,  1 Dec 2021 06:36:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 05BEECE1F45;
        Wed,  1 Dec 2021 14:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36097C53FAD;
        Wed,  1 Dec 2021 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638369372;
        bh=fDcjDlre3zNps+euRe6r4MeUW9GiVltCf2FiglTDJMs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VLTlm+NlLTM0kPmYPSPC6h9zN18cLntfOTO5Rn7DcIIBiO4T9qMaNUwZ1ina5SVdq
         jt1zBgCxUFCePozohANIKWOYgkFPdUcTnBHvEPTFxPiPTZnhvqLC3fkqAbJhzKl7ku
         ajETGRMDZE4TosIOsFrRu+f/Bu6DfRfEdS50NobUXqz85xoSyADSd3HBC1PAl8zMH/
         RMBRQ1NB71RPefklnKpWwJ0Dz/dBMCB5LyevsXePyz6jFbo5ns/S5wbAj0/GUVnMDf
         LS4+28h5hukLa/smezZ2m/oUjjkmp5pSCduV6uLjSl+60PHzv34uapDF7VO+dNQZGU
         AtTrjPEVMWVBg==
Received: by mail-ed1-f47.google.com with SMTP id e3so102642682edu.4;
        Wed, 01 Dec 2021 06:36:12 -0800 (PST)
X-Gm-Message-State: AOAM530UTRbSU2ONP1cIj2Q6YYpQ70hLIuT2bsEDgfLTEZlpWAOPz1A7
        UwhvrzNO7d2hYJaj36WLjZkKEQXlIXgKR7pTww==
X-Google-Smtp-Source: ABdhPJycrMzjLRRzGghWaRYfmnXIZP4mbV7XJfZv7HiaQKS7jnZWOj0jW3iacRJ5wzExr310Lv3vHf2qBAx4QlVmRfI=
X-Received: by 2002:a17:907:a411:: with SMTP id sg17mr7542058ejc.84.1638369370499;
 Wed, 01 Dec 2021 06:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org> <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
 <8735no70tt.wl-maz@kernel.org> <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
 <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
 <87tug3clvc.wl-maz@kernel.org> <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
 <87r1b7ck40.wl-maz@kernel.org> <OSZPR01MB7019E7DD7119EFF9C994AA62AA649@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <87tufvmes9.wl-maz@kernel.org> <CA+V-a8siHRjF+bJu88QFwz0a_MZ+kiJEwmER58_feyr8O+WNGA@mail.gmail.com>
 <CAL_JsqK+GcnChx3i9fsYnw+FzZgON4PtKB=CzYLUj6sXtxX6fQ@mail.gmail.com>
 <CA+V-a8sVS_1hUWJ3uM+VffGyMtdnctBOJTyHTQAoJZGOh0a1Tw@mail.gmail.com>
 <87bl21mqwk.wl-maz@kernel.org> <CA+V-a8vA0P-yhm2SHJmVh+cuUw7qodQLQBqzNPTz31x5q18xaA@mail.gmail.com>
In-Reply-To: <CA+V-a8vA0P-yhm2SHJmVh+cuUw7qodQLQBqzNPTz31x5q18xaA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 1 Dec 2021 08:35:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1Dw9C_GQjto-E2ch7fdN=3f4Qz9qYuf2iYwMRLkdroA@mail.gmail.com>
Message-ID: <CAL_JsqJ1Dw9C_GQjto-E2ch7fdN=3f4Qz9qYuf2iYwMRLkdroA@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 1, 2021 at 7:37 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Marc/Rob,
>
> On Tue, Nov 30, 2021 at 6:37 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Tue, 30 Nov 2021 12:52:21 +0000,
> > "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> > >
> > > On Mon, Nov 29, 2021 at 6:33 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > interrupts would work just fine here:
> > > >
> > > > interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> > > >   <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> > > >
> > > > We don't need a different solution for N:1 interrupts from N:M. Sure,
> > > > that could become unweldy if there are a lot of interrupts (just like
> > > > interrupt-map), but is that an immediate problem?
> > > >
> > > It's just that with this approach the driver will have to index the
> > > interrupts instead of reading from DT.
> > >
> > > Marc - is it OK with the above approach?
> >
> > Anything that uses standard properties in a standard way works for me.
> >
> I added interrupts property now instead of interrupt-map as below:
>
> irqc: interrupt-controller@110a0000 {
>       compatible = "renesas,r9a07g044-irqc", "renesas,rzg2l-irqc";
>        #address-cells = <0>;
>        interrupt-parent = <&gic>;
>        interrupt-controller;
>        reg = <0 0x110a0000 0 0x10000>;
>        interrupts =
>                       <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
>                      <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
>                        <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
>           clock-names = "clk", "pclk";
>           power-domains = <&cpg>;
>           resets = <&cpg R9A07G044_IA55_RESETN>;
> };
>
>
> In the hierarchal interrupt code its parsed as below:
> on probe fetch the details:
> range = of_get_property(np, "interrupts", &len);
> if (!range)
>       return -EINVAL;
>
> for (len /= sizeof(*range), j = 0; len >= 3; len -= 3) {
>       if (j >= IRQC_NUM_IRQ)
>             return -EINVAL;
>
>       priv->map[j].args[0] = be32_to_cpu(*range++);
>       priv->map[j].args[1] = be32_to_cpu(*range++);
>       priv->map[j].args[2] = be32_to_cpu(*range++);
>       priv->map[j].args_count = 3;
>       j++;

Not sure what's wrong, but you shouldn't be doing your own parsing.
The setup shouldn't look much different than a GPIO controller
interrupts except you have multiple parent interrupts.

Rob
