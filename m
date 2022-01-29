Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093114A2A7E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jan 2022 01:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbiA2ARM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 19:17:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:59522 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243073AbiA2ARL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 19:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643415431; x=1674951431;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N91/n6AgJhd0lDjKbAcVtpV8DxELn16cdcXuxPhB8NY=;
  b=MLYwqCy9nA0Smdl7SAURMyTF7+9vbv16vmpNWVi0w+MEW3nSA6o6nbls
   9UucWnZpmc1PMCfONSyaPmwuYT+vfsIGba3TXHNQNUc/b2NSCMGXV+kft
   pdY/YWbouAGsA2pqi7hN1EvZYXPI5yFCHah0GMnqpljiv6UYUIS0g1rn0
   iVMU46rThQ+OQ2nvqZ9Vds1+my/z1v2AvHb5UjhLioAbAqt9nfN/c0Sea
   kSD23piDJwR+7NwHnh9M2Kn6JPMPQQznmlld3IFbnt0wO6G/x+UeOe1S/
   HyLbjfagfQVhE3NFQV2AaUuDj5/FXiMV4Gvz2nA8cn1tgaV+JvTcVwsbt
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227198808"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="227198808"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 16:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="625789755"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2022 16:17:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nDbQS-000OVF-PT; Sat, 29 Jan 2022 00:17:08 +0000
Date:   Sat, 29 Jan 2022 08:17:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 742dd872d37f93841fbf9319ced6e99f8c32e01e
Message-ID: <61f4877e.6ae8WK7+fINx+5Os%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 742dd872d37f93841fbf9319ced6e99f8c32e01e  pinctrl: renesas: r8a77995: Restore pin group sort order

elapsed time: 724m

configs tested: 171
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
parisc                generic-64bit_defconfig
sparc                       sparc64_defconfig
mips                        bcm47xx_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
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
arc                        nsimosci_defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
mips                        vocore2_defconfig
sh                             espt_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
nios2                         3c120_defconfig
sh                         apsh4a3a_defconfig
mips                           ci20_defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
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
riscv                             allnoconfig
arm                         s3c2410_defconfig
arm                     davinci_all_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
arm                        magician_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kilauea_defconfig
arm                      tct_hammer_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
