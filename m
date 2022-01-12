Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DBF48BE5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 06:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbiALFhY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 00:37:24 -0500
Received: from mga07.intel.com ([134.134.136.100]:56134 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236258AbiALFhY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 00:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641965844; x=1673501844;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iaAx7ZdgjvOJpOnldm9LKn2ZXMho+4ngoodUxrmEHd0=;
  b=Ik8S99c8hSRkOf9J5ocauJIXk/TSz+YR+LF0i4mWRspGRy+lxpedJDve
   2HO5/tscTbnXtvG2o4niyKnG6wNIxrv0Cs9IrKd7Be9HHTNdXkFeeSBCw
   363mJM+66cLjv3/fuMxUAkl5xerMuHo7B4Kzxdd3ab8Xx+lk2gLoAh86a
   xcVfYp1afESUQ5uG1MZARw1wRpGqUsQcmjCmMZ58mYWX3geb0Hpcn3xRf
   s1/dGmb6YuyuZN1awhpJC03hVtYNIRoT3pLSD5hDn7K29J2Z1DqmxHTEC
   /AwD9n72Z7OoP6oGHbgbsR1caauuPKm+JziBZr2aFQN55jMfNp0c+qIri
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="307014741"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="307014741"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 21:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="490630789"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Jan 2022 21:37:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7WK2-0005Xp-4N; Wed, 12 Jan 2022 05:37:22 +0000
Date:   Wed, 12 Jan 2022 13:36:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/pinctrl-sharing-and-checker-improvements-v1] BUILD SUCCESS d6c9182303e140081c534c67de48cff6d104d6e9
Message-ID: <61de68d8.4jnnjING8lzwNVhC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/pinctrl-sharing-and-checker-improvements-v1
branch HEAD: d6c9182303e140081c534c67de48cff6d104d6e9  pinctrl: renesas: checker: Check drive pin conflicts

elapsed time: 733m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arc                                 defconfig
s390                             allmodconfig
sh                          sdk7780_defconfig
m68k                        mvme16x_defconfig
arm                        cerfcube_defconfig
arm                            pleb_defconfig
sh                          r7785rp_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
s390                          debug_defconfig
arc                              allyesconfig
arm                       multi_v4t_defconfig
arm                           viper_defconfig
nios2                         3c120_defconfig
powerpc                      bamboo_defconfig
arm                      footbridge_defconfig
ia64                         bigsur_defconfig
arm                        multi_v7_defconfig
sh                          rsk7203_defconfig
sparc                            alldefconfig
m68k                       m5275evb_defconfig
sh                        edosk7705_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
sh                            hp6xx_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
microblaze                          defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
powerpc                  storcenter_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm8548_defconfig
ia64                             allyesconfig
s390                                defconfig
sh                     magicpanelr2_defconfig
powerpc                     pq2fads_defconfig
parisc                              defconfig
mips                           xway_defconfig
m68k                         amcore_defconfig
arm                            mps2_defconfig
mips                      maltasmvp_defconfig
powerpc                    adder875_defconfig
sh                             shx3_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
arm                  randconfig-c002-20220111
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
riscv                randconfig-c006-20220111
powerpc              randconfig-c003-20220111
i386                          randconfig-c001
mips                 randconfig-c004-20220111
s390                 randconfig-c005-20220111
arm                      tct_hammer_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           ip27_defconfig
powerpc                          allmodconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc836x_mds_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
