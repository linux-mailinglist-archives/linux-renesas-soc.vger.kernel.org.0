Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DEB6C4057
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 03:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjCVC1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 22:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCVC1M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 22:27:12 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F935A1AC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 19:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679452031; x=1710988031;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZyTW7frmbouEXm2PnEr+e3hGRe2ZlTgzqj+cEu5nfIw=;
  b=jv4mvJp61VQBnKs4HXJmoSqwWUghEOJVGp0d5urBPVgXjQEyxHoX25nP
   07cekPyvXIIP6hZ9+nBFofczMtx+69PpsWhjlsX6E+/KM+/41J/ZowYMO
   aVXs44RwaAex57cuqAbCbQa5Yvl9MtbZZXgdeL87dbnEKkiXkzJjX8HhY
   OZrWkv3TT3dI9fNzFF//ar9Ckti7KxeLyTK6oHpwPRQnn8Sva1lADYjvb
   RAuoKA34mxFQPFZdBmtsutus4F467UNcuEVgxJNmmWdselngYqN5CbLuL
   EgF2Vp1zXP0R1raz5Af+RBt0iF1pPRVHmS6ToYC7Aw2086lZDGGjutJZ/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340646111"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="340646111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 19:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="659025456"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="659025456"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Mar 2023 19:27:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peoBx-000CiK-0E;
        Wed, 22 Mar 2023 02:27:09 +0000
Date:   Wed, 22 Mar 2023 10:27:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar-power-source-v1] BUILD SUCCESS
 4a1e89374e981f5d1d9cb94de0328cfa83e8b9b1
Message-ID: <641a6774.pj5ov0i3kRADljfL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-power-source-v1
branch HEAD: 4a1e89374e981f5d1d9cb94de0328cfa83e8b9b1  pinctrl: renesas: r8a779g0: Add support for AVB/TSN power-sources

elapsed time: 732m

configs tested: 163
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230320   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230319   gcc  
alpha                randconfig-r023-20230319   gcc  
alpha                randconfig-r031-20230319   gcc  
alpha                randconfig-r033-20230319   gcc  
alpha                randconfig-r036-20230319   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230320   gcc  
arc                  randconfig-r005-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arc                  randconfig-r043-20230321   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230321   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230319   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230319   clang
arm64                randconfig-r014-20230319   clang
csky         buildonly-randconfig-r003-20230320   gcc  
csky         buildonly-randconfig-r005-20230319   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230319   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r022-20230319   gcc  
csky                 randconfig-r035-20230319   gcc  
csky                 randconfig-r035-20230320   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r004-20230320   clang
hexagon              randconfig-r032-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r045-20230319   clang
i386                             allyesconfig   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230320   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230320   clang
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230320   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230320   clang
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230320   gcc  
i386                 randconfig-a012-20230320   gcc  
i386                 randconfig-a013-20230320   gcc  
i386                 randconfig-a014-20230320   gcc  
i386                 randconfig-a015-20230320   gcc  
i386                 randconfig-a016-20230320   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230319   gcc  
ia64                 randconfig-r033-20230319   gcc  
ia64                 randconfig-r036-20230319   gcc  
ia64                 randconfig-r036-20230320   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230320   gcc  
loongarch    buildonly-randconfig-r006-20230319   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230319   gcc  
loongarch            randconfig-r025-20230320   gcc  
loongarch            randconfig-r026-20230320   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230319   gcc  
m68k                 randconfig-r026-20230319   gcc  
m68k                 randconfig-r031-20230319   gcc  
microblaze           randconfig-r003-20230319   gcc  
microblaze           randconfig-r014-20230319   gcc  
microblaze           randconfig-r034-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                 randconfig-r034-20230320   gcc  
mips                        vocore2_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230320   gcc  
nios2                randconfig-r034-20230319   gcc  
nios2                randconfig-r036-20230319   gcc  
openrisc     buildonly-randconfig-r002-20230319   gcc  
openrisc             randconfig-r022-20230319   gcc  
openrisc             randconfig-r023-20230319   gcc  
openrisc             randconfig-r035-20230319   gcc  
parisc       buildonly-randconfig-r003-20230319   gcc  
parisc       buildonly-randconfig-r004-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230319   gcc  
parisc               randconfig-r025-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230319   clang
powerpc                   microwatt_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r006-20230319   gcc  
powerpc              randconfig-r021-20230320   gcc  
powerpc              randconfig-r033-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r006-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230319   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230319   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230320   gcc  
sh                   randconfig-r011-20230319   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                           se7619_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230320   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230320   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r021-20230319   gcc  
sparc                randconfig-r024-20230320   gcc  
sparc                randconfig-r031-20230319   gcc  
sparc                randconfig-r032-20230319   gcc  
sparc                randconfig-r035-20230319   gcc  
sparc64              randconfig-r001-20230320   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230320   clang
x86_64               randconfig-r022-20230320   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230320   gcc  
xtensa               randconfig-r001-20230319   gcc  
xtensa               randconfig-r033-20230320   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
