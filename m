Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD46215626
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 13:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgGFLO0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 07:14:26 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32927 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgGFLO0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 07:14:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id k22so20352175oib.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 04:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Xmfu3Fnr4tuvWAxbmhXNt2FUuQH7IYb86bswh/f+hQ=;
        b=GkGHTaaau7h8Rqo+giDG2Dr+YsYJjrZmxiVFfv+GCH78to8TyO+GdZ5wjCjJn0gFMZ
         WOkOPoUm3gPXsxcVfY9hkZdcYe8i6E18Lt26rGoi9AGnQ1OzeHZngElbdCzQw5sk1uWU
         R2jVCdPPVWqnpbhv1WqIvYfm+VrQaMvqkOLUXBJBV4PKV52pkx17Fd8b0E5lkD3pkJ7C
         63dgWzG+cazabooQTS+r8PPaJREOz+YRlO+ut4bgAhrUOVb4boYQrqgjUs4AdhIrRfpy
         1YubTJ94/d9tzHH751AQh9ik3YE1nWONHn64xtrQffnqk8xpuV3UpP/651pJGnL2dXZV
         dt2w==
X-Gm-Message-State: AOAM533gjN8uXHfwMmRCaAfVd/TMAvgp+svOY1pF8A4O1edaVtzDPijE
        L38kTOQFS7u5CEFh8F2vDMiKHTxzlvkRB9Fsb99xWUZv
X-Google-Smtp-Source: ABdhPJxPJIZGPu8E4RcpwtpGTRis57/BuZZBL7k58QaA78PFjVXZkMVzJYbFEO6OJXPKYfyyoQkwoTGVQl++/ERSvzI=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr35889300oih.54.1594034064923;
 Mon, 06 Jul 2020 04:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
 <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
 <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com> <TY2PR01MB36922D383DD83EB2DE22F84FD86A0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36922D383DD83EB2DE22F84FD86A0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jul 2020 13:14:13 +0200
Message-ID: <CAMuHMdUdAYQ2pOtpeLFc6oXXppdytiPPa-SPmfDFO8Yg5Cwr8w@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 0/4] treewide: add regulator condition on _mmc_suspend()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jul 3, 2020 at 1:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, June 30, 2020 10:19 PM
> > On Mon, Jun 29, 2020 at 1:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Mon, Jun 29, 2020 at 12:04 PM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > From: Geert Uytterhoeven, Sent: Friday, June 26, 2020 7:13 PM
> > > > > On Fri, Jun 26, 2020 at 11:32 AM Yoshihiro Shimoda
> > > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > Note that v5.8-rc2 with r8a77951-salvator-xs seems to cause panic from
> > > > > > PCI driver when the system is suspended. So, I disabled the PCI
> > > > > > devices when I tested this patch series.
> > > > >
> > > > > Does this happen with current renesas-devel and renesas_defconfig?
> > > > > (it doesn't for me)
> > > >
> > > > Yes. I enabled PM_DEBUG and E1000E though.
> > > >
> > > > > Do you have any PCIe devices attached? (I haven't)
> > > >
> > > > Yes. (Intel Ethernet card is connected to the PCI slot.)
> > > >
> > > > < my environment >
> > > > - r8a77961-salvator-xs
> > > > - renesas-devel-2020-06-26-v5.8-rc2
> > > >  + renesas_defconfig + PM_DEBUG + E1000E
> > > > - initramfs
> > >
> > > Doesn't fail for me on R-Car H3 ES2.0, so it needs the presence of a
> > > PCIe card.  Unfortunately I haven't any (added to shopping wishlist).
> >
> > [...]
> >
> > > The failure mode looks like the PCI card is accessed while the PCI host
> > > bridge has been suspended.
> >
> > Does "[PATCH v1] driver core: Fix suspend/resume order issue with
> > deferred probe"[1] help?
> >
> > [1] https://lore.kernel.org/lkml/20200625032430.152447-1-saravanak@google.com/
>
> Even if I applied this patch, the issue still happened unfortunately.

OK.

I managed to reproduce it on the M3-W+ in Magnus' farm.

> By the way, I'm guessing the issue is related to my environment which uses BSP's ATF.
> According to the commit log of upstream ATF [1], PCIe hardware is possible to causes SError.
> Unfortunately, I cannot try to update the firmware for some reasons now... I'll prepare
> updated firmware somehow...

I don't think it's firmware-related.  The issue happens in the PCI
suspend_noirq callback, which is called during late system suspend.
With the following debug code added:

@@ -789,6 +789,8 @@ static int pci_pm_suspend_noirq(struct device *dev)
        struct pci_dev *pci_dev = to_pci_dev(dev);
        const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;

+dev_info(dev, "%s:%u: is_suspended = %u\n", __func__, __LINE__,
dev->power.is_suspended);
+dev_info(&pci_dev->bus->self->dev, "%s:%u: parent: is_suspended =
%u\n", __func__, __LINE__,
pci_dev->bus->self->dev.power.is_suspended);
        if (dev_pm_skip_suspend(dev))
                return 0;

I get:

     e1000e 0000:01:00.0: pci_pm_suspend_noirq:792: is_suspended = 1
    pci 0000:00:00.0: pci_pm_suspend_noirq:793: parent: is_suspended = 1

Oops, PCIe bridge already suspended.

    SError Interrupt on CPU0, code 0xbf000002 -- SError
    CPU: 0 PID: 172 Comm: kworker/u12:1 Not tainted
5.8.0-rc3-rcar3-initrd-00505-g6c843129e6faaf01-dirty #141
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
    Workqueue: events_unbound async_run_entry_fn
    pstate: 40000085 (nZcv daIf -PAN -UAO BTYPE=--)
    pc : rcar_pci_read_reg+0x10/0x28
    lr : rcar_pcie_config_access+0x148/0x178
    sp : ffffffc0112abb10
    x29: ffffffc0112abb10 x28: 0000000000000000
    x27: 0000000000000000 x26: 0000000000000000
    x25: 00000000000000cc x24: ffffff86b5f7e800
    x23: 0000000000000000 x22: 0000000000000000
    x21: 0000000000000000 x20: ffffffc0112abbe4
    x19: ffffff86b5f29c00 x18: 000000000000000a
    x17: 0000000000000000 x16: 0000000000000000
    x15: 000000000008dba6 x14: 0720072007200720
    x13: 0720072007200720 x12: 0000000000000001
    x11: 0000000000000000 x10: 0000000000001810
    x9 : ffffffc0112aba90 x8 : ffffff86b5f43a30
    x7 : ffffff86bef76bc0 x6 : ffffff86b5f423c0
    x5 : ffffffc0112abbe4 x4 : 00000000000000cc
    x3 : 0000000000000000 x2 : ffffffc011400018
    x1 : 0000000000000020 x0 : 00000000ffffffff
    Kernel panic - not syncing: Asynchronous SError Interrupt
    CPU: 0 PID: 172 Comm: kworker/u12:1 Not tainted
5.8.0-rc3-rcar3-initrd-00505-g6c843129e6faaf01-dirty #141
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
    Workqueue: events_unbound async_run_entry_fn
    Call trace:
     dump_backtrace+0x0/0x188
     show_stack+0x18/0x24
     dump_stack+0xb8/0xe8
     panic+0x158/0x33c
     nmi_panic+0x60/0x7c
     arm64_serror_panic+0x68/0x74
     do_serror+0xa8/0x144
     el1_error+0x84/0x100
     rcar_pci_read_reg+0x10/0x28
     rcar_pcie_read_conf+0x3c/0x9c
     pci_bus_read_config_word+0x80/0xd8
     pci_read_config_word+0x3c/0x48
     pci_raw_set_power_state+0x1a4/0x284
     pci_set_power_state+0xa8/0xd4
     pci_prepare_to_sleep+0x58/0x90
     pci_pm_suspend_noirq+0x280/0x284
     dpm_run_callback.isra.17+0x50/0xb8
     __device_suspend_noirq+0x84/0x188
     async_suspend_noirq+0x2c/0x7c
     async_run_entry_fn+0x50/0x12c
     process_one_work+0x180/0x1f0
     worker_thread+0x1d0/0x268
     kthread+0xdc/0xec
     ret_from_fork+0x10/0x18
    SMP: stopping secondary CPUs
    Kernel Offset: disabled
    CPU features: 0x000022,20006004
    Memory Limit: none

Anyone who can reproduce this on a different board, also on R-Car Gen2
or even R-Car H1?

    Intel E1000E card with CONFIG_E1000E=y

    echo 0 > /sys/module/printk/parameters/console_suspend
    echo mem > /sys/power/state

Why haven't we seen this before?
I can reproduce the issue on v5.5 (first version that supported M3-W+,
but needs backported DTS for PCIe support) and later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
