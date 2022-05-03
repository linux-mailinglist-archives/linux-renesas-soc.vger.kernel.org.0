Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00FD518C82
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 20:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiECSp5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 14:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiECSp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 14:45:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEE63191E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 11:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651603343; x=1683139343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nJtDnoiuRWyk8Q6OdXebIc8ePYOgmJWpDu6fD/94f7k=;
  b=SYlEWny8v/8pGWc7RiNAuajYiDGWSisaQ1bEFXLkagI5ZzkSrvGyIq5I
   GzAZpNKUn/QpSfMoHUug2Yhzc/mP1lFTKWUYk+Z/Z3gfbr8dYnKISvBWv
   d31Sx807M8K5WqmjmAHiR9N/MgKor6if2HI/W73SyforaAfraJnD3jbXW
   Hc0WZQ38JOLhIiZgUWBDl9XzmOQBgmfQhM9AijR1aeeLEdxhzl5CsRqhM
   6yrwvWz639SBH5Dx4bwjY5h2eeg61WNOdPWgkXj+YtW0FYe5BxsJAXVpV
   /8BAUaGT6iu5CWbQcqIjModKKe9I1XUnvcWJ3J3QiPKVYffBSyQinmhNt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266401602"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="266401602"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 11:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="664091390"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 May 2022 11:42:22 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlxTZ-000AiP-EP;
        Tue, 03 May 2022 18:42:21 +0000
Date:   Wed, 04 May 2022 02:42:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.19] BUILD SUCCESS
 14f11da778ff642142e9be18814815754c82d6c5
Message-ID: <6271777f.B753rXwk8MkgtyU1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.19
branch HEAD: 14f11da778ff642142e9be18814815754c82d6c5  soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS configs

elapsed time: 7211m

configs tested: 293
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                           imxrt_defconfig
powerpc                    sam440ep_defconfig
arc                         haps_hs_defconfig
xtensa                          iss_defconfig
mips                         tb0226_defconfig
powerpc                      cm5200_defconfig
powerpc                       holly_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
xtensa                           allyesconfig
powerpc                         ps3_defconfig
arc                     haps_hs_smp_defconfig
arc                            hsdk_defconfig
arm                         vf610m4_defconfig
s390                       zfcpdump_defconfig
arm                        realview_defconfig
arm                       multi_v4t_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
parisc                              defconfig
sh                         microdev_defconfig
mips                           ip32_defconfig
arm                          lpd270_defconfig
riscv                            allyesconfig
powerpc                      ppc6xx_defconfig
arm                      jornada720_defconfig
sh                           se7619_defconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
sh                            shmin_defconfig
sh                          r7780mp_defconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
h8300                               defconfig
sh                          rsk7264_defconfig
sparc                            alldefconfig
powerpc                      ep88xc_defconfig
arc                          axs103_defconfig
powerpc                    klondike_defconfig
powerpc                   currituck_defconfig
m68k                       m5208evb_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                       common_defconfig
arc                              alldefconfig
sparc                       sparc64_defconfig
ia64                         bigsur_defconfig
m68k                          sun3x_defconfig
arm                         nhk8815_defconfig
powerpc                    amigaone_defconfig
microblaze                      mmu_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
sh                        apsh4ad0a_defconfig
m68k                       m5275evb_defconfig
arm                            lart_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                               defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
parisc                generic-64bit_defconfig
sh                          lboxre2_defconfig
m68k                           sun3_defconfig
powerpc                     taishan_defconfig
xtensa                  cadence_csp_defconfig
arm                         assabet_defconfig
powerpc                     tqm8548_defconfig
sh                         ecovec24_defconfig
arm                       omap2plus_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
alpha                            alldefconfig
mips                      fuloong2e_defconfig
xtensa                         virt_defconfig
powerpc                      mgcoge_defconfig
powerpc                   motionpro_defconfig
m68k                       m5475evb_defconfig
m68k                       bvme6000_defconfig
arm                            qcom_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
s390                          debug_defconfig
sh                      rts7751r2d1_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7785lcr_defconfig
powerpc                        cell_defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
arm                        cerfcube_defconfig
sh                        edosk7705_defconfig
arm                      integrator_defconfig
um                               alldefconfig
sh                          rsk7201_defconfig
arm                        oxnas_v6_defconfig
m68k                          multi_defconfig
mips                     decstation_defconfig
powerpc                         wii_defconfig
s390                             allyesconfig
ia64                             alldefconfig
arc                        nsim_700_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                       maple_defconfig
mips                      maltasmvp_defconfig
sh                             sh03_defconfig
sh                             espt_defconfig
openrisc                            defconfig
sh                          urquell_defconfig
arm                       aspeed_g5_defconfig
arm                         cm_x300_defconfig
sh                           se7721_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
h8300                       h8s-sim_defconfig
sh                           sh2007_defconfig
powerpc                     mpc83xx_defconfig
mips                           jazz_defconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
powerpc                     asp8347_defconfig
mips                       bmips_be_defconfig
sh                        sh7763rdp_defconfig
m68k                             allmodconfig
sh                ecovec24-romimage_defconfig
openrisc                    or1ksim_defconfig
sh                           se7705_defconfig
m68k                         amcore_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220501
arm                  randconfig-c002-20220429
x86_64               randconfig-c001-20220502
i386                 randconfig-c001-20220502
arm                  randconfig-c002-20220502
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20220502
x86_64               randconfig-a001-20220502
x86_64               randconfig-a003-20220502
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a004-20220502
i386                 randconfig-a006-20220502
i386                 randconfig-a002-20220502
i386                 randconfig-a003-20220502
i386                 randconfig-a001-20220502
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220428
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220429
s390                 randconfig-r044-20220429
riscv                randconfig-r042-20220429
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
riscv                randconfig-c006-20220429
mips                 randconfig-c004-20220429
arm                  randconfig-c002-20220429
powerpc              randconfig-c003-20220429
arm                       spear13xx_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm                        vexpress_defconfig
arm                         palmz72_defconfig
arm                       cns3420vb_defconfig
powerpc                     tqm5200_defconfig
riscv                    nommu_virt_defconfig
powerpc                  mpc866_ads_defconfig
mips                  cavium_octeon_defconfig
arm                          ep93xx_defconfig
arm                        neponset_defconfig
arm                          moxart_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
arm                         s3c2410_defconfig
arm64                            allyesconfig
arm                            mmp2_defconfig
powerpc                      katmai_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                           mtx1_defconfig
powerpc                      walnut_defconfig
arm                              alldefconfig
mips                            e55_defconfig
powerpc                    socrates_defconfig
arm                         bcm2835_defconfig
powerpc                        fsp2_defconfig
powerpc                   microwatt_defconfig
mips                       lemote2f_defconfig
arm                       netwinder_defconfig
mips                          ath25_defconfig
x86_64                           allyesconfig
mips                           ip28_defconfig
mips                      maltaaprp_defconfig
arm                            dove_defconfig
powerpc                      pmac32_defconfig
powerpc                     ksi8560_defconfig
arm                       aspeed_g4_defconfig
powerpc                      acadia_defconfig
arm                        magician_defconfig
arm                          ixp4xx_defconfig
riscv                          rv32_defconfig
mips                     cu1000-neo_defconfig
arm                             mxs_defconfig
powerpc                 linkstation_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a015-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a011-20220502
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501
s390                 randconfig-r044-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
