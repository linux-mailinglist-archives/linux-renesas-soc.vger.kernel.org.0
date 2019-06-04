Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B5134F8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 20:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfFDSGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 14:06:30 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38670 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDSGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 14:06:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id b11so17152369lfa.5;
        Tue, 04 Jun 2019 11:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=IeaecD7D+Nr3yNCgBW1wrOWQZ2mkWH3uQoYYoLRitYg=;
        b=uH1Z/tKHhfvmCvIjbidTTamMRoPyoV1bdO6Na2CdYfsHSOdW9yx4R12gh8LuO0WL67
         KuDF9aKXRyzoIIr8DWphU58qKHe/mASbkKyGQkVVv+dYMiq5L/C9j4g7mcGppcBmIhjN
         Mp+eHUgBerqtvkSF+UQe0dC+QUZdVVkAryeOC6OyitEPgn+d6zhtECNYFQG8DevwNUTh
         lKTFCFVNHRWNZrmlzLgBommPh0/yE7bljyWdMSF5eCbNUobemGGfbJGHJUBgcMFTACfd
         e7WfWv+61Zf3D0vNJ/j0P9WR6bvGhQED0oQYmtgXvJICTGoLX1ms1lK02nApO3ZoRi5w
         QwFQ==
X-Gm-Message-State: APjAAAVlVMBOokUtpVZEsoO7O8pbobV5bTfo8TDGMxvYLuv6WQT2XAkq
        cQiarlml7pyniE/tMKW1ZAM/QWgCRVozUEvZyvvngFGCxZw=
X-Google-Smtp-Source: APXvYqwP/6cizDvAhMCvM/MNzjr9s5OPeGb7XgfNR0914vl8l7hgqBmWownR9KOl2JF0M2YwNESea3kkqEKXpfvx/RE=
X-Received: by 2002:a19:c142:: with SMTP id r63mr18648082lff.49.1559671588076;
 Tue, 04 Jun 2019 11:06:28 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 20:06:16 +0200
Message-ID: <CAMuHMdUObtKUVDohLT501TarPRC6eDnxBqqB5Tj_Tb+-4fwbkw@mail.gmail.com>
Subject: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Using a tree based on renesas-drivers-2019-06-04-v5.2-rc3, I started seeing
the following warning during a second system suspend (s2idle):

    unbalanced disables for USB20_VBUS0
    WARNING: CPU: 2 PID: 1162 at drivers/regulator/core.c:2593
_regulator_disable+0x58/0x174
    Modules linked in:
    CPU: 2 PID: 1162 Comm: kworker/u16:22 Not tainted
5.2.0-rc3-salvator-x-02580-g25f69f634d1c7e7d #407
    Hardware name: Renesas Salvator-X board based on r8a7795 ES1.x (DT)
    Workqueue: events_unbound async_run_entry_fn
    pstate: 40400005 (nZcv daif +PAN -UAO)
    pc : _regulator_disable+0x58/0x174
    lr : _regulator_disable+0x58/0x174
    sp : ffffff8012abb9d0
    x29: ffffff8012abb9d0 x28: ffffff80110fa0c0
    x27: 0000000000000000 x26: ffffff8010cecf66
    x25: 0000000000000001 x24: 0000000000000002
    x23: 0000000000000001 x22: ffffff801100e000
    x21: ffffffc6f80ca700 x20: ffffffc6f80ae800
    x19: ffffffc6f80ae800 x18: 000000000000000a
    x17: 0000000000000000 x16: 0000000000000000
    x15: 000000000002da16 x14: 0720072007200720
    x13: 0720072007200720 x12: ffffff8011038000
    x11: ffffff8011b412e1 x10: 0000000000000044
    x9 : 0000000000000028 x8 : ffffff801112187c
    x7 : 0000000000000001 x6 : 0000000000000000
    x5 : ffffffc6ff70d240 x4 : 0000000000000001
    x3 : 0000000000000007 x2 : 0000000000000007
    x1 : 7a369ee2b9d96e00 x0 : 0000000000000000
    Call trace:
     _regulator_disable+0x58/0x174
     regulator_disable+0x40/0x78
     rcar_gen3_phy_usb2_power_off+0x40/0x50
     phy_power_off+0x50/0xb4
     usb_phy_roothub_power_off+0x38/0x44
     usb_phy_roothub_suspend+0x1c/0x48
     hcd_bus_suspend+0xc8/0x15c
     generic_suspend+0x14/0x54
     usb_suspend_both+0xec/0x208
     usb_suspend+0xe0/0x118
     usb_dev_suspend+0x10/0x18
     dpm_run_callback+0x170/0x2e8
     __device_suspend+0x18c/0x594
     async_suspend+0x28/0xa0
     async_run_entry_fn+0x4c/0x120
     process_one_work+0x354/0x5b4
     worker_thread+0x21c/0x324
     kthread+0x120/0x130
     ret_from_fork+0x10/0x18
    irq event stamp: 3436
    hardirqs last  enabled at (3435): [<ffffff8010159e60>]
vprintk_emit+0x230/0x31c
    hardirqs last disabled at (3436): [<ffffff8010081a28>]
do_debug_exception+0x48/0x12c
    softirqs last  enabled at (3428): [<ffffff8010081ee4>]
__do_softirq+0x18c/0x4a0
    softirqs last disabled at (3421): [<ffffff80100f4a60>] irq_exit+0xa4/0x100
    ---[ end trace ba79265b58264683 ]---
    phy phy-ee080200.usb-phy.11: phy poweroff failed --> -5

So far I've seen this on Salvator-X with R-Car H3 ES1.0 or M3-W, and
on Salvator-XS with R-Car M3-N, but not (yet?) on H3 ES2.0.

Unfortunately the issue seems to be fairly timing-sensitive, so I failed
to bisect it.

I have added some debug.  While this didn't help me finding the cause
of the above warning, it did discover another imbalance:

A) Boot:

    phy phy-ee080200.usb-phy.7: rcar_gen3_phy_usb2_power_on: Enabling regulator
    (from ehci_platform_probe)

B) System suspend (s2idle):

    phy phy-ee080200.usb-phy.7: rcar_gen3_phy_usb2_power_off:
Disabling regulator
    (from async_suspend)

Looks OK.

C) System resume:

    phy phy-ee080200.usb-phy.7: rcar_gen3_phy_usb2_power_on: Enabling regulator
    phy phy-ee080200.usb-phy.6: rcar_gen3_phy_usb2_power_on: Enabling regulator
    (from async_resume)

What's this phy-ee080200.usb-phy.6, which was never enabled before, during boot?

D) System suspend (s2idle):

    phy phy-ee080200.usb-phy.7: rcar_gen3_phy_usb2_power_off:
Disabling regulator

E) System resume:

    phy phy-ee080200.usb-phy.6: rcar_gen3_phy_usb2_power_on: Enabling regulator
    phy phy-ee080200.usb-phy.7: rcar_gen3_phy_usb2_power_on: Enabling regulator

I.e. phy-ee080200.usb-phy.6 keeps on being enabled during each system resume,
but is never disabled

Do you have a clue?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
