Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9992B51001B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 16:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347148AbiDZOOS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 10:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238833AbiDZOOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 10:14:17 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECAD13FA2;
        Tue, 26 Apr 2022 07:11:10 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id q13so5217938qvk.3;
        Tue, 26 Apr 2022 07:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VY1kXbQ/wOq9U7OFoF+5Hf0l+1nWsIjVQzkbZgOMZe0=;
        b=m0yVAySepfZ5wcGkPI975T81YBXsqpKIZmds8ILuMWDFzwBEaz476XERFPwwt+h0kG
         +ILVhNoeYh37oqB4rP2dEtuv6dbsVFKy13Vw4PRnSx/VMrjzNoEz//gye6rw7VzU+8qg
         zD6y7oFCSiDUn98fLhWQnHm/yQNkUO8h5P7Jf+rPnnhX4COpWJ33uCddYygDZ+RUpCVJ
         RZ5BGfQkWruIoYcpD7v46qPW0/HIByGiSHVhQcLlVI0I/2nvNY+h4vIsIqx7LC+ITwjR
         AFxj99BcuVk4ygSmWxeeZ320LhfllDqRJub1a0OnPXHf5hN9tUTqpsL1g6NRa5qB3IX6
         Sw3Q==
X-Gm-Message-State: AOAM532z4fnzNnb3LC5l+tdZ0Hw1EfLNqs5QFYl93vR6aC9AFNjVB9fP
        JFtBXeaIXOoTr93faV5EM6BRmJc2/TBKwQ==
X-Google-Smtp-Source: ABdhPJzAV0q9tzPtwsBYG0YZAuFskxQLO0f3GsN2YjmYmJbn6f+Wpj6hEr+XvhJY19V72ZKJ0a3MRQ==
X-Received: by 2002:ad4:5cc4:0:b0:456:32d2:faa3 with SMTP id iu4-20020ad45cc4000000b0045632d2faa3mr8923238qvb.31.1650982269050;
        Tue, 26 Apr 2022 07:11:09 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id l130-20020a37a288000000b0069e8290f28asm6595882qke.97.2022.04.26.07.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 07:11:08 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id s30so5195680ybi.8;
        Tue, 26 Apr 2022 07:11:08 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr20651249ybp.613.1650982268367; Tue, 26
 Apr 2022 07:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-3-phil.edworthy@renesas.com> <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
 <TYYPR01MB70862B27A67D868B196A70E7F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <4297b8c2-1958-9abb-7d93-0e6d283b6194@kernel.org> <YkJa1oLSEP8R4U6y@robh.at.kernel.org>
In-Reply-To: <YkJa1oLSEP8R4U6y@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 16:10:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZPHV0NgfbNfRpzbFafL2jSLgL+jS3q4B7zr7x4MNbhQ@mail.gmail.com>
Message-ID: <CAMuHMdUZPHV0NgfbNfRpzbFafL2jSLgL+jS3q4B7zr7x4MNbhQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 3:03 AM Rob Herring <robh@kernel.org> wrote:
> On Wed, Mar 23, 2022 at 03:54:42PM +0100, Krzysztof Kozlowski wrote:
> > On 23/03/2022 15:44, Phil Edworthy wrote:
> > > On 23 March 2022 10:42, Krzysztof Kozlowski wrote:
> > >> On 21/03/2022 16:42, Phil Edworthy wrote:
> > >>> Add DT binding documentation for System Configuration (SYS) found on
> > >>> RZ/V2M SoC's.
> > >>>
> > >>> SYS block contains the SYS_VERSION register which can be used to
> > >> retrieve
> > >>> SoC version information.
> > >>>
> > >>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > >>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>
> > >> Could you send reviewed-by tags publicly? Maybe there was internal
> > >> review, maybe not and it was just copy-pasted to all submissions...
> > > Yes, it was reviewed internally.
> > > We've done it like this for a while, I'll see what we can do to change
> > > the way we do it. Would just copying the person who reviewed it be
> > > enough?
> > >
> > >>> ---
> > >>>  .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
> > >>>  1 file changed, 39 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m-
> > >> sys.yaml
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-
> > >> sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> > >>> new file mode 100644
> > >>> index 000000000000..1a58906336b8
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> > >>> @@ -0,0 +1,39 @@
> > >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >>> +%YAML 1.2
> > >>> +---
> > >>> +$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
> > >>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > >>> +
> > >>> +title: Renesas RZ/V2M System Configuration (SYS)
> > >>> +
> > >>> +maintainers:
> > >>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > >>> +
> > >>> +description:
> > >>> +  The RZ/V2M System Configuration (SYS) performs system control of the
> > >> LSI
> > >>> +  and supports the following functions,
> > >>> +  - LSI version
> > >>> +  - 34-bit address space access function
> > >>> +  - PCIe related settings
> > >>> +  - WDT stop control
> > >>> +  - Temperature sensor (TSU) monitor
> > >>
> > >> Usually all these are separate devices, so what does it mean that SYS is
> > >> supporting these functions? Is it related to other Renesas System
> > >> Controllers? For example
> > >> Documentation/devicetree/bindings/power/renesas,apmu.yaml
> > >> ?
> > >> Why one is in power and one in arm subdirectory? Maybe you should extend
> > >> existing one?
> > >
> > > SYS looks like somewhere to put registers that don't have a logical home.
> > > There are lots of little bits, I just listed the main functions.
> > > On other Renesas SoCs, it's similar but they include power related
> > > registers. Actually, I originally put it in the power directory, then
> > > moved it.
> >
> > The existing rzg2l-sysc looks similar and is in power. If arm location
> > is conscious choice (not just placeholder), fine with me. :)
>
> The preference is:
>
> 1) subsystem/class
> 2) soc/ dir
>
> And arm/ for just top-level bindings.

Documentation/devicetree/bindings/soc/renesas/ sounds good to me!

I'll send patches to move .../arm/renesas,prr.yaml and
.../power/renesas,rzg2l-sysc.yaml to .../soc/renesas/, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
