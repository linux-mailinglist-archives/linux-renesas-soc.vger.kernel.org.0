Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62754EA468
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 03:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiC2BFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Mar 2022 21:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiC2BFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Mar 2022 21:05:04 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653D3D49;
        Mon, 28 Mar 2022 18:03:22 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so17161125fac.7;
        Mon, 28 Mar 2022 18:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WqdeoowukI4GOOScgfXJxtzumhshPQliLbbvvYlwjuE=;
        b=JaLz7WclRVXI38iw8fVHlWWKYxNqI4rFkjIRKEqxSfVnRT3Qet/VVAqK29isPvSDx/
         knGXLj8pgVdLXAviiNmr8k5STP7fYKmMcx5tuydGAai12+ggcal5NW7IwsPLEgYgyIuV
         CrbrdPQRgtS+aaysfxf5kJc/ARhnI+7EWOHZZtaI9Xdytm1gshByMMKMv5Me3JaTH2eS
         BHaVti3SXwO1uVBcpRqU7Up95bnQIfeIzofoQdGv7XULBE6sGsgiO3TAgXfqxajFkcxL
         IzMKm2r7kQB1F1EDNolCGKFzCeZHpfJ9DZB83VyQBIeB0G6RNizToa4C+1j+Ct9rk5d4
         Z64w==
X-Gm-Message-State: AOAM533zNCEv+rzUoZ227ISBE+Q+EO0Rng0bo/EUhvtbtZvwl3DXEFa5
        5G+eeC2KghjtsA4RZzvluGphc7Fnew==
X-Google-Smtp-Source: ABdhPJxVw7hTnrsgTjFG/lNeL9wfFbY+EmJgV5O2no4mHIVJi5WnXqNYiLrxCo6nPwg0hewhyQe2Ww==
X-Received: by 2002:a05:6870:f104:b0:da:b3f:2b62 with SMTP id k4-20020a056870f10400b000da0b3f2b62mr956039oac.257.1648515799891;
        Mon, 28 Mar 2022 18:03:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 12-20020a05687012cc00b000de97cc1beesm6529315oam.43.2022.03.28.18.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:03:19 -0700 (PDT)
Received: (nullmailer pid 3403807 invoked by uid 1000);
        Tue, 29 Mar 2022 01:03:18 -0000
Date:   Mon, 28 Mar 2022 20:03:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Message-ID: <YkJa1oLSEP8R4U6y@robh.at.kernel.org>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-3-phil.edworthy@renesas.com>
 <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
 <TYYPR01MB70862B27A67D868B196A70E7F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <4297b8c2-1958-9abb-7d93-0e6d283b6194@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4297b8c2-1958-9abb-7d93-0e6d283b6194@kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 23, 2022 at 03:54:42PM +0100, Krzysztof Kozlowski wrote:
> On 23/03/2022 15:44, Phil Edworthy wrote:
> > Hi Krzysztof,
> > 
> > Thanks for the review.
> > 
> > On 23 March 2022 10:42, Krzysztof Kozlowski wrote:
> >> On 21/03/2022 16:42, Phil Edworthy wrote:
> >>> Add DT binding documentation for System Configuration (SYS) found on
> >>> RZ/V2M SoC's.
> >>>
> >>> SYS block contains the SYS_VERSION register which can be used to
> >> retrieve
> >>> SoC version information.
> >>>
> >>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> >>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>
> >> Could you send reviewed-by tags publicly? Maybe there was internal
> >> review, maybe not and it was just copy-pasted to all submissions...
> > Yes, it was reviewed internally.
> > We've done it like this for a while, I'll see what we can do to change
> > the way we do it. Would just copying the person who reviewed it be
> > enough?
> > 
> >>> ---
> >>>  .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
> >>>  1 file changed, 39 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m-
> >> sys.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-
> >> sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> >>> new file mode 100644
> >>> index 000000000000..1a58906336b8
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> >>> @@ -0,0 +1,39 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
> >>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>> +
> >>> +title: Renesas RZ/V2M System Configuration (SYS)
> >>> +
> >>> +maintainers:
> >>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> >>> +
> >>> +description:
> >>> +  The RZ/V2M System Configuration (SYS) performs system control of the
> >> LSI
> >>> +  and supports the following functions,
> >>> +  - LSI version
> >>> +  - 34-bit address space access function
> >>> +  - PCIe related settings
> >>> +  - WDT stop control
> >>> +  - Temperature sensor (TSU) monitor
> >>
> >> Usually all these are separate devices, so what does it mean that SYS is
> >> supporting these functions? Is it related to other Renesas System
> >> Controllers? For example
> >> Documentation/devicetree/bindings/power/renesas,apmu.yaml
> >> ?
> >> Why one is in power and one in arm subdirectory? Maybe you should extend
> >> existing one?
> > 
> > SYS looks like somewhere to put registers that don't have a logical home.
> > There are lots of little bits, I just listed the main functions.
> > On other Renesas SoCs, it's similar but they include power related
> > registers. Actually, I originally put it in the power directory, then
> > moved it.
> 
> The existing rzg2l-sysc looks similar and is in power. If arm location
> is conscious choice (not just placeholder), fine with me. :)

The preference is:

1) subsystem/class
2) soc/ dir

And arm/ for just top-level bindings.

Rob
