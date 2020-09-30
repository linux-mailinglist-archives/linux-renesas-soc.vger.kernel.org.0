Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68A427E88B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Sep 2020 14:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgI3M2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Sep 2020 08:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3M2v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 08:28:51 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E338C061755
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2020 05:28:49 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id b142so1124364ybg.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2020 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1lGldizHKkvXw42r3OejkYquy9VZB9hCax5DoZ3g+EY=;
        b=iyMjV7dPOfEbFL+rImMiLozEFvMvkqk6+EqwgzxIkWDPUIQi5YQBEVIP8IftYBjUmT
         O7gNVi6+grxlbD8nWKNxpy1fkzwcl4A+0Fns/AmnIOcF9CvAt9HgJKs+qHoRDdQdia3O
         DpvnCWHBF3tkoUhTxIXauW8bH4u9mppmuA3d09TbGUT6joMP8T80yd52n0LLbWha7ubj
         /+lTR59RZDazJJc36fXGpuOc23CUr+bb9kGww3udEc/tWaVNStbFeL7dSY1CcK+ZdCzY
         Vhz8gGc68Zm3UElHPlTuSVTVw4PoaVE3nr3zJavfWdmWqZsBH+2B2rQnO2Deb0KiZvy6
         V+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lGldizHKkvXw42r3OejkYquy9VZB9hCax5DoZ3g+EY=;
        b=JvsEbikCGKIEMyckvUHhlvAENM2wbO/NNmGr4eLEKjh/8xoHkk5C9Mr1dNYAY0BY6r
         58mlik+l/b0MxRSlPaWJxZDqzG/5yM+qPoY3zW/aGazjJoXGuBHZ8O6eVW3Yu3gqiBu/
         7W9NLqJGQbxAqScY6v/H1etLEUbS4kqw4/OPlBCl1VnFF/kOVzTyjuPxtiT/xBLkqKxS
         XuNJvn31NjjwDyTX/OdaCHDfMTntXm2vcXoKy55icMH2E0eRjUlws1EAZKsZ4Rf+0hhI
         gwI8P2As7kOhfd+vdAvlRqChGXmaZ/+2Vpp9R4fF7RrdVqrBqW5rp3TU1rB0l7RbDXPx
         QETg==
X-Gm-Message-State: AOAM532ziFTfrIbS+i7M8XZFFKrf88korqgZShvVseLS7QVWQ0c/6Ul/
        1RD1H/ggEmnSuTIF7ScFvwaCfv3J0pyjdN78mYLOHI2L+u+5Aw==
X-Google-Smtp-Source: ABdhPJyUt682BzBzAcH3hPJrTmEoWagObV1K7jOhUomQA8Zrv6dvj9GB8+CZJ5cWZn56qLuCLDKipUgMnt11w2fcIEo=
X-Received: by 2002:a25:5507:: with SMTP id j7mr38910ybb.214.1601468928672;
 Wed, 30 Sep 2020 05:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
 <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com>
 <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com>
 <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com>
 <CA+V-a8uKmHctxFYHECgB9m_3i=rbpTsnbWCEpP_32q95x7EMQg@mail.gmail.com>
 <CA+V-a8vF++iCNA+_GL6fA-Ldx9KKaxSC2qgRErcc-aM-Z0V2ng@mail.gmail.com> <CAMuHMdVfHN5kwEGW+qOt-B+52qGJVoPqSGJQ-DrmOdXaQOeuxw@mail.gmail.com>
In-Reply-To: <CAMuHMdVfHN5kwEGW+qOt-B+52qGJVoPqSGJQ-DrmOdXaQOeuxw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 30 Sep 2020 13:28:22 +0100
Message-ID: <CA+V-a8uJAsfmPQT9Dqt1A7KB8OxN3XU+8RPhi3J=eyXgDQBCrg@mail.gmail.com>
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

On Wed, Sep 30, 2020 at 1:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Sep 30, 2020 at 11:48 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Sep 8, 2020 at 9:30 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Tue, Sep 8, 2020 at 8:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Mon, Sep 7, 2020 at 11:27 PM Lad, Prabhakar
> > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > On Mon, Sep 7, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
> > > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > > I am seeing "Unable to handle kernel paging request at virtual address
> > > > > > > xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> > > > > > > managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> > > > > > > using renesas_defconfig for all the platforms and I have tested on
> > > > > > > Linux 5.9.0-rc3 for all the 4 platforms.
> > > > > > >
> > > > > > > Initially I was testing bonnie++ on eMMC device and later discovered
> > > > > > > even running bonnie++ on NFS mount is causing this issue. I have
> > > > > > > attached the logs for M3N while running bonnie++ on NFS and logs for
> > > > > > > G2N while running on eMMC.
> > > > > > >
> > > > > > > I even traced back to 5.2 kernel where initial G2M support was added
> > > > > > > and still able to see this issue.
> > > > > >
> > > > > > Thanks for your report!
> > > > > >
> > > > > > While the crash symptoms seem to be the same in all crash logs, the
> > > > > > backtraces aren't.
> > > > > >
> > > > > > Does disabling SMP (maxcpus=1) help?
> > > > > unfortunately no.
> > > >
> > > > OK, so it's not an SMP issue.
> > > >
> > > > > > Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
> > > > > > reveal memory corruption?
> > > > > >
> > > > > attached are the logs for SLUB and SLAB with debug enabled on G2M
> > > > > rev.4.0 board (bonnie++-1.04) all the 4 combinations cause the kernel
> > > > > panic!
> > > > >
> > > > > SLUB -> 1 CPU -> BUG radix_tree_node (Not tainted): Padding overwritten.
> > > > > SLUB -> all 6 CPU's -> BUG kmalloc-2k (Not tainted): Padding overwritten.
> > > > >
> > > > > SLAB -> 1 CPU -> Slab corruption (Not tainted): nfs_write_data
> > > > > start=ffff000016c08840, len=912
> > > > > SLAB -> all 6 CPU's -> Unable to handle kernel paging request at
> > > > > virtual address 7d81858c9c9d9dd0 ([7d81858c9c9d9dd0] address between
> > > > > user and kernel address ranges)
> > > >
> > > > OK. So now we know something's overwriting its memory block.  Either
> > > > it's writing too far, or a use-after-free case.
> > > > Now comes the hard part of finding who's responsible...
> > > >
> > > :)
> > >
> > > I checked out the very first commit where support for G2M was added
> > > and tested even this had an issue, so now I'll switch to R-Car M3N and
> > > perform the tests. Unfortunately I don't have any  non Renesas arm64
> > > platform to perform similar tests.
> > >
> > To keep you posted, the issue has been cornered and is related to TFA
> > changes on RZ/G2x.
>
> Thanks for the update! I'm happy to hear it's not Linux' fault ;-)
>
:)

> Do you have more details about the TFA change? It might help in
> detecting similar issues in the future.
>
Not atm, will pass it on as soon as I have them.

Cheers,
Prabhakar
