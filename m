Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C1BB4BFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 12:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfIQKbL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 06:31:11 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37590 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfIQKbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 06:31:11 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1595A25AD71;
        Tue, 17 Sep 2019 20:31:08 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 176489407F6; Tue, 17 Sep 2019 12:31:06 +0200 (CEST)
Date:   Tue, 17 Sep 2019 12:31:06 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: rtc-sh: convert bindings to json-schema
Message-ID: <20190917103105.kh64uop6g4tuanhh@verge.net.au>
References: <20190917083634.11510-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917083634.11510-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 10:36:34AM +0200, Simon Horman wrote:
> Convert Real Time Clock for Renesas SH and ARM SoCs bindings documentation
> to json-schema.  Also name bindings documentation file according to the
> compat string being documented.
> 
> Also correct syntax error in interrupts field in example.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml

  The above should read:

  * Tested using:
    # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
    # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml

> ---
>  .../devicetree/bindings/rtc/renesas,sh-rtc.yaml    | 66 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/rtc/rtc-sh.txt   | 28 ---------
>  2 files changed, 66 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> new file mode 100644
> index 000000000000..07dbcd4436ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,sh-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock for Renesas SH and ARM SoCs
> +
> +maintainers:
> +  - Chris Brandt <chris.brandt@renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r7s72100-rtc  # RZ/A1H
> +      - const: renesas,sh-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: period
> +      - const: carry
> +
> +  clocks:
> +    # The functional clock source for the RTC controller must be listed
> +    # first (if it exists). Additionally, potential clock counting sources
> +    # are to be listed.
> +    true
> +
> +  clock-names:
> +    # The functional clock must be labeled as "fck". Other clocks
> +    # may be named in accordance to the SoC hardware manuals.
> +    true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r7s72100-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc: rtc@fcff1000 {
> +        compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> +        reg = <0xfcff1000 0x2e>;
> +        interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "alarm", "period", "carry";
> +        clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> +                 <&rtc_x3_clk>, <&extal_clk>;
> +        clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-sh.txt b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> deleted file mode 100644
> index 7676c7d28874..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Real Time Clock for Renesas SH and ARM SoCs
> -
> -Required properties:
> -- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
> -  fallback.
> -- reg: physical base address and length of memory mapped region.
> -- interrupts: 3 interrupts for alarm, period, and carry.
> -- interrupt-names: The interrupts should be labeled as "alarm", "period", and
> -  "carry".
> -- clocks: The functional clock source for the RTC controller must be listed
> -  first (if exists). Additionally, potential clock counting sources are to be
> -  listed.
> -- clock-names: The functional clock must be labeled as "fck". Other clocks
> -  may be named in accordance to the SoC hardware manuals.
> -
> -
> -Example:
> -rtc: rtc@fcff1000 {
> -	compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> -	reg = <0xfcff1000 0x2e>;
> -	interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> -		      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> -		      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> -	interrupt-names = "alarm", "period", "carry";
> -	clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> -		 <&rtc_x3_clk>, <&extal_clk>;
> -	clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
> -};
> -- 
> 2.11.0
> 
