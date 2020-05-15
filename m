Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B1D1D509A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgEOOfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 10:35:19 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35109 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgEOOfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 10:35:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id k110so2062796otc.2;
        Fri, 15 May 2020 07:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKPlso0WQQziVOQ8u4GeFZPYKAS6yBlI0r6TV2B4BFI=;
        b=pgbDJY7Tmvjt0sV316zSwHqFPcGL7XTKzbz2v8uJco0mC3KKmpBv+gCKthPz6ICcBY
         CMxymbq/FoB1eaEMx1xOt3uxQM7YI6TT0Fmtwtf9H58MCgoNcHvwAw1abHRCs/pEILq/
         d64CDGtgc/Ruk/w0GhZCRTUnvEi6E7yzIUeFNt2hQdYIKDP8MFCRSPrB5+glKR2Zi0Vr
         Eq92Fayk45LiODpgondZ4lBa8UEzERtKf+ocyWlGPAfaWj8v+qbTXhClWbwc14NaQ3Ni
         BasHIEWM3P5Skcn4kMekt+9NjFg8BnGy33LtCyQr7GuPZEYY5ImnQkgc8ZybJ3L2gham
         Ecxg==
X-Gm-Message-State: AOAM530j/ENbTTIgZZf21G42r5BspQ4r4Ofk9oypaSUkZ4EzgfA1s2F7
        kgdeufxZb+kADLk36sllmJBqtEj7+WwwK3Biy0U=
X-Google-Smtp-Source: ABdhPJzvqwKaXg+AlEIlz3HK5ciut0TcfbaOF3K4GdjnQBKBoGWbflImfe+EJ1VWKm4sC9BwTtavlC4uH3mf0GcqeNM=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr2403315otp.145.1589553317993;
 Fri, 15 May 2020 07:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 16:35:06 +0200
Message-ID: <CAMuHMdXgWFAt1WTYarHEPv7x=+WJK7+aVEj8n+j_jB2tXMdYLQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: don't lose RPM savings because of
 manual clk handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, May 13, 2020 at 7:31 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The SDHI driver en-/disabled clocks on its own during probe() and
> remove(). This basically killed all potential RPM power savings. Now, we
> just enable the clocks for a short time when we access registers in
> probe(). We otherwise leave all handling to RPM. That means, we need to
> shift the RPM enabling code in the TMIO core a bit up, so we can access
> registers there, too.
>
> clk_summary before:
> sd0                   1        1        0    12480000          0     0  50000
>    sdif0              2        2        0    12480000          0     0  50000
>
> clk_summary after:
> sd0                   1        1        0    12480000          0     0  50000
>    sdif0              1        1        0    12480000          0     0  50000
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Salvator-XS board with R-Car M3-N.

While this seems to have no ill effects on R-Car Gen3, RZ/A1, and RZ/A2,
it does on R-Car Gen2, which prints before probing:

    sh_mobile_sdhi ee100000.sd: Unbalanced pm_runtime_enable!

And on SH-Mobile AG5, R-Mobile A1, and R-Mobile APE6:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 5 at drivers/clk/clk.c:954 clk_core_disable+0x6c/0x2b0
    sdhi1 already disabled
    CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted
5.7.0-rc5-ape6evm-00536-ga65e619d428aff9a-dirty #186
    Hardware name: Generic R8A73A4 (Flattened Device Tree)
    Workqueue: pm pm_runtime_work
    [<c00169e8>] (unwind_backtrace) from [<c001345c>] (show_stack+0x10/0x14)
    [<c001345c>] (show_stack) from [<c04b6e34>] (dump_stack+0x88/0xa8)
    [<c04b6e34>] (dump_stack) from [<c00270b8>] (__warn+0xd0/0xec)
    [<c00270b8>] (__warn) from [<c0027144>] (warn_slowpath_fmt+0x70/0x9c)
    [<c0027144>] (warn_slowpath_fmt) from [<c029d53c>]
(clk_core_disable+0x6c/0x2b0)
    [<c029d53c>] (clk_core_disable) from [<c029d798>]
(clk_core_disable_lock+0x18/0x24)
    [<c029d798>] (clk_core_disable_lock) from [<c02fa670>]
(pm_clk_suspend+0x64/0x78)
    [<c02fa670>] (pm_clk_suspend) from [<c02f8918>]
(genpd_runtime_suspend+0x110/0x1bc)
    [<c02f8918>] (genpd_runtime_suspend) from [<c02f01b4>]
(__rpm_callback+0x30/0xe0)
    [<c02f01b4>] (__rpm_callback) from [<c02f02d4>] (rpm_callback+0x70/0x80)
    [<c02f02d4>] (rpm_callback) from [<c02f0e28>] (rpm_suspend+0x330/0x4a0)
    [<c02f0e28>] (rpm_suspend) from [<c02f1240>] (pm_runtime_work+0x74/0x8c)
    [<c02f1240>] (pm_runtime_work) from [<c00402f4>]
(process_one_work+0x2cc/0x4ac)
    [<c00402f4>] (process_one_work) from [<c0040730>]
(worker_thread+0x230/0x2f0)
    [<c0040730>] (worker_thread) from [<c0045b9c>] (kthread+0x12c/0x13c)
    [<c0045b9c>] (kthread) from [<c0009148>] (ret_from_fork+0x14/0x2c)
    Exception stack(0xef0cdfb0 to 0xef0cdff8)
    dfa0:                                     00000000 00000000
00000000 00000000
    dfc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
    ---[ end trace c1cca51c99a6297a ]---

and later:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 12 at drivers/clk/clk.c:1014 clk_core_enable+0x6c/0x2bc
    Enabling unprepared sdhi1
    CPU: 0 PID: 12 Comm: kworker/0:1 Tainted: G        W
5.7.0-rc5-ape6evm-00536-ga65e619d428aff9a-dirty #186
    Hardware name: Generic R8A73A4 (Flattened Device Tree)
    Workqueue: events_freezable mmc_rescan
    [<c00169e8>] (unwind_backtrace) from [<c001345c>] (show_stack+0x10/0x14)
    [<c001345c>] (show_stack) from [<c04b6e34>] (dump_stack+0x88/0xa8)
    [<c04b6e34>] (dump_stack) from [<c00270b8>] (__warn+0xd0/0xec)
    [<c00270b8>] (__warn) from [<c0027144>] (warn_slowpath_fmt+0x70/0x9c)
    [<c0027144>] (warn_slowpath_fmt) from [<c029d810>]
(clk_core_enable+0x6c/0x2bc)
    [<c029d810>] (clk_core_enable) from [<c029da78>]
(clk_core_enable_lock+0x18/0x2c)
    [<c029da78>] (clk_core_enable_lock) from [<c02fa6ec>]
(pm_clk_resume+0x68/0xa0)
    [<c02fa6ec>] (pm_clk_resume) from [<c02f8dd0>]
(genpd_runtime_resume+0xc8/0x170)
    [<c02f8dd0>] (genpd_runtime_resume) from [<c02f01b4>]
(__rpm_callback+0x30/0xe0)
    [<c02f01b4>] (__rpm_callback) from [<c02f02d4>] (rpm_callback+0x70/0x80)
    [<c02f02d4>] (rpm_callback) from [<c02f0a50>] (rpm_resume+0x44c/0x4f4)
    [<c02f0a50>] (rpm_resume) from [<c02f00f0>] (__pm_runtime_resume+0x64/0x80)
    [<c02f00f0>] (__pm_runtime_resume) from [<c0342480>]
(__mmc_claim_host+0x1c8/0x218)
    [<c0342480>] (__mmc_claim_host) from [<c03437f0>] (mmc_rescan+0xfc/0x260)
    [<c03437f0>] (mmc_rescan) from [<c00402f4>] (process_one_work+0x2cc/0x4ac)
    [<c00402f4>] (process_one_work) from [<c0040730>]
(worker_thread+0x230/0x2f0)
    [<c0040730>] (worker_thread) from [<c0045b9c>] (kthread+0x12c/0x13c)
    [<c0045b9c>] (kthread) from [<c0009148>] (ret_from_fork+0x14/0x2c)
    Exception stack(0xef0f1fb0 to 0xef0f1ff8)
    1fa0:                                     00000000 00000000
00000000 00000000
    1fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
    ---[ end trace c1cca51c99a6297b ]---
    sh_mobile_sdhi ee120000.sd: __pm_clk_enable: failed to enable clk
(ptrval), error -108

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
