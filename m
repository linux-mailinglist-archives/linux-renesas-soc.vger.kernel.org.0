Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B172F237B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 01:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405546AbhALAZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 19:25:51 -0500
Received: from mail-oo1-f53.google.com ([209.85.161.53]:46989 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389073AbhAKWqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:46:37 -0500
Received: by mail-oo1-f53.google.com with SMTP id n127so134314ooa.13;
        Mon, 11 Jan 2021 14:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TWzR02te5uk5MCjIEEArzIEPWl3rL9lGlci+NkzFFu0=;
        b=VYRSIIjbB+2Y/fu+jTwfKoydgPSJaPJ+QAS96bFeNj/aNgdOUDVHpGURyNUiXmpnoT
         S6qmeW0qWmDmwCCh3A4P/XQj9Wu6mzEjZZGmmnLavtaYEcPO15GMpRNDseFKFfy+sU9s
         /fXLjHkHMDPZhhdfbnNUNjHxUU6LDtZDZLE/Pl29jxvFdvYCXAddgTON93miFL4r7eF3
         u/KVqJMgNwW/EGCJplUjNDunklgzaMiv6ukn/K6ES6Elo1YMh97KRl4KAzNFxDiY4br+
         BK6cJZpz6r2wImDhKyV7SIVZPLKFwAKJ38eLzd6gQW5F9MvHAIkn0P9WirS65suCuLqQ
         RoQw==
X-Gm-Message-State: AOAM530MVS4zKXt0mkCb4wCrlL23deIFBT4wMaFGNtGc3ZUnYAuhN47i
        ZNx1ZlFzH+TINkpbAY1Cdg==
X-Google-Smtp-Source: ABdhPJxp3aLQjXnU6rPP97yT5iEdgQlltxbQWg8hftjInKb4DwHZB4Jv6tWnqIddgIZhK92E4lmH3w==
X-Received: by 2002:a4a:751a:: with SMTP id j26mr971798ooc.68.1610405155736;
        Mon, 11 Jan 2021 14:45:55 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d10sm196490ooh.32.2021.01.11.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:45:54 -0800 (PST)
Received: (nullmailer pid 3197463 invoked by uid 1000);
        Mon, 11 Jan 2021 22:45:53 -0000
Date:   Mon, 11 Jan 2021 16:45:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: bridge: Add YAML schema for
 Synopsys DW-HDMI
Message-ID: <20210111224553.GA3192268@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 05, 2021 at 08:08:13AM +0200, Laurent Pinchart wrote:
> Add a .yaml schema containing the common properties for the Synopsys
> DesignWare HDMI TX controller. This isn't a full device tree binding
> specification, but is meant to be referenced by platform-specific
> bindings for the IP core.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Add default to reg-io-width property
> - Add additionalProperties
> - Rebase on top of OF graph schema, dropped redundant properties
> - Drop cec clock as it's device-specific
> - Increase max clocks to 5 to accommodate the Rockchip DW-HDMI
> ---
>  .../display/bridge/synopsys,dw-hdmi.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..96c4bc06dbe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Synopsys DesignWare HDMI TX Controller
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This document defines device tree properties for the Synopsys DesignWare HDMI
> +  TX controller (DWC HDMI TX) IP core. It doesn't constitute a full device tree
> +  binding specification by itself but is meant to be referenced by device tree
> +  bindings for the platform-specific integrations of the DWC HDMI TX.
> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description:
> +      Width (in bytes) of the registers specified by the reg property.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 4]
> +    default: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - description: The bus clock for either AHB and APB
> +      - description: The internal register configuration clock
> +    additionalItems: true
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - const: iahb
> +      - const: isfr
> +    additionalItems: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

'ports' should probably be dropped if what each 'port' is is not defined 
here. Any users will have to define 'ports' and the child nodes.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +additionalProperties: true
> +
> +...
> -- 
> Regards,
> 
> Laurent Pinchart
> 
