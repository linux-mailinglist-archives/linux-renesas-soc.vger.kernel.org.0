Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88A162B29C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 06:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiKPFPh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 00:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKPFPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 00:15:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C052EF5E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 21:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668575734; x=1700111734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+zkCi46Wy55fzrIIXWbHgs/1tYMFM9VvoCQpO3QUHjU=;
  b=mywaA/DTjjoeKyuYsJOYyJJqvmGWVaXFkiGgqflADn4AMosNP6+tsHll
   EnhwaKzGlWnu8Yddh+EIAlMyRB0GrAHvC/xKrmCdSwcn+NVQ/x7FG3LdB
   DVnbEcrHCGELD+O0Rf974N9SuR14+XgAHZuRmov05mLUiag8xhylStC9P
   0G23lxpy/MC5R5edBlZ0iQn24Jd6SRsv4EF4L5dgKY/1x7nj+/UUGc6aw
   kvXfiYW9TFSR6PKIa7zYNbygjalxYs8DKuwfpZxBxO1ZDg2f/r8LPrNRJ
   NmhO2FFHA/FPxo0DaewohhV4BR5RkX0PKF5/tSKqZr04L0Q12kTtIqXe6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="299981752"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="299981752"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 21:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="781622065"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="781622065"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2022 21:15:32 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovAln-00022A-2w;
        Wed, 16 Nov 2022 05:15:31 +0000
Date:   Wed, 16 Nov 2022 13:14:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 2c980642d64882b4e373b0317dd7bd45c1c34d80
Message-ID: <637471c2.OgO4ITBYEWsM3kaF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 2c980642d64882b4e373b0317dd7bd45c1c34d80  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
arc                  randconfig-r043-20221115
x86_64                          rhel-8.3-func
arc                                 defconfig
i386                 randconfig-a001-20221114
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
i386                 randconfig-a004-20221114
alpha                               defconfig
i386                 randconfig-a002-20221114
i386                             allyesconfig
riscv                randconfig-r042-20221115
x86_64                               rhel-8.3
i386                 randconfig-a005-20221114
s390                 randconfig-r044-20221115
x86_64                           allyesconfig
s390                                defconfig
i386                 randconfig-a006-20221114
s390                             allyesconfig
i386                 randconfig-a003-20221114
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                        randconfig-a015
ia64                             allmodconfig
arm                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
mips                             allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r045-20221115
hexagon              randconfig-r041-20221115
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
