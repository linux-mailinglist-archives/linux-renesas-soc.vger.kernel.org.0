Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B037D6A5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Oct 2023 13:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbjJYLsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Oct 2023 07:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbjJYLsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2023 07:48:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDED129
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Oct 2023 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698234486; x=1729770486;
  h=date:from:to:cc:subject:message-id;
  bh=yI6ftJUUMKoB5y9zVrAcB2+aTUVANAFBRlvPDk8EEng=;
  b=NuaDm0fnVxU/vKdOOQ2tXi8b/yQNSH6ISDmlcvO7JeG54/7/NN6f4etJ
   9CKokwI7Q0ISjrFURc2c9z9+B7tmU8FizY3fBj675lW94y9coZAq6iOpV
   5rN4lX1IHgZPUIOov2n4kmujszDH2SvnuMNjzY1SGo+6pJeQGHLa8GNim
   60TgcpbQy1bC1VlJ5Ejm6jfnGw/4FUGTprR+kYu8YKViRwU3w0JF2hFQi
   ILEpPC/Yy/x7bLunpY1kquM/8yDhVej8gXMBJmzaUUJehNr+BfdWvy9dv
   9yUKLJRhUNFCCP6Dk3su8mk72aMDrkzRI/AQfTv3u6Fuls0k0XyMCxvEu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473524498"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="473524498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 04:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708662762"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="708662762"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Oct 2023 04:48:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qvcMk-0008rE-2A;
        Wed, 25 Oct 2023 11:48:02 +0000
Date:   Wed, 25 Oct 2023 19:47:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 810ad90f451c3b5c359bdd01e1b029ee3e23a532
Message-ID: <202310251917.3ElJyPM4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 810ad90f451c3b5c359bdd01e1b029ee3e23a532  Merge branch 'renesas-dts-for-v6.8' into renesas-devel

elapsed time: 3090m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231023   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231024   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231024   gcc  
i386         buildonly-randconfig-002-20231024   gcc  
i386         buildonly-randconfig-003-20231024   gcc  
i386         buildonly-randconfig-004-20231024   gcc  
i386         buildonly-randconfig-005-20231024   gcc  
i386         buildonly-randconfig-006-20231024   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231024   gcc  
i386                  randconfig-002-20231024   gcc  
i386                  randconfig-003-20231024   gcc  
i386                  randconfig-004-20231024   gcc  
i386                  randconfig-005-20231024   gcc  
i386                  randconfig-006-20231024   gcc  
i386                  randconfig-011-20231024   gcc  
i386                  randconfig-012-20231024   gcc  
i386                  randconfig-013-20231024   gcc  
i386                  randconfig-014-20231024   gcc  
i386                  randconfig-015-20231024   gcc  
i386                  randconfig-016-20231024   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231023   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231023   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231023   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231024   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231023   gcc  
x86_64       buildonly-randconfig-002-20231023   gcc  
x86_64       buildonly-randconfig-003-20231023   gcc  
x86_64       buildonly-randconfig-004-20231023   gcc  
x86_64       buildonly-randconfig-005-20231023   gcc  
x86_64       buildonly-randconfig-006-20231023   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231024   gcc  
x86_64                randconfig-002-20231024   gcc  
x86_64                randconfig-003-20231024   gcc  
x86_64                randconfig-004-20231024   gcc  
x86_64                randconfig-005-20231024   gcc  
x86_64                randconfig-006-20231024   gcc  
x86_64                randconfig-011-20231024   gcc  
x86_64                randconfig-012-20231024   gcc  
x86_64                randconfig-013-20231024   gcc  
x86_64                randconfig-014-20231024   gcc  
x86_64                randconfig-015-20231024   gcc  
x86_64                randconfig-016-20231024   gcc  
x86_64                randconfig-071-20231024   gcc  
x86_64                randconfig-072-20231024   gcc  
x86_64                randconfig-073-20231024   gcc  
x86_64                randconfig-074-20231024   gcc  
x86_64                randconfig-075-20231024   gcc  
x86_64                randconfig-076-20231024   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
