Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAC169EB4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 00:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjBUXhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 18:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjBUXhv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 18:37:51 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7424D35A3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 15:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677022670; x=1708558670;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2fUgk/iGcu8vLhKH8g1P4JR+37hWstrnXF2/pWnXudM=;
  b=Ytzw354PDkrMWdm2grwRE/Cm2X3h1b57oehTNwqmi7P8PIC+i4OEH66M
   ZHu9bKiFmoeyzP/9bXwiLnBQeIbWIrDdNskVCU63B5/9OxPmcxn0DKtyp
   i1rYA2uPQk8QRrfh1iNdOaGCw4yLY5XeZr6oR/cJSUiu5xbGGS4tJRbnC
   HL9Zj91NHYsTHuF0vDk+ltAxFrMRFXLklNSDKAtlRcbhOVWCXLnywUDIb
   +MOournvW/BGatCY5DGHvEUvCWXGg7ypxlLwLaiOIPEY7Ha0I90HqaZOw
   pQaFt0/xSHetjsSAP0lABPz9/6VPaoBc6fDMdnEWzcnCtLMZ+wxkCVtSY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334979920"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="334979920"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 15:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="673877561"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="673877561"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 15:37:48 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pUcCi-0000Lx-0s;
        Tue, 21 Feb 2023 23:37:48 +0000
Date:   Wed, 22 Feb 2023 07:37:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5b96f8a28064829e9c31a235f5b4a3f566743b9c
Message-ID: <63f555b5.Tk7YQBLCCubi9j3J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5b96f8a28064829e9c31a235f5b4a3f566743b9c  Merge branch 'renesas-dts-for-v6.4' into renesas-devel

elapsed time: 837m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              alldefconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230219
arc                  randconfig-r043-20230220
arc                  randconfig-r043-20230221
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230220
arm                        realview_defconfig
arm                           tegra_defconfig
arm                         vf610m4_defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                             alldefconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a001-20230220
i386                 randconfig-a002-20230220
i386                 randconfig-a003-20230220
i386                 randconfig-a004-20230220
i386                 randconfig-a005-20230220
i386                 randconfig-a006-20230220
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                     loongson1b_defconfig
nios2                               defconfig
openrisc                  or1klitex_defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                     ep8248e_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      ppc6xx_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230219
riscv                randconfig-r042-20230221
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230219
s390                 randconfig-r044-20230221
sh                               allmodconfig
sh                          rsk7203_defconfig
sh                          rsk7269_defconfig
sh                           se7619_defconfig
sh                   sh7770_generic_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a001-20230220
x86_64               randconfig-a002-20230220
x86_64               randconfig-a003-20230220
x86_64               randconfig-a004-20230220
x86_64               randconfig-a005-20230220
x86_64               randconfig-a006-20230220
x86_64                               rhel-8.3

clang tested configs:
arm                       aspeed_g4_defconfig
arm                  randconfig-r046-20230219
arm                  randconfig-r046-20230221
arm                        spear3xx_defconfig
hexagon              randconfig-r041-20230219
hexagon              randconfig-r041-20230220
hexagon              randconfig-r041-20230221
hexagon              randconfig-r045-20230219
hexagon              randconfig-r045-20230220
hexagon              randconfig-r045-20230221
i386                 randconfig-a011-20230220
i386                 randconfig-a012-20230220
i386                 randconfig-a013-20230220
i386                 randconfig-a014-20230220
i386                 randconfig-a015-20230220
i386                 randconfig-a016-20230220
mips                     cu1830-neo_defconfig
powerpc                     skiroot_defconfig
powerpc                      walnut_defconfig
riscv                randconfig-r042-20230220
s390                 randconfig-r044-20230220
x86_64               randconfig-a011-20230220
x86_64               randconfig-a012-20230220
x86_64               randconfig-a013-20230220
x86_64               randconfig-a014-20230220
x86_64               randconfig-a015-20230220
x86_64               randconfig-a016-20230220

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
