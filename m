Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3A11EC7D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2020 05:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgFCDde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 23:33:34 -0400
Received: from mga18.intel.com ([134.134.136.126]:2161 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgFCDde (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 23:33:34 -0400
IronPort-SDR: RFY+P4EHxVoRvIPbMa3X/CHhJewZ3IOLPmRwEspJYWxRqn6QFNLLoWI4Y1o5Rmua0+8GN4Qsb+
 SiWzaSNTGYDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 20:33:32 -0700
IronPort-SDR: 6q4dIrwoUVXTi4S4CTonve+IOXVrw1b9ru2De5Y9s8cisO8K3BzrApRIoVDSeFkFIvcO2VAQxd
 OvOd7cJa1Vhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; 
   d="scan'208";a="272587395"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jun 2020 20:33:31 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgK9j-0000Kp-1V; Wed, 03 Jun 2020 03:33:31 +0000
Date:   Wed, 03 Jun 2020 11:33:16 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 4d79b3d7f591ba9e736bb2b3e76493d51f18f068
Message-ID: <5ed719fc.mPFQ7MprU/7p1KAY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 4d79b3d7f591ba9e736bb2b3e76493d51f18f068  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 812m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
alpha                            alldefconfig
arm                         lpc18xx_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
i386                 randconfig-a001-20200602
i386                 randconfig-a006-20200602
i386                 randconfig-a002-20200602
i386                 randconfig-a005-20200602
i386                 randconfig-a003-20200602
i386                 randconfig-a004-20200602
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
