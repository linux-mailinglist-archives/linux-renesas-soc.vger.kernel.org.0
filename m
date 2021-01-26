Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59E303B12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 12:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404860AbhAZLGY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 06:06:24 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:45847 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbhAZLFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 06:05:09 -0500
Received: by mail-ot1-f54.google.com with SMTP id n42so15786804ota.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 03:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wra+m2uskOa6FZ1lEQnpLyA+vPgYgZTL6cRsChTTktg=;
        b=Vck43lKB670XIPwLPJYrUpAvIhaeaZPuVv9zKtb1rNPQDli2L+OOnwPSMky77z/s9M
         hWx1vePktMqybbYN+nlNxfI6d+KKFZC2lpEOcsERWEM+7MzrTVe8we86gj1qCWtrd3Ql
         riP3EWXpWhU0U9pFyF66mANBFqlE1mKgHBmMQgs7RLkSyHX/sIuqMy3grt5Dk7VorWvn
         m6NGcbV234V0sTh6B/+UCIIZm/3YCQM2+aR60k0v7JlQrK6qK8vjjKxLy1PlecuwFP5y
         vX1iWG/wYNJljjhM7JrvcTNlQ/3KIoXR5ij0v8btN6pNs7M1RJtDJhKlGvoCJHoDUN2Q
         U1vQ==
X-Gm-Message-State: AOAM533FYpNh98wiOqOufMV8dt7PBaOiM6GflWtpPuAuHFRUJ/hyWV9o
        9SQBLKD0ZjAxy31x+wKOsd3rB6UC3QHdXtHemOQ=
X-Google-Smtp-Source: ABdhPJxyvQpBn0h14th2G/gWcLUKW+IopXdAdD6V/eSpHxZOZC3/PuBW8DqrgtjUgrCem6DfothtgMy5yT4ACGzorio=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr3522535otr.107.1611659067702;
 Tue, 26 Jan 2021 03:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20210121144321.GA2101@kunai>
In-Reply-To: <20210121144321.GA2101@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Jan 2021 12:04:16 +0100
Message-ID: <CAMuHMdV=r79KiCAzLF-vrYkGGu7bJP66CgNo2k-UyE0JQh2gZA@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/v3u/devel-v2 for renesas drivers
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 21, 2021 at 3:43 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> here is my updated v3u devel branch for renesas-drivers. It is based on
> our agreed base, so quite some patches from the previous version are

Oops. When discussing this, I thought you were looking for a good base
for development/testing, not for submitting ;-)

> already upstream. For the remaining ones, all review comments have been
> addressed, and the patches have been resent. Most binding doc updates
> are in -next meanwhile. The watchdog patches have been reviewed by
> Guenter. The rest is mainly your realm :) There are some debugging
> patches in there which I left in place.
>
> Please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit 748c9c1c5e7d00fe6d1e5d47140e4492d7e63719:
>
>   Merge branch 'topic/r8a779a0-dt-msiof-v2' into renesas-drivers (2021-01-12 12:36:54 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/devel-v2
>
> for you to fetch changes up to 4a1e26c947d213b717ee6c845dc922b1102305ef:
>
>   HACK: make hscif0 console (2021-01-21 11:41:52 +0100)

Not to be included.

> Wolfram Sang (18):
>       dt-bindings: watchdog: renesas,wdt: add r8a779a0 (V3U) support
>       WIP soc: v3u: allow WDT reset

This is nice to have, for now.

>       arm64: proper comment formatting in reboot handler
>       watchdog: renesas_wdt: don't sleep in atomic context
>       watchdog: renesas_wdt: add grace period before rebooting

This is basically your "renesas/v3u/wdt-v2" branch.

>       v3u: enable other I2C busses for testing

Not to be included.

Due to the amount of conflicts between the old versions in your base,
and the newer accepted versions, and due to the unwanted commits, I'm
cherry-picking the top 5 commits of your "renesas/v3u/wdt-v2" branch
instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
