Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30F559CC1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 01:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238636AbiHVXZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 19:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235448AbiHVXZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 19:25:16 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845763FA31
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 16:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661210715; x=1692746715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v5ibIcrfP2NFX/YY5eW1fQI8NKwAufwU91Mexm5SJRA=;
  b=eN1mTKbIXBiYuhZ51bi48MspN1fqYxjbpN95+Qc5KjxQVBS0z2USQDoX
   3TBQXuwWZ0YLQN+KVmODFdLXhKGWv4yawTBnAtMytlLh46pKIG+MFoJYY
   X3BzGrT9Z4Wd6y09RiThqCqi4UOuuTQ1zYl2Om//YAHEBcgjNJtqEhsSe
   FYVW9VQlHzjukkG+05BqXiIpPxgmKRIf09BZbV2LGcw/3Giv2Ys546Ohe
   pcIPs2Sf1hdMsalCMbMGn/Hlnv4LJaj8vzgSfFA9yf/kmBkL6Qe+oBjSp
   kdNjIVsuXim8oimY54TWIjDlIvaaFa5wdM+NnmjJw+O2YJfAnmlPsPUe0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="280516689"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="280516689"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 16:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="559936619"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 16:25:13 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQGnB-0000q5-0P;
        Mon, 22 Aug 2022 23:25:13 +0000
Date:   Tue, 23 Aug 2022 07:24:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 73ca80daf7b37b260f01cc4ce7963f48d8b5183f
Message-ID: <6304102b.8bi84miMt8zosv6K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: 73ca80daf7b37b260f01cc4ce7963f48d8b5183f  arm64: dts: renesas: r9a09g011: Add pinctrl node

elapsed time: 722m

configs tested: 149
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220821
x86_64                              defconfig
m68k                             allmodconfig
sh                               allmodconfig
i386                 randconfig-a014-20220822
x86_64                        randconfig-a013
arc                              allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a011
alpha                            allyesconfig
i386                 randconfig-a013-20220822
arm                                 defconfig
i386                 randconfig-a011-20220822
m68k                             allyesconfig
i386                 randconfig-a012-20220822
i386                                defconfig
i386                 randconfig-a016-20220822
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a015-20220822
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
sh                          rsk7201_defconfig
powerpc                 canyonlands_defconfig
arm                          badge4_defconfig
sh                   sh7724_generic_defconfig
sh                            titan_defconfig
s390                             allmodconfig
x86_64               randconfig-a013-20220822
x86_64               randconfig-a014-20220822
x86_64               randconfig-a011-20220822
x86_64               randconfig-a016-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a015-20220822
riscv                randconfig-r042-20220822
s390                 randconfig-r044-20220822
arc                  randconfig-r043-20220822
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
loongarch                           defconfig
loongarch                         allnoconfig
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
arm                          exynos_defconfig
xtensa                  nommu_kc705_defconfig
mips                            gpr_defconfig
sh                   sh7770_generic_defconfig
arm                         lubbock_defconfig
sh                                  defconfig
parisc                generic-32bit_defconfig
i386                          randconfig-c001
arm                      footbridge_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc85xx_cds_defconfig
loongarch                 loongson3_defconfig
mips                           xway_defconfig
arc                              alldefconfig
arc                                 defconfig
sparc                               defconfig
powerpc                      ppc6xx_defconfig
sh                          rsk7269_defconfig
ia64                            zx1_defconfig
arm                        oxnas_v6_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        cell_defconfig
arm                             pxa_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
ia64                             allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                    amigaone_defconfig
arc                           tb10x_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          amiga_defconfig
sh                               j2_defconfig
powerpc                     taishan_defconfig
arm                        cerfcube_defconfig
powerpc                mpc7448_hpc2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220823

clang tested configs:
x86_64               randconfig-a002-20220822
x86_64               randconfig-a004-20220822
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
riscv                randconfig-r042-20220821
x86_64               randconfig-a005-20220822
s390                 randconfig-r044-20220821
x86_64               randconfig-a006-20220822
i386                 randconfig-a001-20220822
i386                 randconfig-a005-20220822
x86_64                        randconfig-a016
i386                 randconfig-a002-20220822
x86_64                        randconfig-a012
i386                 randconfig-a003-20220822
i386                 randconfig-a004-20220822
i386                 randconfig-a006-20220822
x86_64                        randconfig-a014
powerpc                      katmai_defconfig
arm                        neponset_defconfig
mips                      maltaaprp_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
arm                         bcm2835_defconfig
x86_64                        randconfig-k001
arm                     am200epdkit_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                        fsp2_defconfig
arm                          sp7021_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                         palmz72_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                     tqm5200_defconfig
arm                          pxa168_defconfig
arm                          ixp4xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
