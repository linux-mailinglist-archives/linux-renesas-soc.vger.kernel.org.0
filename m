Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99E52B78F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKRIkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:40:37 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42884 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgKRIkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:40:37 -0500
Received: by mail-ot1-f67.google.com with SMTP id h16so985528otq.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6UIudI6miWRrNt+vXjrk7oCZqNBfNeGTCXwAs/2dJM=;
        b=dJSa/FC8lhpEVjDdp5j4wT293k3LMGA/75zFr8yORPubwziRsksPRDADnYvdMrTbV8
         Fr5FAFSwzUtxmQ3eTnSvnERhJqSMMYJtrUB7Z8tpX/2smEsZijUnO3XiYfifhfW9IoxR
         5ly8r1L/Zi4X8qVpDtxIILWqUujnVQY0H80UQ+fk04LtDEx2vXXZfXWE5BHoZ1vK7o0R
         OPNCkJqbGY2g6WH24b7dzg7RsTYfmWNvZobY+7SChg+Ac/Dz0RyAjiBOe9KXhtTLNGNl
         3x1CFxto56Sb7NZPc9IMOeNsMqdOsXn/DH4rzhFVYrNRLQaPTPW7POqrf6JP2kvoIeGF
         dcyA==
X-Gm-Message-State: AOAM533ee4NjRudlU9GcG0oGjZQZV/MKNA4HqIhIiO594KQBCy3+/Jrq
        s/WMVQRno3eD3Hv9wE5QTVxuflD3HPp8/F17euQ=
X-Google-Smtp-Source: ABdhPJztVt3wjbNKiX4USfCqID2D5dXbPeI/nVV7wIAdTvPekL7zmGfLiIlmD5lcGorY3OcAPSPGkziUaITgvv4CScQ=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr5971044oth.250.1605688836081;
 Wed, 18 Nov 2020 00:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
 <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
 <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com> <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
In-Reply-To: <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Nov 2020 09:40:24 +0100
Message-ID: <CAMuHMdWzoa3pOVqp40euW5ZecW-fGjbRtDfh6n=DugeeLmz1Ww@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC Adrian

On Wed, Nov 18, 2020 at 9:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Nov 17, 2020 at 5:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 17, 2020 at 5:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Tue, Nov 17, 2020 at 4:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Doh, and even Debian ports doesn't support armeb anymore, else it
> > > > would just be a debootstrap away...
> > >
> > > Debian actually dropped all big-endian platforms other than s390
> > > now, the last other one was mips32 (mips32el is still there for the
> > > moment).
> >
> > I did mean "Debian Ports", which still supports a few more. But no
> > armeb.
>
> Ok, got it. I guess the old armeb ports was never in Debian, and predated
> the debian-ports system.
>
> Debian ports indeed still contain packages for big-endian m68k (obviously)
> as well as hppa, powerpc, ppc64 (in addition to the official ppc64le) and
> sparc64). I'm surprised nobody so far tried restarting the openrisc port,
> which got dropped when it appeared the corresponding gcc port would not
> be upstreamed.

I guess that is partly due to the limited availability of OpenRISC
hardware?  I had it running on a DE0-NANO, but 32 MiB RAM and
no Ethernet doesn't bring you far...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
