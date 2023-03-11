Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5F06B5D6C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 16:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCKPpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 10:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjCKPo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 10:44:59 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FA02B614
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Mar 2023 07:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678549498; x=1710085498;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E/JhQ5VpdbHv3ExOPXbku5QyqdoCpEM/7sXo9ls0FaI=;
  b=Ejfj9V3MaVLbvWfuW8KbjlW1KZzNBnmwMsHUPhQ2p4+G33HqeCHb6n4p
   vE1nI30JPmx7RPRRLa3szaFo8+/w1r/JRVA0N2SmstfIsuKH+2AUA1U6G
   xT94f+Ksw4RB7N9ZeUUMxXBXK8p5s/+VLCYKNAxrH6/EJZaUkxGPw58eg
   quQVMONyy+Qis91Gohmbb3LY2z+IVE9euEZQB1fhP3TXQHTk88Ad9RB3u
   KjEZxUqKDLOKOFnBwAHMQmP2vb2rpoWfjcUHIXLMy7Jv1SSSCge/BhCyG
   hLE2riyt6FstkonAqIxyGAMMhsWTxztoiUQToWgdpERzIoQHA061K2wDV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="316559288"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="316559288"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 07:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="747080791"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="747080791"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2023 07:44:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pb1Ox-0004fI-15;
        Sat, 11 Mar 2023 15:44:55 +0000
Date:   Sat, 11 Mar 2023 23:43:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.4] BUILD SUCCESS
 d35ad1030a6bce57234b8eea14ab17560f3c9e1b
Message-ID: <640ca1be.r6Sc63HebSbvmM8P%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.4
branch HEAD: d35ad1030a6bce57234b8eea14ab17560f3c9e1b  dt-bindings: soc: renesas: Remove R-Car H3 ES1.*

elapsed time: 1303m

configs tested: 102
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230310   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230310   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230310   gcc  
arm64                randconfig-r032-20230310   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230310   gcc  
hexagon              randconfig-r003-20230310   clang
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
ia64                 randconfig-r016-20230310   gcc  
ia64                 randconfig-r026-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230310   gcc  
loongarch            randconfig-r031-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230310   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      malta_kvm_defconfig   clang
nios2        buildonly-randconfig-r003-20230310   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230310   gcc  
parisc               randconfig-r021-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r023-20230310   gcc  
powerpc              randconfig-r033-20230310   clang
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r036-20230310   clang
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                          landisk_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230310   gcc  
sparc                randconfig-r005-20230310   gcc  
sparc                randconfig-r011-20230310   gcc  
sparc64      buildonly-randconfig-r006-20230310   gcc  
sparc64              randconfig-r035-20230310   gcc  
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
xtensa               randconfig-r013-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
