Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359802DE2F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 13:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgLRM6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 07:58:24 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:32888 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgLRM6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 07:58:24 -0500
Received: by mail-ot1-f45.google.com with SMTP id b24so1828068otj.0;
        Fri, 18 Dec 2020 04:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nw9EMgBnuebmSA/eYty+YbhjJO9tx7n6Ij1TQfze3Sk=;
        b=INdLSKvqhdp3lpERp7qLeRXILXEMbAXW5AhZ5Q0coo6EoEE8aMt62s6L5shnxl2V2f
         SBAw2NI23ixMi6iiIBW4cG+cthOgrfAN33x5nUGPkrNrn4/Tythz9CU1g6eZcQDa4awi
         WXUqKFxWbnSnbWe/cbBEvSuJbRatCIk0BEnVisB+Wv0J1rNWL86lSkADZ0NvjRsvlB10
         jpij8cMi973NjgMtiRR21iabtHCh3UcoHv5v5Y6Rto7FlJIvelRLNc1DYMLQtezxxQtq
         JHlvmW0AgbOcTBciYt7rLBiLzbbpzSu9EM+UteZ3xfzomaCFAim9/OK/wLsqdvT6rd6L
         VWIQ==
X-Gm-Message-State: AOAM533IFAk+Nt76KgjQYPwjFteBUP94oFpB7XjUgc9QBsB1CElDoxbh
        +yAOUsaNU2vk+3NGHRsNEJThW5JieRWFm3pw8L0=
X-Google-Smtp-Source: ABdhPJzF0RSOZYgTecBqyxPakGWb84W0hkuZ/n9XaI2yj+auV3WrPoUbWwHUSLvzrySPPyJvlIjyekYSBmOkSuZLCgc=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2657442otc.145.1608296263283;
 Fri, 18 Dec 2020 04:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com> <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
In-Reply-To: <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 13:57:32 +0100
Message-ID: <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 17, 2020 at 2:33 PM Adam Ford <aford173@gmail.com> wrote:
> On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > CC alsa-devel
> >
> > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > With the newly added configurable clock options, the audio CODEC can
> > > configure the mclk automatically.  Add the reference to the versaclock.
> > > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > > that too
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > @@ -424,13 +424,15 @@ &i2c0 {
> > >
> > >  &i2c5 {
> > >         status = "okay";
> > > -       clock-frequency = <100000>;
> > > +       clock-frequency = <400000>;
> > >         pinctrl-0 = <&i2c5_pins>;
> > >         pinctrl-names = "default";
> > >
> > >         codec: wm8962@1a {
> > >                 compatible = "wlf,wm8962";
> > >                 reg = <0x1a>;
> > > +               clocks = <&versaclock6_bb 3>;
> > > +               clock-names = "mclk";
> >
> > While the driver does get the (nameless) clock, the DT bindings lack any
> > mention of a clocks property.  It would be good to update the bindings.
>
> Agreed.  I'll push an update to add the clocks property.

Thanks!

> > Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> > arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> > hand) use "xclk" instead of "mclk"?
>
> On the schematics for the two imx boards, it's labeled as xclk, so it
> was named as such.  For this board, the schematic names it mclk. The
> driver doesn't care about the clock-names property, so I'll just
> remove them.

If there's a single clock, not using clock-names is fine.
If you do use clock-names, the names should be clock-centric, not
board-centric.

BTW, looking at the WM8962 datasheet, it's called "MCLK".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
