Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8551B354
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 11:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfEMJ4R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 05:56:17 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:41304 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfEMJ4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 05:56:16 -0400
Received: by mail-vk1-f194.google.com with SMTP id l73so3141159vkl.8;
        Mon, 13 May 2019 02:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6n0wt+0bWPDOAHCR3CSBTn1zgbaoDPB3j2a6AA1LwFk=;
        b=iC0rwmAn4QvJy4sCKOmEiGzoHDNuyuXhUBHbV70FQj7CWgTIj1Acpyfii+ju1XCY6S
         ehACT3aEdxki3/+ZWlNuFkGin8xH8vurEmvsVrbFBpR/HBhjN3GjzzoXkad6ODBR4q7c
         Ur8x8aYbLkCC3AlZ5KJO8tYmOWQ5t4P5JihcxPUtuy3BMV9gkhOkeSkeXARuINFl6Yqj
         I7wwCoX+Swc5HvAj2nV/dY5PxnfbEDUQyGShp/N3fiVMdvvKreKr+hlB/Ug8ZiPNnfYT
         9VFXJ8XV/r/X02UooMk1ZgOk7RCHKIZO/KzHi31aljRt5KgtlVpraLt3mry40JGngrJ5
         +C5g==
X-Gm-Message-State: APjAAAWIFhMx36/lZxsIWiVbqxi8udqKXKC04bWphCfjWnBIJmknrqVL
        ai0zr7I/DKiLhOjPOBtWeAjY4ETFwQfexWpNDmM=
X-Google-Smtp-Source: APXvYqxS+IQ2MZO1j93M1k/ms+qzAc3D2GrDmmZ96aC9oYiLbPI/hA6b5bkq4QIfjeSKbc8YLU5Gx4oZMBFsyQ7e3A4=
X-Received: by 2002:a1f:c2c1:: with SMTP id s184mr12112728vkf.65.1557741375686;
 Mon, 13 May 2019 02:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com> <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
In-Reply-To: <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 May 2019 11:56:03 +0200
Message-ID: <CAMuHMdUR1jUwyTna5Q6xksvu1xEZKT1HPPVmMvi1YBZ1YmqhDw@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory region
To:     Julien Grall <julien.grall@arm.com>
Cc:     Oleksandr Tyshchenko <olekstysh@gmail.com>,
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

Hi Julien,

On Mon, May 13, 2019 at 11:20 AM Julien Grall <julien.grall@arm.com> wrote:
> On 5/10/19 5:22 PM, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > Don't use hardcoded address, retrieve it from device-tree instead.
> >
> > And besides, this patch fixes the memory error when running
> > on top of Xen hypervisor:
> >
> > (XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
> >        gpa=0x000000e6080000
> >
> > Which shows that VCPU0 in Dom0 is trying to access an address in memory
> > it is not allowed to access (0x000000e6080000).
> > Put simply, Xen doesn't know that it is a device's register memory
> > since it wasn't described in a host device tree (which Xen parses)
> > and as the result this memory region wasn't assigned to Dom0 at
> > domain creation time.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > ---
> >
> > This patch is meant to get feedback from the community before
> > proceeding further. If we decide to go this direction, all Gen2
> > device-trees should be updated (add memory region) before
> > this patch going in.
> >
> > e.g. r8a7790.dtsi:
> >
> > ...
> > timer {
> >       compatible = "arm,armv7-timer";
> >       interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >                             <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >                             <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >                             <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> > +      reg = <0 0xe6080000 0 0x1000>;
>
> This looks incorrect, the "arm,armv7-timer" bindings doesn't offer you
> the possibility to specify an MMIO region. This makes sense because it
> is meant to describe the Arch timer that is only access via co-processor
> registers.
>
> Looking at the code, I think the MMIO region corresponds to the
> coresight (based on the register name). So you may want to describe the
> coresight in the Device-Tree.

This is the "counter module", not the ARM v7 timer, cfr. Mark Rutland's
response in an earlier discussion about describing this in DT in
"Re: Architecture Timer on R-Car Gen2"
https://lore.kernel.org/linux-renesas-soc/20170705113335.GE25115@leverpostej/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
