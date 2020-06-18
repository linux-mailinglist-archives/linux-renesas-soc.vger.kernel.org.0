Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996FA1FECE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 09:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgFRHw0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 03:52:26 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:38880 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgFRHw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 03:52:26 -0400
Received: by mail-oo1-f67.google.com with SMTP id f2so980402ooo.5;
        Thu, 18 Jun 2020 00:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2g14foByc+A7fQIJ9TIZ/xOZIvsF0Ad4rMLm45u9jeQ=;
        b=g1M14E+XY5aXOiaE5gVhl6JJZELgiVGBUoqDHcR+W76b49hNOVN/LySIcJmxjpFds5
         9FOaZySL2fpDjGn1vPXISVxNprPUAex7rsn+3pXVak4vZcePLKMpuEJ5tlR5L+ARhAIf
         48AAgIjJImi/dPmmn3uIJw1FR1rsiXwCiNu3Lcr60V/on49Q2SKke1j5W/GGeyWvjUJG
         nRuRHBQQwj6opKTvNme36ea408cSbE0X3o2i3akIreEVr3DbF1Cmx+5XK43f9vufMNWv
         GUnzRLJvsiOMKJba8undkVa24Z6Nb03XIca5PH2t0h7Q58tEvUso0lhjxSL6CqRV9K29
         aJ1g==
X-Gm-Message-State: AOAM533lKy5FjmQ0STyNhO06xrKsOP13/5dsQO7iTRKuBZ6EYvDiM+mM
        lIgXo7raS4yMQKVdzTchozrv0EoF08DojXwiJacaTmom
X-Google-Smtp-Source: ABdhPJyDBrolq3n1DGktc9NyaQNoeQYIeopEKFBkgzL3zscuSe+w0m+g6EhJZ1GjqDuTg/qeHA3gZAjk5s3LN0oj3Lc=
X-Received: by 2002:a4a:b804:: with SMTP id g4mr2942903oop.40.1592466745472;
 Thu, 18 Jun 2020 00:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <1592219989-28631-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1592219989-28631-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 09:52:14 +0200
Message-ID: <CAMuHMdWd_nRhYZoHGdC+OJuB3edNUZ=pcNERDRkOwr+n=43Yeg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usb-xhci: convert to YAML
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 15, 2020 at 1:21 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert renesas related part of usb-xhci to YAML.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

[reordering diff for easier commenting]

> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -7,24 +7,6 @@ Required properties:
>      - "marvell,armada3700-xhci" for Armada 37xx SoCs
>      - "marvell,armada-375-xhci" for Armada 375 SoCs
>      - "marvell,armada-380-xhci" for Armada 38x SoCs
> -    - "renesas,xhci-r8a7742" for r8a7742 SoC
> -    - "renesas,xhci-r8a7743" for r8a7743 SoC
> -    - "renesas,xhci-r8a7744" for r8a7744 SoC
> -    - "renesas,xhci-r8a774a1" for r8a774a1 SoC
> -    - "renesas,xhci-r8a774b1" for r8a774b1 SoC
> -    - "renesas,xhci-r8a774c0" for r8a774c0 SoC
> -    - "renesas,xhci-r8a7790" for r8a7790 SoC
> -    - "renesas,xhci-r8a7791" for r8a7791 SoC
> -    - "renesas,xhci-r8a7793" for r8a7793 SoC
> -    - "renesas,xhci-r8a7795" for r8a7795 SoC
> -    - "renesas,xhci-r8a7796" for r8a77960 SoC
> -    - "renesas,xhci-r8a77961" for r8a77961 SoC
> -    - "renesas,xhci-r8a77965" for r8a77965 SoC
> -    - "renesas,xhci-r8a77990" for r8a77990 SoC
> -    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
> -      device
> -    - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
> -      device
>      - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
>      - "xhci-platform" (deprecated)

So you're just extracting the Renesas parts...

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml

... and putting them in a separate file.
Would it make sense to keep them combined in a single document?
Or are there too many differences?

> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,usb-xhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas USB xHCI controllers
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +allOf:
> +  - $ref: "usb-hcd.yaml"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,xhci-r8a7742 # r8a7742 SoC
> +              - renesas,xhci-r8a7743 # r8a7743 SoC
> +              - renesas,xhci-r8a7744 # r8a7744 SoC
> +              - renesas,xhci-r8a7790 # r8a7790 SoC
> +              - renesas,xhci-r8a7791 # r8a7791 SoC
> +              - renesas,xhci-r8a7793 # r8a7793 SoC

These comments don't add much value, as they just duplicate the SoC part
numbers.  What about using SoC part names (e.g. R-Car H2) instead, like
is done in other bindings?

> +          - const: renesas,rcar-gen2-xhci

# R-Car Gen2 and RZ/G1

> +      - items:
> +          - enum:
> +              - renesas,xhci-r8a774a1 # r8a774a1 SoC
> +              - renesas,xhci-r8a774b1 # r8a774b1 SoC
> +              - renesas,xhci-r8a774c0 # r8a774c0 SoC
> +              - renesas,xhci-r8a7795  # r8a7795 SoC
> +              - renesas,xhci-r8a7796  # r8a77960 SoC
> +              - renesas,xhci-r8a77961 # r8a77961 SoC
> +              - renesas,xhci-r8a77965 # r8a77965 SoC
> +              - renesas,xhci-r8a77990 # r8a77990 SoC

Likewise

> +          - const: renesas,rcar-gen3-xhci

# R-Car Gen3 and RZ/G2

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    maxItems: 1
> +    items:
> +      - const: usb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

Missing power-domains and resets.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
