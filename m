Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E036126771C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Sep 2020 03:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgILBog (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 21:44:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:12414 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgILBof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 21:44:35 -0400
IronPort-SDR: 6l2LyE8WzVfjF+JTsmbYOFiaht3WK0GQIDUHUsf7W6kEFucYneE4oCYZCG2lqVk8VXnLPIPPEL
 KCkMyx+x4r/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="159821380"
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; 
   d="scan'208";a="159821380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 18:44:27 -0700
IronPort-SDR: 2aJqcJX3QYiHy6+uNhpmgfxeiJjKyDy6Tme+VWGkuR+JZfxtS0snXgIDur8D4g3hvP0IP+1Mm2
 aB+SknJ92WWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; 
   d="scan'208";a="285824507"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2020 18:44:25 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGuaW-0000RJ-N8; Sat, 12 Sep 2020 01:44:24 +0000
Date:   Sat, 12 Sep 2020 09:43:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 2f4251e706de063cd2797742455b742f1331e81a
Message-ID: <5f5c27dd.kY5ZoU/Yl49+W8Ha%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 2f4251e706de063cd2797742455b742f1331e81a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 720m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                         microdev_defconfig
arc                    vdk_hs38_smp_defconfig
mips                      maltaaprp_defconfig
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
nios2                         3c120_defconfig
mips                 pnx8335_stb225_defconfig
m68k                            mac_defconfig
mips                         tb0226_defconfig
powerpc                    amigaone_defconfig
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
arm                       omap2plus_defconfig
arm                         socfpga_defconfig
sparc64                             defconfig
sh                           se7343_defconfig
riscv                          rv32_defconfig
arm                           efm32_defconfig
arm                              zx_defconfig
mips                          malta_defconfig
arc                             nps_defconfig
arm                     eseries_pxa_defconfig
arm                        mvebu_v5_defconfig
sh                           sh2007_defconfig
mips                           ci20_defconfig
arm                        trizeps4_defconfig
arc                        vdk_hs38_defconfig
arm                          gemini_defconfig
arc                            hsdk_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      pmac32_defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
microblaze                    nommu_defconfig
arc                          axs103_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
c6x                        evmc6474_defconfig
sh                          lboxre2_defconfig
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
i386                 randconfig-a004-20200912
i386                 randconfig-a006-20200912
i386                 randconfig-a003-20200912
i386                 randconfig-a001-20200912
i386                 randconfig-a002-20200912
i386                 randconfig-a005-20200912
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
