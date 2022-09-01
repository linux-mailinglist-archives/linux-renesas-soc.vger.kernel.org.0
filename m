Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E08F5A9DB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbiIARGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 13:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbiIARGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 13:06:39 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F72180E88;
        Thu,  1 Sep 2022 10:06:37 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id jy14so8143687qvb.12;
        Thu, 01 Sep 2022 10:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R4/0vIDlliRF8NwToyf2AArqsOnJ5k9bWN6l0TOjYSk=;
        b=SPbN70XfXPtsC6AjtuL8yBLGijRO/T+TnPcSnSoy+IKJq3MIRf0om+m9KKGsYg3v/o
         UUf2S0fen+74CUThQQ+eEjQ9Cm2bpKsPVAInOBp+iSMWj3aIGUGuXgt9P4600NwsIHgM
         V9EeTc+TiFa1iVrj11mAcsWNXZlg7rWmjm7CMbwsmBLXhChNJx7FuKTZmyqhxxJXfHko
         0pqZSbG0WLGygxb78k6eWLRa+71MeAn0R7kxuXKgEbnjF9NJ1Mh98ENDfCsdkssuZ/W3
         /Hy8Y9rJUXBUkDMi0IBLFLi9JyIVVupLOo41ixK8PXvFplsP0Ph2kV8erO9Si6KKKEkg
         rGGA==
X-Gm-Message-State: ACgBeo3mxxW2o/AP+i57TK2+hvmdtJkqZUGLyNBrHiF0lOOjS3wrwaoG
        rnBPv9caMpXsSzznMgbr2dWw3Ds71bLv1w==
X-Google-Smtp-Source: AA6agR7EBtJRmOstt+6fVvVYbKzQ37vhYoiRuOK99oD2jmia67ZgLj6kUwfGDOLscVHrWA9HeMBb6g==
X-Received: by 2002:a0c:e449:0:b0:497:48d8:e4c with SMTP id d9-20020a0ce449000000b0049748d80e4cmr25571450qvm.75.1662051996340;
        Thu, 01 Sep 2022 10:06:36 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id i7-20020a05620a404700b006a6ebde4799sm12180330qko.90.2022.09.01.10.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 10:06:36 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3378303138bso343293587b3.9;
        Thu, 01 Sep 2022 10:06:35 -0700 (PDT)
X-Received: by 2002:a81:750b:0:b0:341:10ef:2c37 with SMTP id
 q11-20020a81750b000000b0034110ef2c37mr18011444ywc.316.1662051995588; Thu, 01
 Sep 2022 10:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
 <20220830164518.1381632-4-biju.das.jz@bp.renesas.com> <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
 <OS0PR01MB5922F1B7FC6D7C6249EF22B9867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F1B7FC6D7C6249EF22B9867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Sep 2022 19:06:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVUN6zzRKxqf4cwkWHF=88Fkq=tYW5PSohB_bMJ-k8Kw@mail.gmail.com>
Message-ID: <CAMuHMdVVUN6zzRKxqf4cwkWHF=88Fkq=tYW5PSohB_bMJ-k8Kw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 1, 2022 at 3:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable
> > CAN{0,1}
>
> > On Tue, Aug 30, 2022 at 6:45 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Enable CAN{0,1} on RZ/N1D-DB board.
>
> My bad, it is RZ/N1D-DB CPU board fitted to RZ/N1-EB carrier board.
> Actually it enables CAN{0,1} on the carrier board.
>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> > > @@ -26,6 +26,20 @@ aliases {
> > >         };
> > >  };
> > >
> > > +&can0 {
> > > +       pinctrl-0 = <&pins_can0>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       status = "okay";
> > > +};
> > > +
> > > +&can1 {
> > > +       pinctrl-0 = <&pins_can1>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       status = "okay";
> > > +};
> >
> > According to the schematics and board documentation, only a single CAN
>
> See above, RZ/N1-EB schematics has both connectors??

AFAIU, CN10 and CN11 are not the real CAN connectors, they are headers
to add jumpers to select which CAN interface to route to the real CAN
connector J16.

> > connector is present, and the CAN interface to use must be selected
> > using the CN10/CN11 jumpers.  Hence I think we need a #define and an
> > #ifdef to configure this, or at least keep one interface disabled, and
> > add a comment explaining why.
>
> Our BSP release, by default enables both the CAN interfaces(CN10/CN11) jumpers.
> I have a RZ/N1-EB carrier board and tested CAN loopback on these interfaces.

Yeah, you can enable loopback by wiring CN10 and CN11 appropriately ;-)
But that's not intended for normal use.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
