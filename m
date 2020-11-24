Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3751E2C1BE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 04:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbgKXDQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Nov 2020 22:16:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:64187 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728990AbgKXDQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 22:16:52 -0500
IronPort-SDR: oTkH+3shbTTOwG75xOe3O6K/NZExkUcb5EtHGmhDZcYgRxNxlk1g75QCLLGQJsCKsWZN3xqcGY
 Jduy/KPCSk6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="169320057"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="169320057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 19:16:47 -0800
IronPort-SDR: eduiBGaU9u33/CBaWOg8BS8nlra6oNQS+DBML/fnPX2VDes42wH5M0bIv2ehPYLA+BZWiP4/3z
 0uKXEz8OcQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="332411239"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Nov 2020 19:16:44 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khOot-0000Jl-TL; Tue, 24 Nov 2020 03:16:43 +0000
Date:   Tue, 24 Nov 2020 11:15:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 b79a2639266de0b430f1895bf71b4239f6abee34
Message-ID: <5fbc7aec.MxXX2csv5NJZg8ou%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: b79a2639266de0b430f1895bf71b4239f6abee34  Merge branches 'renesas-arm-drivers-for-v5.11' and 'renesas-arm-soc-for-v5.11' into renesas-next

elapsed time: 722m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
openrisc                         alldefconfig
arm                        mvebu_v5_defconfig
ia64                                defconfig
powerpc                      makalu_defconfig
mips                             allyesconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
arm                            u300_defconfig
x86_64                           allyesconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
powerpc                     skiroot_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
powerpc                      acadia_defconfig
powerpc                     mpc512x_defconfig
mips                        vocore2_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
arm                         s5pv210_defconfig
sparc64                          alldefconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
arm                           h3600_defconfig
c6x                                 defconfig
arc                              alldefconfig
sh                          landisk_defconfig
mips                           mtx1_defconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
mips                      maltaaprp_defconfig
nds32                            alldefconfig
arm                         cm_x300_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
mips                     decstation_defconfig
arm                            xcep_defconfig
arm                        mvebu_v7_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc8540_ads_defconfig
sh                         apsh4a3a_defconfig
powerpc                    mvme5100_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm8540_defconfig
arm                       omap2plus_defconfig
arm                     eseries_pxa_defconfig
sh                          rsk7269_defconfig
powerpc                      katmai_defconfig
arm                          exynos_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
