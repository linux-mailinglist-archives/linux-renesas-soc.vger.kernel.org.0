Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2674968FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Jan 2022 02:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbiAVBBm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jan 2022 20:01:42 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38741 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiAVBBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 20:01:42 -0500
Received: by mail-ot1-f41.google.com with SMTP id k13-20020a056830150d00b0059c6afb8627so11672418otp.5;
        Fri, 21 Jan 2022 17:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fdCWrFnYkvsx5bAjGhnOrbY0iI/VvlRTaU4X50Qjvg=;
        b=WLNIROkPxWAo5fWYJIngyv64o9EP8LUW5OYugtTunKD5tgcyopFhVsVXAye5Sh+8Yv
         gg6p9hjKgwfhS34ht1jzjkJcBDhFWPLIepyLEYTjISVM2l/BV85mohXLva2mCDrOoOqH
         aMHcm5D10IzpRXwMTRdWS739w193qRssRPqALcPXUE8P7+k6Yn6vcHYWfHI6MePsgSwH
         PtOyZJ1u41jwxwsRmSok1RY6ShujdDuO6mURvlpRT4jllpEvHxtGa9rPrl3rPVZ7NZ7S
         sx+ss+n4O0SE0Iy7vlo8hrO7J9TY5D4hypSxUJ9BUEJ9r2lKosqFJzWGIaScKC1+z9Da
         Mmug==
X-Gm-Message-State: AOAM531Ly4qNLzoGkg6cFlkDf8e9Nh/65hhWkP1uiXRIaRY7pBL53luA
        GfrnG/4h2MZQMiFdHYkRxw==
X-Google-Smtp-Source: ABdhPJxlc6CJfKG6jVxmsxxQhJRn8lNO5gIlSlOlDWB1Na4g2LCrztdFhL+GsnEBL6a00HN1Go3e8Q==
X-Received: by 2002:a9d:7114:: with SMTP id n20mr4670444otj.84.1642813301981;
        Fri, 21 Jan 2022 17:01:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f6sm1457338oos.7.2022.01.21.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 17:01:41 -0800 (PST)
Received: (nullmailer pid 1963660 invoked by uid 1000);
        Sat, 22 Jan 2022 01:01:40 -0000
Date:   Fri, 21 Jan 2022 19:01:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC 17/28] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <YetXdDHGnHDV2LSM@robh.at.kernel.org>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 12, 2022 at 05:46:01PM +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l RZ/G2L.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 13efea574584..fc050b1088f3 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -824,6 +825,59 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: LCDC Main clock
> +            - description: LCDC Register Access Clock
> +            - description: LCDC Video Clock
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +            - const: pclk
> +            - const: vclk
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          minItems: 1

The minimum number of items is 1 by default if not otherwise specified.

maxItems: 1 ???

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.17.1
> 
> 
