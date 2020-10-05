Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0C0284379
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Oct 2020 02:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJFAqa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Oct 2020 20:46:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:37279 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgJFAqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 20:46:30 -0400
IronPort-SDR: rct8Go1ded99RJm7HqoYFbz8DKH7ir6z+xv+OD4a7pzxQ7ETkUdfWNknxnw/6Jpn+oh0oHG/Is
 8z5xvkARQUaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="228415780"
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="228415780"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 17:38:47 -0700
IronPort-SDR: Luwq186xS+BoN72oK3ruc2Tg6xwMwaFwaW2/U1n86fwmc4k/23iqjyT97oMV/VDMUJUDrZN+RU
 gZzK0YUwcmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="417712764"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2020 16:56:38 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kPaLM-000100-0E; Mon, 05 Oct 2020 23:56:36 +0000
Date:   Tue, 06 Oct 2020 07:56:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.11] BUILD SUCCESS
 f4160efde7f1544c6dc6859eb7798fb6126db8ee
Message-ID: <5f7bb2a4.LhXjDFZizYerovfx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.11
branch HEAD: f4160efde7f1544c6dc6859eb7798fb6126db8ee  arm64: dts: renesas: Align GPIO hog names with dtschema

elapsed time: 722m

configs tested: 189
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      katmai_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
mips                           ip28_defconfig
sh                   sh7724_generic_defconfig
m68k                          atari_defconfig
arc                            hsdk_defconfig
mips                        qi_lb60_defconfig
mips                      maltaaprp_defconfig
arm                        shmobile_defconfig
powerpc                    socrates_defconfig
mips                        jmr3927_defconfig
arm                         vf610m4_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
powerpc                     tqm8541_defconfig
arm                         axm55xx_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
sh                              ul2_defconfig
riscv                          rv32_defconfig
mips                         bigsur_defconfig
arm                           stm32_defconfig
arm                          iop32x_defconfig
arm                          tango4_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        nlm_xlp_defconfig
m68k                       m5475evb_defconfig
sh                         apsh4a3a_defconfig
mips                            ar7_defconfig
powerpc                        warp_defconfig
arm                        multi_v7_defconfig
sh                        edosk7705_defconfig
arm                        clps711x_defconfig
arm                            hisi_defconfig
powerpc                     stx_gp3_defconfig
i386                             alldefconfig
microblaze                          defconfig
powerpc                        icon_defconfig
nds32                             allnoconfig
nds32                               defconfig
m68k                          amiga_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     tqm8555_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
sparc                               defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
arm                            zeus_defconfig
mips                         tb0219_defconfig
sh                             shx3_defconfig
arm                        multi_v5_defconfig
xtensa                           alldefconfig
powerpc                      walnut_defconfig
sh                ecovec24-romimage_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
arm                          pxa168_defconfig
arm                           efm32_defconfig
mips                           ip27_defconfig
sh                           se7724_defconfig
powerpc                   lite5200b_defconfig
arm                           omap1_defconfig
arm                           corgi_defconfig
powerpc                      ep88xc_defconfig
arm                            pleb_defconfig
c6x                              alldefconfig
powerpc64                           defconfig
powerpc                      chrp32_defconfig
arm                         palmz72_defconfig
arm                          ixp4xx_defconfig
powerpc                      pcm030_defconfig
arm                        keystone_defconfig
arm                          exynos_defconfig
mips                      pistachio_defconfig
mips                       lemote2f_defconfig
powerpc                     mpc5200_defconfig
alpha                            alldefconfig
m68k                            q40_defconfig
c6x                                 defconfig
mips                           rs90_defconfig
arm                       mainstone_defconfig
arm                         bcm2835_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                        sh7763rdp_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
mips                         mpc30x_defconfig
arm                        spear3xx_defconfig
mips                          ath25_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
powerpc                     powernv_defconfig
sh                               allmodconfig
mips                     loongson1c_defconfig
mips                  maltasmvp_eva_defconfig
powerpc               mpc834x_itxgp_defconfig
s390                             alldefconfig
arm                           h5000_defconfig
arm                      integrator_defconfig
arm                         orion5x_defconfig
sh                          rsk7264_defconfig
ia64                        generic_defconfig
powerpc                          allmodconfig
arm                           viper_defconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
i386                 randconfig-a014-20201004
i386                 randconfig-a015-20201004
i386                 randconfig-a013-20201004
i386                 randconfig-a016-20201004
i386                 randconfig-a011-20201004
i386                 randconfig-a012-20201004
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
