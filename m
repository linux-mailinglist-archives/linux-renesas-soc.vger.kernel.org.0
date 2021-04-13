Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EE335D4E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 03:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhDMBk0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 21:40:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:24374 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237115AbhDMBk0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 21:40:26 -0400
IronPort-SDR: LRVj4Ax2BLDL0VQE7NJ1T8sA/Z2EaiGZTlM6XYHgPWpFHaBNi2aT/mfs9HiqpCLOxXS53SKlF7
 M73c0t7VkI+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="174413940"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="174413940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 18:40:05 -0700
IronPort-SDR: /0nW/hjSMs9lN0FsD3+CWmG8VehmGP8gU2wxhoDMG8LLtDDOMOb5GaSRzxlQ9N0vctJOv/xblU
 AAPdYcl7Hh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="450210482"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2021 18:40:04 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lW827-0000kR-Jh; Tue, 13 Apr 2021 01:40:03 +0000
Date:   Tue, 13 Apr 2021 09:39:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 9e681b617b0ea7601b4b2764a26e6fbfe7dd13ed
Message-ID: <6074f639.IwyH4aciHI/lMA4t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9e681b617b0ea7601b4b2764a26e6fbfe7dd13ed  Merge tag 'v5.12-rc7' into renesas-devel

elapsed time: 723m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
riscv                            allyesconfig
arc                          axs101_defconfig
arc                         haps_hs_defconfig
arm                           stm32_defconfig
mips                             allmodconfig
mips                           ci20_defconfig
sh                        sh7757lcr_defconfig
arm                         shannon_defconfig
i386                             allyesconfig
powerpc                     powernv_defconfig
arm                        realview_defconfig
ia64                          tiger_defconfig
powerpc                     tqm8555_defconfig
sh                          urquell_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                             rpc_defconfig
powerpc                      ppc64e_defconfig
arm                        oxnas_v6_defconfig
arm                         hackkit_defconfig
sh                          rsk7264_defconfig
powerpc                        warp_defconfig
arm                             ezx_defconfig
arm                          imote2_defconfig
powerpc                       maple_defconfig
um                                allnoconfig
m68k                         apollo_defconfig
arm                        multi_v5_defconfig
arm                        mini2440_defconfig
arm                         lpc32xx_defconfig
m68k                           sun3_defconfig
m68k                        m5272c3_defconfig
powerpc                      ppc44x_defconfig
nios2                            alldefconfig
arm                            qcom_defconfig
powerpc                        cell_defconfig
mips                        bcm63xx_defconfig
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
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210412
i386                 randconfig-a001-20210412
i386                 randconfig-a006-20210412
i386                 randconfig-a005-20210412
i386                 randconfig-a004-20210412
i386                 randconfig-a002-20210412
x86_64               randconfig-a014-20210412
x86_64               randconfig-a015-20210412
x86_64               randconfig-a011-20210412
x86_64               randconfig-a013-20210412
x86_64               randconfig-a012-20210412
x86_64               randconfig-a016-20210412
i386                 randconfig-a015-20210412
i386                 randconfig-a014-20210412
i386                 randconfig-a013-20210412
i386                 randconfig-a012-20210412
i386                 randconfig-a016-20210412
i386                 randconfig-a011-20210412
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210412
x86_64               randconfig-a002-20210412
x86_64               randconfig-a001-20210412
x86_64               randconfig-a005-20210412
x86_64               randconfig-a006-20210412
x86_64               randconfig-a004-20210412

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
