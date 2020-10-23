Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F098296F16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 14:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372366AbgJWM1p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 08:27:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46396 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S372336AbgJWM1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:27:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id m11so1105140otk.13;
        Fri, 23 Oct 2020 05:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DJdSBX8szjPIQTzW3YOotIcf7ou9mdsTh5wLqX75BY=;
        b=p1s9JDXcDKVHPd0Mgzy3UrNPRzpRA8wbvM7ZWGWd8jk2ryN5ap7Uj36rDKskNPwdbf
         NAyEhWfXpD3OBKp9WG60d9i/Z9T6lDnnJpr0deO74hJ89lOK2ppObYxxmxS9j08gddg9
         j6m5GI3X43JSKSuxOpVGgbDkfuELsN9C879SdkPrwJ1G47BWvp/gpfbJmfIVb/5ntY09
         FksOQDLst2UucgiGjUxKS5Sc2IPj5mQh3sN1exN10QrVhYkmxXiMbMg+KABulWhoxUzD
         5ba6yQjQyGXoGyLWkFZL0FzTVg15J0G1ihsu8jrbKbPDXjs5UY5Dc5scFpyUffJpQg/C
         rQEg==
X-Gm-Message-State: AOAM533g62Scwn0SJ1cCh2bQlDRcfuLN57RvdG98iF0mJPB4mtJzuvhW
        eFCMTZ3mt/Szz/xvAZkSOT5KcQaQS5yY7+EVr2c=
X-Google-Smtp-Source: ABdhPJwiBclRgBdQun4m/ALyo0tNEmcyRt7kZ1P01gqOGx+xWvdDGvTiCYRy3lO/LZShQ2oADx+B7Oxd/IEONlWbHUY=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1239076oti.107.1603456063222;
 Fri, 23 Oct 2020 05:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201023075530.19295-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW0d3WRwupF-ZEnMdkumwLtRAw9yCLnb4AJ3RGZGP7Hwg@mail.gmail.com> <CA+V-a8sEmC7oDdtc7tgK8D47P=V-tW8PExqpJkwU6=tZ6tb_dg@mail.gmail.com>
In-Reply-To: <CA+V-a8sEmC7oDdtc7tgK8D47P=V-tW8PExqpJkwU6=tZ6tb_dg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 14:27:32 +0200
Message-ID: <CAMuHMdUqXD6XunzgKNXBarJXAdpmAz4wbiiyyc0w_v1rihqfUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: hihope-common: Add optee node
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

CC Marek

On Fri, Oct 23, 2020 at 12:03 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Oct 23, 2020 at 10:50 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Oct 23, 2020 at 9:56 AM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add optee device tree node to HiHope RZ/G2{HMN} boards.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > @@ -110,6 +110,13 @@
> > >                 #clock-cells = <0>;
> > >                 clock-frequency = <25000000>;
> > >         };
> > > +
> > > +       firmware {
> > > +               optee {
> > > +                       compatible = "linaro,optee-tz";
> > > +                       method = "smc";
> > > +               };
> > > +       };
> > >  };
> >
> > Should this be added to the SoC-specific .dtsi instead?
> It's a bit tricky, the reason I put in board files is due to current
> boards having optee do the same. Let me know if you want me to move
> the nodes to SoC dtsi

At least the Layerscape and K3 SoCs do have the optee node in the
SoC-specific .dtsi...

Given it needs a special TFA, it's probably safest to pass this through
the firmware stack, cfr. the memory nodes?

> > How can we test this?
> This needs a special TFA (by special I mean optee enabled
> (SPD="opteed")) and In Linux we need the below configs enabled:
>
> CONFIG_TEE=y
> CONFIG_OPTEE=y
> CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
>
> Once Linux is booted up this exposes a optee device which can be used
> for communication. I have used optee_test [1] test-suite (xtest) to
> make sure all the tests pass (I have attached results for RZ/G2H for
> reference).
>
> [1] https://optee.readthedocs.io/en/latest/building/gits/optee_test.html

Thanks, that is very valuable information!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
