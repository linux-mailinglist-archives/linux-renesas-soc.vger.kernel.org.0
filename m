Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC8FE7E4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 02:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfJ2B6x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Oct 2019 21:58:53 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41192 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfJ2B6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 21:58:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id g81so7655841oib.8;
        Mon, 28 Oct 2019 18:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q4RdVz7jkIsOGpxhWFOxJ9E8IFbZJNIjk7B6fraIgII=;
        b=gwtNF5cz4VViEWGj6xngMOSau+jnX3ji2RNsUWv67wdztWwRrfiw/PCXxAv11dSjdg
         11IUIbIKW9lPgIVRQkok4Pw4w/0P5LO/Oc9OCT1kiPcflrkZvXGz1WfbdWrRMIqmeKXo
         +kKRntFlZ2hnn1w1Au5j1Lok0wG0xYvwctY2hFAHrv80+jLr8lIJnW470xdOw6v0+/ph
         GAoVgp+ygUHEmwAPyNNfX6JVX0cS/f9MlUFeBS7rGTDWduVT94Rcn1vW3I4pF1CX8MK7
         L9UqhZgGGTVm0/EMAi8aLitzjUA8nV764wMHi04A35VbBvVffDQ36TAfa+OyN+ltl2Ny
         MTSQ==
X-Gm-Message-State: APjAAAWzAccqu/kC1PHTtFC436o+lHarJhly5pXG3w515Se2G3sER6pZ
        8nenmfwsGciAyRAReXnphg==
X-Google-Smtp-Source: APXvYqyeLHJ2d2ap0NSLJ0gqOBva5Ecg8fSu8azZXOEJQSXbLXQAU79jzstSSsvVnvAazebX4foX/w==
X-Received: by 2002:aca:4b0d:: with SMTP id y13mr1731732oia.151.1572314331039;
        Mon, 28 Oct 2019 18:58:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm3481304oig.25.2019.10.28.18.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 18:58:50 -0700 (PDT)
Date:   Mon, 28 Oct 2019 20:58:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas: usb3-phy: convert bindings to
 json-schema
Message-ID: <20191029015849.GA8521@bogus>
References: <1571387954-23446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571387954-23446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 18, 2019 at 05:39:14PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car generation 3 USB 3.0 PHY bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 52 --------------
>  .../devicetree/bindings/phy/renesas,usb3-phy.yaml  | 80 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> deleted file mode 100644
> index 0fe433b..00000000
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -* Renesas R-Car generation 3 USB 3.0 PHY
> -
> -This file provides information on what the device node for the R-Car generation
> -3 and RZ/G2 USB 3.0 PHY contain.
> -If you want to enable spread spectrum clock (ssc), you should use USB_EXTAL
> -instead of USB3_CLK. However, if you don't want to these features, you don't
> -need this driver.
> -
> -Required properties:
> -- compatible: "renesas,r8a774a1-usb3-phy" if the device is a part of an R8A774A1
> -	      SoC.
> -	      "renesas,r8a774b1-usb3-phy" if the device is a part of an R8A774B1
> -	      SoC.
> -	      "renesas,r8a7795-usb3-phy" if the device is a part of an R8A7795
> -	      SoC.
> -	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
> -	      SoC.
> -	      "renesas,r8a77965-usb3-phy" if the device is a part of an
> -	      R8A77965 SoC.
> -	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 or RZ/G2
> -	      compatible device.
> -
> -	      When compatible with the generic version, nodes must list the
> -	      SoC-specific version corresponding to the platform first
> -	      followed by the generic version.
> -
> -- reg: offset and length of the USB 3.0 PHY register block.
> -- clocks: A list of phandles and clock-specifier pairs.
> -- clock-names: Name of the clocks.
> -  - The funcional clock must be "usb3-if".
> -  - The usb3's external clock must be "usb3s_clk".
> -  - The usb2's external clock must be "usb_extal". If you want to use the ssc,
> -    the clock-frequency must not be 0.
> -- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> -
> -Optional properties:
> -- renesas,ssc-range: Enable/disable spread spectrum clock (ssc) by using
> -		     the following values as u32:
> -			- 0 (or the property doesn't exist): disable the ssc
> -			- 4980: enable the ssc as -4980 ppm
> -			- 4492: enable the ssc as -4492 ppm
> -			- 4003: enable the ssc as -4003 ppm
> -
> -Example (R-Car H3):
> -
> -	usb-phy@e65ee000 {
> -		compatible = "renesas,r8a7795-usb3-phy",
> -			     "renesas,rcar-gen3-usb3-phy";
> -		reg = <0 0xe65ee000 0 0x90>;
> -		clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
> -		clock-names = "usb3-if", "usb3s_clk", "usb_extal";
> -	};
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> new file mode 100644
> index 00000000..42239e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only
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
> +    oneOf:

Don't need the oneOf here.

> +      - items:
> +          - enum:
> +              - renesas,r8a774a1-usb3-phy # RZ/G2M
> +              - renesas,r8a774b1-usb3-phy # RZ/G2N
> +              - renesas,r8a7795-usb3-phy  # R-Car H3
> +              - renesas,r8a7796-usb3-phy  # R-Car M3-W
> +              - renesas,r8a77965-usb3-phy # R-Car M3-N
> +          - const: renesas,rcar-gen3-usb3-phy
> +
> +  reg:
> +    # base address and length of the registers block for the PHY.
> +    maxItems: 1
> +
> +  clocks:
> +    # A list of phandles and clock-specifier pairs.
> +    maxItems: 3
> +
> +  clock-names:
> +    # If you want to use the ssc, the clock-frequency of usb_extal
> +    # must not be 0.
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
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Enable/disable spread spectrum clock (ssc) by using the following values
> +       - 0 (or the property doesn't exist): disable the ssc
> +       - 4980: enable the ssc as -4980 ppm
> +       - 4492: enable the ssc as -4492 ppm
> +       - 4003: enable the ssc as -4003 ppm

Make these values a schema. You'll need the $ref under an 'allOf' when 
you do.

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
> +        clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
> +        clock-names = "usb3-if", "usb3s_clk", "usb_extal";
> +        #phy-cells = <0>;
> +    };
> -- 
> 2.7.4
> 
