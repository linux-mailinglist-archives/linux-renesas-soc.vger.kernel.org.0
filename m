Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCB354A21F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 00:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239798AbiFMWcG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jun 2022 18:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239749AbiFMWcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 18:32:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E032DD58
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2022 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655159525; x=1686695525;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F4q/UHGPwc2TYgBiirArIzT6rY9V4fQjZVR9qS4C+xQ=;
  b=LYAaQ4nysZ2SENcxXgMDXqJB4sQP66XxUbLHhwpsSuivW7KGRAVVTkSx
   xVdv5u1JqZx/eaaXFhANF/jPYf+zd2rnYhpN04kjySoM67ds3Hj6aCNz4
   YPShjx41BU2czVLS+cinmU0X4cGGFYMVTzGiq6pVv5CbxnVB8u1y4PnAm
   768JYxYlWtlyh/wR/ivY7GcHVfHNneYhVtlBBLisGN7AMyD8melfpG6MW
   uKMBLD5u6ackY328i7np+gdE+yngP5CqWrM0V0W2rKKKuKtrmhSmWR5MC
   jCW0lUik3uDu0yo+cUA1wHhBktsI+zOqqBP2nvIo2irWdw4Oi+BRJS35c
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279151705"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="279151705"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 15:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="673536509"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2022 15:32:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o0sbK-000LDB-S1;
        Mon, 13 Jun 2022 22:32:02 +0000
Date:   Tue, 14 Jun 2022 06:31:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v5.20] BUILD
 SUCCESS 7e1ab5a8a3b51c9d819246987a4710a759c3cc67
Message-ID: <62a7bad2.jD5+J5cQ3XuAkzlz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.20
branch HEAD: 7e1ab5a8a3b51c9d819246987a4710a759c3cc67  arm64: defconfig: Enable R8A779G0 SoC

elapsed time: 722m

configs tested: 98
configs skipped: 102

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220613
arm                        trizeps4_defconfig
arm                       aspeed_g5_defconfig
arm                            mps2_defconfig
sh                        edosk7705_defconfig
sh                         apsh4a3a_defconfig
arm                           h3600_defconfig
powerpc                     mpc83xx_defconfig
mips                          rb532_defconfig
powerpc                         ps3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8555_defconfig
powerpc                      cm5200_defconfig
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
riscv                randconfig-r042-20220613
arc                  randconfig-r043-20220613
s390                 randconfig-r044-20220613
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
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                        mvebu_v5_defconfig
arm                         lpc32xx_defconfig
mips                           mtx1_defconfig
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
