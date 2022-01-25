Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BD549A5F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 03:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3418272AbiAYCNZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 21:13:25 -0500
Received: from mga07.intel.com ([134.134.136.100]:8216 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S3415750AbiAYBv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 20:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643075487; x=1674611487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j1Zv9xfcKeNpB04h1oLFcYV7hOt7HMSXwYsZ1CM/UDU=;
  b=lI6Sp26MV/5iAEcKoaOdauRl5McUxqXdXxMG1XLdsOicMqWzvr0M4Uh7
   2aYhNr848v+wAMiOU3244ZapCtEjhp4I3Zu0AWMnKOXxDaFyqMUvpCIW5
   IrKiRsx87PkaR/V9WuhlxHKafcNBnk7FNGkc2j0XZP11ep7w1KWT1S9JR
   5sOnJcC1gQqUOJluT1RWMaictfzlIDjHwI++iF4XHMu0IcmZYqQHdW4Ck
   9eGyhMN9+Rd/jQLr2RoPdOGmKACCIEvoqkAKmYzjFnM/SyfGTaw1gtLC7
   5/AQ+4fzcjk40FEyUe81yBcqCE3yMPZyhBb8/OTAC8bZKsC0n1skS3eZL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="309511373"
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="309511373"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 17:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="562868471"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2022 17:29:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCAe5-000JBG-Jf; Tue, 25 Jan 2022 01:29:17 +0000
Date:   Tue, 25 Jan 2022 09:28:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd
Message-ID: <61ef5253.dX1h+KToNxbVl4p8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd  Merge branch 'renesas-next' into renesas-devel

elapsed time: 736m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arc                         haps_hs_defconfig
arm                            xcep_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
um                                  defconfig
sh                            hp6xx_defconfig
powerpc64                        alldefconfig
x86_64                           alldefconfig
mips                    maltaup_xpa_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          rsk7201_defconfig
sh                          lboxre2_defconfig
sh                          r7780mp_defconfig
mips                  maltasmvp_eva_defconfig
sh                             shx3_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
arm                            pleb_defconfig
sparc64                          alldefconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
riscv                randconfig-c006-20220124
s390                 randconfig-c005-20220124
powerpc                      acadia_defconfig
mips                     loongson2k_defconfig
arm                             mxs_defconfig
mips                        bcm63xx_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
riscv                          rv32_defconfig
arm                     am200epdkit_defconfig
powerpc                     tqm5200_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
powerpc                     mpc5200_defconfig
powerpc                     tqm8560_defconfig
arm                     davinci_all_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
arm                         s3c2410_defconfig
arm                          imote2_defconfig
arm                         hackkit_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
