Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B019A4A2A81
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jan 2022 01:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351897AbiA2ASM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 19:18:12 -0500
Received: from mga02.intel.com ([134.134.136.20]:11175 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348343AbiA2ASL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 19:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643415491; x=1674951491;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZZUbDpIWZpJA9Sh5bwzGXY+xuhAH1s4VmFZ9WgsLnE0=;
  b=OkKnlWOu4dhODRIEAo8HmSR5Of0Xvlu5OH2aH0R/cnuMiDErrmGTbDPG
   jufivnZG9/gJR9X2RlW8ty3HVpw7Xoapri3xDmQ2RroTM7Weh6PHstBfF
   GdABP2CdoTIW1Tzyhzyl00iWEZD2M5hHqqVIqmb/rYg1n1BQC/MwSWkc+
   bC3HoEUor4UZFwWA50tzkmHUPgZHjmRHg9/CqXJ0qyzW5QBjp+S3YAZ4h
   V0TgiepNInVlq2hHd9mYMCjj6fF0n66jN7UG1+21bjTzzEVukxX4qLFUG
   CemhrYI/daKrYDjMtJRYeCFeWPqCXX9/wL26rOWbhQeCcjcyxcRqvcdIW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="234608410"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="234608410"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 16:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="496293349"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2022 16:18:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nDbRR-000OW7-3i; Sat, 29 Jan 2022 00:18:09 +0000
Date:   Sat, 29 Jan 2022 08:17:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v5.18] BUILD
 SUCCESS 485d710685b1a914230f9c18db9fbb9d08e16475
Message-ID: <61f4878c.6ZzYkPbnVDnkhf5n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.18
branch HEAD: 485d710685b1a914230f9c18db9fbb9d08e16475  arm64: defconfig: Enable Audio Graph Card2 driver

elapsed time: 729m

configs tested: 166
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc                 mpc834x_itx_defconfig
arm                         at91_dt_defconfig
mips                         mpc30x_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
arm                         s3c6400_defconfig
riscv                            allyesconfig
m68k                        mvme147_defconfig
mips                 decstation_r4k_defconfig
ia64                        generic_defconfig
nios2                         10m50_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_mds_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
sparc                               defconfig
xtensa                           alldefconfig
arm                         cm_x300_defconfig
sh                           se7751_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
nios2                            allyesconfig
arm                            xcep_defconfig
sh                            shmin_defconfig
ia64                      gensparse_defconfig
openrisc                         alldefconfig
arc                 nsimosci_hs_smp_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      pasemi_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
nds32                             allnoconfig
powerpc                  storcenter_defconfig
powerpc                     sequoia_defconfig
powerpc                     tqm8541_defconfig
mips                           xway_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
arc                        nsimosci_defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
powerpc                     asp8347_defconfig
mips                           ip32_defconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
powerpc                        cell_defconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20220124
arm                  randconfig-c002-20220127
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220127
arc                  randconfig-r043-20220127
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220127
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
riscv                    nommu_k210_defconfig
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
arm                     davinci_all_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
arm                        magician_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kilauea_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
