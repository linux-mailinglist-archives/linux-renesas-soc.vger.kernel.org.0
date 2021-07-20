Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBDE3CFE7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbhGTPSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 11:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242541AbhGTPDN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 11:03:13 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530F2C061762
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jul 2021 08:43:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 21so19929117pfp.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jul 2021 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=pdh068ptiINg7vYsNON6+uw4KqAOssVbDMcwvukOGd0=;
        b=dpe3XWqRXAgtIdDhfs39lSEhRtVR0xEzpdUzBAQqbnUbtk19yaGCwYaYYPltQcIhaA
         WglRCqfVMuxfAI0AdKQeV45lkBvTHMiRUKOgjbca0BIWZkeQaCZ3uEn6yvotq6gP/XUL
         9ODIV7iymwfcJrCvfuJiLLu6Q4xzQEVATdFRYO3GyWm4REbYYHOsOMBQqrvIR+tWGmEA
         76vMqkk3IT48ZKlvOGfAYLNSKI+IEfwPTimCwG9xZSjh76iVONtsRdWg8tagak9hxFVT
         RxE8iIgabG5Y+MfvGU/fANMRupaTYx2BbKiJvYj58kGG7idGGRJdUi7Y2qLOd46xi5tM
         vcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=pdh068ptiINg7vYsNON6+uw4KqAOssVbDMcwvukOGd0=;
        b=sWBgeX6g+Cz2eNIraEC20NIuZx7cDflESPSk2YYM/e3gq1xtsKn5QSO5sYH1w6jpkx
         qDdAC+ygdGNwTy6Zl7OnuFWuAH9HxQKLXIsaDloasP3KYIOk1U2jnxziV53d72VMRr5j
         9IOCVOCgVRHUcw9VGiOMXhshWgAso6YlUdA7gZ5JV56PTbIi0wC66g4XbUtzn5EyMBAU
         ZO8MAGcgRRfRoN0j1kNRSYXyBV0pjnGimfYj6kcLJwmJUwK6WkHmR6iX5Jsl7NM9Xqo2
         UsSRj4wfGh45owqi2Zb1uJlYzrLu3IFTr1LB2A5+bANoViw09ec9PMqeOHvCTp/2f4ti
         ChdQ==
X-Gm-Message-State: AOAM530WIXPKqRam2ID39+oZM4tJ2NZovtW+i6wgCt91ugP0AQqMV2aj
        XDgHTWzc8Qv7hwZlRh4yHf2ULg==
X-Google-Smtp-Source: ABdhPJwpGFV02DMIWb+tUmJStYOn7WgezVWEgx5CxO0+ooG8jBYIGIW/L25sLQ9lISd1D9b0VLjeYQ==
X-Received: by 2002:aa7:9ae4:0:b029:32e:b1:78e8 with SMTP id y4-20020aa79ae40000b029032e00b178e8mr31996254pfp.46.1626795824423;
        Tue, 20 Jul 2021 08:43:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b7sm23833755pfl.195.2021.07.20.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 08:43:43 -0700 (PDT)
Date:   Tue, 20 Jul 2021 08:43:43 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jul 2021 08:43:39 PDT (-0700)
Subject:     Re: [PATCH v4 06/10] riscv: Remove non-standard linux,elfcorehdr handling
In-Reply-To: <170e7daa55aced148b8e57827f7c8fc65a0a8c7a.1626266516.git.geert+renesas@glider.be>
CC:     robh+dt@kernel.org, linux@armlinux.org.uk, nico@fluxnic.net,
        ardb@kernel.org, linus.walleij@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, mick@ics.forth.gr,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, frowand.list@gmail.com, dyoung@redhat.com,
        rppt@kernel.org, bhe@redhat.com, vgoyal@redhat.com,
        akpm@linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     geert+renesas@glider.be
Message-ID: <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 14 Jul 2021 05:50:16 PDT (-0700), geert+renesas@glider.be wrote:
> RISC-V uses platform-specific code to locate the elf core header in
> memory.  However, this does not conform to the standard
> "linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
> with the "linux,elfcorehdr" compatible value, instead of on a
> "linux,elfcorehdr" property under the "/chosen" node.
>
> The non-compliant code can just be removed, as the standard behavior is
> already implemented by platform-agnostic handling in the FDT core code.
>
> Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - No changes.
> ---
>  arch/riscv/mm/init.c | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 269fc648ef3d84b2..4aa4b6a034086df6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -829,26 +829,6 @@ static void __init reserve_crashkernel(void)
>  }
>  #endif /* CONFIG_KEXEC_CORE */
>
> -#ifdef CONFIG_CRASH_DUMP
> -/*
> - * We keep track of the ELF core header of the crashed
> - * kernel with a reserved-memory region with compatible
> - * string "linux,elfcorehdr". Here we register a callback
> - * to populate elfcorehdr_addr/size when this region is
> - * present. Note that this region will be marked as
> - * reserved once we call early_init_fdt_scan_reserved_mem()
> - * later on.
> - */
> -static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
> -{
> -	elfcorehdr_addr = rmem->base;
> -	elfcorehdr_size = rmem->size;
> -	return 0;
> -}
> -
> -RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> -#endif
> -
>  void __init paging_init(void)
>  {
>  	setup_bootmem();

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

LMK if you wanted me to take this series, otherwise I'm going to assume 
it's going in via some other tree.
