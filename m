Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2AE1122EC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 15:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbfLQOaa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 09:30:30 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53164 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728896AbfLQOaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 09:30:30 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D977A3C00BB;
        Tue, 17 Dec 2019 15:30:26 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3Vhf28cP6kOK; Tue, 17 Dec 2019 15:30:21 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CEA7B3C057F;
        Tue, 17 Dec 2019 15:30:21 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 15:30:21 +0100
Date:   Tue, 17 Dec 2019 15:30:21 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a77961: Add SDHI nodes
Message-ID: <20191217143021.GE27250@vmlxhi-102.adit-jv.com>
References: <20191216124740.16647-1-geert+renesas@glider.be>
 <20191216124740.16647-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216124740.16647-7-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 16, 2019 at 01:47:40PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the SDHI Interfaces on the Renesas R-Car M3-W+
> (r8a77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> 
> Test procedure (eMMC):
>   1. "hd /dev/mmcblk0boot1".
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 39 +++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

[Unrelated to this patch/series] Building the kernel image on your
topic/r8a77961-extra-v2 branch and booting the M3-W+ Salvator-XS target
from MMC, I get a panic [1]. Fortunately, this is already fixed by
7de7de7ca0ae0f ("Fix root mounting with no mount options")

[1] panic booting from SD card (KASAN=y)
[    8.825749] Waiting for root device /dev/mmcblk1p2...
[    8.909815] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    8.936963] mmcblk1: mmc1:aaaa SL32G 29.7 GiB 
[    8.997913]  mmcblk1: p1 p2 p3 < p5 p6 p7 >
[    9.067410] ==================================================================
[    9.075652] BUG: KASAN: null-ptr-deref in strncpy+0x4c/0x6c
[    9.081862] Read of size 1 at addr 0000000000000000 by task swapper/0/1
[    9.089185] 
[    9.090944] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc2+ #2
[    9.097890] Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
[    9.106652] Call trace:
[    9.109458]  dump_backtrace+0x0/0x244
[    9.113574]  show_stack+0x1c/0x24
[    9.117316]  dump_stack+0xe4/0x140
[    9.121155]  __kasan_report+0x1b0/0x1c8
[    9.125458]  kasan_report+0xc/0x14
[    9.129289]  __asan_load1+0x34/0x60
[    9.133216]  strncpy+0x4c/0x6c
[    9.136681]  do_mount_root+0x7c/0x150
[    9.140797]  mount_block_root+0x1c4/0x304
[    9.145293]  mount_root+0x17c/0x1bc
[    9.149222]  prepare_namespace+0x150/0x160
[    9.153812]  kernel_init_freeable+0x3b8/0x434
[    9.158686]  kernel_init+0x18/0x130
[    9.162617]  ret_from_fork+0x10/0x18
[    9.166630] ==================================================================
[    9.174629] Disabling lock debugging due to kernel taint
[    9.180510] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    9.189491] Mem abort info:
[    9.192387]   ESR = 0x96000004
[    9.195554]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.200989]   SET = 0, FnV = 0
[    9.204145]   EA = 0, S1PTW = 0
[    9.207394] Data abort info:
[    9.210374]   ISV = 0, ISS = 0x00000004
[    9.214318]   CM = 0, WnR = 0
[    9.217393] [0000000000000000] user address but active_mm is swapper
[    9.223892] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    9.229535] Modules linked in:
[    9.232646] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.5.0-rc2+ #2
[    9.240391] Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
[    9.248402] pstate: 60000005 (nZCv daif -PAN -UAO)
[    9.253260] pc : strncpy+0x4c/0x6c
[    9.256711] lr : strncpy+0x4c/0x6c
[    9.260158] sp : ffff000675b57b80
[    9.263518] x29: ffff000675b57b80 x28: ffff00066ebc7005 
[    9.268900] x27: 0000000000000008 x26: ffffa000112adf30 
[    9.274282] x25: fffffe00199af1c0 x24: ffffa00010c31ba0 
[    9.279664] x23: ffff00066e418fff x22: ffff00066ebc7000 
[    9.285046] x21: ffff00066e418000 x20: 0000000000000000 
[    9.290428] x19: ffff00066e418000 x18: 0000000000000000 
[    9.295809] x17: 00000000000014a0 x16: 0000000000001540 
[    9.301190] x15: 0000000000001498 x14: 0000000000001480 
[    9.306570] x13: 0000000000001488 x12: ffff8000ceb6af0e 
[    9.311952] x11: 1fffe000ceb6af0e x10: 0000000000001710 
[    9.317334] x9 : ffffa00010c17f3c x8 : ffff000675b57877 
[    9.322715] x7 : ffff8000ceb6af0f x6 : ffff8000ceb6af0f 
[    9.328097] x5 : dfffa00000000000 x4 : ffff000675b48000 
[    9.333478] x3 : ffffa00010c12678 x2 : 0000000000000007 
[    9.338859] x1 : ac027d2c81180b00 x0 : 0000000000000000 
[    9.344240] Call trace:
[    9.346729]  strncpy+0x4c/0x6c
[    9.349832]  do_mount_root+0x7c/0x150
[    9.353546]  mount_block_root+0x1c4/0x304
[    9.357611]  mount_root+0x17c/0x1bc
[    9.361150]  prepare_namespace+0x150/0x160
[    9.365303]  kernel_init_freeable+0x3b8/0x434
[    9.369718]  kernel_init+0x18/0x130
[    9.373258]  ret_from_fork+0x10/0x18
[    9.376893] Code: a8c47bfd d65f03c0 aa1403e0 97dc44f6 (39400296) 
[    9.383067] ---[ end trace 73d9c2c2bc9e939b ]---
[    9.387965] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    9.395737] SMP: stopping secondary CPUs
[    9.399731] Kernel Offset: disabled
[    9.403268] CPU features: 0x10002,21006004
[    9.407415] Memory Limit: none
[    9.410545] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
Best Regards,
Eugeniu
