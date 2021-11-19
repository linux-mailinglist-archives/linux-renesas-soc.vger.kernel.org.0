Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819BD456BC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 09:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhKSIou (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 03:44:50 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39699 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhKSIou (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 03:44:50 -0500
Received: by mail-ua1-f46.google.com with SMTP id i6so19734098uae.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hbYdvHhEe2Uxe6rqTFYcB++vBPifwXHrniTsNrCDXE=;
        b=3+44KJitsjqXbyTby9QuygcCQF2T3bQpiGFzSoQQ0BLag6S0EWeRwpVGe2O9yhrj2U
         rHJpne8G9THMDv2DUjoqAF3+TUZSFPhaYUllvpIaF0wa02l4rjrmhUksCHmzNTNGBwQ4
         +4sMEDB6WNf9iD6iKH462SWt8zJ/TApv+yoMhLu/9xjjocI1u1HAUm6ueFX1LE1feMjE
         tbdO7SaIKDEhNGWZN9nkm/0d3CC6hq67WNXSL3V9jW0YOyh9uBpOYAdL4S8/NGBc2XAX
         NfDhiafkgX6DXj/Fxx22Ppju/nGsG9I2/NWug7QOXiacJaLvbK3Ldf1NGbRWHk9kNO7a
         oslQ==
X-Gm-Message-State: AOAM53386LEGs6sEuiMJP3TjlZrPhpiJ5YPAghdPDEEdgpbZBxrJvOTj
        dvulKCkFQxRetyHsRZNlyRy2+n9JrNbA/A==
X-Google-Smtp-Source: ABdhPJz9w0LhoalrAMAANkN2zHCUb8HLKtRTX3oY25iUGqIEdx7w7xJr+lKQnXFVdqonKPX3s2UqLg==
X-Received: by 2002:a05:6102:356e:: with SMTP id bh14mr92180354vsb.21.1637311308436;
        Fri, 19 Nov 2021 00:41:48 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 3sm1377672vsq.1.2021.11.19.00.41.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:41:47 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id k83so5451597vke.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:41:47 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr19232022vkr.26.1637311307063;
 Fri, 19 Nov 2021 00:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com> <20211118111940.1275351-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-2-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 09:41:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
Message-ID: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

CC Gareth

On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a06g032-nand-controller

As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
and RZ/N1L, I think you should add a family-specific compatible value
"renesas,rzn1-nand-controller" as a fallback.

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nand-controller";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&hclk_nand>, <&clk_nand>;

This clocks property is not based on an actual .dtsi, right?

> +        clock-names = "hclk", "eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
