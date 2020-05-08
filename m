Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9B11CB09C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 15:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgEHNi4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 09:38:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35154 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgEHNit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 09:38:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id o7so8449436oif.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2020 06:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cVLrXPsgHTwrpYewcNCPrb8dvyyVm6F0RkHrzmD7Wq8=;
        b=PLPr7w4MWYfQ3cA8TgMmhSxby+vYNGQGP2zTWd7o5P2mhZOaiHysNrGQDIN0iiswFr
         Y2q1SNO8TNwVFmZ91LYUkhue/YsNBbt6+79+k9p1ttmjRtw6j2MxI4Uoz8ArlDMw2hgQ
         yJbTpZjufd7wsYRyCdmGN+EviS4DvyDpShYAjSbPf5ljNE8H/LGpn6KnIocSUtwyJ6wm
         ADBVLSuRTh4TWQYw32YzSAR4ZUz5ymTSy3D03F97Pu0NvLkNxlc+aGbhO+pOjidf5VFZ
         +nP4RNrcHDgmDnf01gKzHelXxIgijJdgB7Yu4PDrMARpS9c0/VdX153w5DPS4cEW1QbU
         wdvQ==
X-Gm-Message-State: AGi0PubiNfYVXArV2JtDyg+Mf5xusIlx5HLgpVkT2ySxU2uN8tF88L2J
        bDep8y0sxUyoZoQjC/xdlPxp9dhR6sPFDSTtUVA=
X-Google-Smtp-Source: APiQypIt/NJtbxKsIctJ0g6RMdpCsn9IJtKNhLYXR42RNLxIQc88+xuJ9tmpNoq3FDSQIO8GoYtQWyr1idGt+kJgHrI=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr10449088oig.54.1588945127549;
 Fri, 08 May 2020 06:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
 <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com> <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 May 2020 15:38:36 +0200
Message-ID: <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

""
Hi Nicolas,

On Thu, May 7, 2020 at 7:07 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Thu, 7 May 2020, Geert Uytterhoeven wrote:
> > On Thu, May 7, 2020 at 4:58 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > > On Thu, 7 May 2020, Geert Uytterhoeven wrote:
> > > > As upstream Linux does not support XIP,
> > >
> > > What?
> >
> > Not for an ARM v7 platform:
> >
> >     config XIP_KERNEL
> >             bool "Kernel Execute-In-Place from ROM"
> >             depends on !ARM_LPAE && !ARCH_MULTIPLATFORM
>
> Of course this is an artificial limitation.
>
> You can have XIP on ARMv7 if you want. It requires some kconfig
> tweaks though.

I am happy to hear that!
Do you have any guidance how to implement that?
So far our tries have failed.

"[PATCH 0/2] ARM: ARMv7 (with MMU) XIP without ARCH_MULTIPLATFORM"
http://lore.kernel.org/r/20170209033044.19513-1-chris.brandt@renesas.com
"[PATCH] ARM: Allow MULTIPLATFOR to select XIP
https://lore.kernel.org/linux-arm-kernel/1455816310-11308-1-git-send-email-chris.brandt@renesas.com/
"[PATCH 0/2] ARM: xip: Get XIP for ARMv7 working again
http://lore.kernel.org/r/1437057434-1616-1-git-send-email-chris.brandt@renesas.com
"XIP_KERNEL and !ARCH_MULTIPLATFORM
http://lore.kernel.org/r/HK2PR06MB0561CC16649A9C1F341CC6648A030@HK2PR06MB0561.apcprd06.prod.outlook.com
...

Thanks, and have a nice weekend

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
