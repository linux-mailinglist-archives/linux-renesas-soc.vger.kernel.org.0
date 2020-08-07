Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2E423F320
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 21:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGTfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 15:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgHGTfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 15:35:41 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAA8C061756
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2020 12:35:41 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id q3so1577752ybp.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2020 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afAsSMqQpR+Y09at6eN72Jen5jmnTwor/YAMd2Api9E=;
        b=jqQc8PA51AnLwte4/3t0oMY31IweGZueO5qloEvIeJ758vYssZN5o7DDpm17ZPN7aL
         wijU46CqZQfmel090Z5h2XM8ChPW27oKH9uK+Xkl3nYOSQ9AbqivGDsuQ3FalSikeDCR
         qU8klwbWLaopD1pyu91Z1LFC17dkcFMa4isnqOvd5wt9tK1NKfiLnyS0Tvvq3LzEi5PR
         oZKeuzd/HxkgBnw4heuPgJI7BjzfQfTAIoOSB0CoHFylh9F8zXAPrDxNLl5RVXr2+kcy
         pZkMOyP1Uk66JbfHDQOZ8TcTxTKhQSJnce4IfreW5YGN0Ic3E43cQG18VeMKpvutrUqk
         n3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afAsSMqQpR+Y09at6eN72Jen5jmnTwor/YAMd2Api9E=;
        b=Ou/LP7vGIurwGcnrmgrCIx1HQfVuLBQwWpS0bsz2Rtv7kjjYA0QBDy5u6DZUKzuFKT
         i9Y1nXAHzSb5RlMYZURUc+LFa/+J0E6arDO5eXVMt91NojsJJFJSwXHqU9tvcT5tbVfW
         MlGoo/ZPltMLo8gF4QyGoXyJlMAfx6pw3p3jmnkERD+/TIXp0LivbUsVEx5uIuuSY0iC
         41/o1uCzX7gfGGXsZ0vLwllCI7eOgbx0NAT1rw2InX+mwnbgQDfc5fPCIFUfnRwEpAzC
         ZIt0ti+QoxVv9Itma6jeQiqx0qHqbwDlHCIE9EXxdOwCYFn9oiwkAdij5/zo7XXqXAsM
         v69Q==
X-Gm-Message-State: AOAM532m1xrFCxKfPvvxJRk26oxk61HWvZISSx8nvpWicurFJty8Ux7j
        CPPrSMFg6AYzkrErSVFFxYPwqM9MTj5kq5TVxAGnaXDrQHs=
X-Google-Smtp-Source: ABdhPJxGmmjaTJAxfVKt65YnMrrmGzL820vK0C9k4xEKjCX2jtFil4mbwCr2zzTuYJ8vn03sEh1sIu98X8gUs+WQmV0=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr2264866ybv.401.1596828939900;
 Fri, 07 Aug 2020 12:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vFU24w0XYxsksZMJF5iLbT8UU_q3UieCRyWDH9BwVpzQ@mail.gmail.com>
 <CAMuHMdW9CrG6__-L89ZPvN0H_SJyNmf3RcojHJaAx8M5FJOm_A@mail.gmail.com>
In-Reply-To: <CAMuHMdW9CrG6__-L89ZPvN0H_SJyNmf3RcojHJaAx8M5FJOm_A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 7 Aug 2020 20:35:12 +0100
Message-ID: <CA+V-a8t0e7Ys7Mspmh4pU04U7kOJumvJ4+pNzxGqXd1ZcMTQsg@mail.gmail.com>
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

On Fri, Aug 7, 2020 at 9:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 6, 2020 at 7:01 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > During adding support for SATA on RZ/G2H, I was trying some stress
>
> RZ/G2N, according to the logs?
>
> > testing on the stock 5.8.0 kernel.
> >
> > $ dd if=/dev/urandom of="${TMP_DIR}/random-data" bs=1M count=1000 # Works OK
> > $ time bonnie++ -d "${MNT_DIR}" -u root # Worked OK, as Biju pointed
> > out earlier he had seen an issue with this and disabling
> > CONFIG_PROVE_LOCKING fixes it.
> > $ for i in {1..50}; do echo $i;cp random-data random-data-$i;sync;
> > done # This is where I saw random kernel panics/EXT4 errors
> >
> > To prove it out it's not the SATA I switched to USB3 and kept on
> > seeing similar issues. To make sure if the device is OK I tested the
> > devices on VLP1.0.4 release and saw no such behaviour.
> >
> >  I have been using renesas_defconfig + enabled modules + added USB3
> > firmware file
> > * Tried disabling cma (cma=0 in bootargs)
> > * Before mounting the device made sure I run e2fsck
> > * Also ran badblocks tool on the device and saw no issues
> > * Disabled CONFIG_HUGETLBFS/CONFIG_ZONE_DMA32
> >
> > I also tested on R-car M3N with renesas_defconfig and saw no issues
> > with USB ext4.
>
> I assume you can run the same kernel on R-Car M3-N and RZ/G2N, if you
> enable support for both SoCs.  Does that show the problem on both?
>
Yes I did use the same kernel on bot the platforms.

> > Any thoughts on what could be causing this issue. (I will start
> > comparing the VLP kernel)
>
> What's the VLP kernel?
>
Eventually you found it out :)

> If you have two kernels, one that works, and one that doesn't, you can
> bisect the issue.  Might be not so simple, if the two versions have
> diverged, but you can always try rebasing the newest tree on top of the
> oldest one, and run git bisect on that.
>
> Your log for M3-N doesn't show the firmware boot log, but your RZ/G2N
> board has "Lossy Decomp areas".  My R-Car M3-N Salvator-XS doesn't
> have those.  Also, there may be a difference in the QoS settings.
>
> Good luck finding the cause!
>
Using the latest e2fsprogs tools [1] I am no more seeing any kernel
panics now. Sorry for the noise.

[1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.6/

Cheers,
--Prabhakar

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
