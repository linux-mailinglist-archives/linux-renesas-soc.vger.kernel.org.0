Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D9AE7E47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 02:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730296AbfJ2B5M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Oct 2019 21:57:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45398 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfJ2B5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 21:57:12 -0400
Received: by mail-oi1-f195.google.com with SMTP id k2so2543582oij.12;
        Mon, 28 Oct 2019 18:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UUvsimCWepZAnu4Afn/bbCgm53OKcJoilG//7RIuHsg=;
        b=iRuK7P4JlwgjNx2UilTnYZC8yt72wuwI0f7o3uBvYYvW+k6B60ac4ekq25iZsxJMzI
         Bb9Q+qJhgHAVqEhWfEuaw7iLy7RO95xd5MxMnp7nYL9zgpzQ6O00MXbVxS2I8IisqksZ
         mSSRWIgX35wtaMHxO3jT8KUvTlUBkxEG8rxvSQe4gdA0LjAEWRJZhYl4NI3/aDynDApu
         +lWq7QID2gfr0u2caERXCQ0Ay49jwByUHXIxm4hNblr1YRXzNv+X4lQonDPnlXnUCyku
         W64LkYiZWRx/2AjeXOHfJmOcxzRAJOyWU2TGJhGNYNi8TgwSyhox+q7soubwv4sFeWP9
         M/MQ==
X-Gm-Message-State: APjAAAUYchHzgw3IZvafEYwExHAikY7Tc41OrqSkdjKXTbx6M8JF/pCd
        XciF5nk1UMYVnTZwPu7y3A==
X-Google-Smtp-Source: APXvYqxkbrUEED6jWLHlJsz7uKLNRWrYdrAjFf7ywC8zRjX5a6SE2q7TJluJR4FujLl9xIx8TCkqYw==
X-Received: by 2002:a05:6808:341:: with SMTP id j1mr1814643oie.106.1572314230268;
        Mon, 28 Oct 2019 18:57:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s66sm4217236otb.65.2019.10.28.18.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 18:57:09 -0700 (PDT)
Date:   Mon, 28 Oct 2019 20:57:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to
 json-schema
Message-ID: <20191029015708.GA29561@bogus>
References: <1571387933-23397-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571387933-23397-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 18, 2019 at 05:38:53PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 --------------
>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 106 +++++++++++++++++++++
>  2 files changed, 106 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml


> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> new file mode 100644
> index 00000000..0f109c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car generation 3 USB 2.0 PHY
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

This:

> +      - items:
> +          - enum:
> +              - renesas,usb2-phy-r8a77470 # RZ/G1C

You can simplify to just:

         - const: renesas,usb2-phy-r8a77470 # RZ/G1C

> +      - items:
> +          - enum:
> +              - renesas,usb2-phy-r7s9210  # RZ/A2
> +              - renesas,usb2-phy-r8a774a1 # RZ/G2M
> +              - renesas,usb2-phy-r8a774b1 # RZ/G2N
> +              - renesas,usb2-phy-r8a774c0 # RZ/G2E
> +              - renesas,usb2-phy-r8a7795  # R-Car H3
> +              - renesas,usb2-phy-r8a7796  # R-Car M3-W
> +              - renesas,usb2-phy-r8a77965 # R-Car M3-N
> +              - renesas,usb2-phy-r8a77990 # R-Car E3
> +              - renesas,usb2-phy-r8a77995 # R-Car D3
> +          - const: renesas,rcar-gen3-usb2-phy
> +
> +  reg:
> +    # base address and length of the registers block for the PHY.
> +    maxItems: 1
> +
> +  clocks:
> +    # clock phandle and specifier pair(s).
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    # for RZ/A2
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: fck
> +      - const: usb_x1
> +
> +  '#phy-cells':
> +    # see phy-bindings.txt in the same directory

Drop this so we don't have to fix later.

> +    enum: [0, 1]  # and 0 is deprecated.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2

Needs 'items' to define each entry.

> +
> +  vbus-supply:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Can drop this, *-supply already has a type.

> +    description: |
> +      Phandle to a regulator that provides power to the VBUS. This regulator
> +      will be managed during the PHY power on/off sequence.
> +
> +  renesas,no-otg-pins:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      specify when a board does not provide proper otg pins.
> +
> +  dr_mode:
> +    $ref: /schemas/types.yaml#/definitions/string

I think we already have a common definition, so just 'true' is enough.

> +    description: |
> +      indicates the working mode for the PHY. Can be "host", "peripheral", or
> +      "otg". Should be set if otg controller is not used.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    usb-phy@ee080200 {
> +        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
> +        reg = <0 0xee080200 0 0x700>;
> +        interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 703>;
> +        #phy-cells = <1>;
> +    };
> +
> +    usb-phy@ee0a0200 {
> +        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
> +        reg = <0 0xee0a0200 0 0x700>;
> +        clocks = <&cpg CPG_MOD 702>;
> +        #phy-cells = <1>;
> +    };
> -- 
> 2.7.4
> 
