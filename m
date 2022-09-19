Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2BA5BC118
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 03:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiISBo7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 21:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiISBo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 21:44:58 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B1065AC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 18:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663551896; x=1695087896;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mVR3Bxn25SOyDV9GeV15cOCypFrMKvJnq5afddNqv6U=;
  b=lrA1VqJliex42SBna8G1WfejFn90SjEMzXa/3cBY30IwOBnrQWlrv/CQ
   lHV/zfQZXoyxlh2fsYlw22bvRjRffoKZQBYbpVbgWAJgtyVwC7LBg4vRL
   Btekq6BQnuNf6bUyKsrjcMts0odA8HDG7N/b0LxBs2PXbOolMG4u/H9ir
   9PunJF3a8go2eq/2MBPWtUahcXh0E0cNtvdsRDXeDAvz6DoELBPGyAv0e
   E4p8KKtMmWocWd8zmHgNwfgiQkPrRH2MUqYQSMuBG89N+B9rgYo4k3Lgo
   GSEbFnHTXpFevkUgP4tlJh5AXi/vQG3M+5qXUJSTk5sDJyTXT93ivuMca
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361022350"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="361022350"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 18:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="760681054"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2022 18:44:55 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oa5qA-0001cY-1X;
        Mon, 19 Sep 2022 01:44:54 +0000
Date:   Mon, 19 Sep 2022 09:44:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2bc6f193279ad1e5a19ed51d611229357b734c51
Message-ID: <6327c98a.qtEKKNnlqauXmIow%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2bc6f193279ad1e5a19ed51d611229357b734c51  Merge branch 'renesas-next' into renesas-devel

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220918
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                                defconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
i386                          randconfig-a014
i386                          randconfig-a003
i386                          randconfig-a012
powerpc                           allnoconfig
x86_64                        randconfig-a004
i386                          randconfig-a005
s390                                defconfig
x86_64                        randconfig-a002
powerpc                          allmodconfig
i386                          randconfig-a016
s390                             allmodconfig
sh                               allmodconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a006
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                             allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220918
hexagon              randconfig-r045-20220918
riscv                randconfig-r042-20220918
s390                 randconfig-r044-20220918
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
