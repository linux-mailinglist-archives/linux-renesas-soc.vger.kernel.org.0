Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8778F3AC938
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 12:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhFRKzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:55:53 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:46594 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbhFRKzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:55:46 -0400
Received: by mail-vk1-f172.google.com with SMTP id 184so2036270vkz.13;
        Fri, 18 Jun 2021 03:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sYxRfw3d4qaZ6McrYDOsqlLWoh2fC/NDUP03irOL83Q=;
        b=ZzNwhJK4RTzHugsxA4Ln4XN0emPIu+CpNgl2Vow2uD3cnyvbI3jYuXLZS0eLld34AM
         Exwke0hnCsGkImURv8q37vYoZ2ls1iMRJ1IwASsfc4yn5Cw8iFXBS6p3dXBe5EF3TKon
         O7GRwWk3UIzLiVcsKEjOwx52ecB4VnklX0QRiQKk/a/0lI9yDWM4CdfklZqdvBzyetGg
         F1JOxGGvDYKmj4g0BwGQwx8k3YprUFxi459vTMG8KXZJtf7JIpZnY3xw4DXE61mWKk7G
         mMK6DLF1b6Ywk2GZWeF9ibZvUx4w4lIu8XOFyhjuMlxCSCVnLi0RMbECht9s+PhC9oym
         IIiA==
X-Gm-Message-State: AOAM532aoc9T3tGjP9deH/PIBp3Cebg+Vv4LxzgYuDyDB0CLH3Osk47E
        4SUBykGvCS8wYc78YBvNoI3TrnXkc7ks5B3ab/c=
X-Google-Smtp-Source: ABdhPJw75HBvQFIABtCnmnhIxHN01rtAFDlpJonWMok5IRC+aCrZDzRnUhOarwgCk3EKXzqfeROzfnBa/ez6Ma6YGqs=
X-Received: by 2002:a1f:ac45:: with SMTP id v66mr5421719vke.1.1624013616586;
 Fri, 18 Jun 2021 03:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
 <20210317091622.31890-4-wsa+renesas@sang-engineering.com> <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
 <YMxpMKH39aYs4Zaz@ninjato> <CAMuHMdW1wr3j8DgL34V3RiHX9qmqo3tfSWxo3VBwHCO1XFMGGg@mail.gmail.com>
 <YMxt9JA0q1HGwS34@ninjato>
In-Reply-To: <YMxt9JA0q1HGwS34@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 12:53:25 +0200
Message-ID: <CAMuHMdV3fLJBoKOafrOPFnF+_nU+GCFz3V6XpJabBhSPJtLK3g@mail.gmail.com>
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

On Fri, Jun 18, 2021 at 11:57 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > BTW, does it work (really) fine on R-Car Gen3? Mine does.
>
> Yes, mine does, too. So, I first wondered if the difference is an older
> SCC variant. But when I let the timeouts run for a while, I get a DMA
> problem. Which could also be the difference between Gen2 and Gen3 here:
>
> [   53.328284] WARNING: CPU: 0 PID: 743 at kernel/dma/debug.c:498 add_dma_entry+0x158/0x180
> [   53.336397] DMA-API: exceeded 7 overlapping mappings of cacheline 0x011807bc

Someone's forgetting to clean up DMA mappings?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
