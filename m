Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84116B58D3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 07:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCKGCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 01:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCKGCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 01:02:47 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC73312B67A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 22:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514565; x=1710050565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OMOtCm0eqOhMwWhHeJT9But3xHcbt7DZrcWboiuAKQg=;
  b=KLnaNDvT1aSwzYPsn8/6i/RS1bdp6mqPa9DuNUbJfxmEifBLNQSgt5Xa
   cZQq3MSvN8C16kHpy+L4TU5JMhWLEWOVivu2lRoIW/5Y2t2Cnp2Ukg934
   +ZMonajk/SGoSacS5oqKk4vujfo5WcsGc8qSMqJENLCZWiTXXa9dIFD2Z
   HQChhe4FPdabYaieDk5IARiInzynMqLX3Mqwf0jB+b8yyCbMpuV9hlyZR
   DPV1i83Km1LMMVkPYv4qbMCYdcD0Z5hLGkzy8ET8ZEdv4dasnHPS2BNYc
   TFZqzenoe2j6F/4QOeVcUL9YPXNxT0o8U1P/QGafbkdgxZywi5tTHiTON
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437527"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437527"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923935501"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="923935501"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 22:02:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasJV-0004NN-2Y;
        Sat, 11 Mar 2023 06:02:41 +0000
Date:   Sat, 11 Mar 2023 14:02:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.4] BUILD SUCCESS
 b39d242dbfd925d9f6b262bf216518e28445570d
Message-ID: <640c1959.CDhxweIbkiYwqeRu%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.4
branch HEAD: b39d242dbfd925d9f6b262bf216518e28445570d  soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper

elapsed time: 721m

configs tested: 102
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230310   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r024-20230310   clang
hexagon              randconfig-r041-20230310   clang
hexagon              randconfig-r045-20230310   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230310   gcc  
ia64                 randconfig-r022-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230310   gcc  
microblaze           randconfig-r006-20230310   gcc  
microblaze           randconfig-r011-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230310   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230310   gcc  
nios2                randconfig-r015-20230310   gcc  
nios2                randconfig-r021-20230310   gcc  
openrisc             randconfig-r003-20230310   gcc  
openrisc             randconfig-r036-20230310   gcc  
parisc       buildonly-randconfig-r001-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230310   gcc  
parisc               randconfig-r023-20230310   gcc  
parisc               randconfig-r035-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230310   gcc  
powerpc              randconfig-r013-20230310   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r026-20230310   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r032-20230310   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230310   gcc  
sparc64      buildonly-randconfig-r002-20230310   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230310   gcc  
xtensa               randconfig-r031-20230310   gcc  
xtensa               randconfig-r034-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
