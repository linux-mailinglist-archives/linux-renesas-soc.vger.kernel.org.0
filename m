Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8D1241BC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 15:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgHKNvK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 09:51:10 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35003 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbgHKNu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 09:50:26 -0400
Received: by mail-oi1-f196.google.com with SMTP id k4so12253108oik.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 06:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBx8Nfzf99P5M/xHogROqqR/I51Hrcz5cvCUhHylWK0=;
        b=ruUsc41iBkmpH5eW8PLgV/MKlYEe6LK5KmpVI7IZ9TdwB3jLmXyYKcEtucRtsgsVxq
         U67FdT0uoS9mg54ih8vxIe2LphSLB4ILWtUjXexlbY301BTQvcUh2QaiWa8ZWlr/XH/a
         lOJMzuHrBzXTUD3zMVVWxEEpcYytquKIipHIIBKp1O5o90OgijNGw912Kwt9yL5fTEmS
         NoFNkqM+nm1CnFLK1cdS14ANKiEhWMw8c8LRQSfKCIasp+aY9F0cR8EsBpmbbmQnT3rq
         pyM0A+CyR50IE96bJbJHTNRkCq3CUFdE1vgLZLPCg8TOMBS/lWLZjkWF4f33y+V4BWOk
         Ax2g==
X-Gm-Message-State: AOAM532MUzdmfu07mLsuMw/3K695HuXhdppovDnPiQwuOY+h5JwoEb07
        adAvFAn+a0DI2cK1CjAXsrjFosBWN4LQFga74GQ=
X-Google-Smtp-Source: ABdhPJxwKbrWMxjt5VzD2K0oVMQREIoIZa9CakEFWtzrhlv3o20xKh66Q91YJY2oPlNYjS5oJ4V7wtc8je917C7N9Vk=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr3523422oia.54.1597153825057;
 Tue, 11 Aug 2020 06:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
 <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
 <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com>
 <TY2PR01MB36922D383DD83EB2DE22F84FD86A0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUdAYQ2pOtpeLFc6oXXppdytiPPa-SPmfDFO8Yg5Cwr8w@mail.gmail.com>
In-Reply-To: <CAMuHMdUdAYQ2pOtpeLFc6oXXppdytiPPa-SPmfDFO8Yg5Cwr8w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Aug 2020 15:50:13 +0200
Message-ID: <CAMuHMdU8BCxm8O0Ch8oJ18Est8Gv6VCucLEM7HtoFjsqKjS=kQ@mail.gmail.com>
Subject: E1000 s2idle crash (was: Re: [PATCH/RFC v4 0/4] treewide: add
 regulator condition on _mmc_suspend())
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jul 6, 2020 at 1:14 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jul 3, 2020 at 1:10 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Tuesday, June 30, 2020 10:19 PM
> > > On Mon, Jun 29, 2020 at 1:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Mon, Jun 29, 2020 at 12:04 PM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > From: Geert Uytterhoeven, Sent: Friday, June 26, 2020 7:13 PM
> > > > > > On Fri, Jun 26, 2020 at 11:32 AM Yoshihiro Shimoda
> > > > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > > Note that v5.8-rc2 with r8a77951-salvator-xs seems to cause panic from
> > > > > > > PCI driver when the system is suspended. So, I disabled the PCI
> > > > > > > devices when I tested this patch series.
> > > > > >
> > > > > > Does this happen with current renesas-devel and renesas_defconfig?
> > > > > > (it doesn't for me)
> > > > >
> > > > > Yes. I enabled PM_DEBUG and E1000E though.
> > > > >
> > > > > > Do you have any PCIe devices attached? (I haven't)
> > > > >
> > > > > Yes. (Intel Ethernet card is connected to the PCI slot.)
> > > > >
> > > > > < my environment >
> > > > > - r8a77961-salvator-xs
> > > > > - renesas-devel-2020-06-26-v5.8-rc2
> > > > >  + renesas_defconfig + PM_DEBUG + E1000E
> > > > > - initramfs
> > > >
> > > > Doesn't fail for me on R-Car H3 ES2.0, so it needs the presence of a
> > > > PCIe card.  Unfortunately I haven't any (added to shopping wishlist).

"Intel Corporation 82574L Gigabit Network Connection" arrived and installed
on local Salvator-X with M3-W.

> > >
> > > [...]
> > >
> > > > The failure mode looks like the PCI card is accessed while the PCI host
> > > > bridge has been suspended.
> > >
> > > Does "[PATCH v1] driver core: Fix suspend/resume order issue with
> > > deferred probe"[1] help?
> > >
> > > [1] https://lore.kernel.org/lkml/20200625032430.152447-1-saravanak@google.com/
> >
> > Even if I applied this patch, the issue still happened unfortunately.
>
> OK.
>
> I managed to reproduce it on the M3-W+ in Magnus' farm.

And on my local M3-W.

> > By the way, I'm guessing the issue is related to my environment which uses BSP's ATF.
> > According to the commit log of upstream ATF [1], PCIe hardware is possible to causes SError.
> > Unfortunately, I cannot try to update the firmware for some reasons now... I'll prepare
> > updated firmware somehow...
>
> I don't think it's firmware-related.  The issue happens in the PCI
> suspend_noirq callback, which is called during late system suspend.

You were right. It turns out the ATF on my M3-W board was two weeks too
old to have commit 0969397f295621aa ("rcar_gen3: plat: Prevent PCIe hang
during L1X config access"). Updating all firmware components to today's
versions fixed that, and both s2idle and s2ram now work fine.

I assume the same would be true for M3-W+, so case closed (for R-Car Gen3)?

> Anyone who can reproduce this on a different board, also on R-Car Gen2
> or even R-Car H1?
>
>     Intel E1000E card with CONFIG_E1000E=y
>
>     echo 0 > /sys/module/printk/parameters/console_suspend
>     echo mem > /sys/power/state

I moved the E1000E card to an R-Car Gen2 board (r8a7791/koelsch), and
s2idle crashes in a similar way:

    Unhandled fault: asynchronous external abort (0x1211) at 0x00000000
    pgd = ceadf1f8
    [00000000] *pgd=80000040004003, *pmd=00000000
    Internal error: : 1211 [#1] SMP ARM
    Modules linked in:
    CPU: 0 PID: 124 Comm: kworker/u4:6 Not tainted
5.8.0-koelsch-00539-gce07c9ba6e9f601c #867
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    Workqueue: events_unbound async_run_entry_fn
    PC is at rcar_pcie_config_access+0x10c/0x13c
    LR is at rcar_pcie_config_access+0x10c/0x13c
    pc : [<c04a4ab4>]    lr : [<c04a4ab4>]    psr: 60000093
    sp : e67b3e00  ip : 00000000  fp : 00000000
    r10: 00000000  r9 : 00000000  r8 : e7369800
    r7 : 00000000  r6 : e67b3e40  r5 : e7369640  r4 : 000000cc
    r3 : f0900000  r2 : f0900018  r1 : f0900020  r0 : 00000000
    Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
    Control: 30c5387d  Table: 648fe480  DAC: fffffffd
    Process kworker/u4:6 (pid: 124, stack limit = 0x0dcce627)
    Stack: (0xe67b3e00 to 0xe67b4000)
    ...
    [<c04a4ab4>] (rcar_pcie_config_access) from [<c04a4be0>]
(rcar_pcie_read_conf+0x28/0x80)
    [<c04a4be0>] (rcar_pcie_read_conf) from [<c048a4e0>]
(pci_bus_read_config_word+0x68/0xa8)
    [<c048a4e0>] (pci_bus_read_config_word) from [<c0490030>]
(pci_raw_set_power_state+0x18c/0x270)
    [<c0490030>] (pci_raw_set_power_state) from [<c0492e20>]
(pci_set_power_state+0x98/0xcc)
    [<c0492e20>] (pci_set_power_state) from [<c0492ea0>]
(pci_prepare_to_sleep+0x4c/0x6c)
    [<c0492ea0>] (pci_prepare_to_sleep) from [<c0496c84>]
(pci_pm_suspend_noirq+0x228/0x244)
    [<c0496c84>] (pci_pm_suspend_noirq) from [<c0509d88>]
(dpm_run_callback.part.5+0x44/0xac)
    [<c0509d88>] (dpm_run_callback.part.5) from [<c050b38c>]
(__device_suspend_noirq+0x74/0x1a4)

> Why haven't we seen this before?
> I can reproduce the issue on v5.5 (first version that supported M3-W+,
> but needs backported DTS for PCIe support) and later.

On Koelsch, I could easily reproduce this on v4.10 and later[1].

As this time no firmware is involved, I guess Linux itself needs to
become aware of this issue, and handle it in a similar way like ATF
on arm64[2]?

[1] Using shmobile_defconfig + CONFIG_NET_VENDOR_INTEL=y + CONFIG_E1000E=y.
    v4.10 needs CONFIG_PCI_MSI=y + CONFIG_PCIE_RCAR=y, too.
    Older kernels are not compatible with my Debian (systemd!) nfsroot
    userland.

[2] https://github.com/ARM-software/arm-trusted-firmware/commit/0969397f295621aa26b3d14b76dd397d22be58bf

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
