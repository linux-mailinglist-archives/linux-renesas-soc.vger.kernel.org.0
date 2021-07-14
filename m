Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B003C8583
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 15:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhGNNt3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 09:49:29 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:45679 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhGNNt2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 09:49:28 -0400
Received: by mail-il1-f182.google.com with SMTP id b6so1602025iln.12;
        Wed, 14 Jul 2021 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bylNDni7LUKM7pnvITfXsrZTIr6B2PAmOuvv1NHx8Os=;
        b=P4v8PyWHHHFOwzlU2Utzs6Lv5JtidYpO/wKUoPdmE5IgsQeBxcviWg8XJsio6vmGtK
         TRYg3rh6EPQBzV+yeDY2Et6TcF33dqidoxkztK2hSQdiy7/xi64DEXLcALuNem9N5JiX
         o0Dgl4H/1xp7iEpYJAuJH1QxPsRNSwb+Dloe5G+xWIsvZmtyg3Xp+yCemRp3B2jgLZsF
         8S66UdxdaO4poFuoBXLgLEKG8Mw95mH0+xVRhYJLSMhS9gDqjrT3cLLfIujzEwSKj19b
         KygcGcvYt3thvtT4yvjR30LYyDE64GKeL5xaNdk+kcrTXmH1AdOagBbZfA/VjTO7SASy
         hZFw==
X-Gm-Message-State: AOAM531joPPc+CuKm2vOT70WibT1cyPMAuPgxicja2swMgGfvZZm5BGX
        z2kXaAgo74YBnl35JmRNiw==
X-Google-Smtp-Source: ABdhPJwzly6VLXsrTTboxhXnHeZCdEuUQxDBu27t3pSa2+1X8fR4x8BA5P9eHwkkY5vz+JeKbPGq8A==
X-Received: by 2002:a92:8712:: with SMTP id m18mr6301471ild.132.1626270397009;
        Wed, 14 Jul 2021 06:46:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t8sm1178729iog.21.2021.07.14.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 06:46:36 -0700 (PDT)
Received: (nullmailer pid 2452887 invoked by uid 1000);
        Wed, 14 Jul 2021 13:46:32 -0000
Date:   Wed, 14 Jul 2021 07:46:32 -0600
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
Subject: Re: [PATCH v4 01/10] crash_dump: Make elfcorehdr_{addr,size} always
 visible
Message-ID: <20210714134632.GA2441138@robh.at.kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <0721f629d5e75b7b7e655458a63cbd767baaa409.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0721f629d5e75b7b7e655458a63cbd767baaa409.1626266516.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 14, 2021 at 02:50:11PM +0200, Geert Uytterhoeven wrote:
> Make the forward declarations of elfcorehdr_addr and elfcorehdr_size
> always available, like is done for phys_initrd_start and
> phys_initrd_size.  Code referring to these symbols can then just check
> for IS_ENABLED(CONFIG_CRASH_DUMP), instead of requiring conditional
> compilation using an #ifdef, thus preparing to increase compile
> coverage.
> 
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  include/linux/crash_dump.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> index a5192b718dbe4f9a..ad31893d13d634de 100644
> --- a/include/linux/crash_dump.h
> +++ b/include/linux/crash_dump.h
> @@ -10,13 +10,14 @@
>  
>  #include <linux/pgtable.h> /* for pgprot_t */
>  
> +/* For IS_ENABLED(CONFIG_CRASH_DUMP) */
> +extern unsigned long long elfcorehdr_addr;
> +extern unsigned long long elfcorehdr_size;
> +
>  #ifdef CONFIG_CRASH_DUMP
>  #define ELFCORE_ADDR_MAX	(-1ULL)
>  #define ELFCORE_ADDR_ERR	(-2ULL)

Seems like these could be needed and no need to hide them, so perhaps 
just move the #ifdef down.

>  
> -extern unsigned long long elfcorehdr_addr;
> -extern unsigned long long elfcorehdr_size;
> -
>  extern int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size);
>  extern void elfcorehdr_free(unsigned long long addr);
>  extern ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos);
> -- 
> 2.25.1
> 
> 
