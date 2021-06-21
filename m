Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38B33AF961
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 01:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhFUXdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 19:33:02 -0400
Received: from mga04.intel.com ([192.55.52.120]:58631 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232014AbhFUXdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 19:33:02 -0400
IronPort-SDR: 1xBWnoc6Yv3w6JxEMAy0V3ynJ+N7jmjAQU4OP+1TFYjr26i96xrPkkbzkaEFnD4oqcw5S35Ra3
 eEqMyAS17fyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="205126032"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="205126032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 16:30:41 -0700
IronPort-SDR: O2gL2FZMslb0ph9IjshLPzPMqLFIHx46NIxz9wNr3HYXT6IlIOBihfysy28hVUgxifRArQPPQ4
 z37PXz+ECZ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="406137794"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2021 16:30:40 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvTNG-0004q5-GQ; Mon, 21 Jun 2021 23:30:38 +0000
Date:   Tue, 22 Jun 2021 07:29:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.15] BUILD SUCCESS
 0f051857609084b264b1e2037d6becb5cb074cfc
Message-ID: <60d120e3.MFNSYeK59byKQzPk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.15
branch HEAD: 0f051857609084b264b1e2037d6becb5cb074cfc  arm64: dts: renesas: r8a77990: Add generic compatible string to IIC node

elapsed time: 722m

configs tested: 178
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                       versatile_defconfig
arm                         s3c2410_defconfig
arm                            zeus_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7780_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
arm                      integrator_defconfig
powerpc                 mpc8540_ads_defconfig
mips                      pic32mzda_defconfig
sh                         ecovec24_defconfig
arc                     nsimosci_hs_defconfig
arm                         shannon_defconfig
arm                   milbeaut_m10v_defconfig
arm                         lpc32xx_defconfig
ia64                             allyesconfig
sh                             sh03_defconfig
sh                          r7785rp_defconfig
powerpc                      makalu_defconfig
arc                              allyesconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
mips                          ath79_defconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
m68k                            mac_defconfig
arm                           h5000_defconfig
ia64                             alldefconfig
arc                    vdk_hs38_smp_defconfig
powerpc                       holly_defconfig
mips                        vocore2_defconfig
powerpc                     asp8347_defconfig
mips                        jmr3927_defconfig
riscv                    nommu_virt_defconfig
powerpc                     taishan_defconfig
h8300                            alldefconfig
mips                         tb0219_defconfig
arm                          gemini_defconfig
sh                           se7712_defconfig
arm                            xcep_defconfig
arm                      jornada720_defconfig
sh                 kfr2r09-romimage_defconfig
mips                             allyesconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                      ppc44x_defconfig
powerpc                  mpc866_ads_defconfig
sh                          landisk_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
s390                             alldefconfig
m68k                          multi_defconfig
powerpc                    klondike_defconfig
m68k                       m5249evb_defconfig
sh                             espt_defconfig
x86_64                            allnoconfig
sh                          rsk7269_defconfig
mips                         bigsur_defconfig
powerpc                     rainier_defconfig
arm                        multi_v7_defconfig
powerpc                     tqm5200_defconfig
m68k                        mvme16x_defconfig
h8300                    h8300h-sim_defconfig
mips                       lemote2f_defconfig
arm                         socfpga_defconfig
sparc                       sparc64_defconfig
sparc64                          alldefconfig
arm                        vexpress_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
mips                        bcm47xx_defconfig
xtensa                          iss_defconfig
x86_64                           allyesconfig
parisc                generic-32bit_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
powerpc                     redwood_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                          sdk7786_defconfig
powerpc                     pseries_defconfig
mips                         mpc30x_defconfig
h8300                     edosk2674_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
powerpc                       eiger_defconfig
powerpc                      katmai_defconfig
mips                  decstation_64_defconfig
m68k                        m5272c3_defconfig
arm                          collie_defconfig
s390                       zfcpdump_defconfig
parisc                           alldefconfig
sh                              ul2_defconfig
sh                           se7619_defconfig
powerpc                      pmac32_defconfig
arm                    vt8500_v6_v7_defconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
powerpc                   motionpro_defconfig
arm                       cns3420vb_defconfig
mips                       bmips_be_defconfig
m68k                           sun3_defconfig
riscv                            allmodconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
i386                 randconfig-a002-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210621
x86_64               randconfig-a012-20210621
x86_64               randconfig-a016-20210621
x86_64               randconfig-a015-20210621
x86_64               randconfig-a014-20210621
x86_64               randconfig-a013-20210621
x86_64               randconfig-a011-20210621

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
