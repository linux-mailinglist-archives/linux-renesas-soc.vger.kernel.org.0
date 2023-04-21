Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450486EA4AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 09:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjDUH1i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 03:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjDUH1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 03:27:35 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902AD7ED8;
        Fri, 21 Apr 2023 00:27:33 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b951f5e1b3fso499827276.2;
        Fri, 21 Apr 2023 00:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062052; x=1684654052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/TNGPjtstfDYeU+gMn8aeVCmoW+zcxN5jvcSR/5gyQ=;
        b=iRHc5o+rrKbU20zW0NGgRCPkn9AxArydwrUmBo4nJ7X5tJzBPoveBJ4gnneXVEQJdW
         kc+kKQwytqAsK6owYi4VPSqU51pbFClxkQruUNcxrzs1Td2AdhVuMUKvEdKIJrkGzc5K
         2oR0/K2M2FUA9nSbtfRD3b6Z+IxXJveWKs1MpaM26nVlAO+pHrd5xg58uAVrJGI9pZMq
         WL693G1pwLb5iGqpvRf/uQNVVU9sLnMcpQdqPj4yKP9RlTf8yWgwiaUOCdBofC5cLoue
         vAxwJG301WZWUKfALLxrViR1o2a8jXISfeOQCiEmWC9zu7bnKc5DeFIpIcOJbS9Zcvwr
         JuVw==
X-Gm-Message-State: AAQBX9d7UNBNuNIakpOIKgDqGcj95dsHV3rXyypbjE85/PQiJnP+dICo
        2VHnQrser+8lsrcjtEbfUeb6/5CBRny2EPu6
X-Google-Smtp-Source: AKy350Zv629UzbBkS2GbpKBFTZdmORYOUZtbaapNH4ujJcUSBb4i+SCQAJc8DJK1YiYfXyEr1YamyQ==
X-Received: by 2002:a25:e6c3:0:b0:b8f:3202:4491 with SMTP id d186-20020a25e6c3000000b00b8f32024491mr1402771ybh.30.1682062052330;
        Fri, 21 Apr 2023 00:27:32 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id u2-20020a259f82000000b00b96a0d1a0a7sm799511ybq.11.2023.04.21.00.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 00:27:31 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b951f5e1b3fso499805276.2;
        Fri, 21 Apr 2023 00:27:31 -0700 (PDT)
X-Received: by 2002:a25:dc4e:0:b0:b92:29bc:a91d with SMTP id
 y75-20020a25dc4e000000b00b9229bca91dmr1758049ybe.3.1682062051161; Fri, 21 Apr
 2023 00:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com> <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
 <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com> <OS0PR01MB59225B62056AFA6FF70F1F3186639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225B62056AFA6FF70F1F3186639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 09:27:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4LOsJf+bnb8XRQo5_1Mdby1EArSdnW2oY6t0_yR1Oug@mail.gmail.com>
Message-ID: <CAMuHMdV4LOsJf+bnb8XRQo5_1Mdby1EArSdnW2oY6t0_yR1Oug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Thu, Apr 20, 2023 at 8:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, April 20, 2023 6:15 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Magnus Damm <magnus.damm@gmail.com>;
> > linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar
> > Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
> > counter using DT overlay
> >
> > Hi Biju,
> >
> > On Thu, Apr 20, 2023 at 5:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: Thursday, April 20, 2023 4:40 PM
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > > > <krzysztof.kozlowski+dt@linaro.org>; Geert Uytterhoeven
> > > > <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>;
> > > > linux- renesas-soc@vger.kernel.org; devicetree@vger.kernel.org;
> > > > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable
> > > > MTU3a counter using DT overlay
> > > >
> > > > Hi Biju,
> > > >
> > > > On Mon, Apr 17, 2023 at 11:02 AM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Enable mtu3 node using dt overlay and disable scif2 node and
> > > > > delete {sd1_mux,sd1_mux_uhs} nodes as the pins are shared with
> > > > > mtu3 external clock input pins and Z phase signal(MTIOC1A).
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
> > > > > @@ -0,0 +1,43 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Device Tree Source for the RZ/{G2L,V2L} SMARC EVK PMOD parts
> > > > > + *
> > > > > + * Copyright (C) 2023 Renesas Electronics Corp.
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > > > > +
> > > > > +&mtu3 {
> > > > > +       pinctrl-0 = <&mtu3_pins>;
> > > > > +       pinctrl-names = "default";
> > > > > +
> > > > > +       status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pinctrl {
> > > > > +       mtu3_pins: mtu3 {
> > > > > +               mtu3-zphase-clk {
> > > > > +                       pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /*
> > > > > +MTIOC1A
> > > > */
> > > > > +               };
> > > >
> > > > Unless I'm missing something, this signal is not available on the
> > > > PMOD connector?
> > >
> > > Yes, it is not available on the PMOD connector. SD card detection
> > > signal, is muxed with MTIOC1A (Z Phase signal). So for counter use
> > > case, we use it as MTIOC1A pins.
> >
> > As the signal is not available on the PMOD connector, can't you just ignore
> > the Z Phase signal, and keep the SD card CD signal available instead?
>
>
> Some customers are using Z phase signal in their product to clear the counter.
> Maybe we define a macro in overlay, by default Z phase signal is disabled.
>
> Is it ok?
>
> Note:-
> I use SD card removal/insert which changes the Z phase signal level for
> clearing the counter.

After giving this some more thought, I don't think this overlay belongs
upstream: it does not just enable hardware support, but provides a
way to test hardware, by redefining the meaning of signals on the
PMOD interface.

Do you agree?

I can add (a future version of) the overlay file (without the build
glue) to my topic/renesas-overlays branch[1], though.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
