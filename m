Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3AAA7A5537
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 23:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjIRVqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 17:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjIRVqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 17:46:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF83F8E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695073555; x=1726609555;
  h=date:from:to:cc:subject:message-id;
  bh=MGnp0dqFBuQEVChBstk/IBIMPCkPNmWuM+57JLBPyuM=;
  b=FxBqHZc6bj4XehvgS+1zUqYUBukR+psLp6vTQReshIYVA2xfLeQvGKNG
   Yu2hkLu8yjgqxsbEvAP/QaavtNcDGm4VsALd+uTzvAvOmfXp9m8xs2BhZ
   aurFLxdQTZzTlaf2HzfOV/dUvWa3yIQndbhsu3P9ebt0vGDWzh+fh0GjK
   Vy9wR7Bh0l6Iqp+Old5U7MmEh73bDb+JT6aolpN5ZK7r+y2+ECpWXpmp7
   umJHVDEt7ynFwebSm4KVxlGtC+cSB1HgzaxLvjVSllmrCnr3CqUX5Q0Nm
   3AI3l7CafDqKbolHmlEN4E0qNPZvxXUP4c86hoqzWH1OxtjZH5a3ZTHAX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443864710"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="443864710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 14:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869721728"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="869721728"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 14:45:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qiM3y-0006XI-0T;
        Mon, 18 Sep 2023 21:45:50 +0000
Date:   Tue, 19 Sep 2023 05:45:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pmdomain] BUILD SUCCESS
 7f6a96bfae36365df9efb76cbf2f5d3e57485c3a
Message-ID: <202309190559.zi5Y7TKo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pmdomain
branch HEAD: 7f6a96bfae36365df9efb76cbf2f5d3e57485c3a  pmdomain: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast warning

elapsed time: 730m

configs tested: 196
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
arc                            hsdk_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20230919   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                   randconfig-001-20230918   gcc  
arm                   randconfig-001-20230919   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230918   gcc  
i386         buildonly-randconfig-001-20230919   gcc  
i386         buildonly-randconfig-002-20230918   gcc  
i386         buildonly-randconfig-002-20230919   gcc  
i386         buildonly-randconfig-003-20230918   gcc  
i386         buildonly-randconfig-003-20230919   gcc  
i386         buildonly-randconfig-004-20230918   gcc  
i386         buildonly-randconfig-004-20230919   gcc  
i386         buildonly-randconfig-005-20230918   gcc  
i386         buildonly-randconfig-005-20230919   gcc  
i386         buildonly-randconfig-006-20230918   gcc  
i386         buildonly-randconfig-006-20230919   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230918   gcc  
i386                  randconfig-001-20230919   gcc  
i386                  randconfig-002-20230918   gcc  
i386                  randconfig-002-20230919   gcc  
i386                  randconfig-003-20230918   gcc  
i386                  randconfig-003-20230919   gcc  
i386                  randconfig-004-20230918   gcc  
i386                  randconfig-004-20230919   gcc  
i386                  randconfig-005-20230918   gcc  
i386                  randconfig-005-20230919   gcc  
i386                  randconfig-006-20230918   gcc  
i386                  randconfig-006-20230919   gcc  
i386                  randconfig-011-20230918   gcc  
i386                  randconfig-011-20230919   gcc  
i386                  randconfig-012-20230918   gcc  
i386                  randconfig-012-20230919   gcc  
i386                  randconfig-013-20230918   gcc  
i386                  randconfig-013-20230919   gcc  
i386                  randconfig-014-20230918   gcc  
i386                  randconfig-014-20230919   gcc  
i386                  randconfig-015-20230918   gcc  
i386                  randconfig-015-20230919   gcc  
i386                  randconfig-016-20230918   gcc  
i386                  randconfig-016-20230919   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230918   gcc  
loongarch             randconfig-001-20230919   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
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
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230918   gcc  
riscv                 randconfig-001-20230919   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230918   gcc  
s390                  randconfig-001-20230919   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230918   gcc  
sparc                 randconfig-001-20230919   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230918   gcc  
x86_64       buildonly-randconfig-001-20230919   gcc  
x86_64       buildonly-randconfig-002-20230918   gcc  
x86_64       buildonly-randconfig-002-20230919   gcc  
x86_64       buildonly-randconfig-003-20230918   gcc  
x86_64       buildonly-randconfig-003-20230919   gcc  
x86_64       buildonly-randconfig-004-20230918   gcc  
x86_64       buildonly-randconfig-004-20230919   gcc  
x86_64       buildonly-randconfig-005-20230918   gcc  
x86_64       buildonly-randconfig-005-20230919   gcc  
x86_64       buildonly-randconfig-006-20230918   gcc  
x86_64       buildonly-randconfig-006-20230919   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230918   gcc  
x86_64                randconfig-001-20230919   gcc  
x86_64                randconfig-002-20230918   gcc  
x86_64                randconfig-002-20230919   gcc  
x86_64                randconfig-003-20230918   gcc  
x86_64                randconfig-003-20230919   gcc  
x86_64                randconfig-004-20230918   gcc  
x86_64                randconfig-004-20230919   gcc  
x86_64                randconfig-005-20230918   gcc  
x86_64                randconfig-005-20230919   gcc  
x86_64                randconfig-006-20230918   gcc  
x86_64                randconfig-006-20230919   gcc  
x86_64                randconfig-011-20230918   gcc  
x86_64                randconfig-012-20230918   gcc  
x86_64                randconfig-013-20230918   gcc  
x86_64                randconfig-014-20230918   gcc  
x86_64                randconfig-015-20230918   gcc  
x86_64                randconfig-016-20230918   gcc  
x86_64                randconfig-071-20230918   gcc  
x86_64                randconfig-071-20230919   gcc  
x86_64                randconfig-072-20230918   gcc  
x86_64                randconfig-072-20230919   gcc  
x86_64                randconfig-073-20230918   gcc  
x86_64                randconfig-073-20230919   gcc  
x86_64                randconfig-074-20230918   gcc  
x86_64                randconfig-074-20230919   gcc  
x86_64                randconfig-075-20230918   gcc  
x86_64                randconfig-075-20230919   gcc  
x86_64                randconfig-076-20230918   gcc  
x86_64                randconfig-076-20230919   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
