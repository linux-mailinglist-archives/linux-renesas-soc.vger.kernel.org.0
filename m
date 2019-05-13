Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE2F1B9A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 17:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbfEMPON (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 11:14:13 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:45654 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731146AbfEMPOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 11:14:11 -0400
Received: by mail-vk1-f194.google.com with SMTP id r23so1242187vkd.12;
        Mon, 13 May 2019 08:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqdBrYprHoaVpH4OUIGVfGDwd+Fh1C4DuEL+uT3AjMo=;
        b=rZ4GSvTe5OTR+mo3efJIAmSLnGN2FsC24bGK+ECEAYgqrZ5Tkdw71ygtwKr290C6wE
         cVBdLdo0hWuhTVE5rz9oi7li/R05S7Q6uUDWxve+Ws0EWCMBmC/xgEOl9SJRrw/GM/O2
         ygZN//qRGnZf1r8K0IHK4QCPJ9AWLUVjbbWZoSqp/9knsnLjxezAkKjNGil1xGTjgpvC
         7099F6Vig/dVEn218ll/cs2NIc/KWH9sYNwD7bQZTfNxZd02CPHtlvp1ZUSDbhLMxKqj
         48NQTarPiAZoF7ClAmGRd7lUtxcdWscZNv+0QUbXw0ArTC9QysQRXiG6rGSzjGlYjBlt
         Hz1w==
X-Gm-Message-State: APjAAAX4UM2wpqiYKWYNTUHp0twO+suqsH/2v4Am9UK+6ySMs+g0L4xR
        X6WhsZS06v3UWnzQ8wJyDGs5FtP1Z/dpt7XuHgY=
X-Google-Smtp-Source: APXvYqwdt1MOaUT+1H4Ic3RAw/WUvK0sMQpyNxRxw5Fcg3+C5rKwfYCxemkVYNV4a2cuoWMMni9ht08kX/ZxkcZWwN0=
X-Received: by 2002:a1f:62c7:: with SMTP id w190mr12505121vkb.72.1557760449913;
 Mon, 13 May 2019 08:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
 <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com> <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
In-Reply-To: <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 May 2019 17:13:56 +0200
Message-ID: <CAMuHMdWODzaHSeXyB5CgGmq3ZumFGVZYOUT1v1_Ps-RguPLseA@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory region
To:     Oleksandr <olekstysh@gmail.com>
Cc:     Julien Grall <julien.grall@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Oleksandr,

On Mon, May 13, 2019 at 4:22 PM Oleksandr <olekstysh@gmail.com> wrote:
> On 13.05.19 12:19, Julien Grall wrote:
> > On 5/10/19 5:22 PM, Oleksandr Tyshchenko wrote:
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> Don't use hardcoded address, retrieve it from device-tree instead.
> >>
> >> And besides, this patch fixes the memory error when running
> >> on top of Xen hypervisor:
> >>
> >> (XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
> >>        gpa=0x000000e6080000
> >>
> >> Which shows that VCPU0 in Dom0 is trying to access an address in memory
> >> it is not allowed to access (0x000000e6080000).
> >> Put simply, Xen doesn't know that it is a device's register memory
> >> since it wasn't described in a host device tree (which Xen parses)
> >> and as the result this memory region wasn't assigned to Dom0 at
> >> domain creation time.
> >>
> >> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> ---
> >>
> >> This patch is meant to get feedback from the community before
> >> proceeding further. If we decide to go this direction, all Gen2
> >> device-trees should be updated (add memory region) before
> >> this patch going in.
> >>
> >> e.g. r8a7790.dtsi:
> >>
> >> ...
> >> timer {
> >>     compatible = "arm,armv7-timer";
> >>     interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
> >> IRQ_TYPE_LEVEL_LOW)>,
> >>                   <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) |
> >> IRQ_TYPE_LEVEL_LOW)>,
> >>                   <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) |
> >> IRQ_TYPE_LEVEL_LOW)>,
> >>                   <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) |
> >> IRQ_TYPE_LEVEL_LOW)>;
> >> +     reg = <0 0xe6080000 0 0x1000>;
> >
> > This looks incorrect, the "arm,armv7-timer" bindings doesn't offer you
> > the possibility to specify an MMIO region. This makes sense because it
> > is meant to describe the Arch timer that is only access via
> > co-processor registers.
> >
> > Looking at the code, I think the MMIO region corresponds to the
> > coresight (based on the register name). So you may want to describe
> > the coresight in the Device-Tree.
> >
> > Also, AFAICT, the code is configuring and turning on the timer if it
> > has not been done yet. If you are here running on Xen, then you have
> > probably done something wrong. Indeed, it means Xen would not be able
> > to use the timer until Dom0 has booted. But, shouldn't newer U-boot do
> > it for you?
>
> Let me elaborate a bit more on this...
>
> Indeed, my PSCI patch series for U-Boot includes a patch [1] for
> configuring that "counter module". So, if PSCI is available
> (psci_smp_available() == true), then most likely we are running on
> PSCI-enabled
> U-Boot which, we assume, has already taken care of configuring timer (as
> well as resetting CNTVOFF). So, when running on Xen, the timer was
> configured beforehand in U-Boot, and Xen is able to use it from the very
> beginning, these is no need to wait for Dom0 to configure it.
>
> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 10000 KHz
>
> So, the code in brackets won't be called when using PSCI/running Xen,
> since the timer is already both enabled and configured:
>
> if ((ioread32(base + CNTCR) & 1) == 0 ||
>          ioread32(base + CNTFID0) != freq) {
>          /* Update registers with correct frequency */
>          iowrite32(freq, base + CNTFID0);
>          asm volatile("mcr p15, 0, %0, c14, c0, 0" : : "r" (freq));
>
>          /* make sure arch timer is started by setting bit 0 of CNTCR */
>          iowrite32(1, base + CNTCR);
> }
>
> But, the problem here is the first read access from timer register (when
> we check whether the timer requires enabling) results in hypervisor trap:
>
> (XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
> gpa=0x000000e6080000
>
> So, if the DT bindings for the counter module is not an option (if I
> correctly understood a discussion pointed by Geert in another letter),
> we should probably prevent all timer code here from being executed if
> PSCI is in use.
> What I mean is to return to [2], but with the modification to use
> psci_smp_available() helper as an indicator of PSCI usage.
>
> Julien, Geert, what do you think?

Yes, that sounds good to me.

Note that psci_smp_available() seems to return false if CONFIG_SMP=n,
so checking for that is not sufficient to avoid crashes when running a
uniprocessor kernel on a PSCI-enabled system.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
