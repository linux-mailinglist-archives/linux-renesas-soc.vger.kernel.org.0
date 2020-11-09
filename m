Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559FA2AB47E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgKIKK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:10:26 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44111 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIKK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:10:26 -0500
Received: by mail-oi1-f193.google.com with SMTP id t16so9620561oie.11;
        Mon, 09 Nov 2020 02:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1Oy8OE2xZ2474nGfbp9uV2M7NYS3R0kpl7B1Pwaatw=;
        b=sZNp0LSVluJAQqyq/0TuwqcvF5f0mKTpLxx0m+0s/PPFkson5lbMMTmB7fnxwEihBC
         +dIrECY7840OpfDix8ffm/jgzRRaS0V+9KnU3Mod4RLIi9kj6EHqfG6uZkqgTkuyColW
         8spSCoxaqrBH18D1Jjpj4nxLOBmwwImLvpSFqPa+8Sz5Pkln2ibr4b6GA3uqts7KGs94
         Y0sC6hwmHjAVkvkXV183btVLgE4L/GG70Sm0t9uWTU0mB+Tlfn5wUXNU9vaglAZFo6L7
         O9jUUdj3nKbRe1rOdYM5lcW7RdynbEnzsfJ51aPi081YIQj1Q8N3lb2rCd6/uhcOlD+y
         b+lQ==
X-Gm-Message-State: AOAM532BtDnPWIewbndUqvnC1SmLxVv1RBi/2JUlgKUf6cQy/wG8+4tE
        sGfAYYhY5jf1iDY4fOoEUZTpn3qzzjyUNoUwcoM=
X-Google-Smtp-Source: ABdhPJwrWEI7Qmd0RD3rdnjHqjCmX39vxqV5O1JOADPGVBw/7jP2LKoY5MHKKk2RIyypNZ40JN2RoEVcEBRSaNZvtKY=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr8112663oia.153.1604916626093;
 Mon, 09 Nov 2020 02:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUFTQTJqRqF7=-RbxKRDUbqEjf8LFpzGHugTNAZ1KV+cQ@mail.gmail.com> <OSBPR01MB50485F258716E49D43197587AAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB50485F258716E49D43197587AAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Nov 2020 11:10:15 +0100
Message-ID: <CAMuHMdWDXo+4+a=Ck8ktP2D_w2ysxDP1FqGcQ04BBvcDkbDJFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Nov 9, 2020 at 11:05 AM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 09 November 2020 10:02
> > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Magnus Damm <magnus.damm@gmail.com>; Rob Herring <robh+dt@kernel.org>; Linux-Renesas <linux-
> > renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Biju Das
> > <biju.das.jz@bp.renesas.com>; Prabhakar <prabhakar.csengg@gmail.com>
> > Subject: Re: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
> >
> > On Wed, Nov 4, 2020 at 11:55 AM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add audio_clk_b configured as 0 Hz, this will be overridden by the
> > > boards providing the audio clock.
> > >
> > > Fixes: 8183a7938cfec ("arm64: dts: renesas: r8a774e1: Add audio support")
> > > Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.11.
> >
> > > I have rebased this patch on renesas-arm-dt-for-v5.10 branch.
> >
> > Not renesas-arm-dt-for-v5.11?
> >
> Since this was a fixup, I was hoping this will go into v5.10 as a result I rebased it on renesas-arm-dt-for-v5.10 branch.

OK. Will queue in renesas-fixes-for-v5.10 instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
