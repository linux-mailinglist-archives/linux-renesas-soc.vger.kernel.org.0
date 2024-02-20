Return-Path: <linux-renesas-soc+bounces-3019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C585CA6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 23:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD251F23B44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 22:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B458152DF8;
	Tue, 20 Feb 2024 22:08:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170A41AAC;
	Tue, 20 Feb 2024 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708466903; cv=none; b=ufanRwAVoxL7CcQOA1HXmvQ4A7H1Id6Bh8dXvOI1gh9S21b0bkH0Gs2MKswQV9xZaefhj36jfqkwcJChCePMVUcAAYh/CMBevk6w8O6/QsTXYIJ3/MuNo9xMvFaeWyiKv86CT5uPSuekOhA/iQJR87IDH7Q4iBNhJ7trUKyNKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708466903; c=relaxed/simple;
	bh=oQJyPdQRIpbKnoX7lt1tZ7qqC0a2B3Z5MOhIU1rSg2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/Ivqw7lxcXAOjc2RLGaHfLEqBF0nGqkc1eZeDb+U8bKMMDlEttvGdSMflmAcIubFOTKURSa4aGGb6JUxhjItjNw3ybMsb5bAoHZbhv+JimnuQuRfv+UfvxgzXhePAYEXRJZfsCwy8IvjIXhre0OJ3qcTqXSmTP3ZiTNo2mZDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c745af8f1cso124180639f.1;
        Tue, 20 Feb 2024 14:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708466900; x=1709071700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7n1GqinQntZXgeHCD08v9Jnvi0xyQ8A5V17lOCMlhI=;
        b=i+o3mDlqYT0Lv45lttsJXLKz9jLMvgyv9jvzrWvSYWWC5bncuxkGsFhEHbNRS2sbgo
         OanGbxO+q/uS7LwLD7b0DdInatLy6Lf5Yww7VAslcG/ptNBLBsABTQtxoxqMN5c4Qeco
         jP0fKqjQ2DfOOKtYsr5cJ3Z3SJa1SJ+IYM9aqi59Db7zOU4QayLXRdKiUJZ/s9L2YL7u
         q9IjLTtEpz9PjUYk6i6oj5Q/sYQ2izNKB86ZZo3nih/lwBrTTFHLoMGefg6V/ros0mu0
         EBe87NlpDosznevHU+sfZzJUsRUJwWWpS4DHOBDG8xOwCz1i1pYFtqk1rNUc7Sc41aEs
         13yA==
X-Forwarded-Encrypted: i=1; AJvYcCWKi9a/ehwHAf2eeoN53tiAbDwbdws0QRMps0mUwMhyfJxhLbwttTdxxWdfcLxeqn9TQKzzfEv61HTzioBc8TzOKXzQOK2irVOqBjcuDRUa88GXDwojS09dRakloMp1TeGPuiPWwQTzy2KBUrFrJMvwEbNQfOOYOEwZKQxfTqmYygDGcR1PP2xRFTQIZaqeNvcXKaHBAR1yGcoV2lPypewK9WvLZqFK9nY0KiFTDoXVAPwyASQ5ilyRhNJB9D3IxAdg
X-Gm-Message-State: AOJu0Yz7oeKS9cCJq0V613rWlafVw29XjWv1G3egOZFHHZpV1xQA25U9
	Oh+a38pPoAaQs3xVxlxOU8z2fqw5elrr4Lba9MlYPj5pCpOENooAWN0c2kiMTL4=
X-Google-Smtp-Source: AGHT+IFL4TYkCMWOzqCf3QOekwbt7F8W4EwMoUE2EUw0vRtz3yjBDkKIJhH2EpeCIi6c9LetatxXIw==
X-Received: by 2002:a6b:c853:0:b0:7be:f7e5:44fc with SMTP id y80-20020a6bc853000000b007bef7e544fcmr17547644iof.21.1708466899873;
        Tue, 20 Feb 2024 14:08:19 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id l15-20020a02cd8f000000b00473e844f978sm2338828jap.32.2024.02.20.14.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 14:08:19 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3654aa79d6eso3602375ab.2;
        Tue, 20 Feb 2024 14:08:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVC5k+Fzay88ZMAg9nYab5lsxX+onbW2hxMSWJ/Sn5YA0TIunbaISg3iJd2A1zV3jetBfzDzWkolnhebIQI3e3m5gXa3ZEKU/JlHc69cxoR7o8tlUlPDr7dDlpxyfgA6h8tpRBIcyy7HXYRevCGuF9m10iNWoQAE154nIXvoHTPnDKZ+xzyToKJLqPlm+VDL02lVmDaIrRfj1RKap4/FnhL2CPXhCvtALCfjXeMB6suxB39fySObF2YMJEoi48JdwaK
X-Received: by 2002:a81:a102:0:b0:608:218b:549e with SMTP id
 y2-20020a81a102000000b00608218b549emr9679398ywg.11.1708466477756; Tue, 20 Feb
 2024 14:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
In-Reply-To: <20240215070300.2200308-18-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:01:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
Message-ID: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> Pass the queue limit set at initialization time directly to
> blk_mq_alloc_disk instead of updating it right after the allocation.
>
> This requires refactoring the code a bit so that what was mmc_setup_queue
> before also allocates the gendisk now and actually sets all limits.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
queue_limits to blk_mq_alloc_disk") in block/for-next.

I have bisected the following failure on White-Hawk (also seen on
other R-Car Gen3/4 systems) to this commit:

    renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
0x00000000ee140000, max clock rate 200 MHz
    mmc0: new HS400 MMC card at address 0001
    ------------[ cut here ]------------
    WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
blk_validate_limits+0x12c/0x1e0
    Modules linked in:
    CPU: 1 PID: 20 Comm: kworker/1:0 Not tainted
6.8.0-rc3-white-hawk-00084-g616f87661792 #223
    Hardware name: Renesas White Hawk CPU and Breakout boards based on
r8a779g0 (DT)
    Workqueue: events_freezable mmc_rescan
    pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
    pc : blk_validate_limits+0x12c/0x1e0
    lr : blk_set_default_limits+0x14/0x1c
    sp : ffffffc0829336f0
    x29: ffffffc0829336f0 x28: 0000000000000000 x27: 0000000000000000
    Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached
PHY driver (mii_bus:phy_addr=3De6800000.ethernet-ffffffff:00, irq=3D30)
    x26: ffffff8443afd808 x25: ffffffc0825bd000 x24: ffffffc082933878
    x23: 00000000ffffffff x22: ffffffc08147b258 x21: ffffff8443ab0c10
    x20: 000000000000001a x19: ffffff8443b00000 x18: 0000000043789380
    x17: ffffffc0806b2ea8 x16: ffffffc0803ab8b4 x15: ffffffc0803ab444
    x14: ffffffc08039c26c x13: ffffffc080506854 x12: ffffffc080506700
    x11: ffffffc08050669c x10: ffffffc080506478 x9 : ffffffc0803ad1a0
    x8 : ffffff8443019120 x7 : ffffffc0803ad1a0 x6 : 0000000000000000
    x5 : 0000000000000000 x4 : 0000000000000a00 x3 : 0000000000000fff
    x2 : 0000000000000200 x1 : 0000000000010000 x0 : ffffffc082933878
    Call trace:
     blk_validate_limits+0x12c/0x1e0
     blk_alloc_queue+0x7c/0x244
     blk_mq_alloc_queue+0x4c/0xac
     __blk_mq_alloc_disk+0x1c/0xc0
     mmc_alloc_disk+0x134/0x2b4
     mmc_init_queue+0x114/0x12c
     mmc_blk_alloc_req+0xf0/0x34c
     mmc_blk_probe+0x230/0x5b8
     mmc_bus_probe+0x18/0x20
     really_probe+0x138/0x270
     __driver_probe_device+0xec/0x104
     driver_probe_device+0x4c/0xf8
     __device_attach_driver+0xa8/0xc8
     bus_for_each_drv+0xa4/0xc8
     __device_attach+0xe4/0x144
     device_initial_probe+0x10/0x18
     bus_probe_device+0x38/0xa0
     device_add+0x520/0x654
     mmc_add_card+0x12c/0x28c
     mmc_attach_mmc+0xb8/0x154
     mmc_rescan+0x208/0x250
     process_scheduled_works+0x2b8/0x41c
     worker_thread+0x1cc/0x24c
     kthread+0xd8/0xe8
     ret_from_fork+0x10/0x20
    irq event stamp: 434
    hardirqs last  enabled at (433): [<ffffffc0808e0ac0>]
_raw_spin_unlock_irq+0x2c/0x40
    hardirqs last disabled at (434): [<ffffffc0808dae28>] __schedule+0x1cc/=
0x84c
    softirqs last  enabled at (192): [<ffffffc080010300>]
__do_softirq+0x1ac/0x360
    softirqs last disabled at (185): [<ffffffc08001550c>]
____do_softirq+0xc/0x14
    ---[ end trace 0000000000000000 ]---
    mmcblk: probe of mmc0:0001 failed with error -22

Reverting this commit fixes the issue.

> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned shor=
t sg_len, gfp_t gfp)
>         return sg;
>  }
>
> -static void mmc_queue_setup_discard(struct request_queue *q,
> -                                   struct mmc_card *card)
> +static void mmc_queue_setup_discard(struct mmc_card *card,
> +               struct queue_limits *lim)
>  {
>         unsigned max_discard;
>
> @@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_=
queue *q,
>         if (!max_discard)
>                 return;
>
> -       blk_queue_max_discard_sectors(q, max_discard);
> -       q->limits.discard_granularity =3D card->pref_erase << 9;
> -       /* granularity must not be greater than max. discard */
> -       if (card->pref_erase > max_discard)
> -               q->limits.discard_granularity =3D SECTOR_SIZE;
> +       lim->max_hw_discard_sectors =3D max_discard;
>         if (mmc_can_secure_erase_trim(card))
> -               blk_queue_max_secure_erase_sectors(q, max_discard);
> +               lim->max_secure_erase_sectors =3D max_discard;
>         if (mmc_can_trim(card) && card->erased_byte =3D=3D 0)
> -               blk_queue_max_write_zeroes_sectors(q, max_discard);
> +               lim->max_write_zeroes_sectors =3D max_discard;
> +
> +       /* granularity must not be greater than max. discard */
> +       if (card->pref_erase > max_discard)
> +               lim->discard_granularity =3D SECTOR_SIZE;
> +       else
> +               lim->discard_granularity =3D card->pref_erase << 9;
>  }
>
>  static unsigned short mmc_get_max_segments(struct mmc_host *host)
> @@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops =3D {
>         .timeout        =3D mmc_mq_timed_out,
>  };
>
> -static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
> +static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
> +               struct mmc_card *card)
>  {
>         struct mmc_host *host =3D card->host;
> -       unsigned block_size =3D 512;
> +       struct queue_limits lim =3D { };
> +       struct gendisk *disk;
>
> -       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> -       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>         if (mmc_can_erase(card))
> -               mmc_queue_setup_discard(mq->queue, card);
> +               mmc_queue_setup_discard(card, &lim);
>
>         if (!mmc_dev(host)->dma_mask || !*mmc_dev(host)->dma_mask)
> -               blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
> -       blk_queue_max_hw_sectors(mq->queue,
> -               min(host->max_blk_count, host->max_req_size / 512));
> -       if (host->can_dma_map_merge)
> -               WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
> -                                                       mmc_dev(host)),
> -                    "merging was advertised but not possible");
> -       blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
> -
> -       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size) {
> -               block_size =3D card->ext_csd.data_sector_size;
> -               WARN_ON(block_size !=3D 512 && block_size !=3D 4096);
> -       }
> +               lim.bounce =3D BLK_BOUNCE_HIGH;
> +
> +       lim.max_hw_sectors =3D min(host->max_blk_count, host->max_req_siz=
e / 512);
> +
> +       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
> +               lim.logical_block_size =3D card->ext_csd.data_sector_size=
;
> +       else
> +               lim.logical_block_size =3D 512;
> +
> +       WARN_ON_ONCE(lim.logical_block_size !=3D 512 &&
> +                    lim.logical_block_size !=3D 4096);
>
> -       blk_queue_logical_block_size(mq->queue, block_size);
>         /*
> -        * After blk_queue_can_use_dma_map_merging() was called with succ=
eed,
> -        * since it calls blk_queue_virt_boundary(), the mmc should not c=
all
> -        * both blk_queue_max_segment_size().
> +        * Setting a virt_boundary implicity sets a max_segment_size, so =
try
> +        * to set the hardware one here.
>          */
> -       if (!host->can_dma_map_merge)
> -               blk_queue_max_segment_size(mq->queue,
> -                       round_down(host->max_seg_size, block_size));
> +       if (host->can_dma_map_merge) {
> +               lim.virt_boundary_mask =3D dma_get_merge_boundary(mmc_dev=
(host));
> +               lim.max_segments =3D MMC_DMA_MAP_MERGE_SEGMENTS;
> +       } else {
> +               lim.max_segment_size =3D
> +                       round_down(host->max_seg_size, lim.logical_block_=
size);
> +               lim.max_segments =3D host->max_segs;
> +       }
> +
> +       disk =3D blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
> +       if (IS_ERR(disk))
> +               return disk;
> +       mq->queue =3D disk->queue;
> +
> +       if (mmc_host_is_spi(host) && host->use_spi_crc)
> +               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> +       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> +
> +       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> +       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>
>         dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->qu=
eue));
>
> @@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, str=
uct mmc_card *card)
>         init_waitqueue_head(&mq->wait);
>
>         mmc_crypto_setup_queue(mq->queue, host);
> +       return disk;
>  }
>
>  static inline bool mmc_merge_capable(struct mmc_host *host)
> @@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq,=
 struct mmc_card *card)
>                 return ERR_PTR(ret);
>
>
> -       disk =3D blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
> -       if (IS_ERR(disk)) {
> +       disk =3D mmc_alloc_disk(mq, card);
> +       if (IS_ERR(disk))
>                 blk_mq_free_tag_set(&mq->tag_set);
> -               return disk;
> -       }
> -       mq->queue =3D disk->queue;
> -
> -       if (mmc_host_is_spi(host) && host->use_spi_crc)
> -               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> -       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> -
> -       mmc_setup_queue(mq, card);
>         return disk;
>  }
>
> --
> 2.39.2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

