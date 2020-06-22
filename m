Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEF82044D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 01:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgFVX5r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 19:57:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:19164 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728636AbgFVX5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 19:57:47 -0400
IronPort-SDR: I7oFdmTPTW97GEVP1O5Q42VZEH3zpvlUCJxI2u8WtCCpr8GIIXORjgYG7CMBq33OX0lLIbl1U2
 6WgrzIRWTUlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145409726"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; 
   d="scan'208";a="145409726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2020 16:57:44 -0700
IronPort-SDR: Opo3WzuUd6aGL02sC5WeJ5/2JDa4MCOcOFW/EMT7a14bfE2mIP131xCfEbrNA3dZMDFhgmZ6VV
 ZILKI7Eka2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; 
   d="scan'208";a="422818829"
Received: from lkp-server01.sh.intel.com (HELO f484c95e4fd1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2020 16:57:43 -0700
Received: from kbuild by f484c95e4fd1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jnWJq-0000VZ-LW; Mon, 22 Jun 2020 23:57:42 +0000
Date:   Tue, 23 Jun 2020 07:56:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 9b3e8d281c6f2fa5bf84400e9cb5a6d9df7502e3
Message-ID: <5ef14544.Arg9Gh519SwNRhZs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 9b3e8d281c6f2fa5bf84400e9cb5a6d9df7502e3  Merge tag 'v5.8-rc2' into renesas-devel

elapsed time: 722m

configs tested: 117
configs skipped: 4

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
mips                malta_kvm_guest_defconfig
arm                         s3c6400_defconfig
xtensa                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
parisc                           alldefconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       netwinder_defconfig
mips                          ath79_defconfig
xtensa                    xip_kc705_defconfig
arm                        keystone_defconfig
arm                       versatile_defconfig
m68k                            mac_defconfig
sh                           sh2007_defconfig
arm                           efm32_defconfig
m68k                             alldefconfig
m68k                         apollo_defconfig
arm                            mmp2_defconfig
powerpc                     pseries_defconfig
sh                        sh7785lcr_defconfig
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
i386                 randconfig-a006-20200622
i386                 randconfig-a002-20200622
i386                 randconfig-a003-20200622
i386                 randconfig-a001-20200622
i386                 randconfig-a005-20200622
i386                 randconfig-a004-20200622
i386                 randconfig-a016-20200622
i386                 randconfig-a012-20200622
i386                 randconfig-a014-20200622
i386                 randconfig-a015-20200622
i386                 randconfig-a011-20200622
x86_64               randconfig-a004-20200622
x86_64               randconfig-a002-20200622
x86_64               randconfig-a003-20200622
x86_64               randconfig-a005-20200622
x86_64               randconfig-a001-20200622
x86_64               randconfig-a006-20200622
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
