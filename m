Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0382DE311
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgLRNFw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:05:52 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38504 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgLRNFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:05:52 -0500
Received: by mail-ot1-f41.google.com with SMTP id j20so1813256otq.5;
        Fri, 18 Dec 2020 05:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=reSTRV4dt7ZPUclP+v1NvqHl1Mq5jwxkuDW3Be0Lj/Q=;
        b=Fgy2sOnKiEB00Kd3mEqaSK0RaOfscVQwK9yVTgWBPLH59f/DK7fTIGf7QJstq0n/SN
         Q0msK4eQsBG8U3sJ1QsoqNGX05vEPLaD4v7HDhg/Vqvyq1F8UC81h7+h4COF5KLT1K3H
         rKISZsTm8Tpwcjnv4K4uiKkI6n5uQ7WFEhL8pvPwrXEMCu3svYti+cwfFywERHg/km0G
         1/QZVFHDeNIgj/E32HkG9q8RECHMMjX4L+TncYACw9/RysdMActuFgCXeTdtj2B5+gZ7
         ghJBFNMIFdR62+YniZvRj9aubYYenuMhvN3ggBHwBFOOH7kn1lHtAWN+hPvKbgD+qzpR
         7mEg==
X-Gm-Message-State: AOAM531NJMcTbd9FcqCHtqXs78yHWGrruBQ9svS47Z1DQjDKspQgkLHX
        5e44QtcQweX11Y+10Mh6wehvjd+MNqpLO71Xm1g=
X-Google-Smtp-Source: ABdhPJzGwkhEVu5ipeVElNXuYDRlTMW/vqp/IfddZsJHun4cLC1wohvG+90Iq3eaADoRF/1rXUKP4J71SfpC0VAurNE=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr2682245ota.107.1608296711700;
 Fri, 18 Dec 2020 05:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-5-aford173@gmail.com>
 <CAMuHMdWAQ9j1b=b7CFcjg97N7YW+7Dj14TB-MGogJGK7kFkdhg@mail.gmail.com> <CAHCN7xL10Lj8VS5WEyyEixf4ptjKchX0OMDuFAQc-JJzFa5Ubw@mail.gmail.com>
In-Reply-To: <CAHCN7xL10Lj8VS5WEyyEixf4ptjKchX0OMDuFAQc-JJzFa5Ubw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:05:00 +0100
Message-ID: <CAMuHMdU4b-pTAKcEKE+UW1+8p34LR2i84Opj31vR3GJ=oY1JWg@mail.gmail.com>
Subject: Re: [PATCH 04/18] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 17, 2020 at 1:01 PM Adam Ford <aford173@gmail.com> wrote:
> On Thu, Dec 17, 2020 at 4:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > The SoC was expecting two clock sources with different frequencies.
> > > One to support 44.1KHz and one to support 48KHz.  With the newly added
> > > ability to configure the programmably clock, configure both clocks.
> > >
> > > Beacause the SoC is expecting a fixed clock/oscillator, it doesn't
> > > attempt to get and enable the clock for audio_clk_a. The choice to
> > > use a fixed-factor-clock was due to the fact that it will automatically
> > > enable the programmable clock frequency without change any code.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > @@ -250,9 +250,12 @@ ss_ep: endpoint {
> > >  };
> > >
> > >  &audio_clk_a {
> > > -       clock-frequency = <24576000>;
> > > -       assigned-clocks = <&versaclock6_bb 4>;
> > > -       assigned-clock-rates = <24576000>;
> > > +       /delete-property/ clock-frequency;
> > > +       #clock-cells = <0>;
> > > +       compatible = "fixed-factor-clock";
> > > +       clock-mult = <1>;
> > > +       clock-div = <1>;
> > > +       clocks = <&versaclock6_bb 4>;
> > >  };
> >
> > Shouldn't you override the clocks property in the rcar_sound node
> > instead, like is done in several other board DTS files (with cs2000)?
> >
>
> I guess there are multiple ways to do this.  Because the rcar_sound
> was already expecting a reference to audio_clk_a, it seemed less
> intrusive this way. The way I proposed, we can use the default
> rcar_sound clocking and just change the audio_clk node to enable the
> versaclock output.  The versaclock is driving the audio_clk_a
> reference clock, so it seemed appropriate to put it there.
>
> If you want me to change, I will.

Taking a fresh look at this, I start to like it.
What do other people think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
