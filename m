Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF043C858E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 15:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhGNNx6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 09:53:58 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:36748 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhGNNx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 09:53:58 -0400
Received: by mail-io1-f42.google.com with SMTP id u7so2157452ion.3;
        Wed, 14 Jul 2021 06:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=50++kkpNpej8/NTD9q8DshcKL4G56n58bwfZ59/K0OU=;
        b=GX3mMdEKxQV1DYNgjzcnv9mWui8dFHR6+5ZKd0ZfPz8RSjmWnWhw+cI3Gue3hoTgYS
         13sZA7QAWbx819BCMBFonHvTW85FZb1YX+lk7lczQvYQ7egEe6ry5VVUYhGPjMVdGApu
         vD94vFMCv4iw5Pb9EqdZvFkdTnEsJpQQ24z0rn76SLk1qSZf0MDfZavPZxjD8g36a6Mf
         OnkaVUL2AfN80o/FmySEVgoJ4ZL99CdrMG8zvlJhAtBG4bUT6DVJmYQwzgxlS3k9zLyG
         xhfGQYwj0KDWsKg5SorLVdfkmwPJqto0LCLdKRP1JtcMBEg9FYowmJrfBgh6OSyQAvQr
         tI2w==
X-Gm-Message-State: AOAM530CEAeT6v7HfV0AJ+rSvUO9imIR9KYEeKy1MczsVD5hv409g/RK
        7Rz1K1KxzAJETGNT92iwjw==
X-Google-Smtp-Source: ABdhPJz5/RWe5S4IxADEtcsCGrwyKwDJjXmmQQVnQ78apEZMiVvJE4pVvZlqoWl7Or2AdYCn9IOTUQ==
X-Received: by 2002:a02:7093:: with SMTP id f141mr8988326jac.24.1626270666077;
        Wed, 14 Jul 2021 06:51:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s2sm1323967ilq.45.2021.07.14.06.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 06:51:05 -0700 (PDT)
Received: (nullmailer pid 2459772 invoked by uid 1000);
        Wed, 14 Jul 2021 13:51:01 -0000
Date:   Wed, 14 Jul 2021 07:51:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <20210714135101.GB2441138@robh.at.kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> base address and size, describing a limited region in which memory may
> be considered available for use by the kernel.  If enabled, memory
> outside of this range is not available for use.
> 
> These variables can by filled by firmware-specific code, and used in
> calls to memblock_cap_memory_range() by architecture-specific code.
> An example user is the parser of the "linux,usable-memory-range"
> property in the DT "/chosen" node.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is similar to how the initial ramdisk (phys_initrd_{start,size})
> and ELF core headers (elfcorehdr_{addr,size})) are handled.
> 
> Does there exist a suitable place in the common memblock code to call
> "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> have to be done in architecture-specific code?

Can't you just call it from early_init_dt_scan_usablemem? If the 
property is present, you want to call it. If the property is not 
present, nothing happens.

Rob
