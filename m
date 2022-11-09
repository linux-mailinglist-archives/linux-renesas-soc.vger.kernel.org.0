Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163406233F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Nov 2022 20:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiKITz3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Nov 2022 14:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiKITz2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2022 14:55:28 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503AA2F00C
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Nov 2022 11:55:26 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 136so13259647pga.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Nov 2022 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lhu0AaXEHpohB57ir2dSQXl6jTPxnwC4FKWIfCDgyuQ=;
        b=KLrj/KYNV8XkhPS1iVxKu/aPMmyU1eZXY/F92davxqF98lFJkaDajitQpvLL4vIrUZ
         RU7h9cdLzbmNLn0L1qXfQRwCmi310yFjxach5EiNriUwsj4QY8tSCN87JHeXJyddsuys
         72M/pHU11niJlVMdwR5BejriAj5tTWIKSL3Zum9Kr5LjGnYIBB+KYcP7u+2Q/hzO4Ovc
         tU1U6kuUmaW/d49VLzRNA0NrCOBTKDlZUJ48t/FF5HX9jTARqKnEoZUIP0SBy4fffs1f
         QNQtfiVfaubbqysdwv5B8gG1PQb5SEDi45P+WAnFZXNK62PytNrCB9DDZsJJ9qdrmxMB
         hRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhu0AaXEHpohB57ir2dSQXl6jTPxnwC4FKWIfCDgyuQ=;
        b=Blbwm8+7r9CLFsifCeL3dGdylQG9IRdQFrXd7HvDjMtZ7tB1GQXuZbs5+0zTqUl5u8
         mdi3u4+bhTKMMQTxNsKyItNx3/+9j9zttMnyDKAzyNSN+jZF5uYT3ixnda3Mfh/UIJLQ
         ABuCfNgNIctIH4R0YyBVCY+DXxTzPqKxej6c2U6gaaxZDBVpkjEUz8QVczrBKZyuP5Rg
         2mVwPGYiS5gTEJCeY/VPWoJawDjUM+SNkbqe0ScVAgyYFY+1Jz8OFBylw5tlfkHp4eNy
         6p6HqtxhDDFlp5ix3HFXLiLjelNyuXclKUnQJ2DrtwEQ8gFKb5iOr2TfBc87zwLfo5Il
         plCw==
X-Gm-Message-State: ACrzQf1i3xz5nTwq7YaqJZ9ISksCPdvIeom8XvtT+8BKdMeNyqB1P49Q
        jW2Zj9SY+Ryh4NANmFDC/++eog==
X-Google-Smtp-Source: AMsMyM4yxxTSRBnPGND+4E6OHwiGrFVk5cgGXo5F+I0YpXul+RM44cAyB0NLsjogLjCA7A1w6czz7Q==
X-Received: by 2002:a05:6a00:1482:b0:56c:6a9c:3d7 with SMTP id v2-20020a056a00148200b0056c6a9c03d7mr62529169pfu.0.1668023725592;
        Wed, 09 Nov 2022 11:55:25 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902654e00b00172f6726d8esm9466969pln.277.2022.11.09.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 11:55:24 -0800 (PST)
Date:   Wed, 09 Nov 2022 11:55:24 -0800 (PST)
X-Google-Original-Date: Wed, 09 Nov 2022 11:55:21 PST (-0800)
Subject:     Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
        anup@brainfault.org, Atish Patra <atishp@rivosinc.com>,
        heinrich.schuchardt@canonical.com, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, prabhakar.csengg@gmail.com,
        biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     prabhakar.csengg@gmail.com
Message-ID: <mhng-563fb6cf-4505-4137-8da1-13f631e1c74f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 28 Oct 2022 09:59:14 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> entry-class social infrastructure gateway control and industrial gateway
> control.
>
> This patch series adds initial SoC DTSi support for Renesas RZ/Five
> (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
>
> Useful links:
> -------------
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> [1] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/
>
> Patch series depends on the below patches (which are queued in the Renesas tree for v6.2):
> ------------------------------------------------------------------------------------
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dt-bindings-for-v6.2&id=c27ce08b806d606cd5cd0e8252d1ed2b729b5b55
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dt-bindings-for-v6.2&id=7dd1d57c052e88f98b9e9145461b13bca019d108
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-soc-for-v6.2&id=b3acbca3c80e612478b354e43c1480c3fc15873e
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-dt-for-v6.2&id=49669da644cf000eb79dbede55bd04acf3f2f0a0
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-dt-for-v6.2&id=b9a0be2054964026aa58966ce9724b672f210835
>
> v4 -> v5:
> ---------
> * Rebased patches on -next
> * Included RB tags
> * Dropped patches #1 and #4 (form v4) as they are queued up by Renesas trees
> * Patch #7 from v4 was not needed anymore so dropped it
> * Patches #4 and #5 are new
>
> v4: https://lore.kernel.org/all/20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v3: https://lore.kernel.org/lkml/20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v2: https://lore.kernel.org/all/20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v1: https://lore.kernel.org/lkml/20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Below are the logs from RZ/Five SMARC EVK:
> ------------------------------------------
>
> / # uname -ra;
> Linux (none) 6.1.0-rc2-00036-gbad82a074f62 #145 SMP Fri Oct 28 17:18:41 BST 2022 riscv64 GNU/Linux
> / # cat /proc/cpuinfo;
> processor       : 0
> hart            : 0
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : andestech,ax45mp
> mvendorid       : 0x31e
> marchid         : 0x8000000000008a45
> mimpid          : 0x500
>
> / # for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/
> soc0/$i; done
> machine: Renesas SMARC EVK based on r9a07g043f01
> family: RZ/Five
> soc_id: r9a07g043
> revision: 0
> / #
> / # cat /proc/interrupts
>            CPU0
>   1:          0  SiFive PLIC 412 Level     1004b800.serial:rx err
>   2:         16  SiFive PLIC 414 Level     1004b800.serial:rx full
>   3:        402  SiFive PLIC 415 Level     1004b800.serial:tx empty
>   4:          0  SiFive PLIC 413 Level     1004b800.serial:break
>   5:      41826  RISC-V INTC   5 Edge      riscv-timer
>   6:         10  SiFive PLIC 416 Level     1004b800.serial:rx ready
> IPI0:         0  Rescheduling interrupts
> IPI1:         0  Function call interrupts
> IPI2:         0  CPU stop interrupts
> IPI3:         0  IRQ work interrupts
> IPI4:         0  Timer broadcast interrupts
> / #
> / # cat /proc/meminfo
> MemTotal:         882252 kB
> MemFree:          860848 kB
> MemAvailable:     858608 kB
> Buffers:               0 kB
> Cached:             1796 kB
> SwapCached:            0 kB
> Active:                0 kB
> Inactive:             72 kB
> Active(anon):          0 kB
> Inactive(anon):       72 kB
> Active(file):          0 kB
> Inactive(file):        0 kB
> Unevictable:        1796 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:           108 kB
> Mapped:             1200 kB
> Shmem:                 0 kB
> KReclaimable:       6760 kB
> Slab:              12360 kB
> SReclaimable:       6760 kB
> SUnreclaim:         5600 kB
> KernelStack:         620 kB
> PageTables:           32 kB
> SecPageTables:         0 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:      441124 kB
> Committed_AS:        592 kB
> VmallocTotal:   67108864 kB
> VmallocUsed:        1132 kB
> VmallocChunk:          0 kB
> Percpu:               84 kB
> HugePages_Total:       0
> HugePages_Free:        0
> HugePages_Rsvd:        0
> HugePages_Surp:        0
> Hugepagesize:       2048 kB
> Hugetlb:               0 kB
> / #
> / #
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   dt-bindings: riscv: Sort the CPU core list alphabetically
>   dt-bindings: riscv: Add Andes AX45MP core to the list
>   riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
>   riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
>   riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
>   MAINTAINERS: Add entry for Renesas RISC-V
>   riscv: configs: defconfig: Enable Renesas RZ/Five SoC
>
>  .../devicetree/bindings/riscv/cpus.yaml       | 11 ++-
>  MAINTAINERS                                   |  3 +-
>  arch/riscv/Kconfig.socs                       |  5 +
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/renesas/Makefile          |  2 +
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   | 57 ++++++++++++
>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 ++++++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 58 ++++++++++++
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 91 +++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  3 +
>  10 files changed, 252 insertions(+), 6 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi

Geert was mentioning taking these though one of his trees, that works 
for me so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Happy to do a shared tag or whatever, but I think we can just skip that 
here.  The only conflicts would be defconfig and Kconfig.socs, but I 
don't think anything big is in the works for either -- unless Conor was 
planning on re-spinning that Kconfig.socs rework?

Thanks!
