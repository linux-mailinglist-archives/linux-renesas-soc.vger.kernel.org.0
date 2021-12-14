Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8459E474BC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 20:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhLNTVk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 14:21:40 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:37442 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhLNTVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 14:21:40 -0500
Received: by mail-ot1-f51.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so22010941otg.4;
        Tue, 14 Dec 2021 11:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+9ddLBfWJHBgIj2To9g0eYLCnZlV0ghMCRj6XN0Hhr4=;
        b=S8etXqugnOPjhEjF/G0MZYVtoIYINQKKYne7sa370JL41KPRQyrZFB7YaWpN7fMboc
         TEDWgC/V/x73HgY3V9Nmx/SMQRyTt3J3IoiLJilty9nzYQOa5nSu63ChIZh+RJi+gREf
         7vpxPgSS5le1jIDrL3A6W/yVjsSQKxiN+csjbla0VKQON1Qf4a3k9N99E1fE7QFl5fHv
         it3BfppkhKJZK08GeOeVsluuqI3J93v23RHRfq9b6tyZ+pyiTVcTQBrBufDiwqelAMgS
         zwZWLIdptz/pXFF1RTmIx1z3zj2MYw8jig5Q2Tm66kSHigklHElRKWjDfO4kyR5E0IpG
         KnpQ==
X-Gm-Message-State: AOAM530okAGzrk14/2HcHLY/jOTXGOTpPQsSqrf6GbYHd+GwCPMXGDXY
        HFFTGEKSkEJ7UY6aR9xLOQ==
X-Google-Smtp-Source: ABdhPJxnxm3aHuNvY7i5AgZRlyQlqsxgfscPXHYBrIw+RM/u/poU0w24f4VXglnn8Fd/IAduxgBgmA==
X-Received: by 2002:a9d:6394:: with SMTP id w20mr5832966otk.248.1639509699433;
        Tue, 14 Dec 2021 11:21:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v2sm133687oto.3.2021.12.14.11.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 11:21:38 -0800 (PST)
Received: (nullmailer pid 3758448 invoked by uid 1000);
        Tue, 14 Dec 2021 19:21:37 -0000
Date:   Tue, 14 Dec 2021 13:21:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Steven Price <steven.price@arm.com>,
        "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Message-ID: <YbjuwQYYO2begeDY@robh.at.kernel.org>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 10, 2021 at 02:44:06PM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping.

2 days later is not a gentle ping. If you want to check status, go look 
at PW[1]. If it is in there, it's in my queue (only about 100 patches 
ATM).

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
> 
> Cheers,
> Biju
> 
> > Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
> > support
> > 
> > The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> > add a compatible string for it.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Moved optional clock-names and reset-names to SoC-specific conditional
> > schemas.
> >  * minimum number of reset for the generic GPU is set to 1.
> >  * Documented number of clocks, resets, interrupts and interrupt-names in
> > RZ/G2L
> >    SoC-specific conditional schemas.
> > v1->v2:
> >  * Updated minItems for resets as 2
> >  * Documented optional property reset-names
> >  * Documented reset-names as required property for RZ/G2L SoC.
> > ---
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 6f98dd55fb4c..63a08f3f321d 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -19,6 +19,7 @@ properties:
> >            - amlogic,meson-g12a-mali
> >            - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> > +          - renesas,r9a07g044-mali
> >            - rockchip,px30-mali
> >            - rockchip,rk3568-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is
> > fully discoverable @@ -27,19 +28,26 @@ properties:
> >      maxItems: 1
> > 
> >    interrupts:
> > +    minItems: 3
> >      items:
> >        - description: Job interrupt
> >        - description: MMU interrupt
> >        - description: GPU interrupt
> > +      - description: Event interrupt
> > 
> >    interrupt-names:
> > +    minItems: 3
> >      items:
> >        - const: job
> >        - const: mmu
> >        - const: gpu
> > +      - const: event
> > 
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names: true
> > 
> >    mali-supply: true
> > 
> > @@ -52,7 +60,10 @@ properties:
> >      maxItems: 3
> > 
> >    resets:
> > -    maxItems: 2
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  reset-names: true
> > 
> >    "#cooling-cells":
> >      const: 2
> > @@ -94,6 +105,36 @@ allOf:
> >      then:
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a07g044-mali
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 4
> > +        interrupt-names:
> > +          minItems: 4
> > +        clocks:
> > +          minItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: gpu
> > +            - const: bus
> > +            - const: bus_ace
> > +        resets:
> > +          minItems: 3
> > +        reset-names:
> > +          items:
> > +            - const: rst
> > +            - const: axi_rst
> > +            - const: ace_rst
> > +      required:
> > +        - clock-names
> > +        - power-domains
> > +        - resets
> > +        - reset-names
> >    - if:
> >        properties:
> >          compatible:
> > --
> > 2.17.1
> 
> 
