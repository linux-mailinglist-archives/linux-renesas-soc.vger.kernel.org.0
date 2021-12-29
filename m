Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1AC480FDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 06:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhL2FPr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 00:15:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:42621 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhL2FPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 00:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640754946; x=1672290946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kQAm/NLYMXJQ2h8waS2oEP7Qvv+D8gtgUSo9wFObM7s=;
  b=UXu5iJ49NrBl5M2w1ByjoU3WANLWk2uLYcaf/LOyM8IoICGKByg863WT
   /y5pDDKcPGnzNofCyy3aXTxzR3IJnm9ArIhG6OAnQcl5iSQ3He5IOhTjX
   SmDReWNdu7H11q56xWb0st7xwyN/ttnXNNMyvUe0Mj0xK09nlJ11Npzze
   JpkXzBadfM5w5uq2++4NFGLeEOP1ZMV281ge3nBdjgek1Z9WwW7HKURtt
   km0kxTnGaGeRC+q72Ny9Tos14u9Ze9VPGD6Yuxivaud6xJu/pmb0SKm23
   YqqaVMS1gF34hKP2oCLPd/HRKhNj7ZvxOqHyU31BbAjxuoW5vVq8W7hhS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="327792419"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="327792419"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 21:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="486518605"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Dec 2021 21:15:45 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n2RJQ-0008Yk-Oh; Wed, 29 Dec 2021 05:15:44 +0000
Date:   Wed, 29 Dec 2021 13:15:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 46d6b2811be934ba861659b49092c4bdd588f777
Message-ID: <61cbeeda.piFw3eBnvmRfubi7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 46d6b2811be934ba861659b49092c4bdd588f777  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 722m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20211228
riscv                    nommu_virt_defconfig
mips                         tb0226_defconfig
powerpc                     mpc5200_defconfig
m68k                        mvme16x_defconfig
arm                          pxa3xx_defconfig
powerpc                   bluestone_defconfig
mips                      bmips_stb_defconfig
arm                             ezx_defconfig
sh                           se7343_defconfig
powerpc                     skiroot_defconfig
openrisc                            defconfig
sh                         ecovec24_defconfig
sh                        edosk7705_defconfig
powerpc                       maple_defconfig
mips                     loongson2k_defconfig
mips                        maltaup_defconfig
arm                            xcep_defconfig
mips                          ath79_defconfig
powerpc                         ps3_defconfig
arm                  randconfig-c002-20211228
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a002-20211228
i386                 randconfig-a003-20211228
i386                 randconfig-a001-20211228
i386                 randconfig-a005-20211228
i386                 randconfig-a006-20211228
i386                 randconfig-a004-20211228
x86_64               randconfig-a005-20211228
x86_64               randconfig-a001-20211228
x86_64               randconfig-a003-20211228
x86_64               randconfig-a006-20211228
x86_64               randconfig-a004-20211228
x86_64               randconfig-a002-20211228
arc                  randconfig-r043-20211228
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a014-20211228
x86_64               randconfig-a016-20211228
x86_64               randconfig-a015-20211228
i386                 randconfig-a012-20211228
i386                 randconfig-a011-20211228
i386                 randconfig-a013-20211228
i386                 randconfig-a016-20211228
i386                 randconfig-a014-20211228
i386                 randconfig-a015-20211228
hexagon              randconfig-r041-20211228
riscv                randconfig-r042-20211228
s390                 randconfig-r044-20211228
hexagon              randconfig-r045-20211228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
