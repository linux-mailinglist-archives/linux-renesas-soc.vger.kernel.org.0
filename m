Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637EFE8F8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 19:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfJ2Sur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 14:50:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41111 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbfJ2Sur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 14:50:47 -0400
Received: by mail-oi1-f193.google.com with SMTP id g81so9851242oib.8;
        Tue, 29 Oct 2019 11:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eiPw4ihZJZyxkZzZL/o80FYs9Y+kN2orjVWNIlZQxS8=;
        b=Jt8j/EDfVk+Ir+eSgeumrB4v3vP80gVTYQJksSUi/nZ0n81CIUDZRDCuz16YiZObf/
         CJv2oXcZsxrCAn78DyhqrTr+VjIIrlbBMOAMIlAcflgpIfniL2UoY5EyUq0fLPX8Tt05
         9sVQIS8r672E1KKinBqYflWeSh6VfouuMN6417gJbaVo4pcAryRT1FIa3m+TjWKxt76P
         7LXDo5WejlxCI92kIIy5wj1/Y1lc+Dl0ubxKQ9ROPgkUqERbTwkIx8YLqZVUG0weEh5y
         t5tHMT8h62lD7NHa8nbWetxMYu+V9dWygwZHZDD0ohc5nPF2jRxqnzbXC7s17S7mhFWg
         LWnA==
X-Gm-Message-State: APjAAAUnJUn5d71u5GQQYlZAAYoI0tMH5la9IGyRgDDBPaxA9joz+/zt
        kcptqrdrTL/SuacdSBLCDA==
X-Google-Smtp-Source: APXvYqzame0vkPI6cZV370kIUuNq9vK0KAJTt+fuwAkBj510QiKOB1IN8NiuULQw4I3ovqN6k8ZY3Q==
X-Received: by 2002:aca:d18:: with SMTP id 24mr5660077oin.56.1572375046286;
        Tue, 29 Oct 2019 11:50:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm4800377oto.2.2019.10.29.11.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 11:50:45 -0700 (PDT)
Date:   Tue, 29 Oct 2019 13:50:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: renesas: usb3-peri: convert bindings
 to json-schema
Message-ID: <20191029185045.GA13527@bogus>
References: <1571818816-13941-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571818816-13941-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 23, 2019 at 05:20:16PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas USB 3.0 Peripheral controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/renesas,usb3-peri.txt  | 65 ---------------
>  .../devicetree/bindings/usb/renesas,usb3-peri.yaml | 92 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml


> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> new file mode 100644
> index 00000000..489a8cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,usb3-peri.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas USB 3.0 Peripheral controller
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need oneOf here.

> +      - items:
> +          - enum:
> +              - renesas,r8a774a1-usb3-peri # RZ/G2M
> +              - renesas,r8a774b1-usb3-peri # RZ/G2N
> +              - renesas,r8a774c0-usb3-peri # RZ/G2E
> +              - renesas,r8a7795-usb3-peri  # R-Car H3
> +              - renesas,r8a7796-usb3-peri  # R-Car M3-W
> +              - renesas,r8a77965-usb3-peri # R-Car M3-N
> +              - renesas,r8a77990-usb3-peri # R-Car E3
> +          - const: renesas,rcar-gen3-usb3-peri
> +
> +  reg:
> +    # Base address and length of the register for the USB 3.0 Peripheral
> +    maxItems: 1
> +
> +  interrupts:
> +    # Interrupt specifier for the USB3.0 Peripheral
> +    maxItems: 1
> +
> +  clocks:
> +    # clock phandle and specifier pair
> +    maxItems: 1
> +
> +  phys:
> +    description: phandle + phy specifier pair.

maxItems: 1

And can drop the description

> +
> +  phy-names:
> +    const: usb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  usb-role-switch:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Support role switch. See usb/generic.txt.
> +
> +  companion:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      See usb/generic.txt.
> +
> +  port:
> +    description: |
> +      any connector to the data bus of this controller should be modelled
> +      using the OF graph bindings specified in bindings/graph.txt, if the
> +      "usb-role-switch" property is used.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a774c0-sysc.h>
> +
> +    usb3_peri0: usb@ee020000 {
> +        compatible = "renesas,r8a774c0-usb3-peri", "renesas,rcar-gen3-usb3-peri";
> +        reg = <0 0xee020000 0 0x400>;
> +        interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 328>;
> +        companion = <&xhci0>;
> +        usb-role-switch;
> +
> +        port {
> +            usb3_role_switch: endpoint {
> +                remote-endpoint = <&hd3ss3220_ep>;
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
