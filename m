Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9218CD8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 10:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfHNIFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 04:05:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36663 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfHNIFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 04:05:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id u15so8988901ljl.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Aug 2019 01:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y0GJOY7BAeOFfPMjXlfo8r7KlUgHKUKX2VtJRNRxITs=;
        b=J5huZ6GYCM1fAV5dtkU+qghToGYyBD6omkGTCTI38Sf6dHBLqahvgfIoJs6b5PrvHF
         lLNJupO2tDDCbGgY025Tf4oUa9r3FQnLjGG6czDOK6tCpgB1yYfB2WdJ6neFI8EL7+m0
         rHWAbv57T+k34wrYARv7zn+MzHKyT6zeqrGCEmdvv9x4uMBm/nAIgPbFUvH4/7uaeA2s
         B/R4a4n/tZonQf3tMOpoSSZi6pdD41rWDMXMZzbvQZPtJGh/jEMn+R7gEUqi56QoPWAq
         7I6G1/I+AMGSQe15CQY1XTPuJX6XhvFoLL6OpzRBpm5lF+0Cn4vrndwIEah3A7Ow7xmo
         X9GQ==
X-Gm-Message-State: APjAAAVJ2ZXPZdqZDimgLho7Qgx40XtP02a5qs3+VHAoERMK0/xU1EPT
        qRnHYhCdO++7gC9wHbIw86klJ5epgU0LJH+TSbJiOQ==
X-Google-Smtp-Source: APXvYqwa+XL/ZTbv3NuMQ0oswbBPDNRwWvgGe2Awbxvg5Xvu9v6bslwcN8EQHGAkNFwUihWlH8gsWBYGCAbYv2zHQr4=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr7351961lja.180.1565769901690;
 Wed, 14 Aug 2019 01:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190807155524.5112-1-steve.capper@arm.com> <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
 <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
 <20190813131013.vpc5a2vlxwghizxa@willie-the-truck> <CAMuHMdXr+S2QeOSEXZoGGDOB_PrgENPbVXFjS=pEfbHfvN2zhw@mail.gmail.com>
In-Reply-To: <CAMuHMdXr+S2QeOSEXZoGGDOB_PrgENPbVXFjS=pEfbHfvN2zhw@mail.gmail.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Wed, 14 Aug 2019 13:34:49 +0530
Message-ID: <CACi5LpNhh0a0ktLeDDCO4K3-mBx0D8QZ344juAzbHeP4QFtGDw@mail.gmail.com>
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
        Christoph von Recklinghausen <crecklin@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, maz@kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Will, Steve,

I still see the following issue on a 48-bit hardware (i.e. _non_
ARMv8.2 hardware) with branch 'for-next/52-bit-kva' with commit
d2d73d2fef421ca0d4 as the HEAD:

[   41.318745] Freeing initrd memory: 25856K
[   41.333312] hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 7
counters available
[   41.341818] kvm [1]: IPA Size Limit: 44bits
[   41.346131] kvm [1]: GICv3: no GICV resource entry
[   41.350908] kvm [1]: disabling GICv2 emulation
[   41.355358] kvm [1]: GIC system register CPU interface enabled
[   41.363504] kvm [1]: vgic interrupt IRQ1
[   41.370029] kvm [1]: VHE mode initialized successfully
[   41.380484] Unable to handle kernel paging request at virtual
address ffffffffffe432c8
[   41.388401] Mem abort info:
[   41.391182]   ESR = 0x96000006
[   41.394227]   Exception class = DABT (current EL), IL = 32 bits
[   41.400133]   SET = 0, FnV = 0
[   41.403176]   EA = 0, S1PTW = 0
[   41.406303] Data abort info:
[   41.409170]   ISV = 0, ISS = 0x00000006
[   41.412994]   CM = 0, WnR = 0
[   41.415949] swapper pgtable: 64k pages, 48-bit VAs, pgdp=0000000081230000
[   41.422726] [ffffffffffe432c8] pgd=0000000081890003,
pud=0000000081890003, pmd=0000000000000000
[   41.431413] Internal error: Oops: 96000006 [#1] SMP
[   41.436278] Modules linked in:
[   41.439321] CPU: 2 PID: 1357 Comm: modprobe Not tainted 5.3.0-rc3+ #1
[   41.445748] Hardware name: To be filled by O.E.M. Saber/Saber, BIOS
0ACKL025 01/18/2019
[   41.453738] pstate: 80400009 (Nzcv daif +PAN -UAO)
[   41.458520] pc : __check_object_size+0xc8/0x1f8
[   41.463037] lr : __check_object_size+0xac/0x1f8
[   41.467553] sp : ffff800031b2fcf0
[   41.470854] x29: ffff800031b2fcf0 x28: ffff009f51c1c440
[   41.476153] x27: 0000000000000000 x26: 0000000000002d29
[   41.481451] x25: ffff009f51c1c440 x24: 0000000000000018
[   41.486749] x23: 0000000000000004 x22: ffff800010cb1a19
[   41.492046] x21: 0000000000000001 x20: 0000000000000001
[   41.497344] x19: ffff800010cb1a18 x18: 0000000000000000
[   41.502641] x17: 0000000000000000 x16: 0000000000000000
[   41.507939] x15: 0000000000000000 x14: 0000000000000000
[   41.513236] x13: 0000000000000000 x12: 0000000000000000
[   41.518533] x11: 0000000000000000 x10: 0000000000000000
[   41.523831] x9 : 0000000000000000 x8 : 0000000000000000
[   41.529129] x7 : 000000003fcf0000 x6 : 0000000000000018
[   41.534426] x5 : ffff800011d22840 x4 : ffff800011d22828
[   41.539723] x3 : 0000000000000002 x2 : ffffffffffe432c0
[   41.545021] x1 : 00000000c0000000 x0 : ffffffdfffe00000
[   41.550319] Call trace:
[   41.552753]  __check_object_size+0xc8/0x1f8
[   41.556923]  filldir64+0x1e0/0x2d8
[   41.560312]  dcache_readdir+0x60/0x180
[   41.564048]  iterate_dir+0x14c/0x1a0
[   41.567609]  ksys_getdents64+0xa0/0x170
[   41.571431]  __arm64_sys_getdents64+0x28/0x38
[   41.575777]  el0_svc_handler+0xb0/0x180
[   41.579601]  el0_svc+0x8/0xc
[   41.582472] Code: b26babe0 d350fc42 f2dffbe0 8b021802 (f9400440)
[   41.588639] ---[ end trace 1e1de241f266e888 ]---
[   41.593243] Kernel panic - not syncing: Fatal exception
[   41.598477] SMP: stopping secondary CPUs
[   41.602431] Kernel Offset: disabled
[   41.605907] CPU features: 0x0002,22000c38
[   41.609902] Memory Limit: none
[   41.612967] ---[ end Kernel panic - not syncing: Fatal exception ]---

- git bisect points to 14c127c957c1c6070 as the offending patch.

- Here is a brief snippet of my .config flags enabling 48-bit VA and 52-bit PA:

CONFIG_ARM64_64K_PAGES=y
CONFIG_ARM64_VA_BITS_48=y
CONFIG_ARM64_VA_BITS=48
CONFIG_ARM64_PA_BITS_52=y
CONFIG_ARM64_PA_BITS=52

- Any idea if this is the same issue as Geert observed? Or should I
debug it further to determine the offending code in the patch pointed
to by git bisect.

Thanks,
Bhupesh

On Tue, Aug 13, 2019 at 7:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Will,
>
> On Tue, Aug 13, 2019 at 3:10 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Aug 13, 2019 at 02:43:23PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Aug 9, 2019 at 6:47 PM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, Aug 07, 2019 at 04:55:12PM +0100, Steve Capper wrote:
> > > > > This patch series adds support for 52-bit kernel VAs using some of the
> > > > > machinery already introduced by the 52-bit userspace VA code in 5.0.
> > > >
> > > > Cheers, I've pushed this out on a for-next/52-bit-kva branch with one
> > > > small patch on top and Catalin's tags added.
> > >
> > > As of commit 14c127c957c1c607 ("arm64: mm: Flip kernel VA space"), the
> > > kernel log is spammed with
> > >
> > >     virt_to_phys used for non-linear address: (____ptrval____)
> > > (__func__.6603+0x14d681/0x17fb3d)
> > >     WARNING: CPU: 0 PID: 264 at arch/arm64/mm/physaddr.c:15
> > > __virt_to_phys+0x28/0x58
> > >     Modules linked in:
> > >     CPU: 0 PID: 264 Comm: mdev Not tainted
> > > 5.3.0-rc3-rcar3-initrd-00002-g14c127c957c1c607 #38
> > >     Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
> > >     pstate: 60000005 (nZCv daif -PAN -UAO)
> > >     pc : __virt_to_phys+0x28/0x58
> > >     lr : __virt_to_phys+0x28/0x58
> > >     sp : ffffffc011953c80
> > >     x29: ffffffc011953c80 x28: ffffff8078790140
> > >     x27: 0000000000000000 x26: 0000000000000000
> > >     x25: ffffffc010a539b9 x24: ffffffc010a86000
> > >     x23: ffffffc010a539ba x22: 0000000000000001
> > >     x21: 0000000000202038 x20: 0000000000000001
> > >     x19: ffffffc010a539b9 x18: 000000000000000a
> > >     x17: 0000000000000000 x16: 0000000000000000
> > >     x15: 00000000000ca51d x14: 0720072007200720
> > >     x13: 0720072007200720 x12: 0720072007200720
> > >     x11: 0720072007200720 x10: 0720072007200720
> > >     x9 : 0720072007200720 x8 : 0000000000000001
> > >     x7 : 0000000000000007 x6 : ffffff8079824f00
> > >     x5 : 0000000000000140 x4 : 0000000000000000
> > >     x3 : 0000000000000000 x2 : 00000000ffffffff
> > >     x1 : 0713abbc9281cf00 x0 : 0000000000000000
> > >     Call trace:
> > >      __virt_to_phys+0x28/0x58
> > >      __check_object_size+0xd0/0x1e0
> > >      filldir64+0x1d8/0x2b0
> > >      kernfs_fop_readdir+0x64/0x200
> > >      iterate_dir+0x68/0x144
> > >      ksys_getdents64+0x88/0x154
> > >      __arm64_sys_getdents64+0x18/0x24
> > >      el0_svc_common.constprop.0+0x84/0xe8
> > >      el0_svc_compat_handler+0x18/0x20
> > >      el0_svc_compat+0x8/0x10
> > >     ---[ end trace 6980a45f636e18be ]---
> > >
> > > as soon as userspace starts.
> >
> > Can you try the hack I posted here, please?
> >
> > https://lkml.org/lkml/2019/8/13/555
>
> Thanks, that seems to do the trick!
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > Also, what .config are you using?
>
> Attached.
>
> Probably CONFIG_DEBUG_VIRTUAL=y is what you're missing.
>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
