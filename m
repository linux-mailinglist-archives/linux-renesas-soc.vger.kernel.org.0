Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764C7531E69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 May 2022 00:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiEWWOH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 18:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiEWWOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 18:14:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163FA6D945
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653344046; x=1684880046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FaDPrE4YqzW0Wh+rdohdWFsF22ZDloMbwTxwF+ZTA+4=;
  b=BRs1LkAJowfNTZ2G61xkQUH3nWyLXFrPXKHMeUGpHQnSErpILjqeVhiq
   CqKsEz8PW5aB0VF+VRAx1JetEJcZb+O0b3QQTWP3YXGzzxBrFkXZ2UUnh
   qvS+XhMq7oHfGYPfwBUHndO0W2bwcxQyQHTP5FBkrb08Z87E4BW3uEx2+
   hXj/3Ux/zhZV1xkmSY/pLVDygBFHCD4C4S6irP3gvPmUCThRZFf1E4Col
   hQpwatjFIw//2FYM6OV2igFJMfLQS4ZNQ7B4ThnOxU8kce47Y7Fhu++/I
   niE4BVqrTzx9WU4lKpSTmzREXoCc7mis/n0pgQv8IzGFe7Sp4zyqjKdDU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336428080"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="336428080"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 15:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="744957444"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 May 2022 15:14:04 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ntGJP-0001TW-EH;
        Mon, 23 May 2022 22:14:03 +0000
Date:   Tue, 24 May 2022 06:13:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 a911a94b7660cea4b8bf57124a013fb3f8639b97
Message-ID: <628c0724.8zBrhRGmrRDlQPoT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: a911a94b7660cea4b8bf57124a013fb3f8639b97  arm64: dts: renesas: rzv2mevk2: Enable ethernet

elapsed time: 727m

configs tested: 167
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
arm                           stm32_defconfig
sparc                       sparc64_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
mips                     decstation_defconfig
um                               alldefconfig
sh                          r7785rp_defconfig
sh                          lboxre2_defconfig
arm                         lpc18xx_defconfig
powerpc                     rainier_defconfig
powerpc                    amigaone_defconfig
sh                            migor_defconfig
powerpc                     tqm8541_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
nios2                            alldefconfig
powerpc                     ep8248e_defconfig
sh                           sh2007_defconfig
csky                             alldefconfig
um                             i386_defconfig
mips                           jazz_defconfig
arc                        nsimosci_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                  maltasmvp_eva_defconfig
um                                  defconfig
arm                            lart_defconfig
mips                            ar7_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
powerpc                     pq2fads_defconfig
arm                          lpd270_defconfig
h8300                       h8s-sim_defconfig
powerpc                       maple_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
arm                         axm55xx_defconfig
arm                          gemini_defconfig
mips                 decstation_r4k_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allmodconfig
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
x86_64               randconfig-a003-20220523
x86_64               randconfig-a006-20220523
x86_64               randconfig-a001-20220523
x86_64               randconfig-a004-20220523
x86_64               randconfig-a002-20220523
x86_64               randconfig-a005-20220523
i386                 randconfig-a001-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a004-20220523
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220523
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220522
x86_64                        randconfig-c007
s390                 randconfig-c005-20220522
i386                          randconfig-c001
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                         hackkit_defconfig
powerpc                     mpc5200_defconfig
arm                           omap1_defconfig
s390                             alldefconfig
arm                            mmp2_defconfig
arm                         lpc32xx_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
powerpc                          g5_defconfig
mips                     loongson1c_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
powerpc                     ppa8548_defconfig
powerpc                    socrates_defconfig
arm                        neponset_defconfig
x86_64               randconfig-a011-20220523
x86_64               randconfig-a012-20220523
x86_64               randconfig-a016-20220523
x86_64               randconfig-a015-20220523
x86_64               randconfig-a013-20220523
x86_64               randconfig-a014-20220523
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a014-20220523
i386                 randconfig-a011-20220523
i386                 randconfig-a013-20220523
i386                 randconfig-a016-20220523
i386                 randconfig-a012-20220523
i386                 randconfig-a015-20220523
hexagon              randconfig-r045-20220523
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220523
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220523
riscv                randconfig-r042-20220523
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
