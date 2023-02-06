Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053E268C915
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Feb 2023 23:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjBFWFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Feb 2023 17:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBFWFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2023 17:05:18 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D840C2FCE5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Feb 2023 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675721117; x=1707257117;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7vZMdhRwpVeQ0t5YRyv832wWuKzddqAx3oBlB4GHx9Y=;
  b=DtF7mQcE8Cpt3tG0ZuOMMiOppublI3T7Ps5xg9RKfRzKUrKmGIFSPC7d
   c7/P0/FWKrcpLW4gJTybTOapKJDMRQh32cAcUbZ0vF7gskg998Z1pLcTt
   xDQRU11bgk1xU4EeG4qiOFutH+bpGTwhdCY4p+emKVsUyLwVwDuZ1a7ys
   Wdv8zXExuTp8iDP80NaSlYzKtuweUkZrJ8ec4CBSjvmaAXOr6zlf70G4U
   tfSXmk+aLwpHxvOLyb+rJcn6B4fnDPunGVjFwnUEmBajNIdhaeEw6Nh/x
   cFrwrCJN/fLM25j3SrtrJx1wKLluO6eUFZsYOMlihEcDaz0nKair8tANc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331462249"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="331462249"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 14:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644208045"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="644208045"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 14:05:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pP9bv-0002od-1K;
        Mon, 06 Feb 2023 22:05:15 +0000
Date:   Tue, 07 Feb 2023 06:04:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 3254c086a1ff58a54773d12eb58e0210601e352f
Message-ID: <63e17968.9ETvA9dByAdhiOvv%lkp@intel.com>
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
branch HEAD: 3254c086a1ff58a54773d12eb58e0210601e352f  Merge tag 'v6.2-rc7' into renesas-devel

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a011-20230206
s390                                defconfig
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                           allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64               randconfig-a014-20230206
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
s390                 randconfig-r044-20230206
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
x86_64               randconfig-a015-20230206
x86_64               randconfig-a012-20230206
riscv                randconfig-r042-20230206
x86_64               randconfig-a016-20230206
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a005-20230206
i386                 randconfig-a006-20230206
hexagon              randconfig-r041-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
x86_64               randconfig-a001-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
riscv                randconfig-r042-20230205
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
