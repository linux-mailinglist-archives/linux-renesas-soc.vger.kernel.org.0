Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA881D7E24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 18:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgERQSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 12:18:05 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40449 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgERQSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 12:18:04 -0400
Received: by mail-il1-f193.google.com with SMTP id e8so10363657ilm.7;
        Mon, 18 May 2020 09:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=od6i0i/mlWvl4dy5Y4Piq4ipgSDHP81ep3mNdXvuqAk=;
        b=mvlL1JIidFe5Xk9oo2C3a8/7N2o/JwypJ4WL4DabELvAMyJ7UcFJhpKGFmyHLzkI8j
         rixb6am95rs26djgPiOSPEn/jq3f2ivq/iu6jMcw0sDUIjhrcBk3YmVd2zknbhH0AzvX
         yQrIubv1+Ne4mu+2hoSQ29xpQWM0WqKK+9bQZSqRXhoLUxnqY1wJLtc/7gysI7Fq5NXQ
         885qUX/zBO1YJij7gkwaE+P5w6Cl/59zgZ3MdhF9+iEM/a9ZMdmrVADyDduz2pSK2ni8
         lAvQdWgZA8YjbbKOhL950yWhxHiq4Q0J4gYDoOycYIDhdN23vC759Gxc77hMln8+WT0j
         7vSQ==
X-Gm-Message-State: AOAM533kJRahb5PIfjNHYscJuBy/SQnL6bCwWHrOzMTjhUnC8CuYjadF
        xnHVlS10k0iuhcuUY0Xz3g==
X-Google-Smtp-Source: ABdhPJw60rqCelx2mp91ncWb40Amd1TzGLv7/DsODaptYCGeZkydx+txWYPPmDfGFarzDpWdd6Hm8g==
X-Received: by 2002:a05:6e02:46:: with SMTP id i6mr16376091ilr.298.1589818683086;
        Mon, 18 May 2020 09:18:03 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w70sm4947206ili.78.2020.05.18.09.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:18:02 -0700 (PDT)
Received: (nullmailer pid 27971 invoked by uid 1000);
        Mon, 18 May 2020 16:18:01 -0000
Date:   Mon, 18 May 2020 10:18:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: mstp: Convert to json-schema
Message-ID: <20200518161801.GA9983@bogus>
References: <20200508100321.6720-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508100321.6720-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 08, 2020 at 12:03:21PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Clock Pulse Generator (CPG) Module Stop (MSTP)
> Clocks Device Tree binding documentation to json-schema.
> 
> Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> bindings.
> Replace the obsolete example for R-Car H2 by an example that is still
> valid.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.8.
> ---
>  .../clock/renesas,cpg-mstp-clocks.txt         | 60 --------------
>  .../clock/renesas,cpg-mstp-clocks.yaml        | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> deleted file mode 100644
> index da578ebdda2889fc..0000000000000000
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -* Renesas CPG Module Stop (MSTP) Clocks
> -
> -The CPG can gate SoC device clocks. The gates are organized in groups of up to
> -32 gates.
> -
> -This device tree binding describes a single 32 gate clocks group per node.
> -Clocks are referenced by user nodes by the MSTP node phandle and the clock
> -index in the group, from 0 to 31.
> -
> -Required Properties:
> -
> -  - compatible: Must be one of the following
> -    - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
> -    - "renesas,r8a73a4-mstp-clocks" for R8A73A4 (R-Mobile APE6) MSTP gate clocks
> -    - "renesas,r8a7740-mstp-clocks" for R8A7740 (R-Mobile A1) MSTP gate clocks
> -    - "renesas,r8a7778-mstp-clocks" for R8A7778 (R-Car M1) MSTP gate clocks
> -    - "renesas,r8a7779-mstp-clocks" for R8A7779 (R-Car H1) MSTP gate clocks
> -    - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
> -    - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2-W) MSTP gate clocks
> -    - "renesas,r8a7792-mstp-clocks" for R8A7792 (R-Car V2H) MSTP gate clocks
> -    - "renesas,r8a7793-mstp-clocks" for R8A7793 (R-Car M2-N) MSTP gate clocks
> -    - "renesas,r8a7794-mstp-clocks" for R8A7794 (R-Car E2) MSTP gate clocks
> -    - "renesas,sh73a0-mstp-clocks" for SH73A0 (SH-MobileAG5) MSTP gate clocks
> -    and "renesas,cpg-mstp-clocks" as a fallback.
> -  - reg: Base address and length of the I/O mapped registers used by the MSTP
> -    clocks. The first register is the clock control register and is mandatory.
> -    The second register is the clock status register and is optional when not
> -    implemented in hardware.
> -  - clocks: Reference to the parent clocks, one per output clock. The parents
> -    must appear in the same order as the output clocks.
> -  - #clock-cells: Must be 1
> -  - clock-output-names: The name of the clocks as free-form strings
> -  - clock-indices: Indices of the gate clocks into the group (0 to 31)
> -
> -The clocks, clock-output-names and clock-indices properties contain one entry
> -per gate clock. The MSTP groups are sparsely populated. Unimplemented gate
> -clocks must not be declared.
> -
> -
> -Example
> --------
> -
> -	#include <dt-bindings/clock/r8a7790-clock.h>
> -
> -	mstp3_clks: mstp3_clks@e615013c {
> -		compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
> -		reg = <0 0xe615013c 0 4>, <0 0xe6150048 0 4>;
> -		clocks = <&cp_clk>, <&mmc1_clk>, <&sd3_clk>, <&sd2_clk>,
> -			 <&cpg_clocks R8A7790_CLK_SD1>, <&cpg_clocks R8A7790_CLK_SD0>,
> -			 <&mmc0_clk>;
> -		#clock-cells = <1>;
> -		clock-output-names =
> -			"tpu0", "mmcif1", "sdhi3", "sdhi2",
> -			 "sdhi1", "sdhi0", "mmcif0";
> -		clock-indices = <
> -			R8A7790_CLK_TPU0 R8A7790_CLK_MMCIF1 R8A7790_CLK_SDHI3
> -			R8A7790_CLK_SDHI2 R8A7790_CLK_SDHI1 R8A7790_CLK_SDHI0
> -			R8A7790_CLK_MMCIF0
> -		>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml
> new file mode 100644
> index 0000000000000000..9b79e70ae5504bd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,cpg-mstp-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Clock Pulse Generator (CPG) Module Stop (MSTP) Clocks
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Clock Pulse Generator (CPG) can gate SoC device clocks. The gates are
> +  organized in groups of up to 32 gates.
> +
> +  This device tree binding describes a single 32 gate clocks group per node.
> +  Clocks are referenced by user nodes by the Module Stop (MSTP) node phandle
> +  and the clock index in the group, from 0 to 31.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r7s72100-mstp-clocks # RZ/A1
> +          - renesas,r8a73a4-mstp-clocks  # R-Mobile APE6
> +          - renesas,r8a7740-mstp-clocks  # R-Mobile A1
> +          - renesas,r8a7778-mstp-clocks  # R-Car M1
> +          - renesas,r8a7779-mstp-clocks  # R-Car H1
> +          - renesas,sh73a0-mstp-clocks   # SH-Mobile AG5
> +      - const: renesas,cpg-mstp-clocks
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Module Stop Control Register (MSTPCR)
> +      - description: Module Stop Status Register (MSTPSR)
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 32
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-indices:
> +    minItems: 1
> +    maxItems: 32
> +
> +  clock-output-names:
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - clock-indices
> +  - clock-output-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a73a4-clock.h>
> +    mstp2_clks: mstp2_clks@e6150138 {
> +            compatible = "renesas,r8a73a4-mstp-clocks",
> +                         "renesas,cpg-mstp-clocks";
> +            reg = <0xe6150138 0 4>, <0xe6150040 0 4>;

Size is 2 cells?

With that fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +            clocks = <&mp_clk>, <&mp_clk>, <&mp_clk>, <&mp_clk>, <&mp_clk>,
> +                     <&mp_clk>, <&cpg_clocks R8A73A4_CLK_HP>;
> +            #clock-cells = <1>;
> +            clock-indices = <
> +                    R8A73A4_CLK_SCIFA0 R8A73A4_CLK_SCIFA1
> +                    R8A73A4_CLK_SCIFB0 R8A73A4_CLK_SCIFB1
> +                    R8A73A4_CLK_SCIFB2 R8A73A4_CLK_SCIFB3
> +                    R8A73A4_CLK_DMAC
> +            >;
> +            clock-output-names =
> +                    "scifa0", "scifa1", "scifb0", "scifb1", "scifb2", "scifb3",
> +                    "dmac";
> +    };
> -- 
> 2.17.1
> 
