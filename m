Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B0E2D97FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 13:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407782AbgLNM30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 07:29:26 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:44436 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731433AbgLNM3S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 07:29:18 -0500
Received: by mail-ot1-f41.google.com with SMTP id f16so15437091otl.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 04:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9eJJKts3ZxyJfmyiVfg/RTHlgGIwYkqgT7tNyJxM1bA=;
        b=bshCqXWDropvC5rZ31RRSa8FxK3gYn7hoCJhohWo1x/PqHjI261uDKXsNU0Fzr2qk+
         LTd60BUqhgU2+3A7UVmea61kguo566bhmIOSNZthgepiygxk+T5e92pOivlcTEFyuNdx
         tqdVzdplNBZ7xD77KO3CPpVNsAP87TaGeqF/EE03tJHX2wcKqodjy1WDliTfIdua8aPb
         4vvWF+y+tfChxf8Tf+FNDVesdA5SPKAlqINmAvbv1ytTM56yytci07hCNsJgLo0IUcqp
         /fR8NUrxhnEWsJgkdLhokmN+pWeasMLOk+/GTHWF5anlU8V/L72pflmXNFer6MB2SzrS
         qpMQ==
X-Gm-Message-State: AOAM530OZomLO2ZMBocAc7luj0RmAbHQ7LSCNp/ky7iIvCJBa82kwp6u
        wbFSC1I24SkNcnZW1soH7zOMEPc0Ixl+1QEzHsgwmLbzcuU=
X-Google-Smtp-Source: ABdhPJwvGZq3VU/rTtCCIe2jNP89KnFfvYrzHh0CBPDcftkuDfTW+TwzsjalusV+GD3yyZJUtlLY1W5LRzbgFk25e0g=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr19357283oth.250.1607948917259;
 Mon, 14 Dec 2020 04:28:37 -0800 (PST)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Dec 2020 13:16:25 +0100
Message-ID: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
Subject: rsnd: clk-multiplier already disabled warning on Ebisu
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

While booting Ebisu-4D, I saw the below warnings (once).

    rcar_sound ec500000.sound: can't use clk 1

rsnd_adg_clk_control() failed to enable CLKB, but continues.

    ------------[ cut here ]------------
    clk-multiplier already disabled
    WARNING: CPU: 1 PID: 52 at drivers/clk/clk.c:952 clk_core_disable+0x30/0x9c
    Modules linked in:
    CPU: 1 PID: 52 Comm: kworker/1:2 Not tainted
5.10.0-rc7-rcar3-initrd-00582-gadecf297acf4-dirty #183
    Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
    Workqueue: events deferred_probe_work_func
    pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
    pc : clk_core_disable+0x30/0x9c
    lr : clk_core_disable+0x30/0x9c
    sp : ffffffc010f939f0
    x29: ffffffc010f939f0 x28: 0000000000000000
    x27: ffffff800949eb00 x26: ffffff80093c40f8
    x25: 0000000000000001 x24: ffffffc010805fea
    x23: 0000000000000000 x22: ffffff80082b8810
    x21: ffffff80093c4080 x20: ffffff8009368b00
    x19: ffffff8009368b00 x18: 0000000000000000
    x17: 000000004ef774c4 x16: 0000000000000014
    x15: ffffffffffffffff x14: ffffffc010b8e8b0
    x13: fffffffffff9fd47 x12: 0720072007200720
    x11: fffffffffffc0000 x10: ffffffc010b8e8d8
    x9 : 0720072007200720 x8 : 2079646165726c61
    x7 : 0000000000000004 x6 : 00000000ffffe6ad
    x5 : ffffffc010f93718 x4 : 0000000000000000
    x3 : 0000000000000000 x2 : 00000000ffffffff
    x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     clk_core_disable+0x30/0x9c
     clk_core_disable_lock+0x24/0x3c
     clk_disable+0x20/0x30
     rsnd_adg_clk_control+0xa0/0xd4
     rsnd_adg_remove+0x58/0x6c
     rsnd_probe+0x134/0x3cc

Something else fails (-EPROBE_DEFER?), and thus rsnd_adg_remove() is
called.  The latter disables all clocks, including the one that failed to
enable before, leading to the warning.

     platform_drv_probe+0x54/0xa4
     really_probe+0x234/0x340
     driver_probe_device+0xa0/0xb0
     __device_attach_driver+0x9c/0xa8
     bus_for_each_drv+0x9c/0xc4
     __device_attach+0xd4/0x140
     device_initial_probe+0x14/0x20
     bus_probe_device+0x30/0x94
     deferred_probe_work_func+0x9c/0xb0
     process_one_work+0x180/0x1f0
     process_scheduled_works+0x44/0x48
     worker_thread+0x1ec/0x270
     kthread+0xdc/0xec
     ret_from_fork+0x10/0x30
    ---[ end trace 8d8c2a1b7537ca36 ]---
    ------------[ cut here ]------------
    clk-multiplier already unprepared
    WARNING: CPU: 1 PID: 52 at drivers/clk/clk.c:810
clk_core_unprepare+0x30/0xd0
    [...]
    ---[ end trace 8d8c2a1b7537ca37 ]---

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
