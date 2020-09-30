Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B3127E590
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Sep 2020 11:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgI3JsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Sep 2020 05:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbgI3JsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 05:48:12 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CC1C061755
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2020 02:48:11 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id k18so816784ybh.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2020 02:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aikeScTKcyzQhnU7zL+JwvJru4KFooDtBQYXfaLP03I=;
        b=lr028ipxNOTcnoOreFi6SVUjzzids4xVYYKQ5XFGSq6nRd5bJaz/DXUvu5+and0xHA
         IJtdMXxb81OmZf8t83MnuyfD9YYiV2qeiQoQ7gH4vihRcCUsyLmV3lzfM8rpyzCJP0IM
         zexO/eqGi4RMwM5zgIQK4XcRaxFdHT44eoGfHazkT5uVnMR9jj5/D81/bxxZey1rCdUR
         uekXINqhtj58u249NN5moxOTW0K2lbXD3SeQzYf9rJrozJNWHRQ9w78osABtoVYq6MbV
         eeSEnf2VVutIxTBpGwIR0r/dMRA3rkmWc6FJV9MkQ7bn8jqT4tBEpJ3vlZ+2hfEVVDdh
         JNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aikeScTKcyzQhnU7zL+JwvJru4KFooDtBQYXfaLP03I=;
        b=pT4SDDidm+WtWUZKW1AZi1p9hFYKoX9PIeJ3kzprQ1TZ09xFwcTi8oSwhKsq6ke1vI
         yPweg0znDZMYXA9x2GnBINiEfzFY29YVX2Ztcot15u00gutQNpAi922PT5ZSbntu1STI
         zhkJDuHp9+g3076mMN2+R9JQsqS/K+wOkVeM3zrc2LEBWKIxjLZlEpfn9wot3lBgllw2
         XvSJ4+rthG5wYDpGg8oBp7Jp/mfGB/4FGLEwCAYamDC/fUcq1z4MBbdf4p2kJV7Uw4Da
         LF/aw5B4wPXU1+YdLi7sXhuEZjWKZ/s5VN50/dWHYkbbUJ2+A7PM3Oe53y8lxa9qHKrW
         sFVg==
X-Gm-Message-State: AOAM530z9Er7F1Fc7K2l7iw909klDueG2obE7bfu5x9kJuA7PIjw1rNZ
        R5LTjZKBhaktE1x/xfN/URmvJSJolvRbDwlMn2sAltVAsni69Q==
X-Google-Smtp-Source: ABdhPJzFZOsc26tvpKUvkwEWJqk4wmLfKfBsUdV6pbpO+PzACfGENvi8O1fqLsYDQl77NCup/B703hLil2UeYSBAvRY=
X-Received: by 2002:a25:aba1:: with SMTP id v30mr2220756ybi.518.1601459291065;
 Wed, 30 Sep 2020 02:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
 <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com>
 <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com>
 <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com> <CA+V-a8uKmHctxFYHECgB9m_3i=rbpTsnbWCEpP_32q95x7EMQg@mail.gmail.com>
In-Reply-To: <CA+V-a8uKmHctxFYHECgB9m_3i=rbpTsnbWCEpP_32q95x7EMQg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 30 Sep 2020 10:47:44 +0100
Message-ID: <CA+V-a8vF++iCNA+_GL6fA-Ldx9KKaxSC2qgRErcc-aM-Z0V2ng@mail.gmail.com>
Subject: Re: bonnie++ causing kernel panic
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Sep 8, 2020 at 9:30 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> On Tue, Sep 8, 2020 at 8:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, Sep 7, 2020 at 11:27 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Mon, Sep 7, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
> > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > I am seeing "Unable to handle kernel paging request at virtual address
> > > > > xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> > > > > managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> > > > > using renesas_defconfig for all the platforms and I have tested on
> > > > > Linux 5.9.0-rc3 for all the 4 platforms.
> > > > >
> > > > > Initially I was testing bonnie++ on eMMC device and later discovered
> > > > > even running bonnie++ on NFS mount is causing this issue. I have
> > > > > attached the logs for M3N while running bonnie++ on NFS and logs for
> > > > > G2N while running on eMMC.
> > > > >
> > > > > I even traced back to 5.2 kernel where initial G2M support was added
> > > > > and still able to see this issue.
> > > >
> > > > Thanks for your report!
> > > >
> > > > While the crash symptoms seem to be the same in all crash logs, the
> > > > backtraces aren't.
> > > >
> > > > Does disabling SMP (maxcpus=1) help?
> > > unfortunately no.
> >
> > OK, so it's not an SMP issue.
> >
> > > > Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
> > > > reveal memory corruption?
> > > >
> > > attached are the logs for SLUB and SLAB with debug enabled on G2M
> > > rev.4.0 board (bonnie++-1.04) all the 4 combinations cause the kernel
> > > panic!
> > >
> > > SLUB -> 1 CPU -> BUG radix_tree_node (Not tainted): Padding overwritten.
> > > SLUB -> all 6 CPU's -> BUG kmalloc-2k (Not tainted): Padding overwritten.
> > >
> > > SLAB -> 1 CPU -> Slab corruption (Not tainted): nfs_write_data
> > > start=ffff000016c08840, len=912
> > > SLAB -> all 6 CPU's -> Unable to handle kernel paging request at
> > > virtual address 7d81858c9c9d9dd0 ([7d81858c9c9d9dd0] address between
> > > user and kernel address ranges)
> >
> > OK. So now we know something's overwriting its memory block.  Either
> > it's writing too far, or a use-after-free case.
> > Now comes the hard part of finding who's responsible...
> >
> :)
>
> I checked out the very first commit where support for G2M was added
> and tested even this had an issue, so now I'll switch to R-Car M3N and
> perform the tests. Unfortunately I don't have any  non Renesas arm64
> platform to perform similar tests.
>
To keep you posted, the issue has been cornered and is related to TFA
changes on RZ/G2x.

Cheers,
Prabhakar
