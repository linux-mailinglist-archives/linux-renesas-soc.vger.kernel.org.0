Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740A411B1DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 16:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387933AbfLKPdL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 10:33:11 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37891 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387423AbfLKPdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 10:33:08 -0500
Received: by mail-oi1-f193.google.com with SMTP id b8so13585956oiy.5;
        Wed, 11 Dec 2019 07:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f5P25Si4pv99iP0qrSos6mF+77maXmQ/ZDO3HXBpXqE=;
        b=PhQlpAuA19DEAcAgEFVx4qZBSt7waJ118aKV4TsU0dW++tEKwIk1fg6GDhlIGZHVrv
         frMNXHxEyR63eUjLgicOFX74lex63afl/PHWUXpLY1yowmN/7Ab3KuTV1+fFsLjPSdN/
         ORZDTBoxPa7hI3UAL3bCA+v0cwRipHJnYc2/pBD+lGeaS5lgTFqMBLRwrSKTfZ51fJuy
         IyojJ3qnNwvuqAUuqd/pQOUZDJv44GOTs3CEYtEnfCITMil/EnNlMr75UEXrFqMJ4+VP
         AsMuYsMN9Tru4yeZLd1xYd5zhoZxKtqgIXgant3NS5TDQ+pOiyhlgAuRcRFp45a41NRU
         ojPw==
X-Gm-Message-State: APjAAAVVegURNP1D3OxfHZ0FjqT/cbxI1Jos7bO3/lzYIxg9Kf3o3RRn
        9LSW/eg1TTRjrHrVwYvVOXXuP+e2JsgIs+YgZ8I=
X-Google-Smtp-Source: APXvYqxil2EmaM/dqweJcHtTfhDUlmKjy65GEn4NAbcDsfU0ROdt5CGKYoFFIB85oAv4vVN8I6Umv8ahu6gIC52KruA=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr3341766oia.102.1576078387298;
 Wed, 11 Dec 2019 07:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20190502123220.3016-1-geert+renesas@glider.be> <20190502123220.3016-2-geert+renesas@glider.be>
In-Reply-To: <20190502123220.3016-2-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Dec 2019 16:32:36 +0100
Message-ID: <CAMuHMdU2atxUFCMFJNsgVWak+Z1YcTm8BrKtk66cpXu16K+_tA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Thu, May 2, 2019 at 2:32 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> @@ -0,0 +1,43 @@
> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> +
> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> +RZ/A1 and RZ/A2 SoCs:
> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> +    interrupts,
> +  - NMI edge select.
> +
> +Required properties:
> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> +               fallback.
> +               Examples with soctypes are:
> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> +                                in interrupts.txt in this directory)
> +  - #address-cells: Must be zero
> +  - interrupt-controller: Marks the device as an interrupt controller
> +  - reg: Base address and length of the memory resource used by the interrupt
> +         controller
> +  - interrupt-map: Specifies the mapping from external interrupts to GIC
> +                  interrupts
> +  - interrupt-map-mask: Must be <7 0>
> +
> +Example:
> +
> +       irqc: interrupt-controller@fcfef800 {
> +               compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
> +               #interrupt-cells = <2>;
> +               #address-cells = <0>;
> +               interrupt-controller;
> +               reg = <0xfcfef800 0x6>;
> +               interrupt-map =
> +                       <0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                       <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                       <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                       <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                       <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                       <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                       <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                       <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-map-mask = <7 0>;
> +       };

"make dtbs_check" does not like this example:

arch/arm/boot/dts/r7s72100-rskrza1.dt.yaml:
interrupt-controller@fcfef800: {'compatible':
['renesas,r7s72100-irqc', 'renesas,rza1-irqc'], '#interrupt-cells':
[[2]], '#address-cells': [[0]], 'interrupt-controller': True, 'reg':
[[4244568064, 6]], 'interrupt-map': [[0, 0, 3, 0, 0, 4], [1, 0, 3, 0,
1, 4], [2, 0, 3, 0, 2, 4], [3, 0, 3, 0, 3, 4], [4, 0, 3, 0, 4, 4], [5,
0, 3, 0, 5, 4], [6, 0, 3, 0, 6, 4], [7, 0, 3, 0, 7, 4]],
'interrupt-map-mask': [[7, 0]], 'phandle': [[27]], '$nodename':
['interrupt-controller@fcfef800']} is valid under each of {'required':
['interrupt-map']}, {'required': ['interrupt-controller']}
{'oneOf': [{'required': ['interrupt-controller']},
           {'required': ['interrupt-map']}]}

as it considers interrupt-controller and interrupt-map mutually-exclusive.

This comes from
dt-schema/meta-schemas/interrupts.yaml:

    dependencies:
      interrupt-map: ['#interrupt-cells', 'interrupt-map-mask']
      '#interrupt-cells':
        oneOf:
          - required:
              - interrupt-controller
          - required:
              - interrupt-map

and/or dt-schema/schemas/interrupt-controller.yaml:

    dependencies:
      interrupt-controller: ['#interrupt-cells']
      interrupt-map: ['#interrupt-cells', 'interrupt-map-mask']
      "#interrupt-cells":
        oneOf:
          - required:
              - interrupt-controller
          - required:
              - interrupt-map

Removing the "interrupt-controller" property fixes the warning, but
impacts the logic in of_irq_parse_raw().

Is there something wrong with the base schema?
Or perhaps this will just be be fixed by converting renesas,rza1-irqc.txt
to yaml?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
