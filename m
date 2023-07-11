Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616AC74F968
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jul 2023 22:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGKU5o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jul 2023 16:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGKU5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2023 16:57:43 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1AD10FA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689109062; x=1720645062;
  h=date:from:to:cc:subject:message-id;
  bh=T1qVbdmDtT1D+TbmfThR7h6h0mCFZ59FsBv35bNJJJM=;
  b=NQ/AyH2QwUg0Q+0kSYtttoGpf65zSZd7gwciquJCIceK/ACupN2GlUHS
   C2hAXfQ4eX6t1PHJypeBTU9qtgfa2Co0/5hkTeJZ0ywd2MChlGzSs13c1
   2IyRYYOXGfU/0bDXFLUPcG+rb7ajWHW35+lvZL2+rJri+ljpiUjxfYgs8
   X7BHDBKeaK3CBHa77irduCEM8hnUSS4P56+RvnZzoeLP7Y/TIfE8W4B/R
   h8K636hS5t8bRJe6IlzgPCyMH5u7Pr0Ggn+8Bmh2Csape3krFOhlfUVNC
   3i3TAYF5aqPuHE2BISmv3zJ+5Q7L8k5/NxjwFVdmDawAYnAByMfVzryXc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="395528188"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="395528188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 13:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="756517141"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="756517141"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Jul 2023 13:57:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJKQC-00057M-15;
        Tue, 11 Jul 2023 20:57:20 +0000
Date:   Wed, 12 Jul 2023 04:57:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.6] BUILD SUCCESS
 742ebf5d715a4d4b9b4800f5b9eb3a2fae9c9282
Message-ID: <202307120408.W8428zUb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.6
branch HEAD: 742ebf5d715a4d4b9b4800f5b9eb3a2fae9c9282  arm64: dts: renesas: rzg2lc-smarc: Add support for enabling MTU3

elapsed time: 725m

configs tested: 69
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r015-20230712   gcc  
arm                  randconfig-r046-20230710   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                 randconfig-i001-20230711   clang
i386                 randconfig-i002-20230711   clang
i386                 randconfig-i003-20230711   clang
i386                 randconfig-i004-20230711   clang
i386                 randconfig-i005-20230711   clang
i386                 randconfig-i006-20230711   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230712   gcc  
m68k                           sun3_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230712   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230712   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     redwood_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                          rv32_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230712   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                   randconfig-r016-20230712   gcc  
um                   randconfig-r025-20230711   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230711   gcc  
x86_64               randconfig-x002-20230711   gcc  
x86_64               randconfig-x003-20230711   gcc  
x86_64               randconfig-x004-20230711   gcc  
x86_64               randconfig-x005-20230711   gcc  
x86_64               randconfig-x006-20230711   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
