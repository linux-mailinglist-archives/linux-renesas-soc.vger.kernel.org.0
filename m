Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E28567B2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Jul 2022 02:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiGFA5H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 20:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGFA5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 20:57:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD4C17A9E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 17:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657069025; x=1688605025;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ixde5I1ADZkHB5A3SIjtw9dkOMo4W0fduTfcu43sxik=;
  b=cMd43OfYnapWQE/8fD13Rf1+9o5HTJ7gXIMuXVuGYEJWncDnzHpiVzMW
   kponeHRiHsp8HbRduz+Cy+a6UPZTO6IYUpFQpv32I2wbmizzg8izV6d3l
   DLMGeX1LoBaEYBLoc8S+ofCKkm61oi/U5n5FLtwbQHGrBq6uJZ/QmS8aI
   8dNJjPhKUZoO6gb5cX1hOFIfYFO47+gZ2q8NGzHjhhYolKC02R+02z88v
   hrT3qBmhLyxI3FeTmLiD3jt1rIOdCuPY1bMfNrnSc/VcN2odm2W9D8Tel
   wnZTJPuwYYSYaFNCvpvPsOhiy2vYmftqQGCF2ypZO3dCxUePyChITBiuO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347587499"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="347587499"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 17:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="543174984"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jul 2022 17:57:04 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8tLj-000Jlh-Qj;
        Wed, 06 Jul 2022 00:57:03 +0000
Date:   Wed, 06 Jul 2022 08:56:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b7d295b5ef2e2985496b2a3b9c4594189db6bbb0
Message-ID: <62c4ddb2.PLam5JCJN+r4QmJS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b7d295b5ef2e2985496b2a3b9c4594189db6bbb0  Merge branches 'renesas-arm-dt-for-v5.20' and 'renesas-arm-soc-for-v5.20' into renesas-next

elapsed time: 976m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220704
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
arc                         haps_hs_defconfig
arm                        keystone_defconfig
s390                          debug_defconfig
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
arm                         lubbock_defconfig
m68k                          multi_defconfig
arc                     haps_hs_smp_defconfig
sh                                  defconfig
nios2                            allyesconfig
nios2                               defconfig
mips                         bigsur_defconfig
sh                            titan_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
sparc64                             defconfig
sh                          rsk7264_defconfig
mips                     loongson1b_defconfig
sh                           se7206_defconfig
x86_64                           alldefconfig
openrisc                            defconfig
sh                        sh7785lcr_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
arm                           h3600_defconfig
m68k                        stmark2_defconfig
mips                       bmips_be_defconfig
m68k                        m5407c3_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                       multi_v4t_defconfig
sh                ecovec24-romimage_defconfig
arc                              allyesconfig
arm                         cm_x300_defconfig
xtensa                         virt_defconfig
sh                              ul2_defconfig
sh                          r7785rp_defconfig
m68k                       m5475evb_defconfig
m68k                          amiga_defconfig
sh                        sh7757lcr_defconfig
riscv                               defconfig
arc                          axs101_defconfig
arm                          gemini_defconfig
openrisc                    or1ksim_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220703
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220703
arc                  randconfig-r043-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
powerpc                      ppc64e_defconfig
arm                       versatile_defconfig
powerpc                     kilauea_defconfig
arm                           sama7_defconfig
arm                         orion5x_defconfig
mips                          ath25_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220703
hexagon              randconfig-r041-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
