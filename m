Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B430063B5CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Nov 2022 00:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbiK1XYT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Nov 2022 18:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbiK1XYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2022 18:24:07 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3233A31368
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2022 15:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669677845; x=1701213845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yZt8dyGEr6mMSR4ILp77ydDdgJgcMslmtmSHIEZ49/0=;
  b=TSKezHWu/KOH1psmW0ahzXNyZd6kgB4i9EEgCFj6n7vTIx7ghWCxpCD5
   mvseQWshA/vYRHKU47ktq5xEuDuANhDB5wy0Q5wCwen56PJ1QcP47JsqR
   L5iY6em836IXchLPzovFIF+CpdpIm/rzqi6qA4wS+T9Hkc/TCzKj+7r9B
   WUzo2tFHxirIUU7eDpoYHYbOsxImzucXoPlZh12Zlswtl5BChenwTCTHh
   2ZNXg/9KAm/gV6Zb+DUz6XaKbjRR1+iB0KXpJ57O2S93gMCmPTHa/igHl
   eiVUwBCCGYPU9bJGtxKD+J3vNPd+oWH8fExipQ5+p6KOL4jbH1Igu5vWJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="341890166"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="341890166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 15:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674407441"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="674407441"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2022 15:24:03 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oznTm-0008OC-1j;
        Mon, 28 Nov 2022 23:24:02 +0000
Date:   Tue, 29 Nov 2022 07:23:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d3642cffc5e02c14ab4679f96ad21828235397e9
Message-ID: <6385430a.X6pdD+IFueZ+e3Ny%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d3642cffc5e02c14ab4679f96ad21828235397e9  Merge tag 'v6.1-rc7' into renesas-devel

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
i386                                defconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221128
i386                 randconfig-a004-20221128
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a005-20221128
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                 randconfig-a006-20221128
ia64                             allmodconfig
i386                             allyesconfig
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a006-20221128
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a014-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
