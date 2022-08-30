Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1675A6EBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 22:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiH3Uyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 16:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiH3Uyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 16:54:39 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE53868AA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661892874; x=1693428874;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xx0t9ZTC4uH8PJ+BDF5q1Y6xpLgjP8/EACEyMgdaNc0=;
  b=YSgNs67FB0SFfHJOdBWmJcpoSeREPncPQVObML3dhR1jeLDPeh1JYLDg
   VOUWoLYKASzZcuUWmdEMPo0S3DAOADOArO6KIaIFZJ2qKyiYz7d3XcITY
   QfpTmHn/twL3aGpT0mhTzN62+uYCuwiL3J5HIPiGA5mOakYLCYyAPPyri
   Gf7rHuQBJjpqoBqoSvuvA0HskRvEnanJ07ZnUGqSiDY5CBI86ROc7w6h8
   A/AhNNqb1A1nqR641qdAEq6J5drjTWXnYg7m0ntH8vWHwsbDYvTY8vY0i
   vmiHLpeVOeZ3qXkKLUzQAG9qQ0ERlUqhLmDGin+Fu2Rz4Lhd7IKXBA5zS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296577382"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="296577382"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 13:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="940186826"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 13:54:31 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT8Fj-0000bD-0D;
        Tue, 30 Aug 2022 20:54:31 +0000
Date:   Wed, 31 Aug 2022 04:54:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.1] BUILD SUCCESS
 fddccbcb4de7ae734977da1a4c6d4c04a36a8f62
Message-ID: <630e78eb.jN9B4Tx1F6wCzPz+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.1
branch HEAD: fddccbcb4de7ae734977da1a4c6d4c04a36a8f62  dt-bindings: arm: renesas: Document Renesas R-Car V3H2 SoC and board

elapsed time: 720m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220830
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
arm                                 defconfig
m68k                             allyesconfig
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                            hp6xx_defconfig
arm                            pleb_defconfig
openrisc                       virt_defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         lubbock_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
xtensa                          iss_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                       imx_v6_v7_defconfig
mips                           jazz_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     asp8347_defconfig
sh                           se7619_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
i386                          randconfig-c001
sparc                               defconfig
mips                      loongson3_defconfig
m68k                       m5475evb_defconfig
xtensa                  nommu_kc705_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
powerpc                       eiger_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                      integrator_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
nios2                            alldefconfig
openrisc                  or1klitex_defconfig
sparc                             allnoconfig
sh                           se7721_defconfig
sh                        edosk7760_defconfig
m68k                            mac_defconfig

clang tested configs:
hexagon              randconfig-r045-20220830
hexagon              randconfig-r041-20220830
riscv                randconfig-r042-20220830
s390                 randconfig-r044-20220830
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                          pcm027_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
