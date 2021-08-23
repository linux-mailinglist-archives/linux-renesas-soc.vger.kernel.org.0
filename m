Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9A03F474F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhHWJXb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 05:23:31 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:47095 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhHWJXb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 05:23:31 -0400
Received: by mail-vs1-f44.google.com with SMTP id f13so10610108vsl.13;
        Mon, 23 Aug 2021 02:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gt+eojLYgADvAa13MxSZYGtUVyb5L5ebuzo5ONxZgrI=;
        b=BnmQ1yr/AnjAJB0x3XpXN9UZ36Onkk+a6DJE3xEBI2elkbOqtGiiI3OAmdGmQAozD1
         KUbyJIK3HmQGFmFVVcH4ok0FBRIlTM/Oume5ShU1ObcpfprAR+iiSD3aX5awwGPDnc+L
         D8PN4zJXEi5SMa7nyBlz6IRfNJiR51P5YekqfdzcYJN5gXU8i+jJk9+PxWtXrZDLCANq
         fEVrLn5qTnl01WWERhBA0wj5dLzAQLaG8Lg1U1dHK1kgQ0C3RJjojBhfehqH5TrD00ss
         qmpQDmVabFlnsFIz2xQ5U+YiIAeTFTgbhAvD02y8OQiCIcTQZctk1ALdN0/DRHQy0+dA
         9ARQ==
X-Gm-Message-State: AOAM530hqRcr2TA1h9T/nl30QRqmidb/7Jm9tHg7YB4TA0QLK8Q1nQAk
        oqP0inDWFWqHJwwHqg8BP2TXN307TDovR9E4Ns4=
X-Google-Smtp-Source: ABdhPJz28fxMG9kfJf8GETxTvqUtwihBTWhZXmcu12UH1nD6e1mE1lJ+gKdP0AYCAbP1FuvP0Zlts11yKSODJ4rQIdU=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr22882432vsl.9.1629710568318;
 Mon, 23 Aug 2021 02:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
 <20210812151808.7916-4-biju.das.jz@bp.renesas.com> <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
 <OS0PR01MB59221C4884E0667F75748A1686F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922205202921BA8EC12C26686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <05bdd9e8-e68f-c8b4-a7d9-a83f2ca97a58@omp.ru>
In-Reply-To: <05bdd9e8-e68f-c8b4-a7d9-a83f2ca97a58@omp.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 11:22:36 +0200
Message-ID: <CAMuHMdVAMX7-SwguMZHJGua1h-Kp5KGw4u0GEeZ7eByccdxYQw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device support
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergey,

On Tue, Aug 17, 2021 at 6:41 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 8/17/21 2:12 PM, Biju Das wrote:
> [...]
> >>>> Add USB2.0 device support to RZ/G2L SoC DT.
> >>>>
> >>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> [...]
> >>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> >>> b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> >>>> index de78c921af22..2f313c2a81c7 100644
> >>>> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> >>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> >>>> @@ -391,6 +391,25 @@
> >>>>                    power-domains = <&cpg>;
> >>>>                    status = "disabled";
> >>>>            };
> >>>> +
> >>>> +          hsusb: usb@11c60000 {
> >>>> +                  compatible = "renesas,usbhs-r9a07g044",
> >>>> +                               "renesas,rza2-usbhs";
> >>>> +                  reg = <0 0x11c60000 0 0x10000>;
> >>>> +                  interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
> >>>> +                               <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> >>>
> >>>    Don't we need to specify "interrupt-names" when there a more than 1
> >>> interrupts?
> >>
> >> This dtsi changes, as per binding documentation [1]. As you see,
> >> "interrupt-names" is optional.
> >
> > For now I will go with current dt changes.
> >
> > Later  I will create incremental patches for dt-binding with optional "interrupt-names",
> > "clock-names" and "reset names" for all the SoC's supported by this binding doc.
> >
> > After that, will send an incremental patch with adding optional properties in all SoC dtsi.
> >
> > Does it make sense?
>
>    I had the impression that the "*-names" prop was mandatory for a "*" prop having 2 values or mores.
> If it's now allowed to be optional, don't bother with that at all.

There's a difference between "mandatory according to good DT
binding design" and "mandatory according to the actual json-schema
DT bindings".  For now the tools only enforce the latter...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
