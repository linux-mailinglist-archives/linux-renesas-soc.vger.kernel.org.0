Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5966278E5F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 07:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjHaFvN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 01:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbjHaFvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 01:51:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B3BCE0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461067; x=1724997067;
  h=date:from:to:cc:subject:message-id;
  bh=nrOjfNYaoWP9sVapU0rcrMijXMvVUslLsh8wRfHoNoQ=;
  b=eFj4GemV6NdezS03DY933L3xrjnzegvX6e0tThuoBdpoJ/TuVxS7Y8n5
   yhlof7GMGWJ5g3nryCCctjfh3e3FZrKo753U0lZplP5RQO9dQPiljCWSg
   nPbGLR6jS/DZ64Y1df3ccdBGfC4a+yZTIZr9shhn4w24HZkgQWnc1lOb2
   PcZob94VunirM2pH34rM2RSW5g2M6rNr+Ldy+CQ6VJVpUDipmlUH25aFr
   esy5ilZd7aC2UBI9xA9UmdHd8qpH81k1BZ+pAlxXHcFe/g/yX0iySvV0G
   FekUoIEHOR2v85KYIPsyfJiJH1yv0q4s3Lg9s99uSTL8JGe47zzehVUEk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360809421"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="360809421"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774363522"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774363522"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 22:51:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbaa9-000Amf-24;
        Thu, 31 Aug 2023 05:51:05 +0000
Date:   Thu, 31 Aug 2023 13:50:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/shmob-drm-dt-v3] BUILD SUCCESS
 9f1a3f8aed9b2f07b6204ee8c9bcfb3a82fc5364
Message-ID: <202308311335.zrpqpj7G-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/shmob-drm-dt-v3
branch HEAD: 9f1a3f8aed9b2f07b6204ee8c9bcfb3a82fc5364  ARM: dts: renesas: armadillo800eva: Add LCD panel

elapsed time: 2503m

configs tested: 161
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
arc                   randconfig-001-20230829   gcc  
arc                  randconfig-r003-20230829   gcc  
arc                  randconfig-r014-20230829   gcc  
arc                  randconfig-r016-20230829   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230829   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230829   gcc  
csky                 randconfig-r024-20230829   gcc  
hexagon               randconfig-001-20230829   clang
hexagon               randconfig-002-20230829   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230829   clang
i386         buildonly-randconfig-002-20230829   clang
i386         buildonly-randconfig-003-20230829   clang
i386         buildonly-randconfig-004-20230829   clang
i386         buildonly-randconfig-005-20230829   clang
i386         buildonly-randconfig-006-20230829   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230829   clang
i386                  randconfig-002-20230829   clang
i386                  randconfig-003-20230829   clang
i386                  randconfig-004-20230829   clang
i386                  randconfig-005-20230829   clang
i386                  randconfig-006-20230829   clang
i386                  randconfig-011-20230829   gcc  
i386                  randconfig-012-20230829   gcc  
i386                  randconfig-013-20230829   gcc  
i386                  randconfig-014-20230829   gcc  
i386                  randconfig-015-20230829   gcc  
i386                  randconfig-016-20230829   gcc  
i386                 randconfig-r011-20230829   gcc  
i386                 randconfig-r035-20230829   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230829   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230829   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r005-20230829   gcc  
microblaze           randconfig-r013-20230829   gcc  
microblaze           randconfig-r015-20230829   gcc  
microblaze           randconfig-r023-20230829   gcc  
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
openrisc             randconfig-r025-20230829   gcc  
openrisc             randconfig-r026-20230829   gcc  
openrisc             randconfig-r034-20230829   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r012-20230829   gcc  
powerpc64            randconfig-r036-20230829   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230829   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230829   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r032-20230829   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230829   gcc  
sparc                randconfig-r031-20230829   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230829   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230829   clang
x86_64       buildonly-randconfig-002-20230829   clang
x86_64       buildonly-randconfig-003-20230829   clang
x86_64       buildonly-randconfig-004-20230829   clang
x86_64       buildonly-randconfig-005-20230829   clang
x86_64       buildonly-randconfig-006-20230829   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230829   gcc  
x86_64                randconfig-002-20230829   gcc  
x86_64                randconfig-003-20230829   gcc  
x86_64                randconfig-004-20230829   gcc  
x86_64                randconfig-005-20230829   gcc  
x86_64                randconfig-006-20230829   gcc  
x86_64                randconfig-011-20230829   clang
x86_64                randconfig-012-20230829   clang
x86_64                randconfig-013-20230829   clang
x86_64                randconfig-014-20230829   clang
x86_64                randconfig-015-20230829   clang
x86_64                randconfig-016-20230829   clang
x86_64                randconfig-071-20230829   clang
x86_64                randconfig-072-20230829   clang
x86_64                randconfig-073-20230829   clang
x86_64                randconfig-074-20230829   clang
x86_64                randconfig-075-20230829   clang
x86_64                randconfig-076-20230829   clang
x86_64               randconfig-r002-20230829   clang
x86_64               randconfig-r006-20230829   clang
x86_64               randconfig-r033-20230829   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
