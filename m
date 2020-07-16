Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1E4222157
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 13:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgGPL1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 07:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgGPL1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 07:27:38 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF04C061755;
        Thu, 16 Jul 2020 04:27:38 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p15so4687856ilh.13;
        Thu, 16 Jul 2020 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r1Nbw723xRe0D2BBkUXpJ7ShezLnvTtLnosvWdL1Azg=;
        b=AnJd5dGaykfwBK08S9lQ0poe3iNdNYwMyMBOl8233ingMIsplvheDpIsF9NBiyvME5
         perMgBJB1kfnDh3AOpAuSFJOXg7Q6q8UnOo15c9CtCVmShd4xNKos/371dpew/q38lrp
         MFtLc4T/W7s3xM0TD8TY2IY11PcezPW19LFo+SKs2BzLhYb0bBVp2sWAClmoa5YLRKyP
         DsmTeN2cLpDJ/p6oGFvae8oekGjCc0blhTULpGDYptryLbEb2Ph8Ad3NOcpNGNGunmc0
         7ZNhYz0FlWRbaJSvhkz2FSONHaCy6K8npyL0jlvuIajPpwap75DKhAJ1/UaH2+FaaYXH
         g89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r1Nbw723xRe0D2BBkUXpJ7ShezLnvTtLnosvWdL1Azg=;
        b=PeZfUxMY+IE7Lp7Nslg9FENPwVLthlOFuzP4wCjdFPu5wa2TBIMechal3iGDO72+Hv
         N1ofryzXjpYLf7Kg4iXYO07AzVTtLVHEGYITuGNTYTIqAqNZR5ScLRaEGEiBv0UltS40
         DRwQxl9MKC/CRD2ULxfTyYoqQgdh9OSEntaZHZjOQdRTlXQ45CO3gSC+oItbNqxa9pUR
         adhvNRI9uwECi70CYyp931CHIf0ilq4bBQRk50tLklQU+WNttlRh9ih0JCqvh4cBQCL9
         Ns8kmomf1twFO/1fz4BYxq2fNJBteH9u7O+5F2e24lXSgqBOEoIhkwdD+CZYpI7yRXCc
         Ro1Q==
X-Gm-Message-State: AOAM533urvCrubZUYOHdAj/MzinYtwOaU1zeMRkOJ0UsygTzwUMbiKD6
        kcEGo0ScQ1z07q4J1OND0ZgPtNLJs3mW9xeS0lg=
X-Google-Smtp-Source: ABdhPJx6MgANsHMj9B5Wb2FN8dd/SUw9STBAQjeDTAUHA2tFBS9y904MgD8pFIsE8i64R3pwaf88QZQH0nvkIBxOmZc=
X-Received: by 2002:a92:5a52:: with SMTP id o79mr4043958ilb.89.1594898857518;
 Thu, 16 Jul 2020 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200617120510.25071-1-aford173@gmail.com> <CAMuHMdWjpyi6QiGTHkwXcepMzP8hN7MkXSJ=Xnxn40VkRU9OXg@mail.gmail.com>
 <CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com>
 <CAHCN7xLygG5YRG0wt0b9JWW3PHDwMV_kiLRpJqPdSAx7gOoc9w@mail.gmail.com>
 <CAMuHMdWzcKa1xXdQ8W=fmjTKvPRN68GNVhBi4pFD5OW1_R_aAw@mail.gmail.com>
 <159485990993.1987609.15025594064431049459@swboyd.mtv.corp.google.com> <CAMuHMdVEVNOex0uk1Ko0rghskmephYWGe49e4hUbbfdgSUBCtQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVEVNOex0uk1Ko0rghskmephYWGe49e4hUbbfdgSUBCtQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 16 Jul 2020 06:27:26 -0500
Message-ID: <CAHCN7xJ3ccwQtieUA-8gXAitQaTvuF=DrX-UW1hhhPcjr=tr0g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Linux Kernel Mailing List" 
        <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 16, 2020 at 2:39 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Stephen,
>
> On Thu, Jul 16, 2020 at 2:38 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2020-07-13 05:45:00)
> > > On Thu, Jul 9, 2020 at 12:00 AM Adam Ford <aford173@gmail.com> wrote:
> > > > On Wed, Jul 8, 2020 at 4:53 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > On Mon, Jun 22, 2020 at 8:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, Jun 17, 2020 at 2:05 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > > Beacon EmebddedWorks, formerly Logic PD is introducing a new
> > > > > > > SOM and development kit based on the RZ/G2M SoC from Renesas.
> > > > > > >
> > > > > > > The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> > > > > > > cellular radio.
> > > > > > >
> > > > > > > The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> > > > > > > along with a vareity of push buttons and LED's.
> > >
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > @@ -0,0 +1,733 @@
> > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > +/*
> > > > > > > + * Copyright 2020, Compass Electronics Group, LLC
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > > > +#include <dt-bindings/input/input.h>
> > > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > > >
> > > > > > This depends on "[PATCH V3 2/3] dt: Add additional option bindings for
> > > > > > IDT VersaClock", which hasn't been accepted yet, AFAIK.
> > > >
> > > > Geert,
> > > >
> > > > I forgot to ask.  What is the protocol for something when new bindings
> > > > have been accepted in one branch, but another branch where I want to
> > > > reference them hasn't merged with the other branch?  I'd really like
> > > > to get this board into the next kernel.  I could remove these
> > > > references and the calling functions, but that may cause instability
> > > > due to undefined behaviour of some of the versaclock functions because
> > > > they are not programmed.
> > >
> > > As soon as a binding update has been accepted into the maintainer's
> > > for-next branch, I happily accept DTS patches that start using it,
> > > unless doing so would introduce a regression.
> > > In this case, it's not a pure binding update, but also an update to
> > > binding definitions in a header file, thus creating a hard dependency.
> > > Usually this is mitigated by committing the header file change to an
> > > immutable branch, to be shared by driver and DTS, and to be pulled by
> > > all maintainers affected by the dependency.
> > >
> > > As Stephen has already applied the binding update to his clk-next
> > > branch, it's too late to go for the immutable branch approach.  Hence
> > > the simplest solution would be to postpone your DTS patch to v5.10.
> > >
> > > > However, I would rather have the board mostly work if it means getting
> > > > it accepted into the kernel.  Beacon hasn't shipped any outside of the
> > > > company yet, so I am not really worried about people seeing problems.
> > > > If the board gets accepted without these, I could apply some 'fixes'
> > > > at a late date to correct the undefined behavior.  Let me know what
> > > > the best way to proceed should be, and I'll send a V2 patch.
> > >
> > > An alternative would be for me to cherry-pick commit 34662f6e30846ae0
> > > ("dt: Add additional option bindings for IDT VersaClock") from the
> > > clk-next branch into renesas-devel, before applying your patch.
> > > While that would help you, it may introduce a merge conflict for
> > > linux-next and for upstream later, as Luca has already posted multiple
> > > patches for idt,versaclock5.txt, to fix typos and do the json-schema
> > > conversion.  These may or may not land in v5.9.
> > >
> > > Stephen: what do you think?
> > > Thanks!
> > >
> >
> > Do you need to use something in clk-next as an immutable branch?
> > Typically I don't rebase patches once applying to clk-next and all
> > patches are put on topic branches in case something is needed in another
> > tree. So you should be fine to pull the clk-vc5 branch (which is sort of
> > busted) into your dts tree, or if you need the defines/numbers in the
>
> busted?
>

I owe a fix for the VC5 driver, but I was focussed on getting the new
dev kit pushed.  My goal is to have another revision of the fix pushed
today.

> > header file you can use the raw numbers and then replace them with the
> > includes after -rc1.
>
> Thanks, I forgot about the raw number solution, as it's been a while I
> used that.  In the meantime we solved the issue by postponing the new
> VC5 options.
> Adam: if you still want to send a v4 using the raw numbers, feel free
> to do so.

It's in the queue now, so I'll hold off.  I have a few other fires to
put out before the end of the week.

thanks,

adam
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
