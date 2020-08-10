Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4412D240313
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 10:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgHJIAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 04:00:36 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35794 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJIAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 04:00:36 -0400
Received: by mail-ot1-f67.google.com with SMTP id 93so6624155otx.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2020 01:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljkkdnksZFgeUVgkWmFMI9ITCf619i+be3VInNo+LCs=;
        b=W3zkINEDBLQ0JXRnddRW+ywFGKX/HfC3/R4p2ZlSZSg12kiqq+ZS4cpaVw9uU2tjON
         JefCBAIzhHhQ+a2MbxB4JcRBKSXJ5Hc/BDf+RPHaomFa0sBUV+auKpUgBIDjX9sS6Ykh
         CsPonkqCGUnPJr+vJ0oNyKTyN1UDC6Vz2QFBpDvNJvgvMQl1EVugXrPcuDHwcwdkzqlK
         immuLPQVFVFr8z0UuSnvcp2HAfXsLlWeJDtz/kNkURLJzw2h1aRQ5dAnBgSHjSksyUjI
         rkAcDn0auwH6VeSUdkE8M0nFFAOfEgblZ4cXuNWWxQsJ2Lgbbb0nEItdI8AAstwZy/07
         V/HA==
X-Gm-Message-State: AOAM531qpz3f0ZKWgdMWRhbJ9yXCLxShG5n2ony+sY7LM4xF6IRWBvby
        DJv7BZEfrdZvZGYe16gXJjbkcERusKcyhs4+sTEZug==
X-Google-Smtp-Source: ABdhPJxpnY/JR/8KQapp5BRLOTMPntcadnqjn6foXdHLlUqi1ZvQ3X2qriqn3GKTW73mD808gdeuCyKBmNuv5XDNKU8=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr21054718ote.107.1597046435744;
 Mon, 10 Aug 2020 01:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vFU24w0XYxsksZMJF5iLbT8UU_q3UieCRyWDH9BwVpzQ@mail.gmail.com>
 <CAMuHMdW9CrG6__-L89ZPvN0H_SJyNmf3RcojHJaAx8M5FJOm_A@mail.gmail.com> <CA+V-a8t0e7Ys7Mspmh4pU04U7kOJumvJ4+pNzxGqXd1ZcMTQsg@mail.gmail.com>
In-Reply-To: <CA+V-a8t0e7Ys7Mspmh4pU04U7kOJumvJ4+pNzxGqXd1ZcMTQsg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 10:00:24 +0200
Message-ID: <CAMuHMdW6NNFT6u9z25=JmetS=vLFA+91-cGbUgNKShN3nwhmjA@mail.gmail.com>
Subject: Re: EXT4 issues on block devices
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Aug 7, 2020 at 9:35 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Aug 7, 2020 at 9:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Aug 6, 2020 at 7:01 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > During adding support for SATA on RZ/G2H, I was trying some stress
> >
> > RZ/G2N, according to the logs?
> >
> > > testing on the stock 5.8.0 kernel.
> > >
> > > $ dd if=/dev/urandom of="${TMP_DIR}/random-data" bs=1M count=1000 # Works OK
> > > $ time bonnie++ -d "${MNT_DIR}" -u root # Worked OK, as Biju pointed
> > > out earlier he had seen an issue with this and disabling
> > > CONFIG_PROVE_LOCKING fixes it.
> > > $ for i in {1..50}; do echo $i;cp random-data random-data-$i;sync;
> > > done # This is where I saw random kernel panics/EXT4 errors
> > >
> > > To prove it out it's not the SATA I switched to USB3 and kept on
> > > seeing similar issues. To make sure if the device is OK I tested the
> > > devices on VLP1.0.4 release and saw no such behaviour.
> > >
> > >  I have been using renesas_defconfig + enabled modules + added USB3
> > > firmware file
> > > * Tried disabling cma (cma=0 in bootargs)
> > > * Before mounting the device made sure I run e2fsck
> > > * Also ran badblocks tool on the device and saw no issues
> > > * Disabled CONFIG_HUGETLBFS/CONFIG_ZONE_DMA32
> > >
> > > I also tested on R-car M3N with renesas_defconfig and saw no issues
> > > with USB ext4.

> > Good luck finding the cause!
> >
> Using the latest e2fsprogs tools [1] I am no more seeing any kernel
> panics now. Sorry for the noise.
>
> [1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.6/

So your test crashed because you ran (buggy) e2fsck first, scary...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
