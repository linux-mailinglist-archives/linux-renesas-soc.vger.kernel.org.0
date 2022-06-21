Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACC6553CD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jun 2022 23:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356047AbiFUVHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jun 2022 17:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355821AbiFUVHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 17:07:09 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1F736164
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2022 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655844879; x=1687380879;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/5ifeJa/TfRSoD5lAXTR/+E+MeFrkS25zlBYMGUKHvA=;
  b=igGIl3ccREck1YDeVXfFM7A0q0nYUA+wMXxNJNWqpyeMcPHi6QwZXIH4
   3IDU972a67lQoxGyIGsizgG4f9SKfAQAr9GuN048+HqKy+bp/Yi7CROjo
   rACYFFBTvOlQvqueJOekt3JBuu4TadMshugmnWmGqEO/UrnoAP4cc428I
   PIbYwOKgOeXiVXGD6mY+OX3kEWPcB9lLH+U0BHgGVonXtDZfCOT2YHYfG
   cAKkee1KOHd47/sgZqH+4BlFCOZEmjF7KkpxstNbfUCjXk2dE7VT9dprr
   2i1YlevLPUpKAVPyFr7MvVDPCECFYJzsw8S8y9kyrkfiERLZOi1Gt7/AL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="268952881"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="268952881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 13:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="655318556"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2022 13:54:14 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3kt3-0000QD-Vw;
        Tue, 21 Jun 2022 20:54:13 +0000
Date:   Wed, 22 Jun 2022 04:53:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ebde835d00b25f6852cef819b7b8c96e07c709b5
Message-ID: <62b22fdc.WOE2W0f6knN9aiBj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ebde835d00b25f6852cef819b7b8c96e07c709b5  Merge tag 'v5.19-rc3' into renesas-devel

elapsed time: 970m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                       m5249evb_defconfig
ia64                         bigsur_defconfig
openrisc                 simple_smp_defconfig
ia64                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
arc                  randconfig-r043-20220619
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
s390                 randconfig-r044-20220619
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
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
arm                       cns3420vb_defconfig
s390                             alldefconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a016-20220620
x86_64               randconfig-a014-20220620
x86_64               randconfig-a015-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a013-20220620
i386                 randconfig-a011-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a015-20220620
hexagon              randconfig-r045-20220619
hexagon              randconfig-r045-20220620
riscv                randconfig-r042-20220620
hexagon              randconfig-r041-20220619
hexagon              randconfig-r041-20220620
s390                 randconfig-r044-20220620

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
