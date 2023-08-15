Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C5977C5DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 04:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbjHOC2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 22:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbjHOC1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 22:27:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209F810D0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 19:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692066462; x=1723602462;
  h=date:from:to:cc:subject:message-id;
  bh=FO6fqsfEys04x9JvyJNhybCnEcNwLDEOeTzqukBiClc=;
  b=H5QHbuMmbW/EQYFIfYJnfmYLT2K1pAyTB5za8cHU6cKWbLnEt0D32b68
   lBcoQZNFXlbi9NZGi344rYxB41M6dvggsN9cSuGWn9X5QDuceHGba4cU7
   IPQ5ONVbLXMAtqIR9Rl3PDzQB9AZYELE0AwUMxoh0DISUAqqSZXx+aa4C
   B0l4Q+RRttvSa52G9mhyXgf/uLIbFAYlxcxWNIlK0KFN1tUjIX16uRioB
   mXjim/A0xJpA8F9g/d1MLHqOnW2n4oaJnIavh+C7limKYAiizBnGB8AoD
   hh3er9x1UbK7vxc8kjO/ndiGg0ViX1aQc4I5zS5Ycx1AagFlg9ln5RDD/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="375916679"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="375916679"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 19:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710565844"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="710565844"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 19:27:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVjmV-0000ap-1m;
        Tue, 15 Aug 2023 02:27:39 +0000
Date:   Tue, 15 Aug 2023 10:27:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0eea67c2ea6d54fe356bf10e22a555c613bbb10a
Message-ID: <202308151015.z803ayUk-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
branch HEAD: 0eea67c2ea6d54fe356bf10e22a555c613bbb10a  Merge tag 'v6.5-rc6' into renesas-devel

elapsed time: 722m

configs tested: 195
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230814   gcc  
alpha                randconfig-r013-20230815   gcc  
alpha                randconfig-r021-20230814   gcc  
alpha                randconfig-r022-20230815   gcc  
alpha                randconfig-r031-20230814   gcc  
alpha                randconfig-r033-20230815   gcc  
alpha                randconfig-r034-20230815   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230815   gcc  
arc                  randconfig-r003-20230815   gcc  
arc                  randconfig-r023-20230815   gcc  
arc                  randconfig-r024-20230815   gcc  
arc                  randconfig-r043-20230814   gcc  
arc                  randconfig-r043-20230815   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230815   gcc  
arm                  randconfig-r046-20230814   gcc  
arm                  randconfig-r046-20230815   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230814   gcc  
arm64                randconfig-r021-20230815   gcc  
arm64                randconfig-r025-20230815   gcc  
arm64                randconfig-r026-20230815   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230814   gcc  
csky                 randconfig-r005-20230814   gcc  
csky                 randconfig-r013-20230815   gcc  
csky                 randconfig-r031-20230815   gcc  
hexagon              randconfig-r041-20230814   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230814   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230814   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230814   gcc  
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230814   gcc  
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230814   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230814   gcc  
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230814   gcc  
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230814   gcc  
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230814   gcc  
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230814   gcc  
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230814   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230814   clang
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230814   clang
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230814   clang
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230814   clang
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230814   clang
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r004-20230815   clang
i386                 randconfig-r005-20230814   gcc  
i386                 randconfig-r005-20230815   clang
i386                 randconfig-r016-20230815   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r035-20230814   gcc  
loongarch            randconfig-r035-20230815   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230814   gcc  
m68k                 randconfig-r021-20230815   gcc  
m68k                 randconfig-r024-20230815   gcc  
m68k                 randconfig-r025-20230815   gcc  
m68k                 randconfig-r032-20230814   gcc  
microblaze           randconfig-r011-20230815   gcc  
microblaze           randconfig-r012-20230815   gcc  
microblaze           randconfig-r013-20230814   gcc  
microblaze           randconfig-r022-20230815   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230815   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230814   gcc  
nios2                randconfig-r005-20230815   gcc  
nios2                randconfig-r023-20230814   gcc  
openrisc             randconfig-r001-20230815   gcc  
openrisc             randconfig-r006-20230815   gcc  
openrisc             randconfig-r025-20230814   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230815   gcc  
parisc               randconfig-r032-20230815   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230814   gcc  
powerpc              randconfig-r022-20230814   clang
powerpc              randconfig-r023-20230815   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230815   clang
riscv                randconfig-r011-20230814   clang
riscv                randconfig-r024-20230814   clang
riscv                randconfig-r042-20230814   clang
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230815   gcc  
s390                 randconfig-r044-20230814   clang
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230814   gcc  
sh                   randconfig-r026-20230814   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230814   gcc  
sparc                randconfig-r014-20230814   gcc  
sparc                randconfig-r021-20230815   gcc  
sparc                randconfig-r023-20230815   gcc  
sparc                randconfig-r024-20230815   gcc  
sparc                randconfig-r031-20230815   gcc  
sparc64              randconfig-r004-20230815   gcc  
sparc64              randconfig-r015-20230814   gcc  
sparc64              randconfig-r034-20230814   gcc  
sparc64              randconfig-r036-20230814   gcc  
sparc64              randconfig-r036-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230815   gcc  
um                   randconfig-r005-20230815   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230814   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230814   gcc  
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230814   gcc  
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230815   clang
x86_64               randconfig-r015-20230815   gcc  
x86_64               randconfig-r021-20230815   gcc  
x86_64               randconfig-r025-20230815   gcc  
x86_64               randconfig-x001-20230814   clang
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230814   clang
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230814   clang
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230814   clang
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230814   clang
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230814   clang
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230814   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230814   gcc  
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230814   gcc  
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230814   gcc  
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230814   gcc  
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230814   gcc  
x86_64               randconfig-x016-20230815   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230815   gcc  
xtensa               randconfig-r022-20230815   gcc  
xtensa               randconfig-r026-20230815   gcc  
xtensa               randconfig-r033-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
