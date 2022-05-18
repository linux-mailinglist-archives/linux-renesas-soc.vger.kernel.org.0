Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7BC52B78A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 12:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbiERKHi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 06:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbiERKHe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 06:07:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F12D15352A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652868452; x=1684404452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7POCe8Iy/H0BUUJvGBee+Zo8/syRXeBuRN3ScDLxilg=;
  b=ChtJ3nf2H2mtop2KpA+mRQBREo3nNnbhTEHrOseyQLRlELhGPopPHQ7j
   jAyvApgti+cCi5nz6zbpNI7rcKvxggzF84Emq/8IxfEKPWFLOuIhwzvV+
   hSc4/Km6p2TyQBiYrRjsv0bidS6TI/4p7tvU53pexoA4K7RD21+2jzhHG
   P5Ih29wOAd0/C7Yo0xs+Nu4710YJLSnejObbHfbAHeM9IgyXSj0Rqux2I
   cHmrzlUTzsWKQc4SHFydydQLzMwatQoLsL1PfvQ6SKzARoFzvJnhROJEk
   UvAZXb1Me3XeLovkxVrteNXX6dnGfoMtYLfAgf5w8gvCbkUplCTV/+qEa
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="332211071"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="332211071"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 03:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="639190932"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 May 2022 03:07:29 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nrGaW-00022z-OB;
        Wed, 18 May 2022 10:07:28 +0000
Date:   Wed, 18 May 2022 18:06:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.20] BUILD SUCCESS
 e8ae4b9eb9452029ce644466cc1190e76b14beac
Message-ID: <6284c53d.cOyay2+vZ4lYVbmz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.20
branch HEAD: e8ae4b9eb9452029ce644466cc1190e76b14beac  pinctrl: renesas: rzg2l: Return -EINVAL for pins which have input disabled

elapsed time: 1495m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220516
m68k                        m5407c3_defconfig
m68k                             allmodconfig
arm                        multi_v7_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
arm                      jornada720_defconfig
sparc                       sparc64_defconfig
mips                            ar7_defconfig
s390                             allyesconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
arm                           h5000_defconfig
sh                           se7724_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                       m5208evb_defconfig
sh                             sh03_defconfig
sh                ecovec24-romimage_defconfig
sh                          r7780mp_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
mips                            gpr_defconfig
m68k                       bvme6000_defconfig
sh                        sh7785lcr_defconfig
sh                               j2_defconfig
mips                           ci20_defconfig
openrisc                            defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220516
x86_64               randconfig-c001-20220516
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a012-20220516
x86_64               randconfig-a016-20220516
x86_64               randconfig-a011-20220516
x86_64               randconfig-a014-20220516
x86_64               randconfig-a013-20220516
x86_64               randconfig-a015-20220516
i386                 randconfig-a011-20220516
i386                 randconfig-a013-20220516
i386                 randconfig-a012-20220516
i386                 randconfig-a016-20220516
i386                 randconfig-a014-20220516
i386                 randconfig-a015-20220516
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220516
s390                 randconfig-r044-20220516
riscv                randconfig-r042-20220516
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220516
riscv                randconfig-c006-20220516
mips                 randconfig-c004-20220516
arm                  randconfig-c002-20220516
x86_64               randconfig-c007-20220516
i386                 randconfig-c001-20220516
powerpc              randconfig-c003-20220518
x86_64                        randconfig-c007
riscv                randconfig-c006-20220518
mips                 randconfig-c004-20220518
i386                          randconfig-c001
arm                  randconfig-c002-20220518
s390                 randconfig-c005-20220516
powerpc                     pseries_defconfig
mips                         tb0287_defconfig
powerpc                      ppc44x_defconfig
powerpc                    mvme5100_defconfig
arm                     davinci_all_defconfig
arm                       mainstone_defconfig
arm                          pxa168_defconfig
arm                        magician_defconfig
arm                        mvebu_v5_defconfig
powerpc                     tqm5200_defconfig
x86_64               randconfig-a001-20220516
x86_64               randconfig-a006-20220516
x86_64               randconfig-a003-20220516
x86_64               randconfig-a005-20220516
x86_64               randconfig-a002-20220516
x86_64               randconfig-a004-20220516
i386                 randconfig-a003-20220516
i386                 randconfig-a001-20220516
i386                 randconfig-a004-20220516
i386                 randconfig-a006-20220516
i386                 randconfig-a002-20220516
i386                 randconfig-a005-20220516
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220516
hexagon              randconfig-r041-20220516

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
