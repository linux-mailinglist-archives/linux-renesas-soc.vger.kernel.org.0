Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1348751EB13
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 May 2022 04:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383200AbiEHCq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 May 2022 22:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447104AbiEHCqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 May 2022 22:46:49 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A250A2194
        for <linux-renesas-soc@vger.kernel.org>; Sat,  7 May 2022 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651977779; x=1683513779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+/HZhihVbDEYlgLAXN9viHrRO2UcQSPajPllNCFKMZk=;
  b=ZI8Dc/qJOK0612lPskzhAH154pUKf+P25lwYQqN+ADlyC7nlwx/+Ppj9
   Q8/fSNAARvQq/Q+bTiuSAQhPn1CkFW9IZGnYV0yaHqwISIliYtdOdKEqI
   WcdZBPRyJeYGVnyvhuUUYhfs4IDbruIWgCTgVybsi7SikKvhl7OuBLg2/
   DojQrOtT8BwtSeSJD/rftalq3FEV5h/+UsQrXVGaY6ORRGhMOF3wcstWK
   MMKtRlmJ11mLSKAN9FuDVl71MxAF4I0PV0KK0hpxxyC65p+INB9IYKUfd
   yd+ziud+/DhLWqUDN5EbRrnNE8ol5eZXcsR8m4jWlHZ6ruZ82uffKp+VN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="266371450"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="266371450"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2022 19:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="892446771"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 May 2022 19:42:45 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnWsf-000FBU-55;
        Sun, 08 May 2022 02:42:45 +0000
Date:   Sun, 08 May 2022 10:42:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 73738e3f3a1ddc060ffa371deea2f1b2b4c2a440
Message-ID: <62772e1f.iY7ZXRzLEsd6/EvL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 73738e3f3a1ddc060ffa371deea2f1b2b4c2a440  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 6272m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
mips                           jazz_defconfig
sh                            titan_defconfig
ia64                        generic_defconfig
arm                      integrator_defconfig
microblaze                          defconfig
mips                         cobalt_defconfig
arm                            pleb_defconfig
powerpc                      tqm8xx_defconfig
ia64                          tiger_defconfig
arm                          lpd270_defconfig
powerpc                      pasemi_defconfig
powerpc                      mgcoge_defconfig
arm                       aspeed_g5_defconfig
m68k                            mac_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20220501
x86_64                        randconfig-c001
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
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
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
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
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
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220501
arm                  randconfig-c002-20220501
x86_64                        randconfig-c007
mips                 randconfig-c004-20220501
i386                          randconfig-c001
riscv                randconfig-c006-20220501
s390                 randconfig-c005-20220501
arm                      tct_hammer_defconfig
mips                            e55_defconfig
arm                         hackkit_defconfig
arm                        magician_defconfig
powerpc                   lite5200b_defconfig
powerpc                        icon_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8540_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        multi_v5_defconfig
powerpc                     kmeter1_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64               randconfig-a011-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a015-20220502
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
