Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C2C5B433E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Sep 2022 01:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIIXyR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 19:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiIIXyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 19:54:17 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7C611B013
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662767656; x=1694303656;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eiPuN/kXJiLqwqkrtvN4AFVMhgWo4I0mQGXQG2hMuWY=;
  b=mkd65GnPQLRITi1qOrRqsxU/FC4pIUbLkrlOqO3hRxAaYaas3doigM+0
   Opoawgl+ki+W9CBuh6LhXZROuTwCipgzYmS6cDKcx+qkijpiTYZjUurH8
   7R2svxEC9WUL12A2+nUwE08DQqoXYiNn3RaQvZ3YMkiENTsp8p4iLszEI
   Jm+D6EmLR6qmOO4h1s5azjvvRQkg/FHQCktE9eTZ/Zls8Pij2txpZ5Zcm
   25reLB74FdJJ8+wOTncm7BucpZ736XBxttAn7J9WzQV1WOqmhuJQv224g
   uTfOVaqvDQzKPoWqvQkhzX/RoMLvY3Xiede5nR0hkptSzVmskASpxSKFU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295175689"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="295175689"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 16:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="683813570"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 16:54:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWnp8-0001sf-0L;
        Fri, 09 Sep 2022 23:54:14 +0000
Date:   Sat, 10 Sep 2022 07:53:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 5b8adc815b80eb66d1a028ec7ce0d56ce6c7a81a
Message-ID: <631bd215.3Gzrlfd9QoTXY86v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: 5b8adc815b80eb66d1a028ec7ce0d56ce6c7a81a  ARM: dts: r9a06g032-rzn1d400-db: Enable CAN1

elapsed time: 740m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allmodconfig
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220907
x86_64                           rhel-8.3-syz
loongarch                           defconfig
loongarch                         allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
x86_64                        randconfig-a006
csky                              allnoconfig
arc                               allnoconfig
x86_64                        randconfig-a004
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
sh                             shx3_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                            ar7_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
arm                           sunxi_defconfig
sh                        dreamcast_defconfig
arm                            zeus_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                        sh7763rdp_defconfig
xtensa                           allyesconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
i386                          randconfig-a016
x86_64                        randconfig-a002
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
alpha                             allnoconfig
riscv                             allnoconfig
arm                        clps711x_defconfig
sh                         ecovec24_defconfig
riscv                            allmodconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20220907
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-k001
powerpc                          allmodconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
