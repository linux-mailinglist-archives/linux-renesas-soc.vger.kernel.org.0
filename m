Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEA17484E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 15:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjGEN3D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 09:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGEN3B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 09:29:01 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407531713;
        Wed,  5 Jul 2023 06:29:00 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-579d5d89b41so56399277b3.2;
        Wed, 05 Jul 2023 06:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688563739; x=1691155739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YA1kx3Yv436h9iBYuDcm04JxVNm4pa5MPBsgKZUqkY=;
        b=Q0/hx1uRsqb126hYR2Gh2KVtyZt8Su5Bq7/vM4eSEFgJarys8cBabghmNq46HFxUwm
         dQP74tpS+w52B4mjSn3WDSmPA7BlU8e7KfWhswwMkIC2GO7IUSVvQa++87+vEkTgO1tN
         bfqpHrGJpKq6scuyWWuKkpS2g8ac7YLkl+dPJYekDU6OJ4dLJiJy1VRhAvP2NG9oOHCg
         QM3LGi4U7fb88vzi5TkilPRBEoIjhamIJnUZ75g6FYAc9W3wSpy/cyxWpQ+KKje2LQS5
         coIDm7ugIMe1IxsQdmzYR/ObHaPZCbg30xNqIHWgxUh1CbZH4TB/wKOPH9FOC8cIBSWd
         32ug==
X-Gm-Message-State: ABy/qLaEgRzqqbrAQeRUBCSKOJrobndFoXSs//d8wVHuDnAq8R1TkWi0
        3IcELdAXKC0p7bpwoDZFUP3tiOJSjuqedg==
X-Google-Smtp-Source: APBJJlF9lTjDJwGDfHQNgsg6uERsdkvs3f48K5QlWuNjbE6F3LsZo87xNJzv48bw6GCUPDJhgkcz7w==
X-Received: by 2002:a81:9c03:0:b0:577:f47:3d8d with SMTP id m3-20020a819c03000000b005770f473d8dmr15128574ywa.25.1688563739071;
        Wed, 05 Jul 2023 06:28:59 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id u18-20020a818412000000b005772abf6234sm3513413ywf.11.2023.07.05.06.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 06:28:58 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-c4cb4919bb9so4602151276.3;
        Wed, 05 Jul 2023 06:28:58 -0700 (PDT)
X-Received: by 2002:a25:4b07:0:b0:bc3:b6de:1e96 with SMTP id
 y7-20020a254b07000000b00bc3b6de1e96mr13669002yba.6.1688563738532; Wed, 05 Jul
 2023 06:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com> <OS0PR01MB592220826E0102C41FD4CD2C862FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592220826E0102C41FD4CD2C862FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 15:28:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSYA0t7H5bkPCE1gVEzscn+PLv3B1pbRtJqqc51RaMqw@mail.gmail.com>
Message-ID: <CAMuHMdXSYA0t7H5bkPCE1gVEzscn+PLv3B1pbRtJqqc51RaMqw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

On Wed, Jul 5, 2023 at 3:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
> > enabling MTU3
> > On Mon, Jul 3, 2023 at 3:29 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add support for MTU3 macro to enable MTU3 node on RZ/{G2,V2}L SMARC
> > EVK.
> > >
> > > The MTU3a PWM pins are muxed with spi1 pins and counter external input
> > > phase clock pins are muxed with scif2 pins. Disable these IPs when
> > > MTU3 macro is enabled.
> > >
> > > Apart from this, the counter Z phase clock signal is muxed with the
> > > SDHI1 cd signal. So disable SDHI1 IP, when the counter Z phase signal
> > > is enabled.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts

> > > +&mtu3_pins {
> > > +       mtu3-zphase-clk {
> > > +               pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
> > > +       };
> > > +};
> >
> > With the #defines moved up, mtu3-zphase-clk can be moved to mtu3_pins in
> > rzg2l-smarc-pinfunction.dtsi.
>
> Z-phase support is added only for cascade counter(MTU1 + MTU2)
>
> I thought by making this as optional, SDHI + standalone MTU1 or MTU2
> can still work. That is the reason it is moved here.
>
> If we move "mtu3-zphase-clk" to  mtu3_pins in rzg2l-smarc-pinfunction.dtsi
> Either
>
> we need to make MTU3 mutually exclusive with SDHI
>
> Or
>
> Guard "mtu3-zphase-clk" with "MTU3_COUNTER_Z_PHASE_SIGNAL" macro in
> rzg2l-smarc-pinfunction.dtsi.
>
> Which one I need to select??

I'd go for the #ifdef, as you had above.

> > > +
> > > +&sdhi1 {
> > > +       status = "disabled";
> > > +};
> > > +#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */
> >
> > BTW, how does the driver know it can use the counter Z phase clock
> > signal?  I understand this can be either an input or output signal?
>
> It is an input signal and is supported only for the cascade(MTU1 + MTU2) operation. When we supply z-phase signal(By inserting SD card or applying a voltage to cd pin on the sd connector), counter value gets cleared.

The documentation for MTIOC1A says:

    MTU1 TGRA input capture input/output compare output/PWM output pin

So the output functions are not yet supported by the driver?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
