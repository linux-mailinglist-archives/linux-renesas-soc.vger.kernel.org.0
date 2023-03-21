Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31E6F6C2C9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 09:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCUIhe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 04:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjCUIhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 04:37:18 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8614E27D61;
        Tue, 21 Mar 2023 01:36:55 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id ay22so5614426qtb.2;
        Tue, 21 Mar 2023 01:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679387793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMF44NpbniB6bRxqvL1BShiYiLLATNEVoxnZLr4+kRo=;
        b=aFwaA44tT+xUZ4Oyf96Yy0/oXKYq1vxcBI9MVJKS0CDOzHyS4Z9lnVkG4oC94I6J1z
         hpd5xFb4Tej0pf+zReBv47uJ6ct+DqTmx4R1tL2wrllPfNBqZBSS3J1xXAemUiAU15j+
         QYq/pmuIlbxMIluo/bezUkUok1WwCFSHwnpa7OcCx7Ce2GobF2jOec18Tic7iePYK0qH
         lac6EDCoICCXH86QKUzaxjlLaXJV0ustDNPhKVC/VPptxMC9lU8md+eWfRViUuZIIQl2
         EwD5zREnnS176+DK58ObRbBBEm86ueHPrcO/ihoG6oq3WFMEv2eGbofIp0rl7UA2HJU0
         LIlQ==
X-Gm-Message-State: AO0yUKVSoMtOqC8dKf/8J7YrrbFycu6UaNvWgmrOq8mwBBjULhR/t6cM
        +d4sLSboydmAiAyQhliRB4pyDS8DFKlLHQ==
X-Google-Smtp-Source: AK7set+WeWDTVFZK+o60hV8Jcmnz59Wr/ZhHMZi4dw/50T3rDCeBy1BrUfwly1EPatQLTIgOmE47IA==
X-Received: by 2002:a05:622a:5d1:b0:3bf:e13e:30d2 with SMTP id d17-20020a05622a05d100b003bfe13e30d2mr3045029qtb.67.1679387792970;
        Tue, 21 Mar 2023 01:36:32 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id u23-20020a37ab17000000b0071f0d0aaef7sm5512877qke.80.2023.03.21.01.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 01:36:32 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-53d277c1834so267774617b3.10;
        Tue, 21 Mar 2023 01:36:32 -0700 (PDT)
X-Received: by 2002:a81:ac62:0:b0:541:a17f:c779 with SMTP id
 z34-20020a81ac62000000b00541a17fc779mr588370ywj.4.1679387792083; Tue, 21 Mar
 2023 01:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
 <20230320105339.236279-6-biju.das.jz@bp.renesas.com> <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
 <OS0PR01MB59222995B3AD342170AB311D86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59222995B3AD342170AB311D86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Mar 2023 09:36:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHVFNiu5Eq5E2bRnzTzKRNf0w6QORJsFR3D_6YsoywBw@mail.gmail.com>
Message-ID: <CAMuHMdVHVFNiu5Eq5E2bRnzTzKRNf0w6QORJsFR3D_6YsoywBw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 21, 2023 at 9:23 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Monday, March 20, 2023 7:15 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; linux-
> > renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar Mahadev
> > Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0
> > nodes using dt overlay
> >
> > On Mon, Mar 20, 2023 at 11:54 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Enable sci0 node using dt overlay and disable can{0,1}-stb-hog nodes
> > > in dt overlay as its pins are shared with sci0 pins.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3:
> > >  * New patch
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso
> >
> > Can you please come up with a better filename?
> > Perhaps r9a07g043-smarc-pmod.dtso?
>
> Agreed.

> > > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > > +
> > > +&pinctrl {
> > > +       can0-stb-hog {
> > > +               status = "disabled";
> > > +       };
> > > +
> > > +       can1-stb-hog {
> > > +               status = "disabled";
> > > +       };
> > > +
> > > +       sci0_pins: sci0-pins {
> > > +               pinmux = <RZG2L_PORT_PINMUX(2, 2, 5)>, /* TxD */
> > > +                        <RZG2L_PORT_PINMUX(2, 3, 5)>; /* RxD */
> > > +       };
>
> Next version, I am planning to move this pinctrl definitions to rzg2ul-smarc-pinfunction.dtsi
> as separate patch, since it is SoC specific?

r9a07g043-smarc-pmod.dtso is SoC-specific, too?
Or do you want to drop the r9a07g043-prefix?

> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> @@ -50,6 +50,13 @@ i2c1_pins: i2c1 {
>                 input-enable;
>         };
>
> +#if (SW_ET0_EN_N)
> +       sci0_pins: sci0-pins {
> +               pinmux = <RZG2L_PORT_PINMUX(2, 2, 5)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(2, 3, 5)>; /* RxD */
> +       };
> +#endif

> > > +};
> > > +
> > > +&sci0 {
> > > +       pinctrl-0 = <&sci0_pins>;
> > > +       pinctrl-names = "default";
> > > +       status = "okay";
> > > +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
