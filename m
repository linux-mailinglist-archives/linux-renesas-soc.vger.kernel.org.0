Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 257D06DCD98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 00:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjDJWkv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 18:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjDJWku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 18:40:50 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F80E1BCC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681166449; x=1712702449;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/Uu+AnVwzeGMF3OT8OovWfwZ0INcJFcQUbBGOaGPPAI=;
  b=G52PtYB3G9vJZN2H1Fy7qgVt+nU5SkCGQpznvipNIOzsXU+LufBvxpgp
   fayMOMitWiAmoBiuAUngq27p6QqbOUDbnPuEcydBASMwEtmtKf+PC/ZGJ
   dK27ANcIMnlVOasDi6ohvaUVtMm8cTFjvB7+j7/RvH+/NqVS76mlRoLK2
   /w/LtfMbWoyuuKmcv4XDDchkPTFhdYutnHXTKe3xlU+qlCJqgkzUxdTuB
   G/d7i5+J2SGN7ZncUedi5OVirMPx0VzVaKNSam+QUdX/RtbpBvsTxwaXD
   ELZV13mhVi9zrVK/JrwJW3ifFrBDXv3D9u17COEQxoyH7EiBumLnHDXhj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323102914"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="323102914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 15:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812336505"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="812336505"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Apr 2023 15:40:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pm0Bm-000Vi7-1A;
        Mon, 10 Apr 2023 22:40:42 +0000
Date:   Tue, 11 Apr 2023 06:40:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5715ce18c1fd304f842f76a49a615fc0ace2320f
Message-ID: <64349064.330J+IpOURZdNZC7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5715ce18c1fd304f842f76a49a615fc0ace2320f  Merge tag 'v6.3-rc6' into renesas-devel

elapsed time: 826m

configs tested: 130
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r031-20230410   gcc  
alpha                randconfig-r033-20230410   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230409   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230409   gcc  
arc                  randconfig-r016-20230410   gcc  
arc                  randconfig-r021-20230410   gcc  
arc                  randconfig-r024-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230409   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230409   gcc  
arm64                randconfig-r022-20230410   gcc  
csky         buildonly-randconfig-r006-20230409   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r005-20230409   clang
hexagon              randconfig-r005-20230410   clang
hexagon              randconfig-r012-20230409   clang
hexagon              randconfig-r013-20230410   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r025-20230410   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230409   gcc  
ia64                 randconfig-r033-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230410   gcc  
loongarch            randconfig-r024-20230410   gcc  
loongarch            randconfig-r026-20230410   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230409   gcc  
m68k                 randconfig-r025-20230409   gcc  
m68k                 randconfig-r031-20230409   gcc  
m68k                 randconfig-r032-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230410   gcc  
mips                 randconfig-r004-20230410   gcc  
mips                 randconfig-r026-20230409   clang
nios2        buildonly-randconfig-r004-20230409   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230409   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230409   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r011-20230410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230410   gcc  
powerpc              randconfig-r032-20230410   clang
powerpc              randconfig-r036-20230410   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230410   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230410   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230409   gcc  
sh                   randconfig-r023-20230410   gcc  
sh                   randconfig-r034-20230409   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r001-20230410   gcc  
sparc64              randconfig-r002-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230409   gcc  
xtensa               randconfig-r003-20230410   gcc  
xtensa               randconfig-r014-20230410   gcc  
xtensa               randconfig-r015-20230409   gcc  
xtensa               randconfig-r016-20230409   gcc  
xtensa               randconfig-r035-20230410   gcc  
xtensa               randconfig-r036-20230409   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
