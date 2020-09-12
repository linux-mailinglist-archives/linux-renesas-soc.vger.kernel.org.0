Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CB72676BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Sep 2020 02:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILARL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 20:17:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:55126 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725824AbgILARJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 20:17:09 -0400
IronPort-SDR: SuOdVBKxqlRgL4MeYHoZ2XL6ms9GwdtRU+vP3uvyoQoCdulNy+7TPWuLP8BE8k1TOfemrDUH8N
 FO+NrFuVJE5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="146574697"
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; 
   d="scan'208";a="146574697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 17:17:02 -0700
IronPort-SDR: mOccs+TOSsRaQN7lLMVBrbZ5WYMi+v1jvzdbVaOVdtAhss21XAGpUw0O3Kw25HCFcv5hiMdY5q
 o3tLfKL8T3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; 
   d="scan'208";a="285806427"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2020 17:17:01 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGtDw-0000Q6-ES; Sat, 12 Sep 2020 00:17:00 +0000
Date:   Sat, 12 Sep 2020 08:16:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 c07439dea94050b65cf4f8a3d5147b786afd348e
Message-ID: <5f5c1373.DFenB845jb8Kh66Y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: c07439dea94050b65cf4f8a3d5147b786afd348e  clk: renesas: cpg-mssr: Add support for R-Car V3U

elapsed time: 723m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc866_ads_defconfig
powerpc                      pcm030_defconfig
mips                      malta_kvm_defconfig
sh                            titan_defconfig
mips                           ci20_defconfig
arm                          gemini_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          r7780mp_defconfig
xtensa                          iss_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
arm                            pleb_defconfig
sparc64                             defconfig
arm                        mini2440_defconfig
xtensa                    xip_kc705_defconfig
mips                         db1xxx_defconfig
sh                        sh7763rdp_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
s390                          debug_defconfig
arm                             rpc_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
c6x                        evmc6472_defconfig
mips                      maltasmvp_defconfig
powerpc                      pasemi_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
m68k                        mvme16x_defconfig
powerpc                        warp_defconfig
powerpc                     akebono_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc64_defconfig
arm                            hisi_defconfig
arm                     am200epdkit_defconfig
mips                            e55_defconfig
arm                           efm32_defconfig
arm                              zx_defconfig
mips                          malta_defconfig
arc                             nps_defconfig
arm                     eseries_pxa_defconfig
arm                        mvebu_v5_defconfig
sh                           sh2007_defconfig
arm                        trizeps4_defconfig
arm                          prima2_defconfig
arm64                            alldefconfig
m68k                         amcore_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
arc                        vdk_hs38_defconfig
arc                            hsdk_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     mpc5200_defconfig
sh                         apsh4a3a_defconfig
ia64                        generic_defconfig
mips                       rbtx49xx_defconfig
sh                          kfr2r09_defconfig
mips                     decstation_defconfig
um                             i386_defconfig
arm                           tegra_defconfig
mips                   sb1250_swarm_defconfig
arm                         socfpga_defconfig
powerpc                      pmac32_defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
riscv                          rv32_defconfig
c6x                        evmc6474_defconfig
sh                          lboxre2_defconfig
mips                         tb0287_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
arm                           spitz_defconfig
xtensa                         virt_defconfig
sh                             sh03_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
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
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
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
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
