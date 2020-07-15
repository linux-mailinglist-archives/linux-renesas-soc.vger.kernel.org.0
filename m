Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F348222078F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 10:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgGOIkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 04:40:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:26874 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729329AbgGOIkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 04:40:01 -0400
IronPort-SDR: XvhtS1/nrhEpg4+vkI37ZEOZW3vfidV5XoJ2arBy75Zpr2geBP3qXjpkgeE+1wA9YqGmgP9iWN
 mcnX5d7fIcaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="210651871"
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; 
   d="scan'208";a="210651871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2020 01:40:00 -0700
IronPort-SDR: XGeYnl2Qrxv+qJWUsTNJu5SvGKIUt8znV3koU3/ijIjiqAZMyIFX+MOp7rceJJ4xFcoTVVhcwl
 FgR7BuiTYTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; 
   d="scan'208";a="360636345"
Received: from lkp-server01.sh.intel.com (HELO b157d87b7ee7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jul 2020 01:39:58 -0700
Received: from kbuild by b157d87b7ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvcxK-00006e-8H; Wed, 15 Jul 2020 08:39:58 +0000
Date:   Wed, 15 Jul 2020 16:39:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 541708cc1e6ad29fdb4c294831dfa855bd64487b
Message-ID: <5f0ec0b4.QTNl/xAsXj/BnIZd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 541708cc1e6ad29fdb4c294831dfa855bd64487b  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/net/ethernet/sfc/efx_common.c:1226:25: error: function declaration isn't a prototype [-Werror=strict-prototypes]
drivers/net/ethernet/sfc/efx_common.c:1227:17: warning: 'enum pci_channel_state' declared inside parameter list will not be visible outside of this definition or declaration
drivers/net/ethernet/sfc/efx_common.c:1227:35: error: parameter 2 ('state') has incomplete type
drivers/net/ethernet/sfc/efx_common.c:1232:19: sparse:    incomplete type enum pci_channel_state state
drivers/net/ethernet/sfc/efx_common.c:1232:19: sparse:    restricted pci_channel_state_t
drivers/net/ethernet/sfc/efx_common.c:1232:19: sparse: sparse: incompatible types for operation (==):
drivers/net/ethernet/sfc/efx_common.c:1308:27: sparse:     expected restricted pci_ers_result_t ( *error_detected )( ... )
drivers/net/ethernet/sfc/efx_common.c:1308:27: sparse:     got restricted pci_ers_result_t ( * )( ... )
drivers/net/ethernet/sfc/efx_common.c:1308:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types))

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arm64-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- arm64-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- i386-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- ia64-randconfig-r034-20200714
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
|-- parisc-randconfig-s031-20200714
|   |-- drivers-net-ethernet-sfc-efx_common.c:sparse:expected-restricted-pci_ers_result_t-(-error_detected-)(-...-)
|   |-- drivers-net-ethernet-sfc-efx_common.c:sparse:got-restricted-pci_ers_result_t-(-)(-...-)
|   |-- drivers-net-ethernet-sfc-efx_common.c:sparse:incomplete-type-enum-pci_channel_state-state
|   |-- drivers-net-ethernet-sfc-efx_common.c:sparse:restricted-pci_channel_state_t
|   |-- drivers-net-ethernet-sfc-efx_common.c:sparse:sparse:incompatible-types-for-operation-(-):
|   `-- drivers-net-ethernet-sfc-efx_common.c:sparse:sparse:incorrect-type-in-initializer-(incompatible-argument-(different-base-types))-expected-restricted-pci_ers_result_t-(-error_detected-)(-...-)-got-rest
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
|-- s390-allmodconfig
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
|-- sparc64-allmodconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- sparc64-allyesconfig
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
|   `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
`-- x86_64-allyesconfig
    |-- drivers-net-ethernet-sfc-efx_common.c:error:function-declaration-isn-t-a-prototype
    |-- drivers-net-ethernet-sfc-efx_common.c:error:parameter-(-state-)-has-incomplete-type
    `-- drivers-net-ethernet-sfc-efx_common.c:warning:enum-pci_channel_state-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration

elapsed time: 1062m

configs tested: 96
configs skipped: 4

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
sh                           se7724_defconfig
sh                          sdk7786_defconfig
arm                          tango4_defconfig
sh                            migor_defconfig
arm                         s3c6400_defconfig
m68k                         amcore_defconfig
mips                          malta_defconfig
c6x                        evmc6474_defconfig
arm                        clps711x_defconfig
sh                          rsk7203_defconfig
arm                           corgi_defconfig
arm                         orion5x_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                            defconfig
xtensa                          iss_defconfig
arm                  colibri_pxa270_defconfig
ia64                      gensparse_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
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
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a016-20200715
i386                 randconfig-a011-20200715
i386                 randconfig-a015-20200715
i386                 randconfig-a012-20200715
i386                 randconfig-a013-20200715
i386                 randconfig-a014-20200715
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
