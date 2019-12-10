Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC554118BB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 15:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfLJOzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 09:55:20 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41533 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfLJOzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 09:55:19 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so15701560otc.8;
        Tue, 10 Dec 2019 06:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxfx8pYcfnvd3lqW1qImtgwu7XzTFQuwrY147FPzqGI=;
        b=YRyoRk57De2c4zcSJKKnR566euN0kLevtMG85WIwzl6M5FpKJB8pwbGP7AXKM/AxNd
         Nld0WUKfOFGhYIP/P9/7IIHExb8cIuXnM2VW/xex87Lf5HVnpdP+yYZU174NpKDyQRqc
         2lQt2tl7oYMNaEalKntzAUizrWIu8B49ampjbXzPOC4n2KaUwLcPzTLHIk2VqO4abL8n
         QjNJ1sFFblQfRywwVVOrgjukQnGbtxQ9ISQBA+XLye86Jh/jJc/lzK6TjDoOQ5pheEkr
         LmVFfg6HKM+rjMQ2DaOyJQ4QOd2/zeDn5oj/guSfnIwQvfgcJ55XIdh1eE8uDWCdC3U1
         CXtg==
X-Gm-Message-State: APjAAAWk81x3IigLOJ6XIdcsylnqR2yoJuBQKGsBAL23Rtm7sziZQ8S+
        x6acJ/4ojIc5MjGLF5ICbGRdyGWB1Sgva0N0gRY=
X-Google-Smtp-Source: APXvYqyvpesdaROFU80iQbYfg6jNyZzt/R79xRmZAAQaMqkHwq20yaDGs/xYgnPW9xtctjeHu1wtxLpcUrAqR6E22Hg=
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr24883423otr.39.1575989718977;
 Tue, 10 Dec 2019 06:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20191030184844.84219-1-edumazet@google.com>
In-Reply-To: <20191030184844.84219-1-edumazet@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Dec 2019 15:55:08 +0100
Message-ID: <CAMuHMdVK=dUxhJh1pjLe4bGn3V=FHJ_90oga0USRBw-wSqd8Pw@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: increase HASH_SIZE
To:     Eric Dumazet <edumazet@google.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 30, 2019 at 8:13 PM Eric Dumazet <edumazet@google.com> wrote:
> With modern NIC, it is not unusual having about ~256,000 active dma
> mappings. Hash size of 1024 buckets is too small.
>
> Forcing full cache line per bucket does not seem useful,
> especially now that we have a contention on free_entries_lock
> for allocations and freeing of entries. Better using space
> to fit more buckets.
>
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  kernel/dma/debug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 4ad74f5987ea9e95f9bb5e2d1592254e367d24fb..35e2a853bff9c482d789ab331d79aaee07753a97 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -27,7 +27,7 @@
>
>  #include <asm/sections.h>
>
> -#define HASH_SIZE       1024ULL
> +#define HASH_SIZE       16384ULL
>  #define HASH_FN_SHIFT   13
>  #define HASH_FN_MASK    (HASH_SIZE - 1)
>
> @@ -87,7 +87,7 @@ typedef bool (*match_fn)(struct dma_debug_entry *, struct dma_debug_entry *);
>  struct hash_bucket {
>         struct list_head list;
>         spinlock_t lock;
> -} ____cacheline_aligned_in_smp;
> +};
>
>  /* Hash list to save the allocated dma addresses */
>  static struct hash_bucket dma_entry_hash[HASH_SIZE];

JFTR, this increases dma_entry_hash size by 327680 bytes, and pushes
a few more boards beyond their bootloader-imposed kernel size limits.

Disabling CONFIG_DMA_API_DEBUG fixes that.
Of course the real fix is to fix the bootloaders...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
