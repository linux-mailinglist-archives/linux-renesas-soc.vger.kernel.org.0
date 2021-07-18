Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99FE3CC852
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jul 2021 11:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhGRJec (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Jul 2021 05:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhGRJeb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Jul 2021 05:34:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34BC960C3F;
        Sun, 18 Jul 2021 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626600693;
        bh=+rDFm9FsoZ08b6sGG01ofP3oHAAfan2l2sSh1XQwSR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aAJYxQFsJbdGWKQX5mdFOrV/4Mbkl/qDKVE1yIy9pxZq4HHu+AWBm7dAXBHiriHrG
         M6m8IZZlz8muKxk60d6kD7Ci0+jfD6udeh8+tb/Wjp4ehaNbxOk+whVAujiNEkYQKS
         PHKvYjq3fNIu4UVm+Z7v4s1fZPkunITPVAf1yELADkVpf4vJWy/8lOCgPU6CkkrMob
         G2A2DWUH3/st5jP+5I66EBcTvI628tSgsh/H2qXMbgg5RGPD0p0Qgg9hCd2BSvFR0S
         Mooq4W/uqRwgTonQqFVILswVYaEe6mhHurnQ/7N9BoQJY/gSkg9c01sBSpCcowA3bv
         jBJiC2NBzPWPw==
Date:   Sun, 18 Jul 2021 12:31:21 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <YPP06QG7hfypZgYg@kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714135101.GB2441138@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > base address and size, describing a limited region in which memory may
> > be considered available for use by the kernel.  If enabled, memory
> > outside of this range is not available for use.
> > 
> > These variables can by filled by firmware-specific code, and used in
> > calls to memblock_cap_memory_range() by architecture-specific code.
> > An example user is the parser of the "linux,usable-memory-range"
> > property in the DT "/chosen" node.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > 
> > Does there exist a suitable place in the common memblock code to call
> > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > have to be done in architecture-specific code?
> 
> Can't you just call it from early_init_dt_scan_usablemem? If the 
> property is present, you want to call it. If the property is not 
> present, nothing happens.

For memblock_cap_memory_range() to work properly it should be called after
memory is detected and added to memblock with memblock_add[_node]()

I'm not huge fan of adding more globals to memblock so if such ordering can
be implemented on the DT side it would be great.

I don't see a way to actually enforce this ordering, so maybe we'd want to
add warning in memblock_cap_memory_range() if memblock.memory is empty.
 
> Rob

-- 
Sincerely yours,
Mike.
