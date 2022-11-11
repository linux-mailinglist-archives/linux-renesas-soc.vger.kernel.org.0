Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D236251A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 04:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbiKKD2Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 22:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiKKD1o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 22:27:44 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F14657EC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 19:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668137211; x=1699673211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h9xOxaB29siAJQHn6TAYZw6885d91J4fcvb3bDkLiFs=;
  b=U2Skym2bofaV+6zbhjbMYE7zvrS1XXF9ZRY2JxoqMpzaixEPTiCtbE0b
   On9tuX4nTTHqvJPSTLnfMVvLgz3HKy7P3ILKYy+f1Hs9gZrV1KMNgk5YQ
   cR9VGCB3kqOUWzmfxViZ+a2L2xfNVQXfhHyMCOA5YJ5HF4+LWKKgBcvYz
   AkfnnoHpU5p/PUzDJ3scc06c/YGXgxY14yNEcHGIZHJrOZwAFV6qgH3pO
   /JkaongJvg/X5RUyH5IHOiplIK2QD97dd3JcQSMUyjv5+7KPlf2y44qTH
   fjAB1C7Ji+lar4KZxIRFzUSiqmeL1onZoppBzCZHnk6euTyAF33GSih0Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397808285"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="397808285"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 19:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="882617484"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="882617484"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2022 19:26:50 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otKgr-0003WI-35;
        Fri, 11 Nov 2022 03:26:49 +0000
Date:   Fri, 11 Nov 2022 11:26:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1] BUILD
 SUCCESS 09872ef97118033965865b09a67c09a79585466a
Message-ID: <636dc0d1.RgJUJxDNVAUx96tM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-bsp-rebase-v6.1
branch HEAD: 09872ef97118033965865b09a67c09a79585466a  BSP rebase: Remove commits with identical one-line summary in older bsp and upstream alternative from periject tasks

elapsed time: 722m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
powerpc                    amigaone_defconfig
arc                        nsimosci_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
s390                             allyesconfig
powerpc                       ppc64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                               defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
sh                           se7724_defconfig
microblaze                          defconfig
parisc                           alldefconfig
arm                          pxa910_defconfig
sh                           se7722_defconfig
arm                         cm_x300_defconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
sh                   secureedge5410_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20221110
ia64                        generic_defconfig
openrisc                         alldefconfig
arm                             rpc_defconfig
m68k                          multi_defconfig
arc                         haps_hs_defconfig
powerpc                     taishan_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         vf610m4_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
s390                 randconfig-r044-20221111
arm                           viper_defconfig

clang tested configs:
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
s390                 randconfig-r044-20221110
riscv                randconfig-r042-20221110
x86_64                        randconfig-k001
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
arm                        vexpress_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
