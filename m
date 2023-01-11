Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFDC665215
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 04:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjAKDCn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 22:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjAKDCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 22:02:42 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35547167FE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 19:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673406162; x=1704942162;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZZm9RmLqh6EJF4nuTx3TvK9MbXc9JIbFmEK/433+ObM=;
  b=Y9RGXblwdZU4Mqh7o7yTtCQVpEHZ0xmvFCDRLmeh0tT5UynO+lP6s9/Y
   rrII/GBkqmk4kE0gP0n+iqy35+A5TbASHC8KLGrXwqUmoN6CwJ5iaFgkk
   ltE8WeFsZIWDmv0+xAXeXOyzEgW1vuFTapNQT8wqKUuc5F5OtNVdzW2v4
   iqU0w4WsROAAtsaHH/t/AHUhFGQldSDI+HnWiXCnGmfuf4nt3q/b0Fetv
   e1fVRo42aT2CBhklL1qi5h/Z4tGCuL+q3F7CGVOi1uEp8cNiQ9bNCcFYz
   9220ymY9izX3YAqUFc/Vbz2wFx8rf9dzSdoWLiek0IDbpH9RzzqCaLiNL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311127368"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311127368"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 19:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650584333"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="650584333"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2023 19:02:40 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFRNv-0008fP-2K;
        Wed, 11 Jan 2023 03:02:39 +0000
Date:   Wed, 11 Jan 2023 11:02:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 90f30a6e23f07633e7e73a4cc8ddc2769c57e20d
Message-ID: <63be26a8.IgjmHF4q44R7X3lU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 90f30a6e23f07633e7e73a4cc8ddc2769c57e20d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 721m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20230110
x86_64                           allyesconfig
s390                 randconfig-r044-20230110
x86_64                        randconfig-a015
riscv                randconfig-r042-20230110
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                        randconfig-a006

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230110
i386                          randconfig-a006
x86_64                        randconfig-a012
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
