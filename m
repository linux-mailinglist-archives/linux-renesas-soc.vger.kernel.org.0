Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D13386D2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 00:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243397AbhEQWtd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 18:49:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:36352 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237094AbhEQWtc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 18:49:32 -0400
IronPort-SDR: XhNNFjcJmBx+C3VskcXkpkk06Eoc33F6YvRv73BCBZxpACBWrlyFiJZCmCmUvrzIJ1+4jH31nR
 4juYsszCcDLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180860171"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180860171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 15:48:15 -0700
IronPort-SDR: AkBychk1J545afe6HL032FKuEi224dA5Beu8uiM++zJUw03SE35AY5rg+FvIFKKWTkD9ETypD1
 HHUaNAQKAHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="466123778"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 May 2021 15:48:14 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lim22-0001ws-3F; Mon, 17 May 2021 22:48:14 +0000
Date:   Tue, 18 May 2021 06:47:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 9febaddc47f6accce3d4acf45821a8c948e47549
Message-ID: <60a2f277.ok0P1WWrp37IjBLW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9febaddc47f6accce3d4acf45821a8c948e47549  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v5.13-rc2' into renesas-devel

elapsed time: 724m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
sh                          polaris_defconfig
m68k                        m5407c3_defconfig
powerpc                          g5_defconfig
arm                            mps2_defconfig
powerpc                     mpc5200_defconfig
nios2                            allyesconfig
mips                     loongson1c_defconfig
powerpc                   currituck_defconfig
sh                             shx3_defconfig
mips                         rt305x_defconfig
arc                          axs101_defconfig
nios2                         3c120_defconfig
arm                         lpc18xx_defconfig
sh                         apsh4a3a_defconfig
sh                           sh2007_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a002-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
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
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
