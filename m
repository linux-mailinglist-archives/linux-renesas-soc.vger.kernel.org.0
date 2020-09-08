Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBE12622AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 00:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIHWhF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 18:37:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36966 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgIHWhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 18:37:04 -0400
Received: by mail-io1-f68.google.com with SMTP id y13so1126385iow.4;
        Tue, 08 Sep 2020 15:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XEGCZeE3BOi1Vy/zB6Lhr8daE3mhV+PxXGWtcw37oik=;
        b=DG+LrlcQdWw8v2G8z6R0CwBYW+t9f2IFYgN1xY+R2YmKk/9rE4gsvlTZORmlLuKHsT
         fZUl9NBxWdSQHHCdvJcU72soN6JaTnoNZ/sLn4Yk6ML897dFwfWI+Eq90atxZx0nwbUn
         Ex5bAQSTTt76k/1vgknyH23NeH6+hpzZkaQU/8naj5SDFVKOn01p+8bB7A42tltHZ37h
         /2gIhD/dZlHlgiWgEG3Vw2/wglJEOnLFWzOo2u5UxuU9OXfjmzFF5fWCyeek2FhXFTjw
         afwKjHbd/hFg23H7iYTWb6j300xlkkAEHgkNW/QqUfjVX54EiUR8b0/+xh7SDhnwaKLT
         C9og==
X-Gm-Message-State: AOAM5326QUweLNsikd1+LU6KyuFVgMuvzTg0amqW2fqL2CD56StcLkvo
        vXV8ViufV6K2B6y37XnUuw==
X-Google-Smtp-Source: ABdhPJxRE1bK5l7RAc1W65iRcYTFHbvJdYb8T0fmdbopH19lV/NNhhlhfN49BaPsMNi5ZfX5dh5veQ==
X-Received: by 2002:a5e:9b0e:: with SMTP id j14mr1029571iok.112.1599604623088;
        Tue, 08 Sep 2020 15:37:03 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c2sm341748ilo.7.2020.09.08.15.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:37:02 -0700 (PDT)
Received: (nullmailer pid 1062887 invoked by uid 1000);
        Tue, 08 Sep 2020 22:36:51 -0000
Date:   Tue, 8 Sep 2020 16:36:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings
 to json-schema
Message-ID: <20200908223651.GA1042906@bogus>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 24, 2020 at 03:10:49PM +0100, Biju Das wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Convert ti,hd3ss3220.txt to YAML. Updated the binding documentation
> as graph bindings of this device model Super Speed (SS) data bus to
> the Super Speed (SS) capable connector.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3: Replaced Tabs with spaces in the example section.
> v1->v2 : No change
> Ref: https://patchwork.kernel.org/patch/11669423/
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> deleted file mode 100644
> index 2bd21b22ce95..000000000000
> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -TI HD3SS3220 TypeC DRP Port Controller.
> -
> -Required properties:
> - - compatible: Must be "ti,hd3ss3220".
> - - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> - - interrupts: An interrupt specifier.
> -
> -Required sub-node:
> - - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> -   bindings of the connector node are specified in:
> -
> -	Documentation/devicetree/bindings/connector/usb-connector.yaml
> -
> -Example:
> -hd3ss3220@47 {
> -	compatible = "ti,hd3ss3220";
> -	reg = <0x47>;
> -	interrupt-parent = <&gpio6>;
> -	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> -
> -	connector {
> -		compatible = "usb-c-connector";
> -		label = "USB-C";
> -		data-role = "dual";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@1 {
> -				reg = <1>;
> -				hd3ss3220_ep: endpoint {
> -					remote-endpoint = <&usb3_role_switch>;
> -				};
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> new file mode 100644
> index 000000000000..750a099529c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI HD3SS3220 TypeC DRP Port Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |-
> +  HD3SS3220 is a USB SuperSpeed (SS) 2:1 mux with DRP port controller. The device provides Channel
> +  Configuration (CC) logic and 5V VCONN sourcing for ecosystems implementing USB Type-C. The
> +  HD3SS3220 can be configured as a Downstream Facing Port (DFP), Upstream Facing Port (UFP) or a
> +  Dual Role Port (DRP) making it ideal for any application.
> +
> +properties:
> +  compatible:
> +   const: ti,hd3ss3220
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    description: OF graph bindings (specified in bindings/graph.txt) that model
> +      SS data bus to the SS capable connector.
> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: Super Speed (SS) capable connector.
> +
> +      port@1:
> +        type: object
> +        description: Super Speed (SS) data bus.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hd3ss3220@47 {
> +                compatible = "ti,hd3ss3220";
> +                reg = <0x47>;
> +                interrupt-parent = <&gpio6>;
> +                interrupts = <3>;
> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                                reg = <0>;
> +                                hd3ss3220_in_ep: endpoint {
> +                                        remote-endpoint = <&ss_ep>;
> +                                };
> +                        };
> +                        port@1 {
> +                                reg = <1>;
> +                                hd3ss3220_out_ep: endpoint {
> +                                        remote-endpoint = <&usb3_role_switch>;
> +                                };

If you have 2 inputs muxed, then there would be 2 endpoints here? Please 
show the fullest or most complicated case for the example. The port@1 
description could be a bit better.

Rob
