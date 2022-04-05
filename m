Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97C94F213D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiDECtt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 22:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiDECto (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 22:49:44 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CEF436143
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649123780; x=1680659780;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tOa+DY77N127DhpSRYRIf0Gnq+ibgBil1WqKl2XSevQ=;
  b=kwi2WqR8TRSvHJq3vZHEJ2+3G47hxFp+3VWBhv8vi28TzGM0Nxtus7is
   /nv4dUHsuu96gsQEOaH3mDi3SSp4uKQkgQY+uTxDH4WSIPoS2hU9XofER
   g8DOe4hIc0X1Njmc9CqXBIvpQM8l6IRx/nVdQQjN0u0zhraOuB4/v+VMl
   q37s/TH6kTdISKNKd01LOY78PJD2fddJXUqfci5TiJ2ptXjYhZA3jkC/Y
   qZJwT9cO89eMZarjWrpEZK75f2mkwsBy0gfIif+vz+/OtdKZM1W1gH2sG
   yx8Jv6inAmsOHP7JOj82Q7iNI+8CH43I535baOQj5ddIqJrk2/mmS6Q47
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260821030"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="260821030"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 18:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="548870195"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2022 18:22:40 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbXu4-0002WF-66;
        Tue, 05 Apr 2022 01:22:40 +0000
Date:   Tue, 05 Apr 2022 09:21:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v5.19] BUILD SUCCESS 3f285c301cd788164fa776e1f95458c56e68a6ee
Message-ID: <624b99af.+WKZZNzqj1+jSVjd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v5.19
branch HEAD: 3f285c301cd788164fa776e1f95458c56e68a6ee  dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC

elapsed time: 824m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
arm                        mini2440_defconfig
m68k                       bvme6000_defconfig
sparc                       sparc32_defconfig
mips                            gpr_defconfig
arc                        nsimosci_defconfig
m68k                          sun3x_defconfig
sh                                  defconfig
xtensa                              defconfig
alpha                            alldefconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
m68k                          hp300_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
arc                      axs103_smp_defconfig
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
i386                 randconfig-c001-20220404
x86_64               randconfig-c007-20220404
powerpc              randconfig-c003-20220404
riscv                randconfig-c006-20220404
mips                 randconfig-c004-20220404
arm                  randconfig-c002-20220404
mips                     loongson1c_defconfig
mips                  cavium_octeon_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
powerpc                   microwatt_defconfig
x86_64               randconfig-a004-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a006-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
hexagon              randconfig-r041-20220404
hexagon              randconfig-r045-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
