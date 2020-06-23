Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AC42047EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 05:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731803AbgFWDWn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 23:22:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:22293 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731792AbgFWDWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 23:22:42 -0400
IronPort-SDR: sbhnKO91czOoM8mT76s2AN7My5nA7GFeLTehph2PG9RNJpzMUW4RqZUPMVdflC7SBwQ9TyIpN9
 wL/qWkHtwyFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="141445839"
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; 
   d="scan'208";a="141445839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2020 20:22:41 -0700
IronPort-SDR: HpqUs1ggEGzKficLNC9pjXHOkhGDH3gQ+azfxai8ee3sV2tYHYZacJzZIToz2wqxpkdTOOpA8o
 mP+naUTAF36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; 
   d="scan'208";a="301060524"
Received: from lkp-server01.sh.intel.com (HELO f484c95e4fd1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 20:22:39 -0700
Received: from kbuild by f484c95e4fd1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jnZWA-0000aP-EJ; Tue, 23 Jun 2020 03:22:38 +0000
Date:   Tue, 23 Jun 2020 11:21:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 52bc5ea6edde35bc65ed6ecd7639534e78002c74
Message-ID: <5ef17554.ryuss0tuvEevGtk1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: 52bc5ea6edde35bc65ed6ecd7639534e78002c74  clk: renesas: rzg2: Mark RWDT clocks as critical

elapsed time: 727m

configs tested: 122
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
nds32                            alldefconfig
mips                         mpc30x_defconfig
arm                            dove_defconfig
arm                          lpd270_defconfig
xtensa                           allyesconfig
arm                           corgi_defconfig
arm                            mmp2_defconfig
arm                        realview_defconfig
mips                malta_kvm_guest_defconfig
arm                         s3c6400_defconfig
xtensa                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
parisc                           alldefconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       netwinder_defconfig
mips                          ath79_defconfig
sh                           se7724_defconfig
powerpc64                           defconfig
arm                       versatile_defconfig
arm                        multi_v5_defconfig
ia64                             allyesconfig
xtensa                    xip_kc705_defconfig
arm                        keystone_defconfig
m68k                            mac_defconfig
sh                           sh2007_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
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
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
x86_64               randconfig-a004-20200622
x86_64               randconfig-a002-20200622
x86_64               randconfig-a003-20200622
x86_64               randconfig-a005-20200622
x86_64               randconfig-a001-20200622
x86_64               randconfig-a006-20200622
i386                 randconfig-a006-20200622
i386                 randconfig-a002-20200622
i386                 randconfig-a003-20200622
i386                 randconfig-a001-20200622
i386                 randconfig-a005-20200622
i386                 randconfig-a004-20200622
i386                 randconfig-a013-20200622
i386                 randconfig-a016-20200622
i386                 randconfig-a012-20200622
i386                 randconfig-a014-20200622
i386                 randconfig-a015-20200622
i386                 randconfig-a011-20200622
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
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
