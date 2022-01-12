Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEB148CD0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 21:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357507AbiALUWU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 15:22:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:57267 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357502AbiALUWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 15:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642018933; x=1673554933;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AbwBKeITngiQyxi96Rx8OGO/0dOZGsB22PPI3eWaAx0=;
  b=FV7noxEViZg1LyxdJWfVeqxztcmMabofCu2DPropjj1RxvBZzQJErPj0
   dxWDtzW/VmUChoEsH2W4ksq9vMntcfqTnnhgYwJE7ofCP0rq1SR8bonjo
   SDG1L6eUp25tz2JT5camuzJoqfqBcjqg6ck5HmpXWcNfpxA0SgFHGCWuN
   xyItqA9eLJQK4P/TiJZBAq08hQdEYaImAV75gs/6OESMXFHA+SHWNrsOH
   xKdVhS80zIj7cXSw2F20JR6Ma+U85K3bI3wx5hFrSqOqlODMGsby2CV7w
   baKCTG4LMSNRMVp+d5dPgvb5ykIQc9e6Qruk7/qjdQRJ42nMsxQ5q3x2M
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="224538741"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="224538741"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="528773023"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2022 12:22:11 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7k8I-0006Mi-Rd; Wed, 12 Jan 2022 20:22:10 +0000
Date:   Thu, 13 Jan 2022 04:21:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6db3d37d04fb23ae868d4ab8b0f4a869c32e0b4b
Message-ID: <61df3843.GOfLp5DZWwh/D9/t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6db3d37d04fb23ae868d4ab8b0f4a869c32e0b4b  Merge branch 'renesas-arm-dt-for-v5.18' into renesas-devel

elapsed time: 2008m

configs tested: 194
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220111
mips                 randconfig-c004-20220112
arm                          badge4_defconfig
sh                           se7750_defconfig
m68k                           sun3_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     mpc83xx_defconfig
mips                      maltasmvp_defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
h8300                     edosk2674_defconfig
sh                           se7724_defconfig
arm                        clps711x_defconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
um                             i386_defconfig
sparc                            alldefconfig
arm                           stm32_defconfig
arc                     haps_hs_smp_defconfig
sh                         microdev_defconfig
powerpc                     rainier_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
m68k                                defconfig
sh                        edosk7760_defconfig
mips                          rb532_defconfig
sparc64                             defconfig
s390                          debug_defconfig
arc                              allyesconfig
arm                       multi_v4t_defconfig
arm                           viper_defconfig
powerpc                   motionpro_defconfig
nios2                         3c120_defconfig
mips                    maltaup_xpa_defconfig
mips                         cobalt_defconfig
powerpc                      mgcoge_defconfig
x86_64                              defconfig
powerpc                         wii_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
microblaze                          defconfig
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
powerpc                    adder875_defconfig
sh                             shx3_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
powerpc                     taishan_defconfig
mips                        vocore2_defconfig
arm                          simpad_defconfig
powerpc                      pcm030_defconfig
xtensa                       common_defconfig
sh                          kfr2r09_defconfig
arm                          lpd270_defconfig
m68k                            q40_defconfig
sh                          sdk7780_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
s390                             allyesconfig
arm                  randconfig-c002-20220111
arm                  randconfig-c002-20220112
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
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
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
arc                  randconfig-r043-20220112
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
riscv                randconfig-c006-20220111
powerpc              randconfig-c003-20220111
i386                          randconfig-c001
s390                 randconfig-c005-20220111
mips                 randconfig-c004-20220111
powerpc                     tqm5200_defconfig
powerpc                          g5_defconfig
arm                                 defconfig
arm                          pxa168_defconfig
powerpc                     ksi8560_defconfig
arm                        spear3xx_defconfig
arm                  colibri_pxa300_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_mds_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
powerpc                        fsp2_defconfig
arm                         bcm2835_defconfig
powerpc                  mpc866_ads_defconfig
mips                           ip27_defconfig
powerpc                          allmodconfig
powerpc                     kmeter1_defconfig
mips                           mtx1_defconfig
powerpc                    ge_imp3a_defconfig
arm                            mmp2_defconfig
arm                         hackkit_defconfig
powerpc                   lite5200b_defconfig
riscv                             allnoconfig
arm                          ixp4xx_defconfig
riscv                          rv32_defconfig
mips                          rm200_defconfig
powerpc                      acadia_defconfig
hexagon                          alldefconfig
powerpc                      pmac32_defconfig
mips                           ip22_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
arm                     davinci_all_defconfig
arm                      pxa255-idp_defconfig
hexagon                             defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112
hexagon              randconfig-r045-20220111
hexagon              randconfig-r041-20220111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
