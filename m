Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6C959097E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Aug 2022 02:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234978AbiHLASS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 20:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiHLASR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 20:18:17 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF34A0325
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 17:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660263497; x=1691799497;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AnPgWzzXNxlvx3IfAl4HgHxINT+gdGdjoLZaMPfGYqI=;
  b=ablXabaqiAxSUIDqoOVZN+HrarK648+sSJDlyjhV2CFspU9VSxVaRG/U
   3Tq1Mw+qCXfFUAROeQmKfNZ6nsOD+tmXtEdPV1sBlacWunCH2l9Eu3DtZ
   LCBa+C+R9ezi7IOPRY9SRWO50FvOYfG0fYkdF68moA8t43xf1LjS9mVSO
   P5ZoFCd+sva+e2pnBdmRP3GFQ63erhS6+Mbq5lepxeKL7WkDxVwxU1lSW
   MOVRNmuPUEFYZq44Is4FzQ8eZCBhOHNC6zE1jNt+Hy1+CAUxJmLRdakZn
   LH7fPTX3NR2kqO94TXm/Yegf7P4baTLkg2He0Sj30TxbMeeghhiqVmtPy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="353232013"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="353232013"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 17:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="673900703"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2022 17:18:15 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oMINS-0000rF-2e;
        Fri, 12 Aug 2022 00:18:14 +0000
Date:   Fri, 12 Aug 2022 08:17:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 afa6e8225571047286d61812f393c879ef344b1d
Message-ID: <62f59c0b.as/XBG/m7Ryzjb0O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: afa6e8225571047286d61812f393c879ef344b1d  Merge tag 'v5.19' into renesas-devel

elapsed time: 718m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20220811
i386                          randconfig-a016
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
i386                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
x86_64                           allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                               rhel-8.3
x86_64                        randconfig-a011
ia64                             allmodconfig
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005

clang tested configs:
hexagon              randconfig-r045-20220811
i386                          randconfig-a011
hexagon              randconfig-r041-20220811
s390                 randconfig-r044-20220811
i386                          randconfig-a013
riscv                randconfig-r042-20220811
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
