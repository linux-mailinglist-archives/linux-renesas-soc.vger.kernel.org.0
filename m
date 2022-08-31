Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6F5A73A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 03:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiHaB4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 21:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiHaB4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 21:56:51 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A61B2D84
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661911006; x=1693447006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EfGZa+8AKFQ327aR/vbiYjxp8+roNoH111YeeaxY9Wo=;
  b=QRSibEl77+wrM6BTCTBXeFVnuI222WhzplrTmQBtQml+LpMJEjtUFIjk
   0UrQGOSE/cdZwE7qZyqSLXmCtGQLkvYOPqdflLTfLXVwIwWU+WypJPkFs
   jsqxM3+gIEScfEcReK2LlSfPPhWwRh3PShdWLxsh4/BWWdE3bl9kV+hSv
   0ZjVRn4xJ2okN9TWBDnrfFhubAmfafl4Ez+ssKflVP57npqwa/MjXOLU1
   MlQnASuoFxlK2gN9Dpv7V51Pwb93qlP7cxaOv9DG1UhmXBlAH8UdjlPvV
   tqR6eU5m/rPtGkTwjupBFUefJWMGv2lCHYBdYCyircRMkjHCijpYBgUsi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275097957"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="275097957"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 18:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="940268506"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 18:56:44 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTCyC-0000r1-18;
        Wed, 31 Aug 2022 01:56:44 +0000
Date:   Wed, 31 Aug 2022 09:56:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 2cdb553d9cd01571671c2145701393db38295780
Message-ID: <630ebfcd.OK6kytvSZSZr2fKw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 2cdb553d9cd01571671c2145701393db38295780  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 726m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20220830
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a006
alpha                            allyesconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
x86_64                          rhel-8.3-func
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
m68k                        mvme16x_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                        nsimosci_defconfig
sparc                            alldefconfig

clang tested configs:
riscv                randconfig-r042-20220830
hexagon              randconfig-r045-20220830
s390                 randconfig-r044-20220830
hexagon              randconfig-r041-20220830
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
