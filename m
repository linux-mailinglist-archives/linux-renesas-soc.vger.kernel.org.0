Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1493AC7DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 11:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhFRJpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 05:45:09 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:35373 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhFRJpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 05:45:07 -0400
Received: by mail-ua1-f43.google.com with SMTP id n61so3180157uan.2;
        Fri, 18 Jun 2021 02:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=USApm9qqyMxys8M4WRyT0W7c2fCSYlqnacCL4GWxmpw=;
        b=bp2T7qCIhi3oC3VrQL3o92aAqEYcKVdSzirCokCYAlkHlT1AGShve325/B6qTXPw7p
         JYRWp62PNmfsew1XvA0pyrYaZZRjaOXzaJ1cFuZ9FLWth1Nx32KFPqOqRSbOid+ngeLR
         cDHYf7OY0X/onuKx6AbAhP0j5DU/75pJ1Fx9ATNyw78mvNqREnOcRfc9BQBBIrX8Bb0b
         n5WQdg2zjYgY2arR4+5oFFsmQUNoafhrk3rgvvg2TXf0UxEQ8fJWZsZSZaAB6fcaQpIO
         Bha+txFKXBKdH7aKAtfdqaEnAlBlveeD6Sg903DdC9SXNxnsaW3CXaaa1rMWWtRsi+w8
         2xjA==
X-Gm-Message-State: AOAM5322qCLQkHIuQGyGoa7N0TitzLtdUcCRQVRKwYtRpEiVSzENW8Kn
        uc+r9HWfW3Nnx4O2HzlXKzLzSZActuvZUYy3tA3eQgOkK8I=
X-Google-Smtp-Source: ABdhPJwGbwSNUGzzbKfVeTixvpouXE9xdQynVNAela8w/KKuqcDFNZ126U7KfM5CNOu5q8B/5er493lho4EvgnIK+og=
X-Received: by 2002:ab0:647:: with SMTP id f65mr10882629uaf.4.1624009377785;
 Fri, 18 Jun 2021 02:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
 <20210317091622.31890-4-wsa+renesas@sang-engineering.com> <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
 <YMxpMKH39aYs4Zaz@ninjato>
In-Reply-To: <YMxpMKH39aYs4Zaz@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 11:42:46 +0200
Message-ID: <CAMuHMdW1wr3j8DgL34V3RiHX9qmqo3tfSWxo3VBwHCO1XFMGGg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jun 18, 2021 at 11:36 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > In v5.10, v5.11, and v512, it works fine:
> >
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     mmc0: new ultra high speed SDR104 SDHC card at address aaaa
> >     mmcblk0: mmc0:aaaa SM32G 29.7 GiB
> >       mmcblk0: p1
> >
> > Note that I do see one timeout during identification.
> >
> > After b4d86f37eacb7246 (bisected), it fails:
> >
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     [...]
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     mmc0: tuning execution failed: -5
> >     mmc0: error -5 whilst initialising SD card
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
> >     [...]
> >
> > Given the single timeout I see with older kernels, the issue may be that the
> > harder reset causes that timeout to repeat ad infinitum?
>
> I can confirm this. I also found a SanDisk card which shows the same
> issue on my Lager board. However, I wouldn't say this patch breaks
> things in a way that a revert is a good solution.
>
> The card does not really work "fine". During probe we get one timeout,
> and when trying to read from the card, more follow. Already before this
> patch. There seems to be a state where an initial command fails and only
> the retry suceeds. The hard reset in deed seems to cause an endless loop
> here. However, the proper fix is to find out why this first command
> fails, especially only with some cards. My Samsung one works 100% fine.

BTW, does it work (really) fine on R-Car Gen3? Mine does.

> And if we fix this, then the hard reset is still good for Gen2 as well.
>
> Makes sense?

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
