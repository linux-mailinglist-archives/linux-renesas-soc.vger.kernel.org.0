Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897C6264567
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 13:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgIJLhC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 07:37:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38553 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730262AbgIJLOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:14:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id y5so5006135otg.5;
        Thu, 10 Sep 2020 04:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xHYYa0YnjNSaaS4AAXDNFvD8uCg/SHwbL+LjIfUjrA=;
        b=Gqe/BjoTxNf9Opef0ji7Kzw+oWIZzNp7Wz/jgvX3hxdk9sWayLARvW4lJ3Xyw1X/89
         ACcUdO69Go9j1NAyTeRrrbS365n/W9xMMMJrCfcHg4rFr8r0gl/Um476GItxaWrcSJ5c
         AnXT55xqVb9HF3s01QMdgIRP5xpsR4Jsms7+tMw1AqJ4+IvO1zLAOpNobfpV+wy3ejYv
         d/IoPDdhWYxIz00jNntikeKkfr0S701ZMI6mkjYjMPoJjGb2MLlGNoXZtynB7Q79bq5h
         WEySZnpoSwUNe6R2LXfjBivrDNoZMqwBAYLVkjR6Pwq+SMz5nFu1VCgd8kbO/QepMNrb
         KQRQ==
X-Gm-Message-State: AOAM530oYFGiCwO75mke9Gdsse8veNqC4Zd6ju8Jol0ZM1lWQNToRAwc
        EoyW+xsssavrb6H6XPTSGUFYKggENROxVShPGxXa4qO5jps=
X-Google-Smtp-Source: ABdhPJwmbtlvpBUp+sHVracs+W4GvwqvVIolvlptH9HHDYBMwv2/0qwquVkPEbRU/cUTsiAkaLGe8QUPnd3udTncQJ4=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr467527oth.145.1599736448277;
 Thu, 10 Sep 2020 04:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUXUvU5dPkBFdW_ZVhnBKpFEPVLD3mdOkhrmakZjCHErg@mail.gmail.com> <TY2PR01MB36929138C1723ABE87358597D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36929138C1723ABE87358597D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 13:13:57 +0200
Message-ID: <CAMuHMdU6TLz09bvNCK8kRruu-W+B8c9Bnbr5kTCZzW-38cqO8A@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 1:04 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, September 9, 2020 2:21 AM
> > On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Initial support for the Renesas Falcon CPU and BreakOut boards
> > > support.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
> > > @@ -0,0 +1,44 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Device Tree Source for the Falcon CPU board
> > > + *
> > > + * Copyright (C) 2020 Renesas Electronics Corp.
> > > + */
> >
> > As this board contains the CPU, I had expected
> >
> >     #include "r8a779a0.dtsi"
> >
> > here.
>
> I got it. I'll add it.

Thanks!

BTW, I forgot to mention that the file should probably be named
r8a779a0-falcon-cpu.dtsi, i.e. incl. the SoC part number prefix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
