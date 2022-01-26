Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1B349C412
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 08:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbiAZHLo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 02:11:44 -0500
Received: from mga01.intel.com ([192.55.52.88]:4881 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbiAZHLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 02:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643181103; x=1674717103;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0T98iZozHXG1wN0AZ/qhP73zktezoYpCmb8Pp6xWJ/4=;
  b=ZeqkBtFyCYCZSs6GcPj5WCr2TkwfjvWhsoqWFN9NoMqh2dHsND52PjJo
   3tmQWjfJdRV0ZGfyIMilTCVwZ2kueKZ/enTCCGNotr+2QrDLT5MxsAXgP
   fDisUY/PQcN8RhAgLzuvm8NDCXozzhgzm1rGsBy4lRVyiF7uFMpRhF5x9
   GCy3yPR+RFcLLlEraej98W0DwDJOAf3VfJBEpqZGhbfl7W7lA/LmNNSng
   I/4/gzVUmTNSHSDUqwUCFcWrrqiTH6wqITu4Usen+J3fwFrKDJgSTD0EY
   RtBmWY4WxYw5OLxXOfR/bc8THHIRDb2uzIfY4mvP76IDtJvmJCqYr+77r
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="270945976"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="270945976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 23:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="520698831"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Jan 2022 23:11:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCcSu-000Kun-Gi; Wed, 26 Jan 2022 07:11:36 +0000
Date:   Wed, 26 Jan 2022 15:11:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 5a18605deb7f02e3fc94aad4c2f028b49797e4d3
Message-ID: <61f0f415.DO0D2srGUgNIIfI7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 5a18605deb7f02e3fc94aad4c2f028b49797e4d3  eeprom: at25: Restore missing allocation

elapsed time: 958m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220125
h8300                       h8s-sim_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
sh                            shmin_defconfig
openrisc                  or1klitex_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
arm                        trizeps4_defconfig
sh                           se7780_defconfig
arm                            zeus_defconfig
sh                         ap325rxa_defconfig
nios2                         10m50_defconfig
powerpc                 mpc834x_mds_defconfig
s390                             allyesconfig
arm                  randconfig-c002-20220124
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a006-20220124
arc                  randconfig-r043-20220124
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
s390                 randconfig-c005-20220124
x86_64               randconfig-c007-20220124
riscv                randconfig-c006-20220124
arm                                 defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a012-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
riscv                randconfig-r042-20220124
s390                 randconfig-r044-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
