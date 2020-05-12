Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12F71CFE0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2020 21:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbgELTMX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 May 2020 15:12:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:2010 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELTMX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 15:12:23 -0400
IronPort-SDR: nCAIujEZj32D+EtraLr9GkSjjTHkQ34UiaPYxF9I5JtW//CiYzRsirpf0rb7clnvc4UakDSie1
 wltUt7yFS2kA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 12:12:22 -0700
IronPort-SDR: 1NaN/n0vEyWGFBG/DGwKmMUkLYjah8C41OHSEq+zh+8L+MSOPQJGIsvu9iUbv5bDBxlhDw9xIu
 qU/7lFttrr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="280243805"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2020 12:12:20 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYaKC-000EPs-9g; Wed, 13 May 2020 03:12:20 +0800
Date:   Wed, 13 May 2020 03:12:01 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 c3f36fc27ef6f3eff5e5b3b44f639ce3c9e910f9
Message-ID: <5ebaf501.Jc5Mh+GBGJpZ1IjO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: c3f36fc27ef6f3eff5e5b3b44f639ce3c9e910f9  Merge branch 'renesas-arm-dt-for-v5.8' into renesas-next

elapsed time: 483m

configs tested: 119
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
m68k                        stmark2_defconfig
arm                  colibri_pxa300_defconfig
c6x                        evmc6457_defconfig
powerpc                     powernv_defconfig
mips                 decstation_r4k_defconfig
arm                       aspeed_g4_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
openrisc                    or1ksim_defconfig
h8300                     edosk2674_defconfig
sh                           se7751_defconfig
i386                                defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
arm64                            alldefconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
sh                             sh03_defconfig
riscv                            allyesconfig
arm                         lpc32xx_defconfig
sh                            titan_defconfig
arc                           tb10x_defconfig
powerpc                         wii_defconfig
s390                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200512
i386                 randconfig-a005-20200512
i386                 randconfig-a003-20200512
i386                 randconfig-a001-20200512
i386                 randconfig-a004-20200512
i386                 randconfig-a002-20200512
x86_64               randconfig-a016-20200512
x86_64               randconfig-a012-20200512
x86_64               randconfig-a015-20200512
x86_64               randconfig-a013-20200512
x86_64               randconfig-a014-20200512
x86_64               randconfig-a011-20200512
i386                 randconfig-a012-20200512
i386                 randconfig-a016-20200512
i386                 randconfig-a014-20200512
i386                 randconfig-a011-20200512
i386                 randconfig-a013-20200512
i386                 randconfig-a015-20200512
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
