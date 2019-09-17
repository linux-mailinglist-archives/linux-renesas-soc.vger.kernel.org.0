Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688B5B4EDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfIQNMX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 09:12:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfIQNMX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:12:23 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48283218AE;
        Tue, 17 Sep 2019 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568725942;
        bh=5FRm34rpb648LCbNFM/ImUmJI7Z219s/PDWsMsrNUhM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WbcJR4rGUMRSAhDYRxJgLoh//uyHyerOprzWrVO4i55cDsFB70q0XfCTmu46wPksM
         78/0qWe/XaC8lA1yufoDOwOQoPE43POJb+nE4tNTZE7IBM1bTa3T2EsM/6tmUJ3XRd
         rCuAnq3ANEq7VvRn1R1SOsRyTZy2h10+YSjMxdgE=
Received: by mail-qk1-f169.google.com with SMTP id x134so3942118qkb.0;
        Tue, 17 Sep 2019 06:12:22 -0700 (PDT)
X-Gm-Message-State: APjAAAW4wqCawITP6TP43GO2y9MfJJ7iGxx18DDxBYi0AFCctzDhwpiw
        AIOD+gIpeO/iaL9yNFjgUBInvHhTMAp/HxL5Jw==
X-Google-Smtp-Source: APXvYqxcR3k1oBsQ5PAUpeOJYzwcVau/5ldZP5pPqDvPS//Zj515z1j3JD0OHn7ZLn3Yk35U2c8NYMM3h+kxZ/W3ucY=
X-Received: by 2002:a05:620a:7da:: with SMTP id 26mr3341180qkb.119.1568725941483;
 Tue, 17 Sep 2019 06:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1568721972-24266-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1568721972-24266-1-git-send-email-ykaneko0929@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 17 Sep 2019 08:12:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLYmLyr9JmMovJYvS98t2n9s4cB7KP-8_yPCPtkXBDyjQ@mail.gmail.com>
Message-ID: <CAL_JsqLYmLyr9JmMovJYvS98t2n9s4cB7KP-8_yPCPtkXBDyjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: convert bindings to json-schema
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 7:06 AM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>
> Convert Renesas Interrupt Controller bindings documentation to json-schema.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  .../bindings/interrupt-controller/renesas,irqc.txt | 48 ----------------
>  .../interrupt-controller/renesas,irqc.yaml         | 64 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> new file mode 100644
> index 0000000..f08d368
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> @@ -0,0 +1,64 @@

License. The default for existing bindings is GPL-2.0-only. If Renesas
is the only copyright holder, then please license as (GPL-2.0-only OR
BSD-2-Clause).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.yaml#
> +$schema: http://devicetree.org/meta-schemas/interrupts.yaml#
> +
> +title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,irqc-r8a73a4        # R-Mobile APE6
> +          - renesas,irqc-r8a7743        # RZ/G1M
> +          - renesas,irqc-r8a7744        # RZ/G1N
> +          - renesas,irqc-r8a7745        # RZ/G1E
> +          - renesas,irqc-r8a77470       # RZ/G1C
> +          - renesas,irqc-r8a7790        # R-Car H2
> +          - renesas,irqc-r8a7791        # R-Car M2-W
> +          - renesas,irqc-r8a7792        # R-Car V2H
> +          - renesas,irqc-r8a7793        # R-Car M2-N
> +          - renesas,irqc-r8a7794        # R-Car E2
> +          - renesas,intc-ex-r8a774a1    # RZ/G2M
> +          - renesas,intc-ex-r8a774c0    # RZ/G2E
> +          - renesas,intc-ex-r8a7795     # R-Car H3
> +          - renesas,intc-ex-r8a7796     # R-Car M3-W
> +          - renesas,intc-ex-r8a77965    # R-Car M3-N
> +          - renesas,intc-ex-r8a77970    # R-Car V3M
> +          - renesas,intc-ex-r8a77980    # R-Car V3H
> +          - renesas,intc-ex-r8a77990    # R-Car E3
> +          - renesas,intc-ex-r8a77995    # R-Car D3
> +      - const: renesas,irqc
> +
> +  '#interrupt-cells':
> +    # an interrupt index and flags, as defined in interrupts.txt in
> +    # this directory
> +    const: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - clocks

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/r8a7790-clock.h>
> +
> +    irqc0: interrupt-controller@e61c0000 {
> +        compatible = "renesas,irqc-r8a7790", "renesas,irqc";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;

required?

> +        reg = <0 0xe61c0000 0 0x200>;

Not documented.

> +        interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 3 IRQ_TYPE_LEVEL_HIGH>;

Not documented.

> +        clocks = <&mstp4_clks R8A7790_CLK_IRQC>;
> +    };
> --
> 1.9.1
>
