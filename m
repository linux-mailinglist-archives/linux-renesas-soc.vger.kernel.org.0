Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B871664E23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 22:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjAJVj4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 16:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjAJVjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 16:39:53 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3110B15
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 13:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386792; x=1704922792;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OEscZ9sboUp8qG1t6mnhhbcJKvMWJwfAkVl9VZuDmk8=;
  b=RFzo8IUg0wT0ftOF12FHNpEWU2zbx6PfNpIBxw+tLX5TbOAlAxqRH7wy
   UsRAzwimHHrK1IJBRVD3tSM9/zDsvUShhqeKOi7uoA0WoDzuY6z4pdBKl
   dbxSThA+F2TWfm4NvhmixM2ykJoPsLuvsEDtZqD2sIB2mwrNwBEO+kNe7
   rHuDMYdjcyf92i2sgev6IxB+GPei0rYqjs2uB3oDVB75Rm/+uwdvlZB1o
   VCx55oTmgTXY09j69J9Fy+52M55Y6su5yHIDuLSyECLE99M6+eH8vlAZI
   pspHiS1ShlJB28StP2kQGAra8eoyeTIrcC1U1O7WahmmicxdpL2sycuQ8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="387724021"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="387724021"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="634726652"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="634726652"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Jan 2023 13:39:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMLW-0008OI-1P;
        Tue, 10 Jan 2023 21:39:50 +0000
Date:   Wed, 11 Jan 2023 05:38:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b4d3a57fa805134a8040362d9c1f5015fd7d0866
Message-ID: <63bddaf1.ev2oKu0UJVPJCtuk%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b4d3a57fa805134a8040362d9c1f5015fd7d0866  Merge branches 'renesas-arm-defconfig-for-v6.3', 'renesas-drivers-for-v6.3' and 'renesas-dts-for-v6.3' into renesas-next

elapsed time: 721m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
m68k                             allmodconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
ia64                             allmodconfig
s390                                defconfig
x86_64                              defconfig
x86_64               randconfig-a011-20230109
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64               randconfig-a013-20230109
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20230109
x86_64                               rhel-8.3
x86_64               randconfig-a014-20230109
x86_64                           allyesconfig
m68k                             allyesconfig
s390                             allyesconfig
i386                 randconfig-a011-20230109
sh                               allmodconfig
alpha                            allyesconfig
x86_64               randconfig-a016-20230109
x86_64               randconfig-a015-20230109
i386                 randconfig-a013-20230109
i386                 randconfig-a012-20230109
arc                              allyesconfig
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a015-20230109
arm                                 defconfig
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a003-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a001-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a006-20230109
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a006-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a005-20230109
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                          rv32_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
