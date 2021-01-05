Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295072EAA2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 12:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbhAELtj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 06:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbhAELti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 06:49:38 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425BAC061574;
        Tue,  5 Jan 2021 03:48:58 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id a6so2766011wmc.2;
        Tue, 05 Jan 2021 03:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Twge5+L7oDbBtb/CTAgj15ANAWokc/RBpA9QwsjgCLc=;
        b=md9SdpZcgVgmxOSVEUW+e111U5KMAb4o3553WNqmiUjxmVxGdkabEiZRP4O1oA4ozM
         WLc8ASxn+1qISaf3Y8ZbudHm00AQyYYQxADE3pGS//AMKc93nhsuS28Duj+kMtF4WnRh
         xh5AhKpJhz5olszd+7eb8BCSL1kHpz8rJ1a6zu0BthIdvdFbQL//W7aynEx1F9dHZ/Ll
         k8piotF7WFDi6o2J1dq8hWzhk5eYRUqzpT/+edW4sDFiYrbkUhIlO+Raqq2380oOcsjr
         5BIC3+/gF7yusjubUtGTt18qc2hBxrkGw0pugCs0nV2Gd13LQ4UEyNMXRW1XJ52EoG4Y
         ac/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Twge5+L7oDbBtb/CTAgj15ANAWokc/RBpA9QwsjgCLc=;
        b=Y1VTwBqUA7ifqmqUyMOImcC3ILRR9vs3vj7orUqdy/E37HYAjG9qtm0umF/q2g0CeP
         yT1JJFR5RLAlNL3I2LYidCljOaKLScWpe4/cpZBz9kzALuvxuod010UWbwfZ+hYTvkuO
         caqrOSgnG0LkHYHNKyeVnRCorubT96PD89AJTxPeNuuzAI5JsmUvEJT9hEgvKyZrzMVL
         8FstnDR1tgINn58aV/2sQ7yUGIE42njipOPm4vGwxt74HuIuWJUY86m48RipGb5UG6zj
         QrjFWBYvOuQYhT6IPeLV5xeRCnjbqqvTOF4vQIFLYiKJynOydHq1h1exhw4UqldC7JGU
         LJYw==
X-Gm-Message-State: AOAM531+lLfVxc97ktt4iAgc1qBVV1gWrOhrrUUI0A4RTqS8tOJuJ9VG
        Wi4INkqn5lORg+3ygMm8ZfU=
X-Google-Smtp-Source: ABdhPJxYxonwl7qIDdZ68yBBV0q/kPGICeSwLZseiszx1m6zzch8Q7iM+c/lTnazkDwfAgbDllfCYA==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr3174095wmi.162.1609847336485;
        Tue, 05 Jan 2021 03:48:56 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id b7sm89464727wrv.47.2021.01.05.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 03:48:55 -0800 (PST)
Date:   Tue, 5 Jan 2021 12:48:54 +0100
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: r8a77950-salvator-x does nto boot since
 cfa7ede20f133cc81cef01dc3a516dda3a9721ee arm64: set TEXT_OFFSET to 0x0 in
 preparation for removing it entirely
Message-ID: <X/RSJvFAAbGWOuK4@Red>
References: <X/Q21vZcui0RlYWK@Red>
 <CAMuHMdUW+Z4YOVnob38BV8de4S9=bP7rekNWbaT0jaH1=Ru4yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUW+Z4YOVnob38BV8de4S9=bP7rekNWbaT0jaH1=Ru4yw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Le Tue, Jan 05, 2021 at 11:13:03AM +0100, Geert Uytterhoeven a écrit :
> Hi Corentin,
> 
> On Tue, Jan 5, 2021 at 10:52 AM Corentin Labbe
> <clabbe.montjoie@gmail.com> wrote:
> > Due to DTB renaming, salvatorX was not booted since a long time in kernelCI.
> > Now the rename is handled, the board fail to boot.
> >
> > I have bisected the problem:
> 
> > # first bad commit: [cfa7ede20f133cc81cef01dc3a516dda3a9721ee] arm64: set TEXT_OFFSET to 0x0 in preparation for removing it entirely
> >
> > This is the interesting part of uboot log:
> > [    0.000292] NOTI[    0.000292] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.16
> > [    0.005855] NOTICE:  BL2: PRR is R-Car H3 Ver1.1
> > [    0.010437] NOTICE:  BL2: Board is Salvator-X Rev1.0
> > [    0.015379] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
> > [    0.020804] NOTICE:  BL2: LCM state is CM
> > [    0.024847] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=0x53
> > [    0.030891] NOTICE:  BL2: DDR1600(rev.0.27)NOTICE:  [COLD_BOOT]NOTICE:  ..0
> > [    0.066311] NOTICE:  BL2: DRAM Split is 4ch
> > [    0.070195] NOTICE:  BL2: QoS is default setting(rev.0.37)
> > [    0.075697] NOTICE:  BL2: Lossy Decomp areas
> > [    0.079872] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
> > [    0.086957] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
> > [    0.093869] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
> > [    0.100785] NOTICE:  BL2: v1.3(release):b330e0e
> > [    0.105274] NOTICE:  BL2: Built : 15:26:51, Dec  6 2017
> > [    0.110462] NOTICE:  BL2: Normal boot
> > [    0.114103] NOTICE:  BL2: dst=0xe6320208 src=0x8180000 len=512(0x200)
> > [    0.120652] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
> > [    0.127110] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
> > [    0.134336] NOTICE:  BL2: dst=0x44100000 src=0x8200000 len=524288(0x80000)
> > [    0.144816] NOTICE:  BL2: dst=0x50000000 src=0x8640000 len=1048576(0x100000)
> > U-Boot 2015.04 (Dec 06 2017 - 15:26:59)
> > CPU: Renesas Electronics R8A7795 rev 1.1
> > Board: Salvator-X
> > I2C:   ready
> > DRAM:  3.9 GiB
> > MMC:   sh-sdhi: 0, sh-sdhi: 1, sh-sdhi: 2
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   ravb
> >
> > [...]
> >
> > booti 0x48080000 0x4a000000 0x48000000
>              ^^^^^
> I take it this is the problem?
> 
> For R-Car H3 ES1.0, I currently use the addresses below:
> 
>     tftpboot 0x60000000 h3-salvator-x/Image
>     tftpboot 0x68000000 h3-salvator-x/r8a77950-salvator-x.dtb
>     booti 0x60000000 - 0x68000000
> 
> For R-Car H3 ES2.0 (and other R-Car Gen3 SoCs), I use other addresses:
> 
>     tftpboot 0x50000000 h3-salvator-xs/Image
>     tftpboot 0x58000000 h3-salvator-xs/r8a77951-salvator-xs.dtb
>     booti 0x50000000 - 0x58000000
> 
> The firmware on your H3 ES1.1 board (Rev.1.0.16) is newer than on my
> ES1.0 board (Rev.1.0.12), so it's possible the second version works on
> your board, too.
> 
> If these work for you, I'll update https://elinux.org/R-Car/Boards/Salvator-X[S]
> 

Hello

Thanks, changing kernel/dtb address made it boot.
when testing, I have also discovered that r8a7796-m3ulcb hit the same issue than the salvatorX and that thoses address made it boot.

Regards
