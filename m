Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1125967F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Aug 2022 06:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiHQESO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Aug 2022 00:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiHQESN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Aug 2022 00:18:13 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683AEE0A0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 21:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660709892; x=1692245892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LulK2zd+PECPiwqg7QTWUB6xiPzqvsBeRC/7PLopDb8=;
  b=aejt/PAkZpItDE339NAwxSwpkAkwQ+m0bqQDxCnrevAkt2xBMgjcaAK9
   6B+lAyDoT5ok9gO8Tm6OGiaNzGw38HKPkUGVPo4qJivHXtEAy9vOJKQo2
   86B49pIkF+IO3egUXfrS9pyDo8nL3sKXChsvTcOehLi0ttBCXA33UpIm4
   /E0enJPEdaCZ2gEjqx6yjom+Z8M6ojA6EAfC/7DeMQVsmbY5dMOJrGvfl
   K3xRpUmVAuByym3uNvfw/Ok3ELCOQ/JMJlONk8ihVD/SOYZDYMMacMOnR
   e9k/4vBJtgdHHHhc7Q3iD1T/hgCHiKlYU9hlvROxuxnYqYR2WXRGSqIr3
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292391579"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="292391579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 21:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="636197289"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2022 21:18:10 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOAVO-0000ZF-0P;
        Wed, 17 Aug 2022 04:18:10 +0000
Date:   Wed, 17 Aug 2022 12:17:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.0-rc1] BUILD
 SUCCESS 355d63ff9237fa455ebef2a763fada6ac1365402
Message-ID: <62fc6be5.XUkWkVfnEHZpurnu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.0-rc1
branch HEAD: 355d63ff9237fa455ebef2a763fada6ac1365402  ARM: dts: koelsch: Add overlay for keyboard-controlled LED

elapsed time: 727m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220815
arc                  randconfig-r043-20220816
i386                                defconfig
s390                 randconfig-r044-20220816
i386                 randconfig-a003-20220815
riscv                randconfig-r042-20220816
i386                 randconfig-a004-20220815
i386                 randconfig-a005-20220815
i386                 randconfig-a002-20220815
m68k                             allmodconfig
i386                 randconfig-a001-20220815
alpha                            allyesconfig
i386                 randconfig-a006-20220815
m68k                             allyesconfig
arc                              allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                        nsimosci_defconfig
m68k                          atari_defconfig
sh                        dreamcast_defconfig
sh                            migor_defconfig
arm64                            allyesconfig
x86_64                        randconfig-a006
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-a001-20220815
x86_64               randconfig-a006-20220815
x86_64               randconfig-a003-20220815
x86_64               randconfig-a005-20220815
x86_64               randconfig-a004-20220815
x86_64               randconfig-a002-20220815
powerpc              randconfig-c003-20220815
i386                 randconfig-c001-20220815
sh                           se7343_defconfig
m68k                                defconfig
powerpc                 mpc837x_rdb_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                         lubbock_defconfig
csky                                defconfig
arm                         vf610m4_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      cm5200_defconfig
ia64                            zx1_defconfig
xtensa                  audio_kc705_defconfig
um                                  defconfig
xtensa                generic_kc705_defconfig
mips                  maltasmvp_eva_defconfig
sh                        sh7757lcr_defconfig
mips                            gpr_defconfig
m68k                        m5407c3_defconfig
sparc                       sparc32_defconfig
m68k                       m5275evb_defconfig
sh                   sh7770_generic_defconfig
parisc                           allyesconfig
powerpc                         wii_defconfig
sh                          landisk_defconfig
parisc64                         alldefconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r041-20220815
hexagon              randconfig-r041-20220816
hexagon              randconfig-r045-20220815
hexagon              randconfig-r045-20220816
s390                 randconfig-r044-20220815
riscv                randconfig-r042-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a013-20220815
x86_64               randconfig-a013-20220815
i386                 randconfig-a014-20220815
x86_64               randconfig-a012-20220815
x86_64               randconfig-a011-20220815
i386                 randconfig-a015-20220815
x86_64               randconfig-a014-20220815
i386                 randconfig-a016-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a016-20220815
x86_64                        randconfig-a005
x86_64                        randconfig-a001
powerpc                      ppc64e_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a003
arm                       imx_v4_v5_defconfig
mips                           mtx1_defconfig
powerpc                     kilauea_defconfig
s390                             alldefconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
arm64                            allyesconfig
powerpc                      pmac32_defconfig
x86_64               randconfig-k001-20220815

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
