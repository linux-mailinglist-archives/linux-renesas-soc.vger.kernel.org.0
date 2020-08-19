Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73BE2491E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 02:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgHSArz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 20:47:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:24081 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgHSAry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 20:47:54 -0400
IronPort-SDR: 2zDHo2pedeRQ4AGrVJDN7w4kwv8qAwDKGa6NtSkmkTcF+YwH9DYduj3TMiwHekdVsouBbpYbcm
 xnRw+xFTfVuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="156098922"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="156098922"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 17:47:54 -0700
IronPort-SDR: SPYMySbY2udhRse5widDX7z0x4WHR0bhJCJrji0IcqzxXQnj+EcfLRWZkaWOI2GQudh1kI1Ccm
 NatN4ntVzuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="497048691"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2020 17:47:52 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8CGe-0001UC-27; Wed, 19 Aug 2020 00:47:52 +0000
Date:   Wed, 19 Aug 2020 08:47:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 11d79e52577798c573a6f7bbaeb0fc0e7d5f00fb
Message-ID: <5f3c76ab.kAR5A8Y/L00m0gL9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 11d79e52577798c573a6f7bbaeb0fc0e7d5f00fb  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2391m

configs tested: 86
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        apsh4ad0a_defconfig
arm                            hisi_defconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
mips                          rb532_defconfig
powerpc                     mpc83xx_defconfig
sh                            hp6xx_defconfig
ia64                             alldefconfig
mips                malta_kvm_guest_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pcm027_defconfig
ia64                            zx1_defconfig
powerpc                     powernv_defconfig
mips                             allyesconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                      ppc44x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20200817
i386                 randconfig-a001-20200817
i386                 randconfig-a002-20200817
i386                 randconfig-a003-20200817
i386                 randconfig-a006-20200817
i386                 randconfig-a004-20200817
i386                 randconfig-a016-20200817
i386                 randconfig-a011-20200817
i386                 randconfig-a013-20200817
i386                 randconfig-a015-20200817
i386                 randconfig-a014-20200817
i386                 randconfig-a012-20200817
x86_64               randconfig-a006-20200817
x86_64               randconfig-a001-20200817
x86_64               randconfig-a005-20200817
x86_64               randconfig-a003-20200817
x86_64               randconfig-a002-20200817
x86_64               randconfig-a004-20200817
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
