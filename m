Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DC76AFCB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 03:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjCHCIl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 21:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCHCIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 21:08:39 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA80B9CFD1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 18:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678241317; x=1709777317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dvfmlDkUSuH7JBz5gbWJJ4I9yavY6NvHNEn13/YRbFM=;
  b=gYkalUMp+v1Fi6Pq0A/r1UrbD+vZjKpdGSWZ+oOWdo8gSzWfJ6b8kU+N
   yBT6Mi0ijMhHy+oxuoM53Mp7Z0iyeM4AdiS0KDVzp0UxGEXyw+qufSXNr
   4QEjY6AQDNzfEJaWL85GMJ42DLWSL7IfhxrhKxXVRNK1iKA8nE94O5T5U
   zviwRQcyRZJkyr6XwjQ6mvR/frKcRVoxFB56b/BKw5j88Xqrh7koSPAn/
   axZJZiOwlN4wjY/guWJqCKqmmQ+oUPvMv2wsQ4WHC45vAi0Fuw4k0sztw
   GTLEs0BvExIPdWzCUIm5O8BZ2RIGy2wxUysO+doQrikA79qxUqEbD2yTZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398610560"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398610560"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 18:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654177188"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="654177188"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 18:08:32 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZjEF-0001n8-2i;
        Wed, 08 Mar 2023 02:08:31 +0000
Date:   Wed, 08 Mar 2023 10:07:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.4] BUILD SUCCESS
 b37d57e1daccbc1a0393d9207d5c48f9181fe85a
Message-ID: <6407edfe.TOdWPfCgWwGx/R4q%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.4
branch HEAD: b37d57e1daccbc1a0393d9207d5c48f9181fe85a  pinctrl: renesas: r8a779g0: Add Audio SSI pins, groups, and functions

elapsed time: 726m

configs tested: 185
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230305   gcc  
alpha                randconfig-r011-20230305   gcc  
alpha                randconfig-r015-20230306   gcc  
alpha                randconfig-r016-20230305   gcc  
alpha                randconfig-r025-20230306   gcc  
alpha                randconfig-r034-20230306   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230305   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230305   gcc  
arc                  randconfig-r022-20230306   gcc  
arc                  randconfig-r031-20230305   gcc  
arc                  randconfig-r035-20230305   gcc  
arc                  randconfig-r035-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230305   gcc  
arm                  randconfig-r023-20230305   clang
arm                  randconfig-r031-20230306   clang
arm                  randconfig-r033-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230306   gcc  
arm64        buildonly-randconfig-r003-20230306   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230306   gcc  
arm64                randconfig-r006-20230306   gcc  
arm64                randconfig-r013-20230306   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230305   gcc  
csky                 randconfig-r001-20230306   gcc  
csky                 randconfig-r021-20230305   gcc  
csky                 randconfig-r024-20230305   gcc  
csky                 randconfig-r033-20230305   gcc  
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230306   gcc  
i386         buildonly-randconfig-r006-20230306   gcc  
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
i386                 randconfig-r004-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230306   gcc  
ia64         buildonly-randconfig-r002-20230305   gcc  
ia64         buildonly-randconfig-r003-20230306   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230305   gcc  
ia64                 randconfig-r023-20230306   gcc  
ia64                 randconfig-r033-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230306   gcc  
loongarch            randconfig-r014-20230305   gcc  
loongarch            randconfig-r016-20230306   gcc  
loongarch            randconfig-r021-20230306   gcc  
loongarch            randconfig-r022-20230306   gcc  
loongarch            randconfig-r036-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230305   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230306   gcc  
m68k                 randconfig-r035-20230305   gcc  
microblaze           randconfig-r006-20230305   gcc  
microblaze           randconfig-r016-20230306   gcc  
microblaze           randconfig-r024-20230306   gcc  
microblaze           randconfig-r025-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230305   gcc  
mips                 randconfig-r025-20230305   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230305   gcc  
nios2                randconfig-r003-20230306   gcc  
nios2                randconfig-r004-20230305   gcc  
nios2                randconfig-r031-20230305   gcc  
nios2                randconfig-r036-20230306   gcc  
openrisc     buildonly-randconfig-r002-20230306   gcc  
openrisc     buildonly-randconfig-r005-20230306   gcc  
openrisc             randconfig-r011-20230305   gcc  
openrisc             randconfig-r012-20230305   gcc  
openrisc             randconfig-r015-20230305   gcc  
openrisc             randconfig-r024-20230306   gcc  
parisc       buildonly-randconfig-r002-20230305   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230306   gcc  
parisc               randconfig-r014-20230306   gcc  
parisc               randconfig-r021-20230306   gcc  
parisc               randconfig-r032-20230305   gcc  
parisc               randconfig-r032-20230306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r035-20230306   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230305   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230306   clang
riscv                randconfig-r013-20230305   gcc  
riscv                randconfig-r032-20230305   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230305   gcc  
s390         buildonly-randconfig-r005-20230306   clang
s390         buildonly-randconfig-r006-20230305   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230306   gcc  
s390                 randconfig-r023-20230305   gcc  
s390                 randconfig-r031-20230306   gcc  
s390                 randconfig-r032-20230306   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230305   gcc  
sh                   randconfig-r003-20230305   gcc  
sh                   randconfig-r005-20230305   gcc  
sh                   randconfig-r022-20230305   gcc  
sh                   randconfig-r026-20230305   gcc  
sh                   randconfig-r026-20230306   gcc  
sh                   randconfig-r034-20230306   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230305   gcc  
sparc                randconfig-r003-20230306   gcc  
sparc                randconfig-r006-20230305   gcc  
sparc                randconfig-r011-20230306   gcc  
sparc                randconfig-r014-20230306   gcc  
sparc                randconfig-r021-20230305   gcc  
sparc                randconfig-r026-20230305   gcc  
sparc                randconfig-r034-20230305   gcc  
sparc                randconfig-r036-20230305   gcc  
sparc64      buildonly-randconfig-r003-20230305   gcc  
sparc64              randconfig-r012-20230306   gcc  
sparc64              randconfig-r025-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230306   gcc  
x86_64       buildonly-randconfig-r006-20230306   gcc  
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
xtensa               randconfig-r002-20230305   gcc  
xtensa               randconfig-r006-20230306   gcc  
xtensa               randconfig-r014-20230305   gcc  
xtensa               randconfig-r015-20230305   gcc  
xtensa               randconfig-r023-20230306   gcc  
xtensa               randconfig-r034-20230305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
