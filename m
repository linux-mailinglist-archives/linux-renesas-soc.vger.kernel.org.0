Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5F773BB0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 17:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjFWPIA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 11:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjFWPH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 11:07:59 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F891BE4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:07:57 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b5915d0816so676652a34.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532876; x=1690124876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tteXaeBKwKYItBO6rd0lQG8wEt/hJNtk9X1Mmm2A50=;
        b=XqmdOCYYput8/wwdgcrrk8050Ec07qYgl/EiC0YVQ6OsRP0SUAhb0EqbPEiD/nmmSm
         ZzYGBsYa68LBgQpYdRtsODcfoYbOtFRIgDdTMasU2ORdRhbBS5kYa6+XJdQoNGq3fODB
         vu2jTerCqWgkUVZv+QbWe+EIwUYskl6o2wEPw+EabXXRn2pBAzZkVdAWxHcq1enhKfcd
         460XjTxES34SQI4YvPw56hHhf+/laZKw+u5mLDZgd8U9J6fgy/wNcSVw7aQdwOYiPxHm
         zODK7nyaTqQeLosw/mWtvYbKJvi6ybAsz74WFuAGWYFfAye5IuhOxAQqRwrY49gPudtn
         hn9w==
X-Gm-Message-State: AC+VfDzkcLql3ijt23B/yD2wy0OfxYqL19xeltQuSPalEcNMy9SLTXZE
        dBp5gEYOvbg1p/hGwX0lYH3xcYpVMpkskg==
X-Google-Smtp-Source: ACHHUZ7e4zZnQxAvNPowBVnLZiz/qSAWN/19Y2qiyQBgomw6IkLe6o0gJvhmic54kiP/SBjY4HjGJg==
X-Received: by 2002:a05:6359:67aa:b0:131:fb9:2378 with SMTP id sq42-20020a05635967aa00b001310fb92378mr7156991rwb.5.1687532876404;
        Fri, 23 Jun 2023 08:07:56 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 205-20020a250fd6000000b00c02020f8059sm891455ybp.43.2023.06.23.08.07.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 08:07:55 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bc40d4145feso599838276.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:07:55 -0700 (PDT)
X-Received: by 2002:a5b:bc9:0:b0:bc8:833d:c41e with SMTP id
 c9-20020a5b0bc9000000b00bc8833dc41emr17735173ybr.6.1687532875683; Fri, 23 Jun
 2023 08:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687417585.git.geert+renesas@glider.be> <1994a9c58321667733d7cd7500d7e25d30308498.1687417585.git.geert+renesas@glider.be>
 <20230623130318.GA2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623130318.GA2112@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jun 2023 17:07:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8Pc3oJGkoN5RiQFhXtqnmYa3jheS-FMO7G7SQPTtmHg@mail.gmail.com>
Message-ID: <CAMuHMdU8Pc3oJGkoN5RiQFhXtqnmYa3jheS-FMO7G7SQPTtmHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7740: Add LCDC nodes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Jun 23, 2023 at 3:03 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 22, 2023 at 11:23:14AM +0200, Geert Uytterhoeven wrote:
> > Add device nodes for the two LCD Controllers (LCDC) on the R-Mobile A1
> > SoC, and for the two optional external LCDL clock inputs.
> >
> > Note that the HDMI clock for LCDC1 is not added, as this clock is not
> > yet supported.
> >
> > Based on a patch by Laurent Pinchart adding the first LCDC device node.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Laurent's original:
> >   - Add lcdc0 label,
> >   - Rename node from display to lcdc-controller,
> >   - Rename compatible value from "renesas,lcdc-r8a7740" to
> >     "renesas,r8a7740-lcdc",
> >   - Correct syntax of reg property,
> >   - Use GIC_SPI macro,
> >   - Add more clocks,
> >   - Add power-domains property,
> >   - Add status disabled,
> >   - Remove second port from lcdc0, as only lcdc1 has an HDMI port,
> >   - Add lcdc1 device node.
> > ---
> >  arch/arm/boot/dts/r8a7740.dtsi | 65 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> > index 1b2cf5fa322b2985..55884ec701f8dab4 100644
> > --- a/arch/arm/boot/dts/r8a7740.dtsi
> > +++ b/arch/arm/boot/dts/r8a7740.dtsi
> > @@ -398,6 +398,61 @@ sh_fsi2: sound@fe1f0000 {
> >               status = "disabled";
> >       };
> >
> > +     lcdc0: lcd-controller@fe940000 {
> > +             compatible = "renesas,r8a7740-lcdc";
> > +             reg = <0xfe940000 0x4000>;
> > +             interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
> > +                      <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
> > +                      <&vou_clk>;
> > +             clock-names = "fck", "media", "lclk", "video";
> > +             power-domains = <&pd_a4lc>;
> > +             status = "disabled";
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +
> > +                             lcdc0_rgb: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     lcdc1: lcd-controller@fe944000 {
> > +             compatible = "renesas,r8a7740-lcdc";
> > +             reg = <0xfe944000 0x4000>;
> > +             interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks = <&mstp1_clks R8A7740_CLK_LCDC1>,
> > +                      <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk1_clk>,
> > +                      <&vou_clk>;
> > +             clock-names = "fck", "media", "lclk", "video";
> > +             power-domains = <&pd_a4lc>;
> > +             status = "disabled";
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +
> > +                             lcdc1_rgb: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg = <1>;
> > +
> > +                             lcdc1_hdmi: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> >       tmu0: timer@fff80000 {
> >               compatible = "renesas,tmu-r8a7740", "renesas,tmu";
> >               reg = <0xfff80000 0x2c>;
> > @@ -474,6 +529,16 @@ fsibck_clk: fsibck {
> >                       #clock-cells = <0>;
> >                       clock-frequency = <0>;
> >               };
> > +             lcdlclk0_clk: lcdlclk0 {
> > +                     compatible = "fixed-clock";
> > +                     #clock-cells = <0>;
> > +                     clock-frequency = <0>;
> > +             };
> > +             lcdlclk1_clk: lcdlclk1 {
> > +                     compatible = "fixed-clock";
> > +                     #clock-cells = <0>;
> > +                     clock-frequency = <0>;
> > +             };
>
> The clock frequency seems quite low :-) As far as I understand, there
> are the clocks fed to the external LCDLCLK pins. They belong to the
> board DTS, not here. If a board doesn't provide an external clock, the
> clock should simply be ommitted. The driver must thus treat it as
> optional.

Usually, we do provide clock nodes with a zero rate in the SoC-specific
.dtsi for optional clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
