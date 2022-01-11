Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A703648BB31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 00:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346730AbiAKXDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jan 2022 18:03:54 -0500
Received: from mga02.intel.com ([134.134.136.20]:29791 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346722AbiAKXDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 18:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641942233; x=1673478233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PyvFF+3L0xSogiCi+lyf3LhzBpJcDq7NZBbZ7MBycvs=;
  b=CYeG1wLsrzwE2QlujdvCqTqOpFC3ua2rB1IY1FJOjmGSmW3nI6ttb5hi
   Jj7h6NhR0QogjNivypEi3mvE83RXKZ4J+eiJHxDNvy93ANnFwu3Rguuji
   op5LciMNAPSyeN1KEVxaqk2d2U4YjsNCJHFkwo4TDURmFLT92iANBugh4
   JiUWjCDSaKVC1YuPx66YYlkTflkmXwQ3nQfIpTMtEar7SfzkIGCnAjlYy
   mn8WZGo3VmmIdGQQIEndDMTyIpybUaqjkNVOOJ/dYb1apeo4jUN6bRZHO
   r2fHxjdfXAgfSNZokM1JjZaFKr/Ouur7eiIszgHfvKMogxQJVo/Kho9o0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="230947303"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; 
   d="scan'208";a="230947303"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 15:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; 
   d="scan'208";a="623232453"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Jan 2022 15:03:51 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7QBD-0005JL-2o; Tue, 11 Jan 2022 23:03:51 +0000
Date:   Wed, 12 Jan 2022 07:03:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.18] BUILD SUCCESS
 83ef00d79ec75a353286c063c566b87c913e29fe
Message-ID: <61de0cbd.Uws85fx0Hz2HhP3n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.18
branch HEAD: 83ef00d79ec75a353286c063c566b87c913e29fe  arm64: dts: renesas: r8a77961: Add lvds0 device node

elapsed time: 729m

configs tested: 178
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
mips                 randconfig-c004-20220111
sh                           se7750_defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     mpc83xx_defconfig
mips                      maltasmvp_defconfig
nios2                               defconfig
sh                          sdk7780_defconfig
m68k                        mvme16x_defconfig
arm                        cerfcube_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
um                             i386_defconfig
sparc                            alldefconfig
arm                           stm32_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
m68k                                defconfig
sh                        edosk7760_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
s390                          debug_defconfig
arc                              allyesconfig
arm                       multi_v4t_defconfig
arm                           viper_defconfig
sh                          rsk7269_defconfig
arm                        realview_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
microblaze                          defconfig
h8300                     edosk2674_defconfig
arm                     eseries_pxa_defconfig
nds32                             allnoconfig
powerpc                    klondike_defconfig
sh                        edosk7705_defconfig
nds32                            alldefconfig
mips                         db1xxx_defconfig
arm                         vf610m4_defconfig
sh                        dreamcast_defconfig
arm                        multi_v7_defconfig
arc                      axs103_smp_defconfig
sh                          r7780mp_defconfig
sh                             shx3_defconfig
h8300                               defconfig
s390                       zfcpdump_defconfig
sh                          urquell_defconfig
m68k                          amiga_defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
powerpc                     rainier_defconfig
powerpc                  storcenter_defconfig
powerpc                     pq2fads_defconfig
parisc                              defconfig
mips                           xway_defconfig
m68k                         amcore_defconfig
arm                            mps2_defconfig
powerpc                      pcm030_defconfig
xtensa                       common_defconfig
m68k                            q40_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
s390                             allyesconfig
arm                  randconfig-c002-20220111
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
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
arm                    vt8500_v6_v7_defconfig
mips                           ip27_defconfig
powerpc                          allmodconfig
powerpc                     kmeter1_defconfig
arm                         bcm2835_defconfig
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
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
