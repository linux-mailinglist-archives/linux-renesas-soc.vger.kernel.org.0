Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68189611F18
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Oct 2022 03:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJ2Bap (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 21:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJ2Bao (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 21:30:44 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB0713640A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 18:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667007042; x=1698543042;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3XhHbvxEvWXH3U7+oYhPkJS5V3y2CZqZpA/pvMIct4c=;
  b=NunB306HOISG/u2D8lzl9ojhLHsb+jFP7e2/912W+lw+/DxGL38QA6H3
   XX2TgU/tt4iew/u9K/YLwzZIvMMMRImlMocnfH8KfT4Kx0uqGGftCdVzu
   fpi9DAzsTuWiZgOFm5cB3MRWcvvbSQM1M0jLEwgfbqzD/oFmD6OmboyrH
   1TOOoPSEsIFLPSGTTqJpc6hEQu5RQpVTOi++famezezSNUtZiKhzrmW4b
   WVvKYY7X4XylGpsm5M400ExKB1T7SCIpFSWIGw2+upvwi+w4PkO77ui77
   U6BO9P/8m8P9wrFK9uac21yapxg1X0+md3MSifRyRsFCibONMbT1f8Mrg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372837132"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="372837132"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 18:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="738331688"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="738331688"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2022 18:30:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooagI-000APx-2W;
        Sat, 29 Oct 2022 01:30:38 +0000
Date:   Sat, 29 Oct 2022 09:29:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.2] BUILD SUCCESS
 7dd1d57c052e88f98b9e9145461b13bca019d108
Message-ID: <635c820e.Dfp8Fr1h61bjLU5e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.2
branch HEAD: 7dd1d57c052e88f98b9e9145461b13bca019d108  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC

elapsed time: 725m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                                defconfig
alpha                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                              defconfig
arc                  randconfig-r043-20221026
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
s390                 randconfig-r044-20221026
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221029
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20221028
s390                 randconfig-r044-20221028
riscv                randconfig-r042-20221028
i386                          randconfig-c001
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
sparc                            allyesconfig
powerpc                    sam440ep_defconfig
mips                           xway_defconfig
arc                      axs103_smp_defconfig
powerpc                      ep88xc_defconfig
powerpc                       ppc64_defconfig
powerpc                      makalu_defconfig
arm                           u8500_defconfig
arm                         lpc18xx_defconfig
arm                      jornada720_defconfig
sh                   sh7724_generic_defconfig
m68k                           sun3_defconfig
m68k                        mvme147_defconfig
powerpc                     asp8347_defconfig
csky                             alldefconfig
m68k                        mvme16x_defconfig
powerpc                 canyonlands_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20221029
arm64                               defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
riscv                randconfig-r042-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
s390                 randconfig-r044-20221029
x86_64                        randconfig-k001
mips                           rs90_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
