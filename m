Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D575B2DE3F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 15:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgLROY2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 09:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgLROY2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 09:24:28 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BA2C0617A7;
        Fri, 18 Dec 2020 06:23:47 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id 81so2139653ioc.13;
        Fri, 18 Dec 2020 06:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kg+yAMgYFLTlHGrbICoaSFL1GosZ12/l4+s47nG2NxE=;
        b=a41lRihDMJA4TP/nBOdw2eh8pG7oiVgvKaQQCFZk8Pzo1AuVl/osP+iqI2fp2+koGU
         P9Lpy/mTk6V7mbOSA2rtpaXxdCobDJn1YRzFS83JnGcpvWz8rKy9d9NHcL3FlEEzUcf8
         Mfeut7Y+n72ZZLdjqNZMns/c1BBr8pLnmn/R06ry9OOMh25KPd5znLBKguPh5wPbY3ZC
         0BCWqiqC6ZN7wXdFiHpTN7A9bjTAFo4xQXaK8JMZdh6QPfbgCsMo33HH5C2L0g6waLo/
         DfYyfzwNUHIfED0Ml9Jzk45/DifES6cyMHqF6xkpe6GjqpLETBsFf3ahBP6tQtEaWFS4
         Hl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kg+yAMgYFLTlHGrbICoaSFL1GosZ12/l4+s47nG2NxE=;
        b=meVgNi7NxbWHc+blRk8L+D2dZG2lRVEkyIerKedOvXDwCjYMqBPmxv9kAVGEl31ADo
         +gwwPEW4on0dXtX0w7iizp+5GQJHSu5B3u/F5GxNES59WiNrP0FTi83WkzHCdlnJALqk
         Rm/c5lxiKyMSxqOrlmwmzP1J6EbvxpIkXITKT6lrydw/XUkEyTgKn94lbqQ/HQRp4nYw
         EXqGnHCf4v8UOAosPlDYG0BftSze56ukaJcxhZ0/dJi0Rq1rnOHluJnFo2e2PLgD3wnj
         gnGkPCV+gLJcNAxe18UIeKdetlg41HODuTfSS4EN3F4UtC83mWYkoxRI4u+718PXTcAv
         Q1hw==
X-Gm-Message-State: AOAM530Q8p65jEUZJJHJTqE6t6g3bzw1fnyw8l8YbrmxdaUzNc25GWys
        upyBaUi9ADQSVETM2ljiZNCOM2zvQFQscqwv/60=
X-Google-Smtp-Source: ABdhPJypnNeIYn+W4o/Ji0n2E5B65wD4Kl9KP5xwOzucGSlZMNeu9e3eh+wZiO8tVDq4izdDW6Kkt1ZUGsqfN4R7140=
X-Received: by 2002:a02:ca09:: with SMTP id i9mr3829996jak.135.1608301426863;
 Fri, 18 Dec 2020 06:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
 <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com> <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
In-Reply-To: <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 18 Dec 2020 08:23:35 -0600
Message-ID: <CAHCN7xKyHckOvLh9U+21dsKMshwA1LyTzTexxAY0akVcJHJD0Q@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Fri, Dec 18, 2020 at 6:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Thu, Dec 17, 2020 at 2:33 PM Adam Ford <aford173@gmail.com> wrote:
> > On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > CC alsa-devel
> > >
> > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > With the newly added configurable clock options, the audio CODEC can
> > > > configure the mclk automatically.  Add the reference to the versaclock.
> > > > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > > > that too
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > @@ -424,13 +424,15 @@ &i2c0 {
> > > >
> > > >  &i2c5 {
> > > >         status = "okay";
> > > > -       clock-frequency = <100000>;
> > > > +       clock-frequency = <400000>;
> > > >         pinctrl-0 = <&i2c5_pins>;
> > > >         pinctrl-names = "default";
> > > >
> > > >         codec: wm8962@1a {
> > > >                 compatible = "wlf,wm8962";
> > > >                 reg = <0x1a>;
> > > > +               clocks = <&versaclock6_bb 3>;
> > > > +               clock-names = "mclk";
> > >
> > > While the driver does get the (nameless) clock, the DT bindings lack any
> > > mention of a clocks property.  It would be good to update the bindings.
> >
> > Agreed.  I'll push an update to add the clocks property.
>
> Thanks!
>
> > > Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> > > arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> > > hand) use "xclk" instead of "mclk"?
> >
> > On the schematics for the two imx boards, it's labeled as xclk, so it
> > was named as such.  For this board, the schematic names it mclk. The
> > driver doesn't care about the clock-names property, so I'll just
> > remove them.
>
> If there's a single clock, not using clock-names is fine.
> If you do use clock-names, the names should be clock-centric, not
> board-centric.

I already submitted patches to remove the clock-names reference from
the other two boards you noted [1].  I agree it should match  the
driver and not the schematic.  That line was a left-over from our
internal git repo where the decision was used to follow the schematic
and not the driver.

Thanks for bringing that to my attention.

adam

[1] - https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=403739

>
> BTW, looking at the WM8962 datasheet, it's called "MCLK".
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
