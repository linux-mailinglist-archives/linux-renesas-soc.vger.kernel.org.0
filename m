Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C5E3FDF15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 17:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343744AbhIAPzV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 11:55:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:40116 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244935AbhIAPzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 11:55:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="205917046"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; 
   d="scan'208";a="205917046"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 08:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; 
   d="scan'208";a="688417360"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2021 08:54:21 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mLSZB-00081K-74; Wed, 01 Sep 2021 15:54:21 +0000
Date:   Wed, 01 Sep 2021 23:54:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 94ab75aecb2229dc1286e97ea92c4c0333eab270
Message-ID: <612fa219.2srjB+AlqfN3rx6+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 94ab75aecb2229dc1286e97ea92c4c0333eab270  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 1335m

configs tested: 80
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210831
x86_64               randconfig-a001-20210831
x86_64               randconfig-a003-20210831
x86_64               randconfig-a002-20210831
x86_64               randconfig-a004-20210831
x86_64               randconfig-a006-20210831
i386                 randconfig-a005-20210831
i386                 randconfig-a002-20210831
i386                 randconfig-a003-20210831
i386                 randconfig-a006-20210831
i386                 randconfig-a004-20210831
i386                 randconfig-a001-20210831
arc                  randconfig-r043-20210831
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210831
x86_64               randconfig-a015-20210831
x86_64               randconfig-a013-20210831
x86_64               randconfig-a016-20210831
x86_64               randconfig-a012-20210831
x86_64               randconfig-a011-20210831
i386                 randconfig-a016-20210831
i386                 randconfig-a011-20210831
i386                 randconfig-a015-20210831
i386                 randconfig-a014-20210831
i386                 randconfig-a012-20210831
i386                 randconfig-a013-20210831
s390                 randconfig-r044-20210831
hexagon              randconfig-r041-20210831
hexagon              randconfig-r045-20210831
riscv                randconfig-r042-20210831

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
