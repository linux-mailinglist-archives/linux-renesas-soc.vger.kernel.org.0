Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873492EA80C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 10:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbhAEJxH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 04:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbhAEJxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 04:53:06 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B3FC061574;
        Tue,  5 Jan 2021 01:52:26 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r4so2415427wmh.5;
        Tue, 05 Jan 2021 01:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=990rBgSoPycT6/ROmiU/cnu0doP0l71RUFI+yeB/hkk=;
        b=ASFq6uuyCoT4FzKu+eIZWSkls8lAfUXrfCqeZFQ+zYuaMnUJaFtjYB4WUBIir5yCGz
         0GehEBP3HTV71idLTZgOCikmh2pEk95XVLfo6Drl8j9B6kj2GkhiXVEKuEdJN5CFNusc
         7Faz8Qtu/RLI5Tu/QBq4VQ/kT96sd4BOeOYF7VA66x74UxLaowWxxdqeXYP9VLpE88wy
         hJ1bq7UREobMPs/vFANB1h4o52u6zx025b5ucZFygail1aGd6gU6AnG7zheH+EOZFpOR
         F7vdxGFr1/LDFWMjs/41gB5DHF/WvfyQ37tCqWHmHU2o1HBy1wrft80CKNHwuLRz6w1r
         ltog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=990rBgSoPycT6/ROmiU/cnu0doP0l71RUFI+yeB/hkk=;
        b=KbSKCbMVEzWx9kn2/e7JjyPMYITNbQuYeNY9jMXvoUV08lRk577ybRF4Ve3PasTCD3
         Or6wU7deNro2J2Y65xjigc79SJYtAKSe3OLiyaCmZgIUPU9MT4Za4U3IU+YcCvW9w45a
         /qyHH2CYghVHgu4GU682MLnm6K33g4bg4134hBr2IsQZY2LPHbkXto+XAcO60+DTFXp7
         PeiIpx2yETec1Jqdv6RUT3UJ1H1OXG7VEDNAWDXSgTiF9RvBnKVk9ZeAaaX6ZHuy2A7M
         v1GkLjLNpEqL/h5n6Fcgjb2imCUwGc7E0rkdI1IB2yNsiOd66+jBY2nVsYhcv8p/VHaO
         miZg==
X-Gm-Message-State: AOAM531vtHuG93kba/9ZnPyMUfjJV7u1LxU09mQqe5Z3FxK41JjMGX9g
        iYDI2qxZE/s8nNd9PVtygqQ=
X-Google-Smtp-Source: ABdhPJyHlnk1qdxLI18Fg04pBDbpHrfecy3+HLfLVyx5GVTsPixukMVFWIeyYNu8Ykvs1JsH8YhbUA==
X-Received: by 2002:a7b:cc0a:: with SMTP id f10mr2652915wmh.6.1609840345027;
        Tue, 05 Jan 2021 01:52:25 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id s205sm3231859wmf.46.2021.01.05.01.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:52:24 -0800 (PST)
Date:   Tue, 5 Jan 2021 10:52:22 +0100
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org, ardb@kernel.org
Cc:     linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: r8a77950-salvator-x does nto boot since
 cfa7ede20f133cc81cef01dc3a516dda3a9721ee arm64: set TEXT_OFFSET to 0x0 in
 preparation for removing it entirely
Message-ID: <X/Q21vZcui0RlYWK@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello

Due to DTB renaming, salvatorX was not booted since a long time in kernelCI.
Now the rename is handled, the board fail to boot.

I have bisected the problem:
git bisect start
# good: [6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f] Linux 5.7.19
git bisect good 6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f
# bad: [ab435ce49bd1d02e33dfec24f76955dc1196970b] Linux 5.8.18
git bisect bad ab435ce49bd1d02e33dfec24f76955dc1196970b
# good: [3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162] Linux 5.7
git bisect good 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
# bad: [7ae77150d94d3b535c7b85e6b3647113095e79bf] Merge tag 'powerpc-5.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad 7ae77150d94d3b535c7b85e6b3647113095e79bf
# bad: [2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63] Merge branch 'uaccess.comedi' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect bad 2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63
# bad: [cfa3b8068b09f25037146bfd5eed041b78878bee] Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect bad cfa3b8068b09f25037146bfd5eed041b78878bee
# good: [17e0a7cb6a254c6d086562e7adf8b7ac24d267f3] Merge tag 'x86-cleanups-2020-06-01' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 17e0a7cb6a254c6d086562e7adf8b7ac24d267f3
# bad: [17839856fd588f4ab6b789f482ed3ffd7c403e1f] gup: document and work around "COW can break either way" issue
git bisect bad 17839856fd588f4ab6b789f482ed3ffd7c403e1f
# bad: [c2b0fc847f3122e5a4176c3772626a7a8facced0] Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm
git bisect bad c2b0fc847f3122e5a4176c3772626a7a8facced0
# bad: [342403bcb4dfe41324a0f6f4cb5a8d324f31c725] Merge branches 'for-next/acpi', 'for-next/bpf', 'for-next/cpufeature', 'for-next/docs', 'for-next/kconfig', 'for-next/misc', 'for-next/perf', 'for-next/ptr-auth', 'for-next/sdei', 'for-next/smccc' and 'for-next/vdso' into for-next/core
git bisect bad 342403bcb4dfe41324a0f6f4cb5a8d324f31c725
# good: [b130a8f70cbbf907c399799bd1073a78763ca0e7] KVM: arm64: Check advertised Stage-2 page size capability
git bisect good b130a8f70cbbf907c399799bd1073a78763ca0e7
# bad: [4fc92254bf86b19ac1ef81f61f4e690fccfcba4a] arm64: mm: Add asid_gen_match() helper
git bisect bad 4fc92254bf86b19ac1ef81f61f4e690fccfcba4a
# bad: [9d2d75ede59bc1edd8561f2ee9d4702a5ea0ae30] arm64/kernel: Fix range on invalidating dcache for boot page tables
git bisect bad 9d2d75ede59bc1edd8561f2ee9d4702a5ea0ae30
# good: [0dd2334fd5b99e610ceccba0e5263e6969207880] arm64: entry: remove unneeded semicolon in el1_sync_handler()
git bisect good 0dd2334fd5b99e610ceccba0e5263e6969207880
# good: [68ecabd0e680a4ceaf950ae189a55d4730d10c64] arm64/mm: Use phys_to_page() to access pgtable memory
git bisect good 68ecabd0e680a4ceaf950ae189a55d4730d10c64
# bad: [cfa7ede20f133cc81cef01dc3a516dda3a9721ee] arm64: set TEXT_OFFSET to 0x0 in preparation for removing it entirely
git bisect bad cfa7ede20f133cc81cef01dc3a516dda3a9721ee
# good: [30218da5974ceb29c913e53296577526cb742a7e] arm64: lib: Consistently enable crc32 extension
git bisect good 30218da5974ceb29c913e53296577526cb742a7e
# first bad commit: [cfa7ede20f133cc81cef01dc3a516dda3a9721ee] arm64: set TEXT_OFFSET to 0x0 in preparation for removing it entirely

This is the interesting part of uboot log:
[    0.000292] NOTI[    0.000292] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.16
[    0.005855] NOTICE:  BL2: PRR is R-Car H3 Ver1.1
[    0.010437] NOTICE:  BL2: Board is Salvator-X Rev1.0
[    0.015379] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.020804] NOTICE:  BL2: LCM state is CM
[    0.024847] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=0x53
[    0.030891] NOTICE:  BL2: DDR1600(rev.0.27)NOTICE:  [COLD_BOOT]NOTICE:  ..0
[    0.066311] NOTICE:  BL2: DRAM Split is 4ch
[    0.070195] NOTICE:  BL2: QoS is default setting(rev.0.37)
[    0.075697] NOTICE:  BL2: Lossy Decomp areas
[    0.079872] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
[    0.086957] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
[    0.093869] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
[    0.100785] NOTICE:  BL2: v1.3(release):b330e0e
[    0.105274] NOTICE:  BL2: Built : 15:26:51, Dec  6 2017
[    0.110462] NOTICE:  BL2: Normal boot
[    0.114103] NOTICE:  BL2: dst=0xe6320208 src=0x8180000 len=512(0x200)
[    0.120652] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
[    0.127110] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
[    0.134336] NOTICE:  BL2: dst=0x44100000 src=0x8200000 len=524288(0x80000)
[    0.144816] NOTICE:  BL2: dst=0x50000000 src=0x8640000 len=1048576(0x100000)
U-Boot 2015.04 (Dec 06 2017 - 15:26:59)
CPU: Renesas Electronics R8A7795 rev 1.1
Board: Salvator-X
I2C:   ready
DRAM:  3.9 GiB
MMC:   sh-sdhi: 0, sh-sdhi: 1, sh-sdhi: 2
In:    serial
Out:   serial
Err:   serial
Net:   ravb

[...]

booti 0x48080000 0x4a000000 0x48000000
## Loading init Ramdisk from Legacy Image at 4a000000 ...
   Image Name:   
   Image Type:   AArch64 Linux RAMDisk Image (uncompressed)
   Data Size:    15809011 Bytes = 15.1 MiB
   Load Address: 00000000
   Entry Point:  00000000
ERROR: Did not find a cmdline Flattened Device Tree

Regards
