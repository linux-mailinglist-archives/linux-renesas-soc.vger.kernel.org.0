Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DB662CC8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 22:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbiKPVTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 16:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbiKPVTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 16:19:21 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABE76172
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2022 13:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668633560; x=1700169560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=56qO/UU7kR23mi+skWmcUHNYElbrbORc+vzgW16WEU8=;
  b=T3oAUApKXzjyrY7WRPKFozhLNok5X8CynuChbRpJ16yDO8kaXLfy2pfl
   OIc9VZNBNnwLXdVPCm2TTnJkRU8MXj+oFe8nLd+gZ0R7E0n8byC08rqCd
   hvLyW6kWcVLHbLHlQNHcq2SnqMLrgy2hJR4qdFDlonqQ4CHkf+fI9pBWa
   99lFAXxD0YD8ZGLwF8EAcdBLt8PKpp5Ah91z3Mz1RqETRC0uLLkBhlVzM
   437IQdbx6Ggf8dwG0fa/AxoeViiAtIz1F5WtpMHokgDDpaJymQH7JduJB
   /8nYkKlLLHxT6HZKjm9fbTBZNN7J2u2sLqRpRdoVOYf2LoBT8Jj52oMQc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292378370"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="292378370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 13:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="708333174"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="708333174"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2022 13:19:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovPoU-0002kX-34;
        Wed, 16 Nov 2022 21:19:18 +0000
Date:   Thu, 17 Nov 2022 05:18:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 777bcc85e1fbadfea1927e828165102cf5050b53
Message-ID: <637553b2.kGHDHgipUVUmsYYx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: 777bcc85e1fbadfea1927e828165102cf5050b53  clk: renesas: r8a779f0: Fix Ethernet Switch clocks

elapsed time: 722m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
arc                                 defconfig
i386                          randconfig-a012
um                           x86_64_defconfig
i386                          randconfig-a014
alpha                               defconfig
i386                          randconfig-a016
s390                                defconfig
s390                             allmodconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221116
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
i386                          randconfig-a001
m68k                             allmodconfig
x86_64                        randconfig-a013
arc                              allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a003
alpha                            allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
i386                          randconfig-a005
x86_64                        randconfig-a006
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
x86_64                            allnoconfig
sh                          r7785rp_defconfig
mips                             allyesconfig
powerpc                          allmodconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_k210_defconfig
openrisc                            defconfig
arm                        realview_defconfig
powerpc                   currituck_defconfig
xtensa                    xip_kc705_defconfig
i386                          randconfig-c001
arm                             ezx_defconfig
arm                        oxnas_v6_defconfig
microblaze                          defconfig
sh                          rsk7203_defconfig
sparc64                          alldefconfig
sh                            titan_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                            ar7_defconfig
arm                            zeus_defconfig
powerpc                    amigaone_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7705_defconfig
arm                            qcom_defconfig

clang tested configs:
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20221116
riscv                randconfig-r042-20221116
hexagon              randconfig-r041-20221116
s390                 randconfig-r044-20221116
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
powerpc                     pseries_defconfig
hexagon              randconfig-r041-20221117
hexagon              randconfig-r045-20221117

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
