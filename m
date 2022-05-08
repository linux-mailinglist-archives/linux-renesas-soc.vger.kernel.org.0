Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84CE51EEDB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 May 2022 18:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbiEHQRy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 May 2022 12:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235339AbiEHQRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 May 2022 12:17:53 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECB8101DA
        for <linux-renesas-soc@vger.kernel.org>; Sun,  8 May 2022 09:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652026442; x=1683562442;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vQDAUQz8Tpu9M4+ZIgphrcZdnRinpgE+HAXoTpM84Kk=;
  b=cAOTbz3Jsm4g5QeQGMU68WDteQ6vL5SshJWKV4yLkXWFnp9q5i/YqSWG
   N0OpUya5PG81NRetfF+3BVeNObaCoXn5qR7C7ed5ObbNUfOplbvfY6KMf
   lRZhOmuxbD/mbIPnFaoWOdlSYz/Dgc0AWx18RvM42bxvnkzezCeSGeTIH
   cDqBXH1ADytNx09sFD6sffa+aue2EEu3cFs/Udf/meZYSCAbPQsGkZXoZ
   ZKKtUjHgNeqCH6dUwp/F+k4Pa/kNb3jhvrfAIhNCxYyDO3SiXHFGUUIJq
   gu8LAmVgs3uAzmWYJAaKOEN5Ygu+8uLZOJfBL5+zyXD9q2+WjOI48VMJy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294077170"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="294077170"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 09:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="695969489"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2022 09:13:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnjXf-000Fbq-DJ;
        Sun, 08 May 2022 16:13:55 +0000
Date:   Mon, 09 May 2022 00:13:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d1312c8c2b58ca08cd1d871e77474e7b2af0d3ce
Message-ID: <6277ec26.gzCX86DyJwinHBKa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d1312c8c2b58ca08cd1d871e77474e7b2af0d3ce  Merge branch 'renesas-next' into renesas-devel

elapsed time: 4638m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220505
s390                       zfcpdump_defconfig
ia64                          tiger_defconfig
mips                            gpr_defconfig
h8300                       h8s-sim_defconfig
sparc                       sparc64_defconfig
mips                            ar7_defconfig
m68k                        mvme16x_defconfig
m68k                            q40_defconfig
powerpc                    klondike_defconfig
mips                         rt305x_defconfig
powerpc                   currituck_defconfig
arm                  randconfig-c002-20220505
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
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
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                  randconfig-r043-20220505
riscv                randconfig-r042-20220505
s390                 randconfig-r044-20220505
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                 mpc832x_rdb_defconfig
s390                             alldefconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc8272_ads_defconfig
mips                      bmips_stb_defconfig
mips                          rm200_defconfig
arm                          ixp4xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
