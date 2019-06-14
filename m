Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D3545647
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfFNH1W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:27:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36783 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfFNH1W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:27:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so1013506lfc.3;
        Fri, 14 Jun 2019 00:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdzPCh9Iq6DsZwmNtrM2YKJ68uEFiOmJCFPMQ9QBxhg=;
        b=IgBS2hKbaMLWy3bidnBSuTTGRDrXEvUkf+CHJKiR3ZDo+aohC6GjUQflWKObfWaBcw
         M8n3SUHSOrcoOnwHh9iXp7eZYZArhvdAgQsanPK7TpPgWe8keVpBxAeTyiXCdBHs/Tu/
         v+2qWqhoT4NWEmFcBlV4qhKheqzefhDbi3KXI+cWCgvxp302SFKZYlpC/h3WG5oKt82Y
         ktOB2pZV4iB1KpCqoU+F3dVutr2ulLWCvL1rD8auvgbGkwAVKuMCY9mmOTGA2Cwa/Ry5
         IUWYdcrTmCPCWmyXv3vJl8ZIfCk+T0pnYqrg23c/pOSPQ8XAWmijY/nGQSvSjapOK49h
         MySw==
X-Gm-Message-State: APjAAAXT19WQ0+xz3dzOxOa8imdlVQO53iTdpp700pyJ5k9pk5sGrHAG
        GM3GrcaeuaB28M/w8rKC8YZw26dqd49Iu3ko4u8=
X-Google-Smtp-Source: APXvYqyZPsGGwkPkWixMhMUECj/EG4qRfXowB8lnrcuhtq1khDIasqYBoWJAfAgpDFug4QWIzzNZRN21TX7Vx1y1Gng=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr8197569lfp.90.1560497239682;
 Fri, 14 Jun 2019 00:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com> <20190614071800.GB8420@lst.de>
In-Reply-To: <20190614071800.GB8420@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Jun 2019 09:27:06 +0200
Message-ID: <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
To:     Christoph Hellwig <hch@lst.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Joerg Roedel <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-block@vger.kernel.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On Fri, Jun 14, 2019 at 9:18 AM Christoph Hellwig <hch@lst.de> wrote:
> On Thu, Jun 13, 2019 at 10:35:44PM +0200, Geert Uytterhoeven wrote:
> > I'm always triggered by the use of min_t() and other casts:
> > mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
> > dma_max_mapping_size() returns size_t, which can be 64-bit.
> >
> >  1) Can the multiplication overflow?
> >     Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
> >     prevent overflow for max_req_size"), but I thought I'd better ask.
> >  2) In theory, dma_max_mapping_size() can return a number that doesn't
> >     fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
> >     is zero?
>
> This really should use a min_t on size_t.  Otherwise the patch looks
> fine:

Followed by another min() to make it fit in mmc->max_req_size, which is
unsigned int.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
