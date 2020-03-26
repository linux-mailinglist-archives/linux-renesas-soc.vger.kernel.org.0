Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A941193B55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 09:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCZIxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 04:53:05 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33751 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgCZIxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 04:53:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id 22so5050708otf.0;
        Thu, 26 Mar 2020 01:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQ/fa8aT//j29SmaxXKsMK5EPYmfccRWVr9uRBwUtAE=;
        b=s/pl6JkXt8XlmDTl2F6NcSl3DwuDk5qK1u9VyooKUF10wXtR21gOXdb0Kaja1NIXs5
         ZyuWbyCbYf4eIjoTWbpuM6HITpIba5MupV7b7aWXskCiUMmOsJoB+VVmhuBCUf0aofHb
         GfYX6lkZ79bT4itVzlJxgxGrgOZis3yhzgb4d4NwmdvIE1TSDH/w853OjA16uatzw/Tb
         mkSSoGg3IZda24Z85p+frtCjJiqaGrbu6v422sPGNSVrXzwzOMj4pB1LuDc33BDUOaYW
         HL2YvXQsmux+sv6MD2i6i62B2HWndOntiYb7bTVsEo+QXDQn2rUoJYauVS3OkONaMxlw
         VgJw==
X-Gm-Message-State: ANhLgQ1VEPD3zGK326iqhCkDFDIkwov/963CbGWWoy8wJiXDBp9k9Lgj
        nCoidatoS/k2NhCGFdmjsK3tSoQs1uViqzPuL2I=
X-Google-Smtp-Source: ADFU+vuLhZkG0qFBRJnvVt/2yvd1wfvJ9wDtSmw8tl4ZphjxP7PU3MQpKVogLLsA8gfqdLikMqk185VnTr6oEoZmpBE=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr5434971otk.145.1585212783766;
 Thu, 26 Mar 2020 01:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585200559-30033-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585200559-30033-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 09:52:52 +0100
Message-ID: <CAMuHMdXe6GjjQDCjGAE=GfkEYkBZjqj4PNNB+Sp_NOtYXx8ZTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: renesas: usb3-phy: convert
 bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Mar 26, 2020 at 6:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas R-Car generation 3 USB 3.0 PHY bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0-only

In think Rob would prefer

    # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,usb3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car generation 3 USB 3.0 PHY
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a774a1-usb3-phy # RZ/G2M
> +          - renesas,r8a774b1-usb3-phy # RZ/G2N
> +          - renesas,r8a7795-usb3-phy  # R-Car H3
> +          - renesas,r8a7796-usb3-phy  # R-Car M3-W
> +          - renesas,r8a77965-usb3-phy # R-Car M3-N
> +      - const: renesas,rcar-gen3-usb3-phy
> +
> +  reg:
> +    # base address and length of the registers block for the PHY.

I think this comment can be removed.

> +    maxItems: 1
> +
> +  clocks:
> +    # A list of phandles and clock-specifier pairs.

Likewise.

"minItems: 2"?

> +    maxItems: 3
> +
> +  clock-names:
> +    # If you want to use the ssc, the clock-frequency of usb_extal
> +    # must not be 0.

"minItems: 2"?

> +    maxItems: 3
> +    items:
> +      - const: usb3-if # The funcional clock
> +      - const: usb3s_clk # The usb3's external clock
> +      - const: usb_extal # The usb2's external clock
> +
> +  '#phy-cells':
> +    # see phy-bindings.txt in the same directory
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  renesas,ssc-range:
> +    description: |
> +      Enable/disable spread spectrum clock (ssc). 0 or the property doesn't
> +      exist means disabliing the ssc.

disabling

The actual value will be -<value> ppm.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 4003, 4492, 4980 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    usb-phy@e65ee000 {
> +        compatible = "renesas,r8a7795-usb3-phy", "renesas,rcar-gen3-usb3-phy";
> +        reg = <0 0xe65ee000 0 0x90>;

Examples use the default #{address,size}-cells of <1>, so

    reg = <0xe65ee000 0x90>;

> +        clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
> +        clock-names = "usb3-if", "usb3s_clk", "usb_extal";
> +        #phy-cells = <0>;
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
