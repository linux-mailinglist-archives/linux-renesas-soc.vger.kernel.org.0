Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F22F5A6EBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 22:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiH3Uym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 16:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbiH3Uyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 16:54:41 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DBF8688C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661892879; x=1693428879;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9RCHVaH0ParL/Je4TNP1bPOlyb2zT3oE6sKS0GhKk6o=;
  b=i3Ai7Z6EYs2TK4FLW9Da6R5J+zlQSZfoI24R3FRkmqFlPRqmZE7MzMDo
   +lErf3Q7bfEa1KmhyWfJiGro4uPqc9pwYFHqWcsRPlrr15AZV723H09tN
   q2EI1Ddvzg64W7BN+0MqhTtheUazMjTTMuiGH0WnjIjW3Luu9VaziKues
   OZMNCt3oqW11olLj9lsgGzAzq08c/qVhMXSaYjdZ4e1Cq3D192bQqxaL+
   mfkh7kqcot5d63lUH8tKN2mnzWlV08fi+Ni9/yBDrQ/tp6v/RoFSwH04F
   Sv4lnhcIvOFU47KUL1MtoOVsW2mYtGmRP82BalpQIU4kGMATlW27W7F4y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296083155"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="296083155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 13:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="588774346"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 13:54:31 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT8Fj-0000bA-0B;
        Tue, 30 Aug 2022 20:54:31 +0000
Date:   Wed, 31 Aug 2022 04:54:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d561df8d9be01801dcab98bc7fed470db4967a94
Message-ID: <630e78ec.zwStyIoDYVEZuAs7%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d561df8d9be01801dcab98bc7fed470db4967a94  Merge branches 'renesas-arm-dt-for-v6.1' and 'renesas-dt-bindings-for-v6.1' into renesas-next

elapsed time: 721m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
x86_64                        randconfig-a006
i386                          randconfig-a016
arc                  randconfig-r043-20220830
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                                 defconfig
sh                            hp6xx_defconfig
arm                            pleb_defconfig
openrisc                       virt_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         lubbock_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
xtensa                          iss_defconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
arm                       imx_v6_v7_defconfig
mips                           jazz_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     asp8347_defconfig
sh                           se7619_defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
ia64                             allmodconfig
sparc                               defconfig
mips                      loongson3_defconfig
m68k                       m5475evb_defconfig
xtensa                  nommu_kc705_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
powerpc                       eiger_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                      integrator_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
nios2                            alldefconfig
openrisc                  or1klitex_defconfig
sparc                             allnoconfig
sh                           se7721_defconfig
sh                        edosk7760_defconfig
m68k                            mac_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
s390                 randconfig-r044-20220830
hexagon              randconfig-r041-20220830
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                          pcm027_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
