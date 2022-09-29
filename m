Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B225EEC73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 05:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbiI2D2P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 23:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbiI2D2G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 23:28:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A1812848B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2022 20:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664422081; x=1695958081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OUG68EAQ5Jd2DeWRt6utbkEtSTxCpnCAEQgk3edAzCI=;
  b=fgFmAsICbSIsuV5FAEokKGryxX6OTZJwNfIzUW6zyikPTTBLmMsNk6aH
   B42enBkXAkOxw0Fc7YK0/AQQpLw0BBl9TvOXBqCZU/kuqkk2Nh3mEe2qp
   g5zxtD8ZITHi60+qc7rQo8AycvtELtoGiNyxwIXfLOme/d8RMNKj2FAt6
   R9RP0zzVbQMzPnHH3+T/dwkB1Zwd5rI2mU40qmmj9SIe6QaXzZN0SRv++
   Vsv4qLwKd3Q88fg4PyuNs6lqtJLgTdPV+Ph91YducT6+T6VdQBBsWD71N
   IMc1CTLJqvwoPO20yWuPUMQJLcu7Ks9lUw1aBFtTGdtak0vjM0jpqbHoc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="303268334"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; 
   d="scan'208";a="303268334"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 20:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="747667456"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; 
   d="scan'208";a="747667456"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2022 20:27:57 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odkDN-0000Wx-0s;
        Thu, 29 Sep 2022 03:27:57 +0000
Date:   Thu, 29 Sep 2022 11:27:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 4ccf4c30402d0876e44a741f368cbc067068e7f6
Message-ID: <633510a4.e55FgNEsYV14qevS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 4ccf4c30402d0876e44a741f368cbc067068e7f6  arm64: dts: renesas: r8a779g0: whitehawk: Add overlay for IRQ2

elapsed time: 867m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
s390                             allmodconfig
s390                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
i386                             allyesconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
mips                             allyesconfig
arc                  randconfig-r043-20220926
alpha                            allyesconfig
i386                 randconfig-a001-20220926
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                        randconfig-a002
i386                 randconfig-a002-20220926
x86_64                           rhel-8.3-kvm
i386                 randconfig-a003-20220926
i386                 randconfig-a004-20220926
x86_64                        randconfig-a006
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
m68k                         amcore_defconfig
mips                           xway_defconfig
sh                          lboxre2_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                  audio_kc705_defconfig
sh                         ap325rxa_defconfig
xtensa                generic_kc705_defconfig
sh                          urquell_defconfig
arm                         nhk8815_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                        multi_v7_defconfig
m68k                          amiga_defconfig
arm                            xcep_defconfig
mips                          rb532_defconfig
nios2                            alldefconfig
sh                          landisk_defconfig
sh                           sh2007_defconfig
sh                            hp6xx_defconfig
sh                      rts7751r2d1_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
m68k                        m5407c3_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc8540_ads_defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a003-20220926
ia64                             allmodconfig

clang tested configs:
riscv                randconfig-r042-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r041-20220926
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220926
i386                 randconfig-a012-20220926
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20220925
hexagon              randconfig-r045-20220925
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
hexagon                          alldefconfig
mips                      malta_kvm_defconfig
hexagon                             defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
