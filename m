Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9799A5169B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 06:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbiEBEJ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 00:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiEBEJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 00:09:28 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9138A1B3
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 21:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651464359; x=1683000359;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jLCYo1FsMr/m/W1YlUgNmKJW7MUQtZVP4zgenpd5BIg=;
  b=oE1DsFQ2WTNBPlFz8/3OjYDalTj/0EeMCL+rOUBMiOxHYWIjixiibsVZ
   wbjicNqsmYvRmghwc0amU8o8tGME4R7nJJwW9NRb8OJT4sGJn8ciqCgsm
   0kBPkrI5Fq+72lwQYbuBmEsvkC8eux7qb+p3+ySUepYeBQNxq4AotGd/o
   sCaNC7Cr/+4pwuabx2rOY26KXkcdG0YRuCmgwWe0PK1pPkMxTfPHlV1j3
   V1Yozok2wcEjqNPI1wYlcZdRNOmAuvX1xBkLUYSVuaHAOnLp2gXyeqhrZ
   ykBjy+uBBw4V+NbdnM2sqT28mFi03TxJTPX2hTiC0NezXEiIm7ijCbIUE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330097192"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="330097192"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 21:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="630928312"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 May 2022 21:05:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlNJs-0009H3-Mf;
        Mon, 02 May 2022 04:05:56 +0000
Date:   Mon, 02 May 2022 12:05:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 32b87add13fcbd8b384a969924720c0f2b30893a
Message-ID: <626f589a.NR8/XN/bO73m3YVf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 32b87add13fcbd8b384a969924720c0f2b30893a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 3813m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                        mini2440_defconfig
sh                          landisk_defconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         cm_x300_defconfig
powerpc                 mpc834x_itx_defconfig
arm                          lpd270_defconfig
arm                            lart_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                               defconfig
m68k                           sun3_defconfig
mips                             allmodconfig
s390                       zfcpdump_defconfig
mips                           jazz_defconfig
mips                        bcm47xx_defconfig
arc                              alldefconfig
powerpc                      makalu_defconfig
arm                       imx_v6_v7_defconfig
sh                           se7206_defconfig
arm                      integrator_defconfig
um                               alldefconfig
m68k                          sun3x_defconfig
sh                          rsk7201_defconfig
arm                        oxnas_v6_defconfig
arc                        nsim_700_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                    amigaone_defconfig
sh                           se7721_defconfig
powerpc                   currituck_defconfig
powerpc                      cm5200_defconfig
powerpc                           allnoconfig
powerpc                      chrp32_defconfig
sh                ecovec24-romimage_defconfig
sh                          kfr2r09_defconfig
openrisc                    or1ksim_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220429
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
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
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220428
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
mips                   sb1250_swarm_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
powerpc                 mpc836x_rdk_defconfig
arm                        mvebu_v5_defconfig
arm                        vexpress_defconfig
arm                         palmz72_defconfig
arm                       cns3420vb_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
arm                                 defconfig
powerpc                     pseries_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
