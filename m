Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5382607BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 02:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgIHAjV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 20:39:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:20464 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgIHAjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 20:39:20 -0400
IronPort-SDR: TG3smD1QQd2k+twQlTHreuhylpUzKysefbHMIHMKYt1k4P4475E/MQgJ6yRrdVhDtct48PuP1b
 RL3fROy4TUPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="155456295"
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="155456295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 17:39:19 -0700
IronPort-SDR: 8QXh9byMmiKMc0Sz2fO5QBKlbK+ntmR0nrAD242u3XBdVokrK8BvEQ36YYReF473mk/CWgh8ya
 ouiZDcQEbChA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="377349796"
Received: from lkp-server02.sh.intel.com (HELO a98deea729ba) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2020 17:39:18 -0700
Received: from kbuild by a98deea729ba with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFRfJ-0000Kf-DH; Tue, 08 Sep 2020 00:39:17 +0000
Date:   Tue, 08 Sep 2020 08:38:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 b7ecb51b2d9bd12c80c24d2fd1cadedd35e7cb7e
Message-ID: <5f56d28a.2xHVnQ2eA2a5OCnM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: b7ecb51b2d9bd12c80c24d2fd1cadedd35e7cb7e  arm64: dts: renesas: r8a774e1: Add PCIe EP nodes

elapsed time: 737m

configs tested: 129
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
mips                        workpad_defconfig
mips                     cu1000-neo_defconfig
powerpc                          g5_defconfig
mips                          ath25_defconfig
arm                          pcm027_defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlp_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
mips                           ip27_defconfig
arm                   milbeaut_m10v_defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
mips                 decstation_r4k_defconfig
alpha                               defconfig
arm                       omap2plus_defconfig
nios2                         3c120_defconfig
sh                         apsh4a3a_defconfig
m68k                          atari_defconfig
powerpc                     pseries_defconfig
arc                        nsimosci_defconfig
powerpc                      tqm8xx_defconfig
mips                           rs90_defconfig
xtensa                       common_defconfig
arm                            u300_defconfig
c6x                        evmc6457_defconfig
arc                              allyesconfig
sh                   sh7724_generic_defconfig
mips                          ath79_defconfig
openrisc                    or1ksim_defconfig
sh                          lboxre2_defconfig
arc                                 defconfig
powerpc                    amigaone_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
arm                  colibri_pxa270_defconfig
arm                        neponset_defconfig
powerpc                    mvme5100_defconfig
openrisc                            defconfig
ia64                             alldefconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
arm                             ezx_defconfig
mips                       lemote2f_defconfig
m68k                         apollo_defconfig
arm                            zeus_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
m68k                            mac_defconfig
mips                malta_kvm_guest_defconfig
s390                          debug_defconfig
c6x                        evmc6678_defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
powerpc                      ppc64e_defconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
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

clang tested configs:
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
