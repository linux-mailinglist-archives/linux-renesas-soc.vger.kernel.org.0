Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C58128C219
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Oct 2020 22:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgJLUNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Oct 2020 16:13:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:53950 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJLUNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Oct 2020 16:13:19 -0400
IronPort-SDR: OBbum301jH/96d/BNManDstN4kWwGaiAFq2i2USp38EKBBNXAH0+1j56CnQi02GEK5589uyVbu
 BP/WO9j1nCYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="229978382"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="229978382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 13:13:17 -0700
IronPort-SDR: OL4jNY8G0Tga+zsArmLXNwPBqM/Nc9mS6cNZy5kNqsAWhBm4CQSvJ10brCaJhDpndUC8IeSW3i
 jGBr+Mhp2zWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="345013249"
Received: from lkp-server01.sh.intel.com (HELO aa1d92d39b27) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2020 13:13:16 -0700
Received: from kbuild by aa1d92d39b27 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kS4C3-00008L-If; Mon, 12 Oct 2020 20:13:15 +0000
Date:   Tue, 13 Oct 2020 04:12:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 8b4fe437b94bb6be086be313056a1bf0c3ac3823
Message-ID: <5f84b8b3.J7hKhCPRzz9OIEfx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 8b4fe437b94bb6be086be313056a1bf0c3ac3823  Merge branch 'renesas-arm-dt-for-v5.11' into renesas-devel

elapsed time: 723m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
arm                     davinci_all_defconfig
m68k                       m5475evb_defconfig
powerpc                       holly_defconfig
arm                          ep93xx_defconfig
arm                        magician_defconfig
arm                       cns3420vb_defconfig
mips                        maltaup_defconfig
powerpc                       ppc64_defconfig
powerpc                        cell_defconfig
sh                         ecovec24_defconfig
arc                          axs101_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
mips                           jazz_defconfig
sh                   sh7770_generic_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                          allyesconfig
sh                          r7780mp_defconfig
c6x                         dsk6455_defconfig
xtensa                          iss_defconfig
arm                           sunxi_defconfig
riscv                    nommu_k210_defconfig
arm                           stm32_defconfig
mips                       bmips_be_defconfig
arm                          badge4_defconfig
c6x                        evmc6474_defconfig
arm                              alldefconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     asp8347_defconfig
arm                  colibri_pxa270_defconfig
mips                      loongson3_defconfig
powerpc                     kilauea_defconfig
arc                        vdk_hs38_defconfig
powerpc                    amigaone_defconfig
riscv                            allyesconfig
powerpc                    mvme5100_defconfig
sh                              ul2_defconfig
powerpc                 mpc8540_ads_defconfig
sparc                       sparc32_defconfig
arm                        multi_v5_defconfig
sh                           sh2007_defconfig
arm                          simpad_defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
powerpc                   bluestone_defconfig
m68k                        m5307c3_defconfig
powerpc                 canyonlands_defconfig
s390                                defconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
um                            kunit_defconfig
sh                          rsk7201_defconfig
arm                      jornada720_defconfig
powerpc                       ebony_defconfig
arm                             rpc_defconfig
arm                        vexpress_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
mips                         cobalt_defconfig
powerpc                    sam440ep_defconfig
arm                             pxa_defconfig
mips                     decstation_defconfig
m68k                       m5249evb_defconfig
arm                        realview_defconfig
parisc                generic-32bit_defconfig
mips                     cu1830-neo_defconfig
m68k                            q40_defconfig
um                             i386_defconfig
sh                            migor_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201012
i386                 randconfig-a006-20201012
i386                 randconfig-a001-20201012
i386                 randconfig-a003-20201012
i386                 randconfig-a004-20201012
i386                 randconfig-a002-20201012
x86_64               randconfig-a016-20201012
x86_64               randconfig-a015-20201012
x86_64               randconfig-a012-20201012
x86_64               randconfig-a013-20201012
x86_64               randconfig-a014-20201012
x86_64               randconfig-a011-20201012
i386                 randconfig-a015-20201012
i386                 randconfig-a013-20201012
i386                 randconfig-a012-20201012
i386                 randconfig-a011-20201012
i386                 randconfig-a014-20201012
i386                 randconfig-a016-20201012
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201012
x86_64               randconfig-a002-20201012
x86_64               randconfig-a006-20201012
x86_64               randconfig-a001-20201012
x86_64               randconfig-a003-20201012
x86_64               randconfig-a005-20201012

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
