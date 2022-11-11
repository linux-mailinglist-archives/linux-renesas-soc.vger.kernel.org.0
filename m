Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CEB6252D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 05:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbiKKEu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 23:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiKKEu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 23:50:56 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA0018B21
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 20:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668142255; x=1699678255;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xqkGyaenw0hfT3dsIFKrg5kgUacX//LqDu4hl6Q0rOA=;
  b=k577kVyBU+Pg4I56FESrRss5Jo5fSFiOWq3wU7Gtdxln+Bw5NC1B71Lw
   gtI3HEg+EtQ//aPhanssH5OqL4wqqFRkR1CAzdezJKSqCAZd3SzSZqWSo
   cQZCwLzxyOrK4FhcG0a/VMNYJP8LY4BdHHYrI9w4T/DBKfw422/ggpSFP
   SRQGGunAE9Iu1D3XKYi3RsRn/4kWDBNZmhlXZ1jmQcgdEl5UhXd+RG6mv
   CLCMvG8FqNPgL2aGJRMmoz4js+K2zXLlErge+5Hdsov4+N+y/MVQKpDR4
   J9LVmIGGfSx6JoLRE/Wj6kesv/B26h9FdNrZzqL7wLjOpYHOSRZ5MUNou
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291245842"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="291245842"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="743153246"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="743153246"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2022 20:50:54 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otM0D-0003aq-1g;
        Fri, 11 Nov 2022 04:50:53 +0000
Date:   Fri, 11 Nov 2022 12:50:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.2] BUILD SUCCESS
 9f643dc28e2c072d7d323898530ee37433e74595
Message-ID: <636dd49a.FPHRYdyV8JzIXU4r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.2
branch HEAD: 9f643dc28e2c072d7d323898530ee37433e74595  dt-bindings: riscv: Add Andes AX45MP core to the list

elapsed time: 725m

configs tested: 85
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
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                             allyesconfig
arc                              allyesconfig
sh                   secureedge5410_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                        generic_defconfig
openrisc                         alldefconfig
i386                          randconfig-c001
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
powerpc                     taishan_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         vf610m4_defconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
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
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
