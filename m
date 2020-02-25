Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA1316EB4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 17:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgBYQXF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 11:23:05 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44855 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbgBYQXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 11:23:05 -0500
Received: by mail-lf1-f65.google.com with SMTP id 7so10189316lfz.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2020 08:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5Dk67v+npqu0EQERfbIuN+7my2CbgWhjf5DbNvAyZJ0=;
        b=PQPl17Loc0S6TpTVmab3H2e6w0TiVNEnHmIkGPYF+kKwGu10CsKsu8PPDzZkj1qpPB
         WgkOj1YrAr4JCItxUhh6iIq3PlfkOmzOQHKn4ZQx7scePHR2/8z+6QOrbUCdhJtKmTSJ
         x82mQHhjQyupbzRiC7i1z6YUvdjrggn8SRCKpu9weHqEzTyJu18KJ8wqmAgHPmICXjdZ
         AwNUh6tljWrSquO9C4BXzhsmcyiDxUWxqpq+q9/3+FzpQpOGjlEScI5c5oR15LmF64Yh
         QAn5Nde9PUiGRt0VtxD1tqMRd+oNf3Zz/L26OImabzA5dfr92Tx9gtvJhVFuRZhjMnzn
         1s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5Dk67v+npqu0EQERfbIuN+7my2CbgWhjf5DbNvAyZJ0=;
        b=jpf1TIO88S3rk3pN53RS4QN1rUWXIMUIsEC+TrG5enUIq3OXkJS7wSvScPCIuM9BXT
         8GbLuAYeMRn8r5kUw+JdGQhDhX+PYv3evKXe0wRAy6wUCrxaNaIMGt4AhROixWya67jb
         ykg3H/OTcez1XGYS/0/R7Wtiu0pIshy8Ufq4juzSvsoz7azeAYBNGHthtaoFG/1jI/qB
         nrtFKV1MWgvc9Wy1IJtt5UwoMlX1aFygyGkNa60DywoHS307JpaEhHEA0Jt8xT3EYU7W
         0foUrI6fsUSIxUMuytwhgh7K0dWV80ysqw8GyRrD3yU/ZVZUbxUeOg5luM7JSQMbhRsw
         MB6w==
X-Gm-Message-State: APjAAAUN0v9AKRg0KVHjlH0dSm8xf5rroKzid1ChanAYQAItn0nsUujj
        j50Dg0lGaNGiA17QLDZcUgNy1g==
X-Google-Smtp-Source: APXvYqwPW6h1QKilPwRuqWez6A/erb4CBWnOzO1OLK96UKtW/skgBTn+ro2I0LdsmGFEs+G3Ox+z1Q==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr1441299lfg.62.1582647781108;
        Tue, 25 Feb 2020 08:23:01 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id z3sm8134562ljh.83.2020.02.25.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:23:00 -0800 (PST)
Date:   Tue, 25 Feb 2020 17:22:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ata: rcar-sata: Convert to json-schema
Message-ID: <20200225162259.GC3165317@oden.dyn.berto.se>
References: <20200219154146.11230-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219154146.11230-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-19 16:41:46 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Serial-ATA Device Tree binding documentation
> to json-schema.
> 
> While at it:
>   - Remove the deprecated "renesas,rcar-sata" compatible value,
>   - Add "iommus", "power-domains", and "resets" properties,
>   - Update the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Not having to care about the deprecated value simplifies the
> jscon-schema.
> ---
>  .../bindings/ata/renesas,rcar-sata.yaml       | 71 +++++++++++++++++++
>  .../devicetree/bindings/ata/sata_rcar.txt     | 36 ----------
>  2 files changed, 71 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ata/sata_rcar.txt
> 
> diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> new file mode 100644
> index 0000000000000000..7b69831060d8b9c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/ata/renesas,rcar-sata.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas R-Car Serial-ATA Interface
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,sata-r8a7779      # R-Car H1
> +      - items:
> +          - enum:
> +              - renesas,sata-r8a7790-es1  # R-Car H2 ES1
> +              - renesas,sata-r8a7790      # R-Car H2 other than ES1
> +              - renesas,sata-r8a7791      # R-Car M2-W
> +              - renesas,sata-r8a7793      # R-Car M2-N
> +          - const: renesas,rcar-gen2-sata # generic R-Car Gen2
> +      - items:
> +          - enum:
> +              - renesas,sata-r8a774b1     # RZ/G2N
> +              - renesas,sata-r8a7795      # R-Car H3
> +              - renesas,sata-r8a77965     # R-Car M3-N
> +          - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
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
> +  iommus:
> +    maxItems: 1
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7791-sysc.h>
> +
> +    sata@ee300000 {
> +            compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
> +            reg = <0xee300000 0x200000>;
> +            interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 815>;
> +            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +            resets = <&cpg 815>;
> +    };
> diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Documentation/devicetree/bindings/ata/sata_rcar.txt
> deleted file mode 100644
> index a2fbdc91570d0f7c..0000000000000000
> --- a/Documentation/devicetree/bindings/ata/sata_rcar.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -* Renesas R-Car SATA
> -
> -Required properties:
> -- compatible		: should contain one or more of the following:
> -			  - "renesas,sata-r8a774b1" for RZ/G2N
> -			  - "renesas,sata-r8a7779" for R-Car H1
> -			  - "renesas,sata-r8a7790-es1" for R-Car H2 ES1
> -			  - "renesas,sata-r8a7790" for R-Car H2 other than ES1
> -			  - "renesas,sata-r8a7791" for R-Car M2-W
> -			  - "renesas,sata-r8a7793" for R-Car M2-N
> -			  - "renesas,sata-r8a7795" for R-Car H3
> -			  - "renesas,sata-r8a77965" for R-Car M3-N
> -			  - "renesas,rcar-gen2-sata" for a generic R-Car Gen2
> -			     compatible device
> -			  - "renesas,rcar-gen3-sata" for a generic R-Car Gen3 or
> -			     RZ/G2 compatible device
> -			  - "renesas,rcar-sata" is deprecated
> -
> -			  When compatible with the generic version nodes
> -			  must list the SoC-specific version corresponding
> -			  to the platform first followed by the generic
> -			  version.
> -
> -- reg			: address and length of the SATA registers;
> -- interrupts		: must consist of one interrupt specifier.
> -- clocks		: must contain a reference to the functional clock.
> -
> -Example:
> -
> -sata0: sata@ee300000 {
> -	compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
> -	reg = <0 0xee300000 0 0x2000>;
> -	interrupt-parent = <&gic>;
> -	interrupts = <0 105 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&mstp8_clks R8A7791_CLK_SATA0>;
> -};
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
