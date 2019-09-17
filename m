Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F8BB4C38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 12:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfIQKtt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 06:49:49 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:15065 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfIQKts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 06:49:48 -0400
X-Greylist: delayed 2717 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Sep 2019 06:49:45 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568717385;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=IfgerbrwLQlIHyD3Hsb4Zd2SNVqRmmU+WFEi9IZmh3U=;
        b=DUcWef468rOlBw3UG4j25bE2ipsCfkWgZWOVaIDxtI80VcReDsYT7UQzmKces+pMZR
        89k9c6uvWYt9H2OnuSLdAsDIpJZqO5l75dlZ4yXvEpQ7iajhawTAyiJ8oD1Yy0I14IXo
        VDa3KiAn9qjjhTSSEfB9XIC1tJXjy8ZNX6v9pWFjK7ya0LGpXb1OfwVqNvTTCCbQNxCf
        2vRiIeXbB51xsqLJU4CbtWTvyeSfEb2N+zYKvAuTdsmoGXvWkuMUdCfEUoi1Nt267GvI
        kfwPNktYmW+wawsUug8qu79SuaLYljpRN78dggVkj3zCplTq6WrxPqbWJIPNpI7OpqL1
        nn+g==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.27.0 AUTH)
        with ESMTPSA id j02f91v8HAhgAb7
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 17 Sep 2019 12:43:42 +0200 (CEST)
Date:   Tue, 17 Sep 2019 12:43:42 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <670148264.237333.1568717022750@webmail.strato.com>
In-Reply-To: <20190916153357.3880-3-horms+renesas@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-3-horms+renesas@verge.net.au>
Subject: Re: [PATCH 2/2] dt-bindings: bus: renesas-bsc: convert bindings to
 json-schema
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
> Convert Renesas Bus State Controller (BSC) bindings documentation to
> json-schema.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> ---
>  .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -----------------
>  .../devicetree/bindings/bus/renesas,bsc.yaml       | 57 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.txt b/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> deleted file mode 100644
> index 90e947269437..000000000000
> --- a/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Renesas Bus State Controller (BSC)
> -==================================
> -
> -The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> -Bridge", or "External Bus Interface") can be found in several Renesas ARM SoCs.
> -It provides an external bus for connecting multiple external devices to the
> -SoC, driving several chip select lines, for e.g. NOR FLASH, Ethernet and USB.
> -
> -While the BSC is a fairly simple memory-mapped bus, it may be part of a PM
> -domain, and may have a gateable functional clock.
> -Before a device connected to the BSC can be accessed, the PM domain
> -containing the BSC must be powered on, and the functional clock
> -driving the BSC must be enabled.
> -
> -The bindings for the BSC extend the bindings for "simple-pm-bus".
> -
> -
> -Required properties
> -  - compatible: Must contain an SoC-specific value, and "renesas,bsc" and
> -		"simple-pm-bus" as fallbacks.
> -                SoC-specific values can be:
> -		"renesas,bsc-r8a73a4" for R-Mobile APE6 (r8a73a4)
> -		"renesas,bsc-sh73a0" for SH-Mobile AG5 (sh73a0)
> -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> -		parent address and child address spaces.
> -  - reg: Must contain the base address and length to access the bus controller.
> -
> -Optional properties:
> -  - interrupts: Must contain a reference to the BSC interrupt, if available.
> -  - clocks: Must contain a reference to the functional clock, if available.
> -  - power-domains: Must contain a reference to the PM domain, if available.
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
> diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> new file mode 100644
> index 000000000000..0231a15cac47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> @@ -0,0 +1,57 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/renesas,bsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Bus State Controller (BSC)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> +  Bridge", or "External Bus Interface") can be found in several Renesas ARM
> +  SoCs.  It provides an external bus for connecting multiple external
> +  devices to the SoC, driving several chip select lines, for e.g. NOR
> +  FLASH, Ethernet and USB.
> +
> +  While the BSC is a fairly simple memory-mapped bus, it may be part of a
> +  PM domain, and may have a gateable functional clock.  Before a device
> +  connected to the BSC can be accessed, the PM domain containing the BSC
> +  must be powered on, and the functional clock driving the BSC must be
> +  enabled.
> +
> +  The bindings for the BSC extend the bindings for "simple-pm-bus".
> +
> +allOf:
> +  - $ref: simple-pm-bus.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,bsc-r8a73a4  # R-Mobile APE6 (r8a73a4)
> +          - renesas,bsc-sh73a0   # SH-Mobile AG5 (sh73a0)
> +      - const: renesas,bsc
> +      - const: simple-pm-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

Shouldn't there be a "required:" section here?

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bsc: bus@fec10000 {
> +        compatible = "renesas,bsc-sh73a0", "renesas,bsc", "simple-pm-bus";
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
>

CU
Uli
