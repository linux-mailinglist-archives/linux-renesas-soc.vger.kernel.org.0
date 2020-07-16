Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AC5221D85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 09:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgGPHjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 03:39:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34565 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPHjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 03:39:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id e90so3501588ote.1;
        Thu, 16 Jul 2020 00:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGU21hGDTvPo5e64AOIXhTJHwKIyllgjAL5yrIBEfv0=;
        b=AR3/WqsiURXFNbRd1xIzzQyp1vBgSIGi0IZPhd31YRIK2RKl1jY06sqfO9JwbffGSE
         nY+jk2+W8gsOwZdQB2IcinhMQRVYbIlG15zhDKka6fQcDqT/dPOCgNuLP8SxO1suEXLP
         p2iNmkP97DSt/TXfyY7X5rAHa5coJWshkNurqiPa1/scUDgN3dIH1m4aDUaBeMQRwIqg
         hlFEBPTGTIGgYp9JrgH1BKD8wGD3oON1QUSFY5GAPA/sgIiWYA3C/A76QFub+uwHFr9s
         pM1kGc5S+KHyaIio5e+hh7P/iLiNbdIn//1uQzjm8Os8DNsvR+nnNr+vPO9fBp+OT9sv
         upUw==
X-Gm-Message-State: AOAM532NdbKgibuLulr1U4xhKiZZ/ZqQI1xu/Qb/6c4x8pyHfIZAG36X
        J34UC9kZ/dcY+2fSyOQXTu0Hcx8YLHjIDA3IJVmka11N
X-Google-Smtp-Source: ABdhPJx9vJHqYPZPrI7xMsDb6HaOSr/GTybLWjvDsM+J4nlT/u70YAdUZN81Vbcd7ftkn/6LlKr5qyL/H11n5XxMZlA=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr3298536otp.250.1594885163502;
 Thu, 16 Jul 2020 00:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200617120510.25071-1-aford173@gmail.com> <CAMuHMdWjpyi6QiGTHkwXcepMzP8hN7MkXSJ=Xnxn40VkRU9OXg@mail.gmail.com>
 <CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com>
 <CAHCN7xLygG5YRG0wt0b9JWW3PHDwMV_kiLRpJqPdSAx7gOoc9w@mail.gmail.com>
 <CAMuHMdWzcKa1xXdQ8W=fmjTKvPRN68GNVhBi4pFD5OW1_R_aAw@mail.gmail.com> <159485990993.1987609.15025594064431049459@swboyd.mtv.corp.google.com>
In-Reply-To: <159485990993.1987609.15025594064431049459@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 09:39:12 +0200
Message-ID: <CAMuHMdVEVNOex0uk1Ko0rghskmephYWGe49e4hUbbfdgSUBCtQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
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

Hi Stephen,

On Thu, Jul 16, 2020 at 2:38 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-07-13 05:45:00)
> > On Thu, Jul 9, 2020 at 12:00 AM Adam Ford <aford173@gmail.com> wrote:
> > > On Wed, Jul 8, 2020 at 4:53 PM Adam Ford <aford173@gmail.com> wrote:
> > > > On Mon, Jun 22, 2020 at 8:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Jun 17, 2020 at 2:05 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > Beacon EmebddedWorks, formerly Logic PD is introducing a new
> > > > > > SOM and development kit based on the RZ/G2M SoC from Renesas.
> > > > > >
> > > > > > The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> > > > > > cellular radio.
> > > > > >
> > > > > > The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> > > > > > along with a vareity of push buttons and LED's.
> >
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > @@ -0,0 +1,733 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * Copyright 2020, Compass Electronics Group, LLC
> > > > > > + */
> > > > > > +
> > > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > > +#include <dt-bindings/input/input.h>
> > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > >
> > > > > This depends on "[PATCH V3 2/3] dt: Add additional option bindings for
> > > > > IDT VersaClock", which hasn't been accepted yet, AFAIK.
> > >
> > > Geert,
> > >
> > > I forgot to ask.  What is the protocol for something when new bindings
> > > have been accepted in one branch, but another branch where I want to
> > > reference them hasn't merged with the other branch?  I'd really like
> > > to get this board into the next kernel.  I could remove these
> > > references and the calling functions, but that may cause instability
> > > due to undefined behaviour of some of the versaclock functions because
> > > they are not programmed.
> >
> > As soon as a binding update has been accepted into the maintainer's
> > for-next branch, I happily accept DTS patches that start using it,
> > unless doing so would introduce a regression.
> > In this case, it's not a pure binding update, but also an update to
> > binding definitions in a header file, thus creating a hard dependency.
> > Usually this is mitigated by committing the header file change to an
> > immutable branch, to be shared by driver and DTS, and to be pulled by
> > all maintainers affected by the dependency.
> >
> > As Stephen has already applied the binding update to his clk-next
> > branch, it's too late to go for the immutable branch approach.  Hence
> > the simplest solution would be to postpone your DTS patch to v5.10.
> >
> > > However, I would rather have the board mostly work if it means getting
> > > it accepted into the kernel.  Beacon hasn't shipped any outside of the
> > > company yet, so I am not really worried about people seeing problems.
> > > If the board gets accepted without these, I could apply some 'fixes'
> > > at a late date to correct the undefined behavior.  Let me know what
> > > the best way to proceed should be, and I'll send a V2 patch.
> >
> > An alternative would be for me to cherry-pick commit 34662f6e30846ae0
> > ("dt: Add additional option bindings for IDT VersaClock") from the
> > clk-next branch into renesas-devel, before applying your patch.
> > While that would help you, it may introduce a merge conflict for
> > linux-next and for upstream later, as Luca has already posted multiple
> > patches for idt,versaclock5.txt, to fix typos and do the json-schema
> > conversion.  These may or may not land in v5.9.
> >
> > Stephen: what do you think?
> > Thanks!
> >
>
> Do you need to use something in clk-next as an immutable branch?
> Typically I don't rebase patches once applying to clk-next and all
> patches are put on topic branches in case something is needed in another
> tree. So you should be fine to pull the clk-vc5 branch (which is sort of
> busted) into your dts tree, or if you need the defines/numbers in the

busted?

> header file you can use the raw numbers and then replace them with the
> includes after -rc1.

Thanks, I forgot about the raw number solution, as it's been a while I
used that.  In the meantime we solved the issue by postponing the new
VC5 options.
Adam: if you still want to send a v4 using the raw numbers, feel free
to do so.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
