Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043F12DD235
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 14:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgLQNeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 08:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbgLQNeB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 08:34:01 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E33C061794;
        Thu, 17 Dec 2020 05:33:20 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id r17so25781897ilo.11;
        Thu, 17 Dec 2020 05:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jjwZlh8+P5xdjAQxmNKObP9LCO6P25PhEfU2zCmIIo=;
        b=uGGcGK/wDVzDKdufzCc89MMDlxsTtuwvQFYZfoNjVx5DcIQn0oQa3KCpR52rZvwyjN
         qUixh4YWZXYI5/R5tOATyzRH2lwDzqLD7Gl0GY10bvSUbehLdaZsO03Q1WqwXYtPAXzb
         DgANnf+J6OKYlH7cnsqk2ASYUqUmo5G/v+83VtuFlFhTaeJwytIzfMwghOK2A/hrAj/p
         awiGQIC8VjEcda3RSSHlI8SMUlAy0PhRzn/Op0qiAre1r44OaDwxPAhQl7aebifpJiNk
         8ZanpmQ2dnPFuiuBG+ZCE1mbgdbxN9I+3n2eXMZuACyHKH8ONQIqNYqSp1gKjsnSD4IC
         m3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jjwZlh8+P5xdjAQxmNKObP9LCO6P25PhEfU2zCmIIo=;
        b=qRwBH1jV6JQnzP3QxF4Gw7M9FnUGjEge8KoFI4agPvFqGUR9kXIihrpmqokvEE8W/d
         w8uJbDkFn+vUunIa5pL3a6AH7fUDbWeAW0/lzwUhRtF7iH5Ei/qa1/gc0k6UWZv+yt1w
         knAyjmuzs544aoZNos7agUH1N0eFe4+OgmdXdwB75A6K4Xr99rED1Oo3nkh2lc7KXIJS
         MGsLNRugqeG7y0I8b5wVfK1LHYW7BduZVSj4YQEgRvrXF4MSaDc0mewmk3yKA/zEIF6w
         //QuX4UvUAEHLHGJpjxHGqGSQiGJyuCZjATeKe8z8qD6n9Yngc/047uIHtJpFe7HPwNC
         KfUQ==
X-Gm-Message-State: AOAM532aN4wR2dg4Axc2e686UdFtwg5B47GDalxKmuVPe1wLugJDB7cs
        +oqdrdIGAazQtwnh1VzpjhkDKVy/EPw+4loBmY0OUP/xESm4gw==
X-Google-Smtp-Source: ABdhPJzZdM+KhdXs045hzNvmUYkm/uIToQWw1BQSY/qolijdZMQZ9QVId3RID7/CaGKBcRjz8IyL4jZhw87muy1leGM=
X-Received: by 2002:a05:6e02:926:: with SMTP id o6mr48950963ilt.65.1608211999880;
 Thu, 17 Dec 2020 05:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
In-Reply-To: <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Dec 2020 07:33:07 -0600
Message-ID: <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
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

On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> CC alsa-devel
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > With the newly added configurable clock options, the audio CODEC can
> > configure the mclk automatically.  Add the reference to the versaclock.
> > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > that too
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -424,13 +424,15 @@ &i2c0 {
> >
> >  &i2c5 {
> >         status = "okay";
> > -       clock-frequency = <100000>;
> > +       clock-frequency = <400000>;
> >         pinctrl-0 = <&i2c5_pins>;
> >         pinctrl-names = "default";
> >
> >         codec: wm8962@1a {
> >                 compatible = "wlf,wm8962";
> >                 reg = <0x1a>;
> > +               clocks = <&versaclock6_bb 3>;
> > +               clock-names = "mclk";
>
> While the driver does get the (nameless) clock, the DT bindings lack any
> mention of a clocks property.  It would be good to update the bindings.

Agreed.  I'll push an update to add the clocks property.

>
> Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> hand) use "xclk" instead of "mclk"?

On the schematics for the two imx boards, it's labeled as xclk, so it
was named as such.  For this board, the schematic names it mclk. The
driver doesn't care about the clock-names property, so I'll just
remove them.

adam
>
> >                 DCVDD-supply = <&reg_audio>;
> >                 DBVDD-supply = <&reg_audio>;
> >                 AVDD-supply = <&reg_audio>;
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
