Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E208A54BFB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 04:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbiFOCiC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 22:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiFOCiC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 22:38:02 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5868928735
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2022 19:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655260681; x=1686796681;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lXEGdCBnM9CqURTsOByvk5T0t9qySMdqgRxUJ55CuOQ=;
  b=ghIGMPkPH7EF42pz90Nz7cImxJye+BqwD8y56kDU5rNDnV3yh1iIV6RB
   ZUj74OaFZ6Od/jOfTSKGVjzUWDfMlGYaZsU7GR7UxZsFegA7LuDeHI8Ti
   CHpJWiZIR414YaUysZUoWU3l/USxdMok73ilSlRmuivGX5C999gbRzd3J
   5x0/hNr4uIXxZmQl6OrtYTgkKZpMPEyWf7VmvsrCleeRFcqavQwfBdHq6
   fHMc6EpHiX2n4hoW7R7i/0A6sa4fnnHxhC3ba8XXDsa8pN8GHE0uA90/j
   KOCnmDGlDpqOj4Yumyj+Lijz819lTJMwl0qxphM4bj51V560lZqk6K3MM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261839151"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="261839151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 19:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="588830560"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jun 2022 19:37:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1Ius-000MVD-01;
        Wed, 15 Jun 2022 02:37:58 +0000
Date:   Wed, 15 Jun 2022 10:37:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b50ea0548bb5d543d6e33e4ac4c43aceecd0f2c5
Message-ID: <62a945cd.px5/zxr3DOOqzHA1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b50ea0548bb5d543d6e33e4ac4c43aceecd0f2c5  Merge branches 'renesas-arm-defconfig-for-v5.20', 'renesas-arm-dt-for-v5.20' and 'renesas-drivers-for-v5.20' into renesas-next

elapsed time: 2408m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220613
arm                        trizeps4_defconfig
arm                       aspeed_g5_defconfig
arm                            mps2_defconfig
sh                        edosk7705_defconfig
powerpc                     mpc83xx_defconfig
m68k                       m5249evb_defconfig
mips                         bigsur_defconfig
m68k                       m5275evb_defconfig
arm                       imx_v6_v7_defconfig
xtensa                    smp_lx200_defconfig
csky                             alldefconfig
s390                          debug_defconfig
xtensa                         virt_defconfig
arm                        mini2440_defconfig
powerpc                     pq2fads_defconfig
sh                            shmin_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          lboxre2_defconfig
m68k                        m5407c3_defconfig
m68k                          atari_defconfig
sh                      rts7751r2d1_defconfig
sh                         apsh4a3a_defconfig
arm                           h3600_defconfig
mips                          rb532_defconfig
sh                          r7780mp_defconfig
arm                             ezx_defconfig
powerpc                   motionpro_defconfig
arm                             pxa_defconfig
arm                            hisi_defconfig
powerpc                    amigaone_defconfig
ia64                        generic_defconfig
xtensa                       common_defconfig
sh                           se7206_defconfig
arm                           stm32_defconfig
powerpc                      chrp32_defconfig
mips                         cobalt_defconfig
arm                         axm55xx_defconfig
sh                         microdev_defconfig
arm                      jornada720_defconfig
arm                           h5000_defconfig
mips                  maltasmvp_eva_defconfig
ia64                            zx1_defconfig
powerpc                         ps3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
powerpc                     tqm8555_defconfig
powerpc                      cm5200_defconfig
arm                           u8500_defconfig
microblaze                          defconfig
arc                      axs103_smp_defconfig
arm                          exynos_defconfig
alpha                            alldefconfig
powerpc                    klondike_defconfig
ia64                      gensparse_defconfig
mips                     loongson1b_defconfig
openrisc                         alldefconfig
arm                  randconfig-c002-20220613
x86_64               randconfig-c001-20220613
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
riscv                             allnoconfig
x86_64               randconfig-k001-20220613
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
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
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a015-20220613
x86_64               randconfig-a014-20220613
x86_64               randconfig-a011-20220613
x86_64               randconfig-a016-20220613
x86_64               randconfig-a012-20220613
x86_64               randconfig-a013-20220613
i386                 randconfig-a012-20220613
i386                 randconfig-a011-20220613
i386                 randconfig-a013-20220613
i386                 randconfig-a014-20220613
i386                 randconfig-a016-20220613
i386                 randconfig-a015-20220613
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220613
arc                  randconfig-r043-20220613
s390                 randconfig-r044-20220613
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64               randconfig-c007-20220613
arm                  randconfig-c002-20220613
i386                 randconfig-c001-20220613
powerpc              randconfig-c003-20220613
riscv                randconfig-c006-20220613
s390                 randconfig-c005-20220613
mips                      malta_kvm_defconfig
arm                           sama7_defconfig
arm                          pxa168_defconfig
powerpc                     kilauea_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      katmai_defconfig
powerpc                    ge_imp3a_defconfig
mips                           mtx1_defconfig
x86_64                           allyesconfig
arm                         shannon_defconfig
x86_64               randconfig-a003-20220613
x86_64               randconfig-a006-20220613
x86_64               randconfig-a001-20220613
x86_64               randconfig-a005-20220613
x86_64               randconfig-a002-20220613
x86_64               randconfig-a004-20220613
i386                 randconfig-a001-20220613
i386                 randconfig-a004-20220613
i386                 randconfig-a002-20220613
i386                 randconfig-a003-20220613
i386                 randconfig-a006-20220613
i386                 randconfig-a005-20220613
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20220613
hexagon              randconfig-r045-20220613

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
