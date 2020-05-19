Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D941D93AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 11:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgESJob convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 05:44:31 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38684 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgESJoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 05:44:30 -0400
Received: by mail-oi1-f193.google.com with SMTP id j145so11766192oib.5;
        Tue, 19 May 2020 02:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rkuqfk9v0dSFtHNviTRsQ331KmGWIpp5BtZ5aSdCkiQ=;
        b=BEV/4ugp8FFZAU1mkQA+rnSUkUmuejHFV4FgIUSrWbpKlSKvc3C85o7hxxGNT2Yo8S
         HZ5IAWIs55n0ZBFWoLZEE74jPH1fuH3RXDMyTmW3cnWtWFUTxwWwqpPbe1TZEFg8W8RR
         3Rw/d32D+7BpX8Ms2mb7qnmP9qy8Zjde1/w+0myANykOyTLSNBn3JYVs5W0Mpvs0yGCv
         qmwSKa0CftFd2SS61NbTXoenN86i4cuaH3bDhDgBl8TEa+VIe0hVax1sOEYpEohgCOC/
         OTU5B8uNDGPb0qXSoKjZsybpVWRDsKtXc/naUG+2/eWEXo+5MfP90AKTIvlHkG5bvJD3
         gnDw==
X-Gm-Message-State: AOAM5301H24g8HwGyjIzo1Tsq2p4r7CPPIjX3uMWDGTiuYQV5zMoWw+k
        xoRbAyTejPzySVrhBqsEYIJd9QxBF/f2IcmC9b4=
X-Google-Smtp-Source: ABdhPJxQYDIUSsP9aca2RSoR1nUOC1fHNj6QIDMPOAbQeBaLW5c/YfMluFpfBirWsZT6mg9LxxzuwmdGpo6c7ZFQpJs=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr2557112oic.54.1589881469304;
 Tue, 19 May 2020 02:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be> <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
In-Reply-To: <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 May 2020 11:44:17 +0200
Message-ID: <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Łukasz

Thanks for your report!

On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.com> wrote:
> It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
>
> [...]
>
> Apparently reading physical memory layout from DTB breaks crashdump
> kernels. A crashdump kernel is loaded into a region of memory, that is
> reserved in the original (i.e. to be crashed) kernel. The reserved
> region is large enough for the crashdump kernel to run completely inside
> it and don't modify anything outside it, just read and dump the remains
> of the crashed kernel. Using the information from DTB makes the
> decompressor place the kernel outside of the dedicated region.
>
> The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> it is decompressed to 0x00008000 (see r4 reported before jumping from
> within __enter_kernel). If I were to suggest something, there need to be
> one more bit of information passed in the DTB telling the decompressor
> to use the old masking technique to determain kernel address. It would
> be set in the DTB loaded along with the crashdump kernel.

Shouldn't the DTB passed to the crashkernel describe which region of
memory is to be used instead? Describing "to use the old masking
technique" sounds a bit hackish to me.
I guess it cannot just restrict the /memory node to the reserved region,
as the crashkernel needs to be able to dump the remains of the crashed
kernel, which lie outside this region.
However, something under /chosen should work.

> Despite the fact the kernel is able to start and get quite far it simply
> panics (for a reason unknown to me at the moment).
>
> Kind regards,
> ŁS
>
> --8<---------------cut here---------------start------------->8---
> [   42.358349] kexec_file:__do_sys_kexec_file_load:435: kexec_file: Loading segment 0: buf=0xf1871bcb bufsz=0x52c870 mem=0x18eb8000 memsz=0x52d000
> [   42.374615] kexec_file:__do_sys_kexec_file_load:435: kexec_file: Loading segment 1: buf=0x012365f6 bufsz=0x5abf mem=0x193f6000 memsz=0x6000
> root@target:~# sync && echo c > /proc/sysrq-trigger
> [   62.206252] sysrq: Trigger a crash
> [   62.209711] Kernel panic - not syncing: sysrq triggered crash
> [   62.215548] CPU: 0 PID: 1236 Comm: bash Kdump: loaded Tainted: G        W         5.7.0-rc6-00011-gad3fbe6a883e #174
> [   62.226225] Hardware name: BCM2711
> [   62.229676] Backtrace:
> [   62.232178] [<c010bfa4>] (dump_backtrace) from [<c010c334>] (show_stack+0x20/0x24)
> [   62.239863]  r7:00000008 r6:c0b4a48d r5:00000000 r4:c0eb7b18
> [   62.245617] [<c010c314>] (show_stack) from [<c03e475c>] (dump_stack+0x20/0x28)
> [   62.252954] [<c03e473c>] (dump_stack) from [<c011e368>] (panic+0xf4/0x320)
> [   62.259941] [<c011e274>] (panic) from [<c044bb60>] (sysrq_handle_crash+0x1c/0x20)
> [   62.267536]  r3:c044bb44 r2:c57e1c21 r1:60000093 r0:c0b4a48d
> [   62.273278]  r7:00000008
> [   62.275853] [<c044bb44>] (sysrq_handle_crash) from [<c044c198>] (__handle_sysrq+0xa0/0x150)
> [   62.284334] [<c044c0f8>] (__handle_sysrq) from [<c044c620>] (write_sysrq_trigger+0x68/0x78)
> [   62.292814]  r10:00000002 r9:e9123f50 r8:00000002 r7:012f2408 r6:e9112cc0 r5:c044c5b8
> [   62.300757]  r4:00000002
> [   62.303335] [<c044c5b8>] (write_sysrq_trigger) from [<c02a7ad4>] (proc_reg_write+0x98/0xa8)
> [   62.311808]  r5:c044c5b8 r4:eb655700
> [   62.315443] [<c02a7a3c>] (proc_reg_write) from [<c023b080>] (__vfs_write+0x48/0xf4)
> [   62.323216]  r9:012f2408 r8:c02a7a3c r7:00000002 r6:e9112cc0 r5:e9123f50 r4:c0e04248
> [   62.331077] [<c023b038>] (__vfs_write) from [<c023c900>] (vfs_write+0xa8/0xcc)
> [   62.338407]  r8:e9123f50 r7:012f2408 r6:00000002 r5:00000000 r4:e9112cc0
> [   62.345211] [<c023c858>] (vfs_write) from [<c023cae0>] (ksys_write+0x78/0xc4)
> [   62.352454]  r9:012f2408 r8:e9123f5c r7:c0e04248 r6:e9123f50 r5:012f2408 r4:e9112cc0
> [   62.360316] [<c023ca68>] (ksys_write) from [<c023cb44>] (sys_write+0x18/0x1c)
> [   62.367559]  r10:00000004 r9:e9122000 r8:c0100264 r7:00000004 r6:b6edcd90 r5:012f2408
> [   62.375504]  r4:00000002
> [   62.378080] [<c023cb2c>] (sys_write) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
> [   62.385759] Exception stack(0xe9123fa8 to 0xe9123ff0)
> [   62.390889] 3fa0:                   00000002 012f2408 00000001 012f2408 00000002 00000000
> [   62.399190] 3fc0: 00000002 012f2408 b6edcd90 00000004 012f2408 00000002 00000000 00118fd8
> [   62.407488] 3fe0: 0000006c be82b7e8 b6df7010 b6e546e4
> [   62.412647] Loading crashdump kernel...
> [   62.416628] Bye!
> Uncompressing Linux... done, booting the kernel.
> r2:0x193F6000
> r4:0x00008000
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.7.0-rc6-00011-gad3fbe6a883e (l.stelmach@AMDC1062) (gcc version 8.3.0 (Debian 8.3.0-2), GNU ld (GNU Binutils for Debian) 2.31.1) #174 Tue May 19
> 09:37:10 CEST 2020

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
