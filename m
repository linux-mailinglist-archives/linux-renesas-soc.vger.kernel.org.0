Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1512E7595
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 02:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgL3Brn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Dec 2020 20:47:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:10261 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgL3Brm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:47:42 -0500
IronPort-SDR: 32q+7xqGD5DixjcMmcY2EF7Qwxa696k9+X2v63Dy/4I5qJ0UVjJ0UMakAEB4CUGzYe2RT0m0uS
 zRoSt1LAtVvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="175782470"
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="175782470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 17:47:02 -0800
IronPort-SDR: o5TXuzUDfHexO0/nQosQfywdew8UxQxKTdwgLnBW3fOFVSBLvabeBAzBTqNwJww4ITC3vBFSA4
 HOZKCyFidhQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="376253075"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Dec 2020 17:47:00 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kuQZn-0003v1-Dm; Wed, 30 Dec 2020 01:46:59 +0000
Date:   Wed, 30 Dec 2020 09:46:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 458a1ec920ab378a4a9996a2ad639239eefa7a7e
Message-ID: <5febdbe2.Yg07zc74DKwIBe4+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 458a1ec920ab378a4a9996a2ad639239eefa7a7e  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 724m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7722_defconfig
sh                          polaris_defconfig
powerpc                        fsp2_defconfig
arm                           omap1_defconfig
powerpc                 mpc837x_mds_defconfig
openrisc                    or1ksim_defconfig
arm                         cm_x300_defconfig
arc                          axs101_defconfig
arm                          gemini_defconfig
powerpc                      katmai_defconfig
nios2                         3c120_defconfig
arm                            pleb_defconfig
powerpc                     sbc8548_defconfig
arm                        multi_v5_defconfig
arm                        oxnas_v6_defconfig
arm                         lubbock_defconfig
mips                           ip32_defconfig
arm                          imote2_defconfig
mips                   sb1250_swarm_defconfig
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
i386                 randconfig-a002-20201229
i386                 randconfig-a005-20201229
i386                 randconfig-a004-20201229
i386                 randconfig-a006-20201229
i386                 randconfig-a003-20201229
i386                 randconfig-a001-20201229
i386                 randconfig-a014-20201229
i386                 randconfig-a012-20201229
i386                 randconfig-a011-20201229
i386                 randconfig-a016-20201229
i386                 randconfig-a015-20201229
i386                 randconfig-a013-20201229
x86_64               randconfig-a001-20201229
x86_64               randconfig-a006-20201229
x86_64               randconfig-a002-20201229
x86_64               randconfig-a004-20201229
x86_64               randconfig-a003-20201229
x86_64               randconfig-a005-20201229
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
x86_64               randconfig-a014-20201229
x86_64               randconfig-a015-20201229
x86_64               randconfig-a016-20201229
x86_64               randconfig-a012-20201229
x86_64               randconfig-a011-20201229
x86_64               randconfig-a013-20201229

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
