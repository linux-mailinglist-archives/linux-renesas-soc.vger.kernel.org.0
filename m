Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1B66E9A6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 19:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjDTRPj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 13:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjDTRPi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 13:15:38 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CA9E67;
        Thu, 20 Apr 2023 10:15:37 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id t15so2773008ybb.1;
        Thu, 20 Apr 2023 10:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682010936; x=1684602936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nktxe7Nutcq8Ww9pwUBsIcx5nRntV4WRUeu9cjwZvoE=;
        b=MOjF35Xmkej/rRPhyU5b3w2siY+LAvheDMpql6hKzogq9lfE3mks9lBWSLbYWayS3I
         28KGJGdFtw/3/Sginn4NSQntSdbpQ/ESNAz26QFI7wyJfFVZ4RYZmrT4UA5bQxF/PATJ
         6015KDKdzjEQ92vFe4lfCdcnTLe3pyZ66vy3Cr9F/CUe2ALu5muFNTjZMVcNTvWPyccV
         MQRysq7uu7T8fDGFWzusEdm+2Dx2k4LDVufmQy8mCWIToO3eC3Zb0blTbzAdljN6QIAi
         6doPyaC92bg8gtWv9rz6KFgu2bXguQsW2129c2C4nK+ie0JJHISJ1D3rXYQ7LLcFMYnM
         sXkA==
X-Gm-Message-State: AAQBX9flLvfu4UubctKeqwv6rId1KV+AeLbcpFvEPPT1biKrssMJafUD
        swl2mJSlH1LrfMgF+daE5bq56sc6TVvzYcGw
X-Google-Smtp-Source: AKy350YhVj2Sm7bYFB3BA5gOLkLh6bYtLFfg47JKWRpN+7c/tHi/XbvWghPopR+uxvGyI23hOe2Fpw==
X-Received: by 2002:a25:ae0b:0:b0:b8f:4490:3c with SMTP id a11-20020a25ae0b000000b00b8f4490003cmr1627519ybj.10.1682010936217;
        Thu, 20 Apr 2023 10:15:36 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id j1-20020a258b81000000b00b923b9e0a82sm396174ybl.45.2023.04.20.10.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:15:35 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id l5so2674632ybe.7;
        Thu, 20 Apr 2023 10:15:35 -0700 (PDT)
X-Received: by 2002:a25:d689:0:b0:b77:2d0d:96b9 with SMTP id
 n131-20020a25d689000000b00b772d0d96b9mr2130817ybg.25.1682010935295; Thu, 20
 Apr 2023 10:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com> <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
 <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 19:15:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com>
Message-ID: <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com>
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

On Thu, Apr 20, 2023 at 5:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, April 20, 2023 4:40 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; linux-
> > renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar Mahadev
> > Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
> > counter using DT overlay
> >
> > Hi Biju,
> >
> > On Mon, Apr 17, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Enable mtu3 node using dt overlay and disable scif2 node and delete
> > > {sd1_mux,sd1_mux_uhs} nodes as the pins are shared with mtu3 external
> > > clock input pins and Z phase signal(MTIOC1A).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
> > > @@ -0,0 +1,43 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Device Tree Source for the RZ/{G2L,V2L} SMARC EVK PMOD parts
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corp.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > > +
> > > +&mtu3 {
> > > +       pinctrl-0 = <&mtu3_pins>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       status = "okay";
> > > +};
> > > +
> > > +&pinctrl {
> > > +       mtu3_pins: mtu3 {
> > > +               mtu3-zphase-clk {
> > > +                       pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A
> > */
> > > +               };
> >
> > Unless I'm missing something, this signal is not available on the PMOD
> > connector?
>
> Yes, it is not available on the PMOD connector. SD card detection signal,
> is muxed with MTIOC1A (Z Phase signal). So for counter use case, we use it
> as MTIOC1A pins.

As the signal is not available on the PMOD connector, can't you just ignore
the Z Phase signal, and keep the SD card CD signal available instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
