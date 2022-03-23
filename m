Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE7B4E4B23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 03:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbiCWC4R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 22:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbiCWC4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 22:56:16 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408CB4BFCA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 19:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648004088; x=1679540088;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HQ80cUF4qrjwohet9ownJADjf6Zx+dMEEyFeOMdsscg=;
  b=bHlg8nbJsSk9aTQLvA804w5Lgu/6fRQGzpg0RMyOPBy0iTVtamhup+gb
   a1GekDChSeXNl1RS5L+9AGI/anf+NtsTIzNeZFzpWs/2cJAJdywhOvC7L
   /Y3nO+Mz6A84LNIXEVm1V+p/aj4Fur61J8udxHvDdntCeZZLsGwUrYG6c
   WR0b31KpFbYTRQ32w2YzlxrK7fTV9h0V8nDaMgW7TI6jTNEzoT1j0f8Wy
   WS6JcN1Gt5YffwUQGYKoAtI+rAYDxKANzigkbCiMkmIeSRgx9Yrzno91A
   nqgEUa1cpvZ/A1qK9Yd7wDha/4yolC36D7Bk0PP7K+gt2qDhQP2GovhLV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="256829652"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="256829652"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 19:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="519180804"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2022 19:54:46 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWr93-000JZU-T3; Wed, 23 Mar 2022 02:54:45 +0000
Date:   Wed, 23 Mar 2022 10:54:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 6a5d6020e6854b38797ea17807457dcdc858aa29
Message-ID: <623a8be1.8rC7QM33tk57pgPp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 6a5d6020e6854b38797ea17807457dcdc858aa29  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/llvm/202203230213.cy4sjibp-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/tiny/panel-mipi-dbi.c:391:12: error: incompatible function pointer types initializing 'void (*)(struct spi_device *)' with an expression of type 'int (struct spi_device *)' [-Werror,-Wincompatible-function-pointer-types]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- hexagon-randconfig-r045-20220322
    `-- drivers-gpu-drm-tiny-panel-mipi-dbi.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-spi_device-)-with-an-expression-of-type-int-(struct-spi_device-)-Werror-Wincompatible-funct

elapsed time: 727m

configs tested: 111
configs skipped: 3

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220321
powerpc                      makalu_defconfig
sh                 kfr2r09-romimage_defconfig
mips                      loongson3_defconfig
arm                        keystone_defconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
sh                      rts7751r2d1_defconfig
sh                        edosk7760_defconfig
arm                          iop32x_defconfig
openrisc                  or1klitex_defconfig
arm                            hisi_defconfig
mips                     loongson1b_defconfig
sh                                  defconfig
powerpc                    sam440ep_defconfig
xtensa                       common_defconfig
sh                           se7619_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220322
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
x86_64               randconfig-a014-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
arc                  randconfig-r043-20220322
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                 randconfig-c004-20220323
powerpc              randconfig-c003-20220323
s390                 randconfig-c005-20220323
mips                           rs90_defconfig
arm                          moxart_defconfig
powerpc                    mvme5100_defconfig
mips                        omega2p_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
hexagon              randconfig-r041-20220322
riscv                randconfig-r042-20220322
s390                 randconfig-r044-20220322
hexagon              randconfig-r045-20220322

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
