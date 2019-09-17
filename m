Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55B1B54AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 19:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfIQRzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 13:55:08 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41279 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIQRzI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 13:55:08 -0400
Received: by mail-oi1-f194.google.com with SMTP id w17so3644423oiw.8;
        Tue, 17 Sep 2019 10:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=apP6EuGrN+2ThQnbuaWrR8NOtzPWwQdyNbUGXH4C9kY=;
        b=eeoIZdWTQQs2G5KkJimNl0/32P8hYJoaCwOtNq/8uo8gh4J+71Ydh0ew+tDCEFoKXB
         7Et6f1HFsbsVyqqUa1oklkrGd8W0XvaLOekQmnVLiJOrB1dt1XH/enk3ZdUfL/yziPKo
         5nzJTAN2MZVnXBRb07y7xoutAQV9t6IG1YTHS9IxpJJWgEQJCfjnuqjU3sCS00GftAk0
         eMSwtrydFMIuDHy18/gDW/704FJ3aeBObniyWHsRv/5LESFmn1H8bYIik2uyWVUUP3/+
         ipTirvZ5nx3E/7mQefqbGNXXVyUhI7swAikyBb2LtPM6qjAkcSI71GmMo3lMLfb18Z7C
         KrFw==
X-Gm-Message-State: APjAAAUmKK1LISBciUrRp2QFWzJcGbt1Dvzr3XzQwbvRGUwsHWW8gRdl
        3bwJ47FUtCNs4svdlW704Q==
X-Google-Smtp-Source: APXvYqxroo1YBuMjGZ0BOe2e6ICZ0bADExyq7TNaM4+OK8EjcRVNatn2iNeE5lPJX0K6tHBwPgEUdQ==
X-Received: by 2002:aca:c7d8:: with SMTP id x207mr4901443oif.99.1568742907207;
        Tue, 17 Sep 2019 10:55:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b4sm868738oiy.30.2019.09.17.10.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:55:06 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:55:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH v4 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190917175505.GA29276@bogus>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906135436.10622-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 06, 2019 at 03:54:28PM +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
> 
> CMM is the image enhancement module available on each R-Car DU video
> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/renesas,cmm.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.yaml b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> new file mode 100644
> index 000000000000..9e5922689cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0

For new bindings:

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,cmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Color Management Module (CMM)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
> +
> +description: |+
> +  Renesas R-Car color management module connected to R-Car DU video channels.
> +  It provides image enhancement functions such as 1-D look-up tables (LUT),
> +  3-D look-up tables (CMU), 1D-histogram generation (HGO), and color
> +  space conversion (CSC).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a7795-cmm
> +        - renesas,r8a7796-cmm
> +        - renesas,r8a77965-cmm
> +        - renesas,r8a77990-cmm
> +        - renesas,r8a77995-cmm
> +      - enum:
> +        - renesas,rcar-gen3-cmm
> +        - renesas,rcar-gen2-cmm

This allows 10 valid cases when I imagine there's only really 5. I'm 
okay leaving it, but might be better to split into 2 under a 'oneOf'.

I imagine there will be a lot of these for Renesas, so just be 
consistent.

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7796-sysc.h>
> +
> +    cmm0: cmm@fea40000 {
> +         compatible = "renesas,r8a7796-cmm";
> +         reg = <0 0xfea40000 0 0x1000>;
> +         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +         clocks = <&cpg CPG_MOD 711>;
> +         resets = <&cpg 711>;
> +    };
> --
> 2.23.0
> 
