Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638903B197E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 14:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhFWMCX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 08:02:23 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:41762 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWMCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 08:02:22 -0400
Received: by mail-vs1-f47.google.com with SMTP id c26so1272637vso.8;
        Wed, 23 Jun 2021 05:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8x80G2mIS7pE26DDygw2X58AHmPCyPwyKo/eXHOyEY=;
        b=GsCEfRQuPqMAqG8imqHEbstLKvpe6WVyQCm5dvHaj9a1QxOQQoD4uSgMGrkIJVAiA/
         1YDZ4TWZhdwo8T7/JKXj7Qiupy8w6vidzmFs5klyV23/rNh1dzGJ9yGkxuORNxurF3fH
         AV5k+MxlNBSj3RfJ3asotQgn+Pc+/r+Riig43i6nIg4mLXz1Xz5KChZTOXgqjq8zeLkT
         z9+htNw6KRmRH3S4yptJCJZ/8OV1Ruj1vhx6Zec1FaHjZafwsgS2QM4eaSX73UzjmsFw
         FuX+KkhTPK6Bi7ENCDAOZK4/AIohR4by9yFiUWz+bNANWl8kMcQlt1mhH2nlMlKskog0
         zDOg==
X-Gm-Message-State: AOAM531/L3A+NXM8j27Nozhsa+Bi+xWKEVpa3nentM+GYrrjAsW4Hpl7
        +Hyw47YzcX4u8hhNnM2e5TODd6sIDFpPF8LMdBkPL1+Per1QEw==
X-Google-Smtp-Source: ABdhPJwDPJczvLOTuWws/26sKDqOlmCL/uLDtd0ogMRs9aC0L9VxH9eddsSzWXCdV/Y4+/fGhQS2LgqUAfMy3CwmPW8=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr28193658vss.18.1624449603359;
 Wed, 23 Jun 2021 05:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-2-biju.das.jz@bp.renesas.com> <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
 <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWQK_k3ePJpx2CF-X9TNgPYzzP8AW9N2rDjXSOAP2wNxQ@mail.gmail.com> <OS0PR01MB592205558A2738A271D727D486089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592205558A2738A271D727D486089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 13:59:51 +0200
Message-ID: <CAMuHMdWqknU6TAauueUHcCMh0cXOn7Xwy_HrnVM5-q7GX2UMaQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jun 23, 2021 at 1:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
> > definitions
> > On Tue, Jun 22, 2021 at 11:26 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update
> > > > clock definitions On Fri, Jun 18, 2021 at 11:58 AM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Update clock definitions as per the RZG2L_clock_list(Rev.02) manual.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Reviewed-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/include/dt-bindings/clock/r9a07g044-cpg.h
> > > > > +++ b/include/dt-bindings/clock/r9a07g044-cpg.h
> >
> > > > I do think we need a separate list of definitions for resets.  While
> > > > simple modules like SCIF and I2C have a one-to-one mapping from
> > > > clock bits to reset bits for, this is not the case for all modules.
> > > > E.g. SDHI has 4 clocks per instance, but only a single reset signal
> > > > per instance, while CANFD has a single clock, but two reset signals.
> > >
> > > OK, Agreed. We will list separate definitions for resets like,
> > >
> > > #define R9A07G044_RST_SDHI0             X1
> > > #define R9A07G044_RST_SDHI1             X2
> > > #define R9A07G044_RST_CAN               X3
> >
> > Please use names that match the documentation, like R9A07G044_SDHI0_IXRST
> > and R9A07G044_SDHI0_CANFD_RSTP_N.
>
> Just rethinking by looking at R-Car approach, We may not need defining resets in dt-binding file.
>
> We can create a 16 bit unique index with register offset in the last 12bits and control bits in last 4 bits.
> Device tree passes this index and driver extracts this info for reset handling.
>
> This will avoid dt-binding dependency. Are you ok this approach for resets?? What about clock, existing method or similar 16bit index method??
>
> Please share your thoughts.

I did consider that option, too.  However, you would still need a bit
of thought/processing to convert from register offsets and bit indices
to clock/reset numbers and vice versa.
Compare this to MSTP clock numbers on R-Car (and GIC SPI IDs, and
DMA slave MID/RIDs), where you can just read the number from a table in
the Hardware User's Manual.
So I think it's easier to have a list of clock definitions in a
dt-bindings file.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
