Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8988A2AE66C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 03:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgKKC32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 21:29:28 -0500
Received: from mga04.intel.com ([192.55.52.120]:20517 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgKKC32 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 21:29:28 -0500
IronPort-SDR: QG4gdhcUpt2WGvar/Z/ufAW0ge/+lZAj7uGdnkycbuP5WGJ7kmx7v/29LmBxqavscFUThw4bBz
 LNVi38lDWOtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="167499643"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="167499643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 18:29:27 -0800
IronPort-SDR: pBee7H7mZNInRbC1nwBHGWJgz7pDFqF8NuPnxEZhlHzeaJOtcjfuSdeAnqop0FRAWiIZnYgxTD
 OaxOLn+Fq+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="365764512"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2020 18:29:25 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcfsz-0000b2-7Q; Wed, 11 Nov 2020 02:29:25 +0000
Date:   Wed, 11 Nov 2020 10:28:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 362cca8017579735237a35c1918c1b268dbb199d
Message-ID: <5fab4c4d.rhYo0iiIrHWegZuh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 362cca8017579735237a35c1918c1b268dbb199d  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 723m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8560_ads_defconfig
sparc                            alldefconfig
arm                        mini2440_defconfig
arm                        magician_defconfig
sh                           se7619_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                      jornada720_defconfig
mips                      pic32mzda_defconfig
arm                        realview_defconfig
mips                          ath79_defconfig
powerpc                     ksi8560_defconfig
m68k                        stmark2_defconfig
microblaze                    nommu_defconfig
mips                         tb0287_defconfig
powerpc                    amigaone_defconfig
powerpc                    klondike_defconfig
mips                            ar7_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
