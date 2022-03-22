Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8704E3703
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 03:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235778AbiCVC7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 22:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235715AbiCVC7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 22:59:11 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A4532FC64
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 19:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647917865; x=1679453865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mMtXO4mfHB8vUGaPULem/f+9u0ocYfqk3ytYc7AXEIs=;
  b=FInY7p8EswZo/tqW1m4j/KZ/2NIsnR8oprmw+ULqOyZCFLeJGJKxk0Wz
   haTTPhTohBjjx2em2qPowg+sAPpBkvmi+uiWIjg8d4U9L2IL+3Khs8ODp
   p9zArIFGsSP8TEQ56m8gwU6k2Hk9Sr3pABqv6Et0F9D1Lv7QXA8c8bzjH
   75zHkCOyXx7AY0Rojh4vhFK/zD8jj+FIzyHnmseGQfNzPTj2AYy6paKaQ
   otABbjIMOw8B1f9CzMc3yYZQgTEgXGmZyNGlBRbWGt9PU1nUY0aYyKP8h
   NQLIcGRJvrZb5XRIDpe2MkHS16/KsMHlubPFFRGWQ7bThTnSiTQr7JMU0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="239866230"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="239866230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 19:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="648808172"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 19:57:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWUiM-000IO5-GP; Tue, 22 Mar 2022 02:57:42 +0000
Date:   Tue, 22 Mar 2022 10:57:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v5.19] BUILD
 SUCCESS ab990ad5f9349ec995e8b1a75f047a4404d947c5
Message-ID: <62393b04.BdWsQPTWfdRCFqcV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.19
branch HEAD: ab990ad5f9349ec995e8b1a75f047a4404d947c5  arm64: defconfig: Enable ARCH_R9A07G054

elapsed time: 725m

configs tested: 99
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220321
riscv                    nommu_k210_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_mds_defconfig
sh                      rts7751r2d1_defconfig
sh                        edosk7760_defconfig
alpha                            allyesconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
powerpc64                           defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                         microdev_defconfig
sh                              ul2_defconfig
um                                  defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
arm                  randconfig-c002-20220321
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a006-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a002-20220321
riscv                randconfig-r042-20220322
hexagon              randconfig-r045-20220322
hexagon              randconfig-r041-20220322

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
