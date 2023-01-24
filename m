Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730A567A6DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 00:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjAXXa3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 18:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAXXa2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 18:30:28 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2603BD84
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674603027; x=1706139027;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HWxORkhudwa3e2GV6Tdk4Qw7XKhEHlv75dEbj1q3uz0=;
  b=mYIBppPzbs4vnNEmhPtjFuJpbPK5g4ZIuieXchSNABs85kjqP4VPZyxN
   +d9dx2d1XR24TJXN49AfoA4H5XQtLOMnHcYhr8xFcj3dRhWvUXsw3szR6
   y8/5acvXUnTAUCvJ4VWmD+8zLS1DW8OwjpZwCTo7LFylC6bVCvb3bylzl
   vNUHSar17u4UA5YdUi0hIDqzh4rUo/d+Vf7Q9mS/e0pboiXjuCCSDu2Jt
   T6XB8JS52r0D8K3X34dbqXMerCwvdYKFmeV3/u6stnEquvRHTShaocily
   67aNANv+6SZMKd7Dx/rJ86Wjy/P7KGgl4dlcOFIaho5N7Wxkqmva4Nmt/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="326471120"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="326471120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 15:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="907691321"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="907691321"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 15:30:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKSkD-0006rw-0O;
        Tue, 24 Jan 2023 23:30:25 +0000
Date:   Wed, 25 Jan 2023 07:29:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 f23ed7e4efa3e68c99d217f9dc00fc689c7e661d
Message-ID: <63d069e2.M+zXyWXQP3gRjNtd%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: f23ed7e4efa3e68c99d217f9dc00fc689c7e661d  Merge branch 'renesas-next' into renesas-devel

elapsed time: 804m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64               randconfig-a002-20230123
s390                             allmodconfig
x86_64               randconfig-a001-20230123
powerpc                           allnoconfig
x86_64               randconfig-a004-20230123
s390                                defconfig
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
i386                 randconfig-a004-20230123
arc                              allyesconfig
i386                 randconfig-a003-20230123
sh                               allmodconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
x86_64                         rhel-8.3-kunit
i386                 randconfig-a005-20230123
x86_64                           rhel-8.3-kvm
i386                 randconfig-a006-20230123
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
i386                                defconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
i386                             allyesconfig
arm                                 defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
powerpc                          allmodconfig

clang tested configs:
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a012-20230123
x86_64               randconfig-a015-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
hexagon              randconfig-r041-20230123
s390                 randconfig-r044-20230123
hexagon              randconfig-r045-20230123
riscv                randconfig-r042-20230123
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
