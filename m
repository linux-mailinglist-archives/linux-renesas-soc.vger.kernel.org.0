Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28BA85504E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jun 2022 14:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiFRMtY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Jun 2022 08:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235949AbiFRMtX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Jun 2022 08:49:23 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAA818E3D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jun 2022 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655556559; x=1687092559;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nYvw4x2p84m8bUBALAG6Zq/lmPmgRApbwrsDfcpZq8c=;
  b=c3fNH8T9sbZn4er7wKLEup5pvccUpyoCWASA7OinA7HD6qpIArRL78V4
   XD+Leny9jyfWYiWoG1UoZ570Xmy3d0VGw4S4SxxiyUVVI2zpX37VTth4f
   DIeIU9TStG13s/XWMJBZ8t14qOrdCMCPVGrdohm+W4gkJv6dIoblBgcV2
   OdqDCJ7mtNagRMBVOJ+sHlYT52Kj0qiK7z0lvd8cQT400TA0Czthia2sW
   +MTIvGMNG7S3gcOZ9tEXjfGdhvAmb6e9WlNTFeoWBjguqGVo23mJNvENY
   hwPrLdK0LEN4OZshHmp389eYudCOF6iV7mzaaab5Jqpq8vrwX4MBlJKg7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="343644163"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="343644163"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 05:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="653996555"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2022 05:49:17 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2Xt6-000QKF-Rr;
        Sat, 18 Jun 2022 12:49:16 +0000
Date:   Sat, 18 Jun 2022 20:48:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 64d15244c4805618b3bfc0886094481e9ac91762
Message-ID: <62adc9b0.aBWSqf/qK+oDZw8J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 64d15244c4805618b3bfc0886094481e9ac91762  Merge branch 'renesas-dt-bindings-for-v5.20' into renesas-next

elapsed time: 1690m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
mips                            gpr_defconfig
sh                           se7751_defconfig
s390                       zfcpdump_defconfig
sh                            migor_defconfig
m68k                        mvme147_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a012
arc                  randconfig-r043-20220617
s390                 randconfig-r044-20220617
riscv                randconfig-r042-20220617
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

clang tested configs:
arm                              alldefconfig
arm                   milbeaut_m10v_defconfig
arm                           omap1_defconfig
powerpc                   microwatt_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220617
hexagon              randconfig-r045-20220617

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
