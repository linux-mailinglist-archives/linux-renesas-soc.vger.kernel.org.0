Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7342C252468
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 01:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHYXpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 19:45:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:10008 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgHYXps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 19:45:48 -0400
IronPort-SDR: TrRKdVuogFgKPmHTs0Vz/VEc48QB2ZBedP74SHxH1cdDbbzK4vPzRVMV1jfW0TtrtwRUuSAh9F
 ngikuSYjUJrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143985286"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="143985286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 16:45:46 -0700
IronPort-SDR: JlTpg+Jjf9aSwOyioA6CBG+1izAJKw7032Kco1hRb89Kxmz8z08D3izMuS76HmRPV/LdJ3Od0M
 N3+5SCOtZvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="373207673"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2020 16:45:45 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAidM-00019T-KY; Tue, 25 Aug 2020 23:45:44 +0000
Date:   Wed, 26 Aug 2020 07:45:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 7da4d2a8c6bc927870aa81d52af68a9bb944be33
Message-ID: <5f45a287.+F0rvPWM87HGHKYj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: 7da4d2a8c6bc927870aa81d52af68a9bb944be33  arm64: dts: renesas: r8a774e1-hihope-rzg2h: Enable HS400 mode

elapsed time: 725m

configs tested: 51
configs skipped: 69

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
arm                            mmp2_defconfig
c6x                        evmc6472_defconfig
sh                     magicpanelr2_defconfig
sh                         ap325rxa_defconfig
arm                            qcom_defconfig
arm                         s3c6400_defconfig
mips                        bcm63xx_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
i386                 randconfig-a013-20200825
i386                 randconfig-a012-20200825
i386                 randconfig-a011-20200825
i386                 randconfig-a016-20200825
i386                 randconfig-a015-20200825
i386                 randconfig-a014-20200825
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
