Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84925A44B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 06:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgIBELE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 00:11:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:53183 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgIBELC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 00:11:02 -0400
IronPort-SDR: i8uoT7Rbhs082YWDPBz8JHZE3atCpqv/r56SIHqOoiHmw5sm79m2Bm5IjBFFtTxjnwswqabCLl
 QgyO+D9mEyuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158312873"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="158312873"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 21:10:57 -0700
IronPort-SDR: X1xjetBFwU/wlypFn3G0LXbyrkHrP6S1sja2OLRkaozvK70t+Q1H8OH/3/0qNZS61Bf/E4dAjX
 oUXae3WZOvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="341271095"
Received: from lkp-server02.sh.intel.com (HELO 500e1ab2883a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2020 21:10:55 -0700
Received: from kbuild by 500e1ab2883a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kDK6o-00001q-VG; Wed, 02 Sep 2020 04:10:54 +0000
Date:   Wed, 02 Sep 2020 12:10:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.10] BUILD SUCCESS
 5a87251dac0db8704d4d18b6dc7c23e30804585b
Message-ID: <5f4f1b48.kD8nF7J2j/hfIQpP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.10
branch HEAD: 5a87251dac0db8704d4d18b6dc7c23e30804585b  ARM: shmobile: defconfig: Enable CONFIG_PCIE_RCAR_HOST

elapsed time: 720m

configs tested: 146
configs skipped: 92

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      bmips_stb_defconfig
sh                             espt_defconfig
mips                           rs90_defconfig
c6x                        evmc6474_defconfig
powerpc                           allnoconfig
arm                         shannon_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
riscv                             allnoconfig
sh                            migor_defconfig
sh                          rsk7264_defconfig
powerpc                      mgcoge_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
sparc                       sparc64_defconfig
powerpc                             defconfig
s390                       zfcpdump_defconfig
arm                             pxa_defconfig
arm                          gemini_defconfig
microblaze                    nommu_defconfig
h8300                       h8s-sim_defconfig
powerpc                  storcenter_defconfig
arm                   milbeaut_m10v_defconfig
mips                            e55_defconfig
arm                        clps711x_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
sh                           se7343_defconfig
mips                           jazz_defconfig
mips                malta_qemu_32r6_defconfig
mips                      pistachio_defconfig
c6x                        evmc6472_defconfig
arm                           efm32_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
arm                             rpc_defconfig
powerpc                      ppc40x_defconfig
powerpc                  mpc885_ads_defconfig
arm                       imx_v6_v7_defconfig
c6x                                 defconfig
ia64                         bigsur_defconfig
mips                        bcm63xx_defconfig
sh                          rsk7269_defconfig
ia64                                defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            lart_defconfig
arm                      pxa255-idp_defconfig
arm                         mv78xx0_defconfig
arm                         s3c2410_defconfig
arm                              alldefconfig
mips                         tb0287_defconfig
mips                     cu1000-neo_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
sh                          kfr2r09_defconfig
arm                       aspeed_g5_defconfig
x86_64                              defconfig
m68k                        stmark2_defconfig
xtensa                         virt_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
arc                              allyesconfig
arm                        magician_defconfig
nds32                            alldefconfig
m68k                       m5249evb_defconfig
mips                    maltaup_xpa_defconfig
arm                            qcom_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
powerpc                      ppc64e_defconfig
arm                          ixp4xx_defconfig
mips                         cobalt_defconfig
powerpc                       maple_defconfig
arm                          simpad_defconfig
sh                          rsk7201_defconfig
arm                         nhk8815_defconfig
mips                           ip28_defconfig
sh                          polaris_defconfig
m68k                            q40_defconfig
sparc                            allyesconfig
mips                 decstation_r4k_defconfig
ia64                             allmodconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20200901
x86_64               randconfig-a006-20200901
x86_64               randconfig-a003-20200901
x86_64               randconfig-a005-20200901
x86_64               randconfig-a001-20200901
x86_64               randconfig-a002-20200901
i386                 randconfig-a004-20200901
i386                 randconfig-a005-20200901
i386                 randconfig-a006-20200901
i386                 randconfig-a002-20200901
i386                 randconfig-a001-20200901
i386                 randconfig-a003-20200901
i386                 randconfig-a016-20200901
i386                 randconfig-a015-20200901
i386                 randconfig-a011-20200901
i386                 randconfig-a013-20200901
i386                 randconfig-a014-20200901
i386                 randconfig-a012-20200901
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20200901
x86_64               randconfig-a016-20200901
x86_64               randconfig-a011-20200901
x86_64               randconfig-a012-20200901
x86_64               randconfig-a015-20200901
x86_64               randconfig-a014-20200901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
