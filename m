Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979DD5F06E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 10:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiI3IyK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Sep 2022 04:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiI3IyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 04:54:09 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD0816DDFB;
        Fri, 30 Sep 2022 01:54:08 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id d17so2392294qko.13;
        Fri, 30 Sep 2022 01:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=5cWmJV1OuYLbPenRlvL9ynrzndHQ4+lDPYThqkwgsWg=;
        b=r+OlT2lsgliLC/Gg96wWPo0U2+eJA2mGgQzvZ/F7UNdPKeTmmydzyyCLoZkXCFS9XY
         Trh8aNW3serq90IXL61DOv97FTv61THiWYZLTb3Ll4x4jtfaQNEVMhfIIkALfLp0goed
         qFZGMqloCkhq3BtZkoN/DOgNmI2X+/UVRCmqRPZ28syRdhsXfVE148dJXEAli+xbCgFX
         rsJdexEGOv4q0bj/KeEfVEYIyxtkagbxUkp1/OzURP/DRo72u3YjA+lbJTcLoXXR3/dO
         FV54Plj0EvUtYuOM1Rmt1mH8u7IRueSw/YKzAhe/hQT1sDh4O4KfL5LXsmEmyBwXg0aw
         VlSQ==
X-Gm-Message-State: ACrzQf1v7nqqJfBgS4IX9+UgTGo8WLk0nI9LsV67+47kl7KzKtp1lL5N
        r440qGY/gdAvs4OUtXHgJdcN7UhdT4/CNg==
X-Google-Smtp-Source: AMsMyM6B0y+PaC7fdjB+f3OTtyomVhlJhD//HYeW7XjEd0SoZW7EqmZdJryW5ANCKx2C5WzPOM95Aw==
X-Received: by 2002:a05:620a:2942:b0:6ce:6188:60d1 with SMTP id n2-20020a05620a294200b006ce618860d1mr4927631qkp.363.1664528047358;
        Fri, 30 Sep 2022 01:54:07 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id k26-20020a05620a139a00b006ce5fe31c2dsm1812884qki.65.2022.09.30.01.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:54:07 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-333a4a5d495so37879437b3.10;
        Fri, 30 Sep 2022 01:54:07 -0700 (PDT)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr7552360ywa.384.1664528046809;
 Fri, 30 Sep 2022 01:54:06 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Sep 2022 10:53:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_fQU5khvcOK-fuZoYArJpjT0057WGQ=t1=Ehf8+piqA@mail.gmail.com>
Message-ID: <CAMuHMdX_fQU5khvcOK-fuZoYArJpjT0057WGQ=t1=Ehf8+piqA@mail.gmail.com>
Subject: sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

When an SD-card is inserted on Koelsch (R-Car M2-W), I see:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)

Regardless, the card works afterwards:

    mmc0: new ultra high speed SDR104 SDHC card at address aaaa
    mmcblk0: mmc0:aaaa SM32G 29.7 GiB
     mmcblk0: p1 p2

Note that this only happens for the "fast" slot (SDHI0), not for the
(33%) slower slot.

On Salvator-XS (R-Car H3 ES2.0) I do not see that timeout message
(and reading is 4x faster than on Koelsch).

Sometimes, I also see:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 37 at kernel/dma/debug.c:568 add_dma_entry+0x1f8/0x248
    DMA-API: rcar-dmac e6700000.dma-controller: cacheline tracking
EEXIST, overlapping mappings aren't supported
    Modules linked in:
    CPU: 0 PID: 37 Comm: kworker/0:3 Tainted: G                 N
6.0.0-rc7-koelsch-00770-g14669bb22198 #1686
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    Workqueue: events_freezable mmc_rescan
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x68/0x90
     dump_stack_lvl from __warn+0xa8/0x1d8
     __warn from warn_slowpath_fmt+0x78/0xb0
     warn_slowpath_fmt from add_dma_entry+0x1f8/0x248
     add_dma_entry from debug_dma_map_sg+0x250/0x35c
     debug_dma_map_sg from __dma_map_sg_attrs+0x6c/0x11c
     __dma_map_sg_attrs from dma_map_sg_attrs+0x10/0x1c
     dma_map_sg_attrs from renesas_sdhi_sys_dmac_start_dma+0xf8/0x424
     renesas_sdhi_sys_dmac_start_dma from tmio_process_mrq+0x124/0x264
     tmio_process_mrq from mmc_start_request+0x90/0xa4
     mmc_start_request from mmc_wait_for_req+0x64/0xac
     mmc_wait_for_req from mmc_send_tuning+0xf4/0x16c
     mmc_send_tuning from renesas_sdhi_execute_tuning+0x2a0/0x41c
     renesas_sdhi_execute_tuning from mmc_execute_tuning+0x58/0xb8
     mmc_execute_tuning from mmc_sd_init_uhs_card.part.0+0x2f0/0x3d4
     mmc_sd_init_uhs_card.part.0 from mmc_sd_init_card+0x35c/0x7d4
     mmc_sd_init_card from mmc_attach_sd+0xe8/0x164
     mmc_attach_sd from mmc_rescan+0x1f0/0x25c
     mmc_rescan from process_one_work+0x2f0/0x4c4
     process_one_work from worker_thread+0x240/0x2d0
     worker_thread from kthread+0xd0/0xe0
     kthread from ret_from_fork+0x14/0x34
    Exception stack(0xf0925fb0 to 0xf0925ff8)
    5fa0:                                     00000000 00000000
00000000 00000000
    5fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
    irq event stamp: 3717
    hardirqs last  enabled at (3729): [<c027e610>] __up_console_sem+0x40/0x60
    hardirqs last disabled at (3742): [<c027e5f4>] __up_console_sem+0x24/0x60
    softirqs last  enabled at (3716): [<c0201330>] __do_softirq+0x168/0x400
    softirqs last disabled at (3637): [<c0228590>] __irq_exit_rcu+0x114/0x174
    ---[ end trace 0000000000000000 ]---
    DMA-API: Mapped at:
     __dma_map_sg_attrs+0x6c/0x11c
     dma_map_sg_attrs+0x10/0x1c
     renesas_sdhi_sys_dmac_start_dma+0xf8/0x424
     tmio_process_mrq+0x124/0x264
     mmc_start_request+0x90/0xa4

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
