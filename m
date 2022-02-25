Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413864C3BF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 03:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236841AbiBYCxR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 21:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236848AbiBYCxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 21:53:15 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B79F24FA0E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 18:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645757565; x=1677293565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=80JoRM9EMdja2Vcs0WkOyd9NNNbqJHk1dlJtcS0osHk=;
  b=TBn7ZJh7+dtpTQBXrAzzwjpY2Mx/kkBIN7FX8i6oEWhS8IbYLSBrg5KE
   x9wvGQ9nDLXm+qLg9WxaMFUvpjT8MR3u8/IRcwNprTQFBy8h9H8jS0sPm
   O9wi7oisJuMoeTF4vobOUvbP9GI3dCJP4VL8FsRAReFlFCZlRMxfh5Upl
   RWp/Rvj8VE/BPq0sV+V2zB6gDpNDVoJlcY8nV8OdjUBNE3XNR1MfWDS0V
   TMagP1dk89UN5Jti5ueuZ3OfwVyEifYJzX90cIYJU7oHv5adJTNw/+SOH
   Gbq+XHYgyZhhWgii/0L4lRX/81FQlslMCp0aaGah9eaiYfhDzqAV2OcdF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233028734"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="233028734"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 18:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="684507353"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2022 18:52:43 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNQio-0003lU-Ca; Fri, 25 Feb 2022 02:52:42 +0000
Date:   Fri, 25 Feb 2022 10:51:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f9181078bb481b09d2fdf252bdc8cebd02fee093
Message-ID: <6218444e.g+D2xziN0g74nLmc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f9181078bb481b09d2fdf252bdc8cebd02fee093  Merge branches 'renesas-arm-dt-for-v5.18' and 'renesas-drivers-for-v5.18' into renesas-next

elapsed time: 734m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220223
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
xtensa                          iss_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7780_defconfig
arm                         nhk8815_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
powerpc                     stx_gp3_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
powerpc                        cell_defconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
sparc                               defconfig
m68k                          amiga_defconfig
mips                       bmips_be_defconfig
sh                            migor_defconfig
powerpc                     taishan_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
arm                           viper_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
arm                          gemini_defconfig
arm                         s3c6400_defconfig
arc                     nsimosci_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
arc                  randconfig-r043-20220223
riscv                randconfig-r042-20220224
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220224
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
mips                 randconfig-c004-20220224
i386                          randconfig-c001
riscv                randconfig-c006-20220224
powerpc              randconfig-c003-20220223
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220223
riscv                randconfig-c006-20220223
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
arm                            mmp2_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220224
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
