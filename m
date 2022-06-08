Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E948543E39
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 23:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbiFHVIE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 17:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiFHVIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 17:08:02 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1686AA5007
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654722482; x=1686258482;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JLbY0sS1YzN3fBaQSIVCkSAZjgtIoeoGe0IN8rlL7oo=;
  b=bpuMr5tUZ02873UUddGIKxJjYRfVYvJDocaXGaRCA/dk8UpAHa4nsVVY
   8Q2+VSm0zCbjB7h6bpOD/LWpmAnKdiDYGpY7z4GRcumqsP9UtmezCvvxq
   P/acPVBxICzED48mNLP79Xc374LxBVMV6RyL8Q1AiF7fLNvma/4SXnvLa
   4RdfCxGp7TFgRIf6TGs+bgNEHvE64BBp/wsObvRvnoaEDtrvvgFmqeHAR
   f2px5P3NKRp61giJmOaJ76vwtiUHN9hymQe7TePlRHktF3vhJVo+pgWrA
   4qkO/PJ+0rzo/lSiacEITPgzEf1Nccj/Cex+vKAUwDWlxWGkKIfwdQG1L
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="302410609"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="302410609"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 14:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="670781895"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 14:08:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nz2uF-000F17-S2;
        Wed, 08 Jun 2022 21:07:59 +0000
Date:   Thu, 09 Jun 2022 05:07:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 b36be13ed6cb4619f26f9e963e41ffd74c3a2ef7
Message-ID: <62a10fa9.qZ7W54xYAPanOy8Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: b36be13ed6cb4619f26f9e963e41ffd74c3a2ef7  arm64: dts: renesas: r8a779f0: Add iommus to DMAC nodes

elapsed time: 2144m

configs tested: 106
configs skipped: 110

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220607
sh                           se7206_defconfig
powerpc                    adder875_defconfig
sh                         apsh4a3a_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc6xx_defconfig
arm                        shmobile_defconfig
parisc                generic-64bit_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_itx_defconfig
alpha                            alldefconfig
m68k                            mac_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220607
ia64                                defconfig
x86_64                            allnoconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
mips                             allyesconfig
mips                             allmodconfig
s390                                defconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
riscv                          rv32_defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
parisc                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220607
x86_64                        randconfig-c007
riscv                randconfig-c006-20220607
i386                          randconfig-c001
s390                 randconfig-c005-20220607
mips                 randconfig-c004-20220607
arm                  randconfig-c002-20220607
mips                      pic32mzda_defconfig
arm                         socfpga_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                        fsp2_defconfig
powerpc                          g5_defconfig
arm64                            allyesconfig
powerpc                     akebono_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220608
hexagon              randconfig-r041-20220608

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
