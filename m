Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D4B51CEA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 04:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343679AbiEFBZ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 21:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236485AbiEFBZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 21:25:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5640B12776
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 18:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651800135; x=1683336135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jybm4fTLRWI0jVoLjK7CbZTcJpOxte1q+g1Rh40KJ24=;
  b=mzhpS+6b2fGlmuomYIr4iS53wZjMdMYBksAlDW2B5uljtdZX5qw76Co6
   /O90tTR7oaY2w+mfNL34/LCWLGnwIneeg8Uxiv7Vn5vSieQcPc7bHY0fW
   5j91wKEL5suR2k6yq/5t7Gxy0np9VISYePboL/LCkrS7qqMfhgzsoY3Hp
   ixQjixU50Dezlrk+ov9XV6Z/JgBqmj+w1AkloHQ9PdFmazmZFTlsKuQXs
   AcoJkiN4XwA+MWeepFY3rseGTmyEDIUGYfXAvxZvEc3Xmb/QY4FXiql9x
   F6e/OobUoMoRm3Yu/fVL+tUgMaCy0owzc03GhS1SoBz7v1sCSmla2nbzF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248846262"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="248846262"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 18:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="694945486"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2022 18:22:13 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmmfc-000Cw4-Tu;
        Fri, 06 May 2022 01:22:12 +0000
Date:   Fri, 06 May 2022 09:22:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v5.19] BUILD SUCCESS
 7bc53f59fbcad34599c99d07d6be1ff01849d457
Message-ID: <6274783b.AiSmQ9xEmmUQ6YrN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v5.19
branch HEAD: 7bc53f59fbcad34599c99d07d6be1ff01849d457  ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel

elapsed time: 865m

configs tested: 100
configs skipped: 106

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                     ep8248e_defconfig
nios2                            allyesconfig
arm                         lpc18xx_defconfig
parisc64                            defconfig
powerpc                    klondike_defconfig
i386                                defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      cm5200_defconfig
arm                         nhk8815_defconfig
sh                          rsk7269_defconfig
xtensa                    xip_kc705_defconfig
sh                                  defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         at91_dt_defconfig
sh                             sh03_defconfig
powerpc64                           defconfig
sh                               j2_defconfig
arm                  randconfig-c002-20220505
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220505
s390                 randconfig-r044-20220505
riscv                randconfig-r042-20220505
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
powerpc                          g5_defconfig
arm                          ep93xx_defconfig
mips                      maltaaprp_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
