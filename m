Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629812EA85B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 11:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbhAEKNz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 05:13:55 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37188 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbhAEKNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 05:13:55 -0500
Received: by mail-ot1-f50.google.com with SMTP id o11so28806594ote.4;
        Tue, 05 Jan 2021 02:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7FxRYCV6zhKVl3Kp0lQUCMBSku8Ltx03LRKAXodcDA=;
        b=qmQ4H+kK2qCapORlb65rFf7n1L01/wB4UEhGAdxPWut5hcHjJwG/zHWuUDxn0nuM9u
         tqXBXVe88cTFVvb8BMaGXYFCsYZBmXl/sLHOZ5ai7Wj7SBzxAZTBATc0BeTZM33ml1Zi
         TOyPjQ4Pn/hUI90hBiSBZaquwyxn+HhihXlNQWAB7KpUvmGi64qYD7BYdgxgYiLAOfUO
         T8ySDy1y6BYGEs3J9ypeaEnJ1GwbIYowb7tA6ozLpGnAJOG43hJISQDNzzKLzmgLtM1p
         5BfWplJ+aOdN46mSWbPb9PLZNCm+TCawcPz85DlcGo/euFDkqrZR2aY5BjDkMiEySfWP
         HSTw==
X-Gm-Message-State: AOAM533C7x7u6oxWSd2cXMjyQcScu0M6W6lZtytFlTxpDWH8+mXxd1aN
        RKtJVRBZyVgBLwjsw9YCPw0Dc4wws6i/Qvo31r0=
X-Google-Smtp-Source: ABdhPJy+v/Q7If7wxhRZw96mVc65hdXc9fOIYrfUx0uwntPd54m2+l7rXEh+5QNR3abn82y4wqRT5o7A8YiIs56v668=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr55627773otc.145.1609841594206;
 Tue, 05 Jan 2021 02:13:14 -0800 (PST)
MIME-Version: 1.0
References: <X/Q21vZcui0RlYWK@Red>
In-Reply-To: <X/Q21vZcui0RlYWK@Red>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 11:13:03 +0100
Message-ID: <CAMuHMdUW+Z4YOVnob38BV8de4S9=bP7rekNWbaT0jaH1=Ru4yw@mail.gmail.com>
Subject: Re: r8a77950-salvator-x does nto boot since cfa7ede20f133cc81cef01dc3a516dda3a9721ee
 arm64: set TEXT_OFFSET to 0x0 in preparation for removing it entirely
To:     Corentin Labbe <clabbe.montjoie@gmail.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Corentin,

On Tue, Jan 5, 2021 at 10:52 AM Corentin Labbe
<clabbe.montjoie@gmail.com> wrote:
> Due to DTB renaming, salvatorX was not booted since a long time in kernelCI.
> Now the rename is handled, the board fail to boot.
>
> I have bisected the problem:

> # first bad commit: [cfa7ede20f133cc81cef01dc3a516dda3a9721ee] arm64: set TEXT_OFFSET to 0x0 in preparation for removing it entirely
>
> This is the interesting part of uboot log:
> [    0.000292] NOTI[    0.000292] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.16
> [    0.005855] NOTICE:  BL2: PRR is R-Car H3 Ver1.1
> [    0.010437] NOTICE:  BL2: Board is Salvator-X Rev1.0
> [    0.015379] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
> [    0.020804] NOTICE:  BL2: LCM state is CM
> [    0.024847] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=0x53
> [    0.030891] NOTICE:  BL2: DDR1600(rev.0.27)NOTICE:  [COLD_BOOT]NOTICE:  ..0
> [    0.066311] NOTICE:  BL2: DRAM Split is 4ch
> [    0.070195] NOTICE:  BL2: QoS is default setting(rev.0.37)
> [    0.075697] NOTICE:  BL2: Lossy Decomp areas
> [    0.079872] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
> [    0.086957] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
> [    0.093869] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
> [    0.100785] NOTICE:  BL2: v1.3(release):b330e0e
> [    0.105274] NOTICE:  BL2: Built : 15:26:51, Dec  6 2017
> [    0.110462] NOTICE:  BL2: Normal boot
> [    0.114103] NOTICE:  BL2: dst=0xe6320208 src=0x8180000 len=512(0x200)
> [    0.120652] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
> [    0.127110] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
> [    0.134336] NOTICE:  BL2: dst=0x44100000 src=0x8200000 len=524288(0x80000)
> [    0.144816] NOTICE:  BL2: dst=0x50000000 src=0x8640000 len=1048576(0x100000)
> U-Boot 2015.04 (Dec 06 2017 - 15:26:59)
> CPU: Renesas Electronics R8A7795 rev 1.1
> Board: Salvator-X
> I2C:   ready
> DRAM:  3.9 GiB
> MMC:   sh-sdhi: 0, sh-sdhi: 1, sh-sdhi: 2
> In:    serial
> Out:   serial
> Err:   serial
> Net:   ravb
>
> [...]
>
> booti 0x48080000 0x4a000000 0x48000000
             ^^^^^
I take it this is the problem?

For R-Car H3 ES1.0, I currently use the addresses below:

    tftpboot 0x60000000 h3-salvator-x/Image
    tftpboot 0x68000000 h3-salvator-x/r8a77950-salvator-x.dtb
    booti 0x60000000 - 0x68000000

For R-Car H3 ES2.0 (and other R-Car Gen3 SoCs), I use other addresses:

    tftpboot 0x50000000 h3-salvator-xs/Image
    tftpboot 0x58000000 h3-salvator-xs/r8a77951-salvator-xs.dtb
    booti 0x50000000 - 0x58000000

The firmware on your H3 ES1.1 board (Rev.1.0.16) is newer than on my
ES1.0 board (Rev.1.0.12), so it's possible the second version works on
your board, too.

If these work for you, I'll update https://elinux.org/R-Car/Boards/Salvator-X[S]

> ## Loading init Ramdisk from Legacy Image at 4a000000 ...
>    Image Name:
>    Image Type:   AArch64 Linux RAMDisk Image (uncompressed)
>    Data Size:    15809011 Bytes = 15.1 MiB
>    Load Address: 00000000
>    Entry Point:  00000000
> ERROR: Did not find a cmdline Flattened Device Tree

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
