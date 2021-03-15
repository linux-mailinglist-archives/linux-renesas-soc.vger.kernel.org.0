Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103D833C86E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 22:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhCOV3h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 17:29:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:33641 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbhCOV3P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 17:29:15 -0400
IronPort-SDR: SwcYNFX7UTIG/JMNnygMPLn+QqauYyLV2W+ZBnkYQXCrGNzjba6JYnRjVkOT+ZAz6xSJTAosWM
 PBlnwqA2xWwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="188518482"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="188518482"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 14:28:58 -0700
IronPort-SDR: tDzMm06tC27f/E3sqLwGPm55d0VY3CR9MevQQpF9UkyLnpysqSfDfOcBJSo4IbYYnGV+suJR9q
 GUSJtJ/8OHOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="378644800"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2021 14:28:49 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lLulc-0000ep-Ew; Mon, 15 Mar 2021 21:28:48 +0000
Date:   Tue, 16 Mar 2021 05:27:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 7bd4543a30a76f48903e745f7b9decce1f019ece
Message-ID: <604fd15b.M+q1ZKBD+uwBzXXY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7bd4543a30a76f48903e745f7b9decce1f019ece  Merge tag 'v5.12-rc3' into renesas-devel

elapsed time: 728m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
riscv                            allmodconfig
sh                                  defconfig
sh                               alldefconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      loongson3_defconfig
mips                         rt305x_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
nds32                             allnoconfig
sh                   secureedge5410_defconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
mips                        jmr3927_defconfig
arm                           h5000_defconfig
arm                          exynos_defconfig
mips                           ip28_defconfig
arm                       mainstone_defconfig
arm64                            alldefconfig
mips                           ip32_defconfig
sh                          polaris_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
arm                       omap2plus_defconfig
powerpc                    socrates_defconfig
powerpc                       ebony_defconfig
sparc                       sparc64_defconfig
arm                         vf610m4_defconfig
m68k                        m5272c3_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        shmobile_defconfig
m68k                       m5208evb_defconfig
arc                            hsdk_defconfig
arm                        cerfcube_defconfig
mips                        vocore2_defconfig
sh                          urquell_defconfig
xtensa                           alldefconfig
sh                        sh7757lcr_defconfig
s390                                defconfig
sh                           se7206_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
h8300                       h8s-sim_defconfig
sh                          r7785rp_defconfig
mips                        maltaup_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7721_defconfig
mips                  cavium_octeon_defconfig
sh                             sh03_defconfig
arm                         nhk8815_defconfig
powerpc                    sam440ep_defconfig
sh                        sh7763rdp_defconfig
um                             i386_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
powerpc                      ppc40x_defconfig
arm                        multi_v7_defconfig
sh                          lboxre2_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
