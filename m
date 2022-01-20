Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF49494706
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jan 2022 06:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358614AbiATFsx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jan 2022 00:48:53 -0500
Received: from mga02.intel.com ([134.134.136.20]:30002 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbiATFsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 00:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642657733; x=1674193733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jjQrOz81ThtVatgHiFN5ABNSzY5OMFi4PcGq+AQMKp4=;
  b=jHTn6fDQMVXDze7qAvMjXLrag9IWzAZxe4cS4hBENx8/Ud9r2gNSImJk
   2z2ypgYD60SQ6CKrbvxyKFRcePwfKO+GLFj0Kl/OI/6/gvMvIdjJpo3jX
   41t4hDuw8bC82ZovOSzAUTPgkBTNJu9ig9zUHOPAXcvYEPAu1UZSS/A3x
   V5MbGWcPC1fvj+QxziJiT53lu+kyEivupLMIjqpLIR9ZlpbJoKchzVWkp
   Nc6h6zeDYd7bKVi1zvO4eqzQHtKnGHRb3GE9VWdXz99mbhII3npnBltaZ
   ks7EPLevtF9s7OgRrXJzwtz211FfUxDKOemi6urOKdTyNx5jvzLNAFA6n
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="232640362"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="232640362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 21:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="626171460"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2022 21:48:51 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nAQJW-000E30-Vq; Thu, 20 Jan 2022 05:48:50 +0000
Date:   Thu, 20 Jan 2022 13:48:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a779f0-gpio-v1] BUILD SUCCESS
 a8962f902a7f70a326f547ef0b14db39c7faf4fa
Message-ID: <61e8f7b7.6V8CODf6dJO62CqJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779f0-gpio-v1
branch HEAD: a8962f902a7f70a326f547ef0b14db39c7faf4fa  arm64: dts: renesas: r8a779f0: Add GPIO nodes

elapsed time: 721m

configs tested: 183
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
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
sh                ecovec24-romimage_defconfig
mips                             allmodconfig
nios2                            alldefconfig
sh                         ap325rxa_defconfig
sh                          urquell_defconfig
arc                           tb10x_defconfig
mips                         mpc30x_defconfig
sh                         ecovec24_defconfig
arm                          pxa3xx_defconfig
sh                                  defconfig
arm                           h3600_defconfig
sh                   secureedge5410_defconfig
arm                         cm_x300_defconfig
arm                         lpc18xx_defconfig
arc                      axs103_smp_defconfig
powerpc                     asp8347_defconfig
xtensa                       common_defconfig
arm                           h5000_defconfig
ia64                      gensparse_defconfig
powerpc                 linkstation_defconfig
nds32                            alldefconfig
arm                           stm32_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        multi_v7_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                   currituck_defconfig
riscv                            allmodconfig
sh                          rsk7201_defconfig
sh                          sdk7780_defconfig
powerpc                     sequoia_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7750_defconfig
sh                          r7785rp_defconfig
powerpc                      bamboo_defconfig
sh                           se7619_defconfig
xtensa                    smp_lx200_defconfig
csky                             alldefconfig
sh                          r7780mp_defconfig
arm                      integrator_defconfig
openrisc                 simple_smp_defconfig
mips                           ip32_defconfig
xtensa                           allyesconfig
sh                             sh03_defconfig
sh                             espt_defconfig
arc                         haps_hs_defconfig
x86_64                           alldefconfig
xtensa                generic_kc705_defconfig
mips                  maltasmvp_eva_defconfig
arm                        keystone_defconfig
sh                        sh7785lcr_defconfig
sparc                       sparc32_defconfig
parisc                           alldefconfig
m68k                        mvme16x_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
arm                  randconfig-c002-20220120
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
arc                  randconfig-r043-20220118
arc                  randconfig-r043-20220119
riscv                randconfig-r042-20220119
s390                 randconfig-r044-20220119
s390                 randconfig-r044-20220117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220120
riscv                randconfig-c006-20220120
s390                 randconfig-c005-20220120
powerpc              randconfig-c003-20220120
mips                 randconfig-c004-20220120
i386                          randconfig-c001
arm                        spear3xx_defconfig
powerpc                        fsp2_defconfig
arm                            mmp2_defconfig
arm                      tct_hammer_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      walnut_defconfig
powerpc                   bluestone_defconfig
arm                             mxs_defconfig
arm                           spitz_defconfig
powerpc                    socrates_defconfig
x86_64               randconfig-a001-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a005-20220117
x86_64               randconfig-a006-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220117
hexagon              randconfig-r045-20220118
hexagon              randconfig-r045-20220119
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
hexagon              randconfig-r041-20220119
s390                 randconfig-r044-20220118
s390                 randconfig-r044-20220116
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
riscv                randconfig-r042-20220118
riscv                randconfig-r042-20220120
hexagon              randconfig-r045-20220120
hexagon              randconfig-r041-20220120

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
