Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39B50BB69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 17:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448834AbiDVPPj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 11:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449294AbiDVPPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 11:15:37 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2576C5D5E5;
        Fri, 22 Apr 2022 08:12:44 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id f14so5703230qtq.1;
        Fri, 22 Apr 2022 08:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YFL7vUw4s4gTTJ+ZHT3bb/JvWHIOBf/dbu5Vbd21s5Y=;
        b=Q+PzQIvzHJHV5SHBwlXs/IG2fTRNAATbKYRnYudKI28t5TIuaryIeV6Am7ybWDJ4Yp
         r5bz23w+6nIy37r+EOpKlmyI8EuIkTYCUvXGlO/+4earoggZSDxm/P0TThJpmSu1K9cJ
         0FOyrbwWpOxIuufwmPACMz8g7TNjLlH2DoVEvZ9Wr0UaFzjvf1VZ2/6lI49qg//HMeYD
         KS/bu9AnNpoA9XUkddj335vFnYLlQ2hmFZwDL5zevTYghEnG8C9twW/SRclSnSr8c1p3
         SAUC25ZQ7sNJ8WPuSl67XPGoc/WSEpku3I+tjqsCvxt/eySaZmV7dlKjqBB1HQrLUwaD
         pydg==
X-Gm-Message-State: AOAM533r4pN2ykjCBbQm61lKJu0O386f3ocYjVFglxlrVR0RlGIyDz4j
        EnM3y4VpjYoJKlN3FL3VWk1zqW2Rl/Zw3A==
X-Google-Smtp-Source: ABdhPJwteaDnBs49ri79kNFuw7OGhOEOSmwmr5lKCIqnTwjJpbMMFtBV23iPTGMxeAVwXbAUNVavxA==
X-Received: by 2002:a05:622a:2d0:b0:2f3:441b:d31c with SMTP id a16-20020a05622a02d000b002f3441bd31cmr3607101qtx.82.1650640363136;
        Fri, 22 Apr 2022 08:12:43 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id z15-20020a05622a060f00b002e2070bf899sm1337889qta.90.2022.04.22.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:12:42 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id r189so15025044ybr.6;
        Fri, 22 Apr 2022 08:12:42 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr5142958yba.546.1650640362526; Fri, 22
 Apr 2022 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com> <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
 <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com> <OS0PR01MB5922446E9F1126BF8E06E9F286F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922446E9F1126BF8E06E9F286F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 17:12:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURrGhF=Eo3GA_PQXM-r-_NnS_knByzNptkjcb70=_AqA@mail.gmail.com>
Message-ID: <CAMuHMdURrGhF=Eo3GA_PQXM-r-_NnS_knByzNptkjcb70=_AqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Apr 22, 2022 at 11:31 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L
> > DU bindings
> > On Fri, Apr 22, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas
> > > > RZ/G2L DU bindings On Thu, Apr 21, 2022 at 6:31 PM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > The RZ/G2L LCD controller is composed of Frame Compression
> > > > > Processor (FCPVD), Video Signal Processor (VSPD), and Display Unit
> > (DU).
> > > > >
> > > > > The DU module supports the following hardware features − Display
> > > > > Parallel Interface (DPI) and MIPI LINK Video Interface − Display
> > > > > timing master − Generates video timings − Selecting the polarity
> > > > > of output DCLK, HSYNC, VSYNC, and DE − Supports Progressive −
> > > > > Input data format (from VSPD): RGB888, RGB666 − Output data
> > > > > format: same as Input data format − Supporting Full HD (1920
> > > > > pixels x 1080 lines) for MIPI-DSI Output − Supporting WXGA (1280
> > > > > pixels x 800 lines) for Parallel Output
> > > > >
> > > > > This patch document DU module found on RZ/G2L LCDC.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y
> > > > > +++ aml
> > > > > @@ -0,0 +1,159 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > > +1.2
> > > > > +---
> > > > > +$id:
> > > > > +
> > > > > +title: Renesas RZ/G2L Display Unit (DU)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > > +
> > > > > +description: |
> > > > > +  These DT bindings describe the Display Unit embedded in the
> > > > > +Renesas RZ/G2L
> > > > > +  and RZ/V2L SoCs.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> > > > > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> > > >
> > > > Please use the format "<manuf>,<soc>-<modulo>" for new bindings.
> > > >
> > >
> > > OK.
> > >
> > > > I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as
> > > > the only difference is a wiring difference due to the limited number
> > > > of pins on the RZ/G2LC package, as per your confirmation[1]?
> > > > Hence please just use "renesas,r9a07g044-du".
> > >
> > > I cross checked HW manual, on the overview section(page 69) Supported
> > > DU channels on various SoC's are as below
> > >
> > > RZ/{G2L,V2L}
> > > − 1 channel MIPI DSI interface or 1channel parallel output interface
> > > selectable,
> > >
> > > RZ/G2LC
> > > − 1 channel MIPI DSI interface
> > >
> > > RZ/G2UL ( From RZ/G2UL hardware manual overview) − 1 channel parallel
> > > output interface.
> > >
> > > >
> > > > Do you want a family-specific compatible value ("rzg2l-"), as this
> > > > IP block is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?
> > >
> > > May be will conclude after the above discussion??
> >
> > I don't insist on family-specific compatible values here, as the DUs on
> > RZ/G2UL and RZ/V2L may differ.
> > But RZ/G2L and RZ/G2LC are identical otherwise...
>
> OK, Will use
>
> compatible:
>     items:
>      - enum:
>          - renesas,r9a07g044-du # RZ/G2{L,LC}
>      - const: renesas,rzg2l-du

Please drop "renesas,rzg2l-du"...

> >
> > > > > +allOf:
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - renesas,du-r9a07g044c
> > > > > +    then:
> > > > > +      properties:
> > > > > +        ports:
> > > > > +          properties:
> > > > > +            port@0:
> > > > > +              description: DSI 0
> > > > > +          required:
> > > > > +            - port@0
> > > > > +
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - renesas,du-r9a07g044l
> > > > > +    then:
> > > > > +      properties:
> > > > > +        ports:
> > > > > +          properties:
> > > > > +            port@0:
> > > > > +              description: DPAD 0
> > > > > +            port@1:
> > > > > +              description: DSI 0
> > > > > +          required:
> > > > > +            - port@0
> > > > > +            - port@1
> > > >
> > > > Having different port numbers for the common DSI0 output indeed
> > > > complicates matters ;-)
> > >
> > > But we could delete as per [1] for RZ/G2LC where it supports only DSI and
> > [2] for RZ/G2UL where it supports only DPI, right?
> >
> > Yes we can. But as the internal hardware is the same, I think we should
> > keep the port numbers the same on RZ/G2L and RZ/G2LC.
>
> OK, Will keep the same port number for both RZ/G2L and RZ/G2LC.
>
> >
> > For RZ/V2L, you probably want to treat it exactly the same as RZ/G2L, i.e.,
> > the same port numbering.
>
> OK.
>
> >
> > For RZ/G2UL, you can use a different numbering, assuming no family-specific
> > compatible value is introduced.
>
> OK.

... as that will interfere here.  If the numbering will be SoC-specific,
the driver has to match on the SoC-specific compatible value anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
