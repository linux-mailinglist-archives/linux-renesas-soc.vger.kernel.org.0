Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E9849AB0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiAYELG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:11:06 -0500
Received: from mga04.intel.com ([192.55.52.120]:35763 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S3419845AbiAYCUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 21:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643077246; x=1674613246;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FNpti3qMZYHB40gCN8KVtuo5+yZLTMC7BzlUyrJ+G1A=;
  b=dIi8UwGnXona6IMB2EVlb/2hzeFm4CsqFUp541a/sthdbrpNeXkK8W0I
   dZ0mx/oU4xtxLBgw4F3iSCxpv+YlXJumw+8FB8wCNNgYHbVW+CJtyQbys
   crtON3y5A/mzrJTIofdR+S7BiLYkayFCoMOmLiEzY0frXBVLlJKSzgL3p
   v80rwAjcSW3S9mwxxW7BMtYzqruDsK+Mz18TM6enDUWJ7Ydy6khkgwRLp
   BcZ7z+mzyDgLFReou51CvVphyUurP8K06KRgj/Gj2z4HEBAEjd3zYm4bw
   NIpQR5f2ec3GQXqC4JNJ/Sc7fxhNPLpZ3mCONzR+/s3+tds9c/cVOhv8f
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245025980"
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="245025980"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 17:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="695639573"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 17:29:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCAe5-000JB9-Ho; Tue, 25 Jan 2022 01:29:17 +0000
Date:   Tue, 25 Jan 2022 09:28:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.18] BUILD SUCCESS
 9b621b6adff533468798404acca062c46da141af
Message-ID: <61ef523b.6v8rpI6rHE4dNTg8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.18
branch HEAD: 9b621b6adff533468798404acca062c46da141af  clk: renesas: r8a779a0: Add CANFD module clock

elapsed time: 721m

configs tested: 132
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
m68k                          hp300_defconfig
m68k                        mvme16x_defconfig
sh                   sh7770_generic_defconfig
arc                           tb10x_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
sh                          polaris_defconfig
um                                  defconfig
sh                           se7206_defconfig
ia64                          tiger_defconfig
arc                            hsdk_defconfig
arm                       multi_v4t_defconfig
arm                        trizeps4_defconfig
h8300                            allyesconfig
arm                        mvebu_v7_defconfig
arm                           viper_defconfig
sh                          r7780mp_defconfig
mips                  maltasmvp_eva_defconfig
sh                             shx3_defconfig
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
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
mips                  cavium_octeon_defconfig
mips                        omega2p_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
riscv                          rv32_defconfig
mips                        bcm63xx_defconfig
powerpc                          g5_defconfig
arm                          imote2_defconfig
mips                           mtx1_defconfig
powerpc                   lite5200b_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm5200_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
arm                     davinci_all_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
arm                         hackkit_defconfig
mips                     loongson2k_defconfig
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
