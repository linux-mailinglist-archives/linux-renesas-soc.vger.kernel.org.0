Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7245EB489
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 00:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiIZW2S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 18:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiIZW2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 18:28:16 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6549019F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664231294; x=1695767294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TSHqBLwKeigBptXIhJ1uXSVCPjahxDXV/nAu5TGcX48=;
  b=fbPtAmGD76RAvCKO1wgRlPSKX2VuMO+m6cyA3evzQFTfwZUDWviwxEkx
   HeDlTKOOrYD1cv0R6z818i+V3beIgj1X8KirfCHmeZwTdgIGZes0bX/B1
   6w1cxCLvKgnwQAe++CwN+ZRL13XErrN4sA2Sefn84SSI/ZkzZN4/0xCQc
   knB7BN6IuEgYo5Poauk89KMRuZHb3xSgm+mzWxSm/uFlgNOLVIwOwY6oQ
   69Cbii5NaPJJxpgb8QOFfAvnMoX09qXADtX/Z/mTDUVzgKTYMaHKhvNba
   MLZ7L2sSuNMJxyiC8wmw6X0EqbjHpW1eBcvRGiNQcms6RS5XdaWWUetux
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365192332"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="365192332"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 15:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763629134"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="763629134"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2022 15:28:13 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocwaC-0000J3-1I;
        Mon, 26 Sep 2022 22:28:12 +0000
Date:   Tue, 27 Sep 2022 06:27:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 4c909b45b32fef2ef81bae88dd621c68232094ba
Message-ID: <6332274c.Cvm1GqRGmLLbwsjQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 4c909b45b32fef2ef81bae88dd621c68232094ba  arm64: renesas: defconfig: Enable AT24 I2C EEPROM support

elapsed time: 722m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                              defconfig
s390                             allyesconfig
arm                                 defconfig
arc                  randconfig-r043-20220925
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20220925
x86_64                               rhel-8.3
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
x86_64               randconfig-a002-20220926
m68k                             allmodconfig
i386                 randconfig-a001-20220926
x86_64               randconfig-a001-20220926
arc                              allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a003-20220926
alpha                            allyesconfig
arm                              allyesconfig
x86_64               randconfig-a004-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
arm64                            allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a006-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
x86_64               randconfig-a005-20220926
i386                 randconfig-a003-20220926
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a011-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
i386                 randconfig-a013-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
