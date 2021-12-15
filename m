Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF424475076
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 02:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhLOBUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 20:20:41 -0500
Received: from mga05.intel.com ([192.55.52.43]:30737 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235304AbhLOBUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 20:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639531240; x=1671067240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cook44DESqxt5M3kSS0o1Mi4sBvfMKSANHT123P+jBw=;
  b=QfsCb8+6m+V6YaARn1zmLxJ3TELTEF06q+pL0Cm2wsDfRwEJLq4i/xpY
   oY7gqyh8Z/khwlg6W+0W4btyvxw3ZqnuLqf64SOUPTGofjOGaHAbAK19J
   b6YRxhB+O71QovVCC3vIG1aHFSo8gUZTgLz3YIhRmUqEdumxH+V0hgLi3
   /Y3kYAVYtM+ij7nKGQQTZRmX9T5wjqEPm3mDuNn7hzJgwSpcSDcgU1vDr
   W5tL/xEMIoW7NxV8Lv9gmy/A9atG2njVD18JinxbPnPlAlz1x6E+MSETw
   T8tROsp5vBZ/HG0g6QfUhCmJL1wpVrB8VM8ZHceB+/hfL38ODmFhrVIqs
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325399118"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="325399118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 17:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="567622351"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2021 17:20:38 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxIyE-00012p-7i; Wed, 15 Dec 2021 01:20:38 +0000
Date:   Wed, 15 Dec 2021 09:19:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 54477c542f92fb4b93370861899dd916f8ced73d
Message-ID: <61b942ab.flRF5Y7kB6K8+EJy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 54477c542f92fb4b93370861899dd916f8ced73d  Merge branch 'renesas-arm-dt-for-v5.17' into renesas-next

elapsed time: 724m

configs tested: 189
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211215
sh                 kfr2r09-romimage_defconfig
powerpc                    klondike_defconfig
xtensa                    xip_kc705_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
arm                            mps2_defconfig
mips                           ip22_defconfig
mips                  maltasmvp_eva_defconfig
mips                     loongson1c_defconfig
arm                        mini2440_defconfig
xtensa                  audio_kc705_defconfig
arm                         orion5x_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_itx_defconfig
sh                               alldefconfig
arm                             mxs_defconfig
powerpc                      pasemi_defconfig
powerpc                    gamecube_defconfig
powerpc64                        alldefconfig
mips                  cavium_octeon_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
arm                          pxa168_defconfig
riscv                            allmodconfig
m68k                          sun3x_defconfig
arm                         s5pv210_defconfig
mips                         tb0226_defconfig
mips                         tb0219_defconfig
powerpc                 xes_mpc85xx_defconfig
arm64                            alldefconfig
arc                    vdk_hs38_smp_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         hackkit_defconfig
arm                         s3c2410_defconfig
m68k                           sun3_defconfig
sh                          r7780mp_defconfig
csky                             alldefconfig
arm                   milbeaut_m10v_defconfig
arm                  colibri_pxa270_defconfig
powerpc                      makalu_defconfig
arm                      jornada720_defconfig
sh                          urquell_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                       imx_v4_v5_defconfig
mips                      fuloong2e_defconfig
arm                         assabet_defconfig
arm                      integrator_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
sh                      rts7751r2d1_defconfig
sparc                               defconfig
sh                         microdev_defconfig
powerpc                     stx_gp3_defconfig
parisc                           alldefconfig
m68k                        m5307c3_defconfig
xtensa                          iss_defconfig
sh                            shmin_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                        stmark2_defconfig
h8300                       h8s-sim_defconfig
x86_64                           allyesconfig
arm                         lubbock_defconfig
arm                         lpc32xx_defconfig
mips                        vocore2_defconfig
i386                             alldefconfig
mips                           rs90_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
openrisc                            defconfig
powerpc                       ppc64_defconfig
powerpc                      pmac32_defconfig
mips                         tb0287_defconfig
arm                         vf610m4_defconfig
powerpc                   currituck_defconfig
m68k                             alldefconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
arm                         socfpga_defconfig
powerpc                      bamboo_defconfig
ia64                         bigsur_defconfig
arm                        multi_v5_defconfig
arm                        oxnas_v6_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
parisc                              defconfig
sh                           se7712_defconfig
sh                        dreamcast_defconfig
powerpc                     tqm8540_defconfig
powerpc                          g5_defconfig
arm                           sama7_defconfig
arm                  randconfig-c002-20211214
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211214
x86_64               randconfig-c007-20211214
riscv                randconfig-c006-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211214
s390                 randconfig-c005-20211214
powerpc              randconfig-c003-20211214
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a016-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
