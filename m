Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0253C2E6F0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 09:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgL2Ilp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Dec 2020 03:41:45 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:38713 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgL2Ilo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 03:41:44 -0500
Received: by mail-oi1-f169.google.com with SMTP id x13so14012274oic.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Dec 2020 00:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P462S5sZaKx9gGBdw19dEJFQZ8muxQ1430ty6gy0yZ4=;
        b=oyDCpN+ylp2HmRA0Zc7nyaDHtd4Z4cO+JbjmKii27WlfXsuf1yi5Dx3MZDM01rsOEt
         80jrLgF6/cdF4EK2RdOw8ngyxO32VYP4BzpmIg1clcOhJsbJQy/VOnCfu1Qwq8cLOzaa
         XCLoXpRvmdlhvA+XAsGjYAMQgnd+dTG2T1j1Leq2UGc/qcnxUCVFCPzrVO53Qnno29l5
         y/4PIr35Ju74cq+DgGw2dRpxFs8/x9EewoRqAXoDGsdsPj32W5pYeRrBX3llhmQnL+jN
         0ERIArtFMj6K8OT7/ZSfIht3zgKNpfWPYjsd/boROVqVSd9ooElOzykY2ovfWRPmM3NA
         EEhQ==
X-Gm-Message-State: AOAM531ADkq3lk4sd8F5IJ304QZMo5uwQ25cwcd4nxIoAQYfl2tIu7Qk
        hTssOOzHE3pjLxpmxeCiSpJRoGfS701sNvw7julgHYqr8pY=
X-Google-Smtp-Source: ABdhPJylJ/bx7QiqzOwa4yiaASMidj9YzxT+KqHsRlSUhVfKe/aiUmqkaaPwbgeLATOh8TuvHK28OcE76rY+3aL/aYg=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr1704458oia.148.1609231263799;
 Tue, 29 Dec 2020 00:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20201223185304.GA75038@ninjato>
In-Reply-To: <20201223185304.GA75038@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Dec 2020 09:40:52 +0100
Message-ID: <CAMuHMdU+MZO16TQcDN8zgJNXjWqhgcBLSYedkVoCSH4sOgi-Pg@mail.gmail.com>
Subject: Re: Reboot regression on Lager
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 7:55 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I just discovered that my Lager can't reboot anymore. 5.10 is good,
> current Linus' tree [1] is bad. I don't have time to debug this on my
> own right now, so this is a reminder and notification for now.
>
> [1] (614cb5894306 ("Merge tag 'acpi-5.11-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")
>
> Happy hacking,
>
>    Wolfram
>
> ===
>
> [    8.280735] Unhandled fault: imprecise external abort (0x1406) at 0x00000000

That usually indicates that a module's registers are accessed,
while the module clock is disabled.

> [    8.287793] pgd = (ptrval)
> [    8.290504] [00000000] *pgd=41d85835, *pte=00000000, *ppte=00000000
> [    8.296794] Internal error: : 1406 [#1] ARM
> [    8.300983] Modules linked in:
> [    8.304044] CPU: 0 PID: 1173 Comm: init Tainted: G        W         5.10.0-12913-g614cb5894306 #1092
> [    8.313187] Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> [    8.319632] PC is at sh_mdio_ctrl+0x44/0x60
> [    8.323831] LR is at sh_mmd_ctrl+0x20/0x24

So sh_eth is already suspended at this point.

Can you reproduce it at will? Koelsch is still rebooting fine.
But I caught the following during s2ram once, which might be related:

 Disabling non-boot CPUs ...
 Enabling non-boot CPUs ...
+------------[ cut here ]------------
+WARNING: CPU: 0 PID: 21 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0x464/0x4a0
+i2c i2c-6: Transfer while suspended
+CPU: 0 PID: 21 Comm: kworker/0:1 Not tainted
5.11.0-rc1-shmobile-00107-gcf9760aa181f #829
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+Workqueue: events_power_efficient sync_hw_clock
+[<c010dba4>] (unwind_backtrace) from [<c0109b28>] (show_stack+0x10/0x14)
+[<c0109b28>] (show_stack) from [<c07a120c>] (dump_stack+0x8c/0xa8)
+[<c07a120c>] (dump_stack) from [<c011c538>] (__warn+0xc0/0xec)
+[<c011c538>] (__warn) from [<c079a7bc>] (warn_slowpath_fmt+0x78/0xb0)
+[<c079a7bc>] (warn_slowpath_fmt) from [<c0566574>] (__i2c_transfer+0x464/0x4a0)
+[<c0566574>] (__i2c_transfer) from [<c0566608>] (i2c_transfer+0x58/0xf8)
+[<c0566608>] (i2c_transfer) from [<c0489f80>] (regmap_i2c_read+0x58/0x94)
+[<c0489f80>] (regmap_i2c_read) from [<c0485e00>] (_regmap_raw_read+0x108/0x1bc)
+[<c0485e00>] (_regmap_raw_read) from [<c0485ef8>] (_regmap_bus_read+0x44/0x68)
+[<c0485ef8>] (_regmap_bus_read) from [<c0484018>] (_regmap_read+0x84/0x100)
+[<c0484018>] (_regmap_read) from [<c0485444>] (_regmap_update_bits+0xa8/0xf4)
+[<c0485444>] (_regmap_update_bits) from [<c0485574>]
(_regmap_select_page+0xe4/0x100)
+[<c0485574>] (_regmap_select_page) from [<c0485664>]
(_regmap_raw_write_impl+0xd4/0x608)
+[<c0485664>] (_regmap_raw_write_impl) from [<c04863f4>]
(_regmap_raw_write+0xd8/0x114)
+[<c04863f4>] (_regmap_raw_write) from [<c0486488>] (regmap_raw_write+0x58/0x7c)
+[<c0486488>] (regmap_raw_write) from [<c04866cc>]
(regmap_bulk_write+0x118/0x13c)
+[<c04866cc>] (regmap_bulk_write) from [<c05605b4>]
(da9063_rtc_set_time+0x44/0x8c)
+[<c05605b4>] (da9063_rtc_set_time) from [<c055e428>] (rtc_set_time+0x8c/0x15c)
+[<c055e428>] (rtc_set_time) from [<c01872cc>] (sync_hw_clock+0x12c/0x210)
+[<c01872cc>] (sync_hw_clock) from [<c01337d0>] (process_one_work+0x1bc/0x2ac)
+[<c01337d0>] (process_one_work) from [<c0133b18>] (worker_thread+0x22c/0x2d0)
+[<c0133b18>] (worker_thread) from [<c01388a8>] (kthread+0x100/0x10c)
+[<c01388a8>] (kthread) from [<c0100150>] (ret_from_fork+0x14/0x24)
+Exception stack(0xc1195fb0 to 0xc1195ff8)
+5fa0:                                     00000000 00000000 00000000 00000000
+5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
+5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
+---[ end trace 5d3a7a10ee0cec3d ]---
+da9063-rtc da9063-rtc: Failed to set RTC time data: -108
+da9063-rtc da9063-rtc: Failed to read RTC time data: -108
 CPU1 is up

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
