Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D301A18D2EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 16:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCTPaW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 11:30:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37010 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgCTPaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 11:30:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so6871238ljd.4;
        Fri, 20 Mar 2020 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sMbKgWDf+6YEqFuP2XxJddc5yqXTRKLOZsCDJg1VmV0=;
        b=P19HlNlVFBS+M+4Xp+gMNuKDQUO6wbh1z1gjwcxlRlP2nfZSmLry7uNSfyI2ciCdXZ
         jUJX2ENK9aJIvWSHN6/5Kv4FilJOIrXnQ+ZKDlHpt65HSmrJjLThnJCKrCQKb5Ww9HeP
         HdHrLbfn+jrZ1FT7ecfHcHUSfzegepx/4EmSNhbnoLeimASVWWztxjmJe6+3HekzHmmM
         djAJEUVvO5JhIJUTHU1/l/oGLRPKNsckVGi7m3E9DyUPq2omQzZn0X7U5VWJBaBaxKBs
         Fk6cHHrYTDgbZ9jz/jGE+vqA21Cpb1MKkP4cKsFWttVRxUx8NK5zPrksafJvzT9lAtJn
         t9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sMbKgWDf+6YEqFuP2XxJddc5yqXTRKLOZsCDJg1VmV0=;
        b=LH1wIwHvC6yXqsI4A/3j+1mE4i/LeGdhL4lITrhy+MBYKwjx+cgBYpiNg6JkQ2fvxa
         kBTEPMSllqnrSa/wY6iWEJ1v6D+n7JVP525rn0k07B0ImS4F/tj6o+8H0oVtMZXS3rio
         35E3jruhXHR++l5jwlB+znj6tT9uJVWhVt7pu1xC76dAeT6k2DN7CtnCgBu6fliSEE/C
         UMmlJdGgdsDV3XXhWM4zQK2nzgYl4c0x35/hIEcDzDmIP+ibcSQyDmJ595kR9vlUCwGE
         0/K+DTlpm3JbhniBYUw2GnWUmG8i5Mzv+mEXpwSRFMiGFrBDiSG+rXP8T0nzqRU1LmbI
         YPQA==
X-Gm-Message-State: ANhLgQ2DAWM6w3CkWv4ljcDsXi8+ahYS1Z/Ung9ZAwtxEZU9iq5GIxFA
        c7/n+G2bAO7IZc92uCR6PqG13UnD
X-Google-Smtp-Source: ADFU+vsRoHNbHE8XQ+yVv2ygL69QKiTi+qXqBn2vxgHkmwVByeXyVWopVSdb2dJDnPvpzKOvsrk7Dw==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr5632511ljg.38.1584718218867;
        Fri, 20 Mar 2020 08:30:18 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id u5sm3702357lfu.69.2020.03.20.08.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 08:30:18 -0700 (PDT)
Subject: Re: [PATCH v4] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200320144348.12865-1-geert+renesas@glider.be>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <df884591-8af9-3b66-f09d-f1a4d6c6579a@gmail.com>
Date:   Fri, 20 Mar 2020 18:30:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320144348.12865-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

20.03.2020 17:43, Geert Uytterhoeven пишет:
> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
> 
> Fix this limitation by obtaining the start address from the DTB instead,
> if available (either explicitly passed, or appended to the kernel).
> Fall back to the traditional method when needed.
> 
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v4:
>   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
>     decompressor: factor out routine to obtain the inflated image
>     size"),
> 
> v3:
>   - Add Reviewed-by,
>   - Fix ATAGs with appended DTB,
>   - Add Tested-by,
> 
> v2:
>   - Use "cmp r0, #-1", instead of "cmn r0, #1",
>   - Add missing stack setup,
>   - Support appended DTB.
> ---
>  arch/arm/boot/compressed/Makefile            |  6 ++-
>  arch/arm/boot/compressed/fdt_get_mem_start.c | 52 +++++++++++++++++++
>  arch/arm/boot/compressed/head.S              | 54 +++++++++++++++++++-
>  3 files changed, 110 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c

Thank you very much! It works!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
