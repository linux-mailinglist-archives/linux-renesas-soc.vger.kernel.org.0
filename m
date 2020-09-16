Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917BF26BAD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 05:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIPDoS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 23:44:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:15593 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgIPDnU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 23:43:20 -0400
IronPort-SDR: v295vVCvbFLPjMJO/H3KjZaHVc9jPz9/6A90dGYriVNMr72EFFzqQfX6PSQA2aRAdsqIGciRfB
 g31bGBBnvz4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147145234"
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; 
   d="scan'208";a="147145234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 20:43:08 -0700
IronPort-SDR: GSl2Wn138Rmn9TfNhU+n/bMWWpyHaSi/kgCfpaFbc871m6R/YfmNCCFrEuMbc/RWXWwOB8i3Hb
 Ce7tfqMc+kjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; 
   d="scan'208";a="451679701"
Received: from lkp-server01.sh.intel.com (HELO 96654786cb26) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Sep 2020 20:43:07 -0700
Received: from kbuild by 96654786cb26 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kIOLa-0000PN-Oc; Wed, 16 Sep 2020 03:43:06 +0000
Date:   Wed, 16 Sep 2020 11:42:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 1ada85b6201dfaf0c5b40ceaa31789d8605b086f
Message-ID: <5f618993.lXmWDaHEYuTGblGD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: 1ada85b6201dfaf0c5b40ceaa31789d8605b086f  arm64: dts: renesas: r8a77990: Add DRIF support

elapsed time: 1119m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        workpad_defconfig
sh                          rsk7203_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        mvebu_v7_defconfig
sh                     sh7710voipgw_defconfig
arm                          pxa3xx_defconfig
arm                              zx_defconfig
powerpc                      ppc40x_defconfig
mips                        vocore2_defconfig
sh                               j2_defconfig
arm                          ixp4xx_defconfig
xtensa                              defconfig
mips                         cobalt_defconfig
sh                          r7780mp_defconfig
powerpc                    mvme5100_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         shannon_defconfig
powerpc                      pcm030_defconfig
parisc                generic-64bit_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      mgcoge_defconfig
ia64                                defconfig
mips                        bcm47xx_defconfig
arc                        nsimosci_defconfig
arm                         ebsa110_defconfig
arm                          gemini_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8560_defconfig
powerpc                      obs600_defconfig
riscv                            alldefconfig
arm                        multi_v5_defconfig
arm                        clps711x_defconfig
arm                         socfpga_defconfig
arm                           corgi_defconfig
mips                           rs90_defconfig
powerpc                      pmac32_defconfig
powerpc                     tqm8541_defconfig
arm                         hackkit_defconfig
nds32                             allnoconfig
arm                             ezx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
arm                        spear6xx_defconfig
mips                           jazz_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc64e_defconfig
arm                         lpc18xx_defconfig
mips                     loongson1c_defconfig
sh                   secureedge5410_defconfig
mips                  decstation_64_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
riscv                            allmodconfig
arm                        spear3xx_defconfig
s390                       zfcpdump_defconfig
mips                         rt305x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                        apsh4ad0a_defconfig
sparc64                          alldefconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200916
x86_64               randconfig-a004-20200916
x86_64               randconfig-a003-20200916
x86_64               randconfig-a002-20200916
x86_64               randconfig-a001-20200916
x86_64               randconfig-a005-20200916
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
i386                 randconfig-a004-20200914
i386                 randconfig-a006-20200914
i386                 randconfig-a001-20200914
i386                 randconfig-a003-20200914
i386                 randconfig-a002-20200914
i386                 randconfig-a005-20200914
i386                 randconfig-a004-20200916
i386                 randconfig-a006-20200916
i386                 randconfig-a003-20200916
i386                 randconfig-a001-20200916
i386                 randconfig-a002-20200916
i386                 randconfig-a005-20200916
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200916
i386                 randconfig-a014-20200916
i386                 randconfig-a011-20200916
i386                 randconfig-a013-20200916
i386                 randconfig-a016-20200916
i386                 randconfig-a012-20200916
i386                 randconfig-a015-20200914
i386                 randconfig-a014-20200914
i386                 randconfig-a011-20200914
i386                 randconfig-a013-20200914
i386                 randconfig-a016-20200914
i386                 randconfig-a012-20200914
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200916
x86_64               randconfig-a011-20200916
x86_64               randconfig-a016-20200916
x86_64               randconfig-a012-20200916
x86_64               randconfig-a015-20200916
x86_64               randconfig-a013-20200916
x86_64               randconfig-a006-20200913
x86_64               randconfig-a004-20200913
x86_64               randconfig-a003-20200913
x86_64               randconfig-a002-20200913
x86_64               randconfig-a005-20200913
x86_64               randconfig-a001-20200913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
