Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C767F4F6D0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 23:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbiDFVkZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 17:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238664AbiDFVjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 17:39:07 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2044AC18
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Apr 2022 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649279746; x=1680815746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hEd9njM5iAP9Lfh5QvkdPmk27U6oPrkthWf00/SR+LM=;
  b=GlGRD9DpYHRRVmFfqMCke2043wx12CwhK4l2TB+bIoF0vWTKSsxDvoe8
   M2m0DnuEYBMhAaRnqedtVCGOrQKygyXbyzDRb+QMZ+bDnRPJNtLBlgUnB
   8OYrPyDJXsdZJuILByrjVMPKxsrwNm9Wrj+/wc3mloxKS9AdrxjidKFqb
   owRDrtCXVNl4faotzrkg+m5ZeqdeUXOEyAiP9Gq+M27qjkLomrt6N2H5J
   2iGiua7HUQEvmF7sE7LyRth025p19yCd6WLhpDyYAuyIAUrVaU8RyP8Uw
   i3HtuM9RLq7uj2bx7lyYIhL8RNpPiWkcVxJrzzTecYZA/IVdDSNzZlL72
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="258746167"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="258746167"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 14:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="851421989"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2022 14:15:44 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ncD0C-0004lF-0p;
        Wed, 06 Apr 2022 21:15:44 +0000
Date:   Thu, 07 Apr 2022 05:15:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 39f9e1759501ae431c5a28d77f0f84b6d2d5fa2d
Message-ID: <624e02df.KmPou1FkyMXSlYTV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 39f9e1759501ae431c5a28d77f0f84b6d2d5fa2d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1766m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
arm                                 defconfig
i386                          randconfig-c001
arm                      jornada720_defconfig
arc                            hsdk_defconfig
riscv                    nommu_k210_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc32_defconfig
mips                         tb0226_defconfig
arm                           sama5_defconfig
openrisc                 simple_smp_defconfig
sh                     sh7710voipgw_defconfig
arm                        multi_v7_defconfig
powerpc                      cm5200_defconfig
powerpc                     sequoia_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220405
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                  randconfig-r043-20220405
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220406
x86_64                        randconfig-c007
arm                  randconfig-c002-20220406
i386                          randconfig-c001
mips                 randconfig-c004-20220406
s390                 randconfig-c005-20220406
riscv                randconfig-c006-20220406
powerpc                 mpc8313_rdb_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           sama7_defconfig
arm                        vexpress_defconfig
arm                    vt8500_v6_v7_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220405
hexagon              randconfig-r045-20220405
s390                 randconfig-r044-20220405
riscv                randconfig-r042-20220405

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
