Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCA07624EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jul 2023 23:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjGYVzt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 17:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjGYVzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 17:55:47 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289831FF0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690322146; x=1721858146;
  h=date:from:to:cc:subject:message-id;
  bh=q0FKZfC0sAfZ6e5apZlTUrbBmZoNg4a60o+WIWM3EMc=;
  b=NytmCyndYNGxkC5eSpG3gaRKNZlNFJRAn22uRxbNJg1x2c+n+v39I0L8
   tR49+k/DZI13Z3tRFPRFkhb6QIJ+4jfzIQnCrE/6ORmZdnX0fE4Hz6hUE
   8bNLxaiU0uUSoiW2OiMeEVee2WfA/9M0klC5j1U61jbdEA8rUH5JWm93x
   ubJB8N/W3s4pH5mNpDQ4+pChJxndbL+hejMXtQXu1y8Yb1ODnEI1FUsDK
   pd6g3VprMJv6908DKoSLhIJadLnZE3RZTUYn8ya2AlUFBP/qY/Ay8sIC3
   6W2uA2rD5HGTSPCZVxu/LPIu1vTVAhFXlIuqt4H9jXahd8fWPVDEEnWvv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454231853"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454231853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 14:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900123083"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="900123083"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 14:55:27 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOQ06-0000N1-2s;
        Tue, 25 Jul 2023 21:55:26 +0000
Date:   Wed, 26 Jul 2023 05:55:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.6] BUILD SUCCESS
 bfb345a7bdc186ebbf2b9c53215f0f7b9bdba9fd
Message-ID: <202307260518.VtleQjWZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.6
branch HEAD: bfb345a7bdc186ebbf2b9c53215f0f7b9bdba9fd  ARM: shmobile: rcar-gen2: Drop unused OF includes

elapsed time: 721m

configs tested: 97
configs skipped: 121

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                randconfig-r012-20230725   gcc  
alpha                randconfig-r034-20230725   gcc  
arc                              allyesconfig   gcc  
arc                  randconfig-r013-20230725   gcc  
arc                  randconfig-r023-20230725   gcc  
arc                  randconfig-r024-20230725   gcc  
arc                  randconfig-r033-20230725   gcc  
arc                  randconfig-r035-20230725   gcc  
arc                  randconfig-r036-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                  randconfig-r046-20230725   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                randconfig-r012-20230725   gcc  
arm64                randconfig-r026-20230725   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230725   gcc  
csky                 randconfig-r016-20230725   gcc  
csky                 randconfig-r031-20230725   gcc  
hexagon              randconfig-r023-20230725   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230725   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230725   gcc  
microblaze           randconfig-r015-20230725   gcc  
microblaze           randconfig-r021-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      malta_kvm_defconfig   clang
nios2                randconfig-r025-20230725   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r022-20230725   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230725   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230725   gcc  
sparc                randconfig-r031-20230725   gcc  
sparc64              randconfig-r014-20230725   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64               randconfig-r016-20230725   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
