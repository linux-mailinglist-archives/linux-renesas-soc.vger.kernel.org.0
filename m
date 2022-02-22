Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C614BEEAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 02:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbiBVAHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 19:07:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237346AbiBVAHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 19:07:12 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBC4240A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645488408; x=1677024408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8f2Fbqg3vTYpQ/w0sykVCMiS9Kk2qhsMCtzlFKgVHw8=;
  b=R7V20fJqkvc/TSahL0GV0NvSgQImtJw23oLxPs9XF028hgepMWaLDydn
   vu9YkGLmOIlCFFRef8R/usyb0vBcyXeywYLUItxksroJoDGnMMCnmJiBC
   PJqEgSKfkmryT71qCOFXg7SZhNBlqaJBc8kwISPaBpywzVPvVIPqYGxny
   xt/5UZV/6CBzM2W41m3vN1XUbxfvADznPOZvZ2jJe9UhU1XTpcbZKwkH7
   zXZO9tupa7QZIVraXP7rEG9oEvxC3Yr4L3MRNupdA0QpPgEiOQTt2PQLm
   qwPym9krJdqUtElmtpkAetDN1gAc9Df4RkSCJWg1UQgup9ssGrWybRlHO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250403901"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="250403901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 16:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="547499989"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2022 16:06:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMIhZ-00027W-Ok; Tue, 22 Feb 2022 00:06:45 +0000
Date:   Tue, 22 Feb 2022 08:06:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0817e10d064bafaf1215d6e6d39576b9555cc568
Message-ID: <62142909.jQn3NIRDdRXEP47B%lkp@intel.com>
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
branch HEAD: 0817e10d064bafaf1215d6e6d39576b9555cc568  Merge branch 'renesas-next', tag 'v5.17-rc5' into renesas-devel

elapsed time: 730m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220221
mips                         cobalt_defconfig
powerpc                       ppc64_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
sh                            migor_defconfig
sh                          urquell_defconfig
m68k                       m5249evb_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sh                           sh2007_defconfig
powerpc                      pcm030_defconfig
sh                           se7751_defconfig
xtensa                           alldefconfig
arm                        trizeps4_defconfig
arm                  randconfig-c002-20220221
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a004-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a006-20220221
arc                  randconfig-r043-20220221
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                 randconfig-c004-20220221
x86_64               randconfig-c007-20220221
powerpc              randconfig-c003-20220221
i386                 randconfig-c001-20220221
arm                  randconfig-c002-20220221
s390                 randconfig-c005-20220221
riscv                randconfig-c006-20220221
powerpc                       ebony_defconfig
arm                          pxa168_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
arm                         hackkit_defconfig
arm                             mxs_defconfig
powerpc                      obs600_defconfig
mips                     loongson2k_defconfig
powerpc                     skiroot_defconfig
arm                     davinci_all_defconfig
mips                           rs90_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
