Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940EA25E0AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 19:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgIDRYj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 13:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgIDRYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 13:24:39 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B11FC061244;
        Fri,  4 Sep 2020 10:24:39 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id x2so4910742ybf.12;
        Fri, 04 Sep 2020 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBnolezTElMG3DPNCT0X2miQ6xV0AeQAGXqt2ZRlAS4=;
        b=pzpG0aWb2xH0/LYQzXWoFkg3lHCNMR4zgmUKPkAZLpvxi6VJbalfUoh36yrYjCcgSF
         Fu3BR9H5biF1rgC1bUfrDs//yjDyZgHb/nZ8LXofgV0x3m81Scbf3tWA8m72rzdRh7we
         qOM8JlsnZC7okrToVOVu77FCXWSnihR7LlaVW5wgsKXxtYwePg/qHxJXDdq324u7X7nE
         XXotiWEDEedvO41JyUyQyf4sJKIKw2Q0gyIptS5sTLgBUAqbDtbnmXeGQndQI46M5nLt
         uJLx5SOgNsSpFNH/0pDIBQS9HA7nE1fWBE97TEVKT/ITowkJSWR94ay4zngxCY3r47YX
         azyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBnolezTElMG3DPNCT0X2miQ6xV0AeQAGXqt2ZRlAS4=;
        b=ufZueNzjTeuqzC0Hmeu3I9p6x3+GGLJbTWWLd82AFdK+Oc5rxmbxC9IFg7WgHsDMzu
         nzEgh4+9OhEnuzB8enHW0W+d4RM29k7kMXU6wfMjoiJxfftYP2kc3ATLo5cuyWd2QR2B
         uS/2DjsQcgk3eDiAvCc8dOr1S4+7jqdCLecpzf58uZi+wjpwDwzLACt3S5SFz/P3gNpD
         hMAt/G+TbTgZ4QrzJzXdu7pZ7hxD6oIS/NOsD5xUfQobCBnnjb+dNDLpsOeQh9y3d27x
         KNf/tDJYzheSRgiID8v/vBgc4iITs8i4FRmn+MVQQZRYBa3UB5xaF9BaQUvDvsjAjpD+
         t6Sw==
X-Gm-Message-State: AOAM532G2aIytFI2hw4JML+7/+DtkOmvHO8ZHPp0UqfnaRjWTzh4YDzn
        hMDZdniTxBAKlmYxJ+CZ0hJNrpA5N3BhNW3WYiU=
X-Google-Smtp-Source: ABdhPJxwKhTzY9vinoG67Ge0rXX5teef5N78CegffiHZm3jy/a5wyIUPzflHeDMrSP7T1EK9XMElRlnD+XErf6s44vg=
X-Received: by 2002:a25:ab91:: with SMTP id v17mr10932172ybi.76.1599240277482;
 Fri, 04 Sep 2020 10:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXm9D8-bg3XdGqD7AKe2vMiZLNWENH3A0w-b7j=qZS=pA@mail.gmail.com>
In-Reply-To: <CAMuHMdXm9D8-bg3XdGqD7AKe2vMiZLNWENH3A0w-b7j=qZS=pA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 4 Sep 2020 18:24:11 +0100
Message-ID: <CA+V-a8to=PY2_4gHh6V33mRVXJC4QGJzEg2q2NVWzot9TmXAtA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Add SPI NOR support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Sep 3, 2020 at 12:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for the SPI NOR device which is connected to MSIOF0 interface
> > on the iWave RainboW-G21d-q7 board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -220,6 +220,32 @@
> >         status = "okay";
> >  };
> >
> > +&msiof0 {
> > +       pinctrl-0 = <&msiof0_pins>;
> > +       pinctrl-names = "default";
> > +       cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> > +
> > +       status = "okay";
> > +
> > +       flash1: flash@0 {
> > +               compatible = "sst,sst25vf016b", "jedec,spi-nor";
> > +               reg = <0>;
> > +               spi-max-frequency = <50000000>;
> > +               m25p,fast-read;
> > +
> > +               partitions {
> > +                       compatible = "fixed-partitions";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       partition@0 {
> > +                               label = "user";
> > +                               reg = <0x00000000 0x00200000>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> >  &pci0 {
> >         pinctrl-0 = <&usb0_pins>;
> >         pinctrl-names = "default";
> > @@ -266,6 +292,11 @@
> >                 function = "i2c2";
> >         };
> >
> > +       msiof0_pins: msiof0 {
> > +               groups = "msiof0_clk", "msiof0_tx", "msiof0_rx";
>
> I think you're missing "msiof0_sync", connected to SPI_CS0#?
>
Agreed will fix that and post a v2.

Cheers,
Prabhakar

> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > +               function = "msiof0";
> > +       };
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
