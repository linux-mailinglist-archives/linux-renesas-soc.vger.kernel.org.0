Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867042101BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 04:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGACFI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 22:05:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:46495 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgGACFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 22:05:07 -0400
IronPort-SDR: MBrCrW/svAEf8birec9a6MeJmW2b49U8M8klmircnqVuIs5hOsnOz3UpUn3LJA/X/y0gh3uMQy
 HJAoWHc8LsqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="164440641"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="164440641"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 19:05:01 -0700
IronPort-SDR: VceXhWkg99nPWxUQDESa5G4k07ojkP+ZfKIT64ac6dcu02vpwXnqtKhYGDtzNrMfjKtV5bY7fP
 kYo1Abdd4wcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="303657486"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2020 19:04:59 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqS7O-0002KD-V0; Wed, 01 Jul 2020 02:04:58 +0000
Date:   Wed, 01 Jul 2020 10:04:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 9275b1588a501ddc4c421b9faf7c99a37bfb8785
Message-ID: <5efbef42.JT+k8IqAXhgN/nj/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  topic/renesas-defconfig
branch HEAD: 9275b1588a501ddc4c421b9faf7c99a37bfb8785  arm64: renesas: defconfig: Enable HD3SS3220 support

elapsed time: 2442m

configs tested: 113
configs skipped: 10

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
mips                         tb0287_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pistachio_defconfig
sparc64                          allyesconfig
s390                             alldefconfig
riscv                          rv32_defconfig
sh                           se7751_defconfig
mips                     loongson1b_defconfig
arm                           sama5_defconfig
sh                           sh2007_defconfig
sh                      rts7751r2d1_defconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
xtensa                       common_defconfig
arm                         orion5x_defconfig
arm                         nhk8815_defconfig
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
i386                 randconfig-a013-20200629
i386                 randconfig-a016-20200629
i386                 randconfig-a014-20200629
i386                 randconfig-a012-20200629
i386                 randconfig-a015-20200629
i386                 randconfig-a011-20200629
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
