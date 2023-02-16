Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F9F698A87
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 03:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBPCbU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 21:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBPCbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 21:31:19 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD3342DED
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 18:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676514675; x=1708050675;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0rEKe+uSXbtcjv8RkQSGK25Qcxl5Kcj7olb5bsd9I1M=;
  b=CGGRY/m/4GocyfcXTCs+FzIfYSeJcr/D7Z63uGM7q8YA3PAr3ADgr1Ww
   B8VGa+aOVUlfgb41lcWl4xIjuu4KtVf2wsytWHO+tAjdNn1PIHt9bz0ms
   j8XlHxalc1PRkO+NPN4x3XNXZo0NMfN7mStXWOx9kTieaWxih7ENj0NiK
   ZRLuXdttkviLjJfd1i2Nz1Ii+yb2rBU4lEyvSZF7o1ecbjei7VNxlJw9I
   uBW0qVXXPFzYbz/jXSVVyQIvxSEjFwUh0rRKqAvvPRpJkjA3oWmdmIFNF
   PB90SbNJU/CE1YWBzXdANQz1WO/Z8tbdAnQeo+o/s7uhGf3RIi6dHsbgd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="329327557"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="329327557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 18:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="671990643"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="671990643"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Feb 2023 18:31:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pSU3E-0009wn-2d;
        Thu, 16 Feb 2023 02:31:12 +0000
Date:   Thu, 16 Feb 2023 10:30:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 1bb9ffce74c1457d2f9f14628ee9a243929bdab6
Message-ID: <63ed954e.8j+EaZ44MAFOR+qP%lkp@intel.com>
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
branch HEAD: 1bb9ffce74c1457d2f9f14628ee9a243929bdab6  Merge branches 'renesas-dt-bindings-for-v6.4' and 'renesas-dts-for-v6.4' into renesas-devel

elapsed time: 725m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230212
arc                  randconfig-r043-20230213
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                         lubbock_defconfig
arm                  randconfig-r046-20230212
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                       m5475evb_defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
openrisc                            defconfig
openrisc                 simple_smp_defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                      tqm8xx_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230213
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230213
sh                               allmodconfig
sh                           se7206_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3
xtensa                              defconfig

clang tested configs:
arm                  randconfig-r046-20230213
hexagon              randconfig-r041-20230212
hexagon              randconfig-r041-20230213
hexagon              randconfig-r045-20230212
hexagon              randconfig-r045-20230213
i386                 randconfig-a001-20230213
i386                 randconfig-a002-20230213
i386                 randconfig-a003-20230213
i386                 randconfig-a004-20230213
i386                 randconfig-a005-20230213
i386                 randconfig-a006-20230213
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
mips                        bcm63xx_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                randconfig-r042-20230212
s390                 randconfig-r044-20230212
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
