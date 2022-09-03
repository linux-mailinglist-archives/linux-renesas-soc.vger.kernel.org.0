Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A135ABD4C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Sep 2022 07:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiICF45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Sep 2022 01:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiICF4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Sep 2022 01:56:55 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804CC22BCB
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662184614; x=1693720614;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6wXkW8oNLRfJXyB5J9ck32zjxbm/CxV93cE8QmJDo4=;
  b=fNh0HIW/t6n8zxcyfU5+zog2LFjeD7Oiz/dmqtB5pt6LF+Mxt/IoT+xM
   o3cpUqwSKXhf2ZZyI25J+NlbUP/Mob3IaL4/EHKt/xKNSu9MfEnowc+Bn
   oy0bMbKjV3DF4+7/LI2I7siBrgqm4Ha0DABajBb+JIWrSZ1KjlHG1MRhN
   B5Qc7PaFlshz6OmMtcQQdsQ3QfYV9C0+ppCL8ydfvGwGc7Vb0Z2ErHjWq
   EvBCfn7mlRLzpBsFrD5Iz013meZ4Ek4KmkB7O3RRW3FhRVZ8fMTHiJO3D
   h2zuxYmAXF057RR2yN6xqfoUxFKsj2jDVSXm5p98ZY4zEuZEN2zPfDxYy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="357848583"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="357848583"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 22:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="643192011"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2022 22:56:53 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUM9E-00019L-1E;
        Sat, 03 Sep 2022 05:56:52 +0000
Date:   Sat, 03 Sep 2022 13:56:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 cb6f1733f0abb13b5b63d0e680e7762e40385009
Message-ID: <6312ec77.Ibh8snUO+ufvVkK6%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: cb6f1733f0abb13b5b63d0e680e7762e40385009  Merge branches 'renesas-arm-defconfig-for-v6.1', 'renesas-arm-dt-for-v6.1', 'renesas-drivers-for-v6.1' and 'renesas-dt-bindings-for-v6.1' into renesas-next

elapsed time: 977m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
i386                                defconfig
x86_64                              defconfig
x86_64                        randconfig-a013
i386                          randconfig-a001
arc                  randconfig-r043-20220901
x86_64                               rhel-8.3
x86_64                        randconfig-a002
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a014
i386                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
x86_64                        randconfig-a006
i386                          randconfig-a005
i386                          randconfig-a016
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220901
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a011
hexagon              randconfig-r041-20220901
riscv                randconfig-r042-20220901
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
s390                 randconfig-r044-20220901
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
