Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C30023C3EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 05:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHEDRk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 23:17:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:61975 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgHEDRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 23:17:40 -0400
IronPort-SDR: vyFsyDOK8cF349DxJpU+20QyoCSIh8PQwe/IF4vxw/jQ7Q+2vNea6TT0ZxysvTM05U/nqua1Rh
 ULnEoVCFmAZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="132533678"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="132533678"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 20:17:39 -0700
IronPort-SDR: HWO8lITh1HGbQUgR2YIl1z3aJf9eZgcoQnt7a+vsRiJcJM9IHqOj9kRuGGF83o5lHJiMJboZpO
 LXiMke+EOjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="322972834"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2020 20:17:37 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k39vt-0000YT-3F; Wed, 05 Aug 2020 03:17:37 +0000
Date:   Wed, 05 Aug 2020 11:16:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/ravb-internal-clock-delays-v3] BUILD
 SUCCESS 041c6874403e6deab5aa6bbb79ddd17b5fe8c8e2
Message-ID: <5f2a2496.jYgXaZvaKSh+J2hV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  topic/ravb-internal-clock-delays-v3
branch HEAD: 041c6874403e6deab5aa6bbb79ddd17b5fe8c8e2  squash! arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay handling

elapsed time: 720m

configs tested: 81
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
mips                            gpr_defconfig
arm                       spear13xx_defconfig
mips                      maltasmvp_defconfig
arm                  colibri_pxa300_defconfig
arm                       netwinder_defconfig
arm                       versatile_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        bcm63xx_defconfig
sh                          r7785rp_defconfig
sh                            shmin_defconfig
arm                        multi_v7_defconfig
powerpc                      chrp32_defconfig
powerpc                     powernv_defconfig
sh                          sdk7786_defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20200805
i386                 randconfig-a004-20200805
i386                 randconfig-a001-20200805
i386                 randconfig-a003-20200805
i386                 randconfig-a002-20200805
i386                 randconfig-a006-20200805
x86_64               randconfig-a013-20200805
x86_64               randconfig-a011-20200805
x86_64               randconfig-a012-20200805
x86_64               randconfig-a016-20200805
x86_64               randconfig-a015-20200805
x86_64               randconfig-a014-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
i386                 randconfig-a014-20200805
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
