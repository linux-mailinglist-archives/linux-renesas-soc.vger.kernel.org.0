Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04EA13B76C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jun 2021 18:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhF2RCP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 13:02:15 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:39848 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbhF2RCN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 13:02:13 -0400
Received: by mail-vs1-f52.google.com with SMTP id 68so12510980vsu.6;
        Tue, 29 Jun 2021 09:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d6kM8huxz7lJgI8Xfv5+EFDJ6mF8Gy+7vQKfdOcS19g=;
        b=fp5RePSOEvsHglo+ey1T+DtqvMAoWXJZPTgdRDYM+Uo2neYmS/HEiwEOv6bg1rZFnp
         pbHplDyNhtQyNDO8zyq64mjsdAy4MwUBFez5ckHnECh3zhHsF1EaaRL0xWOlX1yw18C2
         HwC+kSaR9zJOWP/WLXYVy1JFsReU1eHjQo4/4YGg5xLNKMiug5S8aBUOKfbEGyzFq+GW
         U8Uumre3A9lGtIXo8Bj5p0KtIMDeC3YUN4qGcBFoKtg0cEJylAWfong3k9g6zp+Lu6an
         0IR4c4gQ2qRmZarYnmTMx2g4BzSkrJ0h07aRoM8gCe+ussFT4Cwwk0Fty5WS+L/Pi0pC
         1P+A==
X-Gm-Message-State: AOAM532L5pNKVdDYPxSgduY9SpTzc1L+YclQtLo/p/VhS3CJsONG/I5F
        HswW9uD+dvNlc5C68SbXsa1czrMOrr9EJQThApo=
X-Google-Smtp-Source: ABdhPJzzcfBcWfxV4oG3KAOB1O7urgSJJ6l9mjK3mg1+2cztn7oWwFtnQADXEJYyas4Chh7UwEflCtlWkyZjjtHRDUc=
X-Received: by 2002:a67:f7c2:: with SMTP id a2mr24942894vsp.3.1624985984662;
 Tue, 29 Jun 2021 09:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210628150219.GC3840@techsingularity.net>
In-Reply-To: <20210628150219.GC3840@techsingularity.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Jun 2021 18:59:33 +0200
Message-ID: <CAMuHMdXz8RZs2B+juy67smYEzRny9Yej9fUr9odHtSsJb9frQw@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc: Correct return value of populated elements
 if bulk array is populated
To:     Mel Gorman <mgorman@techsingularity.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dave Jones <davej@codemonkey.org.uk>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mel,

On Mon, Jun 28, 2021 at 5:29 PM Mel Gorman <mgorman@techsingularity.net> wrote:
> Dave Jones reported the following
>
>         This made it into 5.13 final, and completely breaks NFSD for me
>         (Serving tcp v3 mounts).  Existing mounts on clients hang, as do
>         new mounts from new clients.  Rebooting the server back to rc7
>         everything recovers.
>
> The commit b3b64ebd3822 ("mm/page_alloc: do bulk array bounds check after
> checking populated elements") returns the wrong value if the array is
> already populated which is interpreted as an allocation failure. Dave
> reported this fixes his problem and it also passed a test running dbench
> over NFS.
>
> Fixes: b3b64ebd3822 ("mm/page_alloc: do bulk array bounds check after checking populated elements")
> Reported-and-tested-by: Dave Jones <davej@codemonkey.org.uk>
> Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
> Cc: <stable@vger.kernel.org> [5.13+]

I saw similar failures as Mike Galbraith when doing s2idle or s2ram
on some boards with some configs:

    Freezing of tasks failed after 20.004 seconds (1 tasks refusing to
freeze, wq_busy=0):
    task:NFSv4 callback  state:S stack:    0 pid:  280 ppid:     2
flags:0x00000000
    [<c094b634>] (__schedule) from [<c094b8d0>] (schedule+0xc0/0x110)
    [<c094b8d0>] (schedule) from [<c094faec>] (schedule_timeout+0xc8/0x108)
    [<c094faec>] (schedule_timeout) from [<c092e0a0>] (svc_recv+0x108/0xa30)
    [<c092e0a0>] (svc_recv) from [<c04c5990>] (nfs4_callback_svc+0x6c/0x84)
    [<c04c5990>] (nfs4_callback_svc) from [<c0244ddc>] (kthread+0x128/0x138)
    [<c0244ddc>] (kthread) from [<c0200114>] (ret_from_fork+0x14/0x20)

I've bisected it (twice, as I couldn't believe the result) to the
same commit, which helped me find the fix.

After cherry-picking commit 66d9282523b32281 ("mm/page_alloc: Correct
return value of populated elements if bulk array is populated"),
the problem went away.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
