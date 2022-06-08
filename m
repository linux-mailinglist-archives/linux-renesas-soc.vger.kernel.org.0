Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FB8543F4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 00:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234785AbiFHWnK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 18:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236686AbiFHWnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 18:43:09 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA3A24FA0A
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654728187; x=1686264187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3baUNOVpEY+VGrKBZBpakpFceTV8UHCawJLuySWrQe4=;
  b=fld0MQwZ7qQzDX7dKz9y2too3JoccBZg0uo7sasmiEhCRLI5jG3AEpHl
   5gZhdUD2Nn9J9tioLNqmF8CTy8ZpnIB4Dd1aEuF2CftNdBem6RsIhWigx
   3FXZ+0GPVxQEB6pNkIyDWAb+aPxSz67A1Y1H6KtDQddZIWdxTBLj5B36B
   BIGCUHuxsA6qWcmG2gr+LuaTnLkE50YlFMPLkUcWV42juKXeEgpYQeQRM
   vlSyCJbIIpKlOLTO822L/kYZOnymTwkrPXUtj6PVk68h/k3KnPGP0A/9H
   Zc/g2Mngy7ylSMh7LwTv7K0nTIX8cMp0a+RqH5aZaRADPzlg9vxRdLvSl
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="278235018"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="278235018"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 15:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="637106830"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2022 15:43:05 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nz4OH-000FBT-3V;
        Wed, 08 Jun 2022 22:43:05 +0000
Date:   Thu, 09 Jun 2022 06:42:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 6f4a1ec70aeccaabaae9ae3860561c6f48965c31
Message-ID: <62a125cd.b8nDzpL6D4J0EpJX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 6f4a1ec70aeccaabaae9ae3860561c6f48965c31  Merge branch 'renesas-arm-dt-for-v5.20' into renesas-next

elapsed time: 2239m

configs tested: 109
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220607
sh                           se7206_defconfig
powerpc                    adder875_defconfig
sh                         apsh4a3a_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc6xx_defconfig
arm                        shmobile_defconfig
parisc                generic-64bit_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_itx_defconfig
alpha                            alldefconfig
m68k                            mac_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220607
arm                  randconfig-c002-20220608
x86_64                            allnoconfig
riscv                             allnoconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
arc                                 defconfig
mips                             allyesconfig
nios2                            allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
powerpc                          allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
um                             i386_defconfig
ia64                             allmodconfig
ia64                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220607
x86_64                        randconfig-c007
riscv                randconfig-c006-20220607
i386                          randconfig-c001
s390                 randconfig-c005-20220607
mips                 randconfig-c004-20220607
arm                  randconfig-c002-20220607
mips                      pic32mzda_defconfig
arm                         socfpga_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                        fsp2_defconfig
powerpc                          g5_defconfig
arm64                            allyesconfig
mips                        maltaup_defconfig
powerpc                       ebony_defconfig
powerpc                     akebono_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220608
hexagon              randconfig-r041-20220608

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
