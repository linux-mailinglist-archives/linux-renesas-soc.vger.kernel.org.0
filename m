Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D081C50030E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 02:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbiDNAjd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 20:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbiDNAjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 20:39:31 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9471C909
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 17:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649896628; x=1681432628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y86Q8PLXX7NCm5G7eYqbHt53ygVnII3Nl08Pr78RNvM=;
  b=DSrqKtxec8vAb9zj6NnVtaL0JMdqFlDxhjBJc+4PLEbY2vYnCPAQjgbW
   X3vg0djc4sFz5y8GWaUmv9/IbG6xJ2z9pCSukzxt2DG7U7rZXaYRQMxoV
   RdVYs7/kzT4sibmZOVDD6BuocoK5aMssauQEdayVJfCb2vRdlSEx/u9Ky
   07aqeozSH12Vp4ZTdBJ+GHxrFHonMbDSwArfAYf3pwhGRUYM/DJakWKne
   tdBu96bavDCnFEL6pZBHV9a/uYna3aW94KohaAD4zv3pUOug7gJBD27PD
   FzRSxH76vXd8y9bZv4ufynYzpfkFUCUJc43QKcNej1JZO5evFgOoYOioR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262991078"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="262991078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 17:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="612106192"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2022 17:37:06 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nenTt-0000jG-W8;
        Thu, 14 Apr 2022 00:37:05 +0000
Date:   Thu, 14 Apr 2022 08:36:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.19] BUILD SUCCESS
 59086e4193f4fc920a23d2045a473f62450b4269
Message-ID: <62576ca6.mc+W42jcgT4pZcWh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.19
branch HEAD: 59086e4193f4fc920a23d2045a473f62450b4269  clk: renesas: r9a07g043: Add SDHI clock and reset entries

elapsed time: 726m

configs tested: 88
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                 mpc837x_mds_defconfig
sh                             sh03_defconfig
arm                           sunxi_defconfig
xtensa                           alldefconfig
x86_64                              defconfig
arm                           u8500_defconfig
arm                        spear6xx_defconfig
arm                            mps2_defconfig
arm                        oxnas_v6_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220413
arc                  randconfig-r043-20220413
s390                 randconfig-r044-20220413
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220413
arm                  randconfig-c002-20220413
i386                          randconfig-c001
riscv                randconfig-c006-20220413
mips                 randconfig-c004-20220413
arm                       spear13xx_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220413
hexagon              randconfig-r045-20220413

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
