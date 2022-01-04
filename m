Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAA4484344
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jan 2022 15:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiADOXz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jan 2022 09:23:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:28993 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232759AbiADOXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jan 2022 09:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641306235; x=1672842235;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CBZaZX2fKmouKwHbP3iF9wtPWMAnna5OGUMKzL8QHts=;
  b=AI8O0+F6VLumZe+9pGdSAcFDoXyGmnoU1JJNPRcsjAl307ouOdRkJ2cU
   bDGwQ/9j6BwZnpO44khIXGF5hOuB4CCpiLlXGdRhJUULXHQeK28N1NwFC
   pf+zvPzWzR8DAzYfOAKqzMaepakDzuVits9ptPBTtpM5U4TcRlK5r3YTM
   FtRudNPtCcfkTsKTHbMpSNHDVZ1jCToHgqeFSS1BC6lJBG36MMFzEQznf
   +di4ZZdv2rQRnuCSrpQ4eikxScXZDpY+iYM8eY8zaYXcIfzQgVAG/L7Zz
   gLa6trlqvpwl/1m4UeTi+4Q6xqRkJq/MuCJc91egil1QtHi6aklMH/4Nr
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="305583159"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="305583159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 06:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="512520836"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jan 2022 06:23:53 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4kjA-000FSr-V2; Tue, 04 Jan 2022 14:23:52 +0000
Date:   Tue, 04 Jan 2022 22:22:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 742d780d939d62803bacae8de6b8ecf30792d391
Message-ID: <61d4583d.7u57EThMvRkghqsp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 742d780d939d62803bacae8de6b8ecf30792d391  Merge tag 'v5.16-rc8' into renesas-devel

elapsed time: 1447m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
