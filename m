Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A945B57EAEC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 02:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbiGWA6P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 20:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiGWA6C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 20:58:02 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C521B48
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658537870; x=1690073870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qr0Vf2k6VOMmEluUYZXWoA/fnZBRsCPSWzPmZAtK0DY=;
  b=aWdxPXCr7mzxrTcW8WW67y2tTClHCT05AobfEjjY05GNpTvuCqg2cSVx
   NUI3yn54eld6MGCapr8BEDgsxrUShmCOqSgR4zdxTw+YxHXdDleDK3nWq
   VerIxHo6VLpk4JeEq5kCPiG8BU/eq/bZK39vCcYcaXr0o0CL/HjeFSLcx
   GwomTAVgvbYTT86s/DTCtzpEsW+GcomfY7i7kbCOLVa9CSIapBFCHC8XY
   5aIKT9V74VU34QRTsnlkhiHcHHg3flOcXix9fJqFJtRdPCp1Kh4VFQiVE
   QVSeCQ5HwU3OhwnLlUSyqcSOtaz5plGIZJbJbxEFEc8Sg+Z7/+IcdDSzf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="351427880"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="351427880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 17:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="844940465"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2022 17:57:48 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oF3Sl-0001zD-2W;
        Sat, 23 Jul 2022 00:57:47 +0000
Date:   Sat, 23 Jul 2022 08:57:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.21] BUILD SUCCESS
 01fe1e812b5c39f5e4dceabffb0b230077da76f4
Message-ID: <62db4769.o7WkQCqB5dpkntcr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.21
branch HEAD: 01fe1e812b5c39f5e4dceabffb0b230077da76f4  soc: renesas: Kconfig: Enable IRQC driver for RZ/G2L SoC

elapsed time: 791m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220722
sh                   sh7724_generic_defconfig
csky                                defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1b_defconfig
arc                        nsim_700_defconfig
sparc                       sparc64_defconfig
s390                             allmodconfig
m68k                       bvme6000_defconfig
m68k                          atari_defconfig
sh                          r7785rp_defconfig
m68k                                defconfig
powerpc                 mpc834x_itx_defconfig
m68k                             allyesconfig
arm                        realview_defconfig
sh                             sh03_defconfig
xtensa                           alldefconfig
powerpc                     sequoia_defconfig
sh                        apsh4ad0a_defconfig
csky                             alldefconfig
mips                           ip32_defconfig
arm                            xcep_defconfig
arm                           h5000_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
loongarch                           defconfig
m68k                            mac_defconfig
powerpc                       ppc64_defconfig
arm                          gemini_defconfig
powerpc                    amigaone_defconfig
arm                     eseries_pxa_defconfig
sh                        edosk7760_defconfig
sh                          rsk7203_defconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
arc                    vdk_hs38_smp_defconfig
alpha                               defconfig
parisc64                         alldefconfig
sparc                               defconfig
xtensa                           allyesconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
arc                                 defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                         allnoconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         s3c2410_defconfig
arm                          ixp4xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                         hackkit_defconfig
arm                  colibri_pxa300_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220721
s390                 randconfig-r044-20220721
hexagon              randconfig-r045-20220721
riscv                randconfig-r042-20220721

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
