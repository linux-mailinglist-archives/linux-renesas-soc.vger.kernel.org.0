Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986111D929E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 10:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgESIyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 04:54:08 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53060 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728419AbgESIyH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 04:54:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200519085404euoutp0288233abf7df3cd4115df119368bbbde6~QYgWoPY_A0337903379euoutp02g;
        Tue, 19 May 2020 08:54:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200519085404euoutp0288233abf7df3cd4115df119368bbbde6~QYgWoPY_A0337903379euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589878444;
        bh=3JaDDwepjp5b5eOtdATnyvFbsIs/b0zSeP+ctxwa7wA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PVB4aw1zNuXYFvlc6Ikw1QrG6CfZ5CJaexCGut55gb55hwUpokEx2g6pqPJ74oj0y
         r49EP94CcfDMFOiM6F7iNz2ScDugAbRw8wG7wXWfxtxxma6mNpVFEKnQu/yALMP1ks
         aK0gvq8FW5PI6lCIghoYUguMom3QScaqznrEn4ho=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200519085404eucas1p2fa9f18b0c2d2b7ea20f2919a0b855d3c~QYgWaAAcD2006120061eucas1p2r;
        Tue, 19 May 2020 08:54:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.0E.61286.CAE93CE5; Tue, 19
        May 2020 09:54:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200519085404eucas1p2b916b0c8ad20c1fda8d196d19debb849~QYgWAbEAR1999019990eucas1p2v;
        Tue, 19 May 2020 08:54:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200519085404eusmtrp23f0997b8f4303c86d9f29f545be4724f~QYgV-mfOe2559225592eusmtrp2h;
        Tue, 19 May 2020 08:54:04 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-b1-5ec39eacf306
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2D.80.08375.CAE93CE5; Tue, 19
        May 2020 09:54:04 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200519085403eusmtip245ccf2b89eee8f1c3f6b20cb5ff2cd0c~QYgVt4ev41112511125eusmtip2s;
        Tue, 19 May 2020 08:54:03 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
Date:   Tue, 19 May 2020 10:53:52 +0200
In-Reply-To: <20200429082120.16259-1-geert+renesas@glider.be> (Geert
        Uytterhoeven's message of "Wed, 29 Apr 2020 10:21:20 +0200")
Message-ID: <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGczrTmaFSvLaoJ2jUNBpcAuISHXeJPowxGuXBqIlKxUlRaUva
        gktiaDRuaBWKCxYBF1QsAlpZhIDRYkTjgkqCiBKlGC2goIK4onYcTHz77v3/859zbi5HaQ4w
        YdxGk020mPQJOkZFl93+VhdxKadmbdTHO2P4bz1dwPc5b7P8lcxiJZ973EHzBR9bgXeXV1N8
        dpYTeE9rg5KvrzzJ8KVtnQree7Qa+MJbzSzf8qpRyef4/Qz/PD0D5g8U6hseU8KP704Q3tzZ
        ywjpDyKEClczK3jc+xnhal6K4NjVyQiH+6KE3vvptHCoxA1Ct2fEsuDVqtkbxISNyaJl4txY
        Vbyv6jmb+DBm64XdmWAH+8JUCOKQTMXc9x1sKqg4DckHvHSuViEJGtIDeN43Xxa6AT/05in+
        VZz72gmycAGwpalbIR/eAuZ1+JSpwHEMicTCwpVSQSiJwtK6N4zkoUgNjdfLe0AStGQxtnZ4
        KYlpMgbLLtdQkimI7AIscz0DKUhNpqOjeIHkGUxmYIn/JSuxmgzCuyde0xJTxIgn6t79nQhJ
        FYdnDrj7R12ImRePKGXWYnttCSvzcPxdkauQ8pGkYIZzmlx7MND35Fda9szCFw+/MzJH4/3e
        HFb2h2Dj+0Fy3xB0lh2n5Gs17tujkd2jsehwVX9KGDra80FmAd9VPOt/6jRA79lXijQY5fpv
        Hdd/67gCsRQZh8WVE+XrCXj+dAcl8xwsKuqiT4HSDUPFJKvRIFonmcQtkVa90ZpkMkTGmY0e
        CHzLe79qP12Dz0/We4FwoAtWx5q9azVKfbJ1m9ELowNJvssFjyCMNplNoi5UneYPyOoN+m3b
        RYt5nSUpQbR6YRhH64aqp5xpW6MhBr1N3CyKiaLln6rggsLskJ/8dHy77dbskRPuDdb+KNLY
        6iuHVByamVFvC5nXtimxKXX52ETtda1jb19B9qLsI9mG6uafO1KOzQzPim7sm+JrmRddHbP0
        hj1atTgubZTnw8sVTTMq48N3LDEUTjUbX0//vdMevnpVjY5tuDnAN/lKaKw/uCvGtU9cFf6Z
        /5L19lGrjrbG6yeNpyxW/R9OiLe9ngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3e3U1z9GtN/LEgbBRR4tVptt9MRUrqQgRi/0T5GnrR0G1y
        7wwNIqOikiyfZPNdPnA23860olpmimWaKZXZQ0snhlpZZGq0OQL/O5zP53zhcI6YkJ4XysUn
        dAaW02mSFZQr2ff36Xvv26WPo33NV0i8uDAH8Eputwg3FTYIcdn1LBLXfZsA2NR+n8AlRbkA
        N0+MCPFQZzGF26ZnBdhacB9gc9eYCH/6+FqIS202Co/m5IHQDczQyCDBLP3JBcxkz0WKyXnu
        zXQYx0RMs+kyxbRUnmGyzs1SzLUVX+bXsxySudpqAsyP5i3hbsfoIE6famA9E/W8IVhxXIn9
        aKUa03671bTSXxUV6Beg8AkJimeTT5xkOZ+QWDpx/N6oKKU/Iq3mQiHIABlhmcBFjOBuVPV7
        FmQCV7EUVgFUWtgmygRiO5Cj2pIEp7MJLY9kUk7nC0CVEzaBw6Egjczmow5HBn1R24vJVYeA
        vSSqaF8UOcAmeAhNzFgJ53A2QNZbHwUOQMLtyNL4eBW4wHMAWYxvgCNVAlUoq2G/w3GHatRq
        +7AaJIEbUe+Nz6SjJmAS+lk3RWQDaFyDjGuQ0Z5EwJ2oodPH2fZC1RUzhLMORvX1c2Q5EJqA
        jE3ltQlaXknzGi2fqkug4/TaZmC/uqV7seUOeNl0xAqgGCjcJLF6a7RUqDnJp2utYJs9Zryx
        bgDISZ1exypkkmybHUviNemnWE4fw6Ums7wVBNj3zCHk7nF6+z/pDDHKAKUKq5Uqf5X/Hqzw
        kFyCjyKlMEFjYJNYNoXl/s8JxC7yDOC3a2mF5gZOt211kaVpRwPrwhci+z8VW1zXlS1jXejD
        wajhDpN6c0iPpWLP94NkdVm1xBzfE5lfGoyH846q4x5MLam8/ReWs9bPU2Fdd5n2nwe65Gdr
        +grenQ47LJiP+Cp6mz8d7V71uTuWe3UzttxW65XSKt7r8WTec1/U26IdCpJP1Ch3ERyv+Qdc
        aT6zFwMAAA==
X-CMS-MailID: 20200519085404eucas1p2b916b0c8ad20c1fda8d196d19debb849
X-Msg-Generator: CA
X-RootMTR: 20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
        <20200429082120.16259-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-04-29 =C5=9Bro 10:21>, when Geert Uytterhoeven wrote:
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
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---

[...]

Apparently reading physical memory layout from DTB breaks crashdump
kernels. A crashdump kernel is loaded into a region of memory, that is
reserved in the original (i.e. to be crashed) kernel. The reserved
region is large enough for the crashdump kernel to run completely inside
it and don't modify anything outside it, just read and dump the remains
of the crashed kernel. Using the information from DTB makes the
decompressor place the kernel outside of the dedicated region.

The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
it is decompressed to 0x00008000 (see r4 reported before jumping from
within __enter_kernel). If I were to suggest something, there need to be
one more bit of information passed in the DTB telling the decompressor
to use the old masking technique to determain kernel address. It would
be set in the DTB loaded along with the crashdump kernel.

Despite the fact the kernel is able to start and get quite far it simply
panics (for a reason unknown to me at the moment).

Kind regards,
=C5=81S

=2D-8<---------------cut here---------------start------------->8---
[   42.358349] kexec_file:__do_sys_kexec_file_load:435: kexec_file: Loading=
 segment 0: buf=3D0xf1871bcb bufsz=3D0x52c870 mem=3D0x18eb8000 memsz=3D0x52=
d000
[   42.374615] kexec_file:__do_sys_kexec_file_load:435: kexec_file: Loading=
 segment 1: buf=3D0x012365f6 bufsz=3D0x5abf mem=3D0x193f6000 memsz=3D0x6000
root@target:~# sync && echo c > /proc/sysrq-trigger
[   62.206252] sysrq: Trigger a crash
[   62.209711] Kernel panic - not syncing: sysrq triggered crash
[   62.215548] CPU: 0 PID: 1236 Comm: bash Kdump: loaded Tainted: G        =
W         5.7.0-rc6-00011-gad3fbe6a883e #174
[   62.226225] Hardware name: BCM2711
[   62.229676] Backtrace:
[   62.232178] [<c010bfa4>] (dump_backtrace) from [<c010c334>] (show_stack+=
0x20/0x24)
[   62.239863]  r7:00000008 r6:c0b4a48d r5:00000000 r4:c0eb7b18
[   62.245617] [<c010c314>] (show_stack) from [<c03e475c>] (dump_stack+0x20=
/0x28)
[   62.252954] [<c03e473c>] (dump_stack) from [<c011e368>] (panic+0xf4/0x32=
0)
[   62.259941] [<c011e274>] (panic) from [<c044bb60>] (sysrq_handle_crash+0=
x1c/0x20)
[   62.267536]  r3:c044bb44 r2:c57e1c21 r1:60000093 r0:c0b4a48d
[   62.273278]  r7:00000008
[   62.275853] [<c044bb44>] (sysrq_handle_crash) from [<c044c198>] (__handl=
e_sysrq+0xa0/0x150)
[   62.284334] [<c044c0f8>] (__handle_sysrq) from [<c044c620>] (write_sysrq=
_trigger+0x68/0x78)
[   62.292814]  r10:00000002 r9:e9123f50 r8:00000002 r7:012f2408 r6:e9112cc=
0 r5:c044c5b8
[   62.300757]  r4:00000002
[   62.303335] [<c044c5b8>] (write_sysrq_trigger) from [<c02a7ad4>] (proc_r=
eg_write+0x98/0xa8)
[   62.311808]  r5:c044c5b8 r4:eb655700
[   62.315443] [<c02a7a3c>] (proc_reg_write) from [<c023b080>] (__vfs_write=
+0x48/0xf4)
[   62.323216]  r9:012f2408 r8:c02a7a3c r7:00000002 r6:e9112cc0 r5:e9123f50=
 r4:c0e04248
[   62.331077] [<c023b038>] (__vfs_write) from [<c023c900>] (vfs_write+0xa8=
/0xcc)
[   62.338407]  r8:e9123f50 r7:012f2408 r6:00000002 r5:00000000 r4:e9112cc0
[   62.345211] [<c023c858>] (vfs_write) from [<c023cae0>] (ksys_write+0x78/=
0xc4)
[   62.352454]  r9:012f2408 r8:e9123f5c r7:c0e04248 r6:e9123f50 r5:012f2408=
 r4:e9112cc0
[   62.360316] [<c023ca68>] (ksys_write) from [<c023cb44>] (sys_write+0x18/=
0x1c)
[   62.367559]  r10:00000004 r9:e9122000 r8:c0100264 r7:00000004 r6:b6edcd9=
0 r5:012f2408
[   62.375504]  r4:00000002
[   62.378080] [<c023cb2c>] (sys_write) from [<c0100060>] (ret_fast_syscall=
+0x0/0x54)
[   62.385759] Exception stack(0xe9123fa8 to 0xe9123ff0)
[   62.390889] 3fa0:                   00000002 012f2408 00000001 012f2408 =
00000002 00000000
[   62.399190] 3fc0: 00000002 012f2408 b6edcd90 00000004 012f2408 00000002 =
00000000 00118fd8
[   62.407488] 3fe0: 0000006c be82b7e8 b6df7010 b6e546e4
[   62.412647] Loading crashdump kernel...
[   62.416628] Bye!
Uncompressing Linux... done, booting the kernel.
r2:0x193F6000
r4:0x00008000
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.7.0-rc6-00011-gad3fbe6a883e (l.stelmach@AMDC=
1062) (gcc version 8.3.0 (Debian 8.3.0-2), GNU ld (GNU Binutils for Debian)=
 2.31.1) #174 Tue May 19
09:37:10 CEST 2020
[    0.000000] CPU: ARMv7 Processor [410fd083] revision 3 (ARMv7), cr=3D10c=
5383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction ca=
che
[    0.000000] OF: fdt: Machine model: Raspberry Pi 4 Model B
[    0.000000] earlycon: uart8250 at MMIO32 0xfe215040 (options '')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] Memory policy: Data cache writeback
[    0.000000] Reserved memory: created CMA memory pool at 0x04000000, size=
 64 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id =
shared-dma-pool
[    0.000000] 8<--- cut here ---
[    0.000000] Unable to handle kernel paging request at virtual address d9=
3f6000
[    0.000000] pgd =3D (ptrval)
[    0.000000] [d93f6000] *pgd=3D00000000
[    0.000000] Internal error: Oops: 5 [#1] ARM
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc6-00011-gad3=
fbe6a883e #174
[    0.000000] Hardware name: BCM2711
[    0.000000] PC is at fdt32_ld+0xc/0x18
[    0.000000] LR is at fdt_check_header+0x14/0x15c
[    0.000000] pc : [<c03e4b10>]    lr : [<c03e4c24>]    psr: a00000d3
[    0.000000] sp : c0e01ed8  ip : c0e01ee8  fp : c0e01ee4
[    0.000000] r10: c3ffff40  r9 : c0e2e4f4  r8 : 00000000
[    0.000000] r7 : c0f5b35c  r6 : d93f6000  r5 : c0e085d0  r4 : c0d25510
[    0.000000] r3 : d93f6000  r2 : c0f5b35c  r1 : 00000000  r0 : d93f6000
[    0.000000] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segme=
nt none
[    0.000000] Control: 10c5383d  Table: 00004059  DAC: 00000051
[    0.000000] Process swapper (pid: 0, stack limit =3D 0x(ptrval))
[    0.000000] Stack: (0xc0e01ed8 to 0xc0e02000)
[    0.000000] 1ec0:                                                       =
c0e01f04 c0e01ee8
[    0.000000] 1ee0: c03e4c24 c03e4b10 c0d25510 c0e085d0 d93f6000 c0f5b35c =
c0e01f2c c0e01f08
[    0.000000] 1f00: c05f7d94 c03e4c1c c0d25510 c0e085d0 07ffffff 00000000 =
c0f4c580 c0e2e4f4
[    0.000000] 1f20: c0e01f4c c0e01f30 c0d26a54 c05f7ccc 00000000 c0e01f40 =
c0123458 c0d2ff08
[    0.000000] 1f40: c0e01fa4 c0e01f50 c0d03c18 c0d26a28 ffffffff 10c5383d =
c0d0d244 c0e04248
[    0.000000] 1f60: c0b11587 c09000e7 c0e01f94 c0e01f78 c01580e4 00000000 =
c0e01f9c c0d00330
[    0.000000] 1f80: c0e04248 c0e04240 ffffffff 193f6000 c0eb77fc 10c53c7d =
c0e01ff4 c0e01fa8
[    0.000000] 1fa0: c0d00b5c c0d035a4 00000000 00000000 00000000 00000000 =
00000000 c0d31a30
[    0.000000] 1fc0: 00000000 00000000 00000000 c0d00330 00000051 10c03c7d =
ffffffff 193f6000
[    0.000000] 1fe0: 410fd083 10c53c7d 00000000 c0e01ff8 00000000 c0d00b08 =
00000000 00000000
[    0.000000] Backtrace:
[    0.000000] [<c03e4b04>] (fdt32_ld) from [<c03e4c24>] (fdt_check_header+=
0x14/0x15c)
[    0.000000] [<c03e4c10>] (fdt_check_header) from [<c05f7d94>] (__unflatt=
en_device_tree+0xd4/0x284)
[    0.000000]  r7:c0f5b35c r6:d93f6000 r5:c0e085d0 r4:c0d25510
[    0.000000] [<c05f7cc0>] (__unflatten_device_tree) from [<c0d26a54>] (un=
flatten_device_tree+0x38/0x54)
[    0.000000]  r9:c0e2e4f4 r8:c0f4c580 r7:00000000 r6:07ffffff r5:c0e085d0=
 r4:c0d25510
[    0.000000] [<c0d26a1c>] (unflatten_device_tree) from [<c0d03c18>] (setu=
p_arch+0x680/0xabc)
[    0.000000]  r4:c0d2ff08
[    0.000000] [<c0d03598>] (setup_arch) from [<c0d00b5c>] (start_kernel+0x=
60/0x500)
[    0.000000]  r10:10c53c7d r9:c0eb77fc r8:193f6000 r7:ffffffff r6:c0e0424=
0 r5:c0e04248
[    0.000000]  r4:c0d00330
[    0.000000] [<c0d00afc>] (start_kernel) from [<00000000>] (0x0)
[    0.000000]  r10:10c53c7d r9:410fd083 r8:193f6000 r7:ffffffff r6:10c03c7=
d r5:00000051
[    0.000000]  r4:c0d00330
[    0.000000] Code: c03e49d0 e1a0c00d e92dd800 e24cb004 (e5900000)
[    0.000000] random: get_random_bytes called from init_oops_id+0x30/0x4c =
with crng_init=3D0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the i=
dle task! ]---
=2D-8<---------------cut here---------------end--------------->8---


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl7DnqAACgkQsK4enJil
gBDdBAgAkYGcbst4fch5FCBWEjA9YFKnATGN5PZYL9giYIuiqyOQEVXlc/s1EOK9
wXtfhjT/YrKMMPTcJcIYXcEuotdtM5I4Ez7z0SnHz9R5hPAub7krn3K3k4yjmWMv
vghv8AxGBiomWnpB6evM6NENPR1+dDWxMb1B3/mvce3aCqlPKLu3dLVn0zN9pDDC
QZZeWvHQN/SpHJfRXM/B10tKOLrJwNv7Puw2yBREfqfSE55CSjNEKFe8NRKemvzI
KeV+d3NGjkc1GpZUk+TxONPAZ+UsAiFttOQ3iP9Z6gy9yV7WoLF98D7TcxMX1T4W
XUvD6CtP+vrTDC+2kG09knMxOV+b+Q==
=3Qe0
-----END PGP SIGNATURE-----
--=-=-=--
