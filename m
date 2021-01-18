Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3401C2FAD17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 23:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732689AbhARWI7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 17:08:59 -0500
Received: from mga04.intel.com ([192.55.52.120]:41704 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387532AbhARWI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 17:08:56 -0500
IronPort-SDR: huJTvbOvnfU6G05Jc2/RPFdDxyvhRX6syeg17QZ4tGxchJmjYLDjuMbCN6LDP5H6/8spnSfyf1
 FzZccsgNnpeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="176281570"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="176281570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 14:08:13 -0800
IronPort-SDR: 9ii295wGI+aOhgy27ZA+VGuQoRaJgV0WoQoQwdw9wTiHdiC0s10ZbiUHulDbp4RCn5OpKNpufS
 XkTA3Gg7w7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="350322584"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2021 14:08:11 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l1ch0-0004TX-TD; Mon, 18 Jan 2021 22:08:10 +0000
Date:   Tue, 19 Jan 2021 06:07:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 b72b30fb341d0acba58431da7519d4643aa85b34
Message-ID: <600606a9.LgVtdhFSWf8DM+Oc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b72b30fb341d0acba58431da7519d4643aa85b34  Merge branch 'renesas-arm-dt-for-v5.12' into renesas-next

elapsed time: 723m

configs tested: 86
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
c6x                                 defconfig
sh                         microdev_defconfig
powerpc                      ppc6xx_defconfig
xtensa                          iss_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           h3600_defconfig
mips                        jmr3927_defconfig
arc                           tb10x_defconfig
powerpc                   motionpro_defconfig
arm                         at91_dt_defconfig
arm                            hisi_defconfig
mips                       bmips_be_defconfig
powerpc                 linkstation_defconfig
m68k                          atari_defconfig
arm                           omap1_defconfig
mips                        bcm63xx_defconfig
arm                         shannon_defconfig
arm                            zeus_defconfig
openrisc                  or1klitex_defconfig
m68k                         amcore_defconfig
powerpc                       holly_defconfig
m68k                       m5275evb_defconfig
mips                      bmips_stb_defconfig
powerpc                        cell_defconfig
powerpc                     stx_gp3_defconfig
arm                      integrator_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210118
x86_64               randconfig-a006-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
