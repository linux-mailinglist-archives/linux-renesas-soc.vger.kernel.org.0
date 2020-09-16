Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85F726CCC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 22:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgIPUt2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 16:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgIPRAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:00:20 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1007AC0A8893;
        Wed, 16 Sep 2020 05:54:06 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id h206so5291522ybc.11;
        Wed, 16 Sep 2020 05:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WO3syF/M9e56VH+E25OjUqz06UwD3a6Jzn9YO6t60/E=;
        b=f86F656I5co/9TxN+CnGlwTyXzh4qBVFqSju9TCMr9oTlR39YuzwfFDnGBVDTxzBer
         JaGX6mOx+fIVB/SLo9iSIxIoEcTyi90p+vwLb/UlRHnhokLje0gvUNmi3kEJZJPinS0w
         Fuya4BKzceXMzbG93901ng7zssyDw/n10bR1Y8h/sb7cYP2Iewq5kFLJREAttN3sejQ2
         ljAgobjDX/q8t5b1EMCNIv4RYBpsSV+5fl+0YFP1yJjYqH4/wwbAUoRYrUSJvFrVzkdc
         aqg2r7niXNzjbR6Y5aphZSo5NE8yNudVcfOndIv9O2SR7ecZCEkCgEafIj3YVVouWM2q
         lHgg==
X-Gm-Message-State: AOAM532l0tcbK8I3mA8qdvm8GYi4yIvB8p1qQobIysoHCzYEhNQsPj/5
        pXRnouJVLzoWPseNXKTr/xEeQV18A5XbbgGT5b2W+JITWfE=
X-Google-Smtp-Source: ABdhPJw9JhOUVVk0nXDZMrInOMNSfBdmFCRb/dxUUtOOA6AAPN+olQ2XjC6/zVyeqD8ZeryslTEl6ull+9Nvbu2x7Ew=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr14999633otp.107.1600256862276;
 Wed, 16 Sep 2020 04:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Sep 2020 13:47:30 +0200
Message-ID: <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com>
Subject: Re: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 16, 2020 at 1:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> When we wrote data to an SATA HDD, the following timeout issue
> happened after the commit 429120f3df2d ("block: fix splitting
> segments on boundary masks") was applied:
>
>     # dd if=/dev/urandom of=/mnt/de1/file1-1024M bs=1M count=1024
>     ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
>     ata1.00: failed command: WRITE DMA EXT
>     ata1.00: cmd 35/00:00:00:e6:0c/00:0a:00:00:00/e0 tag 0 dma 1310720 out
>     res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
>     ata1.00: status: { DRDY }
>
> Since the commit changed get_max_segment_size()'s behavior,
> unexpected behavior happens if .dma_boundary of this sata-rcar driver
> is 0x1ffffffe in somewhere (my guess).
>
> By the way, the commit 8bfbeed58665 ("sata_rcar: correct
> 'sata_rcar_sht'") changed the .dma_boundary as 0x1ffffffe, but this
> number is related to ATAPI_DMA_TRANS_CNT register. So, we should set
> the .dma_boundary as ATA_DMA_BOUNDARY (0xffff), and set
> .max_segment_size to min(0x1ffffffe, dma_max_mapping_size()).
>
> After applied this, the timeout issue disappeared.
>
> Fixes: 8bfbeed58665 ("sata_rcar: correct 'sata_rcar_sht'")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  As I wrote the commit description, I couldn't find why the issue
> was related to the .dma_boundary. So, I marked RFC on this patch.
> I would appreciate it if you would give me some advice.

There's also "[PATCH v2] ata: sata_rcar: Fix DMA boundary mask"
(https://lore.kernel.org/linux-ide/20200811081712.4981-1-geert+renesas@glider.be/)

Is this related?
Does my patch fix your issue, too?

> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -120,7 +120,7 @@
>  /* Descriptor table word 0 bit (when DTA32M = 1) */
>  #define SATA_RCAR_DTEND                        BIT(0)
>
> -#define SATA_RCAR_DMA_BOUNDARY         0x1FFFFFFEUL
> +#define SATA_RCAR_DMA_TRANS_CNT                0x1FFFFFFEUL
>
>  /* Gen2 Physical Layer Control Registers */
>  #define RCAR_GEN2_PHY_CTL1_REG         0x1704
> @@ -636,14 +636,7 @@ static u8 sata_rcar_bmdma_status(struct ata_port *ap)
>  }
>
>  static struct scsi_host_template sata_rcar_sht = {
> -       ATA_BASE_SHT(DRV_NAME),
> -       /*
> -        * This controller allows transfer chunks up to 512MB which cross 64KB
> -        * boundaries, therefore the DMA limits are more relaxed than standard
> -        * ATA SFF.
> -        */
> -       .sg_tablesize           = ATA_MAX_PRD,
> -       .dma_boundary           = SATA_RCAR_DMA_BOUNDARY,
> +       ATA_BMDMA_SHT(DRV_NAME),
>  };
>
>  static struct ata_port_operations sata_rcar_port_ops = {
> @@ -930,6 +923,14 @@ static int sata_rcar_probe(struct platform_device *pdev)
>         /* initialize host controller */
>         sata_rcar_init_controller(host);
>
> +       /*
> +        * This controller allows transfer chunks up to 512MB which cross 64KB
> +        * boundaries, therefore the DMA limits are more relaxed than standard
> +        * ATA SFF.
> +        */
> +       sata_rcar_sht.max_segment_size = min_t(unsigned int,
> +                                              SATA_RCAR_DMA_TRANS_CNT,
> +                                              dma_max_mapping_size(dev));
>         ret = ata_host_activate(host, irq, sata_rcar_interrupt, 0,
>                                 &sata_rcar_sht);
>         if (!ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
