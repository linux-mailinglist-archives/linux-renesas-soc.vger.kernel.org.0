Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163A12404B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 12:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHJKcC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 06:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJKcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 06:32:02 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A35C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2020 03:32:01 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id x2so4853862ybf.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2020 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ukBXB0tDH8e2X/deBSu6Sx+I/uadZKFWJ0N/1LYvB2I=;
        b=sV5otcQNaHleDTnBdt44empCxPWc6FGXJanyZA6WayesVIOLtXaIWAsPYc68WlvQnc
         fcvjBY1vIr4yg2Tu7G43WQ7WhJS2MGWYttE2rSmdiBTZ15W0yxcTjXkudtK26VIdZuuj
         BEJH2XsCi7KVfWLIlAQH4Jyo7QEmJOAK6qn3oh/mTjyCFjOOkSpx/aO+ELQXvpYQjfoq
         COuO3oixXWwQS9JUWIL3aMuZuq6xsXe5aucukQ3ncs+gZa7NnlyX7OHN8jwsrWS6tmBA
         4LCAB6viLqAwLAhRoxuUoSTR5avIs1HMPQHP78MhcQJX/FNokPUbgsTrnfBFxFgmPAp4
         kmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukBXB0tDH8e2X/deBSu6Sx+I/uadZKFWJ0N/1LYvB2I=;
        b=QQvGeoCtY8a1wV/dNcyHapgaHILd92+h/JNCEkBt1lKejfbrTjoZXI+Jhqob2eukAK
         3VDRdX4e8v9wdFBcwVt4nH3tdHJFINgqu69ByfXCX6ehyilccrlp1u3YwL9jhZV2Hc3M
         FraXKOUSNFXoDfpPQ4vltAC6BFU4uHUUpDo1AX09hQhof0543d5EEgDpCP9UOsxP2Nwy
         9fuv+h9FPFCH74P9382CWbW9r/NaU4h5qX/FVFbiHpdjJKeNAcwJerhGTqLxwdLM4XuX
         oMGPtkqt7/V3HRn8JxKCj1gsT4nApnjztXX6XrhBRuAwFd3J2JRiybRtqZgscJKZaUvI
         Zh0g==
X-Gm-Message-State: AOAM5304FFlGZGVKuwCGI5PCHiSrgJaVm3RXK6P6PTiW8+B1JxhWfgAa
        iAcZTnTlZ3MJ/wo8dfmnBCviSRNruNT9P36WW4uc+g==
X-Google-Smtp-Source: ABdhPJza30+DAK72QlJq1oc94WoW3GPy8+EQIxqIjNHEGzuLhIhY6uDK8459hZ9aPG62tffC624jHtJVnqgYgauquQQ=
X-Received: by 2002:a25:3355:: with SMTP id z82mr40745818ybz.445.1597055520915;
 Mon, 10 Aug 2020 03:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vFU24w0XYxsksZMJF5iLbT8UU_q3UieCRyWDH9BwVpzQ@mail.gmail.com>
 <CAMuHMdW9CrG6__-L89ZPvN0H_SJyNmf3RcojHJaAx8M5FJOm_A@mail.gmail.com>
 <CA+V-a8t0e7Ys7Mspmh4pU04U7kOJumvJ4+pNzxGqXd1ZcMTQsg@mail.gmail.com> <CAMuHMdW6NNFT6u9z25=JmetS=vLFA+91-cGbUgNKShN3nwhmjA@mail.gmail.com>
In-Reply-To: <CAMuHMdW6NNFT6u9z25=JmetS=vLFA+91-cGbUgNKShN3nwhmjA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 10 Aug 2020 11:31:34 +0100
Message-ID: <CA+V-a8u1BYM72q9kn-9hooG7u58NS1q5yJQuS+4mCNWcdyOmBQ@mail.gmail.com>
Subject: Re: EXT4 issues on block devices
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Aug 10, 2020 at 9:00 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Aug 7, 2020 at 9:35 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Aug 7, 2020 at 9:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Aug 6, 2020 at 7:01 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > During adding support for SATA on RZ/G2H, I was trying some stress
> > >
> > > RZ/G2N, according to the logs?
> > >
> > > > testing on the stock 5.8.0 kernel.
> > > >
> > > > $ dd if=/dev/urandom of="${TMP_DIR}/random-data" bs=1M count=1000 # Works OK
> > > > $ time bonnie++ -d "${MNT_DIR}" -u root # Worked OK, as Biju pointed
> > > > out earlier he had seen an issue with this and disabling
> > > > CONFIG_PROVE_LOCKING fixes it.
> > > > $ for i in {1..50}; do echo $i;cp random-data random-data-$i;sync;
> > > > done # This is where I saw random kernel panics/EXT4 errors
> > > >
> > > > To prove it out it's not the SATA I switched to USB3 and kept on
> > > > seeing similar issues. To make sure if the device is OK I tested the
> > > > devices on VLP1.0.4 release and saw no such behaviour.
> > > >
> > > >  I have been using renesas_defconfig + enabled modules + added USB3
> > > > firmware file
> > > > * Tried disabling cma (cma=0 in bootargs)
> > > > * Before mounting the device made sure I run e2fsck
> > > > * Also ran badblocks tool on the device and saw no issues
> > > > * Disabled CONFIG_HUGETLBFS/CONFIG_ZONE_DMA32
> > > >
> > > > I also tested on R-car M3N with renesas_defconfig and saw no issues
> > > > with USB ext4.
>
> > > Good luck finding the cause!
> > >
> > Using the latest e2fsprogs tools [1] I am no more seeing any kernel
> > panics now. Sorry for the noise.
> >
> > [1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.6/
>
> So your test crashed because you ran (buggy) e2fsck first, scary...
>
For now seems like it, and test cases seem passing.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
