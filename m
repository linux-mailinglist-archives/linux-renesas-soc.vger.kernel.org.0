Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B2B63EBC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiLAJBs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLAJBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:01:47 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E315A32B87;
        Thu,  1 Dec 2022 01:01:46 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id g10so703371qkl.6;
        Thu, 01 Dec 2022 01:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5twYd/9hu6g7IqQ+PwKPuG+649XocBw2sPG8hDRpADA=;
        b=R7jnC7pukaYVfg06hk0B1emb/1jLIydHf1BK0wod874ejWXWcnEtdAer38+NFbQJb1
         WM6g1AaWM48UkghZRFKD4naOdAfLdlJvLqZxC5C2GN8qGkBeBgYUxByC1WvQeDwBKcuL
         jN71x9uHHCUpchmqIDEGxhP8+2bmvXXsJfVgqcm26t8eaucc+EKQKBZenDrrXZTZYcwx
         LaQUGoOELruJlXqIWD7fQJKHhhT3qOBH3NXDa52spXBk4TlY1aIuFHdOw8GWLcwT4ciw
         Fear542qLAwnnupig0g9A7Z6rR/Fq1pKKpX3vwgyZ1VkEkkZkuTc2qxUIOX4ywodCx3t
         UsDQ==
X-Gm-Message-State: ANoB5plxO2iqiX3poOp5mMlxjzjo8B77fTZOlXLaNwgvCaAAWUgrdkDt
        M8cWqRbhi+4Yfy+TkSTy4J1D0FNqy7y+kg==
X-Google-Smtp-Source: AA0mqf48UL1d8MpzlD2sDjUdOfnNeEDu16AA2lPx84KVCtkHAwcQvl04C5ms13AOsDlI0PRGVq1Mhg==
X-Received: by 2002:a05:620a:16c5:b0:6fa:9834:ce59 with SMTP id a5-20020a05620a16c500b006fa9834ce59mr58351623qkn.276.1669885305859;
        Thu, 01 Dec 2022 01:01:45 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id q2-20020a05620a2a4200b006fa4cefccd6sm3116754qkp.13.2022.12.01.01.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:01:45 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id e141so1211705ybh.3;
        Thu, 01 Dec 2022 01:01:45 -0800 (PST)
X-Received: by 2002:a25:7408:0:b0:6f2:49a7:38ef with SMTP id
 p8-20020a257408000000b006f249a738efmr29618144ybc.365.1669885304829; Thu, 01
 Dec 2022 01:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com> <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
In-Reply-To: <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 10:01:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
Message-ID: <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Tue, Nov 22, 2022 at 8:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Nov 22, 2022 at 07:41:13PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
> > > carrier board
> > > On Tue, Nov 22, 2022 at 06:58:02PM +0000, Biju Das wrote:
> > > > Enable ADV7535 (MIPI DSI Receiver with HDMI Transmitter) on RZ/G2L
> > > > SMARC EVK.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi

> > > > +&i2c1 {
> > > > + pinctrl-0 = <&i2c1_pins>;
> > > > + pinctrl-names = "default";
> > > > +
> > > > + status = "okay";

pinctrl and status are already set by rz-smarc-common.dtsi?

> > > > +
> > > > + adv7535: hdmi@3d {
> > > > +         compatible = "adi,adv7535";
> > > > +         reg = <0x3d>;
> > > > +
> > > > +         avdd-supply = <&reg_1p8v>;
> > > > +         dvdd-supply = <&reg_1p8v>;
> > > > +         pvdd-supply = <&reg_1p8v>;
> > > > +         a2vdd-supply = <&reg_1p8v>;
> > > > +         v3p3-supply = <&reg_3p3v>;
> > > > +         v1p2-supply = <&reg_1p8v>;
> > > > +
> > > > +         adi,dsi-lanes = <4>;

Missing clocks/clock-names (OSC1, 12 MHz).
Missing interrupts (P2_1).

> > > > +
> > > > +         ports {
> > > > +                 #address-cells = <1>;
> > > > +                 #size-cells = <0>;
> > > > +
> > >
> > > How about port@0 ? That's the DSI input, I expect it should be connected
> > > to the DSI encoder output.
> >
> > Yes, I will enable DSI node and link with port@0.  Since both RZ/G2L and RZ/V2L
> > uses same Carrier board, I need to send binding patch for RZ/V2L.
> >
> > dts Patches for enabling DSI for RZ/G2L ready. But V2L there is dependency on bindings.

That's just a matter of days, right?

> > If you prefer both ports together, then I can defer this later.
>
> It could be easier to review (not to mention testing). I'll let Geert
> decide.

Is there any advantage in applying this patch now, i.e. does it enable
any working functionality?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
