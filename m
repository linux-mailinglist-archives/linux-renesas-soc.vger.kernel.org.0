Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95124305533
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 09:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbhA0IDx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 03:03:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:2805 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S316717AbhAZXUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 18:20:21 -0500
IronPort-SDR: buyzDaVcQuum/10B5UZ64nroj4a4fQ+qMeO82NsxSBQ7QqRCwe6Vy07qg0yOVhMFFNN8jpLi4t
 jRlUitkCf/wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="179206202"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="179206202"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 15:16:20 -0800
IronPort-SDR: Qz9tOMLKBnA1JrcKyVSdZFKI4MiNV9PmfFnqO+2E35LBkVwn79MRhowf8d66sVt1TUHENltkPG
 b6SejGb+aNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="402903836"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2021 15:16:14 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4XZF-00018B-Ll; Tue, 26 Jan 2021 23:16:13 +0000
Date:   Wed, 27 Jan 2021 07:15:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 14fd8c48abd95598a4d17840a34b73736a410df1
Message-ID: <6010a29c.8ELlNG2iZPpp3/Gj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 14fd8c48abd95598a4d17840a34b73736a410df1  Merge branch 'renesas-drivers-for-v5.12' into renesas-next

elapsed time: 726m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          moxart_defconfig
powerpc                    adder875_defconfig
arm                            pleb_defconfig
powerpc                      acadia_defconfig
mips                        nlm_xlp_defconfig
sh                           se7780_defconfig
arm                          gemini_defconfig
arm                      tct_hammer_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
arm                       versatile_defconfig
mips                           gcw0_defconfig
xtensa                    smp_lx200_defconfig
arm                             ezx_defconfig
xtensa                       common_defconfig
mips                           ip27_defconfig
powerpc                     tqm5200_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
sh                            migor_defconfig
s390                          debug_defconfig
mips                           jazz_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         vf610m4_defconfig
m68k                            mac_defconfig
powerpc                        cell_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 xes_mpc85xx_defconfig
ia64                                defconfig
m68k                        mvme16x_defconfig
riscv                            allyesconfig
mips                           ci20_defconfig
sh                                  defconfig
arm                       cns3420vb_defconfig
m68k                        mvme147_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
alpha                               defconfig
mips                      fuloong2e_defconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
riscv                          rv32_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
nios2                         10m50_defconfig
sh                           se7751_defconfig
powerpc                  storcenter_defconfig
powerpc                     tqm8555_defconfig
sh                             shx3_defconfig
h8300                            alldefconfig
arm                             pxa_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
sparc                            alldefconfig
powerpc                      bamboo_defconfig
arm                         assabet_defconfig
powerpc                     mpc5200_defconfig
powerpc                     redwood_defconfig
powerpc                      ppc64e_defconfig
arm                   milbeaut_m10v_defconfig
xtensa                          iss_defconfig
arm                      jornada720_defconfig
xtensa                generic_kc705_defconfig
x86_64                           alldefconfig
sh                           se7619_defconfig
sh                          rsk7201_defconfig
sh                     magicpanelr2_defconfig
arm                            qcom_defconfig
arm                        shmobile_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     pseries_defconfig
arm                          lpd270_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
