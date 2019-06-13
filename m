Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6B644D8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfFMUgF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 16:36:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33682 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfFMUgE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 16:36:04 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so152729lfe.0;
        Thu, 13 Jun 2019 13:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9pT9j7kn/J7EUGyq2uQP5wwtUmztL0xFNDiGg1L3+E=;
        b=CNThz6qJyzZAseMrCUpQ8JH6LiOLSf1DC1lOoGkVmMO5CIWri3OHBuYo70YLIKgMfN
         fLOdU+5kfKaoOkoBR0jbRd47LN0sndM0Mn00hpgAmd6XPQpbAmp7xA/lHsbQiblWmgYv
         Ls2OcWX7KONQkOntahzvzOzQ6Pf8HxclDO14576PNY5ap1nrjX3bHXSfMiKdf70m66Lf
         GacUElLyZF8yL3+VJ7B8C9dSlonsEEwIUJsRXfHpYWbWEzIRPlrOfp23dErYRsFmiTmE
         r28GVXuPuVNMvwYVnUnKDPQg5iKBT9d9zPkoVLSLdCLZ9t6CpJKE+pwI635LR/xHQlQd
         cPIA==
X-Gm-Message-State: APjAAAXytMawGRjOIbZWN1mpHwWH+/Ze22nMjmH+d7stS103sKnuBUDM
        nGkyHDYt4uUBbqtk3gksg51Wbg8N1e9MlCAN7wc=
X-Google-Smtp-Source: APXvYqyOWgizpjNJBHEjXaulJf3xyZqsd/zF8eSxKDl95LQ2jEFxxsiGEU0nnfy+4XAHYrmPxUskeM/VT/LQIlrurTA=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr7062073lfp.90.1560458162259;
 Thu, 13 Jun 2019 13:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Jun 2019 22:35:44 +0200
Message-ID: <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-block@vger.kernel.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Jun 13, 2019 at 5:37 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> provides a helper function to get the max mapping size, we can use
> the function instead of the workaround code for swiotlb.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c

> @@ -1189,19 +1190,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         mmc->max_blk_size = TMIO_MAX_BLK_SIZE;
>         mmc->max_blk_count = pdata->max_blk_count ? :
>                 (PAGE_SIZE / mmc->max_blk_size) * mmc->max_segs;
> -       mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
> -       /*
> -        * Since swiotlb has memory size limitation, this will calculate
> -        * the maximum size locally (because we don't have any APIs for it now)
> -        * and check the current max_req_size. And then, this will update
> -        * the max_req_size if needed as a workaround.
> -        */
> -       if (swiotlb_max_segment()) {
> -               unsigned int max_size = (1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
> -
> -               if (mmc->max_req_size > max_size)
> -                       mmc->max_req_size = max_size;
> -       }
> +       mmc->max_req_size = min_t(unsigned int,
> +                                 mmc->max_blk_size * mmc->max_blk_count,
> +                                 dma_max_mapping_size(&pdev->dev));
>         mmc->max_seg_size = mmc->max_req_size;

I'm always triggered by the use of min_t() and other casts:
mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
dma_max_mapping_size() returns size_t, which can be 64-bit.

 1) Can the multiplication overflow?
    Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
    prevent overflow for max_req_size"), but I thought I'd better ask.
 2) In theory, dma_max_mapping_size() can return a number that doesn't
    fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
    is zero?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
