Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8743436CF93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Apr 2021 01:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239298AbhD0XcL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 19:32:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:16998 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236547AbhD0XcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 19:32:10 -0400
IronPort-SDR: GbDCGFbJEwJBTYniaoeJvDWpOv/KjjZXScZHUAPnr8BugeFmfk0VCxIByLtzq8m6dXgFuEj+1h
 AkIfUS6X3XEg==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176096566"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="176096566"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 16:31:26 -0700
IronPort-SDR: 92p4rM4G6f6nBTTkVGoT4zkNCSOmy4k2I315GApW7G0YX+DEbZdfhZEaWvgVi8oLzTk9sRtRQd
 vCsImT+txKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="615827769"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2021 16:31:24 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lbXAn-0006lc-EO; Tue, 27 Apr 2021 23:31:21 +0000
Date:   Wed, 28 Apr 2021 07:31:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.14] BUILD SUCCESS
 2aeefc5b8d11a68abccf69bcdcabcbb671003cc4
Message-ID: <60889ec6.7aNuToxz4eRMXLEr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.14
branch HEAD: 2aeefc5b8d11a68abccf69bcdcabcbb671003cc4  clk: renesas: rcar-usb2-clock-sel: Fix error handling in .probe()

elapsed time: 726m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sh                             sh03_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                          defconfig
parisc                           allyesconfig
mips                         tb0287_defconfig
sh                          rsk7264_defconfig
mips                     decstation_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
arm                         axm55xx_defconfig
arm                        keystone_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
sh                     magicpanelr2_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
arc                                 defconfig
arm                           u8500_defconfig
mips                      fuloong2e_defconfig
arm                         mv78xx0_defconfig
sparc                       sparc32_defconfig
powerpc                          allmodconfig
m68k                                defconfig
mips                        maltaup_defconfig
mips                           rs90_defconfig
powerpc                     mpc83xx_defconfig
sh                   sh7724_generic_defconfig
powerpc                          allyesconfig
arm                         at91_dt_defconfig
arm                      jornada720_defconfig
powerpc                 linkstation_defconfig
arm                      pxa255-idp_defconfig
powerpc                     kmeter1_defconfig
arm                              alldefconfig
powerpc                     powernv_defconfig
arm                       aspeed_g5_defconfig
sh                             shx3_defconfig
sh                          r7780mp_defconfig
sparc                            alldefconfig
arm                          pxa168_defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
s390                             alldefconfig
mips                      maltaaprp_defconfig
sh                           se7206_defconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allmodconfig
arm                           sama5_defconfig
arm                             mxs_defconfig
arc                     nsimosci_hs_defconfig
sh                        edosk7760_defconfig
arm                        mvebu_v5_defconfig
ia64                      gensparse_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      walnut_defconfig
m68k                          atari_defconfig
powerpc                         wii_defconfig
arm                        spear6xx_defconfig
powerpc64                           defconfig
arm                       cns3420vb_defconfig
powerpc                      katmai_defconfig
arm                          moxart_defconfig
arm                          pcm027_defconfig
arm                           tegra_defconfig
xtensa                       common_defconfig
sh                           se7721_defconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       holly_defconfig
arm                       netwinder_defconfig
powerpc                         ps3_defconfig
powerpc                     tqm8555_defconfig
mips                      malta_kvm_defconfig
sh                             espt_defconfig
powerpc                      bamboo_defconfig
sh                         ap325rxa_defconfig
arm                            hisi_defconfig
arm                       spear13xx_defconfig
sh                               alldefconfig
m68k                       m5475evb_defconfig
sh                          sdk7780_defconfig
openrisc                  or1klitex_defconfig
nds32                             allnoconfig
arc                            hsdk_defconfig
mips                         cobalt_defconfig
arm                      tct_hammer_defconfig
x86_64                              defconfig
powerpc                 mpc8315_rdb_defconfig
riscv                            alldefconfig
m68k                         amcore_defconfig
sh                  sh7785lcr_32bit_defconfig
openrisc                 simple_smp_defconfig
arc                          axs103_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
x86_64               randconfig-a002-20210427
x86_64               randconfig-a004-20210427
x86_64               randconfig-a001-20210427
x86_64               randconfig-a006-20210427
x86_64               randconfig-a005-20210427
x86_64               randconfig-a003-20210427
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
