Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C41761DE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 13:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfGHLq1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 07:46:27 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42047 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730463AbfGHLq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 07:46:27 -0400
Received: by mail-ua1-f68.google.com with SMTP id a97so4809133uaa.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2019 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=flSipI0xpnq86C8I/rrm9xZYmUfxRgobFckLUfbaRC8=;
        b=XXb+Q80fYNPiOi+n2vBpTR7ILscbEfWMSgFLUGGBp0WIXyrchBmIU+NDlQakm7jnM8
         tMOGGlXLa6lhxN8Ra5giF5vusg5FAGcyYjayn4957m4SVC5MJ6sWMYf/OxIiDdEXGjyl
         t0iUctAF15Luy9UaHIMu7DeLX/vVTxmDkPCj5Sd3ctiKIAbE6unYRJZiySlXBWUfp3Qt
         wSm5DjC32317VN9BrP1dS0bGuEjxebRetq6Ln0vcwZpEzFLSO9tqdk3raraxZko69lN0
         02Xs/0veoLx/lL8aN++HqWTdEhSnkt6acjQytnwnnYv3k8Q3yxAL+Dnno9K+Jo/jxapZ
         ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=flSipI0xpnq86C8I/rrm9xZYmUfxRgobFckLUfbaRC8=;
        b=hRwQ3Vl7o3trE4SsOxf2SpQQ8ZYTFGlrH5Sw9IlsH5+n6C306/CpYYzLRsKjhvr1lJ
         CuPoEPX3jjxfSVMcr8zWX+Z4yzOYsYFKYfdqpiHzy04+jiucUYr+alyiTa1ujZoJBBC9
         TT8MHUGmHl/R+JG0wtdAU6PY2XiGftbxmvqvoRL9X21hO6lR9VN8W2e4teVGKtGnEDtt
         Ov3KV5WQKczSBR/4mVrxYRS1uh+qIm/KQJKcE61wAHzyPQ12ABlzZ2bUEGATvzDeCBbH
         Npn1Lve2JIavhIGr5Uy/xxHVyGbX5igLz0CtkpdJgiHoFtuGek0v7XjgqGSHYn/QrVSv
         Oo1A==
X-Gm-Message-State: APjAAAXit5N4qJJEuMLjmOGfWhWWdZYEdP/aPjJHSJLSZaTDO/e9NbQR
        JW/hPWyeSo3ANGXgKw0bN3mWQyWEBGOXckZ6RnG17Q==
X-Google-Smtp-Source: APXvYqyFEUscJD5GsIV+BS++o/YX8MWQdCWyg9O7X6Nb/wsuAeld8qTTFnYvdC785Otd3OEmiYJn0ixqzjixmeBiM0Q=
X-Received: by 2002:ab0:60ad:: with SMTP id f13mr9491120uam.129.1562586386291;
 Mon, 08 Jul 2019 04:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1561020610-953-6-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190624062414.GD2989@lst.de>
In-Reply-To: <20190624062414.GD2989@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jul 2019 13:45:50 +0200
Message-ID: <CAPDyKFpuRzmZUK730FMnh0hf3WRFb9aA=o9ciNt2ei8n803vsQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 5/5] mmc: queue: Use bigger segments if DMA MAP
 layer can merge the segments
To:     Christoph Hellwig <hch@lst.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        Jens Axboe <axboe@kernel.dk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 24 Jun 2019 at 08:24, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jun 20, 2019 at 05:50:10PM +0900, Yoshihiro Shimoda wrote:
> > When the max_segs of a mmc host is smaller than 512, the mmc
> > subsystem tries to use 512 segments if DMA MAP layer can merge
> > the segments, and then the mmc subsystem exposes such information
> > to the block layer by using blk_queue_can_use_dma_map_merging().
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/mmc/core/queue.c | 35 ++++++++++++++++++++++++++++++++---
> >  include/linux/mmc/host.h |  1 +
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> > index 92900a0..ab0ecc6 100644
> > --- a/drivers/mmc/core/queue.c
> > +++ b/drivers/mmc/core/queue.c
> > @@ -24,6 +24,8 @@
> >  #include "card.h"
> >  #include "host.h"
> >
> > +#define MMC_DMA_MAP_MERGE_SEGMENTS   512
> > +
> >  static inline bool mmc_cqe_dcmd_busy(struct mmc_queue *mq)
> >  {
> >       /* Allow only 1 DCMD at a time */
> > @@ -196,6 +198,12 @@ static void mmc_queue_setup_discard(struct request_queue *q,
> >               blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
> >  }
> >
> > +static unsigned int mmc_get_max_segments(struct mmc_host *host)
> > +{
> > +     return host->can_dma_map_merge ? MMC_DMA_MAP_MERGE_SEGMENTS :
> > +                                      host->max_segs;
>
> I personally don't like superflous use of ? : if an if would be more
> obvious:
>
>         if (host->can_dma_map_merge)
>                 return MMC_DMA_MAP_MERGE_SEGMENTS;
>         return host->max_segs;
>
> but that is really just a nitpick and for the mmc maintainer to decide.

I have no strong opinions, both formats are used in mmc code, so I am
fine as is.

>
> Otherwise looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
