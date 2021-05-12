Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5788D37B5C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 May 2021 08:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhELGR7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 May 2021 02:17:59 -0400
Received: from mga18.intel.com ([134.134.136.126]:41817 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhELGR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 May 2021 02:17:58 -0400
IronPort-SDR: pzopQPPuh8kSyB1637qeLUY31uXHHMh7Kqory8jCwvN8ilhmj9wTRhrKvRGbgVrbA8q7tRPA8w
 39AGmjWllcpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="187059294"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="187059294"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 23:16:49 -0700
IronPort-SDR: swh6QfV5Ag/DdVHksBj5PwzR3UXiG0XowGG7WP1uXp1QEwNh5JnV8tnIe9zK/R9UuhNwcZIXrv
 cffNaC+8NJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="622150015"
Received: from lkp-server01.sh.intel.com (HELO 1e931876798f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 May 2021 23:16:48 -0700
Received: from kbuild by 1e931876798f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgiAp-00001O-PE; Wed, 12 May 2021 06:16:47 +0000
Date:   Wed, 12 May 2021 14:15:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 bff1b0e749d4df5f61ce46122ab7f5c522684b50
Message-ID: <609b7293.BDVOy+yNw1eAg06h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: bff1b0e749d4df5f61ce46122ab7f5c522684b50  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1271m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                    amigaone_defconfig
mips                      malta_kvm_defconfig
arm                           u8500_defconfig
sh                            hp6xx_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                           se7705_defconfig
mips                        workpad_defconfig
arm                        shmobile_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc64e_defconfig
arm                         s3c2410_defconfig
arm                           viper_defconfig
mips                     decstation_defconfig
m68k                        m5407c3_defconfig
arm                            xcep_defconfig
um                               allyesconfig
powerpc                   currituck_defconfig
mips                         tb0226_defconfig
sh                          polaris_defconfig
mips                           ip27_defconfig
sh                           se7751_defconfig
arm                            pleb_defconfig
powerpc                     pseries_defconfig
xtensa                generic_kc705_defconfig
arm                             mxs_defconfig
arm                           tegra_defconfig
ia64                             alldefconfig
arc                                 defconfig
mips                       lemote2f_defconfig
arm                        spear3xx_defconfig
arm                              alldefconfig
sh                          lboxre2_defconfig
powerpc                       maple_defconfig
xtensa                         virt_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
mips                       capcella_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      bamboo_defconfig
riscv                             allnoconfig
s390                                defconfig
arm                         axm55xx_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        jmr3927_defconfig
sh                        dreamcast_defconfig
powerpc                     pq2fads_defconfig
arm                           sama5_defconfig
powerpc                   lite5200b_defconfig
mips                     loongson1c_defconfig
s390                          debug_defconfig
m68k                        m5307c3_defconfig
powerpc                 linkstation_defconfig
arm                       netwinder_defconfig
sh                           sh2007_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210511
i386                 randconfig-a001-20210511
i386                 randconfig-a005-20210511
i386                 randconfig-a004-20210511
i386                 randconfig-a002-20210511
i386                 randconfig-a006-20210511
x86_64               randconfig-a012-20210511
x86_64               randconfig-a015-20210511
x86_64               randconfig-a011-20210511
x86_64               randconfig-a013-20210511
x86_64               randconfig-a016-20210511
x86_64               randconfig-a014-20210511
i386                 randconfig-a016-20210511
i386                 randconfig-a014-20210511
i386                 randconfig-a011-20210511
i386                 randconfig-a015-20210511
i386                 randconfig-a012-20210511
i386                 randconfig-a013-20210511
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210511
x86_64               randconfig-a004-20210511
x86_64               randconfig-a001-20210511
x86_64               randconfig-a005-20210511
x86_64               randconfig-a002-20210511
x86_64               randconfig-a006-20210511

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
