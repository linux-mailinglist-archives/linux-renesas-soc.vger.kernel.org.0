Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9C462A3F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 22:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbiKOVVh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 16:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbiKOVVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 16:21:23 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1154A31EFE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 13:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668547238; x=1700083238;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AI73H+bF95qXZkWgJTnS6W0uerAqbE/d4wqlIfowH/M=;
  b=SpM5Tlw4V6geBI7GOkLEmGTW4rybC/aBXgcJaXCqdsXMcfue4YyBhqrO
   9m3RmLskKdjfmyoD9OSOGDqZluLtAvib/XVrBbrvSH1bqvLklkmv2Cg6C
   R6aFqBn0oOHBTzhN+bsHtzVJvhf6IqOUT62nCYbKw/4jjm9/6Vr+fjnzw
   FHMc7sdzWsYzgNdTi+gZEAWMrn2KnUKJASsLvNnXnHPzcE6V3KEW8EyTq
   TuBefX9LKif3uk5UsEwAmxP+nzSUuZG6QXWqgrpDVYv0rCPyWL77axtuv
   gp6EXQBGQkkwFb75Sk+3BzqVf7UcwDB0ZarBounJUH5ePqsWjCuelEuRe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292762971"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="292762971"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="813826396"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="813826396"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 13:20:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov3Lu-0001fQ-1d;
        Tue, 15 Nov 2022 21:20:18 +0000
Date:   Wed, 16 Nov 2022 05:19:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 dff206d2346220aeff53f02783b9315d70d23be6
Message-ID: <6374027b.pvuZPOxWHaUvJrm3%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: dff206d2346220aeff53f02783b9315d70d23be6  Merge branch 'renesas-arm-dt-for-v6.2' into renesas-next

elapsed time: 720m

configs tested: 94
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
i386                 randconfig-a001-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a006-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a004-20221114
arc                                 defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
sh                               allmodconfig
alpha                               defconfig
mips                             allyesconfig
x86_64               randconfig-a005-20221114
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                           allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
i386                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20221114
arc                  randconfig-r043-20221115
x86_64                            allnoconfig
riscv                randconfig-r042-20221115
s390                 randconfig-r044-20221115
sh                          kfr2r09_defconfig
xtensa                  nommu_kc705_defconfig
sh                     magicpanelr2_defconfig
xtensa                          iss_defconfig
microblaze                      mmu_defconfig
arm                       multi_v4t_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc                      ppc40x_defconfig
powerpc                     taishan_defconfig
arc                          axs101_defconfig
arm                      integrator_defconfig
mips                           ci20_defconfig
powerpc                      ppc6xx_defconfig
sh                 kfr2r09-romimage_defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
openrisc                 simple_smp_defconfig
s390                          debug_defconfig
riscv                    nommu_k210_defconfig
mips                        vocore2_defconfig

clang tested configs:
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a016-20221114
riscv                randconfig-r042-20221114
hexagon              randconfig-r041-20221114
s390                 randconfig-r044-20221114
hexagon              randconfig-r045-20221115
hexagon              randconfig-r041-20221115
powerpc                   bluestone_defconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
