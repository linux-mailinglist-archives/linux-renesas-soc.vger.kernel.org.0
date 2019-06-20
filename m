Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0E34CF3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 15:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfFTNod (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 09:44:33 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36237 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfFTNod (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 09:44:33 -0400
Received: by mail-vs1-f68.google.com with SMTP id l20so1556513vsp.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2019 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tlLhDefmPOqJmzoPZjoXsId6MQiVQb8qkG6/9Xx5J/Y=;
        b=u1dFIbjLYH3W5fygItACXlWLOTsCdh4F36k7s2Wa1tMu3g/E7a5Azh1b89WfepX51N
         nlJxbBbQJN/4HZtjJEnNmJFV/04xRkQBEIogFWZqk25UMXYyx/Pn64TXSdkT+XqmNQ9w
         BC7wctZYfYzST8MsL83g3yeVA4+x33jOeSbRVlHpWBMvInTnsbMou3GQd49pqd2cmk2A
         zgKqcrAHTCds9nFkj15ChQHh01zzdLg2XtwdEYw62QsQrBudKle7oHb3PXPn/44guKd2
         d3YgeE/sTNm2Uf5D992Lveg3Tsd2GoFBcAsod9DJ/Btj7XCGMVPgYESG8E3lYqeN72ie
         3o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tlLhDefmPOqJmzoPZjoXsId6MQiVQb8qkG6/9Xx5J/Y=;
        b=gYgF2xXi7ilWOjwbq58LLPziiXckfMykB4AnkVI4WW70C16PsFwVPa5fNqkpT2kQkO
         P+NOBKv7CcQIPLTo3gnc85Ur7uJEsRB3t3Jj4BC8b3TeOcKo+PfBBns/WIM+K2HSRyTp
         PDusJCgqZ8bD0tnJJCcxBKsV0gmxv15WgZgYvrfcmTytz/F9k9zU2282M6Na0IvzNj3t
         Y4T1dBy/8Lj9earEsvpqKSy6AkOz2Y+wWycmg14Irkjsqw0LSm0rh7CjMNEDw0DBoIuE
         8RSK/eh+BBtF9nXIEUz7G60BhhSK7IXA3CqB+73cfc9ZVePNz6IlgGCogHolFeZrC2FD
         M1Mw==
X-Gm-Message-State: APjAAAXPoYVBgSnYUJZa2XJf/i5JOnolusR6Qo/r1xr+lapBjB8Saa66
        NRM70dr0YKrnfFVggWHF0Vp3XtWXdPhqI3UixmVDOw==
X-Google-Smtp-Source: APXvYqzMIBdBIwEAdY37UCRdLynDCeb7/HznevZOAHrdmuJZxdWPDVQSlZdTht/fEH7zC9gJP/PBv45T0W5/p2zcj/s=
X-Received: by 2002:a67:ee16:: with SMTP id f22mr21398096vsp.191.1561038271979;
 Thu, 20 Jun 2019 06:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 20 Jun 2019 15:43:55 +0200
Message-ID: <CAPDyKFqkeEYMznEWSfjXJs_Nb_0DMxxTp1tTwXpmg+DkH+cZ7g@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: Use dma_max_mapping_size() instead of a workaround
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christoph Hellwig <hch@lst.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 19 Jun 2019 at 06:55, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> provides a helper function to get the max mapping size, we can use
> the function instead of the workaround code for swiotlb.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  This patch is from other patch series [1]. Since this patch can be
>  applied right now because this patch is independent with other subsystems
>  on the patch series.
>
>  [1]
>  https://patchwork.kernel.org/patch/10992401/
>
>  Changes from the [1] above:
>  - Use size_t instead of "unsigned int" on min_t.
>  - Remove #include directive of swiotlb.h.
>  - Add Acked-by and Reviewed-by.
>
>  drivers/mmc/host/tmio_mmc_core.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 83fd943..2cb3f95 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -26,6 +26,7 @@
>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/highmem.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -45,7 +46,6 @@
>  #include <linux/scatterlist.h>
>  #include <linux/sizes.h>
>  #include <linux/spinlock.h>
> -#include <linux/swiotlb.h>
>  #include <linux/workqueue.h>
>
>  #include "tmio_mmc.h"
> @@ -1199,19 +1199,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
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
> +       mmc->max_req_size = min_t(size_t,
> +                                 mmc->max_blk_size * mmc->max_blk_count,
> +                                 dma_max_mapping_size(&pdev->dev));
>         mmc->max_seg_size = mmc->max_req_size;
>
>         if (mmc_can_gpio_ro(mmc))
> --
> 2.7.4
>
