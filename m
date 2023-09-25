Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC03B7AD138
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 09:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjIYHPn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 03:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjIYHPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 03:15:41 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643E1B8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:15:32 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d865854ef96so3848423276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695626131; x=1696230931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUKabpGVYgW6P+Y98WJL/wVs6f3BlyZwdnvjcrlU8F0=;
        b=HNUQ9c4V44wvepUSbyJUphYP1Z70G+kI94cRXRbn2+mnYVLABgR9IFLi2OMjnTzcCG
         OPqyu9wMWXh4v5iJG44bSS6I91qNctfjGNtkROjkN8mkwv3h2jidMW967ZHirMk1jbGh
         hxsOvPlftq6fMKhakt4DN/LgPPHZ9btmz5uUbuDNk5vcNgCxG3RIo+LJTVAjjdgPAtIK
         QOP0qR3P8w6PVxnvF90e/q0K/z9afkFXJyT+L0iXIvXi5uA15IzIQqag3AbJIRDzLBDZ
         KUn+HzFTubnoRZqJMNzd70d+8LzPY/asHEUuRUKm+7dp1hzxYStAaPacf5MSqf7PDKuA
         e18Q==
X-Gm-Message-State: AOJu0YxergdTPInDe+GOziO1hLte9QvWtG7wStUI/1eplXnApt6Jj0fc
        S3iajm4+RM1eos3dPoFrNbTiRmWjUPV3Mw==
X-Google-Smtp-Source: AGHT+IE55PstlK/styFeHa9hAoFPTMeD6fFadvPDXniSfHjPMZBIUvyQ4SoVeC7H0HNuqhMCM9gQnw==
X-Received: by 2002:a25:d250:0:b0:d2c:32cb:c631 with SMTP id j77-20020a25d250000000b00d2c32cbc631mr4935451ybg.27.1695626131215;
        Mon, 25 Sep 2023 00:15:31 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id g72-20020a25db4b000000b00bcd91bb300esm2067989ybf.54.2023.09.25.00.15.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:15:29 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59eb8ec5e20so68867097b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:15:29 -0700 (PDT)
X-Received: by 2002:a81:9341:0:b0:569:e7cb:cd4e with SMTP id
 k62-20020a819341000000b00569e7cbcd4emr6125854ywg.48.1695626129605; Mon, 25
 Sep 2023 00:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693409184.git.geert+renesas@glider.be>
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Sep 2023 09:15:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvX9F2-Bkwkw0ihTxfuQ3C2hHK3sQTjpqMq07w2f84aw@mail.gmail.com>
Message-ID: <CAMuHMdVvX9F2-Bkwkw0ihTxfuQ3C2hHK3sQTjpqMq07w2f84aw@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is enabled
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 31, 2023 at 1:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> On Renesas ARM SoCs predating R-Car Gen3, CPU core bringup does not use
> a hardware register to program the CPU boot address directly.  Instead,
> it uses a set of registers (thus not involving the MMU) to remap any CPU
> access to the page(s) at physical address zero to the specified address
> block containing the CPU core startup code.  the MMU.  Hence when this
> is enabled, any device residing in this low part of physical address
> space cannot be accessed.  On some boards, a CFI FLASH lives there.
>
> Hence this causes conflicts between CPU onlining and FLASH operation:
>   - Reading the first page(s) of FLASH returns the CPU startup code
>     instead of the FLASH contents,
>   - CFI FLASH probing fails, as it operates on the RAM that contains the
>     CPU startup code.  Moreover, as this probing involves writes, it
>     corrupts the CPU startup code, causing any subsequent CPU onlining
>     to fail.
>
> CPU cores can be onlined in 3 places:
>   A. Secondary core bringup, during early boot (FLASH not yet in use),
>   B. Enabling secondary CPUs when resuming after s2ram (FLASH not in
>      use),
>   C. Manual CPU hotplug (at any time, FLASH may or may not be in use).
>
> Possible solutions:
>   1. Disable FLASH in SMP initialization:
>        - Simple to implement,
>        - Accessing the FLASH from Linux needs a reboot with nosmp.
>
>   2. Disable SMP when FLASH@0 is used:
>        - How to check if @0 is actually used/mapped?
>          SMP is initialized before FLASH.
>
>   3. Map core startup code only when needed:
>       - Unmap core startup code after secondary core bringup,
>       - Map/unmap core startup code during s2ram suspend/resume,
>       - Call cpu_hotplug_disable() from smp_cpus_done(),
>           - CPU hotplug is broken.
>           - How to check if @0 is actually used/mapped?
>
>   4. As this FLASH is typically used to boot the system, Marek suggested
>      to fix this in the boot loader (e.g. put a (modified) copy of the
>      CPU bringup code in FLASH).  But I think this is fragile, and cannot
>      be a generic solution, as there are other ways to boot the system,
>      and the FLASH may be used for other purposes.
>
> This patch series implements solution 1, by marking the boot area region
> reserved during SMP initialization (an alternative method would be to
> disable any device node in DT that resides in this area).  Subsequent
> probing of FLASH will fail with -EBUSY:
>
>     physmap-flash 0.flash: can't request region for resource [mem 0x00000000-0x03ffffff]
>     physmap-flash: probe of 0.flash failed with error -16
>
> When CONFIG_SMP is disabled, or when booted with "nosmp", the FLASH
> is available again.
>
> The first patch is a small cleanup in code affected by the third patch.
> The other three patches fix the issue on R-Car Gen2 (and RZ/G1), R-Car
> H1, and SH-Mobile AG5 SoCs.
>
> Other Renesas SoCs:
>   - R-Mobile APE6 is also affected, but has no upstream SMP support yet,
>   - EMMA Mobile EV2 is unaffected, as it uses internal boot ROM code
>     that watches a special general purpose register in the SMU block,
>   - RZ/N1 is not affected, as it uses a "cpu-release-addr" property in
>     DT,
>   - R-Car Gen3 is not affected, as it extended the R-Car Gen2 RST block
>     with Cortex-A53/A57 Boot Address Registers for 64-bit mode
>     (CA5[37]CPUnBAR[HL]), which control the boot address directly,
>   - R-Car Gen4 is not affected, as it has Reset Vector Base Address
>     Registers (RVBAR[HL]Cn), which control the boot address directly.
>
> This series has been tested on R-Car V2H (Blanche) and R-Car H1
> (Marzen).  With this, the CFI FLASHes on Marzen[1] and Blanche (DTS
> patch to be posted) work when booted with nosmp.
>
> Thanks for your comments!
>
> [1] "[PATCH/RFC] ARM: dts: marzen: Add FLASH node"
>     https://lore.kernel.org/r/07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be/
>
> Geert Uytterhoeven (4):
>   ARM: shmobile: rcar-gen2: Remove unneeded once handling
>   ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
>   ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
>   ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

Thanks, queuing in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
