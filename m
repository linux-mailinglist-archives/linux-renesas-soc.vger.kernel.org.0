Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6289B5273B3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 May 2022 21:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbiENTRi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 May 2022 15:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbiENTRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 May 2022 15:17:36 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F4C2E68B
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 May 2022 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652555855; x=1684091855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uI/3fnw5AVJ8IRICW/3qjR0otW4fknBqOVs6kHVXlKY=;
  b=ZzGQvcWjRuubcwIB/dSwuoxpGTqNltGtEw0zlMv3uoqUJ2fUIx7Ulif5
   qyhrghsrmrvATNFhogw/3vP+oFcpSpi8JAMY2nl9lPFCn2zi9QOBpdH2h
   /pMqim/lDLxnIO39wWJkrL15yywtNSaJQm7DEXWhlA84HbgnzvfQyfYcQ
   1fS5LKKONGTY75s+wDJmCP+B//cwPnyxhE4JiOfcWX9hyliNyRWRO7QYT
   nOnccEZEA2BKGqfyrNBLdjn6ptRau3w2Cw1J6ezGIijHPdrI4XvR6vxv7
   Wsbyahoo2WbDD36vrKjkEZGbpUsQ0U9ZZQ7tVVUc4ft/+2mpEDTMj43MO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="268133951"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="268133951"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 12:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="595775139"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 May 2022 12:17:30 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npxGb-0000xd-1u;
        Sat, 14 May 2022 19:17:29 +0000
Date:   Sun, 15 May 2022 03:17:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g011-dt-binding-defs] BUILD
 SUCCESS 96055bf71ab1629cdedff15bcbc04609cfa1f198
Message-ID: <6280002e.uHB3Mr2B/MOIwQfS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g011-dt-binding-defs
branch HEAD: 96055bf71ab1629cdedff15bcbc04609cfa1f198  dt-bindings: clock: Add r9a09g011 CPG Clock Definitions

elapsed time: 13295m

configs tested: 118
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
powerpc                     ep8248e_defconfig
nios2                            allyesconfig
powerpc                        warp_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7712_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                     nsimosci_hs_defconfig
i386                                defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      cm5200_defconfig
arm                         nhk8815_defconfig
arm                        mvebu_v7_defconfig
mips                           ip32_defconfig
powerpc                       maple_defconfig
mips                        vocore2_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
mips                         tb0226_defconfig
sh                                  defconfig
arm                         at91_dt_defconfig
sh                             sh03_defconfig
powerpc64                           defconfig
sh                               j2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220505
s390                 randconfig-r044-20220505
arc                  randconfig-r043-20220505
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
arm                          collie_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220505
hexagon              randconfig-r045-20220505

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
