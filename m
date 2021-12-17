Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787714783B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 04:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbhLQDhr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 22:37:47 -0500
Received: from mga07.intel.com ([134.134.136.100]:6260 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhLQDhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 22:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639712267; x=1671248267;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YhFI5FrJRx32CXwKZ9rECjZUvFUUIVm8yawFvSHPi/g=;
  b=nYAeKI1lmhOXuQooywGyUr5/BQN6qXp6Nt0nqWhEOJk5mIl3ybNuf/Nw
   wmmxVAkPjGNn8Qg8y/lL8SDzFG3v6apLTw3B1XMd/hvikWYfgGYaCAGqb
   7gxkkylKLffK9yxLvMAN5OQzFFOYetbf/SPZhKRAiCBcHuDTaneYi4g6s
   E2x7SVh75QtKeo+5wTOBp/dIifXCeGFlDQIz0mSHGo8TjcIIpUnskSeGc
   VZhx6hBtJLE46j+Enip0DiB0ye495jlO84oFQqwqPb/NdljeCgIXepnNp
   qb8V73mPsQQ9ALZ+Mqbm6r3MClq3PPvAg68sIEhjCTbOVcqktorsyhdj8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303047265"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="303047265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 19:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="506605271"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 19:37:35 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my43r-0004BH-5w; Fri, 17 Dec 2021 03:37:35 +0000
Date:   Fri, 17 Dec 2021 11:37:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.17] BUILD SUCCESS
 d563f4bac9914fca6f34711ad22647125e773dd0
Message-ID: <61bc05e5.JNs4icrHEkQFzrhc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.17
branch HEAD: d563f4bac9914fca6f34711ad22647125e773dd0  arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

elapsed time: 732m

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
i386                 randconfig-c001-20211216
m68k                       m5475evb_defconfig
sh                           se7712_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
arm                         s3c2410_defconfig
ia64                            zx1_defconfig
arm                      tct_hammer_defconfig
powerpc                      katmai_defconfig
sh                            migor_defconfig
sh                           se7724_defconfig
m68k                       m5208evb_defconfig
sparc                               defconfig
mips                        vocore2_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                            pleb_defconfig
mips                         mpc30x_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
sh                        dreamcast_defconfig
arm                           sunxi_defconfig
nds32                             allnoconfig
sh                           se7722_defconfig
mips                           mtx1_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc836x_mds_defconfig
arm                           sama5_defconfig
riscv                            alldefconfig
mips                malta_qemu_32r6_defconfig
arm                          ixp4xx_defconfig
arm                        oxnas_v6_defconfig
arm                       omap2plus_defconfig
arm                           u8500_defconfig
m68k                         amcore_defconfig
arm                      integrator_defconfig
arm                         at91_dt_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
arm                         lpc32xx_defconfig
s390                       zfcpdump_defconfig
arm                       imx_v4_v5_defconfig
arm                        mvebu_v5_defconfig
sparc64                             defconfig
mips                           ip32_defconfig
mips                            e55_defconfig
arm                     davinci_all_defconfig
powerpc                       ebony_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                        edosk7705_defconfig
powerpc                    adder875_defconfig
parisc                generic-32bit_defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a013-20211217
i386                 randconfig-a011-20211217
i386                 randconfig-a016-20211217
i386                 randconfig-a014-20211217
i386                 randconfig-a015-20211217
i386                 randconfig-a012-20211217
arc                  randconfig-r043-20211216
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
hexagon              randconfig-r045-20211216
hexagon              randconfig-r041-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
