Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CA75BC11A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 03:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiISBpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 21:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiISBo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 21:44:59 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC676597
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663551898; x=1695087898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0tkVy1lK7yT0oeRJtAHnBfWRaFxugJd4LEudSTJvqLo=;
  b=C3mUtUaNUIpMvJZgz8pAxv3Y+KBa0Qyy6SZQmgYlvRPWUtnJuX//R51N
   Z35p4En3384OcO2JmT9I9nX6OJK+nRHYpe5cOPR/hG2fH1IXxVO/17mX4
   bAGL7BW/DAp+0jl+C0Su+Rb9xERZay3u8V7CXT1l/3LKPkIdRKj8ieF8r
   f7yPj3dxvzum761NKjoEBcBI3nVr/iOZ3MrzJY+Jv498dpB/4TbAfwOo2
   noNFDTigBm3wm4a3VN6VNuMFpCbpkSORW9izoi8kStp5ZbX41UkXTC3OM
   ajWlrL6jMVlhIc4lLcD0U/FX8/12xq84j4nCBa4P/sl1N0M2KAqvgaYe9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361022351"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="361022351"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 18:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="686787682"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2022 18:44:55 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oa5qA-0001ce-1l;
        Mon, 19 Sep 2022 01:44:54 +0000
Date:   Mon, 19 Sep 2022 09:44:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 edbfe56ad8458786edd0c8f98cc3ee374eeee51c
Message-ID: <6327c97e.QQNse5px5uVDIZVZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: edbfe56ad8458786edd0c8f98cc3ee374eeee51c  arm64: dts: renesas: Adjust whitespace around '{'

elapsed time: 722m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a014
arc                              allyesconfig
i386                          randconfig-a012
alpha                            allyesconfig
arc                  randconfig-r043-20220918
i386                          randconfig-a016
m68k                             allyesconfig
m68k                             allmodconfig
s390                                defconfig
s390                             allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
powerpc                          allmodconfig
s390                             allyesconfig
x86_64                        randconfig-a015
mips                             allyesconfig
arm                                 defconfig
i386                          randconfig-a001
i386                             allyesconfig
i386                          randconfig-a003
x86_64                              defconfig
x86_64                        randconfig-a004
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
sh                               allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                           se7750_defconfig
arm                        cerfcube_defconfig
arm                      jornada720_defconfig
arm                           imxrt_defconfig
powerpc                       maple_defconfig
arc                         haps_hs_defconfig
arm                            mps2_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r041-20220918
hexagon              randconfig-r045-20220918
s390                 randconfig-r044-20220918
i386                          randconfig-a015
riscv                randconfig-r042-20220918
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
arm                      tct_hammer_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
mips                          malta_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
