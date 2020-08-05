Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E6323C3F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 05:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHEDSO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 23:18:14 -0400
Received: from mga09.intel.com ([134.134.136.24]:40460 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgHEDSO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 23:18:14 -0400
IronPort-SDR: a4Ac3yUcspAtoNbGDf/UcUCsg8Xoo/7Gv4E2ayk2qJRL58+IG9HS8fkWOgYdeCux5f9qLqewM0
 I3RyrM3sO2lA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="153604211"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="153604211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 20:17:43 -0700
IronPort-SDR: aCAQCkmrjSOhUJvmZ5Pq9C/aNeHAhxODtjkGR4BRd6akdDTsOjZYGn4q8rGWOwMhlNezUa8Pwz
 9P4mwk3COCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="315588491"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2020 20:17:41 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k39vx-0000YY-8j; Wed, 05 Aug 2020 03:17:41 +0000
Date:   Wed, 05 Aug 2020 11:16:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 54034a54970a00ea36ec15cd575bc9cdde4af286
Message-ID: <5f2a2494.uRYLCEJ5c/VezrAC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 54034a54970a00ea36ec15cd575bc9cdde4af286  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/net/ethernet/sfc/efx_common.c:1231:25: error: function declaration isn't a prototype [-Werror=strict-prototypes]
drivers/net/ethernet/sfc/efx_common.c:1232:17: warning: 'enum pci_channel_state' declared inside parameter list will not be visible outside of this definition or declaration
drivers/net/ethernet/sfc/efx_common.c:1232:35: error: parameter 2 ('state') has incomplete type

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- alpha-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arc-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arm-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arm-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arm64-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- i386-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- ia64-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- ia64-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- ia64-randconfig-c004-20200805
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- mips-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- mips-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- parisc-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- parisc-randconfig-r024-20200805
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- powerpc-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- powerpc-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- riscv-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- riscv-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- s390-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- sparc-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- x86_64-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- x86_64-rhel-7.6-kselftests
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
`-- xtensa-allyesconfig
    |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
    |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
    `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration

elapsed time: 720m

configs tested: 59
configs skipped: 1

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
parisc                              defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          allyesconfig
i386                 randconfig-a005-20200805
i386                 randconfig-a004-20200805
i386                 randconfig-a006-20200805
x86_64               randconfig-a016-20200805
x86_64               randconfig-a015-20200805
x86_64               randconfig-a014-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
i386                 randconfig-a014-20200805
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
