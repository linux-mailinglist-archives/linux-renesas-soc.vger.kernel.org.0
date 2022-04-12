Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B8D4FE253
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 15:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355860AbiDLNWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 09:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355878AbiDLNWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 09:22:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B6453A6D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649769058; x=1681305058;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ma7bmOIt1tIkxRkC6+R1X1PesnYEAg+6bQNuPDrgl64=;
  b=UtihbC9J/1hU+tR0bWkql3QFQTDR0RGcGTWHZZ+X8XnmdD5Ywdt1soh3
   BZQif8Iz8YaRrDc+CWRhHwC5IVz4HKMWLc31tzA9ajrxb7p6XkRmaJWuR
   MjcBz9HBcmwl6o8126Ls28ACaDiTQR8OsaAqCnvpibCBgL0zmUG/nkk0i
   GDVK3Z/ZTi76q3DTiLxg7zbgf/+oHiQ4rJT+pA1E4dwyH1vlCbKDbZaJ1
   FfoOB17OXvHKLnwm3IdwVyZwullVE2AfzgMCgCa5fIWEkaSJrmUUHhnQz
   ewCLzBc7ixSAAdA+EJmzi9GmAoK8pInAoY8mfe4/rF22n9gAGPs8TZUJd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261808426"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="261808426"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 06:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="526032637"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 06:10:56 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1neGIJ-0002rG-QD;
        Tue, 12 Apr 2022 13:10:55 +0000
Date:   Tue, 12 Apr 2022 21:10:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ea5bee24e7143e88663f6497f6f9defd9ae0f77a
Message-ID: <62557a48.yRy+U3MpzIzSQl2N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ea5bee24e7143e88663f6497f6f9defd9ae0f77a  Merge branch 'renesas-next', tag 'v5.18-rc2' into renesas-devel

elapsed time: 1279m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220411
powerpc                      mgcoge_defconfig
mips                  decstation_64_defconfig
arm                     eseries_pxa_defconfig
arm                       imx_v6_v7_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                          iss_defconfig
powerpc                      ppc40x_defconfig
powerpc                      bamboo_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc83xx_defconfig
nios2                         3c120_defconfig
arm                           viper_defconfig
sparc                       sparc64_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
x86_64               randconfig-c001-20220411
arm                  randconfig-c002-20220411
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
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
x86_64               randconfig-a011-20220411
x86_64               randconfig-a013-20220411
x86_64               randconfig-a012-20220411
x86_64               randconfig-a016-20220411
x86_64               randconfig-a014-20220411
x86_64               randconfig-a015-20220411
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a014-20220411
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220411
s390                 randconfig-r044-20220411
riscv                randconfig-r042-20220411
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220411
arm                  randconfig-c002-20220411
x86_64               randconfig-c007-20220411
i386                 randconfig-c001-20220411
mips                 randconfig-c004-20220411
s390                 randconfig-c005-20220411
riscv                randconfig-c006-20220411
mips                       lemote2f_defconfig
powerpc                    mvme5100_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     mpc512x_defconfig
hexagon                             defconfig
powerpc                     ppa8548_defconfig
x86_64                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
arm                          imote2_defconfig
i386                 randconfig-a004-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a002-20220411
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
