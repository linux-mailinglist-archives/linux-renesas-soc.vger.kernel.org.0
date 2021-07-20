Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351723CF542
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 09:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhGTGnP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 02:43:15 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:35575 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhGTGnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 02:43:14 -0400
Received: by mail-vk1-f182.google.com with SMTP id d7so4377241vkf.2;
        Tue, 20 Jul 2021 00:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHPiE5WIZuBAQynBajx7q1K/yloXb10bOcX9t96Cp50=;
        b=KnFXXyfWOahRC/OPkdwWTGas9fNO6PJ9ZCFixbTCh5msK592/viR30M8sGZSFV/wu9
         0z8hmqGYOGwgAvhpSMCUb7fopBmWPQ10DqkSWrbxJP2MnI7dqP+2x4+6HvmW135e0kaK
         xy3ISfha37xEV5RAMpx1qSzVbtWnlZ80DIcV+jYCnvKSqtdCTlm6AUhBw0BRGL4fhcvZ
         SBAxovkyilntokkenMjYq6aq+3i7Gui3U7x238ERdrXawdviPnVcKD4JTCDcJNs8L7FJ
         EyQ1Y8yik1AKO1zxjAe9hoHpSOzfw+d8mtGvFTwcBlPa11YMGSQ45T1hnnpvt8qiuDd/
         vU+g==
X-Gm-Message-State: AOAM531IqGzpA795PgZEesE8hh3dOVywbl8wTvVoVzBWaD3UyuKuREJz
        tcmQPRJ/046JYDOHQo7d/uOe/iUd+pkq+tt6mf0=
X-Google-Smtp-Source: ABdhPJxf33tE/UC6sAZ53pbsOTH+XynQf1vrWzPcAah8VYz4w/NMs8y9Z6qAKLx4GP83D3FxP9bWIDXUegsSRZB+qCI=
X-Received: by 2002:a1f:2746:: with SMTP id n67mr24782587vkn.5.1626765832884;
 Tue, 20 Jul 2021 00:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626266516.git.geert+renesas@glider.be> <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org> <YPP06QG7hfypZgYg@kernel.org>
 <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com> <YPZh/IawtmwaYccQ@kernel.org>
In-Reply-To: <YPZh/IawtmwaYccQ@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 09:23:41 +0200
Message-ID: <CAMuHMdXO2nYY252s-tOWANF4x2ch+adDx=GO5gwV6Jfw28drgA@mail.gmail.com>
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

On Tue, Jul 20, 2021 at 7:41 AM Mike Rapoport <rppt@kernel.org> wrote:
> On Mon, Jul 19, 2021 at 08:59:03AM +0200, Geert Uytterhoeven wrote:
> > On Sun, Jul 18, 2021 at 11:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> > > > On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > > > > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > > > > base address and size, describing a limited region in which memory may
> > > > > be considered available for use by the kernel.  If enabled, memory
> > > > > outside of this range is not available for use.
> > > > >
> > > > > These variables can by filled by firmware-specific code, and used in
> > > > > calls to memblock_cap_memory_range() by architecture-specific code.
> > > > > An example user is the parser of the "linux,usable-memory-range"
> > > > > property in the DT "/chosen" node.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > > > > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > > > >
> > > > > Does there exist a suitable place in the common memblock code to call
> > > > > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > > > > have to be done in architecture-specific code?
> > > >
> > > > Can't you just call it from early_init_dt_scan_usablemem? If the
> > > > property is present, you want to call it. If the property is not
> > > > present, nothing happens.
> >
> > I will have a look...
> >
> > > For memblock_cap_memory_range() to work properly it should be called after
> > > memory is detected and added to memblock with memblock_add[_node]()
> > >
> > > I'm not huge fan of adding more globals to memblock so if such ordering can
> > > be implemented on the DT side it would be great.
> >
> > Me neither ;-)
> >
> > > I don't see a way to actually enforce this ordering, so maybe we'd want to
> > > add warning in memblock_cap_memory_range() if memblock.memory is empty.

Sorry, I misread "if memblock.memory is empty" as "if capmem is empty".

> > "linux,usable-memory-range" is optional, and typically used only in
> > crashdump kernels, so it would be a bad idea to add such a warning.
>
> If I remember correctly, memblock_cap_memory_range() was added to support
> "linux,usable-memory-range" for crasdump kernels on arm64 and if it would
> be called before memory is registered we may silently corrupt the memory
> because the crash kernel will see all the memory as available.
>"
> So while WARN() maybe too much a pr_warn() seems to me quite appropriate.

Yes, makes perfect sense now.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
