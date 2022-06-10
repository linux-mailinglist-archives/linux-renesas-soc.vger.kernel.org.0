Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9DE546A17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 18:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344875AbiFJQFt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 12:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243344AbiFJQFs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 12:05:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61411257A9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654877146; x=1686413146;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FE0sx45JLzpPF3jgICLSL6hvV9EnIDpzRY7LrErDArs=;
  b=CNDSsUrfXy2uubhNdsQdMuvwkKjgm1YUw6fXHDRd30FVATaNmuatICej
   hGSW5AW1g+z/4HQHepzia799XlLv4d6mrsJuT3V0bxX7FX9mk8QwYxb2b
   id2AdMRtw04PtF+u75pYFRLt5c69zgHZNDkM6/UrdVqgopEojgTFbzOhH
   qpuylxCZnQRnOZIvWDADzhybxLhGYT0uZHT1ofiV2JH9xkIA0rTY9uxcF
   vgym0RWuTSHvs+bpKhEIChXse3dGgWyK/oUKZEyKfWrWtx3sdSmUhcVzA
   Cg1OXqcG8pzPcMrtaLiRNGiOXpL3mJ9L0YVUHFQyxlEq3aJ1gcqFFTY9n
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="339420773"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="339420773"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="586269811"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2022 09:05:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzh8q-000I5t-EB;
        Fri, 10 Jun 2022 16:05:44 +0000
Date:   Sat, 11 Jun 2022 00:05:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 02c96ed9e4cd1f47bfcd10296fec6b0b69d6b3c6
Message-ID: <62a36bb8.zsrFbthxad/5N3Rw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 02c96ed9e4cd1f47bfcd10296fec6b0b69d6b3c6  clk: renesas: rzg2l: Fix reset status function

Unverified Warning (likely false positive, please contact us if interested):

drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overflow for expression '0xBE8<<20'. [integerOverflow]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-randconfig-p002-20220501
    `-- drivers-clk-renesas-r9a07g044-cpg.c:warning:Signed-integer-overflow-for-expression-BE8-.-integerOverflow

elapsed time: 4795m

configs tested: 143
configs skipped: 3

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
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
nios2                               defconfig
m68k                          sun3x_defconfig
powerpc                 mpc8540_ads_defconfig
arc                      axs103_smp_defconfig
sparc64                             defconfig
sh                           sh2007_defconfig
arm                           viper_defconfig
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
arm                       imx_v6_v7_defconfig
arm                         s3c6400_defconfig
arm                             ezx_defconfig
arm                      footbridge_defconfig
m68k                        mvme147_defconfig
powerpc                  storcenter_defconfig
mips                           xway_defconfig
openrisc                         alldefconfig
mips                      fuloong2e_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220607
arm                  randconfig-c002-20220608
arm                  randconfig-c002-20220609
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
powerpc                          allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
um                             i386_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220608
x86_64                        randconfig-c007
riscv                randconfig-c006-20220608
i386                          randconfig-c001
s390                 randconfig-c005-20220608
mips                 randconfig-c004-20220608
arm                  randconfig-c002-20220608
powerpc              randconfig-c003-20220607
riscv                randconfig-c006-20220607
s390                 randconfig-c005-20220607
mips                 randconfig-c004-20220607
arm                  randconfig-c002-20220607
mips                      pic32mzda_defconfig
arm                         socfpga_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                        fsp2_defconfig
powerpc                          g5_defconfig
arm64                            allyesconfig
mips                        maltaup_defconfig
powerpc                       ebony_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        workpad_defconfig
powerpc                     akebono_defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609
hexagon              randconfig-r045-20220608
hexagon              randconfig-r041-20220608

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
