Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E22351347F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiD1NJC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346826AbiD1NJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:09:01 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC89AFB10;
        Thu, 28 Apr 2022 06:05:47 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id j6so3490486qkp.9;
        Thu, 28 Apr 2022 06:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ttH1Nv2HCHZpt36lRw9MzlWk+TJVjhDzKAszglhsEwQ=;
        b=HXbyToE7L/gZCnegJslrwwonMylR+4+901jXq7Y/YYG5+uOzkHPfqJngxQhF0Q1q4g
         YFhlVbG33aAWXG8lIjTQ/m93es/7h1wQXTiUw/pB7JQdI+GIcs/H9E6kpOLaF8HIVrEI
         yYIedlMY1l9bKBiHUNNkSdNJeJd00GOXe2Vou/bOSAhDAetWhKT0TroOUsMUWRl73cBO
         Oj7GYJ2d9uTgtEEZOvThv9Gg1VCj1OeN+IOqb0T2NISKW2hAASJWIBd7mJuMPreZhlzT
         QqIlM/ol340zh3vUEq2815YqUx2DgZbkfgOWWPVpcbj+g/U0XlXsO9C4Y8Igk3fQIyBo
         lRsg==
X-Gm-Message-State: AOAM533k2r2C5ITe9IJDe12pMpMGEP0OmPtSfsk78T7ZM2fQQv8OiKVn
        u/LCtLH0iwXvIWZWQj+bVQSOQYUORQhS9w==
X-Google-Smtp-Source: ABdhPJxKw3IOQHrqrqYIMctsNfYES+mG4PF43SQ+tc+tLARs1ICkljhcOulOuORNSFoSfe1ZKf7ziA==
X-Received: by 2002:a37:9bce:0:b0:69f:9578:8ca9 with SMTP id d197-20020a379bce000000b0069f95788ca9mr4253076qke.170.1651151145982;
        Thu, 28 Apr 2022 06:05:45 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id o189-20020a375ac6000000b0069f73d3b544sm4427391qkb.43.2022.04.28.06.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:05:45 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7c424c66cso52443107b3.1;
        Thu, 28 Apr 2022 06:05:45 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr32121651ywi.449.1651151144901; Thu, 28
 Apr 2022 06:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426064002.9411-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX5k5nsczGBPrO8HTio_8yONyLbs6JYBDBBLGrv0nzvMw@mail.gmail.com> <OS0PR01MB5922AB2A88DF1BA3751F2A8086FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922AB2A88DF1BA3751F2A8086FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:05:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1qY2=KjiWYtOdrVNM0pMsJe=qEdk2QGbvd9qaDe4d+w@mail.gmail.com>
Message-ID: <CAMuHMdU1qY2=KjiWYtOdrVNM0pMsJe=qEdk2QGbvd9qaDe4d+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Apr 28, 2022 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external
> > clk node names
> > On Tue, Apr 26, 2022 at 8:40 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add suffix '-clk' for can and extal clk node names and replace the clk
> > > node names audio_clk{1,2} with clk-{1,2} as per the device tree
> > > specification.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > >                 compatible = "fixed-clock";
> > >                 #clock-cells = <0>;
> > >                 /* This value must be overridden by boards that provide
> > it */
> > >                 clock-frequency = <0>;
> > >         };
> > >
> > > -       /* External CAN clock - to be overridden by boards that provide
> > it */
> > > -       can_clk: can {
> > > +       audio_clk2: clk-2 {
> >
> > audio_clk2: audio-2clk?
>
> OK, you mean like audio_clk1, "audio_clk2: audio2-clk"
> as "2clk" is not generic name for clk?

Oops, indeed.
Sorry, my review fingers are becoming overloaded ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
