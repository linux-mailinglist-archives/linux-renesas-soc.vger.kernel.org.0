Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4202846C83B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 00:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242579AbhLGXeK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 18:34:10 -0500
Received: from mga05.intel.com ([192.55.52.43]:61708 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238125AbhLGXeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 18:34:09 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="323967631"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="323967631"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 15:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="679647449"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2021 15:30:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mujuZ-000N4d-Qx; Tue, 07 Dec 2021 23:30:15 +0000
Date:   Wed, 8 Dec 2021 07:29:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v5.17 25/30]
 arm-linux-gnueabi-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:undefined
 reference to `rcar_gen4_cpg_clk_register'
Message-ID: <202112080709.fFYm8JaQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.17
head:   6496166cb5d7dd163ceea55390060d77f008bc8b
commit: 3e7c1099d948a41fbb99b7f6bc49189b66f81279 [25/30] clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver
config: arm-randconfig-r023-20211207 (https://download.01.org/0day-ci/archive/20211208/202112080709.fFYm8JaQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=3e7c1099d948a41fbb99b7f6bc49189b66f81279
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers renesas-clk-for-v5.17
        git checkout 3e7c1099d948a41fbb99b7f6bc49189b66f81279
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x44): undefined reference to `rcar_gen4_cpg_clk_register'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
