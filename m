Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA7C545BAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 07:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243950AbiFJFaQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 01:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243795AbiFJFaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 01:30:15 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CD6114A80
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 22:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654839014; x=1686375014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X+nFtqH+PSLqMYBeotX/AmU/hRVz/Rve7cuzw0JBJTE=;
  b=jiAzxl0CCI8eKZZ0qF7WjwGAw32xOFs8oGSF+oZ1Nk2X0qycKiaQLzSm
   DXm28nOCwWQyfmIZMjUaueP+JYCHTcJlurcxjtAjfdvDgv7NtbFKPJZ7o
   U+0r31yDkgVQU1YGp+1bnt6TXZ+86mH/stc/TvuV/TUWScuhFLzyo/e9Z
   o6biSqS7kRCDYArGj03mmRxbQwU1AWE/16wPQGZztqrcMgkn1VMmp7pvG
   yiGGyy2cXe+zKFvKh5+/RCdTZYKFUCbhGi3uczUlQMWyy4K0HwE2aTUe2
   N+Kkmp3+tjcru8ANu1UYvnOz3DJVNVk1c8Zv6VKX8vMC/85R8X7hnqufU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="275046112"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="275046112"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 22:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="649639864"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2022 22:30:02 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzXDd-000GjF-AB;
        Fri, 10 Jun 2022 05:30:01 +0000
Date:   Fri, 10 Jun 2022 13:29:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 4d4136360b30e8e454df0f7a2166303438081616
Message-ID: <62a2d6a7.FMI5LLpYvPnWLoV7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4d4136360b30e8e454df0f7a2166303438081616  Merge branch 'renesas-next' into renesas-devel

elapsed time: 4086m

configs tested: 126
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
powerpc                     asp8347_defconfig
mips                        vocore2_defconfig
powerpc                      pcm030_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            mps2_defconfig
arc                            hsdk_defconfig
mips                  decstation_64_defconfig
sh                        sh7757lcr_defconfig
sh                               alldefconfig
powerpc                     sequoia_defconfig
powerpc                       maple_defconfig
m68k                           virt_defconfig
mips                            gpr_defconfig
openrisc                  or1klitex_defconfig
sh                          landisk_defconfig
sparc                       sparc64_defconfig
m68k                          atari_defconfig
mips                           ip32_defconfig
arm                         nhk8815_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ep88xc_defconfig
powerpc64                        alldefconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
mips                 decstation_r4k_defconfig
mips                            ar7_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                       capcella_defconfig
sh                         microdev_defconfig
powerpc                 mpc837x_mds_defconfig
arm                          simpad_defconfig
arm                         vf610m4_defconfig
arm                            xcep_defconfig
arm                        cerfcube_defconfig
sh                            shmin_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
arc                              allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a006
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
arm                        neponset_defconfig
arm                   milbeaut_m10v_defconfig
arm                     davinci_all_defconfig
powerpc                      obs600_defconfig
hexagon                          alldefconfig
powerpc                     pseries_defconfig
powerpc                     mpc5200_defconfig
mips                       rbtx49xx_defconfig
powerpc                     tqm8560_defconfig
powerpc                     mpc512x_defconfig
mips                         tb0219_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a004
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
