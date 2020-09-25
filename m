Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB4D279483
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Sep 2020 01:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgIYXGL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 19:06:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:54867 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725272AbgIYXGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 19:06:11 -0400
IronPort-SDR: aYOfUrYTWdN9vmKfVWe7U7zQ5adInqfoYFNLLcfI+qeKuRqCrT3TDLZ4Rif3ADoB67N2WG7vqa
 DAH0jk6myEyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="159046661"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="159046661"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 14:33:00 -0700
IronPort-SDR: gfaDuluMg/watMf/IKj1j3uel07X+wrzDjbQQ967QN77SBUwHcpFDg9wsPLGUbxdsBoOXsC0pm
 2xylOHCG0eNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="339668201"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2020 14:32:58 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLvKs-0000G5-0B; Fri, 25 Sep 2020 21:32:58 +0000
Date:   Sat, 26 Sep 2020 05:32:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 1ff27687ae7e65b4b29db46b5b84319977d9085e
Message-ID: <5f6e61f3.6yM13xdzQDOiDA3Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: 1ff27687ae7e65b4b29db46b5b84319977d9085e  Merge branch 'renesas-fixes-for-v5.9' into renesas-next

elapsed time: 720m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
arm                         bcm2835_defconfig
arm                           stm32_defconfig
arm                          collie_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
h8300                            alldefconfig
arm                        trizeps4_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7264_defconfig
sh                          sdk7786_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc32xx_defconfig
powerpc                     tqm8548_defconfig
powerpc                   bluestone_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7785rp_defconfig
powerpc                     taishan_defconfig
sh                      rts7751r2d1_defconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
arm                         at91_dt_defconfig
m68k                        m5307c3_defconfig
mips                      bmips_stb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
mips                         tb0287_defconfig
mips                         db1xxx_defconfig
arm                            dove_defconfig
ia64                                defconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g4_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
arm                     davinci_all_defconfig
arm                         hackkit_defconfig
ia64                          tiger_defconfig
ia64                            zx1_defconfig
powerpc                        cell_defconfig
arc                          axs103_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
arm                            xcep_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
mips                         bigsur_defconfig
mips                     loongson1c_defconfig
c6x                         dsk6455_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc837x_mds_defconfig
sh                            migor_defconfig
microblaze                          defconfig
arm                      tct_hammer_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
mips                          ath79_defconfig
ia64                             allmodconfig
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
i386                 randconfig-a002-20200925
i386                 randconfig-a006-20200925
i386                 randconfig-a003-20200925
i386                 randconfig-a004-20200925
i386                 randconfig-a005-20200925
i386                 randconfig-a001-20200925
x86_64               randconfig-a011-20200925
x86_64               randconfig-a013-20200925
x86_64               randconfig-a014-20200925
x86_64               randconfig-a015-20200925
x86_64               randconfig-a012-20200925
x86_64               randconfig-a016-20200925
i386                 randconfig-a012-20200925
i386                 randconfig-a014-20200925
i386                 randconfig-a016-20200925
i386                 randconfig-a013-20200925
i386                 randconfig-a011-20200925
i386                 randconfig-a015-20200925
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200925
x86_64               randconfig-a003-20200925
x86_64               randconfig-a004-20200925
x86_64               randconfig-a002-20200925
x86_64               randconfig-a006-20200925
x86_64               randconfig-a001-20200925

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
