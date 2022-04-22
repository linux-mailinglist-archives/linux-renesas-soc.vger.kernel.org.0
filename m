Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662E850B303
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 10:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445543AbiDVIhX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 04:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiDVIhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 04:37:22 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46B252E77;
        Fri, 22 Apr 2022 01:34:29 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kc12so360821qvb.0;
        Fri, 22 Apr 2022 01:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=06iECEq1zQndlMR7mMQtp+hvIytw9rPulWZWvzCfKtU=;
        b=3JFh8WSaKdM7+RZtIXtHewTS/DGzYrhUHiLVNsA3FrbFe36XY0xwPAkMf7IJNZ736c
         b/OSa1cyNd5IG9VcMc2iNcHmxGKiC4qFvuSrK8uq0OAwFVGeb2wrJTP7ILHJcGqV+1Xg
         ocaa5SXIqNOqNceTHaxdjl67cVDM+40bVKkuy77eZkgGfUqAQhLXE4G7h1Flb5dqWpzB
         lhJMBvWcM53bQPZuFJb+1p8HuYr7Z6LQ4x9UkOjDXyU/DIOUqEzZxAGIwY06H1lKvm/N
         dSORwZBc+w5BYkw8OH0MfaTEzByEhNfbNIY4HSazJN5RgitNVj7PvX7yg86I85qvcjEc
         87mQ==
X-Gm-Message-State: AOAM530N+cdL1CCVMM/sDdUlm4LIFeNZOdgYgeAw6Ljc379WgES2/DPf
        bnotszRKftRz3dsB03qAlwPQ83IXDW7dIA==
X-Google-Smtp-Source: ABdhPJywbtbOEIS+zxdC0tq/WmptA8U//VDUHMqC6FQUXSZbOK5FJA8OGWI0xb/9BojDsmnRxE8qTw==
X-Received: by 2002:a05:6214:2589:b0:446:5229:bc02 with SMTP id fq9-20020a056214258900b004465229bc02mr2517530qvb.15.1650616468626;
        Fri, 22 Apr 2022 01:34:28 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id n3-20020a05620a152300b0069ec409e679sm624400qkk.48.2022.04.22.01.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 01:34:27 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id w20so7015595ybi.8;
        Fri, 22 Apr 2022 01:34:27 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr3528644yba.546.1650616467326; Fri, 22
 Apr 2022 01:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com> <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
 <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 10:34:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
Message-ID: <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Apr 22, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L
> > DU bindings
> > On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The RZ/G2L LCD controller is composed of Frame Compression Processor
> > > (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > The DU module supports the following hardware features − Display
> > > Parallel Interface (DPI) and MIPI LINK Video Interface − Display
> > > timing master − Generates video timings − Selecting the polarity of
> > > output DCLK, HSYNC, VSYNC, and DE − Supports Progressive − Input data
> > > format (from VSPD): RGB888, RGB666 − Output data format: same as Input
> > > data format − Supporting Full HD (1920 pixels x 1080 lines) for
> > > MIPI-DSI Output − Supporting WXGA (1280 pixels x 800 lines) for
> > > Parallel Output
> > >
> > > This patch document DU module found on RZ/G2L LCDC.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -0,0 +1,159 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Renesas RZ/G2L Display Unit (DU)
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  These DT bindings describe the Display Unit embedded in the Renesas
> > > +RZ/G2L
> > > +  and RZ/V2L SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> > > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> >
> > Please use the format "<manuf>,<soc>-<modulo>" for new bindings.
> >
>
> OK.
>
> > I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as the
> > only difference is a wiring difference due to the limited number of pins on
> > the RZ/G2LC package, as per your confirmation[1]?
> > Hence please just use "renesas,r9a07g044-du".
>
> I cross checked HW manual, on the overview section(page 69) Supported
> DU channels on various SoC's are as below
>
> RZ/{G2L,V2L}
> − 1 channel MIPI DSI interface or 1channel parallel output interface selectable,
>
> RZ/G2LC
> − 1 channel MIPI DSI interface
>
> RZ/G2UL ( From RZ/G2UL hardware manual overview)
> − 1 channel parallel output interface.
>
> >
> > Do you want a family-specific compatible value ("rzg2l-"), as this IP block
> > is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?
>
> May be will conclude after the above discussion??

I don't insist on family-specific compatible values here, as the DUs on
RZ/G2UL and RZ/V2L may differ.
But RZ/G2L and RZ/G2LC are identical otherwise...

> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r9a07g044c
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DSI 0
> > > +          required:
> > > +            - port@0
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r9a07g044l
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DPAD 0
> > > +            port@1:
> > > +              description: DSI 0
> > > +          required:
> > > +            - port@0
> > > +            - port@1
> >
> > Having different port numbers for the common DSI0 output indeed complicates
> > matters ;-)
>
> But we could delete as per [1] for RZ/G2LC where it supports only DSI and [2] for RZ/G2UL where it supports only DPI, right?
>
> [1] https://github.com/renesas-rz/rz_linux-cip/blob/rz-5.10-cip1/arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi#L24
>
> [2] https://github.com/renesas-rz/rz_linux-cip/blob/rz-5.10-cip1/arch/arm64/boot/dts/renesas/r9a07g043.dtsi#L1000

Yes we can. But as the internal hardware is the same, I think we
should keep the port numbers the same on RZ/G2L and RZ/G2LC.

For RZ/V2L, you probably want to treat it exactly the same as RZ/G2L,
i.e., the same port numbering.

For RZ/G2UL, you can use a different numbering, assuming no
family-specific compatible value is introduced.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
