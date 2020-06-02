Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954751EC1CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2020 20:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBSak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 14:30:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:56915 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgFBSak (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 14:30:40 -0400
IronPort-SDR: vCJ84jkKSN4tfpHi+zn5pujKj4ylJ5LoVE02tVMcOqa/LuE5mOftGH2b1576tgLC58a7wUP7xt
 OAUisY3uQ9tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 11:30:38 -0700
IronPort-SDR: 4jyNIxPRE/BkdVTJutMAsWaIyLqbcw2/QHJ+GC9VFiv01a1UfXnOIEi2m6IB76Cn+IxNG7UpVH
 X9I8FIMHkjsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; 
   d="scan'208";a="347489733"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2020 11:30:37 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgBgK-000064-FW; Tue, 02 Jun 2020 18:30:36 +0000
Date:   Wed, 03 Jun 2020 02:30:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 42f1d997f6739d2f12398c8ad2d5a39781a97c35
Message-ID: <5ed69aab.ZO/jAbNNaTg9qu12%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 42f1d997f6739d2f12398c8ad2d5a39781a97c35  Merge branch 'renesas-arm-dt-for-v5.9' into renesas-devel

elapsed time: 483m

configs tested: 125
configs skipped: 8

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
arc                         haps_hs_defconfig
sparc64                             defconfig
arm                      pxa255-idp_defconfig
sh                             shx3_defconfig
arm                              alldefconfig
mips                malta_qemu_32r6_defconfig
arm                      footbridge_defconfig
sh                            shmin_defconfig
mips                           ip28_defconfig
xtensa                generic_kc705_defconfig
arc                             nps_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
nios2                               defconfig
arm                        shmobile_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
alpha                            alldefconfig
mips                  maltasmvp_eva_defconfig
sh                        dreamcast_defconfig
sh                          lboxre2_defconfig
arm                           efm32_defconfig
nios2                         3c120_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
sh                         apsh4a3a_defconfig
parisc                            allnoconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
arm                         lpc18xx_defconfig
arm                              zx_defconfig
ia64                             alldefconfig
mips                        nlm_xlp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200602
i386                 randconfig-a006-20200602
i386                 randconfig-a005-20200602
x86_64               randconfig-a011-20200602
x86_64               randconfig-a016-20200602
x86_64               randconfig-a013-20200602
x86_64               randconfig-a012-20200602
x86_64               randconfig-a014-20200602
x86_64               randconfig-a015-20200602
i386                 randconfig-a014-20200602
i386                 randconfig-a015-20200602
i386                 randconfig-a011-20200602
i386                 randconfig-a016-20200602
i386                 randconfig-a012-20200602
i386                 randconfig-a013-20200602
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
