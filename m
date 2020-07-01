Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22E8210172
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 03:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgGAB1c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 21:27:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:16075 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgGAB1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 21:27:32 -0400
IronPort-SDR: lvy0+DoOGP83D2oUL5ptNVZRtwTKp6Ju46gTAH6HLHSb6hWhvetW6cXxQDsQOIeMPYL84A4aCA
 OQ3zeiNPnN4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146418510"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="146418510"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 18:27:31 -0700
IronPort-SDR: B45r7uTt5HmuEAmp4XdwRdyIruf9Xo/vKLb26rrJB4AYmQaECMnVHujiDG3w8kjtNKtr+Jrm19
 TB07in4Kv5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="277609345"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2020 18:27:29 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqRX6-0002JC-FG; Wed, 01 Jul 2020 01:27:28 +0000
Date:   Wed, 01 Jul 2020 09:26:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.9] BUILD SUCCESS
 6e9ca57e32f29172f02452baed7e2bccfb2c54fd
Message-ID: <5efbe63e.UO8KT68cIPABs7ex%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.9
branch HEAD: 6e9ca57e32f29172f02452baed7e2bccfb2c54fd  ARM: shmobile: defconfig: Enable RZ/A1H RTC support

elapsed time: 2404m

configs tested: 155
configs skipped: 124

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
mips                         tb0287_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pistachio_defconfig
sparc64                          allyesconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
mips                              allnoconfig
arm                         s3c2410_defconfig
openrisc                 simple_smp_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           corgi_defconfig
m68k                        m5307c3_defconfig
powerpc                          g5_defconfig
arm                           u8500_defconfig
sparc                       sparc32_defconfig
m68k                          hp300_defconfig
sh                          landisk_defconfig
sh                         apsh4a3a_defconfig
arm                          badge4_defconfig
arm                          lpd270_defconfig
mips                         tb0219_defconfig
powerpc                      mgcoge_defconfig
nds32                             allnoconfig
arm                          pcm027_defconfig
mips                         mpc30x_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                             pxa_defconfig
mips                 pnx8335_stb225_defconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
arm                           viper_defconfig
arm                          moxart_defconfig
sh                        sh7763rdp_defconfig
arm                        mvebu_v7_defconfig
arm                          exynos_defconfig
c6x                        evmc6474_defconfig
sh                           se7724_defconfig
arm                            pleb_defconfig
arm                             ezx_defconfig
xtensa                       common_defconfig
arm                       versatile_defconfig
xtensa                          iss_defconfig
sh                        sh7785lcr_defconfig
mips                   sb1250_swarm_defconfig
arm                         orion5x_defconfig
arm                         nhk8815_defconfig
powerpc                          allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200630
i386                 randconfig-a003-20200630
i386                 randconfig-a002-20200630
i386                 randconfig-a004-20200630
i386                 randconfig-a005-20200630
i386                 randconfig-a006-20200630
i386                 randconfig-a006-20200629
i386                 randconfig-a002-20200629
i386                 randconfig-a003-20200629
i386                 randconfig-a001-20200629
i386                 randconfig-a005-20200629
i386                 randconfig-a004-20200629
x86_64               randconfig-a011-20200629
x86_64               randconfig-a012-20200629
x86_64               randconfig-a013-20200629
x86_64               randconfig-a014-20200629
x86_64               randconfig-a015-20200629
x86_64               randconfig-a016-20200629
x86_64               randconfig-a011-20200630
x86_64               randconfig-a014-20200630
x86_64               randconfig-a013-20200630
x86_64               randconfig-a015-20200630
x86_64               randconfig-a016-20200630
x86_64               randconfig-a012-20200630
i386                 randconfig-a013-20200629
i386                 randconfig-a016-20200629
i386                 randconfig-a014-20200629
i386                 randconfig-a012-20200629
i386                 randconfig-a015-20200629
i386                 randconfig-a011-20200629
i386                 randconfig-a011-20200630
i386                 randconfig-a016-20200630
i386                 randconfig-a015-20200630
i386                 randconfig-a014-20200630
i386                 randconfig-a013-20200630
i386                 randconfig-a012-20200630
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
