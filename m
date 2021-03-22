Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7D5345139
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 21:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhCVU5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 16:57:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:63620 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhCVU5p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 16:57:45 -0400
IronPort-SDR: KMmGNk3/E/nEYIyq+wA0DQCc+mzemQdcvjPCiN6b5/8ly5TIgIQkhLnknL9jAaAiG9R/2/YXXU
 Bl5QeZ7n9w2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190374917"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="190374917"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 13:57:45 -0700
IronPort-SDR: PXdJw7n9klkWhVa77v2goICKzx2tZVttMpXXFYIDXWojJzjr3LFoXBIyl3IBk22PUDCL+J/b2Z
 ktFT77svaYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="592747450"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Mar 2021 13:57:43 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lORcN-0000FM-2E; Mon, 22 Mar 2021 20:57:43 +0000
Date:   Tue, 23 Mar 2021 04:56:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d
Message-ID: <6059048c.jZWHBZOUYezlt0xS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d  Merge branch 'renesas-next', tag 'v5.12-rc4' into renesas-devel

elapsed time: 720m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
mips                     decstation_defconfig
mips                         db1xxx_defconfig
xtensa                  audio_kc705_defconfig
arm                             ezx_defconfig
powerpc                     ppa8548_defconfig
sh                        edosk7705_defconfig
sh                           se7705_defconfig
mips                       bmips_be_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
mips                        nlm_xlp_defconfig
sh                           se7780_defconfig
mips                           ip27_defconfig
i386                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     kmeter1_defconfig
sh                     magicpanelr2_defconfig
nds32                            alldefconfig
m68k                        m5407c3_defconfig
ia64                          tiger_defconfig
arm                        vexpress_defconfig
ia64                      gensparse_defconfig
arm                       versatile_defconfig
arm                            dove_defconfig
mips                        vocore2_defconfig
arm                            qcom_defconfig
m68k                        mvme16x_defconfig
sparc64                             defconfig
arm                        mini2440_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210322
i386                 randconfig-a003-20210322
i386                 randconfig-a001-20210322
i386                 randconfig-a002-20210322
i386                 randconfig-a006-20210322
i386                 randconfig-a005-20210322
x86_64               randconfig-a012-20210322
x86_64               randconfig-a015-20210322
x86_64               randconfig-a013-20210322
x86_64               randconfig-a014-20210322
x86_64               randconfig-a016-20210322
x86_64               randconfig-a011-20210322
i386                 randconfig-a014-20210322
i386                 randconfig-a011-20210322
i386                 randconfig-a015-20210322
i386                 randconfig-a016-20210322
i386                 randconfig-a012-20210322
i386                 randconfig-a013-20210322
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
x86_64               randconfig-a002-20210322
x86_64               randconfig-a003-20210322
x86_64               randconfig-a001-20210322
x86_64               randconfig-a006-20210322
x86_64               randconfig-a004-20210322
x86_64               randconfig-a005-20210322

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
