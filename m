Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF926AF9FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 00:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCGXCG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 18:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjCGXBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 18:01:49 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3816B3E21
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 14:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678229967; x=1709765967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mKn1ohMC5q/vT2aRdvE/FgfKKcyL4mecUOzpuSzk7PQ=;
  b=ndjSUv9HKnKD/9FOU25vWfKCdZgS8GoI7n7nxyblwqV/8zEBroK7Shtp
   Gskokvausi5sDMH+wxyckU8+kXIJyCe6eidzGZ6Igl2pMNXRyIl2QRRda
   CrTpKe8ibeC4+ANXF04lXHQd++E3+MBzJWx6kHDhQ0b4YS5xnxrjy+tOb
   BojVcNSFA+Obv4qBvVYskgDFa4G0LSMyTr6Q4dVLRqyCc3elaXsWflap/
   iKhz17loU75na8nOIbYoM/3cx3OL+7x6Kz9tfh/4sgwMtMPd7e3ZXDPlU
   k+vU8B8biF41Dw+YWo8KxxnXpFnq1zhab2kzELriuVFjRrFItjK2HqEs8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="316396497"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="316396497"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 14:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922550794"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="922550794"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Mar 2023 14:59:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZgHF-0001fl-1U;
        Tue, 07 Mar 2023 22:59:25 +0000
Date:   Wed, 08 Mar 2023 06:59:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 525eb92e46b94fe4a641aa2f6cc0481874cff436
Message-ID: <6407c1ba.kmFlRJJrrwvM9RKE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 525eb92e46b94fe4a641aa2f6cc0481874cff436  Merge commit '8ca09d5fa3549d142c2080a72a4c70ce389163cd' into renesas-devel

elapsed time: 836m

configs tested: 136
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230306   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        neponset_defconfig   clang
arm                  randconfig-r006-20230305   gcc  
arm                  randconfig-r013-20230306   gcc  
arm                  randconfig-r021-20230306   gcc  
arm                  randconfig-r036-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230305   gcc  
arm64                randconfig-r015-20230306   clang
arm64                randconfig-r024-20230305   gcc  
csky                                defconfig   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r022-20230306   clang
hexagon              randconfig-r023-20230306   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                 randconfig-r032-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r015-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230305   gcc  
loongarch            randconfig-r016-20230305   gcc  
loongarch            randconfig-r021-20230305   gcc  
loongarch            randconfig-r032-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230305   gcc  
m68k         buildonly-randconfig-r005-20230305   gcc  
m68k         buildonly-randconfig-r006-20230305   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230306   gcc  
m68k                 randconfig-r004-20230306   gcc  
m68k                 randconfig-r034-20230305   gcc  
microblaze   buildonly-randconfig-r005-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230305   gcc  
nios2                randconfig-r033-20230305   gcc  
openrisc             randconfig-r005-20230305   gcc  
parisc       buildonly-randconfig-r003-20230306   gcc  
parisc       buildonly-randconfig-r004-20230305   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r003-20230305   clang
powerpc              randconfig-r023-20230305   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230306   clang
riscv                randconfig-r024-20230306   clang
riscv                randconfig-r025-20230306   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230306   gcc  
s390                 randconfig-r036-20230305   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r026-20230305   gcc  
sh                   randconfig-r031-20230306   gcc  
sh                           se7712_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230306   gcc  
sparc        buildonly-randconfig-r004-20230306   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230306   gcc  
sparc64      buildonly-randconfig-r001-20230305   gcc  
sparc64              randconfig-r022-20230305   gcc  
sparc64              randconfig-r035-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230306   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230306   gcc  
xtensa               randconfig-r002-20230306   gcc  
xtensa               randconfig-r006-20230306   gcc  
xtensa               randconfig-r012-20230305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
