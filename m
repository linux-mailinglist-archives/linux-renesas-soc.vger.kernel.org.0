Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E3C4B5EE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 01:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiBOAOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Feb 2022 19:14:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiBOAOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 19:14:36 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09AEFBF13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Feb 2022 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644884067; x=1676420067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YpgJtFVxqqrxO3JwxuSLcz1ChGAYn+5UlbAizQha48I=;
  b=BPSJpcdPSDhsrZY45p1NJREd+jZeCrGYvwA/hO/n0YLZYEi27M5S9hl7
   U1v8WsDUbeUmvwy/+kFb5UvKCoCkWPC5xnq59tY8Y9WWO4CZ7QiFu6WVg
   CKXYcNSW/RdhT6R4CoVyOkcI8Yx7TQQyRHyaZ1Ji6qrH8IAdFeAaUsMVy
   PZRaB/Uz2+6xKsLmhjweZ0nkftqCEeB2SSs9I+PxzrwnD3eYSRm6vnKLx
   +Is35f5rFtCLvYpDOi0R1/SE8BhfJLk7xUw8vkpv1fuO+JdcrPTl0+Be5
   lMU7Gk1CCMRUUAbiQWajwZvD+ltJSBAaqiUtc1YpFufyktQe6zWBbkdP1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250161873"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="250161873"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 16:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="603519540"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2022 16:14:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJlU9-00094e-F9; Tue, 15 Feb 2022 00:14:25 +0000
Date:   Tue, 15 Feb 2022 08:14:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9fdc161c399720260bca91447c338042a2153996
Message-ID: <620af049.rQRYUShBd2Vv8pp0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9fdc161c399720260bca91447c338042a2153996  Merge tag 'v5.17-rc4' into renesas-devel

elapsed time: 721m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
m68k                         apollo_defconfig
ia64                        generic_defconfig
mips                      maltasmvp_defconfig
powerpc                     pq2fads_defconfig
sh                          rsk7203_defconfig
mips                         bigsur_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     stx_gp3_defconfig
powerpc                    adder875_defconfig
openrisc                            defconfig
m68k                           sun3_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
arm                        mvebu_v7_defconfig
x86_64                           alldefconfig
ia64                            zx1_defconfig
sh                           se7705_defconfig
arm                      integrator_defconfig
sh                           se7780_defconfig
arm                            qcom_defconfig
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
arm                           u8500_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arc                        nsimosci_defconfig
arm                        mini2440_defconfig
sh                        dreamcast_defconfig
arm                  randconfig-c002-20220214
arm                  randconfig-c002-20220213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
arc                  randconfig-r043-20220213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20220214
x86_64               randconfig-c007-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
s390                 randconfig-c005-20220214
mips                 randconfig-c004-20220214
riscv                randconfig-c006-20220214
arm                         lpc32xx_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                            e55_defconfig
mips                   sb1250_swarm_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
powerpc                     ppa8548_defconfig
arm64                            allyesconfig
arm                            dove_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
mips                     cu1830-neo_defconfig
arm                       spear13xx_defconfig
arm                             mxs_defconfig
mips                malta_qemu_32r6_defconfig
mips                           ip22_defconfig
powerpc                     mpc512x_defconfig
arm                          imote2_defconfig
mips                         tb0287_defconfig
arm                          moxart_defconfig
mips                         tb0219_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8560_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220213
hexagon              randconfig-r041-20220213
s390                 randconfig-r044-20220213
riscv                randconfig-r042-20220213
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
