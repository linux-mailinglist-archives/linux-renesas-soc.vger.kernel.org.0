Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1851B479F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbfFQGXk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:23:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33258 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfFQGXk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:23:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so5621568lfe.0;
        Sun, 16 Jun 2019 23:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7XRJjX0kBku2ATYK3GUg5Lrv9SchTe3YLEUK9ub8O0=;
        b=aFAOIXLjO1Yshdrv5E0gCunEbmNRlNYVFfkGD7K0VEgA1zCOH7VyUvga1Qztek26er
         vf3lhTFDXGWlg9kiL2Kkr75PTQ6FrRwoYMzbJQfHV2RxcJR9BCM7fEuNAvQt8Tk0PTAy
         wAqaFcrhJLhUZY4f0bDHx4PGUTQG5Uh4i4+7Nfax6bXj8sE0Eo5f+5xyOFLXisiRZ4R/
         vJbp6FbuRS0XvpXuAydXbezwLqjAMQccrJp6KmqOB8luskqMCHy3s0AT6/nAqkPH18yx
         8gzMXc+EF9TFLBJPG0bII9QOISCIdE4/0qqZOhZGKVeAmxSmNqx5hTvuRz/7vRArTPiF
         ix5A==
X-Gm-Message-State: APjAAAXnbetDif0hRZPef/IaBWNMm/Yo+FLY4JviNbwf0+v6dG4s1QkC
        U4iD5DV8WFDopuwcLUR2vlbovVGCZSSy7/xALyo=
X-Google-Smtp-Source: APXvYqy3bhMxkDPqSpihWCfeWIwNFdNEjnMbVm8tSrWIEMfR4v+33Zv0KgrWbN5daZ3WDGCGRcCppWVYxjCWl/bFHac=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr46867465lfk.20.1560752617786;
 Sun, 16 Jun 2019 23:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
 <20190614071800.GB8420@lst.de> <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
 <OSBPR01MB3590D4EF069F4554DA5D7ABBD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3590D4EF069F4554DA5D7ABBD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jun 2019 08:23:24 +0200
Message-ID: <CAMuHMdWPUZGFWeKzPK=zkwc5h2SD+aW6ULb8C2rDJSmTWNXjeA@mail.gmail.com>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
        Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 17, 2019 at 6:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, June 14, 2019 4:27 PM
> > On Fri, Jun 14, 2019 at 9:18 AM Christoph Hellwig wrote:
> > > On Thu, Jun 13, 2019 at 10:35:44PM +0200, Geert Uytterhoeven wrote:
> > > > I'm always triggered by the use of min_t() and other casts:
> > > > mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
> > > > dma_max_mapping_size() returns size_t, which can be 64-bit.
> > > >
> > > >  1) Can the multiplication overflow?
> > > >     Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
> > > >     prevent overflow for max_req_size"), but I thought I'd better ask.
>
> Geert-san:
>
> I agree.
>
> > > >  2) In theory, dma_max_mapping_size() can return a number that doesn't
> > > >     fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
> > > >     is zero?
>
> Geert-san:
>
> I agree. If dma_max_mapping_size() return 0x1_0000_0000, it will be truncated to 0
> and then max_req_size is set to zero. It is a problem. Also, the second argument
> "mmc->max_blk_size * mmc->max_blk_count" will not be overflow and then the value is
> 0xffff_ffff or less. So, I also think this should use size_t instead of unsigned int.
>
> > > This really should use a min_t on size_t.  Otherwise the patch looks
> > > fine:
> >
> > Followed by another min() to make it fit in mmc->max_req_size, which is
> > unsigned int.
>
> Geert-san:
>
> I'm afraid, but I cannot understand this means.
> Is this patch is possible to be upstream? Or, do you have any concern?

Please disregard my last comment: as the value of "mmc->max_blk_size *
mmc->max_blk_count" is always 0xffff_ffff or less, "min_t(size_t,
mmc->max_blk_size * mmc->max_blk_count, dma_max_mapping_size(&pdev->dev))"
will always be 0xffff_ffff or less, too, so there is no extra step needed
to make it fit in mmc->max_req_size.


Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
