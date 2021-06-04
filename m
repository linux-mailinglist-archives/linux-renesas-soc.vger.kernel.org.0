Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27BA39B385
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 09:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFDHEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 03:04:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:52994 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229882AbhFDHEz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 03:04:55 -0400
IronPort-SDR: l0g+CD9S9P3U885bwBh4qkGkGkyJ8+aEaAdyDHP+NuHb3sjWz4p2EkowZdu8PJ35JhGna7A/Ki
 FBLLIgHKR0WQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="201217585"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="201217585"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 00:03:09 -0700
IronPort-SDR: QuIJ2aIvzAXvd0BxcDmv4lckoUZ2felVuAiXTUi5dkcJ+EWYgma6MX/QHqiWSYP8ZfrpX5qM/A
 /yB3rvFLJrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="439119599"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Jun 2021 00:03:08 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lp3rH-0006l5-LL; Fri, 04 Jun 2021 07:03:07 +0000
Date:   Fri, 04 Jun 2021 15:02:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.14] BUILD SUCCESS
 85a242cdcd44da30c28ba71f26e487c0ebabba47
Message-ID: <60b9cffe.nmPoATY4nSDd87dY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.14
branch HEAD: 85a242cdcd44da30c28ba71f26e487c0ebabba47  pinctrl: renesas: r8a77995: Add bias pinconf support

elapsed time: 5600m

configs tested: 253
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
powerpc                  storcenter_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
ia64                             allmodconfig
sh                          rsk7203_defconfig
powerpc                    adder875_defconfig
h8300                               defconfig
arm                          collie_defconfig
m68k                        m5307c3_defconfig
arc                        vdk_hs38_defconfig
arc                            hsdk_defconfig
s390                             allmodconfig
m68k                        m5272c3_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
mips                malta_qemu_32r6_defconfig
arm                       netwinder_defconfig
arm                        mvebu_v7_defconfig
powerpc                    gamecube_defconfig
arc                          axs101_defconfig
arm                            qcom_defconfig
m68k                          sun3x_defconfig
sh                            shmin_defconfig
mips                 decstation_r4k_defconfig
nds32                            alldefconfig
mips                           ip27_defconfig
arc                      axs103_smp_defconfig
sparc                       sparc64_defconfig
arm                         assabet_defconfig
powerpc                        cell_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                          allyesconfig
arm                         s3c6400_defconfig
arm                        cerfcube_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc44x_defconfig
m68k                            q40_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
sh                        sh7763rdp_defconfig
sh                   secureedge5410_defconfig
arm                             ezx_defconfig
arm                          exynos_defconfig
sh                            hp6xx_defconfig
sh                 kfr2r09-romimage_defconfig
alpha                            alldefconfig
sh                           se7751_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
arm                       mainstone_defconfig
mips                          malta_defconfig
powerpc                     tqm8540_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc836x_mds_defconfig
mips                     loongson1c_defconfig
parisc                generic-32bit_defconfig
sh                          rsk7201_defconfig
sh                     magicpanelr2_defconfig
arm                        spear3xx_defconfig
sh                          rsk7264_defconfig
powerpc                      ppc40x_defconfig
openrisc                            defconfig
mips                           ip32_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
sh                           se7750_defconfig
powerpc                     tqm8541_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                           se7712_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
powerpc                    socrates_defconfig
arm                           spitz_defconfig
mips                    maltaup_xpa_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
arm                          ep93xx_defconfig
xtensa                  audio_kc705_defconfig
riscv                               defconfig
ia64                                defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                             allmodconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
arm                        neponset_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
arm                         nhk8815_defconfig
mips                           mtx1_defconfig
powerpc                     sbc8548_defconfig
arm                     am200epdkit_defconfig
ia64                            zx1_defconfig
powerpc                     ksi8560_defconfig
powerpc                  mpc866_ads_defconfig
mips                            ar7_defconfig
mips                      bmips_stb_defconfig
arm                  colibri_pxa270_defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
m68k                       m5249evb_defconfig
sh                        dreamcast_defconfig
um                            kunit_defconfig
sh                               alldefconfig
arm                             rpc_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
sh                               allmodconfig
arm                        mini2440_defconfig
mips                            e55_defconfig
m68k                        mvme16x_defconfig
mips                            gpr_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      chrp32_defconfig
arm                            mps2_defconfig
sh                           se7721_defconfig
arm                  colibri_pxa300_defconfig
m68k                          hp300_defconfig
arm                       imx_v4_v5_defconfig
sparc64                          alldefconfig
arm                           viper_defconfig
sh                        sh7757lcr_defconfig
nios2                               defconfig
um                           x86_64_defconfig
mips                       capcella_defconfig
arm                          moxart_defconfig
arm                          gemini_defconfig
powerpc                     tqm5200_defconfig
powerpc                 canyonlands_defconfig
s390                          debug_defconfig
sh                          rsk7269_defconfig
powerpc                       ppc64_defconfig
nios2                            allyesconfig
sh                           se7206_defconfig
arm64                            alldefconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
powerpc                      walnut_defconfig
arm                        spear6xx_defconfig
mips                         mpc30x_defconfig
arm                      footbridge_defconfig
s390                             alldefconfig
sh                   rts7751r2dplus_defconfig
powerpc                     kilauea_defconfig
mips                           rs90_defconfig
powerpc                     mpc5200_defconfig
arm                        vexpress_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
arm                           h3600_defconfig
mips                        omega2p_defconfig
powerpc                          allmodconfig
xtensa                         virt_defconfig
mips                     loongson2k_defconfig
powerpc                          g5_defconfig
i386                                defconfig
x86_64                            allnoconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210531
x86_64               randconfig-a003-20210531
x86_64               randconfig-a005-20210531
x86_64               randconfig-a004-20210531
x86_64               randconfig-a002-20210531
x86_64               randconfig-a001-20210531
i386                 randconfig-a002-20210531
i386                 randconfig-a001-20210531
i386                 randconfig-a005-20210531
i386                 randconfig-a006-20210531
i386                 randconfig-a004-20210531
i386                 randconfig-a003-20210531
i386                 randconfig-a003-20210601
i386                 randconfig-a006-20210601
i386                 randconfig-a004-20210601
i386                 randconfig-a001-20210601
i386                 randconfig-a002-20210601
i386                 randconfig-a005-20210601
i386                 randconfig-a016-20210531
i386                 randconfig-a015-20210531
i386                 randconfig-a013-20210531
i386                 randconfig-a012-20210531
i386                 randconfig-a014-20210531
i386                 randconfig-a011-20210531
i386                 randconfig-a015-20210601
i386                 randconfig-a013-20210601
i386                 randconfig-a011-20210601
i386                 randconfig-a016-20210601
i386                 randconfig-a014-20210601
i386                 randconfig-a012-20210601
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210531
x86_64               randconfig-a002-20210601
x86_64               randconfig-a004-20210601
x86_64               randconfig-a003-20210601
x86_64               randconfig-a006-20210601
x86_64               randconfig-a005-20210601
x86_64               randconfig-a001-20210601
x86_64               randconfig-a014-20210531
x86_64               randconfig-a012-20210531
x86_64               randconfig-a013-20210531
x86_64               randconfig-a016-20210531
x86_64               randconfig-a015-20210531
x86_64               randconfig-a011-20210531

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
