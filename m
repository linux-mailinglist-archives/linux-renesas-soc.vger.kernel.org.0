Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3902DD6A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 18:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgLQR7E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 12:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgLQR7E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 12:59:04 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B614CC0617A7;
        Thu, 17 Dec 2020 09:58:23 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id 81so28306095ioc.13;
        Thu, 17 Dec 2020 09:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jy9Wo6K2J/ZSSCkdeQ2xq3mmopXJVycRBgl/dvb3y3M=;
        b=ZWHmreiH5rqp0TCgo6Tc0AUX6gwk++F5zyVRI2cszk+zlJBORCLTYuPAP1EaF5Ws+J
         t1/87AfU+EwrH7w2NFaRQMGrNTmzc1GBXhOFzSCU1SzTUd/H7qJEEZPicbDYG+FE1BiB
         rfCUhlHFH9+cTlKreuUCB9pzkCIcOyUAHoINRYsEmWSuoNh2XLnz0yOKgXGinmEbjFHw
         6nz38TBwwuhGK2H9ueOUyJsWIWRR1gDwsiP8SYZcLDR/rD+LQXGtYfezzSqfwqPovsL2
         2LPXLq7Spblx2sCfdJaJqwCKSicmgi/wbkYDY50dO8WsF8pC+h6oTcE9UVeMJt2jz2Q8
         BWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jy9Wo6K2J/ZSSCkdeQ2xq3mmopXJVycRBgl/dvb3y3M=;
        b=on685f5O7eDYJjWX/wGY4zp3qXcUxBzvidCsZPGwIDJx7CsfqxrSs4qym57d+X3Lxr
         QwxC/DuANKWDG67LFJVZLgJTZPWWrPbc//c3t18g/t5O6L2apRkrcbbF659rvHkLMO6q
         ExPkml++uvs9jvtUz/mK2Jodymn/SK/kI28hMgnPiuP6xQpNeJlRP8Z6RhnGlkWImixO
         UbP9THgtBi+913StxVH+uUH53bd2M03WxsaHHeVvf084ktaap1UTWGwjB26To6Bk5clM
         XXunDIDB02YQ7+8YmWYKF4uVq1QUizTApQdBfPun46GZMOKo655KGubIa/im0Lv1PYHt
         /fhA==
X-Gm-Message-State: AOAM531ZgC5/2LwxOehExM1lE7NqxKRDMyWM6ooIvUugN7KoCq2DdUbX
        1KY2np+M0rky9fPvDY7RcuMaI5UBxBIFbyilIG4=
X-Google-Smtp-Source: ABdhPJxdAlerYP+JuD9biEEY39A4kN8rW0oldiaXIBGS0l5gLJQZoPQTKREgpdu4SWSftFhfVFo5D82LYpvmLPxAnkE=
X-Received: by 2002:a6b:f401:: with SMTP id i1mr261498iog.142.1608227903009;
 Thu, 17 Dec 2020 09:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com> <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
In-Reply-To: <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Dec 2020 11:58:11 -0600
Message-ID: <CAHCN7xKdVv==YLtSa3n2hQk2T+f+FkLqKDNTYkP_3ynnY+xRCg@mail.gmail.com>
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

On Thu, Dec 17, 2020 at 7:33 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Adam,
> >
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
>

I pushed a change to add the optional clock information to the
bindings txt file [1].
> >
> > Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> > arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> > hand) use "xclk" instead of "mclk"?
>
> On the schematics for the two imx boards, it's labeled as xclk, so it
> was named as such.  For this board, the schematic names it mclk. The
> driver doesn't care about the clock-names property, so I'll just
> remove them.

I pushed patches to remove these nodes from the other boards [2].
I'll remove them if V2 of the patch series for the Renesas board.

adam
[1] - https://patchwork.kernel.org/project/alsa-devel/patch/20201217162740.1452000-1-aford173@gmail.com/
[2] - https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=403739

>
> adam
> >
> > >                 DCVDD-supply = <&reg_audio>;
> > >                 DBVDD-supply = <&reg_audio>;
> > >                 AVDD-supply = <&reg_audio>;
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
