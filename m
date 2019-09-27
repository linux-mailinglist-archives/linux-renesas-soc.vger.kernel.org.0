Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EC5C0B61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfI0Sit (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 14:38:49 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46576 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfI0Sit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 14:38:49 -0400
Received: by mail-oi1-f194.google.com with SMTP id k25so6009381oiw.13;
        Fri, 27 Sep 2019 11:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vnPkZDQJ5z1JM9F8Qj9xnFy3bzZcn4QdvmzMOum47Ak=;
        b=AhE4MbYxKnJARVS1pfeA+kIKC1CyzbJOeMg5JT7d36b/hMscFiml8Xu8MsImtkM8Ah
         moCrgIq+kalI9EqbxcHWJxc7CBEU4UeXK+XJE4U5Dp9039FyhN5VHaTTll4c694V6Kcp
         eLAhNz6lMEFi93Wo9mg+JjuQJEEIvn/TxXN4N3U/Ykd13Vmp7bYV49AMdyZUIHo2ThaF
         tBkzWCRudfmKxS6tlwPYtAkj8pgFp/kK1wWjKJ85IcaHLhAZOyUjOu40I48EONe6zt1I
         Eopk9inxYPeJ/sYyKYbfXLJmL3LsBec/rG/Ar7edIs5zEsYZWXYz+njr60YszV8gAoRW
         11iw==
X-Gm-Message-State: APjAAAVFGLGhxMMFdMpTrfVWHiIIBkdEcXcCBAzZw3ysyMUI/UfxujJi
        yNdEhssmFzNCBC+MAr65sw==
X-Google-Smtp-Source: APXvYqzs5WI0T5Txftk3J4rvqb9LsYLejz5LJ73PXASxBUt9yRkNj6So366ajBrRyzQ3jkNiSw6xiA==
X-Received: by 2002:aca:fdc9:: with SMTP id b192mr7931393oii.50.1569609526433;
        Fri, 27 Sep 2019 11:38:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y137sm1923936oie.53.2019.09.27.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 11:38:45 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:38:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: bus: simple-pm-bus: convert bindings
 to json-schema
Message-ID: <20190927183844.GA16521@bogus>
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
 <20190924093609.22895-2-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924093609.22895-2-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 24, 2019 at 11:36:07AM +0200, Simon Horman wrote:
> Convert Simple Power-Managed Bus bindings documentation to json-schema.
> 
> As a side effect of this change only simple-pm-bus is used in example. A
> follow-up patch will provide an example for the separately documented
> Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> "renesas,bsc" compat strings.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> 
> v2
> * Add SPDX line
> * Remove extra blank line
> * Add $nodename
> * Remove extra leading space in compatible
> * Update compatible to allow override by other schemas
> * Allow #size-cells to be 1 or 2
> * Do not limit ranges or clocks to 1 item
> * Add anyOf requirement on ranges or clocks
> * Update example based on msm8996.dtsi
> ---
>  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 -------------
>  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 75 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 44 deletions(-)
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
> index 000000000000..598b71d779b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
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
> +properties:
> +  $nodename:
> +    pattern: "^bus([@-][0-9a-f]+)?$"

Why the '-' (bus-)? That's only for a few cases where there's no 
addressing like i2c-gpio.

> +
> +  compatible:
> +    contains:
> +      const: simple-pm-bus
> +    description:
> +      Shall contain "simple-pm-bus" in addition to a optional bus-specific
> +      compatible strings defined in individual pm-bus bindings.
> +
> +  '#address-cells':
> +    const: 1

This too can be 2 cells...

> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  clocks: true
> +    # Functional clocks
> +    # Required if power-domains is absent, optional otherwise
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
> +anyOf:
> +  - required:
> +      - clocks
> +  - required:
> +      - power-domains
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus {
> +        power-domains = <&gcc AGGRE0_NOC_GDSC>;
> +        compatible = "simple-pm-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +    };
> -- 
> 2.11.0
> 
