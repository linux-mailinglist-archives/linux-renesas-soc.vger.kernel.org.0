Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F9D63ECED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiLAJvi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiLAJve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:51:34 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF8CC06;
        Thu,  1 Dec 2022 01:51:33 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id p12so956390qvu.5;
        Thu, 01 Dec 2022 01:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbhuV94g4CZ94UjChtXEtG5EdwWsMVGhUsQv3HunZ1k=;
        b=tToRvpYshskpyeYF7FAboHj3o1FS9VAlrqIUbKSz4cPyWyyoBVsgsOxzxrGS2Tjkhr
         bZRjVYg+ule8TARXs4JZaVTDvOupl5TCxZahq4Nt/ME3RMj+h3RL7eiWvdQNuURjOBtV
         P8sfb0kgO9H7AMFEhU16/AE54nLzB3wWXlqS0NJq24y7I/CGmbZe+fyWFTUyt6ivj01F
         VtJnnvaJWeDY1tnJmRhf3HhRWAhqp8BEUIzrRMTZeutI0eUUyopc+k/kJQwbMJAa6UQe
         4jlHWKtxStXDCSTtO6LjdjtLMLLIC5WA/qaJwIEWZpLCulWUHf/IQfj33LZ+cCnhUXe0
         6org==
X-Gm-Message-State: ANoB5plapBHayegzdKgyj+fCyVzzuQbVOJZP1NANP7EBFJPpO5kgfudd
        hSRTdcTVWZPRjMybfNPz9QnxY7RENUQsGg==
X-Google-Smtp-Source: AA0mqf59dBbnDXLMrOMscNNi9Tb2dYxzXQm8TCBGVcoON/Wj7Xcuxd/vWebUpErfRZHcjiukANnVgA==
X-Received: by 2002:a0c:fe81:0:b0:4b4:c9b:7b4e with SMTP id d1-20020a0cfe81000000b004b40c9b7b4emr41136510qvs.112.1669888292141;
        Thu, 01 Dec 2022 01:51:32 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m21-20020a05620a24d500b006ee8874f5fasm3152453qkn.53.2022.12.01.01.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:51:31 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id v206so1329691ybv.7;
        Thu, 01 Dec 2022 01:51:31 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr36526359ybc.543.1669888291441; Thu, 01
 Dec 2022 01:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com> <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com> <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
 <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com> <OS0PR01MB59225B4A413B6977B67CF97F86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225B4A413B6977B67CF97F86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 10:51:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRnnoLqGD_X+6BsUwWn7TNVmKU+b=P_p1=czTkvCP0Gw@mail.gmail.com>
Message-ID: <CAMuHMdVRnnoLqGD_X+6BsUwWn7TNVmKU+b=P_p1=czTkvCP0Gw@mail.gmail.com>
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

On Thu, Dec 1, 2022 at 10:45 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
> > carrier board
> > On Thu, Dec 1, 2022 at 10:20 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable
> > > > ADV7535 on carrier board On Tue, Nov 22, 2022 at 8:55 PM Laurent
> > > > Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > > On Tue, Nov 22, 2022 at 07:41:13PM +0000, Biju Das wrote:
> > > > > > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable
> > > > > > > ADV7535 on carrier board On Tue, Nov 22, 2022 at 06:58:02PM
> > > > > > > +0000, Biju Das wrote:
> > > > > > > > Enable ADV7535 (MIPI DSI Receiver with HDMI Transmitter) on
> > > > > > > > RZ/G2L SMARC EVK.
> > > > > > > >
> > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > > > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> >
> > > > > > > > +
> > > > > > > > +         ports {
> > > > > > > > +                 #address-cells = <1>;
> > > > > > > > +                 #size-cells = <0>;
> > > > > > > > +
> > > > > > >
> > > > > > > How about port@0 ? That's the DSI input, I expect it should be
> > > > > > > connected to the DSI encoder output.
> > > > > >
> > > > > > Yes, I will enable DSI node and link with port@0.  Since both
> > > > > > RZ/G2L and RZ/V2L uses same Carrier board, I need to send
> > > > > > binding patch for
> > > > RZ/V2L.
> > > > > >
> > > > > > dts Patches for enabling DSI for RZ/G2L ready. But V2L there is
> > > > dependency on bindings.
> > > >
> > > > That's just a matter of days, right?
> > >
> > >
> > > >
> > > > > > If you prefer both ports together, then I can defer this later.
> > > > >
> > > > > It could be easier to review (not to mention testing). I'll let
> > > > > Geert decide.
> > > >
> > > > Is there any advantage in applying this patch now, i.e. does it
> > > > enable any working functionality?
> > >
> > > Currently all display/graphics functionality tested with [3]
> > >
> > > The advantage is,
> > >
> > > 1) I would like to backport graphics and display functionality to cip
> > kernel [2]
> > >    as most of our customers are using this kernel.
> > >
> > > 2) we can test ADV driver using i2c read/write command
> > >
> > > 3) We can test ADV interrupts
> > >
> > > 4) This will reduce integration effort as we can test full display and
> > graphics
> > >   functionality with [3]
> > >
> > > [2]
> > >
> > > Please share your views.
> >
> > And all of that is working without port@0?
>
> Without port@0, we can only test read/write from ADV 7535 device using i2c commands.

Which you can do without this patch, too, right?

> For full display functionality.
>
> 1) we need port@0 for linking to dsi
>
> and
>
> 2) We need to link dsi with du.

Then please combine this with the dsi.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
