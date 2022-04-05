Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD5D4F207F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 02:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiDEArp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 20:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiDEAro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 20:47:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A82826E035
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 17:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649119006; x=1680655006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xmyqYqEMGKdGoRzBuE7IEYdpyGjIAOJyz6lsogXgStM=;
  b=N91pe4AGpESqnklrYo0q3fvWEEa7ZSDOcBFICYRBnQGbVLFXXe9JRral
   gvUJB64Iz9pjnhTR9HVjqGcGF1hbovh4JaFelE2PrbLlrpaDZuP2hQ+/i
   o/GaFSEwtvgWv13c2antPTJf9KdeHkChLlqgIy+u9m+BIItE/7ErF5tFs
   xi9rGha99nO2IvjNneafbZgGhE4tC5lKdd1vaE7M1tV+QhljNRwX+qLqi
   zijCVossH/dT3sxeK3IAS+BO74b3oRUH1FAwHJoEwhWdk39Kaij55lfuL
   x8yB9HpsFlnLDktijr2qVkG5XdGW4smUM5eMP54l7K/RAwYWyqaRFnyRf
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="259467007"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="259467007"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 17:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="548855893"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2022 17:25:40 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbX0t-0002UX-69;
        Tue, 05 Apr 2022 00:25:39 +0000
Date:   Tue, 05 Apr 2022 08:24:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d2f27dc76d3d5a290f9dfcafae3047e5c9d0ba2b
Message-ID: <624b8c54.G3Vm6FV/71MrCg6c%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d2f27dc76d3d5a290f9dfcafae3047e5c9d0ba2b  Merge branch 'renesas-next' into renesas-devel

elapsed time: 769m

configs tested: 122
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
arc                    vdk_hs38_smp_defconfig
arm                        mini2440_defconfig
arm                        clps711x_defconfig
arc                        nsimosci_defconfig
m68k                          sun3x_defconfig
sh                                  defconfig
xtensa                              defconfig
alpha                            alldefconfig
s390                          debug_defconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
m68k                          hp300_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
arc                      axs103_smp_defconfig
sh                          rsk7201_defconfig
sh                           se7722_defconfig
arm                  randconfig-c002-20220404
x86_64               randconfig-c001-20220404
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
nios2                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
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
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220404
arm                  randconfig-c002-20220404
x86_64               randconfig-c007-20220404
mips                 randconfig-c004-20220404
i386                 randconfig-c001-20220404
riscv                randconfig-c006-20220404
s390                 randconfig-c005-20220404
powerpc                     skiroot_defconfig
mips                      maltaaprp_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
powerpc                   microwatt_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                     am200epdkit_defconfig
hexagon                             defconfig
mips                         tb0287_defconfig
powerpc                     akebono_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
powerpc                       ebony_defconfig
powerpc                     kmeter1_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
hexagon              randconfig-r045-20220404
hexagon              randconfig-r041-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
