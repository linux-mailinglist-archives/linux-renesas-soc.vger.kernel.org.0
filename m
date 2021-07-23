Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B103D3C49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 17:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhGWOgv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 10:36:51 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:43657 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbhGWOgs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 10:36:48 -0400
Received: by mail-ua1-f44.google.com with SMTP id j7so630100uaj.10;
        Fri, 23 Jul 2021 08:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sie/IxwBmILJtt5CfCHMRTqh7diZyseV1fFMGEm6yOk=;
        b=jG9SlZxIK86OiLf8r0t4+8AL7Dk/UjURdCBdfQwLKoD9bRvI8B+7T17A0evZ1P133Y
         hLb/9vYPMAX4IHlS9xWUCnJc2cRPKeAiS05LPjkUvsbNDVJL9SlVla5hIJ0w/GVmxpPm
         JCFIhSLOFgDLt5Q6Y5Clx6pQMwQP8t20rYTMsrIYxRXw5Ok9AgVCvJRlhGNkIi7clO3e
         zFyHjgmqOOpkzn6x+AJRJvxRBHYX/o9ux2GyQMirhOa3SaGkFeDISWU2DO6a1ECcJqr1
         mtah0lJtj66ctsHozaxhs/0hmC90K4eAaSsAzEa1eRi1WcvsjhbGmG8Y22sCuRRPMREq
         C0xw==
X-Gm-Message-State: AOAM533jwx5k+xexiVUvE9J5tyYwZo0Xx5nB7/mEjn5Om9Zd17rae3cU
        xGiPIIpJbhBNtTQuDKzYgNQIpNGrLFeYIP/HBd4=
X-Google-Smtp-Source: ABdhPJwjie6QeabkOjY7IEyTELcNhWlJ1IBBcsCliDIJ6B3GHGV6iAk2cW/JLMoH9H/oEu8zcHMlVqite6WQsRrTwGc=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr5059882uan.58.1627053440203;
 Fri, 23 Jul 2021 08:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <170e7daa55aced148b8e57827f7c8fc65a0a8c7a.1626266516.git.geert+renesas@glider.be>
 <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
In-Reply-To: <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jul 2021 17:17:08 +0200
Message-ID: <CAMuHMdUaQW_edTRAiLb8u+=UoVNkSsgedMVTt8=qPPQ59hrfmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] riscv: Remove non-standard linux,elfcorehdr handling
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
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

Hi Palmer,

On Tue, Jul 20, 2021 at 5:43 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 14 Jul 2021 05:50:16 PDT (-0700), geert+renesas@glider.be wrote:
> > RISC-V uses platform-specific code to locate the elf core header in
> > memory.  However, this does not conform to the standard
> > "linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
> > with the "linux,elfcorehdr" compatible value, instead of on a
> > "linux,elfcorehdr" property under the "/chosen" node.
> >
> > The non-compliant code can just be removed, as the standard behavior is
> > already implemented by platform-agnostic handling in the FDT core code.
> >
> > Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - No changes.
> > ---
> >  arch/riscv/mm/init.c | 20 --------------------
> >  1 file changed, 20 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 269fc648ef3d84b2..4aa4b6a034086df6 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -829,26 +829,6 @@ static void __init reserve_crashkernel(void)
> >  }
> >  #endif /* CONFIG_KEXEC_CORE */
> >
> > -#ifdef CONFIG_CRASH_DUMP
> > -/*
> > - * We keep track of the ELF core header of the crashed
> > - * kernel with a reserved-memory region with compatible
> > - * string "linux,elfcorehdr". Here we register a callback
> > - * to populate elfcorehdr_addr/size when this region is
> > - * present. Note that this region will be marked as
> > - * reserved once we call early_init_fdt_scan_reserved_mem()
> > - * later on.
> > - */
> > -static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
> > -{
> > -     elfcorehdr_addr = rmem->base;
> > -     elfcorehdr_size = rmem->size;
> > -     return 0;
> > -}
> > -
> > -RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> > -#endif
> > -
> >  void __init paging_init(void)
> >  {
> >       setup_bootmem();
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> LMK if you wanted me to take this series, otherwise I'm going to assume
> it's going in via some other tree.

There will be a v5 of the series in response to the review comments.
But I think this patch can already be applied.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
