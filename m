Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03503CF40E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 07:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237357AbhGTFAv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 01:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235944AbhGTFAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 01:00:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F8BA6113A;
        Tue, 20 Jul 2021 05:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626759688;
        bh=2GuyoMxAkXwIEuz4kB/1FJuahjlvs/F+Am1H8l4oZ6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LRXfAAm56gnQU5zTzJQzg6qkcSv7yw0kl4yYFk/21Z9WHHCS/YfSY1upoAtwKv5bT
         V2O7oZHWj0fOK1IGM3v79BAcuYxOjoQhqUOKopcwlgQBrVFYG0G449b4T5r51t4r2s
         npYhouHieUp13RGQWPuxEopMBsodExxP0CTY5MFrJgxjN/YwdfA01vcaOtK+AEq1Yd
         ORUPos0vJHv62sSB0+yra/zR5L77thXGC2iAERObefhp+jMpFNa8tjsBcsiHoIdhtY
         VF31HzwBbHUtc22fybXpvdYc58q6NvDcq/5I5KrSiYstSR+a3kuydNUqoSMsfU84YV
         3qV/JLV27J/DQ==
Date:   Tue, 20 Jul 2021 08:41:16 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        kexec@lists.infradead.org, Linux MM <linux-mm@kvack.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <YPZh/IawtmwaYccQ@kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
 <YPP06QG7hfypZgYg@kernel.org>
 <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Jul 19, 2021 at 08:59:03AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Sun, Jul 18, 2021 at 11:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> > On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> > > On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > > > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > > > base address and size, describing a limited region in which memory may
> > > > be considered available for use by the kernel.  If enabled, memory
> > > > outside of this range is not available for use.
> > > >
> > > > These variables can by filled by firmware-specific code, and used in
> > > > calls to memblock_cap_memory_range() by architecture-specific code.
> > > > An example user is the parser of the "linux,usable-memory-range"
> > > > property in the DT "/chosen" node.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > > > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > > >
> > > > Does there exist a suitable place in the common memblock code to call
> > > > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > > > have to be done in architecture-specific code?
> > >
> > > Can't you just call it from early_init_dt_scan_usablemem? If the
> > > property is present, you want to call it. If the property is not
> > > present, nothing happens.
> 
> I will have a look...
> 
> > For memblock_cap_memory_range() to work properly it should be called after
> > memory is detected and added to memblock with memblock_add[_node]()
> >
> > I'm not huge fan of adding more globals to memblock so if such ordering can
> > be implemented on the DT side it would be great.
> 
> Me neither ;-)
> 
> > I don't see a way to actually enforce this ordering, so maybe we'd want to
> > add warning in memblock_cap_memory_range() if memblock.memory is empty.
> 
> "linux,usable-memory-range" is optional, and typically used only in
> crashdump kernels, so it would be a bad idea to add such a warning.

If I remember correctly, memblock_cap_memory_range() was added to support
"linux,usable-memory-range" for crasdump kernels on arm64 and if it would
be called before memory is registered we may silently corrupt the memory
because the crash kernel will see all the memory as available.

So while WARN() maybe too much a pr_warn() seems to me quite appropriate.
 
-- 
Sincerely yours,
Mike.
