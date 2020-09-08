Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B907260B81
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 09:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHHF0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 03:05:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37035 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbgIHHFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 03:05:24 -0400
Received: by mail-ot1-f66.google.com with SMTP id 37so14027152oto.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2020 00:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boE8KVpDgHNfEcOPepL7kwnC6uwjkLhBVOMZB/u2LdM=;
        b=ss/CvydZM9MHYw/6BoQNaQhDjtKX9QqluffxoE0WKfkMnWz933d8Ajif/88EDMUasi
         8ysiSC7hMRKWVUy/Gwyv0/by2JTxiGr9MX/2G709yoTKDcPxyCnbDt+y/6HXgcLEE2aR
         GmIH1wCuE0NXoRn/k0IaIZp7yzQvWX76uNaIY2Wn+B1ucvF/n8DY1Y7HObkQ9WJtEGRW
         jQOQp/IvqELL7uXSwIeTMif1wJuE7GLrnqOSvDzwP41xsWjT5/luQq05Fo9kN50SK7sA
         bFEh7gMhCR8KHoGoehUjoBGiWXBLDA2Irs+a0P7pjyTT5LuyB+DVYXWH7oPJdXBNOi+R
         /p/Q==
X-Gm-Message-State: AOAM532xHUJW9/EvBib+epWjeN/+h3GA8tMsnjwDuD7dISVP4ZtWZ/O2
        hduTmlzJkZaZ/px0ydzySgmK7pktCDisjtPHM44=
X-Google-Smtp-Source: ABdhPJyjhKoZhRmeUIGaNzMpDs69rPt/c+NF2mGWcl9vCpWqo8fQaYiuTgL06r5TOpeROREFx9BwS3VQqHffFcZEoZY=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr15859792otp.107.1599548723630;
 Tue, 08 Sep 2020 00:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
 <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com> <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 09:05:12 +0200
Message-ID: <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com>
Subject: Re: bonnie++ causing kernel panic
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Sep 7, 2020 at 11:27 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Sep 7, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > I am seeing "Unable to handle kernel paging request at virtual address
> > > xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> > > managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> > > using renesas_defconfig for all the platforms and I have tested on
> > > Linux 5.9.0-rc3 for all the 4 platforms.
> > >
> > > Initially I was testing bonnie++ on eMMC device and later discovered
> > > even running bonnie++ on NFS mount is causing this issue. I have
> > > attached the logs for M3N while running bonnie++ on NFS and logs for
> > > G2N while running on eMMC.
> > >
> > > I even traced back to 5.2 kernel where initial G2M support was added
> > > and still able to see this issue.
> >
> > Thanks for your report!
> >
> > While the crash symptoms seem to be the same in all crash logs, the
> > backtraces aren't.
> >
> > Does disabling SMP (maxcpus=1) help?
> unfortunately no.

OK, so it's not an SMP issue.

> > Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
> > reveal memory corruption?
> >
> attached are the logs for SLUB and SLAB with debug enabled on G2M
> rev.4.0 board (bonnie++-1.04) all the 4 combinations cause the kernel
> panic!
>
> SLUB -> 1 CPU -> BUG radix_tree_node (Not tainted): Padding overwritten.
> SLUB -> all 6 CPU's -> BUG kmalloc-2k (Not tainted): Padding overwritten.
>
> SLAB -> 1 CPU -> Slab corruption (Not tainted): nfs_write_data
> start=ffff000016c08840, len=912
> SLAB -> all 6 CPU's -> Unable to handle kernel paging request at
> virtual address 7d81858c9c9d9dd0 ([7d81858c9c9d9dd0] address between
> user and kernel address ranges)

OK. So now we know something's overwriting its memory block.  Either
it's writing too far, or a use-after-free case.
Now comes the hard part of finding who's responsible...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
