Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEE252B7ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 12:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbiERKhd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 06:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235117AbiERKhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 06:37:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F31900D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 03:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652870251; x=1684406251;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DU12nI0SzERZvyZMKg9Ye7eFISujkcqwVUBS1zBbCto=;
  b=jmxGewsquscjYrO4hjfxxFbb0kNBxI2V7Bc8i+6v6I1S717S5Q28S9ke
   Y3eSZOX9gESLCTg/3I8cegemQTO0v3w9hrsbkU4VlGrkvOz0T4QGG07Dh
   nIMbBKSsgOEjbN1gGRzSNaOl3sjpB0Ks+DetS8UMdv63Ln+MN7vKIV2Yz
   R171GhOUZSehHXkmQGUJ3riH+WK+Px0pTfMaUeU4h0CUt/QjcmbrsgBU5
   /+z4m5JPkD+qav1g9SVBq0Ay99/0O+5/oh9olJm9rsjCaKfHYHu454f3N
   ZyYtzsHtDOqDhRatR1ezhaOj2nd0EN9BnQC5eKl/3W1jbM2/8/QrmpoD0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271735454"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="271735454"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 03:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="898168992"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 May 2022 03:37:30 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nrH3Z-00024L-L0;
        Wed, 18 May 2022 10:37:29 +0000
Date:   Wed, 18 May 2022 18:37:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 623eb0d9e301788e6433bfa20a852a3cc34468bc
Message-ID: <6284cc66.2XyCid5/Jsv4h951%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: 623eb0d9e301788e6433bfa20a852a3cc34468bc  arm64: dts: renesas: Rename numbered regulators

elapsed time: 1525m

configs tested: 143
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220516
m68k                        m5407c3_defconfig
m68k                             allmodconfig
arm                        multi_v7_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
arm                      jornada720_defconfig
sparc                       sparc64_defconfig
mips                            ar7_defconfig
s390                             allyesconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
arm                           h5000_defconfig
sh                           se7724_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                       m5208evb_defconfig
sh                             sh03_defconfig
sh                ecovec24-romimage_defconfig
sh                          r7780mp_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
mips                            gpr_defconfig
sh                        dreamcast_defconfig
m68k                       bvme6000_defconfig
sh                               j2_defconfig
mips                           ci20_defconfig
openrisc                            defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220516
x86_64               randconfig-c001-20220516
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
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
x86_64               randconfig-a012-20220516
x86_64               randconfig-a011-20220516
x86_64               randconfig-a013-20220516
x86_64               randconfig-a014-20220516
x86_64               randconfig-a016-20220516
x86_64               randconfig-a015-20220516
i386                 randconfig-a016-20220516
i386                 randconfig-a013-20220516
i386                 randconfig-a015-20220516
i386                 randconfig-a012-20220516
i386                 randconfig-a014-20220516
i386                 randconfig-a011-20220516
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220516
s390                 randconfig-r044-20220516
riscv                randconfig-r042-20220516
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220516
riscv                randconfig-c006-20220516
mips                 randconfig-c004-20220516
arm                  randconfig-c002-20220516
x86_64               randconfig-c007-20220516
i386                 randconfig-c001-20220516
powerpc              randconfig-c003-20220518
x86_64                        randconfig-c007
riscv                randconfig-c006-20220518
mips                 randconfig-c004-20220518
i386                          randconfig-c001
arm                  randconfig-c002-20220518
s390                 randconfig-c005-20220516
powerpc                     pseries_defconfig
mips                         tb0287_defconfig
powerpc                      ppc44x_defconfig
powerpc                    mvme5100_defconfig
arm                     davinci_all_defconfig
arm                       mainstone_defconfig
arm                          pxa168_defconfig
mips                        qi_lb60_defconfig
arm                         s3c2410_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc8272_ads_defconfig
x86_64               randconfig-a001-20220516
x86_64               randconfig-a006-20220516
x86_64               randconfig-a003-20220516
x86_64               randconfig-a005-20220516
x86_64               randconfig-a002-20220516
x86_64               randconfig-a004-20220516
i386                 randconfig-a001-20220516
i386                 randconfig-a003-20220516
i386                 randconfig-a005-20220516
i386                 randconfig-a004-20220516
i386                 randconfig-a006-20220516
i386                 randconfig-a002-20220516
hexagon              randconfig-r045-20220516
hexagon              randconfig-r041-20220516

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
