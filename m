Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4095ABC21
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Sep 2022 03:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiICBlj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 21:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiICBli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 21:41:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08BA32DB0
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 18:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662169297; x=1693705297;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eqZ3v80GbFuazN8oK4LQwHCOMzO38RMQr98mXML/888=;
  b=LhkiQSpH1pvZv34oDa30jgSU5ToitTl+WsREGcwdOZ6Agf9EivfM9iS2
   xOP8SL7AXJlGLPf8soIMRJo6w9Xzq3yaxjVDN0MBgTAmlU31G87VQ8E5y
   VGMEHa3Waj3L++Mz3Y/iFjqtksbK6D4lBn5oV7tH5/LXpc4ks8zkJQCGj
   uWdE6b8mylkii9XWMD0dDbBMkshbk6Z2l41kDComl7Ke/xBFosYQqkpTh
   9H2Jj8+uYEqjKkwgsMnRlET5XQLJ96s2Zlk1nQm6a84vHonvgov7H43kK
   FyhcGjovtKHa9G4siurL6NPMOcxfp/JP7CYY0//Ay1/JtGlnr3SQCIoxm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="294859617"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="294859617"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 18:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="564153898"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 18:41:35 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUIAB-0000ql-0k;
        Sat, 03 Sep 2022 01:41:35 +0000
Date:   Sat, 03 Sep 2022 09:40:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cac9a30c2d54cde55723b592346005941a139ded
Message-ID: <6312b099.7dWQomC7vC2R21Ar%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cac9a30c2d54cde55723b592346005941a139ded  Merge branch 'renesas-next' into renesas-devel

elapsed time: 723m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220901
x86_64                        randconfig-a013
x86_64                              defconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a014
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
i386                          randconfig-a012
x86_64                           allyesconfig
i386                          randconfig-a016
powerpc                          allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
s390                 randconfig-r044-20220901
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
