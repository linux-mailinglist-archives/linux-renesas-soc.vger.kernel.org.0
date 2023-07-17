Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10545756ED7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 23:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjGQVQP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 17:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjGQVQO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 17:16:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AC413D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689628573; x=1721164573;
  h=date:from:to:cc:subject:message-id;
  bh=F1DIujkfktVsSdMxhIGLosphRtXsZoc/joG7DpkKDVk=;
  b=Spi5P5W05nSYvt0gVmyQwsWNSmSDN2ZEuLyuIDfmZOI3sDbGKH0xmNyB
   oJ3hh/2TueUCADhNWNtVQqUEaOhpLJ+IOi43aoemsNDBUmN6Jc1OHiufc
   +CVuwtBBRn8biQ2iybdJe9uAGDnni7HMef/TB+5+fzm9dc95oy2PaOrjQ
   ZKOmn9zhZ0z/7gQUzDKBbo6hRIkyEeLCamgK63lSCztKlvXX/4BrPY9x8
   IGYkGBXMbzWT0OlSMBCXM5uO99h8+k/5mjhhXSRE9+dQy2pwkAAvhKpnN
   IJIGZPD9TCvqDA/xNN3gjbstNVlour8LmrtYnB5KDTDUzLtGsQ2n/x+ac
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432216180"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432216180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793387546"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="793387546"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2023 14:16:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLVZg-0009v8-2l;
        Mon, 17 Jul 2023 21:16:08 +0000
Date:   Tue, 18 Jul 2023 05:15:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d04ad80865d1cee51b31b7b2d19e7167982ab3b6
Message-ID: <202307180531.lygwe4Gy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d04ad80865d1cee51b31b7b2d19e7167982ab3b6  Merge branch 'renesas-dts-for-v6.6' into renesas-next

elapsed time: 723m

configs tested: 31
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230717   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230717   clang
m68k                        m5272c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
mips                          malta_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                        qi_lb60_defconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                         ps3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
