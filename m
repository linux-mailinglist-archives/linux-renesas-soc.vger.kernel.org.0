Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8987D3F5F13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 15:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237657AbhHXN0f convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 09:26:35 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:36699 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237649AbhHXN0e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 09:26:34 -0400
Received: by mail-ua1-f47.google.com with SMTP id x23so3895864uav.3;
        Tue, 24 Aug 2021 06:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=syaKgflsTsKksibAkkBHSqJs9/gSQgOP1HHJcM5Pues=;
        b=sftNUAwYeZVlq6gMQkh3rjin3+is8/RIzJDRJy45uZqMlXPi4FIZ0zCJZFrtSl9GXD
         4wx45BkvzWt9ZdcTlZJvWWGLMd9wMYyqQksT+hiQfPcmDcqov3B/aI++5zo6QfBH7jDy
         NjhTMQXXUfD79ZXeSHEu3Mrv2xjrpt62VK8fs0FeIYpglVEuTzaLBsq6kKYWcdRvHEV8
         ZL7Ft/oT74qTeM1YZ50BRBUg49GQ+Plh7ERg55wBQPdOvOMX7tZcQauas0QL9oxxnTzj
         GF6Cc5SRZCC7VzkM7SUHNeKBm9OTgL3kCkbErUIhXpVol2go77a6/5LGOoDAo3kXJl+f
         jU5A==
X-Gm-Message-State: AOAM531K5W5fVEfWrThLWYEgAeFnEArue9a4tzRXl70cJjS12JbvAMNr
        XIOi9yYbUZIhnMI36bgTzWcPE39/YcNpQQjEJUk=
X-Google-Smtp-Source: ABdhPJxREVGG1KSJjSDtkir6RHgR3j1Fua2WWCBDp0vkLxgAKtEdCnz3EEW+Wiu0VV+kqymGJpveE5LwOep3+HjphiA=
X-Received: by 2002:a67:6e86:: with SMTP id j128mr27277219vsc.26.1629811550108;
 Tue, 24 Aug 2021 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628682048.git.robin.murphy@arm.com> <155b5c621cd8936472e273a8b07a182f62c6c20d.1628682049.git.robin.murphy@arm.com>
In-Reply-To: <155b5c621cd8936472e273a8b07a182f62c6c20d.1628682049.git.robin.murphy@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 15:25:38 +0200
Message-ID: <CAMuHMdX+VSr0TJabMBNqob0MkD2o0RBNp8E5QYNx0jFucW1Aew@mail.gmail.com>
Subject: Re: [PATCH v4 15/24] iommu/io-pgtable: Remove non-strict quirk
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        suravee.suthikulpanit@amd.com, baolu.lu@linux.intel.com,
        John Garry <john.garry@huawei.com>,
        Doug Anderson <dianders@chromium.org>, rajatja@google.com,
        chenxiang <chenxiang66@hisilicon.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Robin,

On Wed, Aug 11, 2021 at 2:24 PM Robin Murphy <robin.murphy@arm.com> wrote:
> IO_PGTABLE_QUIRK_NON_STRICT was never a very comfortable fit, since it's
> not a quirk of the pagetable format itself. Now that we have a more
> appropriate way to convey non-strict unmaps, though, this last of the
> non-quirk quirks can also go, and with the flush queue code also now
> enforcing its own ordering we can have a lovely cleanup all round.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks for your patch, which is now commit a8e5f04458c4e496
("iommu/io-pgtable: Remove non-strict quirk") in iommu/next.

> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -700,14 +700,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>                                                 ARM_V7S_BLOCK_SIZE(lvl + 1));
>                                 ptep = iopte_deref(pte[i], lvl, data);
>                                 __arm_v7s_free_table(ptep, lvl + 1, data);
> -                       } else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
> -                               /*
> -                                * Order the PTE update against queueing the IOVA, to
> -                                * guarantee that a flush callback from a different CPU
> -                                * has observed it before the TLBIALL can be issued.
> -                                */
> -                               smp_wmb();
> -                       } else {
> +                       } else if (!gather->queued) {

If CONFIG_IOMMU_API=n:

error: ‘struct iommu_iotlb_gather’ has no member named ‘queued’

This can be reproduced using e.g. shmobile_defconfig with
    CONFIG_IOMMU_SUPPORT=y
    CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y


>                                 io_pgtable_tlb_add_page(iop, gather, iova, blk_size);
>                         }
>                         iova += blk_size;

> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -638,14 +638,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>                                 io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>                                                           ARM_LPAE_GRANULE(data));
>                                 __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
> -                       } else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
> -                               /*
> -                                * Order the PTE update against queueing the IOVA, to
> -                                * guarantee that a flush callback from a different CPU
> -                                * has observed it before the TLBIALL can be issued.
> -                                */
> -                               smp_wmb();
> -                       } else {
> +                       } else if (!gather->queued) {

If CONFIG_IOMMU_API=n:

error: ‘struct iommu_iotlb_gather’ has no member named ‘queued’

This can be reproduced using e.g. shmobile_defconfig with
    CONFIG_IOMMU_SUPPORT=y
    CONFIG_IOMMU_IO_PGTABLE_LPAE=y

>                                 io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
>                         }
>

Perhaps "select IOMMU_API" should be added (moved from individual
drivers) to both IOMMU_IO_PGTABLE_ARMV7S and IOMMU_IO_PGTABLE_LPAE?
Or iommu_iotlb_gather.queued should not be accessed here, or the
access wrapped into a static inline helper function with a dummy for
the CONFIG_IOMMU_API=n case?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
