Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2742491F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 02:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgHSAtM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 20:49:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:28382 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgHSAtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 20:49:11 -0400
IronPort-SDR: JJVI2gmboI9J362A2SgFuEfkyplIybv9kEqdTE2axszsWvdS2hJN4VLDvpC5OO1q4F3ergxbxQ
 8rSBNwA229YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="142656823"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="142656823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 17:49:09 -0700
IronPort-SDR: AOX8LkXAEiAwPTXp/xTv0j7w0rXmjXR9yoilBRBXZzffI9qdxP5RxrHgmHn7agq78ZooEuPxDn
 ymLqhWPbzmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="336796810"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2020 17:49:08 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8CHr-0001Vh-OU; Wed, 19 Aug 2020 00:49:07 +0000
Date:   Wed, 19 Aug 2020 08:48:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.10] BUILD SUCCESS
 cd8bc7d4eb6608afe78ac51422ef94b7824f1646
Message-ID: <5f3c76ee./DEaqBAIPgARuwur%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.10
branch HEAD: cd8bc7d4eb6608afe78ac51422ef94b7824f1646  arm64: defconfig: Enable R-Car PCIe endpoint driver

elapsed time: 2392m

configs tested: 149
configs skipped: 89

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        apsh4ad0a_defconfig
arm                            hisi_defconfig
ia64                             allyesconfig
riscv                    nommu_k210_defconfig
powerpc                       holly_defconfig
arm                          collie_defconfig
m68k                        stmark2_defconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
csky                                defconfig
m68k                          amiga_defconfig
ia64                             alldefconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
mips                          rb532_defconfig
powerpc                     mpc83xx_defconfig
sh                            hp6xx_defconfig
mips                      malta_kvm_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
arm                             mxs_defconfig
mips                        omega2p_defconfig
mips                       rbtx49xx_defconfig
mips                         cobalt_defconfig
mips                malta_kvm_guest_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pcm027_defconfig
ia64                            zx1_defconfig
mips                         mpc30x_defconfig
alpha                               defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
m68k                          hp300_defconfig
arm                        clps711x_defconfig
mips                      pic32mzda_defconfig
mips                      maltasmvp_defconfig
arm                           sunxi_defconfig
powerpc                     powernv_defconfig
mips                             allyesconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
arm                      footbridge_defconfig
mips                        nlm_xlr_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
sh                               j2_defconfig
sh                             espt_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                      ppc44x_defconfig
m68k                       m5208evb_defconfig
arm                   milbeaut_m10v_defconfig
c6x                        evmc6472_defconfig
sh                           sh2007_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200817
x86_64               randconfig-a001-20200817
x86_64               randconfig-a005-20200817
x86_64               randconfig-a003-20200817
x86_64               randconfig-a002-20200817
x86_64               randconfig-a004-20200817
i386                 randconfig-a005-20200817
i386                 randconfig-a001-20200817
i386                 randconfig-a002-20200817
i386                 randconfig-a003-20200817
i386                 randconfig-a006-20200817
i386                 randconfig-a004-20200817
i386                 randconfig-a005-20200818
i386                 randconfig-a002-20200818
i386                 randconfig-a001-20200818
i386                 randconfig-a006-20200818
i386                 randconfig-a003-20200818
i386                 randconfig-a004-20200818
x86_64               randconfig-a013-20200818
x86_64               randconfig-a016-20200818
x86_64               randconfig-a012-20200818
x86_64               randconfig-a011-20200818
x86_64               randconfig-a014-20200818
x86_64               randconfig-a015-20200818
i386                 randconfig-a016-20200817
i386                 randconfig-a011-20200817
i386                 randconfig-a013-20200817
i386                 randconfig-a015-20200817
i386                 randconfig-a014-20200817
i386                 randconfig-a012-20200817
i386                 randconfig-a016-20200818
i386                 randconfig-a011-20200818
i386                 randconfig-a015-20200818
i386                 randconfig-a013-20200818
i386                 randconfig-a012-20200818
i386                 randconfig-a014-20200818
x86_64               randconfig-a006-20200819
x86_64               randconfig-a001-20200819
x86_64               randconfig-a003-20200819
x86_64               randconfig-a005-20200819
x86_64               randconfig-a004-20200819
x86_64               randconfig-a002-20200819
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
