Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E4E41911F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 10:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbhI0Ixx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 04:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbhI0Ixw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 04:53:52 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FECC061575;
        Mon, 27 Sep 2021 01:52:14 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id z5so22239627ybj.2;
        Mon, 27 Sep 2021 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fJRxlUu3kig2L2Zdnh4zUfvV/PvEAE5o5OOwUoKgWz8=;
        b=Kyhe++muvxTS5VMkMhKCpzqdFOHer2S0HIoPZfogpBKvPZELjgmF8yBtPEK9Zcb9hu
         sjY0cUTiBFJx32AoBF1tUR94m1woxo0EgBKCjR3db2Orr17qtDvGksGYenjgVd4cIjL7
         bh5E+zYOMjvXZ1Dcs/t8mhLS2xPCZxIyQk/4tuNqwW5WWYLVA3pyFj9t9HCMNyjp208R
         6tjv1LZG9IW0oQGCE9MvbNWoGJmr+ufqmGS1bsiKEeSRkRtW8FOyKEBJr4/yidPlhzXa
         EmMXdsr3SamuN5OPbRvv/6bL/s9PxxvA63BCXjJLlqEfqRSwvYEDrr92Es6iuoqzHW53
         HW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fJRxlUu3kig2L2Zdnh4zUfvV/PvEAE5o5OOwUoKgWz8=;
        b=fu96CJeCg6DFh5iLCXoD3mrmalxn4O5T/FZEJ2jNaC/jM4xYWFUpkT2lmJ5hj6t61t
         TJhniNlFigNZRmSh5SgdG02dnqWD/TPQxAM/1u3ffgYOdPQB0StJFGsDdMcVawB6HT3l
         j0+ccIZ6yyIfpT8DkxaZRPCsgNpgrNjqqiczejLC1k0as5HHUz0+ZL52oFQxP11IUJ78
         Clhcu7pzwUyt45IZmB8TKoQPyfnZ5DcbsGPqQHvyg7KOqkT3TsbqSdrWWvK1+AkKVEqq
         cV2lJJx0z6LjMKGjqnBybgo6uu16H+7PKz8ODrwFcWmxixjnQM+QcqG3TFOel3GQum6C
         QmkA==
X-Gm-Message-State: AOAM533E93E+K10sA9ETURXiKgC5Qa8ljD1A6ikyTVm7Jm8MgLyP0OnA
        WkL1uSHzfCk+gykOOh/RPwuwSH2/wQJeYfli0RUBaG5kWECxpg==
X-Google-Smtp-Source: ABdhPJymb8VuQignSLs+kyQsNG7Sk7KtuSalCNlpyM1cDyyPGWHP11bv+XK/lTYOUYVFFccP/L/VSK+OE3s1+sCiQXU=
X-Received: by 2002:a25:59c6:: with SMTP id n189mr26579843ybb.131.1632732733966;
 Mon, 27 Sep 2021 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 27 Sep 2021 09:51:47 +0100
Message-ID: <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in
 Manual mode
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Wed, Sep 22, 2021 at 10:10 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This patch fixes 2 problems:
> [1] The output warning logs and data loss when performing
> mount/umount then remount the device with jffs2 format.
> [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
>
> This is the sample warning logs when performing mount/umount then
> remount the device with jffs2 format:
> jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
> Read 0x00034e00, calculated 0xadb272a7
>
> The reason for issue [1] is that the writing data seems to
> get messed up.
> Data is only completed when the number of bytes is divisible by 4.
> If you only have 3 bytes of data left to write, 1 garbage byte
> is inserted after the end of the write stream.
> If you only have 2 bytes of data left to write, 2 bytes of '00'
> are added into the write stream.
> If you only have 1 byte of data left to write, 2 bytes of '00'
> are added into the write stream. 1 garbage byte is inserted after
> the end of the write stream.
>
> To solve problem [1], data must be written continuously in serial
> and the write stream ends when data is out.
>
> Following HW manual 62.2.15, access to SMWDR0 register should be
> in the same size as the transfer size specified in the SPIDE[3:0]
> bits in the manual mode enable setting register (SMENR).
> Be sure to access from address 0.
>
> So, in 16-bit transfer (SPIDE[3:0]=b'1100), SMWDR0 should be
> accessed by 16-bit width.
> Similar to SMWDR1, SMDDR0/1 registers.
> In current code, SMWDR0 register is accessed by regmap_write()
> that only set up to do 32-bit width.
>
> To solve problem [2], data must be written 16-bit or 8-bit when
> transferring 1-byte or 2-byte.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> [wsa: refactored to use regmap only via reg_read/reg_write]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Hi,
>
> I could reproduce the issue by a simple:
>
>   $ echo "Hello" > /dev/mtd10
>
> The original BSP patch fixed the issue but mixed regmap-acces with
> ioread/iowrite accesses. So, I refactored it to use custom regmap
> accessors. This keeps the code more readable IMO. With this patch, my
> custom test cases work as well as the JFFS2 remount mentioned in the
> commit message. Tested on a Renesas Condor board (R-Car V3M) and a
> Falcon board (R-Car V3U). I send this as RFC because this is my first
> patch for the RPC code and hope for feedback. The BSP team has been
> contacted as well for comments and testing. Nonetheless, this addresses
> a serious issue which has caused broken boards because of writing to
> unintended locations. So, I'd like to see this discussed and applied
> soon if possible.
>
I hit the exact same issue on RZ/G2L where erase/write operation
screwed some random sectors and made the board un-bootable. With the
patch applied, read/write/erase worked as expected. Below are the logs
on RZ/G2L SMARC EVK.

root@smarc-rzg2l:~# sh -x ./flash.sh
+ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00001000 "boot"
mtd1: 02000000 00001000 "user"
+ flashcp -v sample.bin /dev/mtd1
Erasing blocks: 1024/1024 (100%)
Writing data: 4096k/4096k (100%)
Verifying data: 4096k/4096k (100%)
+ dd if=/dev/urandom of=/tmp/sample.bin bs=1024 count=4096
4096+0 records in
4096+0 records out
4194304 bytes (4.2 MB) copied, 0.0786743 s, 53.3 MB/s
+ flash_erase -j -q /dev/mtd1 0 0
+ mount -t jffs2 /dev/mtdblock1 /mnt
+ cp /tmp/sample.bin /mnt
+ ls -ltr /mnt
total 4096
-rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
+ echo 'test write'
+ umount /mnt
+ mount -t jffs2 /dev/mtdblock1 /mnt
+ ls -ltr /mnt
total 4097
-rw-r--r-- 1 root root      11 Sep 20 10:54 write.txt
-rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
+ cat /mnt/write.txt
test write
+ umount /mnt

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> Thanks everyone,
>
>    Wolfram
>
>
>  drivers/memory/renesas-rpc-if.c | 113 ++++++++++++++++++++++----------
>  include/memory/renesas-rpc-if.h |   1 +
>  2 files changed, 79 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
> index 45eed659b0c6..77a011d5ff8c 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -160,10 +160,62 @@ static const struct regmap_access_table rpcif_volatile_table = {
>         .n_yes_ranges   = ARRAY_SIZE(rpcif_volatile_ranges),
>  };
>
> +
> +/*
> + * Custom accessor functions to ensure SMRDR0 and SMWDR0 are always accessed
> + * with proper width. Requires SMENR_SPIDE to be correctly set before!
> + */
> +static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +       struct rpcif *rpc = context;
> +
> +       if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
> +               u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
> +
> +               if (spide == 0x8) {
> +                       *val = readb(rpc->base + reg);
> +                       return 0;
> +               } else if (spide == 0xC) {
> +                       *val = readw(rpc->base + reg);
> +                       return 0;
> +               } else if (spide != 0xF) {
> +                       return -EILSEQ;
> +               }
> +       }
> +
> +       *val = readl(rpc->base + reg);
> +       return 0;
> +
> +}
> +
> +static int rpcif_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +       struct rpcif *rpc = context;
> +
> +       if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
> +               u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
> +
> +               if (spide == 0x8) {
> +                       writeb(val, rpc->base + reg);
> +                       return 0;
> +               } else if (spide == 0xC) {
> +                       writew(val, rpc->base + reg);
> +                       return 0;
> +               } else if (spide != 0xF) {
> +                       return -EILSEQ;
> +               }
> +       }
> +
> +       writel(val, rpc->base + reg);
> +       return 0;
> +}
> +
>  static const struct regmap_config rpcif_regmap_config = {
>         .reg_bits       = 32,
>         .val_bits       = 32,
>         .reg_stride     = 4,
> +       .reg_read       = rpcif_reg_read,
> +       .reg_write      = rpcif_reg_write,
>         .fast_io        = true,
>         .max_register   = RPCIF_PHYINT,
>         .volatile_table = &rpcif_volatile_table,
> @@ -173,17 +225,15 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct resource *res;
> -       void __iomem *base;
>
>         rpc->dev = dev;
>
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> -       base = devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> +       rpc->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(rpc->base))
> +               return PTR_ERR(rpc->base);
>
> -       rpc->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> -                                           &rpcif_regmap_config);
> +       rpc->regmap = devm_regmap_init(&pdev->dev, NULL, rpc, &rpcif_regmap_config);
>         if (IS_ERR(rpc->regmap)) {
>                 dev_err(&pdev->dev,
>                         "failed to init regmap for rpcif, error %ld\n",
> @@ -354,20 +404,16 @@ void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
>                         nbytes = op->data.nbytes;
>                 rpc->xferlen = nbytes;
>
> -               rpc->enable |= RPCIF_SMENR_SPIDE(rpcif_bits_set(rpc, nbytes)) |
> -                       RPCIF_SMENR_SPIDB(rpcif_bit_size(op->data.buswidth));
> +               rpc->enable |= RPCIF_SMENR_SPIDB(rpcif_bit_size(op->data.buswidth));
>         }
>  }
>  EXPORT_SYMBOL(rpcif_prepare);
>
>  int rpcif_manual_xfer(struct rpcif *rpc)
>  {
> -       u32 smenr, smcr, pos = 0, max = 4;
> +       u32 smenr, smcr, pos = 0, max = rpc->bus_size == 2 ? 8 : 4;
>         int ret = 0;
>
> -       if (rpc->bus_size == 2)
> -               max = 8;
> -
>         pm_runtime_get_sync(rpc->dev);
>
>         regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
> @@ -378,37 +424,36 @@ int rpcif_manual_xfer(struct rpcif *rpc)
>         regmap_write(rpc->regmap, RPCIF_SMOPR, rpc->option);
>         regmap_write(rpc->regmap, RPCIF_SMDMCR, rpc->dummy);
>         regmap_write(rpc->regmap, RPCIF_SMDRENR, rpc->ddr);
> +       regmap_write(rpc->regmap, RPCIF_SMADR, rpc->smadr);
>         smenr = rpc->enable;
>
>         switch (rpc->dir) {
>         case RPCIF_DATA_OUT:
>                 while (pos < rpc->xferlen) {
> -                       u32 nbytes = rpc->xferlen - pos;
> -                       u32 data[2];
> +                       u32 bytes_left = rpc->xferlen - pos;
> +                       u32 nbytes, data[2];
>
>                         smcr = rpc->smcr | RPCIF_SMCR_SPIE;
> -                       if (nbytes > max) {
> -                               nbytes = max;
> +
> +                       /* nbytes may only be 1, 2, 4, or 8 */
> +                       nbytes = bytes_left >= max ? max : (1 << ilog2(bytes_left));
> +                       if (bytes_left > nbytes)
>                                 smcr |= RPCIF_SMCR_SSLKP;
> -                       }
> +
> +                       smenr |= RPCIF_SMENR_SPIDE(rpcif_bits_set(rpc, nbytes));
> +                       regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
>
>                         memcpy(data, rpc->buffer + pos, nbytes);
> -                       if (nbytes > 4) {
> +                       if (nbytes == 8) {
>                                 regmap_write(rpc->regmap, RPCIF_SMWDR1,
>                                              data[0]);
>                                 regmap_write(rpc->regmap, RPCIF_SMWDR0,
>                                              data[1]);
> -                       } else if (nbytes > 2) {
> +                       } else {
>                                 regmap_write(rpc->regmap, RPCIF_SMWDR0,
>                                              data[0]);
> -                       } else  {
> -                               regmap_write(rpc->regmap, RPCIF_SMWDR0,
> -                                            data[0] << 16);
>                         }
>
> -                       regmap_write(rpc->regmap, RPCIF_SMADR,
> -                                    rpc->smadr + pos);
> -                       regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
>                         regmap_write(rpc->regmap, RPCIF_SMCR, smcr);
>                         ret = wait_msg_xfer_end(rpc);
>                         if (ret)
> @@ -448,14 +493,16 @@ int rpcif_manual_xfer(struct rpcif *rpc)
>                         break;
>                 }
>                 while (pos < rpc->xferlen) {
> -                       u32 nbytes = rpc->xferlen - pos;
> -                       u32 data[2];
> +                       u32 bytes_left = rpc->xferlen - pos;
> +                       u32 nbytes, data[2];
>
> -                       if (nbytes > max)
> -                               nbytes = max;
> +                       /* nbytes may only be 1, 2, 4, or 8 */
> +                       nbytes = bytes_left >= max ? max : (1 << ilog2(bytes_left));
>
>                         regmap_write(rpc->regmap, RPCIF_SMADR,
>                                      rpc->smadr + pos);
> +                       smenr &= ~RPCIF_SMENR_SPIDE(0xF);
> +                       smenr |= RPCIF_SMENR_SPIDE(rpcif_bits_set(rpc, nbytes));
>                         regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
>                         regmap_write(rpc->regmap, RPCIF_SMCR,
>                                      rpc->smcr | RPCIF_SMCR_SPIE);
> @@ -463,18 +510,14 @@ int rpcif_manual_xfer(struct rpcif *rpc)
>                         if (ret)
>                                 goto err_out;
>
> -                       if (nbytes > 4) {
> +                       if (nbytes == 8) {
>                                 regmap_read(rpc->regmap, RPCIF_SMRDR1,
>                                             &data[0]);
>                                 regmap_read(rpc->regmap, RPCIF_SMRDR0,
>                                             &data[1]);
> -                       } else if (nbytes > 2) {
> -                               regmap_read(rpc->regmap, RPCIF_SMRDR0,
> -                                           &data[0]);
> -                       } else  {
> +                       } else {
>                                 regmap_read(rpc->regmap, RPCIF_SMRDR0,
>                                             &data[0]);
> -                               data[0] >>= 16;
>                         }
>                         memcpy(rpc->buffer + pos, data, nbytes);
>
> diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
> index e3e770f76f34..77c694a19149 100644
> --- a/include/memory/renesas-rpc-if.h
> +++ b/include/memory/renesas-rpc-if.h
> @@ -59,6 +59,7 @@ struct rpcif_op {
>
>  struct rpcif {
>         struct device *dev;
> +       void __iomem *base;
>         void __iomem *dirmap;
>         struct regmap *regmap;
>         struct reset_control *rstc;
> --
> 2.30.2
>
