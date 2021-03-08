Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D4C331A75
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 23:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHWy6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 17:54:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:46801 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhCHWyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 17:54:39 -0500
IronPort-SDR: yj6HZMIC5il9Rp7jso08Np5zkx5TE4LLcMCUBxlmjo5wL1un/WoIwpYeeq79Wion9gONZlX+Xn
 12+ZZJg8Rpfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175229106"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="175229106"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 14:54:38 -0800
IronPort-SDR: 7kqrzQQq+AQUI0bt/Af6U6L8YP87oTEuCkuHgBBkO1UdSwSUPZoyFHrbMu7nUb3e51eMG3ZI3y
 YLs2h5jOXHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="437653004"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2021 14:54:36 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJOlo-0001Cd-A7; Mon, 08 Mar 2021 22:54:36 +0000
Date:   Tue, 09 Mar 2021 06:54:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-drivers-for-v5.13] BUILD SUCCESS
 1d9ffbc6b185561c65a5a599562dbb6c5d66e7d1
Message-ID: <6046ab23.VXXNdmLN7UG3x2Rw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.13
branch HEAD: 1d9ffbc6b185561c65a5a599562dbb6c5d66e7d1  soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

elapsed time: 727m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
mips                       capcella_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
s390                       zfcpdump_defconfig
m68k                        m5407c3_defconfig
mips                     loongson1c_defconfig
sh                          lboxre2_defconfig
arm                        shmobile_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        dreamcast_defconfig
mips                          ath79_defconfig
arc                          axs103_defconfig
mips                         tb0219_defconfig
xtensa                  audio_kc705_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
sh                   sh7770_generic_defconfig
sh                           se7343_defconfig
arm                          simpad_defconfig
m68k                          hp300_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                             espt_defconfig
mips                  decstation_64_defconfig
sh                              ul2_defconfig
arm                        mvebu_v5_defconfig
arm                           stm32_defconfig
mips                         mpc30x_defconfig
powerpc64                        alldefconfig
mips                        bcm63xx_defconfig
powerpc                 mpc834x_itx_defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
sh                           se7721_defconfig
h8300                       h8s-sim_defconfig
powerpc                      mgcoge_defconfig
sh                             sh03_defconfig
arm                       aspeed_g4_defconfig
sh                            titan_defconfig
powerpc                       holly_defconfig
mips                       bmips_be_defconfig
xtensa                  nommu_kc705_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
