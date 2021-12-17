Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C85A479031
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 16:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhLQPpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 10:45:14 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:43554 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbhLQPpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 10:45:14 -0500
Received: by mail-ua1-f52.google.com with SMTP id 107so5059810uaj.10;
        Fri, 17 Dec 2021 07:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMMzdvtpdWB9OZVCj46gQtFtuOfodcP8PtHfwWBR+Qw=;
        b=Ve4O4phvNwBReAIM4iakdJko/oI0Nzi9VWmcuhdAorwgl0vA5E5vPMNGdoS9ZT2cF0
         yT89gDGpXn7/HmvDmqGFKRJTS1ET3S8sIn6BDToN/v9UhLZcjtdRUy6J/uj/ENhYC3QW
         +uDE32GJxHydNd2JzfyW4MrT3aTNZ0LSR0rS/eac8HKt8j3l8GyM+IsElMK1GEzLY0YJ
         sxQ2eU5fXtyqgzaoKNIF5KZVoTgjm6A3kLlFMOCdMfwSELod5fSnPkzmwb6SH/vYDci4
         b3oQY4FL1vdIm/1pIXn0o0vyEI4AN/MAZV48dO3NGIKNXi/my3N9hafcj1WK6YJyhScT
         cbQg==
X-Gm-Message-State: AOAM530YeT8300HiDLJFh2loiwulmM2qRUYTT/GJW8w1nrXZfeM6bfLG
        60sW9fejsKuDCPFQ1vNIwIZZNgW35G8hAA==
X-Google-Smtp-Source: ABdhPJx2y7YQ/v9CA8TMT6VCPAcp1uB6Iw/On+0LyBQ+4etW4jG0/7XEbrzvpIb2cC4p2shzoKzsXw==
X-Received: by 2002:a05:6102:55a5:: with SMTP id dc37mr1441128vsb.62.1639755912959;
        Fri, 17 Dec 2021 07:45:12 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id v4sm1107264vkf.15.2021.12.17.07.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:45:12 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id r15so5135067uao.3;
        Fri, 17 Dec 2021 07:45:12 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr1251114vsg.57.1639755911970;
 Fri, 17 Dec 2021 07:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20211217142033.353599-1-miquel.raynal@bootlin.com> <20211217142033.353599-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211217142033.353599-2-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 16:44:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
Message-ID: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car
 Gen3 & RZ/N1 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Dec 17, 2021 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller.
>
> As this controller is embedded on different SoC families, provide:
> * a family-specific "r-car-gen3" compatible and a more specific
>   "r8a77951" one
> * a family-specific "rzn1" compatible and a more specific "r9a06g032"
>   one
>
> More compatibles can be added later if new SoCs with this controller
> must be supported.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a77951-nandc
> +          - const: renesas,rcar-gen3-nandc

Might be a bit premature to add these before they have been tested,
and because there are small differences in integration, cfr. below.

> +
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-nandc
> +          - const: renesas,rzn1-nandc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB host controller clock
> +      - description: External NAND bus clock
> +
> +  clock-names:
> +    items:
> +      - const: hclk
> +      - const: eclk

On R-Car Gen3, there's a single module clock.
Plus a power-domain to manage that.

Actually the RZ/N1 clock driver also registers a PM Domain, so letting
Runtime PM manage the clocks may work on RZ/N1, too...

On R-Car Gen3, there's also a module reset.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
> +        clock-names = "hclk", "eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
