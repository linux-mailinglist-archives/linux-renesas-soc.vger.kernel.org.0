Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0912F390C37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 May 2021 00:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhEYWbm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 18:31:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:38670 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232815AbhEYWbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 18:31:41 -0400
IronPort-SDR: aG0GfDRaNyjDudff4VJ/FCZ6DiaEkz8Mqufk/roy9v4qQjCROoJ6yHbuqidTgWZvhhtSSRD4xv
 8KE1gtBNKwYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="181961943"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="181961943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 15:30:11 -0700
IronPort-SDR: uMGJUaykyWiJWjWIGL84d+x1lE0B5I3Jh9BRA45lPkdwquD4ZiZ6/VJsWlP9xwxGwJJz+BXlwa
 YxP/Y07Tqthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="443632840"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 May 2021 15:30:09 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llfYv-0001rK-7e; Tue, 25 May 2021 22:30:09 +0000
Date:   Wed, 26 May 2021 06:29:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.14] BUILD SUCCESS
 9558487e7d976c1b92b2bc66fb4d901b1d35437f
Message-ID: <60ad7a3a.QZ8Hjk7ww3Fg98+A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.14
branch HEAD: 9558487e7d976c1b92b2bc66fb4d901b1d35437f  arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2

elapsed time: 732m

configs tested: 220
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
arm                        clps711x_defconfig
sh                          kfr2r09_defconfig
powerpc                     rainier_defconfig
mips                         mpc30x_defconfig
um                               alldefconfig
mips                      malta_kvm_defconfig
arc                            hsdk_defconfig
arm                        realview_defconfig
powerpc                        cell_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
parisc                generic-64bit_defconfig
mips                     loongson1c_defconfig
arm                   milbeaut_m10v_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath79_defconfig
xtensa                generic_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                            allmodconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
sh                             sh03_defconfig
openrisc                            defconfig
x86_64                           alldefconfig
powerpc                     mpc83xx_defconfig
arc                          axs101_defconfig
mips                           xway_defconfig
mips                        omega2p_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
sh                         microdev_defconfig
arm                          ep93xx_defconfig
x86_64                            allnoconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ksi8560_defconfig
mips                     decstation_defconfig
ia64                            zx1_defconfig
h8300                            alldefconfig
arm                            mmp2_defconfig
powerpc                       ppc64_defconfig
mips                      loongson3_defconfig
mips                        nlm_xlp_defconfig
alpha                            alldefconfig
um                           x86_64_defconfig
arm                         s3c6400_defconfig
sh                            titan_defconfig
powerpc                      pasemi_defconfig
csky                             alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
sparc                            alldefconfig
arm                            hisi_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
um                            kunit_defconfig
arm                          collie_defconfig
powerpc                   motionpro_defconfig
powerpc64                           defconfig
um                             i386_defconfig
sparc64                             defconfig
arm                        multi_v7_defconfig
nds32                            alldefconfig
sh                   secureedge5410_defconfig
powerpc                      bamboo_defconfig
microblaze                          defconfig
arm                            mps2_defconfig
arm                            pleb_defconfig
powerpc                       eiger_defconfig
arm                       multi_v4t_defconfig
powerpc                     ppa8548_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                         virt_defconfig
mips                     cu1830-neo_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     sbc8548_defconfig
sh                   sh7770_generic_defconfig
arm                     am200epdkit_defconfig
alpha                               defconfig
arm                         axm55xx_defconfig
m68k                        m5307c3_defconfig
ia64                          tiger_defconfig
arm                        vexpress_defconfig
riscv                    nommu_k210_defconfig
powerpc                     tqm8541_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                       capcella_defconfig
arm                           spitz_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
mips                      maltaaprp_defconfig
arm                            lart_defconfig
powerpc                      ppc6xx_defconfig
powerpc                       maple_defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
arm                         hackkit_defconfig
mips                           mtx1_defconfig
powerpc                          allyesconfig
x86_64                              defconfig
powerpc                 mpc8560_ads_defconfig
mips                        maltaup_defconfig
arc                           tb10x_defconfig
xtensa                  nommu_kc705_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
m68k                       m5249evb_defconfig
arm                           tegra_defconfig
riscv                             allnoconfig
arm                     davinci_all_defconfig
powerpc                      mgcoge_defconfig
nds32                             allnoconfig
powerpc                          g5_defconfig
arm                           u8500_defconfig
sh                          lboxre2_defconfig
powerpc                      pcm030_defconfig
mips                           jazz_defconfig
arm                        keystone_defconfig
arm                         orion5x_defconfig
arc                        nsimosci_defconfig
m68k                            q40_defconfig
powerpc                    klondike_defconfig
sh                          rsk7203_defconfig
parisc                generic-32bit_defconfig
i386                                defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
m68k                        mvme16x_defconfig
arm                             rpc_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
m68k                         apollo_defconfig
arm                      pxa255-idp_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
