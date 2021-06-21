Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3723A3AF8A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 00:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhFUWlx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 18:41:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:44087 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhFUWlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 18:41:53 -0400
IronPort-SDR: JoCKSod8WhRQ62mhwVL5KF/hgjKW2Lh4saQs38FJnb8VGX1QLDh0ZOvaIwZ9E7ZygXnDdTrDsj
 iSHb7tfKlOWg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="292574638"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="292574638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 15:39:38 -0700
IronPort-SDR: gl7oe3few7YiaRHTRj4GA7btgD35xFs2u6E7j5TriV31FNbfft3Qwad5CMFlqfwOWS6Kmx8lIL
 pHOPDbmHTHFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="452366446"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jun 2021 15:39:37 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvSZs-0004ou-La; Mon, 21 Jun 2021 22:39:36 +0000
Date:   Tue, 22 Jun 2021 06:39:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 2cd1e3883a5739e89bb8bc6050c6f900cf5cc1da
Message-ID: <60d1150f.vtvGzUqrCiKY2lrf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 2cd1e3883a5739e89bb8bc6050c6f900cf5cc1da  clk: renesas: rzg2l: Fix off-by-one check in rzg2l_cpg_clk_src_twocell_get()

elapsed time: 721m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                        clps711x_defconfig
arm                           u8500_defconfig
m68k                         amcore_defconfig
sparc64                             defconfig
powerpc                       eiger_defconfig
mips                        bcm47xx_defconfig
arm                       versatile_defconfig
arm                         s3c2410_defconfig
arm                           sama5_defconfig
arm                            lart_defconfig
mips                           jazz_defconfig
arm                          badge4_defconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    socrates_defconfig
m68k                            mac_defconfig
riscv                               defconfig
um                               alldefconfig
arm                            zeus_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7780_defconfig
mips                      pic32mzda_defconfig
sh                         ecovec24_defconfig
arc                     nsimosci_hs_defconfig
arm                         shannon_defconfig
arm                   milbeaut_m10v_defconfig
arm                         lpc32xx_defconfig
arc                              allyesconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
mips                          ath79_defconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
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
powerpc                     akebono_defconfig
powerpc                       maple_defconfig
powerpc                     tqm5200_defconfig
arm                          ep93xx_defconfig
arc                              alldefconfig
sh                          lboxre2_defconfig
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
sh                          rsk7269_defconfig
mips                         bigsur_defconfig
powerpc                     rainier_defconfig
arm                        multi_v7_defconfig
m68k                        mvme16x_defconfig
h8300                    h8300h-sim_defconfig
mips                       lemote2f_defconfig
arm                         socfpga_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
sparc64                          alldefconfig
arm                        vexpress_defconfig
arm                          gemini_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
xtensa                          iss_defconfig
parisc                generic-32bit_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
x86_64                           allyesconfig
arm                         lpc18xx_defconfig
powerpc                    gamecube_defconfig
mips                            e55_defconfig
h8300                     edosk2674_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
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
sh                           se7724_defconfig
powerpc                 canyonlands_defconfig
sh                        sh7785lcr_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
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
