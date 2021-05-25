Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1CE390C3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 May 2021 00:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhEYWbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 18:31:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:38670 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232840AbhEYWbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 18:31:42 -0400
IronPort-SDR: UYBXwpQBBQCDMSh3sB6s+KqBdRxsRwPd/PpcVj+eAeSWXqSBhMFonnMBa11iD92r03L5BWJgTT
 tfZEODqCphqA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="181961944"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="181961944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 15:30:11 -0700
IronPort-SDR: vHxg/MuBXvCDB3Itw3uijjw59clRnYSgNbscvaKrUD+TAF5ukuKnHeXnRgcK0u9Wz0ZYkRxmF6
 dPsmiCxutxDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="546947047"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 May 2021 15:30:09 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llfYv-0001rP-8c; Tue, 25 May 2021 22:30:09 +0000
Date:   Wed, 26 May 2021 06:29:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 1931e709c701ea2913e8714f9658bea8cd5e361f
Message-ID: <60ad7a3d.6Zx28cuO82uLwZG1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 1931e709c701ea2913e8714f9658bea8cd5e361f  Merge branches 'renesas-arm-defconfig-for-v5.14' and 'renesas-arm-dt-for-v5.14' into renesas-next

elapsed time: 732m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                generic_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       lemote2f_defconfig
riscv                            allmodconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
sh                             sh03_defconfig
openrisc                            defconfig
x86_64                           alldefconfig
powerpc                     mpc83xx_defconfig
mips                     decstation_defconfig
mips                      malta_kvm_defconfig
powerpc                     tqm8548_defconfig
ia64                            zx1_defconfig
h8300                            alldefconfig
arm                            mmp2_defconfig
powerpc                       ppc64_defconfig
um                               alldefconfig
mips                      loongson3_defconfig
mips                        nlm_xlp_defconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
h8300                       h8s-sim_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    mvme5100_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
alpha                            alldefconfig
um                           x86_64_defconfig
arm                         s3c6400_defconfig
sh                            titan_defconfig
powerpc                      pasemi_defconfig
csky                             alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                        vdk_hs38_defconfig
arc                     haps_hs_smp_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
powerpc                       eiger_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
sparc                            alldefconfig
arm                            hisi_defconfig
arm                          iop32x_defconfig
arm                            pleb_defconfig
arm                       multi_v4t_defconfig
powerpc                     ppa8548_defconfig
m68k                        m5307c3_defconfig
ia64                          tiger_defconfig
arm                        vexpress_defconfig
riscv                    nommu_k210_defconfig
powerpc                     tqm8541_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                       capcella_defconfig
arm                           spitz_defconfig
arm                            mps2_defconfig
powerpc                   motionpro_defconfig
arm                           stm32_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
mips                      maltaaprp_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc6xx_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
powerpc                       maple_defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
powerpc                        icon_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
powerpc                     taishan_defconfig
arm                           tegra_defconfig
sh                          rsk7203_defconfig
parisc                generic-32bit_defconfig
i386                                defconfig
powerpc                 mpc837x_rdb_defconfig
x86_64                            allnoconfig
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
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
