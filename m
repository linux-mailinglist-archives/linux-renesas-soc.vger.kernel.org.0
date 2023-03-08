Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05EC06AFE31
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 06:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCHFSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 00:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjCHFSn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 00:18:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC06C98842
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 21:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678252718; x=1709788718;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L3wQvga4t1o8/b/eWiQ9Sp14QsuxtqowcfhcZkhSQhI=;
  b=mXGPdt1oZ6rmlkaxsbNua9wRgKmkhhLM5N00A8d3VD1EI5t6/kuQeitn
   n+8N3FaPsGMfdRUWdetpGnbyWZTJRfHsFMA/RwMYXqzmOyOtba+NbmHOa
   HCtgTwq3+G9krgQ0Fx6B6jtfNB2EAEdnZuyDnaF7lkOPvg4yYpRDZlfOf
   cYMpcwxV76nUmOjbU70q9DIpwCvCP2xAtXLwTbWZO5FPI0FFezzetz7w1
   7+oP9TFLVDLSBrVCmrUOejzLGbprXhOXYxu2GSPxhQcMO921N7e5QiPKN
   0BPxpp3ct4ka80b2nVzZnfKb7vQZYkLSEe+1susoSE76xK9s6VMwbvDX2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324376829"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="324376829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 21:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765889556"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="765889556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2023 21:18:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZmCC-0001u8-0T;
        Wed, 08 Mar 2023 05:18:36 +0000
Date:   Wed, 08 Mar 2023 13:18:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e39111f42503aee4d2be3cfc31b068aa9529681a
Message-ID: <64081aaa.idIhnyhdox0OqqTE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e39111f42503aee4d2be3cfc31b068aa9529681a  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 918m

configs tested: 134
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230306   gcc  
alpha                randconfig-r015-20230306   gcc  
alpha                randconfig-r032-20230305   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230305   gcc  
arc                  randconfig-r012-20230306   gcc  
arc                  randconfig-r034-20230305   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230305   gcc  
arm                  randconfig-r021-20230306   gcc  
arm                  randconfig-r036-20230305   gcc  
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230305   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230305   gcc  
csky                 randconfig-r004-20230306   gcc  
csky                 randconfig-r011-20230305   gcc  
csky                 randconfig-r016-20230305   gcc  
csky                 randconfig-r035-20230305   gcc  
csky                 randconfig-r036-20230306   gcc  
hexagon              randconfig-r004-20230305   clang
hexagon              randconfig-r006-20230306   clang
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
i386                 randconfig-r001-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r033-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230306   gcc  
loongarch            randconfig-r021-20230305   gcc  
loongarch            randconfig-r031-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230305   gcc  
m68k         buildonly-randconfig-r005-20230305   gcc  
m68k         buildonly-randconfig-r006-20230305   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230306   gcc  
microblaze   buildonly-randconfig-r005-20230306   gcc  
microblaze           randconfig-r026-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230305   clang
nios2                               defconfig   gcc  
parisc       buildonly-randconfig-r003-20230306   gcc  
parisc       buildonly-randconfig-r004-20230305   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230305   gcc  
parisc               randconfig-r011-20230306   gcc  
parisc               randconfig-r022-20230306   gcc  
parisc               randconfig-r024-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230305   gcc  
powerpc              randconfig-r025-20230306   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230305   gcc  
riscv                randconfig-r013-20230305   gcc  
riscv                randconfig-r013-20230306   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230306   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r001-20230306   gcc  
sparc        buildonly-randconfig-r004-20230306   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230305   gcc  
sparc                randconfig-r005-20230306   gcc  
sparc64      buildonly-randconfig-r001-20230305   gcc  
sparc64              randconfig-r023-20230306   gcc  
sparc64              randconfig-r025-20230305   gcc  
sparc64              randconfig-r034-20230306   gcc  
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
x86_64               randconfig-r024-20230306   clang
x86_64               randconfig-r026-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230306   gcc  
xtensa               randconfig-r003-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
