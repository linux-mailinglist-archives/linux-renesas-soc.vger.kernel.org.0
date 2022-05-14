Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75A05271B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 May 2022 16:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbiENONV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 May 2022 10:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232817AbiENONT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 May 2022 10:13:19 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429CC15803
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 May 2022 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652537598; x=1684073598;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rE2HpYJq2TshL/ITLnXBjly0VGTyDOr0KQmj5E1JraY=;
  b=X0BObzxUoVHaVEiaFk2GtBgs97vyuaZdUEJWZvuQpeTnUEmhVANtLdip
   ijovOAMO1o/SIipufAJEFXe1y6VV0a6r2/xTfLjyDR3TODlreKMau4/nW
   D0NV0BbmvoKfRfLkiItzWe1jYw3IlmUlqilj0caFAABcbUyDhSeJODZxD
   B3GWpEnvw7kVw4oYWM7GcFrkC8de9TTskafkpEWtmKMmae1StdJEG2okf
   wUmG25/n++X3MWFzbRM7j1059OUJX421TzspmdJNmOasn4kJaANQqZwz7
   DIlv3IJPcOCJxvBei6JnHq4Ood5hdIKPO/Z3rR+5mAA+gAQIf6VR5UMdl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="295774971"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="295774971"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 07:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="543666320"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 May 2022 07:13:16 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npsWB-0000iz-RZ;
        Sat, 14 May 2022 14:13:15 +0000
Date:   Sat, 14 May 2022 22:12:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 96a98dbdcdfa4ace2fe647058d40c5950b1204cd
Message-ID: <627fb8cd.IrQVkDg0JY4/JNsx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 96a98dbdcdfa4ace2fe647058d40c5950b1204cd  Merge branch 'renesas-next', tag 'v5.18-rc6' into renesas-devel

elapsed time: 7483m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
arc                           tb10x_defconfig
m68k                          atari_defconfig
arm                        spear6xx_defconfig
arm                           h3600_defconfig
arm                      integrator_defconfig
xtensa                           allyesconfig
arm                          badge4_defconfig
microblaze                          defconfig
powerpc                  storcenter_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa3xx_defconfig
powerpc                         wii_defconfig
arc                          axs101_defconfig
xtensa                         virt_defconfig
sh                          rsk7201_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a012-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a015-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a011-20220509
x86_64               randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a012-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a016-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220512
x86_64                        randconfig-c007
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
i386                          randconfig-c001
arm                  randconfig-c002-20220512
i386                 randconfig-c001-20220509
x86_64               randconfig-c007-20220509
arm                  randconfig-c002-20220509
powerpc              randconfig-c003-20220509
mips                 randconfig-c004-20220509
riscv                randconfig-c006-20220509
s390                 randconfig-c005-20220509
powerpc                       ebony_defconfig
arm                          ep93xx_defconfig
arm                   milbeaut_m10v_defconfig
mips                       rbtx49xx_defconfig
mips                           ip27_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc836x_mds_defconfig
mips                     cu1000-neo_defconfig
x86_64               randconfig-a003-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a006-20220509
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
