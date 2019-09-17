Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8AAB4C34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfIQKtg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 06:49:36 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:12135 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfIQKtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 06:49:36 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Sep 2019 06:49:34 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568717373;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=mV8V/mAA+JoLMbydbnfpeN8Madn3PXV7YO/86RBM9mM=;
        b=tc4+vKHaiAigobBa9HEX5PN5Dk0JQg3IogCYvrGwrcEJgD4Aq31b3nnE4WC8G5Rh86
        HiAuVTI/LtvVuO7iI4X/iVlgW0db6nRZMc9czMKk7/pYh0C9SrhCccIR4moefs3OX8E8
        zhtCYTYpU9UrAwhpss2EpUVe7Nyyl4AYdZLMshEA/Tq8Egf51HnIhworGgTUzUSqSNc0
        99Gnr/V4ejchEukg1cpoPBR8Caf+d8vFgFK4Ncuxz6KtZv1+sC17r1JeMaF1sBQR2kPe
        ZXMM4eAZP/g2Yl7dTnfC0Uw/zvfcFvIX1Z5QOZljjFVnhnUCSEow5ylU57co96XZaDOq
        3aPA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.27.0 AUTH)
        with ESMTPSA id j02f91v8HAhRAax
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 17 Sep 2019 12:43:27 +0200 (CEST)
Date:   Tue, 17 Sep 2019 12:43:27 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <2123403900.237308.1568717007831@webmail.strato.com>
In-Reply-To: <20190916153357.3880-2-horms+renesas@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings
 to json-schema
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev20
X-Originating-IP: 85.212.142.246
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On September 16, 2019 at 5:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> 
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
> 
> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt b/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> deleted file mode 100644
> index 6f15037131ed..000000000000
> --- a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Simple Power-Managed Bus
> -========================
> -
> -A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> -driver, as it's typically initialized by the boot loader.
> -
> -However, its bus controller is part of a PM domain, or under the control of a
> -functional clock.  Hence, the bus controller's PM domain and/or clock must be
> -enabled for child devices connected to the bus (either on-SoC or externally)
> -to function.
> -
> -While "simple-pm-bus" follows the "simple-bus" set of properties, as specified
> -in the Devicetree Specification, it is not an extension of "simple-bus".
> -
> -
> -Required properties:
> -  - compatible: Must contain at least "simple-pm-bus".
> -		Must not contain "simple-bus".
> -		It's recommended to let this be preceded by one or more
> -		vendor-specific compatible values.
> -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> -		parent address and child address spaces.
> -
> -Optional platform-specific properties for clock or PM domain control (at least
> -one of them is required):
> -  - clocks: Must contain a reference to the functional clock(s),
> -  - power-domains: Must contain a reference to the PM domain.
> -Please refer to the binding documentation for the clock and/or PM domain
> -providers for more details.
> -
> -
> -Example:
> -
> -	bsc: bus@fec10000 {
> -		compatible = "renesas,bsc-sh73a0", "renesas,bsc",
> -			     "simple-pm-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0x20000000>;
> -		reg = <0xfec10000 0x400>;
> -		interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&zb_clk>;
> -		power-domains = <&pd_a4s>;
> -	};
> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> new file mode 100644
> index 000000000000..72a3644974e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -0,0 +1,68 @@
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
> +  compatible:
> +    items:
> +       - const: simple-pm-bus
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges:
> +    # Mapping between parent address and child address spaces.
> +    maxItems: 1
> +
> +  clocks:
> +    # Functional clocks
> +    # Required if power-domains is absent, optional otherwise
> +    minItems: 1
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
> +        interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&zb_clk>;
> +        power-domains = <&pd_a4s>;
> +    };
> -- 
> 2.11.0

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli

>
