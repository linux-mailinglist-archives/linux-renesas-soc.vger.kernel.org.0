Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A402714DF18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 17:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgA3Q1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 11:27:43 -0500
Received: from verein.lst.de ([213.95.11.211]:40913 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727263AbgA3Q1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 11:27:43 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 442FB68C4E; Thu, 30 Jan 2020 17:27:41 +0100 (CET)
Date:   Thu, 30 Jan 2020 17:27:40 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eric Dumazet <edumazet@google.com>, Christoph Hellwig <hch@lst.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dma-debug: increase HASH_SIZE
Message-ID: <20200130162740.GA6429@lst.de>
References: <20191030184844.84219-1-edumazet@google.com> <CAMuHMdVK=dUxhJh1pjLe4bGn3V=FHJ_90oga0USRBw-wSqd8Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVK=dUxhJh1pjLe4bGn3V=FHJ_90oga0USRBw-wSqd8Pw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 10, 2019 at 03:55:08PM +0100, Geert Uytterhoeven wrote:
> On Wed, Oct 30, 2019 at 8:13 PM Eric Dumazet <edumazet@google.com> wrote:
> > With modern NIC, it is not unusual having about ~256,000 active dma
> > mappings. Hash size of 1024 buckets is too small.
> >
> > Forcing full cache line per bucket does not seem useful,
> > especially now that we have a contention on free_entries_lock
> > for allocations and freeing of entries. Better using space
> > to fit more buckets.
> >
> > Signed-off-by: Eric Dumazet <edumazet@google.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  kernel/dma/debug.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> > index 4ad74f5987ea9e95f9bb5e2d1592254e367d24fb..35e2a853bff9c482d789ab331d79aaee07753a97 100644
> > --- a/kernel/dma/debug.c
> > +++ b/kernel/dma/debug.c
> > @@ -27,7 +27,7 @@
> >
> >  #include <asm/sections.h>
> >
> > -#define HASH_SIZE       1024ULL
> > +#define HASH_SIZE       16384ULL
> >  #define HASH_FN_SHIFT   13
> >  #define HASH_FN_MASK    (HASH_SIZE - 1)
> >
> > @@ -87,7 +87,7 @@ typedef bool (*match_fn)(struct dma_debug_entry *, struct dma_debug_entry *);
> >  struct hash_bucket {
> >         struct list_head list;
> >         spinlock_t lock;
> > -} ____cacheline_aligned_in_smp;
> > +};
> >
> >  /* Hash list to save the allocated dma addresses */
> >  static struct hash_bucket dma_entry_hash[HASH_SIZE];
> 
> JFTR, this increases dma_entry_hash size by 327680 bytes, and pushes
> a few more boards beyond their bootloader-imposed kernel size limits.
> 
> Disabling CONFIG_DMA_API_DEBUG fixes that.
> Of course the real fix is to fix the bootloaders...

Can someone just send a patch to switch this to a dynamic allocation?
