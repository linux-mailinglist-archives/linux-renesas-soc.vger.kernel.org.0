Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F8E25A35C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 04:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIBC6D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 22:58:03 -0400
Received: from mga11.intel.com ([192.55.52.93]:42154 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgIBC6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 22:58:01 -0400
IronPort-SDR: Mm54gB2z/7zapQHWhqAKpilBYgXkRw5OeecH9WefHoBCqsN7YuDLYvFJzTyarh5iiPZPwvqjPa
 zAGWK2HGJA3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="154815592"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="154815592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 19:57:59 -0700
IronPort-SDR: rxuaeifu7HEQJAHtYGcIlkycBq9NUqKuuYxHMrJ5ALYPjElQ2oo8N/AyXzEIqt2vM3rdBS+MjU
 Y1rb0uzrGxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="283587842"
Received: from lkp-server02.sh.intel.com (HELO f796b30506bf) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2020 19:57:58 -0700
Received: from kbuild by f796b30506bf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kDIyD-0000E2-TB; Wed, 02 Sep 2020 02:57:57 +0000
Date:   Wed, 02 Sep 2020 10:57:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 741d1866a25a0e74237dbd04bc875a6288833adb
Message-ID: <5f4f0a33./qM8EKzV+CNf5FXu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 741d1866a25a0e74237dbd04bc875a6288833adb  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/gpu/drm/qxl/qxl_display.c:187:2: error: label 'modeset_lock_fail' used but not defined
drivers/gpu/drm/qxl/qxl_display.c:189:2: error: 'DRM_MODESET_LOCK_ALL_END' undeclared (first use in this function)
drivers/gpu/drm/qxl/qxl_display.c:189:35: error: macro "DRM_MODESET_LOCK_ALL_END" requires 3 arguments, but only 2 given
include/drm/drm_modeset_lock.h:167:7: error: implicit declaration of function 'drm_drv_uses_atomic_modeset' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:DRM_MODESET_LOCK_ALL_END-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:label-modeset_lock_fail-used-but-not-defined
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:macro-DRM_MODESET_LOCK_ALL_END-requires-arguments-but-only-given
|   `-- include-drm-drm_modeset_lock.h:error:implicit-declaration-of-function-drm_drv_uses_atomic_modeset
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:DRM_MODESET_LOCK_ALL_END-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:label-modeset_lock_fail-used-but-not-defined
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:macro-DRM_MODESET_LOCK_ALL_END-requires-arguments-but-only-given
|   `-- include-drm-drm_modeset_lock.h:error:implicit-declaration-of-function-drm_drv_uses_atomic_modeset
|-- ia64-allyesconfig
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:DRM_MODESET_LOCK_ALL_END-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:label-modeset_lock_fail-used-but-not-defined
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:macro-DRM_MODESET_LOCK_ALL_END-requires-arguments-but-only-given
|   `-- include-drm-drm_modeset_lock.h:error:implicit-declaration-of-function-drm_drv_uses_atomic_modeset
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:DRM_MODESET_LOCK_ALL_END-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:label-modeset_lock_fail-used-but-not-defined
|   |-- drivers-gpu-drm-qxl-qxl_display.c:error:macro-DRM_MODESET_LOCK_ALL_END-requires-arguments-but-only-given
|   `-- include-drm-drm_modeset_lock.h:error:implicit-declaration-of-function-drm_drv_uses_atomic_modeset
`-- sparc-allyesconfig
    |-- drivers-gpu-drm-qxl-qxl_display.c:error:DRM_MODESET_LOCK_ALL_END-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-qxl-qxl_display.c:error:label-modeset_lock_fail-used-but-not-defined
    |-- drivers-gpu-drm-qxl-qxl_display.c:error:macro-DRM_MODESET_LOCK_ALL_END-requires-arguments-but-only-given
    `-- include-drm-drm_modeset_lock.h:error:implicit-declaration-of-function-drm_drv_uses_atomic_modeset

elapsed time: 725m

configs tested: 91
configs skipped: 1

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7264_defconfig
powerpc                      mgcoge_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
sparc                       sparc64_defconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                  storcenter_defconfig
mips                         tb0287_defconfig
mips                     cu1000-neo_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
nds32                            alldefconfig
mips                 pnx8335_stb225_defconfig
m68k                       m5249evb_defconfig
mips                    maltaup_xpa_defconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200901
x86_64               randconfig-a006-20200901
x86_64               randconfig-a003-20200901
x86_64               randconfig-a005-20200901
x86_64               randconfig-a001-20200901
x86_64               randconfig-a002-20200901
i386                 randconfig-a004-20200901
i386                 randconfig-a005-20200901
i386                 randconfig-a006-20200901
i386                 randconfig-a002-20200901
i386                 randconfig-a001-20200901
i386                 randconfig-a003-20200901
i386                 randconfig-a016-20200901
i386                 randconfig-a015-20200901
i386                 randconfig-a011-20200901
i386                 randconfig-a013-20200901
i386                 randconfig-a014-20200901
i386                 randconfig-a012-20200901
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

clang tested configs:
x86_64               randconfig-a013-20200901
x86_64               randconfig-a016-20200901
x86_64               randconfig-a011-20200901
x86_64               randconfig-a012-20200901
x86_64               randconfig-a015-20200901
x86_64               randconfig-a014-20200901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
