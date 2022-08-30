Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98C75A6EBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 22:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbiH3Uyn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 16:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiH3Uyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 16:54:41 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90248673C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661892878; x=1693428878;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0o3bWTSmdGuP+V2u1k0DaEDdS98BCNteVJHWBUeIfII=;
  b=A9uXo676JbKV5C+hPQXnO2poUmvlz8fAO2o1A4SRf75gGDrc6uSA8NDf
   1OQb0fAy3PU42SCrlQkR7rzTKGRQ0mouqi/9AXpj0st30WXMM1soKIsjC
   e3bXfKE73iHy+ShaNAuyumFGyyIfUhTlM22nNP2+D7IB+OfDOvW32dFti
   FF6OxUgUbmIn1belbCEh7KUQSakLxrHZ6Wpd56l+QDB8LvOe67Jq5dVTv
   aZGLYs8Gv1lT3emeI9oTSmccSdtfuIpuMsrIFn+H5zHu1OLXuZQOo1aEl
   TcFjKkHxhunEeYxwo9EzyOloO68FwS7mv98IvrrIHisZAf0ozXu51nMHx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296083154"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="296083154"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 13:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="588774345"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 13:54:31 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT8Fj-0000b5-06;
        Tue, 30 Aug 2022 20:54:31 +0000
Date:   Wed, 31 Aug 2022 04:54:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 87c1cb103bc6896ad3e45e0cc1417b57696d733a
Message-ID: <630e78ee.xHB95SzY3N+xTaKf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 87c1cb103bc6896ad3e45e0cc1417b57696d733a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 722m

configs tested: 72
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
powerpc                           allnoconfig
arm                                 defconfig
i386                          randconfig-a012
arc                  randconfig-r043-20220830
x86_64                        randconfig-a013
x86_64                              defconfig
x86_64                        randconfig-a011
i386                          randconfig-a016
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                        randconfig-a002
i386                                defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
arc                          axs101_defconfig
arm                         lubbock_defconfig
xtensa                          iss_defconfig
arc                           tb10x_defconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
arc                 nsimosci_hs_smp_defconfig
mips                        bcm47xx_defconfig
powerpc                       eiger_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20220830
i386                          randconfig-a011
riscv                randconfig-r042-20220830
i386                          randconfig-a006
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220830
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a015
s390                 randconfig-r044-20220830
x86_64                        randconfig-a003
x86_64                        randconfig-a005
arm                      tct_hammer_defconfig
powerpc                     pseries_defconfig
arm                            dove_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    mvme5100_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8560_defconfig
mips                     loongson2k_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
