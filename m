Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173E44047D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 11:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhIIJe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 05:34:29 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:43652 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhIIJe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 05:34:27 -0400
Received: by mail-vs1-f53.google.com with SMTP id u1so965795vsq.10;
        Thu, 09 Sep 2021 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wO4uEOZXmVlM7tblOFCNyxQE4NE3jdr5EX9nhntYSw=;
        b=r1tW64eg6LsjwMbCUcVxgMe3YKz+RfM62YPbREeOCeuFtCLAq6LJZfY3g1KrHkdkPE
         Wfu6k38TtNZwkTg5xkb20ODtPwXByiHnpEKwJGBk9Cx9M6WO0k3uv4GYAMfqRpzqIME6
         TgB7cSJPXH66tIeuBgc07/v7beUR27707VX2wBCxqKjKZc3lNsL7iHgru3afQrXjjMyn
         ZVHR8UOldd9CBmFZznOZ6NGTsS5upabvz6lXT9L92I/bMY/r6klQsOSRRRxzi/bbTVUU
         03x8shrHd/pYmNCT1BPXaNVoxdViTtrovApcD3bJjGuNloRd/FZKqQuRGhTdcsiV/c1e
         WCJg==
X-Gm-Message-State: AOAM530qCZXBb24bPpvJoTbg9P3et0gxa49NNTvVrOTro7sj/mq+ALgz
        vR5c7mSJxwDogCpOvD0SXIwzcrVZe033S8x8Jf6yFObSBzQ=
X-Google-Smtp-Source: ABdhPJyNzYMZuvTWyBAZ9WNd97bQOyiOpnPdfUr/BYXbgHyWsV/408RCaXJEAZVcPmNu9IDmP2IDoZlj/+z0oImJXyU=
X-Received: by 2002:a05:6102:2417:: with SMTP id j23mr669655vsi.35.1631179992938;
 Thu, 09 Sep 2021 02:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com> <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
In-Reply-To: <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Sep 2021 11:33:01 +0200
Message-ID: <CAMuHMdUuqQe6cM-Zt1GWq6xgydv1po8FOOW9qWe+5hK=ZRqE+w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old SDHIs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Aug 26, 2021 at 4:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Aug 26, 2021 at 10:21 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Old SDHI instances have a default value for the reset register which
> > keeps it in reset state by default. So, when applying a hard reset we
> > need to manually leave the soft reset state as well. Later SDHI
> > instances have a different default value, the one we write manually now.
> >
> > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Geez, typical SDHI nastiness here...
> >
> > Geert: I think this fixes the issue you saw on Koelsch. It works fine on
> > my Lager now at least. Can you please test and tag if all goes well?
> > It would be great to have this in 5.14 but it definately needs Geert's
> > confirmation first.
>
> Thanks, fixes the SD Card issue is was seeing on Koelsch, and still
> works on Salvator-XS.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this does not fix the issues on gose and alt in Magnus'
farm, but they may have failed before b4d86f37eacb too.

gose:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD51)
    mmc0: error -110 whilst initialising SD card
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    ------------[ cut here ]------------
    WARNING: CPU: 1 PID: 35 at kernel/dma/debug.c:498 add_dma_entry+0x134/0x178
    DMA-API: exceeded 7 overlapping mappings of cacheline 0x0000000001099f61

alt:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    DMA-API: cacheline tracking EEXIST, overlapping mappings aren't supported
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    ------------[ cut here ]------------
    WARNING: CPU: 1 PID: 49 at kernel/dma/debug.c:498 add_dma_entry+0x134/0x178
    DMA-API: exceeded 7 overlapping mappings of cacheline 0x0000000001082b42

Other MMC instances on gose and alt seem to work.

From my limited collection of logs of booting on these boards, ee100000.mmc on
  - gose worked in v4.15, and is broken since at least v4.17,
  - alt worked in v5.1-rc6, and is broken now.
SD cards might have been changed in the meantime, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
