Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4FF3E8B90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 10:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhHKIMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 04:12:10 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:45756 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhHKIMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 04:12:09 -0400
Received: by mail-vs1-f51.google.com with SMTP id a1so947704vsd.12;
        Wed, 11 Aug 2021 01:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tz0+jEgIobQjuTow/ARUuugSs1kLubTzwy0T9ZLI9hU=;
        b=fe+PFcMlNn5jjkw3HuZIgBmrfHqI3ogLbui4oymkdMtgrd6H7NXENRIIRJpNL0BINs
         MeinDJ8afMnFXErb3oRlLcT5ah2lnm1EcsNrrOQI9CXqlZe96a8Cl0mdqaxiiNkUHGXn
         /prN/GZI1kwZQFQtOX9IlSGCukMi8gAmCI6XyT6g9YII12U3h5QB6Ikbm8rBru2mY6LA
         rJAEJ7k/tNIq6lVBudpDcAK48QeCRCXf7X/SnbUFCCEvM2k3RocPQsgQel/m4E+cFRmH
         29yJhnMuYIxGmZt2hK8EnWCIp246of5TqYVM6IumYUaHy8YdUI7tlqwmWhZAhaAcn9TS
         Rqog==
X-Gm-Message-State: AOAM532WqA4lOw63DZFKP1SgRnXUWhUjOHvV+2GwuqIwTLXZhyXktU16
        hsWM8hoshuVhTHjhmqRz7feYA4BRMeDjUX7prd0=
X-Google-Smtp-Source: ABdhPJyQYdEzQ87d4q8Gjh5OGWc3XIzYeTLsfNGD+TMt1AWgMT8WjUJws7odP2IIw+RmtCkRDyil2IHyZbu6KAbZAGY=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr17470575vsk.40.1628669506037;
 Wed, 11 Aug 2021 01:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626266516.git.geert+renesas@glider.be> <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
In-Reply-To: <20210714135101.GB2441138@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 10:11:34 +0200
Message-ID: <CAMuHMdVRPpHudj2svs_TYP9=GYkWFtJrG_+BHA7A+TVPdQ92aQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory limitation
To:     Rob Herring <robh@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
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
        Dave Young <dyoung@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
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

On Wed, Jul 14, 2021 at 3:51 PM Rob Herring <robh@kernel.org> wrote:
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

Seems to work fine when called from early_init_dt_scan_nodes().
Hence v5 will no longer need to touch memblock.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
