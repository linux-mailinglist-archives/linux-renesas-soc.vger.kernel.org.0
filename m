Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00232210171
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 03:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGAB1Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 21:27:25 -0400
Received: from mga06.intel.com ([134.134.136.31]:40074 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgGAB1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 21:27:25 -0400
IronPort-SDR: fX+IMM6VUepPsaaUAN3TbQ6Qa/lnuxbZF5li1UVzJuoSwDw2/9+ortLOPNLpHbqVcv9pAPVoqk
 i0UbCyDAYbLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="207950769"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="207950769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 18:27:24 -0700
IronPort-SDR: yGSsU6j4HrwkygtJcT3WYS1Wj/AnTNUpT9xKO09yr44e2S1RYGaWTSFfXbIx5Qn5P+E4IBvuD6
 eSC5CchxROwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="386863934"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2020 18:27:23 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqRX0-0002J4-I8; Wed, 01 Jul 2020 01:27:22 +0000
Date:   Wed, 01 Jul 2020 09:26:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.9] BUILD SUCCESS
 b7f13b914730026ca7fdc0d5ef6a791f3c613fe2
Message-ID: <5efbe63b.rRVa2WVCtlFHhjJ7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.9
branch HEAD: b7f13b914730026ca7fdc0d5ef6a791f3c613fe2  ARM: dts: r8a7778: Enable IRLM setup via DT

elapsed time: 2404m

configs tested: 53
configs skipped: 118

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
s390                             alldefconfig
riscv                          rv32_defconfig
arm                           viper_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
