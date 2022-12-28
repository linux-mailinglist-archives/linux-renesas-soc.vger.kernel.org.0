Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF986571F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Dec 2022 03:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiL1CGu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 21:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiL1CGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 21:06:48 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5847EF4C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 18:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672193208; x=1703729208;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uUw397o8rmKSvhvAql7ilXyoJAca0J0AiN4674mkSCw=;
  b=CPA++giUp6Qkp7dEIBU1vcqlAG8wAw18Nhdf/38/UjIaVxqCqlTGhudW
   KCH3VIfQpcczv0cTHN238qQPks8xFIFhGZLffpgqvj4/Fs/fr8sqGxyMw
   CH9trCFAIIsOWJ+Lmfo7rg2z1H8Tb+N5SXHjbb81lE6ugsNRIZ+NWRNyN
   iun6tWgE3YJduafssoCpsh990WJsfattXrIoRzdhcIhxa/t+fTOX4rIGy
   xWGDGibUS7EiAM65V21KyQPkqRs6Ka0cc9i7LHxm1P7LNZesDrgnwOiH3
   R2prDWx+bt9Sl+vq+Yh8j6H3+zK4KQxzVSRzT1nTJzen5oPev6yZedxjI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="301152767"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="301152767"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 18:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="898532494"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="898532494"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2022 18:06:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pALqA-000FKY-0e;
        Wed, 28 Dec 2022 02:06:46 +0000
Date:   Wed, 28 Dec 2022 10:06:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.3] BUILD SUCCESS
 d969103ac89de797fda351aa984f69602b149a72
Message-ID: <63aba48e.qzAOVN6mPRAga5vX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.3
branch HEAD: d969103ac89de797fda351aa984f69602b149a72  clk: renesas: r9a09g011: Add SDHI/eMMC clock and reset entries

elapsed time: 724m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
s390                             allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
arm                                 defconfig
i386                                defconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a016-20221226
arm64                            allyesconfig
s390                             allyesconfig
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
arm                              allyesconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
x86_64               randconfig-a016-20221226
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64               randconfig-a014-20221226
arm                  randconfig-r046-20221225
i386                 randconfig-a015-20221226
x86_64                          rhel-8.3-func
x86_64               randconfig-a013-20221226
arc                  randconfig-r043-20221225
x86_64               randconfig-a011-20221226
i386                             allyesconfig
arc                  randconfig-r043-20221227
x86_64               randconfig-a012-20221226
arc                  randconfig-r043-20221226
x86_64               randconfig-a015-20221226
riscv                randconfig-r042-20221226
arm                  randconfig-r046-20221227
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20221225
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221225
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a004-20221226
x86_64                          rhel-8.3-rust
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a005-20221226
arm                  randconfig-r046-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r041-20221225
hexagon              randconfig-r045-20221227
hexagon              randconfig-r041-20221227
s390                 randconfig-r044-20221227
hexagon              randconfig-r041-20221226
s390                 randconfig-r044-20221225
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
