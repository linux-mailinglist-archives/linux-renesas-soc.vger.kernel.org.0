Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762AD4ECD58
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 21:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiC3Tka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 15:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiC3Tk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 15:40:28 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711E53ED27
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648669122; x=1680205122;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PamAwqRVQpfI3CI3bzIZgKbVP6d5LNsYElfd7ZLRwyo=;
  b=TGYZiQvD1ssw8veCKb9YuyT2/Z9S/6lLsmBRCfotIH0Zg194tJzwulQp
   nUnZT9VOh5bByZleXqOZTRTWo7ukxubq1ZYEHKf6zD4PcwGIQ3uqUOYQi
   YPTOrNnbBGFVvtv0GQ35mKAU8qND8GAZMsZ2DinROM3fVRglmhnA2qpFs
   stm382Qo2GOBX804uSOdgRqZgINEHdpdYjIJaGoGWBWGVQaTYbyu+2vsh
   J048UJTg/+bkSXufa72+ZvXQK/nCJLjlmGyJXWVrYgAAX+lxYMEa8XSNX
   q9WRIwRv0lCmSui6Ptf9UD7keaKFUNd+C53Lb3EuJMHEW5MlGzzK8TbSq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346065697"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="346065697"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 12:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="654050257"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2022 12:38:40 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nZe9Q-0000Q9-5Y;
        Wed, 30 Mar 2022 19:38:40 +0000
Date:   Thu, 31 Mar 2022 03:38:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar3-rpc-hf-v1] BUILD SUCCESS
 08289ca812c994e6241a08972a55efcdffd4487f
Message-ID: <6244b19c.aidw5DqMSGN/0UEF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar3-rpc-hf-v1
branch HEAD: 08289ca812c994e6241a08972a55efcdffd4487f  [LOCAL] arm64: renesas: defconfig: Enable HyperFlash support

elapsed time: 1652m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                        clps711x_defconfig
arm                          badge4_defconfig
arm                            xcep_defconfig
parisc                           alldefconfig
h8300                       h8s-sim_defconfig
sh                         ecovec24_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
sh                         ap325rxa_defconfig
arm                          lpd270_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
mips                        vocore2_defconfig
arm                  randconfig-c002-20220329
arm                  randconfig-c002-20220327
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20220328
x86_64               randconfig-a003-20220328
x86_64               randconfig-a004-20220328
x86_64               randconfig-a002-20220328
x86_64               randconfig-a005-20220328
x86_64               randconfig-a006-20220328
i386                 randconfig-a002-20220328
i386                 randconfig-a003-20220328
i386                 randconfig-a001-20220328
i386                 randconfig-a005-20220328
i386                 randconfig-a004-20220328
i386                 randconfig-a006-20220328
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20220329
s390                 randconfig-r044-20220327
arc                  randconfig-r043-20220328
arc                  randconfig-r043-20220327
riscv                randconfig-r042-20220329
s390                 randconfig-r044-20220329
riscv                randconfig-r042-20220327
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220327
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220329
riscv                randconfig-c006-20220327
arm                  randconfig-c002-20220329
riscv                randconfig-c006-20220329
mips                 randconfig-c004-20220329
mips                 randconfig-c004-20220327
powerpc              randconfig-c003-20220327
i386                          randconfig-c001
s390                 randconfig-c005-20220327
s390                 randconfig-c005-20220329
mips                           ip27_defconfig
mips                         tb0287_defconfig
riscv                            alldefconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                 randconfig-a015-20220328
i386                 randconfig-a016-20220328
i386                 randconfig-a011-20220328
i386                 randconfig-a012-20220328
i386                 randconfig-a014-20220328
i386                 randconfig-a013-20220328
hexagon              randconfig-r041-20220328
riscv                randconfig-r042-20220328
hexagon              randconfig-r045-20220327
hexagon              randconfig-r045-20220329
hexagon              randconfig-r045-20220328
hexagon              randconfig-r041-20220327
s390                 randconfig-r044-20220328
hexagon              randconfig-r041-20220329

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
