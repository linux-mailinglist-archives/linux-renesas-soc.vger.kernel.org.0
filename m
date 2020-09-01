Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434692584E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 02:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgIAAef (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 20:34:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:7670 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgIAAef (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 20:34:35 -0400
IronPort-SDR: k1MrxXqatUSDA8/cfujvWko+OhCZcDCvzbjxL6MqsKAwfOqzNbLxfVu4Ey24gcpASXIkkksURJ
 lTfD6jP1rjzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="144771897"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="144771897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 17:34:34 -0700
IronPort-SDR: l1xA7B3pb3J4IGkW269tKAu8Lk02A+UyoqP5SltxQqOleu+DKukkvygghdg9+cX3favto0/Tyy
 mLoIGfOp+yaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="281802460"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2020 17:34:32 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCuFs-0000FV-As; Tue, 01 Sep 2020 00:34:32 +0000
Date:   Tue, 01 Sep 2020 08:34:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 bce8ac223e760a603a555d592bbdb589b6625537
Message-ID: <5f4d970a.xXxllnWVh7iKdFDG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: bce8ac223e760a603a555d592bbdb589b6625537  arm64: dts: renesas: r8a77961: Enable Sound / Audio-DMAC

elapsed time: 723m

configs tested: 99
configs skipped: 85

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            mmp2_defconfig
arm                        mini2440_defconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
sh                           se7751_defconfig
arm                           u8500_defconfig
parisc                generic-32bit_defconfig
m68k                        mvme147_defconfig
powerpc                          allmodconfig
m68k                         apollo_defconfig
sh                          r7785rp_defconfig
powerpc                     mpc83xx_defconfig
m68k                          sun3x_defconfig
arm                            u300_defconfig
powerpc                      pmac32_defconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
mips                      malta_kvm_defconfig
sh                         microdev_defconfig
mips                      bmips_stb_defconfig
arm                            mps2_defconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
powerpc                    adder875_defconfig
sh                            titan_defconfig
m68k                            mac_defconfig
mips                           gcw0_defconfig
arm                         bcm2835_defconfig
arc                            hsdk_defconfig
arm                         s5pv210_defconfig
powerpc                         wii_defconfig
sh                        sh7757lcr_defconfig
s390                       zfcpdump_defconfig
powerpc                  mpc866_ads_defconfig
arm                        magician_defconfig
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
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
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
