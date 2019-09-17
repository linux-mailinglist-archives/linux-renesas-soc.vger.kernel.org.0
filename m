Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DB1B4D90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfIQMMa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfIQMMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:12:30 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7D6C21897;
        Tue, 17 Sep 2019 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568722349;
        bh=RDClN9OCGGuU7+G+2rLjYnl9jz1nIpTFt72Amd8/fCY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LuZ++VE/D9AJ8mbTtK/KkyNISsBmSZHXN6ifmSTiKAYCiBROSU0J0ckMZj3ZQMWzI
         ndlWYUYeQ2p7nfAuvG5vEAVniaSk/zYUkeZbe12vkZ/XFH1uq5NJVmL/NsZiuV3dHT
         5XaRCJ200q+nK6vnouzS/cuFkdYO0B0/pRcyzU4Q=
Received: by mail-qt1-f179.google.com with SMTP id n7so4051991qtb.6;
        Tue, 17 Sep 2019 05:12:28 -0700 (PDT)
X-Gm-Message-State: APjAAAXih0Q0hRxDWJSzkALG3OtOd4W4H2yXcdgPbCsQOJa6BL5IhI5h
        dD8//xe0X8vXgjdyA+QkMrljmHZaLCzVd0auEw==
X-Google-Smtp-Source: APXvYqw8kuSai60gIRHNcfn+daHA+Lff3Kp+JUQbdi1LSo3jFzrqgZ8JxwAPXMflo/hL8fZMfdfCr0eOnqwRm7/FlqA=
X-Received: by 2002:ac8:100d:: with SMTP id z13mr3252907qti.224.1568722347960;
 Tue, 17 Sep 2019 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190916153357.3880-1-horms+renesas@verge.net.au> <20190916153357.3880-2-horms+renesas@verge.net.au>
In-Reply-To: <20190916153357.3880-2-horms+renesas@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 17 Sep 2019 07:12:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
Message-ID: <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Convert Simple Power-Managed Bus bindings documentation to json-schema.
>
> As a side effect of this change only simple-pm-bus is used in example. A
> follow-up patch will provide an example for the separately documented
> Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> "renesas,bsc" compat strings.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> ---
>  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 --------------
>  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 68 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> new file mode 100644
> index 000000000000..72a3644974e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -0,0 +1,68 @@

SPDX tag?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Power-Managed Bus
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> +  driver, as it's typically initialized by the boot loader.
> +
> +  However, its bus controller is part of a PM domain, or under the control
> +  of a functional clock.  Hence, the bus controller's PM domain and/or
> +  clock must be enabled for child devices connected to the bus (either
> +  on-SoC or externally) to function.
> +
> +  While "simple-pm-bus" follows the "simple-bus" set of properties, as
> +  specified in the Devicetree Specification, it is not an extension of
> +  "simple-bus".
> +
> +
> +properties:

Add $nodename in here.

> +  compatible:
> +    items:
> +       - const: simple-pm-bus

extra leading space.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1

1 or 2 should be valid...

> +
> +  ranges:
> +    # Mapping between parent address and child address spaces.
> +    maxItems: 1

empty or multiple ranges should be possible.

> +
> +  clocks:
> +    # Functional clocks
> +    # Required if power-domains is absent, optional otherwise
> +    minItems: 1

This will imply maxItems is 1 which I don't think you want.

Though more than 1 starts to mean you need to know specifically what the h/w is.

> +
> +  power-domains:
> +    # Required if clocks is absent, optional otherwise
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges

This will capture what you commented above:

oneOf:
  - required:
      - clocks
  - required:
      - power-domains

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bsc: bus@fec10000 {
> +        compatible = "simple-pm-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0 0x20000000>;
> +        reg = <0xfec10000 0x400>;

If you have reg, then it shouldn't be "simple-pm-bus" unless you can
function without accessing the regs.

> +        interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;

Not documented?

> +        clocks = <&zb_clk>;
> +        power-domains = <&pd_a4s>;
> +    };
> --
> 2.11.0
>
