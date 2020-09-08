Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D70260D91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgIHIan (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgIHIam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:30:42 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48B9C061573
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2020 01:30:41 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x10so10732730ybj.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2020 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTN3ARsr9hpQI6BCuk/GsEtjfCkbwQSE9qWBM1r1Vi4=;
        b=DWTQ+t3mBGmuQH5ns0RFYEgUgO3RBJQhQCTxou3iGyjHWzuvspeR2zMoAzxokz+lTm
         F+nNi4xDjXpwUjtKLD52UfnVAHTORbB5MAQNZfBTF4Nvl8EWkVfsXpWfN0b+c9pCwG4K
         j3eFauUsRhnOz11Dg34x5GHhPJ0tUtCQjzv/a1y4IjuuIIha+QactO++jTlBimolsUsK
         52YgCLBS0tnmdLnereZ/uDaVmJxsbGzIngJLn9hLMTspe7MOXsYnpnf8zMn8OjPgmDEl
         YzWhomtAC1Y4ckLXQnmuamG9UCygaPiuSKW+9kzp0dk9cgeQrqbjS4p41VE+uzqfEQBg
         ZrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTN3ARsr9hpQI6BCuk/GsEtjfCkbwQSE9qWBM1r1Vi4=;
        b=RrYUE2COdony54plaLcGtGsB0/aEYCN3iDYnDUWzoNR51aI6yCZvwtHdCPH5+0bdRC
         F6AijFzSArYXwlLUnIRuCjkXMjJkZlMWyt89ibhCgtUJXumNzUWquEvPXLv8btq3CzRg
         tLw8uAgRFMRRN3kfpjdZoIeRw4sFqWWhWV5i6gqLgDfUILjXmMg5AfJ29nct2FDr9qu4
         WgweMqnBSxPpIRWt+nhIlcFNDgw/hIb5Ovk5KmkOAOki6v7r+x7HYkEahn5TYVOCzDPv
         LCtoMQF+m3LNdzCrIflTBfNg3meZ4Sx6JB6fbh0Lxs+ZLU2zbvuFXW82rB4QgJQ8DXhd
         Xm+g==
X-Gm-Message-State: AOAM532FuTmTZeZY/59yPdv/5PQcZ756cyg3pRsr6Ah/V0jvKwawYaYd
        QzaWaMeCGyX7bSHWJfF2dVb+FiM6bY2uz785vNOYMYvSaz4=
X-Google-Smtp-Source: ABdhPJz8lSBwGkbPccwvuANIGInTX7shxXKmHwL4T6XQCozw8acV3PmKl9+LHmgfRl9qdGHiRiPURUZ+M1c0FPcezfI=
X-Received: by 2002:a25:bbcf:: with SMTP id c15mr32109754ybk.127.1599553840855;
 Tue, 08 Sep 2020 01:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
 <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com>
 <CA+V-a8sw0kg6ChrcrkdzL51K+1A=ce_RpzO02-KB9XAEm+29aQ@mail.gmail.com> <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com>
In-Reply-To: <CAMuHMdWh3=OytzygTt5Kt90Shpm1O-QScbtOSwo_XGaRiSYufA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 8 Sep 2020 09:30:14 +0100
Message-ID: <CA+V-a8uKmHctxFYHECgB9m_3i=rbpTsnbWCEpP_32q95x7EMQg@mail.gmail.com>
Subject: Re: bonnie++ causing kernel panic
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Sep 8, 2020 at 8:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Sep 7, 2020 at 11:27 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Sep 7, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > I am seeing "Unable to handle kernel paging request at virtual address
> > > > xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> > > > managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> > > > using renesas_defconfig for all the platforms and I have tested on
> > > > Linux 5.9.0-rc3 for all the 4 platforms.
> > > >
> > > > Initially I was testing bonnie++ on eMMC device and later discovered
> > > > even running bonnie++ on NFS mount is causing this issue. I have
> > > > attached the logs for M3N while running bonnie++ on NFS and logs for
> > > > G2N while running on eMMC.
> > > >
> > > > I even traced back to 5.2 kernel where initial G2M support was added
> > > > and still able to see this issue.
> > >
> > > Thanks for your report!
> > >
> > > While the crash symptoms seem to be the same in all crash logs, the
> > > backtraces aren't.
> > >
> > > Does disabling SMP (maxcpus=1) help?
> > unfortunately no.
>
> OK, so it's not an SMP issue.
>
> > > Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
> > > reveal memory corruption?
> > >
> > attached are the logs for SLUB and SLAB with debug enabled on G2M
> > rev.4.0 board (bonnie++-1.04) all the 4 combinations cause the kernel
> > panic!
> >
> > SLUB -> 1 CPU -> BUG radix_tree_node (Not tainted): Padding overwritten.
> > SLUB -> all 6 CPU's -> BUG kmalloc-2k (Not tainted): Padding overwritten.
> >
> > SLAB -> 1 CPU -> Slab corruption (Not tainted): nfs_write_data
> > start=ffff000016c08840, len=912
> > SLAB -> all 6 CPU's -> Unable to handle kernel paging request at
> > virtual address 7d81858c9c9d9dd0 ([7d81858c9c9d9dd0] address between
> > user and kernel address ranges)
>
> OK. So now we know something's overwriting its memory block.  Either
> it's writing too far, or a use-after-free case.
> Now comes the hard part of finding who's responsible...
>
:)

I checked out the very first commit where support for G2M was added
and tested even this had an issue, so now I'll switch to R-Car M3N and
perform the tests. Unfortunately I don't have any  non Renesas arm64
platform to perform similar tests.

Cheers,
Prabhakar
