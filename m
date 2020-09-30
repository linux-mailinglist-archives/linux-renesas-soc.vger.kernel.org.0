Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B86527E850
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Sep 2020 14:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3MQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Sep 2020 08:16:13 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:37558 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgI3MQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 08:16:12 -0400
Received: by mail-oo1-f66.google.com with SMTP id y25so408957oog.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2020 05:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMb/fVBSIpsmDKfdMJRaRyJEvFMfuQR5pIoyIF1LlpU=;
        b=C34YUE6TvnX/APbi79zTdpwiXH2RwYk0dAMLGmE4ih0g3hbvrxkuuaQxzF6pBIkdAD
         JoIIMb1mde7WjA27Ly70JTWoWztxOA82+NKqyJLqVT4DW/zvu8mUwwpLx0rpjASuuG/p
         Xlk+o2jCklpvnlYUcPoqF2SOZdTkx72dhTIqpqzlSHzrsJ2AdkrdFVTZvqDFVpytPwf+
         lnVQl0N3+VQezW5cdN35OFJYjCLWXoRVZ0q2rdKEXi9aAbj+2EgMfZfnCm2bnuzUH9XF
         OHrZ0OvjLokQ6n0KVE1wB1oL9ZfV0JsS9MHq/djW96/kG0OLinBo91OV2K+AswXWxLCw
         WNkw==
X-Gm-Message-State: AOAM533cc3QFgbuuOpI3qMa7xBjNhOy1nMWWsXdYh6rRLyU8S4Mbts4A
        90QA65FIxhllybbyPIJ1ySjIabSIc5FQZYfC3ho=
X-Google-Smtp-Source: ABdhPJwjzOb4JKWgwjV3yC54wXYoR87P46T2JL3YqBVvp0mNX04KU1c4UnKfsfkkiI7eHknWiy4EllHcSrVRxZB6ubs=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr1768775oou.40.1601468170287;
 Wed, 30 Sep 2020 05:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
 <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com>
 <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com>
 <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com>
 <CA+V-a8uKmHctxFYHECgB9m_3i=rbpTsnbWCEpP_32q95x7EMQg@mail.gmail.com> <CA+V-a8vF++iCNA+_GL6fA-Ldx9KKaxSC2qgRErcc-aM-Z0V2ng@mail.gmail.com>
In-Reply-To: <CA+V-a8vF++iCNA+_GL6fA-Ldx9KKaxSC2qgRErcc-aM-Z0V2ng@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Sep 2020 14:15:58 +0200
Message-ID: <CAMuHMdVfHN5kwEGW+qOt-B+52qGJVoPqSGJQ-DrmOdXaQOeuxw@mail.gmail.com>
Subject: Re: bonnie++ causing kernel panic
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Sep 30, 2020 at 11:48 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Sep 8, 2020 at 9:30 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Sep 8, 2020 at 8:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Mon, Sep 7, 2020 at 11:27 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Mon, Sep 7, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
> > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > I am seeing "Unable to handle kernel paging request at virtual address
> > > > > > xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> > > > > > managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> > > > > > using renesas_defconfig for all the platforms and I have tested on
> > > > > > Linux 5.9.0-rc3 for all the 4 platforms.
> > > > > >
> > > > > > Initially I was testing bonnie++ on eMMC device and later discovered
> > > > > > even running bonnie++ on NFS mount is causing this issue. I have
> > > > > > attached the logs for M3N while running bonnie++ on NFS and logs for
> > > > > > G2N while running on eMMC.
> > > > > >
> > > > > > I even traced back to 5.2 kernel where initial G2M support was added
> > > > > > and still able to see this issue.
> > > > >
> > > > > Thanks for your report!
> > > > >
> > > > > While the crash symptoms seem to be the same in all crash logs, the
> > > > > backtraces aren't.
> > > > >
> > > > > Does disabling SMP (maxcpus=1) help?
> > > > unfortunately no.
> > >
> > > OK, so it's not an SMP issue.
> > >
> > > > > Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
> > > > > reveal memory corruption?
> > > > >
> > > > attached are the logs for SLUB and SLAB with debug enabled on G2M
> > > > rev.4.0 board (bonnie++-1.04) all the 4 combinations cause the kernel
> > > > panic!
> > > >
> > > > SLUB -> 1 CPU -> BUG radix_tree_node (Not tainted): Padding overwritten.
> > > > SLUB -> all 6 CPU's -> BUG kmalloc-2k (Not tainted): Padding overwritten.
> > > >
> > > > SLAB -> 1 CPU -> Slab corruption (Not tainted): nfs_write_data
> > > > start=ffff000016c08840, len=912
> > > > SLAB -> all 6 CPU's -> Unable to handle kernel paging request at
> > > > virtual address 7d81858c9c9d9dd0 ([7d81858c9c9d9dd0] address between
> > > > user and kernel address ranges)
> > >
> > > OK. So now we know something's overwriting its memory block.  Either
> > > it's writing too far, or a use-after-free case.
> > > Now comes the hard part of finding who's responsible...
> > >
> > :)
> >
> > I checked out the very first commit where support for G2M was added
> > and tested even this had an issue, so now I'll switch to R-Car M3N and
> > perform the tests. Unfortunately I don't have any  non Renesas arm64
> > platform to perform similar tests.
> >
> To keep you posted, the issue has been cornered and is related to TFA
> changes on RZ/G2x.

Thanks for the update! I'm happy to hear it's not Linux' fault ;-)

Do you have more details about the TFA change? It might help in
detecting similar issues in the future.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
