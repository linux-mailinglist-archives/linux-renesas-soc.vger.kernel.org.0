Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0651EC676
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2020 03:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgFCBN3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 21:13:29 -0400
Received: from mga18.intel.com ([134.134.136.126]:57082 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgFCBN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 21:13:29 -0400
IronPort-SDR: 9Mmk1E9/nOnjwacTn9YwzA34Q3+p4nv8nQJXtkdRfSOE5Imeo9RUKc+fco0qqd1Viwie1Tq8Js
 lqFJ6QUSz8gA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 18:13:29 -0700
IronPort-SDR: /7gUFatKGTW9T3tu+I7BqhOWA2ASjhQsYt1VWNoCy0K/TWO4xsB6VYYysAQizl42J08k5FMoJW
 9MXlw4upGriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,466,1583222400"; 
   d="scan'208";a="347597494"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2020 18:13:28 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgHyB-0000Hg-AF; Wed, 03 Jun 2020 01:13:27 +0000
Date:   Wed, 03 Jun 2020 09:13:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 dd276b79e49bfba80ff7ae3998ea512a3245b0de
Message-ID: <5ed6f922.sA8dR2/MlOHUyJEg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  topic/renesas-overlays
branch HEAD: dd276b79e49bfba80ff7ae3998ea512a3245b0de  ARM: dts: rza2mevb: Add overlay for SCIF3 on CN17

elapsed time: 670m

configs tested: 74
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                           sun3_defconfig
openrisc                            defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc64                             defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
