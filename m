Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955D857BFEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 00:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiGTWJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 18:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGTWJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 18:09:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2AD42AC1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 15:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658354948; x=1689890948;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q9zFjYBOUKFsUonL90gCP+gO2hynYtBdKP+VF+NhGbE=;
  b=d8Sa+HJs3rOwKdbR3l89N1hsl0JSz2R9fManBEGbPy9hmMwWIYUom7Ox
   DWZo/XbwbM2ZuQbjoQkn9vp6JuFlz3lVbv9MhisaKzKPPisovQOc0C+kG
   wVVM9EUd0IAwY0cPjO0yBJxygKr4bIpP3QK4KjDCTZ9jK+w3KuOQQe6a8
   ZzpdKGw9/FyHSz1duw/02RHhFznmL1tpFUg4+T6wo14nGz8CGLdxofNJB
   dACzg5CbDcBHW7q54Zt2VHulGIiFYAVkpQZvnWGogR90HOsIBN4Q9eQZr
   ObQK1fqT9n9rvbBX49B8nf0IdOyU8/ol9t/EM2lkacRFhSI8C3TlVwxxf
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="287642035"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="287642035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 15:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="573485436"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2022 15:09:07 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oEHsQ-0000yx-DW;
        Wed, 20 Jul 2022 22:09:06 +0000
Date:   Thu, 21 Jul 2022 06:08:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.21] BUILD SUCCESS
 2b17a0d5555131cbb2c87e5858628b3cce86a874
Message-ID: <62d87ce8.6Bz4zB3eAniqzRQ6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.21
branch HEAD: 2b17a0d5555131cbb2c87e5858628b3cce86a874  arm64: dts: renesas: spider-cpu: Enable eMMC0

elapsed time: 2320m

configs tested: 224
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220718
powerpc                  iss476-smp_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
sh                          r7785rp_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
arm                        realview_defconfig
arm                             rpc_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     sequoia_defconfig
m68k                         amcore_defconfig
sh                           se7343_defconfig
sh                         microdev_defconfig
arm                          pxa910_defconfig
arm                        oxnas_v6_defconfig
arm                          iop32x_defconfig
sh                      rts7751r2d1_defconfig
arm                         nhk8815_defconfig
powerpc                    sam440ep_defconfig
xtensa                    smp_lx200_defconfig
arm                          pxa3xx_defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
m68k                             alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                     pq2fads_defconfig
arc                     nsimosci_hs_defconfig
m68k                          atari_defconfig
powerpc                     asp8347_defconfig
m68k                           virt_defconfig
sh                        dreamcast_defconfig
arm                            xcep_defconfig
powerpc                     mpc83xx_defconfig
arm                       omap2plus_defconfig
sh                            titan_defconfig
sh                          rsk7264_defconfig
xtensa                       common_defconfig
sh                        sh7757lcr_defconfig
powerpc                      ep88xc_defconfig
arm                      footbridge_defconfig
powerpc                        cell_defconfig
nios2                               defconfig
openrisc                 simple_smp_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc40x_defconfig
arm64                            alldefconfig
mips                            ar7_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          badge4_defconfig
sh                             sh03_defconfig
m68k                                defconfig
powerpc                     rainier_defconfig
arm                          lpd270_defconfig
powerpc                     ep8248e_defconfig
arc                        nsimosci_defconfig
sh                             shx3_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc6xx_defconfig
arm                        spear6xx_defconfig
arm                            qcom_defconfig
sparc                             allnoconfig
arm                        mini2440_defconfig
sparc                            allyesconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
m68k                        mvme16x_defconfig
x86_64                              defconfig
sh                   secureedge5410_defconfig
m68k                        mvme147_defconfig
nios2                         10m50_defconfig
mips                         db1xxx_defconfig
mips                           jazz_defconfig
xtensa                  cadence_csp_defconfig
arm                         at91_dt_defconfig
xtensa                              defconfig
m68k                            mac_defconfig
arm                           viper_defconfig
mips                      loongson3_defconfig
mips                            gpr_defconfig
sh                          lboxre2_defconfig
arm                            lart_defconfig
arm                              allmodconfig
arm                           corgi_defconfig
ia64                          tiger_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                            q40_defconfig
mips                  decstation_64_defconfig
loongarch                        alldefconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
arm                  randconfig-c002-20220718
x86_64               randconfig-c001-20220718
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a011-20220718
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                 randconfig-c004-20220718
arm                  randconfig-c002-20220718
powerpc              randconfig-c003-20220718
i386                 randconfig-c001-20220718
riscv                randconfig-c006-20220718
s390                 randconfig-c005-20220718
x86_64               randconfig-c007-20220718
arm                      tct_hammer_defconfig
mips                           ip28_defconfig
x86_64                           allyesconfig
powerpc               mpc834x_itxgp_defconfig
arm                     am200epdkit_defconfig
riscv                            alldefconfig
arm                        magician_defconfig
mips                         tb0287_defconfig
mips                          rm200_defconfig
arm                        mvebu_v5_defconfig
arm                          pxa168_defconfig
arm                          moxart_defconfig
powerpc                          allmodconfig
powerpc                 mpc832x_rdb_defconfig
arm                          pcm027_defconfig
mips                          ath25_defconfig
powerpc                      acadia_defconfig
hexagon                          alldefconfig
mips                      bmips_stb_defconfig
mips                          malta_defconfig
mips                          ath79_defconfig
powerpc                    gamecube_defconfig
mips                      maltaaprp_defconfig
mips                        maltaup_defconfig
powerpc                     mpc5200_defconfig
powerpc                        fsp2_defconfig
powerpc                     akebono_defconfig
powerpc                    socrates_defconfig
mips                           rs90_defconfig
arm                           spitz_defconfig
arm                         hackkit_defconfig
arm                        multi_v5_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a003-20220718
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a001-20220718
x86_64               randconfig-a005-20220718
x86_64               randconfig-a003-20220718
x86_64               randconfig-a002-20220718
x86_64               randconfig-a006-20220718
x86_64               randconfig-a004-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
