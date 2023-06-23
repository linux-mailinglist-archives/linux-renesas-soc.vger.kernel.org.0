Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04DEB73BB9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 17:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjFWP00 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 11:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjFWP0Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 11:26:24 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1811BD8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:26:22 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39ec83d1702so508887b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533982; x=1690125982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4BzfgMdyc9rrVGbmaZ7l8oN7xXonYc0wA5cZDckpw4=;
        b=TwJ598YX3Ueu+GCX5VWPopz2SZBxm7tjFB+7iGjRi9oN5cfMOk5i1vP3iZZdRqSi8D
         mW2//d9lOj2tVwRJP4kSPotexNQ5e045jAGNXU/LqhFP09rbiTARtMJygpM/qk2cuyLX
         njX8crQPLeMr8ARb9o3XzawIlcZtODI3wKpE3QcuFLgFEyeDhO//rq6BDvn7zw3a5x9D
         uI2+acf+Nx9VshjrvHPX918Jw7DURITdBZ4XSWVtBCZ9s+s1yuEhSzaoqxirRiLtZXtR
         fHgPhZu1MPgzTcWHrZ73gfAJAbZeoD6dgqQm+U4eSzKM/m0M3oVnxt9eT5KEWkwqnGW/
         LImg==
X-Gm-Message-State: AC+VfDw61P77MwBilRVCRMrzfdIu4lt1YFnOHMRYQFQ5u/EKaBDh5yYu
        /7kmDJx28YfCWwo0wJ+JIIGzvrPzRAATxA==
X-Google-Smtp-Source: ACHHUZ7c0y3yNa8Wz16TBsC1aaTmRD7sDb50Q6x3xERvm3miBXX2zjr/Th8CSxmf+9moRUOcQZh08w==
X-Received: by 2002:aca:903:0:b0:39e:a493:65fc with SMTP id 3-20020aca0903000000b0039ea49365fcmr19461773oij.57.1687533981833;
        Fri, 23 Jun 2023 08:26:21 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id s203-20020acadbd4000000b00396050dca14sm4525644oig.28.2023.06.23.08.26.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 08:26:21 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1aa161c3796so638891fac.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:26:20 -0700 (PDT)
X-Received: by 2002:a05:6359:1c14:b0:129:c9c0:ca64 with SMTP id
 us20-20020a0563591c1400b00129c9c0ca64mr17087851rwb.15.1687533980668; Fri, 23
 Jun 2023 08:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687417585.git.geert+renesas@glider.be> <1994a9c58321667733d7cd7500d7e25d30308498.1687417585.git.geert+renesas@glider.be>
 <20230623130318.GA2112@pendragon.ideasonboard.com> <CAMuHMdU8Pc3oJGkoN5RiQFhXtqnmYa3jheS-FMO7G7SQPTtmHg@mail.gmail.com>
 <20230623151236.GM2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623151236.GM2112@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jun 2023 17:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2fYzCTA78US=YGGgvhjSbJWvV-suRsknHqq3OhKCWAw@mail.gmail.com>
Message-ID: <CAMuHMdV2fYzCTA78US=YGGgvhjSbJWvV-suRsknHqq3OhKCWAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7740: Add LCDC nodes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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

Hi Laurent,

On Fri, Jun 23, 2023 at 5:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 23, 2023 at 05:07:44PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 23, 2023 at 3:03 PM Laurent Pinchart wrote:
> > > On Thu, Jun 22, 2023 at 11:23:14AM +0200, Geert Uytterhoeven wrote:
> > > > Add device nodes for the two LCD Controllers (LCDC) on the R-Mobile A1
> > > > SoC, and for the two optional external LCDL clock inputs.
> > > >
> > > > Note that the HDMI clock for LCDC1 is not added, as this clock is not
> > > > yet supported.
> > > >
> > > > Based on a patch by Laurent Pinchart adding the first LCDC device node.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Changes compared to Laurent's original:
> > > >   - Add lcdc0 label,
> > > >   - Rename node from display to lcdc-controller,
> > > >   - Rename compatible value from "renesas,lcdc-r8a7740" to
> > > >     "renesas,r8a7740-lcdc",
> > > >   - Correct syntax of reg property,
> > > >   - Use GIC_SPI macro,
> > > >   - Add more clocks,
> > > >   - Add power-domains property,
> > > >   - Add status disabled,
> > > >   - Remove second port from lcdc0, as only lcdc1 has an HDMI port,
> > > >   - Add lcdc1 device node.
> > > > ---
> > > >  arch/arm/boot/dts/r8a7740.dtsi | 65 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> > > > index 1b2cf5fa322b2985..55884ec701f8dab4 100644
> > > > --- a/arch/arm/boot/dts/r8a7740.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7740.dtsi

> > > > @@ -474,6 +529,16 @@ fsibck_clk: fsibck {
> > > >                       #clock-cells = <0>;
> > > >                       clock-frequency = <0>;
> > > >               };
> > > > +             lcdlclk0_clk: lcdlclk0 {
> > > > +                     compatible = "fixed-clock";
> > > > +                     #clock-cells = <0>;
> > > > +                     clock-frequency = <0>;
> > > > +             };
> > > > +             lcdlclk1_clk: lcdlclk1 {
> > > > +                     compatible = "fixed-clock";
> > > > +                     #clock-cells = <0>;
> > > > +                     clock-frequency = <0>;
> > > > +             };
> > >
> > > The clock frequency seems quite low :-) As far as I understand, there
> > > are the clocks fed to the external LCDLCLK pins. They belong to the
> > > board DTS, not here. If a board doesn't provide an external clock, the
> > > clock should simply be ommitted. The driver must thus treat it as
> > > optional.
> >
> > Usually, we do provide clock nodes with a zero rate in the SoC-specific
> > .dtsi for optional clocks.
>
> Who is "we" ? Is that a kernel-wide practice ? For rcar-du that's not
> the case as far as I can tell.

"We" do for external CAN, SCIF, Audio, PCI, USB, ... clocks on R-Car.
Indeed not for DU...

It seems to be common on other platform, too:

    git grep "clock-frequency = <0>;"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
