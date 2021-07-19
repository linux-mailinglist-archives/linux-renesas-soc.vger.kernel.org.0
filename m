Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2483CCE28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 08:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbhGSHCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 03:02:16 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:36781 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbhGSHCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 03:02:15 -0400
Received: by mail-vs1-f42.google.com with SMTP id o19so6590054vsn.3;
        Sun, 18 Jul 2021 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NCNcBqTO22l3X4al8acu9AJJxnhiYKAu5aMxQckPxk=;
        b=esA7f/1eOryitydOtRRS2BR2NntUeAYOildsJ++BtaV2UgFY/PHnBdvTAwWx1tooj0
         aVU0i9faVWu5HTcdmu5cCFk+I95yrKdLCepWeDBRX9zWmUW6YOUmUXts6VkcngduORQm
         q392loYQcBcBvoatdfPz7OMjqTnlOJhPq6Fij5skcdi1opoNWY4/2YhHS5Br9U5ZjmFL
         5v3tHRa9+I8DmzmKB5/ggXW5+jxQS9KM/yqh3caTwAUwV1RkqdQNXRhU2ewUVL4VnzIj
         MileSrc5+XgSG58dE1L7JlD0qpEJ4VZD70Dw8Fz/UkFLIPQaM0hX/v6HKmdYqGAKPqgY
         jHLQ==
X-Gm-Message-State: AOAM533buOuzs17GPI1hr9h/ZAKOezUsx3Nmn+HkLLRGnBhnp321A+XP
        /J6tNmbhqeE2xtdRzsUEgrv9YZZQu8hmm8Pm554=
X-Google-Smtp-Source: ABdhPJy9IdyG2rKF5NzGOGN5xKqJm9bCibQ2pE0G8Vx99QZGQQJXSZ4tsUqw9Paisv+zNMq8pJZfaQ8xGb9dpSkzbrs=
X-Received: by 2002:a67:1542:: with SMTP id 63mr23590649vsv.40.1626677954982;
 Sun, 18 Jul 2021 23:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626266516.git.geert+renesas@glider.be> <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org> <YPP06QG7hfypZgYg@kernel.org>
In-Reply-To: <YPP06QG7hfypZgYg@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Jul 2021 08:59:03 +0200
Message-ID: <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory limitation
To:     Mike Rapoport <rppt@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mike,

On Sun, Jul 18, 2021 at 11:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> > On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > > base address and size, describing a limited region in which memory may
> > > be considered available for use by the kernel.  If enabled, memory
> > > outside of this range is not available for use.
> > >
> > > These variables can by filled by firmware-specific code, and used in
> > > calls to memblock_cap_memory_range() by architecture-specific code.
> > > An example user is the parser of the "linux,usable-memory-range"
> > > property in the DT "/chosen" node.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > >
> > > Does there exist a suitable place in the common memblock code to call
> > > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > > have to be done in architecture-specific code?
> >
> > Can't you just call it from early_init_dt_scan_usablemem? If the
> > property is present, you want to call it. If the property is not
> > present, nothing happens.

I will have a look...

> For memblock_cap_memory_range() to work properly it should be called after
> memory is detected and added to memblock with memblock_add[_node]()
>
> I'm not huge fan of adding more globals to memblock so if such ordering can
> be implemented on the DT side it would be great.

Me neither ;-)

> I don't see a way to actually enforce this ordering, so maybe we'd want to
> add warning in memblock_cap_memory_range() if memblock.memory is empty.

"linux,usable-memory-range" is optional, and typically used only in
crashdump kernels, so it would be a bad idea to add such a warning.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
