Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CA86BE099
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 06:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjCQFaI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 01:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCQFaH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 01:30:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CBFB4F71
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 22:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679031004; x=1710567004;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ox+z6lnCTf63HzbqC8seUcW9UyHXAHvENTkPo0HpsNE=;
  b=QmKeaND4wfOX/NhxBeJNZTThyLtbppfPsbIgXfAjnob8+CoibzJljo/r
   9j+A5PUjFySPRLPKtZ/O+ywtfShvw6miV+sdcBz+kFqV9hIfHGxsFG9oG
   9HQZr6EkvsWmZ/WwwxfR1fWgLQIAJ+5BwS3aSKkyMEODaqqUcGJNDMHGv
   Sdr3WU33TL8g9c2um3xW5L7J9MdkobLlRlBNMCSr2Uk2Y2Q15us6DnPUG
   FWjtHUrq5HxmA6y/pERKBKw+emAa+VHnI5bu/vn6F8/wr5tKteSkc8lf7
   bxDL+uKZZaZvVIGG/xwFqwsfQu+WAMiEu42aMbgJvBWdZWxy2JhEfZaVB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="403059109"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="403059109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 22:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712625873"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="712625873"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 22:30:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pd2f7-00097e-23;
        Fri, 17 Mar 2023 05:29:57 +0000
Date:   Fri, 17 Mar 2023 13:29:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.4] BUILD SUCCESS
 9d7558ed8372c51cbed011cb1dc3eb1beee212cf
Message-ID: <6413fad4.WDdynXwm8XGVlJHi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.4
branch HEAD: 9d7558ed8372c51cbed011cb1dc3eb1beee212cf  pinctrl: renesas: Drop support for Renesas-specific properties

elapsed time: 728m

configs tested: 112
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r026-20230315   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                  randconfig-r021-20230315   gcc  
arm                  randconfig-r036-20230312   gcc  
arm                  randconfig-r046-20230312   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230312   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r032-20230313   gcc  
ia64                 randconfig-r036-20230313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230312   gcc  
m68k                 randconfig-r023-20230315   gcc  
m68k                 randconfig-r033-20230313   gcc  
m68k                 randconfig-r034-20230313   gcc  
microblaze           randconfig-r006-20230312   gcc  
microblaze           randconfig-r013-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230313   clang
mips         buildonly-randconfig-r006-20230313   clang
mips                 randconfig-r001-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230312   gcc  
openrisc             randconfig-r022-20230315   gcc  
openrisc             randconfig-r035-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230313   gcc  
parisc               randconfig-r033-20230312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                 mpc832x_mds_defconfig   clang
powerpc                     ppa8548_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230313   clang
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230313   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r035-20230312   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230315   gcc  
sparc64              randconfig-r001-20230313   gcc  
sparc64              randconfig-r012-20230312   gcc  
sparc64              randconfig-r034-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-k001-20230313   clang
x86_64               randconfig-r002-20230313   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
