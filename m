Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9C05A563B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 23:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiH2Vcv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 17:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiH2Vcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 17:32:51 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC63B2BEE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 14:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661808770; x=1693344770;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mZMw9LYdrAIvyxIpGn0MCcxJZLJvOkL6l2CgUFSiO7U=;
  b=SdhmkbRbSwo7Wlq6G2H85uOwNZuxMQ16kbThnJ8cUfBwxu0i304i7Jlu
   BIfCuysYxyK2tYc57J0epOw7Sm4wfDblZh0zW2XCUM517cY2uI61dhZp2
   8mC90koV0lbebn29Wq+MRH9CHr3r9MsiybbWV421JDXiR66OrYHRdr5+z
   Mh2BOBtpm26/gSoD5iQXsqbuZHyPZlpR3QTPLaTBuJLk0tDlLK9Tf6JHM
   tV3s66Ar3RyZwuDwYp8HzIHY/lqD9EL5TgjxiuFAaRMmwarw+zMLr55Ph
   Y3MfEprTMs8N+PynhDugIqD65XDnRTcw/ZoVzbvbn+yaKVpwo4x1UbV4O
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="321129111"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="321129111"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 14:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="715031665"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2022 14:32:49 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSmNE-0000Kj-2p;
        Mon, 29 Aug 2022 21:32:48 +0000
Date:   Tue, 30 Aug 2022 05:32:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 644814c1070d9d165b85064e9ff1a80681b560fe
Message-ID: <630d3063.g7rghShSHqEOUrj/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 644814c1070d9d165b85064e9ff1a80681b560fe  clk: renesas: r8a779f0: Add MSIOF clocks

elapsed time: 724m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
m68k                             allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a004-20220829
x86_64               randconfig-a005-20220829
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64               randconfig-a006-20220829
mips                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20220829
i386                 randconfig-a001-20220829
x86_64               randconfig-a002-20220829
i386                 randconfig-a003-20220829
arc                  randconfig-r043-20220829
x86_64               randconfig-a003-20220829
i386                 randconfig-a002-20220829
i386                 randconfig-a004-20220829
i386                 randconfig-a005-20220829
i386                 randconfig-a006-20220829
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
xtensa                           alldefconfig
sh                            migor_defconfig
sh                      rts7751r2d1_defconfig
m68k                        m5407c3_defconfig
sh                          r7780mp_defconfig
m68k                          multi_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
sh                             shx3_defconfig
mips                       bmips_be_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                           h5000_defconfig
arm                        keystone_defconfig
arm64                            alldefconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
parisc                              defconfig
loongarch                           defconfig
loongarch                         allnoconfig
nios2                               defconfig
arm                         axm55xx_defconfig
sh                           se7343_defconfig
sh                        edosk7705_defconfig
nios2                            allyesconfig
parisc64                            defconfig

clang tested configs:
hexagon              randconfig-r041-20220829
hexagon              randconfig-r045-20220829
riscv                randconfig-r042-20220829
s390                 randconfig-r044-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a015-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
x86_64               randconfig-a011-20220829
x86_64               randconfig-a014-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a012-20220829
i386                 randconfig-a015-20220829
i386                 randconfig-a016-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
