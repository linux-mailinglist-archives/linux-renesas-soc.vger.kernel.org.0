Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A486331A62
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 23:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhCHWsB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 17:48:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:53978 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhCHWrg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 17:47:36 -0500
IronPort-SDR: cF7Txo5/626JEyyYejUcId+MIfTLLLc+oytUBg8vr0kbMrdiU8X9/4warI1eUt3kOUJb4nN7TA
 dIU0EENvYsVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252145872"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="252145872"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 14:47:33 -0800
IronPort-SDR: 5ObmEG+EnndtcjiGq64yaHbvc9CjaLiPDPevIkoFCzBv0qDbAIeN3grxq4izW4ukpZ7glyqS6y
 rxmfUB4lR6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="509072342"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2021 14:47:31 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJOex-0001C8-1t; Mon, 08 Mar 2021 22:47:31 +0000
Date:   Tue, 09 Mar 2021 06:46:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 4e589d84c7429ff697e741961eda21ac05f0b7b8
Message-ID: <6046a949.ANam9fIYbPH6APFd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4e589d84c7429ff697e741961eda21ac05f0b7b8  Merge branch 'renesas-next' into renesas-devel

elapsed time: 720m

configs tested: 114
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
xtensa                  audio_kc705_defconfig
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
mips                             allmodconfig
mips                             allyesconfig
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
