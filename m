Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032FC2DD10A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 13:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgLQMCi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 07:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgLQMCh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 07:02:37 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CFBC061794;
        Thu, 17 Dec 2020 04:01:57 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id m23so12453847ioy.2;
        Thu, 17 Dec 2020 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dcjHVx0jrx6JepteYLCPr4nLNJXZTAOJRNTw9c5FMpw=;
        b=WkxOsEMqXarZUdo+kgrgrmknOwu36bW/QKLf78dO2KzQBvKq9C2JO4Q7SwvWJZcDNM
         43FTrc9ZE7tScVxvANwp+I68AYzRCIFnrPqnpfzAXLNaeJWRd2tu0V5PjYHBzjU+3+2S
         C5ubWgpzyRoOz5lYmdi+lq6dgxM+IC0peeHTPxE1L+zWieT9FmBBlbs8CfJ6qIrb7UM0
         OG4C2aoE5zV3BaQYklD6hBteKA2L1ZqDefNTcB6+TRLEMTbJ1zkuV3g3+GDsoptb+Cyc
         ad9H3w30Nqq1uSznisgUbIwnNenzyRrVZQKAo67O9LxdZDNg1fsYB419lWhAPKp3QRAz
         RHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dcjHVx0jrx6JepteYLCPr4nLNJXZTAOJRNTw9c5FMpw=;
        b=LHHI5qO7YGAsHI2AozOxGqqSsJQrZ93ExTUqw6g1qSHCTfKCgE11ebToR+nWjGLD8X
         JF2SEAmQgnO72KbV2z9yFOuUrNNAduqNc3Bbx85C9nyhHTwFkJ2SW2XNo0W25s2KFkjV
         SfUgJfc2ogoLdJt3Is0He1ohK7Uxwryv9z+LgHinz8gBvIFmLUmqVclZTG5v85p775fj
         AwCelL9dHXEnOfSAbDCOwgzJPmENNvBhHpZ4mL/oggEshjdU6Y5h/6iUSJWtu+BREZXD
         RZNtBVBhbyW06OEAwK0XkFc8JorjKnjCTHqhSbMtGWpcCofdYIFXusPPaIPC8A7FHmZo
         In4A==
X-Gm-Message-State: AOAM532rnqC8t+EzG2u+8FasZlz0IQv3ZLOmvSsq9dWcGZ12FkujeEB2
        Zq6VVsFrNpSHFsjtR6HwhoWFXsHc1GoogEQ4A7M=
X-Google-Smtp-Source: ABdhPJyOvdDmnB9Dt7Any+53Zlqt8JnKKuD9Jx7HN6cUvdtG33wJzbPG/drNiX1Wt1fZmgqA4jQYTodgbEhf8Yv0F98=
X-Received: by 2002:a6b:db01:: with SMTP id t1mr10813587ioc.10.1608206513289;
 Thu, 17 Dec 2020 04:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-5-aford173@gmail.com>
 <CAMuHMdWAQ9j1b=b7CFcjg97N7YW+7Dj14TB-MGogJGK7kFkdhg@mail.gmail.com>
In-Reply-To: <CAMuHMdWAQ9j1b=b7CFcjg97N7YW+7Dj14TB-MGogJGK7kFkdhg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Dec 2020 06:01:42 -0600
Message-ID: <CAHCN7xL10Lj8VS5WEyyEixf4ptjKchX0OMDuFAQc-JJzFa5Ubw@mail.gmail.com>
Subject: Re: [PATCH 04/18] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Dec 17, 2020 at 4:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > The SoC was expecting two clock sources with different frequencies.
> > One to support 44.1KHz and one to support 48KHz.  With the newly added
> > ability to configure the programmably clock, configure both clocks.
> >
> > Beacause the SoC is expecting a fixed clock/oscillator, it doesn't
> > attempt to get and enable the clock for audio_clk_a. The choice to
> > use a fixed-factor-clock was due to the fact that it will automatically
> > enable the programmable clock frequency without change any code.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -250,9 +250,12 @@ ss_ep: endpoint {
> >  };
> >
> >  &audio_clk_a {
> > -       clock-frequency = <24576000>;
> > -       assigned-clocks = <&versaclock6_bb 4>;
> > -       assigned-clock-rates = <24576000>;
> > +       /delete-property/ clock-frequency;
> > +       #clock-cells = <0>;
> > +       compatible = "fixed-factor-clock";
> > +       clock-mult = <1>;
> > +       clock-div = <1>;
> > +       clocks = <&versaclock6_bb 4>;
> >  };
>
> Shouldn't you override the clocks property in the rcar_sound node
> instead, like is done in several other board DTS files (with cs2000)?
>

I guess there are multiple ways to do this.  Because the rcar_sound
was already expecting a reference to audio_clk_a, it seemed less
intrusive this way. The way I proposed, we can use the default
rcar_sound clocking and just change the audio_clk node to enable the
versaclock output.  The versaclock is driving the audio_clk_a
reference clock, so it seemed appropriate to put it there.

If you want me to change, I will.

> >
> >  &audio_clk_b {
> > @@ -591,7 +594,7 @@ sound_pins: sound {
> >         };
> >
> >         sound_clk_pins: sound_clk {
> > -               groups = "audio_clk_a_a";
> > +               groups = "audio_clk_a_a", "audio_clk_b_a";
> >                 function = "audio_clk";
> >         };
>
> Yes, this part was definitely missing.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
