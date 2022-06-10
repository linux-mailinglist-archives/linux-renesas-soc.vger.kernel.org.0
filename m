Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4FE546F38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 23:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348385AbiFJVZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 17:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350927AbiFJVZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 17:25:58 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63962065ED
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 14:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654896354; x=1686432354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=81omDJst/LL7AZCI738/LOGStfhlb4KzjJSa7AhRwRE=;
  b=h5Wcv6VQukBpRAlAhsvYomU4U6iDf+6DRJnrBBOuKkEvEwq79KkKJoB7
   gn93uuRgRoOlNB/sV6uHNZHOzU89/x0sehJh/4Ty40cz0PRPk0PYqQLcV
   cMhnUuEPHcfjm6SJZMmOVQA+eZQ3NotX/f4Q5mISGKoWVkKKrTU0gPlU2
   UGiaL4ofLiibNTvfmlMeGsKDi0PjZfpWNPAzvdRyNZNd8yTcsE/pHCB8Z
   rOMSSf5C0fw5BCBSpRJsqyYosi0+MZliMNOeDM4dt1BUsDQGC5+pUNIsD
   2FzdkBkfI4ItOpa4jAkEx+oA/0DLDx2+0t37H/ZCvwU5GnKqahP8VPDhN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341808840"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="341808840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 14:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="828448456"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2022 14:25:53 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzm8e-000IID-Ga;
        Fri, 10 Jun 2022 21:25:52 +0000
Date:   Sat, 11 Jun 2022 05:25:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 64961e6e6d1cd0dc8242c2ef787619ddfde9344d
Message-ID: <62a3b6cb.SPaKujUKLjvYaVuZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 64961e6e6d1cd0dc8242c2ef787619ddfde9344d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 4730m

configs tested: 75
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
i386                          randconfig-c001
mips                         rt305x_defconfig
arm                        mini2440_defconfig
powerpc                    klondike_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                            allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a006
i386                          randconfig-a012
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                               defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
