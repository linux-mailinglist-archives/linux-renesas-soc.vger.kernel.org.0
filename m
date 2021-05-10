Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCD93798F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhEJVOr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:14:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:56261 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231549AbhEJVOr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:14:47 -0400
IronPort-SDR: A2VrxlYEydqdd1/1xbboyvpB13zckIpCBxf9FkuzXT7kGmvrMKVpVE6264CacmWth0vhlQtGxx
 jFM+/r79iB9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="197307801"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="197307801"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 14:13:41 -0700
IronPort-SDR: Sh3f/mCCxL8BfJ8ugGQ6agij5QhOJcTCeNXx3UHwnD1IT2moFzGzEvRX3W3lirklTmBr7bco70
 70E72Q8e9R1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="609239459"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2021 14:13:39 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgDDe-0000NI-Sb; Mon, 10 May 2021 21:13:38 +0000
Date:   Tue, 11 May 2021 05:12:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 213494b51d07b798e12651aaa9e24d8e0acf90e0
Message-ID: <6099a1d1.+h8CeAap0AV6e+xe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 213494b51d07b798e12651aaa9e24d8e0acf90e0  Merge branch 'renesas-arm-dt-for-v5.14' into renesas-next

elapsed time: 731m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
h8300                     edosk2674_defconfig
sh                          landisk_defconfig
powerpc                    mvme5100_defconfig
powerpc                     sbc8548_defconfig
mips                             allmodconfig
mips                       rbtx49xx_defconfig
arm                           spitz_defconfig
h8300                            alldefconfig
sh                          lboxre2_defconfig
nds32                               defconfig
m68k                                defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                         haps_hs_defconfig
mips                       capcella_defconfig
powerpc                      obs600_defconfig
arm64                            alldefconfig
powerpc                mpc7448_hpc2_defconfig
arm                           tegra_defconfig
arm                            mps2_defconfig
openrisc                  or1klitex_defconfig
ia64                          tiger_defconfig
s390                             alldefconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
arm                       aspeed_g4_defconfig
mips                        workpad_defconfig
arm                       aspeed_g5_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
m68k                        mvme16x_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
mips                  cavium_octeon_defconfig
arm                          gemini_defconfig
m68k                        m5307c3_defconfig
arm                           h3600_defconfig
arm                       spear13xx_defconfig
arm                          pxa910_defconfig
sh                           se7343_defconfig
openrisc                    or1ksim_defconfig
xtensa                  nommu_kc705_defconfig
riscv                    nommu_k210_defconfig
mips                     cu1830-neo_defconfig
ia64                        generic_defconfig
sh                   sh7770_generic_defconfig
mips                       lemote2f_defconfig
sh                               alldefconfig
arm                            lart_defconfig
openrisc                            defconfig
arm                            pleb_defconfig
powerpc                     tqm8555_defconfig
powerpc                 mpc837x_mds_defconfig
nios2                            alldefconfig
powerpc64                           defconfig
mips                        omega2p_defconfig
arm                         lpc32xx_defconfig
sparc                       sparc32_defconfig
arm                          pxa3xx_defconfig
sh                           se7751_defconfig
mips                            ar7_defconfig
mips                          rm200_defconfig
arm                             ezx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        bcm63xx_defconfig
mips                      maltaaprp_defconfig
powerpc                      chrp32_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                    gamecube_defconfig
arm                            dove_defconfig
arm                        trizeps4_defconfig
mips                         rt305x_defconfig
arm                     eseries_pxa_defconfig
powerpc                    amigaone_defconfig
mips                      pic32mzda_defconfig
x86_64                           alldefconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     decstation_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
ia64                             allyesconfig
arc                        vdk_hs38_defconfig
csky                                defconfig
mips                          ath79_defconfig
powerpc                    klondike_defconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                         tb0287_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v5_defconfig
mips                        qi_lb60_defconfig
sh                          rsk7269_defconfig
powerpc                     skiroot_defconfig
mips                         cobalt_defconfig
arc                          axs103_defconfig
h8300                            allyesconfig
sh                           se7724_defconfig
mips                        maltaup_defconfig
powerpc                        icon_defconfig
arm                        multi_v7_defconfig
nios2                         10m50_defconfig
arm                      pxa255-idp_defconfig
arm                           h5000_defconfig
arm                         hackkit_defconfig
powerpc64                        alldefconfig
arc                     nsimosci_hs_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
powerpc                   motionpro_defconfig
x86_64                              defconfig
h8300                    h8300h-sim_defconfig
riscv                            alldefconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
sh                          rsk7201_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
